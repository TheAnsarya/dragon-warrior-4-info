#!/usr/bin/env python3
"""
Dragon Warrior IV - Bank 23 Dialogue Pointer Table Analyzer

Analyzes the dialogue pointer tables in Bank 23 to understand
the text string organization.
"""

import os

ROM_PATH = os.path.join(os.path.dirname(__file__), '..', 'roms',
                        'Dragon Warrior IV (1992-10)(Enix)(US).nes')


def decode_text(data, max_len=20):
    """Decode DW4 text encoding to readable string."""
    result = []
    for i, b in enumerate(data[:max_len]):
        if b == 0x00:
            result.append(' ')
        elif 0x01 <= b <= 0x0A:
            result.append(str(b - 1))
        elif 0x0B <= b <= 0x24:
            result.append(chr(ord('a') + b - 0x0B))
        elif 0x25 <= b <= 0x3E:
            result.append(chr(ord('A') + b - 0x25))
        elif b == 0xFF:
            result.append('[END]')
            break
        elif b == 0xFD:
            result.append('[LN]')
        elif b == 0xFE:
            result.append('[CTRL]')
        else:
            result.append(f'[{b:02X}]')
    return ''.join(result)


def main():
    with open(ROM_PATH, 'rb') as f:
        rom = f.read()

    # Bank 23 starts at ROM offset: (23 * 0x4000) + 0x10 = 0x5C010
    bank23_start = 23 * 0x4000 + 0x10

    print("=" * 70)
    print(" BANK 23 - DIALOGUE POINTER TABLE ANALYSIS")
    print("=" * 70)

    # First look at the raw bytes at $8000-$8040
    print("\nBank 23 header ($8000-$803F):")
    print("-" * 70)
    for row in range(4):
        addr = 0x8000 + row * 16
        offset = bank23_start + row * 16
        hex_bytes = ' '.join(f'{rom[offset+i]:02X}' for i in range(16))
        print(f"  ${addr:04X}: {hex_bytes}")

    # Search through the bank for runs of valid pointers
    print("\n" + "=" * 70)
    print(" SEARCHING FOR POINTER TABLES")
    print("=" * 70)

    candidates = []

    for search_start in range(0, 0x3F00, 2):
        offset = bank23_start + search_start
        count = 0
        for i in range(500):
            if offset + i*2 + 2 > len(rom):
                break
            lo = rom[offset + i*2]
            hi = rom[offset + i*2 + 1]
            ptr = lo | (hi << 8)
            if 0x8000 <= ptr < 0xC000:
                count += 1
            else:
                break
        if count >= 10:  # At least 10 consecutive pointers
            candidates.append((search_start, count))
            # Skip past this table
            search_start += count * 2

    # Remove overlapping candidates
    filtered = []
    for start, count in sorted(candidates, key=lambda x: -x[1]):
        overlap = False
        for fstart, fcount in filtered:
            if abs(start - fstart) < max(count, fcount) * 2:
                overlap = True
                break
        if not overlap:
            filtered.append((start, count))

    print(f"\nFound {len(filtered)} pointer table candidates:\n")

    for start, count in sorted(filtered):
        cpu_addr = 0x8000 + start
        rom_offset = bank23_start + start
        print(f"  Table at ${cpu_addr:04X} (ROM 0x{rom_offset:05X}): {count} pointers")

        # Show first few entries
        for i in range(min(5, count)):
            lo = rom[rom_offset + i*2]
            hi = rom[rom_offset + i*2 + 1]
            ptr = lo | (hi << 8)
            text_rom = bank23_start + (ptr - 0x8000)
            preview = decode_text(rom[text_rom:text_rom+16])
            print(f"      [{i:3}] ${ptr:04X} -> {preview}")
        if count > 5:
            print(f"      ... and {count - 5} more")
        print()

    # Look for actual readable text in the bank
    print("=" * 70)
    print(" SEARCHING FOR TEXT STRINGS")
    print("=" * 70)

    # Search for text strings (sequences of valid character bytes)
    text_regions = []
    in_text = False
    text_start = 0

    for i in range(0x4000):
        b = rom[bank23_start + i]
        is_text_char = (b == 0x00 or
                       0x01 <= b <= 0x0A or
                       0x0B <= b <= 0x24 or
                       0x25 <= b <= 0x3E or
                       0x65 <= b <= 0x81 or
                       b in (0xFD, 0xFE, 0xFF))

        if is_text_char and not in_text:
            in_text = True
            text_start = i
        elif not is_text_char and in_text:
            length = i - text_start
            if length >= 8:  # Only consider runs of 8+ bytes
                text_regions.append((text_start, length))
            in_text = False

    print(f"\nFound {len(text_regions)} text regions (8+ bytes each):\n")
    for start, length in text_regions[:20]:
        cpu_addr = 0x8000 + start
        preview = decode_text(rom[bank23_start + start:bank23_start + start + 30])
        print(f"  ${cpu_addr:04X}: len={length:4} | {preview}")

    if len(text_regions) > 20:
        print(f"  ... and {len(text_regions) - 20} more regions")

    # Summary
    print("\n" + "=" * 70)
    print(" SUMMARY")
    print("=" * 70)

    total_text_bytes = sum(length for _, length in text_regions)
    print(f"\nBank 23 statistics:")
    print(f"  - Pointer table candidates: {len(filtered)}")
    print(f"  - Text regions found: {len(text_regions)}")
    print(f"  - Total text bytes: {total_text_bytes}")
    print(f"  - Bank size: 16384 bytes")
    print(f"  - Text coverage: {total_text_bytes * 100 / 16384:.1f}%")


if __name__ == '__main__':
    main()
