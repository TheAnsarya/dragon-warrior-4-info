#!/usr/bin/env python3
"""
ROM Analyzer for Dragon Warrior IV

Analyzes the ROM file structure, validates checksums, and provides
information about the ROM layout and contents.
"""

import hashlib
import struct
from dataclasses import dataclass
from pathlib import Path
from typing import Optional, List, Dict, Any

import click
from rich.console import Console
from rich.table import Table
from rich.panel import Panel

from tools import (
	HEADER_SIZE,
	PRG_BANK_SIZE,
	PRG_BANK_COUNT,
	CHR_BANK_SIZE,
	CHR_BANK_COUNT,
	ROM_PATH,
	EXPECTED_MD5,
)


@dataclass
class INESHeader:
	"""Represents an iNES ROM header."""

	magic: bytes  # Should be "NES\x1a"
	prg_rom_size: int  # In 16 KB units
	chr_rom_size: int  # In 8 KB units
	flags6: int
	flags7: int
	prg_ram_size: int  # In 8 KB units (0 means 8 KB for compatibility)
	flags9: int
	flags10: int

	@property
	def mapper_number(self) -> int:
		"""Get the mapper number from flags."""
		return (self.flags7 & 0xF0) | ((self.flags6 & 0xF0) >> 4)

	@property
	def has_battery(self) -> bool:
		"""Check if ROM has battery-backed RAM."""
		return bool(self.flags6 & 0x02)

	@property
	def has_trainer(self) -> bool:
		"""Check if ROM has a trainer."""
		return bool(self.flags6 & 0x04)

	@property
	def mirroring(self) -> str:
		"""Get mirroring type."""
		if self.flags6 & 0x08:
			return "Four-screen"
		return "Vertical" if self.flags6 & 0x01 else "Horizontal"

	@property
	def is_valid(self) -> bool:
		"""Check if header has valid NES magic."""
		return self.magic == b"NES\x1a"


class ROMAnalyzer:
	"""Analyzes Dragon Warrior IV ROM files."""

	def __init__(self, rom_path: Path):
		"""Initialize analyzer with ROM path."""
		self.rom_path = Path(rom_path)
		self.rom_data: Optional[bytes] = None
		self.header: Optional[INESHeader] = None

	def load(self) -> bool:
		"""Load the ROM file."""
		if not self.rom_path.exists():
			return False

		with open(self.rom_path, "rb") as f:
			self.rom_data = f.read()

		if len(self.rom_data) < HEADER_SIZE:
			return False

		self._parse_header()
		return self.header.is_valid if self.header else False

	def _parse_header(self) -> None:
		"""Parse the iNES header."""
		if not self.rom_data:
			return

		header_data = self.rom_data[:HEADER_SIZE]
		self.header = INESHeader(
			magic=header_data[0:4],
			prg_rom_size=header_data[4],
			chr_rom_size=header_data[5],
			flags6=header_data[6],
			flags7=header_data[7],
			prg_ram_size=header_data[8],
			flags9=header_data[9],
			flags10=header_data[10],
		)

	def get_checksum(self, algorithm: str = "md5") -> str:
		"""Calculate ROM checksum."""
		if not self.rom_data:
			return ""

		if algorithm == "md5":
			return hashlib.md5(self.rom_data).hexdigest()
		elif algorithm == "sha1":
			return hashlib.sha1(self.rom_data).hexdigest()
		elif algorithm == "sha256":
			return hashlib.sha256(self.rom_data).hexdigest()
		elif algorithm == "crc32":
			import zlib
			return format(zlib.crc32(self.rom_data) & 0xFFFFFFFF, "08x")
		return ""

	def get_prg_bank(self, bank_num: int) -> bytes:
		"""Extract a PRG ROM bank."""
		if not self.rom_data or bank_num >= PRG_BANK_COUNT:
			return b""

		offset = HEADER_SIZE + (bank_num * PRG_BANK_SIZE)
		return self.rom_data[offset:offset + PRG_BANK_SIZE]

	def get_chr_bank(self, bank_num: int) -> bytes:
		"""Extract a CHR ROM bank."""
		if not self.rom_data or not self.header or bank_num >= CHR_BANK_COUNT:
			return b""

		prg_end = HEADER_SIZE + (self.header.prg_rom_size * PRG_BANK_SIZE)
		offset = prg_end + (bank_num * CHR_BANK_SIZE)
		return self.rom_data[offset:offset + CHR_BANK_SIZE]

	def find_pattern(self, pattern: bytes, start: int = 0, end: Optional[int] = None) -> List[int]:
		"""Find all occurrences of a byte pattern."""
		if not self.rom_data:
			return []

		if end is None:
			end = len(self.rom_data)

		results = []
		pos = start
		while True:
			pos = self.rom_data.find(pattern, pos, end)
			if pos == -1:
				break
			results.append(pos)
			pos += 1

		return results

	def find_pointers(self, start_addr: int, end_addr: int, bank: int = 15) -> List[Dict[str, Any]]:
		"""Find potential pointer tables in a bank."""
		bank_data = self.get_prg_bank(bank)
		if not bank_data:
			return []

		pointers = []
		for i in range(0, len(bank_data) - 1, 2):
			addr = struct.unpack("<H", bank_data[i:i+2])[0]
			if start_addr <= addr <= end_addr:
				pointers.append({
					"offset": i,
					"address": addr,
					"bank_offset": HEADER_SIZE + (bank * PRG_BANK_SIZE) + i
				})

		return pointers

	def get_vectors(self) -> Dict[str, int]:
		"""Get the NES interrupt vectors from the fixed bank."""
		fixed_bank = self.get_prg_bank(PRG_BANK_COUNT - 1)
		if not fixed_bank or len(fixed_bank) < PRG_BANK_SIZE:
			return {}

		# Vectors are at the end of the fixed bank
		nmi = struct.unpack("<H", fixed_bank[-6:-4])[0]
		reset = struct.unpack("<H", fixed_bank[-4:-2])[0]
		irq = struct.unpack("<H", fixed_bank[-2:])[0]

		return {
			"NMI": nmi,
			"RESET": reset,
			"IRQ/BRK": irq,
		}

	def analyze_bank_contents(self, bank_num: int) -> Dict[str, Any]:
		"""Analyze the contents of a PRG bank."""
		bank_data = self.get_prg_bank(bank_num)
		if not bank_data:
			return {}

		# Count byte frequencies
		byte_freq = {}
		for byte in bank_data:
			byte_freq[byte] = byte_freq.get(byte, 0) + 1

		# Detect common patterns
		zero_count = byte_freq.get(0x00, 0)
		ff_count = byte_freq.get(0xFF, 0)

		# Estimate content type
		code_indicators = 0
		data_indicators = 0

		# Common 6502 opcodes that indicate code
		code_opcodes = [0x20, 0x60, 0x4C, 0x6C, 0xA9, 0xA5, 0x85, 0x8D, 0xAD, 0xBD, 0xB9]
		for opcode in code_opcodes:
			code_indicators += byte_freq.get(opcode, 0)

		# High concentration of sequential/repetitive data indicates tables
		if zero_count > len(bank_data) * 0.3:
			data_indicators += 1
		if ff_count > len(bank_data) * 0.3:
			data_indicators += 1

		content_type = "code" if code_indicators > len(bank_data) * 0.05 else "data"
		if data_indicators > 0:
			content_type = "data/empty"

		return {
			"bank_number": bank_num,
			"size": len(bank_data),
			"offset": HEADER_SIZE + (bank_num * PRG_BANK_SIZE),
			"zero_bytes": zero_count,
			"ff_bytes": ff_count,
			"estimated_type": content_type,
			"unique_bytes": len(byte_freq),
		}

	def get_summary(self) -> Dict[str, Any]:
		"""Get a complete summary of the ROM."""
		if not self.header:
			return {}

		return {
			"file_name": self.rom_path.name,
			"file_size": len(self.rom_data) if self.rom_data else 0,
			"md5": self.get_checksum("md5"),
			"sha1": self.get_checksum("sha1"),
			"header": {
				"valid": self.header.is_valid,
				"prg_rom_size": self.header.prg_rom_size * PRG_BANK_SIZE,
				"chr_rom_size": self.header.chr_rom_size * CHR_BANK_SIZE,
				"mapper": self.header.mapper_number,
				"mirroring": self.header.mirroring,
				"battery": self.header.has_battery,
				"trainer": self.header.has_trainer,
			},
			"vectors": self.get_vectors(),
		}


@click.group()
def cli():
	"""Dragon Warrior IV ROM Analyzer."""
	pass


@cli.command()
@click.option("--rom", "-r", default=str(ROM_PATH), help="Path to ROM file")
@click.option("--verbose", "-v", is_flag=True, help="Show verbose output")
def info(rom: str, verbose: bool):
	"""Display ROM information."""
	console = Console()

	analyzer = ROMAnalyzer(Path(rom))
	if not analyzer.load():
		console.print("[red]Error: Could not load ROM file[/red]")
		return

	summary = analyzer.get_summary()

	# Header info table
	header_table = Table(title="ROM Header Information")
	header_table.add_column("Property", style="cyan")
	header_table.add_column("Value", style="green")

	header_table.add_row("File Name", summary["file_name"])
	header_table.add_row("File Size", f"{summary['file_size']:,} bytes")
	header_table.add_row("MD5", summary["md5"])
	header_table.add_row("SHA1", summary["sha1"])
	header_table.add_row("Header Valid", "✓" if summary["header"]["valid"] else "✗")
	header_table.add_row("PRG ROM Size", f"{summary['header']['prg_rom_size']:,} bytes")
	header_table.add_row("CHR ROM Size", f"{summary['header']['chr_rom_size']:,} bytes")
	header_table.add_row("Mapper", str(summary["header"]["mapper"]))
	header_table.add_row("Mirroring", summary["header"]["mirroring"])
	header_table.add_row("Battery", "Yes" if summary["header"]["battery"] else "No")
	header_table.add_row("Trainer", "Yes" if summary["header"]["trainer"] else "No")

	console.print(header_table)

	# Vectors table
	vectors = summary["vectors"]
	if vectors:
		vectors_table = Table(title="Interrupt Vectors")
		vectors_table.add_column("Vector", style="cyan")
		vectors_table.add_column("Address", style="yellow")

		for name, addr in vectors.items():
			vectors_table.add_row(name, f"${addr:04X}")

		console.print(vectors_table)

	if verbose:
		# Bank analysis
		console.print("\n[bold]Bank Analysis:[/bold]")
		bank_table = Table(title="PRG Bank Analysis")
		bank_table.add_column("Bank", style="cyan", justify="right")
		bank_table.add_column("Offset", style="yellow")
		bank_table.add_column("Type", style="green")
		bank_table.add_column("Zero %", justify="right")
		bank_table.add_column("Unique", justify="right")

		for bank in range(PRG_BANK_COUNT):
			analysis = analyzer.analyze_bank_contents(bank)
			zero_pct = (analysis["zero_bytes"] / analysis["size"]) * 100
			bank_table.add_row(
				f"{bank:02d}",
				f"${analysis['offset']:06X}",
				analysis["estimated_type"],
				f"{zero_pct:.1f}%",
				str(analysis["unique_bytes"]),
			)

		console.print(bank_table)


@cli.command()
@click.option("--rom", "-r", default=str(ROM_PATH), help="Path to ROM file")
@click.option("--expected-md5", default=EXPECTED_MD5, help="Expected MD5 hash")
def verify(rom: str, expected_md5: str):
	"""Verify ROM checksum."""
	console = Console()

	analyzer = ROMAnalyzer(Path(rom))
	if not analyzer.load():
		console.print("[red]Error: Could not load ROM file[/red]")
		return

	actual_md5 = analyzer.get_checksum("md5")

	if actual_md5 == expected_md5:
		console.print(Panel(
			f"[green]✓ ROM verified successfully![/green]\n\nMD5: {actual_md5}",
			title="Verification Passed"
		))
	else:
		console.print(Panel(
			f"[red]✗ ROM verification failed![/red]\n\n"
			f"Expected: {expected_md5}\n"
			f"Actual:   {actual_md5}",
			title="Verification Failed"
		))


@cli.command()
@click.option("--rom", "-r", default=str(ROM_PATH), help="Path to ROM file")
@click.argument("bank", type=int)
@click.option("--output", "-o", help="Output file path")
def dump_bank(rom: str, bank: int, output: Optional[str]):
	"""Dump a PRG bank to file."""
	console = Console()

	analyzer = ROMAnalyzer(Path(rom))
	if not analyzer.load():
		console.print("[red]Error: Could not load ROM file[/red]")
		return

	if bank >= PRG_BANK_COUNT:
		console.print(f"[red]Error: Bank must be 0-{PRG_BANK_COUNT-1}[/red]")
		return

	bank_data = analyzer.get_prg_bank(bank)

	if output:
		output_path = Path(output)
	else:
		output_path = Path(f"bank_{bank:02d}.bin")

	with open(output_path, "wb") as f:
		f.write(bank_data)

	console.print(f"[green]Dumped bank {bank} to {output_path}[/green]")


if __name__ == "__main__":
	cli()
