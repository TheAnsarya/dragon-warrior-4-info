#!/usr/bin/env python3
"""
Updated TBL and dialogue search for Dragon Warrior IV.

Based on Data Crystal documentation, the TBL includes:
- $00 = space
- $01-$0A = 0-9
- $0B-$24 = a-z
- $25-$3E = A-Z
- $65-$7F = punctuation and special characters
- $80-$81 = ▼ ▶ (cursor symbols)

The dialogue likely uses additional encoding like dictionary references
or may have portions compressed differently.
"""

ROM_PATH = r"c:\Users\me\source\repos\dragon-warrior-4-info\roms\Dragon Warrior IV (1992-10)(Enix)(US).nes"

# Complete TBL based on Data Crystal
TBL = {}
TBL[0x00] = ' '
for i in range(10):
    TBL[0x01 + i] = str(i)
for i, c in enumerate('abcdefghijklmnopqrstuvwxyz'):
    TBL[0x0B + i] = c
for i, c in enumerate('ABCDEFGHIJKLMNOPQRSTUVWXYZ'):
    TBL[0x25 + i] = c

# Special characters (from Data Crystal)
TBL[0x65] = '—'  # em dash
TBL[0x66] = '"'  # open quote
TBL[0x67] = '"'  # close quote
TBL[0x68] = '''  # open single
TBL[0x69] = '''  # close single
TBL[0x6A] = '''  # alternate single
TBL[0x6B] = '''  # alternate single
TBL[0x6C] = "'"  # period-quote (weird)
TBL[0x6D] = '?'
TBL[0x6E] = '!'
TBL[0x6F] = '-'
TBL[0x70] = '✱'
TBL[0x71] = ':'
TBL[0x72] = '…'  # ellipsis
TBL[0x73] = '??'  # unknown
TBL[0x74] = '??'  # unknown
TBL[0x75] = '('
TBL[0x76] = ')'
TBL[0x77] = ','
TBL[0x78] = '.'
TBL[0x79] = '「'  # Japanese bracket
TBL[0x80] = '▼'
TBL[0x81] = '▶'

# Control codes
TBL[0xFD] = '<LINE>'
TBL[0xFE] = '<FE>'
TBL[0xFF] = '<END>'

def decode_byte(b):
    return TBL.get(b, f'<{b:02X}>')

def decode_string(data, max_len=200):
    """Decode a string with the TBL."""
    result = ''
    for i, b in enumerate(data[:max_len]):
        if b == 0xFF:
            result += '<END>'
            break
        result += decode_byte(b)
    return result

def main():
    with open(ROM_PATH, 'rb') as f:
        rom = f.read()

    print("=" * 70)
    print("DRAGON WARRIOR IV - UPDATED TEXT SEARCH")
    print("=" * 70)

    # Search for dialogue patterns with apostrophes
    # "I'm" - I=$2D, '=$6A, m=$17
    im_bytes = bytes([0x2D, 0x6A, 0x17])
    print("\nSearching for \"I'm\"...")
    pos = 0
    count = 0
    while count < 20:
        pos = rom.find(im_bytes, pos)
        if pos == -1:
            break
        bank = (pos - 0x10) // 0x4000
        ctx = rom[max(0, pos-10):pos+30]
        decoded = decode_string(ctx)
        print(f"  ROM 0x{pos:05X} (Bank {bank}): ...{decoded[:50]}...")
        pos += 1
        count += 1

    # Search for "the" with lowercase - t=$1E, h=$12, e=$0F
    the_bytes = bytes([0x1E, 0x12, 0x0F])
    print("\nSearching for 'the'...")
    pos = 0
    count = 0
    while count < 20:
        pos = rom.find(the_bytes, pos)
        if pos == -1:
            break
        bank = (pos - 0x10) // 0x4000
        ctx = rom[max(0, pos-5):pos+20]
        decoded = decode_string(ctx)
        # Only show if it looks like actual text (has spaces)
        if ' ' in decoded and decoded.count('<') < 3:
            print(f"  ROM 0x{pos:05X} (Bank {bank}): ...{decoded}...")
        pos += 1
        count += 1

    # Search for common RPG words with updated encoding
    # "weapon" - w=$21, e=$0F, a=$0B, p=$1A, o=$19, n=$18
    weapon = bytes([0x21, 0x0F, 0x0B, 0x1A, 0x19, 0x18])
    print("\nSearching for 'weapon'...")
    pos = 0
    while True:
        pos = rom.find(weapon, pos)
        if pos == -1:
            break
        bank = (pos - 0x10) // 0x4000
        ctx = rom[max(0, pos-5):pos+30]
        decoded = decode_string(ctx)
        print(f"  ROM 0x{pos:05X} (Bank {bank}): ...{decoded}...")
        pos += 1

    # "armor" - a=$0B, r=$1C, m=$17, o=$19, r=$1C
    armor = bytes([0x0B, 0x1C, 0x17, 0x19, 0x1C])
    print("\nSearching for 'armor'...")
    pos = 0
    while True:
        pos = rom.find(armor, pos)
        if pos == -1:
            break
        bank = (pos - 0x10) // 0x4000
        ctx = rom[max(0, pos-5):pos+30]
        decoded = decode_string(ctx)
        print(f"  ROM 0x{pos:05X} (Bank {bank}): ...{decoded}...")
        pos += 1

    # "slime" - s=$1D, l=$16, i=$13, m=$17, e=$0F
    slime = bytes([0x1D, 0x16, 0x13, 0x17, 0x0F])
    print("\nSearching for 'slime'...")
    pos = 0
    while True:
        pos = rom.find(slime, pos)
        if pos == -1:
            break
        bank = (pos - 0x10) // 0x4000
        ctx = rom[max(0, pos-5):pos+30]
        decoded = decode_string(ctx)
        print(f"  ROM 0x{pos:05X} (Bank {bank}): ...{decoded}...")
        pos += 1

    # Search with question mark: "?" = $6D
    print("\nSearching for '?' with surrounding text...")
    pos = 0
    count = 0
    while count < 30:
        pos = rom.find(bytes([0x6D]), pos)
        if pos == -1:
            break
        # Check context - should have text before/after
        ctx = rom[max(0, pos-20):pos+20]
        decoded = decode_string(ctx)
        # Only show if mostly text
        text_chars = sum(1 for b in ctx if b <= 0x3E or 0x65 <= b <= 0x7F)
        if text_chars > len(ctx) * 0.5 and ' ' in decoded:
            bank = (pos - 0x10) // 0x4000
            print(f"  ROM 0x{pos:05X} (Bank {bank}): ...{decoded}...")
            count += 1
        pos += 1

    # Now let's look at known good text areas and analyze patterns
    print("\n" + "=" * 70)
    print("ANALYZING KNOWN TEXT AREAS")
    print("=" * 70)

    # Bank 27 chapter text - we know this works
    print("\nBank 27 Chapter Titles (known good text):")
    chapter_start = 0x6E676
    for i in range(5):
        offset = chapter_start + i * 0x20
        segment = rom[offset:offset + 0x30]
        decoded = decode_string(segment)
        print(f"  0x{offset:05X}: {decoded}")

    # Casino text in Bank 23
    print("\nBank 23 Casino Text (known good text):")
    casino_start = 0x5C2EC  # "Royal Flush"
    for i in range(15):
        # Search forward for text
        offset = casino_start + i * 0x10
        segment = rom[offset:offset + 0x30]
        decoded = decode_string(segment)
        if decoded and '<END>' in decoded:
            print(f"  0x{offset:05X}: {decoded}")

if __name__ == "__main__":
    main()
