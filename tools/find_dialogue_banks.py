#!/usr/bin/env python3
"""
Dragon Warrior IV - Find Dialogue Banks

Search all ROM banks for banks containing dialogue text.
"""

import os

ROM_PATH = os.path.join(os.path.dirname(__file__), '..', 'roms',
                        'Dragon Warrior IV (1992-10)(Enix)(US).nes')


def decode_char(b):
    """Decode a single character."""
    if b == 0x00:
        return ' '
    elif 0x01 <= b <= 0x0A:
        return str(b - 1)
    elif 0x0B <= b <= 0x24:
        return chr(ord('a') + b - 0x0B)
    elif 0x25 <= b <= 0x3E:
        return chr(ord('A') + b - 0x25)
    elif b == 0xFF:
        return '[END]'
    elif b == 0xFD:
        return '[LN]'
    elif b == 0xFE:
        return '[CTRL]'
    else:
        return f'[{b:02X}]'


def decode_text(data, max_len=40):
    """Decode a byte sequence to text."""
    result = []
    for b in data[:max_len]:
        result.append(decode_char(b))
        if b == 0xFF:
            break
    return ''.join(result)


def main():
    with open(ROM_PATH, 'rb') as f:
        rom = f.read()

    print("=" * 70)
    print(" DRAGON WARRIOR IV - DIALOGUE BANK SEARCH")
    print("=" * 70)

    # Common dialogue patterns using DW4 text encoding
    # Lowercase: a=$0B, b=$0C, ..., t=$1E, ..., y=$23, z=$24
    # 'the ' = $1E $12 $0F $00
    # 'you ' = $23 $19 $1F $00  (y=$23, o=$19, u=$1F)
    # 'and ' = $0B $18 $0E $00  (a=$0B, n=$18, d=$0E)
    the_pattern = bytes([0x1E, 0x12, 0x0F, 0x00])
    you_pattern = bytes([0x23, 0x19, 0x1F, 0x00])
    and_pattern = bytes([0x0B, 0x18, 0x0E, 0x00])

    # Also search for text terminator ($FF) preceded by valid chars
    # This helps find banks with lots of terminated strings

    print("\nSearching for common text patterns in each bank...")
    print("-" * 70)

    dialogue_banks = []

    for bank in range(32):
        bank_start = bank * 0x4000 + 0x10
        bank_data = rom[bank_start:bank_start + 0x4000]

        # Count occurrences
        the_count = bank_data.count(the_pattern)
        you_count = bank_data.count(you_pattern)
        and_count = bank_data.count(and_pattern)

        total = the_count + you_count + and_count

        if total > 0:
            dialogue_banks.append((bank, the_count, you_count, and_count, total))

    # Sort by total matches
    dialogue_banks.sort(key=lambda x: -x[4])

    print(f"\n{'Bank':>5} | {'the':>5} | {'you':>5} | {'and':>5} | {'Total':>6}")
    print("-" * 40)

    for bank, the_c, you_c, and_c, total in dialogue_banks:
        print(f"{bank:>5} | {the_c:>5} | {you_c:>5} | {and_c:>5} | {total:>6}")

    # Analyze top dialogue banks
    print("\n" + "=" * 70)
    print(" TOP DIALOGUE BANKS - SAMPLE TEXT")
    print("=" * 70)

    for bank, the_c, you_c, and_c, total in dialogue_banks[:5]:
        bank_start = bank * 0x4000 + 0x10
        bank_data = rom[bank_start:bank_start + 0x4000]

        print(f"\n--- Bank {bank} ({total} matches) ---")

        # Find strings containing patterns
        samples = []
        for pattern, name in [(the_pattern, 'the'), (you_pattern, 'you')]:
            pos = 0
            while len(samples) < 5:
                pos = bank_data.find(pattern, pos)
                if pos == -1:
                    break

                # Back up to find start of string
                start = pos
                while start > 0 and bank_data[start-1] != 0xFF:
                    start -= 1
                    if pos - start > 50:
                        start = pos - 20
                        break

                cpu_addr = 0x8000 + start
                text = decode_text(bank_data[start:start+50])

                if len(text) > 10 and text not in [s[1] for s in samples]:
                    samples.append((cpu_addr, text))

                pos += 1

        for addr, text in samples[:5]:
            print(f"  ${addr:04X}: {text}")


if __name__ == '__main__':
    main()
