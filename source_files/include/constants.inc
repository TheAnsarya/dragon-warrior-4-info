; ============================================================================
; Dragon Warrior IV - Constants
; ============================================================================
; System constants and game-specific defines
; ============================================================================

; iNES Header Constants
MAPPER_MMC3		= 4		; MMC3 mapper number
PRG_BANKS		= 32		; 32 × 16KB = 512KB PRG ROM
CHR_BANKS		= 0		; CHR-RAM (no CHR ROM)

; MMC3 Register Addresses ($8000-$9FFF)
MMC3_BANK_SELECT	= $8000		; Bank select register
MMC3_BANK_DATA		= $8001		; Bank data register
MMC3_MIRRORING		= $a000		; Mirroring control
MMC3_PRG_RAM_PROTECT	= $a001		; PRG RAM protect
MMC3_IRQ_LATCH		= $c000		; IRQ latch value
MMC3_IRQ_RELOAD		= $c001		; IRQ reload
MMC3_IRQ_DISABLE	= $e000		; IRQ disable
MMC3_IRQ_ENABLE		= $e001		; IRQ enable

; MMC3 Bank Selection Values
MMC3_SEL_CHR0		= $00		; 2KB CHR bank at $0000
MMC3_SEL_CHR1		= $01		; 2KB CHR bank at $0800
MMC3_SEL_CHR2		= $02		; 1KB CHR bank at $1000
MMC3_SEL_CHR3		= $03		; 1KB CHR bank at $1400
MMC3_SEL_CHR4		= $04		; 1KB CHR bank at $1800
MMC3_SEL_CHR5		= $05		; 1KB CHR bank at $1C00
MMC3_SEL_PRG0		= $06		; 8KB PRG bank at $8000 (or $C000)
MMC3_SEL_PRG1		= $07		; 8KB PRG bank at $A000

; PPU Constants
PPU_CTRL		= $2000
PPU_MASK		= $2001
PPU_STATUS		= $2002
PPU_OAM_ADDR		= $2003
PPU_OAM_DATA		= $2004
PPU_SCROLL		= $2005
PPU_ADDR		= $2006
PPU_DATA		= $2007
PPU_OAM_DMA		= $4014

; APU Constants
APU_PULSE1_CTRL		= $4000
APU_PULSE1_SWEEP	= $4001
APU_PULSE1_TIMER_LO	= $4002
APU_PULSE1_TIMER_HI	= $4003
APU_PULSE2_CTRL		= $4004
APU_PULSE2_SWEEP	= $4005
APU_PULSE2_TIMER_LO	= $4006
APU_PULSE2_TIMER_HI	= $4007
APU_TRIANGLE_CTRL	= $4008
APU_TRIANGLE_TIMER_LO	= $400a
APU_TRIANGLE_TIMER_HI	= $400b
APU_NOISE_CTRL		= $400c
APU_NOISE_PERIOD	= $400e
APU_NOISE_LENGTH	= $400f
APU_DMC_CTRL		= $4010
APU_DMC_LOAD		= $4011
APU_DMC_ADDR		= $4012
APU_DMC_LENGTH		= $4013
APU_STATUS		= $4015
APU_FRAME_COUNTER	= $4017

; Controller Constants
JOYPAD1			= $4016
JOYPAD2			= $4017

; Controller Button Masks
BTN_A			= %10000000
BTN_B			= %01000000
BTN_SELECT		= %00100000
BTN_START		= %00010000
BTN_UP			= %00001000
BTN_DOWN		= %00000100
BTN_LEFT		= %00000010
BTN_RIGHT		= %00000001

; Game Constants
MAX_PARTY_SIZE		= 8		; Maximum party members
MAX_INVENTORY		= 64		; Maximum inventory slots
MAX_LEVEL		= 99		; Maximum character level
NUM_CHAPTERS		= 5		; Number of chapters

; Character IDs
CHAR_SOLO		= 0		; Hero
CHAR_RAGNAR		= 1		; Ragnar (Chapter 1)
CHAR_ALENA		= 2		; Alena (Chapter 2)
CHAR_CRISTO		= 3		; Cristo (Chapter 2)
CHAR_BREY		= 4		; Brey (Chapter 2)
CHAR_TALOON		= 5		; Taloon (Chapter 3)
CHAR_NARA		= 6		; Nara (Chapter 4)
CHAR_MARA		= 7		; Mara (Chapter 4)

; Element Types
ELEM_NONE		= 0
ELEM_FIRE		= 1
ELEM_ICE		= 2
ELEM_WIND		= 3
ELEM_LIGHTNING		= 4
ELEM_BANG		= 5
ELEM_DEFEAT		= 6
ELEM_SLEEP		= 7
ELEM_STOPSPELL		= 8

; Item Types
ITEM_WEAPON		= 0
ITEM_ARMOR		= 1
ITEM_SHIELD		= 2
ITEM_HELMET		= 3
ITEM_ACCESSORY		= 4
ITEM_CONSUMABLE		= 5
ITEM_KEY_ITEM		= 6
ITEM_TOOL		= 7

; Battle Constants
BATTLE_PARTY_MAX	= 4		; Maximum active party in battle
BATTLE_ENEMY_MAX	= 8		; Maximum enemies in battle

; Text Control Codes
TEXT_WAIT		= $f0		; Wait for button press
TEXT_LINE		= $f1		; New line
TEXT_NAME		= $f2		; Insert character name
TEXT_ITEM		= $f3		; Insert item name
TEXT_NUM		= $f4		; Insert number
TEXT_PAUSE		= $fe		; Brief pause
TEXT_END		= $ff		; End of text

; ============================================================================
; End of constants.inc
; ============================================================================
