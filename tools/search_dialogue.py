#!/usr/bin/env python3
"""
Comprehensive search for Dragon Warrior IV dialogue text.

DW4 dialogue is likely compressed with DTE or similar scheme.
This script searches for patterns that identify dialogue blocks.
"""

ROM_PATH = r"c:\Users\me\source\repos\dragon-warrior-4-info\roms\Dragon Warrior IV (1992-10)(Enix)(US).nes"

# Base TBL
TBL = {0x00: ' '}
for i in range(10):
    TBL[0x01 + i] = str(i)
for i, c in enumerate('abcdefghijklmnopqrstuvwxyz'):
    TBL[0x0B + i] = c
for i, c in enumerate('ABCDEFGHIJKLMNOPQRSTUVWXYZ'):
    TBL[0x25 + i] = c
TBL[0x3F] = '.'
TBL[0x40] = ','
TBL[0x41] = '-'
TBL[0x42] = '...'
TBL[0x43] = '!'
TBL[0x44] = '?'
TBL[0x45] = "'"

def decode_byte(b):
    return TBL.get(b, f'<{b:02X}>')

def main():
    with open(ROM_PATH, 'rb') as f:
        rom = f.read()

    print("=" * 70)
    print("DRAGON WARRIOR IV - DIALOGUE SEARCH")
    print("=" * 70)

    # Chapter 1 text - soldier says "My lord!" and similar
    # Let's search for "lord" - l=$16, o=$19, r=$1C, d=$0E
    lord = bytes([0x16, 0x19, 0x1C, 0x0E])
    print("\nSearching for 'lord'...")
    pos = 0
    while True:
        pos = rom.find(lord, pos)
        if pos == -1:
            break
        bank = (pos - 0x10) // 0x4000
        # Show context
        ctx = rom[max(0, pos-10):pos+20]
        decoded = ''.join(decode_byte(b) for b in ctx)
        print(f"  ROM 0x{pos:05X} (Bank {bank}): ...{decoded}...")
        pos += 1

    # Search for "king" - k=$15, i=$13, n=$18, g=$11
    king = bytes([0x15, 0x13, 0x18, 0x11])
    print("\nSearching for 'king'...")
    pos = 0
    count = 0
    while count < 20:
        pos = rom.find(king, pos)
        if pos == -1:
            break
        bank = (pos - 0x10) // 0x4000
        ctx = rom[max(0, pos-10):pos+20]
        decoded = ''.join(decode_byte(b) for b in ctx)
        print(f"  ROM 0x{pos:05X} (Bank {bank}): ...{decoded}...")
        pos += 1
        count += 1

    # Search for "Alena" - A=$25, l=$16, e=$0F, n=$18, a=$0B
    alena = bytes([0x25, 0x16, 0x0F, 0x18, 0x0B])
    print("\nSearching for 'Alena'...")
    pos = 0
    count = 0
    while count < 20:
        pos = rom.find(alena, pos)
        if pos == -1:
            break
        bank = (pos - 0x10) // 0x4000
        ctx = rom[max(0, pos-10):pos+20]
        decoded = ''.join(decode_byte(b) for b in ctx)
        print(f"  ROM 0x{pos:05X} (Bank {bank}): ...{decoded}...")
        pos += 1
        count += 1

    # Search for "Taloon" - T=$38, a=$0B, l=$16, o=$19, o=$19, n=$18
    taloon = bytes([0x38, 0x0B, 0x16, 0x19, 0x19, 0x18])
    print("\nSearching for 'Taloon'...")
    pos = 0
    while True:
        pos = rom.find(taloon, pos)
        if pos == -1:
            break
        bank = (pos - 0x10) // 0x4000
        ctx = rom[max(0, pos-10):pos+20]
        decoded = ''.join(decode_byte(b) for b in ctx)
        print(f"  ROM 0x{pos:05X} (Bank {bank}): ...{decoded}...")
        pos += 1

    # Search for "casino" - c=$0D, a=$0B, s=$1D, i=$13, n=$18, o=$19
    casino = bytes([0x0D, 0x0B, 0x1D, 0x13, 0x18, 0x19])
    print("\nSearching for 'casino'...")
    pos = 0
    while True:
        pos = rom.find(casino, pos)
        if pos == -1:
            break
        bank = (pos - 0x10) // 0x4000
        ctx = rom[max(0, pos-10):pos+20]
        decoded = ''.join(decode_byte(b) for b in ctx)
        print(f"  ROM 0x{pos:05X} (Bank {bank}): ...{decoded}...")
        pos += 1

    # Search for "coins" - c=$0D, o=$19, i=$13, n=$18, s=$1D
    coins = bytes([0x0D, 0x19, 0x13, 0x18, 0x1D])
    print("\nSearching for 'coins'...")
    pos = 0
    count = 0
    while count < 20:
        pos = rom.find(coins, pos)
        if pos == -1:
            break
        bank = (pos - 0x10) // 0x4000
        ctx = rom[max(0, pos-10):pos+20]
        decoded = ''.join(decode_byte(b) for b in ctx)
        print(f"  ROM 0x{pos:05X} (Bank {bank}): ...{decoded}...")
        pos += 1
        count += 1

    # Search for "gold" - g=$11, o=$19, l=$16, d=$0E
    gold = bytes([0x11, 0x19, 0x16, 0x0E])
    print("\nSearching for 'gold'...")
    pos = 0
    count = 0
    while count < 20:
        pos = rom.find(gold, pos)
        if pos == -1:
            break
        bank = (pos - 0x10) // 0x4000
        ctx = rom[max(0, pos-10):pos+20]
        decoded = ''.join(decode_byte(b) for b in ctx)
        print(f"  ROM 0x{pos:05X} (Bank {bank}): ...{decoded}...")
        pos += 1
        count += 1

    # Now let's look for text pointer tables
    # These would be sequences of 16-bit addresses pointing into text banks
    print("\n" + "=" * 70)
    print("SEARCHING FOR TEXT POINTER TABLES")
    print("=" * 70)

    # For Bank 23 (casino text at $82EC), pointers would be like $EC $82
    # Look for sequences of pointers in $80xx-$BFxx range
    for bank_start in [0x5C010, 0x60010, 0x6C010]:  # Banks 23, 24, 27
        bank_num = (bank_start - 0x10) // 0x4000
        print(f"\nBank {bank_num} potential pointer tables:")

        # Search for runs of valid pointers
        for offset in range(bank_start, bank_start + 0x200, 2):
            # Check if next 10 words are valid pointers ($8000-$BFFF)
            valid = True
            ptrs = []
            for i in range(10):
                lo = rom[offset + i*2]
                hi = rom[offset + i*2 + 1]
                addr = lo + (hi << 8)
                if 0x8000 <= addr <= 0xBFFF:
                    ptrs.append(addr)
                else:
                    valid = False
                    break

            if valid and len(ptrs) == 10:
                # Check if pointers are roughly sequential (text tables usually are)
                diffs = [ptrs[i+1] - ptrs[i] for i in range(len(ptrs)-1)]
                if all(0 < d < 200 for d in diffs):  # Reasonable spacing
                    bank_offset = (offset - 0x10) % 0x4000
                    cpu_addr = 0x8000 + bank_offset
                    print(f"  ROM 0x{offset:05X} (CPU ${cpu_addr:04X}): " +
                          ', '.join(f'${p:04X}' for p in ptrs[:5]) + '...')

if __name__ == "__main__":
    main()
