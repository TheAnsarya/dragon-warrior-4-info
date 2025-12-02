; ============================================================================
; Dragon Warrior IV - Spell Definitions
; ============================================================================
; Spell constants and character spell assignments
; Source: GameInfo wiki documentation (RAM Map)
; ============================================================================

; ============================================================================
; Spell Type Categories
; ============================================================================
SPELL_TYPE_HEAL		= $00		; Healing spells
SPELL_TYPE_ATTACK	= $01		; Damage dealing spells
SPELL_TYPE_SUPPORT	= $02		; Buff/debuff spells
SPELL_TYPE_FIELD	= $03		; Overworld spells

; ============================================================================
; Hero Battle Spells (stored at PMEM_BATTLE_SPELL1/2)
; ============================================================================
; These are bitmask values for the Hero's spell bytes
; Other characters have different spell arrangements

; --- Battle Spell Byte 1 ($601C / +$1B from party base) ---
HERO_SPELL1_EXPEL	= %00000001	; Bit 0 - Expel (instant death vs undead)
HERO_SPELL1_HEALMORE	= %00000010	; Bit 1 - Healmore (medium heal)
HERO_SPELL1_BLAZE	= %00000100	; Bit 2 - Blaze (fire attack)
HERO_SPELL1_RETURN	= %00001000	; Bit 3 - Return (dungeon warp)
HERO_SPELL1_SLEEPMORE	= %00010000	; Bit 4 - Sleepmore (sleep group)
HERO_SPELL1_AWAKE	= %00100000	; Bit 5 - Awake (cure sleep)
HERO_SPELL1_FIREBAL	= %01000000	; Bit 6 - Firebal (fire group)
HERO_SPELL1_HEALALL	= %10000000	; Bit 7 - Healall (full heal one)

; --- Battle Spell Byte 2 ($601D / +$1C from party base) ---
HERO_SPELL2_IRONIZE	= %00000001	; Bit 0 - Ironize (defense boost)
HERO_SPELL2_FENDSPELL	= %00000010	; Bit 1 - FendSpell (magic resist)
HERO_SPELL2_ZAP		= %00000100	; Bit 2 - Zap (lightning one)
HERO_SPELL2_TRANSFORM	= %00001000	; Bit 3 - Transform (change appearance)
HERO_SPELL2_BOOM	= %00010000	; Bit 4 - Boom (explosion group)
HERO_SPELL2_HEALUSALL	= %00100000	; Bit 5 - Healusall (heal party)
HERO_SPELL2_LIGHTNING	= %01000000	; Bit 6 - Lightning (lightning group)
HERO_SPELL2_VIVIFY	= %10000000	; Bit 7 - Vivify (revive)

; --- World Spell Byte ($601E / +$1D from party base) ---
; Bits 0-1 are battle-only spells (Thordain, Chance)
HERO_WSPELL_THORDAIN	= %00000001	; Bit 0 - Thordain (lightning ultimate)
HERO_WSPELL_CHANCE	= %00000010	; Bit 1 - Chance (random effect)
; Bits 2-7 are overworld spells
HERO_WSPELL_RETURN	= %00000100	; Bit 2 - Return (town warp)
HERO_WSPELL_HEALMORE	= %00001000	; Bit 3 - Healmore
HERO_WSPELL_REPEL	= %00010000	; Bit 4 - Repel (reduce encounters)
HERO_WSPELL_OUTSIDE	= %00100000	; Bit 5 - Outside (exit dungeon)
HERO_WSPELL_HEALALL	= %01000000	; Bit 6 - Healall
HERO_WSPELL_VIVIFY	= %10000000	; Bit 7 - Vivify

; ============================================================================
; Spell Names (for reference/display)
; ============================================================================
; These match the in-game spell names

; Healing Spells
SPELL_HEAL		= $00		; Basic heal
SPELL_HEALMORE		= $01		; Medium heal
SPELL_HEALALL		= $02		; Full heal one
SPELL_HEALUSALL		= $03		; Heal all party
SPELL_VIVIFY		= $04		; Revive
SPELL_REVIVE		= $05		; Full revive

; Attack Spells
SPELL_BLAZE		= $10		; Fire one
SPELL_FIREBAL		= $11		; Fire group
SPELL_BLAZEMORE		= $12		; Fire strong one
SPELL_BLAZEMOST		= $13		; Fire strong group
SPELL_BANG		= $14		; Explosion one
SPELL_BOOM		= $15		; Explosion group
SPELL_EXPLODET		= $16		; Explosion all
SPELL_ZAP		= $17		; Lightning one
SPELL_LIGHTNING		= $18		; Lightning group
SPELL_THORDAIN		= $19		; Lightning ultimate

; Status Spells
SPELL_SLEEP		= $20		; Sleep one
SPELL_SLEEPMORE		= $21		; Sleep group
SPELL_AWAKE		= $22		; Cure sleep
SPELL_STOPSPELL		= $23		; Seal magic
SPELL_EXPEL		= $24		; Instant death undead
SPELL_DEFEAT		= $25		; Instant death all

; Support Spells
SPELL_SAPP		= $30		; Lower defense one
SPELL_DEFENSE		= $31		; Raise defense one
SPELL_IRONIZE		= $32		; Greatly raise defense
SPELL_BIKILL		= $33		; Double attack
SPELL_SPEEDUP		= $34		; Raise agility
SPELL_FENDSPELL		= $35		; Magic resistance
SPELL_BOUNCE		= $36		; Reflect magic

; Field Spells
SPELL_RETURN		= $40		; Warp to town
SPELL_OUTSIDE		= $41		; Exit dungeon
SPELL_REPEL		= $42		; Reduce encounters
SPELL_STEPGUARD		= $43		; Immune to floor damage
SPELL_X_RAY		= $44		; See enemy HP

; Special Spells
SPELL_TRANSFORM		= $50		; Change appearance
SPELL_CHANCE		= $51		; Random effect
SPELL_SACRIFICE		= $52		; Kamikazee

; ============================================================================
; Character Spell Byte Offsets
; ============================================================================
; Each character has their own spell arrangement
; Use these offsets from the character's base address

SPELL_BYTE1_OFFSET	= $1b		; First battle spell byte
SPELL_BYTE2_OFFSET	= $1c		; Second battle spell byte
SPELL_WORLD_OFFSET	= $1d		; World/additional spells byte

; ============================================================================
; MP Costs (estimated - needs verification)
; ============================================================================
MP_HEAL			= 2
MP_HEALMORE		= 5
MP_HEALALL		= 7
MP_HEALUSALL		= 18
MP_VIVIFY		= 10
MP_REVIVE		= 20

MP_BLAZE		= 2
MP_FIREBAL		= 4
MP_BLAZEMORE		= 6
MP_BANG			= 5
MP_BOOM			= 8
MP_ZAP			= 4
MP_LIGHTNING		= 8
MP_THORDAIN		= 15

MP_SLEEP		= 2
MP_SLEEPMORE		= 5
MP_AWAKE		= 2
MP_STOPSPELL		= 3
MP_EXPEL		= 2

MP_SAPP			= 3
MP_DEFENSE		= 2
MP_IRONIZE		= 6
MP_BIKILL		= 6
MP_SPEEDUP		= 3
MP_FENDSPELL		= 3

MP_RETURN		= 1
MP_OUTSIDE		= 2
MP_REPEL		= 4

; ============================================================================
; Macros for Spell Operations
; ============================================================================

; Check if character has a specific spell (Hero byte 1)
; Usage: HAS_HERO_SPELL1 party_hero, HERO_SPELL1_HEALMORE
;        bne .has_spell
.macro HAS_HERO_SPELL1 char_addr, spell_bit
	lda char_addr + SPELL_BYTE1_OFFSET
	and #spell_bit
.endmacro

; Check if character has a specific spell (Hero byte 2)
.macro HAS_HERO_SPELL2 char_addr, spell_bit
	lda char_addr + SPELL_BYTE2_OFFSET
	and #spell_bit
.endmacro

; Check if character has a world spell
.macro HAS_WORLD_SPELL char_addr, spell_bit
	lda char_addr + SPELL_WORLD_OFFSET
	and #spell_bit
.endmacro

; Grant a spell (Hero byte 1)
.macro GRANT_HERO_SPELL1 char_addr, spell_bit
	lda char_addr + SPELL_BYTE1_OFFSET
	ora #spell_bit
	sta char_addr + SPELL_BYTE1_OFFSET
.endmacro

; Grant a spell (Hero byte 2)
.macro GRANT_HERO_SPELL2 char_addr, spell_bit
	lda char_addr + SPELL_BYTE2_OFFSET
	ora #spell_bit
	sta char_addr + SPELL_BYTE2_OFFSET
.endmacro

; Grant a world spell
.macro GRANT_WORLD_SPELL char_addr, spell_bit
	lda char_addr + SPELL_WORLD_OFFSET
	ora #spell_bit
	sta char_addr + SPELL_WORLD_OFFSET
.endmacro

; ============================================================================
; Notes
; ============================================================================
; - Spell byte arrangements differ per character class
; - Cristo, Nara have healing spells in different bit positions
; - Mara, Brey have attack spells in different bit positions
; - The Hero has a unique spell set combining heal/attack/support
; - Further character spell layouts need to be documented from ROM analysis

; ============================================================================
; End of spells.inc
; ============================================================================
