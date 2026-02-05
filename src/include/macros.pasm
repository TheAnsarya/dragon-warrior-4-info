; ============================================================================
; Dragon Warrior IV - Assembly Macros
; 🌷 Flower Toolchain
; ============================================================================
; Reusable macros for common operations in the game's assembly code.
; These macros simplify repetitive patterns and improve code readability.
; ============================================================================

; ============================================================================
; MMC3 Bank Switching Macros
; ============================================================================
; The MMC3 mapper uses register $8000 to select bank mode,
; and register $8001 to set the bank number.
; ============================================================================

; Set PRG bank at $8000-$9FFF (16KB switchable)
.macro set_prg_bank_8000 bank_num
	lda #6				; Bank register 6 = PRG bank at $8000
	sta MMC3_BANK_SELECT
	lda #bank_num
	sta MMC3_BANK_DATA
	sta zp_current_prg_bank_8000	; Update shadow register
.endm

; Set PRG bank at $A000-$BFFF (16KB switchable)
.macro set_prg_bank_a000 bank_num
	lda #7				; Bank register 7 = PRG bank at $A000
	sta MMC3_BANK_SELECT
	lda #bank_num
	sta MMC3_BANK_DATA
	sta zp_current_prg_bank_a000	; Update shadow register
.endm

; Set CHR bank at $0000-$07FF (2KB)
.macro set_chr_bank_0 bank_num
	lda #0				; Bank register 0 = CHR bank at $0000
	sta MMC3_BANK_SELECT
	lda #bank_num
	sta MMC3_BANK_DATA
	sta zp_current_chr_bank_0
.endm

; Set CHR bank at $0800-$0FFF (2KB)
.macro set_chr_bank_1 bank_num
	lda #1				; Bank register 1 = CHR bank at $0800
	sta MMC3_BANK_SELECT
	lda #bank_num
	sta MMC3_BANK_DATA
	sta zp_current_chr_bank_1
.endm

; Set CHR bank at $1000-$13FF (1KB)
.macro set_chr_bank_2 bank_num
	lda #2				; Bank register 2 = CHR bank at $1000
	sta MMC3_BANK_SELECT
	lda #bank_num
	sta MMC3_BANK_DATA
	sta zp_current_chr_bank_2
.endm

; Set CHR bank at $1400-$17FF (1KB)
.macro set_chr_bank_3 bank_num
	lda #3				; Bank register 3 = CHR bank at $1400
	sta MMC3_BANK_SELECT
	lda #bank_num
	sta MMC3_BANK_DATA
	sta zp_current_chr_bank_3
.endm

; Set CHR bank at $1800-$1BFF (1KB)
.macro set_chr_bank_4 bank_num
	lda #4				; Bank register 4 = CHR bank at $1800
	sta MMC3_BANK_SELECT
	lda #bank_num
	sta MMC3_BANK_DATA
	sta zp_current_chr_bank_4
.endm

; Set CHR bank at $1C00-$1FFF (1KB)
.macro set_chr_bank_5 bank_num
	lda #5				; Bank register 5 = CHR bank at $1C00
	sta MMC3_BANK_SELECT
	lda #bank_num
	sta MMC3_BANK_DATA
	sta zp_current_chr_bank_5
.endm

; ============================================================================
; PPU Helper Macros
; ============================================================================

; Wait for VBlank (NMI)
.macro wait_vblank
	lda zp_nmi_counter
@loop:
	cmp zp_nmi_counter
	beq @loop
.endm

; Set PPU address for writing
.macro set_ppu_addr addr
	lda #>addr			; High byte first
	sta PPU_ADDR
	lda #<addr			; Low byte second
	sta PPU_ADDR
.endm

; Write a single byte to current PPU address
.macro ppu_write_byte value
	lda #value
	sta PPU_DATA
.endm

; Set scroll position
.macro set_scroll x_pos, y_pos
	lda #x_pos
	sta PPU_SCROLL
	sta zp_scroll_x
	lda #y_pos
	sta PPU_SCROLL
	sta zp_scroll_y
.endm

; Enable rendering
.macro enable_rendering
	lda #$1e			; Show sprites and background
	sta PPU_MASK
	sta zp_ppu_mask_shadow
.endm

; Disable rendering
.macro disable_rendering
	lda #$00
	sta PPU_MASK
	sta zp_ppu_mask_shadow
.endm

; ============================================================================
; Memory Operations
; ============================================================================

; Clear a block of RAM to zero
; Uses: A, X
.macro clear_ram start_addr, length
	lda #0
	ldx #length
@loop:
	dex
	sta start_addr,x
	bne @loop
.endm

; Copy memory block
; Uses: A, X
.macro copy_mem src_addr, dest_addr, length
	ldx #0
@loop:
	lda src_addr,x
	sta dest_addr,x
	inx
	cpx #length
	bne @loop
.endm

; Set pointer in zero page
.macro set_ptr ptr_zp, addr
	lda #<addr
	sta ptr_zp
	lda #>addr
	sta ptr_zp+1
.endm

; ============================================================================
; Math Macros
; ============================================================================

; 16-bit increment at zero page address
.macro inc16 addr
	inc addr
	bne @done
	inc addr+1
@done:
.endm

; 16-bit decrement at zero page address
.macro dec16 addr
	lda addr
	bne @no_borrow
	dec addr+1
@no_borrow:
	dec addr
.endm

; 16-bit compare (A:X vs immediate)
.macro cmp16 lo_val, hi_val
	cpx #hi_val
	bne @done
	cmp #lo_val
@done:
.endm

; Add 8-bit to 16-bit
.macro add8_to_16 addr_16, val_8
	lda addr_16
	clc
	adc #val_8
	sta addr_16
	bcc @done
	inc addr_16+1
@done:
.endm

; ============================================================================
; Stack Operations
; ============================================================================

; Push multiple registers
.macro push_all
	pha
	txa
	pha
	tya
	pha
.endm

; Pull multiple registers
.macro pull_all
	pla
	tay
	pla
	tax
	pla
.endm

; ============================================================================
; Controller Macros
; ============================================================================

; Check if button was just pressed (not held)
.macro button_pressed button_mask
	lda zp_joy1_pressed
	and #button_mask
.endm

; Check if button is currently held
.macro button_held button_mask
	lda zp_joy1_state
	and #button_mask
.endm

; ============================================================================
; Audio Macros
; ============================================================================

; Play music track
.macro play_music track_id
	lda #track_id
	sta music_next_track
.endm

; Play sound effect
.macro play_sfx sfx_id
	lda #sfx_id
	sta sfx_queue
.endm

; ============================================================================
; Game-Specific Macros
; ============================================================================

; Get monster data pointer
; Input: A = monster ID
; Output: zp_data_ptr set to monster data address
.macro get_monster_ptr
	; Monster data is 16 bytes per entry
	asl			; × 2
	asl			; × 4
	asl			; × 8
	asl			; × 16
	sta zp_data_ptr_lo
	lda #0
	rol			; Get carry from shift
	clc
	adc #>monster_data	; Add base address high byte
	sta zp_data_ptr_hi
.endm

; Get item data pointer
; Input: A = item ID
; Output: zp_data_ptr set to item data address
.macro get_item_ptr
	; Item data is 8 bytes per entry
	asl			; × 2
	asl			; × 4
	asl			; × 8
	sta zp_data_ptr_lo
	lda #0
	rol
	clc
	adc #>item_data
	sta zp_data_ptr_hi
.endm

; Get spell data pointer
; Input: A = spell ID
; Output: zp_data_ptr set to spell data address
.macro get_spell_ptr
	; Spell data is 8 bytes per entry
	asl			; × 2
	asl			; × 4
	asl			; × 8
	sta zp_data_ptr_lo
	lda #0
	rol
	clc
	adc #>spell_data
	sta zp_data_ptr_hi
.endm

; Get party member data pointer
; Input: A = party member index (0-7)
; Output: zp_data_ptr set to party member structure
.macro get_party_member_ptr
	; Each party member is 48 bytes ($30)
	asl			; × 2
	asl			; × 4
	asl			; × 8
	asl			; × 16
	asl			; × 32 (close enough, we'll add 16 more)
	sta zp_temp0
	lsr			; Back to × 16
	clc
	adc zp_temp0		; × 32 + × 16 = × 48
	sta zp_data_ptr_lo
	lda #>party_member_0
	sta zp_data_ptr_hi
.endm

; ============================================================================
; Chapter-Specific Macros
; ============================================================================

; Check if in specific chapter
.macro in_chapter chapter_num
	lda zp_chapter_id
	cmp #chapter_num
.endm

; Set story flag
; flag_byte = flag index / 8
; flag_bit = 1 << (flag index % 8)
.macro set_flag flag_byte, flag_bit
	lda game_flags_start + flag_byte
	ora #flag_bit
	sta game_flags_start + flag_byte
.endm

; Clear story flag
.macro clear_flag flag_byte, flag_bit
	lda game_flags_start + flag_byte
	and #(~flag_bit & $ff)
	sta game_flags_start + flag_byte
.endm

; Check story flag (result in Z flag)
.macro check_flag flag_byte, flag_bit
	lda game_flags_start + flag_byte
	and #flag_bit
.endm

; ============================================================================
; Data Definition Macros
; ============================================================================

; Define a text string with DTE compression terminator
.macro dtext str
	.db str, $ff
.endm

; Define a pointer table entry
.macro ptr_entry addr
	.dw addr
.endm

; ============================================================================
; Debugging Macros (for development only)
; ============================================================================

; These are no-ops in release builds but can be enabled for debugging

.ifdef DEBUG
	; Breakpoint - infinite loop for debugging
	.macro brk_point
		jmp *
	.endm

	; Debug marker - writes value to unused RAM location
	.macro debug_mark value
		lda #value
		sta $07ff		; Unused RAM byte
	.endm
.else
	; No-op versions for release
	.macro brk_point
	.endm

	.macro debug_mark value
	.endm
.endif

; ============================================================================
; End of Macros
; ============================================================================
