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

ROM_MAPPER = $04			; MMC3 Mapper
PRG_BANK_COUNT = $10			; 16 PRG banks (256KB)
CHR_BANK_COUNT = $10			; 16 CHR banks (128KB)
PRG_BANK_SIZE = $4000		; 16KB per PRG bank
CHR_BANK_SIZE = $2000		; 8KB per CHR bank

; ----------------------------------------------------------------------------
; CPU Memory Map
; ----------------------------------------------------------------------------

RAM_START = $0000		; Internal RAM start
RAM_SIZE = $0800		; 2KB internal RAM
STACK_TOP = $01ff		; Stack top

PPU_CTRL = $2000		; PPU Control Register 1
PPU_MASK = $2001		; PPU Control Register 2
PPU_STATUS = $2002		; PPU Status Register
OAM_ADDR = $2003		; OAM Address
OAM_DATA = $2004		; OAM Data
PPU_SCROLL = $2005		; PPU Scroll Position
PPU_ADDR = $2006		; PPU Address
PPU_DATA = $2007		; PPU Data

APU_PULSE1_CTRL = $4000		; APU Pulse 1 Control
APU_PULSE1_SWEEP = $4001		; APU Pulse 1 Sweep
APU_PULSE1_LO = $4002		; APU Pulse 1 Timer Low
APU_PULSE1_HI = $4003		; APU Pulse 1 Timer High
APU_PULSE2_CTRL = $4004		; APU Pulse 2 Control
APU_PULSE2_SWEEP = $4005		; APU Pulse 2 Sweep
APU_PULSE2_LO = $4006		; APU Pulse 2 Timer Low
APU_PULSE2_HI = $4007		; APU Pulse 2 Timer High
APU_TRI_CTRL = $4008		; APU Triangle Control
APU_TRI_LO = $400a		; APU Triangle Timer Low
APU_TRI_HI = $400b		; APU Triangle Timer High
APU_NOISE_CTRL = $400c		; APU Noise Control
APU_NOISE_LO = $400e		; APU Noise Timer
APU_NOISE_HI = $400f		; APU Noise Length
APU_DMC_CTRL = $4010		; APU DMC Control
APU_DMC_DIRECT = $4011		; APU DMC Direct Load
APU_DMC_ADDR = $4012		; APU DMC Address
APU_DMC_LEN = $4013		; APU DMC Length
OAM_DMA = $4014		; OAM DMA Register
APU_STATUS = $4015		; APU Status
JOYPAD1 = $4016		; Joypad 1
JOYPAD2 = $4017		; Joypad 2 / APU Frame Counter

SRAM_START = $6000		; Battery-backed SRAM start
SRAM_SIZE = $2000		; 8KB SRAM

PRG_ROM_START = $8000		; PRG ROM start
PRG_BANK_0 = $8000		; Switchable bank 0
PRG_BANK_1 = $a000		; Switchable bank 1
PRG_BANK_2 = $c000		; Switchable bank 2 (often fixed)
PRG_BANK_3 = $e000		; Fixed bank (last bank)

; ----------------------------------------------------------------------------
; MMC3 Mapper Registers
; ----------------------------------------------------------------------------

MMC3_BANK_SELECT = $8000		; Bank select register
MMC3_BANK_DATA = $8001		; Bank data register
MMC3_MIRRORING = $a000		; Mirroring register
MMC3_PRG_RAM = $a001		; PRG RAM protect register
MMC3_IRQ_LATCH = $c000		; IRQ latch
MMC3_IRQ_RELOAD = $c001		; IRQ reload
MMC3_IRQ_DISABLE = $e000		; IRQ disable
MMC3_IRQ_ENABLE = $e001		; IRQ enable

; ----------------------------------------------------------------------------
; Game Constants
; ----------------------------------------------------------------------------

; Chapters
CHAPTER_1 = $01			; Ragnar's chapter
CHAPTER_2 = $02			; Alena's chapter
CHAPTER_3 = $03			; Taloon's chapter
CHAPTER_4 = $04			; Sisters' chapter
CHAPTER_5 = $05			; Hero's chapter

; Party Member IDs
CHAR_HERO = $00			; Hero (Chapter 5 protagonist)
CHAR_RAGNAR = $01			; Ragnar McRyan
CHAR_ALENA = $02			; Princess Alena
CHAR_CRISTO = $03			; Cristo
CHAR_BREY = $04			; Brey
CHAR_TALOON = $05			; Taloon
CHAR_NARA = $06			; Nara
CHAR_MARA = $07			; Mara

; Maximum Values
MAX_PARTY_SIZE = $04			; Max active party members
MAX_WAGON_SIZE = $08			; Max total party members
MAX_LEVEL = $63			; Level 99
MAX_HP = $03e7		; 999 HP
MAX_MP = $03e7		; 999 MP
MAX_STAT = $ff			; 255 for most stats
MAX_GOLD = $00ffffff	; Maximum gold (16,777,215)
MAX_EXP = $00ffffff	; Maximum experience

; Item Counts
TOTAL_ITEMS = $00			; TODO: Determine actual count
TOTAL_WEAPONS = $00			; TODO: Determine actual count
TOTAL_ARMOR = $00			; TODO: Determine actual count
TOTAL_MONSTERS = $00			; TODO: Determine actual count
TOTAL_SPELLS = $00			; TODO: Determine actual count

; ----------------------------------------------------------------------------
; Button Constants
; ----------------------------------------------------------------------------

BTN_RIGHT = $01
BTN_LEFT = $02
BTN_DOWN = $04
BTN_UP = $08
BTN_START = $10
BTN_SELECT = $20
BTN_B = $40
BTN_A = $80

; ----------------------------------------------------------------------------
; Text Control Codes
; ----------------------------------------------------------------------------

TEXT_SPACE = $00
TEXT_WAIT = $f0
TEXT_LINE = $f1
TEXT_NAME = $f2
TEXT_ITEM = $f3
TEXT_NUM = $f4
TEXT_PAUSE = $fe
TEXT_END = $ff

; ----------------------------------------------------------------------------
; PPU Constants
; ----------------------------------------------------------------------------

NAMETABLE_0 = $2000
NAMETABLE_1 = $2400
NAMETABLE_2 = $2800
NAMETABLE_3 = $2c00
ATTRTABLE_0 = $23c0
ATTRTABLE_1 = $27c0
ATTRTABLE_2 = $2bc0
ATTRTABLE_3 = $2fc0
PALETTE_BG = $3f00
PALETTE_SPR = $3f10

; ============================================================================
; End of defines.asm
; ============================================================================

