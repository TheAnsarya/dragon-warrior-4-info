#!/usr/bin/env python3
"""
Analyze unknown byte ranges in Dragon Warrior IV text.

This tool examines what bytes appear in known text sections
to help complete the TBL mapping.
"""

import os
from collections import defaultdict

ROM_PATH = os.path.join(os.path.dirname(__file__), '..', 'roms',
                        'Dragon Warrior IV (1992-10)(Enix)(US).nes')

# Known TBL mapping
TBL = {
    0x00: ' ',
    **{i: chr(ord('0') + i - 1) for i in range(0x01, 0x0B)},  # 0-9
    **{i: chr(ord('a') + i - 0x0B) for i in range(0x0B, 0x25)},  # a-z
    **{i: chr(ord('A') + i - 0x25) for i in range(0x25, 0x3F)},  # A-Z
}

def load_rom():
    with open(ROM_PATH, 'rb') as f:
        return f.read()

def analyze_text_area(rom_data, start_offset, end_offset, description):
    """Analyze what bytes appear in a known text area."""
    byte_counts = defaultdict(int)
    unknown_bytes = defaultdict(int)

    data = rom_data[start_offset:end_offset]

    for byte in data:
        byte_counts[byte] += 1
        if byte not in TBL and byte < 0x80:
            unknown_bytes[byte] += 1

    print(f"\n=== {description} ===")
    print(f"Range: ${start_offset:05X} - ${end_offset:05X}")
    print(f"Size: {end_offset - start_offset} bytes")

    # Show unknown bytes
    if unknown_bytes:
        print(f"\nUnknown bytes (< $80):")
        for byte, count in sorted(unknown_bytes.items()):
            # Show context - find this byte and surrounding bytes
            contexts = []
            for i in range(start_offset, min(start_offset + 500, end_offset)):
                if rom_data[i] == byte:
                    # Get surrounding context
                    start = max(i - 3, start_offset)
                    end = min(i + 4, end_offset)
                    context_bytes = rom_data[start:end]
                    context_str = ''.join(TBL.get(b, f'[{b:02X}]') for b in context_bytes)
                    contexts.append(context_str)
                    if len(contexts) >= 3:
                        break

            print(f"  ${byte:02X}: {count:4d} occurrences")
            for ctx in contexts[:2]:
                print(f"       Context: {ctx}")

    # Show byte distribution
    print(f"\nByte range distribution:")
    ranges = [
        (0x00, 0x0A, "Space/Numbers"),
        (0x0B, 0x24, "Lowercase"),
        (0x25, 0x3E, "Uppercase"),
        (0x3F, 0x5F, "Unknown 1"),
        (0x60, 0x7F, "Punctuation?"),
        (0x80, 0xFF, "DTE/Control")
    ]

    for start, end, name in ranges:
        count = sum(byte_counts.get(i, 0) for i in range(start, end + 1))
        print(f"  ${start:02X}-${end:02X} ({name}): {count}")

def main():
    print("Dragon Warrior IV - Unknown Byte Analyzer")
    print("=" * 50)

    rom_data = load_rom()

    # Known text areas from previous analysis
    text_areas = [
        # Bank 22 menu text
        (0x5B03C, 0x5B200, "Bank 22 Menu Text"),

        # Bank 27 chapter titles (based on earlier discovery)
        (0x6C010, 0x6C100, "Bank 27 Start"),

        # Bank 26 item names
        (0x69000, 0x6A000, "Bank 26 Item Area"),
    ]

    for start, end, desc in text_areas:
        analyze_text_area(rom_data, start, end, desc)

    # Now let's look at what byte values appear right after known words
    print("\n" + "=" * 50)
    print("Looking for patterns after known text...")

    # Search for known menu strings and see what follows
    known_strings = [
        b'\x25\x28\x3A\x29\x32\x38\x39\x36\x29',  # "ADVENTURE"
        b'\x30\x33\x2B',  # "LOG"
        b'\x2A\x2D\x2B\x2C\x38',  # "FIGHT"
    ]

    for search in known_strings:
        idx = rom_data.find(search)
        if idx != -1:
            # Show surrounding context
            start = max(0, idx - 5)
            end = min(len(rom_data), idx + len(search) + 10)
            context = rom_data[start:end]
            print(f"\nFound at ${idx:05X}:")
            print(f"  Hex: {' '.join(f'{b:02X}' for b in context)}")
            decoded = ''.join(TBL.get(b, f'[{b:02X}]') for b in context)
            print(f"  Decoded: {decoded}")

if __name__ == '__main__':
    main()
