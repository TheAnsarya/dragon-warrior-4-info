#!/usr/bin/env python3
"""
Find DTE (Dual Tile Encoding) table in Dragon Warrior IV ROM.

DTE compression maps bytes $80-$FF to two-character combinations.
The table should contain common English letter pairs like:
- "th", "he", "an", "in", "er", "ou", "re", "on", "te", "ti"
- Also space combinations: " t", "e ", " a", "s "

This script searches for patterns that look like a DTE lookup table.
"""

import sys
import os

ROM_PATH = r"c:\Users\me\source\repos\dragon-warrior-4-info\roms\Dragon Warrior IV (1992-10)(Enix)(US).nes"

# TBL encoding for DW4
TBL_ENCODE = {' ': 0x00}
for i in range(10):
    TBL_ENCODE[str(i)] = 0x01 + i
for i, c in enumerate('abcdefghijklmnopqrstuvwxyz'):
    TBL_ENCODE[c] = 0x0B + i
for i, c in enumerate('ABCDEFGHIJKLMNOPQRSTUVWXYZ'):
    TBL_ENCODE[c] = 0x25 + i

TBL_DECODE = {v: k for k, v in TBL_ENCODE.items()}

def encode_pair(s):
    """Encode a two-character string to DTE table bytes."""
    if len(s) != 2:
        return None
    b1 = TBL_ENCODE.get(s[0])
    b2 = TBL_ENCODE.get(s[1])
    if b1 is None or b2 is None:
        return None
    return bytes([b1, b2])

def decode_byte(b):
    """Decode a single byte using TBL."""
    return TBL_DECODE.get(b, f'<{b:02X}>')

def is_valid_dte_entry(b1, b2):
    """Check if two bytes could be a valid DTE entry (printable chars)."""
    return b1 <= 0x3E and b2 <= 0x3E

def analyze_dte_table_candidate(rom, offset, size=256):
    """Analyze a potential DTE table at given offset."""
    # DTE table has 128 entries (for $80-$FF), each 2 bytes = 256 bytes total
    table = rom[offset:offset + size]

    valid_entries = 0
    entries = []

    for i in range(0, min(len(table), 256), 2):
        if i + 1 < len(table):
            b1, b2 = table[i], table[i + 1]
            if is_valid_dte_entry(b1, b2):
                valid_entries += 1
                c1 = decode_byte(b1)
                c2 = decode_byte(b2)
                entries.append(f"${0x80 + i//2:02X}={c1}{c2}")

    return valid_entries, entries

def search_for_dte_table(rom):
    """Search ROM for potential DTE tables."""
    print("Searching for DTE tables in ROM...")
    print("-" * 60)

    # Common DTE pairs we expect to find
    common_pairs = [
        "th", "he", "an", "in", "er", "ou", "re", "on", "te", "ti",
        " t", "e ", " a", "s ", "ng", "nt", "nd", "is", "it", "to",
        "al", "ar", "st", "en", "of", "ed", "or", "es", "ea", "at"
    ]
    encoded_pairs = {encode_pair(p): p for p in common_pairs if encode_pair(p)}

    # Search for runs of valid DTE-like data
    candidates = []

    for offset in range(0x10, len(rom) - 256):
        valid_count, entries = analyze_dte_table_candidate(rom, offset)

        # A good DTE table should have most entries valid
        if valid_count >= 100:  # At least 100 of 128 entries valid
            # Check if common pairs are present
            table = rom[offset:offset + 256]
            pairs_found = 0
            for enc, pair in encoded_pairs.items():
                if enc:
                    for i in range(0, 256, 2):
                        if table[i:i+2] == enc:
                            pairs_found += 1
                            break

            candidates.append((offset, valid_count, pairs_found))

    # Sort by score (valid entries + 10*pairs_found)
    candidates.sort(key=lambda x: x[1] + 10*x[2], reverse=True)

    print(f"Found {len(candidates)} potential DTE table candidates")
    print()

    for offset, valid, pairs in candidates[:10]:
        bank = (offset - 0x10) // 0x4000
        bank_offset = (offset - 0x10) % 0x4000
        cpu_addr = 0x8000 + bank_offset

        print(f"Candidate at ROM 0x{offset:05X} (Bank {bank}, CPU ${cpu_addr:04X})")
        print(f"  Valid entries: {valid}/128, Common pairs: {pairs}")

        # Show first 20 entries
        _, entries = analyze_dte_table_candidate(rom, offset)
        print(f"  First 20 entries: {', '.join(entries[:20])}")
        print()

def search_for_dialogue(rom):
    """Search for actual dialogue text patterns."""
    print("\n" + "=" * 60)
    print("Searching for dialogue patterns...")
    print("=" * 60)

    # Look for strings that start with text and end with $FF
    # and have a mix of regular chars and high bytes (DTE codes)

    dialogue_candidates = []

    for offset in range(0x10, len(rom) - 50):
        # Skip if not in text range
        if rom[offset] > 0x3E and rom[offset] < 0x80:
            continue

        # Look for $FF terminator within 200 bytes
        end = -1
        for i in range(offset, min(offset + 200, len(rom))):
            if rom[i] == 0xFF:
                end = i
                break

        if end == -1 or end - offset < 10:
            continue

        # Check pattern: should have mix of low bytes (text) and high bytes (DTE)
        segment = rom[offset:end]
        low_count = sum(1 for b in segment if b <= 0x3E)
        high_count = sum(1 for b in segment if 0x80 <= b <= 0xFE)

        # Good dialogue has ~40-70% low bytes (text) and ~20-40% high bytes (DTE)
        if len(segment) > 15 and 0.3 < low_count/len(segment) < 0.8 and high_count/len(segment) > 0.15:
            dialogue_candidates.append((offset, end - offset, low_count, high_count))

    print(f"Found {len(dialogue_candidates)} potential dialogue segments")

    # Show samples from different banks
    by_bank = {}
    for offset, length, low, high in dialogue_candidates:
        bank = (offset - 0x10) // 0x4000
        if bank not in by_bank:
            by_bank[bank] = []
        by_bank[bank].append((offset, length, low, high))

    for bank in sorted(by_bank.keys()):
        samples = by_bank[bank][:3]
        if samples:
            print(f"\nBank {bank}: {len(by_bank[bank])} segments")
            for offset, length, low, high in samples:
                segment = rom[offset:offset + min(length, 50)]
                # Partial decode
                decoded = ""
                for b in segment:
                    if b <= 0x3E:
                        decoded += decode_byte(b)
                    elif b == 0xFF:
                        decoded += "<END>"
                    else:
                        decoded += f"[{b:02X}]"
                print(f"  0x{offset:05X} ({length}b): {decoded[:60]}...")

def main():
    with open(ROM_PATH, 'rb') as f:
        rom = f.read()

    print(f"ROM Size: {len(rom)} bytes")
    print()

    search_for_dte_table(rom)
    search_for_dialogue(rom)

if __name__ == "__main__":
    main()
