#!/usr/bin/env python3
"""
Dragon Warrior IV - Bank Content Analyzer
Analyzes each PRG bank to identify content type (code, text, graphics, etc.)
"""

import os
import struct
from collections import Counter

ROM_PATH = os.path.join(os.path.dirname(__file__), '..', 'roms', 
                        'Dragon Warrior IV (1992-10)(Enix)(US).nes')

# Text character range
TEXT_CHARS = set(range(0x00, 0x80)) | {0xFD, 0xFE, 0xFF}

# Common 6502 opcodes
CODE_OPCODES = {
    0x00, 0x01, 0x05, 0x06, 0x08, 0x09, 0x0A, 0x0D, 0x0E, 0x10,
    0x11, 0x15, 0x16, 0x18, 0x19, 0x1D, 0x1E, 0x20, 0x21, 0x24,
    0x25, 0x26, 0x28, 0x29, 0x2A, 0x2C, 0x2D, 0x2E, 0x30, 0x31,
    0x35, 0x36, 0x38, 0x39, 0x3D, 0x3E, 0x40, 0x41, 0x45, 0x46,
    0x48, 0x49, 0x4A, 0x4C, 0x4D, 0x4E, 0x50, 0x51, 0x55, 0x56,
    0x58, 0x59, 0x5D, 0x5E, 0x60, 0x61, 0x65, 0x66, 0x68, 0x69,
    0x6A, 0x6C, 0x6D, 0x6E, 0x70, 0x71, 0x75, 0x76, 0x78, 0x79,
    0x7D, 0x7E, 0x81, 0x84, 0x85, 0x86, 0x88, 0x8A, 0x8C, 0x8D,
    0x8E, 0x90, 0x91, 0x94, 0x95, 0x96, 0x98, 0x99, 0x9A, 0x9D,
    0xA0, 0xA1, 0xA2, 0xA4, 0xA5, 0xA6, 0xA8, 0xA9, 0xAA, 0xAC,
    0xAD, 0xAE, 0xB0, 0xB1, 0xB4, 0xB5, 0xB6, 0xB8, 0xB9, 0xBA,
    0xBC, 0xBD, 0xBE, 0xC0, 0xC1, 0xC4, 0xC5, 0xC6, 0xC8, 0xC9,
    0xCA, 0xCC, 0xCD, 0xCE, 0xD0, 0xD1, 0xD5, 0xD6, 0xD8, 0xD9,
    0xDD, 0xDE, 0xE0, 0xE1, 0xE4, 0xE5, 0xE6, 0xE8, 0xE9, 0xEA,
    0xEC, 0xED, 0xEE, 0xF0, 0xF1, 0xF5, 0xF6, 0xF8, 0xF9, 0xFD,
    0xFE,
}

# Text encoding
TBL = {}
for i, c in enumerate("0123456789"):
    TBL[i + 1] = c
for i, c in enumerate("abcdefghijklmnopqrstuvwxyz"):
    TBL[i + 0x0B] = c
for i, c in enumerate("ABCDEFGHIJKLMNOPQRSTUVWXYZ"):
    TBL[i + 0x25] = c
TBL[0x00] = ' '
TBL[0x3F] = ':'
TBL[0x65] = "'"
TBL[0x66] = ','
TBL[0x67] = '.'
TBL[0x68] = '-'
TBL[0x69] = '!'
TBL[0x6A] = '?'

def decode_text(data, max_len=60):
    """Decode text from bytes"""
    result = []
    for b in data[:max_len]:
        if b == 0xFF:
            break
        if b in TBL:
            result.append(TBL[b])
        else:
            result.append(f'[{b:02X}]')
    return ''.join(result)

def load_rom():
    with open(ROM_PATH, 'rb') as f:
        return f.read()

def analyze_bank(rom_data, bank_num):
    """Analyze a single bank's contents"""
    bank_start = 16 + (bank_num * 0x4000)
    bank_end = bank_start + 0x4000
    bank_data = rom_data[bank_start:bank_end]
    
    analysis = {
        'bank': bank_num,
        'rom_start': bank_start,
        'rom_end': bank_end,
        'byte_counts': Counter(bank_data),
        'text_strings': [],
        'code_regions': [],
        'data_regions': [],
        'empty_regions': [],
        'pointers': [],
    }
    
    # Count byte types
    text_bytes = sum(1 for b in bank_data if b in TEXT_CHARS)
    code_bytes = sum(1 for b in bank_data if b in CODE_OPCODES)
    zero_bytes = sum(1 for b in bank_data if b == 0x00)
    ff_bytes = sum(1 for b in bank_data if b == 0xFF)
    
    analysis['text_ratio'] = text_bytes / len(bank_data)
    analysis['code_ratio'] = code_bytes / len(bank_data)
    analysis['zero_ratio'] = zero_bytes / len(bank_data)
    analysis['ff_ratio'] = ff_bytes / len(bank_data)
    
    # Find text strings (sequences of printable chars ending in $FF)
    i = 0
    while i < len(bank_data) - 4:
        # Look for potential text start
        if bank_data[i] in TBL and bank_data[i] != 0:
            # Count consecutive text characters
            j = i
            while j < len(bank_data) and bank_data[j] in TBL:
                j += 1
            
            # Check if terminated by $FF
            if j < len(bank_data) and bank_data[j] == 0xFF and j - i >= 4:
                text = decode_text(bank_data[i:j+1], 60)
                analysis['text_strings'].append({
                    'offset': bank_start + i,
                    'cpu': 0x8000 + i,
                    'length': j - i + 1,
                    'text': text
                })
                i = j + 1
                continue
        i += 1
    
    # Find JSR/JMP targets (potential subroutine starts)
    for i in range(len(bank_data) - 2):
        opcode = bank_data[i]
        if opcode in (0x20, 0x4C):  # JSR, JMP absolute
            target = bank_data[i + 1] | (bank_data[i + 2] << 8)
            if 0x8000 <= target <= 0xBFFF:
                analysis['pointers'].append({
                    'offset': bank_start + i,
                    'type': 'JSR' if opcode == 0x20 else 'JMP',
                    'target': target
                })
    
    # Find RTS (code region ends)
    rts_locations = [i for i, b in enumerate(bank_data) if b == 0x60]
    analysis['rts_count'] = len(rts_locations)
    
    # Determine primary content type
    if analysis['zero_ratio'] > 0.7 or analysis['ff_ratio'] > 0.7:
        analysis['content_type'] = 'EMPTY/PADDING'
    elif len(analysis['text_strings']) > 20 and analysis['text_ratio'] > 0.3:
        analysis['content_type'] = 'TEXT DATA'
    elif analysis['rts_count'] > 50 and analysis['code_ratio'] > 0.4:
        analysis['content_type'] = 'CODE'
    elif analysis['code_ratio'] > 0.5:
        analysis['content_type'] = 'MOSTLY CODE'
    elif analysis['text_ratio'] > 0.5:
        analysis['content_type'] = 'MIXED TEXT/DATA'
    else:
        analysis['content_type'] = 'BINARY DATA'
    
    return analysis

def main():
    rom_data = load_rom()
    print(f"ROM loaded: {len(rom_data)} bytes")
    print()
    
    output = []
    output.append("=" * 80)
    output.append("DRAGON WARRIOR IV - PRG BANK CONTENT ANALYSIS")
    output.append("=" * 80)
    output.append("")
    output.append(f"ROM Size: {len(rom_data)} bytes")
    output.append(f"PRG-ROM: {(len(rom_data) - 16) // 1024}KB ({(len(rom_data) - 16) // 0x4000} banks)")
    output.append("")
    
    banks = []
    for bank_num in range(32):
        analysis = analyze_bank(rom_data, bank_num)
        banks.append(analysis)
    
    # Summary table
    output.append("BANK SUMMARY")
    output.append("-" * 80)
    output.append(f"{'Bank':>4} {'ROM Offset':>12} {'Type':<20} {'Text%':>6} {'Code%':>6} {'RTS':>5} {'Strings':>8}")
    output.append("-" * 80)
    
    for a in banks:
        output.append(f"{a['bank']:>4} 0x{a['rom_start']:05X}-{a['rom_end']:05X} "
                     f"{a['content_type']:<20} {a['text_ratio']*100:>5.1f}% "
                     f"{a['code_ratio']*100:>5.1f}% {a['rts_count']:>5} "
                     f"{len(a['text_strings']):>8}")
    
    output.append("")
    output.append("=" * 80)
    output.append("DETAILED BANK ANALYSIS")
    output.append("=" * 80)
    
    for a in banks:
        output.append("")
        output.append(f"BANK {a['bank']}: {a['content_type']}")
        output.append(f"  ROM: 0x{a['rom_start']:05X}-0x{a['rom_end']:05X}")
        output.append(f"  CPU: $8000-$BFFF (when switched in)")
        output.append(f"  Text ratio: {a['text_ratio']*100:.1f}%")
        output.append(f"  Code ratio: {a['code_ratio']*100:.1f}%")
        output.append(f"  RTS instructions: {a['rts_count']}")
        
        if a['text_strings']:
            output.append(f"  Text strings found: {len(a['text_strings'])}")
            output.append("  Sample strings:")
            for s in a['text_strings'][:10]:
                preview = s['text'][:50] + ('...' if len(s['text']) > 50 else '')
                output.append(f"    ${s['cpu']:04X}: \"{preview}\"")
            if len(a['text_strings']) > 10:
                output.append(f"    ... and {len(a['text_strings']) - 10} more")
    
    # Print and save
    print('\n'.join(output))
    
    output_path = os.path.join(os.path.dirname(__file__), '..', 'docs', 'analysis',
                               'bank_contents.txt')
    os.makedirs(os.path.dirname(output_path), exist_ok=True)
    
    with open(output_path, 'w') as f:
        f.write('\n'.join(output))
    
    print(f"\n\nSaved to: {output_path}")
    
    # Generate labels.asm bank section
    labels_section = []
    labels_section.append("")
    labels_section.append("; ============================================")
    labels_section.append("; PRG BANK MAP (Auto-generated)")
    labels_section.append("; ============================================")
    
    for a in banks:
        labels_section.append(f"; Bank {a['bank']:2d} (0x{a['rom_start']:05X}): {a['content_type']}")
        if a['text_strings']:
            labels_section.append(f";          {len(a['text_strings'])} text strings")
    
    print("\nBank map for labels.asm:")
    print('\n'.join(labels_section))

if __name__ == '__main__':
    main()
