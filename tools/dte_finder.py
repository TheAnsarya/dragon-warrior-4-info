#!/usr/bin/env python3
"""
DTE (Dual Tile Encoding) Finder for Dragon Warrior IV

This tool searches for the DTE lookup table in the ROM.
DTE is a compression technique where codes $82-$EF represent pairs of characters.

How DTE works:
1. Text banks contain mixed raw characters and DTE codes
2. Raw characters ($00-$81, and some punctuation) are displayed directly
3. DTE codes ($82-$EF) are 1-byte codes that expand to 2 characters
4. The DTE table contains 110 pairs (110 codes from $82-$EF)
5. Each DTE entry is 2 bytes - the two character codes that the DTE code expands to

Finding the DTE table:
- It's typically in or near the text banks ($0C-$0E)
- It should be 220 bytes (110 pairs × 2 bytes)
- Entries should mostly contain valid TBL character codes
- Common pairs are things like "th", "he", "in", "er", etc.

This tool will:
1. Scan text banks for candidate DTE tables
2. Score candidates based on valid character codes
3. Extract and display the best candidate
"""

import sys
from pathlib import Path
from collections import Counter

# Project paths
TOOLS_DIR = Path(__file__).parent
PROJECT_ROOT = TOOLS_DIR.parent
ROM_DIR = PROJECT_ROOT / "roms"
ASSETS_DIR = PROJECT_ROOT / "assets"
ROM_PATH = ROM_DIR / "Dragon Warrior IV (1992-10)(Enix)(US).nes"

# ROM constants
HEADER_SIZE = 16
PRG_BANK_SIZE = 0x4000  # 16 KB

# DW4 character set - valid TBL codes
DW4_TBL = {
	0x00: " ",
	0x01: "0", 0x02: "1", 0x03: "2", 0x04: "3", 0x05: "4",
	0x06: "5", 0x07: "6", 0x08: "7", 0x09: "8", 0x0a: "9",
	0x0b: "a", 0x0c: "b", 0x0d: "c", 0x0e: "d", 0x0f: "e",
	0x10: "f", 0x11: "g", 0x12: "h", 0x13: "i", 0x14: "j",
	0x15: "k", 0x16: "l", 0x17: "m", 0x18: "n", 0x19: "o",
	0x1a: "p", 0x1b: "q", 0x1c: "r", 0x1d: "s", 0x1e: "t",
	0x1f: "u", 0x20: "v", 0x21: "w", 0x22: "x", 0x23: "y",
	0x24: "z",
	0x25: "A", 0x26: "B", 0x27: "C", 0x28: "D", 0x29: "E",
	0x2a: "F", 0x2b: "G", 0x2c: "H", 0x2d: "I", 0x2e: "J",
	0x2f: "K", 0x30: "L", 0x31: "M", 0x32: "N", 0x33: "O",
	0x34: "P", 0x35: "Q", 0x36: "R", 0x37: "S", 0x38: "T",
	0x39: "U", 0x3a: "V", 0x3b: "W", 0x3c: "X", 0x3d: "Y",
	0x3e: "Z",
	# Punctuation
	0x65: "—", 0x66: ",", 0x67: ".", 0x68: "'", 0x69: "'",
	0x6a: "'", 0x6b: "'", 0x6c: ".'", 0x6d: "?", 0x6e: "!",
	0x6f: "-", 0x70: "✱", 0x71: ":", 0x72: "…", 0x73: "†",
	0x74: "☠", 0x75: "(", 0x76: ")", 0x77: ",", 0x78: ".",
	0x79: "「",
	# Special
	0x80: "▼", 0x81: "▶",
}

# Valid character codes for DTE pairs
VALID_TBL_CODES = set(DW4_TBL.keys())

# Text banks in DW4
TEXT_BANKS = [0x0c, 0x0d, 0x0e]

# DTE range
DTE_START = 0x82
DTE_END = 0xef
DTE_COUNT = DTE_END - DTE_START + 1  # 110 codes


def bank_to_offset(bank: int, addr: int = 0x8000) -> int:
	"""Convert PRG bank number to ROM file offset."""
	return HEADER_SIZE + (bank * PRG_BANK_SIZE) + (addr - 0x8000)


def is_valid_dte_byte(byte: int) -> bool:
	"""Check if a byte is a valid character for DTE pair."""
	# Most DTE pairs are lowercase letters, space, or common punctuation
	return byte in VALID_TBL_CODES


def score_dte_table(data: bytes) -> tuple:
	"""
	Score a potential DTE table.

	Returns (score, valid_count, letter_pairs, description)
	"""
	if len(data) < DTE_COUNT * 2:
		return (0, 0, 0, "Too short")

	valid_count = 0
	letter_pairs = 0
	lowercase_count = 0
	space_count = 0

	for i in range(DTE_COUNT):
		byte1 = data[i * 2]
		byte2 = data[i * 2 + 1]

		if is_valid_dte_byte(byte1) and is_valid_dte_byte(byte2):
			valid_count += 1

			# Extra points for letter pairs (common in DTE)
			if 0x0b <= byte1 <= 0x24 and 0x0b <= byte2 <= 0x24:
				letter_pairs += 1
				lowercase_count += 1
			elif 0x0b <= byte1 <= 0x24 or 0x0b <= byte2 <= 0x24:
				lowercase_count += 1

			if byte1 == 0x00 or byte2 == 0x00:
				space_count += 1

	# Scoring:
	# - Base score from valid pairs
	# - Bonus for letter pairs (common in DTE)
	# - Bonus for having some space pairs (like "e ", " t")
	score = valid_count * 10
	score += letter_pairs * 5
	if 5 <= space_count <= 30:  # Some space pairs is expected
		score += space_count * 2

	description = f"{valid_count}/{DTE_COUNT} valid, {letter_pairs} letter pairs, {space_count} space pairs"

	return (score, valid_count, letter_pairs, description)


def decode_dte_pair(byte1: int, byte2: int) -> str:
	"""Decode a DTE pair to its string representation."""
	char1 = DW4_TBL.get(byte1, f"[${byte1:02x}]")
	char2 = DW4_TBL.get(byte2, f"[${byte2:02x}]")
	return char1 + char2


def find_dte_tables(rom_data: bytes) -> list:
	"""Find candidate DTE tables in the ROM."""
	candidates = []

	# Search in text banks and nearby
	search_banks = TEXT_BANKS + [0x0b, 0x0f]

	for bank in search_banks:
		bank_start = bank_to_offset(bank)
		bank_end = bank_start + PRG_BANK_SIZE

		print(f"Searching bank ${bank:02x} (ROM offset ${bank_start:05x}-${bank_end:05x})...")

		# Scan every offset in the bank
		for offset in range(bank_start, bank_end - DTE_COUNT * 2, 2):
			data = rom_data[offset:offset + DTE_COUNT * 2]
			score, valid_count, letter_pairs, desc = score_dte_table(data)

			# Keep candidates with high valid percentage
			if valid_count >= DTE_COUNT * 0.7:  # At least 70% valid
				candidates.append({
					"offset": offset,
					"bank": bank,
					"cpu_addr": 0x8000 + (offset - bank_start),
					"score": score,
					"valid_count": valid_count,
					"letter_pairs": letter_pairs,
					"description": desc,
					"data": data
				})

	# Sort by score (highest first)
	candidates.sort(key=lambda x: x["score"], reverse=True)

	return candidates


def analyze_dte_table(candidate: dict) -> dict:
	"""Analyze a DTE table candidate in detail."""
	data = candidate["data"]
	pairs = []
	pair_freq = Counter()

	for i in range(DTE_COUNT):
		byte1 = data[i * 2]
		byte2 = data[i * 2 + 1]
		code = DTE_START + i

		decoded = decode_dte_pair(byte1, byte2)
		pairs.append({
			"code": f"${code:02x}",
			"byte1": f"${byte1:02x}",
			"byte2": f"${byte2:02x}",
			"decoded": decoded
		})
		pair_freq[decoded] += 1

	# Get most common pairs
	common_pairs = pair_freq.most_common(20)

	return {
		"pairs": pairs,
		"common_pairs": common_pairs,
		"total_unique": len(pair_freq)
	}


def main():
	"""Main entry point."""
	import json

	print("=" * 60)
	print("Dragon Warrior IV - DTE Table Finder")
	print("=" * 60)
	print()

	# Load ROM
	if not ROM_PATH.exists():
		print(f"Error: ROM not found at {ROM_PATH}")
		return 1

	print(f"Loading ROM: {ROM_PATH}")
	with open(ROM_PATH, "rb") as f:
		rom_data = f.read()

	print(f"ROM size: {len(rom_data):,} bytes")
	print()

	# Find DTE tables
	print("Searching for DTE tables...")
	print()

	candidates = find_dte_tables(rom_data)

	if not candidates:
		print("No DTE table candidates found!")
		return 1

	print(f"Found {len(candidates)} candidates")
	print()

	# Show top candidates
	print("Top 10 candidates:")
	print("-" * 60)
	for i, cand in enumerate(candidates[:10]):
		print(f"{i+1}. Bank ${cand['bank']:02x}, Offset ${cand['offset']:05x}, CPU ${cand['cpu_addr']:04x}")
		print(f"   Score: {cand['score']}, {cand['description']}")
		print()

	# Analyze best candidate
	if candidates:
		best = candidates[0]
		print("=" * 60)
		print("Best candidate analysis:")
		print("=" * 60)
		print(f"Bank: ${best['bank']:02x}")
		print(f"ROM Offset: ${best['offset']:05x}")
		print(f"CPU Address: ${best['cpu_addr']:04x}")
		print()

		analysis = analyze_dte_table(best)

		print("DTE Pairs:")
		print("-" * 40)
		for i, pair in enumerate(analysis["pairs"]):
			# Print in columns
			if i % 4 == 0:
				print()
			print(f"  {pair['code']}=\"{pair['decoded']:4s}\"", end="")
		print()
		print()

		# Save results
		output_dir = ASSETS_DIR / "text"
		output_dir.mkdir(parents=True, exist_ok=True)

		# Save DTE table as JSON
		dte_output = {
			"_comment": "Dragon Warrior IV DTE (Dual Tile Encoding) Table",
			"rom_offset": f"${best['offset']:05x}",
			"bank": f"${best['bank']:02x}",
			"cpu_address": f"${best['cpu_addr']:04x}",
			"score": best["score"],
			"description": best["description"],
			"pairs": analysis["pairs"]
		}

		dte_path = output_dir / "dte_table.json"
		with open(dte_path, "w", encoding="utf-8") as f:
			json.dump(dte_output, f, indent="\t", ensure_ascii=False)
		print(f"Saved DTE table to: {dte_path}")

		# Update TBL file with DTE codes
		update_tbl_with_dte(output_dir / "dw4.tbl", analysis["pairs"])

	return 0


def update_tbl_with_dte(tbl_path: Path, pairs: list):
	"""Update the TBL file with DTE codes."""
	# Read existing TBL file
	if tbl_path.exists():
		with open(tbl_path, "r", encoding="utf-8") as f:
			content = f.read()
	else:
		content = ""

	# Check if DTE section already exists
	if "# DTE Pairs" in content and "82=" in content:
		print(f"TBL file already has DTE codes")
		return

	# Add DTE pairs to TBL
	dte_section = "\n# ============================================\n"
	dte_section += "# DTE (Dual Tile Encoding) Pairs ($82-$EF)\n"
	dte_section += "# Each code expands to two characters\n"
	dte_section += "# ============================================\n"

	for pair in pairs:
		code_val = int(pair["code"][1:], 16)  # Remove $ and convert
		decoded = pair["decoded"]
		# Escape special characters for TBL format
		if decoded:
			dte_section += f"{code_val:02x}={decoded}\n"

	# Insert before the existing DTE comment section if present
	if "# DTE (Dual Tile Encoding) Codes" in content:
		# Replace the placeholder section
		import re
		pattern = r"# ============================================\n# DTE \(Dual Tile Encoding\) Codes.*$"
		content = re.sub(pattern, dte_section.strip(), content, flags=re.DOTALL)
	else:
		# Append to end
		content += dte_section

	with open(tbl_path, "w", encoding="utf-8") as f:
		f.write(content)

	print(f"Updated TBL file with DTE codes: {tbl_path}")


if __name__ == "__main__":
	sys.exit(main())
