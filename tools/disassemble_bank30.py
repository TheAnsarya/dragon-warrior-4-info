#!/usr/bin/env python3
"""
Disassemble Bank 30 - identified as having highest code density (293 subroutines).
Uses same methodology as Bank 31 disassembler.
"""

import os
from pathlib import Path

SCRIPT_DIR = Path(__file__).parent
ROM_PATH = SCRIPT_DIR.parent / "roms" / "Dragon Warrior IV (1992-10)(Enix)(US).nes"
OUTPUT_DIR = SCRIPT_DIR.parent / "disasm"

BANK = 30
HEADER_SIZE = 16
BANK_SIZE = 0x4000
CPU_BASE = 0x8000

# 6502 instruction definitions
INSTRUCTIONS = {
    # BRK/ORA/ASL etc
    0x00: ("BRK", 1, ""),
    0x01: ("ORA", 2, "(${:02X},X)"),
    0x05: ("ORA", 2, "${:02X}"),
    0x06: ("ASL", 2, "${:02X}"),
    0x08: ("PHP", 1, ""),
    0x09: ("ORA", 2, "#${:02X}"),
    0x0A: ("ASL", 1, "A"),
    0x0D: ("ORA", 3, "${:04X}"),
    0x0E: ("ASL", 3, "${:04X}"),
    0x10: ("BPL", 2, "${:04X}"),
    0x11: ("ORA", 2, "(${:02X}),Y"),
    0x15: ("ORA", 2, "${:02X},X"),
    0x16: ("ASL", 2, "${:02X},X"),
    0x18: ("CLC", 1, ""),
    0x19: ("ORA", 3, "${:04X},Y"),
    0x1D: ("ORA", 3, "${:04X},X"),
    0x1E: ("ASL", 3, "${:04X},X"),
    0x20: ("JSR", 3, "${:04X}"),
    0x21: ("AND", 2, "(${:02X},X)"),
    0x24: ("BIT", 2, "${:02X}"),
    0x25: ("AND", 2, "${:02X}"),
    0x26: ("ROL", 2, "${:02X}"),
    0x28: ("PLP", 1, ""),
    0x29: ("AND", 2, "#${:02X}"),
    0x2A: ("ROL", 1, "A"),
    0x2C: ("BIT", 3, "${:04X}"),
    0x2D: ("AND", 3, "${:04X}"),
    0x2E: ("ROL", 3, "${:04X}"),
    0x30: ("BMI", 2, "${:04X}"),
    0x31: ("AND", 2, "(${:02X}),Y"),
    0x35: ("AND", 2, "${:02X},X"),
    0x36: ("ROL", 2, "${:02X},X"),
    0x38: ("SEC", 1, ""),
    0x39: ("AND", 3, "${:04X},Y"),
    0x3D: ("AND", 3, "${:04X},X"),
    0x3E: ("ROL", 3, "${:04X},X"),
    0x40: ("RTI", 1, ""),
    0x41: ("EOR", 2, "(${:02X},X)"),
    0x45: ("EOR", 2, "${:02X}"),
    0x46: ("LSR", 2, "${:02X}"),
    0x48: ("PHA", 1, ""),
    0x49: ("EOR", 2, "#${:02X}"),
    0x4A: ("LSR", 1, "A"),
    0x4C: ("JMP", 3, "${:04X}"),
    0x4D: ("EOR", 3, "${:04X}"),
    0x4E: ("LSR", 3, "${:04X}"),
    0x50: ("BVC", 2, "${:04X}"),
    0x51: ("EOR", 2, "(${:02X}),Y"),
    0x55: ("EOR", 2, "${:02X},X"),
    0x56: ("LSR", 2, "${:02X},X"),
    0x58: ("CLI", 1, ""),
    0x59: ("EOR", 3, "${:04X},Y"),
    0x5D: ("EOR", 3, "${:04X},X"),
    0x5E: ("LSR", 3, "${:04X},X"),
    0x60: ("RTS", 1, ""),
    0x61: ("ADC", 2, "(${:02X},X)"),
    0x65: ("ADC", 2, "${:02X}"),
    0x66: ("ROR", 2, "${:02X}"),
    0x68: ("PLA", 1, ""),
    0x69: ("ADC", 2, "#${:02X}"),
    0x6A: ("ROR", 1, "A"),
    0x6C: ("JMP", 3, "(${:04X})"),
    0x6D: ("ADC", 3, "${:04X}"),
    0x6E: ("ROR", 3, "${:04X}"),
    0x70: ("BVS", 2, "${:04X}"),
    0x71: ("ADC", 2, "(${:02X}),Y"),
    0x75: ("ADC", 2, "${:02X},X"),
    0x76: ("ROR", 2, "${:02X},X"),
    0x78: ("SEI", 1, ""),
    0x79: ("ADC", 3, "${:04X},Y"),
    0x7D: ("ADC", 3, "${:04X},X"),
    0x7E: ("ROR", 3, "${:04X},X"),
    0x81: ("STA", 2, "(${:02X},X)"),
    0x84: ("STY", 2, "${:02X}"),
    0x85: ("STA", 2, "${:02X}"),
    0x86: ("STX", 2, "${:02X}"),
    0x88: ("DEY", 1, ""),
    0x8A: ("TXA", 1, ""),
    0x8C: ("STY", 3, "${:04X}"),
    0x8D: ("STA", 3, "${:04X}"),
    0x8E: ("STX", 3, "${:04X}"),
    0x90: ("BCC", 2, "${:04X}"),
    0x91: ("STA", 2, "(${:02X}),Y"),
    0x94: ("STY", 2, "${:02X},X"),
    0x95: ("STA", 2, "${:02X},X"),
    0x96: ("STX", 2, "${:02X},Y"),
    0x98: ("TYA", 1, ""),
    0x99: ("STA", 3, "${:04X},Y"),
    0x9A: ("TXS", 1, ""),
    0x9D: ("STA", 3, "${:04X},X"),
    0xA0: ("LDY", 2, "#${:02X}"),
    0xA1: ("LDA", 2, "(${:02X},X)"),
    0xA2: ("LDX", 2, "#${:02X}"),
    0xA4: ("LDY", 2, "${:02X}"),
    0xA5: ("LDA", 2, "${:02X}"),
    0xA6: ("LDX", 2, "${:02X}"),
    0xA8: ("TAY", 1, ""),
    0xA9: ("LDA", 2, "#${:02X}"),
    0xAA: ("TAX", 1, ""),
    0xAC: ("LDY", 3, "${:04X}"),
    0xAD: ("LDA", 3, "${:04X}"),
    0xAE: ("LDX", 3, "${:04X}"),
    0xB0: ("BCS", 2, "${:04X}"),
    0xB1: ("LDA", 2, "(${:02X}),Y"),
    0xB4: ("LDY", 2, "${:02X},X"),
    0xB5: ("LDA", 2, "${:02X},X"),
    0xB6: ("LDX", 2, "${:02X},Y"),
    0xB8: ("CLV", 1, ""),
    0xB9: ("LDA", 3, "${:04X},Y"),
    0xBA: ("TSX", 1, ""),
    0xBC: ("LDY", 3, "${:04X},X"),
    0xBD: ("LDA", 3, "${:04X},X"),
    0xBE: ("LDX", 3, "${:04X},Y"),
    0xC0: ("CPY", 2, "#${:02X}"),
    0xC1: ("CMP", 2, "(${:02X},X)"),
    0xC4: ("CPY", 2, "${:02X}"),
    0xC5: ("CMP", 2, "${:02X}"),
    0xC6: ("DEC", 2, "${:02X}"),
    0xC8: ("INY", 1, ""),
    0xC9: ("CMP", 2, "#${:02X}"),
    0xCA: ("DEX", 1, ""),
    0xCC: ("CPY", 3, "${:04X}"),
    0xCD: ("CMP", 3, "${:04X}"),
    0xCE: ("DEC", 3, "${:04X}"),
    0xD0: ("BNE", 2, "${:04X}"),
    0xD1: ("CMP", 2, "(${:02X}),Y"),
    0xD5: ("CMP", 2, "${:02X},X"),
    0xD6: ("DEC", 2, "${:02X},X"),
    0xD8: ("CLD", 1, ""),
    0xD9: ("CMP", 3, "${:04X},Y"),
    0xDD: ("CMP", 3, "${:04X},X"),
    0xDE: ("DEC", 3, "${:04X},X"),
    0xE0: ("CPX", 2, "#${:02X}"),
    0xE1: ("SBC", 2, "(${:02X},X)"),
    0xE4: ("CPX", 2, "${:02X}"),
    0xE5: ("SBC", 2, "${:02X}"),
    0xE6: ("INC", 2, "${:02X}"),
    0xE8: ("INX", 1, ""),
    0xE9: ("SBC", 2, "#${:02X}"),
    0xEA: ("NOP", 1, ""),
    0xEC: ("CPX", 3, "${:04X}"),
    0xED: ("SBC", 3, "${:04X}"),
    0xEE: ("INC", 3, "${:04X}"),
    0xF0: ("BEQ", 2, "${:04X}"),
    0xF1: ("SBC", 2, "(${:02X}),Y"),
    0xF5: ("SBC", 2, "${:02X},X"),
    0xF6: ("INC", 2, "${:02X},X"),
    0xF8: ("SED", 1, ""),
    0xF9: ("SBC", 3, "${:04X},Y"),
    0xFD: ("SBC", 3, "${:04X},X"),
    0xFE: ("INC", 3, "${:04X},X"),
}

# Branch instructions for calculating targets
BRANCH_OPS = {0x10, 0x30, 0x50, 0x70, 0x90, 0xB0, 0xD0, 0xF0}


def read_bank(rom):
    """Extract Bank 30 from ROM."""
    start = HEADER_SIZE + BANK * BANK_SIZE
    end = start + BANK_SIZE
    return rom[start:end]


def disassemble(bank_data, labels=None):
    """Disassemble the bank data."""
    if labels is None:
        labels = {}

    lines = []
    pc = 0

    # Header
    lines.append(f"; Dragon Warrior IV (NES) - Bank {BANK} Disassembly")
    lines.append(f"; Switchable bank at $8000-$BFFF")
    lines.append(f"; Generated by disassemble_bank30.py")
    lines.append("")
    lines.append(f".org ${CPU_BASE:04X}")
    lines.append("")

    # First pass: collect all branch/jump targets
    targets = set()
    temp_pc = 0
    while temp_pc < len(bank_data):
        cpu_addr = CPU_BASE + temp_pc
        opcode = bank_data[temp_pc]

        if opcode in INSTRUCTIONS:
            mnem, size, _ = INSTRUCTIONS[opcode]

            # Branch instructions
            if opcode in BRANCH_OPS and temp_pc + 1 < len(bank_data):
                offset = bank_data[temp_pc + 1]
                if offset >= 0x80:
                    offset -= 256
                target = cpu_addr + 2 + offset
                if CPU_BASE <= target < CPU_BASE + BANK_SIZE:
                    targets.add(target)

            # JSR/JMP absolute
            elif opcode in {0x20, 0x4C} and temp_pc + 2 < len(bank_data):
                target = bank_data[temp_pc + 1] | (bank_data[temp_pc + 2] << 8)
                if CPU_BASE <= target < CPU_BASE + BANK_SIZE:
                    targets.add(target)

            temp_pc += size
        else:
            temp_pc += 1

    # Second pass: disassemble with labels
    while pc < len(bank_data):
        cpu_addr = CPU_BASE + pc

        # Add label if this is a target
        if cpu_addr in targets or cpu_addr in labels:
            label = labels.get(cpu_addr, f"loc_{cpu_addr:04X}")
            lines.append("")
            lines.append(f"{label}:")

        opcode = bank_data[pc]

        if opcode in INSTRUCTIONS:
            mnem, size, fmt = INSTRUCTIONS[opcode]

            # Build instruction line
            hex_bytes = ' '.join(f'{bank_data[pc + i]:02X}' for i in range(min(size, len(bank_data) - pc)))

            if size == 1:
                operand = ""
            elif size == 2 and pc + 1 < len(bank_data):
                if opcode in BRANCH_OPS:
                    # Calculate branch target
                    offset = bank_data[pc + 1]
                    if offset >= 0x80:
                        offset -= 256
                    target = cpu_addr + 2 + offset
                    operand = fmt.format(target)
                else:
                    operand = fmt.format(bank_data[pc + 1])
            elif size == 3 and pc + 2 < len(bank_data):
                addr = bank_data[pc + 1] | (bank_data[pc + 2] << 8)
                operand = fmt.format(addr)
            else:
                operand = ""

            inst_str = f"{mnem} {operand}".strip()

            # Format line
            line = f"    {inst_str:24s} ; ${cpu_addr:04X}: {hex_bytes}"
            lines.append(line)

            pc += size
        else:
            # Unknown opcode - output as data
            lines.append(f"    .byte ${opcode:02X}             ; ${cpu_addr:04X} - unknown opcode")
            pc += 1

    return lines


def main():
    if not ROM_PATH.exists():
        print(f"ERROR: ROM not found at {ROM_PATH}")
        return

    with open(ROM_PATH, "rb") as f:
        rom = f.read()

    print(f"ROM loaded: {len(rom)} bytes")

    bank_data = read_bank(rom)
    print(f"Bank {BANK} extracted: {len(bank_data)} bytes")

    # Known labels (can be expanded)
    labels = {}

    # Disassemble
    lines = disassemble(bank_data, labels)

    # Write output
    OUTPUT_DIR.mkdir(exist_ok=True)
    output_file = OUTPUT_DIR / f"bank{BANK:02d}.asm"

    with open(output_file, "w", encoding="utf-8") as f:
        f.write("\n".join(lines))

    print(f"Disassembly written to {output_file}")
    print(f"Total lines: {len(lines)}")


if __name__ == "__main__":
    main()
