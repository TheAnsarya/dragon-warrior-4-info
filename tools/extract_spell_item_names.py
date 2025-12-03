#!/usr/bin/env python3
"""
Dragon Warrior IV (NES) - Spell and Item Name Extractor

Searches the ROM for known spell and item names and documents their locations.
Also attempts to find tables of names by looking for patterns.

Usage:
    python extract_spell_item_names.py [ROM_PATH]
"""

import sys
import json
from pathlib import Path

ROM_PATH = Path(__file__).parent.parent / "roms" / "Dragon Warrior IV (1992-10)(Enix)(US).nes"

# Text encoding
def encode_text(s):
    """Encode text using DW4's custom encoding."""
    result = []
    for c in s:
        if c == ' ':
            result.append(0x00)
        elif c.isdigit():
            result.append(ord(c) - ord('0') + 1)
        elif c.islower():
            result.append(ord(c) - ord('a') + 0x0B)
        elif c.isupper():
            result.append(ord(c) - ord('A') + 0x25)
        elif c == "'":
            result.append(0x49)
        elif c == '-':
            result.append(0x4B)
    return bytes(result)

def decode_char(b):
    """Decode a single byte to a character."""
    if b == 0x00: return ' '
    elif 0x01 <= b <= 0x0A: return chr(ord('0') + b - 1)
    elif 0x0B <= b <= 0x24: return chr(ord('a') + b - 0x0B)
    elif 0x25 <= b <= 0x3E: return chr(ord('A') + b - 0x25)
    elif b == 0x45: return ','
    elif b == 0x46: return '.'
    elif b == 0x47: return '?'
    elif b == 0x48: return '!'
    elif b == 0x49: return "'"
    elif b == 0x4A: return ':'
    elif b == 0x4B: return '-'
    elif b == 0x4C: return '&'
    else: return None

def decode_text(data, max_len=20):
    """Decode a sequence of bytes to text."""
    result = []
    for b in data[:max_len]:
        c = decode_char(b)
        if c:
            result.append(c)
        elif b >= 0x80 and b != 0xFF:
            break  # DTE or control code
        elif b == 0xFF:
            break  # END marker
        else:
            break
    return ''.join(result)

# Known spell names from Dragon Warrior IV
KNOWN_SPELLS = [
    # Healing
    "Heal", "Healmore", "Healall", "Healus", "Healusall",
    "Antidote", "Vivify", "Revive",
    # Attack magic
    "Blaze", "Blazemore", "Blazemost",
    "Firebal", "Firebane", "Firevolt",
    "Icebolt", "Snowstorm", "Blizzard",
    "Bang", "Boom", "Explodet",
    "Zap", "Zapmore", "Thordain",
    "Vacuum",
    # Status effects
    "Sleep", "Sleepmore",
    "Surround", "Chaos",
    "Sap", "Defense",
    "Bikill", "Increase",
    "Bounce", "Barrier", "Stopspell",
    "Expel", "Beat", "Defeat",
    "Limbo", "Sacrifice",
    # Travel/utility
    "Return", "Outside", "Stepguard", "Repel",
    "Transform", "Chance", "Ironize",
    "Day-Night", "Robmagic", "Farewell",
    # Other
    "Infernost", "Lightning", "Infernos",
]

# Known item names from Dragon Warrior IV
KNOWN_ITEMS = [
    # Consumables
    "Medical Herb", "Antidote Herb", "Fairy Water", 
    "Wing of Wyvern", "Chimaera Wing",
    "Full Moon Herb", "Moonwort Bulb",
    "Yggdrasil Leaf", "World Leaf",
    "Sage's Stone", "Stone of Drought",
    "Lamp of Darkness", "Magic Key",
    "Thief's Key", "Final Key",
    "Small Medal", "Lottery Ticket",
    "Casino Coins", "Monster Medal",
    # Weapons
    "Copper Sword", "Thorn Whip", "Iron Claw",
    "Club", "Oaken Club", "Giant Mallet",
    "Cypress Stick", "Iron Fan", "Poison Needle",
    "Staff of Thunder", "Staff of Antimagic",
    "Staff of Jubilation", "Staff of Punishment",
    "Staff of Force", "Staff of Transform",
    "Sword of Miracles", "Sword of Lethargy",
    "Sword of Decimation", "Multi-edge Sword",
    "Demon Hammer", "Zenithian Sword",
    # Armor
    "Leather Armor", "Chain Mail", "Iron Armor",
    "Full Plate Armor", "Magic Armor", "Dragon Mail",
    "Zenithian Armor", "Angel Leotard",
    "Cloak of Evasion", "Pink Leotard",
    "Dancer's Costume", "Divine Bustier",
    "Fur Coat", "Silk Robe",
    # Shields
    "Leather Shield", "Scale Shield", "Iron Shield",
    "Magic Shield", "Dragon Shield", "Zenithian Shield",
    "Shield of Strength", "Shield of Sorrow",
    # Helmets
    "Leather Hat", "Wooden Hat", "Iron Mask",
    "Iron Helmet", "Golden Tiara", "Hat of Happiness",
    "Zenithian Helm", "Mask of Corruption",
    # Accessories
    "Meteorite Armband", "Golden Bracelet",
    "Dragon Amulet", "Ring of Life",
    "Ring of Prayer", "Ruby of Protection",
]

def search_names(rom_data, names, category):
    """Search for a list of names in the ROM."""
    results = []
    
    for name in names:
        encoded = encode_text(name)
        if len(encoded) < 3:
            continue
            
        pos = 0
        occurrences = []
        while True:
            pos = rom_data.find(encoded, pos)
            if pos == -1:
                break
            
            bank = pos // 0x4000
            bank_offset = pos % 0x4000 + 0x8000
            occurrences.append({
                'rom_offset': pos,
                'bank': bank,
                'bank_addr': bank_offset
            })
            pos += 1
        
        if occurrences:
            results.append({
                'name': name,
                'category': category,
                'encoded_length': len(encoded),
                'occurrences': occurrences
            })
    
    return results

def find_text_tables(rom_data):
    """Look for potential tables of text strings."""
    tables = []
    
    # Look for areas with many sequential readable strings
    for bank in range(32):
        bank_start = bank * 0x4000 + 0x10
        bank_data = rom_data[bank_start:bank_start + 0x4000]
        
        # Scan for potential string tables
        i = 0
        while i < len(bank_data) - 10:
            # Check if this looks like a capitalized word start
            if 0x25 <= bank_data[i] <= 0x3E:  # A-Z
                # Try to read a string
                text = decode_text(bank_data[i:i+16])
                if len(text) >= 3 and text[0].isupper():
                    # Count consecutive strings
                    string_count = 0
                    pos = i
                    strings_found = []
                    
                    while pos < len(bank_data) - 10 and string_count < 50:
                        t = decode_text(bank_data[pos:pos+20])
                        if len(t) >= 3 and t[0].isupper():
                            # Find end of this string
                            end = pos
                            while end < pos + 20 and end < len(bank_data):
                                b = bank_data[end]
                                if b == 0xFF or b == 0x00:
                                    break
                                if b >= 0x80 and b != 0xFF:
                                    break  # DTE
                                end += 1
                            
                            actual_text = decode_text(bank_data[pos:end])
                            if len(actual_text) >= 3:
                                strings_found.append(actual_text.strip())
                                string_count += 1
                                pos = end + 1
                            else:
                                break
                        else:
                            break
                    
                    if string_count >= 5:
                        tables.append({
                            'bank': bank,
                            'bank_offset': i + 0x8000,
                            'rom_offset': bank_start + i,
                            'string_count': string_count,
                            'sample_strings': strings_found[:10]
                        })
                        i = pos
                        continue
            i += 1
    
    return tables

def main():
    rom_path = Path(sys.argv[1]) if len(sys.argv) > 1 else ROM_PATH
    
    with open(rom_path, 'rb') as f:
        rom_data = f.read()
    
    print("=" * 70)
    print("Dragon Warrior IV - Spell and Item Name Extractor")
    print("=" * 70)
    print()
    
    # Search for spell names
    print("Searching for spell names...")
    spell_results = search_names(rom_data, KNOWN_SPELLS, 'spell')
    
    print(f"\nFound {len(spell_results)} spell names:")
    print("-" * 50)
    for result in sorted(spell_results, key=lambda x: x['occurrences'][0]['rom_offset']):
        occ = result['occurrences'][0]
        print(f"  {result['name']:20s} Bank {occ['bank']:2d} ${occ['bank_addr']:04X} (ROM 0x{occ['rom_offset']:05X})")
    
    # Search for item names
    print("\n" + "=" * 70)
    print("Searching for item names...")
    item_results = search_names(rom_data, KNOWN_ITEMS, 'item')
    
    print(f"\nFound {len(item_results)} item names:")
    print("-" * 50)
    for result in sorted(item_results, key=lambda x: x['occurrences'][0]['rom_offset']):
        occ = result['occurrences'][0]
        print(f"  {result['name']:20s} Bank {occ['bank']:2d} ${occ['bank_addr']:04X} (ROM 0x{occ['rom_offset']:05X})")
    
    # Look for text tables
    print("\n" + "=" * 70)
    print("Searching for text tables...")
    tables = find_text_tables(rom_data)
    
    print(f"\nFound {len(tables)} potential text tables:")
    print("-" * 50)
    for table in sorted(tables, key=lambda x: -x['string_count'])[:20]:
        print(f"\n  Bank {table['bank']} ${table['bank_offset']:04X} ({table['string_count']} strings)")
        for s in table['sample_strings'][:5]:
            print(f"    - {s}")
    
    # Save results
    output = {
        'spells_found': spell_results,
        'items_found': item_results,
        'text_tables': tables[:30]
    }
    
    output_path = Path(__file__).parent.parent / "extracted" / "spell_item_names.json"
    with open(output_path, 'w', encoding='utf-8') as f:
        json.dump(output, f, indent=2)
    print(f"\n\nResults saved to: {output_path}")
    
    # Summary
    print("\n" + "=" * 70)
    print("SUMMARY")
    print("=" * 70)
    print(f"Spell names found: {len(spell_results)}/{len(KNOWN_SPELLS)}")
    print(f"Item names found:  {len(item_results)}/{len(KNOWN_ITEMS)}")
    print(f"Text tables found: {len(tables)}")
    
    # Not found
    found_spell_names = {r['name'] for r in spell_results}
    found_item_names = {r['name'] for r in item_results}
    
    missing_spells = [s for s in KNOWN_SPELLS if s not in found_spell_names]
    missing_items = [i for i in KNOWN_ITEMS if i not in found_item_names]
    
    if missing_spells:
        print(f"\nSpells not found ({len(missing_spells)}):")
        for s in missing_spells[:10]:
            print(f"  - {s}")
        if len(missing_spells) > 10:
            print(f"  ... and {len(missing_spells)-10} more")
    
    if missing_items:
        print(f"\nItems not found ({len(missing_items)}):")
        for i in missing_items[:10]:
            print(f"  - {i}")
        if len(missing_items) > 10:
            print(f"  ... and {len(missing_items)-10} more")

if __name__ == "__main__":
    main()
