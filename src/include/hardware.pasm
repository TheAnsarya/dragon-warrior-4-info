; ============================================================================
; Dragon Warrior IV - Hardware Constants
; 🌷 Flower Toolchain
; ============================================================================
; NES/Famicom hardware register definitions
; ============================================================================

; ============================================================================
; PPU (Picture Processing Unit) Registers - $2000-$2007
; ============================================================================

; PPU Control Register ($2000) - Write Only
; Controls NMI, sprite size, background/sprite pattern tables, VRAM increment
PPU_CTRL			= $2000
; Bit 7: Generate NMI at start of VBlank (0=off, 1=on)
; Bit 6: PPU master/slave (unused on NES)
; Bit 5: Sprite size (0=8x8, 1=8x16)
; Bit 4: Background pattern table (0=$0000, 1=$1000)
; Bit 3: Sprite pattern table (0=$0000, 1=$1000, ignored if 8x16)
; Bit 2: VRAM address increment (0=+1 across, 1=+32 down)
; Bits 0-1: Base nametable address (0=$2000, 1=$2400, 2=$2800, 3=$2C00)
PPUCTRL_NMI_ENABLE		= %10000000
PPUCTRL_SPRITE_8X16		= %00100000
PPUCTRL_BG_1000			= %00010000
PPUCTRL_SPR_1000		= %00001000
PPUCTRL_VRAM_DOWN		= %00000100

; PPU Mask Register ($2001) - Write Only
; Controls rendering of sprites/background, color emphasis
PPU_MASK			= $2001
; Bit 7: Emphasize blue
; Bit 6: Emphasize green
; Bit 5: Emphasize red
; Bit 4: Show sprites
; Bit 3: Show background
; Bit 2: Show sprites in leftmost 8 pixels
; Bit 1: Show background in leftmost 8 pixels
; Bit 0: Grayscale (0=normal, 1=grayscale)
PPUMASK_EMPH_BLUE		= %10000000
PPUMASK_EMPH_GREEN		= %01000000
PPUMASK_EMPH_RED		= %00100000
PPUMASK_SHOW_SPR		= %00010000
PPUMASK_SHOW_BG			= %00001000
PPUMASK_SHOW_SPR_LEFT		= %00000100
PPUMASK_SHOW_BG_LEFT		= %00000010
PPUMASK_GRAYSCALE		= %00000001
PPUMASK_SHOW_ALL		= %00011110	; Sprites + BG visible

; PPU Status Register ($2002) - Read Only
; Contains VBlank flag, sprite 0 hit, sprite overflow
PPU_STATUS			= $2002
; Bit 7: VBlank flag (cleared on read)
; Bit 6: Sprite 0 hit
; Bit 5: Sprite overflow
PPUSTATUS_VBLANK		= %10000000
PPUSTATUS_SPR0_HIT		= %01000000
PPUSTATUS_SPR_OVERFLOW		= %00100000

; OAM Address Register ($2003) - Write Only
; Sets the address in OAM to write to
PPU_OAM_ADDR			= $2003

; OAM Data Register ($2004) - Read/Write
; Read/write OAM data at current OAM address
PPU_OAM_DATA			= $2004

; PPU Scroll Register ($2005) - Write Only (write twice)
; First write: X scroll, Second write: Y scroll
PPU_SCROLL			= $2005

; PPU Address Register ($2006) - Write Only (write twice)
; First write: High byte, Second write: Low byte
PPU_ADDR			= $2006

; PPU Data Register ($2007) - Read/Write
; Read/write VRAM data at current VRAM address
PPU_DATA			= $2007

; OAM DMA Register ($4014) - Write Only
; Writing $XX copies 256 bytes from $XX00-$XXFF to OAM
PPU_OAM_DMA			= $4014

; ============================================================================
; APU (Audio Processing Unit) Registers - $4000-$4017
; ============================================================================

; Pulse 1 Channel ($4000-$4003)
APU_PULSE1_CTRL			= $4000		; Duty, envelope, length counter halt
APU_PULSE1_SWEEP		= $4001		; Sweep control
APU_PULSE1_TIMER_LO		= $4002		; Timer low byte
APU_PULSE1_TIMER_HI		= $4003		; Length counter, timer high

; Pulse 2 Channel ($4004-$4007)
APU_PULSE2_CTRL			= $4004
APU_PULSE2_SWEEP		= $4005
APU_PULSE2_TIMER_LO		= $4006
APU_PULSE2_TIMER_HI		= $4007

; Triangle Channel ($4008-$400B)
APU_TRIANGLE_CTRL		= $4008		; Linear counter
APU_TRIANGLE_UNUSED		= $4009		; Unused
APU_TRIANGLE_TIMER_LO		= $400a		; Timer low byte
APU_TRIANGLE_TIMER_HI		= $400b		; Length counter, timer high

; Noise Channel ($400C-$400F)
APU_NOISE_CTRL			= $400c		; Envelope, length counter halt
APU_NOISE_UNUSED		= $400d		; Unused
APU_NOISE_PERIOD		= $400e		; Mode, period index
APU_NOISE_LENGTH		= $400f		; Length counter load

; DMC Channel ($4010-$4013)
APU_DMC_CTRL			= $4010		; IRQ enable, loop, frequency
APU_DMC_LOAD			= $4011		; Direct load
APU_DMC_ADDR			= $4012		; Sample address
APU_DMC_LENGTH			= $4013		; Sample length

; APU Status Register ($4015) - Read/Write
APU_STATUS			= $4015
; Write: Enable channels (bits 0-4 = Pulse1, Pulse2, Triangle, Noise, DMC)
; Read: Channel status and interrupt flags
APUSTATUS_DMC			= %00010000
APUSTATUS_NOISE			= %00001000
APUSTATUS_TRIANGLE		= %00000100
APUSTATUS_PULSE2		= %00000010
APUSTATUS_PULSE1		= %00000001

; APU Frame Counter ($4017) - Write Only
APU_FRAME_COUNTER		= $4017
; Bit 7: Sequencer mode (0=4-step, 1=5-step)
; Bit 6: Interrupt inhibit flag

; ============================================================================
; Controller Registers - $4016-$4017
; ============================================================================

; Controller 1 ($4016) - Read/Write
; Write: Strobe bit (bit 0) - write 1 then 0 to latch controller state
; Read: Serial controller data (bit 0)
JOYPAD1				= $4016

; Controller 2 ($4017) - Read Only
; Read: Serial controller data (bit 0)
; Note: Shares address with APU Frame Counter (write only)
JOYPAD2				= $4017

; Controller Button Masks (after reading all 8 bits)
BTN_A				= %10000000	; A button
BTN_B				= %01000000	; B button
BTN_SELECT			= %00100000	; Select button
BTN_START			= %00010000	; Start button
BTN_UP				= %00001000	; D-pad up
BTN_DOWN			= %00000100	; D-pad down
BTN_LEFT			= %00000010	; D-pad left
BTN_RIGHT			= %00000001	; D-pad right

; ============================================================================
; MMC3 Mapper Registers - $8000-$FFFF
; ============================================================================

; Bank Select Register ($8000) - Write Only
; Bits 0-2: Bank register to update
; Bit 6: PRG ROM bank mode (0=$8000 switchable, 1=$C000 switchable)
; Bit 7: CHR A12 inversion (0=normal, 1=inverted)
MMC3_BANK_SELECT		= $8000
MMC3_MODE_CHR_INVERT		= %10000000
MMC3_MODE_PRG_SWAP		= %01000000
MMC3_SEL_CHR_2K_0		= $00		; 2KB CHR bank at $0000 (or $1000)
MMC3_SEL_CHR_2K_1		= $01		; 2KB CHR bank at $0800 (or $1800)
MMC3_SEL_CHR_1K_0		= $02		; 1KB CHR bank at $1000 (or $0000)
MMC3_SEL_CHR_1K_1		= $03		; 1KB CHR bank at $1400 (or $0400)
MMC3_SEL_CHR_1K_2		= $04		; 1KB CHR bank at $1800 (or $0800)
MMC3_SEL_CHR_1K_3		= $05		; 1KB CHR bank at $1C00 (or $0C00)
MMC3_SEL_PRG_8K_0		= $06		; 8KB PRG bank at $8000 (or $C000)
MMC3_SEL_PRG_8K_1		= $07		; 8KB PRG bank at $A000

; Bank Data Register ($8001) - Write Only
; Value to load into bank register selected by $8000
MMC3_BANK_DATA			= $8001

; Mirroring Register ($A000) - Write Only
; Bit 0: Nametable mirroring (0=vertical, 1=horizontal)
MMC3_MIRRORING			= $a000
MMC3_MIRROR_VERTICAL		= $00
MMC3_MIRROR_HORIZONTAL		= $01

; PRG RAM Protect Register ($A001) - Write Only
; Bit 7: PRG RAM chip enable (0=disabled, 1=enabled)
; Bit 6: Write protection (0=allow writes, 1=read only)
MMC3_PRG_RAM_PROTECT		= $a001
MMC3_RAM_ENABLE			= %10000000
MMC3_RAM_WRITE_PROTECT		= %01000000

; IRQ Latch Register ($C000) - Write Only
; Value to be copied to IRQ counter at next reload
MMC3_IRQ_LATCH			= $c000

; IRQ Reload Register ($C001) - Write Only
; Any write reloads IRQ counter from latch
MMC3_IRQ_RELOAD			= $c001

; IRQ Disable Register ($E000) - Write Only
; Any write disables scanline IRQ and clears pending IRQ flag
MMC3_IRQ_DISABLE		= $e000

; IRQ Enable Register ($E001) - Write Only
; Any write enables scanline IRQ
MMC3_IRQ_ENABLE			= $e001

; ============================================================================
; Memory Map Constants
; ============================================================================

; RAM Areas
RAM_START			= $0000		; Zero page start
RAM_STACK			= $0100		; Stack page start
RAM_OAM				= $0200		; OAM buffer (256 bytes)
RAM_GENERAL			= $0300		; General purpose RAM
RAM_END				= $0800		; End of internal RAM

; PRG RAM (WRAM) - Battery backed
WRAM_START			= $6000		; 8KB PRG RAM start
WRAM_END			= $8000		; PRG RAM end

; PRG ROM Areas (MMC3 banking)
PRG_ROM_8000			= $8000		; Switchable 8KB bank
PRG_ROM_A000			= $a000		; Switchable 8KB bank
PRG_ROM_C000			= $c000		; Fixed or switchable 8KB bank
PRG_ROM_E000			= $e000		; Fixed 8KB bank (vectors)

; PPU Memory Map
PPU_PATTERN_0			= $0000		; Pattern table 0 (CHR)
PPU_PATTERN_1			= $1000		; Pattern table 1 (CHR)
PPU_NAMETABLE_0			= $2000		; Nametable 0
PPU_NAMETABLE_1			= $2400		; Nametable 1
PPU_NAMETABLE_2			= $2800		; Nametable 2 (mirror)
PPU_NAMETABLE_3			= $2c00		; Nametable 3 (mirror)
PPU_PALETTE			= $3f00		; Palette RAM

; ============================================================================
; End of Hardware Constants
; ============================================================================
