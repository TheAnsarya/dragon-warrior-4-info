#!/usr/bin/env python3
"""
Dragon Warrior IV - ROM Text Browser
=====================================

Interactive browser for viewing ROM contents with text decoding.
Shows hex and decoded text side by side.
"""

import os
import sys

ROM_PATH = os.path.join(os.path.dirname(__file__), '..', 'roms',
                        'Dragon Warrior IV (1992-10)(Enix)(US).nes')

CHAR_TABLE = {
    0x00: ' ',
    **{i: str(i-1) for i in range(0x01, 0x0B)},
    **{i: chr(ord('a') + i - 0x0B) for i in range(0x0B, 0x25)},
    **{i: chr(ord('A') + i - 0x25) for i in range(0x25, 0x3F)},
    0x3F: "'", 0x40: '.', 0x41: ',', 0x42: '-', 0x43: '?', 0x44: '!',
    0x45: '(', 0x46: ')', 0x47: '/', 0x48: ':', 0x49: '*', 0x4A: '"',
}

DTE_TABLE_ROM = 0x5B3B4


class ROMBrowser:
    """Browse ROM with text decoding."""

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

    def expand_dte(self, code, depth=5):
        """Expand DTE code."""
        if depth <= 0 or code < 0x80 or code >= 0xFD:
            return CHAR_TABLE.get(code, '.')
        c1, c2 = self.dte.get(code, (0, 0))
        result = ''
        for c in [c1, c2]:
            if c == 0:
                continue
            if 0x80 <= c < 0xFD:
                result += self.expand_dte(c, depth - 1)
            elif c in CHAR_TABLE:
                result += CHAR_TABLE[c]
            else:
                result += '.'
        return result

    def decode_byte(self, b):
        """Decode single byte to display char."""
        if b in CHAR_TABLE:
            return CHAR_TABLE[b]
        elif b >= 0x80 and b < 0xFD:
            return self.expand_dte(b)
        elif b == 0xFF:
            return '|'
        elif b == 0xFD:
            return '_'
        elif b == 0xFE:
            return '^'
        else:
            return '.'

    def bank_offset(self, bank, addr=0x8000):
        """Convert bank:addr to ROM offset."""
        return 16 + bank * 0x4000 + (addr - 0x8000)

    def view_hex(self, offset, lines=16):
        """Display hex view with decoded text."""
        print(f"\nOffset: 0x{offset:06X}")
        print("-" * 75)

        for line in range(lines):
            addr = offset + line * 16
            if addr >= len(self.rom):
                break

            # Hex portion
            hex_str = ""
            decoded = ""

            for i in range(16):
                if addr + i < len(self.rom):
                    b = self.rom[addr + i]
                    hex_str += f"{b:02X} "
                    decoded += self.decode_byte(b)
                else:
                    hex_str += "   "

            # Format decoded to max 20 chars
            dec_display = decoded[:20].ljust(20)

            print(f"0x{addr:06X}  {hex_str} {dec_display}")

    def view_bank(self, bank, start_addr=0x8000, lines=20):
        """View section of a bank."""
        offset = self.bank_offset(bank, start_addr)
        print(f"\nBank {bank} starting at ${start_addr:04X}")
        self.view_hex(offset, lines)

    def search_text(self, text, max_results=10):
        """Search for decoded text."""
        results = []

        # Decode all banks
        for bank in range(32):
            bank_offset = 16 + bank * 0x4000
            decoded = ''
            offsets = []

            for i in range(0x4000):
                b = self.rom[bank_offset + i]
                dec = self.decode_byte(b)
                decoded += dec
                offsets.extend([i] * len(dec))

            # Search
            pos = 0
            while True:
                idx = decoded.find(text, pos)
                if idx == -1:
                    break

                if idx < len(offsets):
                    rom_offset = bank_offset + offsets[idx]
                    addr = 0x8000 + offsets[idx]
                    results.append((bank, addr, rom_offset))

                pos = idx + 1
                if len(results) >= max_results:
                    break

            if len(results) >= max_results:
                break

        return results


def main():
    browser = ROMBrowser(ROM_PATH)

    if len(sys.argv) < 2:
        # Default: show menu text
        print("Dragon Warrior IV ROM Browser")
        print("=" * 60)
        print("\nUsage:")
        print("  python rom_browser.py bank <bank_num> [addr]")
        print("  python rom_browser.py offset <hex_offset>")
        print("  python rom_browser.py search <text>")
        print("\nExamples:")
        print("  python rom_browser.py bank 22 0xB040")
        print("  python rom_browser.py offset 0x5B040")
        print("  python rom_browser.py search Chapter")
        print("\nShowing Bank 22 menu area:")
        browser.view_bank(22, 0xB040)
        return

    cmd = sys.argv[1]

    if cmd == "bank" and len(sys.argv) >= 3:
        bank = int(sys.argv[2])
        addr = int(sys.argv[3], 16) if len(sys.argv) > 3 else 0x8000
        browser.view_bank(bank, addr)

    elif cmd == "offset" and len(sys.argv) >= 3:
        offset = int(sys.argv[2], 16)
        browser.view_hex(offset)

    elif cmd == "search" and len(sys.argv) >= 3:
        text = ' '.join(sys.argv[2:])
        print(f"Searching for: {text}")
        results = browser.search_text(text)
        if results:
            print(f"\nFound {len(results)} results:")
            for bank, addr, rom_off in results:
                print(f"  Bank {bank:2d} ${addr:04X} (ROM 0x{rom_off:06X})")
        else:
            print("Not found.")


if __name__ == '__main__':
    main()
