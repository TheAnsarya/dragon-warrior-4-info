#!/usr/bin/env python3
"""
Dragon Warrior IV - Complete Dialogue Extractor
===============================================

Extracts all dialogue text from the ROM using DTE decompression.

Banks analyzed:
- Bank 12: Dialogue pointers/text
- Bank 13: Dialogue pointers/text
- Bank 17: Location names ("the Tower", "the Stars", etc.)
- Bank 22: Menu text, text engine code
- Bank 23: Dialogue pointer table at $8008
- Bank 24: Dialogue text
- Bank 27: Chapter titles
"""

import os
import json

ROM_PATH = os.path.join(os.path.dirname(__file__), '..', 'roms',
                        'Dragon Warrior IV (1992-10)(Enix)(US).nes')

OUTPUT_DIR = os.path.join(os.path.dirname(__file__), '..', 'extracted')

# Character encoding table
CHAR_TABLE = {
    0x00: ' ',
    **{i: str(i-1) for i in range(0x01, 0x0B)},  # 0-9
    **{i: chr(ord('a') + i - 0x0B) for i in range(0x0B, 0x25)},  # a-z
    **{i: chr(ord('A') + i - 0x25) for i in range(0x25, 0x3F)},  # A-Z
    0x3F: "'", 0x40: '.', 0x41: ',', 0x42: '-', 0x43: '?', 0x44: '!',
    0x45: '(', 0x46: ')', 0x47: '/', 0x48: ':', 0x49: '*', 0x4A: '"',
    0x65: "'", 0x66: ".", 0x67: ",", 0x68: "~", 0x69: "?",
    0x6A: "!", 0x6B: "(", 0x6C: ")", 0x6D: "/", 0x6E: ":",
    0x6F: "*", 0x70: '"', 0x71: "-", 0x78: ".",
}

# Control codes
CTRL_END = 0xFF
CTRL_LINE = 0xFD
CTRL_CTRL = 0xFE

# DTE table location
DTE_TABLE_ROM_OFFSET = 0x5B3B4


class DialogueExtractor:
    """Extracts dialogue from Dragon Warrior IV ROM."""

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
        """Decode a single character byte to string."""
        if byte in CHAR_TABLE:
            return CHAR_TABLE[byte]
        elif byte >= 0x80 and byte < 0xFD:
            return f"[{byte:02X}]"
        elif byte == CTRL_LINE:
            return "\n"
        elif byte == CTRL_CTRL:
            return "[CTRL]"
        elif byte == CTRL_END:
            return ""
        else:
            return f"[{byte:02X}]"

    def expand_dte(self, byte, max_depth=5):
        """Expand a DTE byte into characters."""
        if max_depth <= 0:
            return f"[{byte:02X}]"

        if byte < 0x80 or byte >= 0xFD:
            return self.decode_char(byte)

        char1, char2 = self.dte_table.get(byte, (0, 0))

        result = ""
        for c in [char1, char2]:
            if c == 0:
                continue
            elif c >= 0x80 and c < 0xFD:
                result += self.expand_dte(c, max_depth - 1)
            else:
                result += self.decode_char(c)

        return result

    def decode_string(self, data):
        """Decode a byte sequence to text string with DTE expansion."""
        result = []
        for byte in data:
            if byte == CTRL_END:
                break
            elif byte == CTRL_LINE:
                result.append("\n")
            elif byte == CTRL_CTRL:
                result.append(" ")  # Treat as space for readability
            elif byte >= 0x80:
                result.append(self.expand_dte(byte))
            else:
                result.append(self.decode_char(byte))
        return ''.join(result)

    def bank_to_offset(self, bank, addr):
        """Convert bank:addr to ROM file offset."""
        ines_header = 16
        if addr >= 0xC000:
            return ines_header + (31 * 0x4000) + (addr - 0xC000)
        else:
            return ines_header + (bank * 0x4000) + (addr - 0x8000)

    def extract_string_at(self, bank, addr, max_len=512):
        """Extract a single string at bank:addr."""
        offset = self.bank_to_offset(bank, addr)
        if offset >= len(self.rom):
            return None

        end = offset
        while end < len(self.rom) and end - offset < max_len:
            if self.rom[end] == CTRL_END:
                end += 1
                break
            end += 1

        data = self.rom[offset:end]
        return self.decode_string(data)

    def extract_pointer_table(self, bank, ptr_addr, count):
        """Extract strings from a pointer table."""
        strings = []
        ptr_offset = self.bank_to_offset(bank, ptr_addr)

        for i in range(count):
            lo = self.rom[ptr_offset + i*2]
            hi = self.rom[ptr_offset + i*2 + 1]
            ptr = (hi << 8) | lo

            if 0x8000 <= ptr <= 0xBFFF:
                text = self.extract_string_at(bank, ptr)
                if text:
                    strings.append({
                        'index': i,
                        'pointer': f"${ptr:04X}",
                        'text': text.strip()
                    })

        return strings

    def scan_for_strings(self, bank, min_len=5):
        """Scan a bank for readable strings terminated by $FF."""
        strings = []
        bank_start = self.bank_to_offset(bank, 0x8000)
        bank_data = self.rom[bank_start:bank_start + 0x4000]

        i = 0
        while i < len(bank_data):
            # Look for $FF terminator
            if bank_data[i] == CTRL_END:
                # Work backwards to find start of string
                start = i - 1
                readable_count = 0

                while start >= 0:
                    b = bank_data[start]
                    if b == CTRL_END:
                        start += 1
                        break
                    # Check if character is valid text
                    if b in CHAR_TABLE or (0x80 <= b < 0xFD) or b == CTRL_LINE:
                        readable_count += 1
                    elif b == CTRL_CTRL:
                        pass  # Skip control codes
                    else:
                        start += 1
                        break
                    start -= 1

                if start < 0:
                    start = 0

                length = i - start
                if length >= min_len and readable_count >= length * 0.5:
                    text = self.decode_string(bank_data[start:i+1])
                    # Filter out garbage
                    alpha_count = sum(1 for c in text if c.isalpha())
                    if alpha_count >= len(text) * 0.3:
                        strings.append({
                            'address': f"${0x8000 + start:04X}",
                            'text': text.strip()
                        })

                i += 1
            else:
                i += 1

        return strings

    def extract_menu_text(self):
        """Extract menu/UI text from Bank 22."""
        # Menu text starts at $B3B3
        menu_offset = self.bank_to_offset(22, 0xB3B3)
        menu_data = self.rom[menu_offset:menu_offset + 0x200]

        # Split by $8B separator
        items = []
        current = []
        for byte in menu_data:
            if byte == 0x8B:  # Menu separator
                if current:
                    text = self.decode_string(current)
                    if text.strip():
                        items.append(text.strip())
                    current = []
            elif byte == CTRL_END:
                if current:
                    text = self.decode_string(current)
                    if text.strip():
                        items.append(text.strip())
                break
            else:
                current.append(byte)

        return items

    def extract_location_names(self):
        """Extract location names from Bank 17."""
        # Known location text around $BE3B
        offset = self.bank_to_offset(17, 0xBE00)
        data = self.rom[offset:offset + 0x200]

        locations = []
        i = 0
        while i < len(data) - 1:
            # Look for "the " pattern
            if i + 4 < len(data):
                chunk = data[i:i+4]
                # "the " = $1E $12 $0F $00
                if chunk == bytes([0x1E, 0x12, 0x0F, 0x00]):
                    # Found "the ", extract until terminator
                    start = i
                    end = i + 4
                    while end < len(data) and data[end] != 0x00 and data[end] < 0xF0:
                        end += 1
                    if end > start:
                        text = self.decode_string(data[start:end])
                        if text:
                            locations.append({
                                'address': f"${0xBE00 + start:04X}",
                                'text': text
                            })
                    i = end
                    continue
            i += 1

        return locations


def main():
    os.makedirs(OUTPUT_DIR, exist_ok=True)

    extractor = DialogueExtractor(ROM_PATH)

    print("=" * 70)
    print(" DRAGON WARRIOR IV - COMPLETE DIALOGUE EXTRACTION")
    print("=" * 70)

    all_text = {}

    # 1. Menu text
    print("\n[1] Extracting menu text (Bank 22)...")
    menu_items = extractor.extract_menu_text()
    all_text['menu'] = menu_items
    print(f"    Found {len(menu_items)} menu items")
    for item in menu_items[:10]:
        print(f"      - {item}")

    # 2. Location names
    print("\n[2] Extracting location names (Bank 17)...")
    locations = extractor.extract_location_names()
    all_text['locations'] = locations
    print(f"    Found {len(locations)} locations")
    for loc in locations[:10]:
        print(f"      - {loc['text']}")

    # 3. Scan dialogue banks
    print("\n[3] Scanning dialogue banks for strings...")

    dialogue_banks = [12, 13, 23, 24]
    for bank in dialogue_banks:
        print(f"\n    Bank {bank}:")
        strings = extractor.scan_for_strings(bank, min_len=8)
        # Filter to unique meaningful strings
        unique_strings = []
        seen = set()
        for s in strings:
            text = s['text'][:50]  # First 50 chars for dedup
            if text not in seen and len(s['text']) > 5:
                seen.add(text)
                unique_strings.append(s)

        all_text[f'bank_{bank}'] = unique_strings
        print(f"      Found {len(unique_strings)} unique strings")

        # Show samples
        for s in unique_strings[:5]:
            preview = s['text'].replace('\n', ' ')[:60]
            print(f"        {s['address']}: {preview}")

    # 4. Bank 27 chapter text
    print("\n[4] Scanning Bank 27 (chapters)...")
    chapter_strings = extractor.scan_for_strings(27, min_len=5)
    all_text['chapters'] = chapter_strings
    print(f"    Found {len(chapter_strings)} strings")

    # 5. Save to JSON
    output_file = os.path.join(OUTPUT_DIR, 'dialogue.json')
    with open(output_file, 'w', encoding='utf-8') as f:
        json.dump(all_text, f, indent=2, ensure_ascii=False)
    print(f"\n[5] Saved to {output_file}")

    # 6. Save as plain text
    txt_file = os.path.join(OUTPUT_DIR, 'dialogue.txt')
    with open(txt_file, 'w', encoding='utf-8') as f:
        f.write("DRAGON WARRIOR IV - EXTRACTED DIALOGUE\n")
        f.write("=" * 70 + "\n\n")

        f.write("MENU TEXT\n")
        f.write("-" * 70 + "\n")
        for item in menu_items:
            f.write(f"  {item}\n")

        f.write("\nLOCATION NAMES\n")
        f.write("-" * 70 + "\n")
        for loc in locations:
            f.write(f"  {loc['address']}: {loc['text']}\n")

        for bank in dialogue_banks:
            f.write(f"\nBANK {bank} DIALOGUE\n")
            f.write("-" * 70 + "\n")
            for s in all_text.get(f'bank_{bank}', []):
                f.write(f"  {s['address']}:\n")
                for line in s['text'].split('\n'):
                    f.write(f"    {line}\n")
                f.write("\n")

    print(f"    Saved to {txt_file}")

    # Summary
    total = sum(len(v) if isinstance(v, list) else 0 for v in all_text.values())
    print(f"\n[SUMMARY] Extracted {total} text strings total")


if __name__ == '__main__':
    main()
