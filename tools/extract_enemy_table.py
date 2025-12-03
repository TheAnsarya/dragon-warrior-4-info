#!/usr/bin/env python3
"""
Dragon Warrior IV - Enemy Data Table Extractor
Extracts enemy resistance and type data from Bank 19
"""

import os

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

def main():
    with open(ROM_PATH, "rb") as f:
        rom_data = f.read()
    
    # Read enemy data table at $B967
    # Based on code: LDA $B967,X where X = enemy index
    # Bits:
    #   [7:5] = Type? (values 0-7)
    #   [4:0] = Resistance flags or value
    
    table_start = cpu_to_rom(0xB967)
    table_size = 256  # Full table
    
    enemy_data = rom_data[table_start:table_start + table_size]
    
    output = []
    output.append("# Dragon Warrior IV - Enemy Data Table")
    output.append("# Location: Bank 19, $B967")
    output.append("")
    output.append("## Table Structure")
    output.append("")
    output.append("Each byte encodes enemy properties:")
    output.append("- Bits 7-5: Type category (0-7)")
    output.append("- Bits 4-0: Resistance/special flags")
    output.append("")
    output.append("## Type Categories (Bits 7-5)")
    output.append("")
    output.append("Based on value distribution analysis:")
    output.append("```")
    output.append("0 ($00-$1F): Regular enemies")
    output.append("1 ($20-$3F): Undead/Ghost?")
    output.append("2 ($40-$5F): Flying?")
    output.append("3 ($60-$7F): Magic-using?")
    output.append("4 ($80-$9F): Strong enemies")
    output.append("5 ($A0-$BF): Boss-tier?")
    output.append("6 ($C0-$DF): High resistance")
    output.append("7 ($E0-$FF): Bosses/immune")
    output.append("```")
    output.append("")
    
    # Analyze type distribution
    type_counts = [0] * 8
    for b in enemy_data:
        type_idx = (b >> 5) & 0x07
        type_counts[type_idx] += 1
    
    output.append("## Type Distribution")
    output.append("```")
    for i, count in enumerate(type_counts):
        output.append(f"Type {i}: {count} enemies")
    output.append("```")
    output.append("")
    
    # Resistance value distribution
    resist_counts = {}
    for b in enemy_data:
        resist = b & 0x1F
        resist_counts[resist] = resist_counts.get(resist, 0) + 1
    
    output.append("## Resistance Value Distribution")
    output.append("```")
    for resist in sorted(resist_counts.keys()):
        output.append(f"Resist ${resist:02X} ({resist:2d}): {resist_counts[resist]} enemies")
    output.append("```")
    output.append("")
    
    # Full hex dump
    output.append("## Raw Data")
    output.append("```")
    for i in range(0, len(enemy_data), 16):
        addr = 0xB967 + i
        chunk = enemy_data[i:i+16]
        hex_str = " ".join(f"{b:02X}" for b in chunk)
        ascii_str = "".join(chr(b) if 0x20 <= b < 0x7F else "." for b in chunk)
        output.append(f"${addr:04X}: {hex_str}  {ascii_str}")
    output.append("```")
    output.append("")
    
    # Known enemy analysis (first few entries)
    output.append("## Sample Enemy Analysis")
    output.append("")
    output.append("| Index | Byte | Type | Resist | Notes |")
    output.append("|-------|------|------|--------|-------|")
    
    for i in range(min(32, len(enemy_data))):
        byte = enemy_data[i]
        type_val = (byte >> 5) & 0x07
        resist_val = byte & 0x1F
        
        # Interpret type
        type_names = ["Regular", "Undead?", "Flying?", "Magic?", 
                      "Strong", "Boss-tier", "High-Res", "Boss/Immune"]
        type_name = type_names[type_val]
        
        notes = ""
        if resist_val == 0x1F:
            notes = "Max resistance"
        elif resist_val == 0:
            notes = "No resistance"
        
        output.append(f"| ${i:02X} | ${byte:02X} | {type_val} ({type_name}) | ${resist_val:02X} | {notes} |")
    
    output.append("")
    output.append("## Usage in Battle Code")
    output.append("")
    output.append("The table is used in several ways:")
    output.append("")
    output.append("1. **Hit Check ($9135)**")
    output.append("   - Uses bits 4-0 as hit threshold modifier")
    output.append("")
    output.append("2. **Damage Reduction ($AB59)**")
    output.append("   - `LDA $B967,Y; AND #$1F` extracts resistance")
    output.append("   - Compared against $75DC (special flag)")
    output.append("")
    output.append("3. **Action Validation ($A599)**")
    output.append("   - `LDA $B967,Y; AND #$1F` checks resistance")
    output.append("   - Used to determine if action affects target")
    output.append("")
    
    # Write output
    output_path = os.path.join(DOCS_DIR, "enemy_data_table.md")
    with open(output_path, "w", encoding="utf-8") as f:
        f.write("\n".join(output))
    
    print(f"Enemy data table extracted to: {output_path}")

if __name__ == "__main__":
    main()
