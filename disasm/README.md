# Dragon Warrior IV (NES) - Disassembly Overview

This directory contains disassembled code from all 32 banks of the Dragon Warrior IV ROM.

## Memory Map

| Address Range | Description |
|---------------|-------------|
| $0000-$00FF   | Zero Page RAM |
| $0100-$01FF   | Stack |
| $0200-$07FF   | RAM |
| $6000-$7FFF   | SRAM (Battery-backed save data) |
| $8000-$BFFF   | Switchable PRG-ROM bank (Banks 0-30) |
| $C000-$FFFF   | Fixed PRG-ROM bank (Bank 31) |

## Bank Information

| Bank | Lines | Base Address | Notes |
|------|-------|--------------|-------|
| 00   | 10294 | $8000 | Switchable |
| 01   | 10316 | $8000 | Switchable |
| 02   | 10297 | $8000 | Switchable |
| 03   | 10242 | $8000 | Switchable |
| 04   | 10203 | $8000 | Switchable |
| 05   | 11806 | $8000 | Switchable |
| 06   | 12517 | $8000 | Switchable - Contains graphics/sprite data |
| 07   | 12312 | $8000 | Switchable |
| 08   | 11230 | $8000 | Switchable - Contains stat tables |
| 09   | 10710 | $8000 | Switchable |
| 10   | 10539 | $8000 | Switchable |
| 11   | 10974 | $8000 | Switchable |
| 12   | 12241 | $8000 | Switchable |
| 13   | 12449 | $8000 | Switchable |
| 14   | 13565 | $8000 | Switchable - Largest bank |
| 15   | 9662  | $8000 | Switchable - Smallest switchable bank |
| 16   | 11232 | $8000 | Switchable |
| 17   | 11605 | $8000 | Switchable |
| 18   | 10935 | $8000 | Switchable |
| 19   | 10263 | $8000 | Switchable |
| 20   | 10779 | $8000 | Switchable |
| 21   | 11120 | $8000 | Switchable |
| 22   | 10319 | $8000 | Switchable |
| 23   | 11511 | $8000 | Switchable |
| 24   | 11880 | $8000 | Switchable |
| 25   | 10462 | $8000 | Switchable |
| 26   | 10324 | $8000 | Switchable |
| 27   | 11103 | $8000 | Switchable |
| 28   | 10631 | $8000 | Switchable |
| 29   | 10270 | $8000 | Switchable |
| 30   | 10565 | $8000 | Switchable - High code density |
| 31   | 10326 | $C000 | **Fixed bank** - Always mapped |

**Total: 351,778 lines of disassembly**

## Key Systems (Bank 31 - Fixed Bank)

### RNG System ($C890-$C8CB)
- `$C890` - rng_return
- `$C891` - rng_main (main RNG function)
- `$C8A1` - rng_inc_counter
- `$C8A6` - rng_load_seed
- `$C8AD` - rng_shifter (8-bit XOR feedback shift)

### RNG Variables
- `$0012` - rng_seed_lo
- `$0013` - rng_seed_hi
- `$0016` - rng_temp
- `$050C` - rng_counter_compare
- `$050D` - rng_counter

### Interrupt Vectors (End of Bank 31)
- `$FFFA` - NMI Vector
- `$FFFC` - Reset Vector
- `$FFFE` - IRQ/BRK Vector

## Save Data Layout (SRAM at $6000-$7FFF)

| Address Range | Description |
|---------------|-------------|
| $6000-$62EE   | Current/Active game state |
| $62EF-$65DE   | Save File 1 |
| $65DF-$68CE   | Save File 2 |
| $68CF-$6BBE   | Save File 3 |

## Files

- `bank00.asm` through `bank31.asm` - Individual bank disassemblies
- `bank31_fixed.asm` - Enhanced fixed bank disassembly with known labels

## Tools Used

- `disassemble_all_banks.py` - Main disassembler for all banks
- `disassemble_bank31_fixed.py` - Enhanced Bank 31 disassembler with labels

## Notes

- The disassembly is generated automatically and may contain some data sections interpreted as code
- Branch targets and jump targets are automatically labeled
- Known labels from `cowness_labels.txt` can be incorporated for enhanced readability
