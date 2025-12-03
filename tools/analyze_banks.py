#!/usr/bin/env python3
"""
Dragon Warrior IV - PRG Bank Analyzer
=====================================
Analyzes all 32 PRG banks to identify code patterns, entry points,
and categorize bank contents (battle, menu, text, map data, etc.)
"""

import os
import sys
from typing import Dict, List, Tuple, Set
from collections import defaultdict

# 6502 Opcode definitions for analysis
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


class BankAnalyzer:
    """Analyzes PRG banks to identify code patterns and content types"""
    
    HEADER_SIZE = 16
    BANK_SIZE = 0x4000  # 16KB banks for overall structure
    BANK_8K_SIZE = 0x2000  # 8KB banks for MMC1
    
    def __init__(self, rom_path: str):
        with open(rom_path, 'rb') as f:
            self.rom = f.read()
        
        self.prg_count = self.rom[4]  # Number of 16KB PRG banks
        self.prg_size = self.prg_count * 0x4000
        self.chr_size = self.rom[5] * 0x2000
        
        # Statistics per bank
        self.bank_stats: Dict[int, dict] = {}
        
    def get_bank_offset(self, bank_16k: int) -> int:
        """Get ROM offset for a 16KB bank"""
        return self.HEADER_SIZE + (bank_16k * self.BANK_SIZE)
    
    def get_bank_8k_offset(self, bank_8k: int) -> int:
        """Get ROM offset for an 8KB bank (MMC1 uses 8KB switching)"""
        return self.HEADER_SIZE + (bank_8k * self.BANK_8K_SIZE)
    
    def read_bank(self, bank_16k: int) -> bytes:
        """Read a 16KB bank"""
        offset = self.get_bank_offset(bank_16k)
        return self.rom[offset:offset + self.BANK_SIZE]
    
    def analyze_code_density(self, data: bytes) -> float:
        """
        Estimate what percentage of the data appears to be valid 6502 code.
        Returns 0.0-1.0
        """
        valid_opcodes = 0
        total = 0
        i = 0
        
        while i < len(data):
            opcode = data[i]
            if opcode in OPCODES:
                _, _, size = OPCODES[opcode]
                valid_opcodes += size
                i += size
            else:
                i += 1
            total += 1
        
        return valid_opcodes / len(data) if len(data) > 0 else 0
    
    def find_subroutine_entries(self, data: bytes, base_addr: int = 0x8000) -> List[int]:
        """Find likely subroutine entry points (targets of JSR instructions)"""
        entries = set()
        i = 0
        
        while i < len(data) - 2:
            if data[i] == 0x20:  # JSR
                target = data[i+1] | (data[i+2] << 8)
                # Check if target is within this bank's address range
                if base_addr <= target < base_addr + len(data):
                    entries.add(target)
                i += 3
            elif data[i] in OPCODES:
                _, _, size = OPCODES[data[i]]
                i += size
            else:
                i += 1
        
        return sorted(entries)
    
    def find_jump_tables(self, data: bytes, base_addr: int = 0x8000) -> List[Tuple[int, int]]:
        """Find potential jump tables (sequences of addresses)"""
        tables = []
        i = 0
        
        while i < len(data) - 6:
            # Look for patterns of consecutive addresses in the bank's range
            addr1 = data[i] | (data[i+1] << 8)
            addr2 = data[i+2] | (data[i+3] << 8)
            addr3 = data[i+4] | (data[i+5] << 8)
            
            if (base_addr <= addr1 < base_addr + 0x4000 and
                base_addr <= addr2 < base_addr + 0x4000 and
                base_addr <= addr3 < base_addr + 0x4000):
                # Looks like a jump table
                table_start = base_addr + i
                table_len = 3
                # Count more entries
                j = i + 6
                while j < len(data) - 1:
                    addr = data[j] | (data[j+1] << 8)
                    if base_addr <= addr < base_addr + 0x4000:
                        table_len += 1
                        j += 2
                    else:
                        break
                if table_len >= 4:
                    tables.append((table_start, table_len))
                    i = j
                    continue
            i += 1
        
        return tables
    
    def detect_text_regions(self, data: bytes) -> List[Tuple[int, int]]:
        """Find regions that look like text data (DTE-compressed or plain)"""
        regions = []
        text_start = None
        text_count = 0
        
        for i, b in enumerate(data):
            # Text bytes: $00-$3F (printable), $80-$FE (DTE), $FD-$FF (control)
            is_text_byte = (0x00 <= b <= 0x3F) or (0x80 <= b <= 0xFF)
            
            if is_text_byte:
                if text_start is None:
                    text_start = i
                text_count += 1
            else:
                if text_count >= 32:  # Minimum 32 bytes for a text region
                    regions.append((text_start, text_count))
                text_start = None
                text_count = 0
        
        if text_count >= 32:
            regions.append((text_start, text_count))
        
        return regions
    
    def detect_data_tables(self, data: bytes) -> dict:
        """Detect common data table patterns"""
        patterns = {
            'repeated_patterns': 0,
            'sequential_values': 0,
            'pointer_tables': 0,
        }
        
        # Look for repeated byte patterns (tile data, palettes, etc.)
        for i in range(0, len(data) - 16, 16):
            chunk = data[i:i+16]
            if len(set(chunk)) <= 4:  # Low variety = likely data
                patterns['repeated_patterns'] += 1
        
        # Look for sequential values (often index tables)
        for i in range(0, len(data) - 8):
            seq = True
            for j in range(1, 8):
                if data[i+j] != (data[i] + j) & 0xFF:
                    seq = False
                    break
            if seq:
                patterns['sequential_values'] += 1
        
        return patterns
    
    def analyze_bank(self, bank_num: int) -> dict:
        """Comprehensive analysis of a single bank"""
        data = self.read_bank(bank_num)
        base_addr = 0x8000  # Banks are mapped to $8000-$BFFF
        
        stats = {
            'bank': bank_num,
            'offset': self.get_bank_offset(bank_num),
            'code_density': self.analyze_code_density(data),
            'subroutine_entries': self.find_subroutine_entries(data, base_addr),
            'jump_tables': self.find_jump_tables(data, base_addr),
            'text_regions': self.detect_text_regions(data),
            'data_patterns': self.detect_data_tables(data),
            'first_bytes': data[:16].hex(),
            'category': 'unknown',
        }
        
        # Categorize bank based on analysis
        code_density = stats['code_density']
        num_subs = len(stats['subroutine_entries'])
        text_bytes = sum(r[1] for r in stats['text_regions'])
        
        if code_density > 0.6 and num_subs > 20:
            stats['category'] = 'code'
        elif text_bytes > 4000:
            stats['category'] = 'text'
        elif code_density < 0.3 and stats['data_patterns']['repeated_patterns'] > 100:
            stats['category'] = 'graphics/data'
        elif code_density > 0.4:
            stats['category'] = 'mixed code/data'
        else:
            stats['category'] = 'data'
        
        return stats
    
    def analyze_all_banks(self) -> Dict[int, dict]:
        """Analyze all PRG banks"""
        results = {}
        for bank in range(self.prg_count):
            results[bank] = self.analyze_bank(bank)
            self.bank_stats[bank] = results[bank]
        return results
    
    def print_summary(self):
        """Print analysis summary"""
        print("=" * 70)
        print("Dragon Warrior IV - PRG Bank Analysis")
        print("=" * 70)
        print(f"PRG-ROM: {self.prg_size // 1024}KB ({self.prg_count} x 16KB banks)")
        print(f"CHR-ROM: {self.chr_size // 1024}KB")
        print()
        
        categories = defaultdict(list)
        
        for bank, stats in sorted(self.bank_stats.items()):
            categories[stats['category']].append(bank)
            
            print(f"Bank {bank:2d} (${self.get_bank_offset(bank):05X}): "
                  f"Code: {stats['code_density']:.1%}, "
                  f"Subs: {len(stats['subroutine_entries']):3d}, "
                  f"Text: {sum(r[1] for r in stats['text_regions']):5d}B, "
                  f"Category: {stats['category']}")
        
        print()
        print("Summary by Category:")
        for cat, banks in sorted(categories.items()):
            print(f"  {cat}: Banks {', '.join(str(b) for b in banks)}")
    
    def find_battle_code_candidates(self) -> List[int]:
        """Find banks that likely contain battle system code"""
        candidates = []
        
        for bank, stats in self.bank_stats.items():
            if stats['category'] in ('code', 'mixed code/data'):
                # Look for banks with many subroutines (battle logic is complex)
                if len(stats['subroutine_entries']) > 30:
                    candidates.append(bank)
        
        return candidates
    
    def export_analysis(self, output_path: str):
        """Export detailed analysis to file"""
        with open(output_path, 'w') as f:
            f.write("# Dragon Warrior IV - PRG Bank Analysis\n")
            f.write("# " + "=" * 68 + "\n\n")
            
            for bank, stats in sorted(self.bank_stats.items()):
                f.write(f"## Bank {bank} (ROM Offset: ${stats['offset']:05X})\n\n")
                f.write(f"- Category: {stats['category']}\n")
                f.write(f"- Code Density: {stats['code_density']:.1%}\n")
                f.write(f"- Subroutine Entries: {len(stats['subroutine_entries'])}\n")
                f.write(f"- Text Regions: {len(stats['text_regions'])} "
                       f"({sum(r[1] for r in stats['text_regions'])} bytes)\n")
                f.write(f"- First 16 bytes: {stats['first_bytes']}\n")
                
                if stats['subroutine_entries']:
                    f.write(f"\nSubroutine Entries (first 20):\n")
                    for addr in stats['subroutine_entries'][:20]:
                        f.write(f"  ${addr:04X}\n")
                
                if stats['jump_tables']:
                    f.write(f"\nJump Tables:\n")
                    for addr, length in stats['jump_tables'][:10]:
                        f.write(f"  ${addr:04X}: {length} entries\n")
                
                f.write("\n")
        
        print(f"Analysis exported to: {output_path}")


def main():
    script_dir = os.path.dirname(os.path.abspath(__file__))
    project_dir = os.path.dirname(script_dir)
    
    rom_path = os.path.join(project_dir, "roms", "Dragon Warrior IV (1992-10)(Enix)(US).nes")
    output_path = os.path.join(project_dir, "docs", "bank_analysis.md")
    
    if not os.path.exists(rom_path):
        print(f"ROM not found: {rom_path}")
        sys.exit(1)
    
    analyzer = BankAnalyzer(rom_path)
    analyzer.analyze_all_banks()
    analyzer.print_summary()
    
    print()
    battle_candidates = analyzer.find_battle_code_candidates()
    print(f"Battle code candidates: Banks {', '.join(str(b) for b in battle_candidates)}")
    
    # Export detailed analysis
    os.makedirs(os.path.dirname(output_path), exist_ok=True)
    analyzer.export_analysis(output_path)


if __name__ == "__main__":
    main()
