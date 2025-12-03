#!/usr/bin/env python3
"""
Dragon Warrior IV - Text Engine Assembly Export
===============================================

Generates a fully labeled assembly file for the text engine code.
Output is suitable for reassembly with ca65 or similar.
"""

import os

ROM_PATH = os.path.join(os.path.dirname(__file__), '..', 'roms',
                        'Dragon Warrior IV (1992-10)(Enix)(US).nes')

OUTPUT_PATH = os.path.join(os.path.dirname(__file__), '..', 'disasm',
                           'text_engine.asm')

# 6502 Opcode definitions
OPCODES = {
    0x00: ('BRK', 'impl', 1),
    0x01: ('ORA', 'indx', 2),
    0x05: ('ORA', 'zp', 2),
    0x06: ('ASL', 'zp', 2),
    0x08: ('PHP', 'impl', 1),
    0x09: ('ORA', 'imm', 2),
    0x0A: ('ASL', 'acc', 1),
    0x0D: ('ORA', 'abs', 3),
    0x0E: ('ASL', 'abs', 3),
    0x10: ('BPL', 'rel', 2),
    0x11: ('ORA', 'indy', 2),
    0x15: ('ORA', 'zpx', 2),
    0x16: ('ASL', 'zpx', 2),
    0x18: ('CLC', 'impl', 1),
    0x19: ('ORA', 'absy', 3),
    0x1D: ('ORA', 'absx', 3),
    0x1E: ('ASL', 'absx', 3),
    0x20: ('JSR', 'abs', 3),
    0x21: ('AND', 'indx', 2),
    0x24: ('BIT', 'zp', 2),
    0x25: ('AND', 'zp', 2),
    0x26: ('ROL', 'zp', 2),
    0x28: ('PLP', 'impl', 1),
    0x29: ('AND', 'imm', 2),
    0x2A: ('ROL', 'acc', 1),
    0x2C: ('BIT', 'abs', 3),
    0x2D: ('AND', 'abs', 3),
    0x2E: ('ROL', 'abs', 3),
    0x30: ('BMI', 'rel', 2),
    0x31: ('AND', 'indy', 2),
    0x35: ('AND', 'zpx', 2),
    0x36: ('ROL', 'zpx', 2),
    0x38: ('SEC', 'impl', 1),
    0x39: ('AND', 'absy', 3),
    0x3D: ('AND', 'absx', 3),
    0x3E: ('ROL', 'absx', 3),
    0x40: ('RTI', 'impl', 1),
    0x41: ('EOR', 'indx', 2),
    0x45: ('EOR', 'zp', 2),
    0x46: ('LSR', 'zp', 2),
    0x48: ('PHA', 'impl', 1),
    0x49: ('EOR', 'imm', 2),
    0x4A: ('LSR', 'acc', 1),
    0x4C: ('JMP', 'abs', 3),
    0x4D: ('EOR', 'abs', 3),
    0x4E: ('LSR', 'abs', 3),
    0x50: ('BVC', 'rel', 2),
    0x51: ('EOR', 'indy', 2),
    0x55: ('EOR', 'zpx', 2),
    0x56: ('LSR', 'zpx', 2),
    0x58: ('CLI', 'impl', 1),
    0x59: ('EOR', 'absy', 3),
    0x5D: ('EOR', 'absx', 3),
    0x5E: ('LSR', 'absx', 3),
    0x60: ('RTS', 'impl', 1),
    0x61: ('ADC', 'indx', 2),
    0x65: ('ADC', 'zp', 2),
    0x66: ('ROR', 'zp', 2),
    0x68: ('PLA', 'impl', 1),
    0x69: ('ADC', 'imm', 2),
    0x6A: ('ROR', 'acc', 1),
    0x6C: ('JMP', 'ind', 3),
    0x6D: ('ADC', 'abs', 3),
    0x6E: ('ROR', 'abs', 3),
    0x70: ('BVS', 'rel', 2),
    0x71: ('ADC', 'indy', 2),
    0x75: ('ADC', 'zpx', 2),
    0x76: ('ROR', 'zpx', 2),
    0x78: ('SEI', 'impl', 1),
    0x79: ('ADC', 'absy', 3),
    0x7D: ('ADC', 'absx', 3),
    0x7E: ('ROR', 'absx', 3),
    0x81: ('STA', 'indx', 2),
    0x84: ('STY', 'zp', 2),
    0x85: ('STA', 'zp', 2),
    0x86: ('STX', 'zp', 2),
    0x88: ('DEY', 'impl', 1),
    0x8A: ('TXA', 'impl', 1),
    0x8C: ('STY', 'abs', 3),
    0x8D: ('STA', 'abs', 3),
    0x8E: ('STX', 'abs', 3),
    0x90: ('BCC', 'rel', 2),
    0x91: ('STA', 'indy', 2),
    0x94: ('STY', 'zpx', 2),
    0x95: ('STA', 'zpx', 2),
    0x96: ('STX', 'zpy', 2),
    0x98: ('TYA', 'impl', 1),
    0x99: ('STA', 'absy', 3),
    0x9A: ('TXS', 'impl', 1),
    0x9D: ('STA', 'absx', 3),
    0xA0: ('LDY', 'imm', 2),
    0xA1: ('LDA', 'indx', 2),
    0xA2: ('LDX', 'imm', 2),
    0xA4: ('LDY', 'zp', 2),
    0xA5: ('LDA', 'zp', 2),
    0xA6: ('LDX', 'zp', 2),
    0xA8: ('TAY', 'impl', 1),
    0xA9: ('LDA', 'imm', 2),
    0xAA: ('TAX', 'impl', 1),
    0xAC: ('LDY', 'abs', 3),
    0xAD: ('LDA', 'abs', 3),
    0xAE: ('LDX', 'abs', 3),
    0xB0: ('BCS', 'rel', 2),
    0xB1: ('LDA', 'indy', 2),
    0xB4: ('LDY', 'zpx', 2),
    0xB5: ('LDA', 'zpx', 2),
    0xB6: ('LDX', 'zpy', 2),
    0xB8: ('CLV', 'impl', 1),
    0xB9: ('LDA', 'absy', 3),
    0xBA: ('TSX', 'impl', 1),
    0xBC: ('LDY', 'absx', 3),
    0xBD: ('LDA', 'absx', 3),
    0xBE: ('LDX', 'absy', 3),
    0xC0: ('CPY', 'imm', 2),
    0xC1: ('CMP', 'indx', 2),
    0xC4: ('CPY', 'zp', 2),
    0xC5: ('CMP', 'zp', 2),
    0xC6: ('DEC', 'zp', 2),
    0xC8: ('INY', 'impl', 1),
    0xC9: ('CMP', 'imm', 2),
    0xCA: ('DEX', 'impl', 1),
    0xCC: ('CPY', 'abs', 3),
    0xCD: ('CMP', 'abs', 3),
    0xCE: ('DEC', 'abs', 3),
    0xD0: ('BNE', 'rel', 2),
    0xD1: ('CMP', 'indy', 2),
    0xD5: ('CMP', 'zpx', 2),
    0xD6: ('DEC', 'zpx', 2),
    0xD8: ('CLD', 'impl', 1),
    0xD9: ('CMP', 'absy', 3),
    0xDD: ('CMP', 'absx', 3),
    0xDE: ('DEC', 'absx', 3),
    0xE0: ('CPX', 'imm', 2),
    0xE1: ('SBC', 'indx', 2),
    0xE4: ('CPX', 'zp', 2),
    0xE5: ('SBC', 'zp', 2),
    0xE6: ('INC', 'zp', 2),
    0xE8: ('INX', 'impl', 1),
    0xE9: ('SBC', 'imm', 2),
    0xEA: ('NOP', 'impl', 1),
    0xEC: ('CPX', 'abs', 3),
    0xED: ('SBC', 'abs', 3),
    0xEE: ('INC', 'abs', 3),
    0xF0: ('BEQ', 'rel', 2),
    0xF1: ('SBC', 'indy', 2),
    0xF5: ('SBC', 'zpx', 2),
    0xF6: ('INC', 'zpx', 2),
    0xF8: ('SED', 'impl', 1),
    0xF9: ('SBC', 'absy', 3),
    0xFD: ('SBC', 'absx', 3),
    0xFE: ('INC', 'absx', 3),
}

# Known labels for text engine
LABELS = {
    # Zero page
    0x00: 'zp_temp_00',
    0x04: 'zp_temp_04',
    0x0D: 'zp_loop_counter',
    0x5C: 'text_state_5C',
    0x60: 'text_counter_60',
    0xEE: 'text_ptr_lo',
    0xEF: 'text_ptr_hi',
    0xF0: 'text_offset',
    0xF5: 'text_flags_F5',
    0xF6: 'current_char_raw',
    0xF7: 'text_param',
    0xF8: 'current_char',

    # RAM
    0x03C8: 'text_var_03C8',
    0x03C9: 'text_var_03C9',
    0x03CB: 'text_var_03CB',
    0x03D3: 'text_state',
    0x03D4: 'text_ppu_addr',
    0x03D5: 'text_flags',
    0x03D6: 'text_x_pos',
    0x03D7: 'text_y_pos',
    0x03D9: 'text_line_ctr',
    0x03DB: 'text_window_id',
    0x03E1: 'text_var_03E1',
    0x03E3: 'text_buffer',
    0x0507: 'current_bank',
    0x0517: 'text_bank',
    0x0553: 'buffer_0553',
    0x0554: 'buffer_0554',
    0x04E0: 'text_array_04E0',
    0x04F2: 'text_var_04F2',
    0x04F3: 'text_var_04F3',
    0x076C: 'text_ptr_table',
    0x076D: 'text_ptr_table_hi',
    0x07B4: 'input_flags',

    # Bank 22 code addresses
    0x8272: 'check_dte',
    0x829A: 'dte_handler',
    0x82D1: 'dte_data_table',
    0x8336: 'text_process_next',
    0x8356: 'text_read_char',
    0x835D: 'text_special_handler',
    0x8AA5: 'text_char_processor',
    0x8B11: 'text_control_check',
    0x8B21: 'control_type_check',
    0x8B28: 'control_dispatch',
    0x8B30: 'ctrl_FE_handler',
    0x8B48: 'ctrl_FD_handler',
    0x8B63: 'ctrl_FF_handler',
    0x8BDA: 'text_init_vars',
    0x8C96: 'text_state_update',
    0x8DD4: 'text_helper_8DD4',
    0x8F8C: 'text_render_8F8C',
    0x8FAA: 'text_render_8FAA',
    0x9022: 'text_process_9022',
    0x90C4: 'text_setup_90C4',
    0x90F0: 'text_func_90F0',
    0x9349: 'text_func_9349',
    0x9543: 'text_func_9543',
    0x95AF: 'text_read_loop',
    0x95FF: 'text_handler_95FF',
    0x963D: 'text_func_963D',
    0x9CCB: 'text_func_9CCB',
    0xA4DE: 'text_helper_A4DE',
    0xA4E9: 'text_helper_A4E9',
    0xB3A4: 'dte_table',
    0xB3B3: 'menu_text_start',

    # Fixed bank
    0xC3EA: 'text_loader',
    0xFF91: 'bank_switch',
}


class AsmExporter:
    """Exports disassembly to assembly format."""

    def __init__(self, rom_path):
        with open(rom_path, 'rb') as f:
            self.rom = f.read()
        self.local_labels = {}

    def bank_to_offset(self, bank, addr):
        """Convert bank:addr to ROM offset."""
        if addr >= 0xC000:
            return 16 + (31 * 0x4000) + (addr - 0xC000)
        return 16 + (bank * 0x4000) + (addr - 0x8000)

    def get_label(self, addr):
        """Get label for an address."""
        if addr in LABELS:
            return LABELS[addr]
        if addr in self.local_labels:
            return self.local_labels[addr]
        return None

    def format_operand(self, mode, addr, operand, size):
        """Format operand based on addressing mode."""
        label = self.get_label(operand) if mode in ['abs', 'absx', 'absy', 'zp', 'zpx', 'zpy'] else None

        if mode == 'impl' or mode == 'acc':
            return ''
        elif mode == 'imm':
            return f'#${operand:02X}'
        elif mode == 'zp':
            return label if label else f'${operand:02X}'
        elif mode == 'zpx':
            base = label if label else f'${operand:02X}'
            return f'{base},X'
        elif mode == 'zpy':
            base = label if label else f'${operand:02X}'
            return f'{base},Y'
        elif mode == 'abs':
            return label if label else f'${operand:04X}'
        elif mode == 'absx':
            base = label if label else f'${operand:04X}'
            return f'{base},X'
        elif mode == 'absy':
            base = label if label else f'${operand:04X}'
            return f'{base},Y'
        elif mode == 'ind':
            return f'(${operand:04X})'
        elif mode == 'indx':
            return f'(${operand:02X},X)'
        elif mode == 'indy':
            return f'(${operand:02X}),Y'
        elif mode == 'rel':
            # Calculate branch target
            if operand > 127:
                operand -= 256
            target = addr + size + operand
            label = self.get_label(target)
            return label if label else f'${target:04X}'
        return f'${operand:02X}'

    def disassemble_range(self, bank, start, end):
        """Disassemble a range of addresses."""
        lines = []
        offset = self.bank_to_offset(bank, start)
        addr = start

        while addr < end:
            label = self.get_label(addr)
            if label:
                lines.append(f'{label}:')

            if offset >= len(self.rom):
                break

            opcode = self.rom[offset]
            if opcode in OPCODES:
                mnemonic, mode, size = OPCODES[opcode]

                # Get operand
                if size == 2:
                    operand = self.rom[offset + 1]
                elif size == 3:
                    operand = self.rom[offset + 1] | (self.rom[offset + 2] << 8)
                else:
                    operand = 0

                operand_str = self.format_operand(mode, addr, operand, size)

                # Format hex bytes
                hex_bytes = ' '.join(f'{self.rom[offset+i]:02X}'
                                    for i in range(size))

                if operand_str:
                    lines.append(f'    {mnemonic:4s} {operand_str:20s}  ; ${addr:04X}: {hex_bytes}')
                else:
                    lines.append(f'    {mnemonic:4s}                       ; ${addr:04X}: {hex_bytes}')

                addr += size
                offset += size
            else:
                # Invalid opcode - treat as data
                lines.append(f'    .byte ${opcode:02X}                    ; ${addr:04X}')
                addr += 1
                offset += 1

        return lines

    def export(self, output_path):
        """Export complete text engine disassembly."""
        os.makedirs(os.path.dirname(output_path), exist_ok=True)

        with open(output_path, 'w') as f:
            # Header
            f.write('; Dragon Warrior IV (NES) - Text Engine Disassembly\n')
            f.write('; ================================================\n')
            f.write('; Bank 22 ($16) - Text rendering and compression\n')
            f.write('; Generated by export_asm.py\n')
            f.write(';\n')
            f.write('; Text encoding:\n')
            f.write(';   $00      = Space\n')
            f.write(';   $01-$0A  = Digits 0-9\n')
            f.write(';   $0B-$24  = Lowercase a-z\n')
            f.write(';   $25-$3E  = Uppercase A-Z\n')
            f.write(';   $80-$FE  = DTE pairs (dictionary compression)\n')
            f.write(';   $FD      = LINE (newline)\n')
            f.write(';   $FE      = CTRL (PPU positioning)\n')
            f.write(';   $FF      = END (terminator)\n')
            f.write(';\n\n')

            # Zero page equates
            f.write('; === ZERO PAGE EQUATES ===\n')
            for addr in sorted(LABELS.keys()):
                if addr < 0x100:
                    f.write(f'{LABELS[addr]:20s} = ${addr:02X}\n')
            f.write('\n')

            # RAM equates
            f.write('; === RAM EQUATES ===\n')
            for addr in sorted(LABELS.keys()):
                if 0x100 <= addr < 0x800:
                    f.write(f'{LABELS[addr]:20s} = ${addr:04X}\n')
            f.write('\n')

            # Bank 22 code sections
            f.write('; ============================================\n')
            f.write('; SECTION 1: DTE HANDLER ($8270-$82E0)\n')
            f.write('; ============================================\n')
            f.write(';\n')
            f.write('; DTE check: bytes >= $80 are compressed\n')
            f.write('; Low 3 bits = dictionary index\n')
            f.write(';\n\n')
            for line in self.disassemble_range(22, 0x8270, 0x82E0):
                f.write(line + '\n')

            f.write('\n\n; ============================================\n')
            f.write('; SECTION 2: CHARACTER PROCESSOR ($8AA5-$8B10)\n')
            f.write('; ============================================\n')
            f.write(';\n')
            f.write('; Main entry point for text character rendering\n')
            f.write(';\n\n')
            for line in self.disassemble_range(22, 0x8AA5, 0x8B10):
                f.write(line + '\n')

            f.write('\n\n; ============================================\n')
            f.write('; SECTION 3: CONTROL CODE HANDLERS ($8B10-$8BA0)\n')
            f.write('; ============================================\n')
            f.write(';\n')
            f.write('; $FF = END, $FE = CTRL/PPU, $FD = LINE\n')
            f.write(';\n\n')
            for line in self.disassemble_range(22, 0x8B10, 0x8BA0):
                f.write(line + '\n')

            f.write('\n\n; ============================================\n')
            f.write('; SECTION 4: TEXT READ LOOP ($95AF-$9650)\n')
            f.write('; ============================================\n')
            f.write(';\n')
            f.write('; Reads text from ($EE),Y pointer\n')
            f.write(';\n\n')
            for line in self.disassemble_range(22, 0x95AF, 0x9650):
                f.write(line + '\n')

            f.write('\n\n; === END OF TEXT ENGINE ===\n')

        return output_path


def main():
    exporter = AsmExporter(ROM_PATH)
    output = exporter.export(OUTPUT_PATH)

    print("=" * 70)
    print(" DRAGON WARRIOR IV - ASM EXPORT COMPLETE")
    print("=" * 70)
    print(f"\nExported to: {output}")
    print("\nSections exported:")
    print("  - DTE Handler ($8270-$82E0)")
    print("  - Character Processor ($8AA5-$8B10)")
    print("  - Control Code Handlers ($8B10-$8BA0)")
    print("  - Text Read Loop ($95AF-$9650)")


if __name__ == '__main__':
    main()
