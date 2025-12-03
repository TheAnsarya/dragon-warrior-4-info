# Dragon Warrior IV - Battle System Deep Analysis
# ================================================
# Based on Bank 19 disassembly ($4C010 in ROM)

## Overview

Bank 19 contains the core battle calculation logic with:
- 266 subroutines discovered
- 729 arithmetic operations (ADC/SBC/ASL/LSR/ROL/ROR)
- 16-bit and 24-bit division routines

## Entry Flow (Bank 19 at $8000-$BFFF)

```
Entry at $8038:
  ├── JSR $8088 (read_game_state)
  │   └── Loads $615B → $6E80 (battle mode)
  │   └── Checks for mode 2, sets mode 6 if $6E44 negative
  │
  ├── JSR $80A1 (check_conditions)
  │   └── Tests $72F4,X character state flags
  │   └── Tests bit flags via LSR $93
  │   └── Sets $75E8 action index (0-7)
  │   └── Sets $75DC special flag
  │
  ├── [If conditions met]:
  │   ├── JSR $804A (battle_setup)
  │   │   ├── JSR $8051 (init)
  │   │   └── JSR $845A (battle_calc_wrapper)
  │   │
  │   ├── JSR $9212 (stat_sum_init)
  │   │   ├── Loop 8 times ($81 = 7 down to 0)
  │   │   ├── JSR $8D77 (unknown)
  │   │   ├── JSR $925F × 3 (sum stats from pointer at $88)
  │   │   ├── JSR $83F4 (24-bit division)
  │   │   └── Store result in $75ED-$75EE
  │   │
  │   └── JSR $805B (dispatch_action)
  │       └── Jump table at $8078 (8 entries)
```

## Jump Table at $8078 (Battle Actions)

| Index | Address | Handler | Purpose |
|-------|---------|---------|---------|
| 0 | $8074 | RTS | No action |
| 1 | $AF10 | ? | Action 1 |
| 2 | $AF97 | ? | Action 2 |
| 3 | $AF10 | ? | Same as 1 |
| 4 | $AF48 | ? | Action 4 |
| 5 | $B049 | ? | Action 5 |
| 6 | $B049 | ? | Same as 5 |
| 7 | $B049 | ? | Same as 5 |

Note: Actual table addresses need verification from raw data.

## Division Routines

### 16-bit Division ($83C5)
```asm
; Input:  tmp0,X - tmp1,X = dividend (16-bit)
;         $6E14 - $6E15 = divisor (16-bit)
; Output: tmp0,X - tmp1,X = quotient
;         $6E11 - $6E12 = remainder
; Method: Shift-and-subtract, 16 iterations

loc_83C5:
    ASL tmp0,X       ; Shift dividend left into remainder
    ROL tmp1,X       
    ROL $6E11        
    ROL $6E12        
    INC tmp0,X       ; Assume quotient bit = 1
    LDA $6E11        
    SEC              
    SBC $6E14        ; Try subtract divisor
    PHA              
    LDA $6E12        
    SBC $6E15        
    BCS @keep        ; If no borrow, subtraction valid
    PLA              
    DEC tmp0,X       ; Quotient bit = 0
    JMP @next        
@keep:
    STA $6E12        ; Keep subtraction result
    PLA              
    STA $6E11        
@next:
    DEY              
    BNE loc_83C5     ; Loop 16 times
    RTS
```

### 24-bit Division ($8414)
Same algorithm extended for 24-bit numbers:
- Uses tmp0-tmp2 for dividend
- Uses $6E14-$6E16 for divisor
- Uses $6E11-$6E13 for remainder

## Stat Calculation Routine ($9212)

```asm
sub_9212:
    LDA #$00         ; Initialize accumulators
    STA tmp1         
    STA tmp2         
    LDA #$07         ; Loop 8 times (characters?)
    STA $81          
@loop:
    JSR $8D77        ; Set up character pointer?
    LDY #$00         
    JSR $925F        ; Sum bytes at ($88)+0..5
    LDY #$08         
    JSR $925F        ; Sum bytes at ($88)+8..13
    LDY #$10         
    JSR $925F        ; Sum bytes at ($88)+16..21
    DEC $81          
    BPL @loop        
    
    ; Now divide the sum
    LDA #$B7         
    STA tmp3         ; Divisor high = $B7
    LDX #$00         
    LDY #$03         ; Divisor = $03B700?
    JSR $83F4        ; 24-bit division
    
    ; Store result
    LDA tmp0         
    STA $75ED        
    LDA tmp1         
    STA $75EE        
    RTS
```

## Key Zero Page Variables (Battle Context)

| Addr | Name | Purpose |
|------|------|---------|
| $00-$03 | tmp0-tmp3 | Scratch/arithmetic |
| $04-$05 | ptr0 | General pointer |
| $81 | loop_counter | Character/iteration loop |
| $82 | inner_loop | Sub-loop counter |
| $86-$87 | char_data_ptr | Pointer to character data |
| $88-$89 | stat_data_ptr | Pointer to stat data |
| $8A | char_count | Number of characters |
| $8B | action_result | Action result storage |

## Key RAM Variables (Battle State)

| Addr | Name | Purpose |
|------|------|---------|
| $615B | tactics_setting | AI tactics (0-5) |
| $6E11-$6E13 | div_remainder | Division remainder |
| $6E14-$6E16 | div_divisor | Division divisor |
| $6E44 | battle_flag | Battle mode flag |
| $6E80 | battle_state | Current state/action |
| $72F4-$73xx | char_state | Character state array |
| $75D3 | enemy_index | Current enemy index |
| $75ED-$75EE | stat_sum | Calculated stat sum |

## Scaling Routines

### Multiply by 16 ($8176)
```asm
sub_8176:       ; tmp0,X << 4
    ASL tmp0,X
    ROL tmp1,X
    ASL tmp0,X
    ROL tmp1,X
    ASL tmp0,X
    ROL tmp1,X
    ASL tmp0,X
    ROL tmp1,X
    RTS
```

### Divide by 16 ($8187)
```asm
sub_8187:       ; tmp0,X >> 4
    LSR tmp1,X
    ROR tmp0,X
    LSR tmp1,X
    ROR tmp0,X
    LSR tmp1,X
    ROR tmp0,X
    LSR tmp1,X
    ROR tmp0,X
    RTS
```

## Next Steps

1. Trace the action handlers at $AF10, $AF48, $AF97, $B049
2. Identify damage formula in those handlers
3. Map character data structure at $72F4
4. Document enemy data lookup via $75D3 index
5. Find spell effect tables
