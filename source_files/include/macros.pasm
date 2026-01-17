; ============================================================================
; Dragon Warrior IV - Macro Definitions
; ============================================================================
; Common macros for assembly
; ============================================================================

; ============================================================================
; Bank Switching Macros (MMC3)
; ============================================================================

; Switch PRG bank at $8000-$9fff
.macro switch_prg_bank_8000 bank
	lda #MMC3_SEL_PRG0
	sta MMC3_BANK_SELECT
	lda #bank
	sta MMC3_BANK_DATA
.endmacro

; Switch PRG bank at $a000-$bfff
.macro switch_prg_bank_a000 bank
	lda #MMC3_SEL_PRG1
	sta MMC3_BANK_SELECT
	lda #bank
	sta MMC3_BANK_DATA
.endmacro

; Switch 2KB CHR bank at $0000
.macro switch_chr_bank_0000 bank
	lda #MMC3_SEL_CHR0
	sta MMC3_BANK_SELECT
	lda #bank
	sta MMC3_BANK_DATA
.endmacro

; Switch 2KB CHR bank at $0800
.macro switch_chr_bank_0800 bank
	lda #MMC3_SEL_CHR1
	sta MMC3_BANK_SELECT
	lda #bank
	sta MMC3_BANK_DATA
.endmacro

; ============================================================================
; 16-bit Operations
; ============================================================================

; Load 16-bit immediate value into zero page pair
.macro load16 addr, value
	lda #<value
	sta addr
	lda #>value
	sta addr+1
.endmacro

; Add 8-bit value to 16-bit zero page pair
.macro add16_8 addr, value
	clc
	lda addr
	adc #value
	sta addr
	bcc :+
	inc addr+1
:
.endmacro

; Subtract 8-bit value from 16-bit zero page pair
.macro sub16_8 addr, value
	sec
	lda addr
	sbc #value
	sta addr
	bcs :+
	dec addr+1
:
.endmacro

; Compare 16-bit values
.macro cmp16 addr, value
	lda addr+1
	cmp #>value
	bne :+
	lda addr
	cmp #<value
:
.endmacro

; ============================================================================
; PPU Macros
; ============================================================================

; Set PPU address for writing
.macro set_ppu_addr addr
	bit PPU_STATUS		; Reset latch
	lda #>addr
	sta PPU_ADDR
	lda #<addr
	sta PPU_ADDR
.endmacro

; Write immediate byte to PPU
.macro write_ppu_byte value
	lda #value
	sta PPU_DATA
.endmacro

; Wait for VBlank
.macro wait_vblank
:
	bit PPU_STATUS
	bpl :-
.endmacro

; ============================================================================
; Controller Macros
; ============================================================================

; Check if button is pressed
.macro button_pressed button
	lda zp_controller1_new
	and #button
.endmacro

; Check if button is held
.macro button_held button
	lda zp_controller1
	and #button
.endmacro

; ============================================================================
; Utility Macros
; ============================================================================

; Push all registers
.macro push_all
	pha
	txa
	pha
	tya
	pha
.endmacro

; Pull all registers
.macro pull_all
	pla
	tay
	pla
	tax
	pla
.endmacro

; No-operation delay (cycles = n * 2)
.macro nop_delay cycles
	.repeat cycles
		nop
	.endrep
.endmacro

; ============================================================================
; Data Definition Macros
; ============================================================================

; Define a null-terminated string with DW4 encoding
.macro dw4_string text
	; This would need to convert ASCII to DW4 TBL encoding
	; For now, just embed raw bytes
	.db text
	.db TEXT_END
.endmacro

; Define a pointer table entry
.macro ptr_entry label
	.dw label
.endmacro

; Define monster stats entry
.macro monster_entry hp, mp, atk, def, agi, exp, gold
	.dw hp		; HP (2 bytes)
	.db mp		; MP (1 byte)
	.dw atk		; Attack (2 bytes)
	.db def		; Defense (1 byte)
	.db agi		; Agility (1 byte)
	.dw exp		; Experience (2 bytes)
	.dw gold		; Gold (2 bytes)
.endmacro

; Define item entry
.macro item_entry price, atk, def, agi, equip, effect, type
	.dw price		; Price (2 bytes)
	.db atk		; Attack bonus (1 byte)
	.db def		; Defense bonus (1 byte)
	.db agi		; Agility bonus (1 byte)
	.db equip		; Equip flags (1 byte)
	.db effect		; Effect ID (1 byte)
	.db type		; Item type (1 byte)
.endmacro

; ============================================================================
; End of macros.inc
; ============================================================================

