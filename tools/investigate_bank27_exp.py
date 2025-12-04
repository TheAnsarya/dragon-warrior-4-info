#!/usr/bin/env python3
"""
Investigate the potential EXP table area found at Bank 27.

Level 30 EXP (201,625 / $031399) was found at ROM offset 0x6F6ED (Bank 27, $B6ED).
Let's examine the surrounding data to understand the table structure.
"""

import os
from pathlib import Path

SCRIPT_DIR = Path(__file__).parent
ROM_PATH = SCRIPT_DIR.parent / "roms" / "Dragon Warrior IV (1992-10)(Enix)(US).nes"
OUTPUT_DIR = SCRIPT_DIR.parent / "data"

# Found location: ROM 0x6F6ED = Bank 27, CPU $B6ED
FOUND_OFFSET = 0x6F6ED
FOUND_BANK = 27
FOUND_CPU = 0xB6ED

# High-level EXP from cowness.net
HERO_EXP_HIGH = {
    25: 102787,  # $019183
    26: 118192,  # $01CDB0
    27: 135522,  # $021162
    28: 155018,  # $025D8A
    29: 176951,  # $02B337
    30: 201625,  # $031399  <- This is what we found!
    31: 229383,  # $038007
}


def analyze_area(rom, center_offset, window=256):
    """Analyze the ROM area around the found offset."""
    print(f"Analyzing area around ROM offset ${center_offset:05X}")
    print("=" * 70)
    print()

    start = max(16, center_offset - window)  # Skip iNES header
    end = min(len(rom), center_offset + window)

    # First, let's see the hex dump
    print("Hex dump around found location:")
    print("-" * 70)

    for i in range(start, end, 16):
        hex_str = " ".join(f"{rom[j]:02X}" for j in range(i, min(i+16, end)))
        # Highlight the found bytes
        rel = i - center_offset
        marker = " <-- FOUND" if -3 <= rel <= 0 else ""
        print(f"${i:05X}: {hex_str}{marker}")

    print()

    # Look for 3-byte patterns
    print("Interpreting as 3-byte little-endian values:")
    print("-" * 70)

    # Align to start of what might be a table
    # The found bytes are at center_offset, so table might start earlier

    # Try different alignments
    for alignment_name, table_start in [
        ("Table at -30 entries", center_offset - 30*3),
        ("Table at -15 entries", center_offset - 15*3),
        ("Table at -10 entries", center_offset - 10*3),
        ("Table at -5 entries", center_offset - 5*3),
    ]:
        print(f"\n{alignment_name} (offset ${table_start:05X}):")

        values = []
        for j in range(40):
            off = table_start + j*3
            if 16 <= off + 2 < len(rom):
                val = rom[off] | (rom[off+1] << 8) | (rom[off+2] << 16)
                values.append((j+1, val, off))

        # Print values with markers for known EXP
        for entry_num, val, off in values:
            marker = ""
            for level, exp in HERO_EXP_HIGH.items():
                if val == exp:
                    marker = f" <-- Level {level} EXP!"
                    break
            if not marker and 0 < val < 500000 and val % 1 == 0:
                # Check if it's in the progression
                for level, exp in HERO_EXP_HIGH.items():
                    ratio = val / exp if exp > 0 else 0
                    if 0.8 < ratio < 1.2:
                        marker = f" (near Level {level}?)"
                        break

            if val < 500000:  # Only show reasonable values
                print(f"  Entry {entry_num:2d}: {val:9,} (${val:06X}) at ${off:05X}{marker}")


def search_all_patterns(rom):
    """Search for all the high-level EXP values and their spacing."""
    print("\n" + "=" * 70)
    print("Searching for all known high-level EXP values:")
    print("=" * 70)

    all_matches = []

    for level, exp in sorted(HERO_EXP_HIGH.items()):
        low = exp & 0xFF
        mid = (exp >> 8) & 0xFF
        high = (exp >> 16) & 0xFF
        pattern = bytes([low, mid, high])

        pos = 16  # Skip header
        while True:
            pos = rom.find(pattern, pos)
            if pos == -1:
                break

            bank = (pos - 16) // 0x4000
            bank_off = (pos - 16) % 0x4000
            cpu = 0x8000 + bank_off

            all_matches.append({
                "level": level,
                "exp": exp,
                "rom_offset": pos,
                "bank": bank,
                "cpu": cpu,
            })
            print(f"  Level {level}: {exp:,} found at Bank {bank} ${cpu:04X} (ROM ${pos:05X})")
            pos += 1

    if not all_matches:
        print("  No matches found!")

    return all_matches


def look_for_table_structure(rom):
    """Try to find a complete EXP table by looking for increasing 3-byte values."""
    print("\n" + "=" * 70)
    print("Searching for tables of increasing 3-byte values (potential EXP tables):")
    print("=" * 70)

    candidates = []

    # Scan the ROM for sequences of increasing 3-byte values
    for i in range(16, len(rom) - 100, 3):  # Step by 3 for alignment
        values = []
        for j in range(20):  # Look at 20 consecutive entries
            off = i + j*3
            if off + 2 >= len(rom):
                break
            val = rom[off] | (rom[off+1] << 8) | (rom[off+2] << 16)
            values.append(val)

        if len(values) < 10:
            continue

        # Check if values are:
        # 1. All increasing
        # 2. In reasonable EXP range (0 to 500,000)
        # 3. Starting small (first value < 100 suggests level 2)

        is_increasing = all(values[k] < values[k+1] for k in range(len(values)-1))
        in_range = all(0 < v < 500000 for v in values)
        starts_small = values[0] < 100

        if is_increasing and in_range:
            bank = (i - 16) // 0x4000
            bank_off = (i - 16) % 0x4000
            cpu = 0x8000 + bank_off

            # Check if any known values are in this sequence
            known_found = []
            for level, exp in HERO_EXP_HIGH.items():
                if exp in values:
                    known_found.append(level)

            candidates.append({
                "offset": i,
                "bank": bank,
                "cpu": cpu,
                "first_5": values[:5],
                "last_5": values[-5:],
                "starts_small": starts_small,
                "known_levels": known_found,
            })

    # Sort by likelihood (prefer tables that start small and contain known values)
    def score(c):
        s = 0
        if c["starts_small"]:
            s += 10
        s += len(c["known_levels"]) * 5
        return s

    candidates.sort(key=score, reverse=True)

    print(f"\nFound {len(candidates)} candidate tables. Top 10:")
    for i, c in enumerate(candidates[:10]):
        known = f", has levels {c['known_levels']}" if c["known_levels"] else ""
        print(f"\n{i+1}. Bank {c['bank']} ${c['cpu']:04X} (ROM ${c['offset']:05X})")
        print(f"   First 5: {c['first_5']}")
        print(f"   Last 5:  {c['last_5']}{known}")

    return candidates


def investigate_bank27_data(rom):
    """Specifically investigate Bank 27 data structures."""
    print("\n" + "=" * 70)
    print("Bank 27 Data Analysis:")
    print("=" * 70)

    bank_start = 16 + 27 * 0x4000  # ROM offset for Bank 27
    bank_end = bank_start + 0x4000

    print(f"Bank 27 ROM range: ${bank_start:05X} - ${bank_end:05X}")

    # Look for any tables of 3-byte values in this bank
    for i in range(bank_start, bank_end - 100, 3):
        values = []
        for j in range(10):
            off = i + j*3
            if off + 2 >= bank_end:
                break
            val = rom[off] | (rom[off+1] << 8) | (rom[off+2] << 16)
            values.append(val)

        # Check for reasonable increasing sequence
        if len(values) >= 5:
            is_increasing = all(values[k] < values[k+1] for k in range(len(values)-1))
            reasonable = all(0 < v < 500000 for v in values)

            if is_increasing and reasonable and values[0] < 100:
                bank_off = (i - bank_start)
                cpu = 0x8000 + bank_off
                print(f"\nPotential table at ${cpu:04X}: {values}")


def main():
    print("Dragon Warrior IV - Bank 27 EXP Table Investigation")
    print("=" * 70)

    if not ROM_PATH.exists():
        print(f"ERROR: ROM not found at {ROM_PATH}")
        return

    with open(ROM_PATH, "rb") as f:
        rom = f.read()

    print(f"ROM loaded: {len(rom)} bytes")
    print(f"\nInvestigating found match at ROM offset ${FOUND_OFFSET:05X}")
    print(f"(Bank {FOUND_BANK}, CPU ${FOUND_CPU:04X})")
    print()

    # Analyze the area around the found value
    analyze_area(rom, FOUND_OFFSET, window=128)

    # Search for all known values
    all_matches = search_all_patterns(rom)

    # Look for table structures
    candidates = look_for_table_structure(rom)

    # Investigate Bank 27 specifically
    investigate_bank27_data(rom)

    # Write findings to file
    OUTPUT_DIR.mkdir(exist_ok=True)
    output_file = OUTPUT_DIR / "bank27_exp_investigation.txt"

    with open(output_file, "w", encoding="utf-8") as f:
        f.write("Dragon Warrior IV - Bank 27 EXP Table Investigation\n")
        f.write("=" * 70 + "\n\n")
        f.write(f"Found Level 30 EXP at ROM ${FOUND_OFFSET:05X} (Bank {FOUND_BANK}, ${FOUND_CPU:04X})\n\n")

        if candidates:
            f.write(f"\nTop candidate tables ({len(candidates)} total):\n")
            for i, c in enumerate(candidates[:20]):
                f.write(f"\n{i+1}. Bank {c['bank']} ${c['cpu']:04X}\n")
                f.write(f"   First 5: {c['first_5']}\n")

    print(f"\nResults written to {output_file}")


if __name__ == "__main__":
    main()
