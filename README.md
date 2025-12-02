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

- **[Build Guide](docs/BUILD_GUIDE.md)** - Complete build instructions
- **[ROM Map](docs/ROM_MAP.md)** - Full ROM memory layout
- **[Data Formats](docs/DATA_FORMATS.md)** - Game data structures
- **[Troubleshooting](docs/TROUBLESHOOTING.md)** - Common issues

## 🔗 Related Projects

- **[Dragon Warrior Info](https://github.com/TheAnsarya/dragon-warrior-info)** - DW1 disassembly (reference project)
- **[FFMQ Info](https://github.com/TheAnsarya/ffmq-info)** - Final Fantasy Mystic Quest disassembly

## 🏗️ Project Status

| Phase | Status | Issues | Description |
|-------|--------|--------|-------------|
| 1. ROM Disassembly | 🟡 In Progress | [#1](../../issues/1) | Complete ASM source |
| 2. Asset Extraction | ⬜ Planning | [#2](../../issues/2) | Extract all game assets |
| 3. Universal Editor | ⬜ Planning | [#3](../../issues/3) | Build GUI editor |
| 4. Build Pipeline | ⬜ Planning | [#4](../../issues/4) | Implement build system |
| 5. SNES Port Prep | ⬜ Future | [#42](../../issues/42) | DQ3 Remix planning |

### Issue Tracking

- **50+ GitHub Issues** covering all aspects of the project
- **5 Epic Issues** for major project phases
- **12 Custom Labels** for organization

See [Issues](../../issues) for the complete backlog.

## 📊 Technical Details

| Property | Value |
|----------|-------|
| **ROM** | Dragon Warrior IV (1992-10)(Enix)(US).nes |
| **Platform** | NES (Nintendo Entertainment System) |
| **Mapper** | MMC3 (iNES Mapper 4) |
| **PRG ROM** | 256 KB (16 × 16KB banks) |
| **CHR ROM** | 128 KB (16 × 8KB banks) |
| **RAM** | 2KB internal + 8KB WRAM (battery-backed) |
| **File Size** | 393,232 bytes |

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
