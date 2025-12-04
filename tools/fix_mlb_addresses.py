#!/usr/bin/env python3
"""
Fix MLB address types and convert CPU addresses to physical ROM addresses.

Address Types in Mesen MLB format:
- P: PRG-ROM physical address (0-$7FFFF for 512KB ROM)
- G: Global/WRAM address ($6000-$7FFF)
- R: Runtime/CPU address (for registers, stack, fixed bank code)

Issues to fix:
1. Zero page ($00xx) should use R: not P: → ALREADY FIXED
2. PPU/IO registers ($2xxx, $4xxx) should use R: not P:
3. Mapper registers ($9FFF, $BFFF, $DFFF, $FFFF) should use R: not P:
4. Switchable bank code using P:$xxxx where $xxxx is $8000-$BFFF needs conversion to physical

For switchable banks (labels with bXX_ prefix like b21_):
- Extract bank number from label name
- Convert CPU address ($8000-$BFFF) to physical ROM address
- Physical = Bank * $4000 + (CPU_addr - $8000)
"""

import re
import sys

def get_bank_from_label(label):
    """Extract bank number from label like 'b21_foo' -> 21 (decimal)

    Bank numbers in labels are DECIMAL (b21_ = bank 21 decimal = $15 hex)
    """
    # Match patterns like b21_, b15_, b29_, etc.
    match = re.match(r'b([0-9]+)_', label, re.IGNORECASE)
    if match:
        try:
            return int(match.group(1), 10)  # Decimal, not hex!
        except ValueError:
            return None
    return None

def cpu_to_physical(cpu_addr, bank):
    """Convert CPU address ($8000-$BFFF) to physical ROM address"""
    if 0x8000 <= cpu_addr <= 0xBFFF:
        offset = cpu_addr - 0x8000
        return bank * 0x4000 + offset
    return cpu_addr

def fix_line(line):
    """Fix a single MLB line"""
    # Skip comments and empty lines
    if line.startswith('#') or not line.strip():
        return line

    # Parse format: TYPE:ADDR:LABEL:COMMENT or TYPE:ADDR:LABEL
    parts = line.split(':')
    if len(parts) < 3:
        return line

    type_code = parts[0]
    addr_str = parts[1]
    label = parts[2]
    comment = ':'.join(parts[3:]) if len(parts) > 3 else ''

    try:
        addr = int(addr_str, 16)
    except ValueError:
        return line

    # Rule 1: PPU registers ($2000-$2007) → R:
    if type_code == 'P' and 0x2000 <= addr <= 0x2007:
        return f"R:{addr_str}:{label}:{comment}" if comment else f"R:{addr_str}:{label}"

    # Rule 2: OAM DMA ($4014) → R:
    if type_code == 'P' and addr == 0x4014:
        return f"R:{addr_str}:{label}:{comment}" if comment else f"R:{addr_str}:{label}"

    # Rule 3: Mapper registers → R: (these are CPU addresses)
    if type_code == 'P' and addr in [0x9FFF, 0xBFFF, 0xDFFF, 0xFFFF]:
        return f"R:{addr_str}:{label}:{comment}" if comment else f"R:{addr_str}:{label}"

    # Rule 4: Switchable bank code at CPU $8000-$BFFF with bank label → convert to physical
    if type_code == 'P' and 0x8000 <= addr <= 0xBFFF:
        bank = get_bank_from_label(label)
        if bank is not None:
            phys_addr = cpu_to_physical(addr, bank)
            new_addr_str = f"{phys_addr:05X}"
            new_line = f"P:{new_addr_str}:{label}"
            if comment:
                new_line += f":{comment}"
            return new_line
        else:
            # No bank in label - could be fixed bank (15) or need R: for runtime address
            # For now, convert to R: since these are runtime CPU addresses
            return f"R:{addr_str}:{label}:{comment}" if comment else f"R:{addr_str}:{label}"

    return line

def main():
    if len(sys.argv) < 2:
        print("Usage: fix_mlb_addresses.py <input.mlb> [output.mlb]")
        sys.exit(1)

    input_file = sys.argv[1]
    output_file = sys.argv[2] if len(sys.argv) > 2 else input_file

    with open(input_file, 'r', encoding='utf-8') as f:
        lines = f.readlines()

    fixed_lines = []
    changes = {'ppu_to_r': 0, 'mapper_to_r': 0, 'bank_converted': 0, 'cpu_to_r': 0}

    for line in lines:
        original = line.rstrip()
        fixed = fix_line(original)

        # Track changes
        if fixed != original:
            if 'R:200' in fixed or 'R:2005' in fixed or 'R:2006' in fixed or 'R:2007' in fixed:
                changes['ppu_to_r'] += 1
            elif 'R:4014' in fixed:
                changes['ppu_to_r'] += 1
            elif 'R:9FFF' in fixed or 'R:BFFF' in fixed or 'R:DFFF' in fixed or 'R:FFFF' in fixed:
                changes['mapper_to_r'] += 1
            elif fixed.startswith('P:') and len(fixed.split(':')[1]) == 5:
                changes['bank_converted'] += 1
            elif fixed.startswith('R:'):
                changes['cpu_to_r'] += 1

        fixed_lines.append(fixed)

    with open(output_file, 'w', encoding='utf-8') as f:
        f.write('\n'.join(fixed_lines))

    print(f"Fixed addresses in {input_file}")
    print(f"  PPU/IO to R: {changes['ppu_to_r']}")
    print(f"  Mapper to R: {changes['mapper_to_r']}")
    print(f"  Banks converted to physical: {changes['bank_converted']}")
    print(f"  CPU ($8xxx-$Bxxx) to R: {changes['cpu_to_r']}")
    print(f"  Total changes: {sum(changes.values())}")

if __name__ == '__main__':
    main()
