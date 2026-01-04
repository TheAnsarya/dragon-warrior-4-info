#!/usr/bin/env python3
"""
Spell Table Analyzer - Analyze CDL to find and verify spell table locations.

Usage:
	python analyze_spell_cdl.py <cdl_file> <rom_file>

This script checks known spell table candidate locations and analyzes
CDL coverage to determine where spell data is actually read from.
"""

import sys
from pathlib import Path


# Known spell table candidates
SPELL_CANDIDATES = [
	(0x0D, 0x9000, "DW4Lib location (8KB bank 13)"),
	(0x05, 0x8000, "Original asset-map (AI/behavior, likely wrong)"),
]

# Expected spell structure (6 bytes per spell)
SPELL_ENTRY_SIZE = 6
SPELL_COUNT = 64
SPELL_TABLE_SIZE = SPELL_ENTRY_SIZE * SPELL_COUNT  # 384 bytes


def load_files(cdl_path, rom_path):
	"""Load CDL and ROM files."""
	with open(cdl_path, 'rb') as f:
		cdl = list(f.read())
	with open(rom_path, 'rb') as f:
		rom = f.read()
	return cdl, rom


def check_candidate(cdl, rom, bank, cpu_addr, description):
	"""Check a spell table candidate location."""
	file_offset = bank * 0x4000 + 0x10 + (cpu_addr - 0x8000)

	print(f"\n{'='*60}")
	print(f"Bank 0x{bank:02X} ${cpu_addr:04X} - {description}")
	print(f"File offset: 0x{file_offset:05X}")
	print(f"{'='*60}")

	# Check if offset is valid
	if file_offset + SPELL_TABLE_SIZE > len(rom):
		print("  ERROR: Offset beyond ROM size")
		return

	# Check CDL coverage
	data_count = 0
	code_count = 0
	for i in range(SPELL_TABLE_SIZE):
		if file_offset + i < len(cdl):
			if cdl[file_offset + i] & 2:
				data_count += 1
			if cdl[file_offset + i] & 1:
				code_count += 1

	data_pct = data_count / SPELL_TABLE_SIZE * 100
	code_pct = code_count / SPELL_TABLE_SIZE * 100

	print(f"\nCDL Coverage (first {SPELL_TABLE_SIZE} bytes):")
	print(f"  DATA: {data_count}/{SPELL_TABLE_SIZE} bytes ({data_pct:.1f}%)")
	print(f"  CODE: {code_count}/{SPELL_TABLE_SIZE} bytes ({code_pct:.1f}%)")

	if code_pct > 50:
		print("  WARNING: High CODE percentage - this is likely executable code, not spell data!")

	# Show first 30 bytes
	print(f"\nFirst 30 bytes:")
	preview = rom[file_offset:file_offset+30]
	print(f"  {' '.join(f'{b:02x}' for b in preview)}")

	# Try to interpret as spell entries
	print(f"\nInterpreted as spell entries ({SPELL_ENTRY_SIZE} bytes each):")
	print(f"  {'ID':>3} | {'Name':>4} | {'MP':>3} | {'Pow':>3} | {'Flags':>5} | {'Eff':>3} | {'Rate':>4}")
	print(f"  {'-'*3}-+-{'-'*4}-+-{'-'*3}-+-{'-'*3}-+-{'-'*5}-+-{'-'*3}-+-{'-'*4}")

	for spell_id in range(8):  # Show first 8 spells
		offset = file_offset + spell_id * SPELL_ENTRY_SIZE
		entry = rom[offset:offset+SPELL_ENTRY_SIZE]
		if len(entry) == SPELL_ENTRY_SIZE:
			name_idx = entry[0]
			mp_cost = entry[1]
			power = entry[2]
			flags = entry[3]
			effect = entry[4]
			rate = entry[5]
			print(f"  {spell_id:3} | {name_idx:4} | {mp_cost:3} | {power:3} | 0x{flags:02x} | {effect:3} | {rate:4}")

	# Validation checks
	print(f"\nValidation:")

	# Check if values look reasonable for spell data
	reasonable = True
	for spell_id in range(SPELL_COUNT):
		offset = file_offset + spell_id * SPELL_ENTRY_SIZE
		entry = rom[offset:offset+SPELL_ENTRY_SIZE]
		if len(entry) == SPELL_ENTRY_SIZE:
			mp_cost = entry[1]
			# Most spells cost 0-30 MP
			if mp_cost > 50 and spell_id < 30:
				reasonable = False

	if reasonable:
		print("  ✓ MP costs appear reasonable (mostly 0-50)")
	else:
		print("  ✗ MP costs seem too high - may not be spell data")

	# Check for diversity in values
	all_bytes = list(rom[file_offset:file_offset+SPELL_TABLE_SIZE])
	unique_count = len(set(all_bytes))
	print(f"  Unique byte values: {unique_count}/256")

	if unique_count < 30:
		print("  ✗ Low diversity - might be sparse/empty data")
	elif unique_count > 200:
		print("  ✗ Very high diversity - might be random/code")
	else:
		print("  ✓ Reasonable diversity for structured data")


def scan_for_spell_patterns(cdl, rom):
	"""Scan for potential spell table patterns in newly accessed DATA regions."""
	print(f"\n{'='*60}")
	print("SCANNING FOR SPELL TABLE PATTERNS")
	print(f"{'='*60}")

	candidates = []

	for bank in range(32):
		bank_offset = bank * 0x4000 + 0x10

		for addr in range(0, 0x4000 - SPELL_TABLE_SIZE, SPELL_ENTRY_SIZE):
			file_offset = bank_offset + addr

			# Check if this region has DATA flags
			if file_offset >= len(cdl) or not (cdl[file_offset] & 2):
				continue

			# Check several entries for spell-like patterns
			valid_entries = 0
			for spell_id in range(10):
				offset = file_offset + spell_id * SPELL_ENTRY_SIZE
				if offset + SPELL_ENTRY_SIZE > len(rom):
					break

				entry = rom[offset:offset+SPELL_ENTRY_SIZE]
				mp_cost = entry[1]
				power = entry[2]

				# Reasonable MP cost (0-30 for most spells)
				# Reasonable power (0-200)
				if mp_cost <= 40 and power <= 200:
					valid_entries += 1

			if valid_entries >= 8:
				cpu_addr = 0x8000 + addr
				candidates.append({
					'bank': bank,
					'cpu_addr': cpu_addr,
					'file_offset': file_offset,
					'valid_entries': valid_entries
				})

	if candidates:
		print(f"\nFound {len(candidates)} potential spell table locations:\n")
		for c in sorted(candidates, key=lambda x: -x['valid_entries'])[:10]:
			print(f"  Bank 0x{c['bank']:02X} ${c['cpu_addr']:04X}: "
				  f"{c['valid_entries']} valid-looking entries")
	else:
		print("\nNo strong spell table candidates found in newly accessed regions.")


def main():
	if len(sys.argv) < 3:
		print("Spell Table Analyzer")
		print("Usage: analyze_spell_cdl.py <cdl_file> <rom_file>")
		print()
		print("Analyzes CDL coverage at known spell table candidates")
		print("and scans for spell-like data patterns.")
		sys.exit(1)

	cdl_path = sys.argv[1]
	rom_path = sys.argv[2]

	print(f"CDL File: {cdl_path}")
	print(f"ROM File: {rom_path}")

	cdl, rom = load_files(cdl_path, rom_path)

	# Check known candidates
	for bank, cpu_addr, desc in SPELL_CANDIDATES:
		check_candidate(cdl, rom, bank, cpu_addr, desc)

	# Scan for other patterns
	scan_for_spell_patterns(cdl, rom)


if __name__ == '__main__':
	main()
