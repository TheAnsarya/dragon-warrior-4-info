#!/usr/bin/env python3
"""
Emulate the complete EXP calculation routine from Bank 18.

Based on disassembly:
- $9F7C: Entry point
- $A038: Init routine (parses 5-byte data → $7B and $6E3A)
- $9FB9: Main computation loop
- $A259: Growth rate table

Algorithm:
1. Parse 5-byte character data to get:
   - $7B = (high bits of 5 bytes) >> 3  (initial EXP value)
   - $6E3A = (byte0 bits 6,5) >> 3  (starting rate index)
2. For Level 2: return $7B
3. For Level 3+: accumulate using growth rates
"""

ROM_PATH = 'roms/Dragon Warrior IV (1992-10)(Enix)(US).nes'

def load_rom():
	"""Load ROM data."""
	with open(ROM_PATH, 'rb') as f:
		return f.read()

def get_bank_data(rom, bank):
	"""Get data for a specific PRG bank."""
	offset = 16 + bank * 0x4000
	return rom[offset:offset + 0x4000]

def calculate_init_values(data):
	"""
	Emulate $A038 init routine.
	Input: 5 bytes of character EXP data
	Output: ($7B value, rate_index)
	"""
	# Collect high bits via ROR
	val_7b = 0
	for b in data:
		carry = (b >> 7) & 1
		val_7b = ((val_7b >> 1) & 0x7f) | (carry << 7)

	# 3 LSRs
	val_7b >>= 3

	# Rate index from byte 0 bits 6,5
	# AND #$60, then LSR x3
	rate_idx = ((data[0] & 0x60) >> 3)

	# Extract level thresholds from low bits
	thresholds = []
	thresholds.append(data[0] & 0x1f)  # Byte 0 bits 0-4 (first threshold)
	for i in range(1, 5):
		thresholds.append(data[i] & 0x7f)  # Bytes 1-4 bits 0-6

	return val_7b, rate_idx, thresholds

def get_growth_rates(bank_data):
	"""Read growth rate table at $A259."""
	# $A259 in bank = offset 0x2259
	offset = 0x2259
	rates = []
	for i in range(12):
		rates.append(bank_data[offset + i])
	return rates

def compute_exp_for_level(initial_7b, rate_idx, thresholds, growth_rates, target_level):
	"""
	Compute EXP threshold for a target level.

	Based on the main loop at $9FB9:
	- $00-$02 = accumulated EXP (24-bit)
	- $04-$06 = delta to add each level (24-bit)
	- Rate index advances when level passes threshold

	Key formula (from $A07D multiply routine):
	new_delta = (delta * rate) >> 4

	So rates work as:
	- 0x20 (32): multiply by 2
	- 0x18 (24): multiply by 1.5
	- 0x14 (20): multiply by 1.25
	- 0x10 (16): multiply by 1
	"""
	if target_level < 2:
		return 0
	if target_level == 2:
		return initial_7b

	# Initialize accumulators (24-bit values stored in low 24 bits)
	exp_total = initial_7b  # $00-$02
	exp_delta = initial_7b  # $04-$06

	current_rate_idx = rate_idx
	threshold_idx = 0

	# Main loop: from level 3 to target_level
	for level in range(3, target_level + 1):
		# Check if we need to advance rate index
		# The threshold comparison is: if level > threshold, advance
		while threshold_idx < len(thresholds) and level > thresholds[threshold_idx]:
			current_rate_idx += 1
			threshold_idx += 1
			if current_rate_idx >= len(growth_rates):
				current_rate_idx = len(growth_rates) - 1

		# Get current growth rate
		rate = growth_rates[current_rate_idx] if current_rate_idx < len(growth_rates) else growth_rates[-1]

		# Multiply delta by rate, then shift right 4 (divide by 16)
		# This is 24-bit fixed point math
		exp_delta = (exp_delta * rate) >> 4

		# Add delta to total
		exp_total += exp_delta

	return exp_total

def main():
	rom = load_rom()
	bank18 = get_bank_data(rom, 18)

	growth_rates = get_growth_rates(bank18)
	print("Growth rate table at $A259:")
	print(f"  {' '.join(f'{r:02x}' for r in growth_rates)}")
	print(f"  Decimal: {growth_rates}")
	print()

	# Known Alena values for extended verification
	alena_known = {
		2: 20, 3: 60, 4: 140, 5: 260, 6: 420, 7: 620, 8: 940, 9: 1380, 10: 2632,
		11: 3468, 12: 4552, 13: 5944
	}

	taloon_known = {
		2: 10, 3: 30, 4: 70, 5: 130, 6: 210, 7: 310, 8: 470, 9: 690, 10: 1314,
		11: 1732, 12: 2274, 13: 2968
	}

	# Read character data from Type 0 pointer
	data_offset = 0x2123  # $A123 in bank 18
	char_names = ['Hero', 'Ragnar', 'Alena', 'Cristo', 'Brey', 'Taloon', 'Nara', 'Mara']

	for i, name in enumerate(char_names):
		char_data = bank18[data_offset + i*5 : data_offset + i*5 + 5]
		val_7b, rate_idx, thresholds = calculate_init_values(char_data)

		print(f"{name}:")
		print(f"  Data: {' '.join(f'{b:02x}' for b in char_data)}")
		print(f"  Initial $7B (L2 base): {val_7b}")
		print(f"  Starting rate index: {rate_idx}, rate={growth_rates[rate_idx]}")
		print(f"  Level thresholds: {thresholds}")

		# Compute EXP for levels 2-13
		if name == 'Alena':
			known = alena_known
		elif name == 'Taloon':
			known = taloon_known
		else:
			known = {}

		matches = 0
		for lvl in range(2, 14):
			exp = compute_exp_for_level(val_7b, rate_idx, thresholds, growth_rates, lvl)
			k = known.get(lvl)
			if k:
				match = "YES" if exp == k else "NO"
				if exp == k:
					matches += 1
				print(f"  L{lvl:2d}: {exp:6d} (known: {k:6d}) {match}")
			else:
				print(f"  L{lvl:2d}: {exp:6d}")

		if known:
			print(f"  Matches: {matches}/{len(known)}")
		print()

if __name__ == '__main__':
	main()
