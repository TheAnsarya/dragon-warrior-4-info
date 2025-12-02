; ============================================================================
; Dragon Warrior IV - Monster Data
; ============================================================================
; Generated from monsters.json by json_to_asm.py
; ============================================================================

; Monster data structure (16 bytes per entry):
;   Offset  Size  Description
;   $00     2     HP (little endian)
;   $02     1     MP
;   $03     2     Attack (little endian)
;   $05     1     Defense
;   $06     1     Agility
;   $07     2     Experience (little endian)
;   $09     2     Gold (little endian)
;   $0b     1     Drop item ID
;   $0c     1     Drop rate (1/N)
;   $0d     1     Action pattern
;   $0e     1     Resistances (bitmask)
;   $0f     1     Sprite/palette info

.segment "PRG_BANK_08"

; Monster count
MONSTER_COUNT = 50

; Monster stat table
monster_stats_table:

monster_000:
	.word $0404		; HP
	.byte $0f			; MP
	.word $0402		; Attack
	.byte $02			; Defense
	.byte $05			; Agility
	.word $0108		; Experience
	.word $0102		; Gold
	.byte $03			; Drop item ID
	.byte $01			; Drop rate (1/N)
	.byte $02			; Action pattern
	.byte $04			; Resistances
	.byte $06			; Sprite info

monster_001:
	.word $0503		; HP
	.byte $03			; MP
	.word $0304		; Attack
	.byte $02			; Defense
	.byte $02			; Agility
	.word $0203		; Experience
	.word $0205		; Gold
	.byte $01			; Drop item ID
	.byte $01			; Drop rate (1/N)
	.byte $01			; Action pattern
	.byte $01			; Resistances
	.byte $01			; Sprite info

monster_002:
	.word $0102		; HP
	.byte $01			; MP
	.word $0102		; Attack
	.byte $03			; Defense
	.byte $03			; Agility
	.word $0102		; Experience
	.word $0101		; Gold
	.byte $0a			; Drop item ID
	.byte $02			; Drop rate (1/N)
	.byte $03			; Action pattern
	.byte $03			; Resistances
	.byte $05			; Sprite info

monster_003:
	.word $0702		; HP
	.byte $05			; MP
	.word $070a		; Attack
	.byte $03			; Defense
	.byte $06			; Agility
	.word $0201		; Experience
	.word $0103		; Gold
	.byte $11			; Drop item ID
	.byte $01			; Drop rate (1/N)
	.byte $06			; Action pattern
	.byte $06			; Resistances
	.byte $06			; Sprite info

monster_004:
	.word $0b05		; HP
	.byte $04			; MP
	.word $0408		; Attack
	.byte $02			; Defense
	.byte $0a			; Agility
	.word $b7f9		; Experience
	.word $0000		; Gold
	.byte $0f			; Drop item ID
	.byte $1a			; Drop rate (1/N)
	.byte $00			; Action pattern
	.byte $01			; Resistances
	.byte $00			; Sprite info

monster_005:
	.word $1b0f		; HP
	.byte $00			; MP
	.word $0002		; Attack
	.byte $00			; Defense
	.byte $1d			; Agility
	.word $0301		; Experience
	.word $0900		; Gold
	.byte $1d			; Drop item ID
	.byte $00			; Drop rate (1/N)
	.byte $04			; Action pattern
	.byte $00			; Resistances
	.byte $17			; Sprite info

monster_006:
	.word $0020		; HP
	.byte $05			; MP
	.word $1101		; Attack
	.byte $1f			; Defense
	.byte $00			; Agility
	.word $0006		; Experience
	.word $1d10		; Gold
	.byte $00			; Drop item ID
	.byte $07			; Drop rate (1/N)
	.byte $00			; Action pattern
	.byte $00			; Resistances
	.byte $13			; Sprite info

monster_007:
	.word $0801		; HP
	.byte $00			; MP
	.word $1810		; Attack
	.byte $00			; Defense
	.byte $09			; Agility
	.word $1000		; Experience
	.word $001b		; Gold
	.byte $0a			; Drop item ID
	.byte $00			; Drop rate (1/N)
	.byte $0d			; Action pattern
	.byte $17			; Resistances
	.byte $04			; Sprite info

monster_008:
	.word $000b		; HP
	.byte $06			; MP
	.word $0430		; Attack
	.byte $0c			; Defense
	.byte $00			; Agility
	.word $0b1f		; Experience
	.word $0d07		; Gold
	.byte $00			; Drop item ID
	.byte $00			; Drop rate (1/N)
	.byte $0d			; Action pattern
	.byte $05			; Resistances
	.byte $0e			; Sprite info

monster_009:
	.word $0a00		; HP
	.byte $2c			; MP
	.word $0f04		; Attack
	.byte $00			; Defense
	.byte $16			; Agility
	.word $0600		; Experience
	.word $0010		; Gold
	.byte $0d			; Drop item ID
	.byte $21			; Drop rate (1/N)
	.byte $04			; Action pattern
	.byte $11			; Resistances
	.byte $00			; Sprite info

monster_010:
	.word $2526		; HP
	.byte $04			; MP
	.word $0012		; Attack
	.byte $0d			; Defense
	.byte $19			; Agility
	.word $1304		; Experience
	.word $0c00		; Gold
	.byte $19			; Drop item ID
	.byte $04			; Drop rate (1/N)
	.byte $14			; Action pattern
	.byte $02			; Resistances
	.byte $0c			; Sprite info

monster_011:
	.word $0418		; HP
	.byte $15			; MP
	.word $1300		; Attack
	.byte $1b			; Defense
	.byte $04			; Agility
	.word $0016		; Experience
	.word $0d00		; Gold
	.byte $05			; Drop item ID
	.byte $17			; Drop rate (1/N)
	.byte $00			; Action pattern
	.byte $00			; Resistances
	.byte $10			; Sprite info

monster_012:
	.word $1805		; HP
	.byte $00			; MP
	.word $1d0a		; Attack
	.byte $05			; Defense
	.byte $19			; Agility
	.word $0000		; Experience
	.word $050a		; Gold
	.byte $1a			; Drop item ID
	.byte $20			; Drop rate (1/N)
	.byte $26			; Action pattern
	.byte $16			; Resistances
	.byte $07			; Sprite info

monster_013:
	.word $001b		; HP
	.byte $22			; MP
	.word $0713		; Attack
	.byte $1c			; Defense
	.byte $00			; Agility
	.word $100d		; Experience
	.word $1d04		; Gold
	.byte $00			; Drop item ID
	.byte $04			; Drop rate (1/N)
	.byte $0e			; Action pattern
	.byte $8c			; Resistances
	.byte $1e			; Sprite info

monster_014:
	.word $0500		; HP
	.byte $0a			; MP
	.word $1f0c		; Attack
	.byte $00			; Defense
	.byte $07			; Agility
	.word $0c0d		; Experience
	.word $0020		; Gold
	.byte $06			; Drop item ID
	.byte $0c			; Drop rate (1/N)
	.byte $0c			; Action pattern
	.byte $21			; Resistances
	.byte $00			; Sprite info

monster_015:
	.word $0a00		; HP
	.byte $0d			; MP
	.word $0022		; Attack
	.byte $08			; Defense
	.byte $0f			; Agility
	.word $230c		; Experience
	.word $0700		; Gold
	.byte $12			; Drop item ID
	.byte $0c			; Drop rate (1/N)
	.byte $24			; Action pattern
	.byte $00			; Resistances
	.byte $00			; Sprite info

monster_016:
	.word $0d05		; HP
	.byte $25			; MP
	.word $0901		; Attack
	.byte $10			; Defense
	.byte $0c			; Agility
	.word $6026		; Experience
	.word $1507		; Gold
	.byte $0c			; Drop item ID
	.byte $27			; Drop rate (1/N)
	.byte $60			; Action pattern
	.byte $0d			; Resistances
	.byte $08			; Sprite info

monster_017:
	.word $280e		; HP
	.byte $60			; MP
	.word $0904		; Attack
	.byte $0c			; Defense
	.byte $29			; Agility
	.word $0860		; Experience
	.word $0c0a		; Gold
	.byte $2a			; Drop item ID
	.byte $e0			; Drop rate (1/N)
	.byte $05			; Action pattern
	.byte $11			; Resistances
	.byte $0c			; Sprite info

monster_018:
	.word $002b		; HP
	.byte $02			; MP
	.word $0c04		; Attack
	.byte $2c			; Defense
	.byte $00			; Agility
	.word $0013		; Experience
	.word $2d0e		; Gold
	.byte $00			; Drop item ID
	.byte $07			; Drop rate (1/N)
	.byte $24			; Action pattern
	.byte $96			; Resistances
	.byte $2e			; Sprite info

monster_019:
	.word $1200		; HP
	.byte $28			; MP
	.word $2f94		; Attack
	.byte $00			; Defense
	.byte $19			; Agility
	.word $9702		; Experience
	.word $0130		; Gold
	.byte $0e			; Drop item ID
	.byte $09			; Drop rate (1/N)
	.byte $97			; Action pattern
	.byte $31			; Resistances
	.byte $80			; Sprite info

monster_020:
	.word $2411		; HP
	.byte $97			; MP
	.word $0132		; Attack
	.byte $23			; Defense
	.byte $08			; Agility
	.word $3397		; Experience
	.word $1400		; Gold
	.byte $02			; Drop item ID
	.byte $96			; Drop rate (1/N)
	.byte $34			; Action pattern
	.byte $00			; Resistances
	.byte $15			; Sprite info

monster_021:
	.word $971a		; HP
	.byte $35			; MP
	.word $31a0		; Attack
	.byte $1b			; Defense
	.byte $97			; Agility
	.word $0036		; Experience
	.word $030b		; Gold
	.byte $97			; Drop item ID
	.byte $37			; Drop rate (1/N)
	.byte $00			; Action pattern
	.byte $07			; Resistances
	.byte $1b			; Sprite info

monster_022:
	.word $3897		; HP
	.byte $00			; MP
	.word $1303		; Attack
	.byte $97			; Defense
	.byte $39			; Agility
	.word $0380		; Experience
	.word $9703		; Gold
	.byte $3a			; Drop item ID
	.byte $80			; Drop rate (1/N)
	.byte $05			; Action pattern
	.byte $0b			; Resistances
	.byte $97			; Sprite info

monster_023:
	.word $003b		; HP
	.byte $1d			; MP
	.word $971f		; Attack
	.byte $3c			; Defense
	.byte $e0			; Agility
	.word $2515		; Experience
	.word $3d14		; Gold
	.byte $20			; Drop item ID
	.byte $13			; Drop rate (1/N)
	.byte $31			; Action pattern
	.byte $10			; Resistances
	.byte $3e			; Sprite info

monster_024:
	.word $0ca0		; HP
	.byte $07			; MP
	.word $3f9e		; Attack
	.byte $03			; Defense
	.byte $15			; Agility
	.word $101f		; Experience
	.word $0540		; Gold
	.byte $10			; Drop item ID
	.byte $19			; Drop rate (1/N)
	.byte $10			; Action pattern
	.byte $41			; Resistances
	.byte $03			; Sprite info

monster_025:
	.word $2110		; HP
	.byte $10			; MP
	.word $0442		; Attack
	.byte $0e			; Defense
	.byte $1d			; Agility
	.word $4310		; Experience
	.word $3106		; Gold
	.byte $13			; Drop item ID
	.byte $07			; Drop rate (1/N)
	.byte $44			; Action pattern
	.byte $60			; Resistances
	.byte $07			; Sprite info

monster_026:
	.word $0c0d		; HP
	.byte $45			; MP
	.word $1d60		; Attack
	.byte $24			; Defense
	.byte $18			; Agility
	.word $2046		; Experience
	.word $1f10		; Gold
	.byte $1c			; Drop item ID
	.byte $47			; Drop rate (1/N)
	.byte $20			; Action pattern
	.byte $05			; Resistances
	.byte $0c			; Sprite info

monster_027:
	.word $488c		; HP
	.byte $00			; MP
	.word $130a		; Attack
	.byte $14			; Defense
	.byte $ff			; Agility
	.word $3e46		; Experience
	.word $0c00		; Gold
	.byte $06			; Drop item ID
	.byte $82			; Drop rate (1/N)
	.byte $48			; Action pattern
	.byte $2c			; Resistances
	.byte $00			; Sprite info

monster_028:
	.word $090b		; HP
	.byte $82			; MP
	.word $76ff		; Attack
	.byte $b9			; Defense
	.byte $00			; Agility
	.word $0361		; Experience
	.word $0164		; Gold
	.byte $e4			; Drop item ID
	.byte $00			; Drop rate (1/N)
	.byte $62			; Action pattern
	.byte $01			; Resistances
	.byte $62			; Sprite info

monster_029:
	.word $6202		; HP
	.byte $03			; MP
	.word $00e0		; Attack
	.byte $63			; Defense
	.byte $00			; Agility
	.word $0061		; Experience
	.word $0161		; Gold
	.byte $e1			; Drop item ID
	.byte $02			; Drop rate (1/N)
	.byte $e2			; Action pattern
	.byte $00			; Resistances
	.byte $60			; Sprite info

monster_030:
	.word $e002		; HP
	.byte $01			; MP
	.word $01ff		; Attack
	.byte $e1			; Defense
	.byte $01			; Agility
	.word $0062		; Experience
	.word $00e0		; Gold
	.byte $e1			; Drop item ID
	.byte $00			; Drop rate (1/N)
	.byte $ff			; Action pattern
	.byte $02			; Resistances
	.byte $63			; Sprite info

monster_031:
	.word $e301		; HP
	.byte $00			; MP
	.word $0062		; Attack
	.byte $e2			; Defense
	.byte $01			; Agility
	.word $0061		; Experience
	.word $01e1		; Gold
	.byte $60			; Drop item ID
	.byte $01			; Drop rate (1/N)
	.byte $e0			; Action pattern
	.byte $00			; Resistances
	.byte $ff			; Sprite info

monster_032:
	.word $6203		; HP
	.byte $00			; MP
	.word $0061		; Attack
	.byte $61			; Defense
	.byte $01			; Agility
	.word $0262		; Experience
	.word $0162		; Gold
	.byte $63			; Drop item ID
	.byte $00			; Drop rate (1/N)
	.byte $61			; Action pattern
	.byte $02			; Resistances
	.byte $e2			; Sprite info

monster_033:
	.word $6003		; HP
	.byte $01			; MP
	.word $0260		; Attack
	.byte $e0			; Defense
	.byte $06			; Agility
	.word $0060		; Experience
	.word $0460		; Gold
	.byte $60			; Drop item ID
	.byte $03			; Drop rate (1/N)
	.byte $e0			; Action pattern
	.byte $07			; Resistances
	.byte $e0			; Sprite info

monster_034:
	.word $ff05		; HP
	.byte $04			; MP
	.word $006a		; Attack
	.byte $6b			; Defense
	.byte $00			; Agility
	.word $0169		; Experience
	.word $0261		; Gold
	.byte $e8			; Drop item ID
	.byte $00			; Drop rate (1/N)
	.byte $00			; Action pattern
	.byte $00			; Resistances
	.byte $e0			; Sprite info

monster_035:
	.word $6e03		; HP
	.byte $02			; MP
	.word $006d		; Attack
	.byte $65			; Defense
	.byte $00			; Agility
	.word $0166		; Experience
	.word $01e5		; Gold
	.byte $69			; Drop item ID
	.byte $00			; Drop rate (1/N)
	.byte $e9			; Action pattern
	.byte $02			; Resistances
	.byte $ea			; Sprite info

monster_036:
	.word $6201		; HP
	.byte $02			; MP
	.word $04e2		; Attack
	.byte $6c			; Defense
	.byte $00			; Agility
	.word $03e2		; Experience
	.word $016e		; Gold
	.byte $ee			; Drop item ID
	.byte $00			; Drop rate (1/N)
	.byte $e0			; Action pattern
	.byte $04			; Resistances
	.byte $63			; Sprite info

monster_037:
	.word $6000		; HP
	.byte $02			; MP
	.word $01e3		; Attack
	.byte $60			; Defense
	.byte $00			; Agility
	.word $00e4		; Experience
	.word $01e0		; Gold
	.byte $e6			; Drop item ID
	.byte $00			; Drop rate (1/N)
	.byte $62			; Action pattern
	.byte $01			; Resistances
	.byte $6d			; Sprite info

monster_038:
	.word $6d03		; HP
	.byte $05			; MP
	.word $016d		; Attack
	.byte $6d			; Defense
	.byte $06			; Agility
	.word $026d		; Experience
	.word $04ed		; Gold
	.byte $67			; Drop item ID
	.byte $01			; Drop rate (1/N)
	.byte $67			; Action pattern
	.byte $00			; Resistances
	.byte $e2			; Sprite info

monster_039:
	.word $ff00		; HP
	.byte $05			; MP
	.word $00e1		; Attack
	.byte $e0			; Defense
	.byte $00			; Agility
	.word $06ff		; Experience
	.word $0061		; Gold
	.byte $61			; Drop item ID
	.byte $01			; Drop rate (1/N)
	.byte $62			; Action pattern
	.byte $00			; Resistances
	.byte $e3			; Sprite info

monster_040:
	.word $6000		; HP
	.byte $00			; MP
	.word $01e0		; Attack
	.byte $e0			; Defense
	.byte $02			; Agility
	.word $03e0		; Experience
	.word $07ff		; Gold
	.byte $e1			; Drop item ID
	.byte $00			; Drop rate (1/N)
	.byte $e0			; Action pattern
	.byte $00			; Resistances
	.byte $ff			; Sprite info

monster_041:
	.word $8008		; HP
	.byte $63			; MP
	.word $6400		; Attack
	.byte $00			; Defense
	.byte $63			; Agility
	.word $e201		; Experience
	.word $e100		; Gold
	.byte $03			; Drop item ID
	.byte $61			; Drop rate (1/N)
	.byte $00			; Action pattern
	.byte $e1			; Resistances
	.byte $02			; Sprite info

monster_042:
	.word $01e1		; HP
	.byte $ff			; MP
	.word $e709		; Attack
	.byte $00			; Defense
	.byte $80			; Agility
	.word $0163		; Experience
	.word $00e3		; Gold
	.byte $62			; Drop item ID
	.byte $01			; Drop rate (1/N)
	.byte $62			; Action pattern
	.byte $00			; Resistances
	.byte $e4			; Sprite info

monster_043:
	.word $e300		; HP
	.byte $02			; MP
	.word $8080		; Attack
	.byte $e0			; Defense
	.byte $00			; Agility
	.word $0aff		; Experience
	.word $01a0		; Gold
	.byte $2d			; Drop item ID
	.byte $ff			; Drop rate (1/N)
	.byte $0b			; Action pattern
	.byte $61			; Resistances
	.byte $01			; Sprite info

monster_044:
	.word $00e1		; HP
	.byte $60			; MP
	.word $e001		; Attack
	.byte $00			; Defense
	.byte $ff			; Agility
	.word $800c		; Experience
	.word $0dff		; Gold
	.byte $61			; Drop item ID
	.byte $02			; Drop rate (1/N)
	.byte $e2			; Action pattern
	.byte $00			; Resistances
	.byte $61			; Sprite info

monster_045:
	.word $6101		; HP
	.byte $00			; MP
	.word $00e0		; Attack
	.byte $e0			; Defense
	.byte $01			; Agility
	.word $0eff		; Experience
	.word $ff80		; Gold
	.byte $0f			; Drop item ID
	.byte $61			; Drop rate (1/N)
	.byte $01			; Action pattern
	.byte $61			; Resistances
	.byte $00			; Sprite info

monster_046:
	.word $0261		; HP
	.byte $80			; MP
	.word $0160		; Attack
	.byte $60			; Defense
	.byte $00			; Agility
	.word $02e0		; Experience
	.word $10ff		; Gold
	.byte $62			; Drop item ID
	.byte $00			; Drop rate (1/N)
	.byte $63			; Action pattern
	.byte $00			; Resistances
	.byte $e1			; Sprite info

monster_047:
	.word $e000		; HP
	.byte $02			; MP
	.word $00e0		; Attack
	.byte $e0			; Defense
	.byte $01			; Agility
	.word $11ff		; Experience
	.word $0161		; Gold
	.byte $62			; Drop item ID
	.byte $00			; Drop rate (1/N)
	.byte $e1			; Action pattern
	.byte $00			; Resistances
	.byte $60			; Sprite info

monster_048:
	.word $e002		; HP
	.byte $00			; MP
	.word $01e0		; Attack
	.byte $65			; Defense
	.byte $00			; Agility
	.word $00e4		; Experience
	.word $01e3		; Gold
	.byte $e3			; Drop item ID
	.byte $00			; Drop rate (1/N)
	.byte $ff			; Action pattern
	.byte $12			; Resistances
	.byte $62			; Sprite info

monster_049:
	.word $6100		; HP
	.byte $02			; MP
	.word $0061		; Attack
	.byte $61			; Defense
	.byte $01			; Agility
	.word $03e1		; Experience
	.word $0260		; Gold
	.byte $60			; Drop item ID
	.byte $03			; Drop rate (1/N)
	.byte $60			; Action pattern
	.byte $01			; Resistances
	.byte $e0			; Sprite info

; ============================================================================
; End of monster data
; ============================================================================