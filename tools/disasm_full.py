#!/usr/bin/env python3
"""
Dragon Warrior IV - Full Bank Disassembler
==========================================
Disassembles the fixed banks ($C000-$FFFF) with labels and comments.
"""

import os
import sys
from typing import Dict, List, Tuple, Optional

# 6502 Opcode table
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

class Disassembler:
    def __init__(self, rom_path: str):
        with open(rom_path, 'rb') as f:
            self.rom = f.read()

        self.prg_size = self.rom[4] * 16384
        self.labels: Dict[int, str] = {}
        self.comments: Dict[int, str] = {}
        self.auto_labels: Dict[int, str] = {}

        # Hardware register labels
        self.hw_labels = {
            0x2000: "PPUCTRL", 0x2001: "PPUMASK", 0x2002: "PPUSTATUS",
            0x2003: "OAMADDR", 0x2004: "OAMDATA", 0x2005: "PPUSCROLL",
            0x2006: "PPUADDR", 0x2007: "PPUDATA", 0x4014: "OAMDMA",
            0x4015: "APU_STATUS", 0x4016: "JOY1", 0x4017: "JOY2",
        }

        # Known RAM variables
        self.ram_labels = {
            0x0063: "MapNumber", 0x0064: "SubmapNumber",
            0x0500: "vblank_flag", 0x0501: "ppuctrl_shadow",
            0x0502: "NMI_JMP", 0x0503: "NMI_target_lo", 0x0504: "NMI_target_hi",
            0x0507: "current_bank",
        }

    def cpu_to_rom(self, addr: int) -> int:
        """Convert CPU address to ROM offset (fixed bank only)"""
        if addr >= 0xC000:
            return 16 + self.prg_size - 0x10000 + addr
        return -1

    def read_byte(self, rom_offset: int) -> int:
        return self.rom[rom_offset] if 0 <= rom_offset < len(self.rom) else 0

    def read_word(self, rom_offset: int) -> int:
        lo = self.read_byte(rom_offset)
        hi = self.read_byte(rom_offset + 1)
        return (hi << 8) | lo

    def get_label(self, addr: int) -> Optional[str]:
        """Get label for an address"""
        if addr in self.labels:
            return self.labels[addr]
        if addr in self.auto_labels:
            return self.auto_labels[addr]
        if addr in self.hw_labels:
            return self.hw_labels[addr]
        if addr in self.ram_labels:
            return self.ram_labels[addr]
        return None

    def add_auto_label(self, addr: int, prefix: str = "loc"):
        """Add automatic label for jump/branch target"""
        if addr not in self.labels and addr not in self.auto_labels:
            self.auto_labels[addr] = f"{prefix}_{addr:04X}"

    def disassemble_instruction(self, cpu_addr: int) -> Tuple[str, int, Optional[int]]:
        """Disassemble one instruction, returns (formatted_line, size, target_addr)"""
        rom_offset = self.cpu_to_rom(cpu_addr)
        if rom_offset < 0 or rom_offset >= len(self.rom):
            return (f"  .byte ???", 1, None)

        opcode = self.rom[rom_offset]

        if opcode not in OPCODES:
            return (f"  .byte ${opcode:02X}", 1, None)

        mnem, mode, size = OPCODES[opcode]
        operand = bytes(self.rom[rom_offset+1:rom_offset+size])
        target = None

        # Format operand
        if mode == "IMP":
            op_str = ""
        elif mode == "ACC":
            op_str = "A"
        elif mode == "IMM":
            op_str = f"#${operand[0]:02X}"
        elif mode == "ZP":
            lbl = self.get_label(operand[0])
            op_str = lbl if lbl else f"${operand[0]:02X}"
        elif mode == "ZPX":
            lbl = self.get_label(operand[0])
            op_str = f"{lbl if lbl else f'${operand[0]:02X}'},X"
        elif mode == "ZPY":
            lbl = self.get_label(operand[0])
            op_str = f"{lbl if lbl else f'${operand[0]:02X}'},Y"
        elif mode == "ABS":
            addr = operand[0] | (operand[1] << 8)
            lbl = self.get_label(addr)
            op_str = lbl if lbl else f"${addr:04X}"
            if mnem in ("JMP", "JSR"):
                target = addr
                self.add_auto_label(addr, "sub" if mnem == "JSR" else "loc")
        elif mode == "ABX":
            addr = operand[0] | (operand[1] << 8)
            lbl = self.get_label(addr)
            op_str = f"{lbl if lbl else f'${addr:04X}'},X"
        elif mode == "ABY":
            addr = operand[0] | (operand[1] << 8)
            lbl = self.get_label(addr)
            op_str = f"{lbl if lbl else f'${addr:04X}'},Y"
        elif mode == "IND":
            addr = operand[0] | (operand[1] << 8)
            lbl = self.get_label(addr)
            op_str = f"({lbl if lbl else f'${addr:04X}'})"
        elif mode == "IDX":
            lbl = self.get_label(operand[0])
            op_str = f"({lbl if lbl else f'${operand[0]:02X}'},X)"
        elif mode == "IDY":
            lbl = self.get_label(operand[0])
            op_str = f"({lbl if lbl else f'${operand[0]:02X}'}),Y"
        elif mode == "REL":
            offset = operand[0] if operand[0] < 128 else operand[0] - 256
            target = cpu_addr + size + offset
            lbl = self.get_label(target)
            op_str = lbl if lbl else f"${target:04X}"
            self.add_auto_label(target, "loc")
        else:
            op_str = f"${operand[0]:02X}" if operand else ""

        # Format raw bytes
        raw = bytes([opcode]) + operand
        hex_str = ' '.join(f'{b:02X}' for b in raw)

        line = f"  {mnem:4s} {op_str}"

        return (line, size, target)

    def first_pass(self, start: int, end: int):
        """First pass to collect all labels"""
        addr = start
        while addr < end:
            _, size, target = self.disassemble_instruction(addr)
            addr += size

    def disassemble_range(self, start: int, end: int) -> List[str]:
        """Disassemble a range of addresses"""
        # First pass to collect labels
        self.first_pass(start, end)

        lines = []
        addr = start

        while addr < end:
            # Check for label
            lbl = self.get_label(addr)
            if lbl:
                lines.append(f"\n{lbl}:")

            line, size, _ = self.disassemble_instruction(addr)

            # Add address comment
            comment = self.comments.get(addr, "")
            if comment:
                line += f"  ; {comment}"

            lines.append(f"${addr:04X}:{line}")
            addr += size

        return lines

    def disassemble_fixed_banks(self, output_path: str):
        """Disassemble the entire fixed bank region"""
        # Add known labels
        self.labels.update({
            0xC03D: "main_init",
            0xC104: "init_subroutine",
            0xC118: "mmc1_write_control",
            0xC12F: "mmc1_write_chr1",
            0xC146: "mmc1_write_prg",
            0xC15A: "NMI_main",
            0xC222: "ppu_buffer_transfer",
            0xC2EA: "ppu_set_scroll",
            0xC303: "oam_dma",
            0xC408: "IRQ_handler",
            0xC52F: "clear_system_state",
            0xC543: "clear_oam_buffer",
            0xC569: "sub_C569",
            0xC913: "sub_C913",
            0xC91F: "oam_shuffle",
            0xC968: "main_loop_entry",
            0xC97D: "main_loop",
            0xC983: "setup_bank_trampoline",
            0xC9ED: "main_frame_handler",
            0xCA21: "sub_CA21",
            0xCB98: "sub_CB98",
            0xCBB4: "sub_CBB4",
            0xD542: "sub_D542",
            0xE06E: "sub_E06E",
            0xFF74: "wait_vblank",
            0xFF91: "bank_switch",
            0xFFD8: "RESET_entry",
        })

        # Add comments
        self.comments.update({
            0xFFD8: "Entry point from RESET vector",
            0xC03D: "Main initialization routine",
            0xC067: "Set up NMI jump instruction in RAM",
            0xC078: "Initialize stack pointer",
            0xC07E: "Clear zero page and RAM",
        })

        with open(output_path, 'w') as f:
            f.write("; Dragon Warrior IV (NES) - Fixed Bank Disassembly\n")
            f.write("; ================================================\n")
            f.write("; PRG-ROM: 512KB (32 x 16KB banks)\n")
            f.write("; Fixed banks: $C000-$FFFF (last 16KB)\n")
            f.write(";\n")
            f.write("; CPU Vectors:\n")
            f.write(";   NMI:   $0502 (RAM - jumps to $C15A on init)\n")
            f.write(";   RESET: $FFD8\n")
            f.write(";   IRQ:   $C408\n")
            f.write(";\n\n")

            f.write("; ============================================\n")
            f.write("; Hardware Registers\n")
            f.write("; ============================================\n")
            f.write("PPUCTRL    = $2000\n")
            f.write("PPUMASK    = $2001\n")
            f.write("PPUSTATUS  = $2002\n")
            f.write("OAMADDR    = $2003\n")
            f.write("OAMDATA    = $2004\n")
            f.write("PPUSCROLL  = $2005\n")
            f.write("PPUADDR    = $2006\n")
            f.write("PPUDATA    = $2007\n")
            f.write("OAMDMA     = $4014\n")
            f.write("APU_STATUS = $4015\n")
            f.write("JOY1       = $4016\n")
            f.write("JOY2       = $4017\n")
            f.write("\n")

            f.write("; ============================================\n")
            f.write("; RAM Variables\n")
            f.write("; ============================================\n")
            f.write("MapNumber     = $63\n")
            f.write("SubmapNumber  = $64\n")
            f.write("vblank_flag   = $0500\n")
            f.write("ppuctrl_shad  = $0501\n")
            f.write("NMI_JMP       = $0502\n")
            f.write("NMI_target_lo = $0503\n")
            f.write("NMI_target_hi = $0504\n")
            f.write("current_bank  = $0507\n")
            f.write("\n")

            # Disassemble RESET handler first
            f.write("; ============================================\n")
            f.write("; RESET HANDLER ($FFD8)\n")
            f.write("; ============================================\n")
            lines = self.disassemble_range(0xFFD8, 0xFFFA)
            for line in lines:
                f.write(line + "\n")

            f.write("\n; ============================================\n")
            f.write("; VECTORS ($FFFA-$FFFF)\n")
            f.write("; ============================================\n")
            vec_offset = self.cpu_to_rom(0xFFFA)
            nmi = self.read_word(vec_offset)
            reset = self.read_word(vec_offset + 2)
            irq = self.read_word(vec_offset + 4)
            f.write(f"  .word ${nmi:04X}  ; NMI\n")
            f.write(f"  .word ${reset:04X}  ; RESET\n")
            f.write(f"  .word ${irq:04X}  ; IRQ\n")

            # Disassemble main init
            f.write("\n; ============================================\n")
            f.write("; MAIN INIT ($C03D)\n")
            f.write("; ============================================\n")
            lines = self.disassemble_range(0xC03D, 0xC200)
            for line in lines:
                f.write(line + "\n")

            # Disassemble NMI handler
            f.write("\n; ============================================\n")
            f.write("; NMI HANDLER ($C15A)\n")
            f.write("; ============================================\n")
            lines = self.disassemble_range(0xC15A, 0xC300)
            for line in lines:
                f.write(line + "\n")

            # Disassemble IRQ handler
            f.write("\n; ============================================\n")
            f.write("; IRQ HANDLER ($C408)\n")
            f.write("; ============================================\n")
            lines = self.disassemble_range(0xC408, 0xC550)
            for line in lines:
                f.write(line + "\n")

            # Disassemble main game loop area
            f.write("\n; ============================================\n")
            f.write("; MAIN GAME LOOP AREA ($C900-$CA00)\n")
            f.write("; ============================================\n")
            lines = self.disassemble_range(0xC900, 0xCA00)
            for line in lines:
                f.write(line + "\n")

            # Disassemble utility routines at end of ROM
            f.write("\n; ============================================\n")
            f.write("; UTILITY ROUTINES ($FF00-$FFFF)\n")
            f.write("; ============================================\n")
            lines = self.disassemble_range(0xFF00, 0xFFD8)
            for line in lines:
                f.write(line + "\n")

            # Disassemble more game loop routines
            f.write("\n; ============================================\n")
            f.write("; GAME LOOP SUBROUTINES ($CA00-$CC00)\n")
            f.write("; ============================================\n")
            lines = self.disassemble_range(0xCA00, 0xCC00)
            for line in lines:
                f.write(line + "\n")

            # Disassemble possible input handling
            f.write("\n; ============================================\n")
            f.write("; INPUT/CONTROLLER ROUTINES ($C500-$C600)\n")
            f.write("; ============================================\n")
            lines = self.disassemble_range(0xC500, 0xC600)
            for line in lines:
                f.write(line + "\n")

            # Disassemble more subroutines
            f.write("\n; ============================================\n")
            f.write("; SUBROUTINES ($D500-$D600)\n")
            f.write("; ============================================\n")
            lines = self.disassemble_range(0xD500, 0xD600)
            for line in lines:
                f.write(line + "\n")

            # Disassemble E06E area
            f.write("\n; ============================================\n")
            f.write("; MOVEMENT ROUTINES ($E000-$E200)\n")
            f.write("; ============================================\n")
            lines = self.disassemble_range(0xE000, 0xE200)
            for line in lines:
                f.write(line + "\n")

            # Disassemble bank switch areas
            f.write("\n; ============================================\n")
            f.write("; BANK SWITCH AREAS ($DA80-$DB00)\n")
            f.write("; ============================================\n")
            lines = self.disassemble_range(0xDA80, 0xDB00)
            for line in lines:
                f.write(line + "\n")

            f.write("\n; ============================================\n")
            f.write("; BANK SWITCH AREAS ($DF70-$E000)\n")
            f.write("; ============================================\n")
            lines = self.disassemble_range(0xDF70, 0xE000)
            for line in lines:
                f.write(line + "\n")

            f.write("\n; ============================================\n")
            f.write("; BANK 29 CALL AREA ($E600-$E700)\n")
            f.write("; ============================================\n")
            lines = self.disassemble_range(0xE600, 0xE700)
            for line in lines:
                f.write(line + "\n")
            lines = self.disassemble_range(0xE000, 0xE100)
            for line in lines:
                f.write(line + "\n")

        print(f"Wrote disassembly to: {output_path}")


def main():
    script_dir = os.path.dirname(os.path.abspath(__file__))
    project_dir = os.path.dirname(script_dir)

    rom_path = os.path.join(project_dir, "roms", "Dragon Warrior IV (1992-10)(Enix)(US).nes")
    output_path = os.path.join(project_dir, "disasm", "fixed_bank.asm")

    if not os.path.exists(rom_path):
        print(f"ROM not found: {rom_path}")
        sys.exit(1)

    os.makedirs(os.path.dirname(output_path), exist_ok=True)

    dis = Disassembler(rom_path)
    dis.disassemble_fixed_banks(output_path)


if __name__ == "__main__":
    main()
