#!/usr/bin/env python3
"""
Search for Dragon Warrior IV experience tables in ROM.

DW4 stores experience thresholds for each character.
Known Hero exp requirements (from FAQs):
- Level 2:      7 exp
- Level 3:     23 exp
- Level 4:     50 exp
- Level 5:     92 exp
- Level 6:    156 exp
- Level 7:    250 exp
- Level 8:    382 exp
- Level 9:    560 exp
- Level 10:   792 exp

These could be stored as:
1. 16-bit values (2 bytes each)
2. 24-bit values (3 bytes each)
3. Cumulative totals
4. Incremental differences
"""

import os

ROM_PATH = os.path.join(os.path.dirname(__file__), "..", "roms", 
                        "Dragon Warrior IV (1992-10)(Enix)(US).nes")

# Known exp values for Hero (from GameFAQs)
HERO_EXP = [7, 23, 50, 92, 156, 250, 382, 560, 792, 1087]  # Levels 2-11

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
    
    # Also do fuzzy search
    fuzzy_results = search_fuzzy(rom)
    
    if not result and not fuzzy_results:
        print("\nNo exp tables found with exact matching.")
        print("Exp tables may be:")
        print("  - Calculated at runtime (formula-based)")
        print("  - Stored in a compressed/encoded format")
        print("  - Using different values than FAQs (JP vs US)")


if __name__ == "__main__":
    main()
