#!/usr/bin/env python3
"""
Dragon Warrior IV - Bank 22 Text Handler Disassembly
Bank 22 contains menu text and text control code handlers
"""

import os
import struct

ROM_PATH = os.path.join(os.path.dirname(__file__), '..', 'roms',
                        'Dragon Warrior IV (1992-10)(Enix)(US).nes')

# 6502 instruction data
OPCODES = {
    0x00: ("BRK", 1, "impl"),    0x01: ("ORA", 2, "indx"),    0x05: ("ORA", 2, "zp"),
    0x06: ("ASL", 2, "zp"),      0x08: ("PHP", 1, "impl"),    0x09: ("ORA", 2, "imm"),
    0x0A: ("ASL", 1, "acc"),     0x0D: ("ORA", 3, "abs"),     0x0E: ("ASL", 3, "abs"),
    0x10: ("BPL", 2, "rel"),     0x11: ("ORA", 2, "indy"),    0x15: ("ORA", 2, "zpx"),
    0x16: ("ASL", 2, "zpx"),     0x18: ("CLC", 1, "impl"),    0x19: ("ORA", 3, "absy"),
    0x1D: ("ORA", 3, "absx"),    0x1E: ("ASL", 3, "absx"),    0x20: ("JSR", 3, "abs"),
    0x21: ("AND", 2, "indx"),    0x24: ("BIT", 2, "zp"),      0x25: ("AND", 2, "zp"),
    0x26: ("ROL", 2, "zp"),      0x28: ("PLP", 1, "impl"),    0x29: ("AND", 2, "imm"),
    0x2A: ("ROL", 1, "acc"),     0x2C: ("BIT", 3, "abs"),     0x2D: ("AND", 3, "abs"),
    0x2E: ("ROL", 3, "abs"),     0x30: ("BMI", 2, "rel"),     0x31: ("AND", 2, "indy"),
    0x35: ("AND", 2, "zpx"),     0x36: ("ROL", 2, "zpx"),     0x38: ("SEC", 1, "impl"),
    0x39: ("AND", 3, "absy"),    0x3D: ("AND", 3, "absx"),    0x3E: ("ROL", 3, "absx"),
    0x40: ("RTI", 1, "impl"),    0x41: ("EOR", 2, "indx"),    0x45: ("EOR", 2, "zp"),
    0x46: ("LSR", 2, "zp"),      0x48: ("PHA", 1, "impl"),    0x49: ("EOR", 2, "imm"),
    0x4A: ("LSR", 1, "acc"),     0x4C: ("JMP", 3, "abs"),     0x4D: ("EOR", 3, "abs"),
    0x4E: ("LSR", 3, "abs"),     0x50: ("BVC", 2, "rel"),     0x51: ("EOR", 2, "indy"),
    0x55: ("EOR", 2, "zpx"),     0x56: ("LSR", 2, "zpx"),     0x58: ("CLI", 1, "impl"),
    0x59: ("EOR", 3, "absy"),    0x5D: ("EOR", 3, "absx"),    0x5E: ("LSR", 3, "absx"),
    0x60: ("RTS", 1, "impl"),    0x61: ("ADC", 2, "indx"),    0x65: ("ADC", 2, "zp"),
    0x66: ("ROR", 2, "zp"),      0x68: ("PLA", 1, "impl"),    0x69: ("ADC", 2, "imm"),
    0x6A: ("ROR", 1, "acc"),     0x6C: ("JMP", 3, "ind"),     0x6D: ("ADC", 3, "abs"),
    0x6E: ("ROR", 3, "abs"),     0x70: ("BVS", 2, "rel"),     0x71: ("ADC", 2, "indy"),
    0x75: ("ADC", 2, "zpx"),     0x76: ("ROR", 2, "zpx"),     0x78: ("SEI", 1, "impl"),
    0x79: ("ADC", 3, "absy"),    0x7D: ("ADC", 3, "absx"),    0x7E: ("ROR", 3, "absx"),
    0x81: ("STA", 2, "indx"),    0x84: ("STY", 2, "zp"),      0x85: ("STA", 2, "zp"),
    0x86: ("STX", 2, "zp"),      0x88: ("DEY", 1, "impl"),    0x8A: ("TXA", 1, "impl"),
    0x8C: ("STY", 3, "abs"),     0x8D: ("STA", 3, "abs"),     0x8E: ("STX", 3, "abs"),
    0x90: ("BCC", 2, "rel"),     0x91: ("STA", 2, "indy"),    0x94: ("STY", 2, "zpx"),
    0x95: ("STA", 2, "zpx"),     0x96: ("STX", 2, "zpy"),     0x98: ("TYA", 1, "impl"),
    0x99: ("STA", 3, "absy"),    0x9A: ("TXS", 1, "impl"),    0x9D: ("STA", 3, "absx"),
    0xA0: ("LDY", 2, "imm"),     0xA1: ("LDA", 2, "indx"),    0xA2: ("LDX", 2, "imm"),
    0xA4: ("LDY", 2, "zp"),      0xA5: ("LDA", 2, "zp"),      0xA6: ("LDX", 2, "zp"),
    0xA8: ("TAY", 1, "impl"),    0xA9: ("LDA", 2, "imm"),     0xAA: ("TAX", 1, "impl"),
    0xAC: ("LDY", 3, "abs"),     0xAD: ("LDA", 3, "abs"),     0xAE: ("LDX", 3, "abs"),
    0xB0: ("BCS", 2, "rel"),     0xB1: ("LDA", 2, "indy"),    0xB4: ("LDY", 2, "zpx"),
    0xB5: ("LDA", 2, "zpx"),     0xB6: ("LDX", 2, "zpy"),     0xB8: ("CLV", 1, "impl"),
    0xB9: ("LDA", 3, "absy"),    0xBA: ("TSX", 1, "impl"),    0xBC: ("LDY", 3, "absx"),
    0xBD: ("LDA", 3, "absx"),    0xBE: ("LDX", 3, "absy"),    0xC0: ("CPY", 2, "imm"),
    0xC1: ("CMP", 2, "indx"),    0xC4: ("CPY", 2, "zp"),      0xC5: ("CMP", 2, "zp"),
    0xC6: ("DEC", 2, "zp"),      0xC8: ("INY", 1, "impl"),    0xC9: ("CMP", 2, "imm"),
    0xCA: ("DEX", 1, "impl"),    0xCC: ("CPY", 3, "abs"),     0xCD: ("CMP", 3, "abs"),
    0xCE: ("DEC", 3, "abs"),     0xD0: ("BNE", 2, "rel"),     0xD1: ("CMP", 2, "indy"),
    0xD5: ("CMP", 2, "zpx"),     0xD6: ("DEC", 2, "zpx"),     0xD8: ("CLD", 1, "impl"),
    0xD9: ("CMP", 3, "absy"),    0xDD: ("CMP", 3, "absx"),    0xDE: ("DEC", 3, "absx"),
    0xE0: ("CPX", 2, "imm"),     0xE1: ("SBC", 2, "indx"),    0xE4: ("CPX", 2, "zp"),
    0xE5: ("SBC", 2, "zp"),      0xE6: ("INC", 2, "zp"),      0xE8: ("INX", 1, "impl"),
    0xE9: ("SBC", 2, "imm"),     0xEA: ("NOP", 1, "impl"),    0xEC: ("CPX", 3, "abs"),
    0xED: ("SBC", 3, "abs"),     0xEE: ("INC", 3, "abs"),     0xF0: ("BEQ", 2, "rel"),
    0xF1: ("SBC", 2, "indy"),    0xF5: ("SBC", 2, "zpx"),     0xF6: ("INC", 2, "zpx"),
    0xF8: ("SED", 1, "impl"),    0xF9: ("SBC", 3, "absy"),    0xFD: ("SBC", 3, "absx"),
    0xFE: ("INC", 3, "absx"),
}

# Known labels
LABELS = {
    # PPU registers
    0x2000: "PPUCTRL",
    0x2001: "PPUMASK",
    0x2002: "PPUSTATUS",
    0x2003: "OAMADDR",
    0x2004: "OAMDATA",
    0x2005: "PPUSCROLL",
    0x2006: "PPUADDR",
    0x2007: "PPUDATA",
    0x4014: "OAMDMA",
    # RAM variables (discovered)
    0x0500: "mmc_bank_select",
    0x0501: "mmc_bank_data",
    0x0502: "nmi_jmp",
    0x0503: "nmi_handler_lo",
    0x0504: "nmi_handler_hi",
    0x0505: "ppuctrl_shadow",
    0x0506: "ppumask_shadow",
    0x0507: "current_bank",
    0x0508: "scroll_x",
    0x0509: "scroll_y",
    # Text-related (to discover)
    0x0554: "text_buffer",
}

# Text encoding (for decoding text in data)
TBL = {}
for i, c in enumerate("0123456789"):
    TBL[i + 1] = c
for i, c in enumerate("abcdefghijklmnopqrstuvwxyz"):
    TBL[i + 0x0B] = c
for i, c in enumerate("ABCDEFGHIJKLMNOPQRSTUVWXYZ"):
    TBL[i + 0x25] = c
TBL[0x00] = ' '
TBL[0x3F] = ':'
TBL[0x65] = "'"
TBL[0x66] = ','
TBL[0x67] = '.'
TBL[0x68] = '-'
TBL[0x69] = '!'
TBL[0x6A] = '?'
TBL[0x6B] = '('
TBL[0x6C] = ')'
TBL[0xFF] = '<END>'
TBL[0xFD] = '<LINE>'
TBL[0xFE] = '<FE>'

def decode_text(data, max_len=60):
    """Decode text bytes using TBL"""
    result = []
    for b in data[:max_len]:
        if b in TBL:
            result.append(TBL[b])
        elif b == 0xFF:
            result.append('<END>')
            break
        else:
            result.append(f'[{b:02X}]')
    return ''.join(result)

def load_rom():
    with open(ROM_PATH, 'rb') as f:
        return f.read()

def disassemble_range(rom_data, start_offset, end_offset, base_addr):
    """Disassemble a range of ROM with labels and comments"""
    output = []
    pos = start_offset
    local_labels = {}  # Discovered labels within this range

    # First pass: identify branch targets
    temp_pos = start_offset
    while temp_pos < end_offset:
        if temp_pos >= len(rom_data):
            break
        opcode = rom_data[temp_pos]
        if opcode not in OPCODES:
            temp_pos += 1
            continue
        name, size, mode = OPCODES[opcode]

        cpu_addr = base_addr + (temp_pos - start_offset)

        if mode == "rel" and size == 2 and temp_pos + 1 < len(rom_data):
            # Relative branch
            offset = rom_data[temp_pos + 1]
            if offset >= 0x80:
                offset -= 256
            target = cpu_addr + 2 + offset
            if base_addr <= target < base_addr + (end_offset - start_offset):
                local_labels[target] = f"loc_{target:04X}"
        elif mode == "abs" and size == 3 and temp_pos + 2 < len(rom_data):
            # Absolute address
            addr = rom_data[temp_pos + 1] | (rom_data[temp_pos + 2] << 8)
            if base_addr <= addr < base_addr + (end_offset - start_offset):
                if name in ("JMP", "JSR"):
                    local_labels[addr] = f"sub_{addr:04X}" if name == "JSR" else f"loc_{addr:04X}"

        temp_pos += size

    # Second pass: disassemble with labels
    while pos < end_offset:
        if pos >= len(rom_data):
            break

        cpu_addr = base_addr + (pos - start_offset)

        # Check for label
        if cpu_addr in local_labels:
            output.append(f"\n{local_labels[cpu_addr]}:")

        opcode = rom_data[pos]

        if opcode not in OPCODES:
            output.append(f"  ${cpu_addr:04X}  {opcode:02X}            .db  ${opcode:02X}")
            pos += 1
            continue

        name, size, mode = OPCODES[opcode]
        bytes_str = ' '.join(f'{rom_data[pos+i]:02X}' for i in range(size))
        bytes_str = bytes_str.ljust(8)

        # Format operand
        if size == 1:
            operand = ""
        elif size == 2:
            arg = rom_data[pos + 1]
            if mode == "imm":
                operand = f"#${arg:02X}"
                # Add comment for known values
                if arg in [0xFF, 0xFD, 0xFE, 0x22]:
                    code_names = {0xFF: "END", 0xFD: "LINE", 0xFE: "CTRL", 0x22: "POS"}
                    operand += f"  ; {code_names.get(arg, '')}"
            elif mode == "zp" or mode == "zpx" or mode == "zpy":
                if mode == "zpx":
                    operand = f"${arg:02X},X"
                elif mode == "zpy":
                    operand = f"${arg:02X},Y"
                else:
                    operand = f"${arg:02X}"
            elif mode == "indx":
                operand = f"(${arg:02X},X)"
            elif mode == "indy":
                operand = f"(${arg:02X}),Y"
            elif mode == "rel":
                # Relative branch
                offset = arg if arg < 0x80 else arg - 256
                target = cpu_addr + 2 + offset
                if target in local_labels:
                    operand = local_labels[target]
                else:
                    operand = f"${target:04X}"
            else:
                operand = f"${arg:02X}"
        elif size == 3:
            addr = rom_data[pos + 1] | (rom_data[pos + 2] << 8)
            if mode == "abs":
                if addr in LABELS:
                    operand = LABELS[addr]
                elif addr in local_labels:
                    operand = local_labels[addr]
                else:
                    operand = f"${addr:04X}"
            elif mode == "absx":
                if addr in LABELS:
                    operand = f"{LABELS[addr]},X"
                else:
                    operand = f"${addr:04X},X"
            elif mode == "absy":
                if addr in LABELS:
                    operand = f"{LABELS[addr]},Y"
                else:
                    operand = f"${addr:04X},Y"
            elif mode == "ind":
                operand = f"(${addr:04X})"
            else:
                operand = f"${addr:04X}"

        output.append(f"  ${cpu_addr:04X}  {bytes_str}   {name:4} {operand}")
        pos += size

    return '\n'.join(output)

def main():
    rom_data = load_rom()
    print(f"ROM loaded: {len(rom_data)} bytes")

    output = []
    output.append("; Dragon Warrior IV (NES) - Text Handler Disassembly")
    output.append("; Bank 22 ($8000-$BFFF when switched in)")
    output.append("; =" * 35)
    output.append("")

    # Bank 22 starts at offset 0x58010 (16 + 22*0x4000)
    BANK22_START = 16 + 22 * 0x4000  # 0x58010
    BANK22_END = BANK22_START + 0x4000

    # Known interesting addresses in Bank 22:
    # $8B1F - CMP #$FD handler (ROM 0x58B2F)
    # $B3F0 - Menu text (ROM 0x5B400)

    output.append("; " + "=" * 60)
    output.append("; TEXT CONTROL CODE HANDLER - $FD (LINE/CLEAR)")
    output.append("; Located at $8B1F (ROM 0x58B2F)")
    output.append("; " + "=" * 60)
    output.append("")

    # Disassemble around $8B1F
    handler_rom = 0x58B2F
    handler_cpu = 0x8B1F

    # Start a bit before to get context
    start = handler_rom - 0x40
    end = handler_rom + 0x80

    output.append(disassemble_range(rom_data, start, end, handler_cpu - 0x40))

    output.append("")
    output.append("; " + "=" * 60)
    output.append("; MENU TEXT DATA - $B3F0")
    output.append("; ROM offset 0x5B400")
    output.append("; " + "=" * 60)
    output.append("")

    # Show menu text
    text_rom = 0x5B400
    text_cpu = 0xB3F0

    output.append(f"; Menu text at ${text_cpu:04X}:")
    for offset in range(0, 0x100, 0x20):
        data = rom_data[text_rom + offset:text_rom + offset + 0x20]
        text = decode_text(data, 32)
        hex_str = ' '.join(f'{b:02X}' for b in data[:16])
        output.append(f";   +${offset:02X}: {hex_str}")
        output.append(f";        \"{text}\"")

    output.append("")
    output.append("; " + "=" * 60)
    output.append("; LOOKING FOR TEXT RENDERING ROUTINE")
    output.append("; Search for code that reads text and writes to PPU")
    output.append("; " + "=" * 60)
    output.append("")

    # Search Bank 22 for text rendering patterns
    # Look for: LDA indirect, CMP #$FF, STA $2007

    patterns_found = []
    for offset in range(BANK22_START, BANK22_END - 10):
        # LDA ($xx),Y followed soon by CMP
        if rom_data[offset] == 0xB1:  # LDA ($xx),Y
            zp = rom_data[offset + 1]
            for ahead in range(2, 20):
                if offset + ahead < BANK22_END:
                    if rom_data[offset + ahead] == 0xC9:  # CMP #imm
                        patterns_found.append({
                            'offset': offset,
                            'cpu': 0x8000 + (offset - BANK22_START),
                            'zp': zp,
                            'cmp_val': rom_data[offset + ahead + 1] if offset + ahead + 1 < BANK22_END else 0
                        })
                        break

    output.append(f"; Found {len(patterns_found)} LDA ($xx),Y patterns")
    output.append("")

    # Disassemble most promising ones
    for pattern in patterns_found[:5]:
        output.append(f"; Pattern at ${pattern['cpu']:04X}, pointer in ${pattern['zp']:02X}:")
        start = pattern['offset'] - 8
        end = pattern['offset'] + 48
        output.append(disassemble_range(rom_data, start, end, pattern['cpu'] - 8))
        output.append("")

    # Now search for JSR calls to PPU write routines
    output.append("; " + "=" * 60)
    output.append("; PPU WRITE LOCATIONS IN BANK 22")
    output.append("; " + "=" * 60)
    output.append("")

    ppu_writes = []
    for offset in range(BANK22_START, BANK22_END - 2):
        # STA $2007 (PPUDATA)
        if rom_data[offset:offset+3] == bytes([0x8D, 0x07, 0x20]):
            cpu = 0x8000 + (offset - BANK22_START)
            ppu_writes.append({'offset': offset, 'cpu': cpu})

    output.append(f"; Found {len(ppu_writes)} STA PPUDATA in Bank 22")
    for pw in ppu_writes[:10]:
        output.append(f";   ${pw['cpu']:04X}")
        # Disassemble around it
        start = pw['offset'] - 16
        end = pw['offset'] + 16
        output.append(disassemble_range(rom_data, start, end, pw['cpu'] - 16))
        output.append("")

    # Save output
    output_path = os.path.join(os.path.dirname(__file__), '..', 'docs', 'disassembly',
                               'bank22_text.asm')
    os.makedirs(os.path.dirname(output_path), exist_ok=True)

    with open(output_path, 'w') as f:
        f.write('\n'.join(output))

    print(f"\nSaved to: {output_path}")
    print("\n" + "=" * 60)
    print("SUMMARY")
    print("=" * 60)
    print(f"Bank 22 text patterns: {len(patterns_found)}")
    print(f"Bank 22 PPU writes: {len(ppu_writes)}")

if __name__ == '__main__':
    main()
