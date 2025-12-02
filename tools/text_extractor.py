#!/usr/bin/env python3
"""
Dragon Warrior 4 (NES) - Comprehensive Text Extractor
=====================================================

This tool extracts and decodes all text from the DW4 ROM using the TBL encoding.
DW4 does NOT use DTE compression - text is plain TBL encoded with control codes.

Key Text Encoding:
- $00 = space
- $01-$0A = 0-9
- $0B-$24 = a-z
- $25-$3E = A-Z
- $65-$79 = punctuation and symbols
- $ff = END terminator
- $fd = LINE/CLEAR
- $22 XX = POSITION control code
- $fe = Special control
"""

import os
import sys
import json
from typing import List, Tuple, Optional, Dict
from dataclasses import dataclass, asdict
from collections import defaultdict

# TBL Character mapping
TBL = {
    0x00: ' ',
    # Digits 0-9
    0x01: '0', 0x02: '1', 0x03: '2', 0x04: '3', 0x05: '4',
    0x06: '5', 0x07: '6', 0x08: '7', 0x09: '8', 0x0A: '9',
    # Lowercase a-z
    0x0B: 'a', 0x0C: 'b', 0x0D: 'c', 0x0E: 'd', 0x0F: 'e',
    0x10: 'f', 0x11: 'g', 0x12: 'h', 0x13: 'i', 0x14: 'j',
    0x15: 'k', 0x16: 'l', 0x17: 'm', 0x18: 'n', 0x19: 'o',
    0x1A: 'p', 0x1B: 'q', 0x1C: 'r', 0x1D: 's', 0x1E: 't',
    0x1F: 'u', 0x20: 'v', 0x21: 'w', 0x22: 'x', 0x23: 'y',
    0x24: 'z',
    # Uppercase A-Z
    0x25: 'A', 0x26: 'B', 0x27: 'C', 0x28: 'D', 0x29: 'E',
    0x2A: 'F', 0x2B: 'G', 0x2C: 'H', 0x2D: 'I', 0x2E: 'J',
    0x2F: 'K', 0x30: 'L', 0x31: 'M', 0x32: 'N', 0x33: 'O',
    0x34: 'P', 0x35: 'Q', 0x36: 'R', 0x37: 'S', 0x38: 'T',
    0x39: 'U', 0x3A: 'V', 0x3B: 'W', 0x3C: 'X', 0x3D: 'Y',
    0x3E: 'Z',
    # Punctuation and symbols
    0x65: ',', 0x66: '.', 0x67: '-', 0x68: '…', 0x69: '!',
    0x6A: "'", 0x6B: '&', 0x6C: '"', 0x6D: '?', 0x6E: '/',
    0x6F: '~', 0x70: ':', 0x71: '(', 0x72: ')', 0x73: '`',
    0x74: ';', 0x75: '[MALE]', 0x76: '[FEMALE]', 0x77: '%',
    0x78: '{', 0x79: '}',
    # Special symbols
    0x7A: '[LV]', 0x7B: '[HP]', 0x7C: '[MP]', 0x7D: '[G]',
    0x7E: '[*]', 0x7F: '[SWORD]', 0x80: '[SHIELD]', 0x81: '[>>]',
}

# Control codes
CONTROL_CODES = {
    0xF0: '[WAIT]',      # Wait for button press?
    0xF1: '[ITEM]',      # Item name placeholder
    0xF2: '[SPELL]',     # Spell name placeholder
    0xF3: '[NAME]',      # Character name placeholder
    0xF4: '[MONSTER]',   # Monster name placeholder
    0xF5: '[NUMBER]',    # Number placeholder
    0xF6: '[CTRL-F6]',
    0xF7: '[CTRL-F7]',
    0xF8: '[CTRL-F8]',
    0xF9: '[CTRL-F9]',
    0xFA: '[CTRL-FA]',
    0xFB: '[CTRL-FB]',
    0xFC: '[CTRL-FC]',
    0xFD: '[LINE]',      # Line break / clear
    0xFE: '[CTRL-FE]',
    0xFF: '[END]',       # String terminator
}

@dataclass
class TextString:
    """Represents an extracted text string"""
    offset: int          # ROM file offset
    bank: int            # PRG-ROM bank number
    bank_offset: int     # Offset within the bank
    length: int          # Length in bytes
    raw_bytes: bytes     # Raw byte data
    decoded: str         # Decoded text
    control_codes: List[Tuple[int, int]]  # List of (offset, code) for control codes found


def get_bank_for_offset(offset: int) -> Tuple[int, int]:
    """Get PRG-ROM bank number and offset within bank for a ROM file offset.

    Assumes 16-byte iNES header and 16KB PRG-ROM banks.
    """
    prg_offset = offset - 16  # Remove iNES header
    bank = prg_offset // 0x4000
    bank_offset = prg_offset % 0x4000
    return bank, bank_offset


def decode_byte(b: int) -> Optional[str]:
    """Decode a single byte to a character, or None if not a printable char."""
    if b in TBL:
        return TBL[b]
    if b in CONTROL_CODES:
        return CONTROL_CODES[b]
    return None


def is_text_byte(b: int) -> bool:
    """Check if a byte could be part of text (printable or control code)."""
    return b in TBL or b in CONTROL_CODES or b == 0x22  # 0x22 is 2-byte control


def decode_text_at_offset(rom_data: bytes, offset: int, max_length: int = 500) -> Optional[TextString]:
    """Decode text starting at a specific offset.

    Returns None if the data doesn't appear to be valid text.
    """
    decoded = []
    control_codes = []
    i = 0
    raw_start = offset

    while i < max_length:
        if offset + i >= len(rom_data):
            break

        b = rom_data[offset + i]

        # Check for 2-byte control code (0x22 XX)
        if b == 0x22 and offset + i + 1 < len(rom_data):
            param = rom_data[offset + i + 1]
            control_codes.append((i, 0x22))
            decoded.append(f'[POS:{param}]')
            i += 2
            continue

        # Check for END terminator
        if b == 0xFF:
            control_codes.append((i, 0xFF))
            decoded.append('[END]')
            i += 1
            break

        # Check for other control codes
        if b in CONTROL_CODES:
            control_codes.append((i, b))
            decoded.append(CONTROL_CODES[b])
            i += 1
            continue

        # Check for printable character
        if b in TBL:
            decoded.append(TBL[b])
            i += 1
            continue

        # Unknown byte - might not be text
        decoded.append(f'[{b:02x}]')
        i += 1

    if not decoded:
        return None

    raw_bytes = rom_data[raw_start:raw_start + i]
    bank, bank_offset = get_bank_for_offset(raw_start)

    return TextString(
        offset=raw_start,
        bank=bank,
        bank_offset=bank_offset,
        length=i,
        raw_bytes=raw_bytes,
        decoded=''.join(decoded),
        control_codes=control_codes
    )


def find_text_strings(rom_data: bytes, start_offset: int, end_offset: int,
                       min_printable: int = 4, max_unknown_ratio: float = 0.2) -> List[TextString]:
    """Scan a region for text strings.

    Args:
        rom_data: Full ROM data
        start_offset: Starting offset to scan
        end_offset: Ending offset to scan
        min_printable: Minimum printable characters required
        max_unknown_ratio: Maximum ratio of unknown bytes allowed

    Returns:
        List of found text strings
    """
    strings = []
    offset = start_offset

    while offset < end_offset:
        # Look for potential string start
        # Skip if this looks like code (common opcodes)
        b = rom_data[offset]

        # Check if this could be start of text
        if is_text_byte(b) or b < 0x80:
            text = decode_text_at_offset(rom_data, offset)

            if text:
                # Count printable vs unknown characters
                printable_count = sum(1 for c in text.decoded if not c.startswith('[') or c in ('[LINE]', '[END]', '[WAIT]'))
                unknown_count = text.decoded.count('[') - text.decoded.count('[LINE]') - text.decoded.count('[END]') - text.decoded.count('[WAIT]') - text.decoded.count('[POS:')

                # Filter: must have enough printable chars and not too many unknowns
                if printable_count >= min_printable:
                    unknown_ratio = unknown_count / max(1, len(text.decoded.replace('[END]', '').replace('[LINE]', '')))
                    if unknown_ratio <= max_unknown_ratio:
                        strings.append(text)
                        offset += text.length
                        continue

        offset += 1

    return strings


def find_all_terminated_strings(rom_data: bytes, terminator: int = 0xFF,
                                  min_length: int = 3) -> List[TextString]:
    """Find all strings terminated by a specific byte.

    This scans the entire ROM for 0xFF-terminated strings.
    """
    strings = []
    offset = 16  # Skip iNES header

    while offset < len(rom_data):
        # Find next terminator
        try:
            end = rom_data.index(terminator, offset)
        except ValueError:
            break

        # Check if the bytes before the terminator could be text
        length = end - offset + 1  # Include terminator
        if length >= min_length and length < 500:
            # Decode the potential string
            text = decode_text_at_offset(rom_data, offset, max_length=length)

            if text:
                # Calculate quality score
                printable = sum(1 for b in rom_data[offset:end] if b in TBL)
                total = end - offset

                if total > 0 and printable / total >= 0.6:  # At least 60% printable
                    strings.append(text)
                    offset = end + 1
                    continue

        offset = end + 1

    return strings


def scan_for_known_strings(rom_data: bytes) -> Dict[str, List[int]]:
    """Scan ROM for known text patterns to identify text regions."""

    known_patterns = {
        'Chapter': bytes([0x27, 0x12, 0x0B, 0x1A, 0x1E, 0x0F, 0x1C]),  # "Chapter"
        'Hero': bytes([0x2C, 0x0F, 0x1C, 0x19]),  # "Hero"
        'Alena': bytes([0x25, 0x16, 0x0F, 0x18, 0x0B]),  # "Alena"
        'Taloon': bytes([0x38, 0x0B, 0x16, 0x19, 0x19, 0x18]),  # "Taloon"
        'Ragnar': bytes([0x36, 0x0B, 0x11, 0x18, 0x0B, 0x1C]),  # "Ragnar"
        'Royal': bytes([0x36, 0x19, 0x23, 0x0B, 0x16]),  # "Royal"
        'Dragon': bytes([0x28, 0x1C, 0x0B, 0x11, 0x19, 0x18]),  # "Dragon"
        'Sword': bytes([0x37, 0x21, 0x19, 0x1C, 0x0E]),  # "Sword"
        'Shield': bytes([0x37, 0x12, 0x13, 0x0F, 0x16, 0x0E]),  # "Shield"
        'Healmore': bytes([0x2C, 0x0F, 0x0B, 0x16, 0x17, 0x19, 0x1C, 0x0F]),  # "Healmore"
        'Slime': bytes([0x37, 0x16, 0x13, 0x17, 0x0F]),  # "Slime"
        'Casino': bytes([0x27, 0x0B, 0x1D, 0x13, 0x18, 0x19]),  # "Casino"
        'Gold': bytes([0x2B, 0x19, 0x16, 0x0E]),  # "Gold"
        'attack': bytes([0x0B, 0x1E, 0x1E, 0x0B, 0x0D, 0x15]),  # "attack"
        'defense': bytes([0x0E, 0x0F, 0x10, 0x0F, 0x18, 0x1D, 0x0F]),  # "defense"
    }

    found = {}
    for name, pattern in known_patterns.items():
        offsets = []
        offset = 0
        while True:
            try:
                pos = rom_data.index(pattern, offset)
                offsets.append(pos)
                offset = pos + 1
            except ValueError:
                break
        if offsets:
            found[name] = offsets

    return found


def extract_text_bank(rom_data: bytes, bank: int) -> List[TextString]:
    """Extract all text from a specific PRG-ROM bank."""
    bank_start = 16 + (bank * 0x4000)  # Add iNES header offset
    bank_end = bank_start + 0x4000

    if bank_end > len(rom_data):
        return []

    return find_text_strings(rom_data, bank_start, bank_end)


def main():
    """Main extraction routine."""
    # Find the ROM file
    script_dir = os.path.dirname(os.path.abspath(__file__))
    project_root = os.path.dirname(script_dir)
    rom_path = os.path.join(project_root, 'roms', 'Dragon Warrior IV (1992-10)(Enix)(US).nes')

    if not os.path.exists(rom_path):
        print(f"ROM file not found: {rom_path}")
        sys.exit(1)

    print(f"Loading ROM: {rom_path}")
    with open(rom_path, 'rb') as f:
        rom_data = f.read()

    print(f"ROM size: {len(rom_data)} bytes ({len(rom_data) / 1024:.1f} KB)")
    print()

    # First, scan for known string patterns to find text regions
    print("=" * 70)
    print("SCANNING FOR KNOWN TEXT PATTERNS")
    print("=" * 70)

    known_strings = scan_for_known_strings(rom_data)
    for name, offsets in known_strings.items():
        print(f"  '{name}' found at: {[f'0x{o:05x}' for o in offsets[:5]]}" +
              (f" ... and {len(offsets)-5} more" if len(offsets) > 5 else ""))
    print()

    # Identify text-heavy regions
    print("=" * 70)
    print("TEXT REGION ANALYSIS")
    print("=" * 70)

    # Count text-like bytes per bank
    bank_text_density = []
    for bank in range(32):  # 512KB / 16KB = 32 banks
        bank_start = 16 + (bank * 0x4000)
        bank_end = bank_start + 0x4000

        text_bytes = sum(1 for b in rom_data[bank_start:bank_end] if b in TBL or b in CONTROL_CODES)
        density = text_bytes / 0x4000 * 100
        bank_text_density.append((bank, density))

    # Sort by density
    bank_text_density.sort(key=lambda x: x[1], reverse=True)

    print("Banks by text density (top 10):")
    for bank, density in bank_text_density[:10]:
        bank_start = 16 + (bank * 0x4000)
        bank_end = bank_start + 0x4000
        print(f"  Bank {bank:2d} (0x{bank_start:05x}-0x{bank_end:05x}): {density:.1f}%")
    print()

    # Extract text from known text regions
    print("=" * 70)
    print("EXTRACTING TEXT FROM KNOWN REGIONS")
    print("=" * 70)

    # Known text regions from our analysis
    text_regions = [
        (0x5c000, 0x5d000, "Casino/Poker text"),
        (0x6e674, 0x6e800, "Chapter titles"),
        # Add more as we discover them
    ]

    all_extracted = []

    for start, end, name in text_regions:
        print(f"\n--- {name} (0x{start:05x}-0x{end:05x}) ---")
        strings = find_text_strings(rom_data, start, end, min_printable=3)

        for s in strings:
            # Clean up the decoded text for display
            display = s.decoded.replace('[END]', '|').replace('[LINE]', '\n  ')
            if '[POS:' in display:
                display = display.replace('[POS:', '<').replace(']', '>')
            print(f"  0x{s.offset:05x}: {display[:100]}")
            all_extracted.append(s)

    # Scan high-density banks
    print("\n" + "=" * 70)
    print("SCANNING HIGH-DENSITY TEXT BANKS")
    print("=" * 70)

    for bank, density in bank_text_density[:5]:
        if density < 20:  # Skip if less than 20% text
            continue

        bank_start = 16 + (bank * 0x4000)
        bank_end = bank_start + 0x4000

        print(f"\n--- Bank {bank} (0x{bank_start:05x}-0x{bank_end:05x}, {density:.1f}% text) ---")
        strings = find_text_strings(rom_data, bank_start, bank_end, min_printable=5)

        # Show first 20 strings
        for s in strings[:20]:
            display = s.decoded.replace('[END]', '|').replace('[LINE]', '\n    ')
            if len(display) > 80:
                display = display[:77] + '...'
            print(f"  0x{s.offset:05x}: {display}")

        if len(strings) > 20:
            print(f"  ... and {len(strings) - 20} more strings")

        all_extracted.extend(strings)

    # Summary statistics
    print("\n" + "=" * 70)
    print("EXTRACTION SUMMARY")
    print("=" * 70)
    print(f"Total strings extracted: {len(all_extracted)}")

    # Group by bank
    by_bank = defaultdict(list)
    for s in all_extracted:
        by_bank[s.bank].append(s)

    print("\nStrings per bank:")
    for bank in sorted(by_bank.keys()):
        print(f"  Bank {bank:2d}: {len(by_bank[bank])} strings")

    # Save results
    output_dir = os.path.join(project_root, 'assets', 'text', 'extracted')
    os.makedirs(output_dir, exist_ok=True)

    # Save as JSON
    json_output = os.path.join(output_dir, 'all_text.json')
    with open(json_output, 'w', encoding='utf-8') as f:
        # Convert to serializable format
        data = []
        for s in all_extracted:
            data.append({
                'offset': f'0x{s.offset:05x}',
                'bank': s.bank,
                'bank_offset': f'0x{s.bank_offset:04x}',
                'length': s.length,
                'decoded': s.decoded,
                'raw_hex': s.raw_bytes.hex()
            })
        json.dump(data, f, indent=2, ensure_ascii=False)
    print(f"\nSaved to: {json_output}")

    # Save readable text file
    txt_output = os.path.join(output_dir, 'all_text.txt')
    with open(txt_output, 'w', encoding='utf-8') as f:
        f.write("Dragon Warrior IV - Extracted Text\n")
        f.write("=" * 70 + "\n\n")

        for bank in sorted(by_bank.keys()):
            f.write(f"\n{'=' * 70}\n")
            f.write(f"BANK {bank:02d} (PRG-ROM 0x{bank * 0x4000:05x}-0x{(bank + 1) * 0x4000:05x})\n")
            f.write(f"{'=' * 70}\n\n")

            for s in by_bank[bank]:
                f.write(f"[0x{s.offset:05x}] ({s.length} bytes)\n")
                display = s.decoded.replace('[END]', '\n').replace('[LINE]', '\n')
                f.write(f"  {display}\n\n")

    print(f"Saved to: {txt_output}")


if __name__ == '__main__':
    main()
