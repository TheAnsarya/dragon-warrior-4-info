#!/usr/bin/env python3
"""
Dragon Warrior IV - Fixed Bank ($C000-$FFFF) Text Routines
The fixed bank contains the core PPU write routines
"""

import os

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

LABELS = {
    0x2000: "PPUCTRL",
    0x2001: "PPUMASK",
    0x2002: "PPUSTATUS",
    0x2003: "OAMADDR",
    0x2004: "OAMDATA",
    0x2005: "PPUSCROLL",
    0x2006: "PPUADDR",
    0x2007: "PPUDATA",
    0x4014: "OAMDMA",
    # RAM
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
}

def load_rom():
    with open(ROM_PATH, 'rb') as f:
        return f.read()

def disasm_inst(rom_data, offset, cpu_addr, local_labels=None):
    """Disassemble one instruction"""
    if offset >= len(rom_data):
        return None, 1

    opcode = rom_data[offset]
    if opcode not in OPCODES:
        return f"  ${cpu_addr:04X}  {opcode:02X}            .db  ${opcode:02X}", 1

    name, size, mode = OPCODES[opcode]

    if offset + size > len(rom_data):
        return f"  ${cpu_addr:04X}  {opcode:02X}            .db  ${opcode:02X}", 1

    bytes_hex = ' '.join(f'{rom_data[offset+i]:02X}' for i in range(size)).ljust(8)

    if size == 1:
        operand = ""
    elif size == 2:
        arg = rom_data[offset + 1]
        if mode == "imm":
            operand = f"#${arg:02X}"
        elif mode == "rel":
            signed = arg if arg < 128 else arg - 256
            target = cpu_addr + 2 + signed
            if local_labels and target in local_labels:
                operand = local_labels[target]
            else:
                operand = f"${target:04X}"
        elif mode == "indy":
            operand = f"(${arg:02X}),Y"
        elif mode == "indx":
            operand = f"(${arg:02X},X)"
        elif mode == "zpx":
            operand = f"${arg:02X},X"
        elif mode == "zpy":
            operand = f"${arg:02X},Y"
        else:
            operand = f"${arg:02X}"
    else:  # size == 3
        addr = rom_data[offset + 1] | (rom_data[offset + 2] << 8)
        label = LABELS.get(addr)
        if local_labels and addr in local_labels:
            label = local_labels[addr]

        if mode == "abs":
            operand = label if label else f"${addr:04X}"
        elif mode == "absx":
            operand = f"{label},X" if label else f"${addr:04X},X"
        elif mode == "absy":
            operand = f"{label},Y" if label else f"${addr:04X},Y"
        elif mode == "ind":
            operand = f"(${addr:04X})"
        else:
            operand = f"${addr:04X}"

    return f"  ${cpu_addr:04X}  {bytes_hex}  {name:4} {operand}", size

def disasm_range(rom_data, rom_start, rom_end, cpu_base):
    """Disassemble a range with auto-detected labels"""
    # First pass: find branch targets
    labels = {}
    pos = rom_start
    while pos < rom_end:
        if pos >= len(rom_data):
            break
        opcode = rom_data[pos]
        if opcode not in OPCODES:
            pos += 1
            continue
        name, size, mode = OPCODES[opcode]
        cpu = cpu_base + (pos - rom_start)

        if mode == "rel" and size == 2:
            arg = rom_data[pos + 1]
            signed = arg if arg < 128 else arg - 256
            target = cpu + 2 + signed
            if cpu_base <= target < cpu_base + (rom_end - rom_start):
                labels[target] = f"loc_{target:04X}"
        elif mode == "abs" and size == 3 and name in ("JSR", "JMP"):
            addr = rom_data[pos + 1] | (rom_data[pos + 2] << 8)
            if cpu_base <= addr < cpu_base + (rom_end - rom_start):
                prefix = "sub_" if name == "JSR" else "loc_"
                labels[addr] = f"{prefix}{addr:04X}"

        pos += size

    # Merge with global labels
    labels.update(LABELS)

    # Second pass: disassemble
    output = []
    pos = rom_start
    while pos < rom_end:
        cpu = cpu_base + (pos - rom_start)

        if cpu in labels and labels[cpu].startswith(("loc_", "sub_")):
            output.append(f"\n{labels[cpu]}:")

        line, size = disasm_inst(rom_data, pos, cpu, labels)
        if line:
            output.append(line)
        pos += size

    return '\n'.join(output)

def find_ppu_write_clusters(rom_data, bank_start, bank_end, cpu_base):
    """Find areas with multiple PPU writes (likely text rendering)"""
    clusters = []
    current_cluster = None

    for offset in range(bank_start, bank_end - 2):
        # STA PPUDATA ($8D $07 $20)
        if rom_data[offset:offset+3] == bytes([0x8D, 0x07, 0x20]):
            cpu = cpu_base + (offset - bank_start)
            if current_cluster is None:
                current_cluster = {'start': offset, 'end': offset, 'writes': [cpu]}
            elif offset - current_cluster['end'] < 32:  # Within 32 bytes
                current_cluster['end'] = offset
                current_cluster['writes'].append(cpu)
            else:
                if len(current_cluster['writes']) >= 2:
                    clusters.append(current_cluster)
                current_cluster = {'start': offset, 'end': offset, 'writes': [cpu]}

    if current_cluster and len(current_cluster['writes']) >= 2:
        clusters.append(current_cluster)

    return clusters

def main():
    rom_data = load_rom()
    print(f"ROM loaded: {len(rom_data)} bytes")

    # Fixed bank is the last 16KB
    FIXED_START = 16 + 0x78000  # ROM offset for $C000
    FIXED_END = FIXED_START + 0x4000
    CPU_BASE = 0xC000

    output = []
    output.append("; Dragon Warrior IV (NES) - Fixed Bank Text Routines")
    output.append("; Bank 31 ($C000-$FFFF) - Always mapped")
    output.append("; " + "=" * 55)
    output.append("")

    # Find PPU write clusters
    clusters = find_ppu_write_clusters(rom_data, FIXED_START, FIXED_END, CPU_BASE)

    output.append(f"; Found {len(clusters)} PPU write clusters (potential text routines)")
    output.append("")

    for i, cluster in enumerate(clusters):
        cpu_start = CPU_BASE + (cluster['start'] - FIXED_START)
        cpu_end = CPU_BASE + (cluster['end'] - FIXED_START)
        output.append(f"; Cluster {i+1}: ${cpu_start:04X}-${cpu_end:04X} ({len(cluster['writes'])} writes)")
        for w in cluster['writes']:
            output.append(f";   STA PPUDATA at ${w:04X}")
    output.append("")

    # Disassemble each cluster with context
    output.append("; " + "=" * 60)
    output.append("; PPU WRITE CLUSTER DISASSEMBLY")
    output.append("; " + "=" * 60)

    for i, cluster in enumerate(clusters[:10]):  # First 10 clusters
        cpu_start = CPU_BASE + (cluster['start'] - FIXED_START)

        output.append("")
        output.append(f"; --- Cluster {i+1}: {len(cluster['writes'])} PPU writes starting at ${cpu_start:04X} ---")

        # Disassemble 64 bytes before first write to 32 bytes after last
        start = cluster['start'] - 64
        end = cluster['end'] + 32

        if start < FIXED_START:
            start = FIXED_START
        if end > FIXED_END:
            end = FIXED_END

        output.append(disasm_range(rom_data, start, end, CPU_BASE + (start - FIXED_START)))

    # Look for text-reading patterns
    output.append("")
    output.append("; " + "=" * 60)
    output.append("; TEXT READING PATTERNS")
    output.append("; Looking for LDA ($xx),Y near PPU writes")
    output.append("; " + "=" * 60)

    text_patterns = []
    for offset in range(FIXED_START, FIXED_END - 10):
        # LDA ($xx),Y = $B1 $xx
        if rom_data[offset] == 0xB1:
            zp = rom_data[offset + 1]
            # Look for nearby STA PPUDATA
            for ahead in range(2, 30):
                if offset + ahead + 2 < FIXED_END:
                    if rom_data[offset + ahead:offset + ahead + 3] == bytes([0x8D, 0x07, 0x20]):
                        cpu = CPU_BASE + (offset - FIXED_START)
                        text_patterns.append({
                            'offset': offset,
                            'cpu': cpu,
                            'zp': zp,
                            'ppu_offset': ahead
                        })
                        break

    output.append(f"\n; Found {len(text_patterns)} LDA ($xx),Y -> STA PPUDATA patterns")

    for pattern in text_patterns[:5]:
        output.append(f"\n; Pattern at ${pattern['cpu']:04X}: LDA (${pattern['zp']:02X}),Y")
        start = pattern['offset'] - 16
        end = pattern['offset'] + 48
        if start < FIXED_START:
            start = FIXED_START
        output.append(disasm_range(rom_data, start, end, CPU_BASE + (start - FIXED_START)))

    # Save output
    output_path = os.path.join(os.path.dirname(__file__), '..', 'docs', 'disassembly',
                               'fixed_bank_text.asm')
    os.makedirs(os.path.dirname(output_path), exist_ok=True)

    with open(output_path, 'w') as f:
        f.write('\n'.join(output))

    print(f"\nSaved to: {output_path}")
    print(f"\nClusters found: {len(clusters)}")
    print(f"Text patterns found: {len(text_patterns)}")

    # Print most interesting clusters
    print("\nMost interesting clusters:")
    for i, cluster in enumerate(sorted(clusters, key=lambda x: len(x['writes']), reverse=True)[:5]):
        cpu = CPU_BASE + (cluster['start'] - FIXED_START)
        print(f"  ${cpu:04X}: {len(cluster['writes'])} PPU writes")

if __name__ == '__main__':
    main()
