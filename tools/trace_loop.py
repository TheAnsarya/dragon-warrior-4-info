#!/usr/bin/env python3
"""Trace the EXP main loop from $9FB9"""

rom_path = 'roms/Dragon Warrior IV (1992-10)(Enix)(US).nes'
with open(rom_path, 'rb') as f:
	data = f.read()

def get_byte(addr):
	"""Get byte from Bank 18"""
	# Bank 18 is at PRG offset 0x24010 (after 16-byte header)
	# $8000-$BFFF maps to PRG bank 18
	if 0x8000 <= addr < 0xC000:
		offset = 0x10 + (18 * 0x4000) + (addr - 0x8000)
		return data[offset]
	elif addr < 0x100:
		# Zero page - return placeholder
		return 0
	else:
		return 0

def disasm(addr, count=30):
	"""Simple disassembler"""
	for _ in range(count):
		op = get_byte(addr)
		if op == 0x20:  # JSR
			lo, hi = get_byte(addr+1), get_byte(addr+2)
			print(f"${addr:04x}: {op:02x} {lo:02x} {hi:02x}  JSR ${hi:02x}{lo:02x}")
			addr += 3
		elif op == 0xbd:  # LDA abs,X
			lo, hi = get_byte(addr+1), get_byte(addr+2)
			print(f"${addr:04x}: {op:02x} {lo:02x} {hi:02x}  LDA ${hi:02x}{lo:02x},X")
			addr += 3
		elif op == 0xae:  # LDX abs
			lo, hi = get_byte(addr+1), get_byte(addr+2)
			print(f"${addr:04x}: {op:02x} {lo:02x} {hi:02x}  LDX ${hi:02x}{lo:02x}")
			addr += 3
		elif op == 0xac:  # LDY abs
			lo, hi = get_byte(addr+1), get_byte(addr+2)
			print(f"${addr:04x}: {op:02x} {lo:02x} {hi:02x}  LDY ${hi:02x}{lo:02x}")
			addr += 3
		elif op == 0xad:  # LDA abs
			lo, hi = get_byte(addr+1), get_byte(addr+2)
			print(f"${addr:04x}: {op:02x} {lo:02x} {hi:02x}  LDA ${hi:02x}{lo:02x}")
			addr += 3
		elif op == 0x8d:  # STA abs
			lo, hi = get_byte(addr+1), get_byte(addr+2)
			print(f"${addr:04x}: {op:02x} {lo:02x} {hi:02x}  STA ${hi:02x}{lo:02x}")
			addr += 3
		elif op == 0xee:  # INC abs
			lo, hi = get_byte(addr+1), get_byte(addr+2)
			print(f"${addr:04x}: {op:02x} {lo:02x} {hi:02x}  INC ${hi:02x}{lo:02x}")
			addr += 3
		elif op == 0x4c:  # JMP
			lo, hi = get_byte(addr+1), get_byte(addr+2)
			print(f"${addr:04x}: {op:02x} {lo:02x} {hi:02x}  JMP ${hi:02x}{lo:02x}")
			addr += 3
		elif op == 0xa2:  # LDX imm
			val = get_byte(addr+1)
			print(f"${addr:04x}: {op:02x} {val:02x}     LDX #${val:02x}")
			addr += 2
		elif op == 0xa0:  # LDY imm
			val = get_byte(addr+1)
			print(f"${addr:04x}: {op:02x} {val:02x}     LDY #${val:02x}")
			addr += 2
		elif op == 0xa9:  # LDA imm
			val = get_byte(addr+1)
			print(f"${addr:04x}: {op:02x} {val:02x}     LDA #${val:02x}")
			addr += 2
		elif op == 0x85:  # STA zp
			val = get_byte(addr+1)
			print(f"${addr:04x}: {op:02x} {val:02x}     STA ${val:02x}")
			addr += 2
		elif op == 0xa5:  # LDA zp
			val = get_byte(addr+1)
			print(f"${addr:04x}: {op:02x} {val:02x}     LDA ${val:02x}")
			addr += 2
		elif op == 0xc5:  # CMP zp
			val = get_byte(addr+1)
			print(f"${addr:04x}: {op:02x} {val:02x}     CMP ${val:02x}")
			addr += 2
		elif op == 0xc9:  # CMP imm
			val = get_byte(addr+1)
			print(f"${addr:04x}: {op:02x} {val:02x}     CMP #${val:02x}")
			addr += 2
		elif op == 0xe6:  # INC zp
			val = get_byte(addr+1)
			print(f"${addr:04x}: {op:02x} {val:02x}     INC ${val:02x}")
			addr += 2
		elif op == 0x29:  # AND imm
			val = get_byte(addr+1)
			print(f"${addr:04x}: {op:02x} {val:02x}     AND #${val:02x}")
			addr += 2
		elif op == 0xb1:  # LDA (ind),Y
			val = get_byte(addr+1)
			print(f"${addr:04x}: {op:02x} {val:02x}     LDA (${val:02x}),Y")
			addr += 2
		elif op == 0xd0:  # BNE
			off = get_byte(addr+1)
			if off > 127: off -= 256
			target = addr + 2 + off
			print(f"${addr:04x}: {op:02x} {get_byte(addr+1):02x}     BNE ${target:04x}")
			addr += 2
		elif op == 0xb0:  # BCS
			off = get_byte(addr+1)
			if off > 127: off -= 256
			target = addr + 2 + off
			print(f"${addr:04x}: {op:02x} {get_byte(addr+1):02x}     BCS ${target:04x}")
			addr += 2
		elif op == 0x90:  # BCC
			off = get_byte(addr+1)
			if off > 127: off -= 256
			target = addr + 2 + off
			print(f"${addr:04x}: {op:02x} {get_byte(addr+1):02x}     BCC ${target:04x}")
			addr += 2
		elif op == 0xf0:  # BEQ
			off = get_byte(addr+1)
			if off > 127: off -= 256
			target = addr + 2 + off
			print(f"${addr:04x}: {op:02x} {get_byte(addr+1):02x}     BEQ ${target:04x}")
			addr += 2
		elif op == 0x60:  # RTS
			print(f"${addr:04x}: {op:02x}        RTS")
			addr += 1
			break
		elif op == 0x18:  # CLC
			print(f"${addr:04x}: {op:02x}        CLC")
			addr += 1
		elif op == 0xaa:  # TAX
			print(f"${addr:04x}: {op:02x}        TAX")
			addr += 1
		elif op == 0xe8:  # INX
			print(f"${addr:04x}: {op:02x}        INX")
			addr += 1
		elif op == 0xe0:  # CPX imm
			val = get_byte(addr+1)
			print(f"${addr:04x}: {op:02x} {val:02x}     CPX #${val:02x}")
			addr += 2
		elif op == 0x95:  # STA zp,X
			val = get_byte(addr+1)
			print(f"${addr:04x}: {op:02x} {val:02x}     STA ${val:02x},X")
			addr += 2
		else:
			print(f"${addr:04x}: {op:02x}        ??? (unknown)")
			addr += 1

print("=== Main loop from $9FB9 ===")
disasm(0x9FB9, 50)
print()
print("=== Init routine at $A038 ===")
disasm(0xA038, 30)
print()
print("=== Continue from $A01C ===")
disasm(0xA01C, 20)
print()
print("=== Look at add routine at $A0DF ===")
disasm(0xA0DF, 20)
