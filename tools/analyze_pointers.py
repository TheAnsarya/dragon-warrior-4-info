#!/usr/bin/env python3
"""
Dragon Warrior IV - Dialogue Pointer Table Analyzer
====================================================

Analyzes the dialogue pointer tables in Banks 12, 13, 23, 24 to extract
complete dialogue strings.

The game uses a multi-level pointer system:
1. Bank 23 $8008 contains a table of pointers to dialogue blocks
2. Each dialogue block contains actual text with DTE compression
"""

import os
import struct

ROM_PATH = os.path.join(os.path.dirname(__file__), '..', 'roms',
                        'Dragon Warrior IV (1992-10)(Enix)(US).nes')

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

DTE_TABLE_ROM_OFFSET = 0x5B3B4


class PointerAnalyzer:
    """Analyzes dialogue pointer tables."""

    def __init__(self, rom_path):
        with open(rom_path, 'rb') as f:
            self.rom = f.read()
        self._load_dte_table()

    def _load_dte_table(self):
        """Load the DTE dictionary table from ROM."""
        self.dte_table = {}
        for code in range(0x80, 0xFF):
            offset = DTE_TABLE_ROM_OFFSET + (code - 0x80) * 2
            char1 = self.rom[offset]
            char2 = self.rom[offset + 1]
            self.dte_table[code] = (char1, char2)

    def decode_char(self, byte):
        """Decode a single byte."""
        if byte in CHAR_TABLE:
            return CHAR_TABLE[byte]
        return f'[{byte:02X}]'

    def expand_dte(self, byte, depth=3):
        """Expand DTE byte."""
        if depth <= 0 or byte < 0x80 or byte >= 0xFD:
            return self.decode_char(byte)

        c1, c2 = self.dte_table.get(byte, (0, 0))
        result = ''
        for c in [c1, c2]:
            if c == 0:
                continue
            elif c >= 0x80 and c < 0xFD:
                result += self.expand_dte(c, depth - 1)
            else:
                result += self.decode_char(c)
        return result

    def decode_string(self, data, max_len=256):
        """Decode a byte sequence."""
        result = []
        for i, byte in enumerate(data):
            if i >= max_len:
                break
            if byte == 0xFF:
                break
            elif byte == 0xFD:
                result.append('\n')
            elif byte == 0xFE:
                result.append(' ')
            elif byte >= 0x80:
                result.append(self.expand_dte(byte))
            else:
                result.append(self.decode_char(byte))
        return ''.join(result)

    def bank_to_offset(self, bank, addr):
        """Convert bank:addr to ROM offset."""
        if addr >= 0xC000:
            return 16 + (31 * 0x4000) + (addr - 0xC000)
        return 16 + (bank * 0x4000) + (addr - 0x8000)

    def read_pointer(self, offset):
        """Read a 16-bit little-endian pointer."""
        return self.rom[offset] | (self.rom[offset + 1] << 8)

    def analyze_pointer_table(self, bank, start_addr, count=64):
        """Analyze a pointer table."""
        results = []
        offset = self.bank_to_offset(bank, start_addr)

        for i in range(count):
            ptr = self.read_pointer(offset + i * 2)
            if 0x8000 <= ptr <= 0xBFFF:
                text_offset = self.bank_to_offset(bank, ptr)
                if text_offset < len(self.rom):
                    data = self.rom[text_offset:text_offset + 128]
                    text = self.decode_string(data)
                    # Only include if it looks like text
                    alpha = sum(1 for c in text if c.isalpha())
                    if alpha > len(text) * 0.2 and len(text) > 3:
                        results.append({
                            'index': i,
                            'pointer': ptr,
                            'text': text.strip()
                        })

        return results

    def scan_for_pointer_tables(self, bank):
        """Find potential pointer tables in a bank."""
        bank_start = self.bank_to_offset(bank, 0x8000)
        bank_data = self.rom[bank_start:bank_start + 0x4000]

        potential_tables = []

        # Look for sequences of valid pointers
        for i in range(0, len(bank_data) - 16, 2):
            consecutive_valid = 0
            for j in range(8):
                ptr = bank_data[i + j*2] | (bank_data[i + j*2 + 1] << 8)
                if 0x8000 <= ptr <= 0xBFFF:
                    consecutive_valid += 1
                else:
                    break

            if consecutive_valid >= 4:
                addr = 0x8000 + i
                potential_tables.append((addr, consecutive_valid))

        return potential_tables


def main():
    analyzer = PointerAnalyzer(ROM_PATH)

    print("=" * 70)
    print(" DRAGON WARRIOR IV - POINTER TABLE ANALYSIS")
    print("=" * 70)

    # Analyze known pointer tables
    known_tables = [
        (23, 0x8008, "Bank 23 dialogue pointers"),
        (23, 0x82E0, "Bank 23 casino text"),
    ]

    for bank, addr, desc in known_tables:
        print(f"\n[{desc}] Bank {bank} ${addr:04X}")
        print("-" * 70)

        results = analyzer.analyze_pointer_table(bank, addr, count=32)
        for r in results[:10]:
            preview = r['text'].replace('\n', ' ')[:50]
            print(f"  [{r['index']:2d}] ${r['pointer']:04X}: {preview}")

        if len(results) > 10:
            print(f"  ... and {len(results) - 10} more entries")

    # Scan for pointer tables in dialogue banks
    print("\n" + "=" * 70)
    print(" SCANNING FOR POINTER TABLES")
    print("=" * 70)

    for bank in [12, 13, 23, 24]:
        print(f"\nBank {bank}:")
        tables = analyzer.scan_for_pointer_tables(bank)

        # Show top tables by consecutive pointer count
        sorted_tables = sorted(tables, key=lambda x: -x[1])[:5]
        for addr, count in sorted_tables:
            print(f"  ${addr:04X}: {count} consecutive valid pointers")

            # Try to extract text from this table
            results = analyzer.analyze_pointer_table(bank, addr, count=8)
            for r in results[:3]:
                preview = r['text'].replace('\n', ' ')[:40]
                print(f"    -> {preview}")

    # Search for readable strings directly
    print("\n" + "=" * 70)
    print(" DIRECT STRING SEARCH")
    print("=" * 70)

    for bank in [12, 13, 23, 24]:
        print(f"\nBank {bank} - scanning for $FF-terminated strings:")

        bank_start = analyzer.bank_to_offset(bank, 0x8000)
        bank_data = analyzer.rom[bank_start:bank_start + 0x4000]

        strings_found = []
        i = 0
        while i < len(bank_data):
            if bank_data[i] == 0xFF:
                # Found terminator, look backwards for string start
                start = i - 1
                while start >= 0 and bank_data[start] != 0xFF:
                    start -= 1
                start += 1

                if i - start >= 5:
                    data = bank_data[start:i]
                    text = analyzer.decode_string(data)
                    alpha = sum(1 for c in text if c.isalpha())
                    if alpha > len(text) * 0.3:
                        strings_found.append({
                            'addr': 0x8000 + start,
                            'text': text.strip()
                        })
            i += 1

        # Show unique strings
        seen = set()
        for s in strings_found:
            if s['text'][:30] not in seen and len(s['text']) > 5:
                seen.add(s['text'][:30])
                preview = s['text'].replace('\n', ' ')[:50]
                print(f"  ${s['addr']:04X}: {preview}")
                if len(seen) >= 10:
                    break

        if len(strings_found) > 10:
            print(f"  ... {len(strings_found)} total strings found")


if __name__ == '__main__':
    main()
