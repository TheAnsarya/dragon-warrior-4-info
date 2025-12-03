#!/usr/bin/env python3
"""
Dragon Warrior 4 NES - Bank Code Mapper

Creates a comprehensive map of code vs data in each bank
by analyzing instruction patterns and identifying subroutines.
"""

import os
from collections import defaultdict

def load_rom(rom_path):
    """Load the ROM file."""
    with open(rom_path, 'rb') as f:
        data = f.read()
    return data

# Full 6502 opcode table with (mnemonic, size, is_branch_or_jump)
OPCODES = {
    0x00: ('BRK', 1, False),
    0x01: ('ORA', 2, False),
    0x05: ('ORA', 2, False),
    0x06: ('ASL', 2, False),
    0x08: ('PHP', 1, False),
    0x09: ('ORA', 2, False),
    0x0A: ('ASL', 1, False),
    0x0D: ('ORA', 3, False),
    0x0E: ('ASL', 3, False),
    0x10: ('BPL', 2, True),
    0x11: ('ORA', 2, False),
    0x15: ('ORA', 2, False),
    0x16: ('ASL', 2, False),
    0x18: ('CLC', 1, False),
    0x19: ('ORA', 3, False),
    0x1D: ('ORA', 3, False),
    0x1E: ('ASL', 3, False),
    0x20: ('JSR', 3, True),
    0x21: ('AND', 2, False),
    0x24: ('BIT', 2, False),
    0x25: ('AND', 2, False),
    0x26: ('ROL', 2, False),
    0x28: ('PLP', 1, False),
    0x29: ('AND', 2, False),
    0x2A: ('ROL', 1, False),
    0x2C: ('BIT', 3, False),
    0x2D: ('AND', 3, False),
    0x2E: ('ROL', 3, False),
    0x30: ('BMI', 2, True),
    0x31: ('AND', 2, False),
    0x35: ('AND', 2, False),
    0x36: ('ROL', 2, False),
    0x38: ('SEC', 1, False),
    0x39: ('AND', 3, False),
    0x3D: ('AND', 3, False),
    0x3E: ('ROL', 3, False),
    0x40: ('RTI', 1, True),
    0x41: ('EOR', 2, False),
    0x45: ('EOR', 2, False),
    0x46: ('LSR', 2, False),
    0x48: ('PHA', 1, False),
    0x49: ('EOR', 2, False),
    0x4A: ('LSR', 1, False),
    0x4C: ('JMP', 3, True),
    0x4D: ('EOR', 3, False),
    0x4E: ('LSR', 3, False),
    0x50: ('BVC', 2, True),
    0x51: ('EOR', 2, False),
    0x55: ('EOR', 2, False),
    0x56: ('LSR', 2, False),
    0x58: ('CLI', 1, False),
    0x59: ('EOR', 3, False),
    0x5D: ('EOR', 3, False),
    0x5E: ('LSR', 3, False),
    0x60: ('RTS', 1, True),
    0x61: ('ADC', 2, False),
    0x65: ('ADC', 2, False),
    0x66: ('ROR', 2, False),
    0x68: ('PLA', 1, False),
    0x69: ('ADC', 2, False),
    0x6A: ('ROR', 1, False),
    0x6C: ('JMP', 3, True),
    0x6D: ('ADC', 3, False),
    0x6E: ('ROR', 3, False),
    0x70: ('BVS', 2, True),
    0x71: ('ADC', 2, False),
    0x75: ('ADC', 2, False),
    0x76: ('ROR', 2, False),
    0x78: ('SEI', 1, False),
    0x79: ('ADC', 3, False),
    0x7D: ('ADC', 3, False),
    0x7E: ('ROR', 3, False),
    0x81: ('STA', 2, False),
    0x84: ('STY', 2, False),
    0x85: ('STA', 2, False),
    0x86: ('STX', 2, False),
    0x88: ('DEY', 1, False),
    0x8A: ('TXA', 1, False),
    0x8C: ('STY', 3, False),
    0x8D: ('STA', 3, False),
    0x8E: ('STX', 3, False),
    0x90: ('BCC', 2, True),
    0x91: ('STA', 2, False),
    0x94: ('STY', 2, False),
    0x95: ('STA', 2, False),
    0x96: ('STX', 2, False),
    0x98: ('TYA', 1, False),
    0x99: ('STA', 3, False),
    0x9A: ('TXS', 1, False),
    0x9D: ('STA', 3, False),
    0xA0: ('LDY', 2, False),
    0xA1: ('LDA', 2, False),
    0xA2: ('LDX', 2, False),
    0xA4: ('LDY', 2, False),
    0xA5: ('LDA', 2, False),
    0xA6: ('LDX', 2, False),
    0xA8: ('TAY', 1, False),
    0xA9: ('LDA', 2, False),
    0xAA: ('TAX', 1, False),
    0xAC: ('LDY', 3, False),
    0xAD: ('LDA', 3, False),
    0xAE: ('LDX', 3, False),
    0xB0: ('BCS', 2, True),
    0xB1: ('LDA', 2, False),
    0xB4: ('LDY', 2, False),
    0xB5: ('LDA', 2, False),
    0xB6: ('LDX', 2, False),
    0xB8: ('CLV', 1, False),
    0xB9: ('LDA', 3, False),
    0xBA: ('TSX', 1, False),
    0xBC: ('LDY', 3, False),
    0xBD: ('LDA', 3, False),
    0xBE: ('LDX', 3, False),
    0xC0: ('CPY', 2, False),
    0xC1: ('CMP', 2, False),
    0xC4: ('CPY', 2, False),
    0xC5: ('CMP', 2, False),
    0xC6: ('DEC', 2, False),
    0xC8: ('INY', 1, False),
    0xC9: ('CMP', 2, False),
    0xCA: ('DEX', 1, False),
    0xCC: ('CPY', 3, False),
    0xCD: ('CMP', 3, False),
    0xCE: ('DEC', 3, False),
    0xD0: ('BNE', 2, True),
    0xD1: ('CMP', 2, False),
    0xD5: ('CMP', 2, False),
    0xD6: ('DEC', 2, False),
    0xD8: ('CLD', 1, False),
    0xD9: ('CMP', 3, False),
    0xDD: ('CMP', 3, False),
    0xDE: ('DEC', 3, False),
    0xE0: ('CPX', 2, False),
    0xE1: ('SBC', 2, False),
    0xE4: ('CPX', 2, False),
    0xE5: ('SBC', 2, False),
    0xE6: ('INC', 2, False),
    0xE8: ('INX', 1, False),
    0xE9: ('SBC', 2, False),
    0xEA: ('NOP', 1, False),
    0xEC: ('CPX', 3, False),
    0xED: ('SBC', 3, False),
    0xEE: ('INC', 3, False),
    0xF0: ('BEQ', 2, True),
    0xF1: ('SBC', 2, False),
    0xF5: ('SBC', 2, False),
    0xF6: ('INC', 2, False),
    0xF8: ('SED', 1, False),
    0xF9: ('SBC', 3, False),
    0xFD: ('SBC', 3, False),
    0xFE: ('INC', 3, False),
}

def is_valid_code_sequence(data, offset, min_len=10):
    """Check if a sequence looks like valid code."""

    pos = offset
    valid_count = 0
    total = 0

    while pos < len(data) and total < min_len:
        opcode = data[pos]

        if opcode in OPCODES:
            mnemonic, size, _ = OPCODES[opcode]
            valid_count += 1
            pos += size
        else:
            pos += 1

        total += 1

    return valid_count / total >= 0.7 if total > 0 else False

def find_subroutines(data, bank_start, bank_size):
    """Find likely subroutine entry points in a bank."""

    subroutines = set()

    for i in range(bank_start, bank_start + bank_size - 2):
        opcode = data[i]

        # JSR = $20
        if opcode == 0x20:
            lo = data[i + 1]
            hi = data[i + 2]
            target = (hi << 8) | lo

            # Check if target is in this bank or fixed bank
            if 0x8000 <= target <= 0xBFFF or 0xC000 <= target <= 0xFFFF:
                subroutines.add(target)

    return subroutines

def analyze_bank(data, bank_num, total_banks):
    """Analyze a single bank for code/data regions."""

    bank_size = 0x4000
    bank_start = bank_num * bank_size

    if bank_start >= len(data):
        return None

    bank_data = data[bank_start:bank_start + bank_size]

    # Find JSR targets
    subroutines = find_subroutines(data, bank_start, bank_size)

    # Map offset within bank to CPU address
    if bank_num == total_banks - 1:  # Fixed bank
        base_addr = 0xC000
    else:
        base_addr = 0x8000

    return {
        'bank': bank_num,
        'subroutine_count': len(subroutines),
        'subroutines': sorted(subroutines),
        'base_addr': base_addr
    }

def find_party_data_code(data, start, end, base_addr):
    """Find code that accesses $60xx range."""

    results = []

    i = start
    while i < end - 2:
        opcode = data[i]

        if opcode in OPCODES:
            mnemonic, size, _ = OPCODES[opcode]

            # Check for absolute addressing to $60xx
            if size == 3:
                hi = data[i + 2]
                lo = data[i + 1]

                if hi == 0x60 or hi == 0x61:
                    addr = (hi << 8) | lo
                    cpu_addr = base_addr + (i - start)

                    results.append({
                        'cpu_addr': cpu_addr,
                        'mnemonic': mnemonic,
                        'target': addr,
                        'opcode': opcode
                    })

            i += size
        else:
            i += 1

    return results

def analyze_fixed_bank(data):
    """Analyze the fixed bank ($C000-$FFFF) in detail."""

    total_banks = len(data) // 0x4000
    fixed_bank_start = (total_banks - 1) * 0x4000
    fixed_bank_data = data[fixed_bank_start:]

    print("\n" + "="*70)
    print("FIXED BANK ANALYSIS ($C000-$FFFF)")
    print("="*70)

    # Find all accesses to party data
    party_access = find_party_data_code(data, fixed_bank_start, fixed_bank_start + 0x4000, 0xC000)

    print(f"\nParty data accesses in fixed bank: {len(party_access)}")

    # Group by target address
    by_target = defaultdict(list)
    for r in party_access:
        by_target[r['target']].append(r)

    print("\nAddresses accessed and their code locations:")
    for target in sorted(by_target.keys()):
        accesses = by_target[target]
        print(f"\n${target:04X}: {len(accesses)} accesses")
        for a in accesses[:5]:
            print(f"  ${a['cpu_addr']:04X}: {a['mnemonic']} ${a['target']:04X}")
        if len(accesses) > 5:
            print(f"  ... and {len(accesses) - 5} more")

    return party_access

def analyze_battle_bank(data):
    """Analyze Bank 19 (battle code)."""

    bank_19_start = 19 * 0x4000
    bank_19_data = data[bank_19_start:bank_19_start + 0x4000]

    print("\n" + "="*70)
    print("BANK 19 ANALYSIS (BATTLE CODE)")
    print("="*70)

    # Find all accesses to party data
    party_access = find_party_data_code(data, bank_19_start, bank_19_start + 0x4000, 0x8000)

    print(f"\nParty data accesses in Bank 19: {len(party_access)}")

    # Group by target address
    by_target = defaultdict(list)
    for r in party_access:
        by_target[r['target']].append(r)

    print("\nAddresses accessed:")
    for target in sorted(by_target.keys()):
        accesses = by_target[target]
        print(f"\n${target:04X}: {len(accesses)} accesses")
        for a in accesses[:5]:
            print(f"  ${a['cpu_addr']:04X}: {a['mnemonic']} ${a['target']:04X}")
        if len(accesses) > 5:
            print(f"  ... and {len(accesses) - 5} more")

    return party_access

def main():
    rom_path = os.path.join(os.path.dirname(__file__), '..', 'roms',
                            'Dragon Warrior IV (1992-10)(Enix)(US).nes')

    print("Loading ROM...")
    rom_data = load_rom(rom_path)

    # Skip iNES header
    rom_data = rom_data[0x10:]

    total_banks = len(rom_data) // 0x4000
    print(f"ROM size: {len(rom_data)} bytes ({total_banks} banks)")

    print("\n" + "="*70)
    print("BANK OVERVIEW")
    print("="*70)

    # Analyze each bank
    all_results = []
    for bank in range(total_banks):
        result = analyze_bank(rom_data, bank, total_banks)
        if result:
            all_results.append(result)

    # Sort by subroutine count
    all_results.sort(key=lambda x: x['subroutine_count'], reverse=True)

    print("\nBanks by code density (subroutine count):")
    for r in all_results[:15]:
        print(f"Bank {r['bank']:2d}: {r['subroutine_count']:4d} subroutines (${r['base_addr']:04X})")

    # Analyze fixed bank and battle bank in detail
    fixed_access = analyze_fixed_bank(rom_data)
    battle_access = analyze_battle_bank(rom_data)

    # Save detailed mapping
    output_path = os.path.join(os.path.dirname(__file__), '..', 'data', 'code_map.txt')
    os.makedirs(os.path.dirname(output_path), exist_ok=True)

    with open(output_path, 'w') as f:
        f.write("DRAGON WARRIOR 4 - CODE MAP\n")
        f.write("="*70 + "\n\n")

        f.write("BANK OVERVIEW\n")
        f.write("-"*70 + "\n")
        for r in all_results:
            f.write(f"Bank {r['bank']:2d}: {r['subroutine_count']:4d} subroutines\n")

        f.write("\n\nPARTY DATA ACCESS - FIXED BANK\n")
        f.write("-"*70 + "\n")
        for a in fixed_access:
            f.write(f"${a['cpu_addr']:04X}: {a['mnemonic']} ${a['target']:04X}\n")

        f.write("\n\nPARTY DATA ACCESS - BANK 19 (BATTLE)\n")
        f.write("-"*70 + "\n")
        for a in battle_access:
            f.write(f"${a['cpu_addr']:04X}: {a['mnemonic']} ${a['target']:04X}\n")

    print(f"\nResults saved to: {output_path}")

if __name__ == '__main__':
    main()
