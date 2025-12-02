# Dragon Warrior IV - Source Files

This directory contains the disassembled source code and data files for Dragon Warrior IV (NES).

## Directory Structure

```
source_files/
├── asm/                    # Assembly source files
│   ├── dw4.asm             # Main assembly file
│   ├── dw4.cfg             # Linker configuration (ca65/ld65)
│   └── banks/              # Per-bank source files (TODO)
│       ├── bank_00.asm     # Main program code
│       ├── bank_08.asm     # Data tables
│       ├── bank_0c.asm     # Text bank
│       └── ...
├── data/                   # Data files in assembly format
│   ├── monsters.asm        # Monster stats data (TODO)
│   ├── items.asm           # Item data (TODO)
│   ├── spells.asm          # Spell data (TODO)
│   └── text.asm            # Text/dialog data (TODO)
└── include/                # Include files
    ├── constants.inc       # System and game constants
    ├── ram_map.inc         # RAM address definitions
    └── macros.inc          # Common macros
```

## Building

### Prerequisites

- [cc65](https://cc65.github.io/) - 6502 assembler suite (ca65, ld65)

### Build Command

```bash
cd source_files/asm
ca65 -o dw4.o dw4.asm
ld65 -C dw4.cfg -o dw4.nes dw4.o
```

## ROM Information

- **Mapper:** MMC3 (iNES Mapper 4)
- **PRG ROM:** 512 KB (32 × 16KB banks)
- **CHR ROM:** 0 KB (uses CHR-RAM)
- **PRG RAM:** 8 KB (battery-backed)

## Bank Layout

| Bank  | Address       | Contents                |
|-------|---------------|-------------------------|
| 0x00  | $8000-$BFFF   | Main program code       |
| 0x01  | $8000-$BFFF   | Program code            |
| ...   | ...           | ...                     |
| 0x06  | $8000-$BFFF   | Game logic / Battle     |
| 0x07  | $8000-$BFFF   | Game logic              |
| 0x08  | $8000-$BFFF   | **Data tables**         |
| 0x09  | $8000-$BFFF   | **Map data**            |
| 0x0A  | $8000-$BFFF   | **Map data**            |
| 0x0B  | $8000-$BFFF   | **Map data**            |
| 0x0C  | $8000-$BFFF   | **Text/dialog**         |
| 0x0D  | $8000-$BFFF   | **Text/dialog**         |
| 0x0E  | $8000-$BFFF   | **Text/dialog**         |
| 0x0F  | $C000-$FFFF   | **Fixed bank** (always mapped) |
| ...   | ...           | ...                     |
| 0x1E  | $C000-$FFFF   | Fixed high bank         |
| 0x1F  | (vectors)     | NMI/Reset/IRQ vectors   |

## Include Files

### constants.inc

System-level constants:
- PPU/APU register addresses
- Controller button masks
- MMC3 register addresses
- Game-specific constants (character IDs, element types, etc.)
- Text control codes

### ram_map.inc

Memory map definitions:
- Zero page variables ($00-$FF)
- OAM buffer ($0200)
- Party/inventory data ($0400)
- Battle state ($0600)
- WRAM/save data ($6000)

### macros.inc

Common assembly macros:
- Bank switching
- 16-bit operations
- PPU helpers
- Controller input
- Data definition helpers

## Using `.include` Directives

The source files use ca65's `.include` directive to organize code:

```asm
; Include all definitions at the top
    .include "include/constants.inc"
    .include "include/ram_map.inc"
    .include "include/macros.inc"

; Include data files where needed
    .include "data/monsters.asm"
```

## Progress Status

- [x] Initial framework created
- [x] Include files (constants, RAM map, macros)
- [x] Linker configuration
- [ ] Bank-by-bank disassembly
- [ ] Data table extraction to assembly
- [ ] Label all subroutines
- [ ] Document all functions

## Related Tools

- `tools/asset_extractor.py` - Extract data from ROM to JSON
- `tools/rom_analyzer.py` - Analyze ROM structure
- `tools/text_decoder.py` - Decode text using TBL

## References

- [NESDev Wiki - MMC3](https://www.nesdev.org/wiki/MMC3)
- [NESDev Wiki - iNES](https://www.nesdev.org/wiki/INES)
- [ca65 User Guide](https://cc65.github.io/doc/ca65.html)
