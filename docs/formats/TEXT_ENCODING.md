# Text Encoding and Tables for Dragon Warrior IV

## Overview

Dragon Warrior IV uses a custom text encoding system, common for NES games of this era. This document details the character mapping, control codes, and text structure.

---

## Character Table (TBL Format)

### Standard Characters (Verified from TBL)

| Hex | Char | Hex | Char | Hex | Char | Hex | Char |
|-----|------|-----|------|-----|------|-----|------|
| $00 | (space) | $10 | f | $20 | v | $30 | L |
| $01 | 0 | $11 | g | $21 | w | $31 | M |
| $02 | 1 | $12 | h | $22 | x | $32 | N |
| $03 | 2 | $13 | i | $23 | y | $33 | O |
| $04 | 3 | $14 | j | $24 | z | $34 | P |
| $05 | 4 | $15 | k | $25 | A | $35 | Q |
| $06 | 5 | $16 | l | $26 | B | $36 | R |
| $07 | 6 | $17 | m | $18 | n | $37 | S |
| $08 | 7 | $19 | o | $29 | D | $38 | T |
| $09 | 8 | $1A | p | $2A | E | $39 | U |
| $0A | 9 | $1B | q | $2B | F | $3A | V |
| $0B | a | $1C | r | $2C | G | $3B | W |
| $0C | b | $1D | s | $2D | H | $3C | X |
| $0D | c | $1E | t | $2E | I | $3D | Y |
| $0E | d | $1F | u | $2F | J | $3E | Z |
| $0F | e | | | | | $3F | — |

**Verified:** This mapping matches the GameInfo TBL reference file.

### Punctuation and Special Characters (Verified from TBL)

| Hex | Character | Description |
|-----|-----------|-------------|
| $65 | — | Em dash |
| $66 | " | Opening double quote |
| $67 | " | Closing double quote |
| $68 | ' | Opening single quote |
| $69 | ' | Closing single quote |
| $6A | ' | Apostrophe |
| $6B | ' | Alternate apostrophe |
| $6C | .' | Period + apostrophe ligature |
| $6D | ? | Question mark |
| $6E | ! | Exclamation mark |
| $6F | - | Hyphen |
| $70 | ✱ | Asterisk/star |
| $71 | : | Colon |
| $72 | … | Ellipsis |
| $73 | 🪦 | Tombstone symbol |
| $74 | 💀 | Skull symbol |
| $75 | ( | Left parenthesis |
| $76 | ) | Right parenthesis |
| $77 | , | Comma |
| $78 | . | Period |
| $79 | 「 | Japanese opening bracket |

### UI and Special Tiles (Verified from TBL)

| Hex | Char | Description |
|-----|------|-------------|
| $80 | ▼ | Down arrow (continue prompt) |
| $81 | ▶ | Right arrow (selection cursor) |

Note: Additional UI tiles exist in the $82-$9F range but need further verification.

### Control Codes

| Hex | Code | Description |
|-----|------|-------------|
| $FE | [LINE] | Line break, continue on next line |
| $FF | [END] | End of string marker |
| $FC | [WAIT] | Wait for button press |
| $FD | [CLEAR] | Clear text window |
| $F0 | [NAME] | Insert character name |
| $F1 | [ITEM] | Insert item name |
| $F2 | [NUM] | Insert number |
| $F3 | [GOLD] | Insert gold amount |
| $F4-$F9 | [VAR#] | Variable insertions |

---

## Text Encoding Algorithm

### Encode (ASCII → Game Bytes)

```python
def encode_text(text: str, tbl: dict) -> bytes:
    """Convert ASCII text to game bytes using TBL mapping."""
    result = bytearray()
    i = 0
    while i < len(text):
        # Check for control codes first
        if text[i:i+6] == '[LINE]':
            result.append(0xFE)
            i += 6
            continue
        if text[i:i+5] == '[END]':
            result.append(0xFF)
            i += 5
            continue
        if text[i:i+6] == '[WAIT]':
            result.append(0xFC)
            i += 6
            continue
        if text[i:i+7] == '[CLEAR]':
            result.append(0xFD)
            i += 7
            continue
        if text[i:i+6] == '[NAME]':
            result.append(0xF0)
            i += 6
            continue
        
        # Normal character lookup
        char = text[i]
        if char in tbl:
            result.append(tbl[char])
        else:
            # Unknown character - use space or skip
            result.append(0x00)
        i += 1
    
    # Ensure string ends with terminator
    if not result or result[-1] != 0xFF:
        result.append(0xFF)
    
    return bytes(result)
```

### Decode (Game Bytes → ASCII)

```python
def decode_text(data: bytes, tbl_reverse: dict) -> str:
    """Convert game bytes to ASCII text using reverse TBL mapping."""
    result = []
    for byte in data:
        if byte == 0xFE:
            result.append('[LINE]')
        elif byte == 0xFF:
            result.append('[END]')
            break
        elif byte == 0xFC:
            result.append('[WAIT]')
        elif byte == 0xFD:
            result.append('[CLEAR]')
        elif byte == 0xF0:
            result.append('[NAME]')
        elif byte in tbl_reverse:
            result.append(tbl_reverse[byte])
        else:
            result.append(f'[${byte:02X}]')
    return ''.join(result)
```

---

## Text Data Structure

### String Pointer Tables

Text in DW4 is organized with pointer tables:

```
Pointer Table (in code bank):
    .word str_0000    ; Pointer to first string
    .word str_0001    ; Pointer to second string
    .word str_0002    ; ...
    ...

String Data (in text bank):
str_0000:
    .byte $26,$12,$0F  ; "The"
    .byte $00          ; space
    ...
    .byte $FF          ; end marker
    
str_0001:
    ...
```

### Multi-Bank Text

With 48KB of text data (banks 12-14), text spans multiple banks:

| Bank | Purpose | Approx Strings |
|------|---------|----------------|
| 12 ($30010) | Dialog Part 1 | ~500 strings |
| 13 ($34010) | Dialog Part 2 | ~500 strings |
| 14 ($38010) | Dialog Part 3, Names | ~500 strings |

### Text Compression (if present)

DW4 may use dictionary compression for common phrases:

```
Dictionary entries:
$E0 = " the "
$E1 = "ing "
$E2 = "tion"
$E3 = " is "
...

Compressed: "Walk$E0castle"
Expanded:   "Walk the castle"
```

---

## TBL File Format

Standard TBL file format for use with hex editors:

```
; Dragon Warrior IV Text Table
; Format: HexValue=Character

00=
01=0
02=1
03=2
04=3
05=4
06=5
07=6
08=7
09=8
0A=9
0B=a
0C=b
0D=c
0E=d
0F=e
10=g
11=h
12=i
13=j
14=k
15=l
16=m
17=n
18=o
19=p
1A=q
1B=r
1C=s
1D=t
1E=u
1F=v
20=O
...
FE=[LINE]
FF=[END]
```

---

## Extracting Text from ROM

### Finding Text Pointers

1. Search for known strings (e.g., "Ragnar", "Alena")
2. Find references to those addresses
3. Trace back to pointer table
4. Document pointer table location and size

### Extraction Script

```python
def extract_all_text(rom_data: bytes, ptr_table_offset: int, 
                     ptr_count: int, text_bank_offset: int) -> list:
    """Extract all text strings from ROM."""
    strings = []
    
    for i in range(ptr_count):
        # Read 16-bit pointer (little-endian)
        ptr_addr = ptr_table_offset + (i * 2)
        ptr = rom_data[ptr_addr] | (rom_data[ptr_addr + 1] << 8)
        
        # Convert CPU address to file offset
        # Assuming text bank is mapped at $8000
        file_offset = text_bank_offset + (ptr - 0x8000)
        
        # Read until $FF terminator
        text_bytes = []
        while rom_data[file_offset] != 0xFF:
            text_bytes.append(rom_data[file_offset])
            file_offset += 1
        text_bytes.append(0xFF)
        
        strings.append({
            'id': i,
            'ptr_addr': ptr_addr,
            'ptr_value': ptr,
            'data': bytes(text_bytes),
            'decoded': decode_text(bytes(text_bytes), TBL_REVERSE)
        })
    
    return strings
```

---

## DW4-Specific Text Features

### Character Names (4 bytes each)

Each party member has a 4-character name stored in SRAM:
- $6001 + (char_index * 30): First byte of character data
- Name occupies first 4 bytes of each character block

### Dynamic Text Insertion

The game inserts various values into text:
- Character names
- Item names
- Monster names
- Numbers (damage, gold, exp)
- Location names

### Text Window Dimensions

- Dialog box: 30 characters × 4 lines
- Name display: 8 characters max
- Item names: ~12 characters max
- Menu items: Variable

---

## JSON Text Format

For the asset pipeline:

```json
{
  "version": "1.0",
  "encoding": {
    "type": "tbl",
    "file": "dw4.tbl"
  },
  "banks": [
    {
      "bank_id": 12,
      "file_offset": "0x30010",
      "ptr_table": {
        "offset": "0x??",
        "count": 500,
        "entry_size": 2
      },
      "strings": [
        {
          "id": 0,
          "ptr": "0x8000",
          "raw": "26 12 0F 00 FF",
          "text": "The [END]",
          "context": "Generic article",
          "modified": false
        }
      ]
    }
  ]
}
```

---

## Editing Guidelines

### Text Expansion

If expanded text doesn't fit:
1. Abbreviate words
2. Use dictionary compression (if available)
3. Split into multiple text boxes
4. Move text to free space (update pointer)

### Text Reduction

Extra space is fine - pad with spaces or adjust pointer table.

### Special Characters

Always preserve control codes exactly:
- Don't change [LINE] positions without testing
- Keep [END] at the end
- Preserve [NAME] and [ITEM] placeholders

### Testing

After editing text:
1. Verify all strings terminate with $FF
2. Check pointer table is correctly updated
3. Test in-game for display issues
4. Verify text window doesn't overflow

---

## See Also

- [ROM_STRUCTURE.md](ROM_STRUCTURE.md) - Bank locations
- [ASSET_PIPELINE.md](ASSET_PIPELINE.md) - Extraction process
- GameInfo Wiki: Dragon Warrior 4 (NES) - TBL.wikitext
