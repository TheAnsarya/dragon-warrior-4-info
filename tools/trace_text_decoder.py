#!/usr/bin/env python3
"""
Find the actual DTE table by analyzing the text decoder routine.

The text decoder at Bank 22 $B34E uses a DTE table for codes $80+.
Let's trace the code more carefully.
"""

import os

ROM_PATH = os.path.join(os.path.dirname(__file__), '..', 'roms',
                        'Dragon Warrior IV (1992-10)(Enix)(US).nes')

def load_rom():
    with open(ROM_PATH, 'rb') as f:
        return f.read()

def disassemble_region(rom_data, bank_offset, start_addr, length):
    """Simple disassembler for 6502 code."""

    # Common 6502 opcodes
    opcodes = {
        0x00: ("BRK", 1), 0x01: ("ORA (zp,X)", 2),
        0x05: ("ORA zp", 2), 0x06: ("ASL zp", 2),
        0x08: ("PHP", 1), 0x09: ("ORA #", 2),
        0x0A: ("ASL A", 1), 0x10: ("BPL rel", 2),
        0x18: ("CLC", 1), 0x20: ("JSR abs", 3),
        0x24: ("BIT zp", 2), 0x25: ("AND zp", 2),
        0x26: ("ROL zp", 2), 0x29: ("AND #", 2),
        0x2A: ("ROL A", 1), 0x30: ("BMI rel", 2),
        0x38: ("SEC", 1), 0x4C: ("JMP abs", 3),
        0x48: ("PHA", 1), 0x49: ("EOR #", 2),
        0x4A: ("LSR A", 1), 0x60: ("RTS", 1),
        0x65: ("ADC zp", 2), 0x66: ("ROR zp", 2),
        0x68: ("PLA", 1), 0x69: ("ADC #", 2),
        0x6A: ("ROR A", 1), 0x6C: ("JMP (abs)", 3),
        0x78: ("SEI", 1), 0x84: ("STY zp", 2),
        0x85: ("STA zp", 2), 0x86: ("STX zp", 2),
        0x88: ("DEY", 1), 0x8A: ("TXA", 1),
        0x8C: ("STY abs", 3), 0x8D: ("STA abs", 3),
        0x8E: ("STX abs", 3), 0x90: ("BCC rel", 2),
        0x91: ("STA (zp),Y", 2), 0x94: ("STY zp,X", 2),
        0x95: ("STA zp,X", 2), 0x98: ("TYA", 1),
        0x99: ("STA abs,Y", 3), 0x9A: ("TXS", 1),
        0x9D: ("STA abs,X", 3), 0xA0: ("LDY #", 2),
        0xA2: ("LDX #", 2), 0xA4: ("LDY zp", 2),
        0xA5: ("LDA zp", 2), 0xA6: ("LDX zp", 2),
        0xA8: ("TAY", 1), 0xA9: ("LDA #", 2),
        0xAA: ("TAX", 1), 0xAC: ("LDY abs", 3),
        0xAD: ("LDA abs", 3), 0xAE: ("LDX abs", 3),
        0xB0: ("BCS rel", 2), 0xB1: ("LDA (zp),Y", 2),
        0xB4: ("LDY zp,X", 2), 0xB5: ("LDA zp,X", 2),
        0xB9: ("LDA abs,Y", 3), 0xBD: ("LDA abs,X", 3),
        0xC0: ("CPY #", 2), 0xC4: ("CPY zp", 2),
        0xC5: ("CMP zp", 2), 0xC6: ("DEC zp", 2),
        0xC8: ("INY", 1), 0xC9: ("CMP #", 2),
        0xCA: ("DEX", 1), 0xCC: ("CPY abs", 3),
        0xCD: ("CMP abs", 3), 0xD0: ("BNE rel", 2),
        0xD5: ("CMP zp,X", 2), 0xD8: ("CLD", 1),
        0xD9: ("CMP abs,Y", 3), 0xDD: ("CMP abs,X", 3),
        0xE0: ("CPX #", 2), 0xE4: ("CPX zp", 2),
        0xE5: ("SBC zp", 2), 0xE6: ("INC zp", 2),
        0xE8: ("INX", 1), 0xE9: ("SBC #", 2),
        0xEA: ("NOP", 1), 0xEC: ("CPX abs", 3),
        0xED: ("SBC abs", 3), 0xEE: ("INC abs", 3),
        0xF0: ("BEQ rel", 2), 0xF6: ("INC zp,X", 2),
        0xF8: ("SED", 1), 0xFD: ("SBC abs,X", 3),
    }

    rom_offset = bank_offset + (start_addr - 0x8000)
    pc = start_addr
    i = 0

    lines = []

    while i < length:
        byte = rom_data[rom_offset + i]

        if byte in opcodes:
            mnemonic, size = opcodes[byte]

            if size == 1:
                line = f"${pc:04X}: {byte:02X}         {mnemonic}"
            elif size == 2:
                operand = rom_data[rom_offset + i + 1]
                if 'rel' in mnemonic:
                    # Relative branch
                    target = pc + 2 + (operand if operand < 128 else operand - 256)
                    line = f"${pc:04X}: {byte:02X} {operand:02X}      {mnemonic.replace('rel', f'${target:04X}')}"
                elif '#' in mnemonic:
                    line = f"${pc:04X}: {byte:02X} {operand:02X}      {mnemonic}${operand:02X}"
                else:
                    line = f"${pc:04X}: {byte:02X} {operand:02X}      {mnemonic.replace('zp', f'${operand:02X}')}"
            else:
                lo = rom_data[rom_offset + i + 1]
                hi = rom_data[rom_offset + i + 2]
                addr = lo | (hi << 8)
                line = f"${pc:04X}: {byte:02X} {lo:02X} {hi:02X}   {mnemonic.replace('abs', f'${addr:04X}')}"

            lines.append(line)
            i += size
            pc += size
        else:
            line = f"${pc:04X}: {byte:02X}         .byte ${byte:02X}"
            lines.append(line)
            i += 1
            pc += 1

    return lines

def main():
    rom_data = load_rom()

    # Bank 22 starts at ROM offset 0x58010
    bank22_offset = 0x58010

    print("Dragon Warrior IV - Text Decoder Analysis")
    print("=" * 60)

    # Disassemble the text decoder routine at $B34E
    print("\nText Decoder at $B34E (Bank 22):")
    print("-" * 60)

    lines = disassemble_region(rom_data, bank22_offset, 0xB34E, 0x80)
    for line in lines:
        print(line)

    # Now let's look at the DTE lookup routine
    print("\n" + "=" * 60)
    print("DTE Lookup at $B370 (Bank 22):")
    print("-" * 60)

    lines = disassemble_region(rom_data, bank22_offset, 0xB370, 0x30)
    for line in lines:
        print(line)

    # Check what's at the DTE table addresses we see in the code
    print("\n" + "=" * 60)
    print("Examining potential DTE table locations:")
    print("-" * 60)

    # Look for references to tables in the code
    # The DTE lookup should have LDA $xxxx,X or similar

    # Search for common DTE table reference patterns in Bank 22
    for i in range(0x58010, 0x5C000):
        if rom_data[i] == 0xBD:  # LDA abs,X
            lo = rom_data[i+1]
            hi = rom_data[i+2]
            addr = lo | (hi << 8)
            if 0xB300 <= addr <= 0xBFFF:
                bank_addr = 0x8000 + (i - 0x58010)
                print(f"${bank_addr:04X}: LDA ${addr:04X},X")

if __name__ == '__main__':
    main()
