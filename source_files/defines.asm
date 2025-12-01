; ============================================================================
; Dragon Warrior IV - Definitions and Constants
; ============================================================================
;
; This file contains all constant definitions, aliases, and enumerations
; used throughout the disassembly.
;
; ============================================================================

; ----------------------------------------------------------------------------
; ROM Constants
; ----------------------------------------------------------------------------

.alias ROM_MAPPER			$04			; MMC3 Mapper
.alias PRG_BANK_COUNT		$10			; 16 PRG banks (256KB)
.alias CHR_BANK_COUNT		$10			; 16 CHR banks (128KB)
.alias PRG_BANK_SIZE		$4000		; 16KB per PRG bank
.alias CHR_BANK_SIZE		$2000		; 8KB per CHR bank

; ----------------------------------------------------------------------------
; CPU Memory Map
; ----------------------------------------------------------------------------

.alias RAM_START			$0000		; Internal RAM start
.alias RAM_SIZE				$0800		; 2KB internal RAM
.alias STACK_TOP			$01FF		; Stack top

.alias PPU_CTRL				$2000		; PPU Control Register 1
.alias PPU_MASK				$2001		; PPU Control Register 2
.alias PPU_STATUS			$2002		; PPU Status Register
.alias OAM_ADDR				$2003		; OAM Address
.alias OAM_DATA				$2004		; OAM Data
.alias PPU_SCROLL			$2005		; PPU Scroll Position
.alias PPU_ADDR				$2006		; PPU Address
.alias PPU_DATA				$2007		; PPU Data

.alias APU_PULSE1_CTRL		$4000		; APU Pulse 1 Control
.alias APU_PULSE1_SWEEP		$4001		; APU Pulse 1 Sweep
.alias APU_PULSE1_LO		$4002		; APU Pulse 1 Timer Low
.alias APU_PULSE1_HI		$4003		; APU Pulse 1 Timer High
.alias APU_PULSE2_CTRL		$4004		; APU Pulse 2 Control
.alias APU_PULSE2_SWEEP		$4005		; APU Pulse 2 Sweep
.alias APU_PULSE2_LO		$4006		; APU Pulse 2 Timer Low
.alias APU_PULSE2_HI		$4007		; APU Pulse 2 Timer High
.alias APU_TRI_CTRL			$4008		; APU Triangle Control
.alias APU_TRI_LO			$400A		; APU Triangle Timer Low
.alias APU_TRI_HI			$400B		; APU Triangle Timer High
.alias APU_NOISE_CTRL		$400C		; APU Noise Control
.alias APU_NOISE_LO			$400E		; APU Noise Timer
.alias APU_NOISE_HI			$400F		; APU Noise Length
.alias APU_DMC_CTRL			$4010		; APU DMC Control
.alias APU_DMC_DIRECT		$4011		; APU DMC Direct Load
.alias APU_DMC_ADDR			$4012		; APU DMC Address
.alias APU_DMC_LEN			$4013		; APU DMC Length
.alias OAM_DMA				$4014		; OAM DMA Register
.alias APU_STATUS			$4015		; APU Status
.alias JOYPAD1				$4016		; Joypad 1
.alias JOYPAD2				$4017		; Joypad 2 / APU Frame Counter

.alias SRAM_START			$6000		; Battery-backed SRAM start
.alias SRAM_SIZE			$2000		; 8KB SRAM

.alias PRG_ROM_START		$8000		; PRG ROM start
.alias PRG_BANK_0			$8000		; Switchable bank 0
.alias PRG_BANK_1			$A000		; Switchable bank 1
.alias PRG_BANK_2			$C000		; Switchable bank 2 (often fixed)
.alias PRG_BANK_3			$E000		; Fixed bank (last bank)

; ----------------------------------------------------------------------------
; MMC3 Mapper Registers
; ----------------------------------------------------------------------------

.alias MMC3_BANK_SELECT		$8000		; Bank select register
.alias MMC3_BANK_DATA		$8001		; Bank data register
.alias MMC3_MIRRORING		$A000		; Mirroring register
.alias MMC3_PRG_RAM			$A001		; PRG RAM protect register
.alias MMC3_IRQ_LATCH		$C000		; IRQ latch
.alias MMC3_IRQ_RELOAD		$C001		; IRQ reload
.alias MMC3_IRQ_DISABLE		$E000		; IRQ disable
.alias MMC3_IRQ_ENABLE		$E001		; IRQ enable

; ----------------------------------------------------------------------------
; Game Constants
; ----------------------------------------------------------------------------

; Chapters
.alias CHAPTER_1			$01			; Ragnar's chapter
.alias CHAPTER_2			$02			; Alena's chapter
.alias CHAPTER_3			$03			; Taloon's chapter
.alias CHAPTER_4			$04			; Sisters' chapter
.alias CHAPTER_5			$05			; Hero's chapter

; Party Member IDs
.alias CHAR_HERO			$00			; Hero (Chapter 5 protagonist)
.alias CHAR_RAGNAR			$01			; Ragnar McRyan
.alias CHAR_ALENA			$02			; Princess Alena
.alias CHAR_CRISTO			$03			; Cristo
.alias CHAR_BREY			$04			; Brey
.alias CHAR_TALOON			$05			; Taloon
.alias CHAR_NARA			$06			; Nara
.alias CHAR_MARA			$07			; Mara

; Maximum Values
.alias MAX_PARTY_SIZE		$04			; Max active party members
.alias MAX_WAGON_SIZE		$08			; Max total party members
.alias MAX_LEVEL			$63			; Level 99
.alias MAX_HP				$03E7		; 999 HP
.alias MAX_MP				$03E7		; 999 MP
.alias MAX_STAT				$FF			; 255 for most stats
.alias MAX_GOLD				$00FFFFFF	; Maximum gold (16,777,215)
.alias MAX_EXP				$00FFFFFF	; Maximum experience

; Item Counts
.alias TOTAL_ITEMS			$00			; TODO: Determine actual count
.alias TOTAL_WEAPONS		$00			; TODO: Determine actual count
.alias TOTAL_ARMOR			$00			; TODO: Determine actual count
.alias TOTAL_MONSTERS		$00			; TODO: Determine actual count
.alias TOTAL_SPELLS			$00			; TODO: Determine actual count

; ----------------------------------------------------------------------------
; Button Constants
; ----------------------------------------------------------------------------

.alias BTN_RIGHT			$01
.alias BTN_LEFT				$02
.alias BTN_DOWN				$04
.alias BTN_UP				$08
.alias BTN_START			$10
.alias BTN_SELECT			$20
.alias BTN_B				$40
.alias BTN_A				$80

; ----------------------------------------------------------------------------
; Text Control Codes
; ----------------------------------------------------------------------------

.alias TEXT_SPACE			$00
.alias TEXT_WAIT			$F0
.alias TEXT_LINE			$F1
.alias TEXT_NAME			$F2
.alias TEXT_ITEM			$F3
.alias TEXT_NUM				$F4
.alias TEXT_PAUSE			$FE
.alias TEXT_END				$FF

; ----------------------------------------------------------------------------
; PPU Constants
; ----------------------------------------------------------------------------

.alias NAMETABLE_0			$2000
.alias NAMETABLE_1			$2400
.alias NAMETABLE_2			$2800
.alias NAMETABLE_3			$2C00
.alias ATTRTABLE_0			$23C0
.alias ATTRTABLE_1			$27C0
.alias ATTRTABLE_2			$2BC0
.alias ATTRTABLE_3			$2FC0
.alias PALETTE_BG			$3F00
.alias PALETTE_SPR			$3F10

; ============================================================================
; End of defines.asm
; ============================================================================
