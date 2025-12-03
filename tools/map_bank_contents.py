#!/usr/bin/env python3
"""
Dragon Warrior IV - Bank Content Mapper
========================================

Creates a visual map of each ROM bank showing code vs data regions.
Identifies:
- Executable code sections (valid 6502 opcodes)
- Text data (readable strings)
- Pointer tables
- Graphics/binary data
"""

import os

ROM_PATH = os.path.join(os.path.dirname(__file__), '..', 'roms',
                        'Dragon Warrior IV (1992-10)(Enix)(US).nes')

# Valid 6502 opcodes (partial list - common ones)
VALID_OPCODES = {
    0x00,  # BRK
    0x01, 0x05, 0x06, 0x08, 0x09, 0x0A, 0x0D, 0x0E,  # ORA, ASL, PHP
    0x10, 0x11, 0x15, 0x16, 0x18, 0x19, 0x1D, 0x1E,  # BPL, CLC
    0x20, 0x21, 0x24, 0x25, 0x26, 0x28, 0x29, 0x2A, 0x2C, 0x2D, 0x2E,  # JSR, AND
    0x30, 0x31, 0x35, 0x36, 0x38, 0x39, 0x3D, 0x3E,  # BMI, SEC
    0x40, 0x41, 0x45, 0x46, 0x48, 0x49, 0x4A, 0x4C, 0x4D, 0x4E,  # RTI, EOR, JMP
    0x50, 0x51, 0x55, 0x56, 0x58, 0x59, 0x5D, 0x5E,  # BVC, CLI
    0x60, 0x61, 0x65, 0x66, 0x68, 0x69, 0x6A, 0x6C, 0x6D, 0x6E,  # RTS, ADC
    0x70, 0x71, 0x75, 0x76, 0x78, 0x79, 0x7D, 0x7E,  # BVS, SEI
    0x81, 0x84, 0x85, 0x86, 0x88, 0x8A, 0x8C, 0x8D, 0x8E,  # STA, STX, STY
    0x90, 0x91, 0x94, 0x95, 0x96, 0x98, 0x99, 0x9A, 0x9D,  # BCC, TYA
    0xA0, 0xA1, 0xA2, 0xA4, 0xA5, 0xA6, 0xA8, 0xA9, 0xAA, 0xAC, 0xAD, 0xAE,  # LDA, LDX, LDY
    0xB0, 0xB1, 0xB4, 0xB5, 0xB6, 0xB8, 0xB9, 0xBA, 0xBC, 0xBD, 0xBE,  # BCS, CLV
    0xC0, 0xC1, 0xC4, 0xC5, 0xC6, 0xC8, 0xC9, 0xCA, 0xCC, 0xCD, 0xCE,  # CMP, CPY
    0xD0, 0xD1, 0xD5, 0xD6, 0xD8, 0xD9, 0xDD, 0xDE,  # BNE, CLD
    0xE0, 0xE1, 0xE4, 0xE5, 0xE6, 0xE8, 0xE9, 0xEA, 0xEC, 0xED, 0xEE,  # CPX, SBC
    0xF0, 0xF1, 0xF5, 0xF6, 0xF8, 0xF9, 0xFD, 0xFE,  # BEQ, SED
}


class BankMapper:
    """Maps content types within ROM banks."""

    def __init__(self, rom_path):
        with open(rom_path, 'rb') as f:
            self.rom = f.read()

    def bank_offset(self, bank):
        """Get ROM offset for bank start."""
        return 16 + bank * 0x4000

    def is_code_region(self, data, start, length=32):
        """Check if region looks like executable code."""
        valid = 0
        for i in range(min(length, len(data) - start)):
            if data[start + i] in VALID_OPCODES:
                valid += 1
        return valid > length * 0.5

    def is_text_region(self, data, start, length=32):
        """Check if region looks like text data."""
        text_chars = 0
        for i in range(min(length, len(data) - start)):
            b = data[start + i]
            if b < 0x50 or (0x65 <= b <= 0x78) or b == 0xFF or b == 0xFD:
                text_chars += 1
        return text_chars > length * 0.6

    def is_pointer_table(self, data, start, count=4):
        """Check if region looks like a pointer table."""
        valid_ptrs = 0
        for i in range(count):
            if start + i*2 + 1 >= len(data):
                break
            ptr = data[start + i*2] | (data[start + i*2 + 1] << 8)
            if 0x8000 <= ptr <= 0xBFFF:
                valid_ptrs += 1
        return valid_ptrs >= count * 0.75

    def analyze_bank(self, bank):
        """Analyze content types in a bank."""
        offset = self.bank_offset(bank)
        data = self.rom[offset:offset + 0x4000]

        regions = []
        chunk_size = 64

        for i in range(0, len(data), chunk_size):
            addr = 0x8000 + i
            chunk = data[i:i + chunk_size]

            if len(chunk) < 16:
                break

            # Classify chunk
            if self.is_pointer_table(chunk, 0):
                region_type = 'PTRS'
            elif self.is_code_region(chunk, 0):
                region_type = 'CODE'
            elif self.is_text_region(chunk, 0):
                region_type = 'TEXT'
            else:
                region_type = 'DATA'

            regions.append((addr, region_type))

        return regions

    def create_map(self, bank):
        """Create visual map of bank."""
        regions = self.analyze_bank(bank)

        # Consolidate consecutive regions of same type
        consolidated = []
        if regions:
            current_type = regions[0][1]
            start_addr = regions[0][0]
            end_addr = regions[0][0]

            for addr, rtype in regions[1:]:
                if rtype == current_type:
                    end_addr = addr
                else:
                    consolidated.append((start_addr, end_addr, current_type))
                    current_type = rtype
                    start_addr = addr
                    end_addr = addr

            consolidated.append((start_addr, end_addr, current_type))

        return consolidated


def main():
    mapper = BankMapper(ROM_PATH)

    print("=" * 78)
    print(" DRAGON WARRIOR IV - BANK CONTENT MAP")
    print("=" * 78)

    # Legend
    print("""
Legend:
  CODE = Executable 6502 code
  TEXT = Text/string data
  PTRS = Pointer tables
  DATA = Binary/graphics data
""")

    # Analyze all banks
    for bank in range(32):
        print(f"\n{'='*78}")
        print(f" BANK {bank:2d} (${bank:02X})")
        print("=" * 78)

        regions = mapper.create_map(bank)

        # Summary statistics
        code_bytes = 0
        text_bytes = 0
        data_bytes = 0
        ptr_bytes = 0

        for start, end, rtype in regions:
            size = end - start + 64
            if rtype == 'CODE':
                code_bytes += size
            elif rtype == 'TEXT':
                text_bytes += size
            elif rtype == 'PTRS':
                ptr_bytes += size
            else:
                data_bytes += size

        total = code_bytes + text_bytes + data_bytes + ptr_bytes
        if total > 0:
            print(f"  CODE: {code_bytes:5d} ({code_bytes*100//total:2d}%)")
            print(f"  TEXT: {text_bytes:5d} ({text_bytes*100//total:2d}%)")
            print(f"  PTRS: {ptr_bytes:5d} ({ptr_bytes*100//total:2d}%)")
            print(f"  DATA: {data_bytes:5d} ({data_bytes*100//total:2d}%)")

        # Visual map
        print("\n  Address Map:")
        for start, end, rtype in regions:
            size = end - start + 64
            if size >= 128:  # Only show significant regions
                print(f"    ${start:04X}-${end+63:04X}: {rtype} ({size} bytes)")

    # Summary table
    print("\n" + "=" * 78)
    print(" SUMMARY - TEXT BANKS")
    print("=" * 78)
    print("\n  Bank | CODE%  TEXT%  DATA%  Notes")
    print("  " + "-" * 50)

    text_banks = []
    for bank in range(32):
        regions = mapper.create_map(bank)

        code_bytes = text_bytes = data_bytes = ptr_bytes = 0
        for start, end, rtype in regions:
            size = end - start + 64
            if rtype == 'CODE':
                code_bytes += size
            elif rtype == 'TEXT':
                text_bytes += size
            elif rtype == 'PTRS':
                ptr_bytes += size
            else:
                data_bytes += size

        total = code_bytes + text_bytes + data_bytes + ptr_bytes
        if total > 0:
            text_pct = text_bytes * 100 // total
            if text_pct > 20:
                text_banks.append((bank, code_bytes*100//total, text_pct,
                                  data_bytes*100//total))

    for bank, code_pct, text_pct, data_pct in sorted(text_banks,
                                                      key=lambda x: -x[2]):
        notes = ""
        if bank == 17:
            notes = "Location names"
        elif bank == 22:
            notes = "Menu text + text engine"
        elif bank == 23:
            notes = "Casino/dialogue"
        elif bank == 27:
            notes = "Chapter titles"

        print(f"    {bank:2d}   {code_pct:3d}%   {text_pct:3d}%   "
              f"{data_pct:3d}%   {notes}")


if __name__ == '__main__':
    main()
