; ============================================================================
; Dragon Warrior IV - Main Assembly File
; ============================================================================
; This is the top-level source file for the DW4 disassembly.
; It includes all sub-modules and defines the ROM structure.
; ============================================================================
; 
; Build command (ca65/ld65):
;   ca65 -o dw4.o dw4.asm
;   ld65 -C dw4.cfg -o dw4.nes dw4.o
;
; ============================================================================

; Include common definitions
	.include "include/constants.inc"
	.include "include/ram_map.inc"
	.include "include/macros.inc"

; ============================================================================
; iNES Header
; ============================================================================
	.segment "HEADER"
	.byte "NES", $1a		; iNES signature
	.byte PRG_BANKS			; PRG ROM size (32 × 16KB = 512KB)
	.byte CHR_BANKS			; CHR ROM size (0 = CHR-RAM)
	.byte $40			; Flags 6: Mapper low nibble (MMC3), battery
	.byte $00			; Flags 7: Mapper high nibble
	.byte $00			; PRG RAM size
	.byte $00			; TV system
	.byte $00			; Unused
	.byte $00, $00, $00, $00, $00	; Padding

; ============================================================================
; Bank 0 ($00) - Main Program Code
; ============================================================================
	.segment "PRG_BANK_00"

; Reset vector entry point
reset:
	sei				; Disable interrupts
	cld				; Clear decimal mode
	ldx #$ff
	txs				; Initialize stack

	; Disable rendering
	lda #$00
	sta PPU_CTRL
	sta PPU_MASK

	; Wait for PPU warmup (2 frames)
	wait_vblank
	wait_vblank

	; Initialize RAM
	jsr init_ram

	; Initialize hardware
	jsr init_ppu
	jsr init_apu
	jsr init_mmc3

	; Jump to game initialization
	jmp game_init

; ============================================================================
; Initialization Routines
; ============================================================================

init_ram:
	; Clear zero page
	lda #$00
	ldx #$00
@loop_zp:
	sta $00, x
	inx
	bne @loop_zp

	; Clear OAM buffer
	lda #$ff			; Y = 255 hides sprites
	ldx #$00
@loop_oam:
	sta OAM_BUFFER, x
	inx
	bne @loop_oam

	rts

init_ppu:
	; Basic PPU setup
	lda #$00
	sta zp_ppu_ctrl_shadow
	sta zp_ppu_mask_shadow
	sta zp_scroll_x
	sta zp_scroll_y
	rts

init_apu:
	; Silence all channels
	lda #$00
	sta APU_STATUS

	; Reset frame counter
	lda #$40
	sta APU_FRAME_COUNTER
	rts

init_mmc3:
	; Set up MMC3 banking
	; PRG mode 0: $8000-$9FFF swappable, $C000-$DFFF fixed to second-to-last
	; PRG mode 1: $8000-$9FFF fixed to second-to-last, $C000-$DFFF swappable
	lda #$00
	sta MMC3_BANK_SELECT

	; Enable PRG RAM
	lda #$80
	sta MMC3_PRG_RAM_PROTECT

	rts

; ============================================================================
; Game Initialization
; ============================================================================

game_init:
	; TODO: Initialize game state
	; - Load initial bank
	; - Set up title screen
	; - Enable rendering

	; Enable NMI and rendering
	lda #$80			; Enable NMI
	sta PPU_CTRL
	sta zp_ppu_ctrl_shadow

	lda #$1e			; Enable sprites and background
	sta PPU_MASK
	sta zp_ppu_mask_shadow

	; Fall through to main loop

; ============================================================================
; Main Game Loop
; ============================================================================

main_loop:
	; Wait for NMI to set the frame flag
	lda zp_ppu_update_flag
	beq main_loop

	; Clear frame flag
	lda #$00
	sta zp_ppu_update_flag

	; Read controllers
	jsr read_controllers

	; Update game logic based on current mode
	jsr update_game

	jmp main_loop

; ============================================================================
; Controller Reading
; ============================================================================

read_controllers:
	; Save previous state
	lda zp_controller1
	sta zp_controller1_prev

	; Strobe controller
	lda #$01
	sta JOYPAD1
	lda #$00
	sta JOYPAD1

	; Read 8 buttons
	ldx #$08
@read_loop:
	lda JOYPAD1
	lsr a				; Bit 0 -> carry
	rol zp_controller1		; Carry -> bit 0
	dex
	bne @read_loop

	; Calculate newly pressed buttons
	lda zp_controller1
	eor zp_controller1_prev
	and zp_controller1
	sta zp_controller1_new

	rts

; ============================================================================
; Game Update Dispatch
; ============================================================================

update_game:
	; Dispatch based on game mode
	lda zp_game_mode
	asl a
	tax
	lda game_mode_table, x
	sta zp_ptr_lo
	lda game_mode_table+1, x
	sta zp_ptr_hi
	jmp (zp_ptr_lo)

game_mode_table:
	.word update_title		; Mode 0: Title screen
	.word update_field		; Mode 1: Field/overworld
	.word update_battle		; Mode 2: Battle
	.word update_menu		; Mode 3: Menu
	.word update_dialog		; Mode 4: Dialog

; Placeholder update routines
update_title:
update_field:
update_battle:
update_menu:
update_dialog:
	rts

; ============================================================================
; NMI Handler (called every VBlank)
; ============================================================================

nmi:
	push_all

	; OAM DMA
	lda #>OAM_BUFFER
	sta PPU_OAM_DMA

	; PPU updates here (if any)
	; ...

	; Update scroll
	lda zp_ppu_ctrl_shadow
	sta PPU_CTRL
	lda zp_scroll_x
	sta PPU_SCROLL
	lda zp_scroll_y
	sta PPU_SCROLL

	; Set frame flag for main loop
	lda #$01
	sta zp_ppu_update_flag

	; Increment frame counter
	inc zp_frame_counter

	pull_all
	rti

; ============================================================================
; IRQ Handler
; ============================================================================

irq:
	rti

; ============================================================================
; Include Data Files
; ============================================================================

; These will be populated as we extract and format the data
; .include "data/monsters.asm"
; .include "data/items.asm"
; .include "data/spells.asm"
; .include "data/maps.asm"
; .include "data/text.asm"

; ============================================================================
; Vector Table (must be at $FFFA-$FFFF)
; ============================================================================
	.segment "VECTORS"
	.word nmi			; NMI vector ($FFFA)
	.word reset			; Reset vector ($FFFC)
	.word irq			; IRQ vector ($FFFE)

; ============================================================================
; End of dw4.asm
; ============================================================================
