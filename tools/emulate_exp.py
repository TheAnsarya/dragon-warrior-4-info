#!/usr/bin/env python3
"""
DW4 EXP Threshold Emulator - Correct Version

Each character has 5 bytes of EXP data at $A123 + char_slot * 5
The algorithm at $9FB9 computes EXP thresholds based on this data.

Register usage when entering $9F7C:
- $09 = character slot (0-7)
- $0A = target level (level+1 for next level threshold)
- $0B = character type (0 for standard party members)
"""

# Growth rate table at $A259
GROWTH_RATES = [0x20, 0x18, 0x14, 0x12, 0x10, 0x10,
				0x1e, 0x18, 0x14, 0x12, 0x10, 0x10]

CHAR_NAMES = ['Hero', 'Ragnar', 'Alena', 'Cristo', 'Brey', 'Taloon', 'Nara', 'Mara']

# Known EXP values from guide
KNOWN_EXP = {
	'Hero':   [0, 0, 16, 42, 83, 135, 215, 310, 445, 610, 830, 1110, 1430, 1820, 2270, 2790],
	'Alena':  [0, 0, 8, 21, 42, 68, 102, 153, 218, 305, 415, 555, 715, 910, 1135, 1395],
}


def read_char_exp_data(rom, char_slot):
	"""Read character's 5-byte EXP data."""
	bank18 = 0x48000
	base_ptr = 0xa123
	offset = base_ptr + char_slot * 5
	file_off = bank18 + (offset - 0x8000)
	return list(rom[file_off:file_off + 5])


def emulate_a038(data):
	"""
	Emulate $A038: Init routine that parses first 5 bytes.

	Returns: (val_7b, rate_idx)
	- val_7b: Initial EXP accumulator value (from high bits)
	- rate_idx: Starting index into growth rate table
	"""
	# $A038-$A047: ROR high bits of each byte into $7B
	# For each of 5 bytes: ASL byte (gets high bit into carry), ROR $7B (rotate carry in)
	val_7b = 0
	for i in range(5):
		high_bit = (data[i] >> 7) & 1
		val_7b = (val_7b >> 1) | (high_bit << 7)
	# Final 3 LSRs
	val_7b >>= 3

	# $A056-$A06A: Rate index from byte 0 bits 5-6
	# ((b0 & 0x60) >> 3) + ((b0 & 0x60) >> 5) = bits * 1.5
	b0 = data[0]
	idx = ((b0 & 0x60) >> 3)
	idx = idx + ((b0 & 0x60) >> 5)  # LSR + ADC = multiply by 1.5

	return val_7b, idx


def emulate_exp(data, target_level, debug=False):
	"""
	Emulate the full EXP computation.

	The algorithm:
	1. Parse 5-byte header to get initial value ($7B) and rate index
	2. Initialize accumulators: $00-$02 = EXP total, $04-$06 = delta
	3. Loop from level 3 to target, accumulating EXP
	"""
	if target_level < 2:
		return 0

	val_7b, rate_idx = emulate_a038(data)

	if debug:
		print(f"  Initial $7B={val_7b}, rate_idx={rate_idx}")

	# Initialize
	exp_total = val_7b  # $00-$02 starts with $7B
	exp_delta = val_7b  # $04-$06 also starts with $7B
	data_idx = 0  # $6E3B - byte index for threshold checks

	# Level 2 = initial value
	if target_level == 2:
		return exp_total

	# Main loop: level 3 to target
	curr_level = 3
	while curr_level <= target_level:
		# $9FFA-$A01A: Check if we need to advance data index
		# Compare current byte (masked) against current level
		while data_idx < 5:  # 5 bytes max
			threshold = data[data_idx]
			if data_idx == 0:
				threshold &= 0x1f  # First byte: AND #$1F
			else:
				threshold &= 0x7f  # Others: AND #$7F

			if threshold >= curr_level:
				break

			# Advance to next byte, increment rate index
			rate_idx += 1
			data_idx += 1

		# $A01C-$A024: Get growth rate
		if rate_idx < len(GROWTH_RATES):
			rate = GROWTH_RATES[rate_idx]
		else:
			rate = 0x10  # Default if out of range

		# $A07D-$A0DE: Multiply delta by rate, divide by 16
		# Result = (delta * rate + 8) >> 4  [+8 is rounding for $0B != 0 case]
		# For $0B = 0, no rounding: result = (delta * rate) >> 4
		exp_delta = (exp_delta * rate) >> 4

		# $A0DF-$A0FA: Add delta to total
		exp_total += exp_delta

		if debug:
			print(f"  L{curr_level}: rate_idx={rate_idx} rate={rate:#x} delta={exp_delta} total={exp_total}")

		curr_level += 1

	return exp_total


def main():
	rom_path = "roms/Dragon Warrior IV (1992-10)(Enix)(US).nes"
	with open(rom_path, "rb") as f:
		rom = f.read()[16:]

	print("=" * 70)
	print("DW4 EXP Threshold Emulation")
	print("=" * 70)

	for char_slot in range(8):
		name = CHAR_NAMES[char_slot]
		data = read_char_exp_data(rom, char_slot)

		print(f"\n{name} (slot {char_slot}):")
		print(f"  Data: {' '.join(f'{b:02x}' for b in data)}")

		val_7b, rate_idx = emulate_a038(data)
		print(f"  Parsed: $7B={val_7b}, rate_idx={rate_idx}")

		print(f"\n  Lvl | Computed | {'Known':>8} | Match")
		print(f"  ----+----------+----------+------")

		for level in range(2, 20):
			computed = emulate_exp(data, level)
			if name in KNOWN_EXP and level < len(KNOWN_EXP[name]):
				known = KNOWN_EXP[name][level]
				diff = computed - known
				match = "YES" if diff == 0 else f"NO ({diff:+d})"
			else:
				known = "?"
				match = ""
			print(f"  {level:3d} | {computed:8d} | {str(known):>8} | {match}")


if __name__ == "__main__":
	main()
