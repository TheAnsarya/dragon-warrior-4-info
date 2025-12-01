; ============================================================================
; Dragon Warrior IV - Assembly Macros
; ============================================================================
;
; Common macros used throughout the disassembly.
; Ophis macro syntax.
;
; ============================================================================

; ----------------------------------------------------------------------------
; Bank Switching Macros (MMC3)
; ----------------------------------------------------------------------------

; Switch PRG bank at $8000-$9FFF (bank slot 6)
.macro switch_prg_8000
	lda #$06					; Bank slot 6
	sta MMC3_BANK_SELECT
	lda _1						; Bank number
	sta MMC3_BANK_DATA
.macend

; Switch PRG bank at $A000-$BFFF (bank slot 7)
.macro switch_prg_a000
	lda #$07					; Bank slot 7
	sta MMC3_BANK_SELECT
	lda _1						; Bank number
	sta MMC3_BANK_DATA
.macend

; Switch 2KB CHR bank at $0000 (bank slot 0)
.macro switch_chr_0000
	lda #$00					; Bank slot 0
	sta MMC3_BANK_SELECT
	lda _1						; Bank number
	sta MMC3_BANK_DATA
.macend

; Switch 2KB CHR bank at $0800 (bank slot 1)
.macro switch_chr_0800
	lda #$01					; Bank slot 1
	sta MMC3_BANK_SELECT
	lda _1						; Bank number
	sta MMC3_BANK_DATA
.macend

; Switch 1KB CHR bank at $1000 (bank slot 2)
.macro switch_chr_1000
	lda #$02					; Bank slot 2
	sta MMC3_BANK_SELECT
	lda _1						; Bank number
	sta MMC3_BANK_DATA
.macend

; ----------------------------------------------------------------------------
; PPU Macros
; ----------------------------------------------------------------------------

; Set PPU address
.macro ppu_addr
	lda #>`1					; High byte
	sta PPU_ADDR
	lda #<`1					; Low byte
	sta PPU_ADDR
.macend

; Wait for VBlank
.macro wait_vblank
_wait_vblank_loop:
	bit PPU_STATUS
	bpl _wait_vblank_loop
.macend

; Disable rendering
.macro ppu_off
	lda #$00
	sta PPU_CTRL
	sta PPU_MASK
.macend

; Enable rendering (sprites + background)
.macro ppu_on
	lda #$1E					; Enable sprites and BG, no clipping
	sta PPU_MASK
.macend

; ----------------------------------------------------------------------------
; Memory Macros
; ----------------------------------------------------------------------------

; Store 16-bit value
.macro store16
	lda #<`1
	sta `2
	lda #>`1
	sta `2+1
.macend

; Load 16-bit value to A/X (low/high)
.macro load16
	lda `1
	ldx `1+1
.macend

; Add 16-bit immediate to memory
.macro add16
	clc
	lda `2
	adc #<`1
	sta `2
	lda `2+1
	adc #>`1
	sta `2+1
.macend

; Compare 16-bit values
.macro cmp16
	lda `1
	cmp `2
	bne _cmp16_done
	lda `1+1
	cmp `2+1
_cmp16_done:
.macend

; ----------------------------------------------------------------------------
; Jump Table Macros
; ----------------------------------------------------------------------------

; Jump to address from table (A = index)
.macro jump_table
	asl						; Multiply by 2 (word addresses)
	tax
	lda `1,x
	sta temp_ptr
	lda `1+1,x
	sta temp_ptr+1
	jmp (temp_ptr)
.macend

; ----------------------------------------------------------------------------
; Data Macros
; ----------------------------------------------------------------------------

; Define word (little-endian pointer)
.macro dw
	.word `1
.macend

; Define bytes with count
.macro db
	.byte `1
.macend

; Fill with zeros
.macro fill_zero
	.repeat `1
		.byte $00
	.loop
.macend

; Fill with specific byte
.macro fill_byte
	.repeat `1
		.byte `2
	.loop
.macend

; String terminator
.macro text_end
	.byte TEXT_END
.macend

; ----------------------------------------------------------------------------
; Debugging Macros (only if DEBUG is defined)
; ----------------------------------------------------------------------------

.ifdef DEBUG
	; Break point (BRK instruction)
	.macro breakpoint
		brk
		.byte `1				; Breakpoint ID
	.macend
.else
	.macro breakpoint
		; No-op in release builds
	.macend
.endif

; ============================================================================
; End of macros.asm
; ============================================================================
