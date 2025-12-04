#!/usr/bin/env python3
"""
Investigate Bank 8 for potential EXP or stat tables.

The EXP search found several candidates in Bank 8 starting around $A866.
These show increasing 3-byte values that could be stat or EXP tables.
"""

import os
from pathlib import Path

SCRIPT_DIR = Path(__file__).parent
ROM_PATH = SCRIPT_DIR.parent / "roms" / "Dragon Warrior IV (1992-10)(Enix)(US).nes"
OUTPUT_DIR = SCRIPT_DIR.parent / "data"
DISASM_DIR = SCRIPT_DIR.parent / "disasm"

# Bank 8 candidate addresses from previous search
CANDIDATES = [
    {"offset": 0x22876, "cpu": 0xA866, "first": [15488, 16384, 17408, 18432, 19462]},
]


def dump_bank8_tables(rom):
    """Extract and analyze potential tables from Bank 8."""
    print("=" * 70)
    print("Dragon Warrior IV - Bank 8 Table Analysis")
    print("=" * 70)
    print()

    # Bank 8 starts at ROM offset 0x20010 (16 header + 8 * 0x4000)
    bank_start = 16 + 8 * 0x4000  # $20010
    bank_end = bank_start + 0x4000

    print(f"Bank 8 ROM range: ${bank_start:05X} - ${bank_end:05X}")
    print()

    # Let's look at the entire area $A800-$B000 in Bank 8
    area_start = bank_start + 0x2800  # $A800
    area_end = bank_start + 0x3000    # $B000

    print(f"Examining area $A800-$B000 (ROM ${area_start:05X}-${area_end:05X})")
    print("-" * 70)

    # Dump as 3-byte values
    values = []
    for i in range(area_start, area_end - 2, 3):
        val = rom[i] | (rom[i+1] << 8) | (rom[i+2] << 16)
        cpu = 0x8000 + (i - bank_start)
        values.append((cpu, val, i))

    # Find runs of increasing values
    runs = []
    current_run = [values[0]]

    for i in range(1, len(values)):
        if values[i][1] > values[i-1][1]:
            current_run.append(values[i])
        else:
            if len(current_run) >= 5:
                runs.append(current_run)
            current_run = [values[i]]

    if len(current_run) >= 5:
        runs.append(current_run)

    print(f"\nFound {len(runs)} runs of increasing values (5+ entries):")

    for i, run in enumerate(runs):
        first_cpu = run[0][0]
        last_cpu = run[-1][0]
        first_val = run[0][1]
        last_val = run[-1][1]

        print(f"\nRun {i+1}: ${first_cpu:04X} - ${last_cpu:04X} ({len(run)} entries)")
        print(f"  Range: {first_val:,} - {last_val:,}")
        print(f"  First 5: {[v[1] for v in run[:5]]}")
        if len(run) > 10:
            print(f"  Last 5:  {[v[1] for v in run[-5:]]}")

    return runs


def analyze_header_area(rom):
    """Look at the very beginning of Bank 8 for table pointers."""
    print("\n" + "=" * 70)
    print("Bank 8 Header Analysis (looking for table pointers)")
    print("=" * 70)

    bank_start = 16 + 8 * 0x4000

    print("\nFirst 256 bytes of Bank 8:")
    for i in range(16):
        offset = bank_start + i * 16
        cpu = 0x8000 + i * 16
        hex_str = " ".join(f"{rom[offset+j]:02X}" for j in range(16))
        print(f"${cpu:04X}: {hex_str}")


def look_for_exp_formulas(rom):
    """
    Look for EXP calculation code patterns.

    Dragon Quest games often use formulas rather than tables for EXP.
    The formula is typically something like: EXP = base * level^power + adjustment
    """
    print("\n" + "=" * 70)
    print("Looking for EXP calculation patterns")
    print("=" * 70)

    # Known Hero EXP from cowness.net
    hero_exp = {
        25: 102787,
        26: 118192,
        27: 135522,
        28: 155018,
        29: 176951,
        30: 201625,
        31: 229383,
    }

    # Calculate differences
    levels = sorted(hero_exp.keys())
    print("\nHero EXP progression analysis:")
    for i in range(1, len(levels)):
        prev = levels[i-1]
        curr = levels[i]
        diff = hero_exp[curr] - hero_exp[prev]
        ratio = hero_exp[curr] / hero_exp[prev]
        print(f"  Level {prev} -> {curr}: diff = {diff:,}, ratio = {ratio:.4f}")

    # The ratios are around 1.14-1.15, suggesting exponential growth
    # Could be formula-based: EXP_n = EXP_1 * growth_factor^(n-1)

    # Let's also calculate what EXP level 1 and 2 might be
    # If ratio is ~1.14, and level 31 = 229383
    avg_ratio = 1.14
    print(f"\nIf growth ratio is ~{avg_ratio}:")
    for target_level in range(10, 1, -1):
        projected = hero_exp[25] / (avg_ratio ** (25 - target_level))
        print(f"  Level {target_level} projected: {int(projected):,}")


def find_character_tables(rom):
    """Look for character stat/EXP tables that might have multiple characters."""
    print("\n" + "=" * 70)
    print("Looking for multi-character tables")
    print("=" * 70)

    # DW4 has many characters - each might have their own EXP table
    # Tables might be organized as:
    # - Sequential (Hero table, then Ragnar table, then...)
    # - Interleaved (all level 1, then all level 2, then...)

    # Let's search for sequences of values that repeat with similar patterns
    # but different starting points

    bank_start = 16 + 8 * 0x4000

    # Look for small starting values (level 2 EXP is usually <100)
    print("\nSearching for small values (possible level 2 EXP) in Bank 8:")

    small_values = []
    for i in range(bank_start, bank_start + 0x4000 - 2, 2):
        val = rom[i] | (rom[i+1] << 8)
        if 5 <= val <= 50:  # Level 2 EXP range
            cpu = 0x8000 + (i - bank_start)
            # Check if next value is larger (suggesting a table)
            next_val = rom[i+2] | (rom[i+3] << 8)
            if next_val > val and next_val < 200:
                small_values.append((cpu, val, next_val))

    print(f"Found {len(small_values)} potential table starts:")
    for cpu, val, next_val in small_values[:20]:
        print(f"  ${cpu:04X}: {val} -> {next_val}")


def dump_bank8_full(rom):
    """Create a full dump of Bank 8 with annotations."""
    print("\n" + "=" * 70)
    print("Creating annotated Bank 8 dump...")
    print("=" * 70)

    bank_start = 16 + 8 * 0x4000
    bank_data = rom[bank_start:bank_start + 0x4000]

    # Create output
    output = []
    output.append("; Dragon Warrior IV - Bank 8 Data Analysis")
    output.append("; =============================================")
    output.append(";")
    output.append("; Bank 8 appears to contain data tables")
    output.append("; This file shows the raw data for analysis")
    output.append("")

    # First, let's identify code vs data regions
    # Simple heuristic: look for common code patterns

    for addr in range(0x8000, 0xC000, 16):
        offset = addr - 0x8000
        line_data = bank_data[offset:offset+16]

        hex_str = " ".join(f"{b:02X}" for b in line_data)

        # Try to interpret as 2-byte values
        values_16 = []
        for j in range(0, 16, 2):
            if offset + j + 1 < len(bank_data):
                val = line_data[j] | (line_data[j+1] << 8)
                values_16.append(val)

        # Annotate
        annotation = ""
        if all(v < 100 and v > 0 for v in values_16[:4]):
            annotation = "  ; Small values - possible level data?"
        elif all(v > 50000 and v < 300000 for v in values_16):
            annotation = "  ; Large values - possible high-level EXP?"

        output.append(f".db ${addr:04X}: {hex_str}{annotation}")

    # Write to file
    DISASM_DIR.mkdir(exist_ok=True)
    output_file = DISASM_DIR / "bank08_data.asm"
    with open(output_file, "w", encoding="utf-8") as f:
        f.write("\n".join(output))

    print(f"Written to {output_file}")


def main():
    if not ROM_PATH.exists():
        print(f"ERROR: ROM not found at {ROM_PATH}")
        return

    with open(ROM_PATH, "rb") as f:
        rom = f.read()

    print(f"ROM loaded: {len(rom)} bytes\n")

    # Analyze Bank 8
    runs = dump_bank8_tables(rom)

    # Look at header
    analyze_header_area(rom)

    # Analyze EXP patterns
    look_for_exp_formulas(rom)

    # Look for character tables
    find_character_tables(rom)


if __name__ == "__main__":
    main()
