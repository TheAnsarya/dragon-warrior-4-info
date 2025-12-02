#!/usr/bin/env python3
"""
Extract menu and UI text from Dragon Warrior IV Bank 22.

This bank contains:
- Battle commands: FIGHT, TACTICS, SPELL, ITEM, ATTACK, PARRY, etc.
- Menu options: ADVENTURE LOG, SWITCH, REMOVE, ADD
- System messages: "Do you want to erase this quest?"
"""

ROM_PATH = r"c:\Users\me\source\repos\dragon-warrior-4-info\roms\Dragon Warrior IV (1992-10)(Enix)(US).nes"

# TBL
TBL = {0x00: ' '}
for i in range(10):
    TBL[0x01 + i] = str(i)
for i, c in enumerate('abcdefghijklmnopqrstuvwxyz'):
    TBL[0x0B + i] = c
for i, c in enumerate('ABCDEFGHIJKLMNOPQRSTUVWXYZ'):
    TBL[0x25 + i] = c
TBL[0x65] = '-'
TBL[0x66] = '"'
TBL[0x67] = '"'
TBL[0x68] = "'"
TBL[0x69] = "'"
TBL[0x6A] = "'"
TBL[0x6B] = "'"
TBL[0x6D] = '?'
TBL[0x6E] = '!'
TBL[0x6F] = '-'
TBL[0x70] = '*'
TBL[0x71] = ':'
TBL[0x72] = '…'
TBL[0x75] = '('
TBL[0x76] = ')'
TBL[0x77] = ','
TBL[0x78] = '.'
TBL[0xFF] = '<END>'
TBL[0xFD] = '<LINE>'
TBL[0xFE] = '<FE>'

def decode(b):
    return TBL.get(b, f'<{b:02X}>')

def is_text_char(b):
    """Check if byte is a text character."""
    return b <= 0x3E or 0x65 <= b <= 0x78 or b in [0xFD, 0xFE, 0xFF]

def extract_strings(rom, bank_start, bank_num):
    """Extract readable strings from a bank."""
    strings = []
    bank_end = bank_start + 0x4000
    
    i = bank_start
    while i < bank_end:
        # Look for start of text (text char that isn't space)
        if is_text_char(rom[i]) and rom[i] != 0x00:
            # Count consecutive text chars
            start = i
            length = 0
            while i < bank_end and is_text_char(rom[i]):
                if rom[i] == 0xFF:
                    length += 1
                    i += 1
                    break
                length += 1
                i += 1
            
            # If we got a decent run of text, extract it
            if length >= 4:
                segment = rom[start:start + length]
                decoded = ''.join(decode(b) for b in segment)
                # Filter out junk (mostly spaces or control codes)
                text_only = decoded.replace('<END>', '').replace('<LINE>', '').replace('<FE>', '').strip()
                if len(text_only) >= 3 and any(c.isalpha() for c in text_only):
                    cpu_addr = 0x8000 + (start - bank_start)
                    strings.append((start, cpu_addr, decoded.strip()))
        else:
            i += 1
    
    return strings

def main():
    with open(ROM_PATH, 'rb') as f:
        rom = f.read()
    
    print("=" * 80)
    print("DRAGON WARRIOR IV - MENU/UI TEXT EXTRACTION")
    print("=" * 80)
    
    # Known good banks with menu text
    menu_banks = [
        (17, 0x44010, "Battle/Command text"),
        (22, 0x58010, "Menu/UI text"),
        (23, 0x5C010, "Casino text"),
        (27, 0x6C010, "Chapter titles"),
    ]
    
    all_strings = []
    
    for bank_num, bank_start, description in menu_banks:
        print(f"\n--- Bank {bank_num}: {description} ---")
        strings = extract_strings(rom, bank_start, bank_num)
        print(f"Found {len(strings)} strings")
        
        for rom_offset, cpu_addr, text in strings:
            # Show unique/interesting strings
            if len(text) > 3 and not text.startswith('<'):
                all_strings.append((bank_num, rom_offset, cpu_addr, text))
    
    # Now show all unique strings, sorted by content
    print("\n" + "=" * 80)
    print("ALL EXTRACTED MENU/UI STRINGS")
    print("=" * 80)
    
    seen = set()
    for bank, rom_off, cpu, text in all_strings:
        # Clean text for dedup
        clean = text.replace('<END>', '').replace('<LINE>', '').strip()
        if clean not in seen and len(clean) >= 3:
            seen.add(clean)
            print(f"Bank {bank:2d} ${cpu:04X}: {text[:70]}")
    
    # Now search all banks for readable strings
    print("\n" + "=" * 80)
    print("SEARCHING ALL BANKS FOR TEXT")
    print("=" * 80)
    
    for bank in range(32):
        bank_start = 0x10 + bank * 0x4000
        strings = extract_strings(rom, bank_start, bank)
        
        # Filter to only long, interesting strings
        good_strings = []
        for rom_off, cpu, text in strings:
            clean = text.replace('<END>', '').replace('<LINE>', '').strip()
            # Has at least 6 chars and contains a-z or A-Z
            if len(clean) >= 6 and any(c.isalpha() for c in clean):
                good_strings.append((rom_off, cpu, text))
        
        if good_strings:
            print(f"\nBank {bank}: {len(good_strings)} meaningful strings")
            for rom_off, cpu, text in good_strings[:10]:
                print(f"  ${cpu:04X}: {text[:60]}")

if __name__ == "__main__":
    main()
