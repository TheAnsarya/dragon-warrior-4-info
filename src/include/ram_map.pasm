; ============================================================================
; Dragon Warrior IV - RAM Memory Map
; 🌷 Flower Toolchain
; ============================================================================
; Complete RAM address definitions from disassembly and wiki research
; ============================================================================

; ============================================================================
; Zero Page ($0000-$00FF) - Fast Access Memory
; ============================================================================
; The 6502 zero page allows faster addressing modes and smaller opcodes.
; Critical game state and frequently used variables are stored here.
; ============================================================================

; -----------------------------------------------------------------------------
; Temporary Variables ($00-$0F) - Scratch Space
; -----------------------------------------------------------------------------
; These are used as temporary storage during calculations.
; Values are not preserved across subroutine calls.
zp_temp0			= $00		; Temp byte 0
zp_temp1			= $01		; Temp byte 1
zp_temp2			= $02		; Temp byte 2
zp_temp3			= $03		; Temp byte 3
zp_temp4			= $04		; Temp byte 4
zp_temp5			= $05		; Temp byte 5
zp_temp6			= $06		; Temp byte 6
zp_temp7			= $07		; Temp byte 7
zp_temp8			= $08		; Temp byte 8
zp_temp9			= $09		; Temp byte 9
zp_temp_a			= $0a		; Temp byte A
zp_temp_b			= $0b		; Temp byte B
zp_temp_c			= $0c		; Temp byte C
zp_temp_d			= $0d		; Temp byte D
zp_temp_e			= $0e		; Temp byte E
zp_temp_f			= $0f		; Temp byte F

; -----------------------------------------------------------------------------
; Pointers ($10-$1F) - Address Pointers
; -----------------------------------------------------------------------------
; 16-bit pointers for indirect addressing
zp_ptr0_lo			= $10		; Pointer 0 low byte
zp_ptr0_hi			= $11		; Pointer 0 high byte
zp_ptr1_lo			= $12		; Pointer 1 low byte
zp_ptr1_hi			= $13		; Pointer 1 high byte
zp_ptr2_lo			= $14		; Pointer 2 low byte
zp_ptr2_hi			= $15		; Pointer 2 high byte
zp_ptr3_lo			= $16		; Pointer 3 low byte
zp_ptr3_hi			= $17		; Pointer 3 high byte

; Commonly used pointer aliases
zp_text_ptr_lo			= $10		; Dialog text pointer
zp_text_ptr_hi			= $11
zp_data_ptr_lo			= $12		; General data pointer
zp_data_ptr_hi			= $13
zp_map_ptr_lo			= $14		; Map data pointer
zp_map_ptr_hi			= $15

; -----------------------------------------------------------------------------
; RNG (Random Number Generator) ($18-$1B)
; -----------------------------------------------------------------------------
; Verified from Cowness disassembly notes
zp_rng_counter			= $18		; RNG counter
zp_rng_seed_lo			= $19		; RNG seed low byte
zp_rng_seed_hi			= $1a		; RNG seed high byte
zp_encounter_rng		= $1b		; Encounter rate modifier

; -----------------------------------------------------------------------------
; Controller State ($1C-$1F)
; -----------------------------------------------------------------------------
zp_joy1_state			= $1c		; Controller 1 current state
zp_joy1_prev			= $1d		; Controller 1 previous state
zp_joy1_pressed			= $1e		; Controller 1 newly pressed
zp_joy2_state			= $1f		; Controller 2 state

; -----------------------------------------------------------------------------
; PPU State ($20-$2F)
; -----------------------------------------------------------------------------
zp_ppu_ctrl_shadow		= $20		; Shadow of PPU_CTRL register
zp_ppu_mask_shadow		= $21		; Shadow of PPU_MASK register
zp_scroll_x			= $22		; X scroll position
zp_scroll_y			= $23		; Y scroll position
zp_nametable			= $24		; Current nametable (0-3)
zp_ppu_update_pending		= $25		; Flag: PPU update needed
zp_nmi_counter			= $26		; NMI frame counter
zp_lag_frame			= $27		; Lag frame flag

; -----------------------------------------------------------------------------
; Bank State ($30-$3F)
; -----------------------------------------------------------------------------
zp_current_prg_bank_8000	= $30		; PRG bank at $8000
zp_current_prg_bank_a000	= $31		; PRG bank at $A000
zp_current_chr_bank_0		= $32		; CHR bank at $0000
zp_current_chr_bank_1		= $33		; CHR bank at $0800
zp_current_chr_bank_2		= $34		; CHR bank at $1000
zp_current_chr_bank_3		= $35		; CHR bank at $1400
zp_current_chr_bank_4		= $36		; CHR bank at $1800
zp_current_chr_bank_5		= $37		; CHR bank at $1C00
zp_prev_prg_bank		= $38		; Previous PRG bank (for RTS)

; -----------------------------------------------------------------------------
; Game State ($40-$5F)
; -----------------------------------------------------------------------------
zp_game_mode			= $40		; Current game mode (title, field, battle, etc.)
zp_game_submode			= $41		; Sub-mode within current mode
zp_chapter_id			= $42		; Current chapter (1-5)
zp_party_size			= $43		; Number of active party members
zp_wagon_size			= $44		; Number of members in wagon
zp_cursor_x			= $45		; Menu cursor X position
zp_cursor_y			= $46		; Menu cursor Y position
zp_menu_state			= $47		; Menu state machine
zp_dialog_state			= $48		; Dialog state machine
zp_battle_phase			= $49		; Battle phase
zp_animation_frame		= $4a		; Current animation frame
zp_wait_timer			= $4b		; General wait timer

; -----------------------------------------------------------------------------
; Map State ($60-$7F)
; -----------------------------------------------------------------------------
; Verified from wiki: $63 = map number, $64 = sub-map
zp_player_x			= $60		; Player X position on map
zp_player_y			= $61		; Player Y position on map
zp_player_direction		= $62		; Player facing direction (0-3)
zp_map_id			= $63		; Current map ID (0-72) [VERIFIED]
zp_submap_id			= $64		; Current sub-map ID [VERIFIED]
zp_map_type			= $65		; Map type (overworld, town, etc.)
zp_encounter_zone		= $66		; Encounter zone ID
zp_steps_counter_lo		= $67		; Step counter low byte
zp_steps_counter_hi		= $68		; Step counter high byte
zp_warp_map_id			= $69		; Warp destination map
zp_warp_x			= $6a		; Warp destination X
zp_warp_y			= $6b		; Warp destination Y

; ============================================================================
; Stack Page ($0100-$01FF)
; ============================================================================
STACK_PAGE			= $0100
STACK_TOP			= $01ff

; ============================================================================
; OAM Buffer ($0200-$02FF) - Sprite Data
; ============================================================================
; 64 sprites × 4 bytes each = 256 bytes
OAM_BUFFER			= $0200
OAM_SPRITE_SIZE			= 4		; Bytes per sprite

; Sprite byte offsets
OAM_Y_OFFSET			= 0		; Y position
OAM_TILE_OFFSET			= 1		; Tile index
OAM_ATTR_OFFSET			= 2		; Attributes
OAM_X_OFFSET			= 3		; X position

; ============================================================================
; General RAM ($0300-$07FF)
; ============================================================================

; -----------------------------------------------------------------------------
; Battle RAM ($0300-$03FF)
; -----------------------------------------------------------------------------
battle_state			= $0300		; Battle state machine
battle_turn_order		= $0301		; Current turn in order array
battle_enemy_count		= $0302		; Number of enemies
battle_active_char		= $0303		; Currently acting character
battle_target			= $0304		; Current target
battle_action			= $0305		; Selected action
battle_damage_lo		= $0306		; Damage result low
battle_damage_hi		= $0307		; Damage result high
battle_message_id		= $0308		; Battle message to display

; Enemy battle data ($0310-$037F) - 8 enemies × 8 bytes
enemy_hp_lo			= $0310		; Enemy HP (low bytes, 8 enemies)
enemy_hp_hi			= $0318		; Enemy HP (high bytes, 8 enemies)
enemy_status			= $0320		; Enemy status effects
enemy_defense_mod		= $0328		; Defense modifiers
enemy_attack_mod		= $0330		; Attack modifiers

; -----------------------------------------------------------------------------
; Menu/UI RAM ($0400-$04FF)
; -----------------------------------------------------------------------------
menu_cursor_pos			= $0400		; Menu cursor position
menu_scroll_offset		= $0401		; Menu scroll offset
menu_selected_item		= $0402		; Selected item/option
menu_submenu_state		= $0403		; Submenu state
menu_page			= $0404		; Current menu page

; Inventory display buffer
inventory_display		= $0410		; Item IDs for current page (16 bytes)

; -----------------------------------------------------------------------------
; Audio RAM ($0500-$05FF)
; -----------------------------------------------------------------------------
music_current_track		= $0500		; Currently playing music
music_next_track		= $0501		; Music to play next
sfx_queue			= $0502		; Sound effect queue
audio_timer			= $0503		; Audio timing counter

; RNG extended state (verified from Cowness)
rng_counter_compare		= $050c		; RNG counter compare value [VERIFIED]
rng_extended_counter		= $050d		; Extended RNG counter [VERIFIED]

; -----------------------------------------------------------------------------
; Text Engine RAM ($0600-$06FF)
; -----------------------------------------------------------------------------
text_buffer			= $0600		; Text decode buffer (64 bytes)
text_char_delay			= $0640		; Character display delay
text_auto_scroll		= $0641		; Auto-scroll flag
text_window_x			= $0642		; Text window X position
text_window_y			= $0643		; Text window Y position
text_window_width		= $0644		; Text window width
text_window_height		= $0645		; Text window height

; ============================================================================
; WRAM / PRG RAM ($6000-$7FFF) - 8KB Battery-Backed
; ============================================================================
; Save data is stored here and preserved by battery backup.
; ============================================================================

WRAM_START			= $6000
WRAM_SIZE			= $2000		; 8KB
WRAM_END			= $8000

; -----------------------------------------------------------------------------
; Current Game Save Data ($6000-$62EE)
; -----------------------------------------------------------------------------
; This is the "working" save data loaded from save slots

save_current_start		= $6000		; Start of current save data

; Party member data (8 members × ~48 bytes each)
; Structure per character: 48 bytes
PARTY_MEMBER_SIZE		= 48		; Bytes per party member

party_member_0			= $6000		; Hero
party_member_1			= $6030		; Ragnar
party_member_2			= $6060		; Alena
party_member_3			= $6090		; Cristo
party_member_4			= $60c0		; Brey
party_member_5			= $60f0		; Taloon
party_member_6			= $6120		; Nara
party_member_7			= $6150		; Mara

; Party member data structure offsets
PM_NAME				= $00		; Name (8 bytes)
PM_LEVEL			= $08		; Current level
PM_HP_CURRENT_LO		= $09		; Current HP low
PM_HP_CURRENT_HI		= $0a		; Current HP high
PM_HP_MAX_LO			= $0b		; Max HP low
PM_HP_MAX_HI			= $0c		; Max HP high
PM_MP_CURRENT_LO		= $0d		; Current MP low
PM_MP_CURRENT_HI		= $0e		; Current MP high
PM_MP_MAX_LO			= $0f		; Max MP low
PM_MP_MAX_HI			= $10		; Max MP high
PM_STRENGTH			= $11		; Strength stat
PM_AGILITY			= $12		; Agility stat
PM_LUCK				= $13		; Luck stat
PM_EXP_LO			= $14		; Experience low
PM_EXP_MID			= $15		; Experience middle
PM_EXP_HI			= $16		; Experience high
PM_STATUS			= $17		; Status flags
PM_WEAPON			= $18		; Equipped weapon ID
PM_ARMOR			= $19		; Equipped armor ID
PM_SHIELD			= $1a		; Equipped shield ID
PM_HELMET			= $1b		; Equipped helmet ID
PM_ACCESSORY			= $1c		; Equipped accessory ID
PM_INVENTORY			= $1d		; Personal inventory start (8 items)
PM_SPELLS_LEARNED		= $25		; Spell flags (4 bytes)
PM_AI_TACTIC			= $29		; Current AI tactic
PM_IN_PARTY			= $2a		; In active party flag
PM_IN_WAGON			= $2b		; In wagon flag

; Inventory ($6200-$623F) - 64 items
inventory_start			= $6200		; Main inventory (64 bytes)

; Gold ($6240-$6243) - 24-bit gold
gold_lo				= $6240		; Gold low byte
gold_mid			= $6241		; Gold middle byte
gold_hi				= $6242		; Gold high byte

; Game progress flags ($6250-$629F) - 80 bytes = 640 flags
game_flags_start		= $6250		; Story/progress flags

; Map/position state ($62A0-$62BF)
save_map_id			= $62a0		; Saved map ID
save_map_x			= $62a1		; Saved X position
save_map_y			= $62a2		; Saved Y position
save_chapter			= $62a3		; Current chapter
save_play_time_lo		= $62a4		; Play time low
save_play_time_mid		= $62a5		; Play time middle
save_play_time_hi		= $62a6		; Play time high

; Bag of holding / vault ($62C0-$62EE)
vault_items			= $62c0		; Stored items (48 bytes)
vault_gold_lo			= $62ec		; Banked gold low
vault_gold_mid			= $62ed		; Banked gold mid
vault_gold_hi			= $62ee		; Banked gold high

; -----------------------------------------------------------------------------
; Save File Slots ($62EF-$7FFF)
; -----------------------------------------------------------------------------
; Three save slots, each ~750 bytes
; (Addresses verified from Cowness research)

SAVE_SLOT_SIZE			= $02f0		; ~752 bytes per save

save_slot_1			= $62ef		; Save file 1 [VERIFIED]
save_slot_2			= $65df		; Save file 2 [VERIFIED]
save_slot_3			= $68cf		; Save file 3 [VERIFIED]

; Checksum locations
save_slot_1_checksum		= $65dc		; Save 1 checksum
save_slot_2_checksum		= $68cc		; Save 2 checksum
save_slot_3_checksum		= $6bbc		; Save 3 checksum

; ============================================================================
; End of RAM Map
; ============================================================================
