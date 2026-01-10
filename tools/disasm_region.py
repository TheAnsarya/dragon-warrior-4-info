#!/usr/bin/env python3
"""Disassemble a region of the ROM."""

import sys

OPCODES = {
	0x00: ("BRK", 1, "impl"),
	0x01: ("ORA", 2, "indx"),
	0x05: ("ORA", 2, "zp"),
	0x06: ("ASL", 2, "zp"),
	0x08: ("PHP", 1, "impl"),
	0x09: ("ORA", 2, "imm"),
	0x0A: ("ASL", 1, "impl"),
	0x0D: ("ORA", 3, "abs"),
	0x0E: ("ASL", 3, "abs"),
	0x10: ("BPL", 2, "rel"),
	0x11: ("ORA", 2, "indy"),
	0x15: ("ORA", 2, "zpx"),
	0x16: ("ASL", 2, "zpx"),
	0x18: ("CLC", 1, "impl"),
	0x19: ("ORA", 3, "absy"),
	0x1D: ("ORA", 3, "absx"),
	0x1E: ("ASL", 3, "absx"),
	0x20: ("JSR", 3, "abs"),
	0x21: ("AND", 2, "indx"),
	0x24: ("BIT", 2, "zp"),
	0x25: ("AND", 2, "zp"),
	0x26: ("ROL", 2, "zp"),
	0x28: ("PLP", 1, "impl"),
	0x29: ("AND", 2, "imm"),
	0x2A: ("ROL", 1, "impl"),
	0x2C: ("BIT", 3, "abs"),
	0x2D: ("AND", 3, "abs"),
	0x2E: ("ROL", 3, "abs"),
	0x30: ("BMI", 2, "rel"),
	0x31: ("AND", 2, "indy"),
	0x35: ("AND", 2, "zpx"),
	0x36: ("ROL", 2, "zpx"),
	0x38: ("SEC", 1, "impl"),
	0x39: ("AND", 3, "absy"),
	0x3D: ("AND", 3, "absx"),
	0x3E: ("ROL", 3, "absx"),
	0x40: ("RTI", 1, "impl"),
	0x41: ("EOR", 2, "indx"),
	0x45: ("EOR", 2, "zp"),
	0x46: ("LSR", 2, "zp"),
	0x48: ("PHA", 1, "impl"),
	0x49: ("EOR", 2, "imm"),
	0x4A: ("LSR", 1, "impl"),
	0x4C: ("JMP", 3, "abs"),
	0x4D: ("EOR", 3, "abs"),
	0x4E: ("LSR", 3, "abs"),
	0x50: ("BVC", 2, "rel"),
	0x51: ("EOR", 2, "indy"),
	0x55: ("EOR", 2, "zpx"),
	0x56: ("LSR", 2, "zpx"),
	0x58: ("CLI", 1, "impl"),
	0x59: ("EOR", 3, "absy"),
	0x5D: ("EOR", 3, "absx"),
	0x5E: ("LSR", 3, "absx"),
	0x60: ("RTS", 1, "impl"),
	0x61: ("ADC", 2, "indx"),
	0x65: ("ADC", 2, "zp"),
	0x66: ("ROR", 2, "zp"),
	0x68: ("PLA", 1, "impl"),
	0x69: ("ADC", 2, "imm"),
	0x6A: ("ROR", 1, "impl"),
	0x6C: ("JMP", 3, "ind"),
	0x6D: ("ADC", 3, "abs"),
	0x6E: ("ROR", 3, "abs"),
	0x70: ("BVS", 2, "rel"),
	0x71: ("ADC", 2, "indy"),
	0x75: ("ADC", 2, "zpx"),
	0x76: ("ROR", 2, "zpx"),
	0x78: ("SEI", 1, "impl"),
	0x79: ("ADC", 3, "absy"),
	0x7D: ("ADC", 3, "absx"),
	0x7E: ("ROR", 3, "absx"),
	0x81: ("STA", 2, "indx"),
	0x84: ("STY", 2, "zp"),
	0x85: ("STA", 2, "zp"),
	0x86: ("STX", 2, "zp"),
	0x88: ("DEY", 1, "impl"),
	0x8A: ("TXA", 1, "impl"),
	0x8C: ("STY", 3, "abs"),
	0x8D: ("STA", 3, "abs"),
	0x8E: ("STX", 3, "abs"),
	0x90: ("BCC", 2, "rel"),
	0x91: ("STA", 2, "indy"),
	0x94: ("STY", 2, "zpx"),
	0x95: ("STA", 2, "zpx"),
	0x96: ("STX", 2, "zpy"),
	0x98: ("TYA", 1, "impl"),
	0x99: ("STA", 3, "absy"),
	0x9A: ("TXS", 1, "impl"),
	0x9D: ("STA", 3, "absx"),
	0xA0: ("LDY", 2, "imm"),
	0xA1: ("LDA", 2, "indx"),
	0xA2: ("LDX", 2, "imm"),
	0xA4: ("LDY", 2, "zp"),
	0xA5: ("LDA", 2, "zp"),
	0xA6: ("LDX", 2, "zp"),
	0xA8: ("TAY", 1, "impl"),
	0xA9: ("LDA", 2, "imm"),
	0xAA: ("TAX", 1, "impl"),
	0xAC: ("LDY", 3, "abs"),
	0xAD: ("LDA", 3, "abs"),
	0xAE: ("LDX", 3, "abs"),
	0xB0: ("BCS", 2, "rel"),
	0xB1: ("LDA", 2, "indy"),
	0xB4: ("LDY", 2, "zpx"),
	0xB5: ("LDA", 2, "zpx"),
	0xB6: ("LDX", 2, "zpy"),
	0xB8: ("CLV", 1, "impl"),
	0xB9: ("LDA", 3, "absy"),
	0xBA: ("TSX", 1, "impl"),
	0xBC: ("LDY", 3, "absx"),
	0xBD: ("LDA", 3, "absx"),
	0xBE: ("LDX", 3, "absy"),
	0xC0: ("CPY", 2, "imm"),
	0xC1: ("CMP", 2, "indx"),
	0xC4: ("CPY", 2, "zp"),
	0xC5: ("CMP", 2, "zp"),
	0xC6: ("DEC", 2, "zp"),
	0xC8: ("INY", 1, "impl"),
	0xC9: ("CMP", 2, "imm"),
	0xCA: ("DEX", 1, "impl"),
	0xCC: ("CPY", 3, "abs"),
	0xCD: ("CMP", 3, "abs"),
	0xCE: ("DEC", 3, "abs"),
	0xD0: ("BNE", 2, "rel"),
	0xD1: ("CMP", 2, "indy"),
	0xD5: ("CMP", 2, "zpx"),
	0xD6: ("DEC", 2, "zpx"),
	0xD8: ("CLD", 1, "impl"),
	0xD9: ("CMP", 3, "absy"),
	0xDD: ("CMP", 3, "absx"),
	0xDE: ("DEC", 3, "absx"),
	0xE0: ("CPX", 2, "imm"),
	0xE1: ("SBC", 2, "indx"),
	0xE4: ("CPX", 2, "zp"),
	0xE5: ("SBC", 2, "zp"),
	0xE6: ("INC", 2, "zp"),
	0xE8: ("INX", 1, "impl"),
	0xE9: ("SBC", 2, "imm"),
	0xEA: ("NOP", 1, "impl"),
	0xEC: ("CPX", 3, "abs"),
	0xED: ("SBC", 3, "abs"),
	0xEE: ("INC", 3, "abs"),
	0xF0: ("BEQ", 2, "rel"),
	0xF1: ("SBC", 2, "indy"),
	0xF5: ("SBC", 2, "zpx"),
	0xF6: ("INC", 2, "zpx"),
	0xF8: ("SED", 1, "impl"),
	0xF9: ("SBC", 3, "absy"),
	0xFD: ("SBC", 3, "absx"),
	0xFE: ("INC", 3, "absx"),
}

def disassemble(rom, start_addr, end_addr, bank_offset):
	"""Disassemble a region."""
	result = []
	addr = start_addr
	while addr < end_addr:
		file_offset = bank_offset + (addr - 0x8000)
		opcode = rom[file_offset]

		if opcode in OPCODES:
			mnemonic, size, mode = OPCODES[opcode]
			if size == 1:
				operand = ""
			elif size == 2:
				op1 = rom[file_offset + 1]
				if mode == "imm":
					operand = f"#${op1:02x}"
				elif mode == "zp" or mode == "zpx" or mode == "zpy":
					suffix = ",X" if mode == "zpx" else ",Y" if mode == "zpy" else ""
					operand = f"${op1:02x}{suffix}"
				elif mode == "rel":
					target = addr + 2 + (op1 if op1 < 128 else op1 - 256)
					operand = f"${target:04x}"
				elif mode == "indx":
					operand = f"(${op1:02x},X)"
				elif mode == "indy":
					operand = f"(${op1:02x}),Y"
				else:
					operand = f"${op1:02x}"
			else:  # size == 3
				op1 = rom[file_offset + 1]
				op2 = rom[file_offset + 2]
				word = op1 | (op2 << 8)
				if mode == "abs":
					operand = f"${word:04x}"
				elif mode == "absx":
					operand = f"${word:04x},X"
				elif mode == "absy":
					operand = f"${word:04x},Y"
				elif mode == "ind":
					operand = f"(${word:04x})"
				else:
					operand = f"${word:04x}"

			# Format instruction bytes
			if size == 1:
				bytes_str = f"{opcode:02x}      "
			elif size == 2:
				bytes_str = f"{opcode:02x} {rom[file_offset+1]:02x}   "
			else:
				bytes_str = f"{opcode:02x} {rom[file_offset+1]:02x} {rom[file_offset+2]:02x}"

			result.append(f"${addr:04x}: {bytes_str}  {mnemonic} {operand}")
			addr += size
		else:
			result.append(f"${addr:04x}: {opcode:02x}        .db ${opcode:02x}")
			addr += 1

	return result

def main():
	rom_path = "roms/Dragon Warrior IV (1992-10)(Enix)(US).nes"
	with open(rom_path, "rb") as f:
		rom = f.read()[16:]  # Skip iNES header

	# Disassemble Bank 8 region around multiply calls
	# Bank 8 file offset = 0x20000
	bank8_offset = 0x20000

	# Bank 18 file offset = 18 * 0x4000 = 0x48000
	bank18_offset = 0x48000

	print("=" * 60)
	print("Bank 18: Main loop $9FB9-$A020")
	print("=" * 60)
	lines = disassemble(rom, 0x9FB9, 0xA020, bank18_offset)
	for line in lines:
		print(line)

if __name__ == "__main__":
	main()
