#!/usr/bin/env python3
"""Extract character parameter tables from DW4 ROM."""

import os

def main():
	rom_path = os.path.join(os.path.dirname(__file__), '..', 'roms',
		'Dragon Warrior IV (1992-10)(Enix)(US).nes')
	
	with open(rom_path, 'rb') as f:
		rom = f.read()[16:]  # Skip header
	
	# Bank 8 starts at file offset 0x20000
	bank8_offset = 0x4000 * 8
	
	print("=" * 60)
	print("Character Parameter Tables from Bank 8")
	print("=" * 60)
	
	# Table at $8229 - base parameter pointers
	# Used via: LDA $8229,X / LDY $822A,X where X = char_id * 4 + variant * 2
	offset_8229 = bank8_offset + 0x0229
	print("\n=== tbl_base_params at $8229 ===")
	print("Format: 16-bit pointer indexed by (char_id * 2 + variant) * 2")
	for i in range(6):
		lo = rom[offset_8229 + i * 2]
		hi = rom[offset_8229 + i * 2 + 1]
		ptr = lo | (hi << 8)
		print(f"  Entry {i}: ${ptr:04X} (${lo:02X} ${hi:02X})")
	
	# Table at $8235-$8236 - global base
	offset_8235 = bank8_offset + 0x0235
	print("\n=== tbl_global_base at $8235 ===")
	lo = rom[offset_8235]
	hi = rom[offset_8235 + 1]
	global_base = lo | (hi << 8)
	print(f"  Value: ${global_base:04X} (${lo:02X} ${hi:02X})")
	
	# Table at $8237 - growth data pointers
	# Used via: LDA $8237,X / LDA $8238,X where X = char_id
	offset_8237 = bank8_offset + 0x0237
	print("\n=== tbl_growth_ptr at $8237 ===")
	print("Format: 16-bit pointers, one per character")
	
	# The code does:
	# LDX $09 (char_id)
	# LDA $8237,X -> zp_growth_ptr_lo ($02)
	# LDA $8238,X -> zp_growth_ptr_hi ($03)
	# This is a split table: low bytes at $8237, high bytes at $8238
	
	# Actually looking at the code more carefully:
	# $8167: BD 37 82 = LDA $8237,X
	# $816C: BD 38 82 = LDA $8238,X but with X = same value
	# This means it's NOT split - it's consecutive 2-byte entries
	# Wait, that doesn't make sense either...
	
	# Let me just dump raw bytes
	print("  Raw bytes:")
	raw = rom[offset_8237:offset_8237 + 20]
	print(f"  {raw.hex()}")
	
	# Try interpreting as 10 consecutive pointers
	print("\n  As 10 consecutive 16-bit pointers:")
	for i in range(10):
		lo = rom[offset_8237 + i * 2]
		hi = rom[offset_8237 + i * 2 + 1]
		ptr = lo | (hi << 8)
		print(f"    Char {i}: ${ptr:04X}")
	
	# Try as split low/high table (10 low bytes then 10 high bytes)
	print("\n  As split table (5 low + 5 high):")
	for i in range(5):
		lo = rom[offset_8237 + i]
		hi = rom[offset_8237 + 5 + i]
		ptr = lo | (hi << 8)
		print(f"    Char {i}: ${ptr:04X}")
	
	# Look at the global offset table at $A80D (pointed to by $8235)
	print("\n=== Data at $A80D (pointed by global_base $A80D) ===")
	# This is in Bank 8, so CPU $A80D = file offset 0x20000 + 0x280D
	offset_a80d = bank8_offset + 0x280D
	print(f"  First 32 bytes at file offset ${offset_a80d:05X}:")
	data = rom[offset_a80d:offset_a80d + 32]
	print(f"  {data.hex()}")
	
	# Also look for the EXP coefficients
	# Based on Hero=2*Alena, there should be a coefficient like 2 somewhere
	print("\n=== Looking for EXP multiplier pattern ===")
	# Characters: Hero, Ragnar, Alena, Cristo, Brey, Taloon, Nara, Mara
	# If Alena has coef 1 and Hero has coef 2...
	# Let's look for pattern like [2, x, 1, x, x, x, x, x]
	
	# Check around the growth pointer area
	print("  Bytes around $823D-$8250:")
	for offset in [0x023D, 0x0240, 0x0244, 0x0248]:
		data = rom[bank8_offset + offset:bank8_offset + offset + 8]
		print(f"    ${0x8000+offset:04X}: {data.hex()}")


if __name__ == "__main__":
	main()
