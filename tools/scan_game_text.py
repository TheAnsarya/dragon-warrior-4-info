#!/usr/bin/env python3
"""
Dragon Warrior IV - Game Text Scanner
=====================================

Scans all ROM banks for recognizable game text patterns.
"""

import os

ROM_PATH = os.path.join(os.path.dirname(__file__), '..', 'roms',
                        'Dragon Warrior IV (1992-10)(Enix)(US).nes')


def decode(data):
    """Decode bytes to text string."""
    chars = []
    for b in data:
        if b == 0:
            chars.append(' ')
        elif 1 <= b <= 0x0A:
            chars.append(str(b-1))
        elif 0x0B <= b <= 0x24:
            chars.append(chr(ord('a') + b - 0x0B))
        elif 0x25 <= b <= 0x3E:
            chars.append(chr(ord('A') + b - 0x25))
        elif b == 0x3F:
            chars.append("'")
        elif b == 0x40:
            chars.append('.')
        elif b == 0x41:
            chars.append(',')
        elif b == 0x42:
            chars.append('-')
        elif b == 0x43:
            chars.append('?')
        elif b == 0x44:
            chars.append('!')
        elif b == 0xFF:
            chars.append('|')  # END marker
        elif b == 0xFD:
            chars.append('\n')  # LINE
        else:
            chars.append(f'[{b:02X}]')
    return ''.join(chars)


def encode(text):
    """Encode text to bytes for searching."""
    result = []
    for c in text:
        if c == ' ':
            result.append(0x00)
        elif c.isdigit():
            result.append(int(c) + 1)
        elif 'a' <= c <= 'z':
            result.append(ord(c) - ord('a') + 0x0B)
        elif 'A' <= c <= 'Z':
            result.append(ord(c) - ord('A') + 0x25)
    return bytes(result)


def main():
    with open(ROM_PATH, 'rb') as f:
        rom = f.read()

    print("=" * 70)
    print(" DRAGON WARRIOR IV - GAME TEXT SCANNER")
    print("=" * 70)

    # Search patterns - common game terms
    search_terms = [
        "Slime",
        "Dragon",
        "Metal",
        "King",
        "heal",
        "Gold",
        "Hero",
        "Chapter",
        "Attack",
        "Defend",
        "Magic",
        "Spell",
        "Item",
        "Equip",
        "weapon",
        "armor",
        "shield",
        "helmet",
        "Casino",
        "Royal",
        "Flush",
        "Tower",
        "Castle",
        "Cave",
        "Village",
        "Town",
        "HP",
        "MP",
        "Level",
        "EXP",
    ]

    found_banks = {}

    for term in search_terms:
        pattern = encode(term)
        if not pattern:
            continue

        for bank in range(32):
            bank_offset = 16 + bank * 0x4000
            bank_data = rom[bank_offset:bank_offset + 0x4000]

            pos = 0
            while True:
                pos = bank_data.find(pattern, pos)
                if pos < 0:
                    break

                addr = 0x8000 + pos

                # Get context
                start = max(0, pos - 10)
                end = min(len(bank_data), pos + len(pattern) + 30)
                context = bank_data[start:end]
                text = decode(context)

                key = f"Bank {bank:2d}"
                if key not in found_banks:
                    found_banks[key] = []
                found_banks[key].append({
                    'term': term,
                    'addr': addr,
                    'text': text.strip()
                })

                pos += 1

    # Print results grouped by bank
    print("\nResults by bank:")
    print("-" * 70)

    for bank_name in sorted(found_banks.keys()):
        entries = found_banks[bank_name]
        print(f"\n{bank_name}:")
        seen_addrs = set()
        for entry in entries:
            if entry['addr'] not in seen_addrs:
                seen_addrs.add(entry['addr'])
                preview = entry['text'].replace('\n', ' ')[:60]
                print(f"  ${entry['addr']:04X}: [{entry['term']:8s}] {preview}")

    # Find strings in banks with most hits
    print("\n" + "=" * 70)
    print(" TOP TEXT BANKS")
    print("=" * 70)

    bank_counts = {}
    for bank_name, entries in found_banks.items():
        bank_num = int(bank_name.split()[1])
        bank_counts[bank_num] = len(entries)

    for bank, count in sorted(bank_counts.items(), key=lambda x: -x[1])[:10]:
        print(f"  Bank {bank:2d}: {count} matches")


if __name__ == '__main__':
    main()
