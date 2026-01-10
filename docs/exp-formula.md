# Dragon Warrior IV EXP Formula Documentation

## Overview

Dragon Warrior IV computes EXP thresholds dynamically using a formula rather than storing them in a lookup table. The computation is performed in Bank 18 at addresses $9fb9-$a037.

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

Located at $a123 in Bank 18 (file offset 0x24133), 5 bytes per character slot.

### Byte Layout

| Byte | Bits 7 | Bits 6-5 | Bits 4-0 / 6-0 |
|------|--------|----------|----------------|
| 0    | High bit 0 | Rate index (>>3) | Threshold 0 (5 bits) |
| 1    | High bit 1 | - | Threshold 1 (7 bits) |
| 2    | High bit 2 | - | Threshold 2 (7 bits) |
| 3    | High bit 3 | - | Threshold 3 (7 bits) |
| 4    | High bit 4 | - | Threshold 4 (7 bits) |

### Initial Value Calculation

The high bits (bit 7) from all 5 bytes are collected using ror (rotate right with carry):
1. For each byte, asl A puts bit 7 into carry
2. ror $7b rotates carry into bit 7 of the result
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

Located at $a259 in Bank 18, 12 bytes:

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

### Main Entry Point ($9fb9)

```asm
$9fb9: jsr $a038    ; Initialize - parse char data
$9fbc: lda #$00
$9fbe: sta $6e3b    ; Threshold index = 0
$9fc1: sta $0e      ; Level counter
$9fc3: inc $0e      ; Level = 1
$9fc5: inc $0e      ; Level = 2
...
$9fcf: lda $7b      ; Load initial value
$9fd1: sta $00      ; Delta = initial
$9fd3: sta $04      ; Total = initial
```

### Main Loop ($9fe9-$a037)

```asm
$9ffa: ldy $6e3b        ; Y = threshold index
$9ffd: lda ($0c),Y      ; Load threshold byte
$9fff: ldx $6e3b
$a002: bne $a006        ; If not first byte...
$a004: and #$1f         ; ...mask to 5 bits
$a006: and #$7f         ; Mask to 7 bits
$a008: cmp $0e          ; Compare with level
$a00a: bcs $a01c        ; If threshold >= level, skip
$a013: inc $6e3a        ; Advance rate index
$a016: inc $6e3b        ; Advance threshold index
$a019: jmp $9ffa        ; Loop to check next threshold

$a01c: ldx $6e3a        ; X = rate index
$a01f: lda $a259,X      ; Load rate from table
$a022: ldx #$04         ; X = 4 (work area)
$a024: jsr $a07d        ; Multiply subroutine
$a027: ldy #$00
$a029: jsr $a0df        ; Add to total
$a02c: lda $0e
$a02e: cmp $0a          ; Check if done
$a030: beq $a037        ; If level == target, return
$a032: inc $0e          ; Level++
$a034: jmp $9fe9        ; Continue loop
$a037: rts
```

### Multiply Subroutine ($a07d)

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
- Bank 18 character data: $a123-$a14a (40 bytes)
- Bank 18 rate table: $a259-$a264 (12 bytes)
