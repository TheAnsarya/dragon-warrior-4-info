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
│   ├── monsters.asm        # Monster stats data (generated)
│   ├── items.asm           # Item data (generated)
│   ├── spells.asm          # Spell data (generated)
│   └── shops.asm           # Shop data (generated)
└── include/                # Include files
    ├── constants.inc       # System and game constants
    ├── ram_map.inc         # RAM address definitions (wiki-verified)
    ├── macros.inc          # Common macros
    ├── items.inc           # Item constants (127 items)
    ├── maps.inc            # Map constants (73 maps)
    └── spells.inc          # Spell constants and bitmasks
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

Memory map definitions (verified from GameInfo wiki):
- Zero page variables ($00-$FF)
- System RAM map numbers ($63-$64)
- OAM buffer ($0200)
- Party member data ($6001-$610E) - 30 bytes per character
- Extra companion data ($610F-$611A) - 6 bytes each
- Game state ($6157-$62ED) - gold, chapter, tactics, etc.
- Return spell locations (bitfields)
- Map/tileset RAM ($6F20-$7800+)
- Hero spell bitmasks documented

### macros.inc

Common assembly macros:
- Bank switching
- 16-bit operations
- PPU helpers
- Controller input
- Data definition helpers

### items.inc

Complete item definitions (127 items from wiki):
- Weapons ($00-$23): 36 items
- Armor ($24-$3C): 25 items
- Shields ($3D-$45): 9 items
- Helms ($46-$4F): 10 items
- Accessories ($50): 1 item
- Consumables ($52-$7E): 45 items
- Helper macros for item operations

### maps.inc

Complete map definitions (73 maps from wiki):
- Towns & Castles ($00-$1B)
- Shrines & Special Buildings ($1C-$2C)
- Dungeons ($2D-$44)
- Final Areas ($45-$48)
- Detailed submaps for major locations
- Map tile format documentation

### spells.inc

Spell definitions and character assignments:
- Hero battle spell bitmasks
- Hero world spell bitmasks
- Spell name constants by category
- MP cost estimates
- Helper macros for spell operations

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
- [x] Item definitions (items.inc) - 127 items
- [x] Map definitions (maps.inc) - 73 maps
- [x] Spell definitions (spells.inc) - Hero spells
- [x] RAM map verified from wiki (ram_map.inc)
- [ ] Bank-by-bank disassembly
- [ ] Data table extraction to assembly
- [ ] Label all subroutines
- [ ] Document all functions
- [ ] Other character spell layouts

## Related Tools

- `tools/asset_extractor.py` - Extract data from ROM to JSON
- `tools/rom_analyzer.py` - Analyze ROM structure
- `tools/text_decoder.py` - Decode text using TBL

## References

- [NESDev Wiki - MMC3](https://www.nesdev.org/wiki/MMC3)
- [NESDev Wiki - iNES](https://www.nesdev.org/wiki/INES)
- [ca65 User Guide](https://cc65.github.io/doc/ca65.html)
