#!/usr/bin/env python3
"""
Dragon Warrior 4 (NES) - Menu and Name Table Scanner
====================================================

Scans for menu text, item names, spell names, monster names, etc.
"""

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
    0x65: ',', 0x66: '.', 0x67: '-', 0x68: '…', 0x69: '!',
    0x6A: "'", 0x6B: '&', 0x6C: '"', 0x6D: '?', 0x6E: '/',
    0x70: ':', 0x71: '(', 0x72: ')', 0x73: '`', 0x74: ';',
}

def decode(data):
    """Decode bytes to text."""
    result = []
    for b in data:
        if b in TBL:
            result.append(TBL[b])
        elif b == 0xFF:
            result.append('|')
        else:
            result.append(f'[{b:02x}]')
    return ''.join(result)

def hex_dump(data, offset):
    """Create hex dump with text decode."""
    lines = []
    for i in range(0, len(data), 16):
        chunk = data[i:i+16]
        hex_part = ' '.join(f'{b:02x}' for b in chunk)
        text_part = decode(chunk).replace('|', '.')
        lines.append(f'0x{offset+i:05x}: {hex_part:<48}  {text_part}')
    return '\n'.join(lines)

print("=" * 70)
print("DRAGON WARRIOR IV - TEXT REGION ANALYSIS")
print("=" * 70)

# Known text region from previous discovery
print("\n--- Menu Text Region (0x5b400-0x5b600) ---")
print(hex_dump(rom[0x5b400:0x5b600], 0x5b400))

# Search for known item names to find item table
print("\n" + "=" * 70)
print("SEARCHING FOR ITEM/EQUIPMENT NAMES")
print("=" * 70)

item_patterns = [
    ('Copper Sword', [0x27, 0x19, 0x1A, 0x1A, 0x0F, 0x1C, 0x00, 0x37, 0x21, 0x19, 0x1C, 0x0E]),
    ('Leather Armor', [0x30, 0x0F, 0x0B, 0x1E, 0x12, 0x0F, 0x1C, 0x00, 0x25, 0x1C, 0x17, 0x19, 0x1C]),
    ('Wooden Hat', [0x3B, 0x19, 0x19, 0x0E, 0x0F, 0x18, 0x00, 0x2C, 0x0B, 0x1E]),
    ('Iron Sword', [0x2D, 0x1C, 0x19, 0x18, 0x00, 0x37, 0x21, 0x19, 0x1C, 0x0E]),
    ('Herb', [0x2C, 0x0F, 0x1C, 0x0C]),  # Herb
    ('Medical', [0x31, 0x0F, 0x0E, 0x13, 0x0D, 0x0B, 0x16]),  # Medical
    ('Antidote', [0x25, 0x18, 0x1E, 0x13, 0x0E, 0x19, 0x1E, 0x0F]),
    ('Small Medal', [0x37, 0x17, 0x0B, 0x16, 0x16, 0x00, 0x31, 0x0F, 0x0E, 0x0B, 0x16]),
    ('Wing', [0x3B, 0x13, 0x18, 0x11]),  # Wing
]

for name, pattern in item_patterns:
    pattern_bytes = bytes(pattern)
    pos = 0
    found = []
    while True:
        try:
            idx = rom.index(pattern_bytes, pos)
            found.append(idx)
            pos = idx + 1
        except ValueError:
            break

    if found:
        print(f"\n'{name}' found at:")
        for offset in found[:5]:
            bank = (offset - 16) // 0x4000
            # Show surrounding context
            start = max(16, offset - 20)
            end = min(len(rom), offset + len(pattern) + 20)
            context = decode(rom[start:end])
            print(f"  0x{offset:05x} (Bank {bank}): ...{context}...")

# Search for spell names
print("\n" + "=" * 70)
print("SEARCHING FOR SPELL NAMES")
print("=" * 70)

spell_patterns = [
    ('Heal', [0x2C, 0x0F, 0x0B, 0x16]),
    ('Healmore', [0x2C, 0x0F, 0x0B, 0x16, 0x17, 0x19, 0x1C, 0x0F]),
    ('Healall', [0x2C, 0x0F, 0x0B, 0x16, 0x0B, 0x16, 0x16]),
    ('Hurt', [0x2C, 0x1F, 0x1C, 0x1E]),
    ('Fireball', [0x2A, 0x13, 0x1C, 0x0F, 0x0C, 0x0B, 0x16, 0x16]),
    ('Blaze', [0x26, 0x16, 0x0B, 0x24, 0x0F]),
    ('Sleep', [0x37, 0x16, 0x0F, 0x0F, 0x1A]),
    ('Return', [0x36, 0x0F, 0x1E, 0x1F, 0x1C, 0x18]),
    ('Outside', [0x33, 0x1F, 0x1E, 0x1D, 0x13, 0x0E, 0x0F]),
]

for name, pattern in spell_patterns:
    pattern_bytes = bytes(pattern)
    pos = 0
    found = []
    while True:
        try:
            idx = rom.index(pattern_bytes, pos)
            found.append(idx)
            pos = idx + 1
        except ValueError:
            break

    if found:
        print(f"\n'{name}' found at:")
        for offset in found[:5]:
            bank = (offset - 16) // 0x4000
            start = max(16, offset - 10)
            end = min(len(rom), offset + len(pattern) + 20)
            context = decode(rom[start:end])
            print(f"  0x{offset:05x} (Bank {bank}): ...{context}...")

# Search for monster names
print("\n" + "=" * 70)
print("SEARCHING FOR MONSTER NAMES")
print("=" * 70)

monster_patterns = [
    ('Slime', [0x37, 0x16, 0x13, 0x17, 0x0F]),
    ('Healslime', [0x2C, 0x0F, 0x0B, 0x16, 0x1D, 0x16, 0x13, 0x17, 0x0F]),
    ('Drakee', [0x28, 0x1C, 0x0B, 0x15, 0x0F, 0x0F]),
    ('Skeleton', [0x37, 0x15, 0x0F, 0x16, 0x0F, 0x1E, 0x19, 0x18]),
    ('Magician', [0x31, 0x0B, 0x11, 0x13, 0x0D, 0x13, 0x0B, 0x18]),
    ('Dragon', [0x28, 0x1C, 0x0B, 0x11, 0x19, 0x18]),
    ('Golem', [0x2B, 0x19, 0x16, 0x0F, 0x17]),
]

for name, pattern in monster_patterns:
    pattern_bytes = bytes(pattern)
    pos = 0
    found = []
    while True:
        try:
            idx = rom.index(pattern_bytes, pos)
            found.append(idx)
            pos = idx + 1
        except ValueError:
            break

    if found:
        print(f"\n'{name}' found at:")
        for offset in found[:5]:
            bank = (offset - 16) // 0x4000
            start = max(16, offset - 10)
            end = min(len(rom), offset + len(pattern) + 20)
            context = decode(rom[start:end])
            print(f"  0x{offset:05x} (Bank {bank}): ...{context}...")

# Now scan the entire ROM for consecutive printable text regions
print("\n" + "=" * 70)
print("SCANNING FOR TEXT-HEAVY REGIONS")
print("=" * 70)

# Find regions with high concentration of TBL characters
window_size = 256
threshold = 0.60  # 60% printable

text_regions = []
i = 16  # Skip header
while i < len(rom) - window_size:
    window = rom[i:i+window_size]
    printable = sum(1 for b in window if b in TBL or b == 0xFF)
    ratio = printable / window_size

    if ratio >= threshold:
        # Found a text region - extend it
        start = i
        while i < len(rom) - window_size:
            window = rom[i:i+window_size]
            printable = sum(1 for b in window if b in TBL or b == 0xFF)
            if printable / window_size < threshold * 0.8:
                break
            i += window_size // 2
        end = i

        bank = (start - 16) // 0x4000
        text_regions.append((start, end, end - start, bank))
        i = end + 1
    else:
        i += window_size // 4

# Sort by size
text_regions.sort(key=lambda x: -x[2])

print(f"\nFound {len(text_regions)} text-heavy regions:")
for start, end, size, bank in text_regions[:15]:
    # Sample the text
    sample = decode(rom[start:start+60])
    print(f"\n0x{start:05x}-0x{end:05x} ({size} bytes, Bank {bank}):")
    print(f"  Sample: {sample}...")

# Look at chapter title area more closely to understand the format
print("\n" + "=" * 70)
print("EXAMINING CHAPTER TITLE FORMAT")
print("=" * 70)

# Chapter titles are at 0x6e674
print(hex_dump(rom[0x6e670:0x6e700], 0x6e670))
