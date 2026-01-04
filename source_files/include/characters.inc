;==============================================================================
; DW4 Character/Party Member Data Structure Include
; Source: DW4Lib.DataStructures.Character
; Verified: 2026-01-03 (based on save data analysis)
;==============================================================================

;------------------------------------------------------------------------------
; Character Record Size
;------------------------------------------------------------------------------
CHAR_RECORD_SIZE	= 32		; 32 bytes per character in save data

;------------------------------------------------------------------------------
; Character Record Structure (32 bytes)
;------------------------------------------------------------------------------
; Offset | Size | Field           | Description
;--------|------|-----------------|-------------------------------------------
;  0-7   |  8   | Name            | Character name (8 chars, DW4 encoding)
;   8    |  1   | Level           | Current level (1-99)
;   9    |  1   | ClassID         | Character class/ID
; 10-11  |  2   | CurrentHP       | Current HP (little endian)
; 12-13  |  2   | MaxHP           | Maximum HP (little endian)
; 14-15  |  2   | CurrentMP       | Current MP (little endian)
; 16-17  |  2   | MaxMP           | Maximum MP (little endian)
;  18    |  1   | Strength        | STR stat
;  19    |  1   | Agility         | AGI stat
;  20    |  1   | Vitality        | VIT stat
;  21    |  1   | Intelligence    | INT stat
;  22    |  1   | Luck            | LUCK stat
; 23-25  |  3   | Experience      | Total EXP (little endian, 24-bit)
;  26    |  1   | AttackMod       | Attack modifier or accessory slot
;  27    |  1   | Weapon          | Equipped weapon ID
;  28    |  1   | Armor           | Equipped armor ID
;  29    |  1   | Shield          | Equipped shield ID
;  30    |  1   | Helmet          | Equipped helmet ID
;  31    |  1   | StatusFlags     | Current status effects
;------------------------------------------------------------------------------

; Field offsets in character record
CHAR_NAME		= 0		; 8 bytes
CHAR_NAME_SIZE		= 8
CHAR_LEVEL		= 8
CHAR_CLASS_ID		= 9
CHAR_CUR_HP_LO		= 10
CHAR_CUR_HP_HI		= 11
CHAR_MAX_HP_LO		= 12
CHAR_MAX_HP_HI		= 13
CHAR_CUR_MP_LO		= 14
CHAR_CUR_MP_HI		= 15
CHAR_MAX_MP_LO		= 16
CHAR_MAX_MP_HI		= 17
CHAR_STRENGTH		= 18
CHAR_AGILITY		= 19
CHAR_VITALITY		= 20
CHAR_INTELLIGENCE	= 21
CHAR_LUCK		= 22
CHAR_EXP_BYTE0		= 23		; EXP low byte (24-bit total)
CHAR_EXP_BYTE1		= 24		; EXP mid byte
CHAR_EXP_BYTE2		= 25		; EXP high byte (max 16,777,215)
CHAR_ATTACK_MOD		= 26		; Attack modifier or accessory
CHAR_WEAPON		= 27
CHAR_ARMOR		= 28
CHAR_SHIELD		= 29
CHAR_HELMET		= 30
CHAR_STATUS		= 31

;------------------------------------------------------------------------------
; Status Effect Flags (byte 31)
;------------------------------------------------------------------------------
STATUS_DEAD		= %10000000	; Bit 7 - Dead
STATUS_POISON		= %01000000	; Bit 6 - Poisoned
STATUS_SLEEP		= %00100000	; Bit 5 - Asleep
STATUS_CONFUSED		= %00010000	; Bit 4 - Confused/Chaos
STATUS_NUMB		= %00001000	; Bit 3 - Paralyzed/Numb
STATUS_CURSE		= %00000100	; Bit 2 - Cursed
STATUS_SURROUND		= %00000010	; Bit 1 - Surrounded (accuracy down)
STATUS_STOPSPELL	= %00000001	; Bit 0 - Stopspell active

;------------------------------------------------------------------------------
; Character IDs (for party indexing)
; Note: These are also in constants.inc
;------------------------------------------------------------------------------
; CHAR_SOLO		= 0		; Hero
; CHAR_RAGNAR		= 1		; Ragnar (Chapter 1)
; CHAR_ALENA		= 2		; Alena (Chapter 2)
; CHAR_CRISTO		= 3		; Cristo (Chapter 2)
; CHAR_BREY		= 4		; Brey (Chapter 2)
; CHAR_TALOON		= 5		; Taloon (Chapter 3)
; CHAR_NARA		= 6		; Nara (Chapter 4)
; CHAR_MARA		= 7		; Mara (Chapter 4)

;------------------------------------------------------------------------------
; Party Limits
;------------------------------------------------------------------------------
MAX_PARTY_SIZE		= 4		; Max active party members
MAX_WAGON_SIZE		= 4		; Max wagon members
TOTAL_CHARACTERS	= 8		; Total playable characters

;==============================================================================
; End of characters.inc
;==============================================================================
