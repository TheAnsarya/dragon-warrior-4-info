#!/usr/bin/env python3
"""
Dragon Warrior IV - Text Engine Disassembler

Disassemble and annotate the text rendering code to understand:
1. How text is loaded from ROM
2. How control codes are processed
3. How DTE/dictionary compression works (if any)
4. How text is written to PPU
"""

import os

ROM_PATH = os.path.join(os.path.dirname(__file__), '..', 'roms',
                        'Dragon Warrior IV (1992-10)(Enix)(US).nes')

# 6502 Opcode definitions: (mnemonic, addressing_mode, size)
OPCODES = {
    0x00: ("BRK", "impl", 1),
    0x01: ("ORA", "indx", 2),
    0x05: ("ORA", "zp", 2),
    0x06: ("ASL", "zp", 2),
    0x08: ("PHP", "impl", 1),
    0x09: ("ORA", "imm", 2),
    0x0A: ("ASL", "acc", 1),
    0x0D: ("ORA", "abs", 3),
    0x0E: ("ASL", "abs", 3),
    0x10: ("BPL", "rel", 2),
    0x11: ("ORA", "indy", 2),
    0x15: ("ORA", "zpx", 2),
    0x16: ("ASL", "zpx", 2),
    0x18: ("CLC", "impl", 1),
    0x19: ("ORA", "absy", 3),
    0x1D: ("ORA", "absx", 3),
    0x1E: ("ASL", "absx", 3),
    0x20: ("JSR", "abs", 3),
    0x21: ("AND", "indx", 2),
    0x24: ("BIT", "zp", 2),
    0x25: ("AND", "zp", 2),
    0x26: ("ROL", "zp", 2),
    0x28: ("PLP", "impl", 1),
    0x29: ("AND", "imm", 2),
    0x2A: ("ROL", "acc", 1),
    0x2C: ("BIT", "abs", 3),
    0x2D: ("AND", "abs", 3),
    0x2E: ("ROL", "abs", 3),
    0x30: ("BMI", "rel", 2),
    0x31: ("AND", "indy", 2),
    0x35: ("AND", "zpx", 2),
    0x36: ("ROL", "zpx", 2),
    0x38: ("SEC", "impl", 1),
    0x39: ("AND", "absy", 3),
    0x3D: ("AND", "absx", 3),
    0x3E: ("ROL", "absx", 3),
    0x40: ("RTI", "impl", 1),
    0x41: ("EOR", "indx", 2),
    0x45: ("EOR", "zp", 2),
    0x46: ("LSR", "zp", 2),
    0x48: ("PHA", "impl", 1),
    0x49: ("EOR", "imm", 2),
    0x4A: ("LSR", "acc", 1),
    0x4C: ("JMP", "abs", 3),
    0x4D: ("EOR", "abs", 3),
    0x4E: ("LSR", "abs", 3),
    0x50: ("BVC", "rel", 2),
    0x51: ("EOR", "indy", 2),
    0x55: ("EOR", "zpx", 2),
    0x56: ("LSR", "zpx", 2),
    0x58: ("CLI", "impl", 1),
    0x59: ("EOR", "absy", 3),
    0x5D: ("EOR", "absx", 3),
    0x5E: ("LSR", "absx", 3),
    0x60: ("RTS", "impl", 1),
    0x61: ("ADC", "indx", 2),
    0x65: ("ADC", "zp", 2),
    0x66: ("ROR", "zp", 2),
    0x68: ("PLA", "impl", 1),
    0x69: ("ADC", "imm", 2),
    0x6A: ("ROR", "acc", 1),
    0x6C: ("JMP", "ind", 3),
    0x6D: ("ADC", "abs", 3),
    0x6E: ("ROR", "abs", 3),
    0x70: ("BVS", "rel", 2),
    0x71: ("ADC", "indy", 2),
    0x75: ("ADC", "zpx", 2),
    0x76: ("ROR", "zpx", 2),
    0x78: ("SEI", "impl", 1),
    0x79: ("ADC", "absy", 3),
    0x7D: ("ADC", "absx", 3),
    0x7E: ("ROR", "absx", 3),
    0x81: ("STA", "indx", 2),
    0x84: ("STY", "zp", 2),
    0x85: ("STA", "zp", 2),
    0x86: ("STX", "zp", 2),
    0x88: ("DEY", "impl", 1),
    0x8A: ("TXA", "impl", 1),
    0x8C: ("STY", "abs", 3),
    0x8D: ("STA", "abs", 3),
    0x8E: ("STX", "abs", 3),
    0x90: ("BCC", "rel", 2),
    0x91: ("STA", "indy", 2),
    0x94: ("STY", "zpx", 2),
    0x95: ("STA", "zpx", 2),
    0x96: ("STX", "zpy", 2),
    0x98: ("TYA", "impl", 1),
    0x99: ("STA", "absy", 3),
    0x9A: ("TXS", "impl", 1),
    0x9D: ("STA", "absx", 3),
    0xA0: ("LDY", "imm", 2),
    0xA1: ("LDA", "indx", 2),
    0xA2: ("LDX", "imm", 2),
    0xA4: ("LDY", "zp", 2),
    0xA5: ("LDA", "zp", 2),
    0xA6: ("LDX", "zp", 2),
    0xA8: ("TAY", "impl", 1),
    0xA9: ("LDA", "imm", 2),
    0xAA: ("TAX", "impl", 1),
    0xAC: ("LDY", "abs", 3),
    0xAD: ("LDA", "abs", 3),
    0xAE: ("LDX", "abs", 3),
    0xB0: ("BCS", "rel", 2),
    0xB1: ("LDA", "indy", 2),
    0xB4: ("LDY", "zpx", 2),
    0xB5: ("LDA", "zpx", 2),
    0xB6: ("LDX", "zpy", 2),
    0xB8: ("CLV", "impl", 1),
    0xB9: ("LDA", "absy", 3),
    0xBA: ("TSX", "impl", 1),
    0xBC: ("LDY", "absx", 3),
    0xBD: ("LDA", "absx", 3),
    0xBE: ("LDX", "absy", 3),
    0xC0: ("CPY", "imm", 2),
    0xC1: ("CMP", "indx", 2),
    0xC4: ("CPY", "zp", 2),
    0xC5: ("CMP", "zp", 2),
    0xC6: ("DEC", "zp", 2),
    0xC8: ("INY", "impl", 1),
    0xC9: ("CMP", "imm", 2),
    0xCA: ("DEX", "impl", 1),
    0xCC: ("CPY", "abs", 3),
    0xCD: ("CMP", "abs", 3),
    0xCE: ("DEC", "abs", 3),
    0xD0: ("BNE", "rel", 2),
    0xD1: ("CMP", "indy", 2),
    0xD5: ("CMP", "zpx", 2),
    0xD6: ("DEC", "zpx", 2),
    0xD8: ("CLD", "impl", 1),
    0xD9: ("CMP", "absy", 3),
    0xDD: ("CMP", "absx", 3),
    0xDE: ("DEC", "absx", 3),
    0xE0: ("CPX", "imm", 2),
    0xE1: ("SBC", "indx", 2),
    0xE4: ("CPX", "zp", 2),
    0xE5: ("SBC", "zp", 2),
    0xE6: ("INC", "zp", 2),
    0xE8: ("INX", "impl", 1),
    0xE9: ("SBC", "imm", 2),
    0xEA: ("NOP", "impl", 1),
    0xEC: ("CPX", "abs", 3),
    0xED: ("SBC", "abs", 3),
    0xEE: ("INC", "abs", 3),
    0xF0: ("BEQ", "rel", 2),
    0xF1: ("SBC", "indy", 2),
    0xF5: ("SBC", "zpx", 2),
    0xF6: ("INC", "zpx", 2),
    0xF8: ("SED", "impl", 1),
    0xF9: ("SBC", "absy", 3),
    0xFD: ("SBC", "absx", 3),
    0xFE: ("INC", "absx", 3),
}

# Known labels for annotation
LABELS = {
    # Zero page
    0x10: "text_ptr_lo",
    0x11: "text_ptr_hi",
    0xEE: "text_data_lo",
    0xEF: "text_data_hi",
    0xF5: "text_flags",
    0xF7: "text_temp",
    0xF8: "current_char",
    # RAM
    0x03D4: "text_ppu_addr",
    0x03D9: "text_line_ctr",
    0x07B4: "text_state",
    # PPU
    0x2006: "PPUADDR",
    0x2007: "PPUDATA",
}

def load_rom():
    with open(ROM_PATH, 'rb') as f:
        return f.read()

def cpu_to_rom(cpu_addr, bank):
    """Convert CPU address to ROM offset."""
    if cpu_addr >= 0xC000:
        # Fixed bank (bank 31)
        return 0x7C010 + (cpu_addr - 0xC000)
    else:
        # Switchable bank
        return 0x10 + (bank * 0x4000) + (cpu_addr - 0x8000)

def format_operand(mode, rom_data, offset, pc):
    """Format operand based on addressing mode."""
    if mode == "impl" or mode == "acc":
        return "", 0
    elif mode == "imm":
        val = rom_data[offset]
        return f"#${val:02X}", 1
    elif mode == "zp":
        val = rom_data[offset]
        label = LABELS.get(val, f"${val:02X}")
        return label, 1
    elif mode == "zpx":
        val = rom_data[offset]
        label = LABELS.get(val, f"${val:02X}")
        return f"{label},X", 1
    elif mode == "zpy":
        val = rom_data[offset]
        label = LABELS.get(val, f"${val:02X}")
        return f"{label},Y", 1
    elif mode == "abs":
        lo = rom_data[offset]
        hi = rom_data[offset + 1]
        addr = lo | (hi << 8)
        label = LABELS.get(addr, f"${addr:04X}")
        return label, 2
    elif mode == "absx":
        lo = rom_data[offset]
        hi = rom_data[offset + 1]
        addr = lo | (hi << 8)
        label = LABELS.get(addr, f"${addr:04X}")
        return f"{label},X", 2
    elif mode == "absy":
        lo = rom_data[offset]
        hi = rom_data[offset + 1]
        addr = lo | (hi << 8)
        label = LABELS.get(addr, f"${addr:04X}")
        return f"{label},Y", 2
    elif mode == "ind":
        lo = rom_data[offset]
        hi = rom_data[offset + 1]
        addr = lo | (hi << 8)
        return f"(${addr:04X})", 2
    elif mode == "indx":
        val = rom_data[offset]
        label = LABELS.get(val, f"${val:02X}")
        return f"({label},X)", 1
    elif mode == "indy":
        val = rom_data[offset]
        label = LABELS.get(val, f"${val:02X}")
        return f"({label}),Y", 1
    elif mode == "rel":
        val = rom_data[offset]
        if val >= 128:
            val = val - 256
        target = pc + 2 + val
        return f"${target:04X}", 1
    return "???", 0

def disassemble(rom_data, start_addr, length, bank):
    """Disassemble code from ROM."""
    rom_offset = cpu_to_rom(start_addr, bank)
    lines = []
    pc = start_addr
    i = 0

    while i < length:
        addr = pc
        opcode = rom_data[rom_offset + i]

        if opcode in OPCODES:
            mnemonic, mode, size = OPCODES[opcode]

            # Get operand bytes for hex dump
            hex_bytes = [f"{rom_data[rom_offset + i + j]:02X}" for j in range(size)]
            hex_str = ' '.join(hex_bytes).ljust(8)

            # Format operand
            operand, _ = format_operand(mode, rom_data, rom_offset + i + 1, pc)

            # Build instruction string
            if operand:
                instr = f"{mnemonic} {operand}"
            else:
                instr = mnemonic

            lines.append((addr, hex_str, instr))
            i += size
            pc += size
        else:
            # Unknown opcode - treat as data
            hex_str = f"{opcode:02X}".ljust(8)
            lines.append((addr, hex_str, f".byte ${opcode:02X}"))
            i += 1
            pc += 1

    return lines

def print_disasm(lines, title=""):
    """Print disassembly with formatting."""
    if title:
        print(f"\n{'='*60}")
        print(f" {title}")
        print(f"{'='*60}")

    for addr, hex_str, instr in lines:
        print(f"${addr:04X}: {hex_str} {instr}")

def main():
    rom_data = load_rom()

    print("Dragon Warrior IV - Text Engine Disassembly")
    print("=" * 60)

    # Bank 22's text processing is the key
    # Let's look at where ($EE),Y is used to read text data
    print("\n" + "="*60)
    print(" Bank 22 - Looking for text data reads via ($EE),Y")
    print("="*60)

    # Search for B1 EE (LDA ($EE),Y) in Bank 22
    rom_offset = cpu_to_rom(0x8000, 22)
    for i in range(0x4000):
        if rom_data[rom_offset + i] == 0xB1 and rom_data[rom_offset + i + 1] == 0xEE:
            cpu_addr = 0x8000 + i
            # Context: 4 bytes before and after
            start = max(0, i - 4)
            end = min(0x4000, i + 8)
            context = ' '.join(f'{rom_data[rom_offset+start+j]:02X}' for j in range(end - start))
            print(f"${cpu_addr:04X}: LDA ($EE),Y  Context: {context}")

    # Let's look at $95AF which was called from the text loop
    print_disasm(
        disassemble(rom_data, 0x95AF, 0x60, 22),
        "Bank 22 - Text Read Loop $95AF"
    )

    # And $95FF
    print_disasm(
        disassemble(rom_data, 0x95FF, 0x50, 22),
        "Bank 22 - Text Handler $95FF"
    )

    # Let's find where the actual character decoding happens
    # The text byte is in $F8, and we know $80+ are special
    print("\n" + "="*60)
    print(" Looking for DTE decoding (checks for >= $80)")
    print("="*60)

    # Search for CMP #$80 (C9 80) in Bank 22
    for i in range(0x4000):
        if rom_data[rom_offset + i] == 0xC9 and rom_data[rom_offset + i + 1] == 0x80:
            cpu_addr = 0x8000 + i
            # Context
            start = max(0, i - 4)
            end = min(0x4000, i + 8)
            context = ' '.join(f'{rom_data[rom_offset+start+j]:02X}' for j in range(end - start))
            print(f"${cpu_addr:04X}: CMP #$80  Context: {context}")

if __name__ == '__main__':
    main()

if __name__ == '__main__':
    main()
