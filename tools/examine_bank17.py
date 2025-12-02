#!/usr/bin/env python3
"""
Examine Bank 17 text area where "the Tower" was found.
"""

ROM_PATH = r"c:\Users\me\source\repos\dragon-warrior-4-info\roms\Dragon Warrior IV (1992-10)(Enix)(US).nes"

# TBL
TBL = {0x00: ' '}
for i in range(10):
    TBL[0x01 + i] = str(i)
for i, c in enumerate('abcdefghijklmnopqrstuvwxyz'):
    TBL[0x0B + i] = c
for i, c in enumerate('ABCDEFGHIJKLMNOPQRSTUVWXYZ'):
    TBL[0x25 + i] = c
TBL[0x65] = '-'
TBL[0x66] = '"'
TBL[0x67] = '"'
TBL[0x68] = "'"
TBL[0x69] = "'"
TBL[0x6A] = "'"
TBL[0x6B] = "'"
TBL[0x6D] = '?'
TBL[0x6E] = '!'
TBL[0x6F] = '-'
TBL[0x70] = '*'
TBL[0x71] = ':'
TBL[0x72] = '...'
TBL[0x75] = '('
TBL[0x76] = ')'
TBL[0x77] = ','
TBL[0x78] = '.'

def decode(b):
    return TBL.get(b, f'<{b:02X}>')

def main():
    with open(ROM_PATH, 'rb') as f:
        rom = f.read()

    # Bank 17 - starts at ROM 0x44010
    # "the Tower" found at 0x47E5F
    print("Bank 17 Text Area (around 'the Tower'):")
    print("=" * 60)

    start = 0x47E40
    for i in range(20):
        offset = start + i * 0x20
        segment = rom[offset:offset + 0x30]
        decoded = ''.join(decode(b) for b in segment)
        print(f"0x{offset:05X}: {decoded[:60]}")

    # Let's also look at Bank 22 where "Select the message" was found
    print("\n" + "=" * 60)
    print("Bank 22 Text Area (around 'Select the message'):")
    print("=" * 60)

    # Search for it
    search = bytes([0x37, 0x0F, 0x16, 0x0F, 0x0D, 0x1E])  # "Select"
    pos = rom.find(search)
    if pos != -1:
        print(f"'Select' found at ROM 0x{pos:05X}")
        start = pos - 0x20
        for i in range(10):
            offset = start + i * 0x20
            segment = rom[offset:offset + 0x40]
            decoded = ''.join(decode(b) for b in segment)
            print(f"0x{offset:05X}: {decoded[:70]}")

if __name__ == "__main__":
    main()
