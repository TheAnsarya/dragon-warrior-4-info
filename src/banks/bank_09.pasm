; ============================================================================
; Dragon Warrior IV - Bank $09 (PRG ROM $24000-$27FFF)
; 🌷 Flower Toolchain
; ============================================================================
; Bank 9 - Item, Spell, and Shop Data Bank
; Contains item/spell statistics and shop inventories.
; This bank includes generated data from JSON assets.
; ============================================================================

; Bank offset in ROM file (after 16-byte iNES header)
; File offset: $24010 - $2800F (16,384 bytes)
; CPU address: $8000-$BFFF when swapped in

; ============================================================================
; Include Generated Data
; ============================================================================
; These files are auto-generated from assets/json/
; Run: python tools/json_to_asm.py --input assets/json --output src/data

.include "src/data/items.pasm"
.include "src/data/spells.pasm"
.include "src/data/shops.pasm"

; ============================================================================
; Item Lookup Functions
; ============================================================================

; Get item data pointer
; Input: A = item ID
; Output: zp_data_ptr points to 8-byte item entry
get_item_data:
	sta zp_temp0
	lda #0
	sta zp_temp1
	
	; × 8
	lda zp_temp0
	asl
	rol zp_temp1
	asl
	rol zp_temp1
	asl
	rol zp_temp1
	
	clc
	adc #<item_data
	sta zp_data_ptr_lo
	lda zp_temp1
	adc #>item_data
	sta zp_data_ptr_hi
	
	rts

; Get item type
; Input: A = item ID
; Output: A = item type
get_item_type:
	jsr get_item_data
	ldy #0
	lda (zp_data_ptr_lo),y
	rts

; Get item equip flags
; Input: A = item ID
; Output: A = equip flags (who can equip)
get_item_equip_flags:
	jsr get_item_data
	ldy #1
	lda (zp_data_ptr_lo),y
	rts

; Can character equip item?
; Input: A = item ID, X = character index
; Output: Z flag = can equip (Z=1 yes)
can_equip_item:
	jsr get_item_equip_flags
	sta zp_temp0
	
	; Get character bit
	lda #1
@shift_loop:
	dex
	bmi @check_bit
	asl
	jmp @shift_loop
	
@check_bit:
	and zp_temp0
	rts

; Get item effect value (attack/defense bonus)
; Input: A = item ID
; Output: A = effect value
get_item_effect:
	jsr get_item_data
	ldy #2
	lda (zp_data_ptr_lo),y
	rts

; Get item buy price
; Input: A = item ID
; Output: Y:A = price (high:low)
get_item_price:
	jsr get_item_data
	ldy #4
	lda (zp_data_ptr_lo),y		; Price high
	pha
	dey
	lda (zp_data_ptr_lo),y		; Price low
	ply
	rts

; Get item sell price (usually buy/2)
; Input: A = item ID
; Output: Y:A = sell price (high:low)
get_item_sell_price:
	jsr get_item_data
	ldy #6
	lda (zp_data_ptr_lo),y		; Sell high
	pha
	dey
	lda (zp_data_ptr_lo),y		; Sell low
	ply
	rts

; Check if item is cursed
; Input: A = item ID
; Output: Z flag = is cursed
is_item_cursed:
	jsr get_item_data
	ldy #7
	lda (zp_data_ptr_lo),y
	and #ITEM_FLAG_CURSED
	rts

; Check if item can be used in battle
; Input: A = item ID
; Output: Z flag = can use in battle
can_use_in_battle:
	jsr get_item_data
	ldy #7
	lda (zp_data_ptr_lo),y
	and #ITEM_FLAG_COMBAT_USE
	rts

; ============================================================================
; Spell Lookup Functions
; ============================================================================

; Get spell data pointer
; Input: A = spell ID
; Output: zp_data_ptr points to 8-byte spell entry
get_spell_data:
	sta zp_temp0
	lda #0
	sta zp_temp1
	
	; × 8
	lda zp_temp0
	asl
	rol zp_temp1
	asl
	rol zp_temp1
	asl
	rol zp_temp1
	
	clc
	adc #<spell_data
	sta zp_data_ptr_lo
	lda zp_temp1
	adc #>spell_data
	sta zp_data_ptr_hi
	
	rts

; Get spell MP cost
; Input: A = spell ID
; Output: A = MP cost
get_spell_mp_cost:
	jsr get_spell_data
	ldy #0
	lda (zp_data_ptr_lo),y
	rts

; Get spell target type
; Input: A = spell ID
; Output: A = target type
get_spell_target_type:
	jsr get_spell_data
	ldy #1
	lda (zp_data_ptr_lo),y
	rts

; Get spell type (attack, heal, etc.)
; Input: A = spell ID
; Output: A = spell type
get_spell_type:
	jsr get_spell_data
	ldy #2
	lda (zp_data_ptr_lo),y
	rts

; Get spell element
; Input: A = spell ID
; Output: A = element
get_spell_element:
	jsr get_spell_data
	ldy #3
	lda (zp_data_ptr_lo),y
	rts

; Get spell base power
; Input: A = spell ID
; Output: A = base power
get_spell_power:
	jsr get_spell_data
	ldy #4
	lda (zp_data_ptr_lo),y
	rts

; Can character learn spell?
; Input: A = spell ID, X = character index
; Output: Z flag = can learn (Z=1 yes)
can_learn_spell:
	jsr get_spell_data
	ldy #6
	lda (zp_data_ptr_lo),y
	sta zp_temp0
	
	; Get character bit
	lda #1
@shift_loop:
	dex
	bmi @check_bit
	asl
	jmp @shift_loop
	
@check_bit:
	and zp_temp0
	rts

; ============================================================================
; Spell Usage Functions
; ============================================================================

; Use a spell
; Input: A = spell ID, X = caster, Y = target
; Output: Performs spell effect
use_spell:
	sta zp_temp0			; Spell ID
	stx zp_temp1			; Caster
	sty zp_temp2			; Target
	
	; Check MP
	jsr get_spell_mp_cost
	sta zp_temp3			; MP cost
	
	; TODO: Check if caster has enough MP
	
	; Deduct MP
	; TODO: Implement MP deduction
	
	; Get spell type and execute
	lda zp_temp0
	jsr get_spell_type
	
	cmp #SPELL_TYPE_ATTACK
	beq @attack_spell
	cmp #SPELL_TYPE_HEAL
	beq @heal_spell
	cmp #SPELL_TYPE_REVIVE
	beq @revive_spell
	cmp #SPELL_TYPE_BUFF
	beq @buff_spell
	cmp #SPELL_TYPE_DEBUFF
	beq @debuff_spell
	cmp #SPELL_TYPE_STATUS
	beq @status_spell
	rts

@attack_spell:
	jsr execute_attack_spell
	rts

@heal_spell:
	jsr execute_heal_spell
	rts

@revive_spell:
	jsr execute_revive_spell
	rts

@buff_spell:
	jsr execute_buff_spell
	rts

@debuff_spell:
	jsr execute_debuff_spell
	rts

@status_spell:
	jsr execute_status_spell
	rts

; Execute attack spell
execute_attack_spell:
	; Get base power
	lda zp_temp0
	jsr get_spell_power
	sta zp_temp4			; Base damage
	
	; Add caster's magic stat
	; TODO: Get caster magic stat
	
	; Check target resistance
	lda zp_temp0
	jsr get_spell_element
	sta zp_temp5			; Element
	
	; Calculate final damage
	; TODO: Implement damage formula
	
	; Apply damage to target(s)
	; TODO: Apply damage based on target type
	
	rts

; Execute heal spell
execute_heal_spell:
	; Get base heal amount
	lda zp_temp0
	jsr get_spell_power
	sta zp_temp4
	
	; Add random variance (+/- 25%)
	jsr get_random
	and #$0f			; 0-15
	clc
	adc zp_temp4
	sta zp_temp4
	
	; Apply healing to target
	; TODO: Add HP to target
	
	rts

; Execute revive spell
execute_revive_spell:
	; Check spell (Vivify = 50%, Revive = 100%)
	lda zp_temp0
	cmp #SPELL_VIVIFY
	bne @full_revive
	
	; 50% chance for Vivify
	jsr get_random
	cmp #$80
	bcs @revive_failed
	
@full_revive:
	; Restore target to 100% HP
	; TODO: Implement revive
	rts
	
@revive_failed:
	; Show "But it failed!" message
	; TODO: Implement failure
	rts

; Execute buff spell
execute_buff_spell:
	; TODO: Implement stat buffs
	rts

; Execute debuff spell
execute_debuff_spell:
	; TODO: Implement stat debuffs
	rts

; Execute status spell
execute_status_spell:
	; TODO: Implement status effects
	rts

; ============================================================================
; Shop Functions
; ============================================================================

; Open shop
; Input: X = shop type, Y = location ID
; Output: Enters shop mode
open_shop:
	stx shop_type
	sty shop_location
	
	; Find shop inventory for this location
	jsr find_shop_inventory
	
	; Set game mode to shop
	lda #GAME_MODE_SHOP
	sta zp_game_mode
	
	rts

; Find shop inventory pointer
find_shop_inventory:
	; Based on shop type and location, find inventory pointer
	lda shop_type
	asl
	tax
	lda shop_ptr_tables,x
	sta zp_ptr0_lo
	lda shop_ptr_tables+1,x
	sta zp_ptr0_hi
	
	; Search for location in shop list
	ldy #0
@search_loop:
	lda (zp_ptr0_lo),y
	cmp #$ff			; End of list
	beq @not_found
	cmp shop_location
	beq @found
	; Skip to next shop entry
	; TODO: Calculate skip amount
	jmp @search_loop
	
@found:
	; Set shop_inventory_ptr
	; TODO: Extract inventory pointer
	rts

@not_found:
	; No shop at this location
	rts

; Buy item
; Input: A = item index in shop inventory
; Output: C flag = success
buy_item:
	; Get item ID
	tay
	lda (shop_inventory_ptr),y
	sta zp_temp0			; Item ID
	
	; Get price
	jsr get_item_price
	sta zp_temp1			; Price low
	sty zp_temp2			; Price high
	
	; Check if player has enough gold
	jsr check_gold
	bcc @not_enough
	
	; Deduct gold
	jsr deduct_gold
	
	; Add item to inventory
	lda zp_temp0
	jsr add_to_inventory
	
	sec				; Success
	rts
	
@not_enough:
	clc				; Failure
	rts

; Sell item
; Input: A = item ID from player inventory
; Output: C flag = success
sell_item:
	sta zp_temp0
	
	; Get sell price
	jsr get_item_sell_price
	sta zp_temp1
	sty zp_temp2
	
	; Add gold
	jsr add_gold
	
	; Remove item from inventory
	lda zp_temp0
	jsr remove_from_inventory
	
	sec				; Success
	rts

; ============================================================================
; Inn Functions
; ============================================================================

; Stay at inn
; Input: A = inn location ID
; Output: C flag = success
stay_at_inn:
	; Get inn price
	jsr get_inn_price
	sta zp_temp0
	
	; Check gold
	jsr check_gold_single
	bcc @not_enough
	
	; Deduct gold
	jsr deduct_gold_single
	
	; Heal entire party
	jsr heal_party_full
	
	; Restore MP
	jsr restore_party_mp
	
	; Advance time to morning
	; TODO: Implement day/night cycle
	
	sec
	rts
	
@not_enough:
	clc
	rts

; Get inn price for location
get_inn_price:
	; Search inn_prices table
	ldx #0
@search:
	lda inn_prices,x
	cmp #$ff
	beq @not_found
	cmp zp_temp0
	beq @found
	inx
	inx
	jmp @search
	
@found:
	inx
	lda inn_prices,x
	rts
	
@not_found:
	lda #$08			; Default price
	rts

; ============================================================================
; Gold Management
; ============================================================================

; Check if party has enough gold
; Input: zp_temp1/zp_temp2 = price (low/high)
; Output: C flag = has enough
check_gold:
	; Compare 16-bit gold with price
	lda gold_hi
	cmp zp_temp2
	bcc @not_enough
	bne @enough
	lda gold_lo
	cmp zp_temp1
	bcc @not_enough
@enough:
	sec
	rts
@not_enough:
	clc
	rts

; Single-byte gold check
check_gold_single:
	lda gold_lo
	cmp zp_temp0
	rts

; Deduct gold (16-bit)
deduct_gold:
	lda gold_lo
	sec
	sbc zp_temp1
	sta gold_lo
	lda gold_hi
	sbc zp_temp2
	sta gold_hi
	rts

; Deduct gold (8-bit)
deduct_gold_single:
	lda gold_lo
	sec
	sbc zp_temp0
	sta gold_lo
	bcs @no_borrow
	dec gold_hi
@no_borrow:
	rts

; Add gold
add_gold:
	lda gold_lo
	clc
	adc zp_temp1
	sta gold_lo
	lda gold_hi
	adc zp_temp2
	sta gold_hi
	; TODO: Check for max gold (999999)
	rts

; ============================================================================
; Inventory Management
; ============================================================================

add_to_inventory:
	; Find empty slot
	ldx #0
@find_slot:
	cpx #64				; Max inventory
	beq @full
	lda inventory_start,x
	beq @found_slot
	inx
	jmp @find_slot
	
@found_slot:
	lda zp_temp0
	sta inventory_start,x
	sec
	rts

@full:
	clc
	rts

remove_from_inventory:
	; Find item
	ldx #0
@find_item:
	cpx #64
	beq @not_found
	lda inventory_start,x
	cmp zp_temp0
	beq @found_item
	inx
	jmp @find_item
	
@found_item:
	lda #0
	sta inventory_start,x
	sec
	rts
	
@not_found:
	clc
	rts

; ============================================================================
; Heal Functions
; ============================================================================

heal_party_full:
	; Heal all party members to max HP
	ldx #0
@heal_loop:
	cpx zp_party_size
	beq @done
	jsr heal_member_full
	inx
	jmp @heal_loop
@done:
	rts

heal_member_full:
	; Set current HP = max HP for member X
	; TODO: Implement per-member heal
	rts

restore_party_mp:
	; Restore all party MP
	ldx #0
@restore_loop:
	cpx zp_party_size
	beq @done
	jsr restore_member_mp
	inx
	jmp @restore_loop
@done:
	rts

restore_member_mp:
	; Set current MP = max MP for member X
	; TODO: Implement per-member MP restore
	rts

; ============================================================================
; Shop State Variables
; ============================================================================

shop_type			= $0440
shop_location			= $0441
shop_inventory_ptr		= $0442	; 2 bytes

; Shop pointer table (pointers to each shop type's data)
shop_ptr_tables:
	.dw weapon_shop_ptrs
	.dw armor_shop_ptrs
	.dw item_shop_ptrs

; Game mode constant
GAME_MODE_SHOP			= 5

; ============================================================================
; End of Bank $09
; ============================================================================
