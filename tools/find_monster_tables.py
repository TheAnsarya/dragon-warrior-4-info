#!/usr/bin/env python3
"""
Search for monster data tables in Dragon Warrior IV ROM.

Known monster data patterns from cowness.net:
- Metal Slime: byte 22 = $11, byte 24 = $3F
- Esturk: byte 22 = $00, byte 24 = $07 (very sleepy)
- King Metal: byte 22 = $11, byte 24 = $37

Search strategy:
1. Look for sequences of monster-like data (HP, attack patterns)
2. Look for known byte 22/24 patterns
3. Look for the $11 metal flag followed by $3F
"""

import os
from pathlib import Path
from collections import defaultdict

SCRIPT_DIR = Path(__file__).parent
ROM_PATH = SCRIPT_DIR.parent / "roms" / "Dragon Warrior IV (1992-10)(Enix)(US).nes"
OUTPUT_DIR = SCRIPT_DIR.parent / "data"

# Known monster patterns
METAL_SLIME_22_24 = bytes([0x11, 0x3F])  # Metal flag, standard
KING_METAL_22_24 = bytes([0x11, 0x37])    # Metal flag, two-turn
ESTURK_22_24 = bytes([0x00, 0x07])        # Sleepiest Boy
NECROSARO7_22_24 = bytes([0x00, 0xC7])    # Bounce

# Tournament HP values (from cowness.net)
TOURNAMENT_HP = {
    "Hun": 70,
    "Roric": 90,
    "Vivian": 90,
    "Sampson": 90,
    "Linguar": 55,
}

# Necrosaro HP by phase
NECROSARO_HP = [800, 650, 1023, 1023, 700, 800, 700, 1023]


def search_for_pattern(rom, pattern, context_before=8, context_after=8):
    """Search for a byte pattern in ROM."""
    results = []
    pos = 0
    while True:
        pos = rom.find(pattern, pos)
        if pos == -1:
            break

        bank = (pos - 16) // 0x4000
        bank_offset = (pos - 16) % 0x4000
        cpu = 0x8000 + bank_offset

        # Get context
        start = max(0, pos - context_before)
        end = min(len(rom), pos + len(pattern) + context_after)
        context = rom[start:end]

        results.append({
            "offset": pos,
            "bank": bank,
            "cpu": cpu,
            "context": context,
            "context_offset": pos - start,
        })
        pos += 1

    return results


def search_for_hp_values(rom, hp_values):
    """Search for HP values as 16-bit little-endian."""
    results = []

    for name, hp in hp_values.items():
        hp_lo = hp & 0xFF
        hp_hi = (hp >> 8) & 0xFF
        pattern = bytes([hp_lo, hp_hi])

        pos = 0
        while True:
            pos = rom.find(pattern, pos)
            if pos == -1:
                break

            bank = (pos - 16) // 0x4000
            bank_offset = (pos - 16) % 0x4000
            cpu = 0x8000 + bank_offset

            results.append({
                "name": name,
                "hp": hp,
                "offset": pos,
                "bank": bank,
                "cpu": cpu,
            })
            pos += 1

    return results


def analyze_potential_monster_table(rom, start_offset, record_size=27):
    """Analyze a potential monster table starting at given offset."""
    # Read several records
    records = []
    for i in range(20):  # Check 20 potential monsters
        offset = start_offset + i * record_size
        if offset + record_size > len(rom):
            break

        record = rom[offset:offset + record_size]

        # Extract fields
        exp = record[0] | (record[1] << 8)
        gold = record[2] | (record[3] << 8)
        hp = record[4] | (record[5] << 8)
        attack = record[6]
        defense = record[7]
        agility = record[8]

        # Check if this looks like a monster
        if 0 < hp < 2000 and 0 < attack < 300 and 0 < defense < 300:
            records.append({
                "index": i,
                "offset": offset,
                "exp": exp,
                "gold": gold,
                "hp": hp,
                "attack": attack,
                "defense": defense,
                "agility": agility,
                "byte_22": record[22] if len(record) > 22 else None,
                "byte_24": record[24] if len(record) > 24 else None,
            })

    return records


def find_monster_tables(rom):
    """Try to find monster data tables in the ROM."""
    print("=" * 70)
    print("Dragon Warrior IV - Monster Table Search")
    print("=" * 70)
    print()

    # Search for metal slime pattern ($11 followed by specific pattern)
    print("Searching for Metal Slime byte pattern ($11, $3F)...")
    metal_results = search_for_pattern(rom, METAL_SLIME_22_24, 24, 4)
    print(f"  Found {len(metal_results)} matches")

    for r in metal_results[:10]:
        print(f"    Bank {r['bank']} ${r['cpu']:04X} (ROM ${r['offset']:05X})")
        # Show context as potential record
        ctx = r['context']
        print(f"      Context: {' '.join(f'{b:02X}' for b in ctx)}")

    print()

    # Search for King Metal pattern
    print("Searching for King Metal byte pattern ($11, $37)...")
    king_results = search_for_pattern(rom, KING_METAL_22_24, 24, 4)
    print(f"  Found {len(king_results)} matches")

    for r in king_results[:10]:
        print(f"    Bank {r['bank']} ${r['cpu']:04X} (ROM ${r['offset']:05X})")
        ctx = r['context']
        print(f"      Context: {' '.join(f'{b:02X}' for b in ctx)}")

    print()

    # Search for Esturk pattern (sleepy)
    print("Searching for Esturk byte pattern ($00, $07)...")
    esturk_results = search_for_pattern(rom, ESTURK_22_24, 24, 4)
    print(f"  Found {len(esturk_results)} matches (showing first 20)")

    for r in esturk_results[:20]:
        print(f"    Bank {r['bank']} ${r['cpu']:04X} (ROM ${r['offset']:05X})")

    print()

    # Search for Necrosaro 7 pattern (bounce)
    print("Searching for Necrosaro 7 byte pattern ($00, $C7)...")
    necro_results = search_for_pattern(rom, NECROSARO7_22_24, 24, 4)
    print(f"  Found {len(necro_results)} matches")

    for r in necro_results[:10]:
        print(f"    Bank {r['bank']} ${r['cpu']:04X} (ROM ${r['offset']:05X})")
        ctx = r['context']
        print(f"      Context: {' '.join(f'{b:02X}' for b in ctx)}")

    print()

    # Look for tables by searching for specific HP values
    print("Searching for tournament monster HP values...")
    hp_results = search_for_hp_values(rom, TOURNAMENT_HP)

    # Group by bank
    by_bank = defaultdict(list)
    for r in hp_results:
        by_bank[r['bank']].append(r)

    for bank, results in sorted(by_bank.items()):
        if len(results) >= 2:  # Multiple tournament HP in same bank
            print(f"\n  Bank {bank} has {len(results)} tournament HP matches:")
            for r in results:
                print(f"    {r['name']}: HP={r['hp']} at ${r['cpu']:04X}")

    print()

    # Look for Necrosaro HP values (800, 650, 1023, etc)
    print("Searching for Necrosaro phase HP values...")
    necro_hp_results = {}
    for i, hp in enumerate(NECROSARO_HP):
        pattern = bytes([hp & 0xFF, (hp >> 8) & 0xFF])
        results = search_for_pattern(rom, pattern, 2, 2)
        necro_hp_results[i+1] = len(results)
        print(f"  Phase {i+1}: HP={hp}, found {len(results)} matches")

    print()

    # Try to find a monster table by looking for data patterns
    print("Scanning for potential monster tables...")
    print("-" * 70)

    # Look for areas with many small-ish values that could be stats
    candidates = []

    for i in range(16, len(rom) - 1000, 1):
        # Check if this could be a monster table start
        # Looking for records of ~27 bytes with reasonable stat values

        valid_count = 0
        for j in range(10):  # Check 10 potential monsters
            offset = i + j * 27
            if offset + 27 > len(rom):
                break

            # Check HP at byte 4-5
            hp = rom[offset + 4] | (rom[offset + 5] << 8)
            attack = rom[offset + 6]
            defense = rom[offset + 7]

            if 1 <= hp <= 2000 and 1 <= attack <= 255 and 1 <= defense <= 255:
                valid_count += 1

        if valid_count >= 8:  # At least 8 valid-looking records
            bank = (i - 16) // 0x4000
            bank_offset = (i - 16) % 0x4000
            cpu = 0x8000 + bank_offset
            candidates.append({
                "offset": i,
                "bank": bank,
                "cpu": cpu,
                "valid_count": valid_count,
            })
            i += 100  # Skip ahead to avoid duplicates

    print(f"Found {len(candidates)} candidate monster table starts")

    for c in candidates[:10]:
        print(f"\n  Bank {c['bank']} ${c['cpu']:04X} (ROM ${c['offset']:05X}) - {c['valid_count']} valid records")

        # Analyze the table
        records = analyze_potential_monster_table(rom, c['offset'])
        print(f"    Analyzed records:")
        for rec in records[:5]:
            print(f"      #{rec['index']:2d}: HP={rec['hp']:4d} ATK={rec['attack']:3d} DEF={rec['defense']:3d} "
                  f"EXP={rec['exp']:5d} GOLD={rec['gold']:4d}")

    return candidates


def main():
    if not ROM_PATH.exists():
        print(f"ERROR: ROM not found at {ROM_PATH}")
        return

    with open(ROM_PATH, "rb") as f:
        rom = f.read()

    print(f"ROM loaded: {len(rom)} bytes\n")

    candidates = find_monster_tables(rom)

    # Write results
    OUTPUT_DIR.mkdir(exist_ok=True)
    output_file = OUTPUT_DIR / "monster_table_search.txt"

    with open(output_file, "w", encoding="utf-8") as f:
        f.write("Dragon Warrior IV - Monster Table Search Results\n")
        f.write("=" * 70 + "\n\n")
        f.write(f"Found {len(candidates)} candidate monster table starts\n\n")

        for c in candidates[:20]:
            f.write(f"Bank {c['bank']} ${c['cpu']:04X} (ROM ${c['offset']:05X})\n")

    print(f"\nResults written to {output_file}")


if __name__ == "__main__":
    main()
