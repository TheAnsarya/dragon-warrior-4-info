#!/usr/bin/env python3
"""
Dragon Warrior IV - Control Code Handler Analysis

Analyzes the text control code handling at Bank 22 $8B38+
"""

import os

ROM_PATH = os.path.join(os.path.dirname(__file__), '..', 'roms',
                        'Dragon Warrior IV (1992-10)(Enix)(US).nes')

# 6502 Opcode definitions
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

# Known labels for annotation
LABELS = {
    0x03D3: "text_state",
    0x03D4: "text_ppu_addr",
    0x03D5: "text_flags",
    0x03D6: "text_x_pos",
    0x03D7: "text_y_pos",
    0x03D8: "text_buffer_idx",
    0x03D9: "text_line_ctr",
    0x03DA: "text_scroll_flag",
    0x03DB: "text_window_id",
    0x07B4: "input_flags",
    0x00EE: "text_data_lo",
    0x00EF: "text_data_hi",
    0x00F0: "text_offset",
    0x00F7: "text_temp",
    0x00F8: "current_char",
}


def disassemble(data, start_addr, max_bytes=None, labels=None):
    """Disassemble binary data starting at given address."""
    if labels is None:
        labels = {}

    result = []
    i = 0
    limit = len(data) if max_bytes is None else min(len(data), max_bytes)

    while i < limit:
        addr = start_addr + i
        opcode = data[i]

        if opcode in OPCODES:
            mnem, mode, size = OPCODES[opcode]

            if i + size > len(data):
                break

            raw_bytes = data[i:i+size]
            hex_str = ' '.join(f'{b:02X}' for b in raw_bytes)

            if size == 1:
                operand_str = ""
            elif size == 2:
                operand = data[i+1]
                if mode == 'rel':
                    target = addr + 2 + (operand if operand < 128 else operand - 256)
                    operand_str = f"${target:04X}"
                elif mode == 'imm':
                    operand_str = f"#${operand:02X}"
                elif mode in ('zp', 'zpx', 'zpy'):
                    label = labels.get(operand, f"${operand:02X}")
                    suffix = ",X" if mode == 'zpx' else (",Y" if mode == 'zpy' else "")
                    operand_str = f"{label}{suffix}"
                elif mode == 'indx':
                    label = labels.get(operand, f"${operand:02X}")
                    operand_str = f"({label},X)"
                elif mode == 'indy':
                    label = labels.get(operand, f"${operand:02X}")
                    operand_str = f"({label}),Y"
                else:
                    operand_str = f"${operand:02X}"
            elif size == 3:
                lo, hi = data[i+1], data[i+2]
                operand = lo | (hi << 8)
                label = labels.get(operand, f"${operand:04X}")
                if mode == 'ind':
                    operand_str = f"({label})"
                elif mode in ('absx', 'absy'):
                    suffix = ",X" if mode == 'absx' else ",Y"
                    operand_str = f"{label}{suffix}"
                else:
                    operand_str = label

            result.append((addr, hex_str.ljust(8), mnem, operand_str))
            i += size
        else:
            # Unknown opcode
            result.append((addr, f'{opcode:02X}'.ljust(8), f".byte", f"${opcode:02X}"))
            i += 1

    return result


def print_disassembly(disasm, title=""):
    """Print disassembly with formatting."""
    if title:
        print(f"\n{'=' * 60}")
        print(f" {title}")
        print(f"{'=' * 60}")

    for addr, hex_bytes, mnem, operand in disasm:
        print(f"${addr:04X}: {hex_bytes} {mnem:4} {operand}")


def main():
    with open(ROM_PATH, 'rb') as f:
        rom = f.read()

    # Bank 22 starts at ROM offset: (22 * 0x4000) + 0x10 = 0x58010
    bank22_start = 22 * 0x4000 + 0x10

    print("=" * 60)
    print(" DRAGON WARRIOR IV - CONTROL CODE HANDLER ANALYSIS")
    print("=" * 60)

    # =================================================================
    # Control code type checker at $8B21
    # =================================================================
    offset = bank22_start + (0x8B21 - 0x8000)
    data = rom[offset:offset+32]
    disasm = disassemble(data, 0x8B21, labels=LABELS)
    print_disassembly(disasm, "Control Code Type Check ($8B21)")
    print("""
; This routine checks if the current character in $F8 is a control code
; Control codes are: $FF (END), $FE (CTRL), $FD (LINE)
; If byte >= $F0 but not $FF/$FE/$FD, it's clamped to $F0
""")

    # =================================================================
    # Main control code dispatcher at $8B38
    # =================================================================
    offset = bank22_start + (0x8B38 - 0x8000)
    data = rom[offset:offset+64]
    disasm = disassemble(data, 0x8B38, labels=LABELS)
    print_disassembly(disasm, "Control Code Dispatcher ($8B38)")
    print("""
; Dispatch table:
;   $FF -> jumps to END handler at $8B73
;   $FE -> PPU control handler (inline at $8B40)
;   $FD -> LINE handler at $8B58
""")

    # =================================================================
    # END handler at $8B73
    # =================================================================
    offset = bank22_start + (0x8B73 - 0x8000)
    data = rom[offset:offset+48]
    disasm = disassemble(data, 0x8B73, labels=LABELS)
    print_disassembly(disasm, "END Handler ($8B73) - $FF control code")
    print("""
; $FF = END - terminates text display
; Sets flags indicating text is complete
""")

    # =================================================================
    # Look for the main text loop that processes characters
    # =================================================================
    offset = bank22_start + (0x8AA5 - 0x8000)
    data = rom[offset:offset+80]
    disasm = disassemble(data, 0x8AA5, labels=LABELS)
    print_disassembly(disasm, "Text Character Processor Entry ($8AA5)")

    # =================================================================
    # Analyze PPU address calculation for $FE
    # =================================================================
    print("\n" + "=" * 60)
    print(" $FE CONTROL CODE ANALYSIS")
    print("=" * 60)
    print("""
The $FE control code at $8B40 performs PPU address manipulation:

$8B40:   ASL $03D4      ; Shift PPU addr left
$8B43:   ASL $03D4      ; Shift again
$8B46:   ASL $03D4      ; Shift third time (multiply by 8)
$8B49:   LDA $F7        ; Load text_temp
$8B4B:   LSR            ; Rotate right...
$8B4C:   ROR $03D4      ; ...into PPU addr
(repeat 3 times)

This calculates a new PPU address for text positioning.
The value in $F7 (text_temp) provides the position data.
""")

    # =================================================================
    # Look for text string read patterns
    # =================================================================
    print("\n" + "=" * 60)
    print(" TEXT DATA READ PATTERN")
    print("=" * 60)
    print("""
Text data is read using indirect indexed addressing:
  LDA ($EE),Y
Where:
  $EE-$EF = pointer to current text data
  Y = offset within current text block

The text engine increments Y and/or updates the pointer
as it reads through the text data.
""")

    # =================================================================
    # Summary
    # =================================================================
    print("\n" + "=" * 60)
    print(" CONTROL CODE SUMMARY")
    print("=" * 60)
    print("""
┌──────┬─────────────────────────────────────────────────────────┐
│ Code │ Function                                                │
├──────┼─────────────────────────────────────────────────────────┤
│ $FF  │ END - Terminate text display                            │
│      │ Handler: $8B73                                          │
│      │ Sets completion flag, exits text loop                   │
├──────┼─────────────────────────────────────────────────────────┤
│ $FE  │ CTRL - PPU positioning control                          │
│      │ Handler: $8B40 (inline)                                 │
│      │ Calculates new PPU address from parameter in $F7        │
│      │ Used for positioning text cursor on screen              │
├──────┼─────────────────────────────────────────────────────────┤
│ $FD  │ LINE - Newline / line break                             │
│      │ Handler: $8B58                                          │
│      │ Advances to next line in text window                    │
└──────┴─────────────────────────────────────────────────────────┘

Note: Control codes >= $F0 that are NOT $FF, $FE, or $FD are
treated as $F0 (clamped) by the check at $8B21.
""")


if __name__ == '__main__':
    main()
