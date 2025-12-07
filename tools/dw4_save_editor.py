#!/usr/bin/env python3
"""
Dragon Warrior IV Save State and SRAM Editor
Supports Mesen .mss save states and .sav SRAM files
"""

import struct
import tkinter as tk
from tkinter import ttk, filedialog, messagebox
from pathlib import Path
from dataclasses import dataclass
from typing import Optional, List, Dict

# Character constants
CHARACTERS = [
    ("Hero", 0x6001),
    ("Cristo", 0x601F),
    ("Nara", 0x603D),
    ("Mara", 0x605B),
    ("Brey", 0x6079),
    ("Taloon", 0x6097),
    ("Ragnar", 0x60B5),
    ("Alena", 0x60D3),
]

# Character data offsets within 30-byte structure
CHAR_OFFSETS = {
    'status': 0,      # Status/ailments byte
    'hp_lo': 1,       # Current HP low byte
    'hp_hi': 2,       # Current HP high byte
    'mp_lo': 3,       # Current MP low byte
    'mp_hi': 4,       # Current MP high byte
    'level': 5,       # Level
    'strength': 6,    # Strength
    'agility': 7,     # Agility
    'vitality': 8,    # Vitality
    'intelligence': 9,  # Intelligence
    'luck': 10,       # Luck
    'unknown': 11,    # Unknown byte
    'max_hp_lo': 12,  # Max HP low byte
    'max_hp_hi': 13,  # Max HP high byte
    'max_mp_lo': 14,  # Max MP low byte
    'max_mp_hi': 15,  # Max MP high byte
    'xp_lo': 16,      # XP low byte
    'xp_mid': 17,     # XP middle byte
    'xp_hi': 18,      # XP high byte
    'item1': 19,      # Item slot 1
    'item2': 20,      # Item slot 2
    'item3': 21,      # Item slot 3
    'item4': 22,      # Item slot 4
    'item5': 23,      # Item slot 5
    'item6': 24,      # Item slot 6
    'item7': 25,      # Item slot 7
    'item8': 26,      # Item slot 8
    'spells1': 27,    # Battle spells byte 1
    'spells2': 28,    # Battle spells byte 2
    'spells3': 29,    # Overworld spells
}

# General game data addresses (WRAM $6000 base)
GAME_ADDRS = {
    'gold': 0x6157,           # 3 bytes
    'chapter': 0x615A,        # 1 byte
    'tactics': 0x615B,        # 1 byte
    'return_loc1': 0x6165,    # Return spell locations (3 bytes)
    'return_loc2': 0x6166,
    'return_loc3': 0x6167,
    'party_order': 0x616A,    # 4 bytes
    'treasure_start': 0x625D, # 27 bytes
    'casino_coins': 0x62AD,   # 3 bytes
    'day_night': 0x62ED,      # 1 byte
}

# Status flag bits
STATUS_FLAGS = {
    'alive': 0x80,
    'paralyzed': 0x40,
    'poisoned': 0x20,
}

# Character spells - each character has unique spell sets
HERO_SPELLS = {
    'battle1': [('Expel', 0x01), ('Healmore', 0x02), ('Blaze', 0x04), ('Return', 0x08),
                ('Sleepmore', 0x10), ('Awake', 0x20), ('Firebal', 0x40), ('Healall', 0x80)],
    'battle2': [('Ironize', 0x01), ('FendSpell', 0x02), ('Zap', 0x04), ('Transform', 0x08),
                ('Boom', 0x10), ('Healusall', 0x20), ('Lightning', 0x40), ('Vivify', 0x80)],
    'overworld': [('Thordain', 0x01), ('Chance', 0x02), ('Return', 0x04), ('Healmore', 0x08),
                  ('Repel', 0x10), ('Outside', 0x20), ('Healall', 0x40), ('Vivify', 0x80)],
}

CRISTO_SPELLS = {
    'battle1': [('Upper', 0x01), ('Heal', 0x02), ('Surround', 0x04), ('Healmore', 0x08),
                ('StopSpell', 0x10), ('Healall', 0x20), ('Increase', 0x40), ('Healus', 0x80)],
    'battle2': [('Beat', 0x01), ('Vivify', 0x02), ('Defeat', 0x04), ('Revive', 0x08),
                ('n/a', 0x10), ('n/a', 0x20), ('n/a', 0x40), ('n/a', 0x80)],
    'overworld': [('Heal', 0x01), ('Antidote', 0x02), ('Healmore', 0x04), ('Vivify', 0x08),
                  ('Healall', 0x10), ('Healus', 0x20), ('Revive', 0x40), ('n/a', 0x80)],
}

NARA_SPELLS = {
    'battle1': [('Infernos', 0x01), ('Heal', 0x02), ('Sleep', 0x04), ('Healmore', 0x08),
                ('NumbOff', 0x10), ('Healall', 0x20), ('Infermore', 0x40), ('Barrior', 0x80)],
    'battle2': [('Sleepmore', 0x01), ('Vivify', 0x02), ('Infermost', 0x04), ('Farewell', 0x08),
                ('n/a', 0x10), ('n/a', 0x20), ('n/a', 0x40), ('n/a', 0x80)],
    'overworld': [('Heal', 0x01), ('NumbOff', 0x02), ('Healmore', 0x04), ('Vivify', 0x08),
                  ('Healall', 0x10), ('n/a', 0x20), ('n/a', 0x40), ('n/a', 0x80)],
}

MARA_SPELLS = {
    'battle1': [('Blaze', 0x01), ('Sap', 0x02), ('Firebal', 0x04), ('RobMagic', 0x08),
                ('Bang', 0x10), ('BeDragon', 0x20), ('Blazemore', 0x40), ('Blazemost', 0x80)],
    'battle2': [('Firebane', 0x01), ('Firevolt', 0x02), ('Boom', 0x04), ('Explodet', 0x08),
                ('n/a', 0x10), ('n/a', 0x20), ('n/a', 0x40), ('n/a', 0x80)],
    'overworld': [('Return', 0x01), ('Outside', 0x02), ('StepGuard', 0x04), ('n/a', 0x08),
                  ('n/a', 0x10), ('n/a', 0x20), ('n/a', 0x40), ('n/a', 0x80)],
}

BREY_SPELLS = {
    'battle1': [('IceBolt', 0x01), ('Sap', 0x02), ('Snowstorm', 0x04), ('Bounce', 0x08),
                ('Icespears', 0x10), ('Return', 0x20), ('RobMagic', 0x40), ('Defence', 0x80)],
    'battle2': [('Chaos', 0x01), ('SpeedUp', 0x02), ('Blizzard', 0x04), ('Bikill', 0x08),
                ('n/a', 0x10), ('n/a', 0x20), ('n/a', 0x40), ('n/a', 0x80)],
    'overworld': [('Return', 0x01), ('Outside', 0x02), ('Day-Night', 0x04), ('X-Ray', 0x08),
                  ('n/a', 0x10), ('n/a', 0x20), ('n/a', 0x40), ('n/a', 0x80)],
}

CHARACTER_SPELLS = {
    'Hero': HERO_SPELLS,
    'Cristo': CRISTO_SPELLS,
    'Nara': NARA_SPELLS,
    'Mara': MARA_SPELLS,
    'Brey': BREY_SPELLS,
    'Taloon': None,  # No spells
    'Ragnar': None,  # No spells
    'Alena': None,   # No spells
}

# Chapters
CHAPTERS = {
    1: "Chapter 1 - Ragnar",
    2: "Chapter 2 - Alena",
    3: "Chapter 3 - Taloon",
    4: "Chapter 4 - Sisters",
    5: "Chapter 5 - Hero",
}

# Tactics
TACTICS = {
    0: "Use No MP",
    1: "Normal",
    2: "Offensive",
    3: "Defensive",
    4: "Save MP",
}

# Item IDs - Complete list
ITEMS = {
    0x00: "(Empty)",
    # Weapons
    0x01: "Cypress Stick",
    0x02: "Club",
    0x03: "Copper Sword",
    0x04: "Thorn Whip",
    0x05: "Hunter's Bow",
    0x06: "Boomerang",
    0x07: "Iron Spear",
    0x08: "Iron Claw",
    0x09: "Chain Sickle",
    0x0A: "Broad Sword",
    0x0B: "Iron Fan",
    0x0C: "Staff of Force",
    0x0D: "Morning Star",
    0x0E: "Battle Axe",
    0x0F: "Sword of Malice",
    0x10: "Ice Blade",
    0x11: "Fire Claw",
    0x12: "Staff of Antimagic",
    0x13: "Sword of Miracles",
    0x14: "Magma Staff",
    0x15: "Multi-edge Sword",
    0x16: "Sword of Decimation",
    0x17: "Falcon Sword",
    0x18: "Dream Blade",
    0x19: "Staff of Jubilation",
    0x1A: "Dragon Killer",
    0x1B: "Zombie Slayer",
    0x1C: "Demon Hammer",
    0x1D: "Sword of Lethargy",
    0x1E: "Staff of Thunder",
    0x1F: "Staff of Punishment",
    0x20: "Stilleto Earrings",
    0x21: "Metal Babble Sword",
    0x22: "Zenithian Sword",
    # Armor
    0x28: "Clothes",
    0x29: "Traveler's Clothes",
    0x2A: "Wayfarer's Clothes",
    0x2B: "Leather Armor",
    0x2C: "Chain Mail",
    0x2D: "Bronze Armor",
    0x2E: "Iron Armor",
    0x2F: "Half Plate Armor",
    0x30: "Full Plate Armor",
    0x31: "Cloak of Evasion",
    0x32: "Magic Armor",
    0x33: "Dragon Mail",
    0x34: "Demon Armor",
    0x35: "Zenithian Armor",
    0x36: "Sacred Robe",
    0x37: "Pink Leotard",
    0x38: "Dancer's Costume",
    0x39: "Mysterious Bolero",
    0x3A: "Water Flying Clothes",
    0x3B: "Dress of Radiance",
    0x3C: "Robe of Serenity",
    0x3D: "Metal Babble Armor",
    0x3E: "Zombie Mail",
    # Shields
    0x40: "Leather Shield",
    0x41: "Scale Shield",
    0x42: "Iron Shield",
    0x43: "Dragon Shield",
    0x44: "Magic Shield",
    0x45: "Aeolus' Shield",
    0x46: "Mirror Shield",
    0x47: "Zenithian Shield",
    0x48: "Metal Babble Shield",
    # Helmets
    0x4A: "Leather Hat",
    0x4B: "Hardwood Headware",
    0x4C: "Iron Helmet",
    0x4D: "Iron Mask",
    0x4E: "Golden Barrette",
    0x4F: "Feather Hat",
    0x50: "Mask of Corruption",
    0x51: "Hat of Happiness",
    0x52: "Zenithian Helm",
    0x53: "Metal Babble Helm",
    # Consumables
    0x58: "Medical Herb",
    0x59: "Antidote Herb",
    0x5A: "Full Moon Herb",
    0x5B: "Fairy Water",
    0x5C: "Wing of Wyvern",
    0x5D: "Dew of World Tree",
    0x5E: "Magic Water",
    0x5F: "Magic Potion",
    # Seeds
    0x60: "Strength Seed",
    0x61: "Agility Seed",
    0x62: "Luck Seed",
    0x63: "Lifeforce Nuts",
    0x64: "Mystic Acorns",
    # Accessories
    0x68: "Meteorite Armband",
    0x69: "Golden Bracelet",
    # Key items
    0x70: "Thief's Key",
    0x71: "Magic Key",
    0x72: "Final Key",
    0x73: "Symbol of Faith",
    0x74: "Silver Statuette",
    0x75: "Gunpowder Jar",
    0x76: "Gas Canister",
    0x77: "Padequia Seed",
    0x78: "Stone of Drought",
    0x79: "Baron's Horn",
    0x7A: "Magma Rock",
    0x7B: "Fire of Serenity",
    0x7C: "Sphere of Silence",
    0x7D: "Lamp of Darkness",
    0x7E: "Flute of Uncovering",
    0x7F: "Flying Shoes",
    0x80: "Zenithian Helm",
    0x81: "Boarding Pass",
    0x82: "Small Medal",
    0x83: "Staff of Transform",
    0x84: "Silver Tarot Cards",
    0x85: "Sandglass of Regression",
    0x86: "Iron Safe",
}

# Treasure chest descriptions - (byte_offset, bit_index) -> (location, reward)
# byte_offset is relative to $625d (treasure_start)
TREASURE_INFO = {
    # $625d
    (0, 0): ("Burland Castle F1, left group, bottom-left", "Agility Seed"),
    (0, 1): ("Burland Castle F1, left group, top-right", "Iron Helmet"),
    (0, 2): ("Burland Castle F1, left group, top-middle", "160 gold"),
    (0, 3): ("Burland Castle F1, left group, top-left", "Lifeforce Nuts"),
    (0, 4): ("Santeem F1, top-middle, right", "Magma Staff"),
    (0, 5): ("Santeem F1, top-middle, middle", "Flute of Uncovering"),
    (0, 6): ("Santeem F1, top-middle, left", "Strength Seed"),
    (0, 7): ("Keeleon B1, Jail, bottom", "Boarding Pass"),
    # $625e
    (1, 2): ("Dire Palace B1, 4-Chest Room, bottom-right", "⚠️ Mimic!"),
    (1, 3): ("Dire Palace B1, 4-Chest Room, bottom-left", "⚠️ Mimic!"),
    (1, 4): ("Dire Palace B1, 4-Chest Room, top-right", "Aeolus' Shield"),
    (1, 5): ("Dire Palace B1, 4-Chest Room, top-left", "Small Medal"),
    (1, 6): ("Burland Castle F1, left group, bottom-right", "320 gold"),
    (1, 7): ("Burland Castle F1, left group, bottom-middle", "Strength Seed"),
    # $625f
    (2, 2): ("Endor Castle F3, right room, bottom", "Feather Hat"),
    (2, 3): ("Endor Castle F3, right room, top", "Pink Leotard"),
    (2, 4): ("Endor Castle B1", "Lifeforce Nuts"),
    (2, 5): ("Endor, Bottom-right building F1, bottom", "Multi-edge Sword"),
    (2, 6): ("Endor, Bottom-right building F1, top", "Strength Seed"),
    # $6260
    (3, 1): ("Gardenbur B1, Flowers", "Zenithian Shield"),
    (3, 2): ("Gardenbur B1, behind throne stairs", "Fire Claw"),
    (3, 3): ("Branca, top-left, bottom", "Small Medal"),
    (3, 4): ("Branca, top-left, top-right", "120 gold"),
    (3, 5): ("Branca, top-left, top-left", "Mystic Acorns"),
    # $6261
    (4, 0): ("Aktemto Mine B1, top", "Silver Tarot Cards"),
    (4, 1): ("Desert Inn, top", "Lunch"),
    (4, 2): ("Kievs, Top-right house B1", "Empty!"),
    (4, 3): ("Lakanaba Shop B1, top-left group, right", "Chain Sickle"),
    (4, 4): ("Lakanaba Shop B1, top-left group, middle", "Ice Blade"),
    (4, 5): ("Lakanaba Shop B1, top-left group, left", "Strength Seed"),
    # $6262
    (5, 0): ("Aktemto Mine Ruins F1, bottom-right, right", "⚠️ Mimic!"),
    (5, 1): ("Aktemto Mine Ruins F1, bottom-right, left", "Small Medal"),
    (5, 2): ("Aktemto Mine Ruins F1, middle, right room", "Small Medal"),
    (5, 3): ("Aktemto Mine Ruins F1, middle, left room", "⚠️ Mimic!"),
    (5, 4): ("Aktemto Mine Ruins F1, middle-left", "2480 gold"),
    (5, 5): ("Aktemto Mine Ruins F1, top-right", "Gas Canister"),
    (5, 6): ("Aktemto Mine B3", "Gunpowder Jar"),
    (5, 7): ("Aktemto Mine B1, bottom right", "Mystic Acorns"),
    # $6263
    (6, 0): ("Padequia Cave B2, top-right", "800 gold"),
    (6, 1): ("Padequia Cave B2, top-left", "Mystic Acorns"),
    (6, 2): ("Padequia Cave B1", "Agility Seed"),
    (6, 3): ("Shrine of Breaking Waves B1, right", "Zenithian Armor"),
    (6, 4): ("Shrine of Breaking Waves B1, left", "Small Medal"),
    (6, 5): ("Shrine of Breaking Waves, middle, bottom-right", "Small Medal"),
    (6, 6): ("Aktemto Mine Ruins F1, bottom-left, right", "Strength Seed"),
    (6, 7): ("Aktemto Mine Ruins F1, bottom-left, left", "Agility Seed"),
    # $6264
    (7, 0): ("Bakor's Hideout B2, middle-left", "Iron Mask"),
    (7, 1): ("Bakor's Hideout B2, middle-right", "Strength Seed"),
    (7, 2): ("Bakor's Hideout B1, middle", "Small Medal"),
    (7, 3): ("Bakor's Hideout B1, top-right", "1200 gold"),
    (7, 4): ("Bakor's Hideout B1, middle-top", "Agility Seed"),
    (7, 5): ("Padequia Cave B3, bottom-left", "⚠️ Man-Eater!"),
    (7, 6): ("Padequia Cave B3, middle", "Padequia Seed"),
    (7, 7): ("Padequia Cave B2, middle-left", "Robe of Serenity"),
    # $6265
    (8, 0): ("Cave South Of Frenor B2, left", "Magic Potion"),
    (8, 1): ("Cave West of Kievs B5", "Magic Key"),
    (8, 2): ("Cave West of Kievs B4, middle (Silence)", "Sphere of Silence"),
    (8, 3): ("Cave West of Kievs B4, middle (Lamp)", "Lamp of Darkness"),
    (8, 4): ("Cave West of Kievs B2, bottom-left", "240 gold"),
    (8, 5): ("Cave West of Kievs B2, right", "Lifeforce Nuts"),
    (8, 6): ("Cave West of Kievs B1, top-left", "Wing of Wyvern"),
    (8, 7): ("Bakor's Hideout B2, bottom-left", "Dragon Shield"),
    # $6266
    (9, 0): ("Cascade Cave B1, middle-left", "Small Medal"),
    (9, 1): ("Secret Playground Dungeon B2, middle-right", "600 gold"),
    (9, 2): ("Secret Playground Dungeon B2, top", "Flying Shoes"),
    (9, 3): ("Secret Playground Dungeon B1, bottom-right", "Medical Herb"),
    (9, 4): ("Cave South Of Frenor B1, bottom-right", "Wing of Wyvern"),
    (9, 5): ("Cave South Of Frenor B1, middle", "Agility Seed"),
    (9, 6): ("Cave South Of Frenor B1, top-left", "360 gold"),
    (9, 7): ("Cave South Of Frenor B2, bottom", "Golden Bracelet"),
    # $6267
    (10, 1): ("Final Cave B2, bottom-left", "Demon Armor"),
    (10, 2): ("Final Cave B2, bottom-right", "Small Medal"),
    (10, 3): ("Final Cave B1, top-right", "Dress of Radiance"),
    (10, 4): ("Cascade Cave B2, bottom-left", "Mask of Corruption"),
    (10, 5): ("Cascade Cave B2, middle", "1040 gold"),
    (10, 6): ("Cascade Cave F1, Behind Waterfall", "Sandglass of Regression"),
    (10, 7): ("Cascade Cave B3, bottom", "Metal Babble Sword"),
    # $6268
    (11, 0): ("Final Cave B7, middle", "Mirror Shield"),
    (11, 1): ("Final Cave B3 (from #2), bottom-right", "⚠️ Mimic!"),
    (11, 2): ("Final Cave B3 (from #2), bottom-right", "Strength Seed"),
    (11, 3): ("Final Cave B3 (from #2), bottom-left", "Agility Seed"),
    (11, 4): ("Final Cave B3 (from #2), top-right", "3280 gold"),
    (11, 5): ("Final Cave B3 (from #2), top-left", "Lifeforce Nuts"),
    (11, 6): ("Final Cave B3 (from #2), top-middle", "Staff of Jubilation"),
    (11, 7): ("Final Cave B4, bottom-middle", "Water Flying Clothes"),
    # $6269
    (12, 0): ("Silver Statuette Cave B2, after water, bottom", "Medical Herb"),
    (12, 1): ("Silver Statuette Cave B2, after water, top-left", "760 gold"),
    (12, 2): ("Silver Statuette Cave B2, after water, middle-left", "Morning Star"),
    (12, 3): ("Silver Statuette Cave B2, after water, top-right", "Iron Spear"),
    (12, 4): ("Cave of Betrayal B3", "Symbol of Faith"),
    (12, 5): ("Cave North of Lakanaba B5 (left side), top", "Iron Safe"),
    (12, 6): ("Cave North of Lakanaba B2, middle-left", "Chain Sickle"),
    (12, 7): ("Final Cave B7, right", "Lifeforce Nuts"),
    # $626a
    (13, 0): ("Burland-Izmit tunnel, bottom-right", "Medical Herb"),
    (13, 1): ("Burland-Izmit tunnel, top-left", "40 gold"),
    (13, 2): ("Silver Statuette Cave B4", "Silver Statuette"),
    (13, 3): ("Silver Statuette Cave B3, after water, bottom-middle", "Broad Sword"),
    (13, 4): ("Silver Statuette Cave B3, before water, left", "Wing of Wyvern"),
    (13, 5): ("Silver Statuette Cave B3, after water, top-right, right", "Empty!"),
    (13, 6): ("Silver Statuette Cave B3, after water, top-right, left", "Empty!"),
    (13, 7): ("Silver Statuette Cave B3, after water, top-left", "Half Plate Armor"),
    # $626b
    (14, 0): ("Zenithian Tower F6 (#23), middle-bottom", "Dragon Shield"),
    (14, 1): ("Zenithian Tower F3 (#12)", "Small Medal"),
    (14, 2): ("Zenithian Tower F2, right room", "Mystic Acorns"),
    (14, 3): ("Zenithian Tower Outside #6", "Magic Potion"),
    (14, 4): ("Zenithian Tower Outside #20", "Mysterious Bolero"),
    (14, 5): ("Royal Crypt Dungeon B3, middle", "Small Medal"),
    (14, 6): ("Royal Crypt Dungeon B3, top-middle", "Staff of Antimagic"),
    (14, 7): ("Royal Crypt Dungeon B1, bottom", "Staff of Transform"),
    # $626c
    (15, 0): ("Loch Tower F3, left side", "Wing of Wyvern"),
    (15, 1): ("Loch Tower F3, top-right", "Strength Seed"),
    (15, 2): ("World Tree F2, top-left", "Staff of Healing"),
    (15, 3): ("World Tree F4, bottom", "Dew of World Tree"),
    (15, 4): ("World Tree F3-2, bottom-right", "Zenithian Sword"),
    (15, 5): ("Birdsong Tower F3, middle, right", "1200 gold"),
    (15, 6): ("Birdsong Tower F3, middle, left", "Strength Seed"),
    (15, 7): ("Birdsong Tower F3, top-right", "Wing of Wyvern"),
    # $626d
    (16, 0): ("Great Lighthouse F3, top-right", "Full Moon Herb"),
    (16, 1): ("Great Lighthouse F3, top-left", "Magic Potion"),
    (16, 2): ("Great Lighthouse F4, middle", "Fire of Serenity"),
    (16, 3): ("Great Lighthouse F5, top-left", "Golden Barrette"),
    (16, 4): ("Loch Tower F1, top-right", "Luck Seed"),
    (16, 5): ("Loch Tower F1, top-left", "Sword of Malice"),
    (16, 6): ("Loch Tower F2, middle", "Scale Shield"),
    (16, 7): ("Loch Tower F2, middle-right", "640 gold"),
    # $626e
    (17, 2): ("Konenber Inn F2, top-right room", "Sword of Decimation"),
    (17, 3): ("Great Lighthouse F1, middle, right", "400 gold"),
    (17, 4): ("Great Lighthouse F1, middle, left", "Luck Seed"),
    (17, 5): ("Great Lighthouse F2, bottom-left", "Strength Seed"),
    (17, 6): ("Great Lighthouse F3, left, right", "Boomerang"),
    (17, 7): ("Great Lighthouse F3, left, left", "⚠️ Man-Eater!"),
    # $626f
    (18, 4): ("NE barrier shrine (Radimvice) F3, bottom-right", "Zombie Mail"),
    # $6270
    (19, 0): ("Shrine of Colossus Dungeon F4, left hand", "Demon Hammer"),
    (19, 1): ("Shrine of Colossus Dungeon F4, top-right", "⚠️ Mimic!"),
    (19, 2): ("Shrine of Colossus Dungeon B1, bottom-left", "640 gold"),
    (19, 3): ("Shrine of Colossus Dungeon F2, right", "Agility Seed"),
    (19, 4): ("Shrine of Colossus Dungeon F1, middle", "Small Medal"),
    (19, 5): ("Shrine of the Horn B3", "Dress of Radiance"),
    (19, 6): ("Shrine of the Horn B2 (search)", "Baron's Horn"),
    (19, 7): ("Shrine of the Horn B2 (obtain)", "Baron's Horn"),
    # $6272 - Search spots
    (21, 0): ("Mintos, middle, left of well (search)", "Small Medal"),
    (21, 1): ("Hometown Destroyed, flowers (search)", "Feather Hat"),
    (21, 2): ("Aneaux Cemetery, middle tombstone", "Strength Seed"),
    (21, 4): ("Tempe, red monster platform (search)", "Lifeforce Nuts"),
    (21, 5): ("Riverton, Middle Island (search)", "Small Medal"),
    (21, 6): ("Aktemto Mine B4, next to water (search)", "Small Medal"),
    (21, 7): ("Dire Palace B1, Tomb (search)", "Lifeforce Nuts"),
    # $6273 - Drawers/containers
    (22, 0): ("Santeem F1, behind chapel, drawer #2", "Fairy Water"),
    (22, 1): ("Santeem F1, top-left, right drawer", "Wing of Wyvern"),
    (22, 2): ("Zenithian Castle F1, middle-top room, right drawer", "Small Medal"),
    (22, 5): ("SW barrier shrine (Gigademon), outside (search)", "Small Medal"),
    (22, 6): ("Shrine East of Mintos (search)", "Small Medal"),
    (22, 7): ("Seaside Village, south of statue (search)", "Small Medal"),
    # $6274
    (23, 0): ("Stancia, top-right house F2, right pot", "Small Medal"),
    (23, 1): ("Stancia Castle F1, top-right room, drawer #2", "Small Medal"),
    (23, 2): ("Gardenbur F2, Top-right, right drawer", "Agility Seed"),
    (23, 3): ("Gardenbur Castle, bottom-left, right pot", "Small Medal"),
    (23, 4): ("Endor Castle F3, right room, right drawer", "Small Medal"),
    (23, 5): ("Dire Palace B1, left pot", "Small Medal"),
    (23, 6): ("Burland Castle F1, bottom-right room, drawer #4", "Medical Herb"),
    (23, 7): ("Santeem F3, Alena's room, drawer #2", "Feather Hat"),
    # $6275
    (24, 0): ("Monbaraba Theater B1, top room, drawer #2", "Strength Seed"),
    (24, 1): ("Monbaraba, top-right, top pot", "Medical Herb"),
    (24, 2): ("Hometown B1, top-left pot", "Medical Herb"),
    (24, 3): ("Izmit, middle-right house, right drawer", "Medical Herb"),
    (24, 4): ("Haville B1, Jail, right cell, pot", "Small Medal"),
    (24, 5): ("Haville B1, Jail, left cell, pot", "Small Medal"),
    (24, 6): ("Bazaar, bottom-right, right pot", "Gum Pod"),
    (24, 7): ("Bazaar, bottom-right, left pot", "Strength Seed"),
    # $6276
    (25, 0): ("Secret Playground Entrance B1, Exit, top-left pot", "Medical Herb"),
    (25, 1): ("Cave West of Kievs B5, left pot", "Small Medal"),
    (25, 2): ("Small Island Shack North of Haville, right pot", "Small Medal"),
    (25, 4): ("Konenber Ship B1, bottom room, drawer", "Small Medal"),
    (25, 5): ("Gottside, Top-right house B1, right drawer", "Small Medal"),
    (25, 6): ("Kievs, top-right house, right pot", "Lifeforce Nuts"),
    (25, 7): ("Lakanaba, Taloon's House F1, left pot", "Medical Herb"),
    # $6277
    (26, 0): ("Woodsman's Shack, right pot", "50 gold"),
    (26, 1): ("Woodsman's Shack, middle pot", "Medical Herb"),
    (26, 2): ("Woodsman's Shack, left pot", "Leather Armor"),
    (26, 3): ("Secret Playground Entrance B1, Exit, top-middle pot", "Agility Seed"),
    (26, 4): ("Seaside Village, beach (search)", "Stone of Drought"),
    (26, 5): ("Frenor, Church Garden (search)", "Mystic Acorns"),
}


@dataclass
class CharacterData:
    """Holds data for a single character"""
    name: str
    base_addr: int
    status: int = 0
    current_hp: int = 0
    current_mp: int = 0
    level: int = 1
    strength: int = 0
    agility: int = 0
    vitality: int = 0
    intelligence: int = 0
    luck: int = 0
    max_hp: int = 0
    max_mp: int = 0
    xp: int = 0
    items: List[int] = None
    spells: List[int] = None
    
    def __post_init__(self):
        if self.items is None:
            self.items = [0] * 8
        if self.spells is None:
            self.spells = [0] * 3


class SaveDataHandler:
    """Handles reading/writing save data from WRAM"""
    
    def __init__(self):
        self.wram = bytearray(0x2000)  # 8KB WRAM
        self.characters: List[CharacterData] = []
        self.gold = 0
        self.chapter = 1
        self.tactics = 1
        self.casino_coins = 0
        self.day_night = 0
        self.return_locations = [0, 0, 0]
        self.party_order = [0, 0, 0, 0]
        self.treasure_flags = bytearray(27)
        
    def load_from_wram(self, wram_data: bytes):
        """Load all game data from WRAM bytes"""
        self.wram = bytearray(wram_data)
        
        # Load characters
        self.characters = []
        for name, addr in CHARACTERS:
            char = self._read_character(name, addr)
            self.characters.append(char)
            
        # Load general data
        self._read_general_data()
        
    def _read_character(self, name: str, base_addr: int) -> CharacterData:
        """Read character data from WRAM"""
        offset = base_addr - 0x6000
        char = CharacterData(name=name, base_addr=base_addr)
        
        char.status = self.wram[offset + CHAR_OFFSETS['status']]
        char.current_hp = self.wram[offset + CHAR_OFFSETS['hp_lo']] + \
                          (self.wram[offset + CHAR_OFFSETS['hp_hi']] << 8)
        char.current_mp = self.wram[offset + CHAR_OFFSETS['mp_lo']] + \
                          (self.wram[offset + CHAR_OFFSETS['mp_hi']] << 8)
        char.level = self.wram[offset + CHAR_OFFSETS['level']]
        char.strength = self.wram[offset + CHAR_OFFSETS['strength']]
        char.agility = self.wram[offset + CHAR_OFFSETS['agility']]
        char.vitality = self.wram[offset + CHAR_OFFSETS['vitality']]
        char.intelligence = self.wram[offset + CHAR_OFFSETS['intelligence']]
        char.luck = self.wram[offset + CHAR_OFFSETS['luck']]
        char.max_hp = self.wram[offset + CHAR_OFFSETS['max_hp_lo']] + \
                      (self.wram[offset + CHAR_OFFSETS['max_hp_hi']] << 8)
        char.max_mp = self.wram[offset + CHAR_OFFSETS['max_mp_lo']] + \
                      (self.wram[offset + CHAR_OFFSETS['max_mp_hi']] << 8)
        char.xp = self.wram[offset + CHAR_OFFSETS['xp_lo']] + \
                  (self.wram[offset + CHAR_OFFSETS['xp_mid']] << 8) + \
                  (self.wram[offset + CHAR_OFFSETS['xp_hi']] << 16)
        
        char.items = [self.wram[offset + CHAR_OFFSETS['item1'] + i] for i in range(8)]
        char.spells = [self.wram[offset + CHAR_OFFSETS['spells1'] + i] for i in range(3)]
        
        return char
        
    def _read_general_data(self):
        """Read general game data from WRAM"""
        gold_off = GAME_ADDRS['gold'] - 0x6000
        self.gold = self.wram[gold_off] + \
                    (self.wram[gold_off + 1] << 8) + \
                    (self.wram[gold_off + 2] << 16)
        
        self.chapter = self.wram[GAME_ADDRS['chapter'] - 0x6000]
        self.tactics = self.wram[GAME_ADDRS['tactics'] - 0x6000]
        
        coins_off = GAME_ADDRS['casino_coins'] - 0x6000
        self.casino_coins = self.wram[coins_off] + \
                            (self.wram[coins_off + 1] << 8) + \
                            (self.wram[coins_off + 2] << 16)
        
        self.day_night = self.wram[GAME_ADDRS['day_night'] - 0x6000]
        
        for i in range(3):
            self.return_locations[i] = self.wram[GAME_ADDRS['return_loc1'] - 0x6000 + i]
            
        for i in range(4):
            self.party_order[i] = self.wram[GAME_ADDRS['party_order'] - 0x6000 + i]
            
        treas_off = GAME_ADDRS['treasure_start'] - 0x6000
        self.treasure_flags = bytearray(self.wram[treas_off:treas_off + 27])
        
    def write_character(self, char: CharacterData):
        """Write character data back to WRAM"""
        offset = char.base_addr - 0x6000
        
        self.wram[offset + CHAR_OFFSETS['status']] = char.status
        self.wram[offset + CHAR_OFFSETS['hp_lo']] = char.current_hp & 0xFF
        self.wram[offset + CHAR_OFFSETS['hp_hi']] = (char.current_hp >> 8) & 0xFF
        self.wram[offset + CHAR_OFFSETS['mp_lo']] = char.current_mp & 0xFF
        self.wram[offset + CHAR_OFFSETS['mp_hi']] = (char.current_mp >> 8) & 0xFF
        self.wram[offset + CHAR_OFFSETS['level']] = char.level
        self.wram[offset + CHAR_OFFSETS['strength']] = char.strength
        self.wram[offset + CHAR_OFFSETS['agility']] = char.agility
        self.wram[offset + CHAR_OFFSETS['vitality']] = char.vitality
        self.wram[offset + CHAR_OFFSETS['intelligence']] = char.intelligence
        self.wram[offset + CHAR_OFFSETS['luck']] = char.luck
        self.wram[offset + CHAR_OFFSETS['max_hp_lo']] = char.max_hp & 0xFF
        self.wram[offset + CHAR_OFFSETS['max_hp_hi']] = (char.max_hp >> 8) & 0xFF
        self.wram[offset + CHAR_OFFSETS['max_mp_lo']] = char.max_mp & 0xFF
        self.wram[offset + CHAR_OFFSETS['max_mp_hi']] = (char.max_mp >> 8) & 0xFF
        self.wram[offset + CHAR_OFFSETS['xp_lo']] = char.xp & 0xFF
        self.wram[offset + CHAR_OFFSETS['xp_mid']] = (char.xp >> 8) & 0xFF
        self.wram[offset + CHAR_OFFSETS['xp_hi']] = (char.xp >> 16) & 0xFF
        
        for i in range(8):
            self.wram[offset + CHAR_OFFSETS['item1'] + i] = char.items[i]
        for i in range(3):
            self.wram[offset + CHAR_OFFSETS['spells1'] + i] = char.spells[i]
            
    def write_general_data(self):
        """Write general game data back to WRAM"""
        gold_off = GAME_ADDRS['gold'] - 0x6000
        self.wram[gold_off] = self.gold & 0xFF
        self.wram[gold_off + 1] = (self.gold >> 8) & 0xFF
        self.wram[gold_off + 2] = (self.gold >> 16) & 0xFF
        
        self.wram[GAME_ADDRS['chapter'] - 0x6000] = self.chapter
        self.wram[GAME_ADDRS['tactics'] - 0x6000] = self.tactics
        
        coins_off = GAME_ADDRS['casino_coins'] - 0x6000
        self.wram[coins_off] = self.casino_coins & 0xFF
        self.wram[coins_off + 1] = (self.casino_coins >> 8) & 0xFF
        self.wram[coins_off + 2] = (self.casino_coins >> 16) & 0xFF
        
        self.wram[GAME_ADDRS['day_night'] - 0x6000] = self.day_night
        
        for i in range(3):
            self.wram[GAME_ADDRS['return_loc1'] - 0x6000 + i] = self.return_locations[i]
            
        for i in range(4):
            self.wram[GAME_ADDRS['party_order'] - 0x6000 + i] = self.party_order[i]
            
        treas_off = GAME_ADDRS['treasure_start'] - 0x6000
        for i in range(27):
            self.wram[treas_off + i] = self.treasure_flags[i]
            
    def get_wram_bytes(self) -> bytes:
        """Get WRAM as bytes for saving"""
        for char in self.characters:
            self.write_character(char)
        self.write_general_data()
        return bytes(self.wram)


class MesenSaveState:
    """Handler for Mesen .mss save state files"""
    
    def __init__(self):
        self.raw_data = b''
        self.wram_offset = 0
        self.wram_size = 0x2000
        
    def load(self, filepath: str) -> Optional[bytes]:
        """Load and extract WRAM from Mesen save state"""
        with open(filepath, 'rb') as f:
            self.raw_data = bytearray(f.read())
            
        # MSS files: header "MSS\0" + version info + compressed data
        if self.raw_data[:3] != b'MSS':
            raise ValueError("Not a valid Mesen save state file")
            
        # Search for WRAM pattern in the data
        # WRAM typically appears after CPU/PPU state
        # Look for the save data signature
        wram = self._find_wram()
        if wram:
            return wram
        return None
        
    def _find_wram(self) -> Optional[bytes]:
        """Find WRAM section in save state"""
        # Mesen stores WRAM in the save state
        # The format varies but we can search for known patterns
        # Look for the character data pattern (status byte followed by HP)
        
        data = self.raw_data
        
        # Try zlib decompression first (some Mesen versions compress)
        try:
            import zlib
            # Try different header sizes
            for header_size in [20, 24, 32, 36, 40]:
                try:
                    decompressed = zlib.decompress(data[header_size:])
                    data = bytearray(decompressed)
                    self.raw_data = data
                    break
                except:
                    continue
        except:
            pass
        
        # Search for valid WRAM pattern
        candidates = []
        for i in range(len(data) - 0x2000):
            # Check if this looks like WRAM start
            # $6001 should have Hero status, then HP
            if self._looks_like_wram(data[i:i+0x2000]):
                candidates.append(i)
                
        # Return first good candidate
        if candidates:
            self.wram_offset = candidates[0]
            return bytes(data[candidates[0]:candidates[0]+0x2000])
                
        return None
        
    def _looks_like_wram(self, data: bytes) -> bool:
        """Check if data looks like valid WRAM"""
        if len(data) < 0x200:
            return False
            
        # Check Hero at offset 1 ($6001)
        status = data[1]
        hp_lo = data[2]
        hp_hi = data[3]
        hp = hp_lo + (hp_hi << 8)
        level = data[6]
        
        # Sanity checks - be more lenient
        if level < 1 or level > 99:
            return False
        if hp > 999:
            return False
            
        # Check gold at offset 0x157 (reasonable range)
        gold = data[0x157] + (data[0x158] << 8) + (data[0x159] << 16)
        if gold > 999999:
            return False
        
        # Additional validation - check second character (Cristo at offset 0x1E)
        cristo_level = data[0x1F + 5]  # Cristo level
        if cristo_level > 0 and (cristo_level < 1 or cristo_level > 99):
            return False
            
        return True
        
    def save(self, filepath: str, wram: bytes):
        """Save modified WRAM back to save state"""
        if self.wram_offset > 0:
            self.raw_data[self.wram_offset:self.wram_offset + len(wram)] = wram
            with open(filepath, 'wb') as f:
                f.write(self.raw_data)


class SRAMFile:
    """Handler for .sav SRAM files"""
    
    def __init__(self):
        self.data = bytearray(0x2000)
        
    def load(self, filepath: str) -> bytes:
        """Load SRAM file"""
        with open(filepath, 'rb') as f:
            self.data = bytearray(f.read())
        # SRAM is direct WRAM dump
        return bytes(self.data)
        
    def save(self, filepath: str, wram: bytes):
        """Save WRAM to SRAM file"""
        with open(filepath, 'wb') as f:
            f.write(wram)


class SaveEditorGUI:
    """Main GUI for the save editor"""
    
    def __init__(self):
        self.root = tk.Tk()
        self.root.title("Dragon Warrior IV Save Editor")
        self.root.geometry("900x700")
        
        self.handler = SaveDataHandler()
        self.mesen_state = MesenSaveState()
        self.sram_file = SRAMFile()
        self.current_file = None
        self.file_type = None  # 'mss' or 'sav'
        
        self._create_menu()
        self._create_widgets()
        
    def _create_menu(self):
        """Create menu bar"""
        menubar = tk.Menu(self.root)
        
        file_menu = tk.Menu(menubar, tearoff=0)
        file_menu.add_command(label="Open Save State (.mss)", command=self._open_mss)
        file_menu.add_command(label="Open SRAM (.sav)", command=self._open_sav)
        file_menu.add_separator()
        file_menu.add_command(label="Save", command=self._save)
        file_menu.add_command(label="Save As...", command=self._save_as)
        file_menu.add_separator()
        file_menu.add_command(label="Exit", command=self.root.quit)
        menubar.add_cascade(label="File", menu=file_menu)
        
        edit_menu = tk.Menu(menubar, tearoff=0)
        edit_menu.add_command(label="Max All Stats", command=self._max_stats)
        edit_menu.add_command(label="Max Gold", command=self._max_gold)
        edit_menu.add_command(label="Full Heal All", command=self._full_heal)
        edit_menu.add_command(label="All Spells", command=self._all_spells)
        menubar.add_cascade(label="Quick Edit", menu=edit_menu)
        
        self.root.config(menu=menubar)
        
    def _create_widgets(self):
        """Create main widgets"""
        # Create notebook for tabs
        self.notebook = ttk.Notebook(self.root)
        self.notebook.pack(fill='both', expand=True, padx=5, pady=5)
        
        # Characters tab
        self.char_frame = ttk.Frame(self.notebook)
        self.notebook.add(self.char_frame, text="Characters")
        self._create_character_tab()
        
        # General tab
        self.general_frame = ttk.Frame(self.notebook)
        self.notebook.add(self.general_frame, text="General")
        self._create_general_tab()
        
        # Treasure tab
        self.treasure_frame = ttk.Frame(self.notebook)
        self.notebook.add(self.treasure_frame, text="Treasure")
        self._create_treasure_tab()
        
        # Spells tab
        self.spells_frame = ttk.Frame(self.notebook)
        self.notebook.add(self.spells_frame, text="Spells")
        self._create_spells_tab()
        
        # Events tab (raw hex editor for event flags)
        self.events_frame = ttk.Frame(self.notebook)
        self.notebook.add(self.events_frame, text="Events")
        self._create_events_tab()
        
        # Status bar
        self.status_var = tk.StringVar(value="No file loaded")
        status = ttk.Label(self.root, textvariable=self.status_var, relief='sunken')
        status.pack(fill='x', side='bottom')
        
    def _create_character_tab(self):
        """Create character editing tab"""
        # Character selector
        selector_frame = ttk.Frame(self.char_frame)
        selector_frame.pack(fill='x', padx=5, pady=5)
        
        ttk.Label(selector_frame, text="Character:").pack(side='left')
        self.char_combo = ttk.Combobox(selector_frame, values=[c[0] for c in CHARACTERS])
        self.char_combo.pack(side='left', padx=5)
        self.char_combo.bind('<<ComboboxSelected>>', self._on_char_select)
        
        # Stats frame
        stats_frame = ttk.LabelFrame(self.char_frame, text="Stats")
        stats_frame.pack(fill='x', padx=5, pady=5)
        
        self.stat_vars = {}
        stats = ['level', 'current_hp', 'max_hp', 'current_mp', 'max_mp',
                 'strength', 'agility', 'vitality', 'intelligence', 'luck', 'xp']
        
        for i, stat in enumerate(stats):
            row, col = divmod(i, 4)
            ttk.Label(stats_frame, text=stat.replace('_', ' ').title() + ":").grid(
                row=row, column=col*2, sticky='e', padx=2, pady=2)
            var = tk.StringVar()
            self.stat_vars[stat] = var
            entry = ttk.Entry(stats_frame, textvariable=var, width=10)
            entry.grid(row=row, column=col*2+1, sticky='w', padx=2, pady=2)
            
        # Status flags
        status_frame = ttk.LabelFrame(self.char_frame, text="Status")
        status_frame.pack(fill='x', padx=5, pady=5)
        
        self.status_vars = {}
        for flag in ['alive', 'poisoned', 'paralyzed']:
            var = tk.BooleanVar()
            self.status_vars[flag] = var
            cb = ttk.Checkbutton(status_frame, text=flag.title(), variable=var)
            cb.pack(side='left', padx=10)
            
        # Items frame
        items_frame = ttk.LabelFrame(self.char_frame, text="Inventory")
        items_frame.pack(fill='x', padx=5, pady=5)
        
        self.item_vars = []
        item_names = list(ITEMS.values())
        for i in range(8):
            ttk.Label(items_frame, text=f"Slot {i+1}:").grid(row=i//4, column=(i%4)*2, sticky='e')
            var = tk.StringVar()
            self.item_vars.append(var)
            combo = ttk.Combobox(items_frame, textvariable=var, values=item_names, width=20)
            combo.grid(row=i//4, column=(i%4)*2+1, padx=2, pady=2)
            
        # Apply button
        ttk.Button(self.char_frame, text="Apply Changes", 
                   command=self._apply_char_changes).pack(pady=10)
                   
    def _create_general_tab(self):
        """Create general game data tab"""
        # Gold and coins
        money_frame = ttk.LabelFrame(self.general_frame, text="Currency")
        money_frame.pack(fill='x', padx=5, pady=5)
        
        ttk.Label(money_frame, text="Gold:").grid(row=0, column=0, sticky='e', padx=5)
        self.gold_var = tk.StringVar()
        ttk.Entry(money_frame, textvariable=self.gold_var, width=15).grid(row=0, column=1)
        
        ttk.Label(money_frame, text="Casino Coins:").grid(row=0, column=2, sticky='e', padx=5)
        self.coins_var = tk.StringVar()
        ttk.Entry(money_frame, textvariable=self.coins_var, width=15).grid(row=0, column=3)
        
        # Chapter and tactics
        game_frame = ttk.LabelFrame(self.general_frame, text="Game State")
        game_frame.pack(fill='x', padx=5, pady=5)
        
        ttk.Label(game_frame, text="Chapter:").grid(row=0, column=0, sticky='e', padx=5)
        self.chapter_var = tk.StringVar()
        chapter_combo = ttk.Combobox(game_frame, textvariable=self.chapter_var,
                                      values=list(CHAPTERS.values()), width=25)
        chapter_combo.grid(row=0, column=1, padx=5)
        
        ttk.Label(game_frame, text="Tactics:").grid(row=0, column=2, sticky='e', padx=5)
        self.tactics_var = tk.StringVar()
        tactics_combo = ttk.Combobox(game_frame, textvariable=self.tactics_var,
                                      values=list(TACTICS.values()), width=15)
        tactics_combo.grid(row=0, column=3, padx=5)
        
        ttk.Label(game_frame, text="Day/Night:").grid(row=1, column=0, sticky='e', padx=5)
        self.daynight_var = tk.StringVar()
        ttk.Entry(game_frame, textvariable=self.daynight_var, width=10).grid(row=1, column=1)
        ttk.Label(game_frame, text="(28=morning, 84=night)").grid(row=1, column=2, columnspan=2)
        
        # Party order
        party_frame = ttk.LabelFrame(self.general_frame, text="Party Order (slot 1-4)")
        party_frame.pack(fill='x', padx=5, pady=5)
        
        char_names = ['(Empty)'] + [c[0] for c in CHARACTERS]
        self.party_vars = []
        for i in range(4):
            ttk.Label(party_frame, text=f"Slot {i+1}:").grid(row=0, column=i*2, sticky='e', padx=5)
            var = tk.StringVar()
            self.party_vars.append(var)
            combo = ttk.Combobox(party_frame, textvariable=var, values=char_names, width=10)
            combo.grid(row=0, column=i*2+1, padx=2)
            
        # Return spell locations
        return_frame = ttk.LabelFrame(self.general_frame, text="Return Spell Locations")
        return_frame.pack(fill='x', padx=5, pady=5)
        
        self.return_vars = []
        for i in range(3):
            ttk.Label(return_frame, text=f"Location {i+1}:").grid(row=0, column=i*2, sticky='e', padx=5)
            var = tk.StringVar()
            self.return_vars.append(var)
            ttk.Entry(return_frame, textvariable=var, width=8).grid(row=0, column=i*2+1, padx=2)
        ttk.Label(return_frame, text="(map IDs - 0=none)").grid(row=0, column=6, padx=5)
        
        # Apply button
        ttk.Button(self.general_frame, text="Apply Changes",
                   command=self._apply_general_changes).pack(pady=10)
                   
    def _create_treasure_tab(self):
        """Create treasure chest flags tab"""
        # Scrollable frame for treasure checkboxes
        canvas = tk.Canvas(self.treasure_frame)
        scrollbar = ttk.Scrollbar(self.treasure_frame, orient="vertical", command=canvas.yview)
        scrollable = ttk.Frame(canvas)
        
        scrollable.bind("<Configure>", lambda e: canvas.configure(scrollregion=canvas.bbox("all")))
        canvas.create_window((0, 0), window=scrollable, anchor="nw")
        canvas.configure(yscrollcommand=scrollbar.set)
        
        # Enable mouse wheel scrolling
        def _on_mousewheel(event):
            canvas.yview_scroll(int(-1*(event.delta/120)), "units")
        canvas.bind_all("<MouseWheel>", _on_mousewheel)
        
        canvas.pack(side="left", fill="both", expand=True)
        scrollbar.pack(side="right", fill="y")
        
        # Buttons at top
        btn_frame = ttk.Frame(scrollable)
        btn_frame.pack(fill='x', pady=5)
        ttk.Label(btn_frame, text="✓ = Already Opened").pack(side='left', padx=5)
        ttk.Button(btn_frame, text="Open All", 
                   command=lambda: self._set_all_treasure(True)).pack(side='left', padx=5)
        ttk.Button(btn_frame, text="Reset All", 
                   command=lambda: self._set_all_treasure(False)).pack(side='left', padx=5)
        
        self.treasure_vars = []
        
        for i in range(27 * 8):
            byte_idx = i // 8
            bit_idx = i % 8
            var = tk.BooleanVar()
            self.treasure_vars.append(var)
            
            # Get description if available
            info = TREASURE_INFO.get((byte_idx, bit_idx))
            if info:
                loc, reward = info
                label = f"${625+byte_idx:02X}#{bit_idx}: {loc} → {reward}"
            else:
                label = f"${625+byte_idx:02X}#{bit_idx}: (undocumented)"
                
            cb = ttk.Checkbutton(scrollable, text=label, variable=var)
            cb.pack(anchor='w')
            
    def _set_all_treasure(self, opened: bool):
        """Set all treasure flags to opened or closed"""
        for var in self.treasure_vars:
            var.set(opened)
        self.status_var.set("Marked all treasures as " + ("opened" if opened else "available"))
            
    def _create_spells_tab(self):
        """Create spells editing tab - shows checkboxes for each character's spells"""
        # Create scrollable frame
        canvas = tk.Canvas(self.spells_frame)
        scrollbar = ttk.Scrollbar(self.spells_frame, orient="vertical", command=canvas.yview)
        scrollable = ttk.Frame(canvas)
        
        scrollable.bind("<Configure>", lambda e: canvas.configure(scrollregion=canvas.bbox("all")))
        canvas.create_window((0, 0), window=scrollable, anchor="nw")
        canvas.configure(yscrollcommand=scrollbar.set)
        
        canvas.pack(side="left", fill="both", expand=True)
        scrollbar.pack(side="right", fill="y")
        
        # Enable mouse wheel scrolling
        def _on_mousewheel(event):
            canvas.yview_scroll(int(-1*(event.delta/120)), "units")
        canvas.bind_all("<MouseWheel>", _on_mousewheel)
        
        self.spell_vars = {}  # Dict of {char_name: {spell_byte_idx: {bit_mask: tk.BooleanVar}}}
        
        # Create section for each spellcasting character
        for char_name, spell_defs in CHARACTER_SPELLS.items():
            if spell_defs is None:
                continue  # Skip non-spellcasters (Taloon, Ragnar, Alena)
                
            # Character header
            char_frame = ttk.LabelFrame(scrollable, text=char_name)
            char_frame.pack(fill='x', padx=5, pady=5, anchor='w')
            
            self.spell_vars[char_name] = {}
            
            # Create sub-frames for each spell byte
            for byte_idx, (byte_name, spells) in enumerate(spell_defs.items()):
                byte_frame = ttk.LabelFrame(char_frame, text=byte_name.replace('_', ' ').title())
                byte_frame.pack(fill='x', padx=5, pady=2)
                
                self.spell_vars[char_name][byte_idx] = {}
                
                # Create checkboxes for each spell in this byte
                for col_idx, (spell_name, bit_mask) in enumerate(spells):
                    if spell_name == 'n/a':
                        continue  # Skip unused spell slots
                        
                    var = tk.BooleanVar()
                    self.spell_vars[char_name][byte_idx][bit_mask] = var
                    
                    cb = ttk.Checkbutton(byte_frame, text=spell_name, variable=var)
                    cb.grid(row=0, column=col_idx, padx=3, pady=2, sticky='w')
        
        # Apply button at bottom
        apply_frame = ttk.Frame(scrollable)
        apply_frame.pack(fill='x', pady=10)
        ttk.Button(apply_frame, text="Apply Spell Changes", 
                   command=self._apply_spell_changes).pack()
        
        # Quick buttons
        quick_frame = ttk.Frame(scrollable)
        quick_frame.pack(fill='x', pady=5)
        ttk.Button(quick_frame, text="Learn All Spells", 
                   command=self._learn_all_spells).pack(side='left', padx=5)
        ttk.Button(quick_frame, text="Clear All Spells", 
                   command=self._clear_all_spells).pack(side='left', padx=5)
                   
    def _refresh_spells_ui(self):
        """Refresh spell checkboxes from current data"""
        if not self.handler.wram:
            return
            
        for char_name, spell_defs in CHARACTER_SPELLS.items():
            if spell_defs is None or char_name not in self.spell_vars:
                continue
                
            # Get character's base address
            char_addr = None
            for name, addr in CHARACTERS:
                if name == char_name:
                    char_addr = addr
                    break
            if char_addr is None:
                continue
                
            # Read the 3 spell bytes for this character
            spell_offsets = [CHAR_OFFSETS['spells1'], CHAR_OFFSETS['spells2'], CHAR_OFFSETS['spells3']]
            
            for byte_idx, (byte_name, spells) in enumerate(spell_defs.items()):
                wram_offset = char_addr - 0x6000 + spell_offsets[byte_idx]
                spell_byte = self.handler.wram[wram_offset]
                
                if byte_idx not in self.spell_vars[char_name]:
                    continue
                    
                for spell_name, bit_mask in spells:
                    if bit_mask in self.spell_vars[char_name][byte_idx]:
                        # Check if this spell is learned (bit is set)
                        has_spell = (spell_byte & bit_mask) != 0
                        self.spell_vars[char_name][byte_idx][bit_mask].set(has_spell)
                        
    def _apply_spell_changes(self):
        """Apply spell checkbox changes to WRAM"""
        if not self.handler.wram:
            messagebox.showwarning("Warning", "No save data loaded")
            return
            
        for char_name, spell_defs in CHARACTER_SPELLS.items():
            if spell_defs is None or char_name not in self.spell_vars:
                continue
                
            # Get character's base address
            char_addr = None
            for name, addr in CHARACTERS:
                if name == char_name:
                    char_addr = addr
                    break
            if char_addr is None:
                continue
                
            spell_offsets = [CHAR_OFFSETS['spells1'], CHAR_OFFSETS['spells2'], CHAR_OFFSETS['spells3']]
            
            for byte_idx, (byte_name, spells) in enumerate(spell_defs.items()):
                wram_offset = char_addr - 0x6000 + spell_offsets[byte_idx]
                spell_byte = 0
                
                if byte_idx not in self.spell_vars[char_name]:
                    continue
                    
                for spell_name, bit_mask in spells:
                    if bit_mask in self.spell_vars[char_name][byte_idx]:
                        if self.spell_vars[char_name][byte_idx][bit_mask].get():
                            spell_byte |= bit_mask
                            
                self.handler.wram[wram_offset] = spell_byte
                
        # Reload characters from updated WRAM to keep objects in sync
        self.handler.characters = []
        for name, addr in CHARACTERS:
            char = self.handler._read_character(name, addr)
            self.handler.characters.append(char)
        self.status_var.set("Spell changes applied")
        
    def _learn_all_spells(self):
        """Set all spell checkboxes to checked"""
        for char_name in self.spell_vars:
            for byte_idx in self.spell_vars[char_name]:
                for bit_mask, var in self.spell_vars[char_name][byte_idx].items():
                    var.set(True)
                    
    def _clear_all_spells(self):
        """Set all spell checkboxes to unchecked"""
        for char_name in self.spell_vars:
            for byte_idx in self.spell_vars[char_name]:
                for bit_mask, var in self.spell_vars[char_name][byte_idx].items():
                    var.set(False)
                    
    def _create_events_tab(self):
        """Create events/flags editing tab - raw hex editor for event region"""
        # Known event flags (partially documented)
        known_events = ttk.LabelFrame(self.events_frame, text="Known Chapter 1 Events")
        known_events.pack(fill='x', padx=5, pady=5)
        
        self.event_vars = {}
        event_defs = [
            ('$627e', '627e', 'Flora quest progress (10=waiting, 30=following, 50=returned)'),
            ('$6281', '6281', 'Izmit school event ($80=talked to child)'),
            ('$6283', '6283', 'Saro quest ($80=defeated, $a0=children following)'),
            ('$6288', '6288', 'Saro post-battle ($80=talked after defeat)'),
            ('$618f', '618f', 'Chapter progress ($02=chapter 1 started)'),
            ('$62d5', '62d5', 'Chapter progress ($01=chapter 1 started)'),
        ]
        
        for i, (label, addr_key, desc) in enumerate(event_defs):
            row = i // 2
            col = (i % 2) * 3
            
            ttk.Label(known_events, text=f"{label}:").grid(row=row, column=col, sticky='e', padx=2)
            var = tk.StringVar()
            self.event_vars[addr_key] = var
            entry = ttk.Entry(known_events, textvariable=var, width=6)
            entry.grid(row=row, column=col+1, padx=2)
            ttk.Label(known_events, text=desc, font=('TkDefaultFont', 8)).grid(
                row=row, column=col+2, sticky='w', padx=2)
        
        # Raw hex editor for event region $6278-$6291
        raw_frame = ttk.LabelFrame(self.events_frame, text="Raw Event Flags ($6278-$6291)")
        raw_frame.pack(fill='x', padx=5, pady=5)
        
        ttk.Label(raw_frame, text="Edit hex values (space-separated bytes):").pack(anchor='w')
        
        self.raw_events_var = tk.StringVar()
        self.raw_events_entry = ttk.Entry(raw_frame, textvariable=self.raw_events_var, width=80)
        self.raw_events_entry.pack(fill='x', padx=5, pady=5)
        
        ttk.Label(raw_frame, text="Addresses: $6278 6279 627a 627b 627c 627d 627e 627f 6280 6281 6282 6283 6284 6285 6286 6287 6288 6289 628a 628b 628c 628d 628e 628f 6290 6291",
                  font=('TkDefaultFont', 8)).pack(anchor='w', padx=5)
        
        # Apply button
        btn_frame = ttk.Frame(self.events_frame)
        btn_frame.pack(fill='x', padx=5, pady=10)
        ttk.Button(btn_frame, text="Apply Event Changes",
                   command=self._apply_event_changes).pack(side='left', padx=5)
        ttk.Button(btn_frame, text="Clear All Events",
                   command=self._clear_all_events).pack(side='left', padx=5)
                   
    def _refresh_events_ui(self):
        """Refresh event flag displays from WRAM"""
        if not self.handler.wram:
            return
            
        # Known events
        known_addrs = {
            '627e': 0x627e, '6281': 0x6281, '6283': 0x6283,
            '6288': 0x6288, '618f': 0x618f, '62d5': 0x62d5
        }
        
        for addr_key, addr in known_addrs.items():
            if addr_key in self.event_vars:
                offset = addr - 0x6000
                val = self.handler.wram[offset]
                self.event_vars[addr_key].set(f"{val:02X}")
                
        # Raw event region $6278-$6291
        start = 0x6278 - 0x6000
        end = 0x6292 - 0x6000
        hex_str = ' '.join(f"{b:02X}" for b in self.handler.wram[start:end])
        self.raw_events_var.set(hex_str)
        
    def _apply_event_changes(self):
        """Apply event flag changes to WRAM"""
        if not self.handler.wram:
            messagebox.showwarning("Warning", "No save data loaded")
            return
            
        try:
            # Apply known events
            known_addrs = {
                '627e': 0x627e, '6281': 0x6281, '6283': 0x6283,
                '6288': 0x6288, '618f': 0x618f, '62d5': 0x62d5
            }
            
            for addr_key, addr in known_addrs.items():
                if addr_key in self.event_vars:
                    val_str = self.event_vars[addr_key].get().strip()
                    if val_str:
                        val = int(val_str, 16)
                        offset = addr - 0x6000
                        self.handler.wram[offset] = val & 0xFF
                        
            # Apply raw event region
            hex_str = self.raw_events_var.get().strip()
            if hex_str:
                bytes_list = [int(b, 16) for b in hex_str.split()]
                start = 0x6278 - 0x6000
                for i, b in enumerate(bytes_list):
                    if start + i < len(self.handler.wram):
                        self.handler.wram[start + i] = b & 0xFF
                        
            self.status_var.set("Event changes applied")
        except ValueError as e:
            messagebox.showerror("Error", f"Invalid hex value: {e}")
            
    def _clear_all_events(self):
        """Clear all event flags to zero"""
        if not self.handler.wram:
            return
            
        start = 0x6278 - 0x6000
        end = 0x6292 - 0x6000
        for i in range(start, end):
            self.handler.wram[i] = 0
            
        self._refresh_events_ui()
        self.status_var.set("Cleared event flags")
            
    def _open_mss(self):
        """Open Mesen save state"""
        filepath = filedialog.askopenfilename(
            filetypes=[("Mesen Save State", "*.mss"), ("All Files", "*.*")])
        if filepath:
            try:
                wram = self.mesen_state.load(filepath)
                if wram:
                    self.handler.load_from_wram(wram)
                    self.current_file = filepath
                    self.file_type = 'mss'
                    self._refresh_ui()
                    self.status_var.set(f"Loaded: {Path(filepath).name}")
                else:
                    messagebox.showerror("Error", "Could not find WRAM in save state")
            except Exception as e:
                messagebox.showerror("Error", f"Failed to load: {e}")
                
    def _open_sav(self):
        """Open SRAM file"""
        filepath = filedialog.askopenfilename(
            filetypes=[("SRAM File", "*.sav"), ("All Files", "*.*")])
        if filepath:
            try:
                wram = self.sram_file.load(filepath)
                self.handler.load_from_wram(wram)
                self.current_file = filepath
                self.file_type = 'sav'
                self._refresh_ui()
                self.status_var.set(f"Loaded: {Path(filepath).name}")
            except Exception as e:
                messagebox.showerror("Error", f"Failed to load: {e}")
                
    def _save(self):
        """Save to current file"""
        if not self.current_file:
            self._save_as()
            return
            
        wram = self.handler.get_wram_bytes()
        if self.file_type == 'mss':
            self.mesen_state.save(self.current_file, wram)
        else:
            self.sram_file.save(self.current_file, wram)
        self.status_var.set(f"Saved: {Path(self.current_file).name}")
        
    def _save_as(self):
        """Save to new file"""
        if self.file_type == 'mss':
            filepath = filedialog.asksaveasfilename(
                defaultextension=".mss",
                filetypes=[("Mesen Save State", "*.mss")])
        else:
            filepath = filedialog.asksaveasfilename(
                defaultextension=".sav",
                filetypes=[("SRAM File", "*.sav")])
        if filepath:
            self.current_file = filepath
            self._save()
            
    def _refresh_ui(self):
        """Refresh all UI elements with current data"""
        # Set first character
        if self.handler.characters:
            self.char_combo.set(self.handler.characters[0].name)
            self._display_character(self.handler.characters[0])
            
        # General data
        self.gold_var.set(str(self.handler.gold))
        self.coins_var.set(str(self.handler.casino_coins))
        self.chapter_var.set(CHAPTERS.get(self.handler.chapter, f"Unknown ({self.handler.chapter})"))
        self.tactics_var.set(TACTICS.get(self.handler.tactics, f"Unknown ({self.handler.tactics})"))
        self.daynight_var.set(str(self.handler.day_night))
        
        # Treasure flags
        for i, var in enumerate(self.treasure_vars):
            byte_idx = i // 8
            bit_idx = i % 8
            if byte_idx < len(self.handler.treasure_flags):
                var.set(bool(self.handler.treasure_flags[byte_idx] & (1 << bit_idx)))
                
        # Party order
        char_names = ['(Empty)'] + [c[0] for c in CHARACTERS]
        for i, var in enumerate(self.party_vars):
            party_idx = self.handler.party_order[i] if i < len(self.handler.party_order) else 0
            if 0 <= party_idx < len(char_names):
                var.set(char_names[party_idx])
            else:
                var.set(f"Unknown ({party_idx})")
                
        # Return locations
        for i, var in enumerate(self.return_vars):
            loc = self.handler.return_locations[i] if i < len(self.handler.return_locations) else 0
            var.set(str(loc))
                
        # Spells
        self._refresh_spells_ui()
        
        # Events
        self._refresh_events_ui()
                
    def _on_char_select(self, event):
        """Handle character selection"""
        name = self.char_combo.get()
        for char in self.handler.characters:
            if char.name == name:
                self._display_character(char)
                break
                
    def _display_character(self, char: CharacterData):
        """Display character data in UI"""
        self.stat_vars['level'].set(str(char.level))
        self.stat_vars['current_hp'].set(str(char.current_hp))
        self.stat_vars['max_hp'].set(str(char.max_hp))
        self.stat_vars['current_mp'].set(str(char.current_mp))
        self.stat_vars['max_mp'].set(str(char.max_mp))
        self.stat_vars['strength'].set(str(char.strength))
        self.stat_vars['agility'].set(str(char.agility))
        self.stat_vars['vitality'].set(str(char.vitality))
        self.stat_vars['intelligence'].set(str(char.intelligence))
        self.stat_vars['luck'].set(str(char.luck))
        self.stat_vars['xp'].set(str(char.xp))
        
        self.status_vars['alive'].set(bool(char.status & STATUS_FLAGS['alive']))
        self.status_vars['poisoned'].set(bool(char.status & STATUS_FLAGS['poisoned']))
        self.status_vars['paralyzed'].set(bool(char.status & STATUS_FLAGS['paralyzed']))
        
        for i, item_id in enumerate(char.items):
            item_name = ITEMS.get(item_id, f"Item ${item_id:02X}")
            self.item_vars[i].set(item_name)
            
    def _apply_char_changes(self):
        """Apply character changes from UI"""
        name = self.char_combo.get()
        for char in self.handler.characters:
            if char.name == name:
                try:
                    char.level = int(self.stat_vars['level'].get())
                    char.current_hp = int(self.stat_vars['current_hp'].get())
                    char.max_hp = int(self.stat_vars['max_hp'].get())
                    char.current_mp = int(self.stat_vars['current_mp'].get())
                    char.max_mp = int(self.stat_vars['max_mp'].get())
                    char.strength = int(self.stat_vars['strength'].get())
                    char.agility = int(self.stat_vars['agility'].get())
                    char.vitality = int(self.stat_vars['vitality'].get())
                    char.intelligence = int(self.stat_vars['intelligence'].get())
                    char.luck = int(self.stat_vars['luck'].get())
                    char.xp = int(self.stat_vars['xp'].get())
                    
                    char.status = 0
                    if self.status_vars['alive'].get():
                        char.status |= STATUS_FLAGS['alive']
                    if self.status_vars['poisoned'].get():
                        char.status |= STATUS_FLAGS['poisoned']
                    if self.status_vars['paralyzed'].get():
                        char.status |= STATUS_FLAGS['paralyzed']
                        
                    # Items
                    for i, var in enumerate(self.item_vars):
                        item_name = var.get()
                        # Find item ID from name
                        item_id = 0
                        for id_, nm in ITEMS.items():
                            if nm == item_name:
                                item_id = id_
                                break
                        char.items[i] = item_id
                        
                    self.status_var.set(f"Applied changes to {name}")
                except ValueError as e:
                    messagebox.showerror("Error", f"Invalid value: {e}")
                break
                
    def _apply_general_changes(self):
        """Apply general data changes from UI"""
        try:
            self.handler.gold = int(self.gold_var.get())
            self.handler.casino_coins = int(self.coins_var.get())
            
            # Parse chapter
            chapter_str = self.chapter_var.get()
            for ch_num, ch_name in CHAPTERS.items():
                if ch_name == chapter_str:
                    self.handler.chapter = ch_num
                    break
                    
            # Parse tactics
            tactics_str = self.tactics_var.get()
            for t_num, t_name in TACTICS.items():
                if t_name == tactics_str:
                    self.handler.tactics = t_num
                    break
                    
            self.handler.day_night = int(self.daynight_var.get())
            
            # Parse party order
            char_names = ['(Empty)'] + [c[0] for c in CHARACTERS]
            for i, var in enumerate(self.party_vars):
                name = var.get()
                if name in char_names:
                    self.handler.party_order[i] = char_names.index(name)
                else:
                    # Try to parse as number
                    try:
                        self.handler.party_order[i] = int(name.split('(')[-1].rstrip(')'))
                    except:
                        pass
                        
            # Parse return locations
            for i, var in enumerate(self.return_vars):
                try:
                    self.handler.return_locations[i] = int(var.get())
                except ValueError:
                    pass
            
            # Write general data back to WRAM
            self.handler.write_general_data()
            
            self.status_var.set("Applied general changes")
        except ValueError as e:
            messagebox.showerror("Error", f"Invalid value: {e}")
            
    def _max_stats(self):
        """Max out all character stats"""
        for char in self.handler.characters:
            char.level = 99
            char.strength = 255
            char.agility = 255
            char.vitality = 255
            char.intelligence = 255
            char.luck = 255
            char.max_hp = 999
            char.current_hp = 999
            char.max_mp = 999
            char.current_mp = 999
        self._refresh_ui()
        self.status_var.set("Maxed all stats")
        
    def _max_gold(self):
        """Max gold and coins"""
        self.handler.gold = 999999
        self.handler.casino_coins = 999999
        self._refresh_ui()
        self.status_var.set("Maxed gold and coins")
        
    def _full_heal(self):
        """Full heal all characters"""
        for char in self.handler.characters:
            char.current_hp = char.max_hp
            char.current_mp = char.max_mp
            char.status = STATUS_FLAGS['alive']  # Remove ailments, set alive
        self._refresh_ui()
        self.status_var.set("Full healed all characters")
        
    def _all_spells(self):
        """Give all spells to characters"""
        for char in self.handler.characters:
            char.spells = [0xFF, 0xFF, 0xFF]
        self.status_var.set("All spells granted")
        
    def run(self):
        """Run the GUI"""
        self.root.mainloop()


def main():
    """Main entry point"""
    app = SaveEditorGUI()
    app.run()


if __name__ == "__main__":
    main()
