; ============================================================================
; Dragon Warrior IV - Item Definitions
; ============================================================================
; Item index constants and definitions
; Source: DW4Lib.DataStructures.Item with CDL verification
; Bank: 0x07, Address: $8000
; CDL Coverage: 78.1% (verified 2026-01-03)
; ============================================================================
; Item ID format: Bottom 7 bits ($00-$7F) = item ID
;                 High bit ($80) = equipped flag
; ============================================================================

; ============================================================================
; Item Table Location
; ============================================================================
ITEM_TABLE_BANK		= $07		; PRG bank containing item data
ITEM_TABLE_ADDR		= $8000		; CPU address of item table
ITEM_RECORD_SIZE	= 8		; Bytes per item record
ITEM_COUNT		= 220		; Total items in game

; ============================================================================
; Item Record Structure (8 bytes)
; ============================================================================
; Offset  Size  Field               Description
; ------  ----  -----               -----------
;   0      1    type_flags          Equipment slot (bits 0-3), special flags (bits 4-7)
;   1      1    stat_modifier       Attack/Defense bonus (signed, negative = cursed)
;   2      1    special_flags       Elemental/status effects
;   3      2    buy_price           Buy price (16-bit, big-endian)
;   5      2    sell_price          Sell price (16-bit, big-endian)
;   7      1    equip_flags         Character bitmask (who can equip)
; ============================================================================

; Item record field offsets
ITEM_TYPE_FLAGS		= 0		; Type and special flags
ITEM_STAT_MOD		= 1		; Stat modifier (signed)
ITEM_SPECIAL		= 2		; Special effect flags
ITEM_BUY_PRICE_HI	= 3		; Buy price high byte
ITEM_BUY_PRICE_LO	= 4		; Buy price low byte
ITEM_SELL_PRICE_HI	= 5		; Sell price high byte
ITEM_SELL_PRICE_LO	= 6		; Sell price low byte
ITEM_EQUIP_FLAGS	= 7		; Character equip bitmask

; Equipment slot values (bits 0-3 of type_flags)
ITEM_SLOT_CONSUMABLE	= 0		; Usable item
ITEM_SLOT_WEAPON	= 1		; Weapon
ITEM_SLOT_ARMOR		= 2		; Body armor
ITEM_SLOT_SHIELD	= 3		; Shield
ITEM_SLOT_HELMET	= 4		; Helmet/hat
ITEM_SLOT_ACCESSORY	= 5		; Accessory

; Character equip flags (bit positions)
EQUIP_HERO		= $01		; Bit 0: Hero
EQUIP_RAGNAR		= $02		; Bit 1: Ragnar
EQUIP_ALENA		= $04		; Bit 2: Alena
EQUIP_CRISTO		= $08		; Bit 3: Cristo
EQUIP_BREY		= $10		; Bit 4: Brey
EQUIP_TALOON		= $20		; Bit 5: Taloon
EQUIP_MARA		= $40		; Bit 6: Mara
EQUIP_NARA		= $80		; Bit 7: Nara

; ============================================================================
; Weapons ($00-$23)
; ============================================================================
ITEM_CYPRESS_STICK	= $00		; Cypress Stick
ITEM_CLUB		= $01		; Club
ITEM_COPPER_SWORD	= $02		; Copper Sword
ITEM_IRON_CLAW		= $03		; Iron Claw
ITEM_CHAIN_SICKLE	= $04		; Chain Sickle
ITEM_IRON_SPEAR		= $05		; Iron Spear
ITEM_BROAD_SWORD	= $06		; Broad Sword
ITEM_BATTLE_AXE		= $07		; Battle Axe
ITEM_SILVER_TAROT	= $08		; Silver Tarot Cards
ITEM_THORN_WHIP		= $09		; Thorn Whip
ITEM_MORNING_STAR	= $0a		; Morning Star
ITEM_BOOMERANG		= $0b		; Boomerang
ITEM_ABACUS_VIRTUE	= $0c		; Abacus of Virtue
ITEM_IRON_FAN		= $0d		; Iron Fan
ITEM_METAL_BABBLE_SWD	= $0e		; Metal Babble Sword
ITEM_POISON_NEEDLE	= $0f		; Poison Needle
ITEM_STAFF_FORCE	= $10		; Staff of Force
ITEM_STAFF_THUNDER	= $11		; Staff of Thunder
ITEM_DEMON_HAMMER	= $12		; Demon Hammer
ITEM_MULTIEDGE_SWORD	= $13		; Multi-edge Sword
ITEM_ZENITHIAN_SWD_1	= $14		; Zenithian Sword (1)
ITEM_DRAGON_KILLER	= $15		; Dragon Killer
ITEM_STILLETO_EARRINGS	= $16		; Stilleto Earrings
ITEM_STAFF_PUNISHMENT	= $17		; Staff of Punishment
ITEM_SWORD_LETHARGY	= $18		; Sword of Lethargy
ITEM_VENOMOUS_DAGGER	= $19		; Venomous Dagger
ITEM_FIRE_CLAW		= $1a		; Fire Claw
ITEM_ICE_BLADE		= $1b		; Ice Blade
ITEM_SWORD_MIRACLES	= $1c		; Sword of Miracles
ITEM_STAFF_ANTIMAGIC	= $1d		; Staff of Antimagic
ITEM_MAGMA_STAFF	= $1e		; Magma Staff
ITEM_SWORD_DECIMATION	= $1f		; Sword of Decimation
ITEM_STAFF_HEALING	= $20		; Staff of Healing
ITEM_ZENITHIAN_SWD_2	= $21		; Zenithian Sword (2)
ITEM_STAFF_JUBILATION	= $22		; Staff of Jubilation
ITEM_SWORD_MALICE	= $23		; Sword of Malice

; ============================================================================
; Armor ($24-$3C)
; ============================================================================
ITEM_BASIC_CLOTHES	= $24		; Basic Clothes
ITEM_WAYFARER_CLOTHES	= $25		; Wayfarer's Clothes
ITEM_LEATHER_ARMOR	= $26		; Leather Armor
ITEM_CHAIN_MAIL		= $27		; Chain Mail
ITEM_HALF_PLATE		= $28		; Half Plate Armor
ITEM_IRON_APRON		= $29		; Iron Apron
ITEM_FULL_PLATE		= $2a		; Full Plate Armor
ITEM_SILK_ROBE		= $2b		; Silk Robe
ITEM_DANCER_COSTUME	= $2c		; Dancer's Costume
ITEM_BRONZE_ARMOR	= $2d		; Bronze Armor
ITEM_METAL_BABBLE_ARM	= $2e		; Metal Babble Armor
ITEM_FUR_COAT		= $2f		; Fur Coat
ITEM_LEATHER_DRESS	= $30		; Leather Dress
ITEM_PINK_LEOTARD	= $31		; Pink Leotard
ITEM_DRAGON_MAIL	= $32		; Dragon Mail
ITEM_CLOAK_EVASION	= $33		; Cloak of Evasion
ITEM_SACRED_ROBE	= $34		; Sacred Robe
ITEM_WATER_FLYING	= $35		; Water Flying Clothes
ITEM_MYSTERIOUS_BOLERO	= $36		; Mysterious Bolero
ITEM_ZENITHIAN_ARMOR	= $37		; Zenithian Armor
ITEM_SWORDEDGE_ARMOR	= $38		; Swordedge Armor
ITEM_ROBE_SERENITY	= $39		; Robe of Serenity
ITEM_ZOMBIE_MAIL	= $3a		; Zombie Mail
ITEM_DRESS_RADIANCE	= $3b		; Dress of Radiance
ITEM_DEMON_ARMOR	= $3c		; Demon Armor

; ============================================================================
; Shields ($3D-$45)
; ============================================================================
ITEM_LEATHER_SHIELD	= $3d		; Leather Shield
ITEM_SCALE_SHIELD	= $3e		; Scale Shield
ITEM_IRON_SHIELD	= $3f		; Iron Shield
ITEM_SHIELD_STRENGTH	= $40		; Shield of Strength
ITEM_MIRROR_SHIELD	= $41		; Mirror Shield
ITEM_AEOLUS_SHIELD	= $42		; Aeolus' Shield
ITEM_DRAGON_SHIELD	= $43		; Dragon Shield
ITEM_ZENITHIAN_SHIELD	= $44		; Zenithian Shield
ITEM_METAL_BABBLE_SHLD	= $45		; Metal Babble Shield

; ============================================================================
; Helms ($46-$4F)
; ============================================================================
ITEM_LEATHER_HAT	= $46		; Leather Hat
ITEM_WOODEN_HAT		= $47		; Wooden Hat
ITEM_IRON_HELMET	= $48		; Iron Helmet
ITEM_IRON_MASK		= $49		; Iron Mask
ITEM_FEATHER_HAT	= $4a		; Feather Hat
ITEM_ZENITHIAN_HELM	= $4b		; Zenithian Helm
ITEM_MASK_CORRUPTION	= $4c		; Mask of Corruption
ITEM_GOLDEN_BARRETTE	= $4d		; Golden Barrette
ITEM_HAT_HAPPINESS	= $4e		; Hat of Happiness
ITEM_METAL_BABBLE_HELM	= $4f		; Metal Babble Helm

; ============================================================================
; Accessories ($50)
; ============================================================================
ITEM_METEORITE_ARMBAND	= $50		; Meteorite Armband

; ============================================================================
; Separator ($51) - Equipment/Item boundary
; ============================================================================
ITEM_SEPARATOR		= $51		; ??? (Blank Name)

; ============================================================================
; Consumables & Key Items ($52-$7E)
; ============================================================================
ITEM_BARONS_HORN	= $52		; Baron's Horn
ITEM_MEDICAL_HERB	= $53		; Medical Herb
ITEM_ANTIDOTE_HERB	= $54		; Antidote Herb
ITEM_FAIRY_WATER	= $55		; Fairy Water
ITEM_WING_WYVERN	= $56		; Wing of Wyvern
ITEM_LEAF_WORLD_TREE	= $57		; Leaf of World Tree
ITEM_FULL_MOON_HERB	= $58		; Full Moon Herb
ITEM_WIZARDS_RING	= $59		; Wizard's Ring
ITEM_MAGIC_POTION	= $5a		; Magic Potion
ITEM_DEW_WORLD_TREE	= $5b		; Dew of World Tree
ITEM_FLUTE_UNCOVERING	= $5c		; Flute of Uncovering
ITEM_SPHERE_SILENCE	= $5d		; Sphere of Silence
ITEM_SCENT_POUCH	= $5e		; Scent Pouch
ITEM_SANDGLASS_REGRESS	= $5f		; Sandglass of Regression
ITEM_SAGES_STONE	= $60		; Sage's Stone
ITEM_STRENGTH_SEED	= $61		; Strength Seed
ITEM_AGILITY_SEED	= $62		; Agility Seed
ITEM_LUCK_SEED		= $63		; Luck Seed
ITEM_LIFEFORCE_NUTS	= $64		; Lifeforce Nuts
ITEM_MYSTIC_ACORNS	= $65		; Mystic Acorns
ITEM_MIRROR_RA		= $66		; Mirror of Ra
ITEM_LAMP_DARKNESS	= $67		; Lamp of Darkness
ITEM_STAFF_TRANSFORM	= $68		; Staff of Transform
ITEM_SMALL_MEDAL	= $69		; Small Medal
ITEM_STONE_DROUGHT	= $6a		; Stone of Drought
ITEM_IRON_SAFE		= $6b		; Iron Safe
ITEM_FLYING_SHOES	= $6c		; Flying Shoes
ITEM_SILVER_STATUETTE	= $6d		; Silver Statuette
ITEM_TREASURE_MAP	= $6e		; Treasure Map
ITEM_SYMBOL_FAITH	= $6f		; Symbol of Faith
ITEM_GUNPOWDER_JAR	= $70		; Gunpowder Jar
ITEM_THIEFS_KEY		= $71		; Thief's Key
ITEM_MAGIC_KEY		= $72		; Magic Key
ITEM_FINAL_KEY		= $73		; Final Key
ITEM_LUNCH		= $74		; Lunch
ITEM_BIRDSONG_NECTAR	= $75		; Birdsong Nector
ITEM_GOLDEN_BRACELET	= $76		; Golden Bracelet
ITEM_PRINCES_LETTER	= $77		; Prince's Letter
ITEM_ROYAL_SCROLL	= $78		; Royal Scroll
ITEM_GUM_POD		= $79		; Gum Pod
ITEM_BOARDING_PASS	= $7a		; Boarding Pass
ITEM_PADEQUIA_ROOT	= $7b		; Padequia Root
ITEM_FIRE_SERENITY	= $7c		; Fire of Serenity
ITEM_GAS_CANISTER	= $7d		; Gas Canister
ITEM_PADEQUIA_SEED	= $7e		; Padequia Seed

; ============================================================================
; Special Values
; ============================================================================
ITEM_NONE		= $7f		; No item in slot
ITEM_EQUIPPED_BIT	= $80		; Equipped flag bit

; ============================================================================
; Item Category Ranges
; ============================================================================
ITEM_WEAPON_FIRST	= ITEM_CYPRESS_STICK	; $00
ITEM_WEAPON_LAST	= ITEM_SWORD_MALICE	; $23
ITEM_ARMOR_FIRST	= ITEM_BASIC_CLOTHES	; $24
ITEM_ARMOR_LAST		= ITEM_DEMON_ARMOR	; $3C
ITEM_SHIELD_FIRST	= ITEM_LEATHER_SHIELD	; $3D
ITEM_SHIELD_LAST	= ITEM_METAL_BABBLE_SHLD	; $45
ITEM_HELM_FIRST		= ITEM_LEATHER_HAT	; $46
ITEM_HELM_LAST		= ITEM_METAL_BABBLE_HELM	; $4F
ITEM_ACCESSORY_FIRST	= ITEM_METEORITE_ARMBAND	; $50
ITEM_ACCESSORY_LAST	= ITEM_METEORITE_ARMBAND	; $50
ITEM_EQUIPMENT_LAST	= ITEM_METEORITE_ARMBAND	; $50 (last equipment)
ITEM_CONSUMABLE_FIRST	= ITEM_BARONS_HORN	; $52
ITEM_CONSUMABLE_LAST	= ITEM_PADEQUIA_SEED	; $7E

; ============================================================================
; Macros for item manipulation
; ============================================================================

; Check if item is equipped (result in carry flag)
; Usage: IS_EQUIPPED $A0
;        bcs .equipped
.macro IS_EQUIPPED value
	.if .const(value)
		.if value & ITEM_EQUIPPED_BIT
			sec		; Item is equipped
		.else
			clc		; Item is not equipped
		.endif
	.else
		; For A register value
		and #ITEM_EQUIPPED_BIT
		cmp #ITEM_EQUIPPED_BIT
	.endif
.endmacro

; Get item ID (strip equipped bit)
; Usage: GET_ITEM_ID
;        (assumes item value in A register)
.macro GET_ITEM_ID
	and #$7f		; Strip equipped bit
.endmacro

; Check if item is weapon
; Usage: IS_WEAPON
;        bcc .is_weapon
.macro IS_WEAPON
	and #$7f
	cmp #ITEM_WEAPON_LAST+1
.endmacro

; Check if item is equipment (vs consumable)
; Usage: IS_EQUIPMENT
;        bcc .is_equipment
.macro IS_EQUIPMENT
	and #$7f
	cmp #ITEM_EQUIPMENT_LAST+1
.endmacro

; ============================================================================
; End of items.inc
; ============================================================================
