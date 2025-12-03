# Dragon Warrior IV (NES) - Text System Analysis

## Overview

The Dragon Warrior IV text system uses a combination of:
1. Direct character encoding ($00-$7F)
2. DTE (Dual Tile Encoding) compression ($80-$FE)
3. Control codes ($FD, $FE, $FF)

## Character Encoding

### Basic Characters ($00-$4A)

| Range | Content |
|-------|---------|
| $00 | Space |
| $01-$0A | Digits 0-9 |
| $0B-$24 | Lowercase a-z |
| $25-$3E | Uppercase A-Z |
| $3F | ' (apostrophe) |
| $40 | . (period) |
| $41 | , (comma) |
| $42 | - (hyphen) |
| $43 | ? (question mark) |
| $44 | ! (exclamation) |
| $45 | ( (open paren) |
| $46 | ) (close paren) |
| $47 | / (slash) |
| $48 | : (colon) |
| $49 | * (asterisk) |
| $4A | " (quote) |

### Alternate Punctuation ($65-$78)

| Code | Character |
|------|-----------|
| $65 | ' |
| $66 | . |
| $67 | , |
| $68 | ~ |
| $69 | ? |
| $6A | ! |
| $6B | ( |
| $6C | ) |
| $6D | / |
| $6E | : |
| $6F | * |
| $70 | " |
| $71 | - |
| $78 | . |

## DTE Compression

### Overview

Bytes $80-$FE are DTE (Dual Tile Encoding) codes that expand to two characters each. This provides approximately 50% text compression for common letter pairs.

### Table Location

- **Bank**: 22 ($16)
- **CPU Address**: $B3A4
- **ROM Offset**: 0x5B3B4
- **Size**: 128 entries × 2 bytes = 256 bytes

### How It Works

1. Text engine reads a byte from the text stream
2. If byte >= $80 and < $FD, it's a DTE code
3. Index into table: `TABLE_BASE + (byte - $80) * 2`
4. Output both bytes from table as characters

### Code Reference (Bank 22)

```asm
check_dte:
    $8272: CMP #$80     ; Check if byte >= $80
    $8274: BCS $829A    ; Branch to DTE handler if true
    
dte_handler:
    $829A: PHA          ; Save original byte
    $829B: AND #$07     ; Get low 3 bits
    $829D: TAX          ; Transfer to X
    ; ... (lookup and expand)
    $82CD: PLA          ; Restore original
    $82CE: JMP $8336    ; Continue processing
```

### Complete DTE Table

See `docs/analysis/dte_dictionary_table.md` for the full table.

Common entries include:
- $8B = "QU" (QUEST)
- $8C = "ES" (common ending)
- $8E = "ON" (CONTINUE)
- $B6 = "th" (the)
- $BF = "he" (the, he)

## Control Codes

### $FF - END

Terminates text string display.

```asm
ctrl_FF_handler:
    $8B63: LDA #$D1
    $8B65: STA $04F2
    ; ... cleanup and return
```

### $FE - CTRL (PPU Positioning)

Controls PPU nametable address for text placement.

```asm
ctrl_FE_handler:
    $8B30: ASL $03D4    ; Shift PPU address
    $8B33: ASL $03D4
    $8B36: ASL $03D4
    $8B39: LDA $F7      ; Get parameter
    ; ... calculate new position
```

### $FD - LINE (Newline)

Moves text to next line.

```asm
ctrl_FD_handler:
    $8B48: LDA $07B4    ; Load flags
    $8B4B: AND #$04     ; Check line flag
    ; ... advance line position
    $8B55: ADC #$20     ; Add 32 (one row)
```

## Text Banks

### Bank 17 - Location Names

Contains location/place names:
- "the Tower"
- "the Stars"  
- "the Moon"
- "the Sun"
- "the Terminator"

Located around $BE00-$BFFF.

### Bank 22 - Menu/UI Text

Contains menu and status screen text:
- HP, MP, LEVEL
- STRENGTH, AGILITY, LUCK
- ATTACK, DEFENSE
- Menu options: QUEST, CONTINUE, FIGHT, etc.

Text engine code is also in this bank ($8000-$B3B0).
Menu text starts at $B3B3.

### Bank 23 - Casino/Dialogue

Contains casino poker hands:
- Royal Flush
- 5 of a Kind
- Straight Flush
- 4 of a Kind
- Full House
- Flush
- Straight
- 3 of a Kind
- 2 Pairs

Also contains dialogue pointer table at $8008.

### Bank 27 - Chapter Titles

Contains chapter introduction text:
- Chapter 1: The Royal Soldiers
- Chapter 2: Princess Alena's Adventure
- Chapter 3: Taloon the Arms Merchant
- Chapter 4: The Sisters of Monbaraba
- Chapter 5: The Chosen Ones

Located around $A660-$A700.

## Text Engine Entry Points

| Address | Function |
|---------|----------|
| $8AA5 | Main character processor |
| $8B28 | Control code dispatcher |
| $95AF | Text read loop |
| $C3EA | Text loader (fixed bank) |

## Zero Page Usage

| Address | Purpose |
|---------|---------|
| $EE-$EF | Pointer to current text data |
| $F0 | Offset within text block |
| $F6 | Raw character before processing |
| $F7 | Parameter/temp value |
| $F8 | Processed character code |

## RAM Usage

| Address | Purpose |
|---------|---------|
| $03D3 | Text engine state |
| $03D4 | PPU nametable address |
| $03D9 | Line counter |
| $0507 | Current bank number |
| $0517 | Text bank number |
| $0554+ | Character output buffer |
| $07B4 | Input/state flags |

## Tools

- `tools/decode_text.py` - Decode text with DTE expansion
- `tools/disasm_text_engine.py` - Disassemble text engine code
- `tools/extract_dialogue.py` - Extract all dialogue
- `tools/extract_chapters.py` - Extract chapter titles
- `tools/scan_game_text.py` - Scan banks for text patterns
- `data/dragon-warrior-4.tbl` - TBL file for ROM hacking tools

## See Also

- `docs/analysis/dte_dictionary_table.md` - Complete DTE table
- `docs/analysis/text_control_codes.md` - Control code handlers
- `extracted/dialogue.json` - Extracted dialogue data
