# Dragon Warrior 4 (NES) - EXP System Analysis

## Overview

The EXP system in DW4 uses a formula-based calculation rather than storing all 99 level values 
for each character. This is a space-efficient approach on the NES.

## Key Memory Locations

### RAM
- `$72-$74`: Current character's EXP (3 bytes, little-endian)
- `$6E19-$6E1B,X`: Calculated EXP requirement for next level (indexed by character)
- `$6E3C`: Loop counter for party processing
- `$6E`: Current character index being processed

### ROM (Bank 18)
- `$A0FB`: Pointer table to EXP coefficient data (16-bit pointers)
- `$A123+`: Character-specific EXP coefficient data

## EXP Calculation Routine

Located in Bank 18 at `$9F7C`:

```
loc_9F7C:
    LDA $0B             ; Character class index
    CMP #$06            ; Special case check
    BEQ $9F88
    JSR $9F9C           ; Load coefficients
    JMP $9FB9           ; Calculate EXP

loc_9F9C:
    ASL                 ; Index * 2 (16-bit pointer)
    TAX
    LDA $A0FB,X         ; Load pointer low byte
    STA $0C
    LDA $A0FC,X         ; Load pointer high byte
    STA $0D
    ; ... continues with calculation
```

## Pointer Table at $A0FB

| Index | Pointer | Character(s) |
|-------|---------|--------------|
| 0     | $A123   | Hero         |
| 1     | $A14B   | Cristo       |
| 2     | $A17B   | Nara         |
| 3     | $A1AB   | Mara         |
| 4     | $A1DB   | Brey         |
| 5     | $A20B   | Taloon       |
| 6     | $A1AB   | Alena? (same as Mara) |
| 7     | $A23B   | Ragnar       |

Note: Entries 3 and 6 point to the same address ($A1AB), suggesting Mara and Alena 
may share the same EXP curve, or the index mapping is different than assumed.

## Level-Up Check Code

Located in Bank 18 at `$9C22`:

```asm
    BRK                     ; $9C22: 00 (NMI/interrupt?)
    .byte $0F               ; $9C23
    .byte $43               ; $9C24
    PHP                     ; $9C25
    CMP #$63                ; $9C26: Compare to max level 99
    BEQ $9C4F               ; If max level, skip
    ; ... get level, calculate EXP needed
    LDA $6E19,Y             ; Get required EXP low byte
    SEC
    SBC $72                 ; Subtract current EXP
    STA $00
    LDA $6E1A,Y             ; Mid byte
    SBC $73
    STA $01
    LDA $6E1B,Y             ; High byte
    SBC $74
    STA $02
```

The comparison at `$9CAA-$9CBF` checks:
```asm
    LDA $74                 ; Current EXP high byte
    CMP $6E1B,X             ; Required EXP high byte
    BCC $9CC1               ; If current < required, no level up
    BNE $9CE5               ; If different, level up!
    LDA $73                 ; Mid byte check
    CMP $6E1A,X
    BCC $9CC1
    BNE $9CE5
    LDA $72                 ; Low byte check
    CMP $6E19,X
    BCS $9CE5               ; If current >= required, level up!
```

## Implications

1. **Formula-based EXP**: The game calculates EXP requirements using coefficients, 
   not a simple lookup table. This saves significant ROM space.

2. **Character Classes**: There appear to be ~8 different EXP curves, with some 
   characters potentially sharing the same curve.

3. **Max Level Check**: The constant `#$63` (99 decimal) is used throughout for 
   max level checks.

4. **Runtime Loading**: EXP requirements are calculated and stored in RAM at 
   `$6E19-$6E1B` during gameplay, not read directly from ROM.

## Further Research Needed

- [ ] Decode the exact EXP formula from the coefficients
- [ ] Verify character-to-index mapping
- [ ] Confirm which characters share EXP curves
- [ ] Document the complete level-up process flow
