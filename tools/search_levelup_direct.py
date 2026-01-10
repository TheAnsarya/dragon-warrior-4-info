#!/usr/bin/env python3
"""Search for level-up code in DW4 ROM using character addresses."""

import os

def main():
	rom_path = os.path.join(os.path.dirname(__file__), '..', 'roms',
		'Dragon Warrior IV (1992-10)(Enix)(US).nes')

	with open(rom_path, 'rb') as f:
		rom = f.read()[16:]

	# Character data at $7600 + char_id * $3A
	# Level at offset $05
	# EXP at offset $10-$12

	# Look for code that uses these RAM addresses directly
	# Hero's level: $7605, EXP: $7610-$7612

	print("=" * 60)
	print("Searching for Direct Character Address Access")
	print("=" * 60)

	# Level addresses for each character
	level_addrs = [0x7605 + i * 0x3A for i in range(8)]
	exp_lo_addrs = [0x7610 + i * 0x3A for i in range(8)]

	# Search for LDA/STA/INC to these addresses
	for addr in level_addrs[:3]:  # Just first 3 chars
		lo = addr & 0xFF
		hi = (addr >> 8) & 0xFF

		print(f"\n--- Level address ${addr:04X} ---")

		for bank in range(32):
			start = 0x4000 * bank
			bank_data = rom[start:start + 0x4000]

			for i in range(len(bank_data) - 3):
				# LDA absolute = AD, STA absolute = 8D, INC absolute = EE
				if bank_data[i] in [0xAD, 0x8D, 0xEE]:
					if bank_data[i + 1] == lo and bank_data[i + 2] == hi:
						cpu_addr = 0x8000 + i
						ctx = bank_data[max(0, i-3):i+6].hex()
						ops = {0xAD: "LDA", 0x8D: "STA", 0xEE: "INC"}
						print(f"  Bank {bank:2d} @ ${cpu_addr:04X}: {ops[bank_data[i]]} ${addr:04X} ; {ctx}")

	print("\n" + "=" * 60)
	print("Searching for EXP Address Access (Hero)")
	print("=" * 60)

	# Hero's EXP: $7610-$7612
	for exp_offset in [0x7610, 0x7611, 0x7612]:
		lo = exp_offset & 0xFF
		hi = (exp_offset >> 8) & 0xFF

		print(f"\n--- EXP byte at ${exp_offset:04X} ---")

		for bank in range(32):
			start = 0x4000 * bank
			bank_data = rom[start:start + 0x4000]

			for i in range(len(bank_data) - 3):
				if bank_data[i] in [0xAD, 0x8D]:  # LDA/STA absolute
					if bank_data[i + 1] == lo and bank_data[i + 2] == hi:
						cpu_addr = 0x8000 + i
						ctx = bank_data[max(0, i-3):i+6].hex()
						ops = {0xAD: "LDA", 0x8D: "STA"}
						print(f"  Bank {bank:2d} @ ${cpu_addr:04X}: {ops[bank_data[i]]} ${exp_offset:04X} ; {ctx}")

	print("\n" + "=" * 60)
	print("Searching for CMP with Experience Check Pattern")
	print("=" * 60)

	# Look for 24-bit comparison pattern in common banks
	# Pattern: LDA exp_lo, CMP threshold_lo, LDA exp_mid, SBC threshold_mid, etc.

	for bank in [8, 16, 17, 19, 22, 31]:
		start = 0x4000 * bank
		if bank == 31:
			start = 0x4000 * 28  # Last 4 banks are fixed
		bank_data = rom[start:start + 0x4000]

		found_patterns = []
		for i in range(len(bank_data) - 15):
			# Look for sequence: CMP followed by BCC/BCS, then another CMP/SBC
			if bank_data[i] in [0xC9, 0xC5, 0xCD]:  # CMP immediate/zp/abs
				# Check for branch
				next_idx = i + 2 if bank_data[i] == 0xC9 else i + 2 if bank_data[i] == 0xC5 else i + 3
				if next_idx < len(bank_data) and bank_data[next_idx] in [0x90, 0xB0, 0xD0, 0xF0]:  # Branch
					# Check for another comparison
					for j in range(3, 10):
						check_idx = next_idx + j
						if check_idx < len(bank_data) and bank_data[check_idx] in [0xE9, 0xE5, 0xED]:  # SBC
							cpu_addr = 0x8000 + i
							ctx = bank_data[i:min(i+20, len(bank_data))].hex()
							found_patterns.append(f"  Bank {bank:2d} @ ${cpu_addr:04X}: {ctx[:40]}")
							break

		if found_patterns:
			print(f"\nBank {bank}:")
			for p in found_patterns[:5]:  # Limit output
				print(p)

if __name__ == "__main__":
	main()
