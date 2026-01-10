#!/usr/bin/env python3
"""
Disassemble and trace the EXP computation loop in Bank 18.
"""

ROM_PATH = 'roms/Dragon Warrior IV (1992-10)(Enix)(US).nes'

# 6502 opcodes
OPCODES = {
	0x00: ('BRK', 'impl', 1),
	0x06: ('ASL', 'zp', 2),
	0x0a: ('ASL', 'acc', 1),
	0x16: ('ASL', 'zp_x', 2),
	0x18: ('CLC', 'impl', 1),
	0x20: ('JSR', 'abs', 3),
	0x26: ('ROL', 'zp', 2),
	0x29: ('AND', 'imm', 2),
	0x36: ('ROL', 'zp_x', 2),
	0x46: ('LSR', 'zp', 2),
	0x48: ('PHA', 'impl', 1),
	0x4a: ('LSR', 'acc', 1),
	0x4c: ('JMP', 'abs', 3),
	0x60: ('RTS', 'impl', 1),
	0x65: ('ADC', 'zp', 2),
	0x66: ('ROR', 'zp', 2),
	0x68: ('PLA', 'impl', 1),
	0x75: ('ADC', 'zp_x', 2),
	0x85: ('STA', 'zp', 2),
	0x8d: ('STA', 'abs', 3),
	0x90: ('BCC', 'rel', 2),
	0x95: ('STA', 'zp_x', 2),
	0x99: ('STA', 'abs_y', 3),
	0xa0: ('LDY', 'imm', 2),
	0xa2: ('LDX', 'imm', 2),
	0xa5: ('LDA', 'zp', 2),
	0xa9: ('LDA', 'imm', 2),
	0xaa: ('TAX', 'impl', 1),
	0xac: ('LDY', 'abs', 3),
	0xad: ('LDA', 'abs', 3),
	0xae: ('LDX', 'abs', 3),
	0xb1: ('LDA', 'ind_y', 2),
	0xb5: ('LDA', 'zp_x', 2),
	0xb9: ('LDA', 'abs_y', 3),
	0xbd: ('LDA', 'abs_x', 3),
	0xc0: ('CPY', 'imm', 2),
	0xc5: ('CMP', 'zp', 2),
	0xc8: ('INY', 'impl', 1),
	0xc9: ('CMP', 'imm', 2),
	0xca: ('DEX', 'impl', 1),
	0xd0: ('BNE', 'rel', 2),
	0xe0: ('CPX', 'imm', 2),
	0xe6: ('INC', 'zp', 2),
	0xe8: ('INX', 'impl', 1),
	0xee: ('INC', 'abs', 3),
	0xf0: ('BEQ', 'rel', 2),
}

def disasm(data, start_addr, count=50):
	"""Disassemble data starting at start_addr."""
	pc = start_addr
	i = 0
	lines = 0
	result = []

	while i < len(data) - 3 and lines < count:
		op = data[i]
		if op in OPCODES:
			mnem, mode, size = OPCODES[op]
			if size == 1:
				result.append(f'${pc:04x}: {op:02x}        {mnem}')
			elif size == 2:
				arg = data[i+1]
				if mode == 'rel':
					target = pc + 2 + (arg if arg < 128 else arg - 256)
					result.append(f'${pc:04x}: {op:02x} {arg:02x}     {mnem} ${target:04x}')
				elif mode == 'imm':
					result.append(f'${pc:04x}: {op:02x} {arg:02x}     {mnem} #${arg:02x}')
				elif mode == 'zp':
					result.append(f'${pc:04x}: {op:02x} {arg:02x}     {mnem} ${arg:02x}')
				elif mode == 'zp_x':
					result.append(f'${pc:04x}: {op:02x} {arg:02x}     {mnem} ${arg:02x},X')
				elif mode == 'ind_y':
					result.append(f'${pc:04x}: {op:02x} {arg:02x}     {mnem} (${arg:02x}),Y')
			elif size == 3:
				lo, hi = data[i+1], data[i+2]
				addr = lo | (hi << 8)
				if mode == 'abs_x':
					result.append(f'${pc:04x}: {op:02x} {lo:02x} {hi:02x}  {mnem} ${addr:04x},X')
				elif mode == 'abs_y':
					result.append(f'${pc:04x}: {op:02x} {lo:02x} {hi:02x}  {mnem} ${addr:04x},Y')
				else:
					result.append(f'${pc:04x}: {op:02x} {lo:02x} {hi:02x}  {mnem} ${addr:04x}')
			pc += size
			i += size
		else:
			result.append(f'${pc:04x}: {op:02x}        ??? (opcode {op:02x})')
			pc += 1
			i += 1
		lines += 1

	return result

def main():
	with open(ROM_PATH, 'rb') as f:
		f.seek(16 + 18 * 0x4000)
		bank18 = f.read(0x4000)

	# Full multiply routine including post-processing
	print("Full multiply subroutine at $A07D:")
	print("=" * 60)
	offset = 0x207d
	for line in disasm(bank18[offset:offset+120], 0xa07d, 70):
		print(line)

if __name__ == '__main__':
	main()
