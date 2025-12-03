#!/usr/bin/env python3
"""
Dragon Warrior 4 NES - Party Data Access Analyzer

Finds ALL code that accesses the $6000-$61FF range (party data).
This is a comprehensive search to discover the actual memory layout.
"""

import os
from collections import defaultdict

def load_rom(rom_path):
    """Load the ROM file."""
    with open(rom_path, 'rb') as f:
        data = f.read()
    return data

def get_bank_info(rom_offset, rom_size):
    """Get bank number and CPU address for a ROM offset."""
    bank = rom_offset // 0x4000

    # MMC1 with 512KB PRG: banks 0-30 switchable at $8000-BFFF
    # Bank 31 fixed at $C000-FFFF
    total_banks = rom_size // 0x4000

    if bank == total_banks - 1:  # Last bank = fixed
        offset = 0xC000 + (rom_offset % 0x4000)
    else:
        offset = 0x8000 + (rom_offset % 0x4000)

    return bank, offset

def find_all_60xx_access(rom_data):
    """Find all instructions that access $60xx addresses."""

    results = []
    rom_size = len(rom_data)

    # Opcodes that use absolute addressing with 2-byte address
    # Format: opcode, lo, hi
    abs_opcodes = {
        0xAD: 'LDA',  # LDA abs
        0xAE: 'LDX',  # LDX abs
        0xAC: 'LDY',  # LDY abs
        0x8D: 'STA',  # STA abs
        0x8E: 'STX',  # STX abs
        0x8C: 'STY',  # STY abs
        0x6D: 'ADC',  # ADC abs
        0xED: 'SBC',  # SBC abs
        0x2D: 'AND',  # AND abs
        0x0D: 'ORA',  # ORA abs
        0x4D: 'EOR',  # EOR abs
        0xCD: 'CMP',  # CMP abs
        0xEC: 'CPX',  # CPX abs
        0xCC: 'CPY',  # CPY abs
        0xEE: 'INC',  # INC abs
        0xCE: 'DEC',  # DEC abs
        0x2C: 'BIT',  # BIT abs
        0x0E: 'ASL',  # ASL abs
        0x4E: 'LSR',  # LSR abs
        0x2E: 'ROL',  # ROL abs
        0x6E: 'ROR',  # ROR abs
    }

    # Opcodes that use absolute,X addressing
    abs_x_opcodes = {
        0xBD: 'LDA',  # LDA abs,X
        0xBC: 'LDY',  # LDY abs,X
        0x9D: 'STA',  # STA abs,X
        0x7D: 'ADC',  # ADC abs,X
        0xFD: 'SBC',  # SBC abs,X
        0x3D: 'AND',  # AND abs,X
        0x1D: 'ORA',  # ORA abs,X
        0x5D: 'EOR',  # EOR abs,X
        0xDD: 'CMP',  # CMP abs,X
        0xFE: 'INC',  # INC abs,X
        0xDE: 'DEC',  # DEC abs,X
        0x1E: 'ASL',  # ASL abs,X
        0x5E: 'LSR',  # LSR abs,X
        0x3E: 'ROL',  # ROL abs,X
        0x7E: 'ROR',  # ROR abs,X
    }

    # Opcodes that use absolute,Y addressing
    abs_y_opcodes = {
        0xB9: 'LDA',  # LDA abs,Y
        0xBE: 'LDX',  # LDX abs,Y
        0x99: 'STA',  # STA abs,Y
        0x79: 'ADC',  # ADC abs,Y
        0xF9: 'SBC',  # SBC abs,Y
        0x39: 'AND',  # AND abs,Y
        0x19: 'ORA',  # ORA abs,Y
        0x59: 'EOR',  # EOR abs,Y
        0xD9: 'CMP',  # CMP abs,Y
    }

    for i in range(len(rom_data) - 2):
        opcode = rom_data[i]

        # Check absolute addressing
        if opcode in abs_opcodes:
            lo = rom_data[i + 1]
            hi = rom_data[i + 2]
            addr = (hi << 8) | lo

            if hi == 0x60 or hi == 0x61:  # Party data range
                bank, cpu_addr = get_bank_info(i, rom_size)
                results.append({
                    'opcode': abs_opcodes[opcode],
                    'mode': 'abs',
                    'rom_offset': i,
                    'bank': bank,
                    'cpu_addr': cpu_addr,
                    'target_addr': addr,
                    'target_lo': lo
                })

        # Check absolute,X addressing
        elif opcode in abs_x_opcodes:
            lo = rom_data[i + 1]
            hi = rom_data[i + 2]
            addr = (hi << 8) | lo

            if hi == 0x60 or hi == 0x61:
                bank, cpu_addr = get_bank_info(i, rom_size)
                results.append({
                    'opcode': abs_x_opcodes[opcode],
                    'mode': 'abs,X',
                    'rom_offset': i,
                    'bank': bank,
                    'cpu_addr': cpu_addr,
                    'target_addr': addr,
                    'target_lo': lo
                })

        # Check absolute,Y addressing
        elif opcode in abs_y_opcodes:
            lo = rom_data[i + 1]
            hi = rom_data[i + 2]
            addr = (hi << 8) | lo

            if hi == 0x60 or hi == 0x61:
                bank, cpu_addr = get_bank_info(i, rom_size)
                results.append({
                    'opcode': abs_y_opcodes[opcode],
                    'mode': 'abs,Y',
                    'rom_offset': i,
                    'bank': bank,
                    'cpu_addr': cpu_addr,
                    'target_addr': addr,
                    'target_lo': lo
                })

    return results

def analyze_results(results):
    """Analyze the access patterns to understand memory layout."""

    # Group by target address
    by_addr = defaultdict(list)
    for r in results:
        by_addr[r['target_addr']].append(r)

    # Group by bank
    by_bank = defaultdict(list)
    for r in results:
        by_bank[r['bank']].append(r)

    # Group by offset within $60xx
    by_offset = defaultdict(int)
    for r in results:
        by_offset[r['target_lo']] += 1

    return by_addr, by_bank, by_offset

def find_indexed_patterns(results):
    """Find base addresses used with X/Y indexing (likely party member iteration)."""

    indexed = [r for r in results if r['mode'] in ['abs,X', 'abs,Y']]

    # Group by base address
    by_base = defaultdict(list)
    for r in indexed:
        by_base[r['target_addr']].append(r)

    return by_base

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
    print("SEARCHING FOR ALL $60xx/$61xx MEMORY ACCESS")
    print("="*70)

    results = find_all_60xx_access(rom_data)
    print(f"\nTotal accesses found: {len(results)}")

    by_addr, by_bank, by_offset = analyze_results(results)

    # Most accessed addresses
    print("\n" + "-"*70)
    print("TOP 30 MOST ACCESSED ADDRESSES")
    print("-"*70)
    sorted_addrs = sorted(by_addr.items(), key=lambda x: len(x[1]), reverse=True)[:30]
    for addr, accesses in sorted_addrs:
        reads = sum(1 for a in accesses if a['opcode'] in ['LDA', 'LDX', 'LDY', 'CMP', 'CPX', 'CPY', 'BIT', 'ADC', 'SBC', 'AND', 'ORA', 'EOR'])
        writes = sum(1 for a in accesses if a['opcode'] in ['STA', 'STX', 'STY', 'INC', 'DEC', 'ASL', 'LSR', 'ROL', 'ROR'])
        modes = set(a['mode'] for a in accesses)
        banks = sorted(set(a['bank'] for a in accesses))

        print(f"${addr:04X}: {len(accesses):3d} accesses (R:{reads:2d} W:{writes:2d}) | Modes: {modes} | Banks: {banks}")

    # Banks with most party data access
    print("\n" + "-"*70)
    print("ACCESS BY BANK")
    print("-"*70)
    for bank in sorted(by_bank.keys()):
        count = len(by_bank[bank])
        print(f"Bank {bank:2d}: {count:4d} accesses")

    # Find indexed access patterns (party iteration)
    print("\n" + "-"*70)
    print("INDEXED ACCESS PATTERNS (likely party member iteration)")
    print("-"*70)
    indexed_bases = find_indexed_patterns(results)
    sorted_bases = sorted(indexed_bases.items(), key=lambda x: len(x[1]), reverse=True)[:20]
    for base, accesses in sorted_bases:
        if len(accesses) >= 3:  # Only show frequently used bases
            banks = sorted(set(a['bank'] for a in accesses))
            opcodes = set(a['opcode'] for a in accesses)
            modes = set(a['mode'] for a in accesses)
            print(f"${base:04X}: {len(accesses):3d} accesses | Banks: {banks[:5]}{'...' if len(banks) > 5 else ''}")
            print(f"        Ops: {opcodes} | Modes: {modes}")

    # Specific ranges of interest
    print("\n" + "-"*70)
    print("MEMORY LAYOUT ANALYSIS")
    print("-"*70)

    # Analyze offset patterns to understand character data structure
    print("\nOffset frequency (character data structure hints):")
    sorted_offsets = sorted(by_offset.items(), key=lambda x: x[1], reverse=True)

    # Group into likely structure fields
    for offset, count in sorted_offsets[:40]:
        if count >= 5:
            print(f"  +${offset:02X}: {count:4d} accesses")

    # Look for $40 stride (character structure size)
    print("\n--- Checking for $40 stride (64 bytes per character) ---")
    for base_offset in [0x00, 0x08, 0x0A, 0x0E, 0x14, 0x18, 0x1A]:
        related = []
        for stride in range(0, 0x100, 0x40):
            test_offset = base_offset + stride
            if test_offset in by_offset and by_offset[test_offset] > 0:
                related.append((test_offset, by_offset[test_offset]))
        if len(related) >= 2:
            print(f"  +${base_offset:02X} base: {related}")

    # Output detailed findings for key addresses
    print("\n" + "="*70)
    print("DETAILED FINDINGS FOR KEY ADDRESSES")
    print("="*70)

    key_addrs = [
        0x6000, 0x6008, 0x6009, 0x600A, 0x600B, 0x600C, 0x600D, 0x600E,
        0x6014, 0x6018, 0x601A, 0x601C, 0x601E,
        0x6040, 0x6048, 0x6080, 0x60C0, 0x6100
    ]

    for addr in key_addrs:
        if addr in by_addr:
            print(f"\n${addr:04X}: {len(by_addr[addr])} accesses")
            for r in by_addr[addr][:5]:
                print(f"  Bank {r['bank']:2d} @ ${r['cpu_addr']:04X}: {r['opcode']} {r['mode']}")
            if len(by_addr[addr]) > 5:
                print(f"  ... and {len(by_addr[addr]) - 5} more")

    # Save results to file
    output_path = os.path.join(os.path.dirname(__file__), '..', 'data', 'party_data_access.txt')
    os.makedirs(os.path.dirname(output_path), exist_ok=True)

    with open(output_path, 'w') as f:
        f.write("DRAGON WARRIOR 4 - PARTY DATA ACCESS ANALYSIS\n")
        f.write("="*70 + "\n\n")

        f.write("ALL ADDRESSES ACCESSED IN $6000-$61FF RANGE\n")
        f.write("-"*70 + "\n")

        for addr in sorted(by_addr.keys()):
            accesses = by_addr[addr]
            reads = sum(1 for a in accesses if a['opcode'] in ['LDA', 'LDX', 'LDY', 'CMP', 'CPX', 'CPY', 'BIT', 'ADC', 'SBC', 'AND', 'ORA', 'EOR'])
            writes = sum(1 for a in accesses if a['opcode'] in ['STA', 'STX', 'STY', 'INC', 'DEC', 'ASL', 'LSR', 'ROL', 'ROR'])
            modes = ', '.join(sorted(set(a['mode'] for a in accesses)))
            banks = ', '.join(str(b) for b in sorted(set(a['bank'] for a in accesses)))

            f.write(f"${addr:04X}: {len(accesses):3d} (R:{reads:2d} W:{writes:2d}) | Modes: {modes} | Banks: {banks}\n")

            for r in accesses:
                f.write(f"    Bank {r['bank']:2d} @ ${r['cpu_addr']:04X}: {r['opcode']} ${r['target_addr']:04X},{r['mode'].replace('abs', '').strip(',')}\n")
            f.write("\n")

    print(f"\nDetailed results saved to: {output_path}")

if __name__ == '__main__':
    main()
