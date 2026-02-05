; ============================================================================
; Dragon Warrior IV - Bank $00 (PRG ROM $00000-$03FFF)
; 🌷 Flower Toolchain
; ============================================================================
; Bank 0 contains the core game engine routines that are always available.
; This bank is typically kept in the fixed $C000-$FFFF region.
; ============================================================================

; Bank offset in ROM file (after 16-byte iNES header)
; File offset: $00010 - $0400F (16,384 bytes)
; CPU address: $8000-$BFFF or $C000-$FFFF

; ============================================================================
; Reset Handler and Initialization
; ============================================================================

; The RESET vector points here from $FFFC
reset_handler:
	sei				; Disable interrupts
	cld				; Clear decimal mode
	ldx #$ff
	txs				; Initialize stack pointer

	; Wait for PPU to stabilize (2 vblanks)
	bit PPU_STATUS			; Clear vblank flag
@wait_vblank_1:
	bit PPU_STATUS
	bpl @wait_vblank_1
@wait_vblank_2:
	bit PPU_STATUS
	bpl @wait_vblank_2

	; Initialize RAM
	jsr init_ram

	; Initialize PPU
	jsr init_ppu

	; Initialize audio engine
	jsr init_audio

	; Initialize MMC3 mapper
	jsr init_mapper

	; Start main game loop
	jmp main_loop

; ============================================================================
; RAM Initialization
; ============================================================================
; Clear all RAM and initialize default values

init_ram:
	; Clear zero page
	lda #0
	ldx #0
@clear_zp:
	sta $00,x
	inx
	bne @clear_zp

	; Clear stack page (leave stack pointer area)
	ldx #$00
@clear_stack:
	sta $0100,x
	inx
	bne @clear_stack

	; Clear OAM buffer
	lda #$ff			; Y = $FF hides sprites
	ldx #0
@clear_oam:
	sta OAM_BUFFER,x
	inx
	bne @clear_oam

	; Clear general RAM $0300-$07FF
	lda #0
	ldx #0
@clear_ram:
	sta $0300,x
	sta $0400,x
	sta $0500,x
	sta $0600,x
	sta $0700,x
	inx
	bne @clear_ram

	; Initialize default values
	lda #1
	sta zp_chapter_id		; Start at Chapter 1

	rts

; ============================================================================
; PPU Initialization
; ============================================================================
; Set up PPU for game rendering

init_ppu:
	; Disable rendering during setup
	lda #0
	sta PPU_CTRL
	sta PPU_MASK
	sta zp_ppu_ctrl_shadow
	sta zp_ppu_mask_shadow

	; Clear nametables
	lda #$20			; Nametable 0 at $2000
	sta PPU_ADDR
	lda #$00
	sta PPU_ADDR

	lda #0
	ldx #0
	ldy #8				; 8 pages = 2KB
@clear_nt:
	sta PPU_DATA
	inx
	bne @clear_nt
	dey
	bne @clear_nt

	; Clear palette to all black
	lda #$3f
	sta PPU_ADDR
	lda #$00
	sta PPU_ADDR

	lda #$0f			; Black
	ldx #32
@clear_pal:
	sta PPU_DATA
	dex
	bne @clear_pal

	; Reset scroll
	lda #0
	sta PPU_SCROLL
	sta PPU_SCROLL
	sta zp_scroll_x
	sta zp_scroll_y

	rts

; ============================================================================
; Audio Engine Initialization
; ============================================================================

init_audio:
	; Enable all audio channels
	lda #$0f
	sta APU_STATUS

	; Silence all channels
	lda #$30			; Constant volume, duty 00
	sta APU_PULSE1_ENV
	sta APU_PULSE2_ENV
	lda #$80			; Silence triangle
	sta APU_TRIANGLE_CTRL
	lda #$30			; Silence noise
	sta APU_NOISE_ENV

	rts

; ============================================================================
; MMC3 Mapper Initialization
; ============================================================================

init_mapper:
	; Set PRG ROM mode: swap $8000, fix $C000
	lda #$00
	sta MMC3_BANK_SELECT

	; Set initial PRG banks
	lda #6				; Register 6: $8000
	sta MMC3_BANK_SELECT
	lda #0				; Bank 0
	sta MMC3_BANK_DATA
	sta zp_current_prg_bank_8000

	lda #7				; Register 7: $A000
	sta MMC3_BANK_SELECT
	lda #1				; Bank 1
	sta MMC3_BANK_DATA
	sta zp_current_prg_bank_a000

	; Set initial CHR banks
	lda #0
	sta MMC3_BANK_SELECT
	sta MMC3_BANK_DATA		; CHR bank 0 at $0000
	sta zp_current_chr_bank_0

	lda #1
	sta MMC3_BANK_SELECT
	lda #2
	sta MMC3_BANK_DATA		; CHR bank 2 at $0800
	sta zp_current_chr_bank_1

	; Enable RAM
	lda #$80
	sta MMC3_RAM_PROTECT

	; Disable IRQ for now
	sta MMC3_IRQ_DISABLE

	rts

; ============================================================================
; Main Game Loop
; ============================================================================
; Central game loop that runs every frame

main_loop:
	; Wait for VBlank (NMI sets flag)
	lda #0
	sta zp_ppu_update_pending
@wait_vblank:
	lda zp_ppu_update_pending
	beq @wait_vblank

	; Read controller input
	jsr read_controllers

	; Update game state based on current mode
	lda zp_game_mode
	asl
	tax
	lda game_mode_handlers+0,x
	sta zp_ptr0_lo
	lda game_mode_handlers+1,x
	sta zp_ptr0_hi
	jmp (zp_ptr0_lo)		; Jump to mode handler

	; Mode handlers return here
main_loop_return:
	; Update audio engine
	jsr update_audio

	; Loop forever
	jmp main_loop

; ============================================================================
; Game Mode Handler Table
; ============================================================================

game_mode_handlers:
	.dw mode_title_screen		; Mode 0: Title screen
	.dw mode_file_select		; Mode 1: File select
	.dw mode_field			; Mode 2: Field (walking around)
	.dw mode_battle			; Mode 3: Battle
	.dw mode_menu			; Mode 4: Menu
	.dw mode_shop			; Mode 5: Shop
	.dw mode_dialog			; Mode 6: Dialog
	.dw mode_cutscene		; Mode 7: Cutscene

; ============================================================================
; NMI Handler (VBlank Interrupt)
; ============================================================================
; Called every frame when VBlank begins (60 times per second)

nmi_handler:
	; Save registers
	pha
	txa
	pha
	tya
	pha

	; Increment NMI counter
	inc zp_nmi_counter

	; Perform OAM DMA (upload sprites)
	lda #>OAM_BUFFER
	sta APU_OAM_DMA

	; Update PPU if pending
	lda zp_ppu_update_pending
	beq @skip_ppu
	jsr update_ppu
@skip_ppu:

	; Set flag for main loop
	lda #1
	sta zp_ppu_update_pending

	; Restore registers
	pla
	tay
	pla
	tax
	pla
	rti

; ============================================================================
; IRQ Handler
; ============================================================================
; MMC3 scanline counter interrupt - used for split scrolling

irq_handler:
	pha

	; Acknowledge IRQ
	sta MMC3_IRQ_DISABLE
	sta MMC3_IRQ_ENABLE

	; Handle mid-screen effect (e.g., status bar)
	; TODO: Implement based on game mode

	pla
	rti

; ============================================================================
; Controller Reading
; ============================================================================

read_controllers:
	; Store previous state
	lda zp_joy1_state
	sta zp_joy1_prev

	; Strobe controller
	lda #1
	sta JOYPAD1
	lda #0
	sta JOYPAD1

	; Read 8 buttons
	ldx #8
@read_loop:
	lda JOYPAD1
	lsr				; Bit 0 -> carry
	rol zp_joy1_state		; Carry -> bit 0
	dex
	bne @read_loop

	; Calculate newly pressed buttons
	lda zp_joy1_state
	eor #$ff			; Invert current
	ora zp_joy1_prev		; OR with previous
	eor #$ff			; Invert result
	sta zp_joy1_pressed		; = (current AND NOT previous)

	rts

; ============================================================================
; PPU Update Routine
; ============================================================================
; Called during VBlank to update VRAM

update_ppu:
	; Update scroll position
	lda zp_ppu_ctrl_shadow
	sta PPU_CTRL

	lda zp_scroll_x
	sta PPU_SCROLL
	lda zp_scroll_y
	sta PPU_SCROLL

	; Update mask (enable/disable rendering)
	lda zp_ppu_mask_shadow
	sta PPU_MASK

	rts

; ============================================================================
; Audio Update Routine
; ============================================================================
; Placeholder for audio engine (implemented in audio bank)

update_audio:
	; TODO: Call into audio bank
	rts

; ============================================================================
; Mode Handlers (Stubs - Actual code in other banks)
; ============================================================================

mode_title_screen:
	; TODO: Implement or call into title bank
	jmp main_loop_return

mode_file_select:
	; TODO: Implement or call into file select bank
	jmp main_loop_return

mode_field:
	; TODO: Call into field/map bank
	jmp main_loop_return

mode_battle:
	; TODO: Call into battle bank
	jmp main_loop_return

mode_menu:
	; TODO: Call into menu bank
	jmp main_loop_return

mode_shop:
	; TODO: Call into shop bank
	jmp main_loop_return

mode_dialog:
	; TODO: Call into dialog/text bank
	jmp main_loop_return

mode_cutscene:
	; TODO: Call into cutscene bank
	jmp main_loop_return

; ============================================================================
; Utility Functions
; ============================================================================

; 16-bit multiply: A × X = Y:A (low:high)
multiply_8x8:
	ldy #0
	sty zp_temp0			; Clear high byte
	stx zp_temp1			; Store multiplier
@loop:
	lsr				; Shift multiplicand right
	bcc @no_add
	clc
	tya
	adc zp_temp1			; Add multiplier to result
	tay
@no_add:
	asl zp_temp1			; Shift multiplier left
	cmp #0				; Check if multiplicand is 0
	bne @loop
	tya				; Return result in A (high in Y)
	rts

; Random number generator (verified from Cowness notes)
; Returns random value in A
get_random:
	inc zp_rng_counter		; Increment counter
	lda zp_rng_seed_lo
	asl
	asl
	asl
	sec
	adc zp_rng_seed_lo
	sta zp_rng_seed_lo
	adc zp_rng_seed_hi
	sta zp_rng_seed_hi
	rts

; ============================================================================
; Padding to fill bank (if needed)
; ============================================================================
; The bank should be exactly 16KB ($4000 bytes)

; ============================================================================
; Vector Table (at end of fixed bank $FFFA-$FFFF)
; ============================================================================
; Note: These vectors are only needed in the fixed bank (bank $0E/$0F)
; If this is not the fixed bank, these should not be here

; .org $fffa
; .dw nmi_handler		; NMI vector
; .dw reset_handler		; RESET vector
; .dw irq_handler		; IRQ/BRK vector

; ============================================================================
; End of Bank $00
; ============================================================================
