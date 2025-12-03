# Dragon Warrior IV - Bank Purpose Documentation
# ================================================

## Bank Layout Overview

| Bank | ROM Offset | Purpose | Code Density |
|------|------------|---------|--------------|
| 0-4  | $00010-$14010 | Mixed data/code | Low-Medium |
| 5    | $14010-$18010 | Text/Dialog | Low |
| 6-8  | $18010-$24010 | Mixed | Medium |
| 9    | $24010-$28010 | Map tile data | Low |
| 10-13| $28010-$38010 | Mixed data/code | Low |
| 14   | $38010-$3C010 | Text/Dialog | Low |
| 15   | $3C010-$40010 | Mixed | Low |
| 16-24| $40010-$64010 | **Battle/Game Logic** | **High** |
| 25   | $64010-$68010 | Text/Dialog | Low |
| 26   | $68010-$6C010 | Mixed data | Low |
| 27   | $6C010-$70010 | Map/Location routines | Medium |
| 28   | $70010-$74010 | Tile/Map data access | Medium |
| 29   | $74010-$78010 | Formation/Party data | Medium |
| 30   | $78010-$7C010 | Event/Scene handling | High |
| 31   | $7C010-$80010 | (Last switchable) | Low |

## Direct Bank Loads from Fixed Bank

From analysis of fixed bank ($C000-$FFFF):

### Bank 28 ($1C) - Tile Data
- **Called at:** $DAAD
- **Purpose:** Read map/tile data starting at $8014-$8017
- **Context:** Map rendering, movement validation
- **Entry:** `sub_DAC6` reads tile pointers

### Bank 27 ($1B) - Map Pointers
- **Called at:** $DFC5
- **Purpose:** Read map pointer table at $8000
- **Context:** Bank sequencing for large map data
- **Entry:** Reads ($8000),X as pointer

### Bank 29 ($1D) - Formation Data
- **Called at:** $E60F
- **Purpose:** Battle formation and party positioning
- **Context:** Pre-battle setup, enemy group generation
- **Entry:** Multiple entry points at $E617, $E62B, $E641, $E657

### Bank 11 ($0B) - Unknown
- **Called at:** TBD
- **Purpose:** Unknown (22 subroutines, medium arithmetic)
- **Context:** TBD

### Bank 26 ($1A) - Unknown
- **Called at:** $DFDE (continuation bank)
- **Purpose:** Used after bank 5 runs out ($05 text bank)
- **Context:** Extended text or data beyond bank 5

## Battle System Banks (16-24)

### Bank 19 - Battle Core (Highest Score: 3198)
- **Subroutines:** 266
- **Key Functions:**
  - `$8038`: Battle entry point
  - `$8176/$8187`: 16-bit multiply/divide by 16
  - `$83C5/$8414`: Division routines
  - `$9135`: Hit/miss calculation
  - `$9212`: Party stat summation
  - `$AA67`: Damage calculation
  - `$AF10-$B049`: Action handlers

### Bank 21 - Battle Support (Score: 3264)
- **Subroutines:** 131
- **Characteristics:** Lots of BRK opcodes (565), high ASL count
- **Likely Purpose:** Scripted battle sequences, AI routines

### Bank 17 - Battle Display (Score: 3075)
- **Subroutines:** 217
- **Characteristics:** Highest BRK count (1362)
- **Likely Purpose:** Battle animation, message display

## Dynamic Bank Loading

Variables for bank selection:

| Address | Name | Description |
|---------|------|-------------|
| $0507 | current_bank | Currently loaded PRG bank |
| $0067 | map_bank | Bank number for current map |
| $0058 | saved_bank | Bank saved during calls |
| $07CC | call_save | Bank call return save |
| $0051 | temp_bank | Temporary bank storage |

## Data Tables (Non-Code Banks)

### Bank 5 - Text Bank
- Contains dialog text with DTE encoding
- Spans multiple text streams

### Bank 9 - Map Data
- Map tile definitions
- Map headers with dimensions

### Bank 25 - Additional Text
- More dialog/text data
- Possibly different character sets

## Analysis Methods Used

1. **Code Density Analysis**
   - Count JSR/RTS pairs
   - Count arithmetic opcodes (ADC/SBC/ASL/LSR/ROL/ROR)
   - Count branch opcodes
   - Score = subroutines × 3 + arithmetic + branches

2. **Cross-Reference Analysis**
   - Trace bank switch calls from fixed bank
   - Identify direct bank load patterns (`LDA #$XX; JSR bank_switch`)

3. **Pattern Recognition**
   - BRK-heavy banks = scripted sequences
   - High JSR $C000+ = heavy fixed bank interaction
   - Data tables vs code start detection
