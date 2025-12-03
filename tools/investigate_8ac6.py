#!/usr/bin/env python3
"""
Investigate the $8AC6 area in Bank 8 where we found sequential small values.

This looks like it could be a stat growth or early level EXP table.
"""

import os
from pathlib import Path

SCRIPT_DIR = Path(__file__).parent
ROM_PATH = SCRIPT_DIR.parent / "roms" / "Dragon Warrior IV (1992-10)(Enix)(US).nes"

def main():
    with open(ROM_PATH, "rb") as f:
        rom = f.read()
    
    print("=" * 70)
    print("Dragon Warrior IV - Bank 8 $8AC0-$8B40 Analysis")
    print("=" * 70)
    print()
    
    # Bank 8 starts at ROM offset 0x20010
    bank_start = 16 + 8 * 0x4000
    
    # Area of interest: $8AC0-$8B40 (CPU address)
    start_cpu = 0x8AC0
    end_cpu = 0x8B60
    
    start_offset = bank_start + (start_cpu - 0x8000)
    end_offset = bank_start + (end_cpu - 0x8000)
    
    print(f"Analyzing CPU $8AC0-$8B60 (ROM ${start_offset:05X}-${end_offset:05X})")
    print()
    
    # Hex dump
    print("Hex dump:")
    print("-" * 70)
    for i in range(start_offset, end_offset, 16):
        cpu = 0x8000 + (i - bank_start)
        hex_str = " ".join(f"{rom[j]:02X}" for j in range(i, min(i+16, end_offset)))
        print(f"${cpu:04X}: {hex_str}")
    
    print()
    
    # Interpret as various formats
    print("As 16-bit little-endian values:")
    print("-" * 70)
    for i in range(start_offset, end_offset - 1, 2):
        cpu = 0x8000 + (i - bank_start)
        val = rom[i] | (rom[i+1] << 8)
        if val < 10000:  # Only show small values
            print(f"  ${cpu:04X}: {val:5d}")
    
    print()
    
    # The sequence 5,6,7,8,9,10,11,12,13,14,15 suggests these might be
    # single-byte values, not 16-bit
    print("As single bytes (potential stat table):")
    print("-" * 70)
    
    # Find the run of 5,6,7,8...
    target_offset = bank_start + (0x8AC6 - 0x8000)
    
    # Print bytes around this area with annotations
    print("Bytes around $8AC6:")
    for i in range(target_offset - 20, target_offset + 40):
        cpu = 0x8000 + (i - bank_start)
        val = rom[i]
        annotation = ""
        if i == target_offset:
            annotation = " <-- Start of 5,6,7... sequence"
        print(f"  ${cpu:04X}: {val:3d} (${val:02X}){annotation}")
    
    print()
    
    # Now let's look for the actual EXP table format
    # Check if there are tables with 2-byte or 3-byte entries
    print("Looking for 2-byte EXP table patterns:")
    print("-" * 70)
    
    # EXP for early levels (from FAQs): 7, 23, 50, 92, 156, 250, 382, 560, 792
    early_exp = [7, 23, 50, 92, 156, 250, 382, 560, 792]
    
    # Search for 7 as first entry in a potential table
    for i in range(bank_start, bank_start + 0x4000 - 20):
        if rom[i] == 7 and rom[i+1] == 0:  # 7 as 16-bit little-endian
            # Check if next value is 23
            next_val = rom[i+2] | (rom[i+3] << 8)
            if next_val == 23:
                # Check if following value is 50
                third_val = rom[i+4] | (rom[i+5] << 8)
                if third_val == 50:
                    cpu = 0x8000 + (i - bank_start)
                    print(f"  FOUND potential EXP table at ${cpu:04X}!")
                    print(f"    Values: 7, 23, 50, ...")
                    
                    # Dump more values
                    for j in range(15):
                        val = rom[i + j*2] | (rom[i + j*2 + 1] << 8)
                        print(f"    Level {j+2}: {val}")
    
    # Also search all banks
    print("\nSearching entire ROM for EXP sequence 7, 23, 50:")
    print("-" * 70)
    
    for i in range(16, len(rom) - 10):
        if rom[i] == 7 and rom[i+1] == 0:
            next_val = rom[i+2] | (rom[i+3] << 8)
            if next_val == 23:
                third = rom[i+4] | (rom[i+5] << 8)
                if third == 50:
                    bank = (i - 16) // 0x4000
                    bank_off = (i - 16) % 0x4000
                    cpu = 0x8000 + bank_off
                    print(f"  Bank {bank} ${cpu:04X} (ROM ${i:05X}): 7, 23, 50")
                    
                    # Show full sequence
                    print("    Full sequence:")
                    for j in range(20):
                        if i + j*2 + 1 < len(rom):
                            val = rom[i + j*2] | (rom[i + j*2 + 1] << 8)
                            match = " <-- MATCHES!" if j < len(early_exp) and val == early_exp[j] else ""
                            print(f"      Entry {j+1}: {val}{match}")


if __name__ == "__main__":
    main()
