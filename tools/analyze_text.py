#!/usr/bin/env python3
"""
Analyze Dragon Warrior IV text encoding.
"""

from pathlib import Path

rom = Path('roms/Dragon Warrior IV (1992-10)(Enix)(US).nes').read_bytes()

TBL = {
    0x00: ' ', 0x01: '0', 0x02: '1', 0x03: '2', 0x04: '3', 0x05: '4',
    0x06: '5', 0x07: '6', 0x08: '7', 0x09: '8', 0x0a: '9',
    0x0b: 'a', 0x0c: 'b', 0x0d: 'c', 0x0e: 'd', 0x0f: 'e',
    0x10: 'f', 0x11: 'g', 0x12: 'h', 0x13: 'i', 0x14: 'j',
    0x15: 'k', 0x16: 'l', 0x17: 'm', 0x18: 'n', 0x19: 'o',
    0x1a: 'p', 0x1b: 'q', 0x1c: 'r', 0x1d: 's', 0x1e: 't',
    0x1f: 'u', 0x20: 'v', 0x21: 'w', 0x22: 'x', 0x23: 'y',
    0x24: 'z',
    0x25: 'A', 0x26: 'B', 0x27: 'C', 0x28: 'D', 0x29: 'E',
    0x2a: 'F', 0x2b: 'G', 0x2c: 'H', 0x2d: 'I', 0x2e: 'J',
    0x2f: 'K', 0x30: 'L', 0x31: 'M', 0x32: 'N', 0x33: 'O',
    0x34: 'P', 0x35: 'Q', 0x36: 'R', 0x37: 'S', 0x38: 'T',
    0x39: 'U', 0x3a: 'V', 0x3b: 'W', 0x3c: 'X', 0x3d: 'Y',
    0x3e: 'Z', 0x77: ',', 0x78: '.', 0x6a: "'",
}

# Chapter text area
offset = 0x6e674
data = rom[offset:offset + 200]

print('Raw hex analysis of chapter text:')
print()

i = 0
while i < len(data):
    b = data[i]

    if b == 0xff:
        print(f'{i:3d}: 0xff = [END]')
    elif b == 0xfd:
        print(f'{i:3d}: 0xfd = [LINE/CLEAR]')
    elif b == 0xfe:
        print(f'{i:3d}: 0xfe = [CTRL-FE]')
    elif b == 0x22:  # Appears to be 2-byte control code
        if i + 1 < len(data):
            next_b = data[i+1]
            print(f'{i:3d}: 0x22 0x{next_b:02x} = [POSITION param={next_b}]')
            i += 1
    elif b == 0x21:  # Also appears as control
        if i + 1 < len(data):
            next_b = data[i+1]
            # Check if next byte is small (control param) or text
            if next_b < 0x40:
                print(f'{i:3d}: 0x21 0x{next_b:02x} = [CTRL-21 param={next_b}]')
                i += 1
            else:
                print(f'{i:3d}: 0x21 = "w"')
    elif b in TBL:
        # Collect consecutive printable chars
        start = i
        txt = ''
        while i < len(data) and data[i] in TBL:
            txt += TBL[data[i]]
            i += 1
        i -= 1
        if len(txt) > 1:
            print(f'{start:3d}-{i:3d}: "{txt}"')
        else:
            print(f'{start:3d}: "{txt}"')
    else:
        print(f'{i:3d}: 0x{b:02x} = [?]')

    i += 1

print()
print('=' * 60)
print()
print('Full decoded text with control codes:')
print()

def decode_text(data):
    result = ''
    i = 0
    while i < len(data):
        b = data[i]
        if b == 0xff:
            result += '\n[END]\n'
        elif b == 0xfd:
            result += '[CLEAR]'
        elif b == 0xfe:
            result += '[FE]'
        elif b == 0x22:
            if i + 1 < len(data):
                result += f'[POS:{data[i+1]}]'
                i += 1
        elif b == 0x21:
            if i + 1 < len(data) and data[i+1] < 0x40:
                result += f'[21:{data[i+1]}]'
                i += 1
            else:
                result += TBL.get(b, '?')
        elif b in TBL:
            result += TBL[b]
        else:
            result += f'[{b:02x}]'
        i += 1
    return result

print(decode_text(data))
