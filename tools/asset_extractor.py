#!/usr/bin/env python3
"""
Asset Extractor for Dragon Warrior IV

Extracts game assets from the ROM file:
- Data tables (monsters, items, spells, etc.)
- Text and dialog
- Graphics (sprites, tilesets)
- Maps
- Audio data

Known ROM Layout (MMC3 Mapper 4):
- PRG ROM: 256 KB (16 banks × 16 KB)
- CHR ROM: 128 KB (16 banks × 8 KB)
- Banks 0x09-0x0b: Map data
- Banks 0x0c-0x0e: Dialog/text data
- Bank 0x0f: Fixed bank (vectors, core routines)
"""

import json
import struct
from dataclasses import dataclass, asdict, field
from pathlib import Path
from typing import List, Dict, Any, Optional, Tuple
from enum import IntEnum

import click
from rich.console import Console
from rich.progress import Progress, SpinnerColumn, TextColumn, BarColumn, TaskProgressColumn
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
# Known ROM Offsets and Constants
# ============================================================================

# Monster data (based on typical DQ/DW format - needs verification)
# These are educated guesses based on similar NES DW games
MONSTER_DATA_BANK = 0x08
MONSTER_COUNT = 195  # Approximate - DW4 has ~195 monsters
MONSTER_NAME_BANK = 0x0c
MONSTER_STATS_SIZE = 16  # Bytes per monster entry

# Item data
ITEM_DATA_BANK = 0x08
ITEM_COUNT = 128  # From our items.json
ITEM_NAME_BANK = 0x0c

# Spell data
SPELL_DATA_BANK = 0x08
SPELL_COUNT = 40  # Approximate spell count for DW4

# Text/Dialog banks
TEXT_BANKS = [0x0c, 0x0d, 0x0e]

# Experience tables
EXP_TABLE_BANK = 0x08

# Shop data
SHOP_DATA_BANK = 0x08

# Character growth data
CHARACTER_DATA_BANK = 0x08

# Map pointer tables
MAP_BANK_START = 0x09
MAP_BANK_END = 0x0b
MAP_BANKS = [0x09, 0x0a, 0x0b]

# Fixed bank (always mapped to $C000-$FFFF)
FIXED_BANK = 0x0f


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
	0x0a: "9",
	0x0b: "a",
	0x0c: "b",
	0x0d: "c",
	0x0e: "d",
	0x0f: "e",
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
	0x1a: "p",
	0x1b: "q",
	0x1c: "r",
	0x1d: "s",
	0x1e: "t",
	0x1f: "u",
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
	0x2a: "F",
	0x2b: "G",
	0x2c: "H",
	0x2d: "I",
	0x2e: "J",
	0x2f: "K",
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
	0x3a: "V",
	0x3b: "W",
	0x3c: "X",
	0x3d: "Y",
	0x3e: "Z",
	# Punctuation (from GameInfo wiki)
	0x65: "—",
	0x66: """,
	0x67: """,
	0x68: "'",
	0x69: "'",
	0x6a: "'",
	0x6b: "'",
	0x6c: ".'",
	0x6d: "?",
	0x6e: "!",
	0x6f: "-",
	0x70: "✱",
	0x71: ":",
	0x72: "…",
	0x73: "†",  # tombstone
	0x74: "☠",  # skull
	0x75: "(",
	0x76: ")",
	0x77: ",",
	0x78: ".",
	0x79: "「",
	# Special characters
	0x80: "▼",
	0x81: "▶",
	# Control codes
	0xf0: "[WAIT]",
	0xf1: "[LINE]",
	0xf2: "[NAME]",
	0xf3: "[ITEM]",
	0xf4: "[NUM]",
	0xf5: "[HERO]",
	0xf6: "[MONSTER]",
	0xf7: "[SPELL]",
	0xf8: "[GOLD]",
	0xf9: "[EXP]",
	0xfa: "[LV]",
	0xfb: "[HP]",
	0xfc: "[MP]",
	0xfd: "[CLEAR]",
	0xfe: "[PAUSE]",
	0xff: "[END]",
}

# Reverse lookup for encoding text
DW4_TBL_REVERSE = {v: k for k, v in DW4_TBL.items() if len(v) == 1}


def decode_text(data: bytes, tbl: Dict[int, str] = DW4_TBL) -> str:
	"""Decode DW4 text bytes to string."""
	result = []
	i = 0
	while i < len(data):
		byte = data[i]
		if byte == 0xff:  # End marker
			break
		if byte in tbl:
			result.append(tbl[byte])
		else:
			result.append(f"[${byte:02x}]")
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
	BANG = 5  # Explosion
	DEFEAT = 6  # Instant death
	SLEEP = 7
	STOPSPELL = 8


class ItemType(IntEnum):
	"""DW4 item types."""
	WEAPON = 0
	ARMOR = 1
	SHIELD = 2
	HELMET = 3
	ACCESSORY = 4
	CONSUMABLE = 5
	KEY_ITEM = 6
	TOOL = 7


class SpellTarget(IntEnum):
	"""Spell targeting types."""
	SELF = 0
	ALLY_ONE = 1
	ALLY_ALL = 2
	ENEMY_ONE = 3
	ENEMY_GROUP = 4
	ENEMY_ALL = 5
	FIELD = 6


@dataclass
class Monster:
	"""DW4 Monster data structure (16 bytes per entry based on typical DW format)."""
	id: int
	name: str = ""
	hp: int = 0
	mp: int = 0
	attack: int = 0
	defense: int = 0
	agility: int = 0
	exp: int = 0
	gold: int = 0
	action_pattern: int = 0
	drop_item: int = 0
	drop_rate: int = 0  # 1/N chance
	resistances: int = 0  # Bitmask
	sprite_id: int = 0
	palette_id: int = 0

	# ROM location info
	rom_offset: int = 0


@dataclass
class Spell:
	"""DW4 Spell data structure."""
	id: int
	name: str = ""
	mp_cost: int = 0
	power: int = 0
	target: int = 0  # SpellTarget enum
	effect_type: int = 0
	element: int = 0
	accuracy: int = 100

	# Who can learn this spell
	learnable_by: List[int] = field(default_factory=list)
	learn_level: Dict[int, int] = field(default_factory=dict)  # character_id -> level


@dataclass
class Shop:
	"""DW4 Shop data structure."""
	id: int
	location: str = ""
	shop_type: str = ""  # weapon, armor, item, tool
	items: List[int] = field(default_factory=list)  # Item IDs


@dataclass
class ExpTableEntry:
	"""Experience required for each level."""
	level: int
	exp_required: int
	hp_gain: int = 0
	mp_gain: int = 0
	str_gain: int = 0
	agi_gain: int = 0
	vit_gain: int = 0
	int_gain: int = 0
	luck_gain: int = 0


@dataclass
class EncounterZone:
	"""Enemy encounter zone definition."""
	zone_id: int
	name: str = ""
	encounter_rate: int = 0
	monster_groups: List[List[int]] = field(default_factory=list)  # List of possible monster groups


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
		self.rom_data: bytes = b""

		# Ensure output directories exist
		self.json_dir = output_dir / "json"
		self.graphics_dir = output_dir / "graphics"
		self.text_dir = output_dir / "text"
		self.maps_dir = output_dir / "maps"
		self.audio_dir = output_dir / "audio"

		# Extraction results for cross-referencing
		self.monsters: List[Monster] = []
		self.spells: List[Spell] = []
		self.shops: List[Shop] = []
		self.exp_tables: Dict[int, List[ExpTableEntry]] = {}  # character_id -> exp table
		self.encounter_zones: List[EncounterZone] = []

	# ========================================================================
	# ROM Reading Helpers
	# ========================================================================

	def read_byte(self, offset: int) -> int:
		"""Read a single byte from ROM."""
		if 0 <= offset < len(self.rom_data):
			return self.rom_data[offset]
		return 0

	def read_word(self, offset: int) -> int:
		"""Read a 16-bit little-endian word from ROM."""
		if 0 <= offset + 1 < len(self.rom_data):
			return self.rom_data[offset] | (self.rom_data[offset + 1] << 8)
		return 0

	def read_bytes(self, offset: int, length: int) -> bytes:
		"""Read a sequence of bytes from ROM."""
		if 0 <= offset and offset + length <= len(self.rom_data):
			return self.rom_data[offset:offset + length]
		return b""

	def bank_to_offset(self, bank: int, addr: int = 0x8000) -> int:
		"""
		Convert a PRG bank number and address to a ROM file offset.

		Args:
			bank: PRG bank number (0-15 for 256KB PRG)
			addr: CPU address (typically $8000-$FFFF)

		Returns:
			Absolute offset in ROM file (accounting for 16-byte iNES header)
		"""
		# iNES header is 16 bytes
		header_size = 16
		# PRG banks are 16KB each
		bank_size = 0x4000
		# Convert address to bank-relative offset
		if addr >= 0xc000:
			# High bank window (typically fixed to last bank or bank+1)
			bank_offset = addr - 0xc000
		else:
			# Low bank window ($8000-$BFFF)
			bank_offset = addr - 0x8000

		return header_size + (bank * bank_size) + bank_offset

	def cpu_to_offset(self, bank: int, cpu_addr: int) -> int:
		"""
		Convert CPU address within a bank to ROM file offset.
		Handles both $8000-$BFFF and $C000-$FFFF windows.
		"""
		return self.bank_to_offset(bank, cpu_addr)

	def decode_text_at(self, offset: int, max_length: int = 255) -> str:
		"""Decode DW4 text starting at ROM offset until terminator."""
		result = []
		for i in range(max_length):
			byte = self.read_byte(offset + i)
			if byte == 0x00 or byte == 0xff:  # Common terminators
				break
			char = DW4_TBL.get(byte, f"[{byte:02x}]")
			result.append(char)
		return "".join(result)

	def read_pointer_table(self, offset: int, count: int) -> List[int]:
		"""Read a table of 16-bit pointers."""
		pointers = []
		for i in range(count):
			ptr = self.read_word(offset + (i * 2))
			pointers.append(ptr)
		return pointers

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

		# Store raw ROM data for direct access
		with open(self.rom_path, "rb") as f:
			self.rom_data = f.read()

		self.console.print(f"[green]Loaded ROM: {summary['file_name']}[/green]")
		self.console.print(f"  MD5: {summary['md5']}")
		self.console.print(f"  Size: {len(self.rom_data):,} bytes")
		self.console.print(f"  PRG: {summary['header']['prg_rom_size'] // 1024}KB, CHR: {summary['header']['chr_rom_size'] // 1024}KB")
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

			task = progress.add_task("Extracting shops...", total=None)
			self.extract_shops()
			progress.update(task, description="[green]✓[/green] Extracted shops")

			task = progress.add_task("Extracting exp tables...", total=None)
			self.extract_exp_tables()
			progress.update(task, description="[green]✓[/green] Extracted exp tables")

			task = progress.add_task("Extracting encounters...", total=None)
			self.extract_encounters()
			progress.update(task, description="[green]✓[/green] Extracted encounters")

			task = progress.add_task("Extracting text...", total=None)
			self.extract_text()
			progress.update(task, description="[green]✓[/green] Extracted text")

			task = progress.add_task("Extracting graphics...", total=None)
			self.extract_graphics()
			progress.update(task, description="[green]✓[/green] Extracted graphics")

		self.console.print("\n[bold green]Asset extraction complete![/bold green]")
		self.console.print(f"  Output directory: {self.output_dir}")

	# ========================================================================
	# Monster Extraction
	# ========================================================================

	def extract_monsters(self):
		"""
		Extract monster data from ROM.

		DW4 monster data format (based on typical Dragon Quest NES structure):
		- Monster stats are stored in Bank $08 (data tables bank)
		- Each monster entry is typically 12-16 bytes
		- Monster names are stored separately in text banks

		Known structure per monster (typical DQ format):
		  Offset 0: HP (2 bytes, little endian)
		  Offset 2: MP (1 byte)
		  Offset 3: Attack (2 bytes)
		  Offset 5: Defense (1 byte)
		  Offset 6: Agility (1 byte)
		  Offset 7: Experience (2 bytes)
		  Offset 9: Gold (2 bytes)
		  Offset 11: Drop item ID (1 byte)
		  Offset 12: Drop rate (1 byte, 1/N)
		  Offset 13: Action pattern (1 byte)
		  Offset 14: Resistances (1 byte, bitmask)
		  Offset 15: Sprite/palette info (1 byte)
		"""
		self.console.print("  [dim]Scanning for monster data...[/dim]")

		monsters_data = {
			"_comment": "Dragon Warrior IV Monster Data - Extracted from ROM",
			"_extraction_info": {
				"source_bank": f"0x{MONSTER_DATA_BANK:02x}",
				"monster_count": MONSTER_COUNT,
				"entry_size": "16 bytes (estimated)",
				"status": "research_needed"
			},
			"monsters": [],
			"monster_names": [],
			"raw_data_samples": []
		}

		# Try to find monster data by scanning for patterns
		# Monster data typically has:
		# - HP values in reasonable range (1-1000)
		# - Sequential entries
		# - Consistent structure

		# First, try to extract monster names from text bank
		monster_names = self._extract_monster_names()
		monsters_data["monster_names"] = monster_names

		# Scan Bank 0x08 for potential monster stat tables
		bank_offset = self.bank_to_offset(MONSTER_DATA_BANK)
		self.console.print(f"  [dim]Bank 0x{MONSTER_DATA_BANK:02x} starts at ROM offset 0x{bank_offset:05x}[/dim]")

		# Sample raw data from suspected locations for analysis
		sample_offsets = [
			bank_offset,
			bank_offset + 0x0100,
			bank_offset + 0x0200,
			bank_offset + 0x0400,
			bank_offset + 0x0800,
			bank_offset + 0x1000,
			bank_offset + 0x2000,
			bank_offset + 0x3000,
		]

		for sample_offset in sample_offsets:
			sample = self.read_bytes(sample_offset, 64)
			if sample:
				hex_dump = " ".join(f"{b:02x}" for b in sample[:32])
				monsters_data["raw_data_samples"].append({
					"offset": f"0x{sample_offset:05x}",
					"hex": hex_dump,
					"interpretation": self._interpret_monster_sample(sample)
				})

		# Attempt to parse monster entries if pattern is found
		# This is exploratory - actual offsets need verification
		found_monsters = self._scan_for_monster_table()
		if found_monsters:
			monsters_data["monsters"] = found_monsters
			monsters_data["_extraction_info"]["status"] = "partial_extraction"

		# Save extracted data
		output_path = self.json_dir / "monsters" / "monsters.json"
		with open(output_path, "w", encoding="utf-8") as f:
			json.dump(monsters_data, f, indent="\t", ensure_ascii=False)

		# Also save individual monster files if we found any
		if found_monsters:
			for monster in found_monsters:
				monster_path = self.json_dir / "monsters" / f"monster_{monster['id']:03d}.json"
				with open(monster_path, "w", encoding="utf-8") as f:
					json.dump(monster, f, indent="\t", ensure_ascii=False)

		self.console.print(f"  [dim]Found {len(found_monsters)} potential monster entries[/dim]")

	def _extract_monster_names(self) -> List[Dict]:
		"""Extract monster names from text banks."""
		names = []

		# Monster names are typically in text bank with a pointer table
		# Try scanning text banks for name patterns
		for bank in TEXT_BANKS:
			bank_offset = self.bank_to_offset(bank)

			# Look for pointer table pattern (sequential increasing pointers)
			for scan_offset in range(bank_offset, bank_offset + 0x3000, 0x100):
				ptrs = self.read_pointer_table(scan_offset, 10)

				# Check if this looks like a valid pointer table
				# Pointers should be in $8000-$BFFF range and roughly sequential
				if all(0x8000 <= p < 0xc000 for p in ptrs):
					if ptrs[0] < ptrs[1] < ptrs[2]:  # Roughly increasing
						# This might be a name table
						self.console.print(f"  [dim]Potential name table at 0x{scan_offset:05x}[/dim]")
						break

		return names

	def _interpret_monster_sample(self, data: bytes) -> Dict:
		"""Attempt to interpret 16 bytes as a monster entry."""
		if len(data) < 16:
			return {}

		return {
			"as_monster": {
				"hp": self._bytes_to_word(data[0:2]),
				"mp": data[2],
				"attack": self._bytes_to_word(data[3:5]),
				"defense": data[5],
				"agility": data[6],
				"exp": self._bytes_to_word(data[7:9]),
				"gold": self._bytes_to_word(data[9:11]),
				"drop_item": data[11],
				"drop_rate": data[12],
				"action": data[13],
				"resist": data[14],
				"sprite": data[15],
			}
		}

	def _bytes_to_word(self, data: bytes) -> int:
		"""Convert 2 bytes (little endian) to int."""
		if len(data) >= 2:
			return data[0] | (data[1] << 8)
		return 0

	def _scan_for_monster_table(self) -> List[Dict]:
		"""Scan for monster stat table by looking for reasonable stat patterns."""
		monsters = []

		# Monster stats have recognizable patterns:
		# - HP: 1-2000+ for bosses, most enemies 10-500
		# - MP: 0-255
		# - Attack/Defense: 1-255
		# - EXP/Gold: realistic values

		bank_offset = self.bank_to_offset(MONSTER_DATA_BANK)
		entry_size = 16  # Estimated

		# Scan for potential start of monster table
		best_offset = None
		best_score = 0

		for scan_start in range(bank_offset, bank_offset + 0x3800, 16):
			score = 0
			valid_entries = 0

			# Check 10 consecutive entries
			for i in range(10):
				offset = scan_start + (i * entry_size)
				entry = self.read_bytes(offset, entry_size)
				if len(entry) < entry_size:
					break

				hp = self._bytes_to_word(entry[0:2])
				mp = entry[2]
				attack = self._bytes_to_word(entry[3:5])
				defense = entry[5]
				agility = entry[6]
				exp = self._bytes_to_word(entry[7:9])
				gold = self._bytes_to_word(entry[9:11])

				# Score based on reasonable values
				if 1 <= hp <= 3000:
					score += 2
				if 0 <= mp <= 255:
					score += 1
				if 1 <= attack <= 300:
					score += 2
				if 1 <= defense <= 255:
					score += 1
				if 1 <= agility <= 255:
					score += 1
				if 0 <= exp <= 10000:
					score += 1
				if 0 <= gold <= 5000:
					score += 1

				if score > 5:
					valid_entries += 1

			if valid_entries >= 8 and score > best_score:
				best_score = score
				best_offset = scan_start

		# If we found a good candidate, extract monsters
		if best_offset and best_score > 50:
			self.console.print(f"  [dim]Best monster table candidate at 0x{best_offset:05x} (score: {best_score})[/dim]")

			for i in range(min(MONSTER_COUNT, 50)):  # Extract up to 50 for now
				offset = best_offset + (i * entry_size)
				entry = self.read_bytes(offset, entry_size)
				if len(entry) < entry_size:
					break

				monster = {
					"id": i,
					"rom_offset": f"0x{offset:05x}",
					"hp": self._bytes_to_word(entry[0:2]),
					"mp": entry[2],
					"attack": self._bytes_to_word(entry[3:5]),
					"defense": entry[5],
					"agility": entry[6],
					"exp": self._bytes_to_word(entry[7:9]),
					"gold": self._bytes_to_word(entry[9:11]),
					"drop_item_id": entry[11],
					"drop_rate": entry[12],
					"action_pattern": entry[13],
					"resistances": entry[14],
					"sprite_info": entry[15],
					"raw_hex": " ".join(f"{b:02x}" for b in entry)
				}
				monsters.append(monster)

		return monsters

	# ========================================================================
	# Item Extraction
	# ========================================================================

	def extract_items(self):
		"""
		Extract item data from ROM.

		DW4 item data includes:
		- Equipment stats (attack, defense bonuses)
		- Prices
		- Usability flags (who can equip)
		- Special effects

		Items are typically organized by category:
		- Weapons (swords, axes, staffs, etc.)
		- Armor (body armor)
		- Shields
		- Helmets
		- Accessories
		- Consumables (herbs, antidotes, etc.)
		- Key items
		"""
		self.console.print("  [dim]Scanning for item data...[/dim]")

		items_data = {
			"_comment": "Dragon Warrior IV Item Data - Extracted from ROM",
			"_extraction_info": {
				"source_bank": "TBD",
				"status": "research_needed"
			},
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
			"raw_data_samples": []
		}

		# Known DW4 weapons for reference
		known_weapons = [
			"Copper Sword", "Thorn Whip", "Iron Claw", "Boomerang",
			"Chain Sickle", "Morning Star", "Battle Axe", "Broad Sword",
			"Iron Fan", "Staff of Force", "Sword of Miracles",
			"Dragon Killer", "Falcon Sword", "Zenithian Sword",
			"Metal Babble Sword", "Sword of Lethargy",
		]
		items_data["known_weapon_names"] = known_weapons

		# Scan for item tables
		found_items = self._scan_for_item_table()
		if found_items:
			items_data["items"] = found_items
			items_data["_extraction_info"]["status"] = "partial_extraction"

		# Save extracted data
		output_path = self.json_dir / "items" / "items.json"
		with open(output_path, "w", encoding="utf-8") as f:
			json.dump(items_data, f, indent="\t", ensure_ascii=False)

		self.console.print(f"  [dim]Found {len(found_items)} potential item entries[/dim]")

	def _scan_for_item_table(self) -> List[Dict]:
		"""Scan for item data table."""
		items = []

		# Item data typically has:
		# - Price (2 bytes, range 0-65535)
		# - Attack/Defense bonus (1 byte each)
		# - Equipment flags

		for bank in [0x06, 0x07, 0x08]:
			bank_offset = self.bank_to_offset(bank)
			entry_size = 8  # Estimated item entry size

			for scan_start in range(bank_offset, bank_offset + 0x3800, 8):
				score = 0
				valid_entries = 0

				for i in range(10):
					offset = scan_start + (i * entry_size)
					entry = self.read_bytes(offset, entry_size)
					if len(entry) < entry_size:
						break

					price = self._bytes_to_word(entry[0:2])
					attack = entry[2]
					defense = entry[3]

					# Score based on reasonable item values
					if 0 <= price <= 50000:
						score += 2
					if 0 <= attack <= 150:
						score += 1
					if 0 <= defense <= 100:
						score += 1

					if score > 3:
						valid_entries += 1

				if valid_entries >= 8:
					# Found potential item table
					for i in range(100):  # Extract up to 100 items
						offset = scan_start + (i * entry_size)
						entry = self.read_bytes(offset, entry_size)
						if len(entry) < entry_size:
							break

						item = {
							"id": i,
							"rom_offset": f"0x{offset:05x}",
							"price": self._bytes_to_word(entry[0:2]),
							"attack_bonus": entry[2],
							"defense_bonus": entry[3],
							"agility_bonus": entry[4] if entry[4] < 128 else entry[4] - 256,
							"equip_flags": entry[5],
							"effect_id": entry[6],
							"item_type": entry[7],
							"raw_hex": " ".join(f"{b:02x}" for b in entry)
						}
						items.append(item)

					return items

		return items

	# ========================================================================
	# Shop Extraction
	# ========================================================================

	def extract_shops(self):
		"""
		Extract shop inventory data from ROM.

		Shops are typically stored as:
		- Shop type byte
		- Number of items
		- List of item IDs
		- Terminator byte (usually 0xFF)
		"""
		self.console.print("  [dim]Scanning for shop data...[/dim]")

		shops_data = {
			"_comment": "Dragon Warrior IV Shop Data - Extracted from ROM",
			"shops": [],
			"shop_types": {
				"0": "Weapon shop",
				"1": "Armor shop",
				"2": "Item shop",
				"3": "Tool shop"
			}
		}

		# Scan for shop patterns (lists of item IDs followed by 0xFF)
		found_shops = self._scan_for_shop_data()
		shops_data["shops"] = found_shops

		output_path = self.json_dir / "shops.json"
		with open(output_path, "w", encoding="utf-8") as f:
			json.dump(shops_data, f, indent="\t", ensure_ascii=False)

		self.console.print(f"  [dim]Found {len(found_shops)} potential shop definitions[/dim]")

	def _scan_for_shop_data(self) -> List[Dict]:
		"""Scan for shop inventory data."""
		shops = []
		shop_id = 0

		# Shops are typically in data banks
		for bank in [0x08, 0x09, 0x0a]:
			bank_offset = self.bank_to_offset(bank)

			offset = bank_offset
			while offset < bank_offset + 0x3f00:
				# Look for pattern: small values (item IDs) followed by 0xFF
				potential_items = []
				scan_offset = offset

				while scan_offset < offset + 20:
					byte = self.read_byte(scan_offset)
					if byte == 0xff:
						if 3 <= len(potential_items) <= 12:
							# This looks like a valid shop
							if all(1 <= item <= 200 for item in potential_items):
								shop = {
									"id": shop_id,
									"rom_offset": f"0x{offset:05x}",
									"item_ids": potential_items,
									"raw_hex": " ".join(f"{b:02x}" for b in self.read_bytes(offset, len(potential_items) + 1))
								}
								shops.append(shop)
								shop_id += 1
						break
					elif byte > 0 and byte < 200:
						potential_items.append(byte)
						scan_offset += 1
					else:
						break

				offset += 1

		return shops

	# ========================================================================
	# Experience Table Extraction
	# ========================================================================

	def extract_exp_tables(self):
		"""
		Extract experience tables for each character.

		DW4 has separate exp tables for different characters.
		Each entry typically contains:
		- EXP required for level (2-3 bytes)
		- Stat gains for that level
		"""
		self.console.print("  [dim]Scanning for experience tables...[/dim]")

		exp_data = {
			"_comment": "Dragon Warrior IV Experience Tables - Extracted from ROM",
			"characters": {},
			"raw_data_samples": []
		}

		# Experience values follow patterns:
		# - Level 1: 0 or small value
		# - Each subsequent level requires more exp
		# - Values grow exponentially

		found_tables = self._scan_for_exp_tables()
		exp_data["exp_tables"] = found_tables

		output_path = self.json_dir / "exp_tables.json"
		with open(output_path, "w", encoding="utf-8") as f:
			json.dump(exp_data, f, indent="\t", ensure_ascii=False)

		self.console.print(f"  [dim]Found {len(found_tables)} potential exp table sections[/dim]")

	def _scan_for_exp_tables(self) -> List[Dict]:
		"""Scan for experience point tables."""
		exp_tables = []

		# EXP tables have distinct patterns:
		# - Values start small and increase
		# - Typically 50-99 entries per character
		# - Each entry is 2-3 bytes

		for bank in [0x06, 0x07, 0x08]:
			bank_offset = self.bank_to_offset(bank)

			for scan_start in range(bank_offset, bank_offset + 0x3800, 2):
				# Check for increasing sequence
				values = []
				for i in range(30):
					val = self.read_word(scan_start + (i * 2))
					values.append(val)

				# Check if values are monotonically increasing
				if all(values[i] < values[i+1] for i in range(len(values)-1)):
					if values[0] < 100 and values[-1] > 10000:
						# This looks like an exp table
						exp_table = {
							"rom_offset": f"0x{scan_start:05x}",
							"bank": f"0x{bank:02x}",
							"levels": []
						}

						for level in range(50):  # Up to 50 levels
							exp = self.read_word(scan_start + (level * 2))
							if exp >= 0xffff or (level > 0 and exp == 0):
								break
							exp_table["levels"].append({
								"level": level + 1,
								"exp_required": exp
							})

						if len(exp_table["levels"]) > 20:
							exp_tables.append(exp_table)

		return exp_tables

	# ========================================================================
	# Encounter Table Extraction
	# ========================================================================

	def extract_encounters(self):
		"""
		Extract enemy encounter tables.

		Encounter data typically includes:
		- Zone/area ID
		- List of possible enemy groups
		- Encounter rate modifier
		"""
		self.console.print("  [dim]Scanning for encounter tables...[/dim]")

		encounter_data = {
			"_comment": "Dragon Warrior IV Encounter Data - Extracted from ROM",
			"zones": [],
			"encounter_groups": []
		}

		# Encounter tables are often in map-related banks
		found_encounters = self._scan_for_encounter_data()
		encounter_data["encounter_groups"] = found_encounters

		output_path = self.json_dir / "encounters.json"
		with open(output_path, "w", encoding="utf-8") as f:
			json.dump(encounter_data, f, indent="\t", ensure_ascii=False)

		self.console.print(f"  [dim]Found {len(found_encounters)} potential encounter groups[/dim]")

	def _scan_for_encounter_data(self) -> List[Dict]:
		"""Scan for encounter group definitions."""
		encounters = []

		# Encounter groups typically have:
		# - Small monster count (1-8)
		# - Monster IDs in valid range
		# - Followed by terminator or next group

		for bank in MAP_BANKS:
			bank_offset = self.bank_to_offset(bank)

			for scan_start in range(bank_offset, bank_offset + 0x3800, 4):
				# Look for patterns of small values (monster IDs)
				entry = self.read_bytes(scan_start, 8)
				if len(entry) < 8:
					continue

				# Check if this could be an encounter group
				monster_ids = []
				for b in entry[:6]:
					if 1 <= b <= MONSTER_COUNT:
						monster_ids.append(b)
					elif b == 0x00 or b == 0xff:
						break
					else:
						break

				if 2 <= len(monster_ids) <= 6:
					encounter = {
						"rom_offset": f"0x{scan_start:05x}",
						"monster_ids": monster_ids,
						"raw_hex": " ".join(f"{b:02x}" for b in entry)
					}
					encounters.append(encounter)

		# Deduplicate
		seen = set()
		unique_encounters = []
		for enc in encounters:
			key = tuple(enc["monster_ids"])
			if key not in seen:
				seen.add(key)
				unique_encounters.append(enc)

		return unique_encounters

	# ========================================================================
	# Spell Extraction
	# ========================================================================

	def extract_spells(self):
		"""
		Extract spell data from ROM.

		DW4 spell data structure (typical DQ format):
		  Offset 0: MP cost (1 byte)
		  Offset 1: Effect type (1 byte)
		  Offset 2: Power/healing amount (1 byte)
		  Offset 3: Target type (1 byte)
		  Offset 4: Element (1 byte)
		  Offset 5: Accuracy (1 byte)
		  Offset 6-7: Flags/extras (2 bytes)

		Spell names are stored separately in text banks.
		"""
		self.console.print("  [dim]Scanning for spell data...[/dim]")

		spells_data = {
			"_comment": "Dragon Warrior IV Spell Data - Extracted from ROM",
			"_extraction_info": {
				"source_bank": "TBD",
				"spell_count": "~50 estimated",
				"entry_size": "8 bytes (estimated)",
				"status": "research_needed"
			},
			"spells": [],
			"spell_names": [],
			"raw_data_samples": [],
			"spell_categories": {
				"offensive": [],
				"healing": [],
				"support": [],
				"field": []
			}
		}

		# Known DW4 spells for reference
		known_spells = [
			"Heal", "Healmore", "Healall", "Healus", "Healusall",
			"Hurt", "Hurtmore", "Explodet", "Bang", "Boom",
			"Firebane", "Firevolt", "Blaze", "Blazemore", "Blazemost",
			"Icebolt", "Snowstorm", "Snowblast",
			"Sleep", "Sleepmore", "Stopspell", "Surround",
			"Defense", "Increase", "Speedup", "Bikill",
			"Outside", "Return", "Repel", "Stepguard",
			"Beat", "Defeat", "Sacrifice",
			"Zap", "Thordain",
			"Transform", "Chance", "Bounce",
		]
		spells_data["known_spell_names"] = known_spells

		# Scan for spell tables
		# Spells typically have:
		# - MP cost in range 0-30 for most spells
		# - Effect type < 64 (limited effect types)
		# - Power values 0-255

		found_spells = self._scan_for_spell_table()
		if found_spells:
			spells_data["spells"] = found_spells
			spells_data["_extraction_info"]["status"] = "partial_extraction"

		# Sample data from multiple banks
		for bank in [0x06, 0x07, 0x08, 0x09]:
			bank_offset = self.bank_to_offset(bank)
			for sample_offset in [bank_offset, bank_offset + 0x1000, bank_offset + 0x2000]:
				sample = self.read_bytes(sample_offset, 32)
				if sample:
					hex_dump = " ".join(f"{b:02x}" for b in sample[:16])
					spells_data["raw_data_samples"].append({
						"bank": f"0x{bank:02x}",
						"offset": f"0x{sample_offset:05x}",
						"hex": hex_dump
					})

		# Save extracted data
		output_path = self.json_dir / "spells" / "spells.json"
		with open(output_path, "w", encoding="utf-8") as f:
			json.dump(spells_data, f, indent="\t", ensure_ascii=False)

		self.console.print(f"  [dim]Found {len(found_spells)} potential spell entries[/dim]")

	def _scan_for_spell_table(self) -> List[Dict]:
		"""Scan for spell data table."""
		spells = []

		# Spells have distinct patterns:
		# - MP cost: 0-30 typically (some high level spells up to 50)
		# - Most bytes are small values

		for bank in [0x06, 0x07, 0x08]:
			bank_offset = self.bank_to_offset(bank)
			entry_size = 8  # Estimated spell entry size

			for scan_start in range(bank_offset, bank_offset + 0x3800, 8):
				score = 0
				valid_entries = 0

				# Check 10 consecutive potential spell entries
				for i in range(10):
					offset = scan_start + (i * entry_size)
					entry = self.read_bytes(offset, entry_size)
					if len(entry) < entry_size:
						break

					mp_cost = entry[0]
					effect_type = entry[1]
					power = entry[2]
					target = entry[3]

					# Score based on reasonable spell values
					if 0 <= mp_cost <= 50:
						score += 2
					if 0 <= effect_type <= 64:
						score += 1
					if 0 <= power <= 200:
						score += 1
					if 0 <= target <= 8:
						score += 2

					if score > 4:
						valid_entries += 1

				if valid_entries >= 8:
					# Found potential spell table
					self.console.print(f"  [dim]Potential spell table at bank 0x{bank:02x}, offset 0x{scan_start:05x}[/dim]")

					# Extract up to 50 spells
					for i in range(50):
						offset = scan_start + (i * entry_size)
						entry = self.read_bytes(offset, entry_size)
						if len(entry) < entry_size:
							break

						spell = {
							"id": i,
							"rom_offset": f"0x{offset:05x}",
							"mp_cost": entry[0],
							"effect_type": entry[1],
							"power": entry[2],
							"target_type": entry[3],
							"element": entry[4],
							"accuracy": entry[5],
							"flags": (entry[6] << 8) | entry[7],
							"raw_hex": " ".join(f"{b:02x}" for b in entry)
						}
						spells.append(spell)

					return spells  # Return first valid table found

		return spells

	# ========================================================================
	# Text Extraction
	# ========================================================================

	def extract_text(self):
		"""
		Extract all text/dialog from ROM.

		DW4 text is stored in banks 0x0c-0x0e using a custom encoding (TBL).
		Text features:
		- Compressed with DTE (Dual Tile Encoding)
		- Pointer tables for dialog lookup
		- Special control codes for names, line breaks, etc.
		"""
		self.console.print("  [dim]Scanning for text data...[/dim]")

		text_data = {
			"_comment": "Dragon Warrior IV Text Data - Extracted from ROM",
			"_extraction_info": {
				"encoding": "DW4 TBL (custom)",
				"text_banks": [f"0x{b:02x}" for b in TEXT_BANKS],
				"status": "partial_extraction"
			},
			"dialog_blocks": [],
			"pointer_tables": [],
			"string_samples": [],
			"tbl_file": "dw4.tbl"
		}

		# Extract text from each text bank
		for bank in TEXT_BANKS:
			bank_offset = self.bank_to_offset(bank)
			self.console.print(f"  [dim]Scanning text bank 0x{bank:02x}...[/dim]")

			# Find pointer tables (sequences of valid pointers)
			ptr_tables = self._find_pointer_tables(bank, bank_offset)
			for ptr_table in ptr_tables:
				text_data["pointer_tables"].append(ptr_table)

			# Extract readable strings
			strings = self._extract_strings_from_bank(bank, bank_offset)
			text_data["dialog_blocks"].append({
				"bank": f"0x{bank:02x}",
				"strings": strings[:100]  # Limit for now
			})

		# Sample some decoded strings
		for block in text_data["dialog_blocks"]:
			for string_info in block["strings"][:20]:
				sample = {
					"offset": string_info["offset"],
					"decoded": string_info["text"],
					"raw_hex": string_info.get("raw_hex", "")
				}
				text_data["string_samples"].append(sample)

		# Save extracted text
		output_path = self.text_dir / "dialog.json"
		with open(output_path, "w", encoding="utf-8") as f:
			json.dump(text_data, f, indent="\t", ensure_ascii=False)

		# Save TBL file
		self._save_tbl_file()

		# Save raw text dump
		self._save_text_dump(text_data)

		total_strings = sum(len(b["strings"]) for b in text_data["dialog_blocks"])
		self.console.print(f"  [dim]Found {total_strings} text strings[/dim]")

	def _find_pointer_tables(self, bank: int, bank_offset: int) -> List[Dict]:
		"""Find pointer tables within a bank."""
		tables = []

		# Scan for sequences of valid pointers
		for scan_start in range(bank_offset, bank_offset + 0x3f00, 2):
			ptrs = []
			valid_count = 0

			for i in range(16):
				ptr = self.read_word(scan_start + (i * 2))
				if 0x8000 <= ptr < 0xc000:
					valid_count += 1
					ptrs.append(ptr)
				else:
					break

			if valid_count >= 8:
				# Check if pointers are roughly sequential (typical for text)
				if all(ptrs[j] < ptrs[j+1] for j in range(min(4, len(ptrs)-1))):
					table_info = {
						"offset": f"0x{scan_start:05x}",
						"bank": f"0x{bank:02x}",
						"pointers": [f"0x{p:04x}" for p in ptrs[:16]],
						"count": len(ptrs)
					}
					tables.append(table_info)

		return tables

	def _extract_strings_from_bank(self, bank: int, bank_offset: int) -> List[Dict]:
		"""Extract readable strings from a bank."""
		strings = []

		# Scan for sequences of valid TBL characters
		offset = bank_offset
		while offset < bank_offset + 0x3f00:
			# Try to decode a string starting here
			text = []
			raw_bytes = []
			string_start = offset

			for i in range(100):  # Max string length
				byte = self.read_byte(offset + i)
				raw_bytes.append(byte)

				if byte == 0x00 or byte == 0xff:  # Terminators
					break

				char = DW4_TBL.get(byte)
				if char:
					text.append(char)
				elif byte < 0x20:
					# Control code
					text.append(f"[{byte:02x}]")
				else:
					# Unknown - might not be text
					break

			# If we got a reasonable string, save it
			decoded = "".join(text)
			if len(decoded) >= 3 and not decoded.startswith("["):
				# Check if it has mostly valid characters
				valid_chars = sum(1 for c in decoded if c.isalnum() or c in " .,!?'-")
				if valid_chars >= len(decoded) * 0.6:
					strings.append({
						"offset": f"0x{string_start:05x}",
						"length": len(raw_bytes),
						"text": decoded,
						"raw_hex": " ".join(f"{b:02x}" for b in raw_bytes[:20])
					})

			offset += 1

		# Remove duplicates and overlapping strings
		unique_strings = []
		seen_offsets = set()
		for s in sorted(strings, key=lambda x: -len(x["text"])):
			offset_int = int(s["offset"], 16)
			if not any(offset_int >= seen and offset_int < seen + 20 for seen in seen_offsets):
				unique_strings.append(s)
				seen_offsets.add(offset_int)

		return sorted(unique_strings, key=lambda x: x["offset"])

	def _save_tbl_file(self):
		"""Save the TBL (text table) file."""
		tbl_path = self.text_dir / "dw4.tbl"
		with open(tbl_path, "w", encoding="utf-8") as f:
			f.write("# Dragon Warrior IV Text Table\n")
			f.write("# Format: XX=CHAR\n")
			f.write("# Generated by asset_extractor.py\n\n")

			f.write("# Uppercase letters\n")
			for val, char in sorted(DW4_TBL.items()):
				if char.isupper() and len(char) == 1:
					f.write(f"{val:02x}={char}\n")

			f.write("\n# Lowercase letters\n")
			for val, char in sorted(DW4_TBL.items()):
				if char.islower() and len(char) == 1:
					f.write(f"{val:02x}={char}\n")

			f.write("\n# Numbers\n")
			for val, char in sorted(DW4_TBL.items()):
				if char.isdigit():
					f.write(f"{val:02x}={char}\n")

			f.write("\n# Punctuation and symbols\n")
			for val, char in sorted(DW4_TBL.items()):
				if not char.isalnum() and len(char) == 1:
					f.write(f"{val:02x}={char}\n")

			f.write("\n# Control codes\n")
			for val, char in sorted(DW4_TBL.items()):
				if len(char) > 1:
					f.write(f"# {val:02x}={char}\n")

	def _save_text_dump(self, text_data: Dict):
		"""Save a plain text dump of all extracted strings."""
		dump_path = self.text_dir / "dialog_dump.txt"
		with open(dump_path, "w", encoding="utf-8") as f:
			f.write("Dragon Warrior IV - Extracted Dialog\n")
			f.write("=" * 50 + "\n\n")

			for block in text_data["dialog_blocks"]:
				f.write(f"Bank {block['bank']}\n")
				f.write("-" * 30 + "\n")

				for string_info in block["strings"]:
					f.write(f"[{string_info['offset']}] {string_info['text']}\n")

				f.write("\n")

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
def items(rom: str, output: str):
	"""Extract only item data."""
	extractor = AssetExtractor(Path(rom), Path(output))
	extractor.setup_directories()
	if extractor.load_rom():
		extractor.extract_items()
		extractor.console.print("[green]Item extraction complete[/green]")


@cli.command()
@click.option("--rom", "-r", default=str(ROM_PATH), help="Path to ROM file")
@click.option("--output", "-o", default=str(ASSETS_DIR), help="Output directory")
def spells(rom: str, output: str):
	"""Extract only spell data."""
	extractor = AssetExtractor(Path(rom), Path(output))
	extractor.setup_directories()
	if extractor.load_rom():
		extractor.extract_spells()
		extractor.console.print("[green]Spell extraction complete[/green]")


@cli.command()
@click.option("--rom", "-r", default=str(ROM_PATH), help="Path to ROM file")
@click.option("--output", "-o", default=str(ASSETS_DIR), help="Output directory")
def shops(rom: str, output: str):
	"""Extract only shop data."""
	extractor = AssetExtractor(Path(rom), Path(output))
	extractor.setup_directories()
	if extractor.load_rom():
		extractor.extract_shops()
		extractor.console.print("[green]Shop extraction complete[/green]")


@cli.command()
@click.option("--rom", "-r", default=str(ROM_PATH), help="Path to ROM file")
@click.option("--output", "-o", default=str(ASSETS_DIR), help="Output directory")
def exp_tables(rom: str, output: str):
	"""Extract only experience tables."""
	extractor = AssetExtractor(Path(rom), Path(output))
	extractor.setup_directories()
	if extractor.load_rom():
		extractor.extract_exp_tables()
		extractor.console.print("[green]Experience table extraction complete[/green]")


@cli.command()
@click.option("--rom", "-r", default=str(ROM_PATH), help="Path to ROM file")
@click.option("--output", "-o", default=str(ASSETS_DIR), help="Output directory")
def encounters(rom: str, output: str):
	"""Extract only encounter data."""
	extractor = AssetExtractor(Path(rom), Path(output))
	extractor.setup_directories()
	if extractor.load_rom():
		extractor.extract_encounters()
		extractor.console.print("[green]Encounter extraction complete[/green]")


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


@cli.command()
@click.option("--rom", "-r", default=str(ROM_PATH), help="Path to ROM file")
@click.option("--output", "-o", default=str(ASSETS_DIR), help="Output directory")
def text(rom: str, output: str):
	"""Extract only text/dialog data."""
	extractor = AssetExtractor(Path(rom), Path(output))
	extractor.setup_directories()
	if extractor.load_rom():
		extractor.extract_text()
		extractor.console.print("[green]Text extraction complete[/green]")


@cli.command()
@click.option("--rom", "-r", default=str(ROM_PATH), help="Path to ROM file")
@click.option("--bank", "-b", type=int, help="Specific bank to scan")
@click.option("--offset", type=str, help="ROM offset (hex, e.g., 0x10000)")
@click.option("--length", "-l", type=int, default=256, help="Bytes to dump")
def hexdump(rom: str, bank: int, offset: str, length: int):
	"""Dump raw hex data for analysis."""
	extractor = AssetExtractor(Path(rom), Path(ASSETS_DIR))
	if extractor.load_rom():
		if offset:
			start = int(offset, 16)
		elif bank is not None:
			start = extractor.bank_to_offset(bank)
		else:
			start = 16  # Skip header

		data = extractor.read_bytes(start, length)
		extractor.console.print(f"\n[bold]Hex dump at 0x{start:05x} ({length} bytes):[/bold]\n")

		for i in range(0, len(data), 16):
			hex_part = " ".join(f"{b:02x}" for b in data[i:i+16])
			ascii_part = "".join(chr(b) if 32 <= b < 127 else "." for b in data[i:i+16])
			extractor.console.print(f"  {start+i:05x}: {hex_part:<48} {ascii_part}")


@cli.command()
@click.option("--rom", "-r", default=str(ROM_PATH), help="Path to ROM file")
def info(rom: str):
	"""Show ROM information and bank layout."""
	extractor = AssetExtractor(Path(rom), Path(ASSETS_DIR))
	if extractor.load_rom():
		extractor.console.print("\n[bold]ROM Bank Layout:[/bold]")
		extractor.console.print("  Bank 0x00-0x05: Program code (main)")
		extractor.console.print("  Bank 0x06-0x07: Game logic / battle system")
		extractor.console.print(f"  Bank 0x{MONSTER_DATA_BANK:02x}: Data tables (monsters, items, etc.)")
		extractor.console.print(f"  Banks 0x{MAP_BANKS[0]:02x}-0x{MAP_BANKS[-1]:02x}: Map data")
		extractor.console.print(f"  Banks 0x{TEXT_BANKS[0]:02x}-0x{TEXT_BANKS[-1]:02x}: Text/dialog")
		extractor.console.print(f"  Bank 0x{FIXED_BANK:02x}: Fixed bank (always mapped to $C000)")

		extractor.console.print("\n[bold]Known Offsets:[/bold]")
		extractor.console.print(f"  Monster data bank: 0x{MONSTER_DATA_BANK:02x}")
		extractor.console.print(f"  Monster count: {MONSTER_COUNT}")
		extractor.console.print(f"  Text banks: {[f'0x{b:02x}' for b in TEXT_BANKS]}")


if __name__ == "__main__":
	cli()
