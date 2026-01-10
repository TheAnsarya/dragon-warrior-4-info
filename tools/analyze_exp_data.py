#!/usr/bin/env python3
"""
Analyze Dragon Warrior IV ROM data for EXP calculation clues.
"""

def main():
	# Read DW4 ROM
	rom_path = r'c:\Users\me\source\repos\dragon-warrior-4-info\roms\Dragon Warrior IV (1992-10)(Enix)(US).nes'
	with open(rom_path, 'rb') as f:
		rom = f.read()

	header_size = 16

	# Bank 8 is at file offset 0x20000 (bank * 0x4000 = 8 * 0x4000)
	bank8_offset = header_size + (8 * 0x4000)
	print(f'Bank 8 base: file offset 0x{bank8_offset:05x}')
	print()

	# Read data at $A866 which was mentioned in docs
	addr_offset = 0x2866  # A866 - 8000
	file_offset = bank8_offset + addr_offset
	print(f'Data at $A866 (file offset 0x{file_offset:05x}):')
	data = rom[file_offset:file_offset+64]
	for i in range(0, len(data), 16):
		hex_part = ' '.join(f'{b:02x}' for b in data[i:i+16])
		addr = 0xA866 + i
		print(f'  ${addr:04x}: {hex_part}')

	# Data tables at $8225-$8241
	tbl_offset = bank8_offset + 0x225
	print(f'\nData at $8225 (tables):')
	tbl_data = rom[tbl_offset:tbl_offset+32]
	for i in range(0, len(tbl_data), 16):
		hex_part = ' '.join(f'{b:02x}' for b in tbl_data[i:i+16])
		addr = 0x8225 + i
		print(f'  ${addr:04x}: {hex_part}')

	# Hero growth data at $A1BB
	hero_offset = bank8_offset + 0x21BB
	print(f'\nHero growth data at $A1BB:')
	hero_data = rom[hero_offset:hero_offset+64]
	for i in range(0, len(hero_data), 16):
		hex_part = ' '.join(f'{b:02x}' for b in hero_data[i:i+16])
		addr = 0xA1BB + i
		print(f'  ${addr:04x}: {hex_part}')

	# Interpret growth data as signed bytes
	print('\nHero growth as signed bytes:')
	signed_vals = []
	for b in hero_data[:48]:
		if b > 127:
			signed_vals.append(b - 256)
		else:
			signed_vals.append(b)
	print(f'  {signed_vals[:16]}')
	print(f'  {signed_vals[16:32]}')
	print(f'  {signed_vals[32:48]}')

	# Look for EXP table patterns - search for ascending 3-byte values
	print('\n\nSearching for potential EXP table patterns...')
	for bank in range(32):
		bank_offset = header_size + (bank * 0x4000)
		bank_data = rom[bank_offset:bank_offset + 0x4000]

		# Look for ascending 3-byte sequences
		for i in range(0, len(bank_data) - 150, 3):
			# Read 10 consecutive 3-byte little-endian values
			vals = []
			valid = True
			for j in range(10):
				offset = i + j * 3
				if offset + 3 > len(bank_data):
					valid = False
					break
				val = bank_data[offset] | (bank_data[offset+1] << 8) | (bank_data[offset+2] << 16)
				vals.append(val)

			if not valid:
				continue

			# Check if strictly ascending and reasonable EXP values
			if all(vals[k] < vals[k+1] for k in range(len(vals)-1)):
				if vals[0] > 0 and vals[0] < 100 and vals[-1] < 500000:
					# Looks like possible EXP table
					addr = 0x8000 + i
					print(f'  Bank {bank} ${addr:04x}: {vals[:5]}...')

if __name__ == '__main__':
	main()
