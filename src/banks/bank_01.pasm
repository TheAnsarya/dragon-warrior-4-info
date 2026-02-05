; ============================================================================
; Dragon Warrior IV - Bank $01 (PRG ROM $04000-$07FFF)
; 🌷 Flower Toolchain
; ============================================================================
; Bank 1 - Map Engine and Overworld Logic
; Contains routines for map loading, tile collision, and overworld movement.
; ============================================================================

; Bank offset in ROM file (after 16-byte iNES header)
; File offset: $04010 - $0800F (16,384 bytes)
; CPU address: $8000-$BFFF when swapped in

; ============================================================================
; Map Data Structures
; ============================================================================
; DW4 uses a complex map system with:
;   - 73 maps (72 main maps + 1 world map)
;   - Sub-maps within towns/dungeons
;   - RLE-compressed tile data
;   - Warps, NPCs, events, and treasure locations

; ============================================================================
; Map Loading
; ============================================================================

; Load a map by ID
; Input: A = map ID
load_map:
	sta zp_map_id			; Store map ID
	
	; Get map header pointer
	asl				; × 2 (for word-sized pointers)
	tax
	lda map_header_ptrs,x
	sta zp_map_ptr_lo
	lda map_header_ptrs+1,x
	sta zp_map_ptr_hi
	
	; Read map header
	ldy #0
	lda (zp_map_ptr_lo),y		; Map width
	sta map_width
	iny
	lda (zp_map_ptr_lo),y		; Map height
	sta map_height
	iny
	lda (zp_map_ptr_lo),y		; Map type (overworld/town/dungeon)
	sta zp_map_type
	iny
	lda (zp_map_ptr_lo),y		; Tileset ID
	sta map_tileset
	iny
	lda (zp_map_ptr_lo),y		; Music ID
	sta music_next_track
	
	; Load tileset
	lda map_tileset
	jsr load_tileset
	
	; Decompress map tiles
	jsr decompress_map
	
	; Load NPCs
	jsr load_map_npcs
	
	; Load events
	jsr load_map_events
	
	rts

; ============================================================================
; Map Tile Decompression
; ============================================================================
; DW4 uses RLE compression for map data

decompress_map:
	; Get compressed data pointer from header
	ldy #6
	lda (zp_map_ptr_lo),y
	sta zp_data_ptr_lo
	iny
	lda (zp_map_ptr_lo),y
	sta zp_data_ptr_hi
	
	; Destination: map buffer
	lda #<map_buffer
	sta zp_ptr1_lo
	lda #>map_buffer
	sta zp_ptr1_hi
	
	; Decompress RLE data
	ldy #0
@decompress_loop:
	lda (zp_data_ptr_lo),y		; Read byte
	cmp #$ff			; End marker?
	beq @decompress_done
	
	cmp #$80			; RLE marker (bit 7 set)?
	bcs @rle_run
	
	; Literal byte
	sta (zp_ptr1_lo),y
	jsr @advance_dest
	jmp @decompress_loop
	
@rle_run:
	; RLE run: length in low 7 bits, next byte is tile
	and #$7f			; Mask off RLE bit
	sta zp_temp0			; Run length
	iny
	lda (zp_data_ptr_lo),y		; Tile to repeat
	ldx zp_temp0
@rle_write:
	sta (zp_ptr1_lo),y
	jsr @advance_dest
	dex
	bne @rle_write
	jmp @decompress_loop
	
@decompress_done:
	rts

@advance_dest:
	inc zp_ptr1_lo
	bne @no_carry
	inc zp_ptr1_hi
@no_carry:
	rts

; ============================================================================
; Tileset Loading
; ============================================================================
; Load CHR data and metatile definitions for current tileset

load_tileset:
	; Input: A = tileset ID
	asl				; × 4 (tileset table entry size)
	asl
	tax
	
	; Get CHR bank for this tileset
	lda tileset_table,x
	jsr load_chr_bank
	
	; Get metatile definitions pointer
	lda tileset_table+2,x
	sta zp_data_ptr_lo
	lda tileset_table+3,x
	sta zp_data_ptr_hi
	
	; Copy metatile data to RAM
	ldy #0
@copy_metatiles:
	lda (zp_data_ptr_lo),y
	sta metatile_data,y
	iny
	cpy #0				; 256 bytes
	bne @copy_metatiles
	
	rts

; Load CHR bank
load_chr_bank:
	; Set CHR banks for background tiles
	sta zp_temp0
	
	lda #2				; CHR bank register
	sta MMC3_BANK_SELECT
	lda zp_temp0
	sta MMC3_BANK_DATA
	
	lda #3
	sta MMC3_BANK_SELECT
	lda zp_temp0
	clc
	adc #1
	sta MMC3_BANK_DATA
	
	rts

; ============================================================================
; NPC Loading
; ============================================================================

load_map_npcs:
	; Get NPC data pointer from map header
	ldy #8
	lda (zp_map_ptr_lo),y
	sta zp_data_ptr_lo
	iny
	lda (zp_map_ptr_lo),y
	sta zp_data_ptr_hi
	
	; Read NPC count
	ldy #0
	lda (zp_data_ptr_lo),y
	sta npc_count
	beq @no_npcs
	
	; Load each NPC
	ldx #0				; NPC index
	iny
@load_npc_loop:
	; NPC data: x, y, sprite, direction, movement type, script ID
	lda (zp_data_ptr_lo),y
	sta npc_x_pos,x
	iny
	lda (zp_data_ptr_lo),y
	sta npc_y_pos,x
	iny
	lda (zp_data_ptr_lo),y
	sta npc_sprite,x
	iny
	lda (zp_data_ptr_lo),y
	sta npc_direction,x
	iny
	lda (zp_data_ptr_lo),y
	sta npc_movement,x
	iny
	lda (zp_data_ptr_lo),y
	sta npc_script_id,x
	iny
	
	inx
	cpx npc_count
	bne @load_npc_loop
	
@no_npcs:
	rts

; ============================================================================
; Event Loading
; ============================================================================
; Events are tile triggers (stairs, doors, treasure, etc.)

load_map_events:
	; Get event data pointer
	ldy #10
	lda (zp_map_ptr_lo),y
	sta zp_data_ptr_lo
	iny
	lda (zp_map_ptr_lo),y
	sta zp_data_ptr_hi
	
	; Read event count
	ldy #0
	lda (zp_data_ptr_lo),y
	sta event_count
	beq @no_events
	
	; Load each event
	ldx #0
	iny
@load_event_loop:
	; Event data: x, y, type, param1, param2
	lda (zp_data_ptr_lo),y
	sta event_x,x
	iny
	lda (zp_data_ptr_lo),y
	sta event_y,x
	iny
	lda (zp_data_ptr_lo),y
	sta event_type,x
	iny
	lda (zp_data_ptr_lo),y
	sta event_param1,x
	iny
	lda (zp_data_ptr_lo),y
	sta event_param2,x
	iny
	
	inx
	cpx event_count
	bne @load_event_loop
	
@no_events:
	rts

; ============================================================================
; Player Movement
; ============================================================================

update_player_movement:
	; Check for movement input
	lda zp_joy1_pressed
	
	; Check each direction
	lsr				; Right
	bcs @move_right
	lsr				; Left
	bcs @move_left
	lsr				; Down
	bcs @move_down
	lsr				; Up
	bcs @move_up
	rts				; No movement

@move_right:
	lda #DIR_RIGHT
	sta zp_player_direction
	ldx zp_player_x
	inx
	jsr check_collision
	bne @blocked
	stx zp_player_x
	jmp @moved

@move_left:
	lda #DIR_LEFT
	sta zp_player_direction
	ldx zp_player_x
	dex
	jsr check_collision
	bne @blocked
	stx zp_player_x
	jmp @moved

@move_down:
	lda #DIR_DOWN
	sta zp_player_direction
	ldx zp_player_y
	inx
	txa
	ldx zp_player_x
	tay
	jsr check_collision_xy
	bne @blocked
	sty zp_player_y
	jmp @moved

@move_up:
	lda #DIR_UP
	sta zp_player_direction
	ldx zp_player_y
	dex
	txa
	ldx zp_player_x
	tay
	jsr check_collision_xy
	bne @blocked
	sty zp_player_y
	jmp @moved

@blocked:
	; Play blocked sound
	lda #SFX_BLOCKED
	sta sfx_queue
	rts

@moved:
	; Increment step counter
	inc16 zp_steps_counter_lo
	
	; Check for random encounter
	jsr check_encounter
	
	; Check for tile events
	jsr check_tile_events
	
	rts

; ============================================================================
; Collision Detection
; ============================================================================

; Check if position X,Y is walkable
; Input: X = x coord, Y = y coord
; Output: Z flag = walkable (0 = yes, 1 = no)
check_collision_xy:
	; Calculate map buffer offset: y × width + x
	tya
	sta zp_temp0			; Save Y
	
	; Multiply Y by map width
	lda #0
	sta zp_temp1			; High byte
@mult_loop:
	dey
	bmi @mult_done
	clc
	adc map_width
	bcc @mult_loop
	inc zp_temp1
	jmp @mult_loop
	
@mult_done:
	; Add X
	clc
	adc zp_player_x
	sta zp_temp0
	lda zp_temp1
	adc #0
	sta zp_temp1
	
	; Get tile at position
	lda #<map_buffer
	clc
	adc zp_temp0
	sta zp_ptr0_lo
	lda #>map_buffer
	adc zp_temp1
	sta zp_ptr0_hi
	
	ldy #0
	lda (zp_ptr0_lo),y		; Get tile ID
	
	; Check collision in metatile table
	tax
	lda metatile_collision,x
	rts

; Simple collision check (X direction only, current Y)
check_collision:
	ldy zp_player_y
	jmp check_collision_xy

; ============================================================================
; Encounter Check
; ============================================================================
; Check if a random encounter should occur

check_encounter:
	; Only check on certain map types
	lda zp_map_type
	cmp #MAP_TYPE_SAFE		; Safe zones (towns, castles)
	beq @no_encounter
	
	; Get encounter rate for this zone
	lda zp_encounter_zone
	tax
	lda encounter_rates,x
	sta zp_temp0
	
	; Roll random number
	jsr get_random
	cmp zp_temp0
	bcs @no_encounter
	
	; Trigger encounter!
	lda #1
	sta encounter_triggered
	
@no_encounter:
	rts

; ============================================================================
; Tile Event Check
; ============================================================================

check_tile_events:
	; Loop through all events
	ldx #0
@event_loop:
	cpx event_count
	beq @no_event
	
	; Check if player is on this event
	lda zp_player_x
	cmp event_x,x
	bne @next_event
	lda zp_player_y
	cmp event_y,x
	bne @next_event
	
	; Event triggered!
	lda event_type,x
	jsr process_event
	rts
	
@next_event:
	inx
	jmp @event_loop
	
@no_event:
	rts

; Process event by type
process_event:
	; A = event type
	cmp #EVENT_TYPE_WARP
	beq @warp
	cmp #EVENT_TYPE_STAIRS
	beq @stairs
	cmp #EVENT_TYPE_TREASURE
	beq @treasure
	cmp #EVENT_TYPE_DOOR
	beq @door
	rts

@warp:
	; Load destination from event params
	lda event_param1,x
	sta zp_warp_map_id
	lda event_param2,x
	; Split into X/Y coords
	and #$0f
	sta zp_warp_x
	lda event_param2,x
	lsr
	lsr
	lsr
	lsr
	sta zp_warp_y
	; Trigger warp
	jmp execute_warp
	
@stairs:
	; Stairs work like warps
	jmp @warp

@treasure:
	; Check if already opened (game flag)
	lda event_param2,x		; Flag index
	jsr check_game_flag
	bne @already_opened
	
	; Give item
	lda event_param1,x		; Item ID
	jsr give_item
	
	; Set flag
	lda event_param2,x
	jsr set_game_flag
	
	; Show message
	; TODO: "Found [ITEM]!"
	
@already_opened:
	rts

@door:
	; Check if player has required key
	lda event_param1,x		; Required key type
	jsr check_has_key
	beq @no_key
	
	; Open door (remove event or change tile)
	jsr open_door
	
@no_key:
	rts

; ============================================================================
; Map Data Tables (Placeholders)
; ============================================================================

; Map header pointers
map_header_ptrs:
	; TODO: Generated from map data
	.fill 146			; 73 maps × 2 bytes

; Tileset table
tileset_table:
	; TODO: Generated from tileset data
	.fill 64			; 16 tilesets × 4 bytes

; Encounter rate table by zone
encounter_rates:
	.db $00				; Zone 0 - Safe (no encounters)
	.db $10				; Zone 1 - Low encounter rate
	.db $20				; Zone 2 - Medium
	.db $30				; Zone 3 - High
	.db $40				; Zone 4 - Very high
	; ... more zones

; Direction constants
DIR_DOWN			= 0
DIR_LEFT			= 1
DIR_UP				= 2
DIR_RIGHT			= 3

; Event type constants
EVENT_TYPE_WARP			= 0
EVENT_TYPE_STAIRS		= 1
EVENT_TYPE_TREASURE		= 2
EVENT_TYPE_DOOR			= 3
EVENT_TYPE_NPC_BLOCK		= 4
EVENT_TYPE_SIGN			= 5

; Map type constants
MAP_TYPE_OVERWORLD		= 0
MAP_TYPE_TOWN			= 1
MAP_TYPE_DUNGEON		= 2
MAP_TYPE_CASTLE			= 3
MAP_TYPE_TOWER			= 4
MAP_TYPE_CAVE			= 5
MAP_TYPE_SAFE			= 6	; No encounters

; Sound effect IDs
SFX_BLOCKED			= $10

; ============================================================================
; RAM Variables (Bank-specific)
; ============================================================================

; Map state variables (in general RAM)
map_width			= $0380
map_height			= $0381
map_tileset			= $0382
npc_count			= $0383
event_count			= $0384
encounter_triggered		= $0385

; NPC data arrays
npc_x_pos			= $0390	; 16 NPCs max
npc_y_pos			= $03a0
npc_sprite			= $03b0
npc_direction			= $03c0
npc_movement			= $03d0
npc_script_id			= $03e0

; Event data arrays
event_x				= $03f0	; 16 events max
event_y				= $0400
event_type			= $0410
event_param1			= $0420
event_param2			= $0430

; Map buffer (decompressed tiles)
map_buffer			= $0500	; Up to 768 bytes (32×24 max)

; Metatile data
metatile_data			= $0700	; 256 bytes
metatile_collision		= $0780	; 128 bytes (1 bit per tile)

; ============================================================================
; Stub Functions
; ============================================================================

execute_warp:
	; TODO: Implement warp logic
	rts

check_game_flag:
	; TODO: Implement flag check
	lda #0
	rts

set_game_flag:
	; TODO: Implement flag set
	rts

give_item:
	; TODO: Implement item giving
	rts

check_has_key:
	; TODO: Implement key check
	lda #1				; Assume has key for now
	rts

open_door:
	; TODO: Implement door opening
	rts

; ============================================================================
; End of Bank $01
; ============================================================================
