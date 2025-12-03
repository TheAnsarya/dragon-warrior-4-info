#!/usr/bin/env python3
"""
Extract spell effect tables from Dragon Warrior IV (NES) ROM.

Based on reverse engineering of Bank 19 battle code:
- $B80B: Spell effect byte table (indexed by action code)
- $B915: Unknown spell parameter 1
- $B949: Unknown spell parameter 2
- $BA74: Spell data by tactics (7 tactics * 8 slots)
- $BAA5: Additional spell data by tactics
- $BAD5: More spell data by tactics
- $BB06: Tactics-based spell modifiers
- $BB22: Additional spell modifiers
- $BB3F: Spell power table (9 entries)
- $BB49: Another spell attribute table (9 entries)

The hit check routine at $9135 uses these action code ranges:
- $00-$12: Physical attacks/regular actions
- $13-$1B: Group 1 spells (elemental?)
- $1C-$28: Group 2 spells (status?)
- $29-$32: Group 3 spells
- $33-$42: Group 4 spells
- $43+:    Special actions
"""

import json
import os
import sys

# Configuration
ROM_PATH = os.path.join(os.path.dirname(__file__), "..", "roms", 
                        "Dragon Warrior IV (1992-10)(Enix)(US).nes")
OUTPUT_PATH = os.path.join(os.path.dirname(__file__), "..", "data", "json", "spell_tables.json")
DOC_PATH = os.path.join(os.path.dirname(__file__), "..", "docs", "spell_tables.md")

# Bank 19 is at PRG offset 0x4C000-0x4FFFF (after 16-byte header)
# Bank 19 is loaded at $8000-$BFFF
BANK_19_ROM_OFFSET = 16 + (19 * 0x4000)  # Header + bank offset

# Known spell tables in Bank 19
SPELL_TABLES = {
    "spell_effects": {
        "address": 0xB80B,
        "description": "Spell effect byte indexed by action code",
        "count": 256,  # Read 256 entries to cover all action codes
    },
    "spell_param_1": {
        "address": 0xB915,
        "description": "Spell parameter 1",
        "count": 52,  # Approx spell count
    },
    "spell_param_2": {
        "address": 0xB949,
        "description": "Spell parameter 2",
        "count": 30,
    },
    "enemy_resistance": {
        "address": 0xB967,
        "description": "Enemy resistance data (upper 3 bits=type, lower 5=resistance)",
        "count": 256,
    },
    "tactics_spell_data_1": {
        "address": 0xBA74,
        "description": "Spell data by tactics slot (7 tactics * 8 slots = 56)",
        "count": 49,  # 7 * 7
    },
    "tactics_spell_data_2": {
        "address": 0xBAA5,
        "description": "Additional spell data by tactics slot",
        "count": 48,
    },
    "tactics_spell_data_3": {
        "address": 0xBAD5,
        "description": "More spell data by tactics slot",
        "count": 18,
    },
    "tactics_modifiers": {
        "address": 0xBB06,
        "description": "Tactics-based spell modifiers (4 tactics * 5 values)",
        "count": 28,
    },
    "spell_bonus": {
        "address": 0xBB22,
        "description": "Spell bonus values by tactics",
        "count": 29,
    },
    "spell_power": {
        "address": 0xBB3F,
        "description": "Spell power table (9 entries, indexed by $75E8 capped at 8)",
        "count": 10,
    },
    "spell_attribute": {
        "address": 0xBB49,
        "description": "Spell attribute table (9 entries)",
        "count": 10,
    },
    "attack_multiplier": {
        "address": 0xBB84,
        "description": "Attack damage multiplier by tactics (7 entries)",
        "count": 7,
    },
    "stat_multiplier": {
        "address": 0xBB8B,
        "description": "Stat multiplier by tactics (7 entries)",
        "count": 7,
    },
    "hit_threshold": {
        "address": 0xBB92,
        "description": "Hit threshold by tactics (7 entries)",
        "count": 7,
    },
    "base_damage": {
        "address": 0xBB99,
        "description": "Base damage value (64)",
        "count": 1,
    },
}

# Known spell names from DW4 (0x13 = Heal, etc.)
SPELL_NAMES = {
    0x13: "Heal",
    0x14: "Healmore", 
    0x15: "Healall",
    0x16: "Healus",
    0x17: "Healusall",
    0x18: "Vivify",
    0x19: "Revive",
    0x1A: "Antidote",
    0x1B: "Numboff",
    0x1C: "Blaze",
    0x1D: "Blazemore",
    0x1E: "Blazemost",
    0x1F: "Firebane",
    0x20: "Firevolt",
    0x21: "Bang",
    0x22: "Boom",
    0x23: "Explodet",
    0x24: "Icebolt",
    0x25: "Snowblast",
    0x26: "Zap",
    0x27: "Thordain",
    0x28: "Defeat",
    0x29: "Beat",
    0x2A: "Bedragon",
    0x2B: "Limbo",
    0x2C: "Sleep",
    0x2D: "Sleepmore",
    0x2E: "StopSpell",
    0x2F: "Surround",
    0x30: "RobMagic",
    0x31: "Ironize",
    0x32: "Transform",
    0x33: "Bounce",
    0x34: "Increase",
    0x35: "Bikill",
    0x36: "Sap",
    0x37: "Defense",
    0x38: "SpeedUp",
    0x39: "SlowDown",
    0x3A: "Outside",
    0x3B: "Return",
    0x3C: "X-Ray",
    0x3D: "Stepguard",
    0x3E: "Repel",
    0x3F: "Radiant",
    0x40: "Day-Night",
    0x41: "Chance",
    0x42: "Transform",
}

# Action types based on hit check analysis at $9135
ACTION_TYPES = {
    "physical": (0x00, 0x12),
    "spell_group_1": (0x13, 0x1B),  # Healing/revival?
    "spell_group_2": (0x1C, 0x28),  # Offensive elemental?
    "spell_group_3": (0x29, 0x32),  # Status effects?
    "spell_group_4": (0x33, 0x42),  # Buff/utility?
    "special": (0x43, 0xFF),
}


def addr_to_offset(addr):
    """Convert Bank 19 address ($8000-$BFFF) to ROM file offset."""
    return BANK_19_ROM_OFFSET + (addr - 0x8000)


def read_rom():
    """Read the ROM file."""
    with open(ROM_PATH, "rb") as f:
        return f.read()


def extract_table(rom_data, table_info):
    """Extract a single table from ROM."""
    addr = table_info["address"]
    count = table_info["count"]
    offset = addr_to_offset(addr)
    
    data = []
    for i in range(count):
        if offset + i < len(rom_data):
            data.append(rom_data[offset + i])
    return data


def analyze_spell_effects(effects):
    """Analyze spell effect bytes to identify patterns."""
    analysis = {}
    
    for i, effect in enumerate(effects):
        if i < 0x13:
            category = "physical"
        elif i <= 0x1B:
            category = "healing"
        elif i <= 0x28:
            category = "offensive"
        elif i <= 0x32:
            category = "status"
        elif i <= 0x42:
            category = "buff"
        else:
            category = "special"
        
        spell_name = SPELL_NAMES.get(i, f"Action_{i:02X}")
        
        # Decode effect byte
        analysis[i] = {
            "name": spell_name,
            "category": category,
            "effect_byte": effect,
            "effect_hex": f"${effect:02X}",
        }
        
        # Try to decode effect byte structure
        # Many effects seem to use upper bits for type, lower for parameter
        analysis[i]["upper_nibble"] = (effect >> 4) & 0x0F
        analysis[i]["lower_nibble"] = effect & 0x0F
    
    return analysis


def generate_markdown(tables_data, spell_analysis):
    """Generate markdown documentation."""
    md = """# Dragon Warrior IV (NES) - Spell Effect Tables

## Overview

This document describes the spell and action effect data tables found in Bank 19
of Dragon Warrior IV. The battle system uses these tables to determine spell behavior,
damage calculation, and effect application.

## Action Code Ranges

Based on the hit check routine at `$9135`, actions are categorized:

| Range | Type | Description |
|-------|------|-------------|
| $00-$12 | Physical | Regular attacks, defend, flee |
| $13-$1B | Healing | Heal, Healmore, Vivify, etc. |
| $1C-$28 | Offensive | Blaze, Bang, Zap, elemental spells |
| $29-$32 | Status | Sleep, StopSpell, Surround |
| $33-$42 | Buff/Utility | Bounce, Bikill, Return, etc. |
| $43+ | Special | Monster abilities, AI actions |

## Spell Effect Table ($B80B)

The primary spell effect table is at `$B80B`. Each byte defines the effect type
for a corresponding action code.

### Effect Byte Format

The effect bytes appear to encode multiple properties:
- Upper nibble: Effect category/type
- Lower nibble: Power level or parameter

Common effect bytes observed:
- `$E0-$E5`: Healing spells (different power levels)
- `$F2`: Many offensive spells
- `$67-$72`: Status/buff effects

### Spell List with Effects

| Code | Name | Effect | Category |
|------|------|--------|----------|
"""
    
    # Add spells to the markdown
    for code in range(0x13, 0x43):
        if code in spell_analysis:
            info = spell_analysis[code]
            md += f"| ${code:02X} | {info['name']} | {info['effect_hex']} | {info['category']} |\n"
    
    md += """

## Tactics Modifier Tables

The AI tactics system uses several modifier tables to adjust spell behavior.

### Attack Multiplier ($BB84)

"""
    
    tactics_names = ["Normal", "SaveMP", "Offensive", "Defensive", "TryOut", "UseNoMP", "Unknown"]
    if "attack_multiplier" in tables_data:
        md += "| Tactics | Multiplier | Effect |\n|---------|------------|--------|\n"
        for i, val in enumerate(tables_data["attack_multiplier"]):
            name = tactics_names[i] if i < len(tactics_names) else f"Tactics_{i}"
            effect = "Normal" if val == 16 else f"{val/16:.1f}x"
            md += f"| {name} | {val} | {effect} |\n"
    
    md += """

### Stat Multiplier ($BB8B)

"""
    if "stat_multiplier" in tables_data:
        md += "| Tactics | Multiplier | Effect |\n|---------|------------|--------|\n"
        for i, val in enumerate(tables_data["stat_multiplier"]):
            name = tactics_names[i] if i < len(tactics_names) else f"Tactics_{i}"
            effect = "Normal" if val == 16 else ("Disabled" if val == 0 else f"{val/16:.1f}x")
            md += f"| {name} | {val} | {effect} |\n"
    
    md += """

### Hit Threshold ($BB92)

"""
    if "hit_threshold" in tables_data:
        md += "| Tactics | Threshold | Hit Chance |\n|---------|-----------|------------|\n"
        for i, val in enumerate(tables_data["hit_threshold"]):
            name = tactics_names[i] if i < len(tactics_names) else f"Tactics_{i}"
            pct = f"{val/255*100:.0f}%"
            md += f"| {name} | {val} | ~{pct} |\n"
    
    md += """

## Spell Power Table ($BB3F, $BB49)

These 9-entry tables (indexed by `$75E8` capped at 8) provide spell power and attribute data.

"""
    if "spell_power" in tables_data:
        md += "### Power Values ($BB3F)\n\n| Index | Value | Hex |\n|-------|-------|-----|\n"
        for i, val in enumerate(tables_data["spell_power"]):
            md += f"| {i} | {val} | ${val:02X} |\n"
    
    if "spell_attribute" in tables_data:
        md += "\n### Attribute Values ($BB49)\n\n| Index | Value | Hex |\n|-------|-------|-----|\n"
        for i, val in enumerate(tables_data["spell_attribute"]):
            md += f"| {i} | {val} | ${val:02X} |\n"
    
    md += """

## Raw Table Data

### Spell Effects ($B80B) - First 128 bytes

```
"""
    if "spell_effects" in tables_data:
        for i in range(0, min(128, len(tables_data["spell_effects"])), 16):
            addr = 0xB80B + i
            row = tables_data["spell_effects"][i:i+16]
            hex_str = " ".join(f"{b:02X}" for b in row)
            md += f"${addr:04X}: {hex_str}\n"
    
    md += "```\n\n"
    
    md += """## Subroutine References

Key subroutines that use these tables:

| Address | Name | Description |
|---------|------|-------------|
| $8013 | - | Loads from $B915,Y |
| $801B | - | Loads from $B949,Y |
| $9135 | hit_check | Action code classification |
| $9279 | - | Uses $B80B for spell effects |
| $9316 | - | Uses $B80B for spell effects |
| $936A | sub_9365 | Loads from $BAA5,X |
| $937F | sub_937A | Loads from $BAD5,X |
| $939F | sub_939A | Loads from $BA74,X |
| $A46A | - | Uses $B80B,Y |
| $AE8A | - | Loads from $BB06,Y (tactics modifier) |
| $AEA9 | sub_AEA6 | Loads from $BB3F,X (spell power) |
| $AEB7 | sub_AEB4 | Loads from $BB49,X (spell attribute) |

## Notes

1. The tactics index is stored at `$6E80` (from `$615B` tactics byte)
2. Spell slot/level appears to be at `$75E8`
3. Damage output goes to `$75D4-$75D5` (16-bit)
4. Hit check result at `$75EC`
5. Final spell effect output at `$75EF`
"""
    
    return md


def main():
    print("Dragon Warrior IV Spell Table Extractor")
    print("=" * 50)
    
    # Check ROM exists
    if not os.path.exists(ROM_PATH):
        print(f"ERROR: ROM not found at {ROM_PATH}")
        sys.exit(1)
    
    # Read ROM
    rom_data = read_rom()
    print(f"ROM size: {len(rom_data)} bytes")
    
    # Extract all tables
    tables_data = {}
    for name, info in SPELL_TABLES.items():
        data = extract_table(rom_data, info)
        tables_data[name] = data
        print(f"Extracted {name}: {len(data)} bytes from ${info['address']:04X}")
    
    # Analyze spell effects
    spell_analysis = analyze_spell_effects(tables_data.get("spell_effects", []))
    
    # Create output directory
    os.makedirs(os.path.dirname(OUTPUT_PATH), exist_ok=True)
    os.makedirs(os.path.dirname(DOC_PATH), exist_ok=True)
    
    # Save JSON
    json_output = {
        "description": "Dragon Warrior IV spell effect tables from Bank 19",
        "bank": 19,
        "tables": {
            name: {
                "address": f"${info['address']:04X}",
                "description": info["description"],
                "data": [f"${b:02X}" for b in tables_data[name]],
                "raw": tables_data[name],
            }
            for name, info in SPELL_TABLES.items()
        },
        "spell_analysis": {
            f"${k:02X}": v for k, v in spell_analysis.items()
            if k >= 0x13 and k <= 0x42
        },
    }
    
    with open(OUTPUT_PATH, "w") as f:
        json.dump(json_output, f, indent=2)
    print(f"\nSaved JSON to: {OUTPUT_PATH}")
    
    # Generate markdown
    md_content = generate_markdown(tables_data, spell_analysis)
    with open(DOC_PATH, "w") as f:
        f.write(md_content)
    print(f"Saved documentation to: {DOC_PATH}")
    
    # Summary
    print("\n" + "=" * 50)
    print("SPELL ANALYSIS SUMMARY")
    print("=" * 50)
    
    # Count spells by category
    categories = {}
    for code, info in spell_analysis.items():
        if code >= 0x13 and code <= 0x42:
            cat = info["category"]
            categories[cat] = categories.get(cat, 0) + 1
    
    for cat, count in sorted(categories.items()):
        print(f"  {cat}: {count} spells")
    
    # Show unique effect bytes
    unique_effects = set()
    for code in range(0x13, 0x43):
        if code in spell_analysis:
            unique_effects.add(spell_analysis[code]["effect_byte"])
    
    print(f"\nUnique effect bytes: {len(unique_effects)}")
    print("Effect bytes:", " ".join(f"${e:02X}" for e in sorted(unique_effects)))


if __name__ == "__main__":
    main()
