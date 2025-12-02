#!/usr/bin/env python3
"""
Dragon Warrior IV - Text Bank Analyzer

Analyze ROM banks to find actual dialogue text vs graphics data.
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
        return None  # Not a text character


def is_text_byte(b):
    """Check if a byte is a valid text character."""
    return (b == 0x00 or
            0x01 <= b <= 0x0A or
            0x0B <= b <= 0x24 or
            0x25 <= b <= 0x3E or
            0x65 <= b <= 0x81 or  # Punctuation range
            b in (0xFD, 0xFE, 0xFF))


def analyze_bank(rom, bank):
    """Analyze a bank for text content."""
    bank_start = bank * 0x4000 + 0x10
    bank_data = rom[bank_start:bank_start + 0x4000]

    # Count text bytes vs non-text bytes
    text_bytes = sum(1 for b in bank_data if is_text_byte(b))
    text_ratio = text_bytes / len(bank_data)

    # Find runs of valid text characters
    runs = []
    run_start = None
    for i, b in enumerate(bank_data):
        if is_text_byte(b):
            if run_start is None:
                run_start = i
        else:
            if run_start is not None:
                run_len = i - run_start
                if run_len >= 10:
                    runs.append((run_start, run_len))
                run_start = None

    # Count readable words
    readable_count = 0
    for start, length in runs:
        text = ''
        for b in bank_data[start:start + length]:
            c = decode_char(b)
            if c:
                text += c
        # Check for common English patterns
        text_lower = text.lower()
        if ' the ' in text_lower or ' you ' in text_lower or ' and ' in text_lower:
            readable_count += 1

    return {
        'text_ratio': text_ratio,
        'text_runs': len(runs),
        'readable_runs': readable_count,
        'total_text_bytes': text_bytes,
    }


def decode_text_run(data, max_len=60):
    """Decode a run of bytes to text."""
    result = []
    for b in data[:max_len]:
        c = decode_char(b)
        if c:
            result.append(c if c != '[END]' else '')
        if b == 0xFF:
            break
    return ''.join(result)


def main():
    with open(ROM_PATH, 'rb') as f:
        rom = f.read()

    print("=" * 70)
    print(" DRAGON WARRIOR IV - TEXT BANK ANALYSIS")
    print("=" * 70)

    # Analyze all banks
    results = []
    for bank in range(32):
        info = analyze_bank(rom, bank)
        results.append((bank, info))

    # Sort by text ratio and readable content
    results.sort(key=lambda x: -(x[1]['readable_runs'] * 100 + x[1]['text_ratio']))

    print("\nBank Analysis (sorted by text content likelihood):")
    print("-" * 70)
    print(f"{'Bank':>5} | {'Text%':>6} | {'Runs':>5} | {'Readable':>8} | Notes")
    print("-" * 70)

    for bank, info in results:
        notes = ""
        if info['readable_runs'] > 0:
            notes = "** DIALOGUE **"
        elif info['text_ratio'] > 0.3:
            notes = "Possible text"

        print(f"{bank:>5} | {info['text_ratio']*100:>5.1f}% | {info['text_runs']:>5} | "
              f"{info['readable_runs']:>8} | {notes}")

    # Show sample text from top banks
    print("\n" + "=" * 70)
    print(" SAMPLE TEXT FROM TOP DIALOGUE BANKS")
    print("=" * 70)

    for bank, info in results[:5]:
        if info['readable_runs'] == 0:
            continue

        bank_start = bank * 0x4000 + 0x10
        bank_data = rom[bank_start:bank_start + 0x4000]

        print(f"\n--- Bank {bank} ---")

        # Find and show readable strings
        shown = 0
        i = 0
        while i < len(bank_data) - 10 and shown < 10:
            # Look for strings ending in $FF
            if bank_data[i] == 0xFF and i > 5:
                # Find start of string
                start = i - 1
                while start > 0 and bank_data[start] != 0xFF:
                    start -= 1
                    if i - start > 80:
                        break

                if start < i - 5:
                    text = decode_text_run(bank_data[start:i+1])
                    if len(text.strip()) > 8 and not text.startswith('['):
                        cpu_addr = 0x8000 + start
                        print(f"  ${cpu_addr:04X}: {text[:60]}")
                        shown += 1

            i += 1


if __name__ == '__main__':
    main()
