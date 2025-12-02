# Asset Pipeline Architecture

## Overview

This document describes the complete asset pipeline for Dragon Warrior IV: from ROM extraction through editing to final ROM assembly.

---

## Pipeline Flow Diagram

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                          DRAGON WARRIOR IV ASSET PIPELINE                    │
└─────────────────────────────────────────────────────────────────────────────┘

   ┌───────────┐
   │  ROM FILE │  Dragon Warrior IV (1992-10)(Enix)(US).nes
   │  (393KB)  │  Binary NES ROM file
   └─────┬─────┘
         │
         ▼ EXTRACTION PHASE
   ┌─────────────────────────────────────────────────────────────────────────┐
   │                        asset_extractor.py                                │
   │                                                                          │
   │  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐    │
   │  │ Text Parser │  │ Data Parser │  │ CHR Ripper  │  │ Map Decoder │    │
   │  └──────┬──────┘  └──────┬──────┘  └──────┬──────┘  └──────┬──────┘    │
   └─────────┼────────────────┼────────────────┼────────────────┼───────────┘
             │                │                │                │
             ▼                ▼                ▼                ▼
   ┌─────────────────────────────────────────────────────────────────────────┐
   │                          BINARY ASSETS                                   │
   │                     (assets/binary/*.bin)                                │
   │                                                                          │
   │  ┌──────────────┐ ┌──────────────┐ ┌──────────────┐ ┌──────────────┐   │
   │  │  text.bin    │ │ monsters.bin │ │ chr_00.bin   │ │ maps.bin     │   │
   │  │  items.bin   │ │ spells.bin   │ │ chr_01.bin   │ │ warps.bin    │   │
   │  │  shops.bin   │ │ chars.bin    │ │ chr_02.bin   │ │ events.bin   │   │
   │  └──────┬───────┘ └──────┬───────┘ └──────┬───────┘ └──────┬───────┘   │
   └─────────┼────────────────┼────────────────┼────────────────┼───────────┘
             │                │                │                │
             ▼ CONVERSION     ▼                ▼                ▼
   ┌─────────────────────────────────────────────────────────────────────────┐
   │                      bin_to_editable.py                                  │
   │                                                                          │
   │  ┌──────────────┐ ┌──────────────┐ ┌──────────────┐ ┌──────────────┐   │
   │  │ JSON Encoder │ │ JSON Encoder │ │ PNG Exporter │ │ JSON/TMX     │   │
   │  └──────┬───────┘ └──────┬───────┘ └──────┬───────┘ └──────┬───────┘   │
   └─────────┼────────────────┼────────────────┼────────────────┼───────────┘
             │                │                │                │
             ▼                ▼                ▼                ▼
   ┌─────────────────────────────────────────────────────────────────────────┐
   │                        EDITABLE ASSETS                                   │
   │                                                                          │
   │  ┌─ assets/json/ ───┐ ┌─ assets/json/ ───┐ ┌─ assets/graphics/ ─┐      │
   │  │  text.json       │ │  monsters.json   │ │  font.png          │      │
   │  │  items.json      │ │  spells.json     │ │  sprites.png       │      │
   │  │  shops.json      │ │  characters.json │ │  tiles.png         │      │
   │  └──────────────────┘ └──────────────────┘ └────────────────────┘      │
   │                                                                          │
   │  ┌─ assets/maps/ ────────────┐  ┌─ assets/audio/ ─────────┐            │
   │  │  overworld.json/tmx       │  │  music.json              │            │
   │  │  towns/*.json             │  │  sfx.json                │            │
   │  │  dungeons/*.json          │  │  sequences/*.json        │            │
   │  └───────────────────────────┘  └──────────────────────────┘            │
   └─────────────────────────────────────────────────────────────────────────┘
             │                │                │                │
             ▼ EDITING        ▼                ▼                ▼
   ┌─────────────────────────────────────────────────────────────────────────┐
   │                      UNIVERSAL EDITOR                                    │
   │                    (universal_editor.py)                                 │
   │                                                                          │
   │  ┌─────────┐ ┌─────────┐ ┌─────────┐ ┌─────────┐ ┌─────────┐           │
   │  │  Text   │ │  Items  │ │ Monster │ │   Map   │ │ Graphics│           │
   │  │  Tab    │ │   Tab   │ │   Tab   │ │   Tab   │ │   Tab   │           │
   │  └─────────┘ └─────────┘ └─────────┘ └─────────┘ └─────────┘           │
   │                                                                          │
   │  [Load Project] [Save Project] [Validate] [Build ROM]                   │
   └─────────────────────────────────────────────────────────────────────────┘
             │                │                │                │
             ▼ MODIFIED       ▼                ▼                ▼
   ┌─────────────────────────────────────────────────────────────────────────┐
   │                     MODIFIED EDITABLE ASSETS                             │
   │                                                                          │
   │  ┌─ assets/json/ ───┐ ┌─ assets/json/ ───┐ ┌─ assets/graphics/ ─┐      │
   │  │  text.json  [M]  │ │  monsters.json[M]│ │  font.png  [M]     │      │
   │  │  items.json [M]  │ │  spells.json [M] │ │  sprites.png [M]   │      │
   │  └──────────────────┘ └──────────────────┘ └────────────────────┘      │
   │                                                                          │
   │  [M] = Modified from original                                           │
   └─────────────────────────────────────────────────────────────────────────┘
             │                │                │                │
             ▼ CONVERSION     ▼                ▼                ▼
   ┌─────────────────────────────────────────────────────────────────────────┐
   │                     editable_to_bin.py                                   │
   │                                                                          │
   │  ┌──────────────┐ ┌──────────────┐ ┌──────────────┐ ┌──────────────┐   │
   │  │ JSON Decoder │ │ JSON Decoder │ │ PNG Importer │ │ JSON/TMX     │   │
   │  │ + TBL Encode │ │ + Validate   │ │ + Palette    │ │ + Compress   │   │
   │  └──────┬───────┘ └──────┬───────┘ └──────┬───────┘ └──────┬───────┘   │
   └─────────┼────────────────┼────────────────┼────────────────┼───────────┘
             │                │                │                │
             ▼                ▼                ▼                ▼
   ┌─────────────────────────────────────────────────────────────────────────┐
   │                      MODIFIED BINARY ASSETS                              │
   │                    (build/binary/*.bin)                                  │
   │                                                                          │
   │  ┌──────────────┐ ┌──────────────┐ ┌──────────────┐ ┌──────────────┐   │
   │  │  text.bin    │ │ monsters.bin │ │ chr_00.bin   │ │ maps.bin     │   │
   │  │  items.bin   │ │ spells.bin   │ │ chr_01.bin   │ │ warps.bin    │   │
   │  └──────┬───────┘ └──────┬───────┘ └──────┬───────┘ └──────┬───────┘   │
   └─────────┼────────────────┼────────────────┼────────────────┼───────────┘
             │                │                │                │
             ▼ ASM GEN        ▼                ▼                ▼
   ┌─────────────────────────────────────────────────────────────────────────┐
   │                       json_to_asm.py                                     │
   │                                                                          │
   │  ┌──────────────┐ ┌──────────────┐ ┌──────────────┐ ┌──────────────┐   │
   │  │ .byte/.word  │ │ .byte arrays │ │ .incbin      │ │ .byte arrays │   │
   │  │  directives  │ │  generation  │ │  includes    │ │  + pointers  │   │
   │  └──────┬───────┘ └──────┬───────┘ └──────┬───────┘ └──────┬───────┘   │
   └─────────┼────────────────┼────────────────┼────────────────┼───────────┘
             │                │                │                │
             ▼                ▼                ▼                ▼
   ┌─────────────────────────────────────────────────────────────────────────┐
   │                       ASSEMBLY SOURCE                                    │
   │                         (src/*.asm)                                      │
   │                                                                          │
   │  ┌──────────────────────────────────────────────────────────────────┐   │
   │  │ main.asm                                                          │   │
   │  │   ├─ header.asm (iNES header)                                     │   │
   │  │   ├─ defines.asm (constants)                                      │   │
   │  │   ├─ macros.asm (Ophis macros)                                    │   │
   │  │   ├─ memory.asm (RAM/WRAM layout)                                 │   │
   │  │   ├─ banks/                                                       │   │
   │  │   │   ├─ bank_00.asm → bank_15.asm                               │   │
   │  │   │   └─ data/                                                    │   │
   │  │   │       ├─ text_data.asm                                        │   │
   │  │   │       ├─ item_data.asm                                        │   │
   │  │   │       ├─ monster_data.asm                                     │   │
   │  │   │       └─ map_data.asm                                         │   │
   │  │   └─ chr/                                                         │   │
   │  │       ├─ chr_banks.asm                                            │   │
   │  │       └─ *.bin (CHR data includes)                                │   │
   │  └──────────────────────────────────────────────────────────────────┘   │
   └─────────────────────────────────────────────────────────────────────────┘
             │
             ▼ ASSEMBLY
   ┌─────────────────────────────────────────────────────────────────────────┐
   │                       BUILD SYSTEM                                       │
   │                      (build.ps1 / Makefile)                              │
   │                                                                          │
   │  1. Run json_to_asm.py (generate ASM from JSON)                         │
   │  2. Run editable_to_bin.py (graphics → CHR)                             │
   │  3. Invoke Ophis assembler on main.asm                                  │
   │  4. Concatenate PRG banks                                               │
   │  5. Append CHR banks                                                    │
   │  6. Prepend iNES header                                                 │
   │  7. Run verify_rom.py                                                   │
   │                                                                          │
   │  ophis -o build/prg.bin src/main.asm                                    │
   │  + CHR data → build/dragon-warrior-4.nes                                │
   └─────────────────────────────────────────────────────────────────────────┘
             │
             ▼
   ┌───────────┐
   │  ROM FILE │  build/dragon-warrior-4.nes
   │  (393KB)  │  Modified or byte-identical to original
   └───────────┘
```

---

## Directory Structure

```
dragon-warrior-4-info/
├── roms/
│   └── Dragon Warrior IV (1992-10)(Enix)(US).nes   # Original ROM (not in git)
│
├── assets/
│   ├── binary/              # Raw extracted binary data
│   │   ├── prg/             # PRG ROM banks as binary
│   │   │   ├── bank_00.bin
│   │   │   └── ...
│   │   ├── chr/             # CHR ROM banks as binary
│   │   │   ├── chr_00.bin
│   │   │   └── ...
│   │   ├── text.bin         # Raw text data
│   │   ├── monsters.bin     # Raw monster data
│   │   ├── items.bin        # Raw item data
│   │   └── ...
│   │
│   ├── json/                # Editable JSON assets
│   │   ├── text/
│   │   │   ├── dialogue.json
│   │   │   ├── item_names.json
│   │   │   ├── monster_names.json
│   │   │   └── menu_strings.json
│   │   ├── data/
│   │   │   ├── monsters.json
│   │   │   ├── items.json
│   │   │   ├── spells.json
│   │   │   ├── characters.json
│   │   │   └── shops.json
│   │   └── maps/
│   │       ├── overworld.json
│   │       └── locations/
│   │           ├── 00_burland.json
│   │           └── ...
│   │
│   ├── graphics/            # Editable graphics (PNG)
│   │   ├── font/
│   │   │   └── font_8x8.png
│   │   ├── sprites/
│   │   │   ├── characters/
│   │   │   └── monsters/
│   │   ├── tiles/
│   │   │   ├── overworld.png
│   │   │   ├── dungeon.png
│   │   │   └── town.png
│   │   └── ui/
│   │       └── menu.png
│   │
│   ├── audio/               # Audio data (JSON representation)
│   │   ├── music/
│   │   └── sfx/
│   │
│   └── palettes/            # NES palette files
│       ├── default.pal
│       └── per_area/
│
├── src/                     # Assembly source
│   ├── main.asm
│   ├── header.asm
│   ├── defines.asm
│   ├── macros.asm
│   ├── memory.asm
│   ├── banks/
│   │   ├── bank_00.asm
│   │   └── ...
│   └── data/                # Generated from JSON
│       ├── text_data.asm
│       ├── item_data.asm
│       └── ...
│
├── tools/                   # Python tools
│   ├── asset_extractor.py   # ROM → Binary
│   ├── bin_to_editable.py   # Binary → JSON/PNG
│   ├── editable_to_bin.py   # JSON/PNG → Binary
│   ├── json_to_asm.py       # JSON → ASM
│   ├── asset_reinserter.py  # Full pipeline
│   ├── universal_editor.py  # GUI editor
│   ├── verify_rom.py        # ROM verification
│   └── utils/
│       ├── tbl_encoder.py   # Text table encoding
│       ├── chr_converter.py # CHR ↔ PNG
│       ├── compression.py   # Compression algorithms
│       └── validation.py    # Data validation
│
├── build/                   # Build output
│   ├── intermediate/        # Intermediate files
│   ├── binary/              # Converted binary data
│   └── dragon-warrior-4.nes # Final ROM
│
├── docs/                    # Documentation
│   ├── PROJECT_PLAN.md
│   ├── NES_ARCHITECTURE.md
│   ├── ROM_STRUCTURE.md
│   ├── ASSET_PIPELINE.md    # This file
│   └── ...
│
└── build.ps1                # Main build script
```

---

## Asset Formats

### JSON Schema for Data Assets

#### monsters.json
```json
{
  "$schema": "./schemas/monsters.schema.json",
  "version": "1.0",
  "monsters": [
    {
      "id": 0,
      "name": "Slime",
      "name_ptr": "0x????",
      "stats": {
        "hp": 8,
        "mp": 0,
        "attack": 9,
        "defense": 4,
        "agility": 4
      },
      "exp": 1,
      "gold": 2,
      "drops": {
        "item_id": 0,
        "rate": 32
      },
      "ai_script": 0,
      "sprite_id": 0,
      "element_resist": [],
      "status_resist": []
    }
  ]
}
```

#### items.json
```json
{
  "$schema": "./schemas/items.schema.json",
  "version": "1.0",
  "items": [
    {
      "id": 1,
      "name": "Wooden Sword",
      "name_ptr": "0x????",
      "type": "weapon",
      "stats": {
        "attack": 5,
        "defense": 0
      },
      "price": 80,
      "effect": null,
      "equip_by": ["hero", "ragnar", "taloon"],
      "flags": ["cursed", "equipped"]
    }
  ]
}
```

#### text.json
```json
{
  "$schema": "./schemas/text.schema.json",
  "version": "1.0",
  "encoding": "dw4_tbl",
  "strings": [
    {
      "id": 0,
      "ptr_bank": 12,
      "ptr_offset": "0x8000",
      "raw_bytes": "01 02 03 FE",
      "decoded": "Hello!",
      "context": "NPC greeting"
    }
  ]
}
```

### Graphics Format

#### PNG Requirements
- **Indexed color** (palette-based, not RGB)
- **4 colors maximum** per 8x8 tile
- Color 0 = transparent (for sprites)
- Dimensions: multiple of 8 pixels
- Standard palette mapping:
  - Index 0 → NES color 0 (background/transparent)
  - Index 1 → NES color 1
  - Index 2 → NES color 2
  - Index 3 → NES color 3

#### CHR Bank Organization
Each 8KB CHR bank = 256 tiles × 16 bytes/tile

```
Tile layout in PNG:
16 tiles wide × 16 tiles tall = 256 tiles
128 pixels × 128 pixels
```

---

## Conversion Details

### Text Encoding (TBL Format)

Custom character encoding for Dragon Warrior IV:

```
$00 = (space)
$01-$09 = 0-9 (digits 0 shifted to $01)
$0A-$19 = a-z (lowercase, 'a' = $0A)
$1A-$39 = A-Z (uppercase, 'A' = $1A)
$65-$79 = punctuation
$80 = UI cursor
$81 = "..."
$FE = line break
$FF = end of string
```

### CHR Conversion (PNG ↔ Binary)

**PNG to CHR:**
1. Load indexed PNG
2. For each 8×8 tile:
   - Extract 2 bitplanes
   - Plane 0: bit 0 of each pixel
   - Plane 1: bit 1 of each pixel
   - Interleave: 8 bytes plane 0, then 8 bytes plane 1
3. Output 16 bytes per tile

**CHR to PNG:**
1. Read 16 bytes per tile
2. Combine bitplanes to get 2-bit pixel values
3. Map to palette colors
4. Arrange tiles in 16×16 grid
5. Save as indexed PNG

### Map Compression

DW4 likely uses RLE or similar for maps:

**Detection patterns:**
- Size byte(s) at start
- Control byte with count
- Tile index follows

**Example RLE format:**
```
$80-$FF: (byte - $80) repeated tiles of next byte
$00-$7F: literal tile index
```

---

## Build Process

### Full Build (build.ps1)

```powershell
# 1. Generate ASM from JSON assets
python tools/json_to_asm.py `
    --input assets/json `
    --output src/data

# 2. Convert graphics to CHR binary
python tools/editable_to_bin.py `
    --graphics assets/graphics `
    --output build/binary/chr

# 3. Assemble PRG ROM
ophis -o build/intermediate/prg.bin src/main.asm

# 4. Combine PRG + CHR + Header
python tools/build_rom.py `
    --prg build/intermediate/prg.bin `
    --chr build/binary/chr `
    --output build/dragon-warrior-4.nes

# 5. Verify ROM
python tools/verify_rom.py `
    --original "roms/Dragon Warrior IV (1992-10)(Enix)(US).nes" `
    --built build/dragon-warrior-4.nes
```

### Incremental Build

For faster iteration:
1. Track file modification times
2. Only rebuild changed assets
3. Only reassemble affected banks
4. Use precompiled CHR if unchanged

---

## Validation Rules

### Data Validation

| Asset | Rule | Limit |
|-------|------|-------|
| Monster HP | 0-999 | $03E7 |
| Monster stats | 0-255 | $FF |
| Item price | 0-65535 | $FFFF |
| Spell MP cost | 0-99 | $63 |
| Text length | Variable | Bank size |
| Map size | Variable | Compression limit |

### Size Validation

Each bank must fit in 16KB ($4000 bytes):

```python
if len(bank_data) > 0x4000:
    raise ValidationError(f"Bank {bank} exceeds 16KB limit")
```

### Reference Integrity

- All item IDs must exist
- All spell IDs must exist
- All map warps must point to valid maps
- All text pointers must be within bank

---

## Error Handling

### Extraction Errors
- Unknown compression → Raw dump with warning
- Invalid pointer → Skip with log
- Size mismatch → Truncate/pad with warning

### Conversion Errors
- Invalid JSON → Detailed syntax error
- Missing field → Use default with warning
- Out of range → Clamp with warning

### Build Errors
- Bank overflow → Error with size details
- Missing include → Error with path
- Syntax error → Ophis error message

---

## Future: SNES Port Considerations

For eventual Dragon Quest 3: Remix on SNES:

### Asset Compatibility

| NES Asset | SNES Equivalent | Conversion Notes |
|-----------|-----------------|------------------|
| CHR tiles | SNES tiles | 2bpp → 4bpp, expand palette |
| Sprites 8x8/8x16 | SNES OAM | Different format, more colors |
| Palettes (4 colors) | SNES palettes | 4 → 16 colors per palette |
| Maps | SNES tilemaps | Similar concept, different format |
| Music (2A03) | SPC700 | Complete recomposition needed |

### Recommended Approach

1. Extract all DW4 assets using this pipeline
2. Convert to intermediate format (our JSON/PNG)
3. Create SNES converter tools
4. Map DW4 data to DQ3 SNES structures
5. Handle format differences per asset type

---

## See Also

- [ROM_STRUCTURE.md](ROM_STRUCTURE.md) - Detailed ROM layout
- [NES_ARCHITECTURE.md](NES_ARCHITECTURE.md) - NES hardware reference
- [TEXT_ENCODING.md](TEXT_ENCODING.md) - Text table details
- [COMPRESSION.md](COMPRESSION.md) - Compression algorithms
