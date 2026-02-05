; ============================================================================
; Dragon Warrior IV - Bank $08 (PRG ROM $20000-$23FFF)
; 🌷 Flower Toolchain
; ============================================================================
; Bank 8 - Monster Data Bank
; Contains monster statistics, AI patterns, and combat data.
; This bank includes generated data from JSON assets.
; ============================================================================

; Bank offset in ROM file (after 16-byte iNES header)
; File offset: $20010 - $2400F (16,384 bytes)
; CPU address: $8000-$BFFF when swapped in

; ============================================================================
; Include Generated Monster Data
; ============================================================================
; The monster data is auto-generated from assets/json/monsters/*.json
; Run: python tools/json_to_asm.py --input assets/json --output src/data
; 
; The include file contains:
;   - monster_data: Main stat table (16 bytes × 195 monsters)
;   - monster_name_ptrs: Pointer table to monster names
;   - encounter_groups: Which monsters appear together
;   - Boss-specific data

.include "src/data/monsters.pasm"

; ============================================================================
; Monster Lookup Functions
; ============================================================================

; Get monster data pointer
; Input: A = monster ID (0-194)
; Output: zp_data_ptr points to 16-byte monster entry
get_monster_data:
	; Multiply by 16 (shift left 4 times)
	sta zp_temp0
	lda #0
	sta zp_temp1			; High byte
	
	; × 16
	lda zp_temp0
	asl
	rol zp_temp1
	asl
	rol zp_temp1
	asl
	rol zp_temp1
	asl
	rol zp_temp1
	
	; Add base address
	clc
	adc #<monster_data
	sta zp_data_ptr_lo
	lda zp_temp1
	adc #>monster_data
	sta zp_data_ptr_hi
	
	rts

; Get monster HP
; Input: A = monster ID
; Output: Y:A = HP (high:low)
get_monster_hp:
	jsr get_monster_data
	ldy #0
	lda (zp_data_ptr_lo),y		; HP high byte
	tay
	lda #10				; Offset for AI/HP low byte
	sta zp_temp0
	ldy zp_temp0
	lda (zp_data_ptr_lo),y		; HP low bits from AI byte
	and #$0f			; Mask off AI bits
	rts

; Get monster attack power
; Input: A = monster ID
; Output: A = attack
get_monster_attack:
	jsr get_monster_data
	ldy #1
	lda (zp_data_ptr_lo),y
	rts

; Get monster defense
; Input: A = monster ID
; Output: A = defense
get_monster_defense:
	jsr get_monster_data
	ldy #2
	lda (zp_data_ptr_lo),y
	rts

; Get monster agility
; Input: A = monster ID
; Output: A = agility
get_monster_agility:
	jsr get_monster_data
	ldy #3
	lda (zp_data_ptr_lo),y
	rts

; Get monster experience
; Input: A = monster ID
; Output: Y:A = experience (high:low)
get_monster_exp:
	jsr get_monster_data
	ldy #5
	lda (zp_data_ptr_lo),y		; Exp high
	pha
	dey
	lda (zp_data_ptr_lo),y		; Exp low
	ply
	rts

; Get monster gold
; Input: A = monster ID
; Output: Y:A = gold (high:low)
get_monster_gold:
	jsr get_monster_data
	ldy #7
	lda (zp_data_ptr_lo),y		; Gold high
	pha
	dey
	lda (zp_data_ptr_lo),y		; Gold low
	ply
	rts

; Get monster item drop
; Input: A = monster ID
; Output: A = item ID (0 = no drop), Y = drop rate
get_monster_drop:
	jsr get_monster_data
	ldy #11
	lda (zp_data_ptr_lo),y		; Item ID
	sta zp_temp0
	iny
	lda (zp_data_ptr_lo),y		; Drop rate
	tay
	lda zp_temp0
	rts

; Check if monster is undead
; Input: A = monster ID
; Output: Z flag = is undead (Z=1 yes, Z=0 no)
is_monster_undead:
	jsr get_monster_data
	ldy #15
	lda (zp_data_ptr_lo),y
	and #MONSTER_FLAG_UNDEAD
	rts

; Check if monster is metal type
; Input: A = monster ID
; Output: Z flag = is metal
is_monster_metal:
	jsr get_monster_data
	ldy #15
	lda (zp_data_ptr_lo),y
	and #MONSTER_FLAG_METAL
	rts

; Check if monster is boss
; Input: A = monster ID
; Output: Z flag = is boss
is_monster_boss:
	jsr get_monster_data
	ldy #15
	lda (zp_data_ptr_lo),y
	and #MONSTER_FLAG_BOSS
	rts

; ============================================================================
; Encounter Group Functions
; ============================================================================

; Get encounter group for current zone
; Input: A = zone ID
; Output: Fills battle_enemy_ids array, returns count in A
get_encounter_group:
	; TODO: Implement encounter group selection
	; Based on zone ID, pick random group and fill enemy array
	
	; Placeholder: return single slime
	lda #1
	sta battle_enemy_count
	lda #MONSTER_SLIME
	sta battle_enemy_ids
	lda #1
	rts

; Roll for item drop from defeated monster
; Input: A = monster ID
; Output: A = item ID (or 0 if no drop)
roll_monster_drop:
	jsr get_monster_drop		; A = item, Y = rate
	cpy #0
	beq @no_drop			; Rate 0 = never drops
	
	sta zp_temp0			; Save item ID
	sty zp_temp1			; Save rate
	
	; Roll random number
	jsr get_random
	cmp zp_temp1			; Compare with drop rate
	bcs @no_drop			; If random >= rate, no drop
	
	lda zp_temp0			; Return item ID
	rts
	
@no_drop:
	lda #0
	rts

; ============================================================================
; Monster AI Functions
; ============================================================================

; Get monster AI pattern
; Input: A = monster ID
; Output: A = AI pattern ID
get_monster_ai_pattern:
	jsr get_monster_data
	ldy #10
	lda (zp_data_ptr_lo),y
	lsr				; AI pattern in upper 4 bits
	lsr
	lsr
	lsr
	rts

; Execute monster AI
; Input: X = enemy slot (0-7)
; Output: Sets battle_action with chosen action
execute_monster_ai:
	; Get monster ID for this slot
	lda battle_enemy_ids,x
	sta zp_temp0
	
	; Get AI pattern
	jsr get_monster_ai_pattern
	
	; Jump to AI handler
	asl				; × 2 for pointer table
	tax
	lda monster_ai_handlers,x
	sta zp_ptr0_lo
	lda monster_ai_handlers+1,x
	sta zp_ptr0_hi
	jmp (zp_ptr0_lo)

; AI Pattern Handlers
monster_ai_handlers:
	.dw ai_pattern_attack_only	; Pattern 0: Attack only
	.dw ai_pattern_basic_magic	; Pattern 1: Attack + basic spells
	.dw ai_pattern_healer		; Pattern 2: Healer (heals allies)
	.dw ai_pattern_support		; Pattern 3: Support (buffs/debuffs)
	.dw ai_pattern_breath		; Pattern 4: Uses breath attacks
	.dw ai_pattern_boss		; Pattern 5: Boss AI
	.dw ai_pattern_metal		; Pattern 6: Metal slime (runs away)
	.dw ai_pattern_random		; Pattern 7: Random actions

; AI Pattern 0: Attack only
ai_pattern_attack_only:
	lda #ACTION_ATTACK
	sta battle_action
	; Target random party member
	jsr pick_random_party_member
	sta battle_target
	rts

; AI Pattern 1: Basic magic
ai_pattern_basic_magic:
	; 50% chance to use spell if has MP
	jsr get_random
	cmp #$80
	bcs @use_attack
	
	; Check if has spell and MP
	; TODO: Implement spell check
	
@use_attack:
	jmp ai_pattern_attack_only

; AI Pattern 2: Healer
ai_pattern_healer:
	; Check if any ally is hurt
	jsr find_hurt_ally
	bmi @no_hurt_ally
	
	; Use heal spell
	lda #ACTION_SPELL
	sta battle_action
	lda #SPELL_HEAL
	sta battle_spell
	stx battle_target		; X = hurt ally slot
	rts
	
@no_hurt_ally:
	jmp ai_pattern_attack_only

; AI Pattern 3: Support
ai_pattern_support:
	; TODO: Implement buff/debuff AI
	jmp ai_pattern_attack_only

; AI Pattern 4: Breath attacks
ai_pattern_breath:
	; 33% chance to use breath
	jsr get_random
	cmp #$55
	bcs @use_attack
	
	; Use fire breath on all
	lda #ACTION_BREATH
	sta battle_action
	lda #BREATH_FIRE
	sta battle_breath
	lda #$ff			; Target all
	sta battle_target
	rts
	
@use_attack:
	jmp ai_pattern_attack_only

; AI Pattern 5: Boss
ai_pattern_boss:
	; Boss AI is more complex - varies by boss
	; TODO: Implement boss-specific AI
	jmp ai_pattern_attack_only

; AI Pattern 6: Metal slime
ai_pattern_metal:
	; 50% chance to run away
	jsr get_random
	cmp #$80
	bcs @dont_run
	
	lda #ACTION_RUN
	sta battle_action
	rts
	
@dont_run:
	jmp ai_pattern_attack_only

; AI Pattern 7: Random
ai_pattern_random:
	; Pick random action
	jsr get_random
	and #$03
	tax
	lda random_actions,x
	sta battle_action
	
	; Pick random target
	jsr pick_random_party_member
	sta battle_target
	rts

random_actions:
	.db ACTION_ATTACK		; 25%
	.db ACTION_ATTACK		; 25%
	.db ACTION_DEFEND		; 25%
	.db ACTION_NOTHING		; 25%

; ============================================================================
; AI Helper Functions
; ============================================================================

pick_random_party_member:
	jsr get_random
	and #$07			; 0-7
	cmp zp_party_size
	bcc @valid
	lda #0				; Default to first member
@valid:
	rts

find_hurt_ally:
	; Look for enemy with < 50% HP
	ldx #0
@check_loop:
	cpx battle_enemy_count
	beq @none_found
	
	; Check HP ratio
	; TODO: Implement HP check
	
	inx
	jmp @check_loop
	
@none_found:
	ldx #$ff			; Return -1
	rts

; ============================================================================
; Battle State Variables
; ============================================================================

battle_enemy_ids		= $0350	; Monster IDs for 8 enemies
battle_enemy_count		= $0302	; (shared with bank 00)
battle_action			= $0305
battle_target			= $0304
battle_spell			= $0358
battle_breath			= $0359

; Action constants
ACTION_ATTACK			= 0
ACTION_DEFEND			= 1
ACTION_SPELL			= 2
ACTION_ITEM			= 3
ACTION_RUN			= 4
ACTION_BREATH			= 5
ACTION_NOTHING			= 6

; Breath attack constants
BREATH_FIRE			= 0
BREATH_ICE			= 1
BREATH_POISON			= 2

; ============================================================================
; End of Bank $08
; ============================================================================
