#!/usr/bin/env python3
"""
Dragon Warrior IV - Bank Reference Analyzer
============================================
Traces all references to bank numbers in the ROM to understand
the game's bank switching patterns.
"""

import os
import sys
from typing import Dict, List, Set, Tuple
from collections import defaultdict

# Opcode table for analysis
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


class BankReferenceAnalyzer:
    """Analyzes bank number references in the ROM"""

    HEADER_SIZE = 16
    BANK_SIZE = 0x4000

    def __init__(self, rom_path: str):
        with open(rom_path, 'rb') as f:
            self.rom = f.read()

        self.prg_count = self.rom[4]

    def get_fixed_bank_offset(self) -> int:
        """Get offset to the fixed bank (last 16KB)"""
        return self.HEADER_SIZE + (self.prg_count - 1) * self.BANK_SIZE

    def read_fixed_bank(self) -> bytes:
        """Read the fixed bank ($C000-$FFFF)"""
        offset = self.get_fixed_bank_offset()
        return self.rom[offset:offset + self.BANK_SIZE]

    def find_bank_switch_calls(self, data: bytes, base_addr: int) -> List[Tuple[int, int]]:
        """
        Find all calls to bank_switch ($FF91) and trace back
        to find what bank number is being loaded.

        Returns list of (address, bank_number) tuples.
        """
        results = []
        bank_switch_addr = 0xFF91

        i = 0
        while i < len(data) - 2:
            opcode = data[i]

            # Look for JSR $FF91 or JMP $FF91
            if opcode in (0x20, 0x4C):  # JSR or JMP
                target = data[i+1] | (data[i+2] << 8)
                if target == bank_switch_addr:
                    # Look back for LDA #imm
                    bank_num = self._trace_back_for_lda(data, i)
                    cpu_addr = base_addr + i
                    results.append((cpu_addr, bank_num))

            # Advance based on instruction size
            if opcode in OPCODES:
                _, _, size = OPCODES[opcode]
                i += size
            else:
                i += 1

        return results

    def _trace_back_for_lda(self, data: bytes, jsr_offset: int) -> int:
        """Trace backwards to find LDA #immediate before JSR bank_switch"""
        # Look back up to 20 bytes for LDA #imm
        for back in range(1, min(20, jsr_offset)):
            check_pos = jsr_offset - back
            if check_pos >= 0:
                opcode = data[check_pos]
                # LDA #imm
                if opcode == 0xA9 and check_pos + 1 < jsr_offset:
                    return data[check_pos + 1]
                # LDA zp
                if opcode == 0xA5 and check_pos + 1 < jsr_offset:
                    return -1 * data[check_pos + 1]  # Negative = from ZP variable
                # LDA abs
                if opcode == 0xAD and check_pos + 2 < jsr_offset:
                    addr = data[check_pos + 1] | (data[check_pos + 2] << 8)
                    return -addr  # Negative = from RAM
        return -999  # Unknown

    def find_bank_tables(self, data: bytes, base_addr: int) -> List[Tuple[int, List[int]]]:
        """Find tables of bank numbers (sequences of values 0-31)"""
        tables = []
        i = 0

        while i < len(data) - 8:
            # Check if next 4+ bytes are all valid bank numbers
            potential_banks = []
            for j in range(min(32, len(data) - i)):
                val = data[i + j]
                if 0 <= val <= 31:
                    potential_banks.append(val)
                else:
                    break

            if len(potential_banks) >= 4:
                # Filter: must have some variety (not all same value)
                if len(set(potential_banks)) >= 2:
                    cpu_addr = base_addr + i
                    tables.append((cpu_addr, potential_banks))
                    i += len(potential_banks)
                    continue

            i += 1

        return tables

    def analyze_fixed_bank(self) -> dict:
        """Analyze the fixed bank for all bank references"""
        data = self.read_fixed_bank()
        base_addr = 0xC000

        bank_calls = self.find_bank_switch_calls(data, base_addr)
        # bank_tables = self.find_bank_tables(data, base_addr)

        # Group by bank number
        banks_used = defaultdict(list)
        for addr, bank in bank_calls:
            if bank >= 0:
                banks_used[bank].append(addr)
            elif bank > -256:
                # From zero page
                banks_used[f"ZP:${-bank:02X}"].append(addr)
            elif bank > -0x8000:
                # From RAM
                banks_used[f"RAM:${-bank:04X}"].append(addr)

        return {
            'bank_calls': bank_calls,
            'banks_used': dict(banks_used),
        }

    def print_report(self):
        """Print analysis report"""
        analysis = self.analyze_fixed_bank()

        print("=" * 70)
        print("Dragon Warrior IV - Bank Switch Analysis")
        print("=" * 70)
        print()

        print("Direct Bank Switch Calls (JSR/JMP $FF91):")
        print("-" * 50)

        for addr, bank in sorted(analysis['bank_calls'], key=lambda x: x[0]):
            if bank >= 0:
                print(f"  ${addr:04X}: Bank {bank} (${bank:02X})")
            elif bank > -256:
                print(f"  ${addr:04X}: From ZP ${-bank:02X}")
            elif bank > -0x8000:
                print(f"  ${addr:04X}: From RAM ${-bank:04X}")
            else:
                print(f"  ${addr:04X}: Unknown source")

        print()
        print("Banks Used (grouped):")
        print("-" * 50)

        for bank, addrs in sorted(analysis['banks_used'].items(),
                                  key=lambda x: x[0] if isinstance(x[0], int) else 999):
            if isinstance(bank, int):
                category = self._categorize_bank(bank)
                print(f"  Bank {bank:2d}: {category:15s} - Called from: "
                      f"{', '.join(f'${a:04X}' for a in sorted(addrs)[:5])}"
                      f"{' ...' if len(addrs) > 5 else ''}")
            else:
                print(f"  {bank}: Called from: "
                      f"{', '.join(f'${a:04X}' for a in sorted(addrs)[:5])}"
                      f"{' ...' if len(addrs) > 5 else ''}")

    def _categorize_bank(self, bank: int) -> str:
        """Categorize bank by number"""
        if bank in (5, 14, 25):
            return "Text"
        elif 16 <= bank <= 23 or 27 <= bank <= 30:
            return "Code"
        elif bank <= 4:
            return "Data/Map"
        else:
            return "Mixed"


def main():
    script_dir = os.path.dirname(os.path.abspath(__file__))
    project_dir = os.path.dirname(script_dir)

    rom_path = os.path.join(project_dir, "roms", "Dragon Warrior IV (1992-10)(Enix)(US).nes")

    if not os.path.exists(rom_path):
        print(f"ROM not found: {rom_path}")
        sys.exit(1)

    analyzer = BankReferenceAnalyzer(rom_path)
    analyzer.print_report()


if __name__ == "__main__":
    main()
