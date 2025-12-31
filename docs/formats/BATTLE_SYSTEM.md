# Dragon Warrior IV - Battle System Technical Reference

## Overview

DW4's battle system spans banks 16-23 with additional logic in banks 27-30. The system manages turn-based combat with up to 4 active party members against up to 8 enemies.

## Bank Allocation

| Bank | ROM Offset | Subroutines | Primary Role |
|------|------------|-------------|--------------|
| 16 | $40010 | 203 | Battle entry, state machine |
| 17 | $44010 | 236 | Action processing |
| 18 | $48010 | 206 | Party management |
| 19 | $4C010 | 284 | **Core calculations** |
| 20 | $50010 | 194 | Enemy AI |
| 21 | $54010 | 185 | Damage/healing formulas |
| 22 | $58010 | 232 | Spell effects |
| 23 | $5C010 | 203 | Status effects |

## Battle Entry

### From Fixed Bank (Bank 31)

```asm
; Battle initiated via bank switch
JSR $FF91           ; Bank switch routine
.byte BANK_19       ; Target bank
.word $8038         ; Entry point
```

### Bank 19 Entry ($8038)

```asm
sub_8038_entry:
    JSR sub_8088    ; Read game state from $615B → $6E80
    JSR sub_80A1    ; Check conditions via $72F4,X
    ; Fall through to main battle loop
```

## State Machine

### Battle States ($6E80)

| Value | State | Description |
|-------|-------|-------------|
| $00 | INIT | Initialize battle |
| $01 | PLAYER_TURN | Waiting for/processing player input |
| $02 | AI_TURN | AI-controlled character deciding |
| $03 | ENEMY_TURN | Enemy AI executing |
| $04 | EXECUTE | Actions being resolved |
| $05 | DAMAGE | Displaying damage/effects |
| $06 | CHECK_END | Victory/defeat check |
| $07 | VICTORY | Battle won |
| $08 | DEFEAT | Party wiped |
| $09 | FLEE | Escape attempted |

### Jump Table Dispatch ($805B)

```asm
sub_805B:
    LDA $75E8       ; Load action index (0-7)
    CMP #$08
    BCS .invalid
    ASL A
    TAX
    LDA jump_table,X
    STA ptr0
    LDA jump_table+1,X
    STA ptr0+1
    JMP (ptr0)

jump_table:
    .word action_0  ; Attack
    .word action_1  ; Defend
    .word action_2  ; Item
    .word action_3  ; Spell
    .word action_4  ; Run
    .word action_5  ; Tactics
    .word action_6  ; Special
    .word action_7  ; AI action
```

## Damage Calculation

### Physical Damage Formula

```
Base Damage = ATK - DEF/2
Variance = ±12.5%
Final = Base × Variance × Multipliers

If (DEF/2 > ATK):
    Damage = 0-1 (minimum damage)
```

### Bank 19 Division Routines

#### 16-bit Division ($83C5)

```asm
; Input:
;   tmp0,X/tmp1,X = dividend (16-bit)
;   $6E14-$6E15 = divisor (16-bit)
; Output:
;   tmp0,X/tmp1,X = quotient
;   $6E11-$6E12 = remainder

loc_83C5:
    ASL tmp0,X      ; Shift dividend left
    ROL tmp1,X
    ROL $6E11       ; Shift into remainder
    ROL $6E12
    INC tmp0,X      ; Assume quotient bit = 1
    LDA $6E11
    SEC
    SBC $6E14       ; Try subtraction
    PHA
    LDA $6E12
    SBC $6E15
    BCS .keep       ; If no borrow, subtraction valid
    PLA
    DEC tmp0,X      ; Quotient bit = 0
    JMP .next
.keep:
    STA $6E12
    PLA
    STA $6E11
.next:
    DEY
    BNE loc_83C5    ; Loop 16 times
    RTS
```

#### 24-bit Division ($8414)

Used for large experience/gold calculations.

### Multiplier Routines

```asm
; Bank 19 $8176 - Multiply by 16 (left shift × 4)
sub_8176:
    ASL A
    ASL A
    ASL A
    ASL A
    RTS

; Bank 19 $8187 - Divide by 16 (right shift × 4)
sub_8187:
    LSR A
    LSR A
    LSR A
    LSR A
    RTS
```

### Stat Scaling ($8198)

```asm
sub_8198:
    ; Scale value in A based on character level/stats
    STA $17
    JSR sub_8330    ; Get scaling factor
    ; Multiply $17 × scaling factor
    ...
    RTS
```

## Critical Hit System

### Critical Rate

```
Base Critical Rate = 1/64 (1.5625%)
Factors:
  - Character speed affects rate
  - Some weapons have bonus critical rate
  - Alena's critical rate increases with level
```

### Alena Special

Alena has an enhanced critical system:
```
Critical Rate = Level / 256
At Level 99: ~38.7% critical rate
```

## Spell System Integration

### MP Cost Check

```asm
; Before casting
check_mp:
    LDX char_index
    LDA spell_cost,Y       ; Y = spell ID
    CMP $6002,X            ; Current MP
    BCS .not_enough
    ; Cast spell
    SEC
    LDA $6002,X
    SBC spell_cost,Y
    STA $6002,X
    JMP spell_effect
.not_enough:
    ; "Not enough MP" message
    RTS
```

### Spell Effect Dispatch

```asm
; Bank 22 handles spell effects
spell_dispatch:
    LDA spell_id
    ASL A
    TAX
    LDA spell_table,X
    STA ptr0
    LDA spell_table+1,X
    STA ptr0+1
    JMP (ptr0)
```

## Enemy AI (Bank 20)

### AI Decision Tree

```
1. Check HP percentage
   - Low HP: Consider healing
2. Check party status
   - Vulnerable targets
3. Select action from pattern table
4. Random variance for unpredictability
```

### Monster Action Patterns

Each monster has an action pattern byte:
```
Bits 0-1: Primary action weight
Bits 2-3: Secondary action weight
Bits 4-5: Special action weight
Bits 6-7: Magic action weight
```

## Turn Order

### Agility-Based Initiative

```
Turn Priority = AGI + Random(0-15)
Higher priority acts first
```

### Processing Order

1. Calculate all turn priorities
2. Sort characters/enemies by priority
3. Process actions in order
4. Check for death/flee between actions

## Status Effects (Bank 23)

### Status Byte

| Bit | Status |
|-----|--------|
| 0 | Poison |
| 1 | Sleep |
| 2 | Surround (defense down) |
| 3 | Confused |
| 4 | Silenced |
| 5 | Paralyzed |
| 6 | Dead |
| 7 | (Reserved) |

### Status Processing

```asm
process_status:
    LDA status_byte,X
    BEQ .no_status
    LSR A
    BCC .not_poison
    JSR poison_damage
.not_poison:
    LSR A
    BCC .not_sleep
    ; Check wake up
    ...
```

## Experience/Gold Distribution

### Experience Formula

```
Total EXP = Sum of all defeated monster EXP
Per character = Total EXP / Living party members
```

### Gold Distribution

```
Total Gold = Sum of all defeated monster gold
Gold goes to party inventory (not split)
```

### Level Up Check

```asm
check_level_up:
    LDX char_index
    LDA $601C,X         ; Current EXP high
    CMP exp_table_hi,Y  ; Y = current level
    BCC .no_level
    LDA $601A,X         ; Current EXP low
    CMP exp_table_lo,Y
    BCC .no_level
    ; Level up!
    INC level,X
    JSR stat_increase
    ...
```

## Battle RAM Summary

### Key Addresses

| Address | Purpose |
|---------|---------|
| $615A | Current actor index |
| $616A | Current action data |
| $618E | Battle state flags |
| $6195-$6196 | Battle counters |
| $6E80 | Battle mode/state |
| $72F4,X | Character state array |
| $75E8 | Action index |

### Temporary Calculation Space

| Address | Purpose |
|---------|---------|
| $6E00-$6E10 | Scratch bytes |
| $6E11-$6E13 | Division remainder |
| $6E14-$6E16 | Division divisor |

## Comparison: DW4 NES vs DQ3r SNES

| Feature | DW4 (NES) | DQ3r (SNES) |
|---------|-----------|-------------|
| Max party | 4 active | 4 active |
| Max enemies | 8 | 8 |
| Damage cap | 255 (8-bit) | 65535 (16-bit) |
| Division | Software | Software (but faster) |
| AI complexity | Simple patterns | More sophisticated |

## Files

- [battle_system_analysis.md](../../docs/battle_system_analysis.md) - Original analysis
- [code_map.txt](../../data/code_map.txt) - Bank subroutine counts
- Bank disassemblies in `disasm/banks/`
