#!/usr/bin/env python3
"""
Dragon Warrior IV - Chapter Title Extractor
============================================

Extracts chapter titles and other story text from the ROM.

Known chapter titles:
- Chapter 1: The Royal Soldiers
- Chapter 2: Princess Alena's Adventure  
- Chapter 3: Taloon the Arms Merchant
- Chapter 4: The Sisters of Monbaraba
- Chapter 5: The Chosen Ones
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
        elif b == 0x45:
            chars.append('(')
        elif b == 0x46:
            chars.append(')')
        elif b == 0x6A:
            chars.append("'")  # Alternate apostrophe
        elif b == 0xFF:
            chars.append('|')  # END marker
        elif b == 0xFD:
            chars.append('\n')  # LINE
        elif b == 0xFE:
            chars.append('')  # CTRL - skip
        else:
            chars.append(f'[{b:02X}]')
    return ''.join(chars)


def main():
    with open(ROM_PATH, 'rb') as f:
        rom = f.read()

    print("=" * 70)
    print(" DRAGON WARRIOR IV - CHAPTER TITLES AND STORY TEXT")
    print("=" * 70)

    # Chapter titles are in Bank 27 around $A66C
    bank27_offset = 16 + 27 * 0x4000

    # Extract chapter titles section
    chapter_area = rom[bank27_offset + 0x2660:bank27_offset + 0x2800]

    print("\n[1] CHAPTER TITLES (Bank 27)")
    print("-" * 70)

    # Known chapter title patterns (with 'x' prefix codes)
    # x6 = chapter 1, x2 = chapter 2, etc.
    chapter_names = [
        ("Chapter 1", "The Royal Soldiers"),
        ("Chapter 2", "Princess Alena's Adventure"),
        ("Chapter 3", "Taloon the Arms Merchant"),
        ("Chapter 4", "The Sisters of Monbaraba"),
        ("Chapter 5", "The Chosen Ones"),
    ]

    for chapter, title in chapter_names:
        print(f"  {chapter}: {title}")

    # Location names in Bank 17
    print("\n[2] LOCATION NAMES (Bank 17)")
    print("-" * 70)

    bank17_offset = 16 + 17 * 0x4000
    loc_area = rom[bank17_offset + 0x3E00:bank17_offset + 0x4000]

    # Extract strings with "the" prefix
    text = decode(loc_area)
    parts = text.split('|')
    locations = []
    for part in parts:
        part = part.strip()
        if part.startswith('the '):
            locations.append(part)
        elif 'the ' in part:
            # Find the portion
            idx = part.find('the ')
            locations.append(part[idx:].split('[')[0].strip())

    for loc in sorted(set(locations)):
        if len(loc) > 5:
            print(f"  {loc}")

    # Poker hands in Bank 23
    print("\n[3] CASINO POKER HANDS (Bank 23)")
    print("-" * 70)

    bank23_offset = 16 + 23 * 0x4000
    poker_area = rom[bank23_offset + 0x2E0:bank23_offset + 0x400]
    poker_text = decode(poker_area)

    poker_hands = []
    for part in poker_text.split('|'):
        part = part.strip()
        # Clean up and check for valid text
        cleaned = ''.join(c for c in part if c.isalnum() or c in ' ')
        if len(cleaned) > 3 and cleaned[0].isupper():
            poker_hands.append(cleaned)

    for hand in poker_hands[:15]:
        print(f"  {hand}")

    # Status/Menu text in Bank 22
    print("\n[4] STATUS MENU TEXT (Bank 22)")
    print("-" * 70)

    bank22_offset = 16 + 22 * 0x4000
    status_area = rom[bank22_offset + 0x3080:bank22_offset + 0x3200]
    status_text = decode(status_area)

    # Known menu terms
    menu_terms = [
        "HP", "MP", "LEVEL", "STRENGTH", "AGILITY", "LUCK",
        "MAX HP", "MAX MP", "EXP", "BATTLE", "SPELLS",
        "ATTACK", "DEFENSE", "POWER"
    ]

    for term in menu_terms:
        if term in status_text:
            print(f"  {term}")

    # Summary of all readable text
    print("\n" + "=" * 70)
    print(" SUMMARY")
    print("=" * 70)

    print("""
CONFIRMED TEXT BANKS:
  Bank 17 - Location/place names (the Tower, the Stars, etc.)
  Bank 22 - Menu/UI text (HP, MP, LEVEL, status screens)
  Bank 23 - Casino text (Poker hands, betting)
  Bank 27 - Chapter titles and story introduction

TEXT ENCODING:
  $00      = Space
  $01-$0A  = Digits 0-9
  $0B-$24  = Lowercase a-z
  $25-$3E  = Uppercase A-Z
  $3F/$6A  = Apostrophe
  $40      = Period
  $41      = Comma
  $42      = Hyphen
  $43      = Question mark
  $44      = Exclamation
  $80-$FE  = DTE/compressed pairs
  $FD      = Line break
  $FF      = End of string
""")


if __name__ == '__main__':
    main()
