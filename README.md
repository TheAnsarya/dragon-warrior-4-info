# Dragon Warrior 4 (NES) - Complete Disassembly Project

[![Build Status](https://img.shields.io/badge/build-in_progress-yellow)]()
[![License](https://img.shields.io/badge/license-MIT-blue)]()
[![NES](https://img.shields.io/badge/platform-NES-red)]()

A complete code and asset disassembly of **Dragon Warrior IV** (US NES version, 1992) with full editors for all assets and a comprehensive build pipeline that produces a byte-perfect ROM from source.

## 🎯 Project Goals

1. **Complete Disassembly** - Full 6502 assembly source code for the entire ROM
2. **Asset Extraction** - Extract all game assets (graphics, text, maps, data tables)
3. **Universal Editor** - GUI editor for all extracted assets
4. **Build Pipeline** - Assemble modified source back into a working ROM
5. **Documentation** - Comprehensive documentation of game internals

## 📁 Project Structure

```
dragon-warrior-4-info/
├── .editorconfig              # Code formatting rules (TABS, not spaces!)
├── .gitignore                 # Git ignore rules
├── README.md                  # This file
├── requirements.txt           # Python dependencies
├── build.ps1                  # Main build script (PowerShell)
├── build_rom.ps1              # ROM assembly script
│
├── Ophis/                     # Ophis 6502 assembler
│   └── ophis.exe
│
├── source_files/              # Disassembled 6502 assembly source
│   ├── DW4_Defines.asm        # Constants and memory map definitions
│   ├── Header.asm             # iNES header
│   ├── Bank00.asm             # PRG Bank 0 ($8000-$9FFF)
│   ├── Bank01.asm             # PRG Bank 1 ($A000-$BFFF)
│   ├── ...                    # Additional banks (DW4 has 16 PRG banks)
│   └── generated/             # Generated ASM from asset pipeline
│
├── assets/                    # Extracted/editable game assets
│   ├── json/                  # JSON format data files
│   │   ├── monsters.json      # Monster stats and data
│   │   ├── items.json         # Item definitions
│   │   ├── spells.json        # Spell data
│   │   ├── shops.json         # Shop inventories
│   │   ├── characters.json    # Party member data
│   │   └── experience.json    # Experience tables
│   ├── text/                  # Dialog and text strings
│   ├── graphics/              # PNG format graphics
│   │   ├── sprites/           # Character and monster sprites
│   │   ├── tilesets/          # Map tilesets
│   │   └── ui/                # Menu and UI graphics
│   ├── maps/                  # Map data
│   │   ├── world/             # Overworld maps
│   │   └── dungeons/          # Dungeon/town maps
│   └── audio/                 # Music and sound effect data
│
├── tools/                     # Python tools
│   ├── universal_editor.py    # Main GUI editor
│   ├── rom_analyzer.py        # ROM analysis tool
│   ├── asset_extractor.py     # Extract assets from ROM
│   ├── asset_reinserter.py    # Generate ASM from assets
│   ├── format_files.py        # Code formatting tool
│   ├── build_errors.py        # Build error handling
│   │
│   ├── extraction/            # Asset extraction modules
│   │   ├── data_extractor.py
│   │   ├── graphics_extractor.py
│   │   ├── text_extractor.py
│   │   └── map_extractor.py
│   │
│   ├── editors/               # Individual asset editors
│   │   ├── monster_editor.py
│   │   ├── item_editor.py
│   │   ├── spell_editor.py
│   │   ├── map_editor.py
│   │   ├── dialog_editor.py
│   │   └── graphics_editor.py
│   │
│   └── github/                # GitHub integration tools
│       └── create_issues.ps1
│
├── tests/                     # Test suite
│   ├── test_build.py          # Build system tests
│   ├── test_extraction.py     # Extraction tests
│   └── test_editors.py        # Editor tests
│
├── docs/                      # Documentation
│   ├── INDEX.md               # Documentation index
│   ├── ROM_MAP.md             # Complete ROM memory map
│   ├── RAM_MAP.md             # RAM memory map
│   ├── DATA_FORMATS.md        # Game data format documentation
│   ├── BUILD_GUIDE.md         # Build instructions
│   ├── TROUBLESHOOTING.md     # Common issues and solutions
│   │
│   ├── guides/                # Tutorial guides
│   ├── technical/             # Technical documentation
│   └── session-logs/          # AI session logs
│
├── ~docs/                     # Working documents (excluded from some git operations)
│   ├── session-logs/          # Session history
│   └── chat-logs/             # AI chat logs
│
├── roms/                      # ROM files (not in git, except readme)
│   └── README.md              # Instructions for obtaining ROM
│
├── build/                     # Build output directory
│   └── dragon_warrior_4.nes   # Assembled ROM
│
└── output/                    # Final output
    └── patches/               # IPS/BPS patches
```

## 🚀 Quick Start

### Prerequisites

- **Python 3.8+** - For all tools and editors
- **Ophis Assembler** - Included in `Ophis/` directory
- **PowerShell 5.1+** - For build scripts (Windows)
- **Reference ROM** - `Dragon Warrior IV (1992-10)(Enix)(US).nes`

### Setup

```powershell
# 1. Clone the repository
git clone https://github.com/TheAnsarya/dragon-warrior-4-info.git
cd dragon-warrior-4-info

# 2. Install Python dependencies
pip install -r requirements.txt

# 3. Place your ROM in the roms/ folder
# File: roms/Dragon Warrior IV (1992-10)(Enix)(US).nes

# 4. Extract assets from ROM
python tools/asset_extractor.py

# 5. Launch the Universal Editor
python tools/universal_editor.py
```

### Building a ROM

```powershell
# Full build with asset integration
.\build.ps1

# Clean build
.\build.ps1 -Clean

# Build with verbose output
.\build.ps1 -Verbose
```

## 🛠️ Tools Overview

### Universal Editor

The Universal Editor provides GUI editing for all game assets:

- **👾 Monsters** - HP, stats, resistances, drops
- **🗡️ Items** - Properties, effects, equip requirements
- **✨ Spells** - Damage, MP cost, targets, effects
- **🏪 Shops** - Inventory management
- **👥 Characters** - Party member stats, growth curves
- **🗺️ Maps** - World map, towns, dungeons
- **💬 Dialogs** - All game text with encoding preview
- **🎨 Graphics** - Sprites, tilesets, palettes
- **🎵 Audio** - Music and sound effects

### ROM Analyzer

Comprehensive ROM inspection:
- Hex viewer with pattern analysis
- Data structure identification
- Compression detection
- Cross-reference mapping

### Build System

Complete build pipeline:
- JSON → ASM generation
- Bank-by-bank assembly
- CHR-ROM extraction/insertion
- ROM verification against reference

## 📚 Documentation

See the `docs/` folder for comprehensive documentation:

- **[Documentation Index](docs/README.md)** - Complete documentation overview
- **[ROM Structure](docs/architecture/ROM_STRUCTURE.md)** - Full ROM memory layout
- **[Data Tables](docs/formats/DATA_TABLES.md)** - Game data structures
- **[Quick Reference](docs/reference/QUICK_REFERENCE.md)** - Common values and lookups
- **[Project Roadmap](docs/project/ROADMAP.md)** - Development milestones

## 🔗 Related Projects

- **[Dragon Warrior Info](https://github.com/TheAnsarya/dragon-warrior-info)** - DW1 disassembly (reference project)
- **[FFMQ Info](https://github.com/TheAnsarya/ffmq-info)** - Final Fantasy Mystic Quest disassembly

## 🏗️ Project Status

| Phase | Status | Issues | Description |
|-------|--------|--------|-------------|
| 1. ROM Disassembly | 🟡 In Progress | [#1](../../issues/1) | Complete ASM source |
| 2. Asset Extraction | 🟢 Working | [#2](../../issues/2) | Extract all game assets |
| 3. Universal Editor | ⬜ Planning | [#3](../../issues/3) | Build GUI editor |
| 4. Build Pipeline | 🟡 In Progress | [#4](../../issues/4) | Implement build system |
| 5. SNES Port Prep | 🟡 Research | [#42](../../issues/42) | DQ3 Remix planning |

### Current Progress

- ✅ **76 GitHub Issues** created covering all project aspects
- ✅ **5 Epic Issues** for major phases + comprehensive sub-issues
- ✅ **25 Labels** for issue organization
- ✅ **13+ Documentation Files** (NES architecture, ROM structure, data formats)
- ✅ **Asset Extraction Pipeline** - Extracts monsters, items, spells, shops, text, graphics
- ✅ **Assembly Framework** - Include files, RAM map, macros, linker config
- ✅ **JSON ↔ Assembly Converter** - Bidirectional data conversion

### Tools Status

| Tool | Status | Description |
|------|--------|-------------|
| `rom_analyzer.py` | ✅ Complete | ROM header, bank analysis, hex viewer |
| `text_decoder.py` | ✅ Complete | Decode text using TBL encoding |
| `asset_extractor.py` | ✅ Working | Extract monsters, items, spells, shops, text, graphics |
| `json_to_asm.py` | ✅ Working | Convert JSON data to assembly source |
| `asset_reinserter.py` | ⬜ TODO | Generate ASM from modified assets |
| `universal_editor.py` | ⬜ TODO | GUI editor for all assets |

### Source Files Status

| Directory | Status | Description |
|-----------|--------|-------------|
| `source_files/include/` | ✅ Complete | 6 include files with wiki-verified data |
| `source_files/asm/` | 🟡 Framework | Main dw4.asm, linker config |
| `source_files/data/` | ✅ Generated | monsters.asm, items.asm, spells.asm, shops.asm |

### Include Files (Wiki-Verified)

| File | Items | Description |
|------|-------|-------------|
| `constants.inc` | - | PPU, APU, MMC3 registers, text codes |
| `ram_map.inc` | 300+ | Party structure, game state, map RAM |
| `macros.inc` | 15+ | Bank switching, 16-bit ops, helpers |
| `items.inc` | 127 | All weapons, armor, items with categories |
| `maps.inc` | 73 | All maps with submaps, detailed layouts |
| `spells.inc` | 50+ | Hero spells, MP costs, bitmasks |

### Documentation Status

| Document | Location | Description |
|----------|----------|-------------|
| RAM_MAP.md | `docs/reference/` | Complete WRAM layout from wiki |
| GAME_VALUES.md | `docs/reference/` | Items, companions, tactics, chapters |
| MAP_LIST.md | `docs/reference/` | All 73 maps with submaps |

### Recently Completed

- Enhanced `asset_extractor.py` with pattern-scanning extraction
- Created assembly framework with `.include` directive support
- Generated assembly data files from extracted JSON
- Created `json_to_asm.py` converter tool
- Extracted 50 monster entries, 100 items, 50 spells, 180 shops
- Full RAM map documentation in assembly format
- **Wiki Data Integration**: Imported GameInfo wiki data into include files
- **items.inc**: 127 items with constants and helper macros
- **maps.inc**: 73 maps with detailed submap definitions
- **spells.inc**: Hero spell bitmasks and MP costs
- **Reference Docs**: RAM_MAP.md, GAME_VALUES.md, MAP_LIST.md

### Issue Tracking

- **76 GitHub Issues** covering all aspects of the project
- **5 Epic Issues** for major project phases
- **12+ Custom Labels** for organization

See [Issues](../../issues) for the complete backlog.

## 📊 Technical Details

| Property | Value |
|----------|-------|
| **ROM** | Dragon Warrior IV (1992-10)(Enix)(US).nes |
| **Platform** | NES (Nintendo Entertainment System) |
| **Mapper** | MMC3 (iNES Mapper 4) |
| **PRG ROM** | 512 KB (32 × 16KB banks) |
| **CHR ROM** | 0 KB (uses CHR-RAM) |
| **PRG RAM** | 8KB (battery-backed) |
| **File Size** | 524,304 bytes |
| **MD5** | e45105e8f82d8aa29b39260fd531498d |

### ROM Bank Layout

| Banks | Address | Contents |
|-------|---------|----------|
| $00-$05 | $8000-$BFFF | Main program code |
| $06-$07 | $8000-$BFFF | Game logic / battle system |
| $08 | $8000-$BFFF | **Data tables** (monsters, items, spells) |
| $09-$0B | $8000-$BFFF | **Map data** |
| $0C-$0E | $8000-$BFFF | **Text/dialog** |
| $0F | $C000-$FFFF | **Fixed bank** (vectors, core routines) |
| $10-$1F | Various | Additional program/data |

## 📄 License

This project is for educational and preservation purposes. Dragon Warrior IV is a trademark of Square Enix (formerly Enix).

## 🤝 Contributing

Contributions are welcome! Please:

1. Use **tabs** (not spaces) for indentation
2. Follow the `.editorconfig` rules
3. Keep `{` and `}` on the same line as code
4. Create issues for bugs/features before PRs
5. Update documentation for changes

---

**Note**: This repository does not include any copyrighted ROM data. You must provide your own legally obtained ROM file.
