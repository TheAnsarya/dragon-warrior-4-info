#!/usr/bin/env python3
# ==============================================================================
# bin_to_editable.py - Binary to Editable Format Converter
# ==============================================================================
#
# Part of the Dragon Warrior IV 🌷 Flower Toolchain build pipeline.
#
# Converts extracted binary asset data into human-readable/editable formats:
#   - Binary data tables → JSON
#   - CHR graphics → PNG
#   - Compressed text → Plain text with TBL mapping
#
# This enables ROM hackers to edit game data using standard tools, then
# convert back to binary for ROM insertion.
#
# Usage:
#   python bin_to_editable.py --input assets/binary --output assets/json
#   python bin_to_editable.py --input assets/binary/monsters.bin --output assets/json/monsters.json
#
# ==============================================================================

import json
import struct
import argparse
from pathlib import Path
from typing import Dict, List, Any, Optional, Tuple
from dataclasses import dataclass, asdict

# Try importing PIL for graphics conversion
try:
	from PIL import Image
	HAS_PIL = True
except ImportError:
	HAS_PIL = False

# Project paths
PROJECT_ROOT = Path(__file__).parent.parent
ASSETS_DIR = PROJECT_ROOT / "assets"
DATA_DIR = PROJECT_ROOT / "data"


# ==============================================================================
# DW4 Text Table (TBL) for Text Decoding
# ==============================================================================

# Load TBL file if available, otherwise use embedded table
def load_tbl(tbl_path: Optional[Path] = None) -> Dict[int, str]:
	"""
	Load text table mapping from .tbl file or use default.

	The TBL file maps byte values to characters for text decoding.
	Format: XX=char (one per line, XX is hex value)

	Args:
		tbl_path: Optional path to .tbl file

	Returns:
		Dictionary mapping byte values to characters
	"""
	# Default embedded table (from DataCrystal wiki)
	default_tbl = {
		0x00: " ",
		# Numbers 0-9
		**{0x01 + i: str(i) for i in range(10)},
		# Lowercase a-z
		**{0x0b + i: chr(ord('a') + i) for i in range(26)},
		# Uppercase A-Z
		**{0x25 + i: chr(ord('A') + i) for i in range(26)},
		# Punctuation
		0x65: "—", 0x66: """, 0x67: """,
		0x68: "'", 0x69: "'", 0x6a: "'", 0x6b: "'",
		0x6c: ".'", 0x6d: "?", 0x6e: "!", 0x6f: "-",
		0x70: "✱", 0x71: ":", 0x72: "…",
		0x75: "(", 0x76: ")", 0x77: ",", 0x78: ".",
		# Special
		0x80: "▼", 0x81: "▶",
		# Control codes
		0xf0: "[WAIT]", 0xf1: "[LINE]", 0xf2: "[NAME]",
		0xf3: "[ITEM]", 0xf4: "[NUM]", 0xf5: "[HERO]",
		0xf6: "[MONSTER]", 0xf7: "[SPELL]", 0xf8: "[GOLD]",
		0xf9: "[EXP]", 0xfa: "[LV]", 0xfb: "[HP]",
		0xfc: "[MP]", 0xfd: "[CLEAR]", 0xfe: "[PAUSE]",
		0xff: "[END]",
	}

	if tbl_path and tbl_path.exists():
		tbl = {}
		with open(tbl_path, 'r', encoding='utf-8') as f:
			for line in f:
				line = line.strip()
				if '=' in line and not line.startswith('#'):
					hex_val, char = line.split('=', 1)
					try:
						tbl[int(hex_val, 16)] = char
					except ValueError:
						pass
		return tbl if tbl else default_tbl

	return default_tbl


# ==============================================================================
# Data Converters
# ==============================================================================

@dataclass
class ConversionResult:
	"""Result of a conversion operation."""
	success: bool
	input_path: Path
	output_path: Optional[Path]
	records_converted: int
	error: Optional[str] = None


def convert_monster_data(
	input_path: Path,
	output_path: Path,
	tbl: Dict[int, str]
) -> ConversionResult:
	"""
	Convert monster binary data to JSON.

	Monster data format (16 bytes per entry):
	  Offset 0x00: HP (2 bytes, little endian)
	  Offset 0x02: MP (2 bytes)
	  Offset 0x04: Attack (2 bytes)
	  Offset 0x06: Defense (2 bytes)
	  Offset 0x08: Agility (2 bytes)
	  Offset 0x0A: EXP reward (2 bytes)
	  Offset 0x0C: Gold reward (2 bytes)
	  Offset 0x0E: Flags/behavior (2 bytes)

	Args:
		input_path: Path to binary monster data
		output_path: Path to output JSON file
		tbl: Text table for name decoding

	Returns:
		ConversionResult with status
	"""
	try:
		with open(input_path, 'rb') as f:
			data = f.read()

		monsters = []
		entry_size = 16
		count = len(data) // entry_size

		for i in range(count):
			offset = i * entry_size
			entry = data[offset:offset + entry_size]

			if len(entry) < entry_size:
				break

			monster = {
				"id": f"0x{i:02x}",
				"index": i,
				"hp": struct.unpack('<H', entry[0:2])[0],
				"mp": struct.unpack('<H', entry[2:4])[0],
				"attack": struct.unpack('<H', entry[4:6])[0],
				"defense": struct.unpack('<H', entry[6:8])[0],
				"agility": struct.unpack('<H', entry[8:10])[0],
				"exp": struct.unpack('<H', entry[10:12])[0],
				"gold": struct.unpack('<H', entry[12:14])[0],
				"flags": f"0x{struct.unpack('<H', entry[14:16])[0]:04x}",
			}
			monsters.append(monster)

		output = {
			"$schema": "./schemas/monsters.schema.json",
			"version": "1.0.0",
			"source": str(input_path.name),
			"count": len(monsters),
			"monsters": monsters
		}

		output_path.parent.mkdir(parents=True, exist_ok=True)
		with open(output_path, 'w', encoding='utf-8') as f:
			json.dump(output, f, indent='\t', ensure_ascii=False)

		return ConversionResult(
			success=True,
			input_path=input_path,
			output_path=output_path,
			records_converted=len(monsters)
		)

	except Exception as e:
		return ConversionResult(
			success=False,
			input_path=input_path,
			output_path=None,
			records_converted=0,
			error=str(e)
		)


def convert_item_data(
	input_path: Path,
	output_path: Path,
	tbl: Dict[int, str]
) -> ConversionResult:
	"""
	Convert item binary data to JSON.

	Item data format (8 bytes per entry, variable):
	  Offset 0x00: Type/category
	  Offset 0x01: Equip flags (who can equip)
	  Offset 0x02: Attack/Defense modifier
	  Offset 0x03: Special effect
	  Offset 0x04: Buy price (2 bytes)
	  Offset 0x06: Sell price (2 bytes)

	Args:
		input_path: Path to binary item data
		output_path: Path to output JSON file
		tbl: Text table for name decoding

	Returns:
		ConversionResult with status
	"""
	try:
		with open(input_path, 'rb') as f:
			data = f.read()

		items = []
		entry_size = 8
		count = len(data) // entry_size

		# Item type mapping
		item_types = {
			0x00: "weapon",
			0x01: "armor",
			0x02: "shield",
			0x03: "helmet",
			0x04: "accessory",
			0x05: "consumable",
			0x06: "key_item",
		}

		for i in range(count):
			offset = i * entry_size
			entry = data[offset:offset + entry_size]

			if len(entry) < entry_size:
				break

			item_type = entry[0] & 0x0f
			item = {
				"id": f"0x{i:02x}",
				"index": i,
				"type": item_types.get(item_type, "unknown"),
				"type_raw": f"0x{entry[0]:02x}",
				"equip_flags": f"0x{entry[1]:02x}",
				"modifier": entry[2],
				"effect": f"0x{entry[3]:02x}",
				"buy_price": struct.unpack('<H', entry[4:6])[0],
				"sell_price": struct.unpack('<H', entry[6:8])[0],
			}
			items.append(item)

		output = {
			"$schema": "./schemas/items.schema.json",
			"version": "1.0.0",
			"source": str(input_path.name),
			"count": len(items),
			"items": items
		}

		output_path.parent.mkdir(parents=True, exist_ok=True)
		with open(output_path, 'w', encoding='utf-8') as f:
			json.dump(output, f, indent='\t', ensure_ascii=False)

		return ConversionResult(
			success=True,
			input_path=input_path,
			output_path=output_path,
			records_converted=len(items)
		)

	except Exception as e:
		return ConversionResult(
			success=False,
			input_path=input_path,
			output_path=None,
			records_converted=0,
			error=str(e)
		)


def convert_text_data(
	input_path: Path,
	output_path: Path,
	tbl: Dict[int, str]
) -> ConversionResult:
	"""
	Convert compressed text binary data to JSON.

	Text is stored using DTE (Dual Tile Encoding) compression.
	Each string is terminated by 0xFF [END] marker.

	Args:
		input_path: Path to binary text data
		output_path: Path to output JSON file
		tbl: Text table for decoding

	Returns:
		ConversionResult with status
	"""
	try:
		with open(input_path, 'rb') as f:
			data = f.read()

		strings = []
		current_string = []
		offset = 0

		while offset < len(data):
			byte = data[offset]

			if byte == 0xff:  # End of string
				text = ''.join(current_string)
				if text.strip():  # Only add non-empty strings
					strings.append({
						"index": len(strings),
						"offset": f"0x{offset - len(current_string):04x}",
						"text": text,
						"raw_length": len(current_string)
					})
				current_string = []
			else:
				char = tbl.get(byte, f"[{byte:02X}]")
				current_string.append(char)

			offset += 1

		output = {
			"$schema": "./schemas/text.schema.json",
			"version": "1.0.0",
			"source": str(input_path.name),
			"encoding": "dw4_tbl",
			"count": len(strings),
			"strings": strings
		}

		output_path.parent.mkdir(parents=True, exist_ok=True)
		with open(output_path, 'w', encoding='utf-8') as f:
			json.dump(output, f, indent='\t', ensure_ascii=False)

		return ConversionResult(
			success=True,
			input_path=input_path,
			output_path=output_path,
			records_converted=len(strings)
		)

	except Exception as e:
		return ConversionResult(
			success=False,
			input_path=input_path,
			output_path=None,
			records_converted=0,
			error=str(e)
		)


def convert_chr_to_png(
	input_path: Path,
	output_path: Path,
	tile_width: int = 16,
	palette: Optional[List[Tuple[int, int, int]]] = None
) -> ConversionResult:
	"""
	Convert NES CHR graphics data to PNG image.

	NES uses 2bpp (2 bits per pixel) planar graphics.
	Each 8x8 tile is 16 bytes (8 bytes plane 0 + 8 bytes plane 1).

	Args:
		input_path: Path to binary CHR data
		output_path: Path to output PNG file
		tile_width: Number of tiles per row in output image
		palette: RGB palette (4 colors for 2bpp)

	Returns:
		ConversionResult with status
	"""
	if not HAS_PIL:
		return ConversionResult(
			success=False,
			input_path=input_path,
			output_path=None,
			records_converted=0,
			error="PIL/Pillow not installed. Run: pip install Pillow"
		)

	try:
		with open(input_path, 'rb') as f:
			data = f.read()

		# Default NES grayscale palette
		if palette is None:
			palette = [
				(0, 0, 0),       # Color 0: Black
				(85, 85, 85),    # Color 1: Dark gray
				(170, 170, 170), # Color 2: Light gray
				(255, 255, 255), # Color 3: White
			]

		# Calculate dimensions
		tile_size = 16  # 16 bytes per 8x8 tile
		num_tiles = len(data) // tile_size
		if num_tiles == 0:
			raise ValueError("CHR data too small for any tiles")

		tiles_per_row = tile_width
		rows = (num_tiles + tiles_per_row - 1) // tiles_per_row

		img_width = tiles_per_row * 8
		img_height = rows * 8

		# Create image
		img = Image.new('RGB', (img_width, img_height), palette[0])
		pixels = img.load()

		# Decode each tile
		for tile_idx in range(num_tiles):
			tile_offset = tile_idx * tile_size
			tile_data = data[tile_offset:tile_offset + tile_size]

			if len(tile_data) < tile_size:
				break

			# Calculate tile position in image
			tile_x = (tile_idx % tiles_per_row) * 8
			tile_y = (tile_idx // tiles_per_row) * 8

			# Decode 2bpp planar format
			for row in range(8):
				plane0 = tile_data[row]
				plane1 = tile_data[row + 8]

				for col in range(8):
					bit0 = (plane0 >> (7 - col)) & 1
					bit1 = (plane1 >> (7 - col)) & 1
					color_idx = (bit1 << 1) | bit0

					px = tile_x + col
					py = tile_y + row
					if px < img_width and py < img_height:
						pixels[px, py] = palette[color_idx]

		# Save PNG
		output_path.parent.mkdir(parents=True, exist_ok=True)
		img.save(output_path, 'PNG')

		return ConversionResult(
			success=True,
			input_path=input_path,
			output_path=output_path,
			records_converted=num_tiles
		)

	except Exception as e:
		return ConversionResult(
			success=False,
			input_path=input_path,
			output_path=None,
			records_converted=0,
			error=str(e)
		)


def convert_generic_binary(
	input_path: Path,
	output_path: Path,
	record_size: int = 1
) -> ConversionResult:
	"""
	Convert generic binary data to JSON hex dump.

	For unknown data formats, exports as hex array with optional
	record grouping for easier analysis.

	Args:
		input_path: Path to binary data
		output_path: Path to output JSON file
		record_size: Bytes per logical record (1 = byte array)

	Returns:
		ConversionResult with status
	"""
	try:
		with open(input_path, 'rb') as f:
			data = f.read()

		if record_size == 1:
			# Simple byte array
			hex_data = [f"0x{b:02x}" for b in data]
		else:
			# Grouped records
			hex_data = []
			for i in range(0, len(data), record_size):
				record = data[i:i + record_size]
				hex_record = [f"0x{b:02x}" for b in record]
				hex_data.append(hex_record)

		output = {
			"$schema": "./schemas/binary.schema.json",
			"version": "1.0.0",
			"source": str(input_path.name),
			"size": len(data),
			"record_size": record_size,
			"data": hex_data
		}

		output_path.parent.mkdir(parents=True, exist_ok=True)
		with open(output_path, 'w', encoding='utf-8') as f:
			json.dump(output, f, indent='\t', ensure_ascii=False)

		return ConversionResult(
			success=True,
			input_path=input_path,
			output_path=output_path,
			records_converted=len(data) // record_size
		)

	except Exception as e:
		return ConversionResult(
			success=False,
			input_path=input_path,
			output_path=None,
			records_converted=0,
			error=str(e)
		)


# ==============================================================================
# Main Conversion Dispatcher
# ==============================================================================

def detect_and_convert(
	input_path: Path,
	output_dir: Path,
	tbl: Dict[int, str]
) -> ConversionResult:
	"""
	Detect file type and convert appropriately.

	Uses filename patterns to determine the correct converter.

	Args:
		input_path: Path to input binary file
		output_dir: Directory for output files
		tbl: Text table for text decoding

	Returns:
		ConversionResult with status
	"""
	name = input_path.stem.lower()
	suffix = input_path.suffix.lower()

	# Determine output path
	if suffix == '.chr':
		output_path = output_dir / "graphics" / f"{input_path.stem}.png"
		return convert_chr_to_png(input_path, output_path)

	elif 'monster' in name:
		output_path = output_dir / f"{input_path.stem}.json"
		return convert_monster_data(input_path, output_path, tbl)

	elif 'item' in name:
		output_path = output_dir / f"{input_path.stem}.json"
		return convert_item_data(input_path, output_path, tbl)

	elif 'text' in name or 'dialog' in name or 'string' in name:
		output_path = output_dir / f"{input_path.stem}.json"
		return convert_text_data(input_path, output_path, tbl)

	else:
		# Generic binary to JSON
		output_path = output_dir / f"{input_path.stem}.json"
		return convert_generic_binary(input_path, output_path)


def convert_directory(
	input_dir: Path,
	output_dir: Path,
	tbl: Dict[int, str]
) -> List[ConversionResult]:
	"""
	Convert all binary files in a directory.

	Args:
		input_dir: Directory containing binary files
		output_dir: Directory for output files
		tbl: Text table for text decoding

	Returns:
		List of ConversionResults
	"""
	results = []
	binary_extensions = {'.bin', '.chr', '.dat', '.raw'}

	for file_path in input_dir.rglob('*'):
		if file_path.is_file() and file_path.suffix.lower() in binary_extensions:
			# Maintain subdirectory structure
			rel_path = file_path.relative_to(input_dir)
			sub_output_dir = output_dir / rel_path.parent

			result = detect_and_convert(file_path, sub_output_dir, tbl)
			results.append(result)

	return results


# ==============================================================================
# CLI Interface
# ==============================================================================

def main():
	"""Main entry point for binary-to-editable conversion."""
	parser = argparse.ArgumentParser(
		description="Convert binary assets to editable formats (JSON, PNG)",
		formatter_class=argparse.RawDescriptionHelpFormatter,
		epilog="""
Examples:
  python bin_to_editable.py --input assets/binary --output assets/json
  python bin_to_editable.py --input assets/binary/monsters.bin --output assets/json/monsters.json
  python bin_to_editable.py --input assets/binary/chr.bin --output assets/graphics/chr.png
		"""
	)

	parser.add_argument(
		'--input', '-i',
		type=Path,
		required=True,
		help='Input binary file or directory'
	)

	parser.add_argument(
		'--output', '-o',
		type=Path,
		required=True,
		help='Output file or directory'
	)

	parser.add_argument(
		'--tbl',
		type=Path,
		default=DATA_DIR / "dw4.tbl",
		help='Text table file for text decoding'
	)

	parser.add_argument(
		'--verbose', '-v',
		action='store_true',
		help='Show detailed conversion info'
	)

	args = parser.parse_args()

	# Load text table
	tbl = load_tbl(args.tbl)
	print(f"Loaded text table with {len(tbl)} entries")

	# Convert
	if args.input.is_dir():
		print(f"Converting directory: {args.input}")
		results = convert_directory(args.input, args.output, tbl)
	else:
		print(f"Converting file: {args.input}")
		results = [detect_and_convert(args.input, args.output, tbl)]

	# Summary
	success_count = sum(1 for r in results if r.success)
	fail_count = len(results) - success_count

	print(f"\nConversion complete: {success_count} succeeded, {fail_count} failed")

	for result in results:
		if args.verbose or not result.success:
			status = "✓" if result.success else "✗"
			print(f"  {status} {result.input_path}")
			if result.error:
				print(f"      Error: {result.error}")
			elif result.output_path:
				print(f"      → {result.output_path} ({result.records_converted} records)")

	return 0 if fail_count == 0 else 1


if __name__ == "__main__":
	exit(main())
