;==============================================================================
; DW4 Audio System Include
; Source: ROM analysis, CDL coverage
; Verified: 2026-01-03
;==============================================================================

;------------------------------------------------------------------------------
; Audio Bank Assignments
;------------------------------------------------------------------------------
; Banks 0x18-0x1B: Music Data
; Banks 0x1C-0x1D: Sound Effects

AUDIO_MUSIC_BANK_1	= $18		; Music Data 1
AUDIO_MUSIC_BANK_2	= $19		; Music Data 2 (with sound driver code)
AUDIO_MUSIC_BANK_3	= $1A		; Music Data 3
AUDIO_MUSIC_BANK_4	= $1B		; Music Data 4
AUDIO_SFX_BANK_1	= $1C		; Sound Effects 1
AUDIO_SFX_BANK_2	= $1D		; Sound Effects 2

;------------------------------------------------------------------------------
; CDL Coverage Analysis
;------------------------------------------------------------------------------
; Bank 0x18: 75.4% coverage (3066 code, 9290 data)
; Bank 0x19: 57.1% coverage (209 code, 9142 data) - lowest music bank
; Bank 0x1A: 85.8% coverage (0 code, 14062 data) - pure data
; Bank 0x1B: 63.7% coverage (4435 code, 6004 data)
; Bank 0x1C: 77.6% coverage (7159 code, 5559 data)
; Bank 0x1D: 93.1% coverage (10272 code, 4987 data)

;------------------------------------------------------------------------------
; Bank 0x19 Sound Driver Entry Points
;------------------------------------------------------------------------------
; Bank 0x19 contains sound driver code with jump table at $8014
; Entry points (from ROM analysis):
;   $8014: Sound routine entry 0
;   $8017: Sound routine entry 1
;   $801A: Sound routine entry 2
;   $801D: Sound routine entry 3
;   $8020: Sound routine entry 4
;   $8023: Sound routine entry 5
;   $803B: Sound routine entry 6

;------------------------------------------------------------------------------
; Audio Format Notes
;------------------------------------------------------------------------------
; NES audio uses APU (Audio Processing Unit) with:
;   - 2 pulse wave channels (square waves)
;   - 1 triangle wave channel
;   - 1 noise channel
;   - 1 DMC/sample channel
;
; DW4 music format appears to be custom sequenced data
; Sound effects use similar sequenced format

;------------------------------------------------------------------------------
; Known Song IDs (to be verified)
;------------------------------------------------------------------------------
; These are placeholder values - actual IDs need CDL verification
SONG_TITLE		= $00		; Title screen music
SONG_OVERWORLD		= $01		; Overworld theme
SONG_TOWN		= $02		; Town theme
SONG_DUNGEON		= $03		; Dungeon theme
SONG_BATTLE		= $04		; Battle theme
SONG_BOSS		= $05		; Boss battle theme
SONG_VICTORY		= $06		; Victory fanfare
SONG_INN		= $07		; Inn/save theme

;------------------------------------------------------------------------------
; Known SFX IDs (to be verified)
;------------------------------------------------------------------------------
SFX_CURSOR		= $00		; Menu cursor move
SFX_SELECT		= $01		; Menu selection
SFX_CANCEL		= $02		; Menu cancel
SFX_ATTACK		= $10		; Physical attack
SFX_SPELL		= $20		; Spell cast
SFX_HEAL		= $21		; Healing spell
SFX_DAMAGE		= $30		; Taking damage
SFX_DEATH		= $31		; Death sound
SFX_LEVELUP		= $40		; Level up fanfare

;==============================================================================
; End of audio.inc
;==============================================================================
