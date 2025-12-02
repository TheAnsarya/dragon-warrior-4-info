#!/usr/bin/env python3
"""
Dragon Warrior IV (NES) - 6502 Disassembler
===========================================

Disassembles 6502 code from the ROM with automatic label detection.
"""

import os
import sys
from typing import Dict, List, Tuple, Optional, Set
from dataclasses import dataclass

# 6502 Opcode table: opcode -> (mnemonic, addressing_mode, bytes)
# Addressing modes:
#   IMP = Implied (1 byte)
#   IMM = Immediate (2 bytes)
#   ZP  = Zero Page (2 bytes)
#   ZPX = Zero Page,X (2 bytes)
#   ZPY = Zero Page,Y (2 bytes)
#   ABS = Absolute (3 bytes)
#   ABX = Absolute,X (3 bytes)
#   ABY = Absolute,Y (3 bytes)
#   IND = Indirect (3 bytes) - JMP only
#   IDX = Indexed Indirect (2 bytes) - (zp,X)
#   IDY = Indirect Indexed (2 bytes) - (zp),Y
#   REL = Relative (2 bytes) - branches

OPCODES = {
    0x00: ("BRK", "IMP", 1),
    0x01: ("ORA", "IDX", 2),
    0x05: ("ORA", "ZP", 2),
    0x06: ("ASL", "ZP", 2),
    0x08: ("PHP", "IMP", 1),
    0x09: ("ORA", "IMM", 2),
    0x0A: ("ASL", "IMP", 1),
    0x0D: ("ORA", "ABS", 3),
    0x0E: ("ASL", "ABS", 3),
    0x10: ("BPL", "REL", 2),
    0x11: ("ORA", "IDY", 2),
    0x15: ("ORA", "ZPX", 2),
    0x16: ("ASL", "ZPX", 2),
    0x18: ("CLC", "IMP", 1),
    0x19: ("ORA", "ABY", 3),
    0x1D: ("ORA", "ABX", 3),
    0x1E: ("ASL", "ABX", 3),
    0x20: ("JSR", "ABS", 3),
    0x21: ("AND", "IDX", 2),
    0x24: ("BIT", "ZP", 2),
    0x25: ("AND", "ZP", 2),
    0x26: ("ROL", "ZP", 2),
    0x28: ("PLP", "IMP", 1),
    0x29: ("AND", "IMM", 2),
    0x2A: ("ROL", "IMP", 1),
    0x2C: ("BIT", "ABS", 3),
    0x2D: ("AND", "ABS", 3),
    0x2E: ("ROL", "ABS", 3),
    0x30: ("BMI", "REL", 2),
    0x31: ("AND", "IDY", 2),
    0x35: ("AND", "ZPX", 2),
    0x36: ("ROL", "ZPX", 2),
    0x38: ("SEC", "IMP", 1),
    0x39: ("AND", "ABY", 3),
    0x3D: ("AND", "ABX", 3),
    0x3E: ("ROL", "ABX", 3),
    0x40: ("RTI", "IMP", 1),
    0x41: ("EOR", "IDX", 2),
    0x45: ("EOR", "ZP", 2),
    0x46: ("LSR", "ZP", 2),
    0x48: ("PHA", "IMP", 1),
    0x49: ("EOR", "IMM", 2),
    0x4A: ("LSR", "IMP", 1),
    0x4C: ("JMP", "ABS", 3),
    0x4D: ("EOR", "ABS", 3),
    0x4E: ("LSR", "ABS", 3),
    0x50: ("BVC", "REL", 2),
    0x51: ("EOR", "IDY", 2),
    0x55: ("EOR", "ZPX", 2),
    0x56: ("LSR", "ZPX", 2),
    0x58: ("CLI", "IMP", 1),
    0x59: ("EOR", "ABY", 3),
    0x5D: ("EOR", "ABX", 3),
    0x5E: ("LSR", "ABX", 3),
    0x60: ("RTS", "IMP", 1),
    0x61: ("ADC", "IDX", 2),
    0x65: ("ADC", "ZP", 2),
    0x66: ("ROR", "ZP", 2),
    0x68: ("PLA", "IMP", 1),
    0x69: ("ADC", "IMM", 2),
    0x6A: ("ROR", "IMP", 1),
    0x6C: ("JMP", "IND", 3),
    0x6D: ("ADC", "ABS", 3),
    0x6E: ("ROR", "ABS", 3),
    0x70: ("BVS", "REL", 2),
    0x71: ("ADC", "IDY", 2),
    0x75: ("ADC", "ZPX", 2),
    0x76: ("ROR", "ZPX", 2),
    0x78: ("SEI", "IMP", 1),
    0x79: ("ADC", "ABY", 3),
    0x7D: ("ADC", "ABX", 3),
    0x7E: ("ROR", "ABX", 3),
    0x81: ("STA", "IDX", 2),
    0x84: ("STY", "ZP", 2),
    0x85: ("STA", "ZP", 2),
    0x86: ("STX", "ZP", 2),
    0x88: ("DEY", "IMP", 1),
    0x8A: ("TXA", "IMP", 1),
    0x8C: ("STY", "ABS", 3),
    0x8D: ("STA", "ABS", 3),
    0x8E: ("STX", "ABS", 3),
    0x90: ("BCC", "REL", 2),
    0x91: ("STA", "IDY", 2),
    0x94: ("STY", "ZPX", 2),
    0x95: ("STA", "ZPX", 2),
    0x96: ("STX", "ZPY", 2),
    0x98: ("TYA", "IMP", 1),
    0x99: ("STA", "ABY", 3),
    0x9A: ("TXS", "IMP", 1),
    0x9D: ("STA", "ABX", 3),
    0xA0: ("LDY", "IMM", 2),
    0xA1: ("LDA", "IDX", 2),
    0xA2: ("LDX", "IMM", 2),
    0xA4: ("LDY", "ZP", 2),
    0xA5: ("LDA", "ZP", 2),
    0xA6: ("LDX", "ZP", 2),
    0xA8: ("TAY", "IMP", 1),
    0xA9: ("LDA", "IMM", 2),
    0xAA: ("TAX", "IMP", 1),
    0xAC: ("LDY", "ABS", 3),
    0xAD: ("LDA", "ABS", 3),
    0xAE: ("LDX", "ABS", 3),
    0xB0: ("BCS", "REL", 2),
    0xB1: ("LDA", "IDY", 2),
    0xB4: ("LDY", "ZPX", 2),
    0xB5: ("LDA", "ZPX", 2),
    0xB6: ("LDX", "ZPY", 2),
    0xB8: ("CLV", "IMP", 1),
    0xB9: ("LDA", "ABY", 3),
    0xBA: ("TSX", "IMP", 1),
    0xBC: ("LDY", "ABX", 3),
    0xBD: ("LDA", "ABX", 3),
    0xBE: ("LDX", "ABY", 3),
    0xC0: ("CPY", "IMM", 2),
    0xC1: ("CMP", "IDX", 2),
    0xC4: ("CPY", "ZP", 2),
    0xC5: ("CMP", "ZP", 2),
    0xC6: ("DEC", "ZP", 2),
    0xC8: ("INY", "IMP", 1),
    0xC9: ("CMP", "IMM", 2),
    0xCA: ("DEX", "IMP", 1),
    0xCC: ("CPY", "ABS", 3),
    0xCD: ("CMP", "ABS", 3),
    0xCE: ("DEC", "ABS", 3),
    0xD0: ("BNE", "REL", 2),
    0xD1: ("CMP", "IDY", 2),
    0xD5: ("CMP", "ZPX", 2),
    0xD6: ("DEC", "ZPX", 2),
    0xD8: ("CLD", "IMP", 1),
    0xD9: ("CMP", "ABY", 3),
    0xDD: ("CMP", "ABX", 3),
    0xDE: ("DEC", "ABX", 3),
    0xE0: ("CPX", "IMM", 2),
    0xE1: ("SBC", "IDX", 2),
    0xE4: ("CPX", "ZP", 2),
    0xE5: ("SBC", "ZP", 2),
    0xE6: ("INC", "ZP", 2),
    0xE8: ("INX", "IMP", 1),
    0xE9: ("SBC", "IMM", 2),
    0xEA: ("NOP", "IMP", 1),
    0xEC: ("CPX", "ABS", 3),
    0xED: ("SBC", "ABS", 3),
    0xEE: ("INC", "ABS", 3),
    0xF0: ("BEQ", "REL", 2),
    0xF1: ("SBC", "IDY", 2),
    0xF5: ("SBC", "ZPX", 2),
    0xF6: ("INC", "ZPX", 2),
    0xF8: ("SED", "IMP", 1),
    0xF9: ("SBC", "ABY", 3),
    0xFD: ("SBC", "ABX", 3),
    0xFE: ("INC", "ABX", 3),
}

@dataclass
class Instruction:
    """Represents a disassembled instruction."""
    offset: int          # ROM file offset
    cpu_addr: int        # CPU address (if known)
    opcode: int          # Raw opcode byte
    operand: bytes       # Operand bytes
    mnemonic: str        # Instruction mnemonic
    mode: str            # Addressing mode
    target: Optional[int] = None  # Target address for jumps/branches
    comment: str = ""    # Auto-generated comment


class Disassembler:
    """6502 Disassembler for NES ROMs."""
    
    def __init__(self, rom_data: bytes):
        self.rom = rom_data
        self.labels: Dict[int, str] = {}
        self.comments: Dict[int, str] = {}
        self.entry_points: Set[int] = set()
        self.data_regions: List[Tuple[int, int]] = []
        
    def add_label(self, addr: int, name: str):
        """Add a label for an address."""
        self.labels[addr] = name
        
    def add_comment(self, addr: int, comment: str):
        """Add a comment for an address."""
        self.comments[addr] = comment
        
    def rom_to_cpu(self, rom_offset: int, bank: int) -> int:
        """Convert ROM offset to CPU address."""
        # For switchable bank ($8000-$BFFF)
        bank_offset = rom_offset - 16 - (bank * 0x4000)
        return 0x8000 + bank_offset
    
    def cpu_to_rom(self, cpu_addr: int, bank: int) -> int:
        """Convert CPU address to ROM offset."""
        if 0x8000 <= cpu_addr <= 0xBFFF:
            # Switchable bank
            return 16 + (bank * 0x4000) + (cpu_addr - 0x8000)
        elif 0xC000 <= cpu_addr <= 0xFFFF:
            # Fixed bank (usually bank 31)
            return 16 + (31 * 0x4000) + (cpu_addr - 0xC000)
        return -1
    
    def disassemble_instruction(self, offset: int) -> Optional[Instruction]:
        """Disassemble a single instruction at the given offset."""
        if offset >= len(self.rom):
            return None
            
        opcode = self.rom[offset]
        
        if opcode not in OPCODES:
            # Unknown opcode - treat as data
            return Instruction(
                offset=offset,
                cpu_addr=0,
                opcode=opcode,
                operand=b'',
                mnemonic='.db',
                mode='DATA',
                comment=f'Unknown opcode ${opcode:02X}'
            )
        
        mnemonic, mode, length = OPCODES[opcode]
        operand = self.rom[offset + 1:offset + length] if length > 1 else b''
        
        target = None
        if mode == 'REL' and len(operand) == 1:
            # Relative branch - calculate target
            rel = operand[0]
            if rel >= 0x80:
                rel -= 0x100
            target = offset + length + rel
        elif mode in ('ABS', 'ABX', 'ABY', 'IND') and len(operand) == 2:
            target = operand[0] | (operand[1] << 8)
        
        return Instruction(
            offset=offset,
            cpu_addr=0,
            opcode=opcode,
            operand=operand,
            mnemonic=mnemonic,
            mode=mode,
            target=target
        )
    
    def format_operand(self, inst: Instruction, bank: int) -> str:
        """Format the operand for display."""
        mode = inst.mode
        operand = inst.operand
        
        if mode == 'IMP':
            return ''
        elif mode == 'IMM':
            return f'#${operand[0]:02X}'
        elif mode == 'ZP':
            return f'${operand[0]:02X}'
        elif mode == 'ZPX':
            return f'${operand[0]:02X},X'
        elif mode == 'ZPY':
            return f'${operand[0]:02X},Y'
        elif mode == 'ABS':
            addr = operand[0] | (operand[1] << 8)
            if addr in self.labels:
                return self.labels[addr]
            return f'${addr:04X}'
        elif mode == 'ABX':
            addr = operand[0] | (operand[1] << 8)
            if addr in self.labels:
                return f'{self.labels[addr]},X'
            return f'${addr:04X},X'
        elif mode == 'ABY':
            addr = operand[0] | (operand[1] << 8)
            if addr in self.labels:
                return f'{self.labels[addr]},Y'
            return f'${addr:04X},Y'
        elif mode == 'IND':
            addr = operand[0] | (operand[1] << 8)
            return f'(${addr:04X})'
        elif mode == 'IDX':
            return f'(${operand[0]:02X},X)'
        elif mode == 'IDY':
            return f'(${operand[0]:02X}),Y'
        elif mode == 'REL':
            if inst.target is not None:
                # Convert to CPU address for display
                cpu_target = self.rom_to_cpu(inst.target, bank)
                if cpu_target in self.labels:
                    return self.labels[cpu_target]
                return f'${cpu_target:04X}'
            return f'${operand[0]:02X}'
        elif mode == 'DATA':
            return f'${inst.opcode:02X}'
        return ''
    
    def disassemble_range(self, start: int, end: int, bank: int) -> List[str]:
        """Disassemble a range of ROM addresses."""
        lines = []
        offset = start
        
        while offset < end:
            cpu_addr = self.rom_to_cpu(offset, bank)
            
            # Check for label
            if cpu_addr in self.labels:
                lines.append(f'\n{self.labels[cpu_addr]}:')
            
            inst = self.disassemble_instruction(offset)
            if inst is None:
                break
            
            # Format the line
            raw_bytes = self.rom[offset:offset + len(inst.operand) + 1]
            hex_str = ' '.join(f'{b:02X}' for b in raw_bytes)
            operand_str = self.format_operand(inst, bank)
            
            line = f'  ${cpu_addr:04X}  {hex_str:<12}  {inst.mnemonic:<4} {operand_str}'
            
            # Add comment if present
            if cpu_addr in self.comments:
                line += f'  ; {self.comments[cpu_addr]}'
            elif inst.mnemonic in ('JSR', 'JMP') and inst.target:
                if inst.target in self.labels:
                    line += f'  ; -> {self.labels[inst.target]}'
            
            lines.append(line)
            
            # Move to next instruction
            if inst.mode == 'DATA':
                offset += 1
            else:
                offset += len(inst.operand) + 1
        
        return lines
    
    def analyze_code_flow(self, start: int, bank: int) -> Set[int]:
        """Analyze code flow from a starting point to find all reachable code."""
        visited = set()
        to_visit = [start]
        
        while to_visit:
            offset = to_visit.pop()
            if offset in visited or offset >= len(self.rom):
                continue
            
            visited.add(offset)
            inst = self.disassemble_instruction(offset)
            
            if inst is None:
                continue
            
            # Check for branches/jumps
            if inst.mnemonic in ('BCC', 'BCS', 'BEQ', 'BMI', 'BNE', 'BPL', 'BVC', 'BVS'):
                # Conditional branch - add both paths
                if inst.target:
                    to_visit.append(inst.target)
                to_visit.append(offset + len(inst.operand) + 1)
            elif inst.mnemonic == 'JMP':
                # Unconditional jump
                if inst.target and inst.mode == 'ABS':
                    rom_target = self.cpu_to_rom(inst.target, bank)
                    if rom_target > 0:
                        to_visit.append(rom_target)
            elif inst.mnemonic == 'JSR':
                # Subroutine call - continue after return
                if inst.target:
                    rom_target = self.cpu_to_rom(inst.target, bank)
                    if rom_target > 0:
                        self.entry_points.add(rom_target)
                to_visit.append(offset + len(inst.operand) + 1)
            elif inst.mnemonic in ('RTS', 'RTI', 'BRK'):
                # End of routine
                pass
            else:
                # Regular instruction - continue
                if inst.mode != 'DATA':
                    to_visit.append(offset + len(inst.operand) + 1)
        
        return visited


def main():
    """Main disassembly routine."""
    script_dir = os.path.dirname(os.path.abspath(__file__))
    project_root = os.path.dirname(script_dir)
    rom_path = os.path.join(project_root, 'roms', 'Dragon Warrior IV (1992-10)(Enix)(US).nes')
    
    if not os.path.exists(rom_path):
        print(f"ROM file not found: {rom_path}")
        sys.exit(1)
    
    print(f"Loading ROM: {rom_path}")
    with open(rom_path, 'rb') as f:
        rom_data = f.read()
    
    print(f"ROM size: {len(rom_data)} bytes")
    
    # Parse iNES header
    prg_size = rom_data[4] * 16384  # PRG-ROM size
    chr_size = rom_data[5] * 8192   # CHR-ROM size
    mapper = (rom_data[6] >> 4) | (rom_data[7] & 0xF0)
    
    print(f"PRG-ROM: {prg_size} bytes ({rom_data[4]} x 16KB banks)")
    print(f"CHR-ROM: {chr_size} bytes")
    print(f"Mapper: {mapper}")
    
    dis = Disassembler(rom_data)
    
    # Read interrupt vectors from end of PRG-ROM
    # Vectors are at CPU addresses $FFFA-$FFFF which map to last 6 bytes of PRG
    vec_offset = 16 + prg_size - 6
    vec_nmi = rom_data[vec_offset] | (rom_data[vec_offset + 1] << 8)
    vec_reset = rom_data[vec_offset + 2] | (rom_data[vec_offset + 3] << 8)
    vec_irq = rom_data[vec_offset + 4] | (rom_data[vec_offset + 5] << 8)
    
    print(f"\nInterrupt Vectors (at ROM 0x{vec_offset:05X}):")
    print(f"  NMI:   ${vec_nmi:04X}")
    print(f"  RESET: ${vec_reset:04X}")
    print(f"  IRQ:   ${vec_irq:04X}")
    
    # Add labels for vectors
    dis.add_label(vec_nmi, 'NMI_Handler')
    dis.add_label(vec_reset, 'Reset_Handler')
    dis.add_label(vec_irq, 'IRQ_Handler')
    
    # Calculate ROM offset for reset handler
    # CPU $E000-$FFFF maps to last 8KB of PRG
    # CPU $C000-$DFFF maps to second-to-last 8KB (for MMC3 mode)
    
    def cpu_to_rom_fixed(cpu_addr):
        """Convert CPU address to ROM offset for fixed bank."""
        if cpu_addr >= 0xE000:
            # Last 8KB of PRG
            return 16 + prg_size - 0x10000 + cpu_addr
        elif cpu_addr >= 0xC000:
            # Second-to-last 8KB (for MMC3, this is switchable or fixed depending on mode)
            # Assume it's also in the last 16KB bank
            return 16 + prg_size - 0x10000 + cpu_addr
        elif cpu_addr >= 0x8000:
            # Switchable - need to know which bank
            return -1
        return -1
    
    # Disassemble the reset handler
    print("\n" + "=" * 70)
    print("RESET HANDLER")
    print("=" * 70)
    
    reset_rom = cpu_to_rom_fixed(vec_reset)
    if reset_rom < 0:
        print(f"Reset vector ${vec_reset:04X} is in switchable bank area")
    else:
        print(f"Reset vector ${vec_reset:04X} -> ROM offset 0x{reset_rom:05X}")
        
        # Disassemble
        lines = []
        offset = reset_rom
        cpu_addr = vec_reset
        
        for i in range(50):  # Disassemble up to 50 instructions
            if offset >= len(rom_data):
                break
                
            inst = dis.disassemble_instruction(offset)
            if inst is None:
                break
            
            # Format the line
            length = len(inst.operand) + 1
            raw_bytes = rom_data[offset:offset + length]
            hex_str = ' '.join(f'{b:02X}' for b in raw_bytes)
            
            operand_str = dis.format_operand(inst, 31)
            
            line = f'  ${cpu_addr:04X}  {hex_str:<12}  {inst.mnemonic:<4} {operand_str}'
            lines.append(line)
            
            # Stop at RTS/RTI/BRK or JMP
            if inst.mnemonic in ('RTS', 'RTI', 'BRK'):
                break
            if inst.mnemonic == 'JMP':
                # Follow the jump if it's in fixed bank
                if inst.target and inst.target >= 0xC000:
                    lines.append(f'\n  ; Jump to ${inst.target:04X}')
                    target_rom = cpu_to_rom_fixed(inst.target)
                    if target_rom > 0:
                        offset = target_rom
                        cpu_addr = inst.target
                        continue
                break
            
            offset += length
            cpu_addr += length
        
        for line in lines:
            print(line)
    
    # Save disassembly to file
    output_dir = os.path.join(project_root, 'docs', 'disassembly')
    os.makedirs(output_dir, exist_ok=True)
    
    output_path = os.path.join(output_dir, 'vectors.asm')
    with open(output_path, 'w') as f:
        f.write("; Dragon Warrior IV (NES) - Interrupt Vector Handlers\n")
        f.write("; Auto-generated by disassembler.py\n")
        f.write("; ============================================\n\n")
        f.write(f"; PRG-ROM: {prg_size} bytes\n")
        f.write(f"; Mapper: {mapper}\n\n")
        f.write(f"; NMI Vector:   ${vec_nmi:04X}\n")
        f.write(f"; RESET Vector: ${vec_reset:04X}\n")
        f.write(f"; IRQ Vector:   ${vec_irq:04X}\n\n")
        
        f.write("; ============================================\n")
        f.write("; RESET HANDLER\n")
        f.write("; ============================================\n")
        for line in lines:
            f.write(line + '\n')
    
    print(f"\nDisassembly saved to: {output_path}")


if __name__ == '__main__':
    main()
