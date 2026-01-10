#!/usr/bin/env python3
"""Search for level increment and EXP comparison code in DW4 ROM."""

import os

def main():
	rom_path = os.path.join(os.path.dirname(__file__), '..', 'roms',
		'Dragon Warrior IV (1992-10)(Enix)(US).nes')

	with open(rom_path, 'rb') as f:
		rom = f.read()

	rom_data = rom[16:]  # Skip iNES header

	print("=" * 60)
	print("Searching for Level Increment Instructions in DW4 ROM")
	print("=" * 60)
	print()

	# Character level is at offset $05 in character record
	# Character records are in SRAM $6000-$7FFF
	# Level would be at base+5, like $6005, $6105, etc.

	# Look for INC instructions to SRAM addresses
	banks_of_interest = [8, 16, 17, 19, 22]

	for bank in banks_of_interest:
		print(f"\n=== Bank {bank} ===")
		start = 0x4000 * bank
		bank_data = rom_data[start:start + 0x4000]

		found = []
		for i in range(len(bank_data) - 2):
			opcode = bank_data[i]

			# INC absolute = $EE, INC absolute,X = $FE
			if opcode == 0xEE or opcode == 0xFE:
				lo = bank_data[i + 1]
				hi = bank_data[i + 2]
				addr = lo | (hi << 8)

				# Check if it's in SRAM range
				if 0x6000 <= addr <= 0x7FFF:
					cpu_addr = 0x8000 + i
					mode = "" if opcode == 0xEE else ",X"
					# Get context bytes
					ctx_start = max(0, i - 5)
					ctx_end = min(len(bank_data), i + 8)
					ctx = bank_data[ctx_start:ctx_end].hex()
					found.append((cpu_addr, addr, mode, ctx))

		if found:
			for cpu_addr, target, mode, ctx in found:
				print(f"  ${cpu_addr:04X}: INC ${target:04X}{mode}  ; context: {ctx}")
		else:
			print("  (none found)")

	print()
	print("=" * 60)
	print("Searching for 24-bit Comparison Patterns")
	print("=" * 60)
	print()

	# Pattern for 24-bit comparison:
	# - Load accumulator with value
	# - CMP with first byte
	# - Branch or continue
	# - SBC for second byte
	# - SBC for third byte (for 24-bit)

	# Look for CMP followed by SBC patterns in Bank 8
	bank8 = rom_data[0x4000 * 8:0x4000 * 9]

	print("\nBank 8 - CMP/SBC patterns:")
	for i in range(len(bank8) - 10):
		# CMP zeropage = $C5, CMP absolute = $CD
		if bank8[i] in [0xC5, 0xCD, 0xC9]:  # C9 = CMP immediate
			# Look for SBC within next few bytes
			for j in range(3, 10):
				if i + j < len(bank8) and bank8[i + j] in [0xE5, 0xED, 0xE9]:
					# Found CMP followed by SBC
					cpu_addr = 0x8000 + i
					ctx = bank8[i:i + 15].hex()
					print(f"  ${cpu_addr:04X}: {ctx}")
					break

	print()
	print("=" * 60)
	print("Looking for Level-Up Check Pattern")
	print("=" * 60)
	print()

	# The level-up check should:
	# 1. Load current EXP (3 bytes from offset $10-$12)
	# 2. Compare against threshold
	# 3. If EXP >= threshold, increment level

	# Look for LDA (absolute,X) with offset $10 pattern
	# LDA $xxxx,X = $BD

	for bank in [8, 16, 17, 19, 22]:
		print(f"\nBank {bank} - LDA $xxxx,X patterns:")
		start = 0x4000 * bank
		bank_data = rom_data[start:start + 0x4000]

		for i in range(len(bank_data) - 5):
			if bank_data[i] == 0xBD:  # LDA absolute,X
				lo = bank_data[i + 1]
				hi = bank_data[i + 2]
				addr = lo | (hi << 8)

				# Looking for loads from character data offsets
				# $10, $11, $12 are EXP offsets
				# $05 is level offset
				offset = addr & 0xFF
				base = addr & 0xFF00

				if base in [0x6000, 0x6100, 0x6200, 0x6300] and offset in [0x05, 0x10, 0x11, 0x12]:
					cpu_addr = 0x8000 + i
					ctx = bank_data[i:i + 10].hex()
					print(f"  ${cpu_addr:04X}: LDA ${addr:04X},X (offset ${offset:02X}) ; {ctx}")

if __name__ == "__main__":
	main()
