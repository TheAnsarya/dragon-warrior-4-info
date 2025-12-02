#!/usr/bin/env python3
"""
Find text pointer tables and string data in Dragon Warrior IV ROM.

This tool searches for patterns that indicate text pointer tables:
- Sequential pointers into the same bank
- Pointers that resolve to valid text strings
"""

import os

ROM_PATH = os.path.join(os.path.dirname(__file__), '..', 'roms',
                        'Dragon Warrior IV (1992-10)(Enix)(US).nes')

# TBL mapping
TBL = {
    0x00: ' ',
    **{i: chr(ord('0') + i - 1) for i in range(0x01, 0x0B)},  # 0-9
    **{i: chr(ord('a') + i - 0x0B) for i in range(0x0B, 0x25)},  # a-z
    **{i: chr(ord('A') + i - 0x25) for i in range(0x25, 0x3F)},  # A-Z
    0x60: "'", 0x61: '.', 0x62: '-', 0x63: ',', 0x64: '!',
    0x65: '?', 0x66: '(', 0x67: ')', 0x68: '"', 0x69: '"',
    0x6A: ':', 0x6B: ';', 0x6C: '/', 0x6D: '*',
}

# DTE table (from Bank 22 $B3A4)
DTE = {}  # Will be loaded from ROM

def load_rom():
    """Load ROM data."""
    with open(ROM_PATH, 'rb') as f:
        return f.read()

def load_dte_table(rom_data):
    """Load DTE table from ROM."""
    global DTE
    dte_offset = 0x5B3A4  # Bank 22, $B3A4

    for i in range(127):  # $80-$FE
        code = 0x80 + i
        first = rom_data[dte_offset + i*2]
        second = rom_data[dte_offset + i*2 + 1]

        # Decode the pair
        char1 = TBL.get(first, f'[{first:02X}]')
        char2 = TBL.get(second, f'[{second:02X}]')
        DTE[code] = char1 + char2

def decode_string(rom_data, offset, max_len=100):
    """Decode a string from ROM using TBL and DTE."""
    result = []
    for i in range(max_len):
        if offset + i >= len(rom_data):
            break
        byte = rom_data[offset + i]

        if byte == 0xFF:  # End marker
            break
        elif byte in DTE:
            result.append(DTE[byte])
        elif byte in TBL:
            result.append(TBL[byte])
        else:
            result.append(f'[{byte:02X}]')

    return ''.join(result)

def is_valid_text(text, min_len=3):
    """Check if decoded text looks valid."""
    if len(text) < min_len:
        return False

    # Count printable characters
    printable = sum(1 for c in text if c.isalnum() or c in ' .,!?\'"-:;')
    ratio = printable / len(text) if text else 0

    return ratio > 0.7

def find_string_table(rom_data, start_offset, bank_base, count=20):
    """
    Look for a table of sequential strings at the given offset.
    Returns list of (offset, string) tuples if found.
    """
    strings = []
    offset = start_offset

    for _ in range(count):
        if offset >= len(rom_data):
            break

        text = decode_string(rom_data, offset)
        if not is_valid_text(text):
            break

        # Find the end of this string
        end = offset
        while end < len(rom_data) and rom_data[end] != 0xFF:
            end += 1

        if end < len(rom_data):
            strings.append((offset, text))
            offset = end + 1  # Move past the $FF terminator
        else:
            break

    return strings

def find_pointer_table(rom_data, search_start, search_end, bank_num):
    """
    Search for pointer tables in a range.
    A pointer table has sequential 16-bit pointers into valid addresses.
    """
    bank_offset = 0x10 + bank_num * 0x4000

    results = []

    for offset in range(search_start, search_end - 8, 2):
        # Read potential pointers
        pointers = []
        valid = True

        for i in range(4):  # Check first 4 pointers
            ptr_offset = offset + i * 2
            if ptr_offset + 1 >= len(rom_data):
                valid = False
                break

            lo = rom_data[ptr_offset]
            hi = rom_data[ptr_offset + 1]
            ptr = lo | (hi << 8)

            # Check if pointer is in valid bank range ($8000-$BFFF)
            if ptr < 0x8000 or ptr > 0xBFFF:
                valid = False
                break

            pointers.append(ptr)

        if not valid or len(pointers) < 4:
            continue

        # Check if pointers resolve to valid text
        valid_texts = 0
        for ptr in pointers:
            # Convert bank address to ROM offset
            rom_ptr = bank_offset + (ptr - 0x8000)
            if rom_ptr < len(rom_data):
                text = decode_string(rom_data, rom_ptr, max_len=30)
                if is_valid_text(text, min_len=2):
                    valid_texts += 1

        if valid_texts >= 3:
            results.append({
                'offset': offset,
                'pointers': pointers,
                'bank': bank_num
            })

    return results

def scan_bank_for_text_tables(rom_data, bank_num):
    """Scan a bank for text pointer tables and string tables."""
    bank_start = 0x10 + bank_num * 0x4000
    bank_end = bank_start + 0x4000

    print(f"\n=== Scanning Bank {bank_num} (ROM ${bank_start:05X}-${bank_end:05X}) ===")

    # Look for pointer tables
    pointer_tables = find_pointer_table(rom_data, bank_start, bank_end, bank_num)

    if pointer_tables:
        print(f"\nFound {len(pointer_tables)} potential pointer tables:")
        for pt in pointer_tables[:5]:  # Show first 5
            print(f"  ROM ${pt['offset']:05X}: Pointers to ${pt['pointers'][0]:04X}, ${pt['pointers'][1]:04X}, ...")

            # Decode first few strings
            for i, ptr in enumerate(pt['pointers'][:3]):
                rom_ptr = bank_start + (ptr - 0x8000)
                text = decode_string(rom_data, rom_ptr, max_len=40)
                print(f"    [{i}] ${ptr:04X} -> \"{text}\"")

    # Scan for sequential strings (without pointer tables)
    print(f"\nScanning for sequential string tables...")

    for offset in range(bank_start, bank_end - 100, 0x100):
        strings = find_string_table(rom_data, offset, bank_start)
        if len(strings) >= 5:
            print(f"\n  String table at ROM ${offset:05X} (Bank {bank_num} ${offset - bank_start + 0x8000:04X}):")
            for rom_off, text in strings[:8]:
                bank_addr = 0x8000 + (rom_off - bank_start)
                print(f"    ${bank_addr:04X}: \"{text}\"")
            if len(strings) > 8:
                print(f"    ... and {len(strings) - 8} more strings")

def main():
    print("Dragon Warrior IV - Text Table Finder")
    print("=" * 50)

    rom_data = load_rom()
    print(f"ROM size: {len(rom_data)} bytes ({len(rom_data)//1024}KB)")

    # Load DTE table
    load_dte_table(rom_data)
    print(f"Loaded {len(DTE)} DTE entries")

    # Scan key banks
    text_banks = [17, 22, 23, 26, 27]

    for bank in text_banks:
        scan_bank_for_text_tables(rom_data, bank)

if __name__ == '__main__':
    main()
