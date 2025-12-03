#!/usr/bin/env python3
"""
Dragon Warrior IV - Text Decoder with DTE Expansion
===================================================

Decodes text strings from ROM, expanding DTE (compressed) bytes.

DTE Table Location: Bank 22, CPU $B3A4, ROM 0x5B3B4
"""

import os
import sys

ROM_PATH = os.path.join(os.path.dirname(__file__), '..', 'roms',
                        'Dragon Warrior IV (1992-10)(Enix)(US).nes')

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


class TextDecoder:
    """Decodes Dragon Warrior IV text with DTE expansion."""

    def __init__(self, rom_path):
        with open(rom_path, 'rb') as f:
            self.rom = f.read()
        self._load_dte_table()

    def _load_dte_table(self):
        """Load the DTE dictionary table from ROM."""
        self.dte_table = {}
        for code in range(0x80, 0xFF):  # $80-$FE
            offset = DTE_TABLE_ROM_OFFSET + (code - 0x80) * 2
            char1 = self.rom[offset]
            char2 = self.rom[offset + 1]
            self.dte_table[code] = (char1, char2)

    def decode_char(self, byte):
        """Decode a single character byte to string."""
        if byte in CHAR_TABLE:
            return CHAR_TABLE[byte]
        elif byte >= 0x80 and byte < 0xFD:
            return f"[DTE:{byte:02X}]"
        elif byte == CTRL_LINE:
            return "\n"
        elif byte == CTRL_CTRL:
            return "[CTRL]"
        elif byte == CTRL_END:
            return "[END]"
        else:
            return f"[{byte:02X}]"

    def expand_dte(self, byte, max_depth=5):
        """
        Expand a DTE byte into characters.

        Args:
            byte: DTE code ($80-$FE)
            max_depth: Max recursion depth for nested DTE

        Returns:
            Decoded string
        """
        if max_depth <= 0:
            return f"[DTE:{byte:02X}]"

        if byte < 0x80 or byte >= 0xFD:
            return self.decode_char(byte)

        char1, char2 = self.dte_table.get(byte, (0, 0))

        result = ""
        for c in [char1, char2]:
            if c == 0:
                continue
            elif c >= 0x80 and c < 0xFD:
                # Recursive DTE
                result += self.expand_dte(c, max_depth - 1)
            else:
                result += self.decode_char(c)

        return result

    def decode_string(self, data, expand_dte=True):
        """
        Decode a byte sequence to text string.

        Args:
            data: Bytes to decode
            expand_dte: Whether to expand DTE codes

        Returns:
            Decoded string
        """
        result = []
        for byte in data:
            if byte == CTRL_END:
                result.append("[END]")
                break
            elif byte == CTRL_LINE:
                result.append("\n")
            elif byte == CTRL_CTRL:
                result.append("[CTRL]")
            elif byte >= 0x80 and expand_dte:
                result.append(self.expand_dte(byte))
            else:
                result.append(self.decode_char(byte))
        return ''.join(result)

    def decode_from_offset(self, rom_offset, max_len=256, expand_dte=True):
        """
        Decode text starting from a ROM offset.

        Args:
            rom_offset: File offset in ROM
            max_len: Maximum bytes to read
            expand_dte: Whether to expand DTE codes

        Returns:
            Decoded string
        """
        data = self.rom[rom_offset:rom_offset + max_len]
        return self.decode_string(data, expand_dte)

    def bank_to_offset(self, bank, addr):
        """Convert bank:addr to ROM file offset."""
        ines_header = 16
        if addr >= 0xC000:
            # Fixed bank (last bank)
            return ines_header + (31 * 0x4000) + (addr - 0xC000)
        else:
            # Switchable bank
            return ines_header + (bank * 0x4000) + (addr - 0x8000)

    def decode_from_bank_addr(self, bank, addr, max_len=256, expand_dte=True):
        """
        Decode text from a bank:address location.

        Args:
            bank: ROM bank number
            addr: CPU address ($8000-$BFFF)
            max_len: Maximum bytes to read
            expand_dte: Whether to expand DTE codes

        Returns:
            Decoded string
        """
        offset = self.bank_to_offset(bank, addr)
        return self.decode_from_offset(offset, max_len, expand_dte)


def main():
    decoder = TextDecoder(ROM_PATH)

    print("=" * 70)
    print(" DRAGON WARRIOR IV - TEXT DECODER WITH DTE EXPANSION")
    print("=" * 70)

    # Show DTE table
    print("\n[1] DTE TABLE ENTRIES")
    print("-" * 70)
    print("Code | Raw Bytes | Expanded | Full Expansion")
    print("-" * 70)

    for code in range(0x80, 0xA0):  # Show first 32 entries
        char1, char2 = decoder.dte_table.get(code, (0, 0))
        raw = f"${char1:02X} ${char2:02X}"
        c1 = decoder.decode_char(char1) if char1 < 0x80 else f"[{char1:02X}]"
        c2 = decoder.decode_char(char2) if char2 < 0x80 else f"[{char2:02X}]"
        expanded = decoder.expand_dte(code)
        print(f"${code:02X}   {raw:12s}   {c1}{c2:4s}   '{expanded}'")

    # Decode menu text
    print("\n[2] MENU TEXT (Bank 22, $B3B3)")
    print("-" * 70)
    text = decoder.decode_from_bank_addr(22, 0xB3B3, max_len=512)
    print(text[:500])

    # Try to decode from Bank 23 dialogue pointers
    print("\n[3] DIALOGUE FROM BANK 23 POINTERS")
    print("-" * 70)

    # Read pointer table at Bank 23 $8008
    ptr_table_offset = decoder.bank_to_offset(23, 0x8008)
    for i in range(5):
        lo = decoder.rom[ptr_table_offset + i*2]
        hi = decoder.rom[ptr_table_offset + i*2 + 1]
        ptr = (hi << 8) | lo
        if 0x8000 <= ptr <= 0xBFFF:
            print(f"\nPointer {i}: ${ptr:04X}")
            text = decoder.decode_from_bank_addr(23, ptr, max_len=128)
            # Show first 80 chars
            preview = text.replace('\n', ' ')[:80]
            print(f"  Text: {preview}")

    # Decode from Bank 17 (location names)
    print("\n[4] LOCATION NAMES (Bank 17)")
    print("-" * 70)

    # Search for text in bank 17
    bank17_start = decoder.bank_to_offset(17, 0x8000)
    for test_addr in [0xA000, 0xA100, 0xA200, 0xA300, 0xA400]:
        offset = decoder.bank_to_offset(17, test_addr)
        # Look for valid text
        chunk = decoder.rom[offset:offset + 64]
        # Check if it starts with valid chars
        if all(b < 0x50 or 0x65 <= b <= 0x78 or 0x80 <= b <= 0xFE or b == 0xFF for b in chunk[:8]):
            text = decoder.decode_from_bank_addr(17, test_addr, max_len=64)
            if len(text) > 3 and not text.startswith('['):
                print(f"${test_addr:04X}: {text[:60]}")

    # Decode from Bank 27 (chapter titles)
    print("\n[5] CHAPTER TITLES (Bank 27)")
    print("-" * 70)

    for test_addr in range(0xB000, 0xB400, 0x40):
        text = decoder.decode_from_bank_addr(27, test_addr, max_len=64)
        # Look for readable text
        readable = sum(1 for c in text if c.isalnum() or c in ' .,!?-')
        if readable > len(text) * 0.3 and len(text) > 5:
            preview = text.replace('\n', ' ')[:60]
            print(f"${test_addr:04X}: {preview}")


if __name__ == '__main__':
    main()
