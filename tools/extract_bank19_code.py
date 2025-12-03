#!/usr/bin/env python3
"""
Dragon Warrior 4 NES - Bank 19 Code Extractor

Extracts and disassembles key subroutines from Bank 19 (battle code).
"""

import os

def load_rom(rom_path):
    """Load the ROM file."""
    with open(rom_path, 'rb') as f:
        data = f.read()
    return data

# Full 6502 opcode table
OPCODES = {
    0x00: ('BRK', 1, 'imp'),
    0x01: ('ORA', 2, 'izx'),
    0x05: ('ORA', 2, 'zpg'),
    0x06: ('ASL', 2, 'zpg'),
    0x08: ('PHP', 1, 'imp'),
    0x09: ('ORA', 2, 'imm'),
    0x0A: ('ASL', 1, 'acc'),
    0x0D: ('ORA', 3, 'abs'),
    0x0E: ('ASL', 3, 'abs'),
    0x10: ('BPL', 2, 'rel'),
    0x11: ('ORA', 2, 'izy'),
    0x15: ('ORA', 2, 'zpx'),
    0x16: ('ASL', 2, 'zpx'),
    0x18: ('CLC', 1, 'imp'),
    0x19: ('ORA', 3, 'aby'),
    0x1D: ('ORA', 3, 'abx'),
    0x1E: ('ASL', 3, 'abx'),
    0x20: ('JSR', 3, 'abs'),
    0x21: ('AND', 2, 'izx'),
    0x24: ('BIT', 2, 'zpg'),
    0x25: ('AND', 2, 'zpg'),
    0x26: ('ROL', 2, 'zpg'),
    0x28: ('PLP', 1, 'imp'),
    0x29: ('AND', 2, 'imm'),
    0x2A: ('ROL', 1, 'acc'),
    0x2C: ('BIT', 3, 'abs'),
    0x2D: ('AND', 3, 'abs'),
    0x2E: ('ROL', 3, 'abs'),
    0x30: ('BMI', 2, 'rel'),
    0x31: ('AND', 2, 'izy'),
    0x35: ('AND', 2, 'zpx'),
    0x36: ('ROL', 2, 'zpx'),
    0x38: ('SEC', 1, 'imp'),
    0x39: ('AND', 3, 'aby'),
    0x3D: ('AND', 3, 'abx'),
    0x3E: ('ROL', 3, 'abx'),
    0x40: ('RTI', 1, 'imp'),
    0x41: ('EOR', 2, 'izx'),
    0x45: ('EOR', 2, 'zpg'),
    0x46: ('LSR', 2, 'zpg'),
    0x48: ('PHA', 1, 'imp'),
    0x49: ('EOR', 2, 'imm'),
    0x4A: ('LSR', 1, 'acc'),
    0x4C: ('JMP', 3, 'abs'),
    0x4D: ('EOR', 3, 'abs'),
    0x4E: ('LSR', 3, 'abs'),
    0x50: ('BVC', 2, 'rel'),
    0x51: ('EOR', 2, 'izy'),
    0x55: ('EOR', 2, 'zpx'),
    0x56: ('LSR', 2, 'zpx'),
    0x58: ('CLI', 1, 'imp'),
    0x59: ('EOR', 3, 'aby'),
    0x5D: ('EOR', 3, 'abx'),
    0x5E: ('LSR', 3, 'abx'),
    0x60: ('RTS', 1, 'imp'),
    0x61: ('ADC', 2, 'izx'),
    0x65: ('ADC', 2, 'zpg'),
    0x66: ('ROR', 2, 'zpg'),
    0x68: ('PLA', 1, 'imp'),
    0x69: ('ADC', 2, 'imm'),
    0x6A: ('ROR', 1, 'acc'),
    0x6C: ('JMP', 3, 'ind'),
    0x6D: ('ADC', 3, 'abs'),
    0x6E: ('ROR', 3, 'abs'),
    0x70: ('BVS', 2, 'rel'),
    0x71: ('ADC', 2, 'izy'),
    0x75: ('ADC', 2, 'zpx'),
    0x76: ('ROR', 2, 'zpx'),
    0x78: ('SEI', 1, 'imp'),
    0x79: ('ADC', 3, 'aby'),
    0x7D: ('ADC', 3, 'abx'),
    0x7E: ('ROR', 3, 'abx'),
    0x81: ('STA', 2, 'izx'),
    0x84: ('STY', 2, 'zpg'),
    0x85: ('STA', 2, 'zpg'),
    0x86: ('STX', 2, 'zpg'),
    0x88: ('DEY', 1, 'imp'),
    0x8A: ('TXA', 1, 'imp'),
    0x8C: ('STY', 3, 'abs'),
    0x8D: ('STA', 3, 'abs'),
    0x8E: ('STX', 3, 'abs'),
    0x90: ('BCC', 2, 'rel'),
    0x91: ('STA', 2, 'izy'),
    0x94: ('STY', 2, 'zpx'),
    0x95: ('STA', 2, 'zpx'),
    0x96: ('STX', 2, 'zpy'),
    0x98: ('TYA', 1, 'imp'),
    0x99: ('STA', 3, 'aby'),
    0x9A: ('TXS', 1, 'imp'),
    0x9D: ('STA', 3, 'abx'),
    0xA0: ('LDY', 2, 'imm'),
    0xA1: ('LDA', 2, 'izx'),
    0xA2: ('LDX', 2, 'imm'),
    0xA4: ('LDY', 2, 'zpg'),
    0xA5: ('LDA', 2, 'zpg'),
    0xA6: ('LDX', 2, 'zpg'),
    0xA8: ('TAY', 1, 'imp'),
    0xA9: ('LDA', 2, 'imm'),
    0xAA: ('TAX', 1, 'imp'),
    0xAC: ('LDY', 3, 'abs'),
    0xAD: ('LDA', 3, 'abs'),
    0xAE: ('LDX', 3, 'abs'),
    0xB0: ('BCS', 2, 'rel'),
    0xB1: ('LDA', 2, 'izy'),
    0xB4: ('LDY', 2, 'zpx'),
    0xB5: ('LDA', 2, 'zpx'),
    0xB6: ('LDX', 2, 'zpy'),
    0xB8: ('CLV', 1, 'imp'),
    0xB9: ('LDA', 3, 'aby'),
    0xBA: ('TSX', 1, 'imp'),
    0xBC: ('LDY', 3, 'abx'),
    0xBD: ('LDA', 3, 'abx'),
    0xBE: ('LDX', 3, 'aby'),
    0xC0: ('CPY', 2, 'imm'),
    0xC1: ('CMP', 2, 'izx'),
    0xC4: ('CPY', 2, 'zpg'),
    0xC5: ('CMP', 2, 'zpg'),
    0xC6: ('DEC', 2, 'zpg'),
    0xC8: ('INY', 1, 'imp'),
    0xC9: ('CMP', 2, 'imm'),
    0xCA: ('DEX', 1, 'imp'),
    0xCC: ('CPY', 3, 'abs'),
    0xCD: ('CMP', 3, 'abs'),
    0xCE: ('DEC', 3, 'abs'),
    0xD0: ('BNE', 2, 'rel'),
    0xD1: ('CMP', 2, 'izy'),
    0xD5: ('CMP', 2, 'zpx'),
    0xD6: ('DEC', 2, 'zpx'),
    0xD8: ('CLD', 1, 'imp'),
    0xD9: ('CMP', 3, 'aby'),
    0xDD: ('CMP', 3, 'abx'),
    0xDE: ('DEC', 3, 'abx'),
    0xE0: ('CPX', 2, 'imm'),
    0xE1: ('SBC', 2, 'izx'),
    0xE4: ('CPX', 2, 'zpg'),
    0xE5: ('SBC', 2, 'zpg'),
    0xE6: ('INC', 2, 'zpg'),
    0xE8: ('INX', 1, 'imp'),
    0xE9: ('SBC', 2, 'imm'),
    0xEA: ('NOP', 1, 'imp'),
    0xEC: ('CPX', 3, 'abs'),
    0xED: ('SBC', 3, 'abs'),
    0xEE: ('INC', 3, 'abs'),
    0xF0: ('BEQ', 2, 'rel'),
    0xF1: ('SBC', 2, 'izy'),
    0xF5: ('SBC', 2, 'zpx'),
    0xF6: ('INC', 2, 'zpx'),
    0xF8: ('SED', 1, 'imp'),
    0xF9: ('SBC', 3, 'aby'),
    0xFD: ('SBC', 3, 'abx'),
    0xFE: ('INC', 3, 'abx'),
}

# Known labels
LABELS = {
    # Zero page
    0x0079: 'action_ptr_lo',
    0x007A: 'action_ptr_hi',
    0x007B: 'calculated_hit',
    0x0081: 'party_loop',
    0x0088: 'char_ptr_lo',
    0x0089: 'char_ptr_hi',
    0x008B: 'actor_index',
    0x0093: 'battle_flags',
    
    # Battle RAM
    0x615A: 'battle_actor',
    0x615B: 'tactics',
    0x618E: 'battle_state',
    0x6E80: 'action_type',
    
    # Bank 19 tables
    0xB80B: 'spell_effect_tbl',
    0xB915: 'spell_param_1',
    0xB949: 'spell_param_2',
    0xB967: 'enemy_resist_tbl',
    0xBA74: 'tactics_spell_1',
    0xBAA5: 'tactics_spell_2',
    0xBAD5: 'tactics_spell_3',
    0xBB06: 'tactics_mod_tbl',
    0xBB3F: 'spell_power_tbl',
    0xBB49: 'spell_attr_tbl',
    0xBB84: 'atk_mult_tbl',
    0xBB8B: 'stat_mult_tbl',
    0xBB92: 'hit_thresh_tbl',
    
    # Bank 19 subroutines
    0x8038: 'battle_entry',
    0x8051: 'init_vars',
    0x805B: 'dispatch_action',
    0x8088: 'read_tactics',
    0x8176: 'mul16',
    0x8187: 'div16',
    0x8330: 'mult_by_a',
    0x83C5: 'div_16_loop',
    0x8414: 'div_24_loop',
    0x845A: 'battle_calc',
    0x89B6: 'get_action_data',
    0x9110: 'finalize_action',
    0x9212: 'sum_party_stats',
    0xA54D: 'exec_action',
    0xAA67: 'damage_calc',
    0xAF10: 'attack_handler',
    0xAF48: 'spell_handler',
}

def disassemble(data, start_offset, end_offset, base_addr):
    """Disassemble a range of ROM data."""
    
    lines = []
    pos = start_offset
    
    while pos < end_offset:
        cpu_addr = base_addr + (pos - start_offset)
        
        # Check if this address has a label
        if cpu_addr in LABELS:
            lines.append(f"\n; {LABELS[cpu_addr]}")
            lines.append(f"{LABELS[cpu_addr]}:")
        
        opcode = data[pos]
        
        if opcode not in OPCODES:
            lines.append(f"${cpu_addr:04X}:  .byte ${opcode:02X}")
            pos += 1
            continue
        
        mnemonic, size, mode = OPCODES[opcode]
        
        if size > end_offset - pos:
            lines.append(f"${cpu_addr:04X}:  .byte ${opcode:02X}")
            pos += 1
            continue
        
        # Format the instruction
        bytes_hex = ' '.join(f'{data[pos+i]:02X}' for i in range(size))
        
        if size == 1:
            operand_str = ''
        elif size == 2:
            operand = data[pos + 1]
            if mode == 'imm':
                operand_str = f'#${operand:02X}'
            elif mode == 'rel':
                if operand > 127:
                    offset = operand - 256
                else:
                    offset = operand
                target = cpu_addr + 2 + offset
                if target in LABELS:
                    operand_str = LABELS[target]
                else:
                    operand_str = f'${target:04X}'
            elif mode == 'zpg':
                if operand in LABELS:
                    operand_str = LABELS[operand]
                else:
                    operand_str = f'${operand:02X}'
            elif mode == 'zpx':
                if operand in LABELS:
                    operand_str = f'{LABELS[operand]},X'
                else:
                    operand_str = f'${operand:02X},X'
            elif mode == 'zpy':
                if operand in LABELS:
                    operand_str = f'{LABELS[operand]},Y'
                else:
                    operand_str = f'${operand:02X},Y'
            elif mode == 'izx':
                operand_str = f'(${operand:02X},X)'
            elif mode == 'izy':
                operand_str = f'(${operand:02X}),Y'
            else:
                operand_str = f'${operand:02X}'
        elif size == 3:
            lo = data[pos + 1]
            hi = data[pos + 2]
            addr = (hi << 8) | lo
            
            if addr in LABELS:
                label = LABELS[addr]
            else:
                label = f'${addr:04X}'
            
            if mode == 'abs':
                operand_str = label
            elif mode == 'abx':
                operand_str = f'{label},X'
            elif mode == 'aby':
                operand_str = f'{label},Y'
            elif mode == 'ind':
                operand_str = f'({label})'
            else:
                operand_str = label
        else:
            operand_str = ''
        
        # Format line
        line = f"${cpu_addr:04X}:  {bytes_hex:<12}  {mnemonic} {operand_str}"
        lines.append(line)
        
        pos += size
    
    return lines

def extract_subroutine(data, bank_start, cpu_addr, name, max_len=200):
    """Extract a subroutine starting at cpu_addr."""
    
    # Calculate ROM offset
    rom_offset = bank_start + (cpu_addr - 0x8000)
    
    lines = []
    lines.append(f"; ============================================")
    lines.append(f"; {name}")
    lines.append(f"; CPU Address: ${cpu_addr:04X}")
    lines.append(f"; ROM Offset:  ${rom_offset:05X}")
    lines.append(f"; ============================================")
    lines.append("")
    
    # Disassemble until we hit RTS or max length
    end = min(rom_offset + max_len, bank_start + 0x4000)
    
    disasm = disassemble(data, rom_offset, end, cpu_addr)
    
    # Truncate at first RTS
    for i, line in enumerate(disasm):
        lines.append(line)
        if 'RTS' in line and i > 0:
            break
    
    return lines

def main():
    rom_path = os.path.join(os.path.dirname(__file__), '..', 'roms', 
                            'Dragon Warrior IV (1992-10)(Enix)(US).nes')
    
    print("Loading ROM...")
    rom_data = load_rom(rom_path)
    
    # Skip iNES header
    rom_data = rom_data[0x10:]
    
    # Bank 19 starts at offset $4C000 (19 * $4000)
    bank_19_start = 19 * 0x4000
    
    print("Extracting Bank 19 subroutines...\n")
    
    # Key subroutines to extract
    subroutines = [
        (0x8038, "battle_entry - Battle Entry Point"),
        (0x8088, "read_tactics - Read Tactics Setting"),
        (0x8176, "mul16 - 16-bit Multiply by 16"),
        (0x8187, "div16 - 16-bit Divide by 16"),
        (0x8330, "mult_by_a - Multiply by Accumulator"),
        (0x83C5, "div_16_loop - 16-bit Division"),
        (0x8414, "div_24_loop - 24-bit Division"),
        (0x9212, "sum_party_stats - Sum Party Member Stats"),
        (0x9276, "stat_table_lookup - Look Up Spell Effect"),
        (0xAA67, "damage_calc - Damage Calculation"),
        (0xAEA6, "get_spell_power - Get Spell Power"),
        (0xAEB4, "get_spell_attr - Get Spell Attribute"),
    ]
    
    output_lines = []
    output_lines.append("; Dragon Warrior 4 (NES) - Bank 19 Disassembly")
    output_lines.append("; Battle System Code")
    output_lines.append("; Auto-generated by extract_bank19_code.py")
    output_lines.append("")
    output_lines.append("; Bank 19 is loaded at $8000-$BFFF")
    output_lines.append("; ROM offset: $4C010 - $50010")
    output_lines.append("")
    
    for cpu_addr, name in subroutines:
        print(f"Extracting {name}...")
        lines = extract_subroutine(rom_data, bank_19_start, cpu_addr, name)
        output_lines.extend(lines)
        output_lines.append("")
        output_lines.append("")
    
    # Save to file
    output_path = os.path.join(os.path.dirname(__file__), '..', 'disasm', 'bank19_battle.asm')
    os.makedirs(os.path.dirname(output_path), exist_ok=True)
    
    with open(output_path, 'w') as f:
        f.write('\n'.join(output_lines))
    
    print(f"\nDisassembly saved to: {output_path}")
    
    # Also print a sample
    print("\n" + "="*60)
    print("SAMPLE: sum_party_stats")
    print("="*60)
    
    sample_lines = extract_subroutine(rom_data, bank_19_start, 0x9212, "sum_party_stats", 150)
    for line in sample_lines:
        print(line)

if __name__ == '__main__':
    main()
