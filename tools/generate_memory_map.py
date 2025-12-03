#!/usr/bin/env python3
"""
Dragon Warrior 4 NES - Memory Map Generator

Generates a comprehensive memory map of the $6000-$61FF party data range
based on code analysis.
"""

import os
from collections import defaultdict
import json

def load_rom(rom_path):
    """Load the ROM file."""
    with open(rom_path, 'rb') as f:
        data = f.read()
    return data

# Opcodes that access memory with absolute addressing
ABS_READ = {
    0xAD: 'LDA', 0xAE: 'LDX', 0xAC: 'LDY',  # Load
    0x6D: 'ADC', 0xED: 'SBC',  # Arithmetic
    0x2D: 'AND', 0x0D: 'ORA', 0x4D: 'EOR',  # Logic
    0xCD: 'CMP', 0xEC: 'CPX', 0xCC: 'CPY',  # Compare
    0x2C: 'BIT',  # Test
}

ABS_WRITE = {
    0x8D: 'STA', 0x8E: 'STX', 0x8C: 'STY',  # Store
}

ABS_RMW = {
    0xEE: 'INC', 0xCE: 'DEC',  # Inc/Dec
    0x0E: 'ASL', 0x4E: 'LSR', 0x2E: 'ROL', 0x6E: 'ROR',  # Shift
}

# Indexed versions
ABSX_READ = {
    0xBD: 'LDA', 0xBC: 'LDY',  # Load
    0x7D: 'ADC', 0xFD: 'SBC',  # Arithmetic
    0x3D: 'AND', 0x1D: 'ORA', 0x5D: 'EOR',  # Logic
    0xDD: 'CMP',  # Compare
}

ABSX_WRITE = {0x9D: 'STA'}
ABSX_RMW = {0xFE: 'INC', 0xDE: 'DEC', 0x1E: 'ASL', 0x5E: 'LSR', 0x3E: 'ROL', 0x7E: 'ROR'}

ABSY_READ = {
    0xB9: 'LDA', 0xBE: 'LDX',  # Load
    0x79: 'ADC', 0xF9: 'SBC',  # Arithmetic
    0x39: 'AND', 0x19: 'ORA', 0x59: 'EOR',  # Logic
    0xD9: 'CMP',  # Compare
}

ABSY_WRITE = {0x99: 'STA'}

def analyze_memory_access(rom_data):
    """Analyze all memory accesses to $6000-$61FF."""

    results = defaultdict(lambda: {
        'reads': [],
        'writes': [],
        'rmw': [],  # read-modify-write
        'indexed_base': False,
        'banks': set()
    })

    rom_size = len(rom_data)
    total_banks = rom_size // 0x4000

    for i in range(len(rom_data) - 2):
        opcode = rom_data[i]
        lo = rom_data[i + 1]
        hi = rom_data[i + 2]
        addr = (hi << 8) | lo

        if hi not in [0x60, 0x61]:
            continue

        bank = i // 0x4000
        cpu_addr = 0x8000 + (i % 0x4000)
        if bank == total_banks - 1:
            cpu_addr = 0xC000 + (i % 0x4000)

        access_info = {
            'bank': bank,
            'cpu_addr': cpu_addr,
            'opcode': opcode
        }

        results[addr]['banks'].add(bank)

        # Check access type
        if opcode in ABS_READ:
            results[addr]['reads'].append(access_info)
        elif opcode in ABS_WRITE:
            results[addr]['writes'].append(access_info)
        elif opcode in ABS_RMW:
            results[addr]['rmw'].append(access_info)
        elif opcode in ABSX_READ or opcode in ABSY_READ:
            results[addr]['reads'].append(access_info)
            results[addr]['indexed_base'] = True
        elif opcode in ABSX_WRITE or opcode in ABSY_WRITE:
            results[addr]['writes'].append(access_info)
            results[addr]['indexed_base'] = True
        elif opcode in ABSX_RMW:
            results[addr]['rmw'].append(access_info)
            results[addr]['indexed_base'] = True

    return results

def infer_purpose(addr, access_info):
    """Try to infer the purpose of a memory address based on access patterns."""

    reads = len(access_info['reads'])
    writes = len(access_info['writes'])
    rmw = len(access_info['rmw'])
    indexed = access_info['indexed_base']

    lo = addr & 0xFF
    hi = addr >> 8

    # Known addresses from analysis
    known = {
        0x615A: "Current Battle Actor Index",
        0x615B: "Tactics Setting",
        0x618E: "Battle State Flags",
        0x616A: "Battle Action Data (indexed)",
        0x6018: "Unknown Status/Counter",
        0x6038: "Unknown Flag/Counter",
        0x6195: "Battle Counter 1",
        0x6196: "Battle Counter 2",
        0x6197: "Battle Limit X",
        0x6198: "Battle Limit Y",
        0x619B: "Battle Flags",
        0x61B1: "Battle Turn Counter?",
    }

    if addr in known:
        return known[addr]

    # Inference based on patterns
    if indexed and hi == 0x60:
        # $60xx indexed = likely party member data structure
        if lo < 0x40:
            offset = lo % 0x40  # Assuming 64-byte structure
            if offset == 0x00: return "Party Member - Current HP Low (indexed)"
            if offset == 0x01: return "Party Member - Current HP High (indexed)"
            if offset == 0x02: return "Party Member - Current MP Low (indexed)"
            if offset == 0x03: return "Party Member - Current MP High (indexed)"
            if offset == 0x04: return "Party Member - Max HP Low (indexed)"
            if offset == 0x05: return "Party Member - Max HP High (indexed)"
            if offset == 0x08: return "Party Member - Level (indexed)"
            if offset == 0x09: return "Party Member - Strength (indexed)"
            if offset == 0x0A: return "Party Member - Agility (indexed)"
            if offset == 0x0B: return "Party Member - Vitality (indexed)"
            if offset == 0x0C: return "Party Member - Intelligence (indexed)"
            if offset == 0x0D: return "Party Member - Luck (indexed)"
            if offset == 0x18: return "Party Member - Status 1 (indexed)"
            if offset == 0x1A: return "Party Member - Experience Low (indexed)"
            if offset == 0x1B: return "Party Member - Experience Mid (indexed)"
            if offset == 0x1C: return "Party Member - Experience High (indexed)"

    # General inference
    if rmw > 0 and reads == 0 and writes == 0:
        return "Counter/Flag (RMW only)"
    elif writes > reads * 2:
        return "Output/Store Variable"
    elif reads > writes * 2:
        return "Input/Read Variable"
    elif indexed:
        return "Indexed Data Table"

    return "Unknown"

def generate_memory_map(results):
    """Generate a formatted memory map."""

    map_data = []

    for addr in sorted(results.keys()):
        info = results[addr]

        purpose = infer_purpose(addr, info)

        map_data.append({
            'address': addr,
            'purpose': purpose,
            'read_count': len(info['reads']),
            'write_count': len(info['writes']),
            'rmw_count': len(info['rmw']),
            'indexed': info['indexed_base'],
            'banks': sorted(info['banks']),
            'total_access': len(info['reads']) + len(info['writes']) + len(info['rmw'])
        })

    return map_data

def main():
    rom_path = os.path.join(os.path.dirname(__file__), '..', 'roms',
                            'Dragon Warrior IV (1992-10)(Enix)(US).nes')

    print("Loading ROM...")
    rom_data = load_rom(rom_path)

    # Skip iNES header
    rom_data = rom_data[0x10:]

    print("Analyzing memory access patterns...")
    access_data = analyze_memory_access(rom_data)

    print("Generating memory map...")
    memory_map = generate_memory_map(access_data)

    # Sort by total access count
    memory_map.sort(key=lambda x: x['total_access'], reverse=True)

    print("\n" + "="*80)
    print("DRAGON WARRIOR 4 - PARTY DATA MEMORY MAP ($6000-$61FF)")
    print("="*80)

    print("\n--- TOP 40 MOST ACCESSED ADDRESSES ---\n")
    print(f"{'Address':<8} {'Total':<6} {'R':>3} {'W':>3} {'RMW':>4} {'Idx':<4} Purpose")
    print("-"*80)

    for item in memory_map[:40]:
        idx = "Y" if item['indexed'] else ""
        print(f"${item['address']:04X}    {item['total_access']:<6} {item['read_count']:>3} {item['write_count']:>3} {item['rmw_count']:>4} {idx:<4} {item['purpose']}")

    # Group by purpose type
    print("\n--- ADDRESSES BY CATEGORY ---\n")

    categories = defaultdict(list)
    for item in memory_map:
        categories[item['purpose']].append(item)

    for category, items in sorted(categories.items(), key=lambda x: len(x[1]), reverse=True):
        if len(items) >= 2:
            addrs = [f"${x['address']:04X}" for x in items[:8]]
            more = f" (+{len(items)-8})" if len(items) > 8 else ""
            print(f"{category}:")
            print(f"  {', '.join(addrs)}{more}")

    # Save JSON output
    json_path = os.path.join(os.path.dirname(__file__), '..', 'data', 'json', 'memory_map.json')
    os.makedirs(os.path.dirname(json_path), exist_ok=True)

    json_output = {
        'description': 'Dragon Warrior 4 NES - Party Data Memory Map',
        'range': '$6000-$61FF',
        'total_addresses': len(memory_map),
        'addresses': memory_map
    }

    with open(json_path, 'w') as f:
        json.dump(json_output, f, indent=2)

    print(f"\nJSON output saved to: {json_path}")

    # Save markdown documentation
    md_path = os.path.join(os.path.dirname(__file__), '..', 'docs', 'memory_map.md')
    os.makedirs(os.path.dirname(md_path), exist_ok=True)

    with open(md_path, 'w', encoding='utf-8') as f:
        f.write("# Dragon Warrior 4 (NES) - Memory Map\n\n")
        f.write("## Party Data Range: $6000-$61FF\n\n")

        f.write("### Overview\n\n")
        f.write(f"- Total addresses accessed: {len(memory_map)}\n")
        f.write(f"- Total access operations: {sum(x['total_access'] for x in memory_map)}\n")
        f.write(f"- Indexed (array) accesses: {sum(1 for x in memory_map if x['indexed'])}\n\n")

        f.write("### Key Addresses\n\n")
        f.write("| Address | Purpose | Reads | Writes | RMW | Indexed |\n")
        f.write("|---------|---------|-------|--------|-----|--------|\n")

        for item in memory_map[:50]:
            idx = "✓" if item['indexed'] else ""
            f.write(f"| ${item['address']:04X} | {item['purpose']} | {item['read_count']} | {item['write_count']} | {item['rmw_count']} | {idx} |\n")

        f.write("\n### Battle System Addresses ($615A-$61FF)\n\n")
        f.write("These addresses are primarily used during battle:\n\n")

        battle_addrs = [x for x in memory_map if x['address'] >= 0x6150]
        for item in sorted(battle_addrs, key=lambda x: x['address'])[:20]:
            f.write(f"- **${item['address']:04X}**: {item['purpose']}\n")

        f.write("\n### Character Data Structure (Speculation)\n\n")
        f.write("Based on indexed access patterns, character data may use $40 (64) byte blocks:\n\n")
        f.write("| Offset | Purpose (Inferred) |\n")
        f.write("|--------|--------------------|\n")
        f.write("| +$00-$01 | Current HP |\n")
        f.write("| +$02-$03 | Current MP |\n")
        f.write("| +$04-$05 | Max HP |\n")
        f.write("| +$06-$07 | Max MP |\n")
        f.write("| +$08 | Level |\n")
        f.write("| +$09 | Strength |\n")
        f.write("| +$0A | Agility |\n")
        f.write("| +$0B | Vitality |\n")
        f.write("| +$0C | Intelligence |\n")
        f.write("| +$0D | Luck |\n")
        f.write("| +$18 | Status flags |\n")
        f.write("| +$1A-$1C | Experience (3 bytes) |\n")

    print(f"Documentation saved to: {md_path}")

    # Generate MLB labels for known addresses
    mlb_additions = []

    for item in memory_map:
        if item['total_access'] >= 5:  # Only label frequently accessed
            purpose = item['purpose'].replace(' ', '_').replace('(', '').replace(')', '')
            purpose = purpose.replace('?', '').replace('/', '_')
            mlb_additions.append(f"R:{item['address']:04X}:{purpose}")

    mlb_path = os.path.join(os.path.dirname(__file__), '..', 'data', 'memory_labels.txt')
    with open(mlb_path, 'w') as f:
        f.write("; Dragon Warrior 4 - Memory Labels\n")
        f.write("; Generated from code analysis\n\n")
        for label in mlb_additions:
            f.write(label + "\n")

    print(f"MLB labels saved to: {mlb_path}")

if __name__ == '__main__':
    main()
