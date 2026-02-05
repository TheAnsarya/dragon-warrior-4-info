; ============================================================================
; Dragon Warrior IV - Item Data
; 🌷 Flower Toolchain
; ============================================================================
; This file is AUTO-GENERATED from assets/json/items.json
; Do not edit directly - edit the JSON file and run json_to_asm.py
;
; To regenerate: python tools/json_to_asm.py --input assets/json --output src/data
; ============================================================================

; ============================================================================
; Item Data Format (8 bytes per item)
; ============================================================================
; Offset  Size  Description
; ------  ----  -----------
;   $00   1     Item Type (weapon, armor, shield, helmet, accessory, consumable, key)
;   $01   1     Equip Flags (who can equip: bit 0=Hero, 1=Ragnar, etc.)
;   $02   1     Effect Value (attack bonus for weapons, defense for armor, etc.)
;   $03   1     Buy Price low byte
;   $04   1     Buy Price high byte
;   $05   1     Sell Price low byte (usually buy/2)
;   $06   1     Sell Price high byte
;   $07   1     Special Flags (cursed, combat use, etc.)
; ============================================================================

; Item type constants
ITEM_TYPE_WEAPON		= $00
ITEM_TYPE_ARMOR			= $01
ITEM_TYPE_SHIELD		= $02
ITEM_TYPE_HELMET		= $03
ITEM_TYPE_ACCESSORY		= $04
ITEM_TYPE_CONSUMABLE		= $05
ITEM_TYPE_KEY_ITEM		= $06
ITEM_TYPE_GOLD			= $07	; Gold/money item

; Item equip flags (who can equip)
EQUIP_HERO			= $01	; Bit 0 = Hero
EQUIP_RAGNAR			= $02	; Bit 1 = Ragnar
EQUIP_ALENA			= $04	; Bit 2 = Alena
EQUIP_CRISTO			= $08	; Bit 3 = Cristo
EQUIP_BREY			= $10	; Bit 4 = Brey
EQUIP_TALOON			= $20	; Bit 5 = Taloon
EQUIP_NARA			= $40	; Bit 6 = Nara
EQUIP_MARA			= $80	; Bit 7 = Mara

; Combined equip flags for common groups
EQUIP_ALL			= $ff	; Everyone can equip
EQUIP_FIGHTERS			= $0f	; Hero, Ragnar, Alena, Cristo
EQUIP_MAGES			= $d0	; Brey, Nara, Mara
EQUIP_MALES			= $3b	; Hero, Ragnar, Cristo, Brey, Taloon
EQUIP_FEMALES			= $c4	; Alena, Nara, Mara

; Item special flags
ITEM_FLAG_CURSED		= $01	; Item is cursed (can't unequip)
ITEM_FLAG_COMBAT_USE		= $02	; Can be used in battle
ITEM_FLAG_FIELD_USE		= $04	; Can be used in field
ITEM_FLAG_BREAKS		= $08	; Breaks after use/battle
ITEM_FLAG_CASTS_SPELL		= $10	; Casts a spell when used
ITEM_FLAG_HEALS			= $20	; Healing item
ITEM_FLAG_INFINITE		= $40	; Infinite uses (doesn't consume)
ITEM_FLAG_KEY_ITEM		= $80	; Cannot be sold or dropped

; ============================================================================
; Item ID Constants - Weapons ($00-$3F)
; ============================================================================

; Swords
ITEM_CYPRESS_STICK		= $00
ITEM_CLUB			= $01
ITEM_COPPER_SWORD		= $02
ITEM_DIVINE_DAGGER		= $03
ITEM_THORN_WHIP			= $04
ITEM_IRON_CLAW			= $05
ITEM_CHAIN_SICKLE		= $06
ITEM_BROAD_SWORD		= $07
ITEM_IRON_FAN			= $08
ITEM_POISON_NEEDLE		= $09
ITEM_HOLY_LANCE			= $0a
ITEM_IRON_SPEAR			= $0b
ITEM_BATTLE_AXE			= $0c
ITEM_MORNING_STAR		= $0d
ITEM_SWORD_OF_MALICE		= $0e
ITEM_STEEL_BROADSWORD		= $0f
ITEM_FIRE_CLAW			= $10
ITEM_STAFF_OF_THUNDER		= $11
ITEM_STAFF_OF_ANTIMAGIC		= $12
ITEM_SWORD_OF_MIRACLES		= $13
ITEM_DEMON_HAMMER		= $14
ITEM_STAFF_OF_JUBILATION	= $15
ITEM_ZOMBIE_SLAYER		= $16
ITEM_DREAM_BLADE		= $17
ITEM_MAGMA_STAFF		= $18
ITEM_ICE_BLADE			= $19
ITEM_FALCON_SWORD		= $1a
ITEM_METAL_BABBLE_SWORD		= $1b
ITEM_STAFF_OF_TRANSFORM		= $1c
ITEM_STAFF_OF_PUNISHMENT	= $1d
ITEM_SWORD_OF_DECIMATION	= $1e
ITEM_SWORD_OF_LETHARGY		= $1f
ITEM_ZENITHIAN_SWORD		= $20

; ============================================================================
; Item ID Constants - Armor ($40-$5F)
; ============================================================================

ITEM_PLAIN_CLOTHES		= $40
ITEM_WAYFARER_CLOTHES		= $41
ITEM_LEATHER_ARMOR		= $42
ITEM_CHAIN_MAIL			= $43
ITEM_BRONZE_ARMOR		= $44
ITEM_IRON_ARMOR			= $45
ITEM_FUR_COAT			= $46
ITEM_SILK_ROBE			= $47
ITEM_CLOAK_OF_EVASION		= $48
ITEM_HALF_PLATE_ARMOR		= $49
ITEM_FULL_PLATE_ARMOR		= $4a
ITEM_MAGIC_ARMOR		= $4b
ITEM_DRAGON_MAIL		= $4c
ITEM_FLOWING_DRESS		= $4d
ITEM_AEOLUS_SHIELD		= $4e
ITEM_ARMOR_OF_RADIANCE		= $4f
ITEM_ZENITHIAN_ARMOR		= $50
ITEM_METAL_BABBLE_ARMOR		= $51
ITEM_LIQUID_METAL_ARMOR		= $52

; ============================================================================
; Item ID Constants - Shields ($60-$6F)
; ============================================================================

ITEM_LEATHER_SHIELD		= $60
ITEM_SCALE_SHIELD		= $61
ITEM_IRON_SHIELD		= $62
ITEM_MAGIC_SHIELD		= $63
ITEM_DRAGON_SHIELD		= $64
ITEM_SILVER_SHIELD		= $65
ITEM_SHIELD_OF_STRENGTH		= $66
ITEM_ZENITHIAN_SHIELD		= $67
ITEM_METAL_BABBLE_SHIELD	= $68

; ============================================================================
; Item ID Constants - Helmets ($70-$7F)
; ============================================================================

ITEM_LEATHER_HAT		= $70
ITEM_HARDWOOD_HEADWEAR		= $71
ITEM_IRON_HELMET		= $72
ITEM_IRON_MASK			= $73
ITEM_GOLDEN_TIARA		= $74
ITEM_HAT_OF_HAPPINESS		= $75
ITEM_HELM_OF_BRILLIANCE		= $76
ITEM_ZENITHIAN_HELMET		= $77
ITEM_METAL_BABBLE_HELM		= $78

; ============================================================================
; Item ID Constants - Accessories ($80-$8F)
; ============================================================================

ITEM_FAIRY_WATER		= $80	; Also consumable
ITEM_STRENGTH_RING		= $81
ITEM_RUBY_OF_PROTECTION		= $82
ITEM_METEORITE_ARMBAND		= $83
ITEM_RING_OF_IMMUNITY		= $84
ITEM_ARMLET_OF_TRANSMUTATION	= $85
ITEM_SYMBOL_OF_FAITH		= $86

; ============================================================================
; Item ID Constants - Consumables ($90-$AF)
; ============================================================================

ITEM_HERB			= $90
ITEM_ANTIDOTE			= $91
ITEM_MOONWORT_BULB		= $92
ITEM_MEDICAL_HERB		= $93
ITEM_ELVEN_ELIXIR		= $94
ITEM_YGGDRASIL_LEAF		= $95
ITEM_YGGDRASIL_DEW		= $96
ITEM_SAGE_STONE			= $97
ITEM_WIZARD_RING		= $98
ITEM_CHIMAERA_WING		= $99
ITEM_REPELLENT			= $9a
ITEM_TORCH			= $9b
ITEM_SPHERE_OF_SILENCE		= $9c
ITEM_POWDER_OF_AWAKE		= $9d
ITEM_SEED_OF_STRENGTH		= $9e
ITEM_SEED_OF_AGILITY		= $9f
ITEM_SEED_OF_LUCK		= $a0
ITEM_SEED_OF_LIFE		= $a1
ITEM_SEED_OF_MAGIC		= $a2
ITEM_SMALL_MEDAL		= $a3

; ============================================================================
; Item ID Constants - Key Items ($B0-$BF)
; ============================================================================

ITEM_THIEF_KEY			= $b0
ITEM_MAGIC_KEY			= $b1
ITEM_FINAL_KEY			= $b2
ITEM_GUNPOWDER_JAR		= $b3
ITEM_IRON_SAFE			= $b4
ITEM_ROYAL_SCROLL		= $b5
ITEM_ZENITHIAN_HELM		= $b6
ITEM_GAS_CANISTER		= $b7
ITEM_HOT_AIR_BALLOON		= $b8
ITEM_ZENITHIA_TALISMAN		= $b9
ITEM_MAGMA_KEY			= $ba
ITEM_BARON_HORN			= $bb
ITEM_ZENITHIAN_SWORD_KI		= $bc
ITEM_FLUTE_OF_UNCOVERING	= $bd
ITEM_WORLD_TREE_ROOT		= $be
ITEM_SANDGLASS_OF_RETROGRESSION	= $bf

; ============================================================================
; Item Data Table (8 bytes × ~200 items = ~1600 bytes)
; ============================================================================
; This data will be generated from JSON

.align 256			; Align for faster lookups
item_data:
	; TODO: Include generated data here

; Placeholder for first few items (will be replaced by generator)

; Item $00: Cypress Stick
	.db ITEM_TYPE_WEAPON	; Type = weapon
	.db EQUIP_ALL		; All can equip
	.db $02			; Attack +2
	.db $05, $00		; Buy = 5
	.db $02, $00		; Sell = 2
	.db $00			; No special flags

; Item $01: Club
	.db ITEM_TYPE_WEAPON
	.db EQUIP_MALES
	.db $07			; Attack +7
	.db $1e, $00		; Buy = 30
	.db $0f, $00		; Sell = 15
	.db $00

; Reserve space for all items
.fill 1584			; Remaining space

; ============================================================================
; Item Name Pointers
; ============================================================================
item_name_ptrs:
	; TODO: Include generated name pointer table
	.fill 400		; 200 × 2 = 400 bytes

; ============================================================================
; Item Description Pointers
; ============================================================================
item_desc_ptrs:
	; TODO: Include generated description pointer table
	.fill 400		; 200 × 2 = 400 bytes

; ============================================================================
; End of Item Data
; ============================================================================
