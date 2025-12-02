#!/usr/bin/env python3
"""
Deep analysis of Dragon Warrior IV text system.

Looking for the actual text rendering routine that processes $80+ codes.
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
    0x6F: '-',
    0x71: ':',
    0x77: ',',
    0x78: '.',
    0x89: '[89]',  # Special marker
    0x8B: '[8B]',  # Control
    0xFF: '<END>',
}

def load_rom():
    with open(ROM_PATH, 'rb') as f:
        return f.read()

def decode_text(rom_data, offset, max_len=200):
    """Decode text from ROM using simple TBL (no DTE expansion)."""
    result = []
    for i in range(max_len):
        if offset + i >= len(rom_data):
            break
        byte = rom_data[offset + i]
        if byte == 0xFF:
            result.append('<END>')
            break
        result.append(TBL.get(byte, f'[{byte:02X}]'))
    return ''.join(result)

def find_text_patterns(rom_data, start, end):
    """Find text-like patterns in a ROM region."""
    i = start
    while i < end - 10:
        # Look for sequences of valid text characters
        valid_count = 0
        for j in range(20):
            if i + j >= end:
                break
            byte = rom_data[i + j]
            if byte == 0xFF:  # End marker
                if valid_count >= 5:
                    text = decode_text(rom_data, i, 50)
                    yield i, text
                break
            if byte in TBL or (0x80 <= byte <= 0xFE):
                valid_count += 1
            else:
                break
        i += 1

def main():
    rom_data = load_rom()

    print("Dragon Warrior IV - Text Pattern Search")
    print("=" * 60)

    # Look at the text around $B3A3 (Bank 22)
    print("\nText at Bank 22 $B3A3 (ROM $5B3A3):")
    print("-" * 60)

    # Dump raw hex
    offset = 0x5B3A3
    for row in range(10):
        row_off = offset + row * 16
        hex_str = ' '.join(f'{rom_data[row_off+i]:02X}' for i in range(16))
        text_str = decode_text(rom_data, row_off, 16)
        print(f"${row_off:05X}: {hex_str}")
        print(f"         {text_str}")

    # Look at the menu text area we found earlier
    print("\n" + "=" * 60)
    print("Known Menu Text at $5B46D (ADVENTURE LOG):")
    print("-" * 60)

    offset = 0x5B46D
    for row in range(10):
        row_off = offset + row * 16
        hex_str = ' '.join(f'{rom_data[row_off+i]:02X}' for i in range(16))
        text_str = decode_text(rom_data, row_off, 16)
        print(f"${row_off:05X}: {hex_str}")
        print(f"         {text_str}")

    # Search for text strings containing known words
    print("\n" + "=" * 60)
    print("Searching Bank 22 for readable text strings:")
    print("-" * 60)

    bank22_start = 0x58010
    bank22_end = 0x5C010

    count = 0
    for offset, text in find_text_patterns(rom_data, bank22_start, bank22_end):
        if len(text) > 10 and '[' not in text[:20]:  # Filter noise
            bank_addr = 0x8000 + (offset - bank22_start)
            print(f"${bank_addr:04X} (ROM ${offset:05X}): {text[:60]}...")
            count += 1
            if count > 30:
                break

if __name__ == '__main__':
    main()
