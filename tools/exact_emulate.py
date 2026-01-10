#!/usr/bin/env python3
"""Exact emulation of the EXP loop"""

# Taloon: data 04 8c 13 ac 63
#   thresholds: [4, 12, 19, 44, 99]
#   rate_idx starts at 0 (from byte0 bits 6,5 = 0)
#   initial value = 10

rates = [32, 24, 20, 18, 16, 16, 30, 24, 20, 18, 16, 16]
thresholds = [4, 12, 19, 44, 99]

seven_b = 10
rate_idx = 0
thresh_idx = 0

# Initialize
delta = seven_b  # $00-$03
total = seven_b  # $04-$07
level = 2

target = 13
known = {2: 10, 3: 30, 4: 70, 5: 130, 6: 210, 7: 310, 8: 470, 9: 690, 10: 1314}

print("Taloon EXP emulation (exact loop logic):")
print(f"  thresholds: {thresholds}")
print(f"  rates: {rates[:6]}")
print()

print(f"L{level}: total={total}", end="")
if level in known:
	print(f" (known: {known[level]})", "YES" if total == known[level] else "NO")
else:
	print()

if level == target:
	exit()

level = 3  # INC level at 9FE7

while True:
	# Threshold check loop at 9FFA-A01B
	# This checks if threshold >= level. If yes, exit. If no, advance rate.
	while thresh_idx < 5:
		t = thresholds[thresh_idx]
		if t >= level:  # BCS A01C - branch if threshold >= level
			break
		# threshold < level, so advance rate
		print(f"  (threshold {t} < level {level}, advancing rate_idx to {rate_idx + 1})")
		rate_idx += 1
		thresh_idx += 1

	# A01C: Get rate
	rate = rates[min(rate_idx, len(rates) - 1)]

	# A024: JSR A07D - multiply: delta = (delta * rate) >> 4
	delta = (delta * rate) >> 4

	# A029: JSR A0DF - add: total += delta
	total += delta

	print(f"L{level}: rate_idx={rate_idx}, rate={rate}, delta={delta}, total={total}", end="")
	if level in known:
		print(f" (known: {known[level]})", "YES" if total == known[level] else "NO")
	else:
		print()

	# A02E-A030: Check if level == target
	if level == target:
		break

	# A032: INC level
	level += 1
