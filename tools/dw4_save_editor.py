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
        
        # Try to find WRAM by looking for "NesState" marker
        # or by searching for the expected data pattern
        for i in range(len(data) - 0x2000):
            # Check if this looks like WRAM start
            # $6001 should have Hero status, then HP
            if self._looks_like_wram(data[i:i+0x2000]):
                self.wram_offset = i
                return bytes(data[i:i+0x2000])
                
        return None
        
    def _looks_like_wram(self, data: bytes) -> bool:
        """Check if data looks like valid WRAM"""
        if len(data) < 0x200:
            return False
            
        # Check Hero at offset 1 ($6001)
        status = data[1]
        hp = data[2] + (data[3] << 8)
        level = data[6]
        
        # Sanity checks
        if level < 1 or level > 99:
            return False
        if hp > 999:
            return False
        if status & 0x80 == 0 and hp > 0:
            # Dead but has HP - unlikely
            pass
            
        # Check gold at offset 0x157 (reasonable range)
        gold = data[0x157] + (data[0x158] << 8) + (data[0x159] << 16)
        if gold > 999999:
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
        
        canvas.pack(side="left", fill="both", expand=True)
        scrollbar.pack(side="right", fill="y")
        
        self.treasure_vars = []
        ttk.Label(scrollable, text="Check = Already Opened").pack(anchor='w')
        
        for i in range(27 * 8):
            byte_idx = i // 8
            bit_idx = i % 8
            var = tk.BooleanVar()
            self.treasure_vars.append(var)
            cb = ttk.Checkbutton(scrollable, text=f"Treasure ${625+byte_idx:02X}#{bit_idx}", 
                                  variable=var)
            cb.pack(anchor='w')
            
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
