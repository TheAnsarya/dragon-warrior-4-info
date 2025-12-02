#!/usr/bin/env python3
"""Examine Bank 18 which contains spell/item names."""

import os

rom_path = 'roms/Dragon Warrior IV (1992-10)(Enix)(US).nes'
with open(rom_path, 'rb') as f:
    rom = f.read()

# TBL mapping
TBL = {
    0x00: ' ', 0x01: '0', 0x02: '1', 0x03: '2', 0x04: '3', 0x05: '4',
    0x06: '5', 0x07: '6', 0x08: '7', 0x09: '8', 0x0A: '9',
    0x0B: 'a', 0x0C: 'b', 0x0D: 'c', 0x0E: 'd', 0x0F: 'e',
    0x10: 'f', 0x11: 'g', 0x12: 'h', 0x13: 'i', 0x14: 'j',
    0x15: 'k', 0x16: 'l', 0x17: 'm', 0x18: 'n', 0x19: 'o',
    0x1A: 'p', 0x1B: 'q', 0x1C: 'r', 0x1D: 's', 0x1E: 't',
    0x1F: 'u', 0x20: 'v', 0x21: 'w', 0x22: 'x', 0x23: 'y',
    0x24: 'z',
    0x25: 'A', 0x26: 'B', 0x27: 'C', 0x28: 'D', 0x29: 'E',
    0x2A: 'F', 0x2B: 'G', 0x2C: 'H', 0x2D: 'I', 0x2E: 'J',
    0x2F: 'K', 0x30: 'L', 0x31: 'M', 0x32: 'N', 0x33: 'O',
    0x34: 'P', 0x35: 'Q', 0x36: 'R', 0x37: 'S', 0x38: 'T',
    0x39: 'U', 0x3A: 'V', 0x3B: 'W', 0x3C: 'X', 0x3D: 'Y',
    0x3E: 'Z',
    0x40: '[0x40]',
    0x65: ',', 0x66: '.', 0x67: '-', 0x68: '...', 0x69: '!',
    0x6A: "'", 0x6B: '&', 0x6C: '"', 0x6D: '?', 0x6E: '/',
    0x70: ':', 0x71: '(', 0x72: ')',
}

def decode(data):
    result = []
    for b in data:
        if b in TBL:
            result.append(TBL[b])
        elif b == 0xFF:
            result.append('|')
        elif b == 0xF4:
            result.append('[W]')
        else:
            result.append(f'[{b:02x}]')
    return ''.join(result)

print('Bank 18 - Spell and Item Names Analysis')
print('=' * 70)

# Look around where spell/item names were found
regions = [
    (0x4a600, 0x4a800, 'Spell names area (Return, Outside)'),
    (0x4af00, 0x4b100, 'Item names area (Wing of Wyvern)'),
]

for start, end, name in regions:
    print(f'\n{name} (0x{start:05x}-0x{end:05x})')
    print('-' * 60)

    for offset in range(start, end, 16):
        line = rom[offset:offset+16]
        hex_part = ' '.join(f'{b:02x}' for b in line)
        text = decode(line)
        print(f'0x{offset:05x}: {hex_part}')
        print(f'         {text}')
        print()

# Let's also look for 0x40-terminated strings which seem common
print('\n' + '=' * 70)
print('SCANNING FOR 0x40-TERMINATED STRINGS IN BANK 18')
print('=' * 70)

bank18_start = 0x48010
bank18_end = 0x4c010

# Find strings terminated by 0x40
strings_found = []
i = bank18_start
while i < bank18_end:
    # Check if this looks like start of text
    if rom[i] in TBL or (0x25 <= rom[i] <= 0x3E):  # Start with letter
        # Scan until 0x40 or non-text
        end = i
        while end < bank18_end and end < i + 50:  # Max 50 chars
            b = rom[end]
            if b == 0x40:  # Found terminator
                if end - i >= 3:  # At least 3 chars
                    text = decode(rom[i:end])
                    # Check if mostly printable
                    printable = sum(1 for c in text if not c.startswith('['))
                    if printable > len(text) * 0.6:
                        strings_found.append((i, text))
                i = end + 1
                break
            elif b not in TBL and b not in [0x65, 0x66, 0x67, 0x68, 0x69, 0x6A, 0x6B, 0x6C, 0x6D]:
                break
            end += 1
        else:
            i += 1
    else:
        i += 1

print(f'\nFound {len(strings_found)} potential strings:')
for offset, text in strings_found[:50]:
    print(f'  0x{offset:05x}: {text}')
