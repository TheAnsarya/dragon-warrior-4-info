# Dragon Warrior IV - Battle System Analysis
# =====================================================
# Banks 16-23, 27-30 contain the primary game logic
# This document focuses on battle mechanics

## Bank Categories Summary

| Banks | Category | Subroutines | Purpose |
|-------|----------|-------------|---------|
| 0-4 | Mixed Data | 5-9 | Map/tileset data with some routines |
| 5, 14, 25 | Text | 5-11 | Dialog text strings (DTE compressed) |
| 6-7 | Mixed | 15-19 | Unknown, moderate code |
| 8, 11 | Code | 22-55 | Utility routines |
| 16-23 | **Code** | 131-266 | **Main game logic / Battle system** |
| 24, 27-30 | Code | 80-221 | Additional game logic |
| 31 (Fixed) | Special | 2 | RESET/NMI/IRQ, bank switching |

## Key Code Banks (Battle System Candidates)

### Bank 19 (ROM: $4C010) - HIGHEST SUBROUTINE COUNT
- **266 subroutines detected**
- 729 arithmetic operations (ADC/SBC/ASL/LSR/ROL/ROR)
- 942 branch operations
- Contains division routines at $83C5, $8414

**Key RAM Regions Used:**
- `$75xx` - Party stats/attributes (seen in $75AD-$75C0)
- `$6Exx` - Combat state/calculations
- `$72F4` - Character state array
- `$93` - Bit flags (used with LSR $93)

**Identified Routines:**
| Address | Name | Purpose |
|---------|------|---------|
| $8038 | sub_8038_entry | Entry point - calls $8088, $80A1 |
| $8051 | sub_8051 | Setup routine |
| $805B | sub_805B | Jump table dispatch based on $75E8 |
| $8088 | sub_8088 | Read game state from $615B → $6E80 |
| $80A1 | sub_80A1 | Check conditions via $72F4,X |
| $8176 | sub_8176 | Left shift × 4 (multiply by 16) |
| $8187 | sub_8187 | Right shift × 4 (divide by 16) |
| $8198 | sub_8198 | Scale value based on A register |
| $81A5 | sub_81A5 | 4-bit shift with extended precision |
| $8330 | sub_8330 | Called during stat scaling |
| $83C5 | div_16bit | 16-bit division loop |
| $83F4 | sub_83F4 | Division setup |
| $8414 | div_24bit | 24-bit division loop |
| $845A | sub_845A | Battle calculation wrapper |
| $9212 | sub_9212 | Called in main battle flow |

### Bank 21 (ROM: $54010) - HIGHEST ARITHMETIC OPS
- 131 subroutines
- **945 arithmetic operations** (highest of all banks!)
- 981 branch operations
- Data tables at start of bank (many "unknown opcodes")

**Note:** Bank starts with encoded/compressed data. Actual code begins around $8C00+.

### Bank 17 (ROM: $44010)
- 217 subroutines
- 621 arithmetic operations
- 1182 branch operations (high branching = complex logic)
- Many BRK instructions (may use BRK-based opcodes like fixed bank)

### Bank 22 (ROM: $58010)
- 204 subroutines  
- 653 arithmetic operations
- 1028 branch operations

### Bank 16 (ROM: $40010)
- 186 subroutines
- 573 arithmetic operations
- 1180 branch operations

## Division Routines (Bank 19)

### 16-bit Division ($83C5)
```asm
; Divides 16-bit number by another 16-bit number
; Uses shift-and-subtract method
; Input: tmp0-tmp1 = dividend, $6E14-$6E15 = divisor
; Output: tmp0-tmp1 = quotient, $6E11-$6E12 = remainder

loc_83C5:
    ASL tmp0,X       ; Shift dividend left
    ROL tmp1,X       
    ROL $6E11        ; Shift into remainder
    ROL $6E12        
    INC tmp0,X       ; Assume quotient bit = 1
    LDA $6E11        
    SEC              
    SBC $6E14        ; Try subtraction
    PHA              
    LDA $6E12        
    SBC $6E15        
    BCS loc_83E7     ; If no borrow, keep quotient bit
    PLA              
    DEC tmp0,X       ; Else quotient bit = 0
    JMP loc_83EE     
loc_83E7:            ; Subtraction succeeded
    STA $6E12        
    PLA              
    STA $6E11        
loc_83EE:
    DEY              
    BNE loc_83C5     ; Loop 16 times
    RTS
```

### 24-bit Division ($8414)
- Similar algorithm but handles 24-bit numbers
- Used for larger stat calculations

## RAM Variable Map (Battle-Related)

### Zero Page ($00-$FF)
| Address | Name | Purpose |
|---------|------|---------|
| $00-$03 | tmp0-tmp3 | Scratch registers |
| $04-$07 | ptr0, ptr1 | Pointer pairs |
| $17-$1B | | Arithmetic temporaries |
| $1F | system_flags | Global state |
| $8A | | Loop counter |
| $93 | bit_flags | Tested with LSR |
| $94-$95 | | Extended temp |
| $96 | char_index | Character slot index |

### Work RAM ($6000-$7FFF)
| Range | Purpose |
|-------|---------|
| $6150-$61FF | Game state flags |
| $6E00-$6E20 | Battle calculation workspace |
| $6E14-$6E16 | Division divisor |
| $6E11-$6E13 | Division remainder |
| $6E44 | Combat flag |
| $6E80 | Current action/mode |
| $72F4+ | Character state array (indexed by X) |
| $7591-$75C0 | Party stat buffer |
| $75D4-$75E8 | Battle mode/state variables |
| $75DC | Special flag (set to $FF based on $73) |

## Entry Points

### Main Battle Entry (Bank 19)
From fixed bank, battle is likely entered by:
1. Bank switch to Bank 19 via $FF91
2. Jump to $8038 (or $8000 if entry at start)
3. $8038 calls $8088 (read state), $80A1 (check conditions)
4. Battle loop processes commands

### State Machine
- $6E80: Current battle state
- $75E8: Action index (0-7 valid, checked at $80E4)
- Jump table at $8078: Dispatches to action handlers

## Next Steps

1. Trace bank switching calls in fixed bank to find battle entry
2. Analyze $75xx stat structure (likely matches game's stat screen)
3. Map character data structure at $72F4
4. Find damage formula: likely involves division routines
5. Identify spell effect tables

## Files Generated

- `disasm/banks/bank_19.asm` - Full disassembly
- `disasm/banks/bank_21.asm` - Full disassembly  
- `disasm/banks/bank_17.asm` - Full disassembly
