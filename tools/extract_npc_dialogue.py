#!/usr/bin/env python3
"""
Dragon Warrior IV - NPC Dialogue Extractor
==========================================

Extracts NPC dialogue by following pointer tables and properly decoding
text with DTE expansion.

Focus Areas:
- Bank 12: Dialogue data
- Bank 13: Dialogue data
- Bank 23: Casino/dialogue
- Bank 24: More dialogue
"""

import os
import json
import re

ROM_PATH = os.path.join(os.path.dirname(__file__), '..', 'roms',
                        'Dragon Warrior IV (1992-10)(Enix)(US).nes')
OUTPUT_DIR = os.path.join(os.path.dirname(__file__), '..', 'extracted')

# Complete character encoding table
CHAR_TABLE = {
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
    0x3F: "'", 0x40: '.', 0x41: ',', 0x42: '-', 0x43: '?',
    0x44: '!', 0x45: '(', 0x46: ')', 0x47: '/', 0x48: ':',
    0x49: '*', 0x4A: '"',
    # Alternate punctuation (variant encoding)
    0x65: "'", 0x66: ".", 0x67: ",", 0x68: "~", 0x69: "?",
    0x6A: "!", 0x6B: "(", 0x6C: ")", 0x6D: "/", 0x6E: ":",
    0x6F: "*", 0x70: '"', 0x71: "-", 0x78: ".",
}

# DTE table location
DTE_TABLE_ROM = 0x5B3B4


class DialogueExtractor:
    """Extracts and decodes NPC dialogue."""

    def __init__(self, rom_path):
        with open(rom_path, 'rb') as f:
            self.rom = f.read()
        self._load_dte()

    def _load_dte(self):
        """Load DTE dictionary table."""
        self.dte = {}
        for code in range(0x80, 0xFF):
            offset = DTE_TABLE_ROM + (code - 0x80) * 2
            self.dte[code] = (self.rom[offset], self.rom[offset + 1])

    def bank_offset(self, bank, addr=0x8000):
        """Convert bank:addr to ROM offset."""
        return 16 + bank * 0x4000 + (addr - 0x8000)

    def decode_char(self, b):
        """Decode single byte to character."""
        if b in CHAR_TABLE:
            return CHAR_TABLE[b]
        return None

    def expand_dte(self, code, depth=10):
        """Recursively expand DTE code."""
        if depth <= 0:
            return f"<{code:02X}>"

        if code < 0x80 or code >= 0xFD:
            return self.decode_char(code) or f"<{code:02X}>"

        c1, c2 = self.dte.get(code, (0, 0))
        result = ""

        for c in [c1, c2]:
            if c == 0:
                continue
            if c >= 0x80 and c < 0xFD:
                result += self.expand_dte(c, depth - 1)
            elif c in CHAR_TABLE:
                result += CHAR_TABLE[c]
            # Silently skip unknown bytes in DTE expansion

        return result

    def decode_bytes(self, data, raw_mode=False):
        """
        Decode byte sequence to string.

        Args:
            data: Bytes to decode
            raw_mode: If True, show hex codes for unknowns

        Returns:
            Decoded string and end position
        """
        result = []
        pos = 0

        while pos < len(data):
            b = data[pos]

            if b == 0xFF:  # END
                break
            elif b == 0xFD:  # LINE
                result.append('\n')
            elif b == 0xFE:  # CTRL - skip next byte (positioning)
                if pos + 1 < len(data):
                    pos += 1
            elif b >= 0x80:  # DTE
                expanded = self.expand_dte(b)
                result.append(expanded)
            elif b in CHAR_TABLE:
                result.append(CHAR_TABLE[b])
            elif raw_mode:
                result.append(f"[{b:02X}]")
            # Skip other bytes

            pos += 1

        return ''.join(result), pos

    def find_pointer_tables(self, bank):
        """Find potential pointer tables in a bank."""
        offset = self.bank_offset(bank)
        data = self.rom[offset:offset + 0x4000]

        tables = []

        # Look for sequences of valid pointers
        i = 0
        while i < len(data) - 8:
            valid_ptrs = 0
            ptr_addrs = []

            for j in range(8):  # Check 8 consecutive words
                lo = data[i + j*2]
                hi = data[i + j*2 + 1]
                ptr = (hi << 8) | lo

                # Valid pointer in bank range?
                if 0x8000 <= ptr < 0xC000:
                    valid_ptrs += 1
                    ptr_addrs.append(ptr)
                else:
                    break

            if valid_ptrs >= 4:  # Found at least 4 consecutive valid pointers
                tables.append({
                    'bank_offset': i,
                    'cpu_addr': 0x8000 + i,
                    'count': valid_ptrs,
                    'pointers': ptr_addrs
                })
                i += valid_ptrs * 2
            else:
                i += 1

        return tables

    def extract_strings_from_pointers(self, bank, ptr_table_addr, count):
        """Extract strings pointed to by a pointer table."""
        offset = self.bank_offset(bank, ptr_table_addr)
        strings = []

        for i in range(count):
            lo = self.rom[offset + i*2]
            hi = self.rom[offset + i*2 + 1]
            ptr = (hi << 8) | lo

            if 0x8000 <= ptr < 0xC000:
                text_offset = self.bank_offset(bank, ptr)
                text_data = self.rom[text_offset:text_offset + 256]
                text, length = self.decode_bytes(text_data)

                if len(text.strip()) > 0:
                    strings.append({
                        'index': i,
                        'pointer': f"${ptr:04X}",
                        'text': text.strip()
                    })

        return strings

    def scan_bank_for_dialogue(self, bank, min_len=8):
        """Scan a bank for readable dialogue strings."""
        offset = self.bank_offset(bank)
        data = self.rom[offset:offset + 0x4000]

        dialogues = []
        i = 0

        while i < len(data):
            # Look for $FF terminators
            if data[i] == 0xFF:
                # Scan backwards to find start
                start = i - 1
                while start >= 0 and data[start] != 0xFF:
                    start -= 1
                start += 1

                length = i - start
                if length >= min_len:
                    segment = data[start:i]
                    text, _ = self.decode_bytes(segment)

                    # Quality check - mostly alphabetic
                    alpha = sum(1 for c in text if c.isalpha())
                    if alpha >= len(text) * 0.5 and len(text) >= min_len:
                        dialogues.append({
                            'addr': f"${0x8000 + start:04X}",
                            'rom_offset': f"0x{offset + start:06X}",
                            'length': length,
                            'text': text.strip()
                        })
            i += 1

        return dialogues

    def extract_all_dialogue(self):
        """Extract dialogue from all dialogue-heavy banks."""
        all_dialogue = {}

        dialogue_banks = [12, 13, 23, 24]

        for bank in dialogue_banks:
            print(f"Scanning Bank {bank}...")

            # Find pointer tables
            ptr_tables = self.find_pointer_tables(bank)

            bank_data = {
                'pointer_tables': [],
                'strings': []
            }

            # Extract from pointer tables
            for table in ptr_tables[:5]:  # Top 5 tables
                strings = self.extract_strings_from_pointers(
                    bank, table['cpu_addr'], min(table['count'], 32)
                )
                if strings:
                    bank_data['pointer_tables'].append({
                        'address': f"${table['cpu_addr']:04X}",
                        'count': len(strings),
                        'strings': strings
                    })

            # Also scan for FF-terminated strings
            strings = self.scan_bank_for_dialogue(bank)
            bank_data['strings'] = strings

            all_dialogue[f'bank_{bank}'] = bank_data

            print(f"  Found {len(ptr_tables)} pointer tables")
            print(f"  Found {len(strings)} dialogue strings")

        return all_dialogue


def main():
    os.makedirs(OUTPUT_DIR, exist_ok=True)

    extractor = DialogueExtractor(ROM_PATH)

    print("=" * 70)
    print(" DRAGON WARRIOR IV - NPC DIALOGUE EXTRACTION")
    print("=" * 70)

    # Extract all dialogue
    dialogue = extractor.extract_all_dialogue()

    # Save to JSON
    json_path = os.path.join(OUTPUT_DIR, 'npc_dialogue.json')
    with open(json_path, 'w', encoding='utf-8') as f:
        json.dump(dialogue, f, indent=2, ensure_ascii=False)
    print(f"\nSaved: {json_path}")

    # Create readable text dump
    txt_path = os.path.join(OUTPUT_DIR, 'npc_dialogue.txt')
    with open(txt_path, 'w', encoding='utf-8') as f:
        f.write("DRAGON WARRIOR IV - NPC DIALOGUE DUMP\n")
        f.write("=" * 70 + "\n\n")

        for bank_name, bank_data in dialogue.items():
            f.write(f"\n{bank_name.upper()}\n")
            f.write("-" * 70 + "\n")

            # Pointer table strings
            for table in bank_data.get('pointer_tables', []):
                f.write(f"\nPointer Table at {table['address']}:\n")
                for s in table['strings']:
                    f.write(f"  [{s['index']:3d}] {s['pointer']}: {s['text']}\n")

            # Direct strings
            f.write(f"\nDirect Strings:\n")
            for s in bank_data.get('strings', [])[:50]:  # First 50
                text_preview = s['text'][:60].replace('\n', ' ')
                f.write(f"  {s['addr']}: {text_preview}\n")

    print(f"Saved: {txt_path}")

    # Summary
    print("\n" + "=" * 70)
    print(" SUMMARY")
    print("=" * 70)

    total_strings = 0
    for bank_name, bank_data in dialogue.items():
        bank_count = len(bank_data.get('strings', []))
        ptr_count = sum(len(t.get('strings', [])) for t in bank_data.get('pointer_tables', []))
        total_strings += bank_count + ptr_count
        print(f"  {bank_name}: {bank_count} strings, {ptr_count} from pointers")

    print(f"\n  Total: {total_strings} dialogue strings")

    # Show some sample dialogue
    print("\n" + "=" * 70)
    print(" SAMPLE DIALOGUE")
    print("=" * 70)

    samples_shown = 0
    for bank_name, bank_data in dialogue.items():
        for s in bank_data.get('strings', []):
            text = s['text']
            # Look for interesting dialogue (questions, statements)
            if ('?' in text or '!' in text or 'you' in text.lower() or
                'welcome' in text.lower() or 'hero' in text.lower()):
                print(f"\n{bank_name} {s['addr']}:")
                print(f"  {text}")
                samples_shown += 1
                if samples_shown >= 10:
                    break
        if samples_shown >= 10:
            break


if __name__ == '__main__':
    main()
