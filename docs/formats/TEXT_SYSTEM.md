# Dragon Warrior IV - Text System

## Overview

DW4 uses a custom text encoding with Dual Tile Encoding (DTE) compression to fit extensive dialog into limited ROM space. Text is stored primarily in banks 5, 12-14, and 25.

## Text Encoding Table

### Basic Characters ($00-$3F)

| Range | Characters |
|-------|------------|
| $00 | Space |
| $01-$0A | 0-9 |
| $0B-$24 | a-z (lowercase) |
| $25-$3E | A-Z (uppercase) |
| $3F | Em dash (—) |

### Full Character Map

```
$00 = (space)
$01-$0A = 0 1 2 3 4 5 6 7 8 9
$0B-$24 = a b c d e f g h i j k l m n o p q r s t u v w x y z
$25-$3E = A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
$3F = — (em dash)
```

### Punctuation ($65-$81)

| Byte | Character | Description |
|------|-----------|-------------|
| $65 | — | Em dash (alternate) |
| $66 | " | Opening quote |
| $67 | " | Closing quote |
| $68 | ' | Opening single quote |
| $69 | ' | Closing single quote |
| $6A | ' | Left apostrophe |
| $6B | ' | Right apostrophe |
| $6C | .' | Period + quote combo |
| $6D | ? | Question mark |
| $6E | ! | Exclamation mark |
| $6F | - | Hyphen |
| $70 | ✱ | Star/asterisk |
| $71 | : | Colon |
| $72 | … | Ellipsis |
| $73 | 🪦 | Gravestone (status icon) |
| $74 | 💀 | Skull (dead status) |
| $75 | ( | Left parenthesis |
| $76 | ) | Right parenthesis |
| $77 | , | Comma |
| $78 | . | Period |
| $79 | 「 | Japanese bracket |
| $80 | ▼ | Down arrow (continue) |
| $81 | ▶ | Right arrow (selection) |

### DTE Codes ($82-$EF)

Dual Tile Encoding maps single bytes to common two-character sequences:

| Byte | Expansion | Byte | Expansion |
|------|-----------|------|-----------|
| $82 | "th" | $92 | "in" |
| $83 | "he" | $93 | "er" |
| $84 | "an" | $94 | "re" |
| $85 | "ou" | $95 | "on" |
| $86 | "en" | $96 | "at" |
| ... | ... | ... | ... |

*Full DTE table varies by region/version*

### Control Codes ($F0-$FF)

| Byte | Code | Description |
|------|------|-------------|
| $F0 | [WAIT] | Pause for player input |
| $F1 | [LINE] | New line |
| $F2 | [NAME] | Insert character name |
| $F3 | [ITEM] | Insert item name |
| $F4 | [NUM] | Insert number value |
| $F5 | - | (unused) |
| $F6 | - | (unused) |
| $F7 | [SPELL] | Insert spell name |
| $F8 | - | (reserved) |
| $F9 | [EXP] | Experience points |
| $FA | [LV] | Level |
| $FB | [HP] | Hit points |
| $FC | [MP] | Magic points |
| $FD | [CLEAR] | Clear text window |
| $FE | [PAUSE] | Timed pause |
| $FF | [END] | End of string |

## Text Banks

| Bank | ROM Range | Content |
|------|-----------|---------|
| 5 | $14010-$18000 | Menu text, items |
| 12 | $30010-$34000 | Dialog (Chapter 1-2) |
| 13 | $34010-$38000 | Dialog (Chapter 3-4) |
| 14 | $38010-$3C000 | Dialog (Chapter 5) |
| 25 | $64010-$68000 | Additional text |

## String Structure

### Basic String

```
[text bytes...] $FF
```

All strings terminate with $FF.

### Dialog with Formatting

```
[text] $F1 [more text] $F0 [text] $FF
        ^              ^
        newline        wait for input
```

### Variable Insertion

```
"[NAME] gained $F4 experience points!"
         ^
         inserts numeric value from memory
```

## Pointer Tables

### Dialog Pointer Format

```asm
; Bank 12 pointer table
dialog_pointers:
    .word string_0    ; Pointer to first string
    .word string_1    ; Pointer to second string
    .word string_2
    ...
```

### Finding Text

1. Look up dialog ID in pointer table
2. Add bank base address
3. Read bytes until $FF

## Text Rendering

### Window Dimensions

| Window Type | Width | Height |
|-------------|-------|--------|
| Dialog | 22 tiles | 4 tiles |
| Menu | Variable | Variable |
| Battle | 22 tiles | 2 tiles |

### Character Width

All characters are fixed-width (8 pixels). No kerning.

### Line Break

$F1 advances to next line. If at bottom of window, scrolls up.

## DTE Compression Details

### Compression Ratio

Typical compression: ~20-30% space savings

### Common Sequences

English-optimized DTE targets:
- "th", "he", "in", "er", "an"
- "re", "on", "en", "at", "ed"
- "the", "ing" (3-char sequences may use 2 DTE)

### Decoder Algorithm

```asm
decode_text:
    LDA (ptr),Y        ; Read byte
    CMP #$82           ; DTE range start
    BCC .output_raw    ; Below $82, output directly
    CMP #$F0           ; Control code range
    BCS .control_code  ; $F0+, handle control
    ; DTE decode
    SEC
    SBC #$82           ; Get DTE index
    ASL A              ; ×2 for table offset
    TAX
    LDA dte_table,X    ; First character
    JSR output_char
    LDA dte_table+1,X  ; Second character
    JSR output_char
    JMP .next
.output_raw:
    JSR output_char
.next:
    INY
    JMP decode_text
.control_code:
    ; Handle $F0-$FF codes
    ...
```

## Name Entry

### Available Characters

```
A B C D E F G H I J K L M
N O P Q R S T U V W X Y Z
a b c d e f g h i j k l m
n o p q r s t u v w x y z
0 1 2 3 4 5 6 7 8 9
. , ' ! ? - (space)
```

### Name Length

- Hero name: 8 characters max
- Other characters: Pre-defined names

## Extracted Text Statistics

From ROM analysis:
- **641 strings** found via pattern matching
- **Banks 12-14** contain main dialog
- Partial extraction due to DTE complexity

## ROM Addresses

### Text Bank Locations

| Bank | File Offset | CPU Address |
|------|-------------|-------------|
| 5 | $14010 | $8000-$BFFF |
| 12 | $30010 | $8000-$BFFF |
| 13 | $34010 | $8000-$BFFF |
| 14 | $38010 | $8000-$BFFF |
| 22 | $58010 | Contains text pointer at $B3A4 |

### Known Pointer Tables

```
Bank 22 $B3A4 - Text pointer table reference
```

## Comparison: DW4 vs DQ3r

| Feature | DW4 (NES) | DQ3r (SNES) |
|---------|-----------|-------------|
| Encoding | Custom DTE | Huffman/LZ |
| Char width | 8px fixed | 8/16px VWF |
| Max length | 255 bytes | Much larger |
| Variables | $F2-$F4 | More sophisticated |
| Languages | EN only | JP primary |

## Files

- [dw4.tbl](../../data/dw4.tbl) - Text encoding table
- [dialog.json](../../assets/text/dialog.json) - Extracted dialog
- [strings.json](../../assets/text/strings.json) - All found strings
- [extracted_text.txt](../../assets/text/extracted_text.txt) - Plain text dump
