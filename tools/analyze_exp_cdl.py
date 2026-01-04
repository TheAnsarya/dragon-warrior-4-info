#!/usr/bin/env python3
"""
Experience Table Analyzer - Analyze CDL to find experience table locations.

Usage:
	python analyze_exp_cdl.py <cdl_file> <rom_file>

This script searches for ascending sequences that could be experience tables,
focusing on regions newly accessed during level-up gameplay.
"""

import sys
from pathlib import Path


# Known EXP requirements for verification (approximate)
# Source: Various DW4 guides
KNOWN_EXP = {
	'hero': {2: 8, 5: 110, 10: 900, 20: 8000},
	'ragnar': {2: 12, 5: 150, 10: 1100, 20: 9500},
	'alena': {2: 7, 5: 100, 10: 850, 20: 7500},
}

# DW4 has 99 levels max, 8+ characters
MAX_LEVELS = 99
EXPECTED_CHARACTERS = 8


def load_files(cdl_path, rom_path):
	"""Load CDL and ROM files."""
	with open(cdl_path, 'rb') as f:
		cdl = list(f.read())
	with open(rom_path, 'rb') as f:
		rom = f.read()
	return cdl, rom


def read_24bit_le(rom, offset):
	"""Read a 24-bit little-endian value."""
	if offset + 2 >= len(rom):
		return None
	return rom[offset] | (rom[offset+1] << 8) | (rom[offset+2] << 16)


def read_16bit_le(rom, offset):
	"""Read a 16-bit little-endian value."""
	if offset + 1 >= len(rom):
		return None
	return rom[offset] | (rom[offset+1] << 8)


def is_ascending(values, allow_equal=False):
	"""Check if list is strictly ascending."""
	for i in range(len(values) - 1):
		if values[i] is None or values[i+1] is None:
			return False
		if allow_equal:
			if values[i] > values[i+1]:
				return False
		else:
			if values[i] >= values[i+1]:
				return False
	return True


def score_exp_table(values):
	"""
	Score how likely a sequence is to be an experience table.
	Higher score = more likely.
	"""
	if not values or len(values) < 5:
		return 0

	score = 0

	# First value should be small (EXP for level 2)
	if values[0] > 0 and values[0] < 50:
		score += 20
	elif values[0] > 0 and values[0] < 200:
		score += 10

	# Should be ascending
	if is_ascending(values):
		score += 30

	# Should have exponential-ish growth
	if len(values) >= 5:
		growth_rates = []
		for i in range(1, min(10, len(values))):
			if values[i-1] > 0:
				rate = values[i] / values[i-1]
				growth_rates.append(rate)

		if growth_rates:
			avg_rate = sum(growth_rates) / len(growth_rates)
			# EXP tables typically have 1.1x to 1.5x growth per level
			if 1.05 < avg_rate < 1.8:
				score += 25
			elif 1.0 < avg_rate < 2.5:
				score += 10

	# Later values should be large (high level EXP requirements)
	if len(values) >= 20 and values[19] > 5000:
		score += 15

	# Max EXP around 16 million (24-bit max) is reasonable
	max_val = max(v for v in values if v is not None)
	if max_val < 20000000:
		score += 5

	return score


def check_known_candidates(cdl, rom):
	"""Check known candidate locations from prior research."""
	print(f"\n{'='*60}")
	print("CHECKING KNOWN CANDIDATES")
	print(f"{'='*60}")

	candidates = [
		(0x08, 0xA866, "DW4Lib suggestion"),
		(0x08, 0xAB48, "Session 11 research - CDL DATA region"),
		(0x08, 0xADBE, "Session 11 research - ascending sequences"),
	]

	for bank, cpu_addr, desc in candidates:
		file_offset = bank * 0x4000 + 0x10 + (cpu_addr - 0x8000)

		print(f"\nBank 0x{bank:02X} ${cpu_addr:04X} - {desc}")
		print(f"File offset: 0x{file_offset:05X}")

		if file_offset >= len(rom):
			print("  ERROR: Beyond ROM size")
			continue

		# Check CDL coverage
		data_count = 0
		for i in range(150):  # Check 50 levels * 3 bytes
			if file_offset + i < len(cdl) and cdl[file_offset + i] & 2:
				data_count += 1

		print(f"  CDL DATA coverage: {data_count}/150 bytes ({data_count/150*100:.1f}%)")

		# Read as 3-byte values
		print(f"\n  As 3-byte (24-bit) entries:")
		values_3 = []
		for i in range(15):
			val = read_24bit_le(rom, file_offset + i * 3)
			values_3.append(val)

		print(f"    First 15: {values_3}")
		ascending_3 = is_ascending(values_3)
		print(f"    Ascending: {ascending_3}")
		print(f"    Score: {score_exp_table(values_3)}")

		# Read as 2-byte values
		print(f"\n  As 2-byte (16-bit) entries:")
		values_2 = []
		for i in range(15):
			val = read_16bit_le(rom, file_offset + i * 2)
			values_2.append(val)

		print(f"    First 15: {values_2}")
		ascending_2 = is_ascending(values_2)
		print(f"    Ascending: {ascending_2}")
		print(f"    Score: {score_exp_table(values_2)}")


def scan_for_exp_tables(cdl, rom, min_score=50):
	"""Scan for experience table patterns in DATA regions."""
	print(f"\n{'='*60}")
	print("SCANNING FOR EXPERIENCE TABLE PATTERNS")
	print(f"{'='*60}")

	candidates = []

	for bank in range(32):
		bank_offset = bank * 0x4000 + 0x10

		# Try 3-byte entries
		for addr in range(0, 0x4000 - 150, 1):
			file_offset = bank_offset + addr

			if file_offset >= len(cdl) or not (cdl[file_offset] & 2):
				continue

			values = []
			for i in range(30):
				val = read_24bit_le(rom, file_offset + i * 3)
				if val is not None:
					values.append(val)

			if len(values) >= 20:
				score = score_exp_table(values)
				if score >= min_score:
					cpu_addr = 0x8000 + addr
					candidates.append({
						'bank': bank,
						'cpu_addr': cpu_addr,
						'file_offset': file_offset,
						'entry_size': 3,
						'score': score,
						'first_values': values[:5]
					})

		# Try 2-byte entries
		for addr in range(0, 0x4000 - 100, 1):
			file_offset = bank_offset + addr

			if file_offset >= len(cdl) or not (cdl[file_offset] & 2):
				continue

			values = []
			for i in range(30):
				val = read_16bit_le(rom, file_offset + i * 2)
				if val is not None:
					values.append(val)

			if len(values) >= 20:
				score = score_exp_table(values)
				if score >= min_score:
					cpu_addr = 0x8000 + addr
					candidates.append({
						'bank': bank,
						'cpu_addr': cpu_addr,
						'file_offset': file_offset,
						'entry_size': 2,
						'score': score,
						'first_values': values[:5]
					})

	# Remove duplicates (overlapping addresses)
	seen = set()
	unique_candidates = []
	for c in sorted(candidates, key=lambda x: -x['score']):
		key = (c['bank'], c['cpu_addr'] // 10)  # Group by ~10 byte regions
		if key not in seen:
			seen.add(key)
			unique_candidates.append(c)

	print(f"\nFound {len(unique_candidates)} potential EXP table locations (score >= {min_score}):\n")

	for c in unique_candidates[:15]:
		print(f"  Bank 0x{c['bank']:02X} ${c['cpu_addr']:04X} ({c['entry_size']}-byte entries)")
		print(f"    Score: {c['score']}")
		print(f"    First 5 values: {c['first_values']}")
		print()

	return unique_candidates


def verify_against_known(candidates, rom):
	"""Try to match candidates against known EXP values."""
	print(f"\n{'='*60}")
	print("VERIFYING AGAINST KNOWN EXP VALUES")
	print(f"{'='*60}")

	for char_name, exp_data in KNOWN_EXP.items():
		print(f"\n{char_name.upper()}:")
		print(f"  Known: Level 2={exp_data[2]}, Level 5={exp_data[5]}, "
			  f"Level 10={exp_data[10]}, Level 20={exp_data[20]}")

		for c in candidates[:10]:
			file_offset = c['file_offset']
			entry_size = c['entry_size']

			# Read values at expected level positions
			# Level N is at index N-2 (since table starts at level 2)
			if entry_size == 3:
				lv2 = read_24bit_le(rom, file_offset + 0 * 3)
				lv5 = read_24bit_le(rom, file_offset + 3 * 3)
				lv10 = read_24bit_le(rom, file_offset + 8 * 3)
				lv20 = read_24bit_le(rom, file_offset + 18 * 3)
			else:
				lv2 = read_16bit_le(rom, file_offset + 0 * 2)
				lv5 = read_16bit_le(rom, file_offset + 3 * 2)
				lv10 = read_16bit_le(rom, file_offset + 8 * 2)
				lv20 = read_16bit_le(rom, file_offset + 18 * 2)

			# Check if close to known values (within 20%)
			matches = 0
			for known_lv, known_exp in exp_data.items():
				if known_lv == 2 and lv2 and abs(lv2 - known_exp) / known_exp < 0.2:
					matches += 1
				if known_lv == 5 and lv5 and abs(lv5 - known_exp) / known_exp < 0.2:
					matches += 1
				if known_lv == 10 and lv10 and abs(lv10 - known_exp) / known_exp < 0.2:
					matches += 1
				if known_lv == 20 and lv20 and abs(lv20 - known_exp) / known_exp < 0.2:
					matches += 1

			if matches >= 2:
				print(f"  POSSIBLE MATCH: Bank 0x{c['bank']:02X} ${c['cpu_addr']:04X}")
				print(f"    Table values: Lv2={lv2}, Lv5={lv5}, Lv10={lv10}, Lv20={lv20}")
				print(f"    Matches: {matches}/4 known values")


def main():
	if len(sys.argv) < 3:
		print("Experience Table Analyzer")
		print("Usage: analyze_exp_cdl.py <cdl_file> <rom_file>")
		print()
		print("Searches for experience table patterns in CDL DATA regions")
		print("and attempts to verify against known EXP requirements.")
		sys.exit(1)

	cdl_path = sys.argv[1]
	rom_path = sys.argv[2]

	print(f"CDL File: {cdl_path}")
	print(f"ROM File: {rom_path}")

	cdl, rom = load_files(cdl_path, rom_path)

	# Check known candidates
	check_known_candidates(cdl, rom)

	# Scan for patterns
	candidates = scan_for_exp_tables(cdl, rom)

	# Verify against known values
	if candidates:
		verify_against_known(candidates, rom)


if __name__ == '__main__':
	main()
