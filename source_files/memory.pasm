; ============================================================================
; Dragon Warrior IV - Memory Map
; ============================================================================
;
; RAM variable definitions for the game.
; Based on existing documentation from GameInfo project.
;
; ============================================================================

; ----------------------------------------------------------------------------
; Zero Page Variables ($00-$ff)
; ----------------------------------------------------------------------------

zp_temp_00 = $00			; Temporary variable
zp_temp_01 = $01			; Temporary variable
zp_temp_02 = $02			; Temporary variable
zp_temp_03 = $03			; Temporary variable

temp_ptr = $04			; Temporary pointer (2 bytes)
temp_ptr_lo = $04
temp_ptr_hi = $05

nmi_count = $06			; NMI frame counter
game_mode = $07			; Current game mode/state

joy1_held = $08			; Joypad 1 held buttons
joy1_pressed = $09			; Joypad 1 newly pressed
joy2_held = $0a			; Joypad 2 held buttons
joy2_pressed = $0b			; Joypad 2 newly pressed

ppu_ctrl_shadow = $0c			; Shadow of PPU_CTRL
ppu_mask_shadow = $0d			; Shadow of PPU_MASK
scroll_x = $0e			; Horizontal scroll position
scroll_y = $0f			; Vertical scroll position

; Sound engine zero page
sound_channel = $10			; Current sound channel
music_ptr = $11			; Music data pointer (2 bytes)
sfx_ptr = $13			; SFX data pointer (2 bytes)

; General purpose zero page
zp_counter = $20			; Loop counter
zp_index = $21			; Index variable
zp_flag = $22			; Flag byte

; Source/destination pointers for copies
src_ptr = $30			; Source pointer (2 bytes)
src_ptr_lo = $30
src_ptr_hi = $31
dst_ptr = $32			; Destination pointer (2 bytes)
dst_ptr_lo = $32
dst_ptr_hi = $33
copy_len = $34			; Copy length (2 bytes)
copy_len_lo = $34
copy_len_hi = $35

; Map/world variables
current_map = $40			; Current map ID
current_submap = $41			; Current submap ID
player_x = $42			; Player X position on map
player_y = $43			; Player Y position on map
player_dir = $44			; Player facing direction
map_scroll_x = $45			; Map scroll X
map_scroll_y = $46			; Map scroll Y

; Battle variables (zero page for speed)
battle_phase = $50			; Current battle phase
active_combatant = $51			; Currently acting party member/enemy
target_index = $52			; Target of current action
damage_dealt = $53			; Calculated damage (2 bytes)

; Menu variables
menu_cursor = $60			; Menu cursor position
menu_scroll = $61			; Menu scroll offset
menu_selection = $62			; Selected menu item

; ----------------------------------------------------------------------------
; RAM Variables ($0100-$01ff - Stack)
; ----------------------------------------------------------------------------

; Stack is used for subroutine calls and temporary storage
; No variables defined in this region

; ----------------------------------------------------------------------------
; RAM Variables ($0200-$02ff - OAM Shadow)
; ----------------------------------------------------------------------------

oam_shadow = $0200		; OAM shadow buffer (256 bytes)

; ----------------------------------------------------------------------------
; RAM Variables ($0300-$07ff)
; ----------------------------------------------------------------------------

; NMI/PPU update buffer
ppu_buffer = $0300		; PPU update buffer
ppu_buffer_len = $0380		; PPU buffer length

; Decompression buffer
decomp_buffer = $0400		; Decompression work buffer (256 bytes)

; Temporary storage
temp_storage = $0500		; General temporary storage

; Game state in RAM
game_state_ram = $0600		; Game state variables

; ----------------------------------------------------------------------------
; SRAM Variables ($6000-$7fff) - Battery-backed Save Data
; ----------------------------------------------------------------------------
; Based on RAM map from GameInfo documentation

sram_header = $6000		; Save data header/checksum

; Party member data - each member has $1e bytes of data
party_data_start = $6001		; Start of party member data

; Party member 1 (varies by chapter/party)
party1_hp_current = $6001		; Current HP (2 bytes)
party1_hp_max = $6003		; Max HP (2 bytes)
party1_mp_current = $6005		; Current MP (2 bytes)
party1_mp_max = $6007		; Max MP (2 bytes)
party1_strength = $6009		; Strength
party1_agility = $600a		; Agility
party1_vitality = $600b		; Vitality
party1_intelligence = $600c		; Intelligence
party1_luck = $600d		; Luck
party1_attack = $600e		; Attack power (calculated)
party1_defense = $600f		; Defense power (calculated)
party1_level = $6010		; Current level
party1_experience = $6011		; Experience points (3 bytes)
party1_weapon = $6014		; Equipped weapon ID
party1_armor = $6015		; Equipped armor ID
party1_shield = $6016		; Equipped shield ID
party1_helmet = $6017		; Equipped helmet ID
party1_accessory = $6018		; Equipped accessory ID
party1_status = $6019		; Status effects

; Continue for other party members at $601e intervals
party2_data = $601f		; Party member 2 data
party3_data = $603d		; Party member 3 data
party4_data = $605b		; Party member 4 data
party5_data = $6079		; Party member 5 data (wagon)
party6_data = $6097		; Party member 6 data (wagon)
party7_data = $60b5		; Party member 7 data (wagon)
party8_data = $60d3		; Party member 8 data (wagon)

; Party inventory
party_inventory = $60f1		; Party inventory (items)
party_gold = $6120		; Party gold (3 bytes)

; Chapter and progress data
current_chapter = $615a		; Current chapter number
chapter_flags = $615b		; Chapter completion flags

; Location data
return_location1 = $6165		; Return/Zoom location 1
return_location2 = $6166		; Return/Zoom location 2
return_location3 = $6167		; Return/Zoom location 3

; Event flags
event_flags = $6200		; Event completion flags (many bytes)

; Treasure flags
treasure_flags = $625d		; Treasure chest flags ($625d-$6277)

; Medal collection
medal_count = $62a0		; Small medal count

; Casino data
casino_coins = $62b0		; Casino coin count

; Wagon party order
wagon_order = $62c0		; Order of characters in wagon

; Additional save data continues...
; (Complete mapping would require full reverse engineering)

; ----------------------------------------------------------------------------
; Save Slot Offsets
; ----------------------------------------------------------------------------
; Each save slot is $400 bytes

SAVE_SLOT_SIZE = $0400
save_slot_1 = $6000
save_slot_2 = $6400
save_slot_3 = $6800

; ============================================================================
; End of memory.asm
; ============================================================================

