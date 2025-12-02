#!/usr/bin/env python3
"""
Dragon Warrior IV - DTE/Dictionary Analysis

Analyze the text decoding at $8272 which checks for bytes >= $80.
This is where DTE or dictionary decompression would happen.
"""

import os

ROM_PATH = os.path.join(os.path.dirname(__file__), '..', 'roms',
                        'Dragon Warrior IV (1992-10)(Enix)(US).nes')

# 6502 Opcode definitions
OPCODES = {
    0x00: ("BRK", "impl", 1), 0x05: ("ORA", "zp", 2), 0x06: ("ASL", "zp", 2),
    0x08: ("PHP", "impl", 1), 0x09: ("ORA", "imm", 2), 0x0A: ("ASL", "acc", 1),
    0x0D: ("ORA", "abs", 3), 0x0E: ("ASL", "abs", 3), 0x10: ("BPL", "rel", 2),
    0x18: ("CLC", "impl", 1), 0x20: ("JSR", "abs", 3), 0x24: ("BIT", "zp", 2),
    0x25: ("AND", "zp", 2), 0x26: ("ROL", "zp", 2), 0x28: ("PLP", "impl", 1),
    0x29: ("AND", "imm", 2), 0x2A: ("ROL", "acc", 1), 0x2C: ("BIT", "abs", 3),
    0x2D: ("AND", "abs", 3), 0x30: ("BMI", "rel", 2), 0x38: ("SEC", "impl", 1),
    0x40: ("RTI", "impl", 1), 0x45: ("EOR", "zp", 2), 0x46: ("LSR", "zp", 2),
    0x48: ("PHA", "impl", 1), 0x49: ("EOR", "imm", 2), 0x4A: ("LSR", "acc", 1),
    0x4C: ("JMP", "abs", 3), 0x4D: ("EOR", "abs", 3), 0x50: ("BVC", "rel", 2),
    0x58: ("CLI", "impl", 1), 0x60: ("RTS", "impl", 1), 0x65: ("ADC", "zp", 2),
    0x66: ("ROR", "zp", 2), 0x68: ("PLA", "impl", 1), 0x69: ("ADC", "imm", 2),
    0x6A: ("ROR", "acc", 1), 0x6C: ("JMP", "ind", 3), 0x6D: ("ADC", "abs", 3),
    0x70: ("BVS", "rel", 2), 0x78: ("SEI", "impl", 1), 0x81: ("STA", "indx", 2),
    0x84: ("STY", "zp", 2), 0x85: ("STA", "zp", 2), 0x86: ("STX", "zp", 2),
    0x88: ("DEY", "impl", 1), 0x8A: ("TXA", "impl", 1), 0x8C: ("STY", "abs", 3),
    0x8D: ("STA", "abs", 3), 0x8E: ("STX", "abs", 3), 0x90: ("BCC", "rel", 2),
    0x91: ("STA", "indy", 2), 0x95: ("STA", "zpx", 2), 0x98: ("TYA", "impl", 1),
    0x99: ("STA", "absy", 3), 0x9D: ("STA", "absx", 3), 0xA0: ("LDY", "imm", 2),
    0xA1: ("LDA", "indx", 2), 0xA2: ("LDX", "imm", 2), 0xA4: ("LDY", "zp", 2),
    0xA5: ("LDA", "zp", 2), 0xA6: ("LDX", "zp", 2), 0xA8: ("TAY", "impl", 1),
    0xA9: ("LDA", "imm", 2), 0xAA: ("TAX", "impl", 1), 0xAC: ("LDY", "abs", 3),
    0xAD: ("LDA", "abs", 3), 0xAE: ("LDX", "abs", 3), 0xB0: ("BCS", "rel", 2),
    0xB1: ("LDA", "indy", 2), 0xB4: ("LDY", "zpx", 2), 0xB5: ("LDA", "zpx", 2),
    0xB9: ("LDA", "absy", 3), 0xBA: ("TSX", "impl", 1), 0xBD: ("LDA", "absx", 3),
    0xC0: ("CPY", "imm", 2), 0xC4: ("CPY", "zp", 2), 0xC5: ("CMP", "zp", 2),
    0xC6: ("DEC", "zp", 2), 0xC8: ("INY", "impl", 1), 0xC9: ("CMP", "imm", 2),
    0xCA: ("DEX", "impl", 1), 0xCC: ("CPY", "abs", 3), 0xCD: ("CMP", "abs", 3),
    0xCE: ("DEC", "abs", 3), 0xD0: ("BNE", "rel", 2), 0xD5: ("CMP", "zpx", 2),
    0xD6: ("DEC", "zpx", 2), 0xD8: ("CLD", "impl", 1), 0xE0: ("CPX", "imm", 2),
    0xE4: ("CPX", "zp", 2), 0xE5: ("SBC", "zp", 2), 0xE6: ("INC", "zp", 2),
    0xE8: ("INX", "impl", 1), 0xE9: ("SBC", "imm", 2), 0xEA: ("NOP", "impl", 1),
    0xED: ("SBC", "abs", 3), 0xEE: ("INC", "abs", 3), 0xF0: ("BEQ", "rel", 2),
    0xF6: ("INC", "zpx", 2), 0xF8: ("SED", "impl", 1),
}


def disassemble(data, start_addr, num_bytes):
    """Disassemble bytes starting at given address."""
    result = []
    i = 0
    while i < num_bytes and i < len(data):
        addr = start_addr + i
        opcode = data[i]

        if opcode in OPCODES:
            mnem, mode, size = OPCODES[opcode]
            if i + size > len(data):
                break

            raw = data[i:i+size]
            hex_str = ' '.join(f'{b:02X}' for b in raw)

            if size == 1:
                operand = ""
            elif size == 2:
                op = data[i+1]
                if mode == 'rel':
                    target = addr + 2 + (op if op < 128 else op - 256)
                    operand = f"${target:04X}"
                elif mode == 'imm':
                    operand = f"#${op:02X}"
                else:
                    operand = f"${op:02X}"
            else:  # size == 3
                lo, hi = data[i+1], data[i+2]
                word = lo | (hi << 8)
                if mode == 'ind':
                    operand = f"(${word:04X})"
                else:
                    operand = f"${word:04X}"

            result.append(f"${addr:04X}: {hex_str:8} {mnem:4} {operand}")
            i += size
        else:
            result.append(f"${addr:04X}: {data[i]:02X}       .byte ${data[i]:02X}")
            i += 1

    return result


def main():
    with open(ROM_PATH, 'rb') as f:
        rom = f.read()

    bank22_start = 22 * 0x4000 + 0x10

    print("=" * 60)
    print(" DTE/DICTIONARY DECODING ANALYSIS")
    print(" Location: Bank 22 $8272")
    print("=" * 60)

    # Disassemble around $8272 where CMP #$80 was found
    offset = 0x8272 - 0x8000
    # Start a bit before to get context
    start_offset = offset - 32
    data = rom[bank22_start + start_offset:bank22_start + start_offset + 128]

    print("\nDisassembly around $8272:")
    print("-" * 60)
    for line in disassemble(data, 0x8000 + start_offset, 128):
        print(line)

    print("\n" + "=" * 60)
    print(" ANALYSIS")
    print("=" * 60)
    print("""
At $8272, the code checks:
  CMP #$80  ; Compare character with $80
  BCS $xxxx ; Branch if >= $80 (high bit set)

If the character byte >= $80, it branches to a decompression
routine that expands the byte into multiple characters.

This is the DTE/dictionary decoding path.
""")


if __name__ == '__main__':
    main()
