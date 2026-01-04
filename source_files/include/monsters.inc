; ============================================================================
; Dragon Warrior IV - Monster Definitions
; ============================================================================
; Monster data structure and constants
; Source: DW4Lib.DataStructures.Monster with CDL verification
; Bank: 0x06, Address: $A2A2
; CDL Coverage: 99.8% (verified 2026-01-03)
; ============================================================================

; ============================================================================
; Monster Table Location
; ============================================================================
MONSTER_TABLE_BANK	= $06		; PRG bank containing monster data
MONSTER_TABLE_ADDR	= $a2a2		; CPU address of monster table
MONSTER_RECORD_SIZE	= 27		; Bytes per monster record

; ============================================================================
; Monster Record Structure (27 bytes)
; ============================================================================
; Offset  Size  Field               Description
; ------  ----  -----               -----------
;   0      2    experience          Experience points (16-bit LE)
;   2      2    gold                Gold dropped (16-bit LE)
;   4      2    hit_points          HP (16-bit LE)
;   6      1    attack              Attack power
;   7      1    defense             Defense power
;   8      1    agility             Agility
;   9      6    skill_data          Skill/ability bytes
;  15      4    behavior_data       AI behavior patterns
;  19      1    item_drop_id        Item drop ID (references item table)
;  20      1    unknown20           AI/behavior flags (82 unique values, avg=102.9)
;  21      1    unknown21           AI/behavior flags (89 unique values, avg=107.5)
;  22      1    metal_flags         Metal monster flags (bits 0-1)
;  23      1    drop_rate_flags     Drop rate (bits 0-2)
;  24      1    status_vuln         Status vulnerability flags
;  25      1    unknown25           AI/behavior flags (85 unique values, avg=99.0)
;  26      1    unknown26           AI/behavior flags (78 unique values, avg=107.6)
; ============================================================================

; Monster record field offsets
MONSTER_EXP_LO		= 0		; Experience low byte
MONSTER_EXP_HI		= 1		; Experience high byte
MONSTER_GOLD_LO		= 2		; Gold low byte
MONSTER_GOLD_HI		= 3		; Gold high byte
MONSTER_HP_LO		= 4		; HP low byte
MONSTER_HP_HI		= 5		; HP high byte
MONSTER_ATTACK		= 6		; Attack power
MONSTER_DEFENSE		= 7		; Defense power
MONSTER_AGILITY		= 8		; Agility
MONSTER_SKILL_0		= 9		; Skill data byte 0
MONSTER_SKILL_1		= 10		; Skill data byte 1
MONSTER_SKILL_2		= 11		; Skill data byte 2
MONSTER_SKILL_3		= 12		; Skill data byte 3
MONSTER_SKILL_4		= 13		; Skill data byte 4
MONSTER_SKILL_5		= 14		; Skill data byte 5
MONSTER_BEHAVIOR_0	= 15		; Behavior byte 0
MONSTER_BEHAVIOR_1	= 16		; Behavior byte 1
MONSTER_BEHAVIOR_2	= 17		; Behavior byte 2
MONSTER_BEHAVIOR_3	= 18		; Behavior byte 3
MONSTER_ITEM_DROP	= 19		; Item drop ID
MONSTER_AI_FLAGS_0	= 20		; AI/behavior flags (82 unique values)
MONSTER_AI_FLAGS_1	= 21		; AI/behavior flags (89 unique values)
MONSTER_METAL_FLAGS	= 22		; Metal monster flags
MONSTER_DROP_RATE	= 23		; Drop rate flags
MONSTER_STATUS_VULN	= 24		; Status vulnerability
MONSTER_AI_FLAGS_2	= 25		; AI/behavior flags (85 unique values)
MONSTER_AI_FLAGS_3	= 26		; AI/behavior flags (78 unique values)

; ============================================================================
; Metal Flags (byte 22, bits 0-1)
; ============================================================================
METAL_FLAG_MASK		= $03		; Mask for metal flag bits
METAL_FLAG_NONE		= $00		; Not a metal monster
METAL_FLAG_SET		= $01		; Metal monster (takes 0-1 damage)

; ============================================================================
; Drop Rate Flags (byte 23, bits 0-2)
; ============================================================================
DROP_RATE_MASK		= $07		; Mask for drop rate bits
DROP_RATE_0		= 0		; 0% drop rate
DROP_RATE_50		= 1		; 1/2 (50%)
DROP_RATE_25		= 2		; 1/4 (25%)
DROP_RATE_12_5		= 3		; 1/8 (12.5%)
DROP_RATE_6_25		= 4		; 1/16 (6.25%)
DROP_RATE_3_125		= 5		; 1/32 (3.125%)
DROP_RATE_0_39		= 6		; 1/256 (0.39%)
DROP_RATE_100		= 7		; 100%

; ============================================================================
; Status Vulnerability Flags (byte 24)
; ============================================================================
STATUS_VULN_PARALYSIS	= $40		; Bit 6: Vulnerable to paralysis
STATUS_VULN_CONFUSE	= $80		; Bit 7: Vulnerable to confusion/Bounce

; ============================================================================
; Monster IDs (0x00-0x96) - Chapter 1 Monsters
; ============================================================================
MONSTER_SLIME		= $00		; Slime
MONSTER_RED_SLIME	= $01		; Red Slime
MONSTER_DRACKY		= $02		; Dracky
MONSTER_STUMP		= $03		; Stump
MONSTER_BABBLE		= $04		; Babble
MONSTER_MAGIC_BABBLE	= $05		; Magic Babble
MONSTER_POISON_LIZARD	= $06		; Poison Lizard
MONSTER_CARNIVORE	= $07		; Carnivore Plant
MONSTER_MUMMY		= $08		; Mummy
MONSTER_SKELETON	= $09		; Skeleton
MONSTER_HEALSLIME	= $0a		; Healslime
MONSTER_TROGLODYTE	= $0b		; Troglodyte
MONSTER_IMP		= $0c		; Imp
MONSTER_GHOST		= $0d		; Ghost
MONSTER_CACTIBALL	= $0e		; Cactiball
MONSTER_GIANT_WORM	= $0f		; Giant Worm
MONSTER_HEALER		= $10		; Healer
MONSTER_BAT		= $11		; Bat
MONSTER_CATERPILLAR	= $12		; Caterpillar
MONSTER_BUTTERFLY	= $13		; Butterfly Dragon
MONSTER_MAGICIAN	= $14		; Magician
MONSTER_IRON_CLAW	= $15		; Iron Claw
MONSTER_LILYPAT		= $16		; Lilypat
MONSTER_RHINOCER	= $17		; Rhinocer
MONSTER_CHAMELEON	= $18		; Chameleon Humanoid
MONSTER_BLAZEGHOST	= $19		; Blazeghost
MONSTER_PHANTOM_KNIGHT	= $1a		; Phantom Knight
MONSTER_SPIKED_HARE	= $1b		; Spiked Hare
MONSTER_MINIDEMON	= $1c		; Minidemon
MONSTER_METAL_SLIME	= $1d		; Metal Slime

; ============================================================================
; Bosses
; ============================================================================
MONSTER_PISARO		= $93		; Pisaro (Necrosaro final form)
MONSTER_NECROSARO_1	= $94		; Necrosaro form 1
MONSTER_NECROSARO_2	= $95		; Necrosaro form 2
MONSTER_SARO_SHADOW	= $96		; Saro's Shadow

; ============================================================================
; End of Monster Definitions
; ============================================================================
