#!/usr/bin/env python3
"""
Dragon Warrior IV - Complete Text Engine Disassembler

Full disassembly and annotation of the text rendering engine in Bank 22.
This includes:
- Character processing ($8AA5)
- Control code handling ($8B28)
- DTE/Dictionary decompression ($8272, $829A)
- PPU text rendering
"""

import os

ROM_PATH = os.path.join(os.path.dirname(__file__), '..', 'roms',
                        'Dragon Warrior IV (1992-10)(Enix)(US).nes')

# Complete 6502 opcode table
OPCODES = {
    0x00: ("BRK", "impl", 1), 0x01: ("ORA", "indx", 2), 0x05: ("ORA", "zp", 2),
    0x06: ("ASL", "zp", 2), 0x08: ("PHP", "impl", 1), 0x09: ("ORA", "imm", 2),
    0x0A: ("ASL", "acc", 1), 0x0D: ("ORA", "abs", 3), 0x0E: ("ASL", "abs", 3),
    0x10: ("BPL", "rel", 2), 0x11: ("ORA", "indy", 2), 0x15: ("ORA", "zpx", 2),
    0x16: ("ASL", "zpx", 2), 0x18: ("CLC", "impl", 1), 0x19: ("ORA", "absy", 3),
    0x1D: ("ORA", "absx", 3), 0x1E: ("ASL", "absx", 3), 0x20: ("JSR", "abs", 3),
    0x21: ("AND", "indx", 2), 0x24: ("BIT", "zp", 2), 0x25: ("AND", "zp", 2),
    0x26: ("ROL", "zp", 2), 0x28: ("PLP", "impl", 1), 0x29: ("AND", "imm", 2),
    0x2A: ("ROL", "acc", 1), 0x2C: ("BIT", "abs", 3), 0x2D: ("AND", "abs", 3),
    0x2E: ("ROL", "abs", 3), 0x30: ("BMI", "rel", 2), 0x31: ("AND", "indy", 2),
    0x35: ("AND", "zpx", 2), 0x36: ("ROL", "zpx", 2), 0x38: ("SEC", "impl", 1),
    0x39: ("AND", "absy", 3), 0x3D: ("AND", "absx", 3), 0x3E: ("ROL", "absx", 3),
    0x40: ("RTI", "impl", 1), 0x41: ("EOR", "indx", 2), 0x45: ("EOR", "zp", 2),
    0x46: ("LSR", "zp", 2), 0x48: ("PHA", "impl", 1), 0x49: ("EOR", "imm", 2),
    0x4A: ("LSR", "acc", 1), 0x4C: ("JMP", "abs", 3), 0x4D: ("EOR", "abs", 3),
    0x4E: ("LSR", "abs", 3), 0x50: ("BVC", "rel", 2), 0x51: ("EOR", "indy", 2),
    0x55: ("EOR", "zpx", 2), 0x56: ("LSR", "zpx", 2), 0x58: ("CLI", "impl", 1),
    0x59: ("EOR", "absy", 3), 0x5D: ("EOR", "absx", 3), 0x5E: ("LSR", "absx", 3),
    0x60: ("RTS", "impl", 1), 0x61: ("ADC", "indx", 2), 0x65: ("ADC", "zp", 2),
    0x66: ("ROR", "zp", 2), 0x68: ("PLA", "impl", 1), 0x69: ("ADC", "imm", 2),
    0x6A: ("ROR", "acc", 1), 0x6C: ("JMP", "ind", 3), 0x6D: ("ADC", "abs", 3),
    0x6E: ("ROR", "abs", 3), 0x70: ("BVS", "rel", 2), 0x71: ("ADC", "indy", 2),
    0x75: ("ADC", "zpx", 2), 0x76: ("ROR", "zpx", 2), 0x78: ("SEI", "impl", 1),
    0x79: ("ADC", "absy", 3), 0x7D: ("ADC", "absx", 3), 0x7E: ("ROR", "absx", 3),
    0x81: ("STA", "indx", 2), 0x84: ("STY", "zp", 2), 0x85: ("STA", "zp", 2),
    0x86: ("STX", "zp", 2), 0x88: ("DEY", "impl", 1), 0x8A: ("TXA", "impl", 1),
    0x8C: ("STY", "abs", 3), 0x8D: ("STA", "abs", 3), 0x8E: ("STX", "abs", 3),
    0x90: ("BCC", "rel", 2), 0x91: ("STA", "indy", 2), 0x94: ("STY", "zpx", 2),
    0x95: ("STA", "zpx", 2), 0x96: ("STX", "zpy", 2), 0x98: ("TYA", "impl", 1),
    0x99: ("STA", "absy", 3), 0x9A: ("TXS", "impl", 1), 0x9D: ("STA", "absx", 3),
    0xA0: ("LDY", "imm", 2), 0xA1: ("LDA", "indx", 2), 0xA2: ("LDX", "imm", 2),
    0xA4: ("LDY", "zp", 2), 0xA5: ("LDA", "zp", 2), 0xA6: ("LDX", "zp", 2),
    0xA8: ("TAY", "impl", 1), 0xA9: ("LDA", "imm", 2), 0xAA: ("TAX", "impl", 1),
    0xAC: ("LDY", "abs", 3), 0xAD: ("LDA", "abs", 3), 0xAE: ("LDX", "abs", 3),
    0xB0: ("BCS", "rel", 2), 0xB1: ("LDA", "indy", 2), 0xB4: ("LDY", "zpx", 2),
    0xB5: ("LDA", "zpx", 2), 0xB6: ("LDX", "zpy", 2), 0xB8: ("CLV", "impl", 1),
    0xB9: ("LDA", "absy", 3), 0xBA: ("TSX", "impl", 1), 0xBC: ("LDY", "absx", 3),
    0xBD: ("LDA", "absx", 3), 0xBE: ("LDX", "absy", 3), 0xC0: ("CPY", "imm", 2),
    0xC1: ("CMP", "indx", 2), 0xC4: ("CPY", "zp", 2), 0xC5: ("CMP", "zp", 2),
    0xC6: ("DEC", "zp", 2), 0xC8: ("INY", "impl", 1), 0xC9: ("CMP", "imm", 2),
    0xCA: ("DEX", "impl", 1), 0xCC: ("CPY", "abs", 3), 0xCD: ("CMP", "abs", 3),
    0xCE: ("DEC", "abs", 3), 0xD0: ("BNE", "rel", 2), 0xD1: ("CMP", "indy", 2),
    0xD5: ("CMP", "zpx", 2), 0xD6: ("DEC", "zpx", 2), 0xD8: ("CLD", "impl", 1),
    0xD9: ("CMP", "absy", 3), 0xDD: ("CMP", "absx", 3), 0xDE: ("DEC", "absx", 3),
    0xE0: ("CPX", "imm", 2), 0xE1: ("SBC", "indx", 2), 0xE4: ("CPX", "zp", 2),
    0xE5: ("SBC", "zp", 2), 0xE6: ("INC", "zp", 2), 0xE8: ("INX", "impl", 1),
    0xE9: ("SBC", "imm", 2), 0xEA: ("NOP", "impl", 1), 0xEC: ("CPX", "abs", 3),
    0xED: ("SBC", "abs", 3), 0xEE: ("INC", "abs", 3), 0xF0: ("BEQ", "rel", 2),
    0xF1: ("SBC", "indy", 2), 0xF5: ("SBC", "zpx", 2), 0xF6: ("INC", "zpx", 2),
    0xF8: ("SED", "impl", 1), 0xF9: ("SBC", "absy", 3), 0xFD: ("SBC", "absx", 3),
    0xFE: ("INC", "absx", 3),
}

# Known labels/symbols for annotation
LABELS = {
    # Zero page
    0x00: "zp_temp_00",
    0x01: "zp_temp_01",
    0x04: "zp_temp_04",
    0x08: "zp_temp_08",
    0x0D: "zp_loop_counter",
    0x0E: "zp_temp_0E",
    0x5C: "text_state_5C",
    0x60: "text_counter_60",
    0x6F: "zp_temp_6F",
    0x75: "zp_temp_75",
    0xEE: "text_ptr_lo",
    0xEF: "text_ptr_hi",
    0xF0: "text_offset",
    0xF1: "text_limit",
    0xF5: "text_flags_F5",
    0xF6: "current_char_raw",
    0xF7: "text_param",
    0xF8: "current_char",

    # RAM
    0x03C6: "text_var_03C6",
    0x03C8: "text_var_03C8",
    0x03C9: "text_var_03C9",
    0x03CB: "text_var_03CB",
    0x03D2: "text_var_03D2",
    0x03D3: "text_state",
    0x03D4: "text_ppu_addr",
    0x03D5: "text_flags",
    0x03D6: "text_x_pos",
    0x03D7: "text_y_pos",
    0x03D8: "text_buffer_idx",
    0x03D9: "text_line_ctr",
    0x03DA: "text_scroll_flag",
    0x03DB: "text_window_id",
    0x03DC: "text_var_03DC",
    0x03DD: "text_var_03DD",
    0x03E1: "text_var_03E1",
    0x03E3: "text_buffer",
    0x04E0: "text_array_04E0",
    0x04F2: "text_var_04F2",
    0x04F3: "text_var_04F3",
    0x0507: "current_bank",
    0x0517: "text_bank",
    0x0553: "buffer_0553",
    0x0554: "buffer_0554",
    0x06FE: "stack_mirror",
    0x076C: "text_ptr_table",
    0x076D: "text_ptr_table_hi",
    0x07B4: "input_flags",

    # ROM addresses (Bank 22)
    0x8219: "text_loop_continue",
    0x8272: "check_dte",
    0x829A: "dte_handler",
    0x82D1: "dte_data_table",
    0x8336: "text_process_next",
    0x8356: "text_read_char",
    0x835D: "text_special_handler",
    0x8AA5: "text_char_processor",
    0x8B11: "text_control_check",
    0x8B21: "control_type_check",
    0x8B28: "control_dispatch",
    0x8B30: "ctrl_FE_handler",
    0x8B48: "ctrl_FD_handler",
    0x8B63: "ctrl_FF_handler",
    0x8BDA: "text_init_vars",
    0x8C96: "text_state_update",
    0x8DD4: "text_helper_8DD4",
    0x8F8C: "text_render_8F8C",
    0x8FAA: "text_render_8FAA",
    0x9022: "text_process_9022",
    0x90C4: "text_setup_90C4",
    0x9349: "text_func_9349",
    0x9543: "text_func_9543",
    0x95AF: "text_read_loop",
    0x95FF: "text_handler_95FF",
    0x963D: "text_func_963D",
    0x9CCB: "text_func_9CCB",
    0xA4DE: "text_helper_A4DE",
    0xA4E9: "text_helper_A4E9",
    0xB3A4: "menu_text_start",
    0xB3B3: "menu_text_data",
}

# Comments for specific addresses
COMMENTS = {
    0x8272: "; Check if byte >= $80 (DTE/compressed)",
    0x8274: "; Branch to DTE handler if compressed",
    0x8276: "; Direct char: mask to low nibble",
    0x829A: "; === DTE HANDLER START ===",
    0x829B: "; Get low 3 bits as table index",
    0x82CD: "; Restore original byte",
    0x82CE: "; Continue to next character",
    0x8B28: "; Check for $FF (END)",
    0x8B2A: "; Jump to END handler",
    0x8B2C: "; Check for $FE (CTRL)",
    0x8B2E: "; Not $FE, check $FD (LINE)",
    0x8B30: "; === $FE CTRL HANDLER ===",
    0x8B48: "; === $FD LINE HANDLER ===",
    0x8B63: "; === $FF END HANDLER ===",
}


class Disassembler:
    def __init__(self, rom_data, bank_num):
        self.rom = rom_data
        self.bank = bank_num
        self.bank_start = bank_num * 0x4000 + 0x10

    def get_byte(self, cpu_addr):
        """Get a byte from the bank given a CPU address."""
        offset = cpu_addr - 0x8000
        if 0 <= offset < 0x4000:
            return self.rom[self.bank_start + offset]
        return None

    def get_label(self, addr):
        """Get label for an address if known."""
        return LABELS.get(addr, None)

    def format_operand(self, mode, data, addr):
        """Format the operand based on addressing mode."""
        if mode == "impl" or mode == "acc":
            return ""
        elif mode == "imm":
            return f"#${data[1]:02X}"
        elif mode == "zp":
            zp_addr = data[1]
            label = self.get_label(zp_addr)
            return label if label else f"${zp_addr:02X}"
        elif mode == "zpx":
            zp_addr = data[1]
            label = self.get_label(zp_addr)
            base = label if label else f"${zp_addr:02X}"
            return f"{base},X"
        elif mode == "zpy":
            zp_addr = data[1]
            label = self.get_label(zp_addr)
            base = label if label else f"${zp_addr:02X}"
            return f"{base},Y"
        elif mode == "abs":
            word = data[1] | (data[2] << 8)
            label = self.get_label(word)
            return label if label else f"${word:04X}"
        elif mode == "absx":
            word = data[1] | (data[2] << 8)
            label = self.get_label(word)
            base = label if label else f"${word:04X}"
            return f"{base},X"
        elif mode == "absy":
            word = data[1] | (data[2] << 8)
            label = self.get_label(word)
            base = label if label else f"${word:04X}"
            return f"{base},Y"
        elif mode == "ind":
            word = data[1] | (data[2] << 8)
            label = self.get_label(word)
            return f"({label})" if label else f"(${word:04X})"
        elif mode == "indx":
            zp_addr = data[1]
            label = self.get_label(zp_addr)
            base = label if label else f"${zp_addr:02X}"
            return f"({base},X)"
        elif mode == "indy":
            zp_addr = data[1]
            label = self.get_label(zp_addr)
            base = label if label else f"${zp_addr:02X}"
            return f"({base}),Y"
        elif mode == "rel":
            offset = data[1]
            if offset >= 128:
                offset -= 256
            target = addr + 2 + offset
            label = self.get_label(target)
            return label if label else f"${target:04X}"
        return ""

    def disassemble_range(self, start_addr, end_addr):
        """Disassemble a range of addresses."""
        result = []
        addr = start_addr

        while addr < end_addr:
            # Check for label at this address
            label = self.get_label(addr)
            if label:
                result.append(f"\n{label}:")

            # Check for comment
            comment = COMMENTS.get(addr, "")

            opcode = self.get_byte(addr)
            if opcode is None:
                break

            if opcode in OPCODES:
                mnem, mode, size = OPCODES[opcode]

                # Get instruction bytes
                data = []
                for i in range(size):
                    b = self.get_byte(addr + i)
                    if b is None:
                        break
                    data.append(b)

                if len(data) < size:
                    break

                # Format output
                hex_str = ' '.join(f'{b:02X}' for b in data)
                operand = self.format_operand(mode, data, addr)

                line = f"    ${addr:04X}: {hex_str:8}  {mnem:4} {operand:20}"
                if comment:
                    line += f" {comment}"
                result.append(line)

                addr += size
            else:
                # Unknown opcode - treat as data
                result.append(f"    ${addr:04X}: {opcode:02X}        .byte ${opcode:02X}")
                addr += 1

        return result


def main():
    with open(ROM_PATH, 'rb') as f:
        rom = f.read()

    disasm = Disassembler(rom, 22)

    print("=" * 78)
    print(" DRAGON WARRIOR IV (NES) - TEXT ENGINE DISASSEMBLY")
    print(" Bank 22 ($16)")
    print("=" * 78)

    # Section 1: DTE Check and Handler
    print("\n" + "=" * 78)
    print(" SECTION 1: DTE/DICTIONARY DECOMPRESSION ($8250-$82E0)")
    print("=" * 78)
    print("""
; This section handles text decompression.
; Bytes < $80 are direct character codes.
; Bytes >= $80 are dictionary entries that expand to multiple characters.
""")
    for line in disasm.disassemble_range(0x8250, 0x82E0):
        print(line)

    # Section 2: Character Processing
    print("\n" + "=" * 78)
    print(" SECTION 2: MAIN CHARACTER PROCESSOR ($8AA5-$8B10)")
    print("=" * 78)
    print("""
; Main entry point for processing a single text character.
; Checks if character is a control code (>= $F0) and dispatches accordingly.
""")
    for line in disasm.disassemble_range(0x8AA5, 0x8B10):
        print(line)

    # Section 3: Control Code Handlers
    print("\n" + "=" * 78)
    print(" SECTION 3: CONTROL CODE HANDLERS ($8B11-$8BA0)")
    print("=" * 78)
    print("""
; Control codes:
;   $FF = END   - Terminate text display
;   $FE = CTRL  - PPU positioning control
;   $FD = LINE  - Newline / line break
""")
    for line in disasm.disassemble_range(0x8B11, 0x8BA0):
        print(line)

    # Section 4: Text Read Loop
    print("\n" + "=" * 78)
    print(" SECTION 4: TEXT READ LOOP ($95AF-$9650)")
    print("=" * 78)
    print("""
; Main loop that reads text data from ROM via ($EE),Y pointer.
; Processes formatting and prepares characters for rendering.
""")
    for line in disasm.disassemble_range(0x95AF, 0x9650):
        print(line)

    # Summary
    print("\n" + "=" * 78)
    print(" TEXT ENGINE SUMMARY")
    print("=" * 78)
    print("""
+-----------------------------------------------------------------------------+
| TEXT ENCODING                                                               |
+-----------------------------------------------------------------------------+
| $00      = Space                                                            |
| $01-$0A  = Digits 0-9                                                       |
| $0B-$24  = Lowercase a-z                                                    |
| $25-$3E  = Uppercase A-Z                                                    |
| $65-$81  = Punctuation/special characters                                   |
| $80-$EF  = DTE/Dictionary entries (expand to 2+ characters)                 |
| $F0-$FC  = (Clamped to $F0)                                                 |
| $FD      = LINE (newline)                                                   |
| $FE      = CTRL (PPU control)                                               |
| $FF      = END (terminator)                                                 |
+-----------------------------------------------------------------------------+
| KEY ROUTINES                                                                |
+-----------------------------------------------------------------------------+
| $8272    = DTE check (CMP #$80)                                             |
| $829A    = DTE expansion handler                                            |
| $8AA5    = Character processor entry                                        |
| $8B28    = Control code dispatcher                                          |
| $95AF    = Text read loop                                                   |
+-----------------------------------------------------------------------------+
| ZERO PAGE USAGE                                                             |
+-----------------------------------------------------------------------------+
| $EE-$EF  = Pointer to current text data                                     |
| $F0      = Offset within text block                                         |
| $F6      = Raw character before processing                                  |
| $F7      = Parameter/temp value                                             |
| $F8      = Processed character code                                         |
+-----------------------------------------------------------------------------+
| RAM USAGE                                                                   |
+-----------------------------------------------------------------------------+
| $03D3    = Text engine state                                                |
| $03D4    = PPU nametable address for text                                   |
| $03D9    = Line counter                                                     |
| $0554+   = Character output buffer                                          |
| $07B4    = Input/state flags                                                |
+-----------------------------------------------------------------------------+
""")


if __name__ == '__main__':
    main()
