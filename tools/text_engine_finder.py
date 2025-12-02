#!/usr/bin/env python3
"""
Dragon Warrior IV - Text Engine Finder
Find the text rendering/display code by looking for:
1. References to known text addresses
2. Common text engine patterns
3. Control code handlers ($FF, $FD, $FE, $22)
"""

import os
import struct

ROM_PATH = os.path.join(os.path.dirname(__file__), '..', 'roms',
                        'Dragon Warrior IV (1992-10)(Enix)(US).nes')

# Known text locations (ROM offsets)
KNOWN_TEXT = {
    0x5b400: "Menu text (ERASE NAME, battle commands)",
    0x6e674: "Chapter titles",
    0x4a698: "Spell/item names (Outside)",
}

# Text encoding
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

def load_rom():
    with open(ROM_PATH, 'rb') as f:
        return f.read()

def rom_to_cpu(rom_offset, bank_size=0x4000):
    """Convert ROM offset to CPU address (assumes $8000-$BFFF or $C000-$FFFF)"""
    if rom_offset < 16:
        return None  # Header
    rom_offset -= 16  # Remove header

    # For 512KB ROM, last bank is always at $C000-$FFFF
    rom_size = 524288
    last_bank_start = rom_size - 0x4000  # 0x78000

    if rom_offset >= last_bank_start:
        # Fixed bank at $C000-$FFFF
        return 0xC000 + (rom_offset - last_bank_start)
    else:
        # Switchable bank at $8000-$BFFF
        bank_offset = rom_offset % 0x4000
        return 0x8000 + bank_offset

def cpu_to_rom(cpu_addr, bank=None):
    """Convert CPU address to ROM offset"""
    if 0xC000 <= cpu_addr <= 0xFFFF:
        # Fixed bank (last 16KB)
        return 16 + 0x78000 + (cpu_addr - 0xC000)
    elif 0x8000 <= cpu_addr <= 0xBFFF and bank is not None:
        # Switchable bank
        return 16 + (bank * 0x4000) + (cpu_addr - 0x8000)
    return None

def find_pointer_references(rom_data, target_addr, search_range=None):
    """Find places in ROM that contain a 16-bit pointer to target_addr"""
    lo = target_addr & 0xFF
    hi = (target_addr >> 8) & 0xFF

    results = []
    start = search_range[0] if search_range else 16
    end = search_range[1] if search_range else len(rom_data)

    for offset in range(start, end - 1):
        if rom_data[offset] == lo and rom_data[offset + 1] == hi:
            results.append(offset)

    return results

def disassemble_at(rom_data, rom_offset, num_bytes=64):
    """Simple disassembly at a ROM offset"""
    # 6502 opcode lengths
    OPCODE_LEN = {
        0x00: 1, 0x01: 2, 0x05: 2, 0x06: 2, 0x08: 1, 0x09: 2, 0x0A: 1,
        0x0D: 3, 0x0E: 3, 0x10: 2, 0x11: 2, 0x15: 2, 0x16: 2, 0x18: 1,
        0x19: 3, 0x1D: 3, 0x1E: 3, 0x20: 3, 0x21: 2, 0x24: 2, 0x25: 2,
        0x26: 2, 0x28: 1, 0x29: 2, 0x2A: 1, 0x2C: 3, 0x2D: 3, 0x2E: 3,
        0x30: 2, 0x31: 2, 0x35: 2, 0x36: 2, 0x38: 1, 0x39: 3, 0x3D: 3,
        0x3E: 3, 0x40: 1, 0x41: 2, 0x45: 2, 0x46: 2, 0x48: 1, 0x49: 2,
        0x4A: 1, 0x4C: 3, 0x4D: 3, 0x4E: 3, 0x50: 2, 0x51: 2, 0x55: 2,
        0x56: 2, 0x58: 1, 0x59: 3, 0x5D: 3, 0x5E: 3, 0x60: 1, 0x61: 2,
        0x65: 2, 0x66: 2, 0x68: 1, 0x69: 2, 0x6A: 1, 0x6C: 3, 0x6D: 3,
        0x6E: 3, 0x70: 2, 0x71: 2, 0x75: 2, 0x76: 2, 0x78: 1, 0x79: 3,
        0x7D: 3, 0x7E: 3, 0x81: 2, 0x84: 2, 0x85: 2, 0x86: 2, 0x88: 1,
        0x8A: 1, 0x8C: 3, 0x8D: 3, 0x8E: 3, 0x90: 2, 0x91: 2, 0x94: 2,
        0x95: 2, 0x96: 2, 0x98: 1, 0x99: 3, 0x9A: 1, 0x9D: 3, 0xA0: 2,
        0xA1: 2, 0xA2: 2, 0xA4: 2, 0xA5: 2, 0xA6: 2, 0xA8: 1, 0xA9: 2,
        0xAA: 1, 0xAC: 3, 0xAD: 3, 0xAE: 3, 0xB0: 2, 0xB1: 2, 0xB4: 2,
        0xB5: 2, 0xB6: 2, 0xB8: 1, 0xB9: 3, 0xBA: 1, 0xBC: 3, 0xBD: 3,
        0xBE: 3, 0xC0: 2, 0xC1: 2, 0xC4: 2, 0xC5: 2, 0xC6: 2, 0xC8: 1,
        0xC9: 2, 0xCA: 1, 0xCC: 3, 0xCD: 3, 0xCE: 3, 0xD0: 2, 0xD1: 2,
        0xD5: 2, 0xD6: 2, 0xD8: 1, 0xD9: 3, 0xDD: 3, 0xDE: 3, 0xE0: 2,
        0xE1: 2, 0xE4: 2, 0xE5: 2, 0xE6: 2, 0xE8: 1, 0xE9: 2, 0xEA: 1,
        0xEC: 3, 0xED: 3, 0xEE: 3, 0xF0: 2, 0xF1: 2, 0xF5: 2, 0xF6: 2,
        0xF8: 1, 0xF9: 3, 0xFD: 3, 0xFE: 3,
    }

    OPCODE_NAMES = {
        0x00: "BRK", 0x01: "ORA", 0x05: "ORA", 0x06: "ASL", 0x08: "PHP", 0x09: "ORA", 0x0A: "ASL",
        0x0D: "ORA", 0x0E: "ASL", 0x10: "BPL", 0x11: "ORA", 0x15: "ORA", 0x16: "ASL", 0x18: "CLC",
        0x19: "ORA", 0x1D: "ORA", 0x1E: "ASL", 0x20: "JSR", 0x21: "AND", 0x24: "BIT", 0x25: "AND",
        0x26: "ROL", 0x28: "PLP", 0x29: "AND", 0x2A: "ROL", 0x2C: "BIT", 0x2D: "AND", 0x2E: "ROL",
        0x30: "BMI", 0x31: "AND", 0x35: "AND", 0x36: "ROL", 0x38: "SEC", 0x39: "AND", 0x3D: "AND",
        0x3E: "ROL", 0x40: "RTI", 0x41: "EOR", 0x45: "EOR", 0x46: "LSR", 0x48: "PHA", 0x49: "EOR",
        0x4A: "LSR", 0x4C: "JMP", 0x4D: "EOR", 0x4E: "LSR", 0x50: "BVC", 0x51: "EOR", 0x55: "EOR",
        0x56: "LSR", 0x58: "CLI", 0x59: "EOR", 0x5D: "EOR", 0x5E: "LSR", 0x60: "RTS", 0x61: "ADC",
        0x65: "ADC", 0x66: "ROR", 0x68: "PLA", 0x69: "ADC", 0x6A: "ROR", 0x6C: "JMP", 0x6D: "ADC",
        0x6E: "ROR", 0x70: "BVS", 0x71: "ADC", 0x75: "ADC", 0x76: "ROR", 0x78: "SEI", 0x79: "ADC",
        0x7D: "ADC", 0x7E: "ROR", 0x81: "STA", 0x84: "STY", 0x85: "STA", 0x86: "STX", 0x88: "DEY",
        0x8A: "TXA", 0x8C: "STY", 0x8D: "STA", 0x8E: "STX", 0x90: "BCC", 0x91: "STA", 0x94: "STY",
        0x95: "STA", 0x96: "STX", 0x98: "TYA", 0x99: "STA", 0x9A: "TXS", 0x9D: "STA", 0xA0: "LDY",
        0xA1: "LDA", 0xA2: "LDX", 0xA4: "LDY", 0xA5: "LDA", 0xA6: "LDX", 0xA8: "TAY", 0xA9: "LDA",
        0xAA: "TAX", 0xAC: "LDY", 0xAD: "LDA", 0xAE: "LDX", 0xB0: "BCS", 0xB1: "LDA", 0xB4: "LDY",
        0xB5: "LDA", 0xB6: "LDX", 0xB8: "CLV", 0xB9: "LDA", 0xBA: "TSX", 0xBC: "LDY", 0xBD: "LDA",
        0xBE: "LDX", 0xC0: "CPY", 0xC1: "CMP", 0xC4: "CPY", 0xC5: "CMP", 0xC6: "DEC", 0xC8: "INY",
        0xC9: "CMP", 0xCA: "DEX", 0xCC: "CPY", 0xCD: "CMP", 0xCE: "DEC", 0xD0: "BNE", 0xD1: "CMP",
        0xD5: "CMP", 0xD6: "DEC", 0xD8: "CLD", 0xD9: "CMP", 0xDD: "CMP", 0xDE: "DEC", 0xE0: "CPX",
        0xE1: "SBC", 0xE4: "CPX", 0xE5: "SBC", 0xE6: "INC", 0xE8: "INX", 0xE9: "SBC", 0xEA: "NOP",
        0xEC: "CPX", 0xED: "SBC", 0xEE: "INC", 0xF0: "BEQ", 0xF1: "SBC", 0xF5: "SBC", 0xF6: "INC",
        0xF8: "SED", 0xF9: "SBC", 0xFD: "SBC", 0xFE: "INC",
    }

    lines = []
    pos = rom_offset
    cpu_base = rom_to_cpu(rom_offset)

    bytes_read = 0
    while bytes_read < num_bytes and pos < len(rom_data):
        opcode = rom_data[pos]
        op_len = OPCODE_LEN.get(opcode, 1)
        op_name = OPCODE_NAMES.get(opcode, f".db ${opcode:02X}")

        cpu_addr = cpu_base + bytes_read if cpu_base else pos

        if op_len == 1:
            lines.append(f"  ${cpu_addr:04X}  {opcode:02X}            {op_name}")
        elif op_len == 2:
            arg = rom_data[pos + 1] if pos + 1 < len(rom_data) else 0
            lines.append(f"  ${cpu_addr:04X}  {opcode:02X} {arg:02X}         {op_name}  ${arg:02X}")
        elif op_len == 3:
            lo = rom_data[pos + 1] if pos + 1 < len(rom_data) else 0
            hi = rom_data[pos + 2] if pos + 2 < len(rom_data) else 0
            addr = lo | (hi << 8)
            lines.append(f"  ${cpu_addr:04X}  {opcode:02X} {lo:02X} {hi:02X}      {op_name}  ${addr:04X}")

        pos += op_len
        bytes_read += op_len

    return '\n'.join(lines)

def find_text_control_checks(rom_data):
    """Find code that checks for text control codes ($FF, $FD, $FE, $22)"""
    results = []

    # Pattern: CMP #$FF / BEQ (end of string)
    for offset in range(16, len(rom_data) - 2):
        if rom_data[offset] == 0xC9:  # CMP #imm
            val = rom_data[offset + 1]
            next_op = rom_data[offset + 2]

            if val in [0xFF, 0xFD, 0xFE, 0x22] and next_op in [0xF0, 0xD0]:  # BEQ or BNE
                cpu = rom_to_cpu(offset)
                if cpu:
                    results.append({
                        'rom_offset': offset,
                        'cpu_addr': cpu,
                        'control_code': val,
                        'branch': 'BEQ' if next_op == 0xF0 else 'BNE'
                    })

    return results

def find_lda_indirect_y_loops(rom_data):
    """Find patterns like: LDA ($xx),Y / CMP #$FF / BEQ (typical text loop)"""
    results = []

    for offset in range(16, len(rom_data) - 5):
        # LDA ($xx),Y
        if rom_data[offset] == 0xB1:
            zp = rom_data[offset + 1]

            # Look ahead for CMP #$FF
            for ahead in range(2, 10):
                if offset + ahead + 2 > len(rom_data):
                    break
                if rom_data[offset + ahead] == 0xC9 and rom_data[offset + ahead + 1] == 0xFF:
                    cpu = rom_to_cpu(offset)
                    if cpu:
                        results.append({
                            'rom_offset': offset,
                            'cpu_addr': cpu,
                            'zp_pointer': zp,
                            'cmp_offset': ahead
                        })
                    break

    return results

def analyze_bank_for_text_code(rom_data, bank_num):
    """Analyze a specific bank for text-related code"""
    bank_start = 16 + (bank_num * 0x4000)
    bank_end = bank_start + 0x4000

    results = {
        'text_loops': [],
        'control_checks': [],
        'ppu_writes': [],
    }

    for offset in range(bank_start, min(bank_end, len(rom_data)) - 3):
        # PPU writes (STA $2007)
        if rom_data[offset:offset+3] == bytes([0x8D, 0x07, 0x20]):
            cpu = rom_to_cpu(offset)
            if cpu:
                results['ppu_writes'].append(cpu)

        # LDA ($xx),Y followed by check
        if rom_data[offset] == 0xB1:
            zp = rom_data[offset + 1]
            # Check if followed by CMP
            for ahead in range(2, 8):
                if offset + ahead < bank_end and rom_data[offset + ahead] == 0xC9:
                    results['text_loops'].append({
                        'cpu': rom_to_cpu(offset),
                        'zp': zp,
                        'check_val': rom_data[offset + ahead + 1] if offset + ahead + 1 < bank_end else 0
                    })
                    break

    return results

def main():
    rom_data = load_rom()
    print(f"ROM loaded: {len(rom_data)} bytes")
    print()

    # Convert known text ROM offsets to CPU addresses
    print("=" * 70)
    print("KNOWN TEXT LOCATIONS")
    print("=" * 70)
    for rom_off, desc in KNOWN_TEXT.items():
        # Calculate bank
        prg_offset = rom_off - 16
        bank = prg_offset // 0x4000
        cpu = 0x8000 + (prg_offset % 0x4000)
        print(f"  ROM 0x{rom_off:05X} -> Bank {bank}, CPU ${cpu:04X}: {desc}")
    print()

    # Find text control code checks
    print("=" * 70)
    print("TEXT CONTROL CODE CHECKS")
    print("=" * 70)

    control_checks = find_text_control_checks(rom_data)

    # Group by control code
    by_code = {}
    for check in control_checks:
        code = check['control_code']
        if code not in by_code:
            by_code[code] = []
        by_code[code].append(check)

    for code in sorted(by_code.keys()):
        code_name = {0xFF: 'END', 0xFD: 'LINE/CLEAR', 0xFE: 'CTRL-FE', 0x22: 'POSITION'}.get(code, '???')
        checks = by_code[code]
        print(f"\n  Control code ${code:02X} ({code_name}): {len(checks)} occurrences")

        # Show first few
        for check in checks[:5]:
            rom_off = check['rom_offset']
            bank = (rom_off - 16) // 0x4000
            print(f"    Bank {bank:2d}, ${check['cpu_addr']:04X} (ROM 0x{rom_off:05X}): CMP #${code:02X}, {check['branch']}")
    print()

    # Find text read loops
    print("=" * 70)
    print("TEXT READ LOOPS (LDA ($xx),Y ... CMP #$FF)")
    print("=" * 70)

    text_loops = find_lda_indirect_y_loops(rom_data)
    print(f"Found {len(text_loops)} potential text read loops")

    # Group by bank
    by_bank = {}
    for loop in text_loops:
        bank = (loop['rom_offset'] - 16) // 0x4000
        if bank not in by_bank:
            by_bank[bank] = []
        by_bank[bank].append(loop)

    print("\nLoops per bank:")
    for bank in sorted(by_bank.keys()):
        loops = by_bank[bank]
        print(f"  Bank {bank:2d}: {len(loops)} loops")

    # Show most promising (banks with text)
    text_banks = [16, 22, 23, 27]  # Banks known to have text
    print("\nDetailed analysis for text-related banks:")

    for bank in text_banks:
        if bank in by_bank:
            print(f"\n  Bank {bank}:")
            for loop in by_bank[bank][:10]:
                print(f"    ${loop['cpu_addr']:04X}: LDA (${loop['zp_pointer']:02X}),Y")
                # Disassemble around this location
                print(disassemble_at(rom_data, loop['rom_offset'] - 4, 32))
    print()

    # Look for references to known text addresses
    print("=" * 70)
    print("SEARCHING FOR REFERENCES TO KNOWN TEXT")
    print("=" * 70)

    for rom_off, desc in KNOWN_TEXT.items():
        prg_offset = rom_off - 16
        bank = prg_offset // 0x4000
        cpu = 0x8000 + (prg_offset % 0x4000)

        print(f"\n{desc} at ${cpu:04X}:")

        # Search for this CPU address in the same bank
        bank_start = 16 + (bank * 0x4000)
        bank_end = bank_start + 0x4000

        refs = find_pointer_references(rom_data, cpu, (bank_start, bank_end))
        if refs:
            print(f"  Found {len(refs)} references in Bank {bank}:")
            for ref in refs[:5]:
                ref_cpu = 0x8000 + ((ref - 16) % 0x4000)
                print(f"    ROM 0x{ref:05X} (${ref_cpu:04X})")
                # Show context
                print(disassemble_at(rom_data, ref - 8, 24))
        else:
            print(f"  No direct pointer references found in Bank {bank}")
    print()

    # Analyze fixed bank ($C000-$FFFF) for text routines
    print("=" * 70)
    print("FIXED BANK TEXT CODE ANALYSIS")
    print("=" * 70)

    fixed_bank = 31  # Last bank
    analysis = analyze_bank_for_text_code(rom_data, fixed_bank)

    print(f"\nPPU writes (STA $2007) in fixed bank: {len(analysis['ppu_writes'])}")
    if analysis['ppu_writes'][:10]:
        print("  First 10:")
        for addr in analysis['ppu_writes'][:10]:
            print(f"    ${addr:04X}")

    # Save results
    output_path = os.path.join(os.path.dirname(__file__), '..', 'docs', 'analysis',
                               'text_engine_analysis.txt')
    os.makedirs(os.path.dirname(output_path), exist_ok=True)

    with open(output_path, 'w') as f:
        f.write("Dragon Warrior IV - Text Engine Analysis\n")
        f.write("=" * 60 + "\n\n")

        f.write("KNOWN TEXT LOCATIONS:\n")
        for rom_off, desc in KNOWN_TEXT.items():
            prg_offset = rom_off - 16
            bank = prg_offset // 0x4000
            cpu = 0x8000 + (prg_offset % 0x4000)
            f.write(f"  ROM 0x{rom_off:05X} -> Bank {bank}, CPU ${cpu:04X}: {desc}\n")

        f.write("\n\nCONTROL CODE CHECKS:\n")
        for code in sorted(by_code.keys()):
            code_name = {0xFF: 'END', 0xFD: 'LINE/CLEAR', 0xFE: 'CTRL-FE', 0x22: 'POSITION'}.get(code, '???')
            checks = by_code[code]
            f.write(f"\n  ${code:02X} ({code_name}): {len(checks)} occurrences\n")
            for check in checks[:20]:
                rom_off = check['rom_offset']
                bank = (rom_off - 16) // 0x4000
                f.write(f"    Bank {bank:2d}, ${check['cpu_addr']:04X}: CMP #${code:02X}, {check['branch']}\n")

        f.write("\n\nTEXT READ LOOPS BY BANK:\n")
        for bank in sorted(by_bank.keys()):
            loops = by_bank[bank]
            f.write(f"  Bank {bank:2d}: {len(loops)} loops\n")

    print(f"\nSaved analysis to: {output_path}")

if __name__ == '__main__':
    main()
