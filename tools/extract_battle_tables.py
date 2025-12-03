#!/usr/bin/env python3
"""
Dragon Warrior IV - Battle Table Extractor
Extracts and documents battle modifier tables from Bank 19
"""

import os

# Path configuration
SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
PROJECT_DIR = os.path.dirname(SCRIPT_DIR)
ROM_PATH = os.path.join(PROJECT_DIR, "roms", "Dragon Warrior IV (1992-10)(Enix)(US).nes")
DOCS_DIR = os.path.join(PROJECT_DIR, "docs")

# Bank 19 = ROM offset $4C010 for CPU $8000
BANK_19_OFFSET = 0x4C010

def cpu_to_rom(cpu_addr):
    """Convert CPU address to ROM offset for Bank 19"""
    if 0x8000 <= cpu_addr <= 0xBFFF:
        return BANK_19_OFFSET + (cpu_addr - 0x8000)
    raise ValueError(f"Address ${cpu_addr:04X} not in Bank 19 range")

def read_bytes(data, cpu_addr, count):
    """Read bytes from ROM at CPU address"""
    rom_offset = cpu_to_rom(cpu_addr)
    return data[rom_offset:rom_offset + count]

def main():
    with open(ROM_PATH, "rb") as f:
        rom_data = f.read()
    
    # Known battle tables
    tables = {
        # AI Tactics multiplier tables (indexed by $6E80 = tactics setting)
        # $615B values: 0=Normal, 1=SaveMP, 2=Offensive, 3=Defensive, 4=TryOut, 5=UseNoMP
        "BB84": {
            "name": "Attack Multiplier by Tactics",
            "addr": 0xBB84,
            "size": 7,
            "description": "Base attack power multiplier per AI tactic (0-6)",
        },
        "BB8B": {
            "name": "Stat Multiplier by Tactics", 
            "addr": 0xBB8B,
            "size": 7,
            "description": "Party stat sum multiplier per AI tactic",
        },
        "BB92": {
            "name": "Hit Threshold by Tactics",
            "addr": 0xBB92,
            "size": 7,
            "description": "Hit success threshold per AI tactic",
        },
        "BB99": {
            "name": "Base Damage Value",
            "addr": 0xBB99,
            "size": 1,
            "description": "Base value for damage calculations (0x40 = 64)",
        },
        
        # Mode-specific tables for damage calculation
        "BB9A": {
            "name": "Mode Damage Table 1",
            "addr": 0xBB9A,
            "size": 7,
            "description": "Mode-specific damage values (0x80 series)",
        },
        "BBA1": {
            "name": "Mode Damage Table 2",
            "addr": 0xBBA1,
            "size": 7,
            "description": "Mode-specific values (0xC8 series = 200)",
        },
        "BBA8": {
            "name": "Mode Damage Table 3",
            "addr": 0xBBA8,
            "size": 7,
            "description": "Mode-specific values (0x64 series = 100)",
        },
        "BBAF": {
            "name": "Mode Damage Table 4",
            "addr": 0xBBAF,
            "size": 7,
            "description": "Mode-specific values (0x00 series)",
        },
        "BBB6": {
            "name": "Mode Damage Table 5",
            "addr": 0xBBB6,
            "size": 7,
            "description": "Mode-specific values (0xFF series)",
        },
        
        # Action code tables (for hit calculation at $9135)
        "91A9": {
            "name": "Special Action Codes",
            "addr": 0x91A9,
            "size": 18,
            "description": "Action codes that need special hit handling",
        },
        "91CD": {
            "name": "Action Handler Table",
            "addr": 0x91CD,
            "size": 36,  # 18 entries x 2 bytes
            "description": "Jump table for special action handlers",
        },
        
        # Enemy data table
        "B967": {
            "name": "Enemy Resistance Data",
            "addr": 0xB967,
            "size": 256,  # Approximate
            "description": "Enemy resistance flags and type data (index by enemy ID)",
        },
    }
    
    # Output file
    output = []
    output.append("# Dragon Warrior IV - Battle System Tables")
    output.append("# Extracted from Bank 19")
    output.append("")
    output.append("## AI Tactics Reference")
    output.append("```")
    output.append("$615B values:")
    output.append("  0 = Normal (balanced)")
    output.append("  1 = Save MP (conservative magic)")
    output.append("  2 = Offensive (attack priority)")
    output.append("  3 = Defensive (defensive spells)")
    output.append("  4 = Try Out (experiment)")
    output.append("  5 = Use No MP (physical only)")
    output.append("```")
    output.append("")
    
    for key, info in tables.items():
        addr = info["addr"]
        size = info["size"]
        data = read_bytes(rom_data, addr, size)
        
        output.append(f"## {info['name']} (${addr:04X})")
        output.append(f"**Description:** {info['description']}")
        output.append("")
        
        # Format as hex dump
        output.append("```")
        if size <= 32:
            hex_str = " ".join(f"{b:02X}" for b in data)
            output.append(f"${addr:04X}: {hex_str}")
            
            # For small tables, show decimal values too
            if size <= 8:
                dec_str = ", ".join(str(b) for b in data)
                output.append(f"         ({dec_str})")
        else:
            # Multi-line for large tables
            for i in range(0, size, 16):
                chunk = data[i:i+16]
                hex_str = " ".join(f"{b:02X}" for b in chunk)
                output.append(f"${addr+i:04X}: {hex_str}")
        output.append("```")
        output.append("")
    
    # Add analysis section
    output.append("## Analysis")
    output.append("")
    output.append("### Attack Multiplier Table ($BB84)")
    mult_data = read_bytes(rom_data, 0xBB84, 7)
    output.append("```")
    output.append("Tactic   | Multiplier | Effect")
    output.append("---------|------------|------------------")
    tactics = ["Normal", "SaveMP", "Offensive", "Defensive", "TryOut", "UseNoMP", "Special"]
    for i, (tactic, val) in enumerate(zip(tactics, mult_data)):
        effect = f"{val}/16 = {val/16:.2f}x base attack"
        output.append(f"{i}: {tactic:10} | {val:3} (${val:02X})  | {effect}")
    output.append("```")
    output.append("")
    
    output.append("### Damage Formula (sub_AA67)")
    output.append("```")
    output.append("From disassembly analysis:")
    output.append("")
    output.append("1. base_value = (attacker_attack_power)")
    output.append("2. stat_component = (actor_index * 16) + party_stat_sum")
    output.append("3. scaled = stat_component / some_divisor")
    output.append("4. mode_modified = scaled * BB8B[tactics]")
    output.append("5. final_component = mode_modified * 16")
    output.append("6. base_modified = base_value * BB84[tactics]")
    output.append("7. total_damage = final_component + base_modified")
    output.append("```")
    output.append("")
    
    output.append("### Hit Check Thresholds ($9135)")
    output.append("```")
    output.append("Action ranges for hit check:")
    output.append("  $00-$12: Uses random check (compare $75EC)")
    output.append("  $13-$1B: Uses fixed check (#$06)")
    output.append("  $1C-$28: Always hits (SEC immediately)")
    output.append("  $29-$32: Always misses (CLC immediately)")
    output.append("  $33-$42: Always hits")
    output.append("  $43:     Uses random check")
    output.append("  $44+:    Always hits")
    output.append("```")
    output.append("")
    
    # Write output
    output_path = os.path.join(DOCS_DIR, "battle_tables.md")
    with open(output_path, "w", encoding="utf-8") as f:
        f.write("\n".join(output))
    
    print(f"Battle tables extracted to: {output_path}")
    print(f"Extracted {len(tables)} tables")

if __name__ == "__main__":
    main()
