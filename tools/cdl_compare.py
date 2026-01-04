#!/usr/bin/env python3
"""
CDL Comparison Tool - Compare two CDL files to find newly accessed ROM regions.

Usage:
	python cdl_compare.py <base.cdl> <new.cdl> [rom.nes]

This script compares a baseline CDL file with a new CDL file captured during
specific gameplay actions (like casting spells or leveling up) to identify
which ROM regions were newly accessed.
"""

import sys
from pathlib import Path


def load_cdl(path):
	"""Load CDL file, return list of flag bytes."""
	with open(path, 'rb') as f:
		return list(f.read())


def find_new_data(base_cdl, new_cdl, min_consecutive=3):
	"""
	Find regions marked as DATA in new_cdl but not in base_cdl.
	
	Args:
		base_cdl: List of CDL flag bytes from baseline
		new_cdl: List of CDL flag bytes from new capture
		min_consecutive: Minimum consecutive bytes to report
	
	Returns:
		List of region dictionaries with file_offset, bank, cpu_addr, length
	"""
	if len(base_cdl) != len(new_cdl):
		print(f"Warning: CDL sizes differ ({len(base_cdl)} vs {len(new_cdl)})")
	
	new_regions = []
	start = None
	length = 0
	
	for i in range(min(len(base_cdl), len(new_cdl))):
		# Check if newly marked as DATA (bit 1)
		was_data = base_cdl[i] & 2
		is_data = new_cdl[i] & 2
		
		if is_data and not was_data:
			if start is None:
				start = i
				length = 1
			else:
				length += 1
		else:
			if start is not None and length >= min_consecutive:
				bank = (start - 0x10) // 0x4000
				cpu_addr = 0x8000 + ((start - 0x10) % 0x4000)
				new_regions.append({
					'file_offset': start,
					'bank': bank,
					'cpu_addr': cpu_addr,
					'length': length
				})
			start = None
			length = 0
	
	# Don't forget the last region
	if start is not None and length >= min_consecutive:
		bank = (start - 0x10) // 0x4000
		cpu_addr = 0x8000 + ((start - 0x10) % 0x4000)
		new_regions.append({
			'file_offset': start,
			'bank': bank,
			'cpu_addr': cpu_addr,
			'length': length
		})
	
	return new_regions


def find_new_code(base_cdl, new_cdl, min_consecutive=3):
	"""
	Find regions marked as CODE in new_cdl but not in base_cdl.
	"""
	if len(base_cdl) != len(new_cdl):
		print(f"Warning: CDL sizes differ ({len(base_cdl)} vs {len(new_cdl)})")
	
	new_regions = []
	start = None
	length = 0
	
	for i in range(min(len(base_cdl), len(new_cdl))):
		# Check if newly marked as CODE (bit 0)
		was_code = base_cdl[i] & 1
		is_code = new_cdl[i] & 1
		
		if is_code and not was_code:
			if start is None:
				start = i
				length = 1
			else:
				length += 1
		else:
			if start is not None and length >= min_consecutive:
				bank = (start - 0x10) // 0x4000
				cpu_addr = 0x8000 + ((start - 0x10) % 0x4000)
				new_regions.append({
					'file_offset': start,
					'bank': bank,
					'cpu_addr': cpu_addr,
					'length': length
				})
			start = None
			length = 0
	
	if start is not None and length >= min_consecutive:
		bank = (start - 0x10) // 0x4000
		cpu_addr = 0x8000 + ((start - 0x10) % 0x4000)
		new_regions.append({
			'file_offset': start,
			'bank': bank,
			'cpu_addr': cpu_addr,
			'length': length
		})
	
	return new_regions


def main():
	if len(sys.argv) < 3:
		print("CDL Comparison Tool")
		print("Usage: cdl_compare.py <base.cdl> <new.cdl> [rom.nes]")
		print()
		print("Compares two CDL files to find newly accessed ROM regions.")
		print("Useful for identifying data tables accessed during specific actions.")
		sys.exit(1)
	
	base_path = sys.argv[1]
	new_path = sys.argv[2]
	rom_path = sys.argv[3] if len(sys.argv) > 3 else None
	
	print(f"Base CDL: {base_path}")
	print(f"New CDL:  {new_path}")
	if rom_path:
		print(f"ROM:      {rom_path}")
	print()
	
	base_cdl = load_cdl(base_path)
	new_cdl = load_cdl(new_path)
	
	rom_data = None
	if rom_path:
		with open(rom_path, 'rb') as f:
			rom_data = f.read()
	
	# Find new DATA regions
	data_regions = find_new_data(base_cdl, new_cdl)
	
	print(f"{'='*60}")
	print(f"NEW DATA REGIONS ({len(data_regions)} found)")
	print(f"{'='*60}\n")
	
	for r in sorted(data_regions, key=lambda x: -x['length'])[:20]:
		print(f"Bank 0x{r['bank']:02X} ${r['cpu_addr']:04X}: {r['length']} bytes")
		print(f"  File offset: 0x{r['file_offset']:05X}")
		
		if rom_data and r['file_offset'] + 16 <= len(rom_data):
			preview = rom_data[r['file_offset']:r['file_offset']+min(16, r['length'])]
			hex_str = ' '.join(f'{b:02x}' for b in preview)
			print(f"  Preview: {hex_str}")
		print()
	
	# Find new CODE regions
	code_regions = find_new_code(base_cdl, new_cdl)
	
	print(f"{'='*60}")
	print(f"NEW CODE REGIONS ({len(code_regions)} found)")
	print(f"{'='*60}\n")
	
	for r in sorted(code_regions, key=lambda x: -x['length'])[:10]:
		print(f"Bank 0x{r['bank']:02X} ${r['cpu_addr']:04X}: {r['length']} bytes")
		print(f"  File offset: 0x{r['file_offset']:05X}")
		print()
	
	# Summary by bank
	print(f"{'='*60}")
	print("SUMMARY BY BANK")
	print(f"{'='*60}\n")
	
	bank_stats = {}
	for r in data_regions:
		bank = r['bank']
		if bank not in bank_stats:
			bank_stats[bank] = {'data': 0, 'code': 0}
		bank_stats[bank]['data'] += r['length']
	
	for r in code_regions:
		bank = r['bank']
		if bank not in bank_stats:
			bank_stats[bank] = {'data': 0, 'code': 0}
		bank_stats[bank]['code'] += r['length']
	
	for bank in sorted(bank_stats.keys()):
		stats = bank_stats[bank]
		print(f"Bank 0x{bank:02X}: {stats['data']} new data bytes, {stats['code']} new code bytes")


if __name__ == '__main__':
	main()
