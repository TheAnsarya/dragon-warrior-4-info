#!/usr/bin/env python3
"""
Integrate cowness.net speedrun data with our Dragon Warrior IV analysis.

This tool parses the known data from cowness.net and generates:
1. Updated MLB labels for Mesen debugger
2. Reference documentation
3. Data files for cross-referencing
"""

import os
import json
from pathlib import Path

# Base paths
SCRIPT_DIR = Path(__file__).parent
PROJECT_ROOT = SCRIPT_DIR.parent
DATA_DIR = PROJECT_ROOT / "data"
DOCS_DIR = PROJECT_ROOT / "docs"
DEBUG_DIR = PROJECT_ROOT / "debug"

# ============================================================================
# COWNESS.NET DATA - Parsed from speedrun notes
# ============================================================================

# From DW4_NES_Notes.txt - Hero experience requirements
HERO_EXP_TABLE = {
    25: 102787,
    26: 118192,
    27: 135522,
    28: 155018,
    29: 176951,
    30: 201625,
    31: 229383,
}

# From DW4_NES_Notes.txt - Necrosaro HP by phase
NECROSARO_HP = {
    1: 800,   # Phase 1
    2: 650,   # Phase 2
    3: 1023,  # Phase 3
    4: 1023,  # Phase 4
    5: 700,   # Phase 5
    6: 800,   # Phase 6
    7: 700,   # Phase 7 (regenerates 100/turn)
    8: 1023,  # Final phase
}

# From DW4_NES_Notes.txt - Tournament opponents
TOURNAMENT_STATS = {
    "Hun": {"HP": 70, "behavior": "standard"},
    "Roric": {"HP": 90, "behavior": "standard"},
    "Vivian": {"HP": 90, "MP": 12, "behavior": "caster"},
    "Sampson": {"HP": 90, "behavior": "standard"},
    "Linguar": {"HP": 55, "behavior": "standard"},
}

# From DW4_NES_Manipulations.txt - RNG memory addresses
RNG_ADDRESSES = {
    0x0012: {
        "name": "RNG_Seed_Low",
        "description": "RNG seed low byte - changes every frame, XORed with save checksum",
        "bank": "RAM"
    },
    0x0013: {
        "name": "RNG_Seed_High",
        "description": "RNG seed high byte - acts like DW3's RNG",
        "bank": "RAM"
    },
    0x0016: {
        "name": "RNG_Temp",
        "description": "RNG temporary storage - used during RNG calculation",
        "bank": "RAM"
    },
    0x0018: {
        "name": "Encounter_Rate",
        "description": "Encounter rate of current tile",
        "bank": "RAM"
    },
    0x050D: {
        "name": "RNG_Counter",
        "description": "RNG counter - increments each time a random number is generated",
        "bank": "RAM"
    },
    0x050C: {
        "name": "RNG_Counter_Compare",
        "description": "RNG counter comparison value",
        "bank": "RAM"
    },
}

# From DW4_NES_Manipulations.txt - RNG code addresses (Bank 1F = 31)
RNG_CODE = {
    0xC890: {"name": "rng_return", "description": "RNG RTS"},
    0xC891: {"name": "rng_main", "description": "Main RNG function - generates random number"},
    0xC8A1: {"name": "rng_inc_counter", "description": "Increment RNG counter at $050D"},
    0xC8A6: {"name": "rng_load_seed", "description": "Load seed from $0012 and add counter"},
    0xC8AD: {"name": "rng_shifter", "description": "RNG bit shift subroutine"},
    0xC8CB: {"name": "rng_shifter_end", "description": "RNG shifter end"},
    0xC913: {"name": "rng_related", "description": "RNG related subroutine (called from NMI)"},
    0xFF74: {"name": "nmi_rng_update", "description": "NMI handler - updates RNG seed $0012"},
    0xFF79: {"name": "nmi_inc_seed", "description": "Increment RNG seed low byte"},
    0xFF82: {"name": "nmi_call_rng", "description": "Call RNG-related subroutine"},
}

# From DW4_NES_Manipulations.txt - Save file addresses
SAVE_FILE_ADDRESSES = {
    "current": {"start": 0x6000, "end": 0x62EE, "name": "Current_Save_Data"},
    "file1": {"start": 0x62EF, "end": 0x65DE, "name": "Save_File_1"},
    "file2": {"start": 0x65DF, "end": 0x68CE, "name": "Save_File_2"},
    "file3": {"start": 0x68CF, "end": 0x6BBE, "name": "Save_File_3"},
}

# From DW4 Other Monster Bytes.txt - Monster byte flags
MONSTER_BYTE_FLAGS = {
    "byte_22": {
        "description": "Monster special flags",
        "bits": {
            "0-1": "Metal flag (11 = Metal monster, immune to most damage)",
        }
    },
    "byte_23": {
        "description": "Drop rate and flags",
        "bits": {
            "0-2": "Item drop rate (000=0, 001=1/2, 010=1/4, 011=1/8, 100=1/16, 101=1/32, 110=1/256, 111=100%)",
            "3-7": "Unknown flags",
        }
    },
    "byte_24": {
        "description": "Status vulnerability and behavior flags",
        "bits": {
            "0-2": "Status flags (usually 111)",
            "3-5": "Mid bits - behavior flags",
            "6": "Confused vulnerability (1=can be confused)",
            "7": "Bounce/reflect magic flag",
        },
        "patterns": {
            0xC7: "Bounce - reflects magic",
            0x87: "Confused - can be confused",
            0x47: "Paralyzed - can be paralyzed",
            0x07: "Asleep - can be put to sleep (Esturk, Bomb Crag)",
            0x17: "Sleepy Boys pattern (Brahmird, Big Sloth)",
            0x3F: "Standard enemy pattern",
        }
    },
}

# From DW4 Other Monster Bytes.txt - Known monster byte patterns
MONSTER_PATTERNS = {
    "Metal Slime": {"byte_22": 0x11, "byte_24": 0x3F, "notes": "Metal flag set"},
    "Metal Babble": {"byte_22": 0x11, "byte_24": 0x3F, "notes": "Metal flag set, evasion '3'"},
    "King Metal": {"byte_22": 0x11, "byte_24": 0x37, "notes": "Metal flag set, different mid bits"},
    "Esturk": {"byte_22": 0x00, "byte_24": 0x07, "notes": "Sleepiest Boy - very vulnerable to sleep"},
    "Necrosaro 7": {"byte_22": 0x00, "byte_24": 0xC7, "notes": "Has bounce/reflect"},
    "Mimic": {"byte_22": 0x00, "byte_24": 0x3F, "notes": "Standard Mimic AI"},
    "Vampire Bat": {"byte_22": 0x00, "byte_24": 0x9F, "notes": "Confused Boys pattern"},
    "Rogue Wisper": {"byte_22": 0x00, "byte_24": 0x97, "notes": "Confused Boys pattern"},
}

# Misc gameplay mechanics from notes
GAMEPLAY_MECHANICS = {
    "fairy_water_steps": 127,  # Fairy water provides 127 steps of repel
    "alena_level_11_stats": {
        "HP": {"min": 71, "max": 91},
        "ATK": {"min": 75, "max": 86},
        "DEF": {"min": 39, "max": 41},
    },
    "necrosaro_phase7_regen": 100,  # HP per turn
}


def generate_mlb_labels():
    """Generate MLB format labels for Mesen debugger."""
    labels = []
    
    # RAM labels for RNG
    for addr, info in RNG_ADDRESSES.items():
        # RAM addresses use different format (no bank prefix for $00-$1F typically)
        if addr < 0x100:
            labels.append(f"R:{addr:04X}:{info['name']}")
        else:
            labels.append(f"S:{addr:04X}:{info['name']}")
    
    # Code labels for RNG (Bank 31 = $1F)
    for addr, info in RNG_CODE.items():
        # Bank 31 is the fixed bank at $C000-$FFFF
        # PRG ROM offset = (bank * 0x4000) + (addr - $C000)
        prg_offset = (31 * 0x4000) + (addr - 0xC000)
        labels.append(f"P:{prg_offset:04X}:{info['name']}")
    
    # Save file region markers
    for region, info in SAVE_FILE_ADDRESSES.items():
        labels.append(f"S:{info['start']:04X}:{info['name']}_Start")
    
    return labels


def generate_reference_doc():
    """Generate comprehensive reference documentation."""
    doc = []
    doc.append("# Dragon Warrior IV - Cowness.net Reference Data")
    doc.append("")
    doc.append("Data sourced from https://cowness.net/Speedrunning/DW4%20Notes/")
    doc.append("")
    
    # Hero EXP Table
    doc.append("## Hero Experience Requirements")
    doc.append("")
    doc.append("| Level | Total EXP | EXP to Next |")
    doc.append("|-------|-----------|-------------|")
    sorted_levels = sorted(HERO_EXP_TABLE.keys())
    for i, level in enumerate(sorted_levels):
        exp = HERO_EXP_TABLE[level]
        if i > 0:
            prev_exp = HERO_EXP_TABLE[sorted_levels[i-1]]
            diff = exp - prev_exp
        else:
            diff = "-"
        doc.append(f"| {level} | {exp:,} | {diff if isinstance(diff, str) else f'{diff:,}'} |")
    doc.append("")
    
    # Necrosaro HP
    doc.append("## Necrosaro Boss HP by Phase")
    doc.append("")
    doc.append("| Phase | HP | Notes |")
    doc.append("|-------|-----|-------|")
    for phase, hp in NECROSARO_HP.items():
        notes = "Regenerates 100/turn" if phase == 7 else ""
        doc.append(f"| {phase} | {hp} | {notes} |")
    doc.append("")
    
    # Tournament
    doc.append("## Tournament Opponents (Chapter 2)")
    doc.append("")
    doc.append("| Name | HP | MP | Notes |")
    doc.append("|------|-----|-----|-------|")
    for name, stats in TOURNAMENT_STATS.items():
        hp = stats.get("HP", "-")
        mp = stats.get("MP", "-")
        notes = stats.get("behavior", "")
        doc.append(f"| {name} | {hp} | {mp} | {notes} |")
    doc.append("")
    
    # RNG Addresses
    doc.append("## RNG System Addresses")
    doc.append("")
    doc.append("### RAM Addresses")
    doc.append("")
    doc.append("| Address | Name | Description |")
    doc.append("|---------|------|-------------|")
    for addr, info in sorted(RNG_ADDRESSES.items()):
        doc.append(f"| ${addr:04X} | {info['name']} | {info['description']} |")
    doc.append("")
    
    doc.append("### RNG Code (Bank 31 / $1F - Fixed Bank)")
    doc.append("")
    doc.append("| Address | Name | Description |")
    doc.append("|---------|------|-------------|")
    for addr, info in sorted(RNG_CODE.items()):
        doc.append(f"| ${addr:04X} | {info['name']} | {info['description']} |")
    doc.append("")
    
    # Save File Structure
    doc.append("## Save File Memory Layout")
    doc.append("")
    doc.append("| Region | Start | End | Size | Description |")
    doc.append("|--------|-------|-----|------|-------------|")
    for region, info in SAVE_FILE_ADDRESSES.items():
        size = info['end'] - info['start'] + 1
        doc.append(f"| {region} | ${info['start']:04X} | ${info['end']:04X} | {size} bytes | {info['name']} |")
    doc.append("")
    
    # Monster Byte Flags
    doc.append("## Monster Data Byte Structure")
    doc.append("")
    doc.append("Monster data records have at least 27 bytes. Key flag bytes:")
    doc.append("")
    for byte_name, byte_info in MONSTER_BYTE_FLAGS.items():
        doc.append(f"### {byte_name.replace('_', ' ').title()}")
        doc.append("")
        doc.append(byte_info['description'])
        doc.append("")
        if "bits" in byte_info:
            doc.append("**Bit Layout:**")
            for bits, desc in byte_info["bits"].items():
                doc.append(f"- Bits {bits}: {desc}")
        if "patterns" in byte_info:
            doc.append("")
            doc.append("**Known Patterns:**")
            doc.append("")
            doc.append("| Value | Meaning |")
            doc.append("|-------|---------|")
            for val, meaning in byte_info["patterns"].items():
                doc.append(f"| ${val:02X} | {meaning} |")
        doc.append("")
    
    # Known Monster Patterns
    doc.append("## Known Monster Byte Patterns")
    doc.append("")
    doc.append("| Monster | Byte 22 | Byte 24 | Notes |")
    doc.append("|---------|---------|---------|-------|")
    for monster, data in MONSTER_PATTERNS.items():
        b22 = f"${data['byte_22']:02X}"
        b24 = f"${data['byte_24']:02X}"
        doc.append(f"| {monster} | {b22} | {b24} | {data['notes']} |")
    doc.append("")
    
    # Gameplay Mechanics
    doc.append("## Gameplay Mechanics")
    doc.append("")
    doc.append(f"- **Fairy Water Duration:** {GAMEPLAY_MECHANICS['fairy_water_steps']} steps of enemy repel")
    doc.append(f"- **Necrosaro Phase 7 Regeneration:** {GAMEPLAY_MECHANICS['necrosaro_phase7_regen']} HP per turn")
    doc.append("")
    doc.append("### Alena Level 11 Stat Ranges")
    doc.append("")
    stats = GAMEPLAY_MECHANICS['alena_level_11_stats']
    for stat, range_data in stats.items():
        doc.append(f"- {stat}: {range_data['min']} - {range_data['max']}")
    doc.append("")
    
    return "\n".join(doc)


def generate_json_data():
    """Generate JSON data files for programmatic access."""
    data = {
        "hero_exp_table": HERO_EXP_TABLE,
        "necrosaro_hp": NECROSARO_HP,
        "tournament_stats": TOURNAMENT_STATS,
        "rng_addresses": {hex(k): v for k, v in RNG_ADDRESSES.items()},
        "rng_code": {hex(k): v for k, v in RNG_CODE.items()},
        "save_file_addresses": SAVE_FILE_ADDRESSES,
        "monster_byte_flags": MONSTER_BYTE_FLAGS,
        "monster_patterns": MONSTER_PATTERNS,
        "gameplay_mechanics": GAMEPLAY_MECHANICS,
    }
    return data


def convert_exp_to_hex():
    """Convert experience values to hex for ROM searching."""
    print("Hero EXP values in hex (for ROM searching):")
    print("-" * 50)
    for level, exp in sorted(HERO_EXP_TABLE.items()):
        # Convert to 3-byte little-endian (common in NES)
        low = exp & 0xFF
        mid = (exp >> 8) & 0xFF
        high = (exp >> 16) & 0xFF
        print(f"Level {level}: {exp:7d} = ${exp:06X} = bytes: {low:02X} {mid:02X} {high:02X}")
    print()


def main():
    """Main function to generate all outputs."""
    # Ensure output directories exist
    DATA_DIR.mkdir(exist_ok=True)
    (DATA_DIR / "json").mkdir(exist_ok=True)
    DOCS_DIR.mkdir(exist_ok=True)
    DEBUG_DIR.mkdir(exist_ok=True)
    
    print("=" * 60)
    print("Dragon Warrior IV - Cowness.net Data Integration")
    print("=" * 60)
    print()
    
    # Generate and display EXP hex values
    convert_exp_to_hex()
    
    # Generate reference documentation
    print("Generating reference documentation...")
    doc = generate_reference_doc()
    doc_path = DOCS_DIR / "cowness_reference.md"
    with open(doc_path, "w", encoding="utf-8") as f:
        f.write(doc)
    print(f"  Written: {doc_path}")
    
    # Generate JSON data
    print("Generating JSON data file...")
    data = generate_json_data()
    json_path = DATA_DIR / "json" / "cowness_data.json"
    with open(json_path, "w", encoding="utf-8") as f:
        json.dump(data, f, indent=2)
    print(f"  Written: {json_path}")
    
    # Generate MLB labels
    print("Generating MLB labels...")
    labels = generate_mlb_labels()
    mlb_path = DATA_DIR / "cowness_labels.txt"
    with open(mlb_path, "w", encoding="utf-8") as f:
        f.write("# Cowness.net reference labels for Dragon Warrior IV\n")
        f.write("# Add these to your MLB file for Mesen debugging\n\n")
        for label in labels:
            f.write(label + "\n")
    print(f"  Written: {mlb_path}")
    
    print()
    print("=" * 60)
    print("Summary of integrated data:")
    print(f"  - Hero EXP table: Levels 25-31 ({len(HERO_EXP_TABLE)} entries)")
    print(f"  - Necrosaro HP phases: {len(NECROSARO_HP)} phases")
    print(f"  - Tournament opponents: {len(TOURNAMENT_STATS)} entries")
    print(f"  - RNG RAM addresses: {len(RNG_ADDRESSES)} addresses")
    print(f"  - RNG code labels: {len(RNG_CODE)} labels")
    print(f"  - Save file regions: {len(SAVE_FILE_ADDRESSES)} regions")
    print(f"  - Monster byte patterns: {len(MONSTER_PATTERNS)} known monsters")
    print("=" * 60)


if __name__ == "__main__":
    main()
