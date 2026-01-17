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
zp_stat_byte_lo = $0a       ; Stat data byte (low/flags)
zp_stat_byte_hi = $0b       ; Stat data byte (high)
zp_stat_byte_2  = $0c       ; Additional stat data byte
zp_data_ptr_lo  = $0e       ; General data pointer (low)
zp_data_ptr_hi  = $0f       ; General data pointer (high)
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
; MATH SUBROUTINES (Bank 31 - Fixed Bank at $c000-$ffff)
; ============================================================================
; These are called from switchable banks for arithmetic operations

add_16bit       = $c813     ; Add A to 16-bit value at [$00+X:$01+X]
                            ; Input: A = value to add, X = zero page base
                            ; Output: [$00+X:$01+X] += A

add_extended    = $c81d     ; Add A (low) + Y (high) to 16-bit value at [$00+X:$01+X]
                            ; Input: A = low byte, Y = high byte, X = zero page base
                            ; Output: [$00+X:$01+X] += YA

multiply_8x16   = $c827     ; Multiply A * [$00+X:$01+X]
                            ; Input: A = 8-bit multiplier, X = zero page base
                            ; Output: [$00+X:$01+X] = A * original_value

; ============================================================================
; DATA TABLES (Bank 8 at $8000-$bfff)
; ============================================================================

; Table at $8225-$8228: Pointer for special character handling (e.g., max level chars)
tbl_special_ptr = $8225     ; 2 bytes: pointer for special level handling

; Table at $8227-$8228: Another special pointer
tbl_special_2   = $8227     ; 2 bytes: used at $81e8 for variant chars

; Table at $8229-$8234: Base parameter pointers (indexed by char_id*4 + variant*2)
; Each entry is a 2-byte pointer to base stat data
; Entry 0: Hero male
; Entry 1: Hero female (if applicable)
; etc.
tbl_base_params = $8229     ; 12 bytes (6 entries x 2 bytes)
                            ; $8229: $00 $80  -> $8000 (Hero base)
                            ; $822b: $01 $7f  -> $7f01 (?)
                            ; $822d: $14 $9e  -> $9e14 (?)
                            ; etc.

; Value at $8235-$8236: Global offset or pointer used in calculations
tbl_global_base = $8235     ; 2 bytes: $0d $a8 -> $a80d

; Table at $8237-$823f: Growth data pointers (indexed by char_id)
; Each character has a pointer to their growth rate data
tbl_growth_ptr_lo = $8237   ; Low bytes of pointers
tbl_growth_ptr_hi = $8238   ; High bytes of pointers
                            ; Char 0 (Hero):   $8237=$bb, $8238=$a1 -> $a1bb
                            ; Char 1 (Ragnar): $8238=$a1, $8239=$d0 -> $d0a1 (bank boundary?)
                            ; Char 2 (Alena):  $8239=$d0, $823a=$a1 -> $a1d0
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
; Hero growth data at $a1bb:
;   $a1bb: 01 01 01 00 00 00 00 01 00 01 00 FF ...
;   Interpreted: +1, +1, +1, +0, +0, +0, +0, +1, +0, +1, +0, -1 ...
;
; The signed byte is extended to 16-bit and multiplied by 16 before being
; added to the cumulative stat value.

; ============================================================================
; STAT GROWTH CALCULATION ENTRY POINT
; Bank 8 $80d5
; ============================================================================
; Called when a character levels up to calculate new stat values
;
; Input:
;   zp_char_id ($09) = Character ID
;   zp_stat_byte_lo ($0a), zp_stat_byte_hi ($0b), zp_stat_byte_2 ($0c) =
;       3 bytes read from character record
;
; Output:
;   $0100-$0107 = Calculated stat values (4 x 16-bit words)

.org $80d5

stat_growth_entry:
        lda #$00                ; $80d5: A9 00
        sta zp_gender_flag      ; $80d7: 85 76 - Clear gender/variant flag

        ; Extract level index from stat bytes
        lda zp_stat_byte_lo     ; $80d9: A5 0A
        and #$07                ; $80db: 29 07 - Level bits (0-7)
        sta zp_result_hi        ; $80dd: 85 01
        lda zp_stat_byte_hi     ; $80df: A5 0B
        sta zp_result_lo        ; $80e1: 85 00

        ; Check if char_id == 0 (Hero) - special handling
        ldx zp_char_id          ; $80e3: A6 09
        bne @not_hero           ; $80e5: D0 4B - Branch to $8132 if not Hero

        ; Hero-specific calculation path
        ldx #$00                ; $80e7: A2 00
        ldy zp_result_hi        ; $80e9: A4 01
        lda zp_result_lo        ; $80eb: A5 00
        asl zp_result_lo        ; $80ed: 06 00 - Multiply by 2
        rol zp_result_hi        ; $80ef: 26 01
        jsr add_extended        ; $80f1: 20 1D C8 - Add original to doubled (x3)

        ; Add global base offset
        lda tbl_global_base     ; $80f4: AD 35 82 - Load $a80d low
        ldy tbl_global_base+1   ; $80f7: AC 36 82 - Load $a80d high
        ldx #$00                ; $80fa: A2 00
        jsr add_extended        ; $80fc: 20 1D C8 - [$00:$01] += $a80d

        ; Load additional parameters from calculated address
        ldy #$02                ; $80ff: A0 02
        lda (zp_result_lo),Y    ; $8101: B1 00 - Load byte at offset 2
        sta zp_stat_byte_2      ; $8103: 85 0C
        dey                     ; $8105: 88
        lda (zp_result_lo),Y    ; $8106: B1 00 - Load byte at offset 1

        ; Extract level index from this byte (high nibble)
        lsr A                   ; $8108: 4A
        lsr A                   ; $8109: 4A
        lsr A                   ; $810a: 4A
        lsr A                   ; $810b: 4A
        sta zp_level_idx        ; $810c: 85 08

        ; Extract gender flag (bit 2)
        lda (zp_result_lo),Y    ; $810e: B1 00
        and #$04                ; $8110: 29 04
        lsr A                   ; $8112: 4A
        lsr A                   ; $8113: 4A
        sta zp_gender_flag      ; $8114: 85 76 - 0 or 1

        ; Extract additional bits (low 2 bits)
        lda (zp_result_lo),Y    ; $8116: B1 00
        and #$03                ; $8118: 29 03
        tax                     ; $811a: AA

        dey                     ; $811b: 88
        lda (zp_result_lo),Y    ; $811c: B1 00 - Load byte at offset 0
        sta zp_result_lo        ; $811e: 85 00
        STX zp_result_hi        ; $8120: 86 01

        ; Check for special level values
        lda zp_level_idx        ; $8122: A5 08
        cmp #$0f                ; $8124: C9 0F - Level 15 = max level reached?
        beq @handle_max_level   ; $8126: F0 07 - Branch to $812f
        cmp #$0e                ; $8128: C9 0E - Level 14 = special case?
        bne @normal_growth      ; $812a: D0 1E - Branch to $814a
        jmp special_growth_0e   ; $812c: 4C E8 81

@handle_max_level:
        jmp handle_max_level    ; $812f: 4C C6 81

; ============================================================================
; NON-HERO CHARACTER PATH
; Bank 8 $8132
; ============================================================================
@not_hero:
        lda zp_stat_byte_lo     ; $8132: A5 0A
        and #$03                ; $8134: 29 03
        sta zp_result_hi        ; $8136: 85 01
        lda zp_stat_byte_2      ; $8138: A5 0C
        lsr A                   ; $813a: 4A
        lsr A                   ; $813b: 4A
        cmp #$3f                ; $813c: C9 3F - Check for max level (63?)
        beq @handle_max_level   ; $813e: F0 EF
        sta zp_level_idx        ; $8140: 85 08

        ; Extract gender flag
        lda zp_stat_byte_lo     ; $8142: A5 0A
        and #$04                ; $8144: 29 04
        lsr A                   ; $8146: 4A
        lsr A                   ; $8147: 4A
        sta zp_gender_flag      ; $8148: 85 76

; ============================================================================
; NORMAL STAT GROWTH CALCULATION
; Bank 8 $814a
; ============================================================================
; This is the main calculation loop that computes stat values
; using the growth parameter tables

@normal_growth:
        ; Multiply level value by 16 (shift left 4 times)
        ldx #$04                ; $814a: A2 04
@shift_loop:
        asl zp_result_lo        ; $814c: 06 00
        rol zp_result_hi        ; $814e: 26 01
        dex                     ; $8150: CA
        bne @shift_loop         ; $8151: D0 F9

        ; Calculate table index: char_id * 2 + gender_flag, then * 2
        ; This gives us the correct 2-byte entry in tbl_base_params
        lda zp_char_id          ; $8153: A5 09
        asl A                   ; $8155: 0A    - char_id * 2
        ora zp_gender_flag      ; $8156: 05 76 - + gender (0 or 1)
        asl A                   ; $8158: 0A    - * 2 for word offset
        tax                     ; $8159: AA

        ; Load base parameter pointer and add to result
        lda tbl_base_params,X   ; $815a: BD 29 82
        ldy tbl_base_params+1,X ; $815d: BC 2A 82
        ldx #$00                ; $8160: A2 00
        jsr add_extended        ; $8162: 20 1D C8 - [$00:$01] += base_param

        ; Load growth data pointer for this character
        ldx zp_char_id          ; $8165: A6 09
        lda tbl_growth_ptr_lo,X ; $8167: BD 37 82
        sta zp_growth_ptr_lo    ; $816a: 85 02
        lda tbl_growth_ptr_hi,X ; $816c: BD 38 82
        sta zp_growth_ptr_hi    ; $816f: 85 03

        ; Calculate offset into growth table: level_idx * 3
        ; (3 bytes of growth data per level)
        lda zp_level_idx        ; $8171: A5 08
        asl A                   ; $8173: 0A    - level * 2
        adc zp_level_idx        ; $8174: 65 08 - + level = level * 3
        ldx #$02                ; $8176: A2 02 - X=2 means use $02:$03 as base
        jsr add_16bit           ; $8178: 20 13 C8 - growth_ptr += level * 3

        ; Store initial result
        lda zp_result_lo        ; $817b: A5 00
        sta $0100               ; $817d: 8D 00 01
        lda zp_result_hi        ; $8180: A5 01
        sta $0101               ; $8182: 8D 01 01

        ; Process 3 growth bytes (loop Y from 0 to 2)
        ldy #$00                ; $8185: A0 00

; ============================================================================
; GROWTH DATA PROCESSING LOOP
; Bank 8 $8187
; ============================================================================
; For each of 3 growth bytes, sign-extend and multiply by 16, then accumulate

@growth_loop:
        tya                     ; $8187: 98
        pha                     ; $8188: 48    - Save loop counter

        ; Load signed growth byte
        lda (zp_growth_ptr_lo),Y ; $8189: B1 02
        php                     ; $818b: 08    - Save flags (N flag = sign)

        ; Sign extend to 16-bit in $72:$73
        ldy #$00                ; $818c: A0 00
        plp                     ; $818e: 28    - Restore flags
        bpl @positive           ; $818f: 10 02 - If positive, high byte = 0
        ldy #$ff                ; $8191: A0 FF - If negative, high byte = $ff

@positive:
        sta zp_temp_16_lo       ; $8193: 85 72
        STY zp_temp_16_hi       ; $8195: 84 73

        ; Multiply signed value by 16 (shift left 4 times)
        asl zp_temp_16_lo       ; $8197: 06 72
        rol zp_temp_16_hi       ; $8199: 26 73
        asl zp_temp_16_lo       ; $819b: 06 72
        rol zp_temp_16_hi       ; $819d: 26 73
        asl zp_temp_16_lo       ; $819f: 06 72
        rol zp_temp_16_hi       ; $81a1: 26 73
        asl zp_temp_16_lo       ; $81a3: 06 72
        rol zp_temp_16_hi       ; $81a5: 26 73

        ; Add to cumulative result
        lda zp_temp_16_lo       ; $81a7: A5 72
        ldy zp_temp_16_hi       ; $81a9: A4 73
        ldx #$00                ; $81ab: A2 00
        jsr add_extended        ; $81ad: 20 1D C8 - [$00:$01] += growth * 16

        ; Store result for this stat
        pla                     ; $81b0: 68
        tay                     ; $81b1: A8    - Restore loop counter
        asl A                   ; $81b2: 0A    - * 2 for word index
        tax                     ; $81b3: AA
        lda zp_result_lo        ; $81b4: A5 00
        sta $0102,X             ; $81b6: 9D 02 01 - Store result low
        lda zp_result_hi        ; $81b9: A5 01
        sta $0103,X             ; $81bb: 9D 03 01 - Store result high

        iny                     ; $81be: C8
        cpy #$03                ; $81bf: C0 03 - Loop 3 times
        bne @growth_loop        ; $81c1: D0 C4

        jmp continue_levelup    ; $81c3: 4C 81 89 - Continue to next phase

; ============================================================================
; HANDLE MAX LEVEL CHARACTER
; Bank 8 $81c6
; ============================================================================
; When character is at max level, load stats from a fixed table instead

handle_max_level:
        lda tbl_special_ptr     ; $81c6: AD 25 82
        ldy tbl_special_ptr+1   ; $81c9: AC 26 82

        ; Multiply result by 8 (shift left 3 times)
        asl zp_result_lo        ; $81cc: 06 00
        rol zp_result_hi        ; $81ce: 26 01
        asl zp_result_lo        ; $81d0: 06 00
        rol zp_result_hi        ; $81d2: 26 01
        asl zp_result_lo        ; $81d4: 06 00
        rol zp_result_hi        ; $81d6: 26 01

        ldx #$00                ; $81d8: A2 00
        jsr add_extended        ; $81da: 20 1D C8

        ; Copy 8 bytes from table to result area
        ldy #$07                ; $81dd: A0 07
@copy_loop:
        lda (zp_result_lo),Y    ; $81df: B1 00
        sta $0100,Y             ; $81e1: 99 00 01
        dey                     ; $81e4: 88
        bpl @copy_loop          ; $81e5: 10 F8
        rts                     ; $81e7: 60

; ============================================================================
; SPECIAL GROWTH TYPE $0e
; Bank 8 $81e8
; ============================================================================
; Alternative growth calculation for variant characters (level index = $0e)

special_growth_0e:
        lda #$11                ; $81e8: A9 11
        sta zp_gender_flag      ; $81ea: 85 76 - Set special flag

        lda tbl_special_2       ; $81ec: AD 27 82
        ldy tbl_special_2+1     ; $81ef: AC 28 82

        ; Multiply result by 2 (shift left once)
        asl zp_result_lo        ; $81f2: 06 00
        rol zp_result_hi        ; $81f4: 26 01

        ldx #$00                ; $81f6: A2 00
        jsr add_extended        ; $81f8: 20 1D C8

        ; Load 2-byte value and replicate to all stat slots
        ldy #$01                ; $81fb: A0 01
        lda (zp_result_lo),Y    ; $81fd: B1 00
        sta $0101               ; $81ff: 8D 01 01
        sta $0103               ; $8202: 8D 03 01
        sta $0105               ; $8205: 8D 05 01
        sta $0107               ; $8208: 8D 07 01

        dey                     ; $820b: 88
        lda (zp_result_lo),Y    ; $820c: B1 00
        sta $0100               ; $820e: 8D 00 01

        ; Add 16 to each subsequent stat slot
        ldx #$00                ; $8211: A2 00
@add_loop:
        clc                     ; $8213: 18
        adc #$10                ; $8214: 69 10
        sta $0102,X             ; $8216: 9D 02 01
        bcc @no_carry           ; $8219: 90 03
        inc $0103,X             ; $821b: FE 03 01
@no_carry:
        inx                     ; $821e: E8
        inx                     ; $821f: E8
        cpx #$06                ; $8220: E0 06
        bne @add_loop           ; $8222: D0 EF
        rts                     ; $8224: 60

; ============================================================================
; DATA SECTION
; Bank 8 $8225-$8241
; ============================================================================
; These bytes are DATA, not code (disassembler misinterpreted them)

.org $8225

; Special pointer for max level handling
data_special_ptr:
        .db $8d, $a2          ; $8225: -> $a28d (or may need reinterpretation)

; Another special pointer
data_special_2:
        .db $b7, $ae          ; $8227: -> $aeb7

; Base parameter table (6 entries, 2 bytes each)
; Indexed by: (char_id * 2 + gender) * 2
data_base_params:
        .db $00, $80          ; $8229: Entry 0 -> $8000
        .db $01, $7f          ; $822b: Entry 1 -> $7f01
        .db $14, $9e          ; $822d: Entry 2 -> $9e14
        .db $00, $00          ; $822f: Entry 3 -> $0000
        .db $04, $b3          ; $8231: Entry 4 -> $b304
        .db $97, $80          ; $8233: Entry 5 -> $8097

; Global base value
data_global_base:
        .db $0d, $a8          ; $8235: -> $a80d

; Growth data pointer table (indexed by char_id)
; Low bytes at $8237, high bytes at $8238+
data_growth_ptr_lo:
        .db $bb               ; $8237: Hero   -> $a1bb
data_growth_ptr_hi:
        .db $a1               ; $8238: Hero high
        .db $d0               ; $8239: Ragnar -> $d0a1 (NOTE: crosses bank?)
        .db $a1               ; $823a: Alena  -> $a1d0
        .db $00               ; $823b: Cristo
        .db $76               ; $823c: Brey
        .db $a9               ; $823d: Taloon
        .db $8d               ; $823e: Nara
        .db $85               ; $823f: Mara
        .db $04               ; $8240: Orin

; ============================================================================
; MATH SUBROUTINE DEFINITIONS (Bank 31 $c813-$c850)
; ============================================================================
; For reference - these are in the fixed bank

.org $c813

; add_16bit: Add A to 16-bit value at [$00+X:$01+X]
; clc is implied
add_16bit_impl:
        clc                     ; $c813: 18
        adc $00,X               ; $c814: 75 00
        sta $00,X               ; $c816: 95 00
        bcc @no_carry           ; $c818: 90 02
        inc $01,X               ; $c81a: F6 01
@no_carry:
        rts                     ; $c81c: 60

; add_extended: Add YA to 16-bit value at [$00+X:$01+X]
; A = low byte, Y = high byte
add_extended_impl:
        jsr add_16bit_impl      ; $c81d: 20 13 C8 - Add A to low byte
        tya                     ; $c820: 98
        clc                     ; $c821: 18
        adc $01,X               ; $c822: 75 01
        sta $01,X               ; $c824: 95 01
        rts                     ; $c826: 60

; multiply_8x16: Multiply A (8-bit) by 16-bit value at [$00+X:$01+X]
; Standard shift-and-add algorithm
multiply_impl:
        sta $16                 ; $c827: 85 16 - Store multiplier
        lda #$00                ; $c829: A9 00
        sta $17                 ; $c82b: 85 17 - Clear result
        sta $18                 ; $c82d: 85 18

@mult_loop:
        lsr $16                 ; $c82f: 46 16 - Shift multiplier right
        bcc @skip_add           ; $c831: 90 0D - If bit was 0, skip add

        ; Add multiplicand to result
        lda $00,X               ; $c833: B5 00
        clc                     ; $c835: 18
        adc $17                 ; $c836: 65 17
        sta $17                 ; $c838: 85 17
        lda $01,X               ; $c83a: B5 01
        adc $18                 ; $c83c: 65 18
        sta $18                 ; $c83e: 85 18

@skip_add:
        ; Shift multiplicand left
        asl $00,X               ; $c840: 16 00
        rol $01,X               ; $c842: 36 01

        lda $16                 ; $c844: A5 16
        bne @mult_loop          ; $c846: D0 E7 - Loop until multiplier = 0

        ; Store result back
        lda $17                 ; $c848: A5 17
        sta $00,X               ; $c84a: 95 00
        lda $18                 ; $c84c: A5 18
        sta $01,X               ; $c84e: 95 01
        rts                     ; $c850: 60

; ============================================================================
; HERO GROWTH DATA (Bank 8 $a1bb)
; ============================================================================
; Sample of signed growth increments for the Hero character
; Each byte is a signed value (-128 to +127) representing stat change per level
; Values are multiplied by 16 and accumulated

.org $a1bb

hero_growth_data:
        ; These represent stat increments at each level
        ; Format appears to be 3 bytes per level (HP, MP, other)
        .db $01               ; +1
        .db $01               ; +1
        .db $01               ; +1
        .db $00               ; +0
        .db $00               ; +0
        .db $00               ; +0
        .db $00               ; +0
        .db $01               ; +1
        .db $00               ; +0
        .db $01               ; +1
        .db $00               ; +0
        .db $ff               ; -1 (signed)
        ; ... continues for all levels

; ============================================================================
; SUMMARY
; ============================================================================
;
; The stat growth calculation works as follows:
;
; 1. Entry at $80d5 with character ID in $09 and stat bytes in $0a-$0c
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
; 4. Max level characters (level index = $0f) copy stats from fixed table
;
; 5. Variant characters (level index = $0e) use alternate calculation
;
; KEY FORMULA (simplified):
;   stat_base = (level * 16) + base_param[char][gender]
;   For each growth byte in growth_data[char][level*3 + n]:
;       stat[n] = stat_base + (signed_extend(growth_byte) * 16)
;
; ============================================================================

