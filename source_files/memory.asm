; ============================================================================
; Dragon Warrior IV - Memory Map
; ============================================================================
;
; RAM variable definitions for the game.
; Based on existing documentation from GameInfo project.
;
; ============================================================================

; ----------------------------------------------------------------------------
; Zero Page Variables ($00-$FF)
; ----------------------------------------------------------------------------

.alias zp_temp_00			$00			; Temporary variable
.alias zp_temp_01			$01			; Temporary variable
.alias zp_temp_02			$02			; Temporary variable
.alias zp_temp_03			$03			; Temporary variable

.alias temp_ptr				$04			; Temporary pointer (2 bytes)
.alias temp_ptr_lo			$04
.alias temp_ptr_hi			$05

.alias nmi_count			$06			; NMI frame counter
.alias game_mode			$07			; Current game mode/state

.alias joy1_held			$08			; Joypad 1 held buttons
.alias joy1_pressed			$09			; Joypad 1 newly pressed
.alias joy2_held			$0A			; Joypad 2 held buttons
.alias joy2_pressed			$0B			; Joypad 2 newly pressed

.alias ppu_ctrl_shadow		$0C			; Shadow of PPU_CTRL
.alias ppu_mask_shadow		$0D			; Shadow of PPU_MASK
.alias scroll_x				$0E			; Horizontal scroll position
.alias scroll_y				$0F			; Vertical scroll position

; Sound engine zero page
.alias sound_channel		$10			; Current sound channel
.alias music_ptr			$11			; Music data pointer (2 bytes)
.alias sfx_ptr				$13			; SFX data pointer (2 bytes)

; General purpose zero page
.alias zp_counter			$20			; Loop counter
.alias zp_index				$21			; Index variable
.alias zp_flag				$22			; Flag byte

; Source/destination pointers for copies
.alias src_ptr				$30			; Source pointer (2 bytes)
.alias src_ptr_lo			$30
.alias src_ptr_hi			$31
.alias dst_ptr				$32			; Destination pointer (2 bytes)
.alias dst_ptr_lo			$32
.alias dst_ptr_hi			$33
.alias copy_len				$34			; Copy length (2 bytes)
.alias copy_len_lo			$34
.alias copy_len_hi			$35

; Map/world variables
.alias current_map			$40			; Current map ID
.alias current_submap		$41			; Current submap ID
.alias player_x				$42			; Player X position on map
.alias player_y				$43			; Player Y position on map
.alias player_dir			$44			; Player facing direction
.alias map_scroll_x			$45			; Map scroll X
.alias map_scroll_y			$46			; Map scroll Y

; Battle variables (zero page for speed)
.alias battle_phase			$50			; Current battle phase
.alias active_combatant		$51			; Currently acting party member/enemy
.alias target_index			$52			; Target of current action
.alias damage_dealt			$53			; Calculated damage (2 bytes)

; Menu variables
.alias menu_cursor			$60			; Menu cursor position
.alias menu_scroll			$61			; Menu scroll offset
.alias menu_selection		$62			; Selected menu item

; ----------------------------------------------------------------------------
; RAM Variables ($0100-$01FF - Stack)
; ----------------------------------------------------------------------------

; Stack is used for subroutine calls and temporary storage
; No variables defined in this region

; ----------------------------------------------------------------------------
; RAM Variables ($0200-$02FF - OAM Shadow)
; ----------------------------------------------------------------------------

.alias oam_shadow			$0200		; OAM shadow buffer (256 bytes)

; ----------------------------------------------------------------------------
; RAM Variables ($0300-$07FF)
; ----------------------------------------------------------------------------

; NMI/PPU update buffer
.alias ppu_buffer			$0300		; PPU update buffer
.alias ppu_buffer_len		$0380		; PPU buffer length

; Decompression buffer
.alias decomp_buffer		$0400		; Decompression work buffer (256 bytes)

; Temporary storage
.alias temp_storage			$0500		; General temporary storage

; Game state in RAM
.alias game_state_ram		$0600		; Game state variables

; ----------------------------------------------------------------------------
; SRAM Variables ($6000-$7FFF) - Battery-backed Save Data
; ----------------------------------------------------------------------------
; Based on RAM map from GameInfo documentation

.alias sram_header			$6000		; Save data header/checksum

; Party member data - each member has $1E bytes of data
.alias party_data_start		$6001		; Start of party member data

; Party member 1 (varies by chapter/party)
.alias party1_hp_current	$6001		; Current HP (2 bytes)
.alias party1_hp_max		$6003		; Max HP (2 bytes)
.alias party1_mp_current	$6005		; Current MP (2 bytes)
.alias party1_mp_max		$6007		; Max MP (2 bytes)
.alias party1_strength		$6009		; Strength
.alias party1_agility		$600A		; Agility
.alias party1_vitality		$600B		; Vitality
.alias party1_intelligence	$600C		; Intelligence
.alias party1_luck			$600D		; Luck
.alias party1_attack		$600E		; Attack power (calculated)
.alias party1_defense		$600F		; Defense power (calculated)
.alias party1_level			$6010		; Current level
.alias party1_experience	$6011		; Experience points (3 bytes)
.alias party1_weapon		$6014		; Equipped weapon ID
.alias party1_armor			$6015		; Equipped armor ID
.alias party1_shield		$6016		; Equipped shield ID
.alias party1_helmet		$6017		; Equipped helmet ID
.alias party1_accessory		$6018		; Equipped accessory ID
.alias party1_status		$6019		; Status effects

; Continue for other party members at $601E intervals
.alias party2_data			$601F		; Party member 2 data
.alias party3_data			$603D		; Party member 3 data
.alias party4_data			$605B		; Party member 4 data
.alias party5_data			$6079		; Party member 5 data (wagon)
.alias party6_data			$6097		; Party member 6 data (wagon)
.alias party7_data			$60B5		; Party member 7 data (wagon)
.alias party8_data			$60D3		; Party member 8 data (wagon)

; Party inventory
.alias party_inventory		$60F1		; Party inventory (items)
.alias party_gold			$6120		; Party gold (3 bytes)

; Chapter and progress data
.alias current_chapter		$615A		; Current chapter number
.alias chapter_flags		$615B		; Chapter completion flags

; Location data
.alias return_location1		$6165		; Return/Zoom location 1
.alias return_location2		$6166		; Return/Zoom location 2
.alias return_location3		$6167		; Return/Zoom location 3

; Event flags
.alias event_flags			$6200		; Event completion flags (many bytes)

; Treasure flags
.alias treasure_flags		$625D		; Treasure chest flags ($625D-$6277)

; Medal collection
.alias medal_count			$62A0		; Small medal count

; Casino data
.alias casino_coins			$62B0		; Casino coin count

; Wagon party order
.alias wagon_order			$62C0		; Order of characters in wagon

; Additional save data continues...
; (Complete mapping would require full reverse engineering)

; ----------------------------------------------------------------------------
; Save Slot Offsets
; ----------------------------------------------------------------------------
; Each save slot is $400 bytes

.alias SAVE_SLOT_SIZE		$0400
.alias save_slot_1			$6000
.alias save_slot_2			$6400
.alias save_slot_3			$6800

; ============================================================================
; End of memory.asm
; ============================================================================
