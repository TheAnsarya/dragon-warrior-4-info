; ============================================================================
; Dragon Warrior IV - RAM Map
; ============================================================================
; Zero Page and RAM address definitions
; ============================================================================

; ============================================================================
; Zero Page ($0000-$00FF)
; ============================================================================
; These addresses are used for frequently accessed variables and pointers
; due to faster access times on 6502

; System Variables ($00-$1F)
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
zp_ptr2_lo		= $12		; Second pointer low
zp_ptr2_hi		= $13		; Second pointer high

zp_frame_counter	= $18		; Frame counter (increments each NMI)
zp_random_seed		= $19		; Random number seed
zp_controller1		= $1a		; Controller 1 current state
zp_controller1_prev	= $1b		; Controller 1 previous state
zp_controller1_new	= $1c		; Controller 1 newly pressed buttons
zp_controller2		= $1d		; Controller 2 current state

; PPU State ($20-$2F)
zp_ppu_ctrl_shadow	= $20		; Shadow copy of PPU_CTRL
zp_ppu_mask_shadow	= $21		; Shadow copy of PPU_MASK
zp_scroll_x		= $22		; Current X scroll position
zp_scroll_y		= $23		; Current Y scroll position
zp_nametable		= $24		; Current nametable (0-3)
zp_ppu_update_flag	= $25		; Flag indicating PPU needs update

; Bank State ($30-$3F)
zp_current_prg_bank	= $30		; Currently loaded PRG bank
zp_current_chr_bank0	= $31		; Current CHR bank 0
zp_current_chr_bank1	= $32		; Current CHR bank 1
zp_prev_prg_bank	= $33		; Previous PRG bank (for returns)

; Game State Pointers ($40-$5F)
zp_game_mode		= $40		; Current game mode
zp_sub_mode		= $41		; Current sub-mode
zp_menu_state		= $42		; Menu state
zp_cursor_pos		= $43		; Current cursor position
zp_menu_selection	= $44		; Selected menu item
zp_dialog_ptr_lo	= $45		; Dialog text pointer low
zp_dialog_ptr_hi	= $46		; Dialog text pointer high

; Math Variables ($60-$6F)
zp_math_operand1_lo	= $60		; 16-bit operand 1 low
zp_math_operand1_hi	= $61		; 16-bit operand 1 high
zp_math_operand2_lo	= $62		; 16-bit operand 2 low
zp_math_operand2_hi	= $63		; 16-bit operand 2 high
zp_math_result_lo	= $64		; 32-bit result low
zp_math_result_mid1	= $65		; 32-bit result mid-low
zp_math_result_mid2	= $66		; 32-bit result mid-high
zp_math_result_hi	= $67		; 32-bit result high

; Battle Variables ($70-$7F)
zp_battle_phase		= $70		; Current battle phase
zp_current_attacker	= $71		; Index of current attacker
zp_current_target	= $72		; Index of current target
zp_damage_amount_lo	= $73		; Damage calculation result low
zp_damage_amount_hi	= $74		; Damage calculation result high

; Audio Variables ($80-$8F)
zp_music_id		= $80		; Current music track ID
zp_sfx_id		= $81		; Current sound effect ID
zp_music_tempo		= $82		; Music tempo
zp_music_volume		= $83		; Music volume

; Map Variables ($90-$9F)
zp_map_id		= $90		; Current map ID
zp_map_x		= $91		; Player X position on map
zp_map_y		= $92		; Player Y position on map
zp_map_direction	= $93		; Player facing direction
zp_map_step_counter	= $94		; Steps since last encounter check
zp_encounter_rate	= $95		; Current area encounter rate

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
; General RAM ($0300-$07FF)
; ============================================================================

; PPU Update Buffer ($0300-$03FF)
ppu_buffer		= $0300		; PPU update buffer
ppu_buffer_length	= $0380		; Length of data in buffer

; Party Data ($0400-$04FF)
party_data		= $0400		; Start of party data
party_member0		= $0400		; First party member
party_member1		= $0420		; Second party member
party_member2		= $0440		; Third party member
party_member3		= $0460		; Fourth party member
party_size		= $04f0		; Current party size
party_gold_lo		= $04f1		; Gold (low byte)
party_gold_mid		= $04f2		; Gold (middle byte)
party_gold_hi		= $04f3		; Gold (high byte)

; Character Data Structure (32 bytes per character)
; Offset  Size  Description
; $00     1     Character ID
; $01     1     Level
; $02     2     Current HP
; $04     2     Max HP
; $06     1     Current MP
; $07     1     Max MP
; $08     1     Strength
; $09     1     Agility
; $0a     1     Vitality
; $0b     1     Intelligence
; $0c     1     Luck
; $0d     1     Attack Power
; $0e     1     Defense Power
; $0f     1     Equipped weapon
; $10     1     Equipped armor
; $11     1     Equipped shield
; $12     1     Equipped helmet
; $13     1     Equipped accessory
; $14     2     Experience (low/mid)
; $16     2     Experience (mid/high)
; $18-$1f       Reserved

; Inventory ($0500-$057F)
inventory		= $0500		; Inventory items (64 slots)
inventory_count		= $0540		; Item counts (64 bytes)

; Wagon Inventory ($0580-$05FF)
wagon_inventory		= $0580		; Wagon inventory items

; Battle State ($0600-$06FF)
battle_data		= $0600		; Battle state data
enemy_data		= $0600		; Enemy data in battle (8 enemies × 16 bytes)
enemy_0			= $0600		; First enemy
enemy_1			= $0610		; Second enemy
enemy_2			= $0620		; Third enemy
enemy_3			= $0630		; Fourth enemy
enemy_4			= $0640		; Fifth enemy
enemy_5			= $0650		; Sixth enemy
enemy_6			= $0660		; Seventh enemy
enemy_7			= $0670		; Eighth enemy
battle_turn_order	= $0680		; Turn order queue
battle_flags		= $0690		; Battle status flags

; Dialog Buffer ($0700-$077F)
dialog_buffer		= $0700		; Dialog text buffer
dialog_line1		= $0700		; First line of dialog
dialog_line2		= $0720		; Second line of dialog
dialog_line3		= $0740		; Third line of dialog
dialog_line4		= $0760		; Fourth line of dialog

; Misc RAM ($0780-$07FF)
save_buffer		= $0780		; Save game buffer
game_flags		= $07c0		; Game progress flags (64 bytes)

; ============================================================================
; PRG RAM / WRAM ($6000-$7FFF) - 8KB battery-backed
; ============================================================================
WRAM_START		= $6000
WRAM_SIZE		= $2000		; 8KB

; Save Slots ($6000-$6FFF)
save_slot0		= $6000		; Save slot 0 (1KB)
save_slot1		= $6400		; Save slot 1 (1KB)
save_slot2		= $6800		; Save slot 2 (1KB)
save_checksum		= $6c00		; Save checksums

; Extended Data ($7000-$7FFF)
extended_data		= $7000		; Extended game data storage

; ============================================================================
; End of ram_map.inc
; ============================================================================
