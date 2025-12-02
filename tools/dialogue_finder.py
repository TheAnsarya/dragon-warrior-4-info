#!/usr/bin/env python3
"""Search for common dialogue text patterns in DW4 ROM."""

import os

rom_path = 'roms/Dragon Warrior IV (1992-10)(Enix)(US).nes'
with open(rom_path, 'rb') as f:
    rom = f.read()

# TBL mapping for quick decoding
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
    0x70: ':', 0x71: '(', 0x72: ')',
}

# Search for dialogue patterns
patterns = [
    ('Welcome', bytes([0x3B, 0x0F, 0x16, 0x0D, 0x19, 0x17, 0x0F])),
    ('soldier', bytes([0x1D, 0x19, 0x16, 0x0E, 0x13, 0x0F, 0x1C])),
    ('village', bytes([0x20, 0x13, 0x16, 0x16, 0x0B, 0x11, 0x0F])),
    ('castle', bytes([0x0D, 0x0B, 0x1D, 0x1E, 0x16, 0x0F])),
    ('monster', bytes([0x17, 0x19, 0x18, 0x1D, 0x1E, 0x0F, 0x1C])),
    ('weapon', bytes([0x21, 0x0F, 0x0B, 0x1A, 0x19, 0x18])),
    ('armor', bytes([0x0B, 0x1C, 0x17, 0x19, 0x1C])),
    ('inn', bytes([0x13, 0x18, 0x18])),
    ('shop', bytes([0x1D, 0x12, 0x19, 0x1A])),
    ('king', bytes([0x15, 0x13, 0x18, 0x11])),
    ('Ragnar', bytes([0x36, 0x0B, 0x11, 0x18, 0x0B, 0x1C])),
    ('Hello', bytes([0x2C, 0x0F, 0x16, 0x16, 0x19])),
    ('thou', bytes([0x1E, 0x12, 0x19, 0x1F])),
    ('thy', bytes([0x1E, 0x12, 0x23])),
    ('quest', bytes([0x1B, 0x1F, 0x0F, 0x1D, 0x1E])),
    ('please', bytes([0x1A, 0x16, 0x0F, 0x0B, 0x1D, 0x0F])),
    ('children', bytes([0x0D, 0x12, 0x13, 0x16, 0x0E, 0x1C, 0x0F, 0x18])),
    ('Burland', bytes([0x26, 0x1F, 0x1C, 0x16, 0x0B, 0x18, 0x0E])),
    ('Endor', bytes([0x29, 0x18, 0x0E, 0x19, 0x1C])),
    ('Santeem', bytes([0x37, 0x0B, 0x18, 0x1E, 0x0F, 0x0F, 0x17])),
]

def decode_bytes(data):
    """Decode bytes to text."""
    result = []
    for b in data:
        if b in TBL:
            result.append(TBL[b])
        elif b == 0xFF:
            result.append('|')
        elif b == 0xFD:
            result.append('\\n')
        elif b == 0x22:
            result.append('<>')
        else:
            result.append(f'[{b:02x}]')
    return ''.join(result)

print('Searching for dialogue text patterns...')
print()

# Track all found offsets to identify text-rich areas
all_offsets = []

for name, pattern in patterns:
    offsets = []
    pos = 0
    while True:
        try:
            idx = rom.index(pattern, pos)
            offsets.append(idx)
            all_offsets.append(idx)
            pos = idx + 1
        except ValueError:
            break

    if offsets:
        print(f'{name}: {len(offsets)} occurrences')
        for o in offsets[:3]:
            # Show context around the match
            start = max(0, o - 10)
            end = min(len(rom), o + len(pattern) + 30)
            context = rom[start:end]
            decoded = decode_bytes(context)
            print(f'  0x{o:05x}: {decoded}')
        if len(offsets) > 3:
            print(f'  ... and {len(offsets) - 3} more')
        print()

# Analyze which banks contain the most text
print('=' * 60)
print('TEXT CONCENTRATION BY BANK')
print('=' * 60)

bank_counts = {}
for o in all_offsets:
    bank = (o - 16) // 0x4000
    bank_counts[bank] = bank_counts.get(bank, 0) + 1

for bank, count in sorted(bank_counts.items(), key=lambda x: -x[1]):
    bank_start = 16 + bank * 0x4000
    bank_end = bank_start + 0x4000
    print(f'Bank {bank:2d} (0x{bank_start:05x}-0x{bank_end:05x}): {count} pattern matches')

# Look for text pointers (low-byte/high-byte pairs pointing within bank)
print()
print('=' * 60)
print('SEARCHING FOR TEXT POINTER TABLES')
print('=' * 60)

# Text pointer tables often have sequential pointers
# Each pointer is 2 bytes (low, high) pointing to bank addresses 0x8000-0xBFFF
for bank in bank_counts.keys():
    bank_start = 16 + bank * 0x4000
    bank_end = bank_start + 0x4000

    # Look for sequences of pointers at the start of banks
    for table_start in range(bank_start, bank_start + 0x200, 2):
        # Check if this could be a pointer table (at least 8 consecutive valid pointers)
        valid_ptrs = 0
        for i in range(20):  # Check up to 20 pointers
            ptr_offset = table_start + i * 2
            if ptr_offset + 1 >= bank_end:
                break

            low = rom[ptr_offset]
            high = rom[ptr_offset + 1]
            ptr = (high << 8) | low

            # Valid NES PRG pointers are typically 0x8000-0xFFFF
            if 0x8000 <= ptr <= 0xFFFF:
                valid_ptrs += 1
            else:
                break

        if valid_ptrs >= 8:
            print(f'Potential pointer table at 0x{table_start:05x} (Bank {bank}): {valid_ptrs} sequential pointers')
            # Show first few pointers
            for i in range(min(5, valid_ptrs)):
                ptr_offset = table_start + i * 2
                low = rom[ptr_offset]
                high = rom[ptr_offset + 1]
                ptr = (high << 8) | low
                # Convert CPU address to ROM offset
                rom_offset = bank_start + (ptr - 0x8000)
                # Try to decode target
                if rom_offset < bank_end:
                    target_data = rom[rom_offset:rom_offset + 40]
                    decoded = decode_bytes(target_data)
                    print(f'  [{i}] ${ptr:04X} -> 0x{rom_offset:05x}: {decoded[:50]}...')
            break  # Only report first table per bank
