; ============================================================================
; Dragon Warrior IV - Item Data
; ============================================================================
; Generated from items.json by json_to_asm.py
; ============================================================================

; Item data structure (8 bytes per entry):
;   Offset  Size  Description
;   $00	 2	 Price (little endian)
;   $02	 1	 Attack bonus
;   $03	 1	 Defense bonus
;   $04	 1	 Agility bonus (signed)
;   $05	 1	 Equip flags
;   $06	 1	 Effect ID
;   $07	 1	 Item type

.segment "PRG_BANK_08"

; Item count
ITEM_COUNT = 100

; Item stat table
item_stats_table:

item_000:
	.dw $154a		; Price
	.db $c8			; Attack bonus
	.db $10			; Defense bonus
	.db $07			; Agility bonus
	.db $03			; Equip flags
	.db $02			; Effect ID
	.db $02			; Item type

item_001:
	.dw $0301		; Price
	.db $03			; Attack bonus
	.db $42			; Defense bonus
	.db $25			; Agility bonus
	.db $c0			; Equip flags
	.db $20			; Effect ID
	.db $21			; Item type

item_002:
	.dw $2c51		; Price
	.db $14			; Attack bonus
	.db $10			; Defense bonus
	.db $00			; Agility bonus
	.db $e0			; Equip flags
	.db $10			; Effect ID
	.db $63			; Item type

item_003:
	.dw $3f73		; Price
	.db $1f			; Attack bonus
	.db $1c			; Defense bonus
	.db $fb			; Agility bonus
	.db $fb			; Equip flags
	.db $1f			; Effect ID
	.db $42			; Item type

item_004:
	.dw $c035		; Price
	.db $30			; Attack bonus
	.db $23			; Defense bonus
	.db $98			; Agility bonus
	.db $67			; Equip flags
	.db $06			; Effect ID
	.db $02			; Item type

item_005:
	.dw $0404		; Price
	.db $00			; Attack bonus
	.db $3f			; Defense bonus
	.db $f8			; Agility bonus
	.db $67			; Equip flags
	.db $06			; Effect ID
	.db $0a			; Item type

item_006:
	.dw $1515		; Price
	.db $12			; Attack bonus
	.db $4a			; Defense bonus
	.db $45			; Agility bonus
	.db $c8			; Equip flags
	.db $40			; Effect ID
	.db $f0			; Item type

item_007:
	.dw $037f		; Price
	.db $17			; Attack bonus
	.db $13			; Defense bonus
	.db $14			; Agility bonus
	.db $17			; Equip flags
	.db $17			; Effect ID
	.db $17			; Item type

item_008:
	.dw $030c		; Price
	.db $07			; Attack bonus
	.db $03			; Defense bonus
	.db $4a			; Agility bonus
	.db $55			; Equip flags
	.db $c8			; Effect ID
	.db $50			; Item type

item_009:
	.dw $ff00		; Price
	.db $17			; Attack bonus
	.db $17			; Defense bonus
	.db $0b			; Agility bonus
	.db $0b			; Equip flags
	.db $0b			; Effect ID
	.db $06			; Item type

item_010:
	.dw $0506		; Price
	.db $4a			; Attack bonus
	.db $65			; Defense bonus
	.db $c8			; Agility bonus
	.db $60			; Equip flags
	.db $01			; Effect ID
	.db $ff			; Item type

item_011:
	.dw $0303		; Price
	.db $07			; Attack bonus
	.db $07			; Defense bonus
	.db $08			; Agility bonus
	.db $07			; Equip flags
	.db $18			; Effect ID
	.db $e7			; Item type

item_012:
	.dw $4ae7		; Price
	.db $75			; Attack bonus
	.db $c8			; Defense bonus
	.db $70			; Agility bonus
	.db $e0			; Equip flags
	.db $c0			; Effect ID
	.db $3f			; Item type

item_013:
	.dw $bf0c		; Price
	.db $67			; Attack bonus
	.db $1c			; Defense bonus
	.db $4a			; Agility bonus
	.db $24			; Equip flags
	.db $c8			; Effect ID
	.db $21			; Item type

item_014:
	.dw $3f3f		; Price
	.db $90			; Attack bonus
	.db $08			; Defense bonus
	.db $10			; Agility bonus
	.db $60			; Equip flags
	.db $86			; Effect ID
	.db $9c			; Item type

item_015:
	.dw $3890		; Price
	.db $f0			; Attack bonus
	.db $e0			; Defense bonus
	.db $80			; Agility bonus
	.db $80			; Equip flags
	.db $4a			; Effect ID
	.db $34			; Item type

item_016:
	.dw $31c8		; Price
	.db $18			; Attack bonus
	.db $ff			; Defense bonus
	.db $3c			; Agility bonus
	.db $78			; Equip flags
	.db $38			; Effect ID
	.db $18			; Item type

item_017:
	.dw $6828		; Price
	.db $68			; Attack bonus
	.db $a8			; Defense bonus
	.db $80			; Agility bonus
	.db $80			; Equip flags
	.db $4a			; Effect ID
	.db $44			; Item type

item_018:
	.dw $41c8		; Price
	.db $00			; Attack bonus
	.db $ff			; Defense bonus
	.db $b4			; Agility bonus
	.db $54			; Equip flags
	.db $56			; Effect ID
	.db $57			; Item type

item_019:
	.dw $6b5b		; Price
	.db $6b			; Attack bonus
	.db $6d			; Defense bonus
	.db $4a			; Agility bonus
	.db $54			; Equip flags
	.db $c8			; Effect ID
	.db $51			; Item type

item_020:
	.dw $ff00		; Price
	.db $ad			; Attack bonus
	.db $b6			; Defense bonus
	.db $b7			; Agility bonus
	.db $b7			; Equip flags
	.db $57			; Effect ID
	.db $db			; Item type

item_021:
	.dw $dbdb		; Price
	.db $4a			; Attack bonus
	.db $64			; Defense bonus
	.db $c8			; Agility bonus
	.db $61			; Equip flags
	.db $01			; Effect ID
	.db $ff			; Item type

item_022:
	.dw $dddd		; Price
	.db $ee			; Attack bonus
	.db $ef			; Defense bonus
	.db $f7			; Agility bonus
	.db $f7			; Equip flags
	.db $7b			; Effect ID
	.db $9d			; Item type

item_023:
	.dw $4a80		; Price
	.db $74			; Attack bonus
	.db $c8			; Defense bonus
	.db $71			; Agility bonus
	.db $c0			; Equip flags
	.db $c0			; Effect ID
	.db $86			; Item type

item_024:
	.dw $e001		; Price
	.db $80			; Attack bonus
	.db $4a			; Defense bonus
	.db $23			; Agility bonus
	.db $c8			; Equip flags
	.db $22			; Effect ID
	.db $07			; Item type

item_025:
	.dw $0307		; Price
	.db $0d			; Attack bonus
	.db $1a			; Defense bonus
	.db $03			; Agility bonus
	.db $0d			; Equip flags
	.db $18			; Effect ID
	.db $42			; Item type

item_026:
	.dw $c033		; Price
	.db $32			; Attack bonus
	.db $55			; Defense bonus
	.db $d2			; Agility bonus
	.db $af			; Equip flags
	.db $55			; Effect ID
	.db $50			; Item type

item_027:
	.dw $3420		; Price
	.db $44			; Attack bonus
	.db $50			; Defense bonus
	.db $d0			; Agility bonus
	.db $af			; Equip flags
	.db $55			; Effect ID
	.db $52			; Item type

item_028:
	.dw $1625		; Price
	.db $05			; Attack bonus
	.db $4a			; Defense bonus
	.db $43			; Agility bonus
	.db $c8			; Equip flags
	.db $42			; Effect ID
	.db $c0			; Item type

item_029:
	.dw $4ac7		; Price
	.db $31			; Attack bonus
	.db $80			; Defense bonus
	.db $81			; Agility bonus
	.db $c0			; Equip flags
	.db $02			; Effect ID
	.db $01			; Item type

item_030:
	.dw $5342		; Price
	.db $c0			; Attack bonus
	.db $52			; Defense bonus
	.db $e0			; Agility bonus
	.db $f0			; Equip flags
	.db $30			; Effect ID
	.db $c0			; Item type

item_031:
	.dw $7c78		; Price
	.db $be			; Attack bonus
	.db $bf			; Defense bonus
	.db $01			; Agility bonus
	.db $03			; Equip flags
	.db $07			; Effect ID
	.db $07			; Item type

item_032:
	.dw $0103		; Price
	.db $00			; Attack bonus
	.db $00			; Defense bonus
	.db $4a			; Agility bonus
	.db $63			; Equip flags
	.db $c8			; Effect ID
	.db $62			; Item type

item_033:
	.dw $ff00		; Price
	.db $df			; Attack bonus
	.db $e7			; Defense bonus
	.db $f8			; Agility bonus
	.db $3f			; Equip flags
	.db $cf			; Effect ID
	.db $f0			; Item type

item_034:
	.dw $ffff		; Price
	.db $4a			; Attack bonus
	.db $73			; Defense bonus
	.db $c8			; Agility bonus
	.db $72			; Equip flags
	.db $00			; Effect ID
	.db $e0			; Item type

item_035:
	.dw $9f7f		; Price
	.db $03			; Attack bonus
	.db $0a			; Defense bonus
	.db $18			; Agility bonus
	.db $05			; Equip flags
	.db $88			; Effect ID
	.db $10			; Item type

item_036:
	.dw $3f05		; Price
	.db $1f			; Attack bonus
	.db $0f			; Defense bonus
	.db $0f			; Agility bonus
	.db $0f			; Equip flags
	.db $07			; Effect ID
	.db $37			; Item type

item_037:
	.dw $101f		; Price
	.db $10			; Attack bonus
	.db $10			; Defense bonus
	.db $38			; Agility bonus
	.db $c8			; Equip flags
	.db $89			; Effect ID
	.db $14			; Item type

item_038:
	.dw $7e0d		; Price
	.db $f7			; Attack bonus
	.db $3b			; Defense bonus
	.db $bd			; Agility bonus
	.db $bd			; Equip flags
	.db $81			; Effect ID
	.db $ff			; Item type

item_039:
	.dw $81c3		; Price
	.db $81			; Attack bonus
	.db $42			; Defense bonus
	.db $42			; Agility bonus
	.db $81			; Equip flags
	.db $00			; Effect ID
	.db $00			; Item type

item_040:
	.dw $1c0a		; Price
	.db $0d			; Attack bonus
	.db $88			; Defense bonus
	.db $0c			; Agility bonus
	.db $0d			; Equip flags
	.db $c7			; Effect ID
	.db $ff			; Item type

item_041:
	.dw $1f0f		; Price
	.db $1f			; Attack bonus
	.db $0f			; Defense bonus
	.db $0f			; Agility bonus
	.db $06			; Equip flags
	.db $05			; Effect ID
	.db $03			; Item type

item_042:
	.dw $2010		; Price
	.db $01			; Attack bonus
	.db $02			; Defense bonus
	.db $04			; Agility bonus
	.db $0a			; Equip flags
	.db $1c			; Effect ID
	.db $15			; Item type

item_043:
	.dw $0c88		; Price
	.db $15			; Attack bonus
	.db $7f			; Defense bonus
	.db $e3			; Agility bonus
	.db $07			; Equip flags
	.db $02			; Effect ID
	.db $08			; Item type

item_044:
	.dw $1010		; Price
	.db $08			; Attack bonus
	.db $10			; Defense bonus
	.db $10			; Agility bonus
	.db $20			; Equip flags
	.db $20			; Effect ID
	.db $20			; Item type

item_045:
	.dw $0220		; Price
	.db $1c			; Attack bonus
	.db $1d			; Defense bonus
	.db $80			; Agility bonus
	.db $0c			; Equip flags
	.db $1d			; Effect ID
	.db $18			; Item type

item_046:
	.dw $1818		; Price
	.db $08			; Attack bonus
	.db $0c			; Defense bonus
	.db $07			; Agility bonus
	.db $01			; Equip flags
	.db $00			; Effect ID
	.db $20			; Item type

item_047:
	.dw $2020		; Price
	.db $10			; Attack bonus
	.db $10			; Defense bonus
	.db $08			; Agility bonus
	.db $06			; Equip flags
	.db $01			; Effect ID
	.db $88			; Item type

item_048:
	.dw $1d14		; Price
	.db $01			; Attack bonus
	.db $0f			; Defense bonus
	.db $c3			; Agility bonus
	.db $e7			; Equip flags
	.db $ff			; Effect ID
	.db $3c			; Item type

item_049:
	.dw $0bc3		; Price
	.db $18			; Attack bonus
	.db $25			; Defense bonus
	.db $89			; Agility bonus
	.db $10			; Equip flags
	.db $25			; Effect ID
	.db $0c			; Item type

item_050:
	.dw $cfcf		; Price
	.db $20			; Attack bonus
	.db $30			; Defense bonus
	.db $01			; Agility bonus
	.db $03			; Equip flags
	.db $03			; Effect ID
	.db $01			; Item type

item_051:
	.dw $3027		; Price
	.db $01			; Attack bonus
	.db $03			; Defense bonus
	.db $03			; Agility bonus
	.db $01			; Equip flags
	.db $c0			; Effect ID
	.db $30			; Item type

item_052:
	.dw $0f03		; Price
	.db $1f			; Attack bonus
	.db $1f			; Defense bonus
	.db $3f			; Agility bonus
	.db $3f			; Equip flags
	.db $7d			; Effect ID
	.db $78			; Item type

item_053:
	.dw $0500		; Price
	.db $0c			; Attack bonus
	.db $08			; Defense bonus
	.db $00			; Agility bonus
	.db $20			; Equip flags
	.db $02			; Effect ID
	.db $05			; Item type

item_054:
	.dw $40c8		; Price
	.db $8f			; Attack bonus
	.db $f0			; Defense bonus
	.db $fd			; Agility bonus
	.db $fb			; Equip flags
	.db $fc			; Effect ID
	.db $7f			; Item type

item_055:
	.dw $0a02		; Price
	.db $55			; Attack bonus
	.db $a5			; Defense bonus
	.db $2a			; Agility bonus
	.db $c8			; Equip flags
	.db $50			; Effect ID
	.db $fc			; Item type

item_056:
	.dw $ca00		; Price
	.db $12			; Attack bonus
	.db $22			; Defense bonus
	.db $02			; Agility bonus
	.db $01			; Equip flags
	.db $01			; Effect ID
	.db $c8			; Item type

item_057:
	.dw $0331		; Price
	.db $ff			; Attack bonus
	.db $c0			; Defense bonus
	.db $f0			; Agility bonus
	.db $f8			; Equip flags
	.db $f8			; Effect ID
	.db $fc			; Item type

item_058:
	.dw $befc		; Price
	.db $1e			; Attack bonus
	.db $44			; Defense bonus
	.db $a2			; Agility bonus
	.db $c8			; Equip flags
	.db $41			; Effect ID
	.db $8f			; Item type

item_059:
	.dw $bff0		; Price
	.db $df			; Attack bonus
	.db $3f			; Defense bonus
	.db $fe			; Agility bonus
	.db $42			; Equip flags
	.db $a8			; Effect ID
	.db $56			; Item type

item_060:
	.dw $aa55		; Price
	.db $c8			; Attack bonus
	.db $51			; Defense bonus
	.db $f2			; Agility bonus
	.db $00			; Equip flags
	.db $aa			; Effect ID
	.db $21			; Item type

item_061:
	.dw $4020		; Price
	.db $80			; Attack bonus
	.db $c8			; Defense bonus
	.db $50			; Agility bonus
	.db $ef			; Equip flags
	.db $00			; Effect ID
	.db $40			; Item type

item_062:
	.dw $40e0		; Price
	.db $02			; Attack bonus
	.db $60			; Defense bonus
	.db $60			; Agility bonus
	.db $04			; Equip flags
	.db $c9			; Effect ID
	.db $60			; Item type

item_063:
	.dw $ea1f		; Price
	.db $fe			; Attack bonus
	.db $00			; Defense bonus
	.db $01			; Agility bonus
	.db $07			; Equip flags
	.db $17			; Effect ID
	.db $63			; Item type

item_064:
	.dw $3c1e		; Price
	.db $00			; Attack bonus
	.db $01			; Defense bonus
	.db $07			; Agility bonus
	.db $7f			; Equip flags
	.db $3f			; Effect ID
	.db $c8			; Item type

item_065:
	.dw $fb51		; Price
	.db $03			; Attack bonus
	.db $3c			; Defense bonus
	.db $7f			; Agility bonus
	.db $60			; Equip flags
	.db $60			; Effect ID
	.db $01			; Item type

item_066:
	.dw $0103		; Price
	.db $3c			; Attack bonus
	.db $7e			; Defense bonus
	.db $c9			; Agility bonus
	.db $61			; Equip flags
	.db $ff			; Effect ID
	.db $f9			; Item type

item_067:
	.dw $d75b		; Price
	.db $7d			; Attack bonus
	.db $83			; Defense bonus
	.db $7f			; Agility bonus
	.db $fc			; Equip flags
	.db $d6			; Effect ID
	.db $83			; Item type

item_068:
	.dw $7dd7		; Price
	.db $83			; Attack bonus
	.db $fc			; Defense bonus
	.db $c8			; Agility bonus
	.db $52			; Equip flags
	.db $12			; Effect ID
	.db $00			; Item type

item_069:
	.dw $2080		; Price
	.db $c8			; Attack bonus
	.db $62			; Defense bonus
	.db $7e			; Agility bonus
	.db $fe			; Equip flags
	.db $80			; Effect ID
	.db $f0			; Item type

item_070:
	.dw $e3f6		; Price
	.db $ff			; Attack bonus
	.db $fc			; Defense bonus
	.db $c0			; Agility bonus
	.db $30			; Equip flags
	.db $fe			; Effect ID
	.db $ff			; Item type

item_071:
	.dw $fcff		; Price
	.db $c0			; Attack bonus
	.db $c0			; Defense bonus
	.db $30			; Agility bonus
	.db $00			; Equip flags
	.db $00			; Effect ID
	.db $01			; Item type

item_072:
	.dw $0301		; Price
	.db $0f			; Attack bonus
	.db $7e			; Defense bonus
	.db $78			; Agility bonus
	.db $01			; Equip flags
	.db $03			; Effect ID
	.db $07			; Item type

item_073:
	.dw $1f0f		; Price
	.db $3f			; Attack bonus
	.db $7e			; Defense bonus
	.db $78			; Agility bonus
	.db $c8			; Equip flags
	.db $40			; Effect ID
	.db $f0			; Item type

item_074:
	.dw $20ff		; Price
	.db $20			; Attack bonus
	.db $30			; Defense bonus
	.db $0e			; Agility bonus
	.db $20			; Equip flags
	.db $23			; Effect ID
	.db $f5			; Item type

item_075:
	.dw $667f		; Price
	.db $68			; Attack bonus
	.db $32			; Defense bonus
	.db $0e			; Agility bonus
	.db $c8			; Equip flags
	.db $50			; Effect ID
	.db $61			; Item type

item_076:
	.dw $feff		; Price
	.db $5c			; Attack bonus
	.db $81			; Defense bonus
	.db $03			; Agility bonus
	.db $03			; Equip flags
	.db $06			; Effect ID
	.db $05			; Item type

item_077:
	.dw $0201		; Price
	.db $0c			; Attack bonus
	.db $04			; Defense bonus
	.db $c8			; Agility bonus
	.db $60			; Equip flags
	.db $e6			; Effect ID
	.db $9e			; Item type

item_078:
	.dw $0c01		; Price
	.db $17			; Attack bonus
	.db $0a			; Defense bonus
	.db $04			; Agility bonus
	.db $04			; Equip flags
	.db $05			; Effect ID
	.db $03			; Item type

item_079:
	.dw $0201		; Price
	.db $c8			; Attack bonus
	.db $21			; Defense bonus
	.db $1f			; Agility bonus
	.db $1f			; Equip flags
	.db $06			; Effect ID
	.db $1c			; Item type

item_080:
	.dw $6f3c		; Price
	.db $ff			; Attack bonus
	.db $07			; Defense bonus
	.db $1f			; Agility bonus
	.db $3f			; Equip flags
	.db $7f			; Effect ID
	.db $ff			; Item type

item_081:
	.dw $31c0		; Price
	.db $7f			; Attack bonus
	.db $cf			; Defense bonus
	.db $9f			; Agility bonus
	.db $fc			; Equip flags
	.db $e0			; Effect ID
	.db $80			; Item type

item_082:
	.dw $0f01		; Price
	.db $ff			; Attack bonus
	.db $ff			; Defense bonus
	.db $ff			; Agility bonus
	.db $fc			; Equip flags
	.db $e2			; Effect ID
	.db $9f			; Item type

item_083:
	.dw $a06e		; Price
	.db $c8			; Attack bonus
	.db $41			; Defense bonus
	.db $c4			; Agility bonus
	.db $ff			; Equip flags
	.db $3f			; Effect ID
	.db $7f			; Item type

item_084:
	.dw $febf		; Price
	.db $78			; Attack bonus
	.db $d2			; Defense bonus
	.db $e1			; Agility bonus
	.db $f3			; Equip flags
	.db $80			; Effect ID
	.db $80			; Item type

item_085:
	.dw $c002		; Price
	.db $51			; Attack bonus
	.db $bc			; Defense bonus
	.db $b8			; Agility bonus
	.db $f2			; Equip flags
	.db $6f			; Effect ID
	.db $ff			; Item type

item_086:
	.dw $fffe		; Price
	.db $ff			; Attack bonus
	.db $00			; Defense bonus
	.db $00			; Agility bonus
	.db $02			; Equip flags
	.db $03			; Effect ID
	.db $07			; Item type

item_087:
	.dw $0706		; Price
	.db $03			; Attack bonus
	.db $c8			; Defense bonus
	.db $61			; Agility bonus
	.db $3c			; Equip flags
	.db $e0			; Effect ID
	.db $df			; Item type

item_088:
	.dw $1f7f		; Price
	.db $40			; Attack bonus
	.db $5b			; Defense bonus
	.db $87			; Agility bonus
	.db $e0			; Equip flags
	.db $c8			; Effect ID
	.db $22			; Item type

item_089:
	.dw $0f1f		; Price
	.db $10			; Attack bonus
	.db $38			; Defense bonus
	.db $fe			; Agility bonus
	.db $3f			; Equip flags
	.db $80			; Effect ID
	.db $f0			; Item type

item_090:
	.dw $fef8		; Price
	.db $ff			; Attack bonus
	.db $c8			; Defense bonus
	.db $32			; Agility bonus
	.db $ef			; Equip flags
	.db $e3			; Effect ID
	.db $e1			; Item type

item_091:
	.dw $ffb0		; Price
	.db $d0			; Attack bonus
	.db $f5			; Defense bonus
	.db $ff			; Agility bonus
	.db $ff			; Equip flags
	.db $ff			; Effect ID
	.db $b7			; Item type

item_092:
	.dw $05d8		; Price
	.db $01			; Attack bonus
	.db $c8			; Defense bonus
	.db $42			; Agility bonus
	.db $04			; Equip flags
	.db $ff			; Effect ID
	.db $fe			; Item type

item_093:
	.dw $fafe		; Price
	.db $ff			; Attack bonus
	.db $3d			; Defense bonus
	.db $95			; Agility bonus
	.db $0f			; Equip flags
	.db $9f			; Effect ID
	.db $80			; Item type

item_094:
	.dw $52c0		; Price
	.db $7e			; Attack bonus
	.db $1f			; Defense bonus
	.db $ce			; Agility bonus
	.db $7f			; Equip flags
	.db $7f			; Effect ID
	.db $ff			; Item type

item_095:
	.dw $fef7		; Price
	.db $00			; Attack bonus
	.db $00			; Defense bonus
	.db $c0			; Agility bonus
	.db $40			; Equip flags
	.db $40			; Effect ID
	.db $c0			; Item type

item_096:
	.dw $80c0		; Price
	.db $c8			; Attack bonus
	.db $62			; Defense bonus
	.db $3f			; Agility bonus
	.db $e6			; Equip flags
	.db $fb			; Effect ID
	.db $fa			; Item type

item_097:
	.dw $03f8		; Price
	.db $01			; Attack bonus
	.db $02			; Defense bonus
	.db $f7			; Agility bonus
	.db $d0			; Equip flags
	.db $0c			; Effect ID
	.db $06			; Item type

item_098:
	.dw $c901		; Price
	.db $33			; Attack bonus
	.db $c0			; Defense bonus
	.db $7e			; Agility bonus
	.db $3e			; Equip flags
	.db $a0			; Effect ID
	.db $3c			; Item type

item_099:
	.dw $0c0c		; Price
	.db $70			; Attack bonus
	.db $f0			; Defense bonus
	.db $f8			; Agility bonus
	.db $3c			; Equip flags
	.db $cc			; Effect ID
	.db $0c			; Item type

; ============================================================================
; End of item data
; ============================================================================
