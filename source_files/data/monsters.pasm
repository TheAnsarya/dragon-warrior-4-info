; ============================================================================
; Dragon Warrior IV - Monster Data
; ============================================================================
; Generated from monsters.json by json_to_asm.py
; ============================================================================

; Monster data structure (16 bytes per entry):
;   Offset  Size  Description
;   $00	 2	 HP (little endian)
;   $02	 1	 MP
;   $03	 2	 Attack (little endian)
;   $05	 1	 Defense
;   $06	 1	 Agility
;   $07	 2	 Experience (little endian)
;   $09	 2	 Gold (little endian)
;   $0b	 1	 Drop item ID
;   $0c	 1	 Drop rate (1/N)
;   $0d	 1	 Action pattern
;   $0e	 1	 Resistances (bitmask)
;   $0f	 1	 Sprite/palette info

.segment "PRG_BANK_08"

; Monster count
MONSTER_COUNT = 50

; Monster stat table
monster_stats_table:

monster_000:
	.dw $0404		; HP
	.db $0f			; MP
	.dw $0402		; Attack
	.db $02			; Defense
	.db $05			; Agility
	.dw $0108		; Experience
	.dw $0102		; Gold
	.db $03			; Drop item ID
	.db $01			; Drop rate (1/N)
	.db $02			; Action pattern
	.db $04			; Resistances
	.db $06			; Sprite info

monster_001:
	.dw $0503		; HP
	.db $03			; MP
	.dw $0304		; Attack
	.db $02			; Defense
	.db $02			; Agility
	.dw $0203		; Experience
	.dw $0205		; Gold
	.db $01			; Drop item ID
	.db $01			; Drop rate (1/N)
	.db $01			; Action pattern
	.db $01			; Resistances
	.db $01			; Sprite info

monster_002:
	.dw $0102		; HP
	.db $01			; MP
	.dw $0102		; Attack
	.db $03			; Defense
	.db $03			; Agility
	.dw $0102		; Experience
	.dw $0101		; Gold
	.db $0a			; Drop item ID
	.db $02			; Drop rate (1/N)
	.db $03			; Action pattern
	.db $03			; Resistances
	.db $05			; Sprite info

monster_003:
	.dw $0702		; HP
	.db $05			; MP
	.dw $070a		; Attack
	.db $03			; Defense
	.db $06			; Agility
	.dw $0201		; Experience
	.dw $0103		; Gold
	.db $11			; Drop item ID
	.db $01			; Drop rate (1/N)
	.db $06			; Action pattern
	.db $06			; Resistances
	.db $06			; Sprite info

monster_004:
	.dw $0b05		; HP
	.db $04			; MP
	.dw $0408		; Attack
	.db $02			; Defense
	.db $0a			; Agility
	.dw $b7f9		; Experience
	.dw $0000		; Gold
	.db $0f			; Drop item ID
	.db $1a			; Drop rate (1/N)
	.db $00			; Action pattern
	.db $01			; Resistances
	.db $00			; Sprite info

monster_005:
	.dw $1b0f		; HP
	.db $00			; MP
	.dw $0002		; Attack
	.db $00			; Defense
	.db $1d			; Agility
	.dw $0301		; Experience
	.dw $0900		; Gold
	.db $1d			; Drop item ID
	.db $00			; Drop rate (1/N)
	.db $04			; Action pattern
	.db $00			; Resistances
	.db $17			; Sprite info

monster_006:
	.dw $0020		; HP
	.db $05			; MP
	.dw $1101		; Attack
	.db $1f			; Defense
	.db $00			; Agility
	.dw $0006		; Experience
	.dw $1d10		; Gold
	.db $00			; Drop item ID
	.db $07			; Drop rate (1/N)
	.db $00			; Action pattern
	.db $00			; Resistances
	.db $13			; Sprite info

monster_007:
	.dw $0801		; HP
	.db $00			; MP
	.dw $1810		; Attack
	.db $00			; Defense
	.db $09			; Agility
	.dw $1000		; Experience
	.dw $001b		; Gold
	.db $0a			; Drop item ID
	.db $00			; Drop rate (1/N)
	.db $0d			; Action pattern
	.db $17			; Resistances
	.db $04			; Sprite info

monster_008:
	.dw $000b		; HP
	.db $06			; MP
	.dw $0430		; Attack
	.db $0c			; Defense
	.db $00			; Agility
	.dw $0b1f		; Experience
	.dw $0d07		; Gold
	.db $00			; Drop item ID
	.db $00			; Drop rate (1/N)
	.db $0d			; Action pattern
	.db $05			; Resistances
	.db $0e			; Sprite info

monster_009:
	.dw $0a00		; HP
	.db $2c			; MP
	.dw $0f04		; Attack
	.db $00			; Defense
	.db $16			; Agility
	.dw $0600		; Experience
	.dw $0010		; Gold
	.db $0d			; Drop item ID
	.db $21			; Drop rate (1/N)
	.db $04			; Action pattern
	.db $11			; Resistances
	.db $00			; Sprite info

monster_010:
	.dw $2526		; HP
	.db $04			; MP
	.dw $0012		; Attack
	.db $0d			; Defense
	.db $19			; Agility
	.dw $1304		; Experience
	.dw $0c00		; Gold
	.db $19			; Drop item ID
	.db $04			; Drop rate (1/N)
	.db $14			; Action pattern
	.db $02			; Resistances
	.db $0c			; Sprite info

monster_011:
	.dw $0418		; HP
	.db $15			; MP
	.dw $1300		; Attack
	.db $1b			; Defense
	.db $04			; Agility
	.dw $0016		; Experience
	.dw $0d00		; Gold
	.db $05			; Drop item ID
	.db $17			; Drop rate (1/N)
	.db $00			; Action pattern
	.db $00			; Resistances
	.db $10			; Sprite info

monster_012:
	.dw $1805		; HP
	.db $00			; MP
	.dw $1d0a		; Attack
	.db $05			; Defense
	.db $19			; Agility
	.dw $0000		; Experience
	.dw $050a		; Gold
	.db $1a			; Drop item ID
	.db $20			; Drop rate (1/N)
	.db $26			; Action pattern
	.db $16			; Resistances
	.db $07			; Sprite info

monster_013:
	.dw $001b		; HP
	.db $22			; MP
	.dw $0713		; Attack
	.db $1c			; Defense
	.db $00			; Agility
	.dw $100d		; Experience
	.dw $1d04		; Gold
	.db $00			; Drop item ID
	.db $04			; Drop rate (1/N)
	.db $0e			; Action pattern
	.db $8c			; Resistances
	.db $1e			; Sprite info

monster_014:
	.dw $0500		; HP
	.db $0a			; MP
	.dw $1f0c		; Attack
	.db $00			; Defense
	.db $07			; Agility
	.dw $0c0d		; Experience
	.dw $0020		; Gold
	.db $06			; Drop item ID
	.db $0c			; Drop rate (1/N)
	.db $0c			; Action pattern
	.db $21			; Resistances
	.db $00			; Sprite info

monster_015:
	.dw $0a00		; HP
	.db $0d			; MP
	.dw $0022		; Attack
	.db $08			; Defense
	.db $0f			; Agility
	.dw $230c		; Experience
	.dw $0700		; Gold
	.db $12			; Drop item ID
	.db $0c			; Drop rate (1/N)
	.db $24			; Action pattern
	.db $00			; Resistances
	.db $00			; Sprite info

monster_016:
	.dw $0d05		; HP
	.db $25			; MP
	.dw $0901		; Attack
	.db $10			; Defense
	.db $0c			; Agility
	.dw $6026		; Experience
	.dw $1507		; Gold
	.db $0c			; Drop item ID
	.db $27			; Drop rate (1/N)
	.db $60			; Action pattern
	.db $0d			; Resistances
	.db $08			; Sprite info

monster_017:
	.dw $280e		; HP
	.db $60			; MP
	.dw $0904		; Attack
	.db $0c			; Defense
	.db $29			; Agility
	.dw $0860		; Experience
	.dw $0c0a		; Gold
	.db $2a			; Drop item ID
	.db $e0			; Drop rate (1/N)
	.db $05			; Action pattern
	.db $11			; Resistances
	.db $0c			; Sprite info

monster_018:
	.dw $002b		; HP
	.db $02			; MP
	.dw $0c04		; Attack
	.db $2c			; Defense
	.db $00			; Agility
	.dw $0013		; Experience
	.dw $2d0e		; Gold
	.db $00			; Drop item ID
	.db $07			; Drop rate (1/N)
	.db $24			; Action pattern
	.db $96			; Resistances
	.db $2e			; Sprite info

monster_019:
	.dw $1200		; HP
	.db $28			; MP
	.dw $2f94		; Attack
	.db $00			; Defense
	.db $19			; Agility
	.dw $9702		; Experience
	.dw $0130		; Gold
	.db $0e			; Drop item ID
	.db $09			; Drop rate (1/N)
	.db $97			; Action pattern
	.db $31			; Resistances
	.db $80			; Sprite info

monster_020:
	.dw $2411		; HP
	.db $97			; MP
	.dw $0132		; Attack
	.db $23			; Defense
	.db $08			; Agility
	.dw $3397		; Experience
	.dw $1400		; Gold
	.db $02			; Drop item ID
	.db $96			; Drop rate (1/N)
	.db $34			; Action pattern
	.db $00			; Resistances
	.db $15			; Sprite info

monster_021:
	.dw $971a		; HP
	.db $35			; MP
	.dw $31a0		; Attack
	.db $1b			; Defense
	.db $97			; Agility
	.dw $0036		; Experience
	.dw $030b		; Gold
	.db $97			; Drop item ID
	.db $37			; Drop rate (1/N)
	.db $00			; Action pattern
	.db $07			; Resistances
	.db $1b			; Sprite info

monster_022:
	.dw $3897		; HP
	.db $00			; MP
	.dw $1303		; Attack
	.db $97			; Defense
	.db $39			; Agility
	.dw $0380		; Experience
	.dw $9703		; Gold
	.db $3a			; Drop item ID
	.db $80			; Drop rate (1/N)
	.db $05			; Action pattern
	.db $0b			; Resistances
	.db $97			; Sprite info

monster_023:
	.dw $003b		; HP
	.db $1d			; MP
	.dw $971f		; Attack
	.db $3c			; Defense
	.db $e0			; Agility
	.dw $2515		; Experience
	.dw $3d14		; Gold
	.db $20			; Drop item ID
	.db $13			; Drop rate (1/N)
	.db $31			; Action pattern
	.db $10			; Resistances
	.db $3e			; Sprite info

monster_024:
	.dw $0ca0		; HP
	.db $07			; MP
	.dw $3f9e		; Attack
	.db $03			; Defense
	.db $15			; Agility
	.dw $101f		; Experience
	.dw $0540		; Gold
	.db $10			; Drop item ID
	.db $19			; Drop rate (1/N)
	.db $10			; Action pattern
	.db $41			; Resistances
	.db $03			; Sprite info

monster_025:
	.dw $2110		; HP
	.db $10			; MP
	.dw $0442		; Attack
	.db $0e			; Defense
	.db $1d			; Agility
	.dw $4310		; Experience
	.dw $3106		; Gold
	.db $13			; Drop item ID
	.db $07			; Drop rate (1/N)
	.db $44			; Action pattern
	.db $60			; Resistances
	.db $07			; Sprite info

monster_026:
	.dw $0c0d		; HP
	.db $45			; MP
	.dw $1d60		; Attack
	.db $24			; Defense
	.db $18			; Agility
	.dw $2046		; Experience
	.dw $1f10		; Gold
	.db $1c			; Drop item ID
	.db $47			; Drop rate (1/N)
	.db $20			; Action pattern
	.db $05			; Resistances
	.db $0c			; Sprite info

monster_027:
	.dw $488c		; HP
	.db $00			; MP
	.dw $130a		; Attack
	.db $14			; Defense
	.db $ff			; Agility
	.dw $3e46		; Experience
	.dw $0c00		; Gold
	.db $06			; Drop item ID
	.db $82			; Drop rate (1/N)
	.db $48			; Action pattern
	.db $2c			; Resistances
	.db $00			; Sprite info

monster_028:
	.dw $090b		; HP
	.db $82			; MP
	.dw $76ff		; Attack
	.db $b9			; Defense
	.db $00			; Agility
	.dw $0361		; Experience
	.dw $0164		; Gold
	.db $e4			; Drop item ID
	.db $00			; Drop rate (1/N)
	.db $62			; Action pattern
	.db $01			; Resistances
	.db $62			; Sprite info

monster_029:
	.dw $6202		; HP
	.db $03			; MP
	.dw $00e0		; Attack
	.db $63			; Defense
	.db $00			; Agility
	.dw $0061		; Experience
	.dw $0161		; Gold
	.db $e1			; Drop item ID
	.db $02			; Drop rate (1/N)
	.db $e2			; Action pattern
	.db $00			; Resistances
	.db $60			; Sprite info

monster_030:
	.dw $e002		; HP
	.db $01			; MP
	.dw $01ff		; Attack
	.db $e1			; Defense
	.db $01			; Agility
	.dw $0062		; Experience
	.dw $00e0		; Gold
	.db $e1			; Drop item ID
	.db $00			; Drop rate (1/N)
	.db $ff			; Action pattern
	.db $02			; Resistances
	.db $63			; Sprite info

monster_031:
	.dw $e301		; HP
	.db $00			; MP
	.dw $0062		; Attack
	.db $e2			; Defense
	.db $01			; Agility
	.dw $0061		; Experience
	.dw $01e1		; Gold
	.db $60			; Drop item ID
	.db $01			; Drop rate (1/N)
	.db $e0			; Action pattern
	.db $00			; Resistances
	.db $ff			; Sprite info

monster_032:
	.dw $6203		; HP
	.db $00			; MP
	.dw $0061		; Attack
	.db $61			; Defense
	.db $01			; Agility
	.dw $0262		; Experience
	.dw $0162		; Gold
	.db $63			; Drop item ID
	.db $00			; Drop rate (1/N)
	.db $61			; Action pattern
	.db $02			; Resistances
	.db $e2			; Sprite info

monster_033:
	.dw $6003		; HP
	.db $01			; MP
	.dw $0260		; Attack
	.db $e0			; Defense
	.db $06			; Agility
	.dw $0060		; Experience
	.dw $0460		; Gold
	.db $60			; Drop item ID
	.db $03			; Drop rate (1/N)
	.db $e0			; Action pattern
	.db $07			; Resistances
	.db $e0			; Sprite info

monster_034:
	.dw $ff05		; HP
	.db $04			; MP
	.dw $006a		; Attack
	.db $6b			; Defense
	.db $00			; Agility
	.dw $0169		; Experience
	.dw $0261		; Gold
	.db $e8			; Drop item ID
	.db $00			; Drop rate (1/N)
	.db $00			; Action pattern
	.db $00			; Resistances
	.db $e0			; Sprite info

monster_035:
	.dw $6e03		; HP
	.db $02			; MP
	.dw $006d		; Attack
	.db $65			; Defense
	.db $00			; Agility
	.dw $0166		; Experience
	.dw $01e5		; Gold
	.db $69			; Drop item ID
	.db $00			; Drop rate (1/N)
	.db $e9			; Action pattern
	.db $02			; Resistances
	.db $ea			; Sprite info

monster_036:
	.dw $6201		; HP
	.db $02			; MP
	.dw $04e2		; Attack
	.db $6c			; Defense
	.db $00			; Agility
	.dw $03e2		; Experience
	.dw $016e		; Gold
	.db $ee			; Drop item ID
	.db $00			; Drop rate (1/N)
	.db $e0			; Action pattern
	.db $04			; Resistances
	.db $63			; Sprite info

monster_037:
	.dw $6000		; HP
	.db $02			; MP
	.dw $01e3		; Attack
	.db $60			; Defense
	.db $00			; Agility
	.dw $00e4		; Experience
	.dw $01e0		; Gold
	.db $e6			; Drop item ID
	.db $00			; Drop rate (1/N)
	.db $62			; Action pattern
	.db $01			; Resistances
	.db $6d			; Sprite info

monster_038:
	.dw $6d03		; HP
	.db $05			; MP
	.dw $016d		; Attack
	.db $6d			; Defense
	.db $06			; Agility
	.dw $026d		; Experience
	.dw $04ed		; Gold
	.db $67			; Drop item ID
	.db $01			; Drop rate (1/N)
	.db $67			; Action pattern
	.db $00			; Resistances
	.db $e2			; Sprite info

monster_039:
	.dw $ff00		; HP
	.db $05			; MP
	.dw $00e1		; Attack
	.db $e0			; Defense
	.db $00			; Agility
	.dw $06ff		; Experience
	.dw $0061		; Gold
	.db $61			; Drop item ID
	.db $01			; Drop rate (1/N)
	.db $62			; Action pattern
	.db $00			; Resistances
	.db $e3			; Sprite info

monster_040:
	.dw $6000		; HP
	.db $00			; MP
	.dw $01e0		; Attack
	.db $e0			; Defense
	.db $02			; Agility
	.dw $03e0		; Experience
	.dw $07ff		; Gold
	.db $e1			; Drop item ID
	.db $00			; Drop rate (1/N)
	.db $e0			; Action pattern
	.db $00			; Resistances
	.db $ff			; Sprite info

monster_041:
	.dw $8008		; HP
	.db $63			; MP
	.dw $6400		; Attack
	.db $00			; Defense
	.db $63			; Agility
	.dw $e201		; Experience
	.dw $e100		; Gold
	.db $03			; Drop item ID
	.db $61			; Drop rate (1/N)
	.db $00			; Action pattern
	.db $e1			; Resistances
	.db $02			; Sprite info

monster_042:
	.dw $01e1		; HP
	.db $ff			; MP
	.dw $e709		; Attack
	.db $00			; Defense
	.db $80			; Agility
	.dw $0163		; Experience
	.dw $00e3		; Gold
	.db $62			; Drop item ID
	.db $01			; Drop rate (1/N)
	.db $62			; Action pattern
	.db $00			; Resistances
	.db $e4			; Sprite info

monster_043:
	.dw $e300		; HP
	.db $02			; MP
	.dw $8080		; Attack
	.db $e0			; Defense
	.db $00			; Agility
	.dw $0aff		; Experience
	.dw $01a0		; Gold
	.db $2d			; Drop item ID
	.db $ff			; Drop rate (1/N)
	.db $0b			; Action pattern
	.db $61			; Resistances
	.db $01			; Sprite info

monster_044:
	.dw $00e1		; HP
	.db $60			; MP
	.dw $e001		; Attack
	.db $00			; Defense
	.db $ff			; Agility
	.dw $800c		; Experience
	.dw $0dff		; Gold
	.db $61			; Drop item ID
	.db $02			; Drop rate (1/N)
	.db $e2			; Action pattern
	.db $00			; Resistances
	.db $61			; Sprite info

monster_045:
	.dw $6101		; HP
	.db $00			; MP
	.dw $00e0		; Attack
	.db $e0			; Defense
	.db $01			; Agility
	.dw $0eff		; Experience
	.dw $ff80		; Gold
	.db $0f			; Drop item ID
	.db $61			; Drop rate (1/N)
	.db $01			; Action pattern
	.db $61			; Resistances
	.db $00			; Sprite info

monster_046:
	.dw $0261		; HP
	.db $80			; MP
	.dw $0160		; Attack
	.db $60			; Defense
	.db $00			; Agility
	.dw $02e0		; Experience
	.dw $10ff		; Gold
	.db $62			; Drop item ID
	.db $00			; Drop rate (1/N)
	.db $63			; Action pattern
	.db $00			; Resistances
	.db $e1			; Sprite info

monster_047:
	.dw $e000		; HP
	.db $02			; MP
	.dw $00e0		; Attack
	.db $e0			; Defense
	.db $01			; Agility
	.dw $11ff		; Experience
	.dw $0161		; Gold
	.db $62			; Drop item ID
	.db $00			; Drop rate (1/N)
	.db $e1			; Action pattern
	.db $00			; Resistances
	.db $60			; Sprite info

monster_048:
	.dw $e002		; HP
	.db $00			; MP
	.dw $01e0		; Attack
	.db $65			; Defense
	.db $00			; Agility
	.dw $00e4		; Experience
	.dw $01e3		; Gold
	.db $e3			; Drop item ID
	.db $00			; Drop rate (1/N)
	.db $ff			; Action pattern
	.db $12			; Resistances
	.db $62			; Sprite info

monster_049:
	.dw $6100		; HP
	.db $02			; MP
	.dw $0061		; Attack
	.db $61			; Defense
	.db $01			; Agility
	.dw $03e1		; Experience
	.dw $0260		; Gold
	.db $60			; Drop item ID
	.db $03			; Drop rate (1/N)
	.db $60			; Action pattern
	.db $01			; Resistances
	.db $e0			; Sprite info

; ============================================================================
; End of monster data
; ============================================================================
