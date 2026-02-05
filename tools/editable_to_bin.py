#!/usr/bin/env python3
# ==============================================================================
# editable_to_bin.py - Editable Format to Binary Converter
# ==============================================================================
#
# Part of the Dragon Warrior IV 🌷 Flower Toolchain build pipeline.
#
# Converts edited human-readable formats back to binary for ROM insertion:
#   - JSON → Binary data tables
#   - PNG → CHR graphics
#   - Plain text → Compressed text with TBL encoding
#
# This is the reverse of bin_to_editable.py, completing the round-trip:
#   ROM → Extract → Binary → JSON (edit) → Binary → ROM
#
# Usage:
#   python editable_to_bin.py --input assets/json --output build/binary
#   python editable_to_bin.py --input assets/json/monsters.json --output build/binary/monsters.bin
#
# ==============================================================================

import json
import struct
import argparse
from pathlib import Path
from typing import Dict, List, Any, Optional, Tuple
from dataclasses import dataclass

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
BUILD_DIR = PROJECT_ROOT / "build"


# ==============================================================================
# DW4 Text Table (TBL) for Text Encoding
# ==============================================================================

def load_tbl(tbl_path: Optional[Path] = None) -> Dict[str, int]:
	"""
	Load text table mapping for encoding (reverse of decoding).

	Returns a dictionary mapping characters to byte values.

	Args:
		tbl_path: Optional path to .tbl file

	Returns:
		Dictionary mapping characters to byte values
	"""
	# Default embedded table (reverse of bin_to_editable.py)
	default_tbl = {
		" ": 0x00,
		# Numbers 0-9
		**{str(i): 0x01 + i for i in range(10)},
		# Lowercase a-z
		**{chr(ord('a') + i): 0x0b + i for i in range(26)},
		# Uppercase A-Z
		**{chr(ord('A') + i): 0x25 + i for i in range(26)},
		# Punctuation
		"—": 0x65, """: 0x66, """: 0x67,
		"'": 0x68, "'": 0x69,
		".'": 0x6c, "?": 0x6d, "!": 0x6e, "-": 0x6f,
		"✱": 0x70, ":": 0x71, "…": 0x72,
		"(": 0x75, ")": 0x76, ",": 0x77, ".": 0x78,
		# Special
		"▼": 0x80, "▶": 0x81,
		# Control codes
		"[WAIT]": 0xf0, "[LINE]": 0xf1, "[NAME]": 0xf2,
		"[ITEM]": 0xf3, "[NUM]": 0xf4, "[HERO]": 0xf5,
		"[MONSTER]": 0xf6, "[SPELL]": 0xf7, "[GOLD]": 0xf8,
		"[EXP]": 0xf9, "[LV]": 0xfa, "[HP]": 0xfb,
		"[MP]": 0xfc, "[CLEAR]": 0xfd, "[PAUSE]": 0xfe,
		"[END]": 0xff,
	}

	if tbl_path and tbl_path.exists():
		tbl = {}
		with open(tbl_path, 'r', encoding='utf-8') as f:
			for line in f:
				line = line.strip()
				if '=' in line and not line.startswith('#'):
					hex_val, char = line.split('=', 1)
					try:
						tbl[char] = int(hex_val, 16)
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
	bytes_written: int
	error: Optional[str] = None


def convert_monster_json(
	input_path: Path,
	output_path: Path
) -> ConversionResult:
	"""
	Convert monster JSON back to binary format.

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
		input_path: Path to JSON monster data
		output_path: Path to output binary file

	Returns:
		ConversionResult with status
	"""
	try:
		with open(input_path, 'r', encoding='utf-8') as f:
			data = json.load(f)

		monsters = data.get('monsters', [])
		binary_data = bytearray()

		for monster in monsters:
			# Parse stats (handle both int and hex string formats)
			hp = _parse_int(monster.get('hp', 0))
			mp = _parse_int(monster.get('mp', 0))
			attack = _parse_int(monster.get('attack', 0))
			defense = _parse_int(monster.get('defense', 0))
			agility = _parse_int(monster.get('agility', 0))
			exp = _parse_int(monster.get('exp', 0))
			gold = _parse_int(monster.get('gold', 0))
			flags = _parse_int(monster.get('flags', 0))

			# Pack into 16-byte record
			record = struct.pack('<8H', hp, mp, attack, defense, agility, exp, gold, flags)
			binary_data.extend(record)

		output_path.parent.mkdir(parents=True, exist_ok=True)
		with open(output_path, 'wb') as f:
			f.write(binary_data)

		return ConversionResult(
			success=True,
			input_path=input_path,
			output_path=output_path,
			bytes_written=len(binary_data)
		)

	except Exception as e:
		return ConversionResult(
			success=False,
			input_path=input_path,
			output_path=None,
			bytes_written=0,
			error=str(e)
		)


def convert_item_json(
	input_path: Path,
	output_path: Path
) -> ConversionResult:
	"""
	Convert item JSON back to binary format.

	Item data format (8 bytes per entry):
	  Offset 0x00: Type/category
	  Offset 0x01: Equip flags
	  Offset 0x02: Modifier
	  Offset 0x03: Effect
	  Offset 0x04: Buy price (2 bytes)
	  Offset 0x06: Sell price (2 bytes)

	Args:
		input_path: Path to JSON item data
		output_path: Path to output binary file

	Returns:
		ConversionResult with status
	"""
	try:
		with open(input_path, 'r', encoding='utf-8') as f:
			data = json.load(f)

		items = data.get('items', [])
		binary_data = bytearray()

		for item in items:
			type_raw = _parse_int(item.get('type_raw', 0))
			equip_flags = _parse_int(item.get('equip_flags', 0))
			modifier = _parse_int(item.get('modifier', 0))
			effect = _parse_int(item.get('effect', 0))
			buy_price = _parse_int(item.get('buy_price', 0))
			sell_price = _parse_int(item.get('sell_price', 0))

			# Pack into 8-byte record
			record = struct.pack('<BBBBHH', type_raw, equip_flags, modifier, effect, buy_price, sell_price)
			binary_data.extend(record)

		output_path.parent.mkdir(parents=True, exist_ok=True)
		with open(output_path, 'wb') as f:
			f.write(binary_data)

		return ConversionResult(
			success=True,
			input_path=input_path,
			output_path=output_path,
			bytes_written=len(binary_data)
		)

	except Exception as e:
		return ConversionResult(
			success=False,
			input_path=input_path,
			output_path=None,
			bytes_written=0,
			error=str(e)
		)


def convert_text_json(
	input_path: Path,
	output_path: Path,
	tbl: Dict[str, int]
) -> ConversionResult:
	"""
	Convert text JSON back to binary with TBL encoding.

	Each string is encoded and terminated with 0xFF [END].

	Args:
		input_path: Path to JSON text data
		output_path: Path to output binary file
		tbl: Text table for encoding

	Returns:
		ConversionResult with status
	"""
	try:
		with open(input_path, 'r', encoding='utf-8') as f:
			data = json.load(f)

		strings = data.get('strings', [])
		binary_data = bytearray()

		for string_entry in strings:
			text = string_entry.get('text', '')
			encoded = _encode_text(text, tbl)
			binary_data.extend(encoded)
			binary_data.append(0xff)  # End marker

		output_path.parent.mkdir(parents=True, exist_ok=True)
		with open(output_path, 'wb') as f:
			f.write(binary_data)

		return ConversionResult(
			success=True,
			input_path=input_path,
			output_path=output_path,
			bytes_written=len(binary_data)
		)

	except Exception as e:
		return ConversionResult(
			success=False,
			input_path=input_path,
			output_path=None,
			bytes_written=0,
			error=str(e)
		)


def convert_png_to_chr(
	input_path: Path,
	output_path: Path,
	palette: Optional[List[Tuple[int, int, int]]] = None
) -> ConversionResult:
	"""
	Convert PNG image back to NES CHR graphics format.

	Converts image pixels to 2bpp planar NES tile format.
	Image should be indexed or grayscale with at most 4 colors.

	Args:
		input_path: Path to PNG image
		output_path: Path to output CHR binary
		palette: RGB palette for color mapping

	Returns:
		ConversionResult with status
	"""
	if not HAS_PIL:
		return ConversionResult(
			success=False,
			input_path=input_path,
			output_path=None,
			bytes_written=0,
			error="PIL/Pillow not installed. Run: pip install Pillow"
		)

	try:
		img = Image.open(input_path)
		width, height = img.size

		# Convert to RGB if necessary
		if img.mode != 'RGB':
			img = img.convert('RGB')

		pixels = img.load()

		# Default palette for color matching
		if palette is None:
			palette = [
				(0, 0, 0),       # Color 0: Black
				(85, 85, 85),    # Color 1: Dark gray
				(170, 170, 170), # Color 2: Light gray
				(255, 255, 255), # Color 3: White
			]

		# Calculate number of tiles
		tiles_x = width // 8
		tiles_y = height // 8

		binary_data = bytearray()

		for tile_y in range(tiles_y):
			for tile_x in range(tiles_x):
				# Encode one 8x8 tile
				plane0 = bytearray(8)
				plane1 = bytearray(8)

				for row in range(8):
					byte0 = 0
					byte1 = 0

					for col in range(8):
						px = tile_x * 8 + col
						py = tile_y * 8 + row

						pixel = pixels[px, py]
						color_idx = _find_closest_color(pixel, palette)

						# Set bits for 2bpp planar format
						bit = 7 - col
						if color_idx & 0x01:
							byte0 |= (1 << bit)
						if color_idx & 0x02:
							byte1 |= (1 << bit)

					plane0[row] = byte0
					plane1[row] = byte1

				# Write tile (plane0 then plane1)
				binary_data.extend(plane0)
				binary_data.extend(plane1)

		output_path.parent.mkdir(parents=True, exist_ok=True)
		with open(output_path, 'wb') as f:
			f.write(binary_data)

		return ConversionResult(
			success=True,
			input_path=input_path,
			output_path=output_path,
			bytes_written=len(binary_data)
		)

	except Exception as e:
		return ConversionResult(
			success=False,
			input_path=input_path,
			output_path=None,
			bytes_written=0,
			error=str(e)
		)


def convert_generic_json(
	input_path: Path,
	output_path: Path
) -> ConversionResult:
	"""
	Convert generic JSON hex array back to binary.

	Handles JSON files with 'data' array of hex strings.

	Args:
		input_path: Path to JSON file
		output_path: Path to output binary

	Returns:
		ConversionResult with status
	"""
	try:
		with open(input_path, 'r', encoding='utf-8') as f:
			data = json.load(f)

		hex_data = data.get('data', [])
		binary_data = bytearray()

		# Handle nested arrays (record-based) or flat array
		for item in hex_data:
			if isinstance(item, list):
				# Record: list of hex strings
				for hex_str in item:
					binary_data.append(_parse_int(hex_str))
			else:
				# Single hex value
				binary_data.append(_parse_int(item))

		output_path.parent.mkdir(parents=True, exist_ok=True)
		with open(output_path, 'wb') as f:
			f.write(binary_data)

		return ConversionResult(
			success=True,
			input_path=input_path,
			output_path=output_path,
			bytes_written=len(binary_data)
		)

	except Exception as e:
		return ConversionResult(
			success=False,
			input_path=input_path,
			output_path=None,
			bytes_written=0,
			error=str(e)
		)


# ==============================================================================
# Helper Functions
# ==============================================================================

def _parse_int(value: Any) -> int:
	"""
	Parse an integer from various formats.

	Handles: int, hex string "0x1a", decimal string "26"

	Args:
		value: Value to parse

	Returns:
		Integer value
	"""
	if isinstance(value, int):
		return value
	if isinstance(value, str):
		value = value.strip()
		if value.startswith('0x') or value.startswith('0X'):
			return int(value, 16)
		return int(value)
	return 0


def _encode_text(text: str, tbl: Dict[str, int]) -> bytearray:
	"""
	Encode text string using TBL mapping.

	Handles control codes in [BRACKETS].

	Args:
		text: Text to encode
		tbl: Character to byte mapping

	Returns:
		Encoded bytes
	"""
	result = bytearray()
	i = 0

	while i < len(text):
		# Check for control code [...]
		if text[i] == '[':
			end = text.find(']', i)
			if end > i:
				control = text[i:end+1]
				if control in tbl:
					result.append(tbl[control])
					i = end + 1
					continue

		# Single character
		char = text[i]
		if char in tbl:
			result.append(tbl[char])
		else:
			# Unknown character - try hex literal [XX]
			if char == '[' and i + 3 < len(text) and text[i+3] == ']':
				try:
					hex_val = int(text[i+1:i+3], 16)
					result.append(hex_val)
					i += 4
					continue
				except ValueError:
					pass
			# Fallback: space
			result.append(tbl.get(' ', 0x00))

		i += 1

	return result


def _find_closest_color(
	pixel: Tuple[int, int, int],
	palette: List[Tuple[int, int, int]]
) -> int:
	"""
	Find closest palette color index for a pixel.

	Uses Euclidean distance in RGB space.

	Args:
		pixel: RGB tuple of pixel color
		palette: List of RGB palette colors

	Returns:
		Index of closest palette color
	"""
	min_dist = float('inf')
	best_idx = 0

	for idx, color in enumerate(palette):
		dist = sum((a - b) ** 2 for a, b in zip(pixel, color))
		if dist < min_dist:
			min_dist = dist
			best_idx = idx

	return best_idx


# ==============================================================================
# Main Conversion Dispatcher
# ==============================================================================

def detect_and_convert(
	input_path: Path,
	output_dir: Path,
	tbl: Dict[str, int]
) -> ConversionResult:
	"""
	Detect file type and convert appropriately.

	Args:
		input_path: Path to input file
		output_dir: Directory for output files
		tbl: Text table for encoding

	Returns:
		ConversionResult with status
	"""
	name = input_path.stem.lower()
	suffix = input_path.suffix.lower()

	# PNG to CHR
	if suffix == '.png':
		output_path = output_dir / f"{input_path.stem}.chr"
		return convert_png_to_chr(input_path, output_path)

	# JSON files
	if suffix == '.json':
		# Read JSON to detect type
		try:
			with open(input_path, 'r', encoding='utf-8') as f:
				data = json.load(f)
		except:
			return ConversionResult(
				success=False,
				input_path=input_path,
				output_path=None,
				bytes_written=0,
				error="Invalid JSON file"
			)

		output_path = output_dir / f"{input_path.stem}.bin"

		if 'monsters' in data:
			return convert_monster_json(input_path, output_path)
		elif 'items' in data:
			return convert_item_json(input_path, output_path)
		elif 'strings' in data:
			return convert_text_json(input_path, output_path, tbl)
		else:
			return convert_generic_json(input_path, output_path)

	# Unknown type
	return ConversionResult(
		success=False,
		input_path=input_path,
		output_path=None,
		bytes_written=0,
		error=f"Unknown file type: {suffix}"
	)


def convert_directory(
	input_dir: Path,
	output_dir: Path,
	tbl: Dict[str, int]
) -> List[ConversionResult]:
	"""
	Convert all editable files in a directory.

	Args:
		input_dir: Directory containing editable files
		output_dir: Directory for binary output
		tbl: Text table for encoding

	Returns:
		List of ConversionResults
	"""
	results = []
	editable_extensions = {'.json', '.png'}

	for file_path in input_dir.rglob('*'):
		if file_path.is_file() and file_path.suffix.lower() in editable_extensions:
			# Skip schema files
			if 'schema' in str(file_path).lower():
				continue

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
	"""Main entry point for editable-to-binary conversion."""
	parser = argparse.ArgumentParser(
		description="Convert editable formats back to binary (JSON→bin, PNG→CHR)",
		formatter_class=argparse.RawDescriptionHelpFormatter,
		epilog="""
Examples:
  python editable_to_bin.py --input assets/json --output build/binary
  python editable_to_bin.py --input assets/json/monsters.json --output build/binary/monsters.bin
  python editable_to_bin.py --input assets/graphics/tiles.png --output build/binary/tiles.chr
		"""
	)

	parser.add_argument(
		'--input', '-i',
		type=Path,
		required=True,
		help='Input editable file or directory'
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
		help='Text table file for text encoding'
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
	total_bytes = sum(r.bytes_written for r in results if r.success)

	print(f"\nConversion complete: {success_count} succeeded, {fail_count} failed")
	print(f"Total bytes written: {total_bytes:,}")

	for result in results:
		if args.verbose or not result.success:
			status = "✓" if result.success else "✗"
			print(f"  {status} {result.input_path}")
			if result.error:
				print(f"      Error: {result.error}")
			elif result.output_path:
				print(f"      → {result.output_path} ({result.bytes_written} bytes)")

	return 0 if fail_count == 0 else 1


if __name__ == "__main__":
	exit(main())
