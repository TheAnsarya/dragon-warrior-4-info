#!/usr/bin/env python3
"""
Disassemble the fixed bank (Bank 31, $C000-$FFFF) of Dragon Warrior IV.

The fixed bank contains:
- Main initialization routines
- NMI handler
- IRQ handler
- RNG functions
- Bank switching code
- Core utility functions

This bank is always mapped at $C000-$FFFF and is crucial for understanding
how the game operates.
"""

import os
from pathlib import Path
from collections import defaultdict

SCRIPT_DIR = Path(__file__).parent
PROJECT_ROOT = SCRIPT_DIR.parent
ROM_PATH = PROJECT_ROOT / "roms" / "Dragon Warrior IV (1992-10)(Enix)(US).nes"
OUTPUT_DIR = PROJECT_ROOT / "disasm"

# 6502 opcode mnemonics with addressing modes
OPCODES = {
    0x00: ("BRK", "imp", 1), 0x01: ("ORA", "izx", 2), 0x05: ("ORA", "zp", 2),
    0x06: ("ASL", "zp", 2), 0x08: ("PHP", "imp", 1), 0x09: ("ORA", "imm", 2),
    0x0A: ("ASL", "acc", 1), 0x0D: ("ORA", "abs", 3), 0x0E: ("ASL", "abs", 3),
    0x10: ("BPL", "rel", 2), 0x11: ("ORA", "izy", 2), 0x15: ("ORA", "zpx", 2),
    0x16: ("ASL", "zpx", 2), 0x18: ("CLC", "imp", 1), 0x19: ("ORA", "aby", 3),
    0x1D: ("ORA", "abx", 3), 0x1E: ("ASL", "abx", 3), 0x20: ("JSR", "abs", 3),
    0x21: ("AND", "izx", 2), 0x24: ("BIT", "zp", 2), 0x25: ("AND", "zp", 2),
    0x26: ("ROL", "zp", 2), 0x28: ("PLP", "imp", 1), 0x29: ("AND", "imm", 2),
    0x2A: ("ROL", "acc", 1), 0x2C: ("BIT", "abs", 3), 0x2D: ("AND", "abs", 3),
    0x2E: ("ROL", "abs", 3), 0x30: ("BMI", "rel", 2), 0x31: ("AND", "izy", 2),
    0x35: ("AND", "zpx", 2), 0x36: ("ROL", "zpx", 2), 0x38: ("SEC", "imp", 1),
    0x39: ("AND", "aby", 3), 0x3D: ("AND", "abx", 3), 0x3E: ("ROL", "abx", 3),
    0x40: ("RTI", "imp", 1), 0x41: ("EOR", "izx", 2), 0x45: ("EOR", "zp", 2),
    0x46: ("LSR", "zp", 2), 0x48: ("PHA", "imp", 1), 0x49: ("EOR", "imm", 2),
    0x4A: ("LSR", "acc", 1), 0x4C: ("JMP", "abs", 3), 0x4D: ("EOR", "abs", 3),
    0x4E: ("LSR", "abs", 3), 0x50: ("BVC", "rel", 2), 0x51: ("EOR", "izy", 2),
    0x55: ("EOR", "zpx", 2), 0x56: ("LSR", "zpx", 2), 0x58: ("CLI", "imp", 1),
    0x59: ("EOR", "aby", 3), 0x5D: ("EOR", "abx", 3), 0x5E: ("LSR", "abx", 3),
    0x60: ("RTS", "imp", 1), 0x61: ("ADC", "izx", 2), 0x65: ("ADC", "zp", 2),
    0x66: ("ROR", "zp", 2), 0x68: ("PLA", "imp", 1), 0x69: ("ADC", "imm", 2),
    0x6A: ("ROR", "acc", 1), 0x6C: ("JMP", "ind", 3), 0x6D: ("ADC", "abs", 3),
    0x6E: ("ROR", "abs", 3), 0x70: ("BVS", "rel", 2), 0x71: ("ADC", "izy", 2),
    0x75: ("ADC", "zpx", 2), 0x76: ("ROR", "zpx", 2), 0x78: ("SEI", "imp", 1),
    0x79: ("ADC", "aby", 3), 0x7D: ("ADC", "abx", 3), 0x7E: ("ROR", "abx", 3),
    0x81: ("STA", "izx", 2), 0x84: ("STY", "zp", 2), 0x85: ("STA", "zp", 2),
    0x86: ("STX", "zp", 2), 0x88: ("DEY", "imp", 1), 0x8A: ("TXA", "imp", 1),
    0x8C: ("STY", "abs", 3), 0x8D: ("STA", "abs", 3), 0x8E: ("STX", "abs", 3),
    0x90: ("BCC", "rel", 2), 0x91: ("STA", "izy", 2), 0x94: ("STY", "zpx", 2),
    0x95: ("STA", "zpx", 2), 0x96: ("STX", "zpy", 2), 0x98: ("TYA", "imp", 1),
    0x99: ("STA", "aby", 3), 0x9A: ("TXS", "imp", 1), 0x9D: ("STA", "abx", 3),
    0xA0: ("LDY", "imm", 2), 0xA1: ("LDA", "izx", 2), 0xA2: ("LDX", "imm", 2),
    0xA4: ("LDY", "zp", 2), 0xA5: ("LDA", "zp", 2), 0xA6: ("LDX", "zp", 2),
    0xA8: ("TAY", "imp", 1), 0xA9: ("LDA", "imm", 2), 0xAA: ("TAX", "imp", 1),
    0xAC: ("LDY", "abs", 3), 0xAD: ("LDA", "abs", 3), 0xAE: ("LDX", "abs", 3),
    0xB0: ("BCS", "rel", 2), 0xB1: ("LDA", "izy", 2), 0xB4: ("LDY", "zpx", 2),
    0xB5: ("LDA", "zpx", 2), 0xB6: ("LDX", "zpy", 2), 0xB8: ("CLV", "imp", 1),
    0xB9: ("LDA", "aby", 3), 0xBA: ("TSX", "imp", 1), 0xBC: ("LDY", "abx", 3),
    0xBD: ("LDA", "abx", 3), 0xBE: ("LDX", "aby", 3), 0xC0: ("CPY", "imm", 2),
    0xC1: ("CMP", "izx", 2), 0xC4: ("CPY", "zp", 2), 0xC5: ("CMP", "zp", 2),
    0xC6: ("DEC", "zp", 2), 0xC8: ("INY", "imp", 1), 0xC9: ("CMP", "imm", 2),
    0xCA: ("DEX", "imp", 1), 0xCC: ("CPY", "abs", 3), 0xCD: ("CMP", "abs", 3),
    0xCE: ("DEC", "abs", 3), 0xD0: ("BNE", "rel", 2), 0xD1: ("CMP", "izy", 2),
    0xD5: ("CMP", "zpx", 2), 0xD6: ("DEC", "zpx", 2), 0xD8: ("CLD", "imp", 1),
    0xD9: ("CMP", "aby", 3), 0xDD: ("CMP", "abx", 3), 0xDE: ("DEC", "abx", 3),
    0xE0: ("CPX", "imm", 2), 0xE1: ("SBC", "izx", 2), 0xE4: ("CPX", "zp", 2),
    0xE5: ("SBC", "zp", 2), 0xE6: ("INC", "zp", 2), 0xE8: ("INX", "imp", 1),
    0xE9: ("SBC", "imm", 2), 0xEA: ("NOP", "imp", 1), 0xEC: ("CPX", "abs", 3),
    0xED: ("SBC", "abs", 3), 0xEE: ("INC", "abs", 3), 0xF0: ("BEQ", "rel", 2),
    0xF1: ("SBC", "izy", 2), 0xF5: ("SBC", "zpx", 2), 0xF6: ("INC", "zpx", 2),
    0xF8: ("SED", "imp", 1), 0xF9: ("SBC", "aby", 3), 0xFD: ("SBC", "abx", 3),
    0xFE: ("INC", "abx", 3),
}

# Known labels for the fixed bank (from our analysis and cowness.net)
KNOWN_LABELS = {
    # Main Initialization
    0xC03D: "main_init",
    0xC03E: "vblank_wait_1",
    0xC043: "vblank_wait_2",
    0xC067: "setup_nmi_vector",
    0xC07E: "clear_ram_loop",

    # Bank Switching
    0xC104: "init_subroutine",
    0xC118: "mmc1_write_control",
    0xC12F: "mmc1_write_chr1",
    0xC146: "mmc1_write_prg",

    # NMI Handler
    0xC15A: "NMI_main",
    0xC181: "NMI_check_stack",
    0xC1EF: "NMI_update_frame",
    0xC213: "NMI_return",
    0xC219: "NMI_to_irq",

    # PPU Update
    0xC222: "ppu_buffer_transfer",
    0xC241: "ppu_write_loop",
    0xC267: "ppu_write_data",
    0xC276: "ppu_update_palette",
    0xC297: "ppu_update_tiles",
    0xC2EA: "ppu_set_scroll",
    0xC303: "oam_dma",

    # IRQ Handler
    0xC408: "IRQ_handler",
    0xC423: "irq_read_operand",
    0xC460: "irq_dispatch_03",
    0xC463: "irq_dispatch_0B",
    0xC4CA: "irq_set_flag",
    0xC4E1: "irq_clear_flag",
    0xC4F8: "irq_extended",

    # System Utilities
    0xC52F: "clear_system_state",
    0xC543: "clear_oam_buffer",

    # RNG System (from cowness.net)
    0xC890: "rng_return",
    0xC891: "rng_main",
    0xC8A1: "rng_inc_counter",
    0xC8A6: "rng_load_seed",
    0xC8AD: "rng_shifter",
    0xC8CB: "rng_shifter_end",
    0xC913: "rng_related",

    # Main Loop
    0xC968: "main_loop_entry",
    0xC97D: "main_loop",
    0xC983: "setup_bank_trampoline",
    0xC9ED: "main_frame_handler",

    # Frame Handler
    0xCA21: "sub_CA21",
    0xCB98: "read_controller",
    0xCBB4: "timer_update",

    # Battle System Access
    0xCC16: "fixed_cmp_limit_x",
    0xCC1D: "fixed_cmp_limit_y",
    0xCC28: "fixed_read_actor_1",
    0xCC33: "fixed_ldx_limit_x",
    0xCC36: "fixed_ldy_limit_y",
    0xCCB0: "fixed_set_counter_1",
    0xCCB8: "fixed_set_counter_2",
    0xCF41: "fixed_read_actor_2",
    0xCFD7: "fixed_cmp_counter_1",
    0xCFDE: "fixed_cmp_counter_2",

    # Map/Movement
    0xD542: "map_handler",
    0xE06E: "movement_update",

    # High ROM
    0xF148: "fixed_read_actor_3",
    0xF15D: "fixed_read_actor_4",
    0xF164: "fixed_inc_actor",
    0xFF00: "utility_area",
    0xFF74: "nmi_rng_update",
    0xFF79: "nmi_inc_seed",
    0xFF82: "nmi_call_rng",
    0xFF8E: "jump_main_init",
    0xFF91: "bank_switch",

    # Reset
    0xFFD8: "RESET_entry",
    0xFFDF: "mmc1_reset_trigger",

    # Vectors
    0xFFFA: "vec_NMI",
    0xFFFC: "vec_RESET",
    0xFFFE: "vec_IRQ",
}

# Known RAM labels
RAM_LABELS = {
    0x0012: "rng_seed_lo",
    0x0013: "rng_seed_hi",
    0x0016: "rng_temp",
    0x0018: "encounter_rate",
    0x001F: "state_flags",
    0x050C: "rng_counter_cmp",
    0x050D: "rng_counter",
    0x0507: "current_bank",
    0x615A: "battle_actor_index",
    0x618E: "battle_state_flags",
    0x6195: "battle_counter_1",
    0x6196: "battle_counter_2",
    0x6197: "battle_limit_x",
    0x6198: "battle_limit_y",
}


def disassemble_instruction(rom, addr, cpu_addr, bank_rom_end):
    """Disassemble a single instruction at the given address."""
    opcode = rom[addr]

    if opcode not in OPCODES:
        return f".db ${opcode:02X}", 1, None

    mnemonic, mode, size = OPCODES[opcode]

    # Check bounds
    if addr + size > bank_rom_end:
        return f".db ${opcode:02X}", 1, None

    if size == 1:
        operand_str = ""
        target = None
    elif size == 2:
        operand = rom[addr + 1]
        if mode == "imm":
            operand_str = f"#${operand:02X}"
            target = None
        elif mode == "zp":
            label = RAM_LABELS.get(operand, f"${operand:02X}")
            operand_str = label
            target = None
        elif mode == "zpx":
            label = RAM_LABELS.get(operand, f"${operand:02X}")
            operand_str = f"{label},X"
            target = None
        elif mode == "zpy":
            label = RAM_LABELS.get(operand, f"${operand:02X}")
            operand_str = f"{label},Y"
            target = None
        elif mode == "izx":
            operand_str = f"(${operand:02X},X)"
            target = None
        elif mode == "izy":
            operand_str = f"(${operand:02X}),Y"
            target = None
        elif mode == "rel":
            # Calculate branch target
            offset = operand if operand < 128 else operand - 256
            target = cpu_addr + 2 + offset
            label = KNOWN_LABELS.get(target, f"${target:04X}")
            operand_str = label
        else:
            operand_str = f"${operand:02X}"
            target = None
    elif size == 3:
        operand_lo = rom[addr + 1]
        operand_hi = rom[addr + 2]
        operand = operand_lo | (operand_hi << 8)
        target = operand

        # Check for known labels
        if operand in KNOWN_LABELS:
            label = KNOWN_LABELS[operand]
        elif operand in RAM_LABELS:
            label = RAM_LABELS[operand]
        else:
            label = f"${operand:04X}"

        if mode == "abs":
            operand_str = label
        elif mode == "abx":
            operand_str = f"{label},X"
        elif mode == "aby":
            operand_str = f"{label},Y"
        elif mode == "ind":
            operand_str = f"({label})"
        else:
            operand_str = label

    if mode == "acc":
        operand_str = "A"

    instr = f"{mnemonic} {operand_str}".strip() if operand_str else mnemonic
    return instr, size, target


def find_jsr_targets(rom, bank_start, bank_end):
    """Find all JSR targets to identify subroutines."""
    targets = set()
    addr = bank_start

    while addr < bank_end:
        opcode = rom[addr]
        if opcode not in OPCODES:
            addr += 1
            continue

        mnemonic, mode, size = OPCODES[opcode]

        if mnemonic == "JSR" and size == 3:
            target = rom[addr + 1] | (rom[addr + 2] << 8)
            if 0xC000 <= target <= 0xFFFF:
                targets.add(target)

        addr += size

    return targets


def disassemble_fixed_bank(rom):
    """Disassemble the entire fixed bank."""
    # Bank 31 is at ROM offset $7C000 (after 16-byte header: $7C010)
    # Actually for a 512KB ROM: Bank 31 = (31 * 0x4000) + 16 = $7C010
    bank_rom_start = 16 + 31 * 0x4000  # $7C010
    bank_rom_end = bank_rom_start + 0x4000  # $80010

    cpu_start = 0xC000
    cpu_end = 0x10000

    # Find all JSR targets
    jsr_targets = find_jsr_targets(rom, bank_rom_start, bank_rom_end)

    # Combine with known labels
    all_labels = dict(KNOWN_LABELS)
    for target in jsr_targets:
        if target not in all_labels:
            all_labels[target] = f"sub_{target:04X}"

    # Disassemble
    output = []
    output.append("; Dragon Warrior IV - Fixed Bank (Bank 31) Disassembly")
    output.append("; ============================================")
    output.append(";")
    output.append("; Bank 31 is mapped at $C000-$FFFF and is always loaded.")
    output.append("; Contains: Init, NMI, IRQ, RNG, Bank switching, Core utilities")
    output.append(";")
    output.append(f"; ROM offset: ${bank_rom_start:05X} - ${bank_rom_end:05X}")
    output.append(f"; CPU address: ${cpu_start:04X} - ${cpu_end-1:04X}")
    output.append(f"; Subroutines found: {len(jsr_targets)}")
    output.append("")
    output.append("; ============================================")
    output.append("")

    addr = bank_rom_start
    cpu_addr = cpu_start
    last_was_end = False

    while addr < bank_rom_end:
        # Check for label
        if cpu_addr in all_labels:
            if not last_was_end:
                output.append("")
            output.append(f"{all_labels[cpu_addr]}:")
            last_was_end = False

        # Disassemble instruction
        instr, size, target = disassemble_instruction(rom, addr, cpu_addr, bank_rom_end)

        # Format: address, hex bytes, instruction
        hex_bytes = " ".join(f"{rom[addr+i]:02X}" for i in range(size))
        output.append(f"  ${cpu_addr:04X}:  {hex_bytes:<8}  {instr}")

        # Check if this ends a subroutine
        opcode = rom[addr]
        if opcode in (0x60, 0x40, 0x4C, 0x6C):  # RTS, RTI, JMP
            if opcode in (0x60, 0x40):  # RTS or RTI
                last_was_end = True
        else:
            last_was_end = False

        addr += size
        cpu_addr += size

    return output


def main():
    print("=" * 70)
    print("Dragon Warrior IV - Fixed Bank (Bank 31) Disassembly")
    print("=" * 70)
    print()

    if not ROM_PATH.exists():
        print(f"ERROR: ROM not found at {ROM_PATH}")
        return

    with open(ROM_PATH, "rb") as f:
        rom = f.read()

    print(f"ROM loaded: {len(rom)} bytes")

    # Disassemble
    output = disassemble_fixed_bank(rom)

    # Write to file
    OUTPUT_DIR.mkdir(exist_ok=True)
    output_file = OUTPUT_DIR / "bank31_fixed.asm"

    with open(output_file, "w", encoding="utf-8") as f:
        f.write("\n".join(output))

    print(f"Disassembly written to {output_file}")
    print(f"Total lines: {len(output)}")


if __name__ == "__main__":
    main()
