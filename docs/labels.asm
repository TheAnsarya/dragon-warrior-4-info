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
; TODO: Addresses to investigate
; ============================================
; - Find text rendering routine
; - Find text pointer tables
; - Find item stat tables
; - Find spell effect tables
; - Find monster data tables
; - Find map data
; - Find music/sound data
