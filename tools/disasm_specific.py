#!/usr/bin/env python3
"""Quick script to disassemble specific banks"""

import os
import sys
from typing import Dict, List, Set, Tuple, Optional
from collections import defaultdict

# Complete 6502 opcode table
OPCODES = {
    0x00: ("BRK", "IMP", 1), 0x01: ("ORA", "IDX", 2), 0x05: ("ORA", "ZP", 2),
    0x06: ("ASL", "ZP", 2), 0x08: ("PHP", "IMP", 1), 0x09: ("ORA", "IMM", 2),
    0x0A: ("ASL", "ACC", 1), 0x0D: ("ORA", "ABS", 3), 0x0E: ("ASL", "ABS", 3),
    0x10: ("BPL", "REL", 2), 0x11: ("ORA", "IDY", 2), 0x15: ("ORA", "ZPX", 2),
    0x16: ("ASL", "ZPX", 2), 0x18: ("CLC", "IMP", 1), 0x19: ("ORA", "ABY", 3),
    0x1D: ("ORA", "ABX", 3), 0x1E: ("ASL", "ABX", 3), 0x20: ("JSR", "ABS", 3),
    0x21: ("AND", "IDX", 2), 0x24: ("BIT", "ZP", 2), 0x25: ("AND", "ZP", 2),
    0x26: ("ROL", "ZP", 2), 0x28: ("PLP", "IMP", 1), 0x29: ("AND", "IMM", 2),
    0x2A: ("ROL", "ACC", 1), 0x2C: ("BIT", "ABS", 3), 0x2D: ("AND", "ABS", 3),
    0x2E: ("ROL", "ABS", 3), 0x30: ("BMI", "REL", 2), 0x31: ("AND", "IDY", 2),
    0x35: ("AND", "ZPX", 2), 0x36: ("ROL", "ZPX", 2), 0x38: ("SEC", "IMP", 1),
    0x39: ("AND", "ABY", 3), 0x3D: ("AND", "ABX", 3), 0x3E: ("ROL", "ABX", 3),
    0x40: ("RTI", "IMP", 1), 0x41: ("EOR", "IDX", 2), 0x45: ("EOR", "ZP", 2),
    0x46: ("LSR", "ZP", 2), 0x48: ("PHA", "IMP", 1), 0x49: ("EOR", "IMM", 2),
    0x4A: ("LSR", "ACC", 1), 0x4C: ("JMP", "ABS", 3), 0x4D: ("EOR", "ABS", 3),
    0x4E: ("LSR", "ABS", 3), 0x50: ("BVC", "REL", 2), 0x51: ("EOR", "IDY", 2),
    0x55: ("EOR", "ZPX", 2), 0x56: ("LSR", "ZPX", 2), 0x58: ("CLI", "IMP", 1),
    0x59: ("EOR", "ABY", 3), 0x5D: ("EOR", "ABX", 3), 0x5E: ("LSR", "ABX", 3),
    0x60: ("RTS", "IMP", 1), 0x61: ("ADC", "IDX", 2), 0x65: ("ADC", "ZP", 2),
    0x66: ("ROR", "ZP", 2), 0x68: ("PLA", "IMP", 1), 0x69: ("ADC", "IMM", 2),
    0x6A: ("ROR", "ACC", 1), 0x6C: ("JMP", "IND", 3), 0x6D: ("ADC", "ABS", 3),
    0x6E: ("ROR", "ABS", 3), 0x70: ("BVS", "REL", 2), 0x71: ("ADC", "IDY", 2),
    0x75: ("ADC", "ZPX", 2), 0x76: ("ROR", "ZPX", 2), 0x78: ("SEI", "IMP", 1),
    0x79: ("ADC", "ABY", 3), 0x7D: ("ADC", "ABX", 3), 0x7E: ("ROR", "ABX", 3),
    0x81: ("STA", "IDX", 2), 0x84: ("STY", "ZP", 2), 0x85: ("STA", "ZP", 2),
    0x86: ("STX", "ZP", 2), 0x88: ("DEY", "IMP", 1), 0x8A: ("TXA", "IMP", 1),
    0x8C: ("STY", "ABS", 3), 0x8D: ("STA", "ABS", 3), 0x8E: ("STX", "ABS", 3),
    0x90: ("BCC", "REL", 2), 0x91: ("STA", "IDY", 2), 0x94: ("STY", "ZPX", 2),
    0x95: ("STA", "ZPX", 2), 0x96: ("STX", "ZPY", 2), 0x98: ("TYA", "IMP", 1),
    0x99: ("STA", "ABY", 3), 0x9A: ("TXS", "IMP", 1), 0x9D: ("STA", "ABX", 3),
    0xA0: ("LDY", "IMM", 2), 0xA1: ("LDA", "IDX", 2), 0xA2: ("LDX", "IMM", 2),
    0xA4: ("LDY", "ZP", 2), 0xA5: ("LDA", "ZP", 2), 0xA6: ("LDX", "ZP", 2),
    0xA8: ("TAY", "IMP", 1), 0xA9: ("LDA", "IMM", 2), 0xAA: ("TAX", "IMP", 1),
    0xAC: ("LDY", "ABS", 3), 0xAD: ("LDA", "ABS", 3), 0xAE: ("LDX", "ABS", 3),
    0xB0: ("BCS", "REL", 2), 0xB1: ("LDA", "IDY", 2), 0xB4: ("LDY", "ZPX", 2),
    0xB5: ("LDA", "ZPX", 2), 0xB6: ("LDX", "ZPY", 2), 0xB8: ("CLV", "IMP", 1),
    0xB9: ("LDA", "ABY", 3), 0xBA: ("TSX", "IMP", 1), 0xBC: ("LDY", "ABX", 3),
    0xBD: ("LDA", "ABX", 3), 0xBE: ("LDX", "ABY", 3), 0xC0: ("CPY", "IMM", 2),
    0xC1: ("CMP", "IDX", 2), 0xC4: ("CPY", "ZP", 2), 0xC5: ("CMP", "ZP", 2),
    0xC6: ("DEC", "ZP", 2), 0xC8: ("INY", "IMP", 1), 0xC9: ("CMP", "IMM", 2),
    0xCA: ("DEX", "IMP", 1), 0xCC: ("CPY", "ABS", 3), 0xCD: ("CMP", "ABS", 3),
    0xCE: ("DEC", "ABS", 3), 0xD0: ("BNE", "REL", 2), 0xD1: ("CMP", "IDY", 2),
    0xD5: ("CMP", "ZPX", 2), 0xD6: ("DEC", "ZPX", 2), 0xD8: ("CLD", "IMP", 1),
    0xD9: ("CMP", "ABY", 3), 0xDD: ("CMP", "ABX", 3), 0xDE: ("DEC", "ABX", 3),
    0xE0: ("CPX", "IMM", 2), 0xE1: ("SBC", "IDX", 2), 0xE4: ("CPX", "ZP", 2),
    0xE5: ("SBC", "ZP", 2), 0xE6: ("INC", "ZP", 2), 0xE8: ("INX", "IMP", 1),
    0xE9: ("SBC", "IMM", 2), 0xEA: ("NOP", "IMP", 1), 0xEC: ("CPX", "ABS", 3),
    0xED: ("SBC", "ABS", 3), 0xEE: ("INC", "ABS", 3), 0xF0: ("BEQ", "REL", 2),
    0xF1: ("SBC", "IDY", 2), 0xF5: ("SBC", "ZPX", 2), 0xF6: ("INC", "ZPX", 2),
    0xF8: ("SED", "IMP", 1), 0xF9: ("SBC", "ABY", 3), 0xFD: ("SBC", "ABX", 3),
    0xFE: ("INC", "ABX", 3),
}

ZP_NAMES = {
    0x00: "tmp0", 0x01: "tmp1", 0x02: "tmp2", 0x03: "tmp3",
    0x04: "ptr0_lo", 0x05: "ptr0_hi", 0x10: "ptr_lo", 0x11: "ptr_hi",
    0x1F: "system_flags",
}

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
PROJECT_DIR = os.path.dirname(SCRIPT_DIR)
ROM_PATH = os.path.join(PROJECT_DIR, "roms", "Dragon Warrior IV (1992-10)(Enix)(US).nes")
OUTPUT_DIR = os.path.join(PROJECT_DIR, "disasm", "banks")

BANKS = [27, 28, 29, 30]

def disassemble_bank(rom_data, bank_num):
    """Simple disassemble a 16KB bank"""
    header_size = 16
    bank_size = 0x4000
    bank_start = header_size + (bank_num * bank_size)
    bank_data = rom_data[bank_start:bank_start + bank_size]
    
    lines = []
    lines.append(f"; Dragon Warrior IV - Bank {bank_num} Disassembly")
    lines.append(f"; ROM Offset: ${bank_start:05X} - ${bank_start + bank_size - 1:05X}")
    lines.append(f"; CPU Address: $8000-$BFFF (when mapped)")
    lines.append("; " + "=" * 70)
    lines.append("")
    
    pc = 0
    cpu_addr = 0x8000
    
    while pc < len(bank_data):
        opcode = bank_data[pc]
        
        if opcode in OPCODES:
            mnemonic, mode, size = OPCODES[opcode]
            
            # Build instruction bytes
            instr_bytes = [bank_data[pc + i] if pc + i < len(bank_data) else 0 for i in range(size)]
            hex_str = " ".join(f"{b:02X}" for b in instr_bytes)
            
            # Format operand
            if mode == "IMP" or mode == "ACC":
                operand = ""
            elif mode == "IMM":
                operand = f"#${instr_bytes[1]:02X}"
            elif mode == "ZP":
                zp = instr_bytes[1]
                name = ZP_NAMES.get(zp, f"${zp:02X}")
                operand = name
            elif mode == "ZPX":
                zp = instr_bytes[1]
                name = ZP_NAMES.get(zp, f"${zp:02X}")
                operand = f"{name},X"
            elif mode == "ZPY":
                zp = instr_bytes[1]
                name = ZP_NAMES.get(zp, f"${zp:02X}")
                operand = f"{name},Y"
            elif mode == "ABS":
                addr = instr_bytes[1] | (instr_bytes[2] << 8)
                operand = f"${addr:04X}"
            elif mode == "ABX":
                addr = instr_bytes[1] | (instr_bytes[2] << 8)
                operand = f"${addr:04X},X"
            elif mode == "ABY":
                addr = instr_bytes[1] | (instr_bytes[2] << 8)
                operand = f"${addr:04X},Y"
            elif mode == "IND":
                addr = instr_bytes[1] | (instr_bytes[2] << 8)
                operand = f"(${addr:04X})"
            elif mode == "IDX":
                zp = instr_bytes[1]
                name = ZP_NAMES.get(zp, f"${zp:02X}")
                operand = f"({name},X)"
            elif mode == "IDY":
                zp = instr_bytes[1]
                name = ZP_NAMES.get(zp, f"${zp:02X}")
                operand = f"({name}),Y"
            elif mode == "REL":
                offset = instr_bytes[1]
                if offset >= 0x80:
                    offset -= 0x100
                target = cpu_addr + 2 + offset
                operand = f"${target:04X}"
            else:
                operand = ""
            
            # Format line
            instr = f"{mnemonic} {operand}".strip()
            line = f"    {instr:24s}; ${cpu_addr:04X}: {hex_str}"
            lines.append(line)
            
            pc += size
            cpu_addr += size
        else:
            # Unknown opcode - output as data
            lines.append(f"    .byte ${opcode:02X}            ; ${cpu_addr:04X}")
            pc += 1
            cpu_addr += 1
    
    return "\n".join(lines)


def main():
    with open(ROM_PATH, "rb") as f:
        rom_data = f.read()
    
    os.makedirs(OUTPUT_DIR, exist_ok=True)
    
    for bank in BANKS:
        output_path = os.path.join(OUTPUT_DIR, f"bank_{bank:02d}.asm")
        print(f"Disassembling Bank {bank} -> {output_path}")
        
        asm = disassemble_bank(rom_data, bank)
        with open(output_path, 'w') as f:
            f.write(asm)
    
    print("Done!")


if __name__ == "__main__":
    main()
