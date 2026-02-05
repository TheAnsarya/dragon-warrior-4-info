# Dragon Warrior IV - Build Guide

This guide explains how to build Dragon Warrior IV from source using the **🌷 Flower Toolchain**.

## 🌷 Flower Toolchain Overview

The Flower Toolchain provides a complete workflow for ROM disassembly, editing, and reassembly:

| Tool | Emoji | Role | File Extension |
|------|-------|------|----------------|
| **Peony** | 🌺 | Disassembler | ROM → `.pasm` |
| **Pansy** | 🌼 | Metadata Format | `.pansy` |
| **Poppy** | 🌸 | Assembler | `.pasm` → ROM |

### Pipeline Flow

```
┌─────────────────────────────────────────────────────────────────────┐
│                       Build Pipeline Flow                           │
├─────────────────────────────────────────────────────────────────────┤
│                                                                     │
│  DISASSEMBLY PHASE                                                  │
│  ─────────────────                                                  │
│  Reference ROM ──► 🌺 Peony ──► Source Code (.pasm)                 │
│       │                              │                              │
│       └────────────────────────────► 🌼 Pansy Metadata              │
│                                      (symbols, comments)            │
│                                                                     │
│  ASSET EXTRACTION PHASE                                             │
│  ──────────────────────                                             │
│  Reference ROM ──► asset_extractor.py ──► Binary Assets             │
│                                               │                     │
│                                               ▼                     │
│                    bin_to_editable.py ──► JSON/PNG (Edit Here!)     │
│                                                                     │
│  BUILD PHASE                                                        │
│  ───────────                                                        │
│  Edited JSON ──► json_to_asm.py ──► Generated .pasm                 │
│       │                                  │                          │
│       ▼                                  ▼                          │
│  Edited PNG ──► editable_to_bin.py ──► Binary Assets                │
│                                          │                          │
│                                          ▼                          │
│  Source (.pasm) + Generated .pasm ──► 🌸 Poppy ──► New ROM          │
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘
```

## Prerequisites

### Required Software

| Software | Version | Purpose |
|----------|---------|---------|
| **Python** | 3.8+ | Asset tools, editors |
| **PowerShell** | 5.1+ | Build scripts |
| **🌸 Poppy** | Latest | ROM assembly |

### Optional Software

| Software | Purpose |
|----------|---------|
| **🌺 Peony** | Disassembly (pre-disassembled source available) |
| **Ophis** | Fallback assembler if Poppy unavailable |

### Python Dependencies

Install required Python packages:

```powershell
pip install -r requirements.txt
```

Required packages:
- `click` - CLI framework
- `rich` - Rich console output
- `Pillow` - Image processing (PNG conversion)

## Reference ROM

Place your legally obtained ROM in the `roms/` folder:

```
roms/Dragon Warrior IV (1992-10)(Enix)(US).nes
```

**Expected checksums:**
| Algorithm | Value |
|-----------|-------|
| MD5 | `a5a781e5ae7c75765969eba2beb4e27f` |
| CRC32 | `TBD` |

## Build Commands

### Quick Build

```powershell
# Standard build
.\build.ps1

# Clean build (removes intermediate files)
.\build.ps1 -Clean

# Verbose build (detailed output)
.\build.ps1 -Verbose
```

### Full Pipeline Build

```powershell
# Disassemble, extract assets, convert, and build
.\build.ps1 -Disassemble -ExtractAssets -ConvertAssets
```

### Individual Steps

#### Step 1: Disassemble (Optional)

If you need to regenerate source from ROM:

```powershell
.\disassemble.ps1
```

This uses 🌺 Peony to create:
- Source files in `src/`
- Metadata in `metadata/dw4.pansy`

#### Step 2: Extract Assets

Extract binary assets from the reference ROM:

```powershell
python tools/asset_extractor.py --rom "roms/Dragon Warrior IV (1992-10)(Enix)(US).nes" --output assets
```

#### Step 3: Convert to Editable Format

Convert binary assets to JSON/PNG for editing:

```powershell
python tools/bin_to_editable.py --input assets/binary --output assets/json
```

#### Step 4: Edit Assets

Edit the JSON and PNG files in `assets/json/` and `assets/graphics/`:

- `assets/json/monsters/*.json` - Monster stats
- `assets/json/items/*.json` - Item definitions
- `assets/json/spells/*.json` - Spell data
- `assets/json/shops.json` - Shop inventories
- `assets/graphics/*.png` - Sprite graphics

#### Step 5: Generate Assembly from JSON

Convert edited JSON back to Poppy assembly:

```powershell
python tools/json_to_asm.py all
```

This generates:
- `src/data/monsters.pasm`
- `src/data/items.pasm`
- `src/data/spells.pasm`
- `src/data/shops.pasm`

#### Step 6: Convert Graphics Back to Binary

Convert edited PNG graphics back to CHR format:

```powershell
python tools/editable_to_bin.py --input assets/json --output build/binary
```

#### Step 7: Build ROM

Assemble the final ROM:

```powershell
.\build.ps1
```

#### Step 8: Verify ROM

The build script automatically verifies the output against the reference ROM. For manual verification:

```powershell
python tools/verify_rom.py --original "roms/Dragon Warrior IV (1992-10)(Enix)(US).nes" --built "build/dragon-warrior-4.nes"
```

## Project Structure

### Source Files (`src/`)

```
src/
├── main.pasm              # Main entry point
├── banks/                 # PRG bank source files
│   ├── bank_00.pasm       # Bank 0: Core routines
│   ├── bank_01.pasm       # Bank 1: Game logic
│   └── ...                # Banks 2-15
├── data/                  # Generated data files
│   ├── monsters.pasm      # Monster stats (generated)
│   ├── items.pasm         # Items (generated)
│   ├── spells.pasm        # Spells (generated)
│   └── shops.pasm         # Shops (generated)
└── include/               # Shared includes
    ├── constants.inc      # System constants
    ├── ram_map.inc        # RAM memory map
    └── macros.inc         # Assembly macros
```

### Asset Files (`assets/`)

```
assets/
├── binary/                # Raw binary extracts
│   ├── monsters.bin       # Monster data table
│   ├── items.bin          # Item data table
│   └── ...
├── json/                  # Editable JSON files
│   ├── monsters/
│   │   └── monsters.json
│   ├── items/
│   │   └── items.json
│   └── ...
└── graphics/              # Editable PNG files
    ├── sprites/
    └── tilesets/
```

### Build Output (`build/`)

```
build/
├── dragon-warrior-4.nes   # Final assembled ROM
├── binary/                # Converted binary assets
└── intermediate/          # Intermediate build files
```

## Configuration

### build.config.json

The build configuration is stored in `build.config.json`:

```json
{
	"project": {
		"name": "Dragon Warrior IV",
		"platform": "nes"
	},
	"peony": {
		"enabled": true,
		"format": "poppy"
	},
	"build": {
		"assembler": "poppy",
		"fallbackAssembler": "ophis",
		"outputRom": "build/dragon-warrior-4.nes",
		"verifyChecksum": true
	},
	"assets": {
		"extractDir": "assets/binary",
		"editableDir": "assets/json",
		"generatedDir": "src/data"
	}
}
```

## Troubleshooting

### Build Fails: "Poppy not found"

The build script will automatically fall back to Ophis if Poppy is not installed. To use Poppy:

1. Install Poppy from [https://github.com/TheAnsarya/poppy](https://github.com/TheAnsarya/poppy)
2. Ensure `poppy` is in your PATH

### Build Fails: "Reference ROM not found"

Ensure the ROM is placed at the correct path:
```
roms/Dragon Warrior IV (1992-10)(Enix)(US).nes
```

### Build Succeeds but ROM Doesn't Match

This usually means assets were modified. To build a byte-identical ROM:

1. Don't modify any JSON or PNG files
2. Run `.\build.ps1 -Clean`

### Python Module Not Found

Install missing dependencies:
```powershell
pip install -r requirements.txt
```

## Advanced Usage

### Custom Build Targets

Edit `build.ps1` to add custom build targets or modify the build process.

### Adding New Asset Types

1. Add extraction logic to `asset_extractor.py`
2. Add conversion logic to `bin_to_editable.py` and `editable_to_bin.py`
3. Add assembly generation to `json_to_asm.py`
4. Update `build.ps1` to include new assets

### Using Custom Symbols

Add custom symbols to the 🌼 Pansy metadata file at `metadata/dw4.pansy`. These will be used during disassembly and can be exported for use in assembly.

## VS Code Tasks

The project includes VS Code tasks for common operations:

| Task | Description |
|------|-------------|
| Build ROM | Standard build |
| Build ROM (Clean) | Clean build |
| Extract Assets | Extract from reference ROM |
| Convert Assets (Binary to Editable) | Binary → JSON/PNG |
| Convert Assets (Editable to Binary) | JSON/PNG → Binary |
| Generate ASM from JSON | JSON → .pasm |
| Verify ROM | Compare built ROM to reference |

Access tasks via `Ctrl+Shift+B` (Build) or `Ctrl+Shift+P` → "Tasks: Run Task"

## Further Reading

- [ROM Structure](architecture/ROM_STRUCTURE.md) - Detailed ROM layout
- [RAM Map](reference/RAM_MAP.md) - Memory map documentation
- [Data Formats](formats/DATA_TABLES.md) - Game data structures
- [🌷 Flower Toolchain](https://github.com/TheAnsarya/poppy) - Toolchain documentation
