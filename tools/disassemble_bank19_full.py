#!/usr/bin/env python3
"""
Dragon Warrior 4 NES - Full Bank 19 Disassembly

Complete disassembly of Bank 19 (battle code) with automatic
label detection and commenting.
"""

import os
from collections import defaultdict

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

# Known labels with descriptions
LABELS = {
    # Zero page
    0x0000: ('tmp0', 'Temporary 0'),
    0x0001: ('tmp1', 'Temporary 1'),
    0x0002: ('tmp2', 'Temporary 2'),
    0x0003: ('tmp3', 'Temporary 3'),
    0x0010: ('ptr_lo', 'General pointer low'),
    0x0011: ('ptr_hi', 'General pointer high'),
    0x0016: ('mult_a', 'Multiplier A'),
    0x0017: ('mult_lo', 'Product low'),
    0x0018: ('mult_mid', 'Product mid'),
    0x0019: ('mult_hi', 'Product high'),
    0x001A: ('mult_ext', 'Product extended'),
    0x0079: ('action_ptr_lo', 'Action data pointer low'),
    0x007A: ('action_ptr_hi', 'Action data pointer high'),
    0x007B: ('calc_hit', 'Calculated hit value'),
    0x0081: ('party_loop', 'Party loop counter'),
    0x0082: ('inner_loop', 'Inner loop counter'),
    0x0086: ('stat_ptr_lo', 'Stat table pointer low'),
    0x0087: ('stat_ptr_hi', 'Stat table pointer high'),
    0x0088: ('char_ptr_lo', 'Character data pointer low'),
    0x0089: ('char_ptr_hi', 'Character data pointer high'),
    0x008A: ('char_count', 'Character count'),
    0x008B: ('actor_idx', 'Current actor index'),
    0x008C: ('action_param', 'Action parameter'),
    0x0093: ('btl_flags', 'Battle calculation flags'),
    0x0096: ('active_char', 'Active character index'),

    # Work RAM
    0x0500: ('vblank_flag', 'VBlank sync flag'),
    0x0507: ('current_bank', 'Current PRG bank'),

    # Party Data
    0x6000: ('party_hp_lo', 'Hero HP low'),
    0x6001: ('party_hp_hi', 'Hero HP high'),
    0x6002: ('party_mp_lo', 'Hero MP low'),
    0x6003: ('party_mp_hi', 'Hero MP high'),
    0x6008: ('party_level', 'Hero level'),
    0x6009: ('party_str', 'Hero strength'),
    0x600A: ('party_agi', 'Hero agility'),
    0x601A: ('party_exp_lo', 'Hero EXP low'),
    0x601B: ('party_exp_mid', 'Hero EXP mid'),
    0x601C: ('party_exp_hi', 'Hero EXP high'),
    0x615A: ('chapter', 'Current chapter/battle actor'),
    0x615B: ('tactics', 'Battle tactics setting'),
    0x6165: ('return_loc', 'Return spell location'),
    0x616A: ('btl_action', 'Battle action data'),
    0x618E: ('btl_state', 'Battle state flags'),
    0x6195: ('btl_ctr1', 'Battle counter 1'),
    0x6196: ('btl_ctr2', 'Battle counter 2'),
    0x6197: ('btl_limx', 'Battle limit X'),
    0x6198: ('btl_limy', 'Battle limit Y'),
    0x619B: ('btl_flags', 'Battle flags'),
    0x61B1: ('btl_turn', 'Battle turn counter'),

    # Battle RAM
    0x6E11: ('div_rem_lo', 'Division remainder low'),
    0x6E12: ('div_rem_mid', 'Division remainder mid'),
    0x6E13: ('div_rem_hi', 'Division remainder high'),
    0x6E14: ('div_div_lo', 'Division divisor low'),
    0x6E15: ('div_div_mid', 'Division divisor mid'),
    0x6E16: ('div_div_hi', 'Division divisor high'),
    0x6E44: ('btl_mode', 'Battle mode flag'),
    0x6E80: ('action_type', 'Current action type'),

    # Battle calc variables
    0x72F4: ('char_state', 'Character state array'),
    0x7004: ('char_flags', 'Character flags array'),
    0x75AD: ('btl_ad', 'Battle stat AD'),
    0x75D1: ('act_ptr', 'Action pointer'),
    0x75D2: ('act_type', 'Action type'),
    0x75D3: ('target', 'Target index'),
    0x75D4: ('damage_lo', 'Damage output low'),
    0x75D5: ('damage_hi', 'Damage output high'),
    0x75D9: ('actor', 'Acting character'),
    0x75DA: ('act_cat', 'Action category'),
    0x75DB: ('act_id', 'Action ID'),
    0x75E1: ('power_lo', 'Action power low'),
    0x75E2: ('power_hi', 'Action power high'),
    0x75E5: ('temp_e5', 'Temp E5'),
    0x75E8: ('spell_idx', 'Spell index'),
    0x75EC: ('rng_val', 'RNG value'),
    0x75ED: ('stat_sum_lo', 'Party stat sum low'),
    0x75EE: ('stat_sum_hi', 'Party stat sum high'),
    0x75EF: ('def_mod', 'Defense modifier'),
    0x75F0: ('btl_f0', 'Battle flag F0'),

    # Bank 19 Data Tables
    0xB74D: ('stat_tbl_1', 'Stat modifier table 1'),
    0xB803: ('unk_tbl_b803', 'Unknown table'),
    0xB80B: ('spell_eff_tbl', 'Spell effect type table'),
    0xB915: ('spell_p1_tbl', 'Spell param 1 table'),
    0xB949: ('spell_p2_tbl', 'Spell param 2 table'),
    0xB967: ('enemy_res_tbl', 'Enemy resistance table'),
    0xBA4E: ('ai_tbl_1', 'AI decision table 1'),
    0xBA6C: ('ai_tbl_2', 'AI table 2'),
    0xBA70: ('ai_tbl_3', 'AI table 3'),
    0xBA74: ('tact_sp_1', 'Tactics spell data 1'),
    0xBAA5: ('tact_sp_2', 'Tactics spell data 2'),
    0xBAD5: ('tact_sp_3', 'Tactics spell data 3'),
    0xBB06: ('tact_mod', 'Tactics modifier table'),
    0xBB22: ('sp_bonus', 'Spell bonus table'),
    0xBB3F: ('sp_power', 'Spell power table'),
    0xBB49: ('sp_attr', 'Spell attribute table'),
    0xBB84: ('atk_mult', 'Attack multiplier table'),
    0xBB8B: ('stat_mult', 'Stat multiplier table'),
    0xBB92: ('hit_thresh', 'Hit threshold table'),
    0xBB99: ('base_dmg', 'Base damage value'),

    # Bank 19 Subroutines
    0x8038: ('btl_entry', 'Battle entry point'),
    0x804A: ('btl_setup', 'Battle setup'),
    0x8051: ('init_vars', 'Initialize battle vars'),
    0x805B: ('dispatch', 'Dispatch action'),
    0x8074: ('act_nop', 'Action 0 - NOP'),
    0x8075: ('mode4_jmp', 'Mode 4 jump'),
    0x8078: ('act_table', 'Action jump table'),
    0x8088: ('rd_tactics', 'Read tactics'),
    0x80A1: ('chk_char', 'Check character state'),
    0x80FA: ('clr_btl', 'Clear battle vars'),
    0x8176: ('mul16', 'Multiply by 16'),
    0x8187: ('div16', 'Divide by 16'),
    0x8198: ('scale_stat', 'Scale stat value'),
    0x81A5: ('shift_ext', 'Extended shift'),
    0x8330: ('mult_a', 'Multiply by A'),
    0x8366: ('mult_pair', 'Multiply pair'),
    0x83AA: ('add_pairs', 'Add 16-bit pairs'),
    0x83C5: ('div16_lp', 'Division loop 16-bit'),
    0x83F4: ('div24_set', '24-bit div setup'),
    0x8414: ('div24_lp', '24-bit division loop'),
    0x8454: ('div_3byte', '3-byte division'),
    0x845A: ('btl_calc', 'Battle calculation'),
    0x8488: ('helper_8488', 'Unknown helper'),
    0x89B6: ('get_act', 'Get action data'),
    0x89F5: ('get_act_2', 'Get secondary action'),
    0x8A05: ('calc_tgt', 'Calculate target'),
    0x8D77: ('setup_ptr', 'Setup char pointer'),
    0x9110: ('finalize', 'Finalize action'),
    0x9135: ('chk_hit', 'Check hit/miss'),
    0x919A: ('hit_6', 'Hit check type 6'),
    0x91A0: ('clr_dmg', 'Clear damage vars'),
    0x91A9: ('act_codes', 'Action code table'),
    0x91CD: ('act_jmptbl', 'Action handlers table'),
    0x9201: ('get_ene_idx', 'Get enemy index'),
    0x9212: ('sum_stats', 'Sum party stats'),
    0x921C: ('party_lp', 'Party stat loop'),
    0x925F: ('add_stat', 'Add stat pair'),
    0x9276: ('stat_lookup', 'Stat table lookup'),
    0x9365: ('get_tact_1', 'Get tactics spell 1'),
    0x937A: ('get_tact_2', 'Get tactics spell 2'),
    0x938B: ('calc_tact', 'Calc tactics index'),
    0x939A: ('get_tact_3', 'Get tactics spell 3'),
    0x9584: ('setup_act', 'Setup action'),
    0xA54D: ('exec_step', 'Execute action step'),
    0xA58D: ('valid_act', 'Validate action'),
    0xA5AA: ('find_tgt', 'Find valid target'),
    0xA5FC: ('chk_exec', 'Check if can execute'),
    0xA61A: ('calc_off', 'Calculate offset'),
    0xA624: ('act_ptr_tbl', 'Action pointer table'),
    0xA6C6: ('st_setup1', 'State setup 1'),
    0xA6CA: ('st_setup2', 'State setup 2'),
    0xA6CE: ('st_setup3', 'State setup 3'),
    0xA6D2: ('st_clean', 'State cleanup'),
    0xAA54: ('store_act', 'Store action type'),
    0xAA67: ('dmg_calc', 'Damage calculation'),
    0xAA9F: ('apply_def', 'Apply defense'),
    0xAB59: ('chk_resist', 'Check resistance'),
    0xAEA6: ('get_sp_pwr', 'Get spell power'),
    0xAEAF: ('shift_8c', 'Shift $8C:$8B'),
    0xAEB4: ('get_sp_atr', 'Get spell attribute'),
    0xAEC0: ('cap_sp_idx', 'Cap spell index'),
    0xAF10: ('atk_handler', 'Attack handler'),
    0xAF48: ('spell_hand', 'Spell handler'),
    0xAF97: ('item_hand', 'Item handler'),
    0xAFF0: ('act_ff0', 'Handler at AFF0'),
    0xB049: ('def_hand', 'Defense handler'),
    0xB066: ('chk_ch4', 'Check chapter 4'),
    0xB08C: ('chk_party', 'Check party status'),
    0xB0B4: ('bit_rot', 'Bit rotation'),
    0xB0E0: ('spec_enemy', 'Special enemy check'),
    0xB132: ('find_char', 'Find valid character'),

    # Fixed bank references
    0xC000: ('fixed_bank', 'Fixed bank start'),
    0xFFFA: ('vec_nmi', 'NMI vector'),
    0xFFFC: ('vec_reset', 'RESET vector'),
    0xFFFE: ('vec_irq', 'IRQ vector'),
}

def find_jsr_targets(data, bank_start, bank_end):
    """Find all JSR targets in a bank."""

    targets = set()

    for i in range(bank_start, bank_end - 2):
        if data[i] == 0x20:  # JSR
            lo = data[i + 1]
            hi = data[i + 2]
            target = (hi << 8) | lo
            if 0x8000 <= target <= 0xBFFF or 0xC000 <= target <= 0xFFFF:
                targets.add(target)

    return targets

def is_data_region(data, offset, length=16):
    """Check if a region looks more like data than code."""

    valid_opcodes = 0
    for i in range(length):
        if offset + i >= len(data):
            break
        if data[offset + i] in OPCODES:
            valid_opcodes += 1

    return valid_opcodes < length * 0.5

def disassemble_bank(data, bank_num, jsr_targets):
    """Disassemble an entire bank."""

    bank_start = bank_num * 0x4000
    base_addr = 0x8000

    lines = []
    lines.append(f"; Dragon Warrior 4 (NES) - Bank {bank_num} Complete Disassembly")
    lines.append("; Battle System Code")
    lines.append("")
    lines.append(f"; Bank loaded at ${base_addr:04X}-${base_addr+0x3FFF:04X}")
    lines.append(f"; ROM offset: ${bank_start:05X} - ${bank_start+0x3FFF:05X}")
    lines.append("")
    lines.append("; Auto-generated with labels and comments")
    lines.append("")
    lines.append("; " + "="*70)
    lines.append("; DISASSEMBLY")
    lines.append("; " + "="*70)
    lines.append("")

    pos = bank_start
    last_was_rts = False
    in_data_region = False

    while pos < bank_start + 0x4000:
        cpu_addr = base_addr + (pos - bank_start)

        # Check for known label
        if cpu_addr in LABELS:
            label, desc = LABELS[cpu_addr]
            if last_was_rts or pos == bank_start:
                lines.append("")
                lines.append("; " + "-"*50)
                lines.append(f"; {desc}")
                lines.append("; " + "-"*50)
            lines.append(f"{label}:                     ; ${cpu_addr:04X}")
        elif cpu_addr in jsr_targets:
            if last_was_rts:
                lines.append("")
                lines.append("; " + "-"*30)
            lines.append(f"sub_{cpu_addr:04X}:")

        opcode = data[pos]

        # Check if valid opcode
        if opcode not in OPCODES:
            # Try to detect data regions
            if not in_data_region:
                lines.append(f"                              ; Data region")
                in_data_region = True

            # Output as bytes
            byte_line = []
            while pos < bank_start + 0x4000:
                if data[pos] in OPCODES and not is_data_region(data, pos, 8):
                    break
                byte_line.append(f"${data[pos]:02X}")
                pos += 1
                if len(byte_line) >= 16:
                    break

            lines.append(f"        .byte {', '.join(byte_line)}")
            continue

        in_data_region = False
        mnemonic, size, mode = OPCODES[opcode]

        # Safety check
        if pos + size > bank_start + 0x4000:
            lines.append(f"        .byte ${opcode:02X}")
            pos += 1
            continue

        # Format bytes
        bytes_str = ' '.join(f'{data[pos+i]:02X}' for i in range(size))

        # Format operand
        comment = ''
        if size == 1:
            operand = ''
        elif size == 2:
            op_byte = data[pos + 1]
            if mode == 'imm':
                operand = f'#${op_byte:02X}'
            elif mode == 'rel':
                offset = op_byte if op_byte < 128 else op_byte - 256
                target = cpu_addr + 2 + offset
                if target in LABELS:
                    operand = LABELS[target][0]
                    comment = f'; -> {LABELS[target][1]}'
                else:
                    operand = f'${target:04X}'
            elif mode == 'zpg':
                if op_byte in LABELS:
                    operand = LABELS[op_byte][0]
                    comment = f'; {LABELS[op_byte][1]}'
                else:
                    operand = f'${op_byte:02X}'
            elif mode == 'zpx':
                operand = f'${op_byte:02X},X'
            elif mode == 'zpy':
                operand = f'${op_byte:02X},Y'
            elif mode == 'izx':
                operand = f'(${op_byte:02X},X)'
            elif mode == 'izy':
                if op_byte in LABELS:
                    operand = f'({LABELS[op_byte][0]}),Y'
                    comment = f'; {LABELS[op_byte][1]}'
                else:
                    operand = f'(${op_byte:02X}),Y'
            else:
                operand = f'${op_byte:02X}'
        elif size == 3:
            lo = data[pos + 1]
            hi = data[pos + 2]
            addr = (hi << 8) | lo

            if addr in LABELS:
                label_name = LABELS[addr][0]
                comment = f'; {LABELS[addr][1]}'
            else:
                label_name = f'${addr:04X}'

            if mode == 'abs':
                operand = label_name
            elif mode == 'abx':
                operand = f'{label_name},X'
            elif mode == 'aby':
                operand = f'{label_name},Y'
            elif mode == 'ind':
                operand = f'({label_name})'
            else:
                operand = label_name
        else:
            operand = ''

        # Build instruction line
        instr = f'{mnemonic} {operand}'.ljust(20)
        addr_str = f'${cpu_addr:04X}:'
        bytes_part = bytes_str.ljust(12)

        if comment:
            line = f"{addr_str}  {bytes_part}  {instr}{comment}"
        else:
            line = f"{addr_str}  {bytes_part}  {instr}"

        lines.append(line)

        last_was_rts = mnemonic in ['RTS', 'RTI', 'JMP']
        pos += size

    return lines

def main():
    rom_path = os.path.join(os.path.dirname(__file__), '..', 'roms',
                            'Dragon Warrior IV (1992-10)(Enix)(US).nes')

    print("Loading ROM...")
    rom_data = load_rom(rom_path)
    rom_data = rom_data[0x10:]  # Skip header

    bank_19_start = 19 * 0x4000
    bank_19_end = 20 * 0x4000

    print("Finding JSR targets...")
    jsr_targets = find_jsr_targets(rom_data, bank_19_start, bank_19_end)

    # Add known labels to targets
    for addr in LABELS:
        if 0x8000 <= addr <= 0xBFFF:
            jsr_targets.add(addr)

    print(f"Found {len(jsr_targets)} potential subroutines")

    print("Disassembling Bank 19...")
    lines = disassemble_bank(rom_data, 19, jsr_targets)

    # Save output
    output_path = os.path.join(os.path.dirname(__file__), '..', 'disasm', 'bank19_full.asm')
    os.makedirs(os.path.dirname(output_path), exist_ok=True)

    with open(output_path, 'w', encoding='utf-8') as f:
        f.write('\n'.join(lines))

    print(f"\nFull disassembly saved to: {output_path}")
    print(f"Total lines: {len(lines)}")

if __name__ == '__main__':
    main()
