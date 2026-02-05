; ============================================================================
; Dragon Warrior IV - Shop Data
; 🌷 Flower Toolchain
; ============================================================================
; This file is AUTO-GENERATED from assets/json/shops.json
; Do not edit directly - edit the JSON file and run json_to_asm.py
;
; To regenerate: python tools/json_to_asm.py --input assets/json --output src/data
; ============================================================================

; ============================================================================
; Shop Data Format
; ============================================================================
; Each shop entry contains:
;   - Shop type (weapon, armor, item, inn, vault, casino)
;   - Location ID (map where shop exists)
;   - Item count
;   - List of item IDs available
;   - Special flags (chapter availability, etc.)
; ============================================================================

; Shop type constants
SHOP_TYPE_WEAPON		= $00	; Weapon shop
SHOP_TYPE_ARMOR			= $01	; Armor shop
SHOP_TYPE_ITEM			= $02	; Item shop
SHOP_TYPE_INN			= $03	; Inn (price per night)
SHOP_TYPE_VAULT			= $04	; Vault (item storage)
SHOP_TYPE_CASINO		= $05	; Casino
SHOP_TYPE_MEDAL_KING		= $06	; Medal King rewards

; ============================================================================
; Shop Location IDs (verified from map data)
; ============================================================================
; Chapter 1 Towns
SHOP_LOC_BURLAND		= $01	; Burland - Ragnar's starting town
SHOP_LOC_IZMIT			= $02	; Izmit Village
SHOP_LOC_KIEVS			= $03	; Kievs

; Chapter 2 Towns
SHOP_LOC_SANTEEM		= $10	; Santeem Castle
SHOP_LOC_SURENE			= $11	; Surene
SHOP_LOC_TEMPE			= $12	; Tempe
SHOP_LOC_FRENOR			= $13	; Frenor
SHOP_LOC_ENDOR			= $14	; Endor (also Ch5)

; Chapter 3 Towns
SHOP_LOC_LAKANABA		= $20	; Lakanaba (Taloon's hometown)
SHOP_LOC_FOXVILLE		= $21	; Foxville
SHOP_LOC_BONMALMO		= $22	; Bonmalmo
; (Endor also appears in Chapter 3)

; Chapter 4 Towns
SHOP_LOC_MONBARABA		= $30	; Monbaraba (sisters' hometown)
SHOP_LOC_HAVILLE		= $31	; Haville
SHOP_LOC_KEELEON		= $32	; Keeleon (kingdom)
SHOP_LOC_AKTEMTO		= $33	; Aktemto Mines

; Chapter 5 Towns
SHOP_LOC_BRANCA			= $40	; Branca (Hero's village - destroyed)
SHOP_LOC_SEASIDE		= $41	; Seaside Village
SHOP_LOC_MINTOS			= $42	; Mintos
SHOP_LOC_SORETTA		= $43	; Soretta
SHOP_LOC_GARDENBUR		= $44	; Gardenbur
SHOP_LOC_RIVERTON		= $45	; Riverton
SHOP_LOC_ROSAVILLE		= $46	; Rosaville
SHOP_LOC_ELFVILLE		= $47	; Elfville
SHOP_LOC_KONENBER		= $48	; Konenber
SHOP_LOC_GOTTSIDE		= $49	; Gottside
SHOP_LOC_ZENITHIA		= $4a	; Zenithia (floating castle)

; ============================================================================
; Inn Price Table
; ============================================================================
; Inn prices by location (in gold per night)
; Price increases based on chapter and town tier

inn_prices:
	; Chapter 1
	.db SHOP_LOC_BURLAND,   $04	;   4 gold - Burland
	.db SHOP_LOC_IZMIT,     $02	;   2 gold - Izmit
	.db SHOP_LOC_KIEVS,     $06	;   6 gold - Kievs
	
	; Chapter 2
	.db SHOP_LOC_SANTEEM,   $08	;   8 gold - Santeem
	.db SHOP_LOC_SURENE,    $03	;   3 gold - Surene
	.db SHOP_LOC_TEMPE,     $06	;   6 gold - Tempe
	.db SHOP_LOC_FRENOR,    $10	;  16 gold - Frenor
	.db SHOP_LOC_ENDOR,     $14	;  20 gold - Endor
	
	; Chapter 3 uses same prices as Ch2 locations
	
	; Chapter 4
	.db SHOP_LOC_MONBARABA, $05	;   5 gold - Monbaraba
	.db SHOP_LOC_HAVILLE,   $08	;   8 gold - Haville
	.db SHOP_LOC_KEELEON,   $18	;  24 gold - Keeleon
	
	; Chapter 5
	.db SHOP_LOC_MINTOS,    $0c	;  12 gold - Mintos
	.db SHOP_LOC_SORETTA,   $10	;  16 gold - Soretta
	.db SHOP_LOC_GARDENBUR, $20	;  32 gold - Gardenbur
	.db SHOP_LOC_RIVERTON,  $18	;  24 gold - Riverton
	.db SHOP_LOC_ROSAVILLE, $28	;  40 gold - Rosaville
	.db SHOP_LOC_ELFVILLE,  $30	;  48 gold - Elfville
	.db SHOP_LOC_KONENBER,  $40	;  64 gold - Konenber
	.db SHOP_LOC_GOTTSIDE,  $50	;  80 gold - Gottside
	.db SHOP_LOC_ZENITHIA,  $00	;   0 gold - Free (Zenithia)
	
	.db $ff				; End marker

; ============================================================================
; Weapon Shop Inventories
; ============================================================================

weapon_shop_burland:
	.db 4				; Item count
	.db ITEM_CYPRESS_STICK		; Cypress Stick -     5g
	.db ITEM_CLUB			; Club -             30g
	.db ITEM_COPPER_SWORD		; Copper Sword -    100g
	.db ITEM_BROAD_SWORD		; Broad Sword -     350g
	.db $ff				; End marker

weapon_shop_santeem:
	.db 5
	.db ITEM_CLUB
	.db ITEM_COPPER_SWORD
	.db ITEM_IRON_CLAW		; Alena's specialty
	.db ITEM_CHAIN_SICKLE
	.db ITEM_BROAD_SWORD
	.db $ff

weapon_shop_endor:
	.db 6
	.db ITEM_COPPER_SWORD
	.db ITEM_BROAD_SWORD
	.db ITEM_CHAIN_SICKLE
	.db ITEM_BATTLE_AXE
	.db ITEM_MORNING_STAR
	.db ITEM_STEEL_BROADSWORD
	.db $ff

weapon_shop_lakanaba:
	.db 4
	.db ITEM_CYPRESS_STICK
	.db ITEM_CLUB
	.db ITEM_COPPER_SWORD
	.db ITEM_THORN_WHIP
	.db $ff

; ... more weapon shops defined similarly

; ============================================================================
; Armor Shop Inventories
; ============================================================================

armor_shop_burland:
	.db 4
	.db ITEM_PLAIN_CLOTHES		; Plain Clothes
	.db ITEM_WAYFARER_CLOTHES	; Wayfarer's Clothes
	.db ITEM_LEATHER_ARMOR		; Leather Armor
	.db ITEM_LEATHER_SHIELD		; Leather Shield
	.db $ff

armor_shop_santeem:
	.db 5
	.db ITEM_WAYFARER_CLOTHES
	.db ITEM_SILK_ROBE		; For Brey
	.db ITEM_LEATHER_ARMOR
	.db ITEM_CHAIN_MAIL
	.db ITEM_LEATHER_SHIELD
	.db $ff

armor_shop_endor:
	.db 6
	.db ITEM_CHAIN_MAIL
	.db ITEM_BRONZE_ARMOR
	.db ITEM_IRON_ARMOR
	.db ITEM_CLOAK_OF_EVASION
	.db ITEM_SCALE_SHIELD
	.db ITEM_IRON_HELMET
	.db $ff

; ... more armor shops

; ============================================================================
; Item Shop Inventories
; ============================================================================

item_shop_burland:
	.db 4
	.db ITEM_HERB
	.db ITEM_ANTIDOTE
	.db ITEM_CHIMAERA_WING
	.db ITEM_TORCH
	.db $ff

item_shop_santeem:
	.db 5
	.db ITEM_HERB
	.db ITEM_ANTIDOTE
	.db ITEM_MOONWORT_BULB
	.db ITEM_CHIMAERA_WING
	.db ITEM_REPELLENT
	.db $ff

item_shop_endor:
	.db 6
	.db ITEM_HERB
	.db ITEM_MEDICAL_HERB
	.db ITEM_ANTIDOTE
	.db ITEM_MOONWORT_BULB
	.db ITEM_CHIMAERA_WING
	.db ITEM_REPELLENT
	.db $ff

; Chapter 5 has better item shops
item_shop_gottside:
	.db 7
	.db ITEM_HERB
	.db ITEM_MEDICAL_HERB
	.db ITEM_ELVEN_ELIXIR
	.db ITEM_YGGDRASIL_LEAF
	.db ITEM_ANTIDOTE
	.db ITEM_MOONWORT_BULB
	.db ITEM_CHIMAERA_WING
	.db $ff

; ============================================================================
; Shop Pointer Table
; ============================================================================
; Master table pointing to all shop data

shop_ptr_table:
	; Weapon shops
	.dw weapon_shop_burland
	.dw weapon_shop_santeem
	.dw weapon_shop_endor
	.dw weapon_shop_lakanaba
	; ... more weapon shop pointers
	
	; Armor shops
	.dw armor_shop_burland
	.dw armor_shop_santeem
	.dw armor_shop_endor
	; ... more armor shop pointers
	
	; Item shops
	.dw item_shop_burland
	.dw item_shop_santeem
	.dw item_shop_endor
	.dw item_shop_gottside
	; ... more item shop pointers

; ============================================================================
; Taloon's Shop Inventory (Chapter 3 special)
; ============================================================================
; Taloon can buy and sell different items in his shop
; His shop grows based on story progress

taloon_shop_tier_1:
	.db 4
	.db ITEM_HERB
	.db ITEM_ANTIDOTE
	.db ITEM_CHIMAERA_WING
	.db ITEM_LEATHER_ARMOR
	.db $ff

taloon_shop_tier_2:
	.db 6
	.db ITEM_HERB
	.db ITEM_ANTIDOTE
	.db ITEM_MOONWORT_BULB
	.db ITEM_CHIMAERA_WING
	.db ITEM_LEATHER_ARMOR
	.db ITEM_CHAIN_MAIL
	.db $ff

taloon_shop_tier_3:
	.db 8
	.db ITEM_HERB
	.db ITEM_MEDICAL_HERB
	.db ITEM_ANTIDOTE
	.db ITEM_MOONWORT_BULB
	.db ITEM_CHIMAERA_WING
	.db ITEM_CHAIN_MAIL
	.db ITEM_IRON_ARMOR
	.db ITEM_IRON_SHIELD
	.db $ff

; ============================================================================
; Medal King Reward Table
; ============================================================================
; Small Medals can be exchanged for prizes

medal_king_rewards:
	; Format: medal_count, item_id
	.db  2, ITEM_STRENGTH_RING		;  2 medals
	.db  4, ITEM_HAT_OF_HAPPINESS		;  4 medals
	.db  6, ITEM_STAFF_OF_JUBILATION	;  6 medals
	.db  8, ITEM_SWORD_OF_MIRACLES		;  8 medals
	.db 10, ITEM_METAL_BABBLE_ARMOR		; 10 medals
	.db 13, ITEM_FALCON_SWORD		; 13 medals
	.db 18, ITEM_METAL_BABBLE_HELM		; 18 medals
	.db 25, ITEM_METAL_BABBLE_SWORD		; 25 medals
	.db 34, ITEM_METAL_BABBLE_SHIELD	; 34 medals
	.db $ff				; End marker

; ============================================================================
; Casino Prize Table
; ============================================================================
; Prizes available at the Endor casino

casino_prizes:
	; Format: coin_cost_lo, coin_cost_hi, item_id
	.db <50,   >50,   ITEM_STRENGTH_RING	;    50 coins
	.db <100,  >100,  ITEM_WIZARD_RING	;   100 coins
	.db <500,  >500,  ITEM_MAGMA_STAFF	;   500 coins
	.db <1000, >1000, ITEM_FALCON_SWORD	;  1000 coins
	.db <2500, >2500, ITEM_FLOWING_DRESS	;  2500 coins
	.db <5000, >5000, ITEM_METAL_BABBLE_ARMOR	; 5000 coins
	.db $ff

; ============================================================================
; End of Shop Data
; ============================================================================
