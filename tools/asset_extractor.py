#!/usr/bin/env python3
"""
Asset Extractor for Dragon Warrior IV

Extracts game assets from the ROM file:
- Data tables (monsters, items, spells, etc.)
- Text and dialog
- Graphics (sprites, tilesets)
- Maps
- Audio data
"""

import json
import struct
from dataclasses import dataclass, asdict
from pathlib import Path
from typing import List, Dict, Any, Optional, Tuple
from enum import IntEnum

import click
from rich.console import Console
from rich.progress import Progress, SpinnerColumn, TextColumn
from rich.table import Table

from tools import (
	HEADER_SIZE,
	PRG_BANK_SIZE,
	CHR_BANK_SIZE,
	ROM_PATH,
	ASSETS_DIR,
	PROJECT_ROOT,
)
from tools.rom_analyzer import ROMAnalyzer


# ============================================================================
# Text Table (TBL) - DW4 Character Encoding
# ============================================================================

# Standard DW4 text encoding table
# TODO: Complete this table from existing GameInfo TBL file
DW4_TBL = {
	0x00: " ",
	0x01: "0",
	0x02: "1",
	0x03: "2",
	0x04: "3",
	0x05: "4",
	0x06: "5",
	0x07: "6",
	0x08: "7",
	0x09: "8",
	0x0A: "9",
	0x0B: "a",
	0x0C: "b",
	0x0D: "c",
	0x0E: "d",
	0x0F: "e",
	0x10: "f",
	0x11: "g",
	0x12: "h",
	0x13: "i",
	0x14: "j",
	0x15: "k",
	0x16: "l",
	0x17: "m",
	0x18: "n",
	0x19: "o",
	0x1A: "p",
	0x1B: "q",
	0x1C: "r",
	0x1D: "s",
	0x1E: "t",
	0x1F: "u",
	0x20: "v",
	0x21: "w",
	0x22: "x",
	0x23: "y",
	0x24: "z",
	0x25: "A",
	0x26: "B",
	0x27: "C",
	0x28: "D",
	0x29: "E",
	0x2A: "F",
	0x2B: "G",
	0x2C: "H",
	0x2D: "I",
	0x2E: "J",
	0x2F: "K",
	0x30: "L",
	0x31: "M",
	0x32: "N",
	0x33: "O",
	0x34: "P",
	0x35: "Q",
	0x36: "R",
	0x37: "S",
	0x38: "T",
	0x39: "U",
	0x3A: "V",
	0x3B: "W",
	0x3C: "X",
	0x3D: "Y",
	0x3E: "Z",
	0x3F: "'",
	0x40: ",",
	0x41: ".",
	0x42: "-",
	0x43: "?",
	0x44: "!",
	0x45: ";",
	0x46: ":",
	0x47: "\"",
	0x48: "/",
	0x49: "(",
	0x4A: ")",
	# Control codes
	0xF0: "[WAIT]",
	0xF1: "[LINE]",
	0xF2: "[NAME]",
	0xF3: "[ITEM]",
	0xF4: "[NUM]",
	0xFE: "[PAUSE]",
	0xFF: "[END]",
}

# Reverse lookup for encoding text
DW4_TBL_REVERSE = {v: k for k, v in DW4_TBL.items() if len(v) == 1}


def decode_text(data: bytes, tbl: Dict[int, str] = DW4_TBL) -> str:
	"""Decode DW4 text bytes to string."""
	result = []
	i = 0
	while i < len(data):
		byte = data[i]
		if byte == 0xFF:  # End marker
			break
		if byte in tbl:
			result.append(tbl[byte])
		else:
			result.append(f"[${byte:02X}]")
		i += 1
	return "".join(result)


def encode_text(text: str, tbl: Dict[str, int] = DW4_TBL_REVERSE) -> bytes:
	"""Encode string to DW4 text bytes."""
	result = []
	i = 0
	while i < len(text):
		# Check for control codes first
		if text[i] == "[":
			end = text.find("]", i)
			if end != -1:
				code = text[i:end+1]
				# Find control code value
				for val, name in DW4_TBL.items():
					if name == code:
						result.append(val)
						i = end + 1
						continue
		
		char = text[i]
		if char in tbl:
			result.append(tbl[char])
		i += 1
	
	result.append(0xFF)  # End marker
	return bytes(result)


# ============================================================================
# Data Structure Definitions
# ============================================================================

class ElementType(IntEnum):
	"""DW4 element types for resistance/weakness."""
	NONE = 0
	FIRE = 1
	ICE = 2
	WIND = 3
	LIGHTNING = 4


@dataclass
class Monster:
	"""DW4 Monster data structure."""
	id: int
	name: str
	hp: int
	mp: int
	attack: int
	defense: int
	agility: int
	exp: int
	gold: int
	# TODO: Add more fields as discovered
	# element_weak: ElementType
	# element_resist: ElementType
	# drop_item: int
	# drop_rate: int
	# action_pattern: List[int]


@dataclass
class Item:
	"""DW4 Item data structure."""
	id: int
	name: str
	type: int  # 0=weapon, 1=armor, 2=shield, etc.
	price: int
	# TODO: Add more fields as discovered
	# effect: int
	# equippable_by: int


@dataclass
class Spell:
	"""DW4 Spell data structure."""
	id: int
	name: str
	mp_cost: int
	effect: int
	# TODO: Add more fields as discovered
	# target_type: int
	# element: ElementType


@dataclass 
class Character:
	"""DW4 playable character data."""
	id: int
	name: str
	chapter: int
	base_hp: int
	base_mp: int
	base_strength: int
	base_agility: int
	base_vitality: int
	base_intelligence: int
	base_luck: int


# ============================================================================
# Asset Extractor Class
# ============================================================================

class AssetExtractor:
	"""Extracts all game assets from DW4 ROM."""
	
	def __init__(self, rom_path: Path, output_dir: Path):
		"""Initialize extractor."""
		self.rom_path = rom_path
		self.output_dir = output_dir
		self.analyzer = ROMAnalyzer(rom_path)
		self.console = Console()
		
		# Ensure output directories exist
		self.json_dir = output_dir / "json"
		self.graphics_dir = output_dir / "graphics"
		self.text_dir = output_dir / "text"
		self.maps_dir = output_dir / "maps"
		self.audio_dir = output_dir / "audio"
		
	def setup_directories(self):
		"""Create output directory structure."""
		dirs = [
			self.json_dir,
			self.graphics_dir,
			self.text_dir,
			self.maps_dir,
			self.audio_dir,
			self.graphics_dir / "sprites",
			self.graphics_dir / "tilesets",
			self.graphics_dir / "ui",
			self.json_dir / "monsters",
			self.json_dir / "items",
			self.json_dir / "spells",
			self.json_dir / "characters",
			self.maps_dir / "world",
			self.maps_dir / "towns",
			self.maps_dir / "dungeons",
		]
		for d in dirs:
			d.mkdir(parents=True, exist_ok=True)
	
	def load_rom(self) -> bool:
		"""Load and validate the ROM."""
		if not self.analyzer.load():
			self.console.print("[red]Error: Could not load ROM file[/red]")
			return False
		
		summary = self.analyzer.get_summary()
		if not summary["header"]["valid"]:
			self.console.print("[red]Error: Invalid ROM header[/red]")
			return False
		
		self.console.print(f"[green]Loaded ROM: {summary['file_name']}[/green]")
		self.console.print(f"  MD5: {summary['md5']}")
		return True
	
	def extract_all(self):
		"""Extract all assets from ROM."""
		self.setup_directories()
		
		if not self.load_rom():
			return
		
		with Progress(
			SpinnerColumn(),
			TextColumn("[progress.description]{task.description}"),
			console=self.console,
		) as progress:
			# Extract data tables
			task = progress.add_task("Extracting monsters...", total=None)
			self.extract_monsters()
			progress.update(task, description="[green]✓[/green] Extracted monsters")
			
			task = progress.add_task("Extracting items...", total=None)
			self.extract_items()
			progress.update(task, description="[green]✓[/green] Extracted items")
			
			task = progress.add_task("Extracting spells...", total=None)
			self.extract_spells()
			progress.update(task, description="[green]✓[/green] Extracted spells")
			
			task = progress.add_task("Extracting text...", total=None)
			self.extract_text()
			progress.update(task, description="[green]✓[/green] Extracted text")
			
			task = progress.add_task("Extracting graphics...", total=None)
			self.extract_graphics()
			progress.update(task, description="[green]✓[/green] Extracted graphics")
		
		self.console.print("\n[bold green]Asset extraction complete![/bold green]")
	
	# ========================================================================
	# Monster Extraction
	# ========================================================================
	
	def extract_monsters(self):
		"""Extract monster data to JSON."""
		# TODO: Determine actual monster data location and format
		# This is a placeholder structure based on typical DW format
		
		monsters = []
		
		# Placeholder - will be populated when actual offsets are known
		# For now, create a template structure
		monster_template = {
			"_comment": "TODO: Extract actual monster data",
			"monsters": [],
			"metadata": {
				"bank": "TBD",
				"offset": "TBD",
				"count": "TBD",
				"format": {
					"hp": "2 bytes, little endian",
					"mp": "1 byte",
					"attack": "2 bytes",
					"defense": "1 byte",
					"agility": "1 byte",
					"exp": "2 bytes",
					"gold": "2 bytes",
				}
			}
		}
		
		output_path = self.json_dir / "monsters" / "monsters.json"
		with open(output_path, "w", encoding="utf-8") as f:
			json.dump(monster_template, f, indent="\t", ensure_ascii=False)
	
	# ========================================================================
	# Item Extraction
	# ========================================================================
	
	def extract_items(self):
		"""Extract item data to JSON."""
		# TODO: Determine actual item data location and format
		
		item_template = {
			"_comment": "TODO: Extract actual item data",
			"items": [],
			"categories": {
				"weapons": [],
				"armor": [],
				"shields": [],
				"helmets": [],
				"accessories": [],
				"consumables": [],
				"key_items": [],
			},
			"metadata": {
				"bank": "TBD",
				"offset": "TBD",
				"count": "TBD",
			}
		}
		
		output_path = self.json_dir / "items" / "items.json"
		with open(output_path, "w", encoding="utf-8") as f:
			json.dump(item_template, f, indent="\t", ensure_ascii=False)
	
	# ========================================================================
	# Spell Extraction
	# ========================================================================
	
	def extract_spells(self):
		"""Extract spell data to JSON."""
		# TODO: Determine actual spell data location and format
		
		spell_template = {
			"_comment": "TODO: Extract actual spell data",
			"spells": [],
			"metadata": {
				"bank": "TBD",
				"offset": "TBD",
				"count": "TBD",
			}
		}
		
		output_path = self.json_dir / "spells" / "spells.json"
		with open(output_path, "w", encoding="utf-8") as f:
			json.dump(spell_template, f, indent="\t", ensure_ascii=False)
	
	# ========================================================================
	# Text Extraction
	# ========================================================================
	
	def extract_text(self):
		"""Extract all text/dialog to files."""
		# TODO: Determine actual text data location
		
		text_template = {
			"_comment": "TODO: Extract actual dialog text",
			"dialog": [],
			"item_names": [],
			"monster_names": [],
			"spell_names": [],
			"location_names": [],
			"menu_text": [],
			"metadata": {
				"encoding": "DW4 TBL",
				"bank": "TBD",
			}
		}
		
		output_path = self.text_dir / "dialog.json"
		with open(output_path, "w", encoding="utf-8") as f:
			json.dump(text_template, f, indent="\t", ensure_ascii=False)
		
		# Also save TBL file
		tbl_path = self.text_dir / "dw4.tbl"
		with open(tbl_path, "w", encoding="utf-8") as f:
			f.write("# Dragon Warrior IV Text Table\n")
			f.write("# Format: XX=CHAR\n\n")
			for val, char in sorted(DW4_TBL.items()):
				if len(char) == 1:
					f.write(f"{val:02X}={char}\n")
				else:
					f.write(f"# {val:02X}={char}\n")
	
	# ========================================================================
	# Graphics Extraction
	# ========================================================================
	
	def extract_graphics(self):
		"""Extract graphics (CHR) data to PNG files."""
		try:
			from PIL import Image
		except ImportError:
			self.console.print("[yellow]Warning: PIL not installed, skipping graphics extraction[/yellow]")
			return
		
		# Extract each CHR bank
		for bank in range(16):
			chr_data = self.analyzer.get_chr_bank(bank)
			if chr_data:
				self._chr_to_image(chr_data, bank)
	
	def _chr_to_image(self, chr_data: bytes, bank_num: int):
		"""Convert CHR data to PNG image."""
		try:
			from PIL import Image
		except ImportError:
			return
		
		# NES tiles are 8x8 pixels, 2 bits per pixel
		# CHR banks contain 256 tiles (8 KB = 256 * 32 bytes per tile)
		# Arrange as 16x16 grid of tiles = 128x128 pixels
		
		TILE_SIZE = 8
		TILES_PER_ROW = 16
		TILES_PER_BANK = 256
		
		# Create image (16x16 tiles = 128x128 pixels)
		img = Image.new("P", (TILES_PER_ROW * TILE_SIZE, TILES_PER_ROW * TILE_SIZE))
		
		# Set a grayscale palette (4 colors for 2bpp)
		palette = [
			0, 0, 0,        # Color 0: Black
			85, 85, 85,     # Color 1: Dark gray
			170, 170, 170,  # Color 2: Light gray
			255, 255, 255,  # Color 3: White
		]
		# Pad palette to 256 colors
		palette.extend([0] * (768 - len(palette)))
		img.putpalette(palette)
		
		# Process each tile
		for tile_idx in range(TILES_PER_BANK):
			tile_offset = tile_idx * 16  # 16 bytes per tile (8 bytes plane 0 + 8 bytes plane 1)
			
			if tile_offset + 16 > len(chr_data):
				break
			
			tile_x = (tile_idx % TILES_PER_ROW) * TILE_SIZE
			tile_y = (tile_idx // TILES_PER_ROW) * TILE_SIZE
			
			# Decode tile
			for row in range(TILE_SIZE):
				plane0 = chr_data[tile_offset + row]
				plane1 = chr_data[tile_offset + row + 8]
				
				for col in range(TILE_SIZE):
					bit0 = (plane0 >> (7 - col)) & 1
					bit1 = (plane1 >> (7 - col)) & 1
					color = bit0 | (bit1 << 1)
					
					img.putpixel((tile_x + col, tile_y + row), color)
		
		# Save image
		output_path = self.graphics_dir / "tilesets" / f"chr_bank_{bank_num:02d}.png"
		img.save(output_path)


# ============================================================================
# CLI Interface
# ============================================================================

@click.group()
def cli():
	"""Dragon Warrior IV Asset Extractor."""
	pass


@cli.command()
@click.option("--rom", "-r", default=str(ROM_PATH), help="Path to ROM file")
@click.option("--output", "-o", default=str(ASSETS_DIR), help="Output directory")
def extract(rom: str, output: str):
	"""Extract all assets from ROM."""
	extractor = AssetExtractor(Path(rom), Path(output))
	extractor.extract_all()


@cli.command()
@click.option("--rom", "-r", default=str(ROM_PATH), help="Path to ROM file")
@click.option("--output", "-o", default=str(ASSETS_DIR), help="Output directory")
def monsters(rom: str, output: str):
	"""Extract only monster data."""
	extractor = AssetExtractor(Path(rom), Path(output))
	extractor.setup_directories()
	if extractor.load_rom():
		extractor.extract_monsters()
		extractor.console.print("[green]Monster extraction complete[/green]")


@cli.command()
@click.option("--rom", "-r", default=str(ROM_PATH), help="Path to ROM file")
@click.option("--output", "-o", default=str(ASSETS_DIR), help="Output directory")
def graphics(rom: str, output: str):
	"""Extract only graphics data."""
	extractor = AssetExtractor(Path(rom), Path(output))
	extractor.setup_directories()
	if extractor.load_rom():
		extractor.extract_graphics()
		extractor.console.print("[green]Graphics extraction complete[/green]")


if __name__ == "__main__":
	cli()
