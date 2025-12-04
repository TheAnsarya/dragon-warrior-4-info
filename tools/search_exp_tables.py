#!/usr/bin/env python3
"""
Search for Dragon Warrior IV experience tables in ROM.

DW4 stores experience thresholds for each character.
Character-specific EXP requirements from woodus.com:
- Hero/Ragnar share a table
- Cristo, Nara, Mara, Brey, Taloon, Alena each have unique tables

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

# Character-specific EXP requirements from woodus.com
# Format: Level -> Total EXP required
EXP_TABLES = {
    'Hero/Ragnar': {
        2: 19, 3: 57, 4: 133, 5: 285, 6: 493, 7: 718, 8: 1048, 9: 1635, 10: 3290,
        11: 4379, 12: 5725, 13: 7499, 14: 9660, 15: 12395, 16: 15715, 17: 19785,
        18: 24818, 19: 30951, 20: 38511, 21: 47789, 22: 58824, 23: 71912, 24: 86693,
        25: 102787, 26: 124026, 27: 147152, 28: 173035, 29: 202068, 30: 234669,
        31: 271296, 32: 312433, 33: 358581, 34: 410264, 35: 468023, 36: 532397,
        37: 603922, 38: 683137, 39: 770574, 40: 549973, 50: 1126573, 60: 1990317,
        70: 3183261, 80: 4764685, 90: 6811409, 99: 7394160
    },
    'Cristo': {
        2: 12, 3: 36, 4: 84, 5: 156, 6: 252, 7: 372, 8: 564, 9: 828, 10: 1579,
        11: 2076, 12: 2721, 13: 3552, 14: 4552, 15: 5800, 16: 7345, 17: 9219,
        18: 11538, 19: 14358, 20: 17828, 21: 22064, 22: 27108, 23: 33079, 24: 39841,
        25: 86843, 26: 104856, 27: 124401, 28: 146262, 29: 170827, 30: 181943,
        99: 6407275
    },
    'Nara': {
        2: 16, 3: 46, 4: 102, 5: 186, 6: 300, 7: 444, 8: 672, 9: 984, 10: 1844,
        11: 2413, 12: 3165, 13: 4121, 14: 5282, 15: 6731, 16: 8521, 17: 10691,
        18: 13379, 19: 16646, 20: 20658, 21: 25550, 22: 31373, 23: 38293, 24: 46096,
        25: 80365, 26: 96902, 27: 114941, 28: 135155, 29: 157868, 30: 161129,
        99: 6007735
    },
    'Mara': {
        2: 18, 3: 51, 4: 112, 5: 203, 6: 326, 7: 481, 8: 728, 9: 1063, 10: 1996,
        11: 2602, 12: 3415, 13: 4445, 14: 5695, 15: 7261, 16: 9186, 17: 11527,
        18: 14420, 19: 17937, 20: 22249, 21: 27510, 22: 33770, 23: 41204, 24: 49594,
        25: 86960, 26: 104869, 27: 124330, 28: 146194, 29: 170707, 30: 174355,
        99: 6504595
    },
    'Brey': {
        2: 19, 3: 54, 4: 119, 5: 216, 6: 347, 7: 512, 8: 773, 9: 1126, 10: 2120,
        11: 2776, 12: 3636, 13: 4730, 14: 6061, 15: 7724, 16: 9772, 17: 12259,
        18: 15334, 19: 19067, 20: 23639, 21: 29218, 22: 35866, 23: 43753, 24: 52653,
        25: 92254, 26: 111256, 27: 131891, 28: 155098, 29: 181133, 30: 184967,
        99: 6895435
    },
    'Taloon': {
        2: 10, 3: 30, 4: 70, 5: 130, 6: 210, 7: 310, 8: 470, 9: 690, 10: 1314,
        11: 1732, 12: 2274, 13: 2968, 14: 3804, 15: 4852, 16: 6145, 17: 7715,
        18: 9660, 19: 12025, 20: 14939, 21: 18495, 22: 22715, 23: 27731, 24: 33397,
        25: 67185, 26: 81072, 27: 96200, 28: 113154, 29: 132139, 30: 138307,
        99: 5166515
    },
    'Alena': {
        2: 20, 3: 60, 4: 140, 5: 260, 6: 420, 7: 620, 8: 940, 9: 1380, 10: 2632,
        11: 3468, 12: 4552, 13: 5944, 14: 7616, 15: 9712, 16: 12299, 17: 15440,
        18: 19329, 19: 24060, 20: 29888, 21: 37000, 22: 45440, 23: 55472, 24: 66804,
        25: 124763, 26: 150577, 27: 178659, 28: 210195, 29: 245437, 30: 253192,
        99: 9461730
    }
}

# Legacy values for backward compatibility
HERO_EXP = [EXP_TABLES['Hero/Ragnar'][i] for i in range(2, 12)]  # Levels 2-11

# High-level EXP
HERO_EXP_HIGH = {
    25: 102787,  # $019183
    26: 124026,  # $01E49A
    27: 147152,  # $023ED0
    28: 173035,  # $02A3EB
    29: 202068,  # $0314D4
    30: 234669,  # $0394AD
    31: 271296,  # $042480
}

def search_16bit_exp(rom):
    """Search for exp as consecutive 16-bit values for all characters."""
    print("Searching for 16-bit exp tables...")

    results = []

    for char_name, exp_data in EXP_TABLES.items():
        # Get first 4 exp values that fit in 16-bit
        early_levels = sorted([l for l in exp_data.keys() if exp_data[l] < 65536])[:4]
        if len(early_levels) < 4:
            continue

        exp_vals = [exp_data[l] for l in early_levels]

        for i in range(len(rom) - 40):
            # Check first 4 values
            match = True
            for j, expected in enumerate(exp_vals):
                val = rom[i + j*2] + (rom[i + j*2 + 1] << 8)
                if val != expected:
                    match = False
                    break

            if match:
                bank = i // 0x4000
                offset = i % 0x4000
                cpu = 0x8000 + offset if bank < 16 else 0xC000 + offset

                print(f"\nFOUND {char_name} 16-bit table at Bank {bank} ${cpu:04X} (ROM 0x{i:05X})")

                # Extract all values
                values = []
                for j in range(50):
                    if i + j*2 + 1 < len(rom):
                        val = rom[i + j*2] + (rom[i + j*2 + 1] << 8)
                        values.append(val)
                print(f"  Levels {early_levels}")
                print(f"  First 20 values: {values[:20]}")
                results.append((char_name, i, values))

    return results


def search_24bit_exp(rom):
    """Search for exp as consecutive 24-bit values for all characters."""
    print("\nSearching for 24-bit exp tables...")

    results = []

    for char_name, exp_data in EXP_TABLES.items():
        # Get first 3 exp values
        early_levels = sorted(exp_data.keys())[:3]
        exp_vals = [exp_data[l] for l in early_levels]

        for i in range(len(rom) - 60):
            # Check first 3 values
            match = True
            for j, expected in enumerate(exp_vals):
                val = rom[i + j*3] + (rom[i + j*3 + 1] << 8) + (rom[i + j*3 + 2] << 16)
                if val != expected:
                    match = False
                    break

            if match:
                bank = i // 0x4000
                offset = i % 0x4000
                cpu = 0x8000 + offset if bank < 16 else 0xC000 + offset

                print(f"\nFOUND {char_name} 24-bit table at Bank {bank} ${cpu:04X} (ROM 0x{i:05X})")

                values = []
                for j in range(30):
                    if i + j*3 + 2 < len(rom):
                        val = rom[i + j*3] + (rom[i + j*3 + 1] << 8) + (rom[i + j*3 + 2] << 16)
                        values.append(val)
                print(f"  First 15 values: {values[:15]}")
                results.append((char_name, i, values))

    return results


def search_high_level_exp(rom):
    """Search for high-level EXP values from all character tables."""
    print("\nSearching for high-level EXP values...")

    results = []

    for char_name, exp_data in EXP_TABLES.items():
        # Search for higher level values (less likely to have false positives)
        for level in [10, 15, 20, 25, 30]:
            if level not in exp_data:
                continue

            exp = exp_data[level]

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
                cpu = 0x8000 + offset if bank < 16 else 0xC000 + offset

                results.append({
                    "character": char_name,
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

        # Group by character
        by_char = {}
        for r in results:
            key = r["character"]
            if key not in by_char:
                by_char[key] = []
            by_char[key].append(r)

        for char_name, char_results in sorted(by_char.items()):
            print(f"\n  {char_name}:")
            for r in sorted(char_results, key=lambda x: x["level"])[:5]:
                print(f"    Level {r['level']}: {r['exp']:,} at Bank {r['bank']} ${r['cpu_addr']:04X} "
                      f"(ROM 0x{r['rom_offset']:05X})")

        # Look for clusters (potential table location)
        by_bank = {}
        for r in results:
            if r["bank"] not in by_bank:
                by_bank[r["bank"]] = []
            by_bank[r["bank"]].append(r)

        print("\n--- Banks with multiple matches ---")
        for bank, matches in sorted(by_bank.items()):
            if len(matches) >= 3:
                print(f"\n  Bank {bank}: {len(matches)} matches")
                chars_found = set(m["character"] for m in matches)
                print(f"    Characters: {', '.join(chars_found)}")

                # Check if they're evenly spaced
                offsets = sorted([m["rom_offset"] for m in matches])
                if len(offsets) >= 2:
                    spacing_counts = {}
                    for i in range(1, len(offsets)):
                        spacing = offsets[i] - offsets[i-1]
                        spacing_counts[spacing] = spacing_counts.get(spacing, 0) + 1

                    common_spacing = max(spacing_counts.items(), key=lambda x: x[1])
                    print(f"    Most common spacing: {common_spacing[0]} bytes ({common_spacing[1]} occurrences)")
    else:
        print("  No high-level EXP values found in ROM.")

    return results


def search_split_exp(rom):
    """Search for exp stored as split lo/mid/hi byte tables for all characters."""
    print("\nSearching for split byte exp tables...")

    results = []

    for char_name, exp_data in EXP_TABLES.items():
        early_levels = sorted(exp_data.keys())[:6]

        # Build low byte pattern
        low_bytes = bytes([exp_data[l] & 0xFF for l in early_levels])

        for i in range(len(rom) - 100):
            if rom[i:i+len(low_bytes)] == low_bytes:
                bank = i // 0x4000
                offset = i % 0x4000
                cpu = 0x8000 + offset if bank < 16 else 0xC000 + offset

                print(f"\nFOUND {char_name} split low byte table at Bank {bank} ${cpu:04X} (ROM 0x{i:05X})")
                print(f"  First 20 bytes: {list(rom[i:i+20])}")
                results.append((char_name, i, "low"))

    return results


def search_delta_exp(rom):
    """Search for delta/incremental EXP values (exp needed to level up, not cumulative)."""
    print("\nSearching for delta/incremental EXP tables...")

    results = []

    for char_name, exp_data in EXP_TABLES.items():
        # Calculate deltas
        levels = sorted(exp_data.keys())
        deltas = []
        for i in range(len(levels) - 1):
            if levels[i+1] == levels[i] + 1:  # Consecutive levels
                delta = exp_data[levels[i+1]] - exp_data[levels[i]]
                deltas.append((levels[i+1], delta))

        if len(deltas) < 4:
            continue

        # Search for first 4 deltas as 16-bit values
        delta_vals = [d[1] for d in deltas[:4] if d[1] < 65536]
        if len(delta_vals) < 4:
            continue

        for i in range(len(rom) - 20):
            match = True
            for j, expected in enumerate(delta_vals):
                val = rom[i + j*2] + (rom[i + j*2 + 1] << 8)
                if val != expected:
                    match = False
                    break

            if match:
                bank = i // 0x4000
                offset = i % 0x4000
                cpu = 0x8000 + offset if bank < 16 else 0xC000 + offset

                print(f"\nFOUND {char_name} delta exp table at Bank {bank} ${cpu:04X} (ROM 0x{i:05X})")
                print(f"  Deltas: {delta_vals}")
                results.append((char_name, i, "delta"))

    return results


def search_fuzzy(rom):
    """Fuzzy search for exp-like patterns matching character curves."""
    print("\nFuzzy search for exp-like patterns...")

    candidates = []

    for char_name, exp_data in EXP_TABLES.items():
        # Get expected ratios between early levels
        l2 = exp_data.get(2, 0)
        l3 = exp_data.get(3, 0)
        l4 = exp_data.get(4, 0)
        l5 = exp_data.get(5, 0)

        if not all([l2, l3, l4, l5]):
            continue

        # Check for similar ratios (within 20%)
        ratio_3_2 = l3 / l2 if l2 else 0
        ratio_4_3 = l4 / l3 if l3 else 0
        ratio_5_4 = l5 / l4 if l4 else 0

        for i in range(len(rom) - 40):
            v2 = rom[i] + (rom[i+1] << 8)
            if v2 < 5 or v2 > 100:
                continue

            v3 = rom[i+2] + (rom[i+3] << 8)
            v4 = rom[i+4] + (rom[i+5] << 8)
            v5 = rom[i+6] + (rom[i+7] << 8)

            if not all([v3, v4, v5]):
                continue

            # Check if ratios are similar
            try:
                r_3_2 = v3 / v2
                r_4_3 = v4 / v3
                r_5_4 = v5 / v4

                # Allow 25% tolerance
                if (abs(r_3_2 - ratio_3_2) / ratio_3_2 < 0.25 and
                    abs(r_4_3 - ratio_4_3) / ratio_4_3 < 0.25 and
                    abs(r_5_4 - ratio_5_4) / ratio_5_4 < 0.25):

                    bank = i // 0x4000
                    offset = i % 0x4000
                    cpu = 0x8000 + offset if bank < 16 else 0xC000 + offset

                    print(f"  {char_name} candidate: Bank {bank} ${cpu:04X} - [{v2}, {v3}, {v4}, {v5}]")
                    candidates.append((char_name, i, [v2, v3, v4, v5]))
            except ZeroDivisionError:
                pass

    return candidates


def search_by_unique_values(rom):
    """Search for unique identifying values specific to each character."""
    print("\nSearching for character-unique EXP values...")

    results = {}

    # Find values unique to each character
    all_values = {}
    for char_name, exp_data in EXP_TABLES.items():
        for level, exp in exp_data.items():
            if exp not in all_values:
                all_values[exp] = []
            all_values[exp].append((char_name, level))

    # Get unique values (only appear for one character)
    unique_values = {exp: chars[0] for exp, chars in all_values.items() if len(chars) == 1}

    print(f"  Found {len(unique_values)} character-unique EXP values")

    # Search for unique values
    for exp, (char_name, level) in unique_values.items():
        if exp < 256:  # Single byte - too common
            continue
        if exp > 16777215:  # Too large for 3 bytes
            continue

        # Try 2-byte search
        if exp < 65536:
            pattern = bytes([exp & 0xFF, (exp >> 8) & 0xFF])
            pos = 0
            while True:
                pos = rom.find(pattern, pos)
                if pos == -1:
                    break

                bank = pos // 0x4000
                offset = pos % 0x4000
                cpu = 0x8000 + offset if bank < 16 else 0xC000 + offset

                if char_name not in results:
                    results[char_name] = []
                results[char_name].append({
                    'level': level,
                    'exp': exp,
                    'bank': bank,
                    'addr': cpu,
                    'rom_offset': pos,
                    'byte_size': 2
                })
                pos += 1

        # Try 3-byte search
        pattern = bytes([exp & 0xFF, (exp >> 8) & 0xFF, (exp >> 16) & 0xFF])
        pos = 0
        while True:
            pos = rom.find(pattern, pos)
            if pos == -1:
                break

            bank = pos // 0x4000
            offset = pos % 0x4000
            cpu = 0x8000 + offset if bank < 16 else 0xC000 + offset

            if char_name not in results:
                results[char_name] = []
            results[char_name].append({
                'level': level,
                'exp': exp,
                'bank': bank,
                'addr': cpu,
                'rom_offset': pos,
                'byte_size': 3
            })
            pos += 1

    # Report results
    for char_name, matches in sorted(results.items()):
        if len(matches) > 0:
            print(f"\n  {char_name}: {len(matches)} unique value matches")

            # Group by bank
            by_bank = {}
            for m in matches:
                if m['bank'] not in by_bank:
                    by_bank[m['bank']] = []
                by_bank[m['bank']].append(m)

            for bank, bank_matches in sorted(by_bank.items()):
                if len(bank_matches) >= 2:
                    print(f"    Bank {bank}: {len(bank_matches)} matches")
                    for m in sorted(bank_matches, key=lambda x: x['level'])[:5]:
                        print(f"      L{m['level']}: {m['exp']:,} @ ${m['addr']:04X}")

    return results


def main():
    print("Dragon Warrior IV Experience Table Search (woodus.com data)")
    print("=" * 60)
    print("\nCharacter EXP curves:")
    for char_name, exp_data in EXP_TABLES.items():
        l2 = exp_data.get(2, 0)
        l10 = exp_data.get(10, 0)
        l30 = exp_data.get(30, 0)
        print(f"  {char_name:15}: L2={l2:5d}, L10={l10:5d}, L30={l30:6d}")
    print()

    with open(ROM_PATH, "rb") as f:
        rom = f.read()[16:]  # Skip header

    print(f"ROM size: {len(rom)} bytes")

    # Try different search methods
    results_16 = search_16bit_exp(rom)
    results_24 = search_24bit_exp(rom)
    results_split = search_split_exp(rom)
    results_delta = search_delta_exp(rom)

    # Search for high-level EXP values
    high_results = search_high_level_exp(rom)

    # Search for unique character values
    unique_results = search_by_unique_values(rom)

    # Also do fuzzy search
    fuzzy_results = search_fuzzy(rom)

    # Summary
    print("\n" + "=" * 60)
    print("SUMMARY")
    print("=" * 60)

    if any([results_16, results_24, results_split, results_delta]):
        print("\n--- Direct Table Matches ---")
        if results_16:
            print(f"  16-bit tables: {len(results_16)} found")
        if results_24:
            print(f"  24-bit tables: {len(results_24)} found")
        if results_split:
            print(f"  Split tables: {len(results_split)} found")
        if results_delta:
            print(f"  Delta tables: {len(results_delta)} found")

    if high_results:
        # Find most promising banks
        by_bank = {}
        for r in high_results:
            if r["bank"] not in by_bank:
                by_bank[r["bank"]] = set()
            by_bank[r["bank"]].add(r["character"])

        print("\n--- Most Promising Banks (by character coverage) ---")
        for bank, chars in sorted(by_bank.items(), key=lambda x: -len(x[1])):
            if len(chars) >= 2:
                print(f"  Bank {bank}: {len(chars)} characters - {', '.join(sorted(chars))}")

    if not any([results_16, results_24, results_split, results_delta, fuzzy_results]) and not high_results:
        print("\nNo exp tables found with exact matching.")
        print("Exp tables may be:")
        print("  - Calculated at runtime (formula-based)")
        print("  - Stored in a compressed/encoded format")
        print("  - Using different values than woodus.com (regional differences)")


if __name__ == "__main__":
    main()
