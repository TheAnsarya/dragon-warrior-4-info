#!/usr/bin/env python3
"""
Extract and verify the DTE table from Dragon Warrior IV ROM.

DTE (Dual Tile Encoding) maps single bytes $80-$FE to pairs of characters.
Table is located at Bank 22 $B3A4 (ROM offset 0x5B3A4).
"""

import os

ROM_PATH = os.path.join(os.path.dirname(__file__), '..', 'roms',
                        'Dragon Warrior IV (1992-10)(Enix)(US).nes')

# Complete TBL mapping
TBL = {
    0x00: ' ',
    **{i: chr(ord('0') + i - 1) for i in range(0x01, 0x0B)},  # 0-9
    **{i: chr(ord('a') + i - 0x0B) for i in range(0x0B, 0x25)},  # a-z
    **{i: chr(ord('A') + i - 0x25) for i in range(0x25, 0x3F)},  # A-Z
    # Punctuation (from previous analysis)
    0x6F: '-',
    0x71: ':',
    0x77: ',',
    0x78: '.',
    # More punctuation to discover
}

def load_rom():
    with open(ROM_PATH, 'rb') as f:
        return f.read()

def extract_dte_table(rom_data):
    """Extract DTE table from ROM."""
    dte_offset = 0x5B3A4  # Bank 22, $B3A4
    dte = {}

    print("DTE Table (Bank 22 $B3A4)")
    print("=" * 60)
    print(f"ROM Offset: ${dte_offset:05X}")
    print()

    # The DTE table has 127 entries for codes $80-$FE
    # Each entry is 2 bytes representing a character pair
    for i in range(127):
        code = 0x80 + i
        offset = dte_offset + i * 2

        byte1 = rom_data[offset]
        byte2 = rom_data[offset + 1]

        # Decode using TBL
        char1 = TBL.get(byte1, f'[{byte1:02X}]')
        char2 = TBL.get(byte2, f'[{byte2:02X}]')

        dte[code] = (byte1, byte2, char1, char2)

        if i % 8 == 0:
            print(f"\n${code:02X}:", end="")
        print(f" {char1}{char2}", end="")

    print("\n")
    return dte

def decode_string(rom_data, offset, dte, max_len=100):
    """Decode a string using TBL and DTE."""
    result = []
    i = 0
    while i < max_len and offset + i < len(rom_data):
        byte = rom_data[offset + i]

        if byte == 0xFF:  # End marker
            break
        elif byte in dte:
            _, _, char1, char2 = dte[byte]
            result.append(char1 + char2)
        elif byte in TBL:
            result.append(TBL[byte])
        else:
            result.append(f'[{byte:02X}]')

        i += 1

    return ''.join(result), i

def test_dte_decoding(rom_data, dte):
    """Test DTE decoding on known text areas."""
    print("\n" + "=" * 60)
    print("Testing DTE Decoding on Known Menu Text")
    print("=" * 60)

    # Test areas from Bank 22
    test_areas = [
        (0x5B46D, 30, "ADVENTURE LOG area"),
        (0x5B15A, 30, "ENDFIGHT area"),
        (0x5B03C, 50, "Menu start"),
        (0x5B070, 100, "Message strings"),
    ]

    for offset, length, desc in test_areas:
        text, _ = decode_string(rom_data, offset, dte, length)
        hex_bytes = ' '.join(f'{rom_data[offset+i]:02X}' for i in range(min(20, length)))
        print(f"\n{desc} (${offset:05X}):")
        print(f"  Hex: {hex_bytes}...")
        print(f"  Text: {text}")

def generate_tbl_file(dte):
    """Generate an updated TBL file with DTE entries."""
    print("\n" + "=" * 60)
    print("TBL File Content (for ROM hacking tools)")
    print("=" * 60)

    # Print the DTE mappings in TBL format
    for code in range(0x80, 0xFF):
        if code in dte:
            byte1, byte2, char1, char2 = dte[code]
            # Only output if both characters are known
            pair = char1 + char2
            if '[' not in pair:
                print(f"{code:02X}={pair}")

def main():
    rom_data = load_rom()
    dte = extract_dte_table(rom_data)
    test_dte_decoding(rom_data, dte)

    print("\n" + "=" * 60)
    print("DTE Raw Data")
    print("=" * 60)

    # Print raw hex for DTE table
    dte_offset = 0x5B3A4
    for i in range(0, 254, 16):
        hex_str = ' '.join(f'{rom_data[dte_offset+i+j]:02X}' for j in range(min(16, 254 - i)))
        print(f"${dte_offset + i:05X}: {hex_str}")

if __name__ == '__main__':
    main()
