# Dragon Warrior IV (NES) - Master Documentation Index

**Status:** 🔄 Active Development  
**Last Updated:** 2025-12-30  
**Related Project:** [DW4→DQ3r Port](../../../GameInfo/Projects/dw4-dq3r/)

---

## Quick Links

| Category | Key Documents |
|----------|---------------|
| 🎮 **Overview** | [README](../README.md) · [Reverse Engineering Summary](REVERSE_ENGINEERING_SUMMARY.md) |
| 📊 **Data** | [Monster Format](formats/MONSTER_FORMAT.md) · [Item Format](formats/ITEM_FORMAT.md) · [Spell Format](formats/SPELL_FORMAT.md) · [Data Tables](formats/DATA_TABLES.md) |
| 🗺️ **Maps** | [Map Format](formats/MAP_FORMAT.md) · [ROM Map](formats/ROM_MAP.md) |
| 💬 **Text** | [Text System](formats/TEXT_SYSTEM.md) · [Text Encoding](formats/TEXT_ENCODING.md) |
| ⚔️ **Battle** | [Battle System](formats/BATTLE_SYSTEM.md) · [AI System](formats/AI_SYSTEM.md) |
| 📖 **Chapters** | [Chapter System](formats/CHAPTER_SYSTEM.md) · [Wagon System](formats/WAGON_SYSTEM.md) |
| 🖼️ **Graphics** | [Graphics Format](formats/GRAPHICS_FORMAT.md) · [Audio Format](formats/AUDIO_FORMAT.md) |
| 💾 **Save** | [Save Data](formats/SAVE_DATA.md) · [RAM Map](formats/RAM_MAP.md) |

---

## Project Structure Overview

```
dragon-warrior-4-info/
├── 📁 assets/
│   ├── json/               # Extracted game data
│   │   ├── monsters/       # Monster stats
│   │   ├── items/          # Item definitions
│   │   ├── spells/         # Spell data
│   │   ├── characters/     # Character data
│   │   └── chapters.json   # Chapter definitions
│   ├── graphics/           # Extracted graphics
│   ├── text/               # Text dumps
│   └── maps/               # Map data
├── 📁 docs/                # Documentation (this folder)
│   ├── formats/            # Data format specs
│   ├── analysis/           # Analysis documents
│   └── reference/          # External references
├── 📁 tools/               # Python analysis tools
├── 📁 source_files/        # Disassembled ASM
└── 📁 data/                # Raw analysis data
```

---

## Data Extraction Status

### Monster Data

| Item | Status | Location | Notes |
|------|--------|----------|-------|
| Monster Stats | ✅ Partial | [monsters.json](../assets/json/monsters/monsters.json) | 195 entries extracted |
| Monster Names | 🔄 In Progress | Bank 22 | DTE compressed |
| Monster Sprites | ⬜ Not Started | CHR banks | Need graphics extraction |
| Resistances | ✅ Done | [enemy_data_table.md](enemy_data_table.md) | Type/resistance bytes |
| Action Patterns | 🔄 In Progress | Bank 19 | AI behavior tables |
| Drop Tables | ✅ Done | monsters.json | Item drops and rates |

**Monster Format (16 bytes):**
```
Offset  Size  Field
------  ----  -----
0x00    2     HP
0x02    1     MP (usually 0)
0x03    2     Attack
0x05    1     Defense
0x06    1     Agility
0x07    2     EXP reward
0x09    2     Gold reward
0x0B    1     Drop item ID
0x0C    1     Drop rate
0x0D    1     Action pattern
0x0E    1     Resistances
0x0F    1     Sprite info
```

### Item Data

| Item | Status | Location | Notes |
|------|--------|----------|-------|
| Item Names | ✅ Done | [items.json](../assets/json/items.json) | All items named |
| Item Stats | 🔄 Partial | Need extraction | Attack/defense mods |
| Equipment Flags | 🔄 Partial | items.json | Who can equip |
| Special Effects | ⬜ Not Started | Unknown | Item use effects |
| Prices | ⬜ Not Started | Shop data | Buy/sell values |

**Equipment Ranges:**
- `0x00-0x50`: Equipment (weapons, armor, shields, helmets)
- `0x51`: Blank separator
- `0x52-0x7E`: Consumables
- `0x7F`: No item
- `0x80` flag: Item equipped

### Spell Data

| Item | Status | Location | Notes |
|------|--------|----------|-------|
| Spell Names | 🔄 Partial | Bank 18, 22 | Embedded in code |
| Spell Stats | ⬜ Not Started | Unknown | MP, power, range |
| Learning Tables | ⬜ Not Started | Unknown | Level-up spells |
| Spell Effects | ⬜ Not Started | Battle code | Damage formulas |

---

## Chapter System

**Document:** [chapters.json](../assets/json/chapters.json)

### Chapter Overview

| Chapter | Protagonist | Party Members | Unique Features |
|---------|-------------|---------------|-----------------|
| 1 | Ragnar | Solo → Healie | Simple combat |
| 2 | Alena | Alena, Cristo, Brey | AI-controlled party |
| 3 | Taloon | Solo → NPCs | Merchant mechanics |
| 4 | Nara | Nara, Mara | Magic-focused |
| 5 | Hero | All characters | Full party, wagon |

### Battle Tactics (Chapter 5)

| ID | Name | Description |
|----|------|-------------|
| 0 | Normal | Balanced AI |
| 1 | Save MP | Conserve magic |
| 2 | Offensive | Aggressive attacks |
| 3 | Defensive | Protect party |
| 4 | Try Out | Experiment |
| 5 | Use No MP | Physical only |

### Day/Night Cycle

| Range | State | Duration |
|-------|-------|----------|
| 0x00-0x27 | Day | 40 ticks |
| 0x28-0x77 | Day (post-Inn) | 80 ticks |
| 0x78-0x7B | Afternoon | 4 ticks |
| 0x7C-0x7F | Dusk | 4 ticks |
| 0x80-0x83 | Evening | 4 ticks |
| 0x84-0xBF | Night | 60 ticks |

---

## Battle System

**Main Document:** [battle_system_analysis.md](battle_system_analysis.md)

### Key Banks

| Bank | ROM Offset | Purpose | Subroutines |
|------|------------|---------|-------------|
| 16 | $40010 | Game logic | 186 |
| 17 | $44010 | Complex logic | 217 |
| 19 | $4C010 | **Battle core** | 266 |
| 21 | $54010 | Calculations | 131 |
| 22 | $58010 | Menus/UI | 204 |

### Key RAM Regions

| Address | Purpose |
|---------|---------|
| $6Exx | Combat state/calculations |
| $72F4 | Character state array |
| $75xx | Party stats/attributes |
| $93 | Battle bit flags |

### Division Routines

- **$83C5**: 16-bit division
- **$8414**: 24-bit division
- Used for damage calculations, stat scaling

---

## Text System

**Main Document:** [TEXT_ENCODING.md](formats/TEXT_ENCODING.md)

### Encoding Table

| Range | Meaning |
|-------|---------|
| $00 | Space |
| $01-$0A | 0-9 |
| $0B-$24 | a-z |
| $25-$3E | A-Z |
| $3F-$4A | Punctuation |
| $80-$FE | DTE pairs |
| $FD | Line break |
| $FE | Control code |
| $FF | Terminator |

### DTE Compression

**Table Location:** Bank 22, $B3A4

Common expansions:
- $82 → "th"
- $8C → "er"
- $90 → "an"
- $A5 → "the"
- $B3 → "ing"
- $C8 → "you"

### Text Locations

| Bank | Content | Strings |
|------|---------|---------|
| 12-13 | NPC Dialogue | ~670 |
| 17 | Location names | ~20 |
| 18 | Spell/item names | Embedded |
| 22 | Menu/UI | Full system |
| 23-24 | More dialogue | Various |
| 27 | Chapter titles | 5 |

---

## Technical Reference

### ROM Structure

**Mapper:** MMC3 (iNES Mapper 4)  
**PRG-ROM:** 512KB (32 × 16KB banks)  
**CHR-RAM:** 8KB (dynamic pattern tables)

### Memory Map

```
$0000-$1FFF  RAM (2KB + mirrors)
$6000-$7FFF  WRAM (8KB battery-backed)
$8000-$9FFF  Switchable PRG bank 0
$A000-$BFFF  Switchable PRG bank 1
$C000-$DFFF  Fixed PRG bank (-2, bank 30)
$E000-$FFFF  Fixed PRG bank (-1, bank 31)
```

### Bank Purposes

| Banks | Category | Description |
|-------|----------|-------------|
| 0-4 | Data | Map/tileset data |
| 5, 14, 25 | Text | Dialogue (DTE) |
| 6-7 | Mixed | Unknown |
| 8, 11 | Code | Utilities |
| 16-23 | **Code** | Main game/battle |
| 24, 27-30 | Code | Additional logic |
| 31 | Fixed | Reset/NMI/IRQ |

---

## Tools Reference

### Analysis Tools

| Tool | Purpose |
|------|---------|
| `rom_analyzer.py` | ROM structure analysis |
| `disasm_text_engine.py` | Text engine disassembly |
| `extract_dte_table.py` | DTE dictionary extraction |
| `decode_text.py` | Text decoding |
| `scan_game_text.py` | Bank text scanning |
| `analyze_pointers.py` | Pointer table analysis |

### Extraction Output

| File | Contents |
|------|----------|
| `dragon-warrior-4.tbl` | Text table (298 entries) |
| `all_text.txt` | Complete text dump (9587 lines) |
| `text_by_bank.json` | Text by bank |
| `npc_dialogue.json` | NPC dialogue |

---

## Related Projects

### DW4→DQ3r Port Project

**Location:** [GameInfo/Projects/dw4-dq3r/](../../../GameInfo/Projects/dw4-dq3r/)

This disassembly project feeds into the DW4→DQ3r porting effort:

| DW4 Data | DQ3r Usage |
|----------|------------|
| Monster stats | Convert to DQ3r format |
| Item data | Map to DQ3r items |
| Chapter system | Implement in DQ3r engine |
| AI logic | Port battle AI |
| Maps | Convert format |

### DQ3r SNES Project

**Repository:** [dq3r-info](https://github.com/TheAnsarya/dq3r-info)  
**Status:** ~98% complete (Issue #127)

The DQ3r engine documentation is complete, providing the target format specifications for the port.

---

## Work Remaining

### High Priority

1. **Complete monster extraction** - Verify all 195+ monsters
2. **Item stat extraction** - Attack/defense modifiers
3. **Spell system documentation** - Full spell data
4. **Map format documentation** - Tile/event formats

### Medium Priority

5. **AI system analysis** - Chapter 1-4 AI
6. **Wagon system** - Party management
7. **Event system** - Triggers and scripts

### Low Priority

8. **Audio extraction** - Music/SFX
9. **Graphics tools** - Sprite editor
10. **Full disassembly** - All banks annotated

---

## Session History

See [~docs/session-logs/](../~docs/session-logs/) for AI session history.

---

*This document is the master index for all DW4 documentation. Keep it updated as new documents are created.*
