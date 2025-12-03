#!/usr/bin/env python3
"""
Dragon Warrior 4 NES - $601C Code Finder

Specifically searches for code that increments or modifies $601C
which appears to be the experience increment address.
"""

import os

def load_rom(rom_path):
    """Load the ROM file."""
    with open(rom_path, 'rb') as f:
        data = f.read()
    return data

def get_bank_info(rom_offset, rom_size):
    """Get bank number and CPU address for a ROM offset."""
    bank = rom_offset // 0x4000
    total_banks = rom_size // 0x4000

    if bank == total_banks - 1:  # Last bank = fixed
        offset = 0xC000 + (rom_offset % 0x4000)
    else:
        offset = 0x8000 + (rom_offset % 0x4000)

    return bank, offset

def disassemble_instruction(data, offset):
    """Disassemble a single instruction."""

    if offset >= len(data):
        return None, 0

    opcode = data[offset]

    # Opcodes with their size and mnemonic
    opcodes = {
        0x00: ('BRK', 1, 'imp'),
        0x01: ('ORA', 2, 'izx'),
        0x05: ('ORA', 2, 'zpg'),
        0x06: ('ASL', 2, 'zpg'),
        0x08: ('PHP', 1, 'imp'),
        0x09: ('ORA', 2, 'imm'),
        0x0A: ('ASL', 1, 'acc'),
        0x0D: ('ORA', 3, 'abs'),
        0x0E: ('ASL', 3, 'abs'),
        0x10: ('BPL', 2, 'rel'),
        0x11: ('ORA', 2, 'izy'),
        0x15: ('ORA', 2, 'zpx'),
        0x16: ('ASL', 2, 'zpx'),
        0x18: ('CLC', 1, 'imp'),
        0x19: ('ORA', 3, 'aby'),
        0x1D: ('ORA', 3, 'abx'),
        0x1E: ('ASL', 3, 'abx'),
        0x20: ('JSR', 3, 'abs'),
        0x21: ('AND', 2, 'izx'),
        0x24: ('BIT', 2, 'zpg'),
        0x25: ('AND', 2, 'zpg'),
        0x26: ('ROL', 2, 'zpg'),
        0x28: ('PLP', 1, 'imp'),
        0x29: ('AND', 2, 'imm'),
        0x2A: ('ROL', 1, 'acc'),
        0x2C: ('BIT', 3, 'abs'),
        0x2D: ('AND', 3, 'abs'),
        0x2E: ('ROL', 3, 'abs'),
        0x30: ('BMI', 2, 'rel'),
        0x31: ('AND', 2, 'izy'),
        0x35: ('AND', 2, 'zpx'),
        0x36: ('ROL', 2, 'zpx'),
        0x38: ('SEC', 1, 'imp'),
        0x39: ('AND', 3, 'aby'),
        0x3D: ('AND', 3, 'abx'),
        0x3E: ('ROL', 3, 'abx'),
        0x40: ('RTI', 1, 'imp'),
        0x41: ('EOR', 2, 'izx'),
        0x45: ('EOR', 2, 'zpg'),
        0x46: ('LSR', 2, 'zpg'),
        0x48: ('PHA', 1, 'imp'),
        0x49: ('EOR', 2, 'imm'),
        0x4A: ('LSR', 1, 'acc'),
        0x4C: ('JMP', 3, 'abs'),
        0x4D: ('EOR', 3, 'abs'),
        0x4E: ('LSR', 3, 'abs'),
        0x50: ('BVC', 2, 'rel'),
        0x51: ('EOR', 2, 'izy'),
        0x55: ('EOR', 2, 'zpx'),
        0x56: ('LSR', 2, 'zpx'),
        0x58: ('CLI', 1, 'imp'),
        0x59: ('EOR', 3, 'aby'),
        0x5D: ('EOR', 3, 'abx'),
        0x5E: ('LSR', 3, 'abx'),
        0x60: ('RTS', 1, 'imp'),
        0x61: ('ADC', 2, 'izx'),
        0x65: ('ADC', 2, 'zpg'),
        0x66: ('ROR', 2, 'zpg'),
        0x68: ('PLA', 1, 'imp'),
        0x69: ('ADC', 2, 'imm'),
        0x6A: ('ROR', 1, 'acc'),
        0x6C: ('JMP', 3, 'ind'),
        0x6D: ('ADC', 3, 'abs'),
        0x6E: ('ROR', 3, 'abs'),
        0x70: ('BVS', 2, 'rel'),
        0x71: ('ADC', 2, 'izy'),
        0x75: ('ADC', 2, 'zpx'),
        0x76: ('ROR', 2, 'zpx'),
        0x78: ('SEI', 1, 'imp'),
        0x79: ('ADC', 3, 'aby'),
        0x7D: ('ADC', 3, 'abx'),
        0x7E: ('ROR', 3, 'abx'),
        0x81: ('STA', 2, 'izx'),
        0x84: ('STY', 2, 'zpg'),
        0x85: ('STA', 2, 'zpg'),
        0x86: ('STX', 2, 'zpg'),
        0x88: ('DEY', 1, 'imp'),
        0x8A: ('TXA', 1, 'imp'),
        0x8C: ('STY', 3, 'abs'),
        0x8D: ('STA', 3, 'abs'),
        0x8E: ('STX', 3, 'abs'),
        0x90: ('BCC', 2, 'rel'),
        0x91: ('STA', 2, 'izy'),
        0x94: ('STY', 2, 'zpx'),
        0x95: ('STA', 2, 'zpx'),
        0x96: ('STX', 2, 'zpy'),
        0x98: ('TYA', 1, 'imp'),
        0x99: ('STA', 3, 'aby'),
        0x9A: ('TXS', 1, 'imp'),
        0x9D: ('STA', 3, 'abx'),
        0xA0: ('LDY', 2, 'imm'),
        0xA1: ('LDA', 2, 'izx'),
        0xA2: ('LDX', 2, 'imm'),
        0xA4: ('LDY', 2, 'zpg'),
        0xA5: ('LDA', 2, 'zpg'),
        0xA6: ('LDX', 2, 'zpg'),
        0xA8: ('TAY', 1, 'imp'),
        0xA9: ('LDA', 2, 'imm'),
        0xAA: ('TAX', 1, 'imp'),
        0xAC: ('LDY', 3, 'abs'),
        0xAD: ('LDA', 3, 'abs'),
        0xAE: ('LDX', 3, 'abs'),
        0xB0: ('BCS', 2, 'rel'),
        0xB1: ('LDA', 2, 'izy'),
        0xB4: ('LDY', 2, 'zpx'),
        0xB5: ('LDA', 2, 'zpx'),
        0xB6: ('LDX', 2, 'zpy'),
        0xB8: ('CLV', 1, 'imp'),
        0xB9: ('LDA', 3, 'aby'),
        0xBA: ('TSX', 1, 'imp'),
        0xBC: ('LDY', 3, 'abx'),
        0xBD: ('LDA', 3, 'abx'),
        0xBE: ('LDX', 3, 'aby'),
        0xC0: ('CPY', 2, 'imm'),
        0xC1: ('CMP', 2, 'izx'),
        0xC4: ('CPY', 2, 'zpg'),
        0xC5: ('CMP', 2, 'zpg'),
        0xC6: ('DEC', 2, 'zpg'),
        0xC8: ('INY', 1, 'imp'),
        0xC9: ('CMP', 2, 'imm'),
        0xCA: ('DEX', 1, 'imp'),
        0xCC: ('CPY', 3, 'abs'),
        0xCD: ('CMP', 3, 'abs'),
        0xCE: ('DEC', 3, 'abs'),
        0xD0: ('BNE', 2, 'rel'),
        0xD1: ('CMP', 2, 'izy'),
        0xD5: ('CMP', 2, 'zpx'),
        0xD6: ('DEC', 2, 'zpx'),
        0xD8: ('CLD', 1, 'imp'),
        0xD9: ('CMP', 3, 'aby'),
        0xDD: ('CMP', 3, 'abx'),
        0xDE: ('DEC', 3, 'abx'),
        0xE0: ('CPX', 2, 'imm'),
        0xE1: ('SBC', 2, 'izx'),
        0xE4: ('CPX', 2, 'zpg'),
        0xE5: ('SBC', 2, 'zpg'),
        0xE6: ('INC', 2, 'zpg'),
        0xE8: ('INX', 1, 'imp'),
        0xE9: ('SBC', 2, 'imm'),
        0xEA: ('NOP', 1, 'imp'),
        0xEC: ('CPX', 3, 'abs'),
        0xED: ('SBC', 3, 'abs'),
        0xEE: ('INC', 3, 'abs'),
        0xF0: ('BEQ', 2, 'rel'),
        0xF1: ('SBC', 2, 'izy'),
        0xF5: ('SBC', 2, 'zpx'),
        0xF6: ('INC', 2, 'zpx'),
        0xF8: ('SED', 1, 'imp'),
        0xF9: ('SBC', 3, 'aby'),
        0xFD: ('SBC', 3, 'abx'),
        0xFE: ('INC', 3, 'abx'),
    }

    if opcode not in opcodes:
        return (f'.byte ${opcode:02X}', opcode, None, None), 1

    mnemonic, size, mode = opcodes[opcode]

    if size == 1:
        return (mnemonic, opcode, None, mode), 1
    elif size == 2:
        if offset + 1 >= len(data):
            return None, 0
        operand = data[offset + 1]
        return (mnemonic, opcode, operand, mode), 2
    elif size == 3:
        if offset + 2 >= len(data):
            return None, 0
        lo = data[offset + 1]
        hi = data[offset + 2]
        operand = (hi << 8) | lo
        return (mnemonic, opcode, operand, mode), 3

    return None, 0

def disassemble_context(data, offset, cpu_addr, context_before=10, context_after=10):
    """Disassemble code around a given offset."""

    lines = []

    # Find starting point (approximate - start earlier to get context)
    start = max(0, offset - context_before * 3)

    # Disassemble forward from start until we pass our target
    current = start
    found_target = False
    target_reached = False
    instructions_after = 0

    while current < len(data):
        result, size = disassemble_instruction(data, current)
        if result is None:
            current += 1
            continue

        mnemonic, opcode, operand, mode = result

        # Calculate CPU address for this instruction
        curr_cpu = cpu_addr - (offset - current)

        # Format operand
        if operand is None:
            operand_str = ''
        elif mode == 'imm':
            operand_str = f' #${operand:02X}'
        elif mode in ['zpg', 'zpx', 'zpy']:
            suffix = '' if mode == 'zpg' else ',X' if mode == 'zpx' else ',Y'
            operand_str = f' ${operand:02X}{suffix}'
        elif mode in ['abs', 'abx', 'aby']:
            suffix = '' if mode == 'abs' else ',X' if mode == 'abx' else ',Y'
            operand_str = f' ${operand:04X}{suffix}'
        elif mode == 'rel':
            # Calculate branch target
            if operand > 127:
                operand = operand - 256
            target = curr_cpu + 2 + operand
            operand_str = f' ${target:04X}'
        elif mode == 'izx':
            operand_str = f' (${operand:02X},X)'
        elif mode == 'izy':
            operand_str = f' (${operand:02X}),Y'
        elif mode == 'ind':
            operand_str = f' (${operand:04X})'
        else:
            operand_str = ''

        marker = ''
        if current == offset:
            found_target = True
            target_reached = True
            marker = ' <<<'

        if found_target or (current >= offset - context_before * 3):
            lines.append(f'${curr_cpu:04X}:  {mnemonic}{operand_str}{marker}')

        current += size

        if target_reached:
            instructions_after += 1
            if instructions_after >= context_after:
                break

    return lines

def find_exp_code(rom_data):
    """Find all code that modifies $601C (experience)."""

    rom_size = len(rom_data)
    results = []

    # Look for INC $601C,X (opcode $FE, operand $1C $60)
    for i in range(len(rom_data) - 2):
        if rom_data[i] == 0xFE:  # INC abs,X
            lo = rom_data[i + 1]
            hi = rom_data[i + 2]
            if hi == 0x60 and lo == 0x1C:
                bank, cpu_addr = get_bank_info(i, rom_size)

                # Get context
                context = disassemble_context(rom_data, i, cpu_addr)

                results.append({
                    'type': 'INC_EXP',
                    'rom_offset': i,
                    'bank': bank,
                    'cpu_addr': cpu_addr,
                    'context': context
                })

        # Also look for ADC/SBC to $601C area
        if rom_data[i] in [0x7D, 0xFD]:  # ADC abs,X, SBC abs,X
            lo = rom_data[i + 1]
            hi = rom_data[i + 2]
            if hi == 0x60 and 0x1A <= lo <= 0x1E:  # Exp bytes area
                bank, cpu_addr = get_bank_info(i, rom_size)
                op = 'ADC' if rom_data[i] == 0x7D else 'SBC'

                context = disassemble_context(rom_data, i, cpu_addr)

                results.append({
                    'type': f'{op}_EXP',
                    'rom_offset': i,
                    'bank': bank,
                    'cpu_addr': cpu_addr,
                    'target': (hi << 8) | lo,
                    'context': context
                })

    return results

def find_battle_exp(rom_data):
    """Search Bank 19 (battle code) for experience-related patterns."""

    rom_size = len(rom_data)
    results = []

    # Bank 19 starts at offset 0x4C000 (19 * 0x4000)
    bank_19_start = 19 * 0x4000
    bank_19_end = 20 * 0x4000

    # Look for patterns that might be experience handling
    # After battle: often involves storing to $60xx range

    for i in range(bank_19_start, min(bank_19_end, len(rom_data) - 2)):
        # Look for JSR followed by $60xx access
        if rom_data[i] == 0x20:  # JSR
            # Check if next few instructions access $60xx
            for j in range(i + 3, min(i + 15, len(rom_data) - 2)):
                if rom_data[j] in [0x8D, 0x9D, 0x99]:  # STA abs, STA abs,X, STA abs,Y
                    hi = rom_data[j + 2]
                    if hi == 0x60:
                        bank, cpu_addr = get_bank_info(i, rom_size)
                        context = disassemble_context(rom_data, i, cpu_addr)
                        results.append({
                            'type': 'JSR_PARTY_WRITE',
                            'rom_offset': i,
                            'bank': bank,
                            'cpu_addr': cpu_addr,
                            'target': (rom_data[j + 2] << 8) | rom_data[j + 1],
                            'context': context
                        })
                        break

    return results[:20]  # Limit results

def main():
    rom_path = os.path.join(os.path.dirname(__file__), '..', 'roms',
                            'Dragon Warrior IV (1992-10)(Enix)(US).nes')

    print("Loading ROM...")
    rom_data = load_rom(rom_path)

    # Skip iNES header
    rom_data = rom_data[0x10:]

    print(f"ROM size: {len(rom_data)} bytes ({len(rom_data) // 1024} KB)")
    print()

    print("="*70)
    print("SEARCHING FOR EXPERIENCE CODE ($601C)")
    print("="*70)

    # Find exp code
    exp_results = find_exp_code(rom_data)

    print(f"\nFound {len(exp_results)} $601C-related code locations\n")

    for r in exp_results:
        print("-"*70)
        print(f"Bank {r['bank']:2d} @ ${r['cpu_addr']:04X}: {r['type']}")
        print("-"*70)
        for line in r['context']:
            print(f"  {line}")
        print()

    # Save detailed output
    output_path = os.path.join(os.path.dirname(__file__), '..', 'data', 'exp_code_analysis.txt')
    os.makedirs(os.path.dirname(output_path), exist_ok=True)

    with open(output_path, 'w') as f:
        f.write("DRAGON WARRIOR 4 - EXPERIENCE CODE ANALYSIS\n")
        f.write("="*70 + "\n\n")

        for r in exp_results:
            f.write("-"*70 + "\n")
            f.write(f"Bank {r['bank']:2d} @ ${r['cpu_addr']:04X}: {r['type']}\n")
            f.write("-"*70 + "\n")
            for line in r['context']:
                f.write(f"  {line}\n")
            f.write("\n")

    print(f"Results saved to: {output_path}")

if __name__ == '__main__':
    main()
