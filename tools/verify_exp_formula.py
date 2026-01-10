#!/usr/bin/env python3
"""Verify EXP formula against known values from woodus.com."""

ROM_PATH = 'roms/Dragon Warrior IV (1992-10)(Enix)(US).nes'

# Known EXP values from search_exp_tables.py (woodus.com)
KNOWN_EXP = {
	'Hero/Ragnar': {
		2: 16, 3: 42, 4: 83, 5: 135, 6: 214, 7: 333, 8: 503, 9: 738, 10: 1390,
		11: 1822, 12: 2385, 13: 3102, 14: 3978, 15: 5073, 16: 6419, 17: 8058,
		18: 10082, 19: 12550, 20: 15575, 21: 19265, 22: 23648, 23: 28860, 24: 34737,
	},
	'Nara': {
		2: 16, 3: 46, 4: 102, 5: 186, 6: 300, 7: 444, 8: 672, 9: 984, 10: 1844,
	},
	'Mara': {
		2: 18, 3: 51, 4: 112, 5: 203, 6: 326, 7: 481, 8: 728, 9: 1063, 10: 1996,
	},
	'Brey': {
		2: 19, 3: 54, 4: 119, 5: 216, 6: 347, 7: 512, 8: 773, 9: 1126, 10: 2120,
	},
	'Taloon': {
		2: 10, 3: 30, 4: 70, 5: 130, 6: 210, 7: 310, 8: 470, 9: 690, 10: 1314,
	},
	'Alena': {
		2: 20, 3: 60, 4: 140, 5: 260, 6: 420, 7: 620, 8: 940, 9: 1380, 10: 2632,
	},
}

# Character slots mapped to names
CHAR_MAP = {
	0: 'Hero/Ragnar',  # Hero uses slot 0
	1: 'Ragnar',       # Ragnar uses slot 1
	2: 'Alena',
	3: 'Cristo',
	4: 'Brey',
	5: 'Taloon',
	6: 'Nara',
	7: 'Mara',
}

def calculate_7b(data):
	"""Calculate $7B value from 5-byte character data."""
	val = 0
	for b in data:
		carry = (b >> 7) & 1
		val = ((val >> 1) & 0x7f) | (carry << 7)
	return val >> 3

def main():
	# Check the pointer table structure
	# Type 0: ptr = A123
	# Characters are indexed by SLOT ($09) which offsets by slot*5 from the base pointer

	# Read pointer table at $A0FB
	ptr_offset = 16 + 18 * 0x4000 + 0x20fb

	with open(ROM_PATH, 'rb') as f:
		f.seek(ptr_offset)
		ptr_data = f.read(16)

	print("Pointer table at $A0FB:")
	print("=" * 60)
	pointers = []
	for i in range(8):
		lo = ptr_data[i*2]
		hi = ptr_data[i*2 + 1]
		ptr = lo | (hi << 8)
		pointers.append(ptr)
		print(f"Type {i}: ${ptr:04x}")

	print()
	print("Calculating $7B for each pointer's first 5 bytes:")
	print("=" * 60)

	for i, ptr in enumerate(pointers):
		file_offset = 16 + 18 * 0x4000 + (ptr - 0x8000)

		with open(ROM_PATH, 'rb') as f:
			f.seek(file_offset)
			data = f.read(5)

		val_7b = calculate_7b(data)
		print(f"Type {i} @ ${ptr:04x}: {' '.join(f'{b:02x}' for b in data)}, $7B={val_7b}")

	print()
	print("Expected L2 EXP values from woodus.com:")
	print("=" * 60)
	for name, table in KNOWN_EXP.items():
		print(f"{name}: L2={table[2]}")

	# Now we need to understand the mapping:
	# - When calling for a character, $09 = char slot (0-7)
	# - $0B = char type (0 for standard party members)
	# - If $0B = 0, pointer is from Type 0 ($A123)
	# - Then $09 * 5 is added to the pointer
	#
	# So for slot 0 (Hero), data is at $A123 + 0*5 = $A123
	# For slot 1 (Ragnar?), data is at $A123 + 1*5 = $A128
	# etc.

	print()
	print("Data at Type 0 pointer ($A123) + slot*5 for each slot:")
	print("=" * 60)

	base_ptr = pointers[0]  # $A123
	base_offset = 16 + 18 * 0x4000 + (base_ptr - 0x8000)

	char_names = ['Hero', 'Ragnar', 'Alena', 'Cristo', 'Brey', 'Taloon', 'Nara', 'Mara']

	with open(ROM_PATH, 'rb') as f:
		f.seek(base_offset)
		all_data = f.read(48)

	for slot in range(8):
		data = all_data[slot*5:(slot+1)*5]
		val_7b = calculate_7b(data)
		print(f"Slot {slot} ({char_names[slot]:8s}): {' '.join(f'{b:02x}' for b in data)}, $7B={val_7b}")

if __name__ == '__main__':
	main()
