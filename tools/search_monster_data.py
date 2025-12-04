#!/usr/bin/env python3
"""
Search for monster data using known patterns more systematically.

From cowness.net:
- Metal Slime: byte 22 lower 2 bits = 11 (metal flag)
- Standard status flags at byte 24
- Drop rates encoded in byte 23 lower 3 bits

Let's search for patterns where we have consistent byte structures.
"""

import os
from pathlib import Path

SCRIPT_DIR = Path(__file__).parent
ROM_PATH = SCRIPT_DIR.parent / "roms" / "Dragon Warrior IV (1992-10)(Enix)(US).nes"
OUTPUT_DIR = SCRIPT_DIR.parent / "data"

# Try different record sizes
RECORD_SIZES = [16, 18, 20, 24, 27, 28, 30, 32]


def scan_for_tables(rom, record_size):
    """Scan ROM for potential monster tables with given record size."""
    best_results = []

    # Skip header
    for start in range(16, len(rom) - record_size * 20, 1):
        score = 0
        metal_count = 0
        reasonable_hp_count = 0

        for i in range(20):  # Check 20 records
            offset = start + i * record_size
            if offset + record_size > len(rom):
                break

            record = rom[offset:offset + record_size]

            # Try different field layouts
            # Layout 1: HP at bytes 0-1 (little endian)
            hp1 = record[0] | (record[1] << 8)
            # Layout 2: HP at bytes 4-5
            hp2 = record[4] | (record[5] << 8) if record_size > 5 else 0
            # Layout 3: HP at bytes 2-3
            hp3 = record[2] | (record[3] << 8) if record_size > 3 else 0

            # Check if any HP interpretation is reasonable
            reasonable = False
            if 1 <= hp1 <= 1500:
                reasonable = True
                reasonable_hp_count += 1
            elif 1 <= hp2 <= 1500:
                reasonable = True
                reasonable_hp_count += 1
            elif 1 <= hp3 <= 1500:
                reasonable = True
                reasonable_hp_count += 1

            if reasonable:
                score += 1

        if score >= 15:  # At least 15 out of 20 reasonable
            bank = (start - 16) // 0x4000
            bank_offset = (start - 16) % 0x4000
            cpu = 0x8000 + bank_offset
            best_results.append({
                "offset": start,
                "bank": bank,
                "cpu": cpu,
                "score": score,
                "hp_count": reasonable_hp_count,
            })

    return best_results


def analyze_table(rom, start, record_size, count=20):
    """Analyze a potential table."""
    print(f"\nAnalyzing at ROM ${start:05X}, record size {record_size}:")

    for i in range(min(count, 10)):
        offset = start + i * record_size
        record = rom[offset:offset + record_size]

        # Different layouts
        hp1 = record[0] | (record[1] << 8)
        hp2 = record[4] | (record[5] << 8) if record_size > 5 else 0

        hex_str = ' '.join(f'{b:02X}' for b in record[:min(16, record_size)])

        print(f"  #{i:2d}: HP1={hp1:5d} HP2={hp2:5d} | {hex_str}")


def search_for_hp_table(rom):
    """Search for a table of HP values specifically."""
    print("=" * 70)
    print("Searching for HP value sequences")
    print("=" * 70)

    # Look for 16-bit values between 1-1500 appearing sequentially
    # Many monsters should have HP in this range

    candidates = []

    for start in range(16, len(rom) - 100, 2):  # 2-byte aligned
        consecutive_valid = 0

        for i in range(50):
            offset = start + i * 2
            if offset + 2 > len(rom):
                break

            hp = rom[offset] | (rom[offset + 1] << 8)

            if 1 <= hp <= 1500:
                consecutive_valid += 1
            else:
                break

        if consecutive_valid >= 30:  # At least 30 valid HP values in a row
            bank = (start - 16) // 0x4000
            bank_offset = (start - 16) % 0x4000
            cpu = 0x8000 + bank_offset
            candidates.append({
                "offset": start,
                "bank": bank,
                "cpu": cpu,
                "count": consecutive_valid,
            })
            start += consecutive_valid * 2  # Skip this area

    for c in candidates[:10]:
        print(f"Bank {c['bank']} ${c['cpu']:04X}: {c['count']} consecutive valid HP values")

        # Show the values
        hp_values = []
        for i in range(min(20, c['count'])):
            offset = c['offset'] + i * 2
            hp = rom[offset] | (rom[offset + 1] << 8)
            hp_values.append(hp)
        print(f"  Values: {hp_values}")

    return candidates


def search_interleaved(rom):
    """Search for monster data where HP might be interleaved with other stats."""
    print("\n" + "=" * 70)
    print("Searching for interleaved stat patterns")
    print("=" * 70)

    # Look for patterns like: HP(2) ATK(1) DEF(1) - repeating
    # That would be 4 bytes per monster

    for record_size in [4, 6, 8, 10, 12, 16, 20, 24]:
        candidates = []

        for start in range(16, len(rom) - record_size * 50, 1):
            valid_count = 0

            for i in range(50):
                offset = start + i * record_size
                if offset + record_size > len(rom):
                    break

                # HP at offset 0
                hp = rom[offset] | (rom[offset + 1] << 8)

                # Attack-like value at offset 2
                atk = rom[offset + 2] if record_size > 2 else 0

                # Defense-like value at offset 3
                def_ = rom[offset + 3] if record_size > 3 else 0

                # Check for reasonable stats
                if 1 <= hp <= 1500 and 0 < atk < 250 and 0 < def_ < 250:
                    valid_count += 1

            if valid_count >= 30:
                bank = (start - 16) // 0x4000
                bank_offset = (start - 16) % 0x4000
                cpu = 0x8000 + bank_offset
                candidates.append({
                    "offset": start,
                    "bank": bank,
                    "cpu": cpu,
                    "count": valid_count,
                })

        if candidates:
            print(f"\nRecord size {record_size}: Found {len(candidates)} candidates")
            for c in candidates[:3]:
                print(f"  Bank {c['bank']} ${c['cpu']:04X}: {c['count']} valid records")

                # Show first 5 records
                for i in range(5):
                    offset = c['offset'] + i * record_size
                    hp = rom[offset] | (rom[offset + 1] << 8)
                    atk = rom[offset + 2] if record_size > 2 else 0
                    def_ = rom[offset + 3] if record_size > 3 else 0
                    agi = rom[offset + 4] if record_size > 4 else 0

                    rec = rom[offset:offset + record_size]
                    hex_str = ' '.join(f'{b:02X}' for b in rec[:min(12, record_size)])

                    print(f"    #{i}: HP={hp:4d} ATK={atk:3d} DEF={def_:3d} AGI={agi:3d} | {hex_str}")


def search_known_hp_values(rom):
    """Search for specific known HP values from cowness.net."""
    print("\n" + "=" * 70)
    print("Searching for known monster HP values")
    print("=" * 70)

    # Necrosaro HP values we know
    known_hp = {
        800: "Necrosaro phase 1",
        650: "Necrosaro phase 2",
        1023: "Necrosaro phase 3/4/8 (max HP)",
        700: "Necrosaro phase 5/7",
        4: "Metal Slime (low HP)",
        5: "Metal Babble (low HP)",
        7: "King Metal (low HP)",
    }

    for hp, name in known_hp.items():
        pattern = bytes([hp & 0xFF, (hp >> 8) & 0xFF])

        print(f"\n{name} (HP={hp}):")

        pos = 0
        matches = []
        while True:
            pos = rom.find(pattern, pos)
            if pos == -1:
                break

            bank = (pos - 16) // 0x4000
            bank_offset = (pos - 16) % 0x4000
            cpu = 0x8000 + bank_offset

            matches.append((bank, cpu, pos))
            pos += 1

        # Group by bank
        by_bank = {}
        for bank, cpu, offset in matches:
            if bank not in by_bank:
                by_bank[bank] = []
            by_bank[bank].append((cpu, offset))

        for bank, locs in sorted(by_bank.items()):
            if len(locs) >= 2:
                print(f"  Bank {bank}: {len(locs)} matches at " +
                      ", ".join(f"${cpu:04X}" for cpu, _ in locs[:8]))


def search_800_and_650_proximity(rom):
    """Look for Necrosaro HP values (800, 650, etc) near each other."""
    print("\n" + "=" * 70)
    print("Searching for Necrosaro HP values in proximity")
    print("=" * 70)

    # 800 = $0320, 650 = $028A, 1023 = $03FF, 700 = $02BC
    hp_800 = bytes([0x20, 0x03])
    hp_650 = bytes([0x8A, 0x02])
    hp_1023 = bytes([0xFF, 0x03])
    hp_700 = bytes([0xBC, 0x02])

    # Find all 800 locations
    pos = 0
    locations_800 = []
    while True:
        pos = rom.find(hp_800, pos)
        if pos == -1:
            break
        locations_800.append(pos)
        pos += 1

    # For each 800 location, check if 650, 1023, or 700 are within 100 bytes
    for loc in locations_800:
        nearby = []

        # Check 650
        for offset in range(-100, 100, 2):
            check_pos = loc + offset
            if 0 <= check_pos + 1 < len(rom):
                val = rom[check_pos] | (rom[check_pos + 1] << 8)
                if val == 650:
                    nearby.append(("650", offset))
                elif val == 1023:
                    nearby.append(("1023", offset))
                elif val == 700:
                    nearby.append(("700", offset))

        if len(nearby) >= 2:  # At least 2 other Necrosaro HP values nearby
            bank = (loc - 16) // 0x4000
            bank_offset = (loc - 16) % 0x4000
            cpu = 0x8000 + bank_offset

            print(f"Bank {bank} ${cpu:04X} (ROM ${loc:05X}): 800 with nearby values:")
            for name, offset in nearby:
                print(f"  {name} at offset {offset:+d}")

            # Dump the area
            dump_start = max(16, loc - 20)
            dump_data = rom[dump_start:dump_start + 80]
            print(f"  Context: {' '.join(f'{b:02X}' for b in dump_data[:40])}")


def main():
    if not ROM_PATH.exists():
        print(f"ERROR: ROM not found at {ROM_PATH}")
        return

    with open(ROM_PATH, "rb") as f:
        rom = f.read()

    print(f"ROM loaded: {len(rom)} bytes\n")

    # Search for HP tables
    search_for_hp_table(rom)

    # Search for interleaved patterns
    search_interleaved(rom)

    # Search for known HP values
    search_known_hp_values(rom)

    # Search for Necrosaro HP values in proximity
    search_800_and_650_proximity(rom)


if __name__ == "__main__":
    main()
