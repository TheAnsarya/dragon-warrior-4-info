#!/usr/bin/env python3
"""
Dragon Warrior IV (NES) - Extended Disassembler
===============================================

Disassembles key code sections and generates annotated ASM files.
"""

import os
import sys
from typing import Dict, List, Tuple, Optional, Set

# 6502 Opcode table
OPCODES = {
    0x00: ("BRK", "IMP", 1), 0x01: ("ORA", "IDX", 2), 0x05: ("ORA", "ZP", 2),
    0x06: ("ASL", "ZP", 2), 0x08: ("PHP", "IMP", 1), 0x09: ("ORA", "IMM", 2),
    0x0A: ("ASL", "IMP", 1), 0x0D: ("ORA", "ABS", 3), 0x0E: ("ASL", "ABS", 3),
    0x10: ("BPL", "REL", 2), 0x11: ("ORA", "IDY", 2), 0x15: ("ORA", "ZPX", 2),
    0x16: ("ASL", "ZPX", 2), 0x18: ("CLC", "IMP", 1), 0x19: ("ORA", "ABY", 3),
    0x1D: ("ORA", "ABX", 3), 0x1E: ("ASL", "ABX", 3), 0x20: ("JSR", "ABS", 3),
    0x21: ("AND", "IDX", 2), 0x24: ("BIT", "ZP", 2), 0x25: ("AND", "ZP", 2),
    0x26: ("ROL", "ZP", 2), 0x28: ("PLP", "IMP", 1), 0x29: ("AND", "IMM", 2),
    0x2A: ("ROL", "IMP", 1), 0x2C: ("BIT", "ABS", 3), 0x2D: ("AND", "ABS", 3),
    0x2E: ("ROL", "ABS", 3), 0x30: ("BMI", "REL", 2), 0x31: ("AND", "IDY", 2),
    0x35: ("AND", "ZPX", 2), 0x36: ("ROL", "ZPX", 2), 0x38: ("SEC", "IMP", 1),
    0x39: ("AND", "ABY", 3), 0x3D: ("AND", "ABX", 3), 0x3E: ("ROL", "ABX", 3),
    0x40: ("RTI", "IMP", 1), 0x41: ("EOR", "IDX", 2), 0x45: ("EOR", "ZP", 2),
    0x46: ("LSR", "ZP", 2), 0x48: ("PHA", "IMP", 1), 0x49: ("EOR", "IMM", 2),
    0x4A: ("LSR", "IMP", 1), 0x4C: ("JMP", "ABS", 3), 0x4D: ("EOR", "ABS", 3),
    0x4E: ("LSR", "ABS", 3), 0x50: ("BVC", "REL", 2), 0x51: ("EOR", "IDY", 2),
    0x55: ("EOR", "ZPX", 2), 0x56: ("LSR", "ZPX", 2), 0x58: ("CLI", "IMP", 1),
    0x59: ("EOR", "ABY", 3), 0x5D: ("EOR", "ABX", 3), 0x5E: ("LSR", "ABX", 3),
    0x60: ("RTS", "IMP", 1), 0x61: ("ADC", "IDX", 2), 0x65: ("ADC", "ZP", 2),
    0x66: ("ROR", "ZP", 2), 0x68: ("PLA", "IMP", 1), 0x69: ("ADC", "IMM", 2),
    0x6A: ("ROR", "IMP", 1), 0x6C: ("JMP", "IND", 3), 0x6D: ("ADC", "ABS", 3),
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

# Hardware registers
HW_REGS = {
    0x2000: "PPUCTRL",
    0x2001: "PPUMASK",
    0x2002: "PPUSTATUS",
    0x2003: "OAMADDR",
    0x2004: "OAMDATA",
    0x2005: "PPUSCROLL",
    0x2006: "PPUADDR",
    0x2007: "PPUDATA",
    0x4000: "APU_PULSE1_CTRL",
    0x4001: "APU_PULSE1_SWEEP",
    0x4002: "APU_PULSE1_LO",
    0x4003: "APU_PULSE1_HI",
    0x4004: "APU_PULSE2_CTRL",
    0x4005: "APU_PULSE2_SWEEP",
    0x4006: "APU_PULSE2_LO",
    0x4007: "APU_PULSE2_HI",
    0x4008: "APU_TRI_CTRL",
    0x400A: "APU_TRI_LO",
    0x400B: "APU_TRI_HI",
    0x400C: "APU_NOISE_CTRL",
    0x400E: "APU_NOISE_PERIOD",
    0x400F: "APU_NOISE_LEN",
    0x4010: "APU_DMC_CTRL",
    0x4011: "APU_DMC_LOAD",
    0x4012: "APU_DMC_ADDR",
    0x4013: "APU_DMC_LEN",
    0x4014: "OAMDMA",
    0x4015: "APU_STATUS",
    0x4016: "JOY1",
    0x4017: "JOY2_FRAME",
}

# Known game labels
LABELS = {
    0x0500: "mmc_bank_select",
    0x0501: "mmc_bank_data",
    0x0502: "nmi_jmp",
    0x0503: "nmi_handler_lo",
    0x0504: "nmi_handler_hi",
}


def load_rom(path):
    """Load ROM and parse header."""
    with open(path, 'rb') as f:
        data = f.read()

    prg_size = data[4] * 16384
    chr_size = data[5] * 8192
    mapper = (data[6] >> 4) | (data[7] & 0xF0)

    return {
        'data': data,
        'prg_size': prg_size,
        'chr_size': chr_size,
        'mapper': mapper,
        'prg_banks': data[4],
    }


def cpu_to_rom(cpu_addr, prg_size):
    """Convert CPU address to ROM offset for fixed bank."""
    if cpu_addr >= 0xC000:
        return 16 + prg_size - 0x10000 + cpu_addr
    return -1


def disassemble_instruction(rom_data, offset):
    """Disassemble single instruction."""
    if offset >= len(rom_data):
        return None

    opcode = rom_data[offset]
    if opcode not in OPCODES:
        return {
            'opcode': opcode,
            'mnemonic': '.db',
            'mode': 'DATA',
            'length': 1,
            'operand': bytes([opcode]),
            'target': None
        }

    mnemonic, mode, length = OPCODES[opcode]
    operand = rom_data[offset + 1:offset + length] if length > 1 else b''

    target = None
    if mode == 'REL' and len(operand) == 1:
        rel = operand[0]
        if rel >= 0x80:
            rel -= 0x100
        target = offset + length + rel
    elif mode in ('ABS', 'ABX', 'ABY', 'IND') and len(operand) == 2:
        target = operand[0] | (operand[1] << 8)

    return {
        'opcode': opcode,
        'mnemonic': mnemonic,
        'mode': mode,
        'length': length,
        'operand': operand,
        'target': target
    }


def format_operand(inst, labels, prg_size):
    """Format instruction operand."""
    mode = inst['mode']
    operand = inst['operand']

    if mode == 'IMP':
        return ''
    elif mode == 'IMM':
        return f'#${operand[0]:02X}'
    elif mode == 'ZP':
        addr = operand[0]
        if addr in LABELS:
            return LABELS[addr]
        return f'${addr:02X}'
    elif mode == 'ZPX':
        return f'${operand[0]:02X},X'
    elif mode == 'ZPY':
        return f'${operand[0]:02X},Y'
    elif mode == 'ABS':
        addr = operand[0] | (operand[1] << 8)
        if addr in HW_REGS:
            return HW_REGS[addr]
        if addr in LABELS:
            return LABELS[addr]
        if addr in labels:
            return labels[addr]
        return f'${addr:04X}'
    elif mode == 'ABX':
        addr = operand[0] | (operand[1] << 8)
        if addr in labels:
            return f'{labels[addr]},X'
        return f'${addr:04X},X'
    elif mode == 'ABY':
        addr = operand[0] | (operand[1] << 8)
        if addr in labels:
            return f'{labels[addr]},Y'
        return f'${addr:04X},Y'
    elif mode == 'IND':
        addr = operand[0] | (operand[1] << 8)
        return f'(${addr:04X})'
    elif mode == 'IDX':
        return f'(${operand[0]:02X},X)'
    elif mode == 'IDY':
        return f'(${operand[0]:02X}),Y'
    elif mode == 'REL':
        target = inst['target']
        if target:
            # Convert ROM offset to CPU address
            # This is tricky without knowing the bank
            return f'${target & 0xFFFF:04X}'
        return f'${operand[0]:02X}'
    elif mode == 'DATA':
        return f'${inst["opcode"]:02X}'
    return ''


def disassemble_range(rom, start_rom, start_cpu, length, labels=None):
    """Disassemble a range of code."""
    if labels is None:
        labels = {}

    lines = []
    offset = start_rom
    cpu = start_cpu
    end = start_rom + length

    while offset < end and offset < len(rom['data']):
        # Check for label
        if cpu in labels:
            lines.append(f'\n{labels[cpu]}:')

        inst = disassemble_instruction(rom['data'], offset)
        if inst is None:
            break

        # Format raw bytes
        raw = rom['data'][offset:offset + inst['length']]
        hex_str = ' '.join(f'{b:02X}' for b in raw)

        # Format operand
        op_str = format_operand(inst, labels, rom['prg_size'])

        # Add comment for hardware registers
        comment = ''
        if inst['target'] and inst['target'] in HW_REGS:
            comment = f'  ; {HW_REGS[inst["target"]]}'

        line = f'  ${cpu:04X}  {hex_str:<12}  {inst["mnemonic"]:<4} {op_str}{comment}'
        lines.append(line)

        offset += inst['length']
        cpu += inst['length']

    return lines


def find_jsr_targets(rom, start_rom, start_cpu, length):
    """Find all JSR targets in a code range."""
    targets = set()
    offset = start_rom

    while offset < start_rom + length and offset < len(rom['data']):
        inst = disassemble_instruction(rom['data'], offset)
        if inst is None:
            break

        if inst['mnemonic'] == 'JSR' and inst['target']:
            targets.add(inst['target'])

        offset += inst['length']

    return targets


def main():
    script_dir = os.path.dirname(os.path.abspath(__file__))
    project_root = os.path.dirname(script_dir)
    rom_path = os.path.join(project_root, 'roms', 'Dragon Warrior IV (1992-10)(Enix)(US).nes')

    if not os.path.exists(rom_path):
        print(f"ROM file not found: {rom_path}")
        sys.exit(1)

    print(f"Loading ROM: {rom_path}")
    rom = load_rom(rom_path)

    print(f"PRG-ROM: {rom['prg_size']} bytes ({rom['prg_banks']} banks)")
    print(f"Mapper: {rom['mapper']}")

    # Get vectors
    vec_offset = 16 + rom['prg_size'] - 6
    vec_nmi = rom['data'][vec_offset] | (rom['data'][vec_offset + 1] << 8)
    vec_reset = rom['data'][vec_offset + 2] | (rom['data'][vec_offset + 3] << 8)
    vec_irq = rom['data'][vec_offset + 4] | (rom['data'][vec_offset + 5] << 8)

    print(f"\nVectors:")
    print(f"  NMI:   ${vec_nmi:04X}")
    print(f"  RESET: ${vec_reset:04X}")
    print(f"  IRQ:   ${vec_irq:04X}")

    # Build labels
    labels = {
        vec_reset: 'Reset',
        0xC03D: 'Main_Init',
        0xC104: 'Sub_C104',
    }

    # Disassemble reset handler and main init
    reset_rom = cpu_to_rom(vec_reset, rom['prg_size'])

    print("\n" + "=" * 70)
    print("RESET AND MAIN INITIALIZATION")
    print("=" * 70)

    # Disassemble $C000-$C200 (init code area)
    init_rom = cpu_to_rom(0xC000, rom['prg_size'])
    lines = disassemble_range(rom, init_rom, 0xC000, 0x200, labels)

    for line in lines:
        print(line)

    # Find subroutines called from init
    print("\n" + "=" * 70)
    print("SUBROUTINES CALLED FROM INIT")
    print("=" * 70)

    jsr_targets = find_jsr_targets(rom, init_rom, 0xC000, 0x200)
    for target in sorted(jsr_targets):
        print(f"  ${target:04X}")

        # Disassemble first few instructions of each
        target_rom = cpu_to_rom(target, rom['prg_size'])
        if target_rom > 0:
            sub_lines = disassemble_range(rom, target_rom, target, 0x30, labels)
            for line in sub_lines[:10]:
                print(f"    {line.strip()}")
            print()

    # Save comprehensive disassembly
    output_dir = os.path.join(project_root, 'docs', 'disassembly')
    os.makedirs(output_dir, exist_ok=True)

    output_path = os.path.join(output_dir, 'main_init.asm')
    with open(output_path, 'w') as f:
        f.write("; Dragon Warrior IV (NES) - Main Initialization\n")
        f.write("; Auto-generated by extended_disassembler.py\n")
        f.write("; ============================================\n\n")
        f.write(f"; PRG-ROM: {rom['prg_size']} bytes\n")
        f.write(f"; Mapper: {rom['mapper']}\n\n")
        f.write(f"; RESET: ${vec_reset:04X}\n")
        f.write(f"; NMI:   ${vec_nmi:04X}\n")
        f.write(f"; IRQ:   ${vec_irq:04X}\n\n")

        # Disassemble larger range
        lines = disassemble_range(rom, init_rom, 0xC000, 0x400, labels)
        for line in lines:
            f.write(line + '\n')

    print(f"\nSaved to: {output_path}")

    # Now let's look for text-related code by searching for patterns
    print("\n" + "=" * 70)
    print("SEARCHING FOR TEXT-RELATED CODE PATTERNS")
    print("=" * 70)

    # Text code typically:
    # - Loads from text tables (LDA abs,X or LDA abs,Y)
    # - Compares with $FF (end of string)
    # - Writes to PPU ($2007)

    # Search fixed bank for CMP #$FF followed by BEQ
    prg_start = 16
    prg_end = 16 + rom['prg_size']

    patterns_found = []
    for i in range(prg_start, prg_end - 3):
        # Look for CMP #$FF, BEQ pattern
        if rom['data'][i] == 0xC9 and rom['data'][i+1] == 0xFF and rom['data'][i+2] == 0xF0:
            patterns_found.append(i)

    print(f"Found {len(patterns_found)} 'CMP #$FF, BEQ' patterns (string terminator check)")

    # Show first 10 with context
    for offset in patterns_found[:10]:
        bank = (offset - 16) // 0x4000
        bank_offset = (offset - 16) % 0x4000
        cpu_addr = 0x8000 + bank_offset

        # Disassemble surrounding code
        print(f"\n  Bank {bank}, ${cpu_addr:04X} (ROM 0x{offset:05X}):")

        context_start = max(prg_start, offset - 16)
        lines = disassemble_range(rom, context_start, cpu_addr - (offset - context_start), 32, {})
        for line in lines[:8]:
            marker = ">>>" if f"${cpu_addr:04X}" in line else "   "
            print(f"  {marker} {line.strip()}")


if __name__ == '__main__':
    main()
