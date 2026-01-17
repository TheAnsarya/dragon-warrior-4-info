; ============================================================================
; Dragon Warrior IV - Bank 15 (Fixed Bank)
; ============================================================================
;
; ROM Offset: $3c010-$40000
; CPU Address: $e000-$ffff (always mapped)
;
; Contents:
;   - Reset handler
;   - NMI handler
;   - IRQ handler
;   - Bank switching routines
;   - Core utilities
;   - Interrupt vectors
;
; ============================================================================

; Fixed bank is always at $e000
.org $e000

; ----------------------------------------------------------------------------
; Reset Handler
; ----------------------------------------------------------------------------

Reset:
	sei						; Disable interrupts
	cld						; Clear decimal mode

	; Initialize stack
	ldx #$ff
	txs

	; Disable NMI and rendering
	lda #$00
	sta PPU_CTRL
	sta PPU_MASK

	; Wait for PPU to stabilize (2 frames)
	jsr WaitVBlankInit
	jsr WaitVBlankInit

	; Clear RAM
	jsr ClearRAM

	; Initialize MMC3
	jsr InitMapper

	; Initialize PPU
	jsr InitPPU

	; Initialize APU
	jsr InitAPU

	; Initialize game variables
	jsr InitGame

	; Enable NMI
	lda #$80
	sta PPU_CTRL
	sta ppu_ctrl_shadow

	; Jump to main loop in bank 0
	jmp MainLoop

; ----------------------------------------------------------------------------
; NMI Handler (VBlank)
; ----------------------------------------------------------------------------

NMI:
	pha
	txa
	pha
	tya
	pha

	; Increment frame counter
	inc nmi_count

	; OAM DMA
	lda #$02
	sta OAM_DMA

	; Update PPU from buffer
	jsr ProcessPPUBuffer

	; Reset scroll
	lda scroll_x
	sta PPU_SCROLL
	lda scroll_y
	sta PPU_SCROLL

	; Restore PPU control
	lda ppu_ctrl_shadow
	sta PPU_CTRL

	pla
	tay
	pla
	tax
	pla
	rti

; ----------------------------------------------------------------------------
; IRQ Handler (MMC3 Scanline Counter)
; ----------------------------------------------------------------------------

IRQ:
	pha

	; Acknowledge IRQ
	sta MMC3_IRQ_DISABLE
	sta MMC3_IRQ_ENABLE

	; TODO: Handle scanline-based effects
	; (Status bar, split scrolling, etc.)

	pla
	rti

; ----------------------------------------------------------------------------
; Initialization Subroutines
; ----------------------------------------------------------------------------

WaitVBlankInit:
@Wait:
	bit PPU_STATUS
	bpl @Wait
	rts

ClearRAM:
	lda #$00
	ldx #$00
@Loop:
	sta $0000,x
	sta $0100,x
	sta $0200,x
	sta $0300,x
	sta $0400,x
	sta $0500,x
	sta $0600,x
	sta $0700,x
	inx
	bne @Loop
	rts

InitMapper:
	; Initialize MMC3 registers
	; Set PRG bank mode, CHR bank mode
	lda #$00
	sta MMC3_BANK_SELECT

	; Enable PRG RAM
	lda #$80
	sta MMC3_PRG_RAM

	; Set horizontal mirroring
	lda #$00
	sta MMC3_MIRRORING

	rts

InitPPU:
	; Clear nametables
	`ppu_addr NAMETABLE_0

	lda #$00
	ldx #$08				; 8 * 256 = 2048 bytes
	ldy #$00
@ClearLoop:
	sta PPU_DATA
	iny
	bne @ClearLoop
	dex
	bne @ClearLoop

	; Clear palette
	`ppu_addr PALETTE_BG

	lda #$0f				; Black
	ldx #$20				; 32 palette entries
@PalLoop:
	sta PPU_DATA
	dex
	bne @PalLoop

	rts

InitAPU:
	; Silence all channels
	lda #$00
	sta APU_STATUS

	; Initialize frame counter
	lda #$40
	sta JOYPAD2

	; Enable channels
	lda #$0f
	sta APU_STATUS

	rts

InitGame:
	; Initialize game state
	lda #$00
	sta game_mode
	sta current_chapter
	sta current_map

	rts

; ----------------------------------------------------------------------------
; PPU Buffer Processing
; ----------------------------------------------------------------------------

ProcessPPUBuffer:
	; TODO: Process queued PPU updates
	rts

; ----------------------------------------------------------------------------
; Bank Switching Routines
; ----------------------------------------------------------------------------

; Switch bank at $8000
; A = bank number
SwitchBank8000:
	pha
	lda #$06
	sta MMC3_BANK_SELECT
	pla
	sta MMC3_BANK_DATA
	rts

; Switch bank at $a000
; A = bank number
SwitchBankA000:
	pha
	lda #$07
	sta MMC3_BANK_SELECT
	pla
	sta MMC3_BANK_DATA
	rts

; ----------------------------------------------------------------------------
; Utility Subroutines
; ----------------------------------------------------------------------------

; Multiply A by X, result in A (low) and X (high)
Multiply:
	; TODO: Actual implementation
	rts

; Divide A by X, quotient in A, remainder in X
Divide:
	; TODO: Actual implementation
	rts

; Generate random number in A
Random:
	; TODO: Actual implementation using LFSR
	rts

; ----------------------------------------------------------------------------
; Data Tables (in fixed bank for easy access)
; ----------------------------------------------------------------------------

; TODO: Add data tables accessible from all banks

; ----------------------------------------------------------------------------
; Padding and Vectors
; ----------------------------------------------------------------------------

; Pad to vectors
.org $fffa, $ff

; Interrupt Vectors
.dw NMI					; $fffa - NMI vector
.dw Reset					; $fffc - Reset vector
.dw IRQ					; $fffe - IRQ/BRK vector

; ============================================================================
; End of bank_15.asm
; ============================================================================

