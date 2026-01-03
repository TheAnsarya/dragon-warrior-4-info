; ============================================================================
; Dragon Warrior IV - RAM Map
; ============================================================================
; RAM address definitions from GameInfo wiki documentation
; Source: Dragon Warrior 4 (NES) Wiki - RAM Map.wikitext
; ============================================================================

; ============================================================================
; Zero Page ($0000-$00FF)
; ============================================================================
; These addresses are used for frequently accessed variables and pointers
; due to faster access times on 6502

; System Variables ($00-$1F) - Partially verified from Cowness
zp_temp0		= $00		; Temporary variable 0
zp_temp1		= $01		; Temporary variable 1
zp_temp2		= $02		; Temporary variable 2
zp_temp3		= $03		; Temporary variable 3
zp_temp4		= $04		; Temporary variable 4
zp_temp5		= $05		; Temporary variable 5
zp_temp6		= $06		; Temporary variable 6
zp_temp7		= $07		; Temporary variable 7

zp_ptr_lo		= $10		; General purpose pointer low
zp_ptr_hi		= $11		; General purpose pointer high
zp_rng_seed_lo		= $12		; RNG seed low byte (verified: Cowness)
zp_rng_seed_hi		= $13		; RNG seed high byte (verified: Cowness)
zp_rng_temp		= $16		; RNG temporary (verified: Cowness)
zp_encounter_rate	= $18		; Encounter rate (verified: Cowness)
zp_random_seed		= $19		; Random number seed
zp_controller1		= $1a		; Controller 1 current state
zp_controller1_prev	= $1b		; Controller 1 previous state
zp_controller1_new	= $1c		; Controller 1 newly pressed buttons
zp_controller2		= $1d		; Controller 2 current state

; PPU State ($20-$2F) - Estimated, needs verification
zp_ppu_ctrl_shadow	= $20		; Shadow copy of PPU_CTRL
zp_ppu_mask_shadow	= $21		; Shadow copy of PPU_MASK
zp_scroll_x		= $22		; Current X scroll position
zp_scroll_y		= $23		; Current Y scroll position
zp_nametable		= $24		; Current nametable (0-3)
zp_ppu_update_flag	= $25		; Flag indicating PPU needs update

; Bank State ($30-$3F) - Estimated, needs verification
zp_current_prg_bank	= $30		; Currently loaded PRG bank
zp_current_chr_bank0	= $31		; Current CHR bank 0
zp_current_chr_bank1	= $32		; Current CHR bank 1
zp_prev_prg_bank	= $33		; Previous PRG bank (for returns)

; Game State Pointers ($40-$5F) - Estimated, needs verification
zp_game_mode		= $40		; Current game mode
zp_sub_mode		= $41		; Current sub-mode
zp_menu_state		= $42		; Menu state
zp_cursor_pos		= $43		; Current cursor position
zp_menu_selection	= $44		; Selected menu item
zp_dialog_ptr_lo	= $45		; Dialog text pointer low
zp_dialog_ptr_hi	= $46		; Dialog text pointer high

; ============================================================================
; System RAM - Verified from Wiki ($0063-$0064)
; ============================================================================
map_number		= $63		; Current map ID (0-72)
sub_map_number		= $64		; Current sub-map ID

; ============================================================================
; RNG State ($050C-$050D) - Verified from Cowness
; ============================================================================
rng_counter_compare	= $050c		; RNG counter compare value
rng_counter		= $050d		; RNG counter

; ============================================================================
; Stack ($0100-$01FF)
; ============================================================================
STACK_TOP		= $01ff		; Top of stack

; ============================================================================
; OAM Buffer ($0200-$02FF)
; ============================================================================
OAM_BUFFER		= $0200		; 256 bytes for sprite data
OAM_SPRITE0		= $0200		; First sprite (Y, tile, attr, X)
OAM_SPRITE63		= $02fc		; Last sprite

; ============================================================================
; PRG RAM / WRAM ($6000-$7FFF) - 8KB battery-backed
; ============================================================================
WRAM_START		= $6000
WRAM_SIZE		= $2000		; 8KB

; Save data locations (verified from Cowness)
save_data_current	= $6000		; Current save data start
save_file_1		= $62ef		; Save file 1 start
save_file_2		= $65df		; Save file 2 start
save_file_3		= $68cf		; Save file 3 start

; ============================================================================
; Party Member Data ($6001-$610E) - 30 bytes each
; ============================================================================
PARTY_MEMBER_SIZE	= 30		; Bytes per party member (0x1E)

; Party member base addresses
party_hero		= $6001		; Hero (Party Index $00)
party_cristo		= $601f		; Cristo (Party Index $01)
party_nara		= $603d		; Nara (Party Index $02)
party_mara		= $605b		; Mara (Party Index $03)
party_brey		= $6079		; Brey (Party Index $04)
party_taloon		= $6097		; Taloon (Party Index $05)
party_ragnar		= $60b5		; Ragnar (Party Index $06)
party_alena		= $60d3		; Alena (Party Index $07)
party_unused		= $60f1		; Unused slot (Party Index $08)

; Extra companions (6 bytes each)
extra_companion_1	= $610f		; Extra Companion #1 (Party Index $09)
extra_companion_2	= $6115		; Extra Companion #2 (Party Index $0A)

; ============================================================================
; Party Member Structure Offsets (30 bytes)
; ============================================================================
; Use: lda party_hero+PMEM_LEVEL,x where X=character offset

PMEM_STATUS		= $00		; Status flags (bit5=Poison, bit6=Paralyze, bit7=Alive)
PMEM_HP_LO		= $01		; Current HP (low byte)
PMEM_HP_HI		= $02		; Current HP (high byte)
PMEM_MP_LO		= $03		; Current MP (low byte)
PMEM_MP_HI		= $04		; Current MP (high byte)
PMEM_LEVEL		= $05		; Level
PMEM_STRENGTH		= $06		; Strength stat
PMEM_AGILITY		= $07		; Agility stat
PMEM_VITALITY		= $08		; Vitality stat
PMEM_INTELLIGENCE	= $09		; Intelligence stat
PMEM_LUCK		= $0a		; Luck stat
PMEM_UNKNOWN		= $0b		; Unknown byte
PMEM_MAXHP_LO		= $0c		; Maximum HP (low byte)
PMEM_MAXHP_HI		= $0d		; Maximum HP (high byte)
PMEM_MAXMP_LO		= $0e		; Maximum MP (low byte)
PMEM_MAXMP_HI		= $0f		; Maximum MP (high byte)
PMEM_EXP_LO		= $10		; Experience (low byte)
PMEM_EXP_MID		= $11		; Experience (middle byte)
PMEM_EXP_HI		= $12		; Experience (high byte)
PMEM_ITEM1		= $13		; Item slot 1 (bit7=equipped)
PMEM_ITEM2		= $14		; Item slot 2 (bit7=equipped)
PMEM_ITEM3		= $15		; Item slot 3 (bit7=equipped)
PMEM_ITEM4		= $16		; Item slot 4 (bit7=equipped)
PMEM_ITEM5		= $17		; Item slot 5 (bit7=equipped)
PMEM_ITEM6		= $18		; Item slot 6 (bit7=equipped)
PMEM_ITEM7		= $19		; Item slot 7 (bit7=equipped)
PMEM_ITEM8		= $1a		; Item slot 8 (bit7=equipped)
PMEM_BATTLE_SPELL1	= $1b		; Battle spells byte 1
PMEM_BATTLE_SPELL2	= $1c		; Battle spells byte 2
PMEM_WORLD_SPELLS	= $1d		; Overworld spells

; Status flag bits
STATUS_POISONED		= %00100000	; Bit 5 - Character is poisoned
STATUS_PARALYZED	= %01000000	; Bit 6 - Character is paralyzed
STATUS_ALIVE		= %10000000	; Bit 7 - Character is alive (1=alive, 0=dead)

; Item equipped flag
ITEM_EQUIPPED		= %10000000	; Bit 7 - Item is equipped

; ============================================================================
; Extra Companion Structure Offsets (6 bytes)
; ============================================================================
XCOMP_STATUS		= $00		; Status flags (same as party member)
XCOMP_HP_LO		= $01		; Current HP (low byte)
XCOMP_HP_HI		= $02		; Current HP (high byte)
XCOMP_MP_LO		= $03		; Current MP (low byte)
XCOMP_MP_HI		= $04		; Current MP (high byte)
XCOMP_WHO		= $05		; Which companion (see companion IDs)

; ============================================================================
; General Game State ($6157-$62ED)
; ============================================================================
party_gold_lo		= $6157		; Gold low byte
party_gold_mid		= $6158		; Gold middle byte
party_gold_hi		= $6159		; Gold high byte (24-bit total)
chapter_number		= $615a		; Current chapter (1-5)
battle_tactics		= $615b		; Current battle tactics setting

; Return spell locations (bitfields)
return_locations_1	= $6165		; Branca,Endor,Bonmalmo,Aneaux,Konenber,Mintos,Soretta,Keeleon
return_locations_2	= $6166		; Haville,Monbaraba,Santeem,Tempe,Stancia,Burland,Izmit,Gardenbur
return_locations_3	= $6167		; Rosaville,Riverton,DirePalace,Aktemto,Gottside,Zenithia,LastRefuge,Invalid

; Party order
party_order		= $616a		; Party member order (4 bytes)

; Treasure chest flags
treasure_flags		= $625d		; Treasure chest opened flags (27 bytes)

; Party members flag
party_members_flag	= $6292		; Party members joined flag?

; Casino
casino_coins_lo		= $62ad		; Casino coins (low byte)
casino_coins_mid	= $62ae		; Casino coins (middle byte)
casino_coins_hi		= $62af		; Casino coins (high byte, 24-bit)

; Chapter 3 - Taloon's shop inventory
taloon_boomerangs	= $62e7		; Lakanaba shop boomerang count
taloon_chain_sickles	= $62e8		; Lakanaba shop chain sickle count
taloon_swords_malice	= $62e9		; Lakanaba shop sword of malice count

; Time
day_night_counter	= $62ed		; Day/Night cycle counter

; ============================================================================
; Return Location Bits ($6165-$6167)
; ============================================================================
; Byte $6165
RET_BRANCA		= %00000001	; Bit 0
RET_ENDOR		= %00000010	; Bit 1
RET_BONMALMO		= %00000100	; Bit 2
RET_ANEAUX		= %00001000	; Bit 3
RET_KONENBER		= %00010000	; Bit 4
RET_MINTOS		= %00100000	; Bit 5
RET_SORETTA		= %01000000	; Bit 6
RET_KEELEON		= %10000000	; Bit 7

; Byte $6166
RET_HAVILLE		= %00000001	; Bit 0
RET_MONBARABA		= %00000010	; Bit 1
RET_SANTEEM		= %00000100	; Bit 2
RET_TEMPE		= %00001000	; Bit 3
RET_STANCIA		= %00010000	; Bit 4
RET_BURLAND		= %00100000	; Bit 5
RET_IZMIT		= %01000000	; Bit 6
RET_GARDENBUR		= %10000000	; Bit 7

; Byte $6167
RET_ROSAVILLE		= %00000001	; Bit 0
RET_RIVERTON		= %00000010	; Bit 1
RET_DIRE_PALACE		= %00000100	; Bit 2
RET_AKTEMTO		= %00001000	; Bit 3
RET_GOTTSIDE		= %00010000	; Bit 4
RET_ZENITHIA		= %00100000	; Bit 5
RET_LAST_REFUGE		= %01000000	; Bit 6
RET_INVALID		= %10000000	; Bit 7 (ocean - unused)

; ============================================================================
; Hero Battle Spells ($601C-$601E)
; ============================================================================
; Byte $601C (PMEM_BATTLE_SPELL1)
SPELL_EXPEL		= %00000001	; Bit 0
SPELL_HEALMORE		= %00000010	; Bit 1
SPELL_BLAZE		= %00000100	; Bit 2
SPELL_RETURN		= %00001000	; Bit 3
SPELL_SLEEPMORE		= %00010000	; Bit 4
SPELL_AWAKE		= %00100000	; Bit 5
SPELL_FIREBAL		= %01000000	; Bit 6
SPELL_HEALALL		= %10000000	; Bit 7

; Byte $601D (PMEM_BATTLE_SPELL2)
SPELL_IRONIZE		= %00000001	; Bit 0
SPELL_FENDSPELL		= %00000010	; Bit 1
SPELL_ZAP		= %00000100	; Bit 2
SPELL_TRANSFORM		= %00001000	; Bit 3
SPELL_BOOM		= %00010000	; Bit 4
SPELL_HEALUSALL		= %00100000	; Bit 5
SPELL_LIGHTNING		= %01000000	; Bit 6
SPELL_VIVIFY		= %10000000	; Bit 7

; Byte $601E bits 0-1 (PMEM_WORLD_SPELLS)
SPELL_THORDAIN		= %00000001	; Bit 0
SPELL_CHANCE		= %00000010	; Bit 1

; ============================================================================
; Hero Overworld Spells ($601E bits 2-7)
; ============================================================================
WSPELL_RETURN		= %00000100	; Bit 2
WSPELL_HEALMORE		= %00001000	; Bit 3
WSPELL_REPEL		= %00010000	; Bit 4
WSPELL_OUTSIDE		= %00100000	; Bit 5
WSPELL_HEALALL		= %01000000	; Bit 6
WSPELL_VIVIFY		= %10000000	; Bit 7

; ============================================================================
; Map/Tileset Data ($6EFE-$7800+)
; ============================================================================
tile_init_buffer	= $6efe		; Initialized to $FF (0x20 bytes)
smoothing_flags		= $6f20		; Wall tile smoothing flags (0x20 bytes)
tile_behaviors		= $6f40		; Tile behaviors (0x40 bytes, 32 tiles + roof)
tileset_tiles		= $7600		; Tile numbers for current tileset (0xC0 bytes)
tileset_attrs		= $76c0		; Attribute values for current tileset (0x40 bytes)
current_map_data	= $7800		; Map data buffer for current map

; Map tile format: RRRttttt
; ttttt (bits 0-4): Tile number 0-31
; RRR (bits 5-7): Roof number 0-7 (0 = no roof)

; ============================================================================
; Character/Companion IDs
; ============================================================================
CHAR_HERO		= $00
CHAR_CRISTO		= $01
CHAR_NARA		= $02
CHAR_MARA		= $03
CHAR_BREY		= $04
CHAR_TALOON		= $05
CHAR_RAGNAR		= $06
CHAR_ALENA		= $07

; Extra companion IDs (for XCOMP_WHO at offset +$05)
; These are the actual values stored in the companion's "Who" byte
COMP_HEALIE		= $c5		; Healie - Kind Healer (Ch. 1)
COMP_ORIN		= $c6		; Orin - Alchemist (Ch. 4)
COMP_LAURENT		= $c7		; Laurent - Troubadour (Ch. 3)
COMP_STROM		= $c8		; Strom - Guardsman (Ch. 3)
COMP_HECTOR		= $c9		; Hector - Young Man (Ch. 5)
COMP_PANON		= $ca		; Panon - Jester (Ch. 5)
COMP_LUCIA		= $cb		; Lucia - Zenithian (Ch. 5)
COMP_DORAN		= $cc		; Doran - Baby Dragon (Ch. 5)
; Values $CD-$D9 are debug/unused companion slots

; ============================================================================
; Battle Tactics Values (stored at $615B)
; ============================================================================
TACTIC_NORMAL		= $00		; Normal
TACTIC_SAVE_MP		= $01		; Save MP
TACTIC_OFFENSIVE	= $02		; Offensive
TACTIC_DEFENSIVE	= $03		; Defensive
TACTIC_TRY_OUT		= $04		; Try Out
TACTIC_USE_NO_MP	= $05		; Use no MP

; ============================================================================
; Chapter Values (stored at $615A) - Note: 0-indexed in RAM
; ============================================================================
CHAPTER_1		= $00		; Chapter 1 - Ragnar
CHAPTER_2		= $01		; Chapter 2 - Alena, Cristo, & Brey
CHAPTER_3		= $02		; Chapter 3 - Taloon
CHAPTER_4		= $03		; Chapter 4 - Mara & Nara
CHAPTER_5		= $04		; Chapter 5 - Hero

; ============================================================================
; Item Value Constants
; ============================================================================
ITEM_NONE		= $7f		; No item / empty slot
ITEM_EQUIPPED_MASK	= $80		; Bit mask for equipped flag

; ============================================================================
; End of ram_map.inc
; ============================================================================
