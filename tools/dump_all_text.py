#!/usr/bin/env python3
"""
Dragon Warrior IV - Complete Text Dumper
=========================================

Extracts ALL readable text from the ROM and outputs organized dump files.
Uses DTE decompression for compressed text.

Output files:
- extracted/all_text.txt - Human-readable dump
- extracted/text_by_bank.json - Organized by bank
- extracted/text_locations.csv - Address/text mapping
"""

import os
import json
import csv

ROM_PATH = os.path.join(os.path.dirname(__file__), '..', 'roms',
                        'Dragon Warrior IV (1992-10)(Enix)(US).nes')
OUTPUT_DIR = os.path.join(os.path.dirname(__file__), '..', 'extracted')

# Character encoding
CHAR_TABLE = {
    0x00: ' ',
    **{i: str(i-1) for i in range(0x01, 0x0B)},
    **{i: chr(ord('a') + i - 0x0B) for i in range(0x0B, 0x25)},
    **{i: chr(ord('A') + i - 0x25) for i in range(0x25, 0x3F)},
    0x3F: "'", 0x40: '.', 0x41: ',', 0x42: '-', 0x43: '?', 0x44: '!',
    0x45: '(', 0x46: ')', 0x47: '/', 0x48: ':', 0x49: '*', 0x4A: '"',
    0x65: "'", 0x66: ".", 0x67: ",", 0x68: "~", 0x69: "?",
    0x6A: "!", 0x6B: "(", 0x6C: ")", 0x6D: "/", 0x6E: ":",
    0x6F: "*", 0x70: '"', 0x71: "-", 0x78: ".",
}

DTE_TABLE_ROM = 0x5B3B4


class TextDumper:
    """Dumps all text from ROM."""

    def __init__(self, rom_path):
        with open(rom_path, 'rb') as f:
            self.rom = f.read()
        self._load_dte()

    def _load_dte(self):
        """Load DTE table."""
        self.dte = {}
        for code in range(0x80, 0xFF):
            offset = DTE_TABLE_ROM + (code - 0x80) * 2
            self.dte[code] = (self.rom[offset], self.rom[offset + 1])

    def decode_char(self, b):
        """Decode single byte."""
        if b in CHAR_TABLE:
            return CHAR_TABLE[b]
        return None

    def expand_dte(self, b, depth=3):
        """Expand DTE code."""
        if depth <= 0 or b < 0x80 or b >= 0xFD:
            return self.decode_char(b)

        c1, c2 = self.dte.get(b, (0, 0))
        result = ''
        for c in [c1, c2]:
            if c == 0:
                continue
            if c >= 0x80 and c < 0xFD:
                exp = self.expand_dte(c, depth - 1)
                if exp:
                    result += exp
            else:
                ch = self.decode_char(c)
                if ch:
                    result += ch
        return result if result else None

    def decode_string(self, data):
        """Decode byte sequence."""
        result = []
        for b in data:
            if b == 0xFF:
                break
            if b == 0xFD:
                result.append('\n')
            elif b == 0xFE:
                result.append(' ')
            elif b >= 0x80:
                exp = self.expand_dte(b)
                if exp:
                    result.append(exp)
            else:
                ch = self.decode_char(b)
                if ch:
                    result.append(ch)
        return ''.join(result)

    def find_strings(self, bank, min_len=4):
        """Find all $FF-terminated strings in bank."""
        offset = 16 + bank * 0x4000
        data = self.rom[offset:offset + 0x4000]

        strings = []
        i = 0

        while i < len(data):
            if data[i] == 0xFF:
                # Found terminator, scan backwards
                start = i - 1
                while start >= 0 and data[start] != 0xFF:
                    start -= 1
                start += 1

                if i - start >= min_len:
                    text = self.decode_string(data[start:i])
                    # Quality check
                    if text:
                        alpha = sum(1 for c in text if c.isalnum())
                        if alpha >= len(text) * 0.3:
                            strings.append({
                                'bank': bank,
                                'addr': f'${0x8000 + start:04X}',
                                'rom_offset': f'0x{offset + start:06X}',
                                'length': i - start,
                                'text': text.strip()
                            })
            i += 1

        return strings

    def dump_all(self):
        """Dump all text from ROM."""
        all_strings = []

        for bank in range(32):
            strings = self.find_strings(bank)
            all_strings.extend(strings)

        return all_strings


def main():
    os.makedirs(OUTPUT_DIR, exist_ok=True)

    dumper = TextDumper(ROM_PATH)

    print("=" * 70)
    print(" DRAGON WARRIOR IV - COMPLETE TEXT DUMP")
    print("=" * 70)

    # Get all strings
    print("\nScanning all banks for text...")
    all_strings = dumper.dump_all()

    # Filter unique strings
    seen = set()
    unique_strings = []
    for s in all_strings:
        text_key = s['text'][:50]
        if text_key not in seen and len(s['text']) > 3:
            seen.add(text_key)
            unique_strings.append(s)

    print(f"Found {len(all_strings)} total strings")
    print(f"Found {len(unique_strings)} unique strings")

    # Organize by bank
    by_bank = {}
    for s in unique_strings:
        bank = s['bank']
        if bank not in by_bank:
            by_bank[bank] = []
        by_bank[bank].append(s)

    # Save JSON
    json_path = os.path.join(OUTPUT_DIR, 'text_by_bank.json')
    with open(json_path, 'w', encoding='utf-8') as f:
        json.dump(by_bank, f, indent=2, ensure_ascii=False)
    print(f"\nSaved: {json_path}")

    # Save CSV
    csv_path = os.path.join(OUTPUT_DIR, 'text_locations.csv')
    with open(csv_path, 'w', encoding='utf-8', newline='') as f:
        writer = csv.writer(f)
        writer.writerow(['Bank', 'Address', 'ROM Offset', 'Length', 'Text'])
        for s in unique_strings:
            text = s['text'].replace('\n', ' ')[:100]
            writer.writerow([s['bank'], s['addr'], s['rom_offset'],
                            s['length'], text])
    print(f"Saved: {csv_path}")

    # Save text dump
    txt_path = os.path.join(OUTPUT_DIR, 'all_text.txt')
    with open(txt_path, 'w', encoding='utf-8') as f:
        f.write("DRAGON WARRIOR IV (NES) - COMPLETE TEXT DUMP\n")
        f.write("=" * 70 + "\n\n")

        for bank in sorted(by_bank.keys()):
            strings = by_bank[bank]
            if strings:
                f.write(f"\n{'='*70}\n")
                f.write(f"BANK {bank:2d} ({len(strings)} strings)\n")
                f.write(f"{'='*70}\n\n")

                for s in strings:
                    f.write(f"{s['addr']}: {s['text']}\n\n")

    print(f"Saved: {txt_path}")

    # Summary
    print("\n" + "=" * 70)
    print(" SUMMARY BY BANK")
    print("=" * 70)
    for bank in sorted(by_bank.keys()):
        count = len(by_bank[bank])
        if count > 0:
            note = ""
            if bank == 17:
                note = " (locations)"
            elif bank == 22:
                note = " (menus)"
            elif bank == 23:
                note = " (casino)"
            elif bank == 27:
                note = " (chapters)"
            print(f"  Bank {bank:2d}: {count:4d} strings{note}")

    # Show some highlights
    print("\n" + "=" * 70)
    print(" SAMPLE EXTRACTED TEXT")
    print("=" * 70)

    highlights = [
        ("Chapter Titles", 27),
        ("Location Names", 17),
        ("Menu Text", 22),
        ("Casino", 23),
    ]

    for title, bank in highlights:
        if bank in by_bank and by_bank[bank]:
            print(f"\n{title} (Bank {bank}):")
            for s in by_bank[bank][:5]:
                preview = s['text'].replace('\n', ' ')[:50]
                print(f"  {s['addr']}: {preview}")


if __name__ == '__main__':
    main()
