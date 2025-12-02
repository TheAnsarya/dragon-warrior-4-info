#!/usr/bin/env python3
"""
JSON to Assembly Converter for Dragon Warrior IV

Converts extracted JSON data files to ca65-compatible assembly source files.
This enables data to be modified and reassembled into a working ROM.

Usage:
    python json_to_asm.py monsters    # Convert monsters.json to monsters.asm
    python json_to_asm.py items       # Convert items.json to items.asm
    python json_to_asm.py all         # Convert all data files
"""

import json
from pathlib import Path
from typing import Dict, List, Any

import click
from rich.console import Console

# Project paths
PROJECT_ROOT = Path(__file__).parent.parent
ASSETS_JSON_DIR = PROJECT_ROOT / "assets" / "json"
SOURCE_DATA_DIR = PROJECT_ROOT / "source_files" / "data"

console = Console()


def format_hex_byte(value: int) -> str:
	"""Format a byte value as hex for assembly."""
	return f"${value:02x}"


def format_hex_word(value: int) -> str:
	"""Format a 16-bit word as hex for assembly."""
	return f"${value:04x}"


def sanitize_label(name: str) -> str:
	"""Convert a name to a valid assembly label."""
	# Replace spaces and special chars with underscores
	label = name.lower()
	label = label.replace(" ", "_")
	label = label.replace("-", "_")
	label = label.replace("'", "")
	label = label.replace(".", "")
	label = label.replace(",", "")
	label = label.replace("!", "")
	label = label.replace("?", "")
	label = label.replace("(", "")
	label = label.replace(")", "")
	# Ensure it starts with a letter
	if label and label[0].isdigit():
		label = "_" + label
	return label


class JsonToAsmConverter:
	"""Converts JSON data to assembly source."""

	def __init__(self):
		self.console = Console()

	def convert_monsters(self, input_path: Path, output_path: Path):
		"""Convert monster data JSON to assembly."""
		self.console.print(f"[cyan]Converting monsters: {input_path}[/cyan]")

		with open(input_path, "r", encoding="utf-8") as f:
			data = json.load(f)

		lines = [
			"; ============================================================================",
			"; Dragon Warrior IV - Monster Data",
			"; ============================================================================",
			"; Generated from monsters.json by json_to_asm.py",
			"; ============================================================================",
			"",
			"; Monster data structure (16 bytes per entry):",
			";   Offset  Size  Description",
			";   $00     2     HP (little endian)",
			";   $02     1     MP",
			";   $03     2     Attack (little endian)",
			";   $05     1     Defense",
			";   $06     1     Agility",
			";   $07     2     Experience (little endian)",
			";   $09     2     Gold (little endian)",
			";   $0b     1     Drop item ID",
			";   $0c     1     Drop rate (1/N)",
			";   $0d     1     Action pattern",
			";   $0e     1     Resistances (bitmask)",
			";   $0f     1     Sprite/palette info",
			"",
			".segment \"PRG_BANK_08\"",
			"",
			"; Monster count",
			f"MONSTER_COUNT = {len(data.get('monsters', []))}",
			"",
			"; Monster stat table",
			"monster_stats_table:",
		]

		monsters = data.get("monsters", [])
		for monster in monsters:
			monster_id = monster.get("id", 0)
			hp = monster.get("hp", 0)
			mp = monster.get("mp", 0)
			attack = monster.get("attack", 0)
			defense = monster.get("defense", 0)
			agility = monster.get("agility", 0)
			exp = monster.get("exp", 0)
			gold = monster.get("gold", 0)
			drop_item = monster.get("drop_item_id", 0)
			drop_rate = monster.get("drop_rate", 0)
			action = monster.get("action_pattern", 0)
			resist = monster.get("resistances", 0)
			sprite = monster.get("sprite_info", 0)

			lines.append(f"")
			lines.append(f"monster_{monster_id:03d}:")
			lines.append(f"\t.word {format_hex_word(hp)}\t\t; HP")
			lines.append(f"\t.byte {format_hex_byte(mp)}\t\t\t; MP")
			lines.append(f"\t.word {format_hex_word(attack)}\t\t; Attack")
			lines.append(f"\t.byte {format_hex_byte(defense)}\t\t\t; Defense")
			lines.append(f"\t.byte {format_hex_byte(agility)}\t\t\t; Agility")
			lines.append(f"\t.word {format_hex_word(exp)}\t\t; Experience")
			lines.append(f"\t.word {format_hex_word(gold)}\t\t; Gold")
			lines.append(f"\t.byte {format_hex_byte(drop_item)}\t\t\t; Drop item ID")
			lines.append(f"\t.byte {format_hex_byte(drop_rate)}\t\t\t; Drop rate (1/N)")
			lines.append(f"\t.byte {format_hex_byte(action)}\t\t\t; Action pattern")
			lines.append(f"\t.byte {format_hex_byte(resist)}\t\t\t; Resistances")
			lines.append(f"\t.byte {format_hex_byte(sprite)}\t\t\t; Sprite info")

		lines.extend([
			"",
			"; ============================================================================",
			"; End of monster data",
			"; ============================================================================",
		])

		output_path.parent.mkdir(parents=True, exist_ok=True)
		with open(output_path, "w", encoding="utf-8") as f:
			f.write("\n".join(lines))

		self.console.print(f"[green]✓ Written {len(monsters)} monsters to {output_path}[/green]")

	def convert_items(self, input_path: Path, output_path: Path):
		"""Convert item data JSON to assembly."""
		self.console.print(f"[cyan]Converting items: {input_path}[/cyan]")

		with open(input_path, "r", encoding="utf-8") as f:
			data = json.load(f)

		lines = [
			"; ============================================================================",
			"; Dragon Warrior IV - Item Data",
			"; ============================================================================",
			"; Generated from items.json by json_to_asm.py",
			"; ============================================================================",
			"",
			"; Item data structure (8 bytes per entry):",
			";   Offset  Size  Description",
			";   $00     2     Price (little endian)",
			";   $02     1     Attack bonus",
			";   $03     1     Defense bonus",
			";   $04     1     Agility bonus (signed)",
			";   $05     1     Equip flags",
			";   $06     1     Effect ID",
			";   $07     1     Item type",
			"",
			".segment \"PRG_BANK_08\"",
			"",
			"; Item count",
			f"ITEM_COUNT = {len(data.get('items', []))}",
			"",
			"; Item stat table",
			"item_stats_table:",
		]

		items = data.get("items", [])
		for item in items:
			item_id = item.get("id", 0)
			price = item.get("price", 0)
			attack = item.get("attack_bonus", 0)
			defense = item.get("defense_bonus", 0)
			agility = item.get("agility_bonus", 0)
			equip = item.get("equip_flags", 0)
			effect = item.get("effect_id", 0)
			item_type = item.get("item_type", 0)

			# Handle signed agility bonus
			if agility < 0:
				agility = 256 + agility

			lines.append(f"")
			lines.append(f"item_{item_id:03d}:")
			lines.append(f"\t.word {format_hex_word(price)}\t\t; Price")
			lines.append(f"\t.byte {format_hex_byte(attack)}\t\t\t; Attack bonus")
			lines.append(f"\t.byte {format_hex_byte(defense)}\t\t\t; Defense bonus")
			lines.append(f"\t.byte {format_hex_byte(agility)}\t\t\t; Agility bonus")
			lines.append(f"\t.byte {format_hex_byte(equip)}\t\t\t; Equip flags")
			lines.append(f"\t.byte {format_hex_byte(effect)}\t\t\t; Effect ID")
			lines.append(f"\t.byte {format_hex_byte(item_type)}\t\t\t; Item type")

		lines.extend([
			"",
			"; ============================================================================",
			"; End of item data",
			"; ============================================================================",
		])

		output_path.parent.mkdir(parents=True, exist_ok=True)
		with open(output_path, "w", encoding="utf-8") as f:
			f.write("\n".join(lines))

		self.console.print(f"[green]✓ Written {len(items)} items to {output_path}[/green]")

	def convert_spells(self, input_path: Path, output_path: Path):
		"""Convert spell data JSON to assembly."""
		self.console.print(f"[cyan]Converting spells: {input_path}[/cyan]")

		with open(input_path, "r", encoding="utf-8") as f:
			data = json.load(f)

		lines = [
			"; ============================================================================",
			"; Dragon Warrior IV - Spell Data",
			"; ============================================================================",
			"; Generated from spells.json by json_to_asm.py",
			"; ============================================================================",
			"",
			"; Spell data structure (8 bytes per entry):",
			";   Offset  Size  Description",
			";   $00     1     MP cost",
			";   $01     1     Effect type",
			";   $02     1     Power/healing amount",
			";   $03     1     Target type",
			";   $04     1     Element",
			";   $05     1     Accuracy",
			";   $06     2     Flags",
			"",
			".segment \"PRG_BANK_08\"",
			"",
			"; Spell count",
			f"SPELL_COUNT = {len(data.get('spells', []))}",
			"",
			"; Spell data table",
			"spell_data_table:",
		]

		spells = data.get("spells", [])
		for spell in spells:
			spell_id = spell.get("id", 0)
			mp_cost = spell.get("mp_cost", 0)
			effect = spell.get("effect_type", 0)
			power = spell.get("power", 0)
			target = spell.get("target_type", 0)
			element = spell.get("element", 0)
			accuracy = spell.get("accuracy", 100)
			flags = spell.get("flags", 0)

			lines.append(f"")
			lines.append(f"spell_{spell_id:03d}:")
			lines.append(f"\t.byte {format_hex_byte(mp_cost)}\t\t\t; MP cost")
			lines.append(f"\t.byte {format_hex_byte(effect)}\t\t\t; Effect type")
			lines.append(f"\t.byte {format_hex_byte(power)}\t\t\t; Power")
			lines.append(f"\t.byte {format_hex_byte(target)}\t\t\t; Target type")
			lines.append(f"\t.byte {format_hex_byte(element)}\t\t\t; Element")
			lines.append(f"\t.byte {format_hex_byte(accuracy)}\t\t\t; Accuracy")
			lines.append(f"\t.word {format_hex_word(flags)}\t\t; Flags")

		lines.extend([
			"",
			"; ============================================================================",
			"; End of spell data",
			"; ============================================================================",
		])

		output_path.parent.mkdir(parents=True, exist_ok=True)
		with open(output_path, "w", encoding="utf-8") as f:
			f.write("\n".join(lines))

		self.console.print(f"[green]✓ Written {len(spells)} spells to {output_path}[/green]")

	def convert_shops(self, input_path: Path, output_path: Path):
		"""Convert shop data JSON to assembly."""
		self.console.print(f"[cyan]Converting shops: {input_path}[/cyan]")

		with open(input_path, "r", encoding="utf-8") as f:
			data = json.load(f)

		lines = [
			"; ============================================================================",
			"; Dragon Warrior IV - Shop Data",
			"; ============================================================================",
			"; Generated from shops.json by json_to_asm.py",
			"; ============================================================================",
			"",
			"; Shop format: List of item IDs terminated by $FF",
			"",
			".segment \"PRG_BANK_08\"",
			"",
		]

		shops = data.get("shops", [])
		lines.append(f"; Shop count")
		lines.append(f"SHOP_COUNT = {len(shops)}")
		lines.append("")

		# Pointer table
		lines.append("; Shop pointer table")
		lines.append("shop_pointer_table:")
		for i, shop in enumerate(shops):
			lines.append(f"\t.word shop_{i:03d}")
		lines.append("")

		# Shop data
		lines.append("; Shop data")
		for i, shop in enumerate(shops):
			item_ids = shop.get("item_ids", [])
			lines.append(f"")
			lines.append(f"shop_{i:03d}:")
			if item_ids:
				items_str = ", ".join(format_hex_byte(item) for item in item_ids)
				lines.append(f"\t.byte {items_str}")
			lines.append(f"\t.byte $ff\t\t\t; End of shop")

		lines.extend([
			"",
			"; ============================================================================",
			"; End of shop data",
			"; ============================================================================",
		])

		output_path.parent.mkdir(parents=True, exist_ok=True)
		with open(output_path, "w", encoding="utf-8") as f:
			f.write("\n".join(lines))

		self.console.print(f"[green]✓ Written {len(shops)} shops to {output_path}[/green]")

	def convert_all(self):
		"""Convert all JSON data files to assembly."""
		conversions = [
			(ASSETS_JSON_DIR / "monsters" / "monsters.json", SOURCE_DATA_DIR / "monsters.asm", self.convert_monsters),
			(ASSETS_JSON_DIR / "items" / "items.json", SOURCE_DATA_DIR / "items.asm", self.convert_items),
			(ASSETS_JSON_DIR / "spells" / "spells.json", SOURCE_DATA_DIR / "spells.asm", self.convert_spells),
			(ASSETS_JSON_DIR / "shops.json", SOURCE_DATA_DIR / "shops.asm", self.convert_shops),
		]

		for input_path, output_path, converter in conversions:
			if input_path.exists():
				converter(input_path, output_path)
			else:
				self.console.print(f"[yellow]⚠ Skipping {input_path.name} (not found)[/yellow]")


@click.group()
def cli():
	"""JSON to Assembly converter for DW4."""
	pass


@cli.command()
def monsters():
	"""Convert monster data to assembly."""
	converter = JsonToAsmConverter()
	input_path = ASSETS_JSON_DIR / "monsters" / "monsters.json"
	output_path = SOURCE_DATA_DIR / "monsters.asm"
	if input_path.exists():
		converter.convert_monsters(input_path, output_path)
	else:
		console.print(f"[red]Error: {input_path} not found[/red]")


@cli.command()
def items():
	"""Convert item data to assembly."""
	converter = JsonToAsmConverter()
	input_path = ASSETS_JSON_DIR / "items" / "items.json"
	output_path = SOURCE_DATA_DIR / "items.asm"
	if input_path.exists():
		converter.convert_items(input_path, output_path)
	else:
		console.print(f"[red]Error: {input_path} not found[/red]")


@cli.command()
def spells():
	"""Convert spell data to assembly."""
	converter = JsonToAsmConverter()
	input_path = ASSETS_JSON_DIR / "spells" / "spells.json"
	output_path = SOURCE_DATA_DIR / "spells.asm"
	if input_path.exists():
		converter.convert_spells(input_path, output_path)
	else:
		console.print(f"[red]Error: {input_path} not found[/red]")


@cli.command()
def shops():
	"""Convert shop data to assembly."""
	converter = JsonToAsmConverter()
	input_path = ASSETS_JSON_DIR / "shops.json"
	output_path = SOURCE_DATA_DIR / "shops.asm"
	if input_path.exists():
		converter.convert_shops(input_path, output_path)
	else:
		console.print(f"[red]Error: {input_path} not found[/red]")


@cli.command()
def all():
	"""Convert all data files to assembly."""
	converter = JsonToAsmConverter()
	converter.convert_all()


if __name__ == "__main__":
	cli()
