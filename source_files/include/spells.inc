; ============================================================================
; Dragon Warrior IV - Spell Definitions
; ============================================================================
; Spell constants and character spell assignments
; Source: GameInfo wiki documentation (SRAM Map)
; ============================================================================

; ============================================================================
; Spell Type Categories
; ============================================================================
SPELL_TYPE_HEAL		= $00		; Healing spells
SPELL_TYPE_ATTACK	= $01		; Damage dealing spells
SPELL_TYPE_SUPPORT	= $02		; Buff/debuff spells
SPELL_TYPE_FIELD	= $03		; Overworld spells

; ============================================================================
; Hero Spells - Battle Byte 1 (offset +$1B)
; ============================================================================
HERO_B1_EXPEL		= %00000001	; Bit 0 - Expel
HERO_B1_HEALMORE	= %00000010	; Bit 1 - Healmore
HERO_B1_BLAZE		= %00000100	; Bit 2 - Blaze
HERO_B1_RETURN		= %00001000	; Bit 3 - Return
HERO_B1_SLEEPMORE	= %00010000	; Bit 4 - Sleepmore
HERO_B1_AWAKE		= %00100000	; Bit 5 - Awake
HERO_B1_FIREBAL		= %01000000	; Bit 6 - Firebal
HERO_B1_HEALALL		= %10000000	; Bit 7 - Healall

; Hero Spells - Battle Byte 2 (offset +$1C)
HERO_B2_IRONIZE		= %00000001	; Bit 0 - Ironize
HERO_B2_FENDSPELL	= %00000010	; Bit 1 - FendSpell
HERO_B2_ZAP		= %00000100	; Bit 2 - Zap
HERO_B2_TRANSFORM	= %00001000	; Bit 3 - Transform
HERO_B2_BOOM		= %00010000	; Bit 4 - Boom
HERO_B2_HEALUSALL	= %00100000	; Bit 5 - Healusall
HERO_B2_LIGHTNING	= %01000000	; Bit 6 - Lightning
HERO_B2_VIVIFY		= %10000000	; Bit 7 - Vivify

; Hero Spells - World Byte (offset +$1D)
HERO_W_THORDAIN		= %00000001	; Bit 0 - Thordain (battle)
HERO_W_CHANCE		= %00000010	; Bit 1 - Chance (battle)
HERO_W_RETURN		= %00000100	; Bit 2 - Return
HERO_W_HEALMORE		= %00001000	; Bit 3 - Healmore
HERO_W_REPEL		= %00010000	; Bit 4 - Repel
HERO_W_OUTSIDE		= %00100000	; Bit 5 - Outside
HERO_W_HEALALL		= %01000000	; Bit 6 - Healall
HERO_W_VIVIFY		= %10000000	; Bit 7 - Vivify

; ============================================================================
; Cristo Spells - Battle Byte 1 (offset +$1B)
; ============================================================================
CRISTO_B1_UPPER		= %00000001	; Bit 0 - Upper
CRISTO_B1_HEAL		= %00000010	; Bit 1 - Heal
CRISTO_B1_SURROUND	= %00000100	; Bit 2 - Surround
CRISTO_B1_HEALMORE	= %00001000	; Bit 3 - Healmore
CRISTO_B1_STOPSPELL	= %00010000	; Bit 4 - StopSpell
CRISTO_B1_HEALALL	= %00100000	; Bit 5 - Healall
CRISTO_B1_INCREASE	= %01000000	; Bit 6 - Increase
CRISTO_B1_HEALUS	= %10000000	; Bit 7 - Healus

; Cristo Spells - Battle Byte 2 (offset +$1C)
CRISTO_B2_BEAT		= %00000001	; Bit 0 - Beat
CRISTO_B2_VIVIFY	= %00000010	; Bit 1 - Vivify
CRISTO_B2_DEFEAT	= %00000100	; Bit 2 - Defeat
CRISTO_B2_REVIVE	= %00001000	; Bit 3 - Revive
; Bits 4-7 unused

; Cristo Spells - World Byte (offset +$1D)
CRISTO_W_HEAL		= %00000001	; Bit 0 - Heal
CRISTO_W_ANTIDOTE	= %00000010	; Bit 1 - Antidote
CRISTO_W_HEALMORE	= %00001000	; Bit 2 - Healmore
CRISTO_W_VIVIFY		= %00001000	; Bit 3 - Vivify
CRISTO_W_HEALALL	= %00010000	; Bit 4 - Healall
CRISTO_W_HEALUS		= %00100000	; Bit 5 - Healus
CRISTO_W_REVIVE		= %01000000	; Bit 6 - Revive
; Bit 7 unused

; ============================================================================
; Nara Spells - Battle Byte 1 (offset +$1B)
; ============================================================================
NARA_B1_INFERNOS	= %00000001	; Bit 0 - Infernos
NARA_B1_HEAL		= %00000010	; Bit 1 - Heal
NARA_B1_SLEEP		= %00000100	; Bit 2 - Sleep
NARA_B1_HEALMORE	= %00001000	; Bit 3 - Healmore
NARA_B1_NUMBOFF		= %00010000	; Bit 4 - NumbOff
NARA_B1_HEALALL		= %00100000	; Bit 5 - Healall
NARA_B1_INFERMORE	= %01000000	; Bit 6 - Infermore
NARA_B1_BARRIER		= %10000000	; Bit 7 - Barrier

; Nara Spells - Battle Byte 2 (offset +$1C)
NARA_B2_SLEEPMORE	= %00000001	; Bit 0 - Sleepmore
NARA_B2_VIVIFY		= %00000010	; Bit 1 - Vivify
NARA_B2_INFERMOST	= %00000100	; Bit 2 - Infermost
NARA_B2_FAREWELL	= %00001000	; Bit 3 - Farewell
; Bits 4-7 unused

; Nara Spells - World Byte (offset +$1D)
NARA_W_HEAL		= %00000001	; Bit 0 - Heal
NARA_W_NUMBOFF		= %00000010	; Bit 1 - NumbOff
NARA_W_HEALMORE		= %00000100	; Bit 2 - Healmore
NARA_W_VIVIFY		= %00001000	; Bit 3 - Vivify
NARA_W_HEALALL		= %00010000	; Bit 4 - Healall
; Bits 5-7 unused

; ============================================================================
; Mara Spells - Battle Byte 1 (offset +$1B)
; ============================================================================
MARA_B1_BLAZE		= %00000001	; Bit 0 - Blaze
MARA_B1_SAP		= %00000010	; Bit 1 - Sap
MARA_B1_FIREBAL		= %00000100	; Bit 2 - Firebal
MARA_B1_ROBMAGIC	= %00001000	; Bit 3 - RobMagic
MARA_B1_BANG		= %00010000	; Bit 4 - Bang
MARA_B1_BEDRAGON	= %00100000	; Bit 5 - BeDragon
MARA_B1_BLAZEMORE	= %01000000	; Bit 6 - Blazemore
MARA_B1_BLAZEMOST	= %10000000	; Bit 7 - Blazemost

; Mara Spells - Battle Byte 2 (offset +$1C)
MARA_B2_FIREBANE	= %00000001	; Bit 0 - Firebane
MARA_B2_FIREVOLT	= %00000010	; Bit 1 - Firevolt
MARA_B2_BOOM		= %00000100	; Bit 2 - Boom
MARA_B2_EXPLODET	= %00001000	; Bit 3 - Explodet
; Bits 4-7 unused

; Mara Spells - World Byte (offset +$1D)
MARA_W_RETURN		= %00000001	; Bit 0 - Return
MARA_W_OUTSIDE		= %00000010	; Bit 1 - Outside
MARA_W_STEPGUARD	= %00000100	; Bit 2 - StepGuard
; Bits 3-7 unused

; ============================================================================
; Brey Spells - Battle Byte 1 (offset +$1B)
; ============================================================================
BREY_B1_ICEBOLT		= %00000001	; Bit 0 - IceBolt
BREY_B1_SAP		= %00000010	; Bit 1 - Sap
BREY_B1_SNOWSTORM	= %00000100	; Bit 2 - Snowstorm
BREY_B1_BOUNCE		= %00001000	; Bit 3 - Bounce
BREY_B1_ICESPEARS	= %00010000	; Bit 4 - Icespears
BREY_B1_RETURN		= %00100000	; Bit 5 - Return
BREY_B1_ROBMAGIC	= %01000000	; Bit 6 - RobMagic
BREY_B1_DEFENCE		= %10000000	; Bit 7 - Defence

; Brey Spells - Battle Byte 2 (offset +$1C)
BREY_B2_CHAOS		= %00000001	; Bit 0 - Chaos
BREY_B2_SPEEDUP		= %00000010	; Bit 1 - SpeedUp
BREY_B2_BLIZZARD	= %00000100	; Bit 2 - Blizzard
BREY_B2_BIKILL		= %00001000	; Bit 3 - Bikill
; Bits 4-7 unused

; Brey Spells - World Byte (offset +$1D)
BREY_W_RETURN		= %00000001	; Bit 0 - Return
BREY_W_OUTSIDE		= %00000010	; Bit 1 - Outside
BREY_W_DAYNIGHT		= %00000100	; Bit 2 - Day-Night
BREY_W_XRAY		= %00001000	; Bit 3 - X-Ray
; Bits 4-7 unused

; ============================================================================
; Taloon, Ragnar, Alena - No Spells
; ============================================================================
; These characters have no spell bytes - their spell bytes are n/a

; ============================================================================
; Spell Byte Offsets (from character base address)
; ============================================================================
SPELL_BYTE1_OFFSET	= $1b		; First battle spell byte
SPELL_BYTE2_OFFSET	= $1c		; Second battle spell byte
SPELL_WORLD_OFFSET	= $1d		; World/additional spells byte

; ============================================================================
; Spell Names (for reference/display)
; ============================================================================

; Healing Spells
SPELL_HEAL		= $00		; Basic heal
SPELL_HEALMORE		= $01		; Medium heal
SPELL_HEALALL		= $02		; Full heal one
SPELL_HEALUS		= $03		; Heal all party
SPELL_HEALUSALL		= $04		; Full heal all party
SPELL_VIVIFY		= $05		; Revive (50% HP)
SPELL_REVIVE		= $06		; Full revive

; Status Cure
SPELL_ANTIDOTE		= $10		; Cure poison
SPELL_AWAKE		= $11		; Cure sleep
SPELL_NUMBOFF		= $12		; Cure paralysis

; Fire Spells (Mara)
SPELL_BLAZE		= $20		; Fire one
SPELL_FIREBAL		= $21		; Fire group
SPELL_BLAZEMORE		= $22		; Fire strong one
SPELL_BLAZEMOST		= $23		; Fire strongest one
SPELL_FIREBANE		= $24		; Fire breath attack
SPELL_FIREVOLT		= $25		; Multi-hit fire

; Ice Spells (Brey)
SPELL_ICEBOLT		= $30		; Ice one
SPELL_SNOWSTORM		= $31		; Ice group
SPELL_ICESPEARS		= $32		; Ice strong
SPELL_BLIZZARD		= $33		; Ice strongest all

; Explosion Spells
SPELL_BANG		= $40		; Explosion one
SPELL_BOOM		= $41		; Explosion group
SPELL_EXPLODET		= $42		; Explosion all

; Lightning Spells (Hero)
SPELL_ZAP		= $50		; Lightning one
SPELL_LIGHTNING		= $51		; Lightning group
SPELL_THORDAIN		= $52		; Lightning ultimate

; Infernos Spells (Nara)
SPELL_INFERNOS		= $60		; Inferno one
SPELL_INFERMORE		= $61		; Inferno group
SPELL_INFERMOST		= $62		; Inferno all

; Status Spells
SPELL_SLEEP		= $70		; Sleep one
SPELL_SLEEPMORE		= $71		; Sleep group
SPELL_STOPSPELL		= $72		; Seal magic
SPELL_CHAOS		= $73		; Confuse
SPELL_BEAT		= $74		; Instant death one
SPELL_DEFEAT		= $75		; Instant death all
SPELL_EXPEL		= $76		; Banish undead

; Support Spells
SPELL_SAP		= $80		; Lower defense one
SPELL_UPPER		= $81		; Raise defense one
SPELL_INCREASE		= $82		; Raise defense all
SPELL_DEFENCE		= $83		; Lower defense all
SPELL_IRONIZE		= $84		; Metal form
SPELL_BIKILL		= $85		; Double attack
SPELL_SPEEDUP		= $86		; Raise agility
SPELL_FENDSPELL		= $87		; Magic resistance
SPELL_BOUNCE		= $88		; Reflect magic
SPELL_BARRIER		= $89		; Fire/ice resist
SPELL_SURROUND		= $8a		; Evade boost
SPELL_ROBMAGIC		= $8b		; Steal MP

; Field Spells
SPELL_RETURN		= $90		; Warp to town
SPELL_OUTSIDE		= $91		; Exit dungeon
SPELL_REPEL		= $92		; Reduce encounters
SPELL_STEPGUARD		= $93		; Immune to floor damage
SPELL_XRAY		= $94		; See enemy HP
SPELL_DAYNIGHT		= $95		; Change time

; Special Spells
SPELL_TRANSFORM		= $a0		; Change appearance
SPELL_CHANCE		= $a1		; Random effect
SPELL_BEDRAGON		= $a2		; Transform to dragon
SPELL_FAREWELL		= $a3		; Kamikaze/sacrifice

; ============================================================================
; Macros for Spell Operations
; ============================================================================

; Check if character has a specific spell
.macro HAS_SPELL char_addr, offset, spell_bit
	lda char_addr + offset
	and #spell_bit
.endmacro

; Grant a spell
.macro GRANT_SPELL char_addr, offset, spell_bit
	lda char_addr + offset
	ora #spell_bit
	sta char_addr + offset
.endmacro

; Remove a spell
.macro REMOVE_SPELL char_addr, offset, spell_bit
	lda char_addr + offset
	and #~(spell_bit)
	sta char_addr + offset
.endmacro

; ============================================================================
; End of spells.inc
; ============================================================================
