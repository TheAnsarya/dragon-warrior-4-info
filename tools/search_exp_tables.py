#!/usr/bin/env python3
"""
Search for Dragon Warrior IV experience tables in ROM.

DW4 stores experience thresholds for each character.
Known Hero exp requirements (from GameFAQs and cowness.net):

Early levels (from FAQs):
- Level 2:      7 exp
- Level 3:     23 exp
- Level 4:     50 exp
- Level 5:     92 exp
- Level 6:    156 exp
- Level 7:    250 exp
- Level 8:    382 exp
- Level 9:    560 exp
- Level 10:   792 exp

High levels (from cowness.net speedrun notes):
- Level 25: 102,787 exp  ($019183 = bytes 83 91 01)
- Level 26: 118,192 exp  ($01CDB0 = bytes B0 CD 01)
- Level 27: 135,522 exp  ($021162 = bytes 62 11 02)
- Level 28: 155,018 exp  ($025D8A = bytes 8A 5D 02)
- Level 29: 176,951 exp  ($02B337 = bytes 37 B3 02)
- Level 30: 201,625 exp  ($031399 = bytes 99 13 03)
- Level 31: 229,383 exp  ($038007 = bytes 07 80 03)

Storage formats to search:
1. 16-bit values (2 bytes each) - for early levels
2. 24-bit values (3 bytes each) - for high levels
3. Cumulative totals
4. Incremental differences
5. Split byte tables (lo/mid/hi separate)
"""

import os

ROM_PATH = os.path.join(os.path.dirname(__file__), "..", "roms",
                        "Dragon Warrior IV (1992-10)(Enix)(US).nes")

# Known exp values for Hero (from GameFAQs)
HERO_EXP = [7, 23, 50, 92, 156, 250, 382, 560, 792, 1087]  # Levels 2-11

# High-level EXP from cowness.net (verified speedrun data)
HERO_EXP_HIGH = {
    25: 102787,  # $019183
    26: 118192,  # $01CDB0
    27: 135522,  # $021162
    28: 155018,  # $025D8A
    29: 176951,  # $02B337
    30: 201625,  # $031399
    31: 229383,  # $038007
}

def search_16bit_exp(rom):
    """Search for exp as consecutive 16-bit values."""
    print("Searching for 16-bit exp tables...")

    for i in range(len(rom) - 40):
        # Check if this could be level 2 exp
        val2 = rom[i] + (rom[i+1] << 8)
        if val2 != HERO_EXP[0]:  # Level 2 = 7
            continue

        # Check level 3
        val3 = rom[i+2] + (rom[i+3] << 8)
        if val3 != HERO_EXP[1]:  # Level 3 = 23
            continue

        # Check level 4
        val4 = rom[i+4] + (rom[i+5] << 8)
        if val4 != HERO_EXP[2]:  # Level 4 = 50
            continue

        # Found a match!
        bank = i // 0x4000
        offset = i % 0x4000
        cpu = 0x8000 + offset

        print(f"\nFOUND 16-bit table at Bank {bank} ${cpu:04X} (ROM 0x{i:05X})")

        # Extract all values
        values = []
        for j in range(50):
            if i + j*2 + 1 < len(rom):
                val = rom[i + j*2] + (rom[i + j*2 + 1] << 8)
                values.append(val)
        print(f"  First 20 values: {values[:20]}")
        return i


def search_24bit_exp(rom):
    """Search for exp as consecutive 24-bit values."""
    print("\nSearching for 24-bit exp tables...")

    for i in range(len(rom) - 60):
        # Check if this could be level 2 exp
        val2 = rom[i] + (rom[i+1] << 8) + (rom[i+2] << 16)
        if val2 != HERO_EXP[0]:
            continue

        # Check level 3
        val3 = rom[i+3] + (rom[i+4] << 8) + (rom[i+5] << 16)
        if val3 != HERO_EXP[1]:
            continue

        # Found a match!
        bank = i // 0x4000
        offset = i % 0x4000
        cpu = 0x8000 + offset

        print(f"\nFOUND 24-bit table at Bank {bank} ${cpu:04X} (ROM 0x{i:05X})")

        values = []
        for j in range(30):
            if i + j*3 + 2 < len(rom):
                val = rom[i + j*3] + (rom[i + j*3 + 1] << 8) + (rom[i + j*3 + 2] << 16)
                values.append(val)
        print(f"  First 15 values: {values[:15]}")
        return i


def search_high_level_exp(rom):
    """Search for high-level EXP values from cowness.net data."""
    print("\nSearching for high-level EXP values (cowness.net data)...")
    
    results = []
    
    for level, exp in sorted(HERO_EXP_HIGH.items()):
        # Convert to 3-byte little-endian
        low = exp & 0xFF
        mid = (exp >> 8) & 0xFF
        high = (exp >> 16) & 0xFF
        
        pattern = bytes([low, mid, high])
        
        pos = 0
        while True:
            pos = rom.find(pattern, pos)
            if pos == -1:
                break
            
            bank = pos // 0x4000
            offset = pos % 0x4000
            cpu = 0x8000 + offset
            
            results.append({
                "level": level,
                "exp": exp,
                "rom_offset": pos,
                "bank": bank,
                "cpu_addr": cpu,
                "bytes": f"{low:02X} {mid:02X} {high:02X}",
            })
            pos += 1
    
    if results:
        print(f"\nFOUND {len(results)} matches for high-level EXP:")
        for r in results:
            print(f"  Level {r['level']}: {r['exp']:,} at Bank {r['bank']} ${r['cpu_addr']:04X} "
                  f"(ROM 0x{r['rom_offset']:05X}) [{r['bytes']}]")
        
        # Look for clusters (potential table location)
        by_bank = {}
        for r in results:
            if r["bank"] not in by_bank:
                by_bank[r["bank"]] = []
            by_bank[r["bank"]].append(r)
        
        for bank, matches in sorted(by_bank.items()):
            if len(matches) >= 2:
                print(f"\n  Cluster in Bank {bank}: {len(matches)} matches")
                # Check if they're evenly spaced
                offsets = sorted([m["rom_offset"] for m in matches])
                for i in range(1, len(offsets)):
                    spacing = offsets[i] - offsets[i-1]
                    print(f"    Spacing between entries: {spacing} bytes")
    else:
        print("  No high-level EXP values found in ROM.")
    
    return results


def search_split_exp(rom):
    """Search for exp stored as split lo/mid/hi byte tables."""
    print("\nSearching for split byte exp tables...")

    # Level 2 = 7 = 0x000007, level 3 = 23 = 0x000017
    # Low bytes: 07 17 32 5C 9C ... (7, 23, 50, 92, 156...)

    for i in range(len(rom) - 100):
        # Check low byte pattern
        if rom[i] != 0x07:  # Level 2 low byte
            continue
        if rom[i+1] != 0x17:  # Level 3 low byte (23)
            continue
        if rom[i+2] != 0x32:  # Level 4 low byte (50)
            continue
        if rom[i+3] != 0x5C:  # Level 5 low byte (92)
            continue

        bank = i // 0x4000
        offset = i % 0x4000
        cpu = 0x8000 + offset

        print(f"\nFOUND split low byte table at Bank {bank} ${cpu:04X} (ROM 0x{i:05X})")
        print(f"  First 20 bytes: {list(rom[i:i+20])}")
        return i


def search_fuzzy(rom):
    """Fuzzy search for exp patterns (may not be exact values from FAQs)."""
    print("\nFuzzy search for exp-like patterns...")

    # Look for small values that increase
    candidates = []

    for i in range(len(rom) - 40):
        vals = []
        for j in range(10):
            val = rom[i + j*2] + (rom[i + j*2 + 1] << 8)
            vals.append(val)

        # Check if this looks like early exp values:
        # - First value 5-15
        # - Second value 15-35
        # - Third value 35-70
        # - Values monotonically increasing
        if 5 <= vals[0] <= 15 and 15 <= vals[1] <= 35 and 35 <= vals[2] <= 70:
            if all(vals[k] < vals[k+1] for k in range(len(vals)-1)):
                bank = i // 0x4000
                offset = i % 0x4000
                cpu = 0x8000 + offset
                print(f"  Candidate: Bank {bank} ${cpu:04X} - {vals}")
                candidates.append((i, vals))

    return candidates


def main():
    print("Dragon Warrior IV Experience Table Search")
    print("=" * 50)
    print(f"Looking for Hero exp pattern: {HERO_EXP[:5]}...")
    print(f"Also searching for high-level EXP: {list(HERO_EXP_HIGH.keys())}")
    print()

    with open(ROM_PATH, "rb") as f:
        rom = f.read()[16:]  # Skip header

    print(f"ROM size: {len(rom)} bytes")

    # Try different search methods
    result = search_16bit_exp(rom)
    if not result:
        result = search_24bit_exp(rom)
    if not result:
        result = search_split_exp(rom)
    
    # Search for high-level EXP from cowness.net
    high_results = search_high_level_exp(rom)

    # Also do fuzzy search
    fuzzy_results = search_fuzzy(rom)

    if not result and not fuzzy_results and not high_results:
        print("\nNo exp tables found with exact matching.")
        print("Exp tables may be:")
        print("  - Calculated at runtime (formula-based)")
        print("  - Stored in a compressed/encoded format")
        print("  - Using different values than FAQs (JP vs US)")


if __name__ == "__main__":
    main()
