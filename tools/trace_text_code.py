#!/usr/bin/env python3
"""
Trace DW4 text rendering code to understand compression format.

The potential DTE table is at ROM 0x5B3B4 (Bank 22, CPU $B3A4).
We need to find what code references this address.
"""

ROM_PATH = r"c:\Users\me\source\repos\dragon-warrior-4-info\roms\Dragon Warrior IV (1992-10)(Enix)(US).nes"

def find_address_references(rom, bank_start, bank_end, target_addr):
    """Find code that references a specific CPU address."""
    results = []

    # Look for LDA $XXXX, LDX $XXXX, LDY $XXXX patterns
    lo = target_addr & 0xFF
    hi = (target_addr >> 8) & 0xFF

    for offset in range(bank_start, bank_end - 2):
        opcode = rom[offset]

        # Absolute addressing: LDA $XXXX (AD), LDX $XXXX (AE), LDY $XXXX (AC)
        # STA $XXXX (8D), STX $XXXX (8E), STY $XXXX (8C)
        if opcode in [0xAD, 0xAE, 0xAC, 0x8D, 0x8E, 0x8C]:
            if rom[offset + 1] == lo and rom[offset + 2] == hi:
                bank_offset = (offset - bank_start)
                cpu_addr = 0x8000 + bank_offset
                results.append((offset, cpu_addr, opcode))

        # Indexed absolute: LDA $XXXX,X (BD), LDA $XXXX,Y (B9)
        if opcode in [0xBD, 0xB9]:
            if rom[offset + 1] == lo and rom[offset + 2] == hi:
                bank_offset = (offset - bank_start)
                cpu_addr = 0x8000 + bank_offset
                results.append((offset, cpu_addr, opcode))

    return results

def disassemble_context(rom, offset, lines_before=5, lines_after=10):
    """Simple disassembly of context around an offset."""
    # Opcode lengths (simplified)
    opcode_lengths = {
        # 1-byte instructions
        0x00: 1, 0x08: 1, 0x0A: 1, 0x18: 1, 0x28: 1, 0x2A: 1, 0x38: 1, 0x40: 1,
        0x48: 1, 0x4A: 1, 0x58: 1, 0x60: 1, 0x68: 1, 0x6A: 1, 0x78: 1, 0x88: 1,
        0x8A: 1, 0x98: 1, 0x9A: 1, 0xA8: 1, 0xAA: 1, 0xB8: 1, 0xBA: 1, 0xC8: 1,
        0xCA: 1, 0xD8: 1, 0xE8: 1, 0xEA: 1, 0xF8: 1, 0xFA: 1,
    }

    opcode_names = {
        0xA9: "LDA #", 0xA5: "LDA zp", 0xB5: "LDA zp,X", 0xAD: "LDA abs",
        0xBD: "LDA abs,X", 0xB9: "LDA abs,Y", 0xA1: "LDA (zp,X)", 0xB1: "LDA (zp),Y",
        0x85: "STA zp", 0x95: "STA zp,X", 0x8D: "STA abs", 0x9D: "STA abs,X",
        0x99: "STA abs,Y", 0x81: "STA (zp,X)", 0x91: "STA (zp),Y",
        0xA2: "LDX #", 0xA6: "LDX zp", 0xAE: "LDX abs", 0xA0: "LDY #",
        0xA4: "LDY zp", 0xAC: "LDY abs",
        0x86: "STX zp", 0x8E: "STX abs", 0x84: "STY zp", 0x8C: "STY abs",
        0xE6: "INC zp", 0xEE: "INC abs", 0xC6: "DEC zp", 0xCE: "DEC abs",
        0xE8: "INX", 0xCA: "DEX", 0xC8: "INY", 0x88: "DEY",
        0x18: "CLC", 0x38: "SEC", 0x58: "CLI", 0x78: "SEI", 0xD8: "CLD", 0xF8: "SED",
        0xAA: "TAX", 0x8A: "TXA", 0xA8: "TAY", 0x98: "TYA", 0x9A: "TXS", 0xBA: "TSX",
        0x48: "PHA", 0x68: "PLA", 0x08: "PHP", 0x28: "PLP",
        0xC9: "CMP #", 0xC5: "CMP zp", 0xCD: "CMP abs", 0xE0: "CPX #", 0xE4: "CPX zp",
        0xEC: "CPX abs", 0xC0: "CPY #", 0xC4: "CPY zp", 0xCC: "CPY abs",
        0x29: "AND #", 0x25: "AND zp", 0x2D: "AND abs",
        0x09: "ORA #", 0x05: "ORA zp", 0x0D: "ORA abs",
        0x49: "EOR #", 0x45: "EOR zp", 0x4D: "EOR abs",
        0x0A: "ASL A", 0x06: "ASL zp", 0x0E: "ASL abs",
        0x4A: "LSR A", 0x46: "LSR zp", 0x4E: "LSR abs",
        0x2A: "ROL A", 0x26: "ROL zp", 0x2E: "ROL abs",
        0x6A: "ROR A", 0x66: "ROR zp", 0x6E: "ROR abs",
        0x69: "ADC #", 0x65: "ADC zp", 0x6D: "ADC abs",
        0xE9: "SBC #", 0xE5: "SBC zp", 0xED: "SBC abs",
        0x4C: "JMP abs", 0x6C: "JMP (abs)",
        0x20: "JSR abs", 0x60: "RTS", 0x40: "RTI",
        0x90: "BCC", 0xB0: "BCS", 0xF0: "BEQ", 0xD0: "BNE",
        0x10: "BPL", 0x30: "BMI", 0x50: "BVC", 0x70: "BVS",
        0xEA: "NOP", 0x00: "BRK",
    }

    result = []
    pos = offset

    # Decode forward
    for _ in range(lines_after):
        if pos >= len(rom):
            break
        opcode = rom[pos]
        name = opcode_names.get(opcode, f"???({opcode:02X})")

        # Determine length
        if opcode in opcode_lengths:
            length = opcode_lengths[opcode]
        elif opcode in [0x09, 0x29, 0x49, 0x69, 0xA0, 0xA2, 0xA9, 0xC0, 0xC9, 0xE0, 0xE9]:
            length = 2  # Immediate
        elif opcode & 0x1F in [0x00, 0x04, 0x05, 0x06, 0x14, 0x15, 0x16]:
            length = 2  # Zero page
        elif opcode in [0x90, 0xB0, 0xF0, 0xD0, 0x10, 0x30, 0x50, 0x70]:
            length = 2  # Branch
        elif opcode & 0x1F in [0x0C, 0x0D, 0x0E, 0x19, 0x1D, 0x1E]:
            length = 3  # Absolute
        elif opcode in [0x20, 0x4C]:
            length = 3  # JSR, JMP
        else:
            length = 1

        # Format instruction
        if length == 1:
            line = f"  {name}"
        elif length == 2:
            operand = rom[pos + 1]
            if opcode in [0x90, 0xB0, 0xF0, 0xD0, 0x10, 0x30, 0x50, 0x70]:
                # Branch - calculate target
                target = pos + 2 + (operand if operand < 128 else operand - 256)
                line = f"  {name} ${target:04X}"
            else:
                line = f"  {name}${operand:02X}"
        else:
            lo = rom[pos + 1]
            hi = rom[pos + 2]
            addr = lo + (hi << 8)
            line = f"  {name}${addr:04X}"

        marker = ">>>" if pos == offset else "   "
        result.append(f"{marker} ${pos & 0x3FFF | 0x8000:04X}: {line}")
        pos += length

    return '\n'.join(result)

def main():
    with open(ROM_PATH, 'rb') as f:
        rom = f.read()

    print("=" * 70)
    print("DW4 TEXT RENDERING CODE ANALYSIS")
    print("=" * 70)

    # Bank 22 contains both the DTE table and text rendering code
    bank22_start = 0x58010
    bank22_end = 0x5C010

    # Target address: $B3A4 (DTE table)
    dte_table_addr = 0xB3A4

    print(f"\nSearching for references to DTE table at ${dte_table_addr:04X}...")
    refs = find_address_references(rom, bank22_start, bank22_end, dte_table_addr)

    for rom_off, cpu_addr, opcode in refs:
        print(f"\nFound reference at ${cpu_addr:04X} (opcode ${opcode:02X}):")
        print(disassemble_context(rom, rom_off))

    # Also search nearby addresses (table might be referenced with offset)
    for offset in range(-10, 10, 2):
        addr = dte_table_addr + offset
        refs = find_address_references(rom, bank22_start, bank22_end, addr)
        if refs and offset != 0:
            print(f"\nReferences to ${addr:04X} (offset {offset} from DTE table):")
            for rom_off, cpu_addr, opcode in refs:
                print(f"  ${cpu_addr:04X}")

    # Now let's look for the text control code handler we found earlier
    # Bank 22 $8B11 had control code checking
    print("\n" + "=" * 70)
    print("TEXT CONTROL CODE HANDLER (Bank 22 $8B11)")
    print("=" * 70)

    # CPU $8B11 = Bank offset $0B01 = ROM 0x58010 + 0x0B01 = 0x58B11
    handler_rom = 0x58010 + 0x0B11
    print(disassemble_context(rom, handler_rom, lines_before=5, lines_after=30))

    # Look for text reading routines - LDA (ptr),Y pattern
    print("\n" + "=" * 70)
    print("SEARCHING FOR TEXT POINTER READING PATTERNS")
    print("=" * 70)

    # LDA (zp),Y = $B1
    text_read_patterns = []
    for offset in range(bank22_start, bank22_end - 5):
        if rom[offset] == 0xB1:  # LDA (zp),Y
            # Check if followed by comparison or storage
            next_ops = rom[offset+2:offset+6]
            # Look for pattern: LDA (ptr),Y / CMP #$xx or LDA (ptr),Y / STA zp
            if next_ops[0] in [0xC9, 0x85, 0x91, 0xF0, 0xD0, 0x90, 0xB0]:
                bank_offset = offset - bank22_start
                cpu_addr = 0x8000 + bank_offset
                text_read_patterns.append((offset, cpu_addr, rom[offset+1]))

    print(f"Found {len(text_read_patterns)} LDA (zp),Y patterns in Bank 22")
    for rom_off, cpu_addr, zp_addr in text_read_patterns[:10]:
        print(f"\n${cpu_addr:04X}: LDA (${zp_addr:02X}),Y")
        print(disassemble_context(rom, rom_off, lines_after=8))

if __name__ == "__main__":
    main()
