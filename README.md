# Dragon Warrior 4 (NES) - Complete Disassembly Project

[![Build Status](https://img.shields.io/badge/build-in_progress-yellow)](https://img.shields.io/badge/build-in_progress-yellow)
[![License](https://img.shields.io/badge/license-MIT-blue)](https://img.shields.io/badge/license-MIT-blue)
[![NES](https://img.shields.io/badge/platform-NES-red)](https://img.shields.io/badge/platform-NES-red)
[![Toolchain](https://img.shields.io/badge/toolchain-🌷_Flower-pink)](https://img.shields.io/badge/toolchain-Flower-pink)

A complete code and asset disassembly of **Dragon Warrior IV** (US NES version, 1992) using the **🌷 Flower Toolchain** with full editors for all assets and a comprehensive build pipeline that produces a byte-perfect ROM from source.

## 🌷 Flower Toolchain

This project uses the **Flower Toolchain** for disassembly, metadata management, and ROM assembly:

| Tool | Emoji | Purpose |
|------|-------|---------|
| **Peony** | 🌺 | Disassembler - ROM → Source (.pasm) |
| **Pansy** | 🌼 | Metadata Format - Symbols, comments, cross-refs |
| **Poppy** | 🌸 | Assembler - Source (.pasm) → ROM |

### Build Pipeline Flow

```
┌─────────────────────────────────────────────────────────────────┐
│                   🌷 Flower Toolchain Flow                       │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  Original ROM ───► 🌺 Peony ───► Source Code (.pasm)            │
│       │                              │                          │
│       │                              ▼                          │
│       │                        🌼 Pansy Metadata                 │
│       │                        (symbols, comments)              │
│       │                                                         │
│       ▼                                                         │
│  Asset Extractor ───► Binary Assets ───► JSON/PNG (Edit)        │
│                                              │                  │
│                                              ▼                  │
│                                         Converters              │
│                                              │                  │
│                                              ▼                  │
│  New ROM ◄───── 🌸 Poppy ◄───── Source + Generated .pasm        │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

## 🎯 Project Goals

1. **Complete Disassembly** - Full 6502 assembly source code for the entire ROM using 🌺 Peony
2. **Metadata Management** - Comprehensive symbols and comments in 🌼 Pansy format
3. **Asset Extraction** - Extract all game assets (graphics, text, maps, data tables)
4. **Universal Editor** - GUI editor for all extracted assets
5. **Build Pipeline** - Assemble modified source back into a working ROM with 🌸 Poppy
6. **Documentation** - Comprehensive documentation of game internals

## 📁 Project Structure

```
dragon-warrior-4-info/
├── .editorconfig              # Code formatting rules (TABS, not spaces!)
├── .gitignore                 # Git ignore rules
├── README.md                  # This file
├── requirements.txt           # Python dependencies
├── build.config.json          # 🌷 Flower Toolchain configuration
├── build.ps1                  # Main build script (PowerShell)
├── disassemble.ps1            # 🌺 Peony disassembly script
│
├── src/                       # 🌸 Poppy source files (.pasm)
│   ├── main.pasm              # Main entry point with iNES header
│   ├── banks/                 # PRG bank source files (32 banks)
│   │   ├── bank_00.pasm       # Core engine, reset, NMI/IRQ
│   │   ├── bank_01.pasm       # Map engine, overworld, collision
│   │   ├── bank_02.pasm       # Battle engine - core combat
│   │   ├── bank_08.pasm       # Monster data bank (includes monsters.pasm)
│   │   ├── bank_09.pasm       # Item/Spell/Shop data bank
│   │   └── ...                # Additional banks ($00-$1F)
│   ├── data/                  # AUTO-GENERATED from JSON assets
│   │   ├── monsters.pasm      # Monster stats, AI, drops
│   │   ├── items.pasm         # Item definitions, prices
│   │   ├── spells.pasm        # Spell data, MP costs
│   │   └── shops.pasm         # Shop inventories
│   └── include/               # Shared include files
│       ├── hardware.pasm      # NES hardware registers
│       ├── constants.pasm     # Game constants and IDs
│       ├── ram_map.pasm       # Complete RAM memory map
│       └── macros.pasm        # Assembly helper macros
│
├── metadata/                  # 🌼 Pansy metadata files
│   ├── dw4.pansy              # Main Pansy metadata file
│   └── symbols/               # Symbol exports
│
├── assets/                    # Extracted/editable game assets
│   ├── binary/                # Raw binary extracts
│   ├── json/                  # JSON format data files
│   │   ├── monsters/          # Monster data
│   │   ├── items/             # Item definitions
│   │   ├── spells/            # Spell data
│   │   └── shops.json         # Shop inventories
│   ├── text/                  # Dialog and text strings
│   ├── graphics/              # PNG format graphics
│   │   ├── sprites/           # Character and monster sprites
│   │   ├── tilesets/          # Map tilesets
│   │   └── ui/                # Menu and UI graphics
│   └── maps/                  # Map data
│
├── tools/                     # Python tools
│   ├── bin_to_editable.py     # Binary → JSON/PNG converter
│   ├── editable_to_bin.py     # JSON/PNG → Binary converter
│   ├── json_to_asm.py         # JSON → .pasm generator (🌷 Flower)
│   ├── asset_extractor.py     # Extract assets from ROM
│   ├── universal_editor.py    # Main GUI editor
│   ├── rom_analyzer.py        # ROM analysis tool
│   └── format_files.py        # Code formatting tool
│
├── reference/                 # Reference materials
│   ├── cdl/                   # Code/Data Log files
│   ├── mlb/                   # Mesen Label files
│   └── tbl/                   # Text encoding tables
│
├── docs/                      # Documentation
│   ├── INDEX.md               # Documentation index
│   ├── ROM_MAP.md             # Complete ROM memory map
│   ├── RAM_MAP.md             # RAM memory map
│   └── BUILD_GUIDE.md         # Build instructions
│
├── build/                     # Build output directory
│   └── dragon-warrior-4.nes   # Assembled ROM
│
└── roms/                      # ROM files (not in git)
    └── README.md              # Instructions for obtaining ROM
```
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
- **🌸 Poppy Assembler** - For ROM assembly (or Ophis as fallback)
- **🌺 Peony Disassembler** - For disassembly (optional, pre-disassembled source available)
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

# 4. (Optional) Disassemble ROM with Peony
.\disassemble.ps1

# 5. Extract assets from ROM
python tools/asset_extractor.py

# 6. Launch the Universal Editor
python tools/universal_editor.py
```

### Building a ROM

```powershell
# Full build with 🌸 Poppy (or Ophis fallback)
.\build.ps1

# Clean build
.\build.ps1 -Clean

# Build with verbose output
.\build.ps1 -Verbose

# Disassemble first, then build
.\build.ps1 -Disassemble

# Extract and convert assets before build
.\build.ps1 -ExtractAssets -ConvertAssets
```

### Asset Pipeline Commands

```powershell
# Extract binary assets from ROM
python tools/asset_extractor.py --rom "roms/Dragon Warrior IV (1992-10)(Enix)(US).nes"

# Convert binary to editable (JSON/PNG)
python tools/bin_to_editable.py --input assets/binary --output assets/json

# Convert editable back to binary
python tools/editable_to_bin.py --input assets/json --output build/binary

# Generate Poppy assembly from JSON
python tools/json_to_asm.py all
```

### 📝 Editing Assets (JSON Workflow)

The asset pipeline allows editing game data without assembly knowledge:

```
┌─────────────────────────────────────────────────────────────────┐
│                      JSON Asset Workflow                        │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  1. Edit JSON file     →  assets/json/monsters/monster_001.json │
│                                                                 │
│  2. Regenerate ASM     →  python tools/json_to_asm.py all       │
│     (auto-generates)      src/data/monsters.pasm                │
│                                                                 │
│  3. Build ROM          →  .\build.ps1                           │
│     (Poppy assembles)     build/dragon-warrior-4.nes            │
│                                                                 │
│  4. Test in emulator   →  Verify changes work correctly         │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

**Example: Modifying a Monster**

1. Edit `assets/json/monsters/monsters.json`:
   ```json
   {
     "id": 0,
     "name": "Slime",
     "hp": 10,
     "attack": 5,
     "defense": 3,
     "exp": 2,
     "gold": 1
   }
   ```

2. Regenerate assembly: `python tools/json_to_asm.py monsters`

3. Build ROM: `.\build.ps1`

## 🛠️ Tools Overview

### 🌷 Flower Toolchain Integration

| Tool | Command | Purpose |
|------|---------|---------|
| 🌺 Peony | `.\disassemble.ps1` | Disassemble ROM to .pasm source |
| 🌼 Pansy | (metadata format) | Store symbols, comments, cross-refs |
| 🌸 Poppy | `.\build.ps1` | Assemble .pasm source to ROM |

### Asset Pipeline Tools

| Tool | Purpose |
|------|---------|
| `bin_to_editable.py` | Convert binary assets → JSON/PNG |
| `editable_to_bin.py` | Convert JSON/PNG → binary assets |
| `json_to_asm.py` | Generate .pasm from JSON data |
| `asset_extractor.py` | Extract assets from reference ROM |
| `generate_bank_stubs.py` | Generate bank source file templates |

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

Complete build pipeline using the 🌷 Flower Toolchain:

- JSON → .pasm generation (via `json_to_asm.py`)
- Bank-by-bank assembly with 🌸 Poppy
- CHR-ROM extraction/insertion
- ROM verification against reference
- Fallback to Ophis assembler if Poppy unavailable

## 📚 Documentation

See the `docs/` folder for comprehensive documentation:

- **[Documentation Index](docs/README.md)** - Complete documentation overview
- **[ROM Structure](docs/architecture/ROM_STRUCTURE.md)** - Full ROM memory layout
- **[Data Tables](docs/formats/DATA_TABLES.md)** - Game data structures
- **[Quick Reference](docs/reference/QUICK_REFERENCE.md)** - Common values and lookups
- **[Project Roadmap](docs/project/ROADMAP.md)** - Development milestones

### Key Discoveries (Reverse Engineering)

- **[EXP System](docs/exp_system_analysis.md)** - Formula-based EXP calculation in Bank 18 ($9F7C), not traditional tables
- **[Battle System](docs/battle_system_deep.md)** - Damage formulas, AI tactics (7 modes), resistance system in Bank 19
- **[Enemy Resistance](docs/enemy_data_table.md)** - Packed byte format at $B967 for elemental resistances
- **[RE Summary](docs/REVERSE_ENGINEERING_SUMMARY.md)** - Complete overview of all reverse engineering findings

## 🔗 Related Projects

- **[🌸 Poppy](https://github.com/TheAnsarya/poppy)** - Multi-system assembler (🌷 Flower Toolchain)
- **[🌺 Peony](https://github.com/TheAnsarya/peony)** - Multi-system disassembler (🌷 Flower Toolchain)
- **[🌼 Pansy](https://github.com/TheAnsarya/pansy)** - Metadata format (🌷 Flower Toolchain)
- **[🌱 Game Garden](https://github.com/TheAnsarya/game-garden)** - Game disassembly collection
- **[Dragon Warrior Info](https://github.com/TheAnsarya/dragon-warrior-info)** - DW1 disassembly
- **[FFMQ Info](https://github.com/TheAnsarya/ffmq-info)** - Final Fantasy Mystic Quest disassembly
- **[GameInfo](https://github.com/TheAnsarya/GameInfo)** - ROM hacking toolkit

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
| `disassemble.ps1` | ✅ Complete | 🌺 Peony disassembly wrapper |
| `build.ps1` | ✅ Complete | 🌸 Poppy build script (Ophis fallback) |
| `bin_to_editable.py` | ✅ Complete | Binary → JSON/PNG converter |
| `editable_to_bin.py` | ✅ Complete | JSON/PNG → Binary converter |
| `json_to_asm.py` | ✅ Complete | JSON → .pasm generator |
| `rom_analyzer.py` | ✅ Complete | ROM header, bank analysis, hex viewer |
| `text_decoder.py` | ✅ Complete | Decode text using TBL encoding |
| `asset_extractor.py` | ✅ Working | Extract monsters, items, spells, shops, text, graphics |
| `universal_editor.py` | ⬜ TODO | GUI editor for all assets |

### Source Files Status

| Directory | Status | Description |
|-----------|--------|-------------|
| `src/include/` | ✅ Complete | 6 include files with wiki-verified data |
| `src/banks/` | 🟡 Framework | Bank source files for Poppy |
| `src/data/` | ✅ Generated | monsters.pasm, items.pasm, spells.pasm, shops.pasm |
| `metadata/` | 🟡 In Progress | 🌼 Pansy metadata files |

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
