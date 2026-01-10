#!/usr/bin/env python3
"""Search for level/EXP access patterns in DW4 ROM."""

import os

def main():
	rom_path = os.path.join(os.path.dirname(__file__), '..', 'roms',
		'Dragon Warrior IV (1992-10)(Enix)(US).nes')

	with open(rom_path, 'rb') as f:
		rom = f.read()[16:]  # Skip header

	print("=" * 60)
	print("Searching for Level/EXP Access Patterns in DW4 ROM")
	print("=" * 60)

	# Character data structure offsets:
	# $05 = Level
	# $10-$12 = Experience (3 bytes, 24-bit)

	offsets_to_check = [0x05, 0x10, 0x11, 0x12]
	offset_names = {0x05: "Level", 0x10: "EXP_Lo", 0x11: "EXP_Mid", 0x12: "EXP_Hi"}

	# Common indirect addressing base pointers
	base_ptrs = [0x88, 0x00, 0x02, 0x0E]

	for offset in offsets_to_check:
		print(f"\n=== Offset ${offset:02X} ({offset_names[offset]}) ===")

		for bank in range(32):
			start = 0x4000 * bank
			bank_data = rom[start:start + 0x4000]

			for i in range(len(bank_data) - 6):
				# Pattern: LDY #$xx followed by instruction using ($yy),Y
				if bank_data[i] == 0xA0 and bank_data[i + 1] == offset:
					# Check next instruction
					next_op = bank_data[i + 2]
					if next_op in [0xB1, 0x91, 0x71, 0xF1]:  # LDA, STA, ADC, SBC indirect,Y
						base = bank_data[i + 3]
						if base in base_ptrs:
							cpu_addr = 0x8000 + i
							ctx = bank_data[i:i + 10].hex()
							ops = {0xB1: "LDA", 0x91: "STA", 0x71: "ADC", 0xF1: "SBC"}
							print(f"  Bank {bank:2d} @ ${cpu_addr:04X}: LDY #${offset:02X}, {ops[next_op]} (${base:02X}),Y ; {ctx}")

	print("\n" + "=" * 60)
	print("Searching for CMP Instructions (Level/EXP Comparison)")
	print("=" * 60)

	# Look for CMP patterns that might be level checks
	# CMP #$xx (C9) or CMP abs (CD) after loading from character data

	for bank in [8, 16, 17, 19, 22]:
		print(f"\nBank {bank}:")
		start = 0x4000 * bank
		bank_data = rom[start:start + 0x4000]

		for i in range(len(bank_data) - 20):
			# Look for LDY #$05, LDA ($88),Y followed by CMP
			if (bank_data[i] == 0xA0 and bank_data[i + 1] == 0x05 and
				bank_data[i + 2] == 0xB1 and bank_data[i + 3] == 0x88):
				# Check for CMP within next 10 bytes
				for j in range(4, 12):
					if i + j < len(bank_data) and bank_data[i + j] in [0xC9, 0xC5, 0xCD]:
						cpu_addr = 0x8000 + i
						ctx = bank_data[i:i + 16].hex()
						print(f"  ${cpu_addr:04X}: Level load + CMP ; {ctx}")
						break

	print("\n" + "=" * 60)
	print("Searching for Level Increment (INC or ADC #$01 after Level)")
	print("=" * 60)

	# Look for code that increments level
	for bank in range(32):
		start = 0x4000 * bank
		bank_data = rom[start:start + 0x4000]

		for i in range(len(bank_data) - 15):
			# LDY #$05, LDA ($88),Y ... CLC, ADC #$01
			if (bank_data[i] == 0xA0 and bank_data[i + 1] == 0x05 and
				bank_data[i + 2] == 0xB1 and bank_data[i + 3] == 0x88):
				# Look for CLC (18) ADC #$01 (69 01) or INC patterns
				for j in range(4, 20):
					if i + j + 2 < len(bank_data):
						# CLC, ADC #$01
						if bank_data[i + j] == 0x18 and bank_data[i + j + 1] == 0x69:
							cpu_addr = 0x8000 + i
							ctx = bank_data[i:i + j + 4].hex()
							print(f"  Bank {bank:2d} @ ${cpu_addr:04X}: Level load + ADC ; {ctx}")
							break
						# INC A (implied) would be 1A on 65C02, but NES is 6502
						# So look for ADC #$01 directly
						if bank_data[i + j] == 0x69 and bank_data[i + j + 1] == 0x01:
							cpu_addr = 0x8000 + i
							ctx = bank_data[i:i + j + 4].hex()
							print(f"  Bank {bank:2d} @ ${cpu_addr:04X}: Level load + ADC #$01 ; {ctx}")
							break

if __name__ == "__main__":
	main()
