; ============================================================================
; Dragon Warrior IV (NES) - Level-Up and Stat Growth System
; ============================================================================
;
; This file documents the code responsible for calculating stat growth when
; a character levels up. Unlike Dragon Warrior I which uses simple lookup
; tables, DW4 computes stat values at runtime using formulas with per-character
; growth parameters.
;
; KEY INSIGHT: This code handles STAT GROWTH (HP, MP, Str, Agi, etc.) when
; leveling up - NOT experience threshold calculation. The EXP formula is
; computed elsewhere (likely in battle code or party management).
;
; Related Files:
;   - disasm/bank08.asm      - Raw disassembly of Bank 8
;   - disasm/bank31.asm      - Fixed bank with math subroutines
;   - docs/research/experience-computation.md - Research notes
;
; CDL Analysis: Level-up specific CDL file used:
;   GameInfo/~reference-files/Dragon Warrior IV (1992-10)(Enix)(US) - level up.cdl
;
; ============================================================================

; ============================================================================
; ZERO PAGE VARIABLES
; ============================================================================
; These are used throughout the level-up calculation

zp_result_lo    = $00       ; 16-bit calculation result (low byte)
zp_result_hi    = $01       ; 16-bit calculation result (high byte)
zp_growth_ptr_lo = $02      ; Pointer to growth data table (low)
zp_growth_ptr_hi = $03      ; Pointer to growth data table (high)
zp_work         = $04       ; General work variable
zp_level_idx    = $08       ; Level index for table lookup
zp_char_id      = $09       ; Character ID (0=Hero, 1=Ragnar, 2=Alena, etc.)
zp_stat_byte_lo = $0A       ; Stat data byte (low/flags)
zp_stat_byte_hi = $0B       ; Stat data byte (high)
zp_stat_byte_2  = $0C       ; Additional stat data byte
zp_data_ptr_lo  = $0E       ; General data pointer (low)
zp_data_ptr_hi  = $0F       ; General data pointer (high)
zp_temp_16_lo   = $72       ; 16-bit temp for signed math (low)
zp_temp_16_hi   = $73       ; 16-bit temp for signed math (high)
zp_gender_flag  = $76       ; Gender/variant flag (0=male, 1=female?)

; ============================================================================
; CHARACTER IDS
; ============================================================================
CHAR_HERO       = $00
CHAR_RAGNAR     = $01
CHAR_ALENA      = $02
CHAR_CRISTO     = $03
CHAR_BREY       = $04
CHAR_TALOON     = $05
CHAR_NARA       = $06
CHAR_MARA       = $07
CHAR_ORIN       = $08
CHAR_PANON      = $09       ; Or other wagon characters

; ============================================================================
; MATH SUBROUTINES (Bank 31 - Fixed Bank at $C000-$FFFF)
; ============================================================================
; These are called from switchable banks for arithmetic operations

add_16bit       = $C813     ; Add A to 16-bit value at [$00+X:$01+X]
                            ; Input: A = value to add, X = zero page base
                            ; Output: [$00+X:$01+X] += A

add_extended    = $C81D     ; Add A (low) + Y (high) to 16-bit value at [$00+X:$01+X]
                            ; Input: A = low byte, Y = high byte, X = zero page base
                            ; Output: [$00+X:$01+X] += YA

multiply_8x16   = $C827     ; Multiply A * [$00+X:$01+X]
                            ; Input: A = 8-bit multiplier, X = zero page base
                            ; Output: [$00+X:$01+X] = A * original_value

; ============================================================================
; DATA TABLES (Bank 8 at $8000-$BFFF)
; ============================================================================

; Table at $8225-$8228: Pointer for special character handling (e.g., max level chars)
tbl_special_ptr = $8225     ; 2 bytes: pointer for special level handling

; Table at $8227-$8228: Another special pointer
tbl_special_2   = $8227     ; 2 bytes: used at $81E8 for variant chars

; Table at $8229-$8234: Base parameter pointers (indexed by char_id*4 + variant*2)
; Each entry is a 2-byte pointer to base stat data
; Entry 0: Hero male
; Entry 1: Hero female (if applicable)
; etc.
tbl_base_params = $8229     ; 12 bytes (6 entries x 2 bytes)
                            ; $8229: $00 $80  -> $8000 (Hero base)
                            ; $822B: $01 $7F  -> $7F01 (?)
                            ; $822D: $14 $9E  -> $9E14 (?)
                            ; etc.

; Value at $8235-$8236: Global offset or pointer used in calculations
tbl_global_base = $8235     ; 2 bytes: $0D $A8 -> $A80D

; Table at $8237-$823F: Growth data pointers (indexed by char_id)
; Each character has a pointer to their growth rate data
tbl_growth_ptr_lo = $8237   ; Low bytes of pointers
tbl_growth_ptr_hi = $8238   ; High bytes of pointers
                            ; Char 0 (Hero):   $8237=$BB, $8238=$A1 -> $A1BB
                            ; Char 1 (Ragnar): $8238=$A1, $8239=$D0 -> $D0A1 (bank boundary?)
                            ; Char 2 (Alena):  $8239=$D0, $823A=$A1 -> $A1D0
                            ; etc.

; ============================================================================
; GROWTH DATA FORMAT (at addresses pointed to by tbl_growth_ptr)
; ============================================================================
; The growth data consists of signed bytes indicating stat changes per level.
; Format appears to be:
;   Byte 0: HP growth increment (signed)
;   Byte 1: MP growth increment (signed)
;   Byte 2: Other stat increment (signed)
;   ... (3 bytes processed per loop iteration)
;
; Hero growth data at $A1BB:
;   $A1BB: 01 01 01 00 00 00 00 01 00 01 00 FF ...
;   Interpreted: +1, +1, +1, +0, +0, +0, +0, +1, +0, +1, +0, -1 ...
;
; The signed byte is extended to 16-bit and multiplied by 16 before being
; added to the cumulative stat value.

; ============================================================================
; STAT GROWTH CALCULATION ENTRY POINT
; Bank 8 $80D5
; ============================================================================
; Called when a character levels up to calculate new stat values
;
; Input:
;   zp_char_id ($09) = Character ID
;   zp_stat_byte_lo ($0A), zp_stat_byte_hi ($0B), zp_stat_byte_2 ($0C) =
;       3 bytes read from character record
;
; Output:
;   $0100-$0107 = Calculated stat values (4 x 16-bit words)

.org $80D5

stat_growth_entry:
        LDA #$00                ; $80D5: A9 00
        STA zp_gender_flag      ; $80D7: 85 76 - Clear gender/variant flag

        ; Extract level index from stat bytes
        LDA zp_stat_byte_lo     ; $80D9: A5 0A
        AND #$07                ; $80DB: 29 07 - Level bits (0-7)
        STA zp_result_hi        ; $80DD: 85 01
        LDA zp_stat_byte_hi     ; $80DF: A5 0B
        STA zp_result_lo        ; $80E1: 85 00

        ; Check if char_id == 0 (Hero) - special handling
        LDX zp_char_id          ; $80E3: A6 09
        BNE @not_hero           ; $80E5: D0 4B - Branch to $8132 if not Hero

        ; Hero-specific calculation path
        LDX #$00                ; $80E7: A2 00
        LDY zp_result_hi        ; $80E9: A4 01
        LDA zp_result_lo        ; $80EB: A5 00
        ASL zp_result_lo        ; $80ED: 06 00 - Multiply by 2
        ROL zp_result_hi        ; $80EF: 26 01
        JSR add_extended        ; $80F1: 20 1D C8 - Add original to doubled (x3)

        ; Add global base offset
        LDA tbl_global_base     ; $80F4: AD 35 82 - Load $A80D low
        LDY tbl_global_base+1   ; $80F7: AC 36 82 - Load $A80D high
        LDX #$00                ; $80FA: A2 00
        JSR add_extended        ; $80FC: 20 1D C8 - [$00:$01] += $A80D

        ; Load additional parameters from calculated address
        LDY #$02                ; $80FF: A0 02
        LDA (zp_result_lo),Y    ; $8101: B1 00 - Load byte at offset 2
        STA zp_stat_byte_2      ; $8103: 85 0C
        DEY                     ; $8105: 88
        LDA (zp_result_lo),Y    ; $8106: B1 00 - Load byte at offset 1

        ; Extract level index from this byte (high nibble)
        LSR A                   ; $8108: 4A
        LSR A                   ; $8109: 4A
        LSR A                   ; $810A: 4A
        LSR A                   ; $810B: 4A
        STA zp_level_idx        ; $810C: 85 08

        ; Extract gender flag (bit 2)
        LDA (zp_result_lo),Y    ; $810E: B1 00
        AND #$04                ; $8110: 29 04
        LSR A                   ; $8112: 4A
        LSR A                   ; $8113: 4A
        STA zp_gender_flag      ; $8114: 85 76 - 0 or 1

        ; Extract additional bits (low 2 bits)
        LDA (zp_result_lo),Y    ; $8116: B1 00
        AND #$03                ; $8118: 29 03
        TAX                     ; $811A: AA

        DEY                     ; $811B: 88
        LDA (zp_result_lo),Y    ; $811C: B1 00 - Load byte at offset 0
        STA zp_result_lo        ; $811E: 85 00
        STX zp_result_hi        ; $8120: 86 01

        ; Check for special level values
        LDA zp_level_idx        ; $8122: A5 08
        CMP #$0F                ; $8124: C9 0F - Level 15 = max level reached?
        BEQ @handle_max_level   ; $8126: F0 07 - Branch to $812F
        CMP #$0E                ; $8128: C9 0E - Level 14 = special case?
        BNE @normal_growth      ; $812A: D0 1E - Branch to $814A
        JMP special_growth_0e   ; $812C: 4C E8 81

@handle_max_level:
        JMP handle_max_level    ; $812F: 4C C6 81

; ============================================================================
; NON-HERO CHARACTER PATH
; Bank 8 $8132
; ============================================================================
@not_hero:
        LDA zp_stat_byte_lo     ; $8132: A5 0A
        AND #$03                ; $8134: 29 03
        STA zp_result_hi        ; $8136: 85 01
        LDA zp_stat_byte_2      ; $8138: A5 0C
        LSR A                   ; $813A: 4A
        LSR A                   ; $813B: 4A
        CMP #$3F                ; $813C: C9 3F - Check for max level (63?)
        BEQ @handle_max_level   ; $813E: F0 EF
        STA zp_level_idx        ; $8140: 85 08

        ; Extract gender flag
        LDA zp_stat_byte_lo     ; $8142: A5 0A
        AND #$04                ; $8144: 29 04
        LSR A                   ; $8146: 4A
        LSR A                   ; $8147: 4A
        STA zp_gender_flag      ; $8148: 85 76

; ============================================================================
; NORMAL STAT GROWTH CALCULATION
; Bank 8 $814A
; ============================================================================
; This is the main calculation loop that computes stat values
; using the growth parameter tables

@normal_growth:
        ; Multiply level value by 16 (shift left 4 times)
        LDX #$04                ; $814A: A2 04
@shift_loop:
        ASL zp_result_lo        ; $814C: 06 00
        ROL zp_result_hi        ; $814E: 26 01
        DEX                     ; $8150: CA
        BNE @shift_loop         ; $8151: D0 F9

        ; Calculate table index: char_id * 2 + gender_flag, then * 2
        ; This gives us the correct 2-byte entry in tbl_base_params
        LDA zp_char_id          ; $8153: A5 09
        ASL A                   ; $8155: 0A    - char_id * 2
        ORA zp_gender_flag      ; $8156: 05 76 - + gender (0 or 1)
        ASL A                   ; $8158: 0A    - * 2 for word offset
        TAX                     ; $8159: AA

        ; Load base parameter pointer and add to result
        LDA tbl_base_params,X   ; $815A: BD 29 82
        LDY tbl_base_params+1,X ; $815D: BC 2A 82
        LDX #$00                ; $8160: A2 00
        JSR add_extended        ; $8162: 20 1D C8 - [$00:$01] += base_param

        ; Load growth data pointer for this character
        LDX zp_char_id          ; $8165: A6 09
        LDA tbl_growth_ptr_lo,X ; $8167: BD 37 82
        STA zp_growth_ptr_lo    ; $816A: 85 02
        LDA tbl_growth_ptr_hi,X ; $816C: BD 38 82
        STA zp_growth_ptr_hi    ; $816F: 85 03

        ; Calculate offset into growth table: level_idx * 3
        ; (3 bytes of growth data per level)
        LDA zp_level_idx        ; $8171: A5 08
        ASL A                   ; $8173: 0A    - level * 2
        ADC zp_level_idx        ; $8174: 65 08 - + level = level * 3
        LDX #$02                ; $8176: A2 02 - X=2 means use $02:$03 as base
        JSR add_16bit           ; $8178: 20 13 C8 - growth_ptr += level * 3

        ; Store initial result
        LDA zp_result_lo        ; $817B: A5 00
        STA $0100               ; $817D: 8D 00 01
        LDA zp_result_hi        ; $8180: A5 01
        STA $0101               ; $8182: 8D 01 01

        ; Process 3 growth bytes (loop Y from 0 to 2)
        LDY #$00                ; $8185: A0 00

; ============================================================================
; GROWTH DATA PROCESSING LOOP
; Bank 8 $8187
; ============================================================================
; For each of 3 growth bytes, sign-extend and multiply by 16, then accumulate

@growth_loop:
        TYA                     ; $8187: 98
        PHA                     ; $8188: 48    - Save loop counter

        ; Load signed growth byte
        LDA (zp_growth_ptr_lo),Y ; $8189: B1 02
        PHP                     ; $818B: 08    - Save flags (N flag = sign)

        ; Sign extend to 16-bit in $72:$73
        LDY #$00                ; $818C: A0 00
        PLP                     ; $818E: 28    - Restore flags
        BPL @positive           ; $818F: 10 02 - If positive, high byte = 0
        LDY #$FF                ; $8191: A0 FF - If negative, high byte = $FF

@positive:
        STA zp_temp_16_lo       ; $8193: 85 72
        STY zp_temp_16_hi       ; $8195: 84 73

        ; Multiply signed value by 16 (shift left 4 times)
        ASL zp_temp_16_lo       ; $8197: 06 72
        ROL zp_temp_16_hi       ; $8199: 26 73
        ASL zp_temp_16_lo       ; $819B: 06 72
        ROL zp_temp_16_hi       ; $819D: 26 73
        ASL zp_temp_16_lo       ; $819F: 06 72
        ROL zp_temp_16_hi       ; $81A1: 26 73
        ASL zp_temp_16_lo       ; $81A3: 06 72
        ROL zp_temp_16_hi       ; $81A5: 26 73

        ; Add to cumulative result
        LDA zp_temp_16_lo       ; $81A7: A5 72
        LDY zp_temp_16_hi       ; $81A9: A4 73
        LDX #$00                ; $81AB: A2 00
        JSR add_extended        ; $81AD: 20 1D C8 - [$00:$01] += growth * 16

        ; Store result for this stat
        PLA                     ; $81B0: 68
        TAY                     ; $81B1: A8    - Restore loop counter
        ASL A                   ; $81B2: 0A    - * 2 for word index
        TAX                     ; $81B3: AA
        LDA zp_result_lo        ; $81B4: A5 00
        STA $0102,X             ; $81B6: 9D 02 01 - Store result low
        LDA zp_result_hi        ; $81B9: A5 01
        STA $0103,X             ; $81BB: 9D 03 01 - Store result high

        INY                     ; $81BE: C8
        CPY #$03                ; $81BF: C0 03 - Loop 3 times
        BNE @growth_loop        ; $81C1: D0 C4

        JMP continue_levelup    ; $81C3: 4C 81 89 - Continue to next phase

; ============================================================================
; HANDLE MAX LEVEL CHARACTER
; Bank 8 $81C6
; ============================================================================
; When character is at max level, load stats from a fixed table instead

handle_max_level:
        LDA tbl_special_ptr     ; $81C6: AD 25 82
        LDY tbl_special_ptr+1   ; $81C9: AC 26 82

        ; Multiply result by 8 (shift left 3 times)
        ASL zp_result_lo        ; $81CC: 06 00
        ROL zp_result_hi        ; $81CE: 26 01
        ASL zp_result_lo        ; $81D0: 06 00
        ROL zp_result_hi        ; $81D2: 26 01
        ASL zp_result_lo        ; $81D4: 06 00
        ROL zp_result_hi        ; $81D6: 26 01

        LDX #$00                ; $81D8: A2 00
        JSR add_extended        ; $81DA: 20 1D C8

        ; Copy 8 bytes from table to result area
        LDY #$07                ; $81DD: A0 07
@copy_loop:
        LDA (zp_result_lo),Y    ; $81DF: B1 00
        STA $0100,Y             ; $81E1: 99 00 01
        DEY                     ; $81E4: 88
        BPL @copy_loop          ; $81E5: 10 F8
        RTS                     ; $81E7: 60

; ============================================================================
; SPECIAL GROWTH TYPE $0E
; Bank 8 $81E8
; ============================================================================
; Alternative growth calculation for variant characters (level index = $0E)

special_growth_0e:
        LDA #$11                ; $81E8: A9 11
        STA zp_gender_flag      ; $81EA: 85 76 - Set special flag

        LDA tbl_special_2       ; $81EC: AD 27 82
        LDY tbl_special_2+1     ; $81EF: AC 28 82

        ; Multiply result by 2 (shift left once)
        ASL zp_result_lo        ; $81F2: 06 00
        ROL zp_result_hi        ; $81F4: 26 01

        LDX #$00                ; $81F6: A2 00
        JSR add_extended        ; $81F8: 20 1D C8

        ; Load 2-byte value and replicate to all stat slots
        LDY #$01                ; $81FB: A0 01
        LDA (zp_result_lo),Y    ; $81FD: B1 00
        STA $0101               ; $81FF: 8D 01 01
        STA $0103               ; $8202: 8D 03 01
        STA $0105               ; $8205: 8D 05 01
        STA $0107               ; $8208: 8D 07 01

        DEY                     ; $820B: 88
        LDA (zp_result_lo),Y    ; $820C: B1 00
        STA $0100               ; $820E: 8D 00 01

        ; Add 16 to each subsequent stat slot
        LDX #$00                ; $8211: A2 00
@add_loop:
        CLC                     ; $8213: 18
        ADC #$10                ; $8214: 69 10
        STA $0102,X             ; $8216: 9D 02 01
        BCC @no_carry           ; $8219: 90 03
        INC $0103,X             ; $821B: FE 03 01
@no_carry:
        INX                     ; $821E: E8
        INX                     ; $821F: E8
        CPX #$06                ; $8220: E0 06
        BNE @add_loop           ; $8222: D0 EF
        RTS                     ; $8224: 60

; ============================================================================
; DATA SECTION
; Bank 8 $8225-$8241
; ============================================================================
; These bytes are DATA, not code (disassembler misinterpreted them)

.org $8225

; Special pointer for max level handling
data_special_ptr:
        .byte $8D, $A2          ; $8225: -> $A28D (or may need reinterpretation)

; Another special pointer
data_special_2:
        .byte $B7, $AE          ; $8227: -> $AEB7

; Base parameter table (6 entries, 2 bytes each)
; Indexed by: (char_id * 2 + gender) * 2
data_base_params:
        .byte $00, $80          ; $8229: Entry 0 -> $8000
        .byte $01, $7F          ; $822B: Entry 1 -> $7F01
        .byte $14, $9E          ; $822D: Entry 2 -> $9E14
        .byte $00, $00          ; $822F: Entry 3 -> $0000
        .byte $04, $B3          ; $8231: Entry 4 -> $B304
        .byte $97, $80          ; $8233: Entry 5 -> $8097

; Global base value
data_global_base:
        .byte $0D, $A8          ; $8235: -> $A80D

; Growth data pointer table (indexed by char_id)
; Low bytes at $8237, high bytes at $8238+
data_growth_ptr_lo:
        .byte $BB               ; $8237: Hero   -> $A1BB
data_growth_ptr_hi:
        .byte $A1               ; $8238: Hero high
        .byte $D0               ; $8239: Ragnar -> $D0A1 (NOTE: crosses bank?)
        .byte $A1               ; $823A: Alena  -> $A1D0
        .byte $00               ; $823B: Cristo
        .byte $76               ; $823C: Brey
        .byte $A9               ; $823D: Taloon
        .byte $8D               ; $823E: Nara
        .byte $85               ; $823F: Mara
        .byte $04               ; $8240: Orin

; ============================================================================
; MATH SUBROUTINE DEFINITIONS (Bank 31 $C813-$C850)
; ============================================================================
; For reference - these are in the fixed bank

.org $C813

; add_16bit: Add A to 16-bit value at [$00+X:$01+X]
; CLC is implied
add_16bit_impl:
        CLC                     ; $C813: 18
        ADC $00,X               ; $C814: 75 00
        STA $00,X               ; $C816: 95 00
        BCC @no_carry           ; $C818: 90 02
        INC $01,X               ; $C81A: F6 01
@no_carry:
        RTS                     ; $C81C: 60

; add_extended: Add YA to 16-bit value at [$00+X:$01+X]
; A = low byte, Y = high byte
add_extended_impl:
        JSR add_16bit_impl      ; $C81D: 20 13 C8 - Add A to low byte
        TYA                     ; $C820: 98
        CLC                     ; $C821: 18
        ADC $01,X               ; $C822: 75 01
        STA $01,X               ; $C824: 95 01
        RTS                     ; $C826: 60

; multiply_8x16: Multiply A (8-bit) by 16-bit value at [$00+X:$01+X]
; Standard shift-and-add algorithm
multiply_impl:
        STA $16                 ; $C827: 85 16 - Store multiplier
        LDA #$00                ; $C829: A9 00
        STA $17                 ; $C82B: 85 17 - Clear result
        STA $18                 ; $C82D: 85 18

@mult_loop:
        LSR $16                 ; $C82F: 46 16 - Shift multiplier right
        BCC @skip_add           ; $C831: 90 0D - If bit was 0, skip add

        ; Add multiplicand to result
        LDA $00,X               ; $C833: B5 00
        CLC                     ; $C835: 18
        ADC $17                 ; $C836: 65 17
        STA $17                 ; $C838: 85 17
        LDA $01,X               ; $C83A: B5 01
        ADC $18                 ; $C83C: 65 18
        STA $18                 ; $C83E: 85 18

@skip_add:
        ; Shift multiplicand left
        ASL $00,X               ; $C840: 16 00
        ROL $01,X               ; $C842: 36 01

        LDA $16                 ; $C844: A5 16
        BNE @mult_loop          ; $C846: D0 E7 - Loop until multiplier = 0

        ; Store result back
        LDA $17                 ; $C848: A5 17
        STA $00,X               ; $C84A: 95 00
        LDA $18                 ; $C84C: A5 18
        STA $01,X               ; $C84E: 95 01
        RTS                     ; $C850: 60

; ============================================================================
; HERO GROWTH DATA (Bank 8 $A1BB)
; ============================================================================
; Sample of signed growth increments for the Hero character
; Each byte is a signed value (-128 to +127) representing stat change per level
; Values are multiplied by 16 and accumulated

.org $A1BB

hero_growth_data:
        ; These represent stat increments at each level
        ; Format appears to be 3 bytes per level (HP, MP, other)
        .byte $01               ; +1
        .byte $01               ; +1
        .byte $01               ; +1
        .byte $00               ; +0
        .byte $00               ; +0
        .byte $00               ; +0
        .byte $00               ; +0
        .byte $01               ; +1
        .byte $00               ; +0
        .byte $01               ; +1
        .byte $00               ; +0
        .byte $FF               ; -1 (signed)
        ; ... continues for all levels

; ============================================================================
; SUMMARY
; ============================================================================
;
; The stat growth calculation works as follows:
;
; 1. Entry at $80D5 with character ID in $09 and stat bytes in $0A-$0C
;
; 2. For Hero (char_id=0), special handling that uses additional lookup
;
; 3. For other characters:
;    a. Extract level index and gender flag from stat bytes
;    b. Multiply level by 16 (shift left 4)
;    c. Look up base parameter pointer using (char_id*2 + gender)*2 as index
;    d. Add base parameter to level*16
;    e. Get growth data pointer for character
;    f. Add level*3 to growth pointer (3 bytes per level)
;    g. For each of 3 growth bytes:
;       - Sign-extend to 16-bit
;       - Multiply by 16
;       - Add to cumulative result
;    h. Store results in $0100-$0107
;
; 4. Max level characters (level index = $0F) copy stats from fixed table
;
; 5. Variant characters (level index = $0E) use alternate calculation
;
; KEY FORMULA (simplified):
;   stat_base = (level * 16) + base_param[char][gender]
;   For each growth byte in growth_data[char][level*3 + n]:
;       stat[n] = stat_base + (signed_extend(growth_byte) * 16)
;
; ============================================================================
