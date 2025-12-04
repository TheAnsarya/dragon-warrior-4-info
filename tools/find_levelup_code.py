#!/usr/bin/env python3
"""
Dragon Warrior 4 NES - Level-Up Code Finder

Searches for patterns that indicate level-up processing:
- INC to $6008 (hero level), $6048, $6088, etc.
- Comparisons against max level
- Stat increment patterns
"""

import os

def load_rom(rom_path):
    """Load the ROM file."""
    with open(rom_path, 'rb') as f:
        data = f.read()
    return data

def search_level_increment(rom_data):
    """Search for INC $60xx patterns that could be level incrementing."""
    # INC absolute = $EE
    # INC absolute,X = $FE
    # Party member structure: 30 bytes each, starting at $6001
    # Level offsets: Hero=$6006, Cristo=$6024, etc. (offset +5 from status)
    # Each character: base + $1E (30 bytes)

    results = []

    for i in range(len(rom_data) - 3):
        if rom_data[i] == 0xEE:  # INC absolute
            lo = rom_data[i + 1]
            hi = rom_data[i + 2]
            addr = (hi << 8) | lo

            # Check if it's incrementing level-related addresses
            # Hero=$6006, Cristo=$6024, Nara=$6042, etc.
            if hi == 0x60 and lo in [0x06, 0x24, 0x42, 0x60, 0x7E, 0x9C, 0xBA, 0xD8]:
                bank = i // 0x4000
                offset = i % 0x4000 + 0x8000
                if bank >= 16:  # Fixed bank
                    offset = i % 0x4000 + 0xC000
                results.append({
                    'type': 'INC_ABS',
                    'rom_offset': i,
                    'bank': bank,
                    'address': offset,
                    'target': addr,
                    'context': rom_data[max(0, i-10):i+10].hex()
                })

        elif rom_data[i] == 0xFE:  # INC absolute,X
            lo = rom_data[i + 1]
            hi = rom_data[i + 2]
            addr = (hi << 8) | lo

            # Check for level base + X indexing ($6006 or lower for indexed access)
            if hi == 0x60 and lo in [0x01, 0x05, 0x06]:
                bank = i // 0x4000
                offset = i % 0x4000 + 0x8000
                if bank >= 16:  # Fixed bank
                    offset = i % 0x4000 + 0xC000
                results.append({
                    'type': 'INC_ABS_X',
                    'rom_offset': i,
                    'bank': bank,
                    'address': offset,
                    'target': addr,
                    'context': rom_data[max(0, i-10):i+10].hex()
                })

    return results

def search_stat_increment(rom_data):
    """Search for patterns that look like stat increments.

    Party member structure (30 bytes each, starting at $6001):
    $6001 + $00 = status flags
    $6001 + $01 = current HP lo
    $6001 + $02 = current HP hi
    $6001 + $03 = current MP lo
    $6001 + $04 = current MP hi
    $6001 + $05 = level
    $6001 + $06 = strength
    $6001 + $07 = agility
    $6001 + $08 = vitality
    $6001 + $09 = intelligence
    $6001 + $0A = luck
    $6001 + $0B = unknown
    $6001 + $0C = max HP lo
    $6001 + $0D = max HP hi
    $6001 + $0E = max MP lo
    $6001 + $0F = max MP hi
    $6001 + $10 = exp lo
    $6001 + $11 = exp mid
    $6001 + $12 = exp hi
    """

    results = []

    # Pattern: LDA $60xx,X / CLC / ADC #$xx / STA $60xx,X
    for i in range(len(rom_data) - 10):
        # LDA abs,X = $BD
        if rom_data[i] == 0xBD:
            lo = rom_data[i + 1]
            hi = rom_data[i + 2]

            if hi == 0x60 and lo in range(0x06, 0x0C):  # Stat offsets (str, agi, vit, int, luck)
                # Check for CLC (18) and ADC
                if i + 3 < len(rom_data) and rom_data[i + 3] == 0x18:  # CLC
                    if i + 4 < len(rom_data) and rom_data[i + 4] in [0x69, 0x65, 0x75]:  # ADC imm, zp, zpx
                        bank = i // 0x4000
                        offset = i % 0x4000 + 0x8000
                        if bank >= 16:
                            offset = i % 0x4000 + 0xC000

                        results.append({
                            'type': 'STAT_INCREMENT',
                            'rom_offset': i,
                            'bank': bank,
                            'address': offset,
                            'stat_offset': lo,
                            'context': rom_data[max(0, i-5):i+15].hex()
                        })

    return results

def search_exp_comparison(rom_data):
    """Search for patterns comparing against exp (3 bytes at $6011).

    Pattern: Load exp, compare against required exp
    Hero EXP: $6011-$6013
    """

    results = []

    # LDA $6011,X or LDA $6011 - accessing exp low byte
    for i in range(len(rom_data) - 5):
        if rom_data[i] == 0xBD:  # LDA abs,X
            lo = rom_data[i + 1]
            hi = rom_data[i + 2]

            if hi == 0x60 and lo in [0x10, 0x11, 0x12, 0x13]:  # EXP bytes (with some tolerance)
                bank = i // 0x4000
                offset = i % 0x4000 + 0x8000
                if bank >= 16:
                    offset = i % 0x4000 + 0xC000

                results.append({
                    'type': 'EXP_ACCESS',
                    'rom_offset': i,
                    'bank': bank,
                    'address': offset,
                    'context': rom_data[max(0, i-5):i+20].hex()
                })

        elif rom_data[i] == 0xAD:  # LDA abs
            lo = rom_data[i + 1]
            hi = rom_data[i + 2]

            if hi == 0x60 and lo in [0x11, 0x12, 0x13]:
                bank = i // 0x4000
                offset = i % 0x4000 + 0x8000
                if bank >= 16:
                    offset = i % 0x4000 + 0xC000

                results.append({
                    'type': 'EXP_ACCESS',
                    'rom_offset': i,
                    'bank': bank,
                    'address': offset,
                    'context': rom_data[max(0, i-5):i+20].hex()
                })

    return results

def search_levelup_message(rom_data):
    """Search for patterns that might trigger level-up message display.

    Look for JSR to text display routines with specific message IDs.
    """

    results = []

    # Common pattern: LDA #$xx / JSR text_display
    # We don't know exact text routine, but look for sequences

    for i in range(len(rom_data) - 6):
        # LDA immediate followed by JSR
        if rom_data[i] == 0xA9 and rom_data[i + 2] == 0x20:  # LDA #imm, JSR
            msg_id = rom_data[i + 1]
            jsr_lo = rom_data[i + 3]
            jsr_hi = rom_data[i + 4]
            jsr_addr = (jsr_hi << 8) | jsr_lo

            # Check if nearby there's level-related code
            context = rom_data[max(0, i-20):i+30]

            # Look for $60 in the context (party data)
            if b'\x60' in context[:-10] and jsr_hi >= 0xC0:  # Fixed bank routine
                bank = i // 0x4000
                offset = i % 0x4000 + 0x8000
                if bank >= 16:
                    offset = i % 0x4000 + 0xC000

                # Only include if there's a stat-like operation nearby
                if any(x in [0x60, 0x61, 0x62, 0x63] for x in context):
                    results.append({
                        'type': 'MSG_DISPLAY',
                        'rom_offset': i,
                        'bank': bank,
                        'address': offset,
                        'msg_id': msg_id,
                        'jsr_target': jsr_addr,
                        'context': context.hex()
                    })

    return results

def search_max_level_check(rom_data):
    """Search for comparisons against max level (99 = 0x63).

    Pattern: CMP #$63 or compare against ram containing 99
    """

    results = []

    for i in range(len(rom_data) - 3):
        if rom_data[i] == 0xC9 and rom_data[i + 1] == 0x63:  # CMP #$63
            # Check surrounding context for level-related patterns
            context = rom_data[max(0, i-15):i+15]

            # Look for $60 (party RAM) or $08 (level offset)
            if any(b in context for b in [b'\x60\x08', b'\x08\x60', b'\xFE\x08\x60']):
                bank = i // 0x4000
                offset = i % 0x4000 + 0x8000
                if bank >= 16:
                    offset = i % 0x4000 + 0xC000

                results.append({
                    'type': 'MAX_LEVEL_CHECK',
                    'rom_offset': i,
                    'bank': bank,
                    'address': offset,
                    'context': context.hex()
                })

    return results

def main():
    rom_path = os.path.join(os.path.dirname(__file__), '..', 'roms',
                            'Dragon Warrior IV (1992-10)(Enix)(US).nes')

    print("Loading ROM...")
    rom_data = load_rom(rom_path)

    # Skip iNES header
    rom_data = rom_data[0x10:]

    print("\n" + "="*60)
    print("SEARCHING FOR LEVEL-UP CODE PATTERNS")
    print("="*60)

    # Search for level increment
    print("\n--- Level Increment (INC $6008,X or similar) ---")
    level_inc = search_level_increment(rom_data)
    for r in level_inc:
        print(f"Bank {r['bank']:02d} @ ${r['address']:04X}: {r['type']} -> ${r['target']:04X}")
        print(f"  Context: {r['context']}")

    # Search for stat increments
    print("\n--- Stat Increment Patterns ---")
    stat_inc = search_stat_increment(rom_data)
    for r in stat_inc[:20]:  # Limit output
        print(f"Bank {r['bank']:02d} @ ${r['address']:04X}: Stat offset ${r['stat_offset']:02X}")
        print(f"  Context: {r['context']}")
    print(f"  ... and {len(stat_inc) - 20} more patterns" if len(stat_inc) > 20 else "")

    # Search for exp access
    print("\n--- EXP Access Patterns ($601A) ---")
    exp_access = search_exp_comparison(rom_data)
    for r in exp_access:
        print(f"Bank {r['bank']:02d} @ ${r['address']:04X}: {r['type']}")
        print(f"  Context: {r['context']}")

    # Search for max level check
    print("\n--- Max Level Check (CMP #$63) ---")
    max_level = search_max_level_check(rom_data)
    for r in max_level:
        print(f"Bank {r['bank']:02d} @ ${r['address']:04X}: {r['type']}")
        print(f"  Context: {r['context']}")

    # Summary
    print("\n" + "="*60)
    print("SUMMARY")
    print("="*60)
    print(f"Level increment patterns: {len(level_inc)}")
    print(f"Stat increment patterns: {len(stat_inc)}")
    print(f"EXP access patterns: {len(exp_access)}")
    print(f"Max level checks: {len(max_level)}")

    # Output key findings
    if level_inc:
        print("\n--- KEY FINDINGS: Level-Up Code Locations ---")
        for r in level_inc:
            print(f"  Bank {r['bank']:02d} @ ${r['address']:04X}")

    if exp_access:
        print("\n--- KEY FINDINGS: EXP Handling Locations ---")
        banks = set(r['bank'] for r in exp_access)
        print(f"  Banks with EXP code: {sorted(banks)}")
        for bank in sorted(banks):
            addrs = [r['address'] for r in exp_access if r['bank'] == bank]
            print(f"  Bank {bank:02d}: {', '.join(f'${a:04X}' for a in addrs)}")

if __name__ == '__main__':
    main()
