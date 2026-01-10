#!/usr/bin/env python3
"""
Dragon Warrior IV EXP Formula Calculator

This tool computes EXP thresholds for all characters using the formula
reverse-engineered from the Bank 18 code at $9FB9-$A037.

The formula:
  - Level 2 EXP = initial_value (stored in character data)
  - For each level N > 2:
    - Check if level exceeds any threshold, advance rate index if so
    - delta = (prev_delta * rate) >> 4  (shift-and-add multiply, then divide by 16)
    - total += delta

Character data is stored at $A123 (5 bytes per character):
  - Byte 0: bit 7 -> high_bits[0], bits 6-5 -> rate_idx, bits 4-0 -> threshold[0]
  - Bytes 1-4: bit 7 -> high_bits[1-4], bits 6-0 -> threshold[1-4]
  - initial_value = (high_bits >> 3) where high_bits is the 5 high bits collected

Growth rate table at $A259:
  [32, 24, 20, 18, 16, 16, 30, 24, 20, 18, 16, 16]
"""

ROM_PATH = 'roms/Dragon Warrior IV (1992-10)(Enix)(US).nes'

# Growth rates from $A259
GROWTH_RATES = [32, 24, 20, 18, 16, 16, 30, 24, 20, 18, 16, 16]

# Character names by slot
CHAR_NAMES = ['Hero', 'Ragnar', 'Alena', 'Cristo', 'Brey', 'Taloon', 'Nara', 'Mara']


def read_character_data(rom_data, slot):
	"""Read and decode character EXP data from ROM."""
	# Character data at $A123 = PRG offset 0x10 + (18 * 0x4000) + ($A123 - $8000)
	base_offset = 0x10 + (18 * 0x4000) + (0xA123 - 0x8000)
	offset = base_offset + slot * 5

	bytes_data = list(rom_data[offset:offset + 5])

	# Decode initial value using ROR (bits collected in reverse order)
	# ASL A puts bit 7 in carry, ROR $7B rotates carry into bit 7 of $7B
	seven_b = 0
	for b in bytes_data:
		carry = (b >> 7) & 1
		seven_b = (seven_b >> 1) | (carry << 7)
	# Then 3 LSRs
	seven_b >>= 3
	initial_value = seven_b

	# Decode rate index (byte 0, bits 6-5, then >> 3)
	rate_idx = (bytes_data[0] & 0x60) >> 3

	# Decode thresholds
	thresholds = []
	thresholds.append(bytes_data[0] & 0x1f)
	for i in range(1, 5):
		thresholds.append(bytes_data[i] & 0x7f)

	return {
		'raw_bytes': bytes_data,
		'initial_value': initial_value,
		'rate_idx': rate_idx,
		'thresholds': thresholds
	}


def compute_exp(char_data, target_level):
	"""Compute EXP required for a target level."""
	initial = char_data['initial_value']
	rate_idx = char_data['rate_idx']
	thresholds = char_data['thresholds']
	thresh_idx = 0

	if target_level <= 1:
		return 0
	if target_level == 2:
		return initial

	delta = initial
	total = initial

	# Start at level 3 and compute up to target
	for level in range(3, target_level + 1):
		# Check thresholds - advance rate if level > threshold
		while thresh_idx < 5 and level > thresholds[thresh_idx]:
			rate_idx += 1
			thresh_idx += 1

		# Get rate and compute new delta
		rate = GROWTH_RATES[min(rate_idx, len(GROWTH_RATES) - 1)]
		delta = (delta * rate) >> 4
		total += delta

	return total


def main():
	with open(ROM_PATH, 'rb') as f:
		rom_data = f.read()

	print("Dragon Warrior IV EXP Thresholds")
	print("=" * 60)
	print()

	for slot in range(8):
		char_data = read_character_data(rom_data, slot)
		name = CHAR_NAMES[slot]

		print(f"{name}:")
		print(f"  Data: {' '.join(f'{b:02x}' for b in char_data['raw_bytes'])}")
		print(f"  Initial value (L2 base): {char_data['initial_value']}")
		print(f"  Starting rate index: {char_data['rate_idx']}")
		print(f"  Thresholds: {char_data['thresholds']}")
		print()
		print("  Level | EXP Required")
		print("  ------+-------------")

		for level in range(2, 51):
			exp = compute_exp(char_data, level)
			print(f"    {level:3d} | {exp:,}")

		print()


if __name__ == '__main__':
	main()
