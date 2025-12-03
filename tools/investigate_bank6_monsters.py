#!/usr/bin/env python3
"""
Investigate Bank 6 for monster data tables.

Metal Slime pattern found at Bank 6 $BB49 (ROM $1BB59)
Context shows repeating patterns that look like monster records.
"""

import os
from pathlib import Path

SCRIPT_DIR = Path(__file__).parent
ROM_PATH = SCRIPT_DIR.parent / "roms" / "Dragon Warrior IV (1992-10)(Enix)(US).nes"
OUTPUT_DIR = SCRIPT_DIR.parent / "data"

BANK = 6
HEADER_SIZE = 16
BANK_SIZE = 0x4000


def analyze_area(rom, start_cpu, count=30, record_size=27):
    """Analyze an area as monster data."""
    # Convert CPU address to ROM offset
    bank_offset = start_cpu - 0x8000
    rom_offset = HEADER_SIZE + BANK * BANK_SIZE + bank_offset
    
    print(f"Analyzing Bank {BANK} ${start_cpu:04X} (ROM ${rom_offset:05X})")
    print(f"Record size: {record_size} bytes")
    print("=" * 80)
    
    records = []
    for i in range(count):
        offset = rom_offset + i * record_size
        if offset + record_size > len(rom):
            break
        
        data = rom[offset:offset + record_size]
        records.append(data)
        
        # Display the record
        cpu = start_cpu + i * record_size
        hex_str = ' '.join(f'{b:02X}' for b in data)
        print(f"Monster #{i:3d} ${cpu:04X}: {hex_str}")
    
    return records


def try_different_offsets(rom, base_cpu):
    """Try different record sizes and starting offsets."""
    print("\nTrying different record size interpretations:")
    print("-" * 80)
    
    # The context from the search showed:
    # 88 2E 01 07 07 40 E0 40 40 E0 40 0A 2F 09 88 28 09 00 31 04 10 11 88 28 11 3F 52 04 08 04
    # The $11 $3F appears at offset 24 in this sequence
    
    # Try to find where records start
    # If byte 22-23 are $11 $3F, then byte 0 is 24 bytes before
    
    bank_offset = base_cpu - 0x8000
    rom_offset = HEADER_SIZE + BANK * BANK_SIZE + bank_offset
    
    # Look backwards from the $11 $3F to find the start of this monster record
    # If bytes 22-23 are $11 $3F, record starts at offset-22
    potential_start_offset = rom_offset - 22
    potential_start_cpu = base_cpu - 22
    
    print(f"\nIf $11 $3F is at bytes 22-23, monster record starts at ${potential_start_cpu:04X}")
    
    # Read one record
    data = rom[potential_start_offset:potential_start_offset + 27]
    hex_str = ' '.join(f'{b:02X}' for b in data)
    print(f"Record: {hex_str}")
    
    # Try to interpret as monster data
    exp = data[0] | (data[1] << 8)
    gold = data[2] | (data[3] << 8)
    hp = data[4] | (data[5] << 8)
    attack = data[6]
    defense = data[7]
    agility = data[8]
    
    print(f"\nIf standard monster format:")
    print(f"  EXP: {exp}, Gold: {gold}, HP: {hp}")
    print(f"  Attack: {attack}, Defense: {defense}, Agility: {agility}")
    print(f"  Byte 22 (metal?): ${data[22]:02X}, Byte 23: ${data[23]:02X}")
    print(f"  Byte 24 (status): ${data[24]:02X}")
    
    # Let's look at the broader area
    print("\n\nBroader area analysis:")
    print("-" * 80)
    
    # Go back further to find the table start
    scan_start = rom_offset - 200
    
    # Look for the pattern of $88 bytes which seem to appear in the data
    print("Looking for patterns...")
    
    for offset in range(scan_start, rom_offset, 27):
        data = rom[offset:offset + 27]
        cpu = 0x8000 + (offset - HEADER_SIZE - BANK * BANK_SIZE)
        
        # Check if byte 22 and 23 look like monster flags
        byte_22 = data[22] if len(data) > 22 else 0
        byte_23 = data[23] if len(data) > 23 else 0
        
        if byte_22 in [0x00, 0x10, 0x11, 0x20]:  # Possible metal flags
            hex_str = ' '.join(f'{b:02X}' for b in data)
            print(f"${cpu:04X}: {hex_str}")


def scan_for_monster_table_start(rom):
    """Scan Bank 6 for the start of the monster table."""
    print("\n\nScanning Bank 6 for monster table start:")
    print("=" * 80)
    
    bank_start = HEADER_SIZE + BANK * BANK_SIZE
    bank_end = bank_start + BANK_SIZE
    
    # Look for sequences where every 27 bytes we have consistent patterns
    # Metal enemies should have $11 at byte 22
    
    # Known: Metal Slime at $BB49 has $11 at that position
    # If record is 27 bytes and $11 is byte 22, record starts at $BB49 - 22 = $BB33
    
    test_starts = [
        0xBB33,  # Based on Metal Slime $11 position
        0xBB00,
        0xBA00,
        0xB900,
        0xB800,
    ]
    
    for start_cpu in test_starts:
        bank_offset = start_cpu - 0x8000
        rom_offset = HEADER_SIZE + BANK * BANK_SIZE + bank_offset
        
        if rom_offset < bank_start or rom_offset >= bank_end:
            continue
        
        print(f"\nTesting table start at ${start_cpu:04X}:")
        
        # Count how many valid-looking records
        valid = 0
        metal_found = False
        
        for i in range(50):  # Check 50 potential records
            offset = rom_offset + i * 27
            if offset + 27 > bank_end:
                break
            
            data = rom[offset:offset + 27]
            byte_22 = data[22]
            
            # Check for metal flag
            if byte_22 & 0x03 == 0x11 & 0x03:  # Lower 2 bits
                metal_found = True
            
            # Check if values look reasonable
            hp = data[4] | (data[5] << 8)
            if 1 <= hp <= 2000:
                valid += 1
        
        print(f"  Valid-looking records: {valid}/50, Metal enemy found: {metal_found}")


def dump_potential_table(rom, start_cpu, count=50):
    """Dump what looks like the monster table."""
    print(f"\n\nDumping potential monster table from Bank 6 ${start_cpu:04X}:")
    print("=" * 80)
    
    bank_offset = start_cpu - 0x8000
    rom_offset = HEADER_SIZE + BANK * BANK_SIZE + bank_offset
    
    output_lines = []
    output_lines.append("Dragon Warrior IV - Potential Monster Data Table")
    output_lines.append(f"Bank 6, starting at ${start_cpu:04X}")
    output_lines.append("=" * 80)
    output_lines.append("")
    output_lines.append("Format: [EXP][GOLD][HP][ATK][DEF][AGI][...][B22 Metal][B23 Drop][B24 Status]")
    output_lines.append("")
    
    for i in range(count):
        offset = rom_offset + i * 27
        if offset + 27 > len(rom):
            break
        
        data = rom[offset:offset + 27]
        cpu = start_cpu + i * 27
        
        # Parse fields
        exp = data[0] | (data[1] << 8)
        gold = data[2] | (data[3] << 8)
        hp = data[4] | (data[5] << 8)
        attack = data[6]
        defense = data[7]
        agility = data[8]
        byte_22 = data[22]
        byte_23 = data[23]
        byte_24 = data[24]
        
        # Check metal flag
        metal = "METAL" if (byte_22 & 0x03) == 0x01 else ""
        
        # Check drop rate
        drop_rate = byte_23 & 0x07
        drop_str = ["0%", "1/2", "1/4", "1/8", "1/16", "1/32", "1/256", "100%"][drop_rate]
        
        hex_str = ' '.join(f'{b:02X}' for b in data)
        
        line = f"#{i:3d} ${cpu:04X}: HP={hp:4d} ATK={attack:3d} DEF={defense:3d} AGI={agility:3d} EXP={exp:5d} G={gold:4d} | B22=${byte_22:02X} B23=${byte_23:02X} B24=${byte_24:02X} | {drop_str:6s} {metal}"
        print(line)
        output_lines.append(line)
        
        # Also show hex
        output_lines.append(f"       {hex_str}")
    
    # Write to file
    OUTPUT_DIR.mkdir(exist_ok=True)
    output_file = OUTPUT_DIR / "bank6_monster_table.txt"
    with open(output_file, "w", encoding="utf-8") as f:
        f.write("\n".join(output_lines))
    
    print(f"\nData written to {output_file}")


def find_table_by_scanning(rom):
    """Scan for the exact table start by looking for $C8 markers."""
    print("\n\nScanning for table markers ($C8 pattern):")
    print("=" * 80)
    
    # Looking at the context data:
    # 88 2E 01 07 07 40 E0 40 40 E0 40 0A 2F 09 88 28 09 00 31 04 10 11 88 28 11 3F
    # The $88 and $C8 patterns seem significant - maybe markers or AI bytes
    
    bank_start = HEADER_SIZE + BANK * BANK_SIZE
    
    # The pattern shows $C8 at certain positions in monster data
    # From cowness.net, we know about AI behavior bytes and status bytes
    
    # Let's look for sequences of data that repeat every 27 bytes with similar structure
    best_start = None
    best_score = 0
    
    for test_offset in range(bank_start, bank_start + 0x3000, 1):
        score = 0
        for i in range(30):
            offset = test_offset + i * 27
            if offset + 27 > len(rom):
                break
            
            data = rom[offset:offset + 27]
            
            # Check HP is reasonable (1-2000)
            hp = data[4] | (data[5] << 8)
            if 1 <= hp <= 1500:
                score += 1
            
            # Check attack/defense/agility are reasonable (1-255)
            if 1 <= data[6] <= 200 and 1 <= data[7] <= 200:
                score += 1
        
        if score > best_score:
            best_score = score
            best_start = test_offset
    
    if best_start:
        cpu = 0x8000 + (best_start - bank_start)
        print(f"Best candidate: Bank 6 ${cpu:04X} (ROM ${best_start:05X}) with score {best_score}")
        return cpu
    
    return None


def main():
    if not ROM_PATH.exists():
        print(f"ERROR: ROM not found at {ROM_PATH}")
        return
    
    with open(ROM_PATH, "rb") as f:
        rom = f.read()
    
    print(f"ROM loaded: {len(rom)} bytes\n")
    
    # Metal Slime pattern found at $BB49
    # Try analyzing from there
    analyze_area(rom, 0xBB33, count=10, record_size=27)
    
    try_different_offsets(rom, 0xBB49)
    
    scan_for_monster_table_start(rom)
    
    # Find best table start
    best_start = find_table_by_scanning(rom)
    
    if best_start:
        # Look around to find a good starting point
        # Try adjusting to align with known patterns
        for adj in range(-27, 28, 1):
            test_start = best_start + adj
            dump_potential_table(rom, test_start, count=60)
            break  # Just dump first for now


if __name__ == "__main__":
    main()
