#!/usr/bin/env python3
"""
Dragon Warrior IV - Full Text Extraction
Extract all text strings from the ROM with proper bank and address mapping
"""

import os
import json

ROM_PATH = os.path.join(os.path.dirname(__file__), '..', 'roms',
                        'Dragon Warrior IV (1992-10)(Enix)(US).nes')

# Full text table
TBL = {
    0x00: ' ',
    0x01: '0', 0x02: '1', 0x03: '2', 0x04: '3', 0x05: '4',
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
    0x3F: ':',
    # Control codes range $40-$64 - these are special
    # Punctuation starts at $65
    0x65: "'", 0x66: ',', 0x67: '.', 0x68: '-', 0x69: '!',
    0x6A: '?', 0x6B: '(', 0x6C: ')',
    # More punctuation
    0x6D: '/', 0x6E: '*', 0x6F: '+',
    0x70: '&', 0x71: '#', 0x72: '@', 0x73: '$', 0x74: '%',
    0x75: '~', 0x76: '^', 0x77: '=', 0x78: '_', 0x79: '|',
}

# Control codes
CONTROL_CODES = {
    0xFD: '<LINE>',
    0xFE: '<FE>',
    0xFF: '<END>',
}

def decode_char(b):
    """Decode a single byte to character or control code"""
    if b in TBL:
        return TBL[b]
    elif b in CONTROL_CODES:
        return CONTROL_CODES[b]
    elif 0x40 <= b <= 0x64:
        return f'<{b:02X}>'
    elif 0x80 <= b <= 0xEF:
        return f'[{b:02X}]'
    elif 0xF0 <= b <= 0xFC:
        return f'<F{b-0xF0:X}>'
    else:
        return f'[{b:02X}]'

def decode_string(data, max_len=1000):
    """Decode a byte sequence to text"""
    result = []
    for i, b in enumerate(data[:max_len]):
        if b == 0xFF:
            result.append('<END>')
            break
        result.append(decode_char(b))
    return ''.join(result)

def is_text_char(b):
    """Check if byte is a valid text character"""
    return b in TBL or b in CONTROL_CODES or (0x40 <= b <= 0x64)

def load_rom():
    with open(ROM_PATH, 'rb') as f:
        return f.read()

def find_strings(rom_data, min_length=4):
    """Find all text strings in ROM"""
    strings = []
    i = 16  # Skip header

    while i < len(rom_data):
        # Look for start of string (printable char, not space)
        if rom_data[i] in TBL and rom_data[i] != 0:
            start = i

            # Count consecutive text characters
            j = i
            text_chars = 0
            while j < len(rom_data):
                b = rom_data[j]
                if b == 0xFF:  # End marker
                    j += 1
                    break
                elif b in TBL or (0x40 <= b <= 0x79):
                    j += 1
                    text_chars += 1
                elif b in [0xFD, 0xFE]:  # Control codes
                    j += 1
                else:
                    break

            length = j - start

            # Must have minimum printable characters and end with $FF or be substantial
            if text_chars >= min_length:
                # Check for proper termination
                if j < len(rom_data) and rom_data[j-1] == 0xFF:
                    bank = (start - 16) // 0x4000
                    cpu = 0x8000 + ((start - 16) % 0x4000)
                    text = decode_string(rom_data[start:j])

                    strings.append({
                        'rom_offset': start,
                        'bank': bank,
                        'cpu': cpu,
                        'length': length,
                        'text': text,
                        'raw': list(rom_data[start:j])
                    })
            i = j
        else:
            i += 1

    return strings

def categorize_strings(strings):
    """Categorize strings by content type"""
    categories = {
        'menu': [],
        'dialogue': [],
        'names': [],
        'battle': [],
        'casino': [],
        'chapter': [],
        'misc': [],
    }

    for s in strings:
        text = s['text'].upper()

        if 'CHAPTER' in text or 'ROYAL SOLDIERS' in text or "ALENA'S" in text:
            categories['chapter'].append(s)
        elif any(w in text for w in ['FIGHT', 'SPELL', 'ITEM', 'RUN', 'PARRY', 'ATTACK', 'DEFEND']):
            categories['battle'].append(s)
        elif any(w in text for w in ['POKER', 'FLUSH', 'KIND', 'PAIRS', 'DOUBLE', 'BETS']):
            categories['casino'].append(s)
        elif any(w in text for w in ['ADVENTURE', 'QUEST', 'ERASE', 'SAVE', 'LOAD', 'LOG']):
            categories['menu'].append(s)
        elif len(text) < 20 and '<' not in text and '[' not in text:
            categories['names'].append(s)
        elif '<END>' in text and len(text) > 30:
            categories['dialogue'].append(s)
        else:
            categories['misc'].append(s)

    return categories

def main():
    rom_data = load_rom()
    print(f"ROM loaded: {len(rom_data)} bytes")

    # Find all strings
    print("Finding text strings...")
    strings = find_strings(rom_data, min_length=4)
    print(f"Found {len(strings)} strings")

    # Categorize
    categories = categorize_strings(strings)

    # Output
    output_lines = []
    output_lines.append("=" * 80)
    output_lines.append("DRAGON WARRIOR IV - EXTRACTED TEXT")
    output_lines.append("=" * 80)
    output_lines.append(f"Total strings found: {len(strings)}")
    output_lines.append("")

    output_lines.append("STRINGS BY CATEGORY:")
    for cat, items in categories.items():
        output_lines.append(f"  {cat}: {len(items)}")
    output_lines.append("")

    # Strings by bank
    by_bank = {}
    for s in strings:
        bank = s['bank']
        if bank not in by_bank:
            by_bank[bank] = []
        by_bank[bank].append(s)

    output_lines.append("STRINGS BY BANK:")
    for bank in sorted(by_bank.keys()):
        output_lines.append(f"  Bank {bank:2d}: {len(by_bank[bank])} strings")
    output_lines.append("")

    # Detailed output
    output_lines.append("=" * 80)
    output_lines.append("CHAPTER TITLES")
    output_lines.append("=" * 80)
    for s in categories['chapter']:
        output_lines.append(f"Bank {s['bank']:2d} ${s['cpu']:04X}: {s['text']}")
    output_lines.append("")

    output_lines.append("=" * 80)
    output_lines.append("BATTLE/MENU COMMANDS")
    output_lines.append("=" * 80)
    for s in categories['battle'][:30]:
        output_lines.append(f"Bank {s['bank']:2d} ${s['cpu']:04X}: {s['text']}")
    output_lines.append("")

    output_lines.append("=" * 80)
    output_lines.append("CASINO TEXT")
    output_lines.append("=" * 80)
    for s in categories['casino']:
        output_lines.append(f"Bank {s['bank']:2d} ${s['cpu']:04X}: {s['text']}")
    output_lines.append("")

    output_lines.append("=" * 80)
    output_lines.append("MENU TEXT")
    output_lines.append("=" * 80)
    for s in categories['menu'][:30]:
        output_lines.append(f"Bank {s['bank']:2d} ${s['cpu']:04X}: {s['text']}")
    output_lines.append("")

    output_lines.append("=" * 80)
    output_lines.append("NAMES (potential items/spells/characters)")
    output_lines.append("=" * 80)
    for s in categories['names'][:50]:
        output_lines.append(f"Bank {s['bank']:2d} ${s['cpu']:04X}: {s['text']}")
    output_lines.append("")

    output_lines.append("=" * 80)
    output_lines.append("ALL STRINGS BY BANK")
    output_lines.append("=" * 80)

    for bank in sorted(by_bank.keys()):
        output_lines.append(f"\n--- BANK {bank} (ROM 0x{16 + bank*0x4000:05X}) ---")
        for s in by_bank[bank]:
            preview = s['text'][:60] + ('...' if len(s['text']) > 60 else '')
            output_lines.append(f"  ${s['cpu']:04X}: {preview}")

    # Print summary
    for line in output_lines[:50]:
        print(line)
    print("... (truncated)")

    # Save full output
    output_path = os.path.join(os.path.dirname(__file__), '..', 'assets', 'text',
                               'extracted_text.txt')
    os.makedirs(os.path.dirname(output_path), exist_ok=True)

    with open(output_path, 'w', encoding='utf-8') as f:
        f.write('\n'.join(output_lines))

    print(f"\nSaved to: {output_path}")

    # Also save as JSON for programmatic access
    json_path = os.path.join(os.path.dirname(__file__), '..', 'assets', 'text',
                             'strings.json')

    # Convert to JSON-serializable format
    json_strings = []
    for s in strings:
        json_strings.append({
            'rom_offset': s['rom_offset'],
            'rom_offset_hex': f"0x{s['rom_offset']:05X}",
            'bank': s['bank'],
            'cpu': s['cpu'],
            'cpu_hex': f"${s['cpu']:04X}",
            'length': s['length'],
            'text': s['text'],
        })

    with open(json_path, 'w', encoding='utf-8') as f:
        json.dump({
            'rom_name': 'Dragon Warrior IV (1992-10)(Enix)(US).nes',
            'total_strings': len(strings),
            'strings': json_strings
        }, f, indent=2, ensure_ascii=False)

    print(f"Saved JSON to: {json_path}")

if __name__ == '__main__':
    main()
