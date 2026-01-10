#!/usr/bin/env python3
"""Debug $7B calculation"""

# Hero data: 85 8b 0f 2b e3
bytes_data = [0x85, 0x8b, 0x0f, 0x2b, 0xe3]

# The code does: ASL A (bit 7 -> carry), ROR $7B (carry -> bit 7 of $7B)
# After 5 iterations, the 5 high bits are in $7B bits 7-3
# Then 3 LSRs shift them to bits 4-0

seven_b = 0
print("Hero data: 85 8b 0f 2b e3")
print()
for b in bytes_data:
	# ASL A: bit 7 goes to carry
	carry = (b >> 7) & 1
	# ROR $7B: carry goes into bit 7, everything shifts right
	seven_b = (seven_b >> 1) | (carry << 7)
	print(f"Byte {b:02x}: bit7={carry}, seven_b = {seven_b:08b} = {seven_b}")

# After loop, do 3 LSRs
print()
for i in range(3):
	seven_b >>= 1
	print(f"After LSR {i+1}: {seven_b:08b} = {seven_b}")

print()
print(f"Final $7B = {seven_b}")
print()

# Now check Alena
print("=" * 40)
print("Alena data: 04 0c 92 2b e3")
print()
bytes_data = [0x04, 0x0c, 0x92, 0x2b, 0xe3]

seven_b = 0
for b in bytes_data:
	carry = (b >> 7) & 1
	seven_b = (seven_b >> 1) | (carry << 7)
	print(f"Byte {b:02x}: bit7={carry}, seven_b = {seven_b:08b} = {seven_b}")

print()
for i in range(3):
	seven_b >>= 1
	print(f"After LSR {i+1}: {seven_b:08b} = {seven_b}")

print()
print(f"Final $7B = {seven_b}")
