; Dragon Warrior IV (NES) - Disassembly Labels
; ============================================
; Format: LABEL = $ADDR ; Comment
; ROM offsets are file offsets (include +16 for iNES header)
; CPU addresses are runtime addresses ($8000-$FFFF mapped)
;
; ROM Info:
;   Mapper: MMC3 (iNES Mapper 4)
;   PRG-ROM: 512KB (32 x 16KB banks)
;   CHR-ROM: 0KB (CHR-RAM)
;   Header: 16 bytes (iNES)
;
; Bank calculation:
;   ROM offset = (bank * $4000) + $10 + (CPU_addr - $8000)
;   CPU addr $8000-$BFFF = switchable bank
;   CPU addr $C000-$FFFF = usually fixed to last bank

; ============================================
; TEXT DATA REGIONS
; ============================================

; Menu Text (Bank 22, $5B400-$5B4C0)
TEXT_MENU_START         = $5B400 ; "ERASE NAME", "Do you want to erase this quest?"
TEXT_MENU_COMMANDS      = $5B468 ; "ADVENTURE LOG", "FIGHT", "TACTICS", etc.
TEXT_MENU_BATTLE        = $5B480 ; "SPELL", "ITEM", "ATTACK", "PARRY"
TEXT_MENU_PARTY         = $5B4A8 ; "SEE", "SWITCH", "REMOVE", "ADD"
TEXT_MENU_END           = $5B4C0 ; End of menu text region

; Chapter Titles (Bank 27, $6E670-$6E700)
TEXT_CHAPTER_START      = $6E670 ; "End" marker
TEXT_CHAPTER_HEADER     = $6E67A ; "Chapter" text
TEXT_CHAPTER_1          = $6E686 ; "The Royal Soldiers"
TEXT_CHAPTER_2          = $6E69B ; "Princess Alena's Adventure"
TEXT_CHAPTER_3          = $6E6B8 ; "Taloon the Arms Merchant"
TEXT_CHAPTER_4          = $6E6D3 ; "The Sisters of Monbaraba"
TEXT_CHAPTER_5          = $6E6EE ; "The Chosen Ones"
TEXT_CHAPTER_END        = $6E700 ; End of chapter titles

; Casino/Poker Text (Bank 23, $5C000 region)
TEXT_POKER_START        = $5C2F6 ; Start of poker hand names
TEXT_POKER_ROYAL        = $5C2FC ; "Royal Flush" - wait, actually starts earlier
TEXT_POKER_5KIND        = $5C308 ; "5 of a Kind"
TEXT_POKER_STRFLUSH     = $5C314 ; "Straight Flush"
TEXT_POKER_4KIND        = $5C323 ; "4 of a Kind"
TEXT_POKER_FULLHOUSE    = $5C32F ; "Full House"
TEXT_POKER_FLUSH        = $5C33A ; "Flush"
TEXT_POKER_STRAIGHT     = $5C340 ; "Straight"
TEXT_POKER_3KIND        = $5C349 ; "3 of a Kind"
TEXT_POKER_2PAIRS       = $5C355 ; "2 Pairs"
TEXT_POKER_TOPSCORE     = $5C35D ; "Top Score of"
TEXT_POKER_DOUBLEUP     = $5C36A ; "Double Up"
TEXT_POKER_TOPTAKES     = $5C374 ; "Top Takes of"
TEXT_POKER_TOTALBETS    = $5C38B ; "Total Bets"
TEXT_POKER_TOTALTAKES   = $5C396 ; "Total Takes"
TEXT_POKER_TOPDOUBLE    = $5C3A2 ; "Top Score of Double Up"
TEXT_POKER_END          = $5C3B9 ; End of poker text

; Spell Names (Bank 18, $4A600 region)
TEXT_SPELL_RETURN       = $4A6F1 ; "Return"
TEXT_SPELL_OUTSIDE      = $4A698 ; "Outside"

; Item Names (Bank 18, $4AF00 region)
TEXT_ITEM_WINGWYVERN    = $4AFFA ; "Wing of Wyvern"

; ============================================
; TEXT FORMAT NOTES
; ============================================
; String terminator: $FF
; Line break: $FD
; Position control: $22 XX (2-byte code)
;   $22 $03 = position 3 (centered?)
;   $22 $04 = position 4
;   $22 $07 = position 7
;   $22 $09 = position 9
; Item name terminator (in tables): $40

; ============================================
; PRG-ROM BANK CONTENTS
; ============================================
; Bank  0 ($00010-$04010): Unknown
; Bank  1 ($04010-$08010): Unknown
; Bank  2 ($08010-$0C010): Unknown
; Bank  3 ($0C010-$10010): Unknown
; Bank  4 ($10010-$14010): Unknown
; Bank  5 ($14010-$18010): Mixed data, 76.6% text-like
; Bank  6 ($18010-$1C010): Unknown
; Bank  7 ($1C010-$20010): Mixed data, 64.6% text-like
; Bank  8 ($20010-$24010): Unknown
; Bank  9 ($24010-$28010): Unknown
; Bank 10 ($28010-$2C010): Unknown
; Bank 11 ($2C010-$30010): Unknown
; Bank 12 ($30010-$34010): Unknown, 62.7% text-like
; Bank 13 ($34010-$38010): Mixed data, 65.1% text-like
; Bank 14 ($38010-$3C010): Graphics/tilemap data, 80.0% text-like (false positive)
; Bank 15 ($3C010-$40010): Unknown
; Bank 16 ($40010-$44010): Unknown
; Bank 17 ($44010-$48010): Unknown
; Bank 18 ($48010-$4C010): Item/Spell names
; Bank 19 ($4C010-$50010): Unknown
; Bank 20 ($50010-$54010): Unknown
; Bank 21 ($54010-$58010): Unknown
; Bank 22 ($58010-$5C010): Menu text, save/load text
; Bank 23 ($5C010-$60010): Casino/mini-game text
; Bank 24 ($60010-$64010): Unknown, 64.3% text-like
; Bank 25 ($64010-$68010): Mixed data, 70.1% text-like
; Bank 26 ($68010-$6C010): Unknown
; Bank 27 ($6C010-$70010): Chapter titles, misc text
; Bank 28 ($70010-$74010): Unknown, 61.9% text-like
; Bank 29 ($74010-$78010): Unknown
; Bank 30 ($78010-$7C010): Unknown
; Bank 31 ($7C010-$80010): Fixed bank (vectors at $FFFA-$FFFF)

; ============================================
; INTERRUPT VECTORS (Bank 31)
; ============================================
; These are at CPU addresses $FFFA-$FFFF
; ROM offset = $7FFFA-$7FFFF
VEC_NMI                 = $7FFFA ; NMI vector (2 bytes)
VEC_RESET               = $7FFFC ; Reset vector (2 bytes)
VEC_IRQ                 = $7FFFE ; IRQ/BRK vector (2 bytes)

; ============================================
; COMMON 6502 OPCODES REFERENCE
; ============================================
; $A9 = LDA #imm
; $A5 = LDA zp
; $AD = LDA abs
; $BD = LDA abs,X
; $B9 = LDA abs,Y
; $8D = STA abs
; $85 = STA zp
; $9D = STA abs,X
; $99 = STA abs,Y
; $A2 = LDX #imm
; $A0 = LDY #imm
; $E8 = INX
; $C8 = INY
; $CA = DEX
; $88 = DEY
; $4C = JMP abs
; $20 = JSR abs
; $60 = RTS
; $40 = RTI
; $D0 = BNE rel
; $F0 = BEQ rel
; $90 = BCC rel
; $B0 = BCS rel
; $C9 = CMP #imm
; $E0 = CPX #imm
; $C0 = CPY #imm

; ============================================
; CPU ADDRESS LABELS - RAM
; ============================================
; Zero Page ($00-$FF)
zp_10                   = $10   ; Pointer low (used by text routines)
zp_11                   = $11   ; Pointer high
zp_1F                   = $1F   ; Flags (bit 7=disable NMI processing?)
zp_EE                   = $EE   ; Text data pointer low (Bank 22)
zp_EF                   = $EF   ; Text data pointer high
zp_F5                   = $F5   ; Text flags
zp_F6                   = $F6   ; Text compare value
zp_F7                   = $F7   ; Text temp
zp_F8                   = $F8   ; Current character being processed

; Sprite/OAM RAM ($0200-$02FF)
OAM_BUFFER              = $0200 ; OAM buffer for DMA

; PPU Transfer Buffer ($0300-$03FF)
PPU_BUFFER              = $0300 ; NMI PPU transfer buffer
PPU_BUFFER_ADDR         = $0300 ; PPU address high byte
; Format: [CTRL|LEN] [ADDR_HI] [ADDR_LO] [DATA...]
; If byte 0 bit 7 set: extended format
; Byte 0 bits 0-5: length
; Byte 0 bit 6: vertical increment flag

; System Variables ($0500-$05FF)
mmc_bank_select         = $0500 ; MMC1 PRG bank select shadow
mmc_bank_data           = $0501 ; MMC1 PRG bank data shadow
nmi_jmp                 = $0502 ; NMI handler: JMP opcode ($4C)
nmi_handler_lo          = $0503 ; NMI handler: address low
nmi_handler_hi          = $0504 ; NMI handler: address high
ppuctrl_shadow          = $0505 ; PPUCTRL shadow
ppumask_shadow          = $0506 ; PPUMASK shadow
current_bank            = $0507 ; Currently switched bank
scroll_x                = $0508 ; PPU scroll X
scroll_y                = $0509 ; PPU scroll Y
ppu_transfer_flag       = $050A ; PPU transfer state
ppu_transfer_count      = $050B ; Number of PPU transfers pending
frame_counter           = $050C ; Frame counter (incremented in NMI)
game_state              = $0519 ; Game state flag
scroll_index            = $051A ; Index for scroll table

; Text Variables ($03D0-$03DF estimated)
text_ppu_addr           = $03D4 ; Current PPU address for text
text_line_counter       = $03D9 ; Line/position counter

; Text State ($07B4)
text_flags              = $07B4 ; Text rendering flags

; ============================================
; CPU ADDRESS LABELS - FIXED BANK ($C000-$FFFF)
; ============================================
; Jump Table at $C001 (21 entries)
JT_E577                 = $C001 ; JMP $E577
JT_E54B                 = $C004 ; JMP $E54B
JT_E58D                 = $C007 ; JMP $E58D
JT_E5A3                 = $C00A ; JMP $E5A3
JT_E5B9                 = $C00D ; JMP $E5B9
JT_E5CF                 = $C010 ; JMP $E5CF
JT_E5E5                 = $C013 ; JMP $E5E5
JT_E561                 = $C016 ; JMP $E561
JT_E687                 = $C019 ; JMP $E687
JT_F08A                 = $C01C ; JMP $F08A
JT_EF5B                 = $C01F ; JMP $EF5B
JT_F057                 = $C022 ; JMP $F057
JT_F05E                 = $C025 ; JMP $F05E
JT_EED5                 = $C028 ; JMP $EED5
JT_F0B4                 = $C02B ; JMP $F0B4
JT_E5FB                 = $C02E ; JMP $E5FB
JT_E617                 = $C031 ; JMP $E617
JT_E62D                 = $C034 ; JMP $E62D
JT_E643                 = $C037 ; JMP $E643
JT_E659                 = $C03A ; JMP $E659

; Main Initialization
Main_Init               = $C03D ; Main init routine (after reset)

; MMC1 Bank Switching
Sub_C104                = $C104 ; Setup MMC1 registers
mmc1_write_ctrl         = $C118 ; Write to MMC1 control ($9FFF)
mmc1_write_chr0         = $C12F ; Write to MMC1 CHR bank 0 ($BFFF)
mmc1_write_prg          = $C146 ; Write to MMC1 PRG bank ($DFFF)

; NMI Handler
NMI_Handler             = $C15A ; NMI entry point (PHA/TXA/TYA/PHA...)

; PPU Transfer Routine (called from NMI)
PPU_Transfer            = $C222 ; Main PPU transfer dispatcher
PPU_BufferCopy          = $C243 ; Copy $0300 buffer to PPU
PPU_SetScroll           = $C2EA ; Set PPUCTRL/PPUMASK/SCROLL
OAM_DMA                 = $C303 ; Perform OAM DMA

; Scroll/Clear Table
Scroll_Table            = $C37B ; PPU address table for scrolling

; Bank call helper
Bank_Call               = $C38B ; Call routine in another bank
Bank_GetPtr             = $C3BA ; Get pointer from bank

; Wait routines
Wait_VBlank             = $FF74 ; Wait for VBlank

; Bank switch
Set_Bank                = $FF91 ; Switch to bank in A

; Reset Vector
Reset_Handler           = $FFD8 ; Reset vector target

; IRQ Handler  
IRQ_Handler             = $C408 ; IRQ entry point

; ============================================
; BANK 22 TEXT LABELS ($8000-$BFFF when switched)
; ============================================
; Text Control Code Handler
Text_CheckControlCode   = $8B11 ; Check if char is control code
Text_HandleFF           = $8B17 ; Handle $FF (END)
Text_HandleFE           = $8B1B ; Handle $FE (CTRL)
Text_HandleFD           = $8B1F ; Handle $FD (LINE)
Text_ProcessEnd         = $8B28 ; Process end of text
Text_HandleFECode       = $8B30 ; FE code processing
Text_NextLine           = $8B48 ; Move to next line
Text_SetEndState        = $8B63 ; Set end-of-text state

; Text Data (CPU addresses when Bank 22 is loaded)
Menu_Text               = $B3F0 ; Menu text data (ROM 0x5B400)

; ============================================
; PPU REGISTERS
; ============================================
PPUCTRL                 = $2000 ; PPU Control Register 1
PPUMASK                 = $2001 ; PPU Control Register 2
PPUSTATUS               = $2002 ; PPU Status Register
OAMADDR                 = $2003 ; OAM Address
OAMDATA                 = $2004 ; OAM Data
PPUSCROLL               = $2005 ; PPU Scroll Position
PPUADDR                 = $2006 ; PPU Address
PPUDATA                 = $2007 ; PPU Data
OAMDMA                  = $4014 ; OAM DMA Register

; ============================================
; TODO: Addresses to investigate
; ============================================
; - Find text pointer tables (lookup by message ID)
; - Disassemble text rendering loop in switchable banks
; - Find item stat tables
; - Find spell effect tables
; - Find monster data tables
; - Find map data
; - Find music/sound data
