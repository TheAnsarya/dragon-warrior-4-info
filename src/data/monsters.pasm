; ============================================================================
; Dragon Warrior IV - Monster Data
; 🌷 Flower Toolchain
; ============================================================================
; This file is AUTO-GENERATED from assets/json/monsters/*.json
; Do not edit directly - edit the JSON files and run json_to_asm.py
;
; To regenerate: python tools/json_to_asm.py --input assets/json --output src/data
; ============================================================================

; ============================================================================
; Monster Data Format (16 bytes per monster)
; ============================================================================
; Offset  Size  Description
; ------  ----  -----------
;   $00   1     HP high byte (HP = high*256 + low from AI byte)
;   $01   1     Attack Power
;   $02   1     Defense Power
;   $03   1     Agility
;   $04   1     Experience low byte
;   $05   1     Experience high byte
;   $06   1     Gold low byte
;   $07   1     Gold high byte
;   $08   1     Spell Set Index (defines available spells/abilities)
;   $09   1     Resistances (elemental/status resistances)
;   $0A   1     AI Behavior + HP low bits
;   $0B   1     Item Drop ID (0 = no drop)
;   $0C   1     Drop Rate (1/N chance, 0 = no drop)
;   $0D   1     Sprite Index
;   $0E   1     Palette Index
;   $0F   1     Flags (undead, metal, boss, etc.)
; ============================================================================

; Monster flags byte breakdown:
MONSTER_FLAG_UNDEAD		= $01	; Takes extra damage from holy attacks
MONSTER_FLAG_METAL		= $02	; Metal slime type (high defense, 1 damage)
MONSTER_FLAG_BOSS		= $04	; Boss monster (can't run, special AI)
MONSTER_FLAG_FLYING		= $08	; Flying (some spells miss)
MONSTER_FLAG_FIRE_BREATH	= $10	; Can use fire breath
MONSTER_FLAG_ICE_BREATH		= $20	; Can use ice breath
MONSTER_FLAG_REGEN		= $40	; Regenerates HP each turn
MONSTER_FLAG_SPLITS		= $80	; Can split into multiple copies

; ============================================================================
; Monster ID Constants
; ============================================================================
; For easy reference when coding battle scripts or encounters

MONSTER_SLIME			= $00
MONSTER_DRAKEE			= $01
MONSTER_GHOST			= $02
MONSTER_MAGICIAN		= $03
MONSTER_HEALSLIME		= $04
MONSTER_BABBLE			= $05
MONSTER_BOMB_CRAG		= $06
MONSTER_DUCKSBILL		= $07
MONSTER_SKELETON		= $08
MONSTER_TROGLODYTE		= $09
MONSTER_CHIMAERA		= $0a
MONSTER_HEALER			= $0b
MONSTER_CHAIN_SICKLE		= $0c
MONSTER_SCORPION		= $0d
MONSTER_METAL_SLIME		= $0e
MONSTER_OZWARG			= $0f

; ... (continues for all 195 monsters)
; Full list generated from JSON data

; ============================================================================
; Monster Stat Tables
; ============================================================================
; These tables are included from generated data files
; The generator creates separate tables for better organization

; Main monster data table (16 bytes × 195 monsters = 3120 bytes)
.align 256			; Align to page boundary for faster lookups
monster_data:
	; TODO: Include generated data here
	; Format: .db hp_hi, atk, def, agi, exp_lo, exp_hi, gold_lo, gold_hi
	;         .db spell_set, resist, ai_hp_lo, drop_id, drop_rate, sprite, pal, flags

; Placeholder data for first 16 monsters (will be replaced by generator)

; Monster $00: Slime
	.db $00			; HP high byte (HP = 8)
	.db $07			; Attack = 7
	.db $03			; Defense = 3
	.db $02			; Agility = 2
	.db $01, $00		; Exp = 1
	.db $01, $00		; Gold = 1
	.db $00			; Spell set = 0 (none)
	.db $00			; Resistances = none
	.db $08			; AI/HP low = 8
	.db $32			; Drop = Herb ($32)
	.db $40			; Drop rate = 1/64
	.db $00			; Sprite index
	.db $00			; Palette index
	.db $00			; Flags = none

; Monster $01: Drakee
	.db $00			; HP high byte (HP = 9)
	.db $09			; Attack = 9
	.db $03			; Defense = 3
	.db $06			; Agility = 6
	.db $02, $00		; Exp = 2
	.db $02, $00		; Gold = 2
	.db $00			; Spell set = 0
	.db $00			; Resistances
	.db $09			; AI/HP low = 9
	.db $33			; Drop = Antidote
	.db $40			; Drop rate = 1/64
	.db $01			; Sprite index
	.db $00			; Palette index
	.db $08			; Flags = flying

; ... (placeholders continue - actual data from generator)

; Reserve space for all 195 monsters
; 195 × 16 = 3120 bytes
.fill 3088			; Remaining space (195-2 = 193 monsters × 16 bytes)

; ============================================================================
; Monster Name Pointers
; ============================================================================
; Pointer table to monster names in the text bank

monster_name_ptrs:
	; TODO: Include generated name pointer table
	.fill 390		; 195 × 2 = 390 bytes

; ============================================================================
; Monster Encounter Groups
; ============================================================================
; Defines which monsters appear together

encounter_groups:
	; TODO: Include generated encounter data
	.fill 512		; Placeholder

; ============================================================================
; Boss Data
; ============================================================================
; Special data for boss monsters with unique behaviors

boss_saro			= 194	; Monster ID for Saro
boss_esturk			= 193	; Monster ID for Estark
boss_necrosaro			= 195	; Monster ID for Necrosaro (final form)
boss_balzack			= 192	; Monster ID for Balzack

; ============================================================================
; End of Monster Data
; ============================================================================
