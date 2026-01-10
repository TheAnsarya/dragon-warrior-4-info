# Dragon Warrior IV Experience System Research

## Summary

**Key Finding:** Dragon Warrior IV does **NOT** store experience thresholds as a simple lookup table. Instead, experience values are **computed at runtime** using a formula with per-character growth parameters.

This is a significant difference from Dragon Warrior I, which uses a simple 2-byte lookup table (`LVL_TBL_LAST = $3A`).

## Evidence

### 1. CDL Analysis

Using a Code Data Logger (CDL) file captured during level-up events:
- 6.20% of ROM accessed (32,521 bytes)
- 24,065 bytes of CODE executed
- 8,626 bytes of DATA accessed
- No ascending value sequences found that match known EXP thresholds

### 2. Arithmetic Operations

135 arithmetic opcodes found in Bank 8 during level-up:
- ASL A: 27 occurrences (shift left accumulator)
- LSR A: 24 occurrences (shift right accumulator)
- ASL abs: 22 occurrences (shift left memory)
- ROL zp: 18 occurrences (rotate left through carry)
- ASL zp: 17 occurrences (shift left zero page)
- ADC zp: 6 occurrences (add with carry)
- SBC zp: 5 occurrences (subtract with borrow)

15+ "16-bit shift" patterns identified (ASL followed by ROL).

### 3. Multiplication Subroutines

The level-up code calls subroutines in the fixed bank (Bank F):

**C813 - 16-bit Addition:**
```asm
C813: CLC
C814: ADC $00
C816: STA $00
C818: BCC $C81C
C81A: INC $01
C81C: RTS
```
This adds A to the 16-bit value at [$00:$01].

**C81D - Extended Addition:**
```asm
C81D: JSR $C813   ; 16-bit add
C820: TYA
C821: CLC
C822: ADC $01
C824: STA $01
C826: RTS
```
Adds both A (low) and Y (high) to [$00:$01].

**C827 - Binary Multiplication:**
```asm
C827: STA $16      ; multiplier
C829: LDA #$00
C82B: STA $17
C82D: STA $18
C82F: LSR $16      ; shift multiplier right
C831: BCC $C840    ; skip add if bit was 0
C833: LDA $00
C835: CLC
C836: ADC $17      ; add multiplicand
C838: STA $17
C83A: LDA $01
C83C: ADC $18
C83E: STA $18
C840: ASL $00      ; shift multiplicand left
C842: ROL $01
C844: LDA $16
C846: BNE $C82F    ; loop while multiplier non-zero
C848: LDA $17
C84A: STA $00
C84C: LDA $18
C84E: STA $01
C850: RTS
```
Standard shift-and-add multiplication algorithm.

### 4. Per-Character Parameters

Character-indexed tables found at $8229 and $8237 in Bank 8:
- Accessed via `LDA $8229,X` / `LDY $822A,X`
- X register derived from character ID with multiplier
- Different parameters per character = different growth curves

### 5. Key Algorithm Pattern

At $814A:
```asm
814A: LDX #$04     ; loop counter = 4
814C: ASL $00      ; shift left
814E: ROL $01      ; rotate high byte
8150: DEX          ; decrement counter
8151: BNE $814C    ; loop 4 times
```
This multiplies the 16-bit value at [$00:$01] by 16 (2^4).

## Hypothesis: Formula Structure

Based on the code analysis, the experience formula appears to be:

```
EXP(level) = f(level, base_param, growth_rate)
```

Where:
- `base_param` is character-specific (from table at $8229)
- `growth_rate` is character-specific (from table at $8237)
- The function `f` involves:
  - Multiplication (via subroutine at $C827)
  - 16x scaling (shift left 4 bits)
  - Cumulative addition

This explains why DW4 has 10 unique characters with different leveling curves without requiring 10 separate 150-byte tables (1500 bytes saved).

## ROM Locations

| Address | Bank | Description |
|---------|------|-------------|
| $8128-$81E8 | 8 | Main level-up handler |
| $80BD-$8120 | 8 | Level-up entry/setup |
| $8229-$8238 | 8 | Character growth parameters |
| $8389-$8398 | 8 | Additional lookup table |
| $C813 | F | 16-bit addition subroutine |
| $C81D | F | Extended addition subroutine |
| $C827 | F | Binary multiplication subroutine |

## Implications

1. **No direct EXP table extraction possible** - Values must be computed
2. **Formula must be reverse-engineered** to generate EXP tables for editors
3. **DW4Lib needs update** - Current `ReadExperienceTables()` at Bank 8 $A866 may be incorrect
4. **Each character has unique growth curve** defined by parameters, not separate tables

## Next Steps

1. Fully trace the computation algorithm from level value to EXP threshold
2. Identify the exact mathematical formula
3. Extract per-character growth parameters
4. Implement formula in DW4Lib to generate EXP tables programmatically
5. Verify computed values against known EXP thresholds from game guides

## Related Files

- CDL: `~reference-files/Dragon Warrior IV (1992-10)(Enix)(US) - level up.cdl`
- Testing Guide: `~manual-testing/levelup-testing.md`
- DW4Lib: `DW4Lib/DataStructures/ExperienceTable.cs`
- DW4Rom: `DW4Lib/ROM/DW4Rom.cs` (needs update)

## Research Date

January 10, 2026

## Spell Learning Table (Previously Mis-identified)

The region at $8ABE (file offset 0x20ACE) contains the **spell learning table**, not experience data:
- Pattern: Level numbers [1,2,3...15] followed by spell IDs
- This is when characters learn new spells, separate from EXP

---

*Research conducted using Mesen CDL analysis and 6502 disassembly.*
