# Dragon Warrior IV (NES) - Reverse Engineering Summary

## Project Overview

This repository contains tools, documentation, and extracted data from reverse engineering Dragon Warrior IV for NES.

**ROM:** Dragon Warrior IV (1992-10)(Enix)(US).nes  
**Platform:** Nintendo Entertainment System  
**Mapper:** MMC3 (Mapper 4)  
**PRG-ROM:** 512KB (32 × 16KB banks)  
**CHR-RAM:** 8KB (pattern tables loaded dynamically)

---

## Key Discoveries

### 1. Text Encoding System

The game uses a custom character encoding:

| Range | Mapping |
|-------|---------|
| $00 | Space |
| $01-$0A | 0-9 (digits) |
| $0B-$24 | a-z (lowercase) |
| $25-$3E | A-Z (uppercase) |
| $3F-$4A | Punctuation: ' . , - ? ! ( ) / : * " |
| $65-$78 | Alternate punctuation |
| $80-$FE | DTE compressed pairs |
| $FD | Line break |
| $FE | Control code (position/PPU) |
| $FF | String terminator |

### 2. DTE Compression (Dual Tile Encoding)

**Location:** Bank 22, CPU $B3A4, ROM offset 0x5B3B4

The DTE table contains 127 entries ($80-$FE), each mapping to a 2-byte pair that expands to 2+ characters. DTE codes can be nested (one DTE byte expands to another DTE code).

**Common DTE Expansions:**
- $82 → "th" (very common)
- $8C → "er"
- $90 → "an" 
- $A5 → "the"
- $B3 → "ing"
- $C8 → "you"

### 3. Text Engine Code

**CPU Address Range:** $8260-$8AA5 (fixed bank)

Key Routines:
- **$8272**: DTE check - `CMP #$80; BCS dte_handler`
- **$829A**: DTE expansion handler
- **$8AA5**: Character processor
- **$8334**: Control code handlers ($FD, $FE, $FF)

### 4. Text Locations by Bank

| Bank | Address Range | Content | Notes |
|------|---------------|---------|-------|
| 12-13 | Various | NPC Dialogue | Story dialogue, ~670 strings |
| 17 | Various | Location names | "the Tower", "the Stars", "the Moon", "the Sun" |
| 18 | $A698, $A6F1 | Spell names | "Outside", "Return" (embedded in code) |
| 18 | $AFFA | Item names | "Wing of Wyvern" (embedded in code) |
| 22 | $B03C-$B1C0 | Menu/UI Text | Full menu system text |
| 22 | $B3A4 | DTE Table | 128 compression pairs |
| 23 | $82EC-$83A8 | Casino text | "Royal Flush", "Straight Flush", etc. |
| 23-24 | Various | NPC Dialogue | Additional dialogue banks |
| 27 | $A66C-$A6DE | Chapter titles | All 5 chapter names |
| 31 (fixed) | $E854 | Text Routine | Main text rendering code |

### 5. Chapter Titles (Bank 27)

1. **Chapter 1:** The Royal Soldiers
2. **Chapter 2:** Princess Alena's Adventure  
3. **Chapter 3:** Taloon the Arms Merchant
4. **Chapter 4:** The Sisters of Monbaraba
5. **Chapter 5:** The Chosen Ones

### 6. Location Names (Bank 17)

- Strength
- Evil
- the Tower
- the Stars
- the Moon
- the Sun
- the Terminator

---

## Tools Created

### Analysis Tools

| Tool | Purpose |
|------|---------|
| `disasm_text_engine.py` | Disassembles text engine code |
| `extract_dte_table.py` | Extracts DTE dictionary |
| `extract_dte_complete.py` | Documents all DTE pairs |
| `decode_text.py` | Decodes text with DTE expansion |
| `extract_dialogue.py` | Extracts menu/dialogue text |
| `scan_game_text.py` | Scans all banks for text |
| `extract_chapters.py` | Extracts chapter titles |
| `analyze_pointers.py` | Analyzes pointer tables |
| `map_bank_contents.py` | Maps code/data regions |
| `export_asm.py` | Generates labeled assembly |
| `dump_all_text.py` | Complete text dump (4372 strings) |
| `extract_npc_dialogue.py` | NPC dialogue extractor (670 strings) |
| `extract_spell_item_names.py` | Spell/item name search tool |
| `rom_browser.py` | Interactive hex/text browser |

### Output Files

| File | Contents |
|------|----------|
| `data/dragon-warrior-4.tbl` | Text table for ROM hacking tools (298 entries) |
| `docs/analysis/dte_dictionary_table.md` | Complete DTE documentation |
| `docs/analysis/text_system_overview.md` | Text system architecture |
| `docs/analysis/text_locations.md` | Complete text location reference |
| `docs/analysis/menu_strings_complete.md` | Menu string addresses |
| `docs/analysis/text_routine_documentation.md` | Text rendering code analysis |
| `disasm/text_engine.asm` | Labeled assembly (353 lines) |
| `extracted/all_text.txt` | Complete text dump (9587 lines) |
| `extracted/text_by_bank.json` | Text organized by bank |
| `extracted/npc_dialogue.json` | NPC dialogue data |
| `extracted/spell_item_names.json` | Found spell/item names |

---

## Technical Details

### Memory Map (MMC3)

```
$0000-$1FFF  RAM (2KB + mirrors)
$6000-$7FFF  WRAM (8KB battery-backed)
$8000-$9FFF  Switchable PRG bank 0
$A000-$BFFF  Switchable PRG bank 1  
$C000-$DFFF  Fixed PRG bank (-2, bank 30)
$E000-$FFFF  Fixed PRG bank (-1, bank 31)
```

### Text System Zero Page Variables

| Address | Purpose |
|---------|---------|
| $EE | text_ptr_lo |
| $EF | text_ptr_hi |
| $F8 | current_char |
| $F9 | temp_store |
| $FA | dte_byte_1 |
| $FB | dte_byte_2 |

### ROM Header

```
Offset 0x00000: NES header (16 bytes)
                4E 45 53 1A = "NES" + EOF marker
Offset 0x00010: PRG-ROM bank 0 starts
```

### Bank Calculation

```
ROM_offset = 16 + (bank * 0x4000) + (cpu_addr - 0x8000)
```

---

## Usage Examples

### Decode text from ROM offset:
```python
from tools.decode_text import TextDecoder
decoder = TextDecoder('roms/Dragon Warrior IV (1992-10)(Enix)(US).nes')
text = decoder.decode_from_offset(0x5B3B4, max_len=100)
```

### Extract chapter titles:
```bash
python tools/extract_chapters.py
```

### Generate complete text dump:
```bash
python tools/dump_all_text.py
```

---

## Next Steps

1. **Monster Names**: Names not found with standard encoding - likely use different compression or table
2. **Complete Spell Table**: Only Return, Outside, Sap found - most spells are DTE-compressed
3. **Complete Item Table**: Only "Wing of Wyvern" found - items heavily DTE-compressed
4. **Pointer Table Analysis**: Bank 18 starts with code pointers, need to trace item/spell references
5. **Character Stats**: Find character base stat tables and growth curves
6. **Script Analysis**: Document the game's scripting system for events/cutscenes
7. **Graphics**: Analyze CHR-RAM loading and tile patterns

### Key Challenges

- **Heavy DTE Compression**: Most game text uses DTE, making direct string searches fail
- **Embedded Strings**: Spell/item names embedded within code, not in separate tables
- **Monster Data**: Monster names may use a completely different encoding system

---

## Contributing

This is an active reverse engineering project. Key areas needing work:
- Pointer table documentation for dialogue
- Bank switching analysis during text display
- Complete NPC dialogue extraction
- Event/cutscene scripting system

---

## License

This project is for educational and preservation purposes. Dragon Warrior IV is © 1990 Chunsoft/Enix.
