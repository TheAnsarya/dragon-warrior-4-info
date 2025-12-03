#!/usr/bin/env python3
"""
Dragon Warrior IV - Switchable Bank Disassembler
=================================================
Disassembles code from the switchable bank region ($8000-$BFFF)
for analysis of battle, menu, and other game systems.
"""

import os
import sys
from typing import Dict, List, Set, Tuple, Optional
from collections import defaultdict

# Complete 6502 opcode table
OPCODES = {
    0x00: ("BRK", "IMP", 1), 0x01: ("ORA", "IDX", 2), 0x05: ("ORA", "ZP", 2),
    0x06: ("ASL", "ZP", 2), 0x08: ("PHP", "IMP", 1), 0x09: ("ORA", "IMM", 2),
    0x0A: ("ASL", "ACC", 1), 0x0D: ("ORA", "ABS", 3), 0x0E: ("ASL", "ABS", 3),
    0x10: ("BPL", "REL", 2), 0x11: ("ORA", "IDY", 2), 0x15: ("ORA", "ZPX", 2),
    0x16: ("ASL", "ZPX", 2), 0x18: ("CLC", "IMP", 1), 0x19: ("ORA", "ABY", 3),
    0x1D: ("ORA", "ABX", 3), 0x1E: ("ASL", "ABX", 3), 0x20: ("JSR", "ABS", 3),
    0x21: ("AND", "IDX", 2), 0x24: ("BIT", "ZP", 2), 0x25: ("AND", "ZP", 2),
    0x26: ("ROL", "ZP", 2), 0x28: ("PLP", "IMP", 1), 0x29: ("AND", "IMM", 2),
    0x2A: ("ROL", "ACC", 1), 0x2C: ("BIT", "ABS", 3), 0x2D: ("AND", "ABS", 3),
    0x2E: ("ROL", "ABS", 3), 0x30: ("BMI", "REL", 2), 0x31: ("AND", "IDY", 2),
    0x35: ("AND", "ZPX", 2), 0x36: ("ROL", "ZPX", 2), 0x38: ("SEC", "IMP", 1),
    0x39: ("AND", "ABY", 3), 0x3D: ("AND", "ABX", 3), 0x3E: ("ROL", "ABX", 3),
    0x40: ("RTI", "IMP", 1), 0x41: ("EOR", "IDX", 2), 0x45: ("EOR", "ZP", 2),
    0x46: ("LSR", "ZP", 2), 0x48: ("PHA", "IMP", 1), 0x49: ("EOR", "IMM", 2),
    0x4A: ("LSR", "ACC", 1), 0x4C: ("JMP", "ABS", 3), 0x4D: ("EOR", "ABS", 3),
    0x4E: ("LSR", "ABS", 3), 0x50: ("BVC", "REL", 2), 0x51: ("EOR", "IDY", 2),
    0x55: ("EOR", "ZPX", 2), 0x56: ("LSR", "ZPX", 2), 0x58: ("CLI", "IMP", 1),
    0x59: ("EOR", "ABY", 3), 0x5D: ("EOR", "ABX", 3), 0x5E: ("LSR", "ABX", 3),
    0x60: ("RTS", "IMP", 1), 0x61: ("ADC", "IDX", 2), 0x65: ("ADC", "ZP", 2),
    0x66: ("ROR", "ZP", 2), 0x68: ("PLA", "IMP", 1), 0x69: ("ADC", "IMM", 2),
    0x6A: ("ROR", "ACC", 1), 0x6C: ("JMP", "IND", 3), 0x6D: ("ADC", "ABS", 3),
    0x6E: ("ROR", "ABS", 3), 0x70: ("BVS", "REL", 2), 0x71: ("ADC", "IDY", 2),
    0x75: ("ADC", "ZPX", 2), 0x76: ("ROR", "ZPX", 2), 0x78: ("SEI", "IMP", 1),
    0x79: ("ADC", "ABY", 3), 0x7D: ("ADC", "ABX", 3), 0x7E: ("ROR", "ABX", 3),
    0x81: ("STA", "IDX", 2), 0x84: ("STY", "ZP", 2), 0x85: ("STA", "ZP", 2),
    0x86: ("STX", "ZP", 2), 0x88: ("DEY", "IMP", 1), 0x8A: ("TXA", "IMP", 1),
    0x8C: ("STY", "ABS", 3), 0x8D: ("STA", "ABS", 3), 0x8E: ("STX", "ABS", 3),
    0x90: ("BCC", "REL", 2), 0x91: ("STA", "IDY", 2), 0x94: ("STY", "ZPX", 2),
    0x95: ("STA", "ZPX", 2), 0x96: ("STX", "ZPY", 2), 0x98: ("TYA", "IMP", 1),
    0x99: ("STA", "ABY", 3), 0x9A: ("TXS", "IMP", 1), 0x9D: ("STA", "ABX", 3),
    0xA0: ("LDY", "IMM", 2), 0xA1: ("LDA", "IDX", 2), 0xA2: ("LDX", "IMM", 2),
    0xA4: ("LDY", "ZP", 2), 0xA5: ("LDA", "ZP", 2), 0xA6: ("LDX", "ZP", 2),
    0xA8: ("TAY", "IMP", 1), 0xA9: ("LDA", "IMM", 2), 0xAA: ("TAX", "IMP", 1),
    0xAC: ("LDY", "ABS", 3), 0xAD: ("LDA", "ABS", 3), 0xAE: ("LDX", "ABS", 3),
    0xB0: ("BCS", "REL", 2), 0xB1: ("LDA", "IDY", 2), 0xB4: ("LDY", "ZPX", 2),
    0xB5: ("LDA", "ZPX", 2), 0xB6: ("LDX", "ZPY", 2), 0xB8: ("CLV", "IMP", 1),
    0xB9: ("LDA", "ABY", 3), 0xBA: ("TSX", "IMP", 1), 0xBC: ("LDY", "ABX", 3),
    0xBD: ("LDA", "ABX", 3), 0xBE: ("LDX", "ABY", 3), 0xC0: ("CPY", "IMM", 2),
    0xC1: ("CMP", "IDX", 2), 0xC4: ("CPY", "ZP", 2), 0xC5: ("CMP", "ZP", 2),
    0xC6: ("DEC", "ZP", 2), 0xC8: ("INY", "IMP", 1), 0xC9: ("CMP", "IMM", 2),
    0xCA: ("DEX", "IMP", 1), 0xCC: ("CPY", "ABS", 3), 0xCD: ("CMP", "ABS", 3),
    0xCE: ("DEC", "ABS", 3), 0xD0: ("BNE", "REL", 2), 0xD1: ("CMP", "IDY", 2),
    0xD5: ("CMP", "ZPX", 2), 0xD6: ("DEC", "ZPX", 2), 0xD8: ("CLD", "IMP", 1),
    0xD9: ("CMP", "ABY", 3), 0xDD: ("CMP", "ABX", 3), 0xDE: ("DEC", "ABX", 3),
    0xE0: ("CPX", "IMM", 2), 0xE1: ("SBC", "IDX", 2), 0xE4: ("CPX", "ZP", 2),
    0xE5: ("SBC", "ZP", 2), 0xE6: ("INC", "ZP", 2), 0xE8: ("INX", "IMP", 1),
    0xE9: ("SBC", "IMM", 2), 0xEA: ("NOP", "IMP", 1), 0xEC: ("CPX", "ABS", 3),
    0xED: ("SBC", "ABS", 3), 0xEE: ("INC", "ABS", 3), 0xF0: ("BEQ", "REL", 2),
    0xF1: ("SBC", "IDY", 2), 0xF5: ("SBC", "ZPX", 2), 0xF6: ("INC", "ZPX", 2),
    0xF8: ("SED", "IMP", 1), 0xF9: ("SBC", "ABY", 3), 0xFD: ("SBC", "ABX", 3),
    0xFE: ("INC", "ABX", 3),
}

# Hardware register names
HW_REGS = {
    0x2000: "PPUCTRL", 0x2001: "PPUMASK", 0x2002: "PPUSTATUS",
    0x2003: "OAMADDR", 0x2004: "OAMDATA", 0x2005: "PPUSCROLL",
    0x2006: "PPUADDR", 0x2007: "PPUDATA", 0x4014: "OAMDMA",
    0x4000: "SQ1_VOL", 0x4001: "SQ1_SWEEP", 0x4002: "SQ1_LO", 0x4003: "SQ1_HI",
    0x4004: "SQ2_VOL", 0x4005: "SQ2_SWEEP", 0x4006: "SQ2_LO", 0x4007: "SQ2_HI",
    0x4008: "TRI_LINEAR", 0x400A: "TRI_LO", 0x400B: "TRI_HI",
    0x400C: "NOISE_VOL", 0x400E: "NOISE_LO", 0x400F: "NOISE_HI",
    0x4010: "DMC_FREQ", 0x4011: "DMC_RAW", 0x4012: "DMC_START", 0x4013: "DMC_LEN",
    0x4015: "APU_STATUS", 0x4016: "JOY1", 0x4017: "JOY2_FRAME",
}

# Known zero page variables from analysis
ZP_VARS = {
    0x00: "tmp0", 0x01: "tmp1", 0x02: "tmp2", 0x03: "tmp3",
    0x04: "ptr0_lo", 0x05: "ptr0_hi", 0x06: "ptr1_lo", 0x07: "ptr1_hi",
    0x1F: "system_flags",
    0x63: "map_number", 0x64: "submap_number",
    0xEA: "pos_x_lo", 0xEB: "pos_x_hi", 0xEC: "pos_y_lo", 0xED: "pos_y_hi",
}

# Known RAM variables
RAM_VARS = {
    0x0502: "nmi_jump", 0x0507: "current_bank", 0x050C: "frame_counter",
    0x0526: "timer_lo", 0x0527: "timer_hi", 0x0529: "controller_state",
    0x058F: "movement_speed",
}


class BankDisassembler:
    """Disassembler for switchable banks ($8000-$BFFF)"""

    HEADER_SIZE = 16
    BANK_SIZE = 0x4000  # 16KB
    BASE_ADDR = 0x8000  # Switchable bank region

    def __init__(self, rom_path: str):
        with open(rom_path, 'rb') as f:
            self.rom = f.read()

        self.prg_count = self.rom[4]
        self.labels: Dict[int, str] = {}
        self.comments: Dict[int, str] = {}
        self.discovered_subs: Set[int] = set()
        self.discovered_jumps: Set[int] = set()

    def get_bank_offset(self, bank_num: int) -> int:
        """Get ROM offset for a 16KB bank"""
        return self.HEADER_SIZE + (bank_num * self.BANK_SIZE)

    def read_bank(self, bank_num: int) -> bytes:
        """Read a 16KB bank"""
        offset = self.get_bank_offset(bank_num)
        return self.rom[offset:offset + self.BANK_SIZE]

    def cpu_to_offset(self, cpu_addr: int) -> int:
        """Convert CPU address to bank-relative offset"""
        return cpu_addr - self.BASE_ADDR

    def offset_to_cpu(self, offset: int) -> int:
        """Convert bank-relative offset to CPU address"""
        return offset + self.BASE_ADDR

    def get_label(self, addr: int) -> Optional[str]:
        """Get label for address if it exists"""
        if addr in self.labels:
            return self.labels[addr]
        if addr in ZP_VARS:
            return ZP_VARS[addr]
        if addr in RAM_VARS:
            return RAM_VARS[addr]
        if addr in HW_REGS:
            return HW_REGS[addr]
        return None

    def format_operand(self, mode: str, data: bytes, pc: int) -> str:
        """Format operand based on addressing mode"""
        if mode == "IMP" or mode == "ACC":
            return ""
        elif mode == "IMM":
            return f"#${data[0]:02X}"
        elif mode == "ZP":
            addr = data[0]
            label = self.get_label(addr)
            return label if label else f"${addr:02X}"
        elif mode == "ZPX":
            addr = data[0]
            label = self.get_label(addr)
            base = label if label else f"${addr:02X}"
            return f"{base},X"
        elif mode == "ZPY":
            addr = data[0]
            label = self.get_label(addr)
            base = label if label else f"${addr:02X}"
            return f"{base},Y"
        elif mode == "ABS":
            addr = data[0] | (data[1] << 8)
            label = self.get_label(addr)
            return label if label else f"${addr:04X}"
        elif mode == "ABX":
            addr = data[0] | (data[1] << 8)
            label = self.get_label(addr)
            base = label if label else f"${addr:04X}"
            return f"{base},X"
        elif mode == "ABY":
            addr = data[0] | (data[1] << 8)
            label = self.get_label(addr)
            base = label if label else f"${addr:04X}"
            return f"{base},Y"
        elif mode == "IND":
            addr = data[0] | (data[1] << 8)
            label = self.get_label(addr)
            return f"({label})" if label else f"(${addr:04X})"
        elif mode == "IDX":
            addr = data[0]
            label = self.get_label(addr)
            base = label if label else f"${addr:02X}"
            return f"({base},X)"
        elif mode == "IDY":
            addr = data[0]
            label = self.get_label(addr)
            base = label if label else f"${addr:02X}"
            return f"({base}),Y"
        elif mode == "REL":
            offset = data[0]
            if offset >= 0x80:
                offset -= 256
            target = pc + 2 + offset
            label = self.get_label(target)
            if label:
                return label
            self.discovered_jumps.add(target)
            return f"${target:04X}"
        return ""

    def first_pass(self, data: bytes) -> None:
        """First pass: discover all subroutines and jump targets"""
        self.discovered_subs.clear()
        self.discovered_jumps.clear()

        i = 0
        while i < len(data):
            opcode = data[i]
            if opcode not in OPCODES:
                i += 1
                continue

            mnemonic, mode, size = OPCODES[opcode]

            if i + size <= len(data):
                if mnemonic == "JSR" and mode == "ABS":
                    target = data[i+1] | (data[i+2] << 8)
                    if self.BASE_ADDR <= target < self.BASE_ADDR + self.BANK_SIZE:
                        self.discovered_subs.add(target)
                elif mnemonic in ("JMP", "BNE", "BEQ", "BPL", "BMI", "BCC", "BCS", "BVC", "BVS"):
                    if mode == "REL":
                        offset = data[i+1]
                        if offset >= 0x80:
                            offset -= 256
                        target = self.offset_to_cpu(i) + 2 + offset
                        if self.BASE_ADDR <= target < self.BASE_ADDR + self.BANK_SIZE:
                            self.discovered_jumps.add(target)
                    elif mode == "ABS":
                        target = data[i+1] | (data[i+2] << 8)
                        if self.BASE_ADDR <= target < self.BASE_ADDR + self.BANK_SIZE:
                            self.discovered_jumps.add(target)

            i += size

    def auto_label(self, addr: int) -> str:
        """Generate automatic label for address"""
        if addr in self.discovered_subs:
            return f"sub_{addr:04X}"
        elif addr in self.discovered_jumps:
            return f"loc_{addr:04X}"
        return f"unk_{addr:04X}"

    def disassemble_region(self, data: bytes, start: int, end: int, bank_num: int) -> List[str]:
        """Disassemble a region of code"""
        lines = []
        i = start

        while i < end:
            cpu_addr = self.offset_to_cpu(i)

            # Add label if this is a known target
            if cpu_addr in self.discovered_subs:
                lines.append("")
                lines.append(f"; ---- Subroutine at ${cpu_addr:04X} (Bank {bank_num}) ----")
                lines.append(f"{self.auto_label(cpu_addr)}:")
            elif cpu_addr in self.discovered_jumps:
                lines.append(f"{self.auto_label(cpu_addr)}:")

            # Handle unknown opcodes
            opcode = data[i]
            if opcode not in OPCODES:
                lines.append(f"    .byte ${opcode:02X}              ; ${cpu_addr:04X} - Unknown opcode")
                i += 1
                continue

            mnemonic, mode, size = OPCODES[opcode]

            # Get operand bytes
            if i + size > len(data):
                lines.append(f"    .byte ${opcode:02X}              ; ${cpu_addr:04X} - Truncated")
                break

            operand_data = data[i+1:i+size]
            operand = self.format_operand(mode, operand_data, cpu_addr)

            # Format instruction
            raw_bytes = ' '.join(f'{data[i+j]:02X}' for j in range(size))

            if operand:
                instr = f"{mnemonic} {operand}"
            else:
                instr = mnemonic

            # Add comment for special instructions
            comment = ""
            if mnemonic == "JSR":
                target = data[i+1] | (data[i+2] << 8)
                if target >= 0xC000:
                    comment = "; Call to fixed bank"
                elif target in self.discovered_subs:
                    comment = f"; -> {self.auto_label(target)}"
            elif mnemonic in ("ADC", "SBC"):
                comment = "; Arithmetic"
            elif mnemonic == "CMP" and mode == "IMM":
                comment = f"; Compare with {data[i+1]}"

            # Build line
            line = f"    {instr:24s} ; ${cpu_addr:04X}: {raw_bytes:8s}"
            if comment:
                line += f" {comment}"
            lines.append(line)

            i += size

        return lines

    def disassemble_bank(self, bank_num: int) -> str:
        """Disassemble an entire bank"""
        data = self.read_bank(bank_num)

        # First pass to discover labels
        self.first_pass(data)

        # Build output
        lines = []
        lines.append(f"; ============================================================")
        lines.append(f"; Dragon Warrior IV - Bank {bank_num} Disassembly")
        lines.append(f"; ROM Offset: ${self.get_bank_offset(bank_num):05X}")
        lines.append(f"; CPU Address: ${self.BASE_ADDR:04X}-${self.BASE_ADDR + self.BANK_SIZE - 1:04X}")
        lines.append(f"; ============================================================")
        lines.append(f";")
        lines.append(f"; Discovered Subroutines: {len(self.discovered_subs)}")
        lines.append(f"; Jump Targets: {len(self.discovered_jumps)}")
        lines.append(f";")
        lines.append(f"; ============================================================")
        lines.append("")

        # Disassemble the full bank
        lines.extend(self.disassemble_region(data, 0, len(data), bank_num))

        return '\n'.join(lines)

    def analyze_bank_structure(self, bank_num: int) -> dict:
        """Analyze the structure of a bank"""
        data = self.read_bank(bank_num)
        self.first_pass(data)

        # Count instruction types
        instr_counts = defaultdict(int)
        arithmetic_ops = 0
        branch_ops = 0
        memory_ops = 0

        i = 0
        while i < len(data):
            opcode = data[i]
            if opcode not in OPCODES:
                i += 1
                continue

            mnemonic, mode, size = OPCODES[opcode]
            instr_counts[mnemonic] += 1

            if mnemonic in ("ADC", "SBC", "ASL", "LSR", "ROL", "ROR"):
                arithmetic_ops += 1
            if mnemonic in ("BNE", "BEQ", "BPL", "BMI", "BCC", "BCS", "BVC", "BVS", "JMP"):
                branch_ops += 1
            if mnemonic in ("LDA", "STA", "LDX", "STX", "LDY", "STY"):
                memory_ops += 1

            i += size

        return {
            'bank': bank_num,
            'subroutines': len(self.discovered_subs),
            'jump_targets': len(self.discovered_jumps),
            'arithmetic_ops': arithmetic_ops,
            'branch_ops': branch_ops,
            'memory_ops': memory_ops,
            'top_instructions': sorted(instr_counts.items(), key=lambda x: -x[1])[:10],
        }


def main():
    script_dir = os.path.dirname(os.path.abspath(__file__))
    project_dir = os.path.dirname(script_dir)

    rom_path = os.path.join(project_dir, "roms", "Dragon Warrior IV (1992-10)(Enix)(US).nes")
    output_dir = os.path.join(project_dir, "disasm", "banks")

    if not os.path.exists(rom_path):
        print(f"ROM not found: {rom_path}")
        sys.exit(1)

    os.makedirs(output_dir, exist_ok=True)

    disasm = BankDisassembler(rom_path)

    # Analyze all banks and find the most code-heavy ones
    print("Analyzing bank structures...")
    print()

    battle_candidates = []

    for bank in range(32):
        analysis = disasm.analyze_bank_structure(bank)

        # Look for battle system characteristics:
        # - High arithmetic operations (damage calculations)
        # - Many subroutines (complex logic)
        # - Balanced branch/memory ops

        score = (analysis['arithmetic_ops'] * 2 +
                 analysis['subroutines'] * 3 +
                 analysis['branch_ops'])

        if analysis['subroutines'] > 50 and analysis['arithmetic_ops'] > 100:
            battle_candidates.append((bank, score, analysis))

        print(f"Bank {bank:2d}: {analysis['subroutines']:3d} subs, "
              f"{analysis['arithmetic_ops']:4d} arith, "
              f"{analysis['branch_ops']:4d} branch, "
              f"Score: {score:5d}")

    print()
    print("=" * 60)
    print("Battle System Candidates (sorted by score):")
    print("=" * 60)

    battle_candidates.sort(key=lambda x: -x[1])

    for bank, score, analysis in battle_candidates[:5]:
        print(f"\nBank {bank} (Score: {score}):")
        print(f"  Subroutines: {analysis['subroutines']}")
        print(f"  Arithmetic: {analysis['arithmetic_ops']}")
        print(f"  Branches: {analysis['branch_ops']}")
        print(f"  Top Instructions: {', '.join(f'{m}:{c}' for m,c in analysis['top_instructions'][:5])}")

    # Disassemble top 3 battle candidates
    print()
    print("=" * 60)
    print("Disassembling top battle candidate banks...")
    print("=" * 60)

    for bank, score, _ in battle_candidates[:3]:
        output_path = os.path.join(output_dir, f"bank_{bank:02d}.asm")
        print(f"Disassembling Bank {bank} -> {output_path}")

        asm = disasm.disassemble_bank(bank)
        with open(output_path, 'w') as f:
            f.write(asm)

    print()
    print("Done!")


if __name__ == "__main__":
    main()
