#!/usr/bin/env python3
"""
Investigate the interesting pattern found in Bank 8 at $979B.

The pattern showed:
  HP=0, 7, 14, 25, 32 with consistent record structure

This looks like it could be level-up progression tables or stat tables.
"""

import os
from pathlib import Path

SCRIPT_DIR = Path(__file__).parent
ROM_PATH = SCRIPT_DIR.parent / "roms" / "Dragon Warrior IV (1992-10)(Enix)(US).nes"
OUTPUT_DIR = SCRIPT_DIR.parent / "data"

BANK = 8
HEADER_SIZE = 16
BANK_SIZE = 0x4000


def dump_area(rom, bank, cpu_start, record_size, count, field_offsets=None):
    """Dump an area with specified format."""
    bank_offset = cpu_start - 0x8000
    rom_offset = HEADER_SIZE + bank * BANK_SIZE + bank_offset

    print(f"\nBank {bank} ${cpu_start:04X} (ROM ${rom_offset:05X})")
    print(f"Record size: {record_size} bytes, Count: {count}")
    print("-" * 70)

    if field_offsets is None:
        field_offsets = {"val1": 0, "val2": 2, "val3": 4}

    records = []
    for i in range(count):
        offset = rom_offset + i * record_size
        if offset + record_size > len(rom):
            break

        data = rom[offset:offset + record_size]

        # Parse as 16-bit values
        val0 = data[0] | (data[1] << 8) if record_size >= 2 else data[0]
        val1 = data[2] | (data[3] << 8) if record_size >= 4 else 0
        val2 = data[4] if record_size >= 5 else 0
        val3 = data[5] if record_size >= 6 else 0

        hex_str = ' '.join(f'{b:02X}' for b in data)

        cpu = cpu_start + i * record_size
        print(f"#{i:3d} ${cpu:04X}: {hex_str} | v0={val0:5d} v1={val1:5d} v2={val2:3d} v3={val3:3d}")

        records.append({
            "index": i,
            "data": data,
            "val0": val0,
            "val1": val1,
        })

    return records


def investigate_b979b(rom):
    """Investigate the pattern at Bank 8 $979B."""
    print("=" * 70)
    print("Investigating Bank 8 $979B pattern")
    print("=" * 70)

    # Record size 6, showing: HP=0, 7, 14, 25, 32
    # With patterns like: 00 00 04 00 00 30, 07 00 04 07 00 30

    dump_area(rom, 8, 0x979B, 6, 50)


def investigate_exp_tables(rom):
    """Search for potential EXP tables with 16-bit or larger values."""
    print("\n\n" + "=" * 70)
    print("Searching for potential EXP tables")
    print("=" * 70)

    # EXP values we know (from cowness.net for high levels):
    # Level 25: 102787, 26: 118192, 27: 135522, 28: 155018, 29: 176951, 30: 201625

    # These are 24-bit values since max > 65535
    # 102787 = $0191 83
    # 201625 = $0313 99

    # For lower levels, values would be smaller
    # Let's look for tables with increasing 16-bit or 24-bit values

    candidates = []

    for start in range(HEADER_SIZE, len(rom) - 300, 1):
        # Check if this looks like an increasing sequence
        valid = True
        last_val = 0
        increasing_count = 0

        for i in range(30):  # Check 30 potential entries
            offset = start + i * 2  # 16-bit values
            if offset + 2 > len(rom):
                break

            val = rom[offset] | (rom[offset + 1] << 8)

            if val >= last_val and val < 65535:
                increasing_count += 1
            last_val = val

        if increasing_count >= 25:  # Mostly increasing
            bank = (start - HEADER_SIZE) // BANK_SIZE
            bank_offset = (start - HEADER_SIZE) % BANK_SIZE
            cpu = 0x8000 + bank_offset
            candidates.append((bank, cpu, start, increasing_count))

    # Show unique banks
    by_bank = {}
    for bank, cpu, offset, count in candidates:
        if bank not in by_bank:
            by_bank[bank] = []
        by_bank[bank].append((cpu, offset, count))

    for bank in sorted(by_bank.keys()):
        entries = by_bank[bank]
        if len(entries) <= 3:
            print(f"\nBank {bank}: {len(entries)} potential increasing sequences")
            for cpu, offset, count in entries[:3]:
                # Show values
                values = []
                for i in range(min(10, count)):
                    o = offset + i * 2
                    v = rom[o] | (rom[o+1] << 8)
                    values.append(v)
                print(f"  ${cpu:04X}: {values}")


def investigate_stat_tables(rom):
    """Look for stat growth tables (small values that increase)."""
    print("\n\n" + "=" * 70)
    print("Searching for stat growth tables")
    print("=" * 70)

    # Stats like HP, ATK, DEF typically grow from small to larger values
    # e.g., HP might go 10, 15, 22, 30, 40, ...

    candidates = []

    for start in range(HEADER_SIZE, len(rom) - 100, 1):
        valid_count = 0
        reasonable_growth = 0

        for i in range(30):
            val = rom[start + i]

            # Reasonable stat value (1-255, with most being under 200)
            if 1 <= val <= 200:
                valid_count += 1

            # Check for growth pattern
            if i > 0:
                prev = rom[start + i - 1]
                if val >= prev and val <= prev + 20:  # Reasonable growth
                    reasonable_growth += 1

        if valid_count >= 28 and reasonable_growth >= 15:
            bank = (start - HEADER_SIZE) // BANK_SIZE
            bank_offset = (start - HEADER_SIZE) % BANK_SIZE
            cpu = 0x8000 + bank_offset
            candidates.append((bank, cpu, start))

    # Show first few candidates from each bank
    shown_banks = set()
    for bank, cpu, offset in candidates:
        if bank in shown_banks:
            continue
        shown_banks.add(bank)

        values = [rom[offset + i] for i in range(30)]
        print(f"Bank {bank} ${cpu:04X}: {values}")


def search_for_character_data(rom):
    """Search for character stat data or level-up tables."""
    print("\n\n" + "=" * 70)
    print("Searching for character/level-up data")
    print("=" * 70)

    # DW4 has multiple characters with different growth patterns
    # Tables might be organized by character then by level

    # Look for sequences where bytes form sensible stat distributions
    # e.g., [HP_lo, HP_hi, MP_lo, MP_hi, STR, AGI, VIT, INT, LUCK]

    for record_size in [8, 9, 10, 12]:
        candidates = []

        for start in range(HEADER_SIZE, len(rom) - record_size * 40, 1):
            score = 0

            for i in range(30):  # 30 levels
                offset = start + i * record_size
                if offset + record_size > len(rom):
                    break

                # Check for reasonable values
                hp = rom[offset] | (rom[offset + 1] << 8) if record_size >= 2 else 0
                mp = rom[offset + 2] | (rom[offset + 3] << 8) if record_size >= 4 else 0

                # HP should be reasonable for a level (5-500)
                if 5 <= hp <= 500:
                    score += 1
                # MP should be reasonable (0-200)
                if 0 <= mp <= 200:
                    score += 1

            if score >= 40:  # Good candidate
                bank = (start - HEADER_SIZE) // BANK_SIZE
                bank_offset = (start - HEADER_SIZE) % BANK_SIZE
                cpu = 0x8000 + bank_offset
                candidates.append((bank, cpu, start, score))

        if candidates:
            print(f"\nRecord size {record_size}: {len(candidates)} candidates")
            for bank, cpu, offset, score in candidates[:5]:
                print(f"  Bank {bank} ${cpu:04X} (score {score}):")
                for i in range(5):
                    o = offset + i * record_size
                    data = rom[o:o + record_size]
                    hp = data[0] | (data[1] << 8) if len(data) >= 2 else 0
                    mp = data[2] | (data[3] << 8) if len(data) >= 4 else 0
                    hex_str = ' '.join(f'{b:02X}' for b in data)
                    print(f"    L{i+1:2d}: HP={hp:3d} MP={mp:3d} | {hex_str}")


def main():
    if not ROM_PATH.exists():
        print(f"ERROR: ROM not found at {ROM_PATH}")
        return

    with open(ROM_PATH, "rb") as f:
        rom = f.read()

    print(f"ROM loaded: {len(rom)} bytes\n")

    investigate_b979b(rom)
    investigate_exp_tables(rom)
    investigate_stat_tables(rom)
    search_for_character_data(rom)


if __name__ == "__main__":
    main()
