# Dragon Warrior IV (NES) - Text Control Code Documentation

## Overview

The text system uses control codes in the range `$F0-$FF` with three specific
codes having dedicated handlers:

| Code | Name | Handler Address | Description |
|------|------|-----------------|-------------|
| `$FF` | END | $8B63 | Terminate text display |
| `$FE` | CTRL | $8B30 (inline) | PPU positioning control |
| `$FD` | LINE | $8B48 | Newline / line break |

Other values `$F0-$FC` are clamped to `$F0` by the type checker.

## Control Code Dispatcher

Location: Bank 22, $8B28

```asm
; Entry point - character already in A register
$8B28:  CMP #$FF
$8B2A:  BEQ $8B63       ; -> END handler
$8B2C:  CMP #$FE
$8B2E:  BNE $8B48       ; -> if not $FE, go to LINE handler
        ; Fall through to $FE (CTRL) handler
```

## $FF - END Control Code

**Handler:** $8B63

Terminates the current text display. This code marks the end of a text
string in the ROM.

```asm
$8B63:  LDA #$D1
$8B65:  STA $04F2       ; Set completion state
$8B68:  LDA #$1E
$8B6A:  STA $04F3       ; Set timer/delay
$8B6D:  LDA #$0C
$8B6F:  STA $03E1       ; Set window state
        ; ... continues to clear text state
```

**Usage in ROM:**
- Appears at the end of every text string
- Single byte, no parameters

## $FE - CTRL (PPU Positioning) Control Code

**Handler:** $8B30 (inline in dispatcher)

Calculates a new PPU address for text positioning. Used for placing
text at specific screen coordinates.

```asm
$8B30:  ASL $03D4       ; text_ppu_addr << 1
$8B33:  ASL $03D4       ; text_ppu_addr << 2
$8B36:  ASL $03D4       ; text_ppu_addr << 3 (multiply by 8)
$8B39:  LDA $F7         ; Load position parameter
$8B3B:  LSR             ; Shift right
$8B3C:  ROR $03D4       ; Rotate into PPU addr
$8B3F:  LSR             ; Repeat...
$8B40:  ROR $03D4
$8B43:  LSR
$8B44:  ROR $03D4
$8B47:  RTS
```

**Parameters:**
- Uses value in `$F7` (text_temp) for position calculation
- Parameter is typically set before the control code is processed

**PPU Address Calculation:**
The routine shifts `$03D4` left by 3 bits (×8), then rotates in 3 bits
from `$F7`, effectively calculating: `(old_addr << 3) | (param >> 5)`

## $FD - LINE (Newline) Control Code

**Handler:** $8B48

Advances text to the next line in the current text window.

```asm
$8B48:  LDA $07B4       ; Check input_flags
$8B4B:  AND #$04        ; Test bit 2
$8B4D:  BEQ $8B60       ; Skip if not set
$8B4F:  LDA $03D4       ; Get PPU address
$8B52:  CLC
$8B53:  ADC #$20        ; Add 32 (one row in nametable)
$8B55:  STA $03D4       ; Store new address
$8B58:  LDA $07B4       ; Clear flag
$8B5B:  AND #$FB        ; Clear bit 2
$8B5D:  STA $07B4
$8B60:  JMP $8C96       ; Continue to next state
```

**Behavior:**
- Adds `#$20` to PPU address (advances one tile row)
- Clears line-pending flag in `$07B4`
- Used for multi-line text display

## RAM Variables

| Address | Name | Description |
|---------|------|-------------|
| `$00EE-EF` | text_data_ptr | Pointer to current text data |
| `$00F0` | text_offset | Offset within text block |
| `$00F6` | current_char_raw | Raw character before processing |
| `$00F7` | text_temp | Temporary/parameter value |
| `$00F8` | current_char | Processed character code |
| `$03D3` | text_state | Text engine state |
| `$03D4` | text_ppu_addr | PPU nametable address for text |
| `$03D5` | text_flags | Text display flags |
| `$03D9` | text_line_ctr | Line counter |
| `$07B4` | input_flags | Input/state flags |

## Text Encoding Quick Reference

Standard characters (non-control codes):

| Range | Content |
|-------|---------|
| `$00` | Space |
| `$01-$0A` | Digits 0-9 |
| `$0B-$24` | Lowercase a-z |
| `$25-$3E` | Uppercase A-Z |
| `$65-$81` | Punctuation/special |
| `$F0-$FC` | (Clamped to $F0) |
| `$FD` | LINE |
| `$FE` | CTRL |
| `$FF` | END |

## Bank Information

- **Bank 22 ($16):** Text engine code, menu text
- **Bank 23 ($17):** Dialogue pointer tables (start at $8008)
- **Bank 26 ($1A):** Item/spell name strings
- **Bank 27 ($1B):** Chapter title strings

## Code Entry Points

| Address | Bank | Description |
|---------|------|-------------|
| `$8AA5` | 22 | Text character processor entry |
| `$8B28` | 22 | Control code dispatcher |
| `$8B30` | 22 | $FE handler (PPU control) |
| `$8B48` | 22 | $FD handler (LINE) |
| `$8B63` | 22 | $FF handler (END) |
| `$C3EA` | Fixed | Text loader with bank switch |
| `$FF91` | Fixed | Bank switch routine |
