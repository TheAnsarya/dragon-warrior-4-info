; ============================================================================
; Dragon Warrior IV - Spell Data
; 🌷 Flower Toolchain
; ============================================================================
; This file is AUTO-GENERATED from assets/json/spells/*.json
; Do not edit directly - edit the JSON files and run json_to_asm.py
;
; To regenerate: python tools/json_to_asm.py --input assets/json --output src/data
; ============================================================================

; ============================================================================
; Spell Data Format (8 bytes per spell)
; ============================================================================
; Offset  Size  Description
; ------  ----  -----------
;   $00   1     MP Cost
;   $01   1     Target Type (single enemy, all enemies, single ally, all allies)
;   $02   1     Spell Type (attack, heal, buff, debuff, status, field)
;   $03   1     Element (fire, ice, electric, etc.)
;   $04   1     Base Power / Effect Value
;   $05   1     Level Required (or 0 if item-only)
;   $06   1     Who Can Learn (bit flags like items)
;   $07   1     Spell Flags (can reflect, resistable, etc.)
; ============================================================================

; Target type constants
SPELL_TARGET_SINGLE_ENEMY	= $00	; One enemy
SPELL_TARGET_ALL_ENEMIES	= $01	; All enemies in battle
SPELL_TARGET_ENEMY_GROUP	= $02	; One group of enemies
SPELL_TARGET_SINGLE_ALLY	= $03	; One party member
SPELL_TARGET_ALL_ALLIES		= $04	; All party members
SPELL_TARGET_SELF		= $05	; Caster only
SPELL_TARGET_WAGON		= $06	; Wagon members

; Spell type constants
SPELL_TYPE_ATTACK		= $00	; Damage spell
SPELL_TYPE_HEAL			= $01	; HP restoration
SPELL_TYPE_REVIVE		= $02	; Revive from death
SPELL_TYPE_CURE_STATUS		= $03	; Cure status effects
SPELL_TYPE_BUFF			= $04	; Increase stats
SPELL_TYPE_DEBUFF		= $05	; Decrease enemy stats
SPELL_TYPE_STATUS		= $06	; Inflict status effect
SPELL_TYPE_FIELD		= $07	; Overworld spell
SPELL_TYPE_SPECIAL		= $08	; Special effect

; Element constants
SPELL_ELEMENT_NONE		= $00	; Non-elemental
SPELL_ELEMENT_FIRE		= $01	; Fire
SPELL_ELEMENT_ICE		= $02	; Ice/Blizzard
SPELL_ELEMENT_ELECTRIC		= $03	; Lightning
SPELL_ELEMENT_WIND		= $04	; Wind/Vacuum
SPELL_ELEMENT_HOLY		= $05	; Holy/Light
SPELL_ELEMENT_DARK		= $06	; Dark/Evil
SPELL_ELEMENT_EXPLOSION		= $07	; Bang/Explosion
SPELL_ELEMENT_ROCK		= $08	; Earth/Rock

; Spell flags
SPELL_FLAG_RESISTABLE		= $01	; Can be resisted
SPELL_FLAG_REFLECTABLE		= $02	; Can be reflected by Bounce
SPELL_FLAG_OUTDOOR_ONLY		= $04	; Only works outside
SPELL_FLAG_BATTLE_ONLY		= $08	; Only in battle
SPELL_FLAG_FIELD_ONLY		= $10	; Only outside battle
SPELL_FLAG_DAYTIME_ONLY		= $20	; Only during day
SPELL_FLAG_NIGHTTIME_ONLY	= $40	; Only at night
SPELL_FLAG_WORLD_MAP_ONLY	= $80	; Only on overworld

; Who can learn (character flags)
LEARN_HERO			= $01
LEARN_RAGNAR			= $02	; (Ragnar doesn't learn spells)
LEARN_ALENA			= $04	; (Alena doesn't learn spells)
LEARN_CRISTO			= $08
LEARN_BREY			= $10
LEARN_TALOON			= $20	; (Taloon doesn't learn spells)
LEARN_NARA			= $40
LEARN_MARA			= $80

; ============================================================================
; Spell ID Constants
; ============================================================================

; Attack Spells ($00-$1F)
SPELL_BLAZE			= $00	; Single enemy fire
SPELL_BLAZEMORE			= $01	; Single enemy stronger fire
SPELL_BLAZEMOST			= $02	; Single enemy ultimate fire
SPELL_FIREBANE			= $03	; All enemies fire
SPELL_FIREBOLT			= $04	; All enemies stronger fire
SPELL_FIREMOST			= $05	; All enemies ultimate fire

SPELL_SNOWSTORM			= $06	; Enemy group ice
SPELL_ICEBOLT			= $07	; All enemies ice
SPELL_SNOWBLAST			= $08	; All enemies stronger ice

SPELL_ZAP			= $09	; All enemies lightning
SPELL_ZAPMORE			= $0a	; All enemies stronger lightning
SPELL_ZAPMOST			= $0b	; All enemies ultimate lightning

SPELL_BANG			= $0c	; All enemies explosion
SPELL_BOOM			= $0d	; All enemies stronger explosion
SPELL_KABOOM			= $0e	; All enemies ultimate explosion

SPELL_INFERNOS			= $0f	; Fire breath attack
SPELL_SCORCHING			= $10	; Stronger fire breath
SPELL_PYRE			= $11	; Ultimate fire breath

; Healing Spells ($20-$2F)
SPELL_HEAL			= $20	; Single ally minor heal
SPELL_HEALMORE			= $21	; Single ally medium heal
SPELL_HEALALL			= $22	; Single ally full heal
SPELL_HEALUS			= $23	; All allies heal
SPELL_HEALUSALL			= $24	; All allies full heal

SPELL_VIVIFY			= $25	; Revive (50% chance)
SPELL_REVIVE			= $26	; Revive (100%)

; Cure Status Spells ($30-$3F)
SPELL_ANTIDOTE			= $30	; Cure poison
SPELL_AWAKEN			= $31	; Cure sleep
SPELL_NUMBOFF			= $32	; Cure paralysis
SPELL_CURSE_OFF			= $33	; Cure curse

; Buff Spells ($40-$4F)
SPELL_SAPS			= $40	; Lower enemy defense (single)
SPELL_DEFENSE			= $41	; Raise party defense
SPELL_UPPER			= $42	; Raise single ally attack
SPELL_BIKILL			= $43	; Double attack power
SPELL_INCREASE			= $44	; Raise defense significantly
SPELL_SPEED_UP			= $45	; Raise agility
SPELL_BOUNCE			= $46	; Reflect spells
SPELL_BARRIER			= $47	; Reduce breath damage

; Debuff Spells ($50-$5F)
SPELL_SURROUND			= $48	; Lower enemy accuracy
SPELL_ROBMAGIC			= $49	; Steal enemy MP
SPELL_STOPSPELL			= $4a	; Seal enemy magic
SPELL_CHAOS			= $4b	; Confuse enemy
SPELL_LIMBO			= $4c	; Instant death (low chance)
SPELL_DEFEAT			= $4d	; Instant death (medium chance)
SPELL_THORDAIN			= $4e	; Ultimate lightning (all)

; Status Spells ($60-$6F)
SPELL_SLEEP			= $60	; Put enemy to sleep
SPELL_BEAT			= $61	; Instant death single
SPELL_DEFEAT_ALL		= $62	; Instant death all

; Field Spells ($70-$7F)
SPELL_OUTSIDE			= $70	; Exit dungeon
SPELL_RETURN			= $71	; Teleport to town
SPELL_STEPGUARD			= $72	; Prevent damage tiles
SPELL_X_RAY			= $73	; See hidden items
SPELL_REPEL			= $74	; Reduce encounters
SPELL_HOLY_PROTECTION		= $75	; Reduce encounters (better)
SPELL_TRANSFORM			= $76	; Change appearance
SPELL_IRONIZE			= $77	; Become invulnerable
SPELL_CHANCE			= $78	; Random effect

; ============================================================================
; Spell Data Table (8 bytes × ~90 spells = ~720 bytes)
; ============================================================================

.align 256
spell_data:
	; TODO: Include generated data here

; Placeholder for first few spells (will be replaced by generator)

; Spell $00: Blaze - Single target fire attack
	.db $02			; MP cost = 2
	.db SPELL_TARGET_SINGLE_ENEMY
	.db SPELL_TYPE_ATTACK
	.db SPELL_ELEMENT_FIRE
	.db $10			; Base power = 16
	.db $01			; Level required = 1
	.db LEARN_HERO | LEARN_MARA	; Who can learn
	.db SPELL_FLAG_RESISTABLE | SPELL_FLAG_REFLECTABLE

; Spell $01: Blazemore
	.db $04			; MP cost = 4
	.db SPELL_TARGET_SINGLE_ENEMY
	.db SPELL_TYPE_ATTACK
	.db SPELL_ELEMENT_FIRE
	.db $40			; Base power = 64
	.db $14			; Level 20
	.db LEARN_HERO | LEARN_MARA
	.db SPELL_FLAG_RESISTABLE | SPELL_FLAG_REFLECTABLE

; Spell $20: Heal
	.db $02			; MP cost = 2
	.db SPELL_TARGET_SINGLE_ALLY
	.db SPELL_TYPE_HEAL
	.db SPELL_ELEMENT_NONE
	.db $1e			; Heal ~30 HP
	.db $01			; Level 1
	.db LEARN_HERO | LEARN_CRISTO | LEARN_NARA
	.db $00			; No special flags

; Reserve space for all spells
.fill 696			; Remaining space

; ============================================================================
; Spell Name Pointers
; ============================================================================
spell_name_ptrs:
	; TODO: Include generated name pointer table
	.fill 180		; 90 × 2 = 180 bytes

; ============================================================================
; Spell Level Learning Tables
; ============================================================================
; For each character, lists which spells they learn at which levels

; Hero spell learning
hero_spell_levels:
	.db $01, SPELL_HEAL		; Level 1: Heal
	.db $03, SPELL_BLAZE		; Level 3: Blaze
	.db $05, SPELL_RETURN		; Level 5: Return
	.db $07, SPELL_OUTSIDE		; Level 7: Outside
	.db $09, SPELL_HEALMORE		; Level 9: Healmore
	.db $0c, SPELL_REPEL		; Level 12: Repel
	.db $0f, SPELL_BLAZEMORE	; Level 15: Blazemore
	; ... continues
	.db $ff			; End marker

; Cristo spell learning
cristo_spell_levels:
	.db $01, SPELL_HEAL		; Level 1: Heal
	.db $02, SPELL_ANTIDOTE		; Level 2: Antidote
	.db $04, SPELL_UPPER		; Level 4: Upper
	; ... continues
	.db $ff			; End marker

; Brey spell learning
brey_spell_levels:
	.db $01, SPELL_BLAZE		; Level 1: Blaze
	.db $02, SPELL_SLEEP		; Level 2: Sleep
	; ... continues
	.db $ff			; End marker

; Nara spell learning
nara_spell_levels:
	.db $01, SPELL_HEAL		; Level 1: Heal
	.db $02, SPELL_LIMBO		; Level 2: Limbo
	; ... continues
	.db $ff			; End marker

; Mara spell learning
mara_spell_levels:
	.db $01, SPELL_BLAZE		; Level 1: Blaze
	.db $03, SPELL_FIREBANE		; Level 3: Firebane
	; ... continues
	.db $ff			; End marker

; ============================================================================
; Spell Animation Data
; ============================================================================
spell_anim_ptrs:
	; TODO: Include generated animation data pointers
	.fill 180		; 90 × 2 = 180 bytes

; ============================================================================
; End of Spell Data
; ============================================================================
