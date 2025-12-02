# Dragon Warrior IV - Text System Analysis

## Overview

The text system in DW4 NES is more complex than a simple TBL+DTE system. Based on disassembly, it uses:

1. **Plain TBL encoding** for visible characters ($00-$7F range)
2. **Control codes** ($F0-$FF range) for formatting
3. **Possible compression** for dialogue text (Bank 23)
4. **Bank switching** via MMC3 for text data access

## Memory Map

### Key RAM Locations
| Address | Name | Purpose |
|---------|------|---------|
| $0507 | bank_current | Current switched PRG bank |
| $0517 | text_bank | Bank containing current text data |
| $EE-$EF | text_data_ptr | Pointer to current text data |
| $F5 | text_flags | Text rendering flags |
| $F6 | text_char_in | Character input to processor |
| $F7 | text_temp | Temporary storage |
| $F8 | current_char | Current character being processed |
| $03D4 | text_ppu_addr | PPU address for text output |
| $07B4 | text_state | Text state machine flags |

### Text Banks
- **Bank 17**: Some text data (pointers at $8000)
- **Bank 22**: Menu text engine code + menu strings
- **Bank 23**: Dialogue text (appears compressed)
- **Bank 27**: Additional text data

## Character Encoding (TBL)

### Plain Characters ($00-$7F)
```
$00 = space
$01-$0A = '0'-'9'
$0B-$24 = 'a'-'z'
$25-$3E = 'A'-'Z'
$6F = '-'
$71 = ':'
$77 = ','
$78 = '.'
$7A = '!'
$7B = '?'
$7E = '''
```

### Control Codes ($8x, $Fx)
```
$8B = Menu separator (between menu items)
$89 = Unknown control code
$FD = New line
$FE = Control/formatting command
$FF = End of string
```

### Possible DTE/Dictionary ($80-$EF)
Values in this range may be:
- Dictionary indices for decompression
- Control codes for special formatting
- More analysis needed

## Code Entry Points (Bank 22)

### Text Character Processing
| Address | Purpose |
|---------|---------|
| $8A08 | Direct char entry - char in A |
| $8A18 | Inline text entry (1-byte return addr mod) |
| $8A45 | Inline text entry (2-byte version) |
| $8A72 | Inline text entry with state |
| $8AA5 | Main character processor |

### Control Code Handling
| Address | Purpose |
|---------|---------|
| $8B11 | Text_CheckControlCode - validate control codes |
| $8B28 | Control code dispatcher |
| $8B48 | Handle $FD (new line) |
| $8B30 | Handle $FE (PPU manipulation) |
| $8B63 | Handle $FF (end of text) |

### Support Routines
| Address | Purpose |
|---------|---------|
| $8BDA | Text data attribute reader |
| $8C96 | PPU address calculation |
| $90C4 | Character renderer init |
| $9553 | Text pointer table lookup |

## Fixed Bank Routines ($C000-$FFFF)

### Bank Switching
| Address | Purpose |
|---------|---------|
| $FF91 | Bank switch - writes to $0507, $0501 |
| $C3EA | Load text byte from switched bank |
| $C3BA | Read pointer from bank's table |
| $C38B | Call routine in switched bank |
| $C3CE | Load pointer into zero page |

## Text Data Structures

### Bank 22 Menu Text ($B3A3)

The area at $B3A3 contains an **index array** followed by text strings:

```
$B3A3: 06 07 05 03 00 1D 1A 0F 0F 0E 00 23 19 1F 00 16 ...
```

These appear to be offsets or indices into the following text:
```
$B3B3: "ou like. A QUEST"
$B3C3: "CONTINUE"
$B3CB: [8B] "CHANGE MESSAGE SPEED"
...
```

The code at $B387 does `LDA $B3A3,X` to read from this table.

### String Structure
- Strings are NOT null-terminated
- Strings end with $FF control code
- Menu items separated by $8B
- New lines use $FD

## Compression Analysis

### Bank 23 Dialogue
The dialogue in Bank 23 uses a different format:
```
$B4C1: 4B F0 04 E1 5C EE E0 57 E0 00 0C EE C0 E1 5E F3 ...
```

This appears to be compressed. Patterns observed:
- High bytes ($E0, $EE, $F0, $F3) suggest dictionary/DTE
- Some plain text visible: `bipn8ipngnpn5kp`
- Needs further analysis of decompression routine

## Next Steps

1. Trace $C3EA to understand text byte loading
2. Find where Bank 23 decompression occurs
3. Map the DTE/dictionary table if it exists
4. Document the index table format at $B3A3
5. Find all text banks and their pointer tables
