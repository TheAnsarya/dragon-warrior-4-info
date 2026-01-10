# Dragon Warrior IV EXP Formula Documentation

## Overview

Dragon Warrior IV computes EXP thresholds dynamically using a formula rather than storing them in a lookup table. The computation is performed in Bank 18 at addresses $9FB9-$A037.

## Formula Summary

```
Level 2 EXP = initial_value

For each level N from 3 to target:
    if level > threshold[i]: advance rate index
    delta = (previous_delta * rate) >> 4
    total += delta
```

Where:
- `initial_value` is extracted from character data (5-31 range)
- `rate` comes from a growth rate table (values: 16-32)
- `>> 4` means divide by 16 (4-bit right shift)

## Character Data Structure

Located at $A123 in Bank 18 (file offset 0x24133), 5 bytes per character slot.

### Byte Layout

| Byte | Bits 7 | Bits 6-5 | Bits 4-0 / 6-0 |
|------|--------|----------|----------------|
| 0    | High bit 0 | Rate index (>>3) | Threshold 0 (5 bits) |
| 1    | High bit 1 | - | Threshold 1 (7 bits) |
| 2    | High bit 2 | - | Threshold 2 (7 bits) |
| 3    | High bit 3 | - | Threshold 3 (7 bits) |
| 4    | High bit 4 | - | Threshold 4 (7 bits) |

### Initial Value Calculation

The high bits (bit 7) from all 5 bytes are collected using ROR (rotate right with carry):
1. For each byte, ASL A puts bit 7 into carry
2. ROR $7B rotates carry into bit 7 of the result
3. After 5 iterations, 3 LSRs shift the result right

This produces a value from 0-31.

### Character Data Table

| Slot | Character | Hex Data | Initial | Rate Idx | Thresholds |
|------|-----------|----------|---------|----------|------------|
| 0 | Hero | 85 8b 0f 2b e3 | 19 | 0 | [5, 11, 15, 43, 99] |
| 1 | Ragnar | 24 8c 11 2c e3 | 18 | 4 | [4, 12, 17, 44, 99] |
| 2 | Alena | 04 0c 92 2b e3 | 20 | 0 | [4, 12, 18, 43, 99] |
| 3 | Cristo | 84 8c 91 ad 63 | 15 | 0 | [4, 12, 17, 45, 99] |
| 4 | Brey | a4 8c 11 2d e3 | 19 | 4 | [4, 12, 17, 45, 99] |
| 5 | Taloon | 04 8c 13 ac 63 | 10 | 0 | [4, 12, 19, 44, 99] |
| 6 | Nara | 04 0c 94 aa 63 | 12 | 0 | [4, 12, 20, 42, 99] |
| 7 | Mara | 24 0c 11 2c e3 | 16 | 4 | [4, 12, 17, 44, 99] |

## Growth Rate Table

Located at $A259 in Bank 18, 12 bytes:

```
Index:  0   1   2   3   4   5   6   7   8   9  10  11
Hex:   20  18  14  12  10  10  1e  18  14  12  10  10
Dec:   32  24  20  18  16  16  30  24  20  18  16  16
Mult: 2.0 1.5 1.25 1.125 1.0 1.0 1.875 1.5 1.25 1.125 1.0 1.0
```

The multiplier is `rate / 16`:
- Rate 32 → multiply delta by 2.0
- Rate 24 → multiply delta by 1.5
- Rate 20 → multiply delta by 1.25
- Rate 18 → multiply delta by 1.125
- Rate 16 → multiply delta by 1.0 (no change)

## Algorithm Pseudocode

```python
def compute_exp(character_data, target_level):
    initial = decode_initial_value(character_data)
    rate_idx = decode_rate_index(character_data)
    thresholds = decode_thresholds(character_data)
    
    if target_level <= 1:
        return 0
    if target_level == 2:
        return initial
    
    delta = initial
    total = initial
    thresh_idx = 0
    
    for level in range(3, target_level + 1):
        # Advance rate when level exceeds threshold
        while thresh_idx < 5 and level > thresholds[thresh_idx]:
            rate_idx += 1
            thresh_idx += 1
        
        # Apply growth formula
        rate = GROWTH_RATES[min(rate_idx, 11)]
        delta = (delta * rate) >> 4
        total += delta
    
    return total
```

## Assembly Code Reference

### Main Entry Point ($9FB9)

```asm
$9FB9: JSR $A038    ; Initialize - parse char data
$9FBC: LDA #$00
$9FBE: STA $6E3B    ; Threshold index = 0
$9FC1: STA $0E      ; Level counter
$9FC3: INC $0E      ; Level = 1
$9FC5: INC $0E      ; Level = 2
...
$9FCF: LDA $7B      ; Load initial value
$9FD1: STA $00      ; Delta = initial
$9FD3: STA $04      ; Total = initial
```

### Main Loop ($9FE9-$A037)

```asm
$9FFA: LDY $6E3B        ; Y = threshold index
$9FFD: LDA ($0C),Y      ; Load threshold byte
$9FFF: LDX $6E3B
$A002: BNE $A006        ; If not first byte...
$A004: AND #$1F         ; ...mask to 5 bits
$A006: AND #$7F         ; Mask to 7 bits
$A008: CMP $0E          ; Compare with level
$A00A: BCS $A01C        ; If threshold >= level, skip
$A013: INC $6E3A        ; Advance rate index
$A016: INC $6E3B        ; Advance threshold index
$A019: JMP $9FFA        ; Loop to check next threshold

$A01C: LDX $6E3A        ; X = rate index
$A01F: LDA $A259,X      ; Load rate from table
$A022: LDX #$04         ; X = 4 (work area)
$A024: JSR $A07D        ; Multiply subroutine
$A027: LDY #$00
$A029: JSR $A0DF        ; Add to total
$A02C: LDA $0E
$A02E: CMP $0A          ; Check if done
$A030: BEQ $A037        ; If level == target, return
$A032: INC $0E          ; Level++
$A034: JMP $9FE9        ; Continue loop
$A037: RTS
```

### Multiply Subroutine ($A07D)

Performs: `result = (value * rate) >> 4`

Uses shift-and-add multiplication followed by 4-bit right shift.

## Verified Values

| Character | L2 | L3 | L4 | L5 | L10 |
|-----------|-----|-----|------|------|-------|
| Alena | 20 | 60 | 140 | 260 | 2,632 |
| Taloon | 10 | 30 | 70 | 130 | 1,314 |
| Hero | 19 | 57 | 133 | 285 | 3,290 |

## Notes

- Some online sources (e.g., woodus.com) have incorrect intermediate values (L6-L9)
- Our formula matches L2-L5 and L10 exactly for all characters tested
- The discrepancy in online data may be from a different ROM version or manual transcription errors

## Files

- `tools/compute_exp.py` - EXP calculator tool
- `tools/exact_emulate.py` - Step-by-step emulation
- Bank 18 character data: $A123-$A14A (40 bytes)
- Bank 18 rate table: $A259-$A264 (12 bytes)
