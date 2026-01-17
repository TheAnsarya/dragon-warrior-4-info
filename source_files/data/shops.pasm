; ============================================================================
; Dragon Warrior IV - Shop Data
; ============================================================================
; Generated from shops.json by json_to_asm.py
; ============================================================================

; Shop format: List of item IDs terminated by $ff

.segment "PRG_BANK_08"

; Shop count
SHOP_COUNT = 180

; Shop pointer table
shop_pointer_table:
	.dw shop_000
	.dw shop_001
	.dw shop_002
	.dw shop_003
	.dw shop_004
	.dw shop_005
	.dw shop_006
	.dw shop_007
	.dw shop_008
	.dw shop_009
	.dw shop_010
	.dw shop_011
	.dw shop_012
	.dw shop_013
	.dw shop_014
	.dw shop_015
	.dw shop_016
	.dw shop_017
	.dw shop_018
	.dw shop_019
	.dw shop_020
	.dw shop_021
	.dw shop_022
	.dw shop_023
	.dw shop_024
	.dw shop_025
	.dw shop_026
	.dw shop_027
	.dw shop_028
	.dw shop_029
	.dw shop_030
	.dw shop_031
	.dw shop_032
	.dw shop_033
	.dw shop_034
	.dw shop_035
	.dw shop_036
	.dw shop_037
	.dw shop_038
	.dw shop_039
	.dw shop_040
	.dw shop_041
	.dw shop_042
	.dw shop_043
	.dw shop_044
	.dw shop_045
	.dw shop_046
	.dw shop_047
	.dw shop_048
	.dw shop_049
	.dw shop_050
	.dw shop_051
	.dw shop_052
	.dw shop_053
	.dw shop_054
	.dw shop_055
	.dw shop_056
	.dw shop_057
	.dw shop_058
	.dw shop_059
	.dw shop_060
	.dw shop_061
	.dw shop_062
	.dw shop_063
	.dw shop_064
	.dw shop_065
	.dw shop_066
	.dw shop_067
	.dw shop_068
	.dw shop_069
	.dw shop_070
	.dw shop_071
	.dw shop_072
	.dw shop_073
	.dw shop_074
	.dw shop_075
	.dw shop_076
	.dw shop_077
	.dw shop_078
	.dw shop_079
	.dw shop_080
	.dw shop_081
	.dw shop_082
	.dw shop_083
	.dw shop_084
	.dw shop_085
	.dw shop_086
	.dw shop_087
	.dw shop_088
	.dw shop_089
	.dw shop_090
	.dw shop_091
	.dw shop_092
	.dw shop_093
	.dw shop_094
	.dw shop_095
	.dw shop_096
	.dw shop_097
	.dw shop_098
	.dw shop_099
	.dw shop_100
	.dw shop_101
	.dw shop_102
	.dw shop_103
	.dw shop_104
	.dw shop_105
	.dw shop_106
	.dw shop_107
	.dw shop_108
	.dw shop_109
	.dw shop_110
	.dw shop_111
	.dw shop_112
	.dw shop_113
	.dw shop_114
	.dw shop_115
	.dw shop_116
	.dw shop_117
	.dw shop_118
	.dw shop_119
	.dw shop_120
	.dw shop_121
	.dw shop_122
	.dw shop_123
	.dw shop_124
	.dw shop_125
	.dw shop_126
	.dw shop_127
	.dw shop_128
	.dw shop_129
	.dw shop_130
	.dw shop_131
	.dw shop_132
	.dw shop_133
	.dw shop_134
	.dw shop_135
	.dw shop_136
	.dw shop_137
	.dw shop_138
	.dw shop_139
	.dw shop_140
	.dw shop_141
	.dw shop_142
	.dw shop_143
	.dw shop_144
	.dw shop_145
	.dw shop_146
	.dw shop_147
	.dw shop_148
	.dw shop_149
	.dw shop_150
	.dw shop_151
	.dw shop_152
	.dw shop_153
	.dw shop_154
	.dw shop_155
	.dw shop_156
	.dw shop_157
	.dw shop_158
	.dw shop_159
	.dw shop_160
	.dw shop_161
	.dw shop_162
	.dw shop_163
	.dw shop_164
	.dw shop_165
	.dw shop_166
	.dw shop_167
	.dw shop_168
	.dw shop_169
	.dw shop_170
	.dw shop_171
	.dw shop_172
	.dw shop_173
	.dw shop_174
	.dw shop_175
	.dw shop_176
	.dw shop_177
	.dw shop_178
	.dw shop_179

; Shop data

shop_000:
	.db $28, $10, $02, $a0
	.db $ff			; End of shop

shop_001:
	.db $10, $02, $a0
	.db $ff			; End of shop

shop_002:
	.db $0c, $48, $a2, $1f, $a9
	.db $ff			; End of shop

shop_003:
	.db $48, $a2, $1f, $a9
	.db $ff			; End of shop

shop_004:
	.db $a2, $1f, $a9
	.db $ff			; End of shop

shop_005:
	.db $30, $12, $19, $30, $17, $26, $30, $24, $13, $30, $26, $04
	.db $ff			; End of shop

shop_006:
	.db $12, $19, $30, $17, $26, $30, $24, $13, $30, $26, $04
	.db $ff			; End of shop

shop_007:
	.db $19, $30, $17, $26, $30, $24, $13, $30, $26, $04
	.db $ff			; End of shop

shop_008:
	.db $30, $17, $26, $30, $24, $13, $30, $26, $04
	.db $ff			; End of shop

shop_009:
	.db $17, $26, $30, $24, $13, $30, $26, $04
	.db $ff			; End of shop

shop_010:
	.db $26, $30, $24, $13, $30, $26, $04
	.db $ff			; End of shop

shop_011:
	.db $30, $24, $13, $30, $26, $04
	.db $ff			; End of shop

shop_012:
	.db $24, $13, $30, $26, $04
	.db $ff			; End of shop

shop_013:
	.db $13, $30, $26, $04
	.db $ff			; End of shop

shop_014:
	.db $30, $26, $04
	.db $ff			; End of shop

shop_015:
	.db $09, $04, $08
	.db $ff			; End of shop

shop_016:
	.db $08, $26, $19, $76, $19
	.db $ff			; End of shop

shop_017:
	.db $26, $19, $76, $19
	.db $ff			; End of shop

shop_018:
	.db $19, $76, $19
	.db $ff			; End of shop

shop_019:
	.db $01, $01, $03, $01, $01, $01, $03, $01
	.db $ff			; End of shop

shop_020:
	.db $01, $03, $01, $01, $01, $03, $01
	.db $ff			; End of shop

shop_021:
	.db $03, $01, $01, $01, $03, $01
	.db $ff			; End of shop

shop_022:
	.db $01, $01, $01, $03, $01
	.db $ff			; End of shop

shop_023:
	.db $01, $01, $03, $01
	.db $ff			; End of shop

shop_024:
	.db $01, $03, $01
	.db $ff			; End of shop

shop_025:
	.db $04, $01, $03, $02
	.db $ff			; End of shop

shop_026:
	.db $01, $03, $02
	.db $ff			; End of shop

shop_027:
	.db $12, $01, $01, $02
	.db $ff			; End of shop

shop_028:
	.db $01, $01, $02
	.db $ff			; End of shop

shop_029:
	.db $0e, $01, $01
	.db $ff			; End of shop

shop_030:
	.db $02, $01, $01
	.db $ff			; End of shop

shop_031:
	.db $06, $07, $03
	.db $ff			; End of shop

shop_032:
	.db $01, $01, $06, $01, $01, $03, $01, $09, $01, $01, $07, $01
	.db $ff			; End of shop

shop_033:
	.db $01, $06, $01, $01, $03, $01, $09, $01, $01, $07, $01
	.db $ff			; End of shop

shop_034:
	.db $06, $01, $01, $03, $01, $09, $01, $01, $07, $01
	.db $ff			; End of shop

shop_035:
	.db $01, $01, $03, $01, $09, $01, $01, $07, $01
	.db $ff			; End of shop

shop_036:
	.db $01, $03, $01, $09, $01, $01, $07, $01
	.db $ff			; End of shop

shop_037:
	.db $03, $01, $09, $01, $01, $07, $01
	.db $ff			; End of shop

shop_038:
	.db $01, $09, $01, $01, $07, $01
	.db $ff			; End of shop

shop_039:
	.db $09, $01, $01, $07, $01
	.db $ff			; End of shop

shop_040:
	.db $01, $01, $07, $01
	.db $ff			; End of shop

shop_041:
	.db $01, $07, $01
	.db $ff			; End of shop

shop_042:
	.db $1c, $a8, $60, $a0, $1c, $60, $2a, $36, $37, $0d, $35, $34
	.db $ff			; End of shop

shop_043:
	.db $a8, $60, $a0, $1c, $60, $2a, $36, $37, $0d, $35, $34
	.db $ff			; End of shop

shop_044:
	.db $60, $a0, $1c, $60, $2a, $36, $37, $0d, $35, $34
	.db $ff			; End of shop

shop_045:
	.db $a0, $1c, $60, $2a, $36, $37, $0d, $35, $34
	.db $ff			; End of shop

shop_046:
	.db $1c, $60, $2a, $36, $37, $0d, $35, $34
	.db $ff			; End of shop

shop_047:
	.db $60, $2a, $36, $37, $0d, $35, $34
	.db $ff			; End of shop

shop_048:
	.db $2a, $36, $37, $0d, $35, $34
	.db $ff			; End of shop

shop_049:
	.db $36, $37, $0d, $35, $34
	.db $ff			; End of shop

shop_050:
	.db $37, $0d, $35, $34
	.db $ff			; End of shop

shop_051:
	.db $0d, $35, $34
	.db $ff			; End of shop

shop_052:
	.db $0a, $13, $14
	.db $ff			; End of shop

shop_053:
	.db $0b, $09, $82
	.db $ff			; End of shop

shop_054:
	.db $0a, $a0, $01, $2d
	.db $ff			; End of shop

shop_055:
	.db $a0, $01, $2d
	.db $ff			; End of shop

shop_056:
	.db $18, $80, $80
	.db $ff			; End of shop

shop_057:
	.db $25, $a0, $03, $3b, $80
	.db $ff			; End of shop

shop_058:
	.db $a0, $03, $3b, $80
	.db $ff			; End of shop

shop_059:
	.db $03, $3b, $80
	.db $ff			; End of shop

shop_060:
	.db $29, $80, $80
	.db $ff			; End of shop

shop_061:
	.db $02, $80, $80
	.db $ff			; End of shop

shop_062:
	.db $03, $23, $19, $03, $24, $19, $03, $23, $1c, $03, $24, $1c
	.db $ff			; End of shop

shop_063:
	.db $23, $19, $03, $24, $19, $03, $23, $1c, $03, $24, $1c
	.db $ff			; End of shop

shop_064:
	.db $19, $03, $24, $19, $03, $23, $1c, $03, $24, $1c
	.db $ff			; End of shop

shop_065:
	.db $03, $24, $19, $03, $23, $1c, $03, $24, $1c
	.db $ff			; End of shop

shop_066:
	.db $24, $19, $03, $23, $1c, $03, $24, $1c
	.db $ff			; End of shop

shop_067:
	.db $19, $03, $23, $1c, $03, $24, $1c
	.db $ff			; End of shop

shop_068:
	.db $03, $23, $1c, $03, $24, $1c
	.db $ff			; End of shop

shop_069:
	.db $23, $1c, $03, $24, $1c
	.db $ff			; End of shop

shop_070:
	.db $1c, $03, $24, $1c
	.db $ff			; End of shop

shop_071:
	.db $03, $24, $1c
	.db $ff			; End of shop

shop_072:
	.db $1c, $1b, $1c
	.db $ff			; End of shop

shop_073:
	.db $2d, $4a, $2d
	.db $ff			; End of shop

shop_074:
	.db $4e, $37, $45, $4e, $06, $04, $05, $06, $0f, $16, $10
	.db $ff			; End of shop

shop_075:
	.db $37, $45, $4e, $06, $04, $05, $06, $0f, $16, $10
	.db $ff			; End of shop

shop_076:
	.db $45, $4e, $06, $04, $05, $06, $0f, $16, $10
	.db $ff			; End of shop

shop_077:
	.db $4e, $06, $04, $05, $06, $0f, $16, $10
	.db $ff			; End of shop

shop_078:
	.db $06, $04, $05, $06, $0f, $16, $10
	.db $ff			; End of shop

shop_079:
	.db $04, $05, $06, $0f, $16, $10
	.db $ff			; End of shop

shop_080:
	.db $05, $06, $0f, $16, $10
	.db $ff			; End of shop

shop_081:
	.db $06, $0f, $16, $10
	.db $ff			; End of shop

shop_082:
	.db $0f, $16, $10
	.db $ff			; End of shop

shop_083:
	.db $4e, $47, $4f
	.db $ff			; End of shop

shop_084:
	.db $3c, $2b, $51, $3c, $05, $05, $05, $05, $5a, $55, $5f
	.db $ff			; End of shop

shop_085:
	.db $2b, $51, $3c, $05, $05, $05, $05, $5a, $55, $5f
	.db $ff			; End of shop

shop_086:
	.db $51, $3c, $05, $05, $05, $05, $5a, $55, $5f
	.db $ff			; End of shop

shop_087:
	.db $3c, $05, $05, $05, $05, $5a, $55, $5f
	.db $ff			; End of shop

shop_088:
	.db $05, $05, $05, $05, $5a, $55, $5f
	.db $ff			; End of shop

shop_089:
	.db $05, $05, $05, $5a, $55, $5f
	.db $ff			; End of shop

shop_090:
	.db $05, $05, $5a, $55, $5f
	.db $ff			; End of shop

shop_091:
	.db $05, $5a, $55, $5f
	.db $ff			; End of shop

shop_092:
	.db $5a, $55, $5f
	.db $ff			; End of shop

shop_093:
	.db $49, $5a, $50
	.db $ff			; End of shop

shop_094:
	.db $66, $58, $58, $52, $01, $09, $09, $07, $5d, $64, $68
	.db $ff			; End of shop

shop_095:
	.db $58, $58, $52, $01, $09, $09, $07, $5d, $64, $68
	.db $ff			; End of shop

shop_096:
	.db $58, $52, $01, $09, $09, $07, $5d, $64, $68
	.db $ff			; End of shop

shop_097:
	.db $52, $01, $09, $09, $07, $5d, $64, $68
	.db $ff			; End of shop

shop_098:
	.db $01, $09, $09, $07, $5d, $64, $68
	.db $ff			; End of shop

shop_099:
	.db $09, $09, $07, $5d, $64, $68
	.db $ff			; End of shop

shop_100:
	.db $09, $07, $5d, $64, $68
	.db $ff			; End of shop

shop_101:
	.db $07, $5d, $64, $68
	.db $ff			; End of shop

shop_102:
	.db $5d, $64, $68
	.db $ff			; End of shop

shop_103:
	.db $6e, $71, $86
	.db $ff			; End of shop

shop_104:
	.db $55, $78, $55
	.db $ff			; End of shop

shop_105:
	.db $7c, $6a, $7c
	.db $ff			; End of shop

shop_106:
	.db $7c, $70, $63, $63, $08, $05, $05, $05, $5d, $5f, $68
	.db $ff			; End of shop

shop_107:
	.db $70, $63, $63, $08, $05, $05, $05, $5d, $5f, $68
	.db $ff			; End of shop

shop_108:
	.db $63, $63, $08, $05, $05, $05, $5d, $5f, $68
	.db $ff			; End of shop

shop_109:
	.db $63, $08, $05, $05, $05, $5d, $5f, $68
	.db $ff			; End of shop

shop_110:
	.db $20, $1b, $c0, $28, $84, $06, $46, $68
	.db $ff			; End of shop

shop_111:
	.db $1b, $c0, $28, $84, $06, $46, $68
	.db $ff			; End of shop

shop_112:
	.db $c0, $28, $84, $06, $46, $68
	.db $ff			; End of shop

shop_113:
	.db $28, $84, $06, $46, $68
	.db $ff			; End of shop

shop_114:
	.db $84, $06, $46, $68
	.db $ff			; End of shop

shop_115:
	.db $06, $46, $68
	.db $ff			; End of shop

shop_116:
	.db $64, $31, $b2, $11
	.db $ff			; End of shop

shop_117:
	.db $31, $b2, $11
	.db $ff			; End of shop

shop_118:
	.db $3e, $87, $6b
	.db $ff			; End of shop

shop_119:
	.db $33, $42, $74, $9b, $5f, $b6, $6f, $68, $36, $8b, $6e, $b6
	.db $ff			; End of shop

shop_120:
	.db $42, $74, $9b, $5f, $b6, $6f, $68, $36, $8b, $6e, $b6
	.db $ff			; End of shop

shop_121:
	.db $74, $9b, $5f, $b6, $6f, $68, $36, $8b, $6e, $b6
	.db $ff			; End of shop

shop_122:
	.db $9b, $5f, $b6, $6f, $68, $36, $8b, $6e, $b6
	.db $ff			; End of shop

shop_123:
	.db $5f, $b6, $6f, $68, $36, $8b, $6e, $b6
	.db $ff			; End of shop

shop_124:
	.db $b6, $6f, $68, $36, $8b, $6e, $b6
	.db $ff			; End of shop

shop_125:
	.db $6f, $68, $36, $8b, $6e, $b6
	.db $ff			; End of shop

shop_126:
	.db $68, $36, $8b, $6e, $b6
	.db $ff			; End of shop

shop_127:
	.db $36, $8b, $6e, $b6
	.db $ff			; End of shop

shop_128:
	.db $8b, $6e, $b6
	.db $ff			; End of shop

shop_129:
	.db $77, $18, $71
	.db $ff			; End of shop

shop_130:
	.db $59, $2f, $bf, $aa, $7c, $04, $54
	.db $ff			; End of shop

shop_131:
	.db $2f, $bf, $aa, $7c, $04, $54
	.db $ff			; End of shop

shop_132:
	.db $bf, $aa, $7c, $04, $54
	.db $ff			; End of shop

shop_133:
	.db $aa, $7c, $04, $54
	.db $ff			; End of shop

shop_134:
	.db $7c, $04, $54
	.db $ff			; End of shop

shop_135:
	.db $3a, $48, $09, $16, $bf, $12, $b1, $33, $1f, $71
	.db $ff			; End of shop

shop_136:
	.db $48, $09, $16, $bf, $12, $b1, $33, $1f, $71
	.db $ff			; End of shop

shop_137:
	.db $09, $16, $bf, $12, $b1, $33, $1f, $71
	.db $ff			; End of shop

shop_138:
	.db $16, $bf, $12, $b1, $33, $1f, $71
	.db $ff			; End of shop

shop_139:
	.db $bf, $12, $b1, $33, $1f, $71
	.db $ff			; End of shop

shop_140:
	.db $12, $b1, $33, $1f, $71
	.db $ff			; End of shop

shop_141:
	.db $b1, $33, $1f, $71
	.db $ff			; End of shop

shop_142:
	.db $33, $1f, $71
	.db $ff			; End of shop

shop_143:
	.db $17, $5f, $77, $90
	.db $ff			; End of shop

shop_144:
	.db $5f, $77, $90
	.db $ff			; End of shop

shop_145:
	.db $10, $16, $88, $80, $85, $a4, $21, $8f, $a8, $02, $78, $6a
	.db $ff			; End of shop

shop_146:
	.db $16, $88, $80, $85, $a4, $21, $8f, $a8, $02, $78, $6a
	.db $ff			; End of shop

shop_147:
	.db $88, $80, $85, $a4, $21, $8f, $a8, $02, $78, $6a
	.db $ff			; End of shop

shop_148:
	.db $80, $85, $a4, $21, $8f, $a8, $02, $78, $6a
	.db $ff			; End of shop

shop_149:
	.db $85, $a4, $21, $8f, $a8, $02, $78, $6a
	.db $ff			; End of shop

shop_150:
	.db $a4, $21, $8f, $a8, $02, $78, $6a
	.db $ff			; End of shop

shop_151:
	.db $21, $8f, $a8, $02, $78, $6a
	.db $ff			; End of shop

shop_152:
	.db $8f, $a8, $02, $78, $6a
	.db $ff			; End of shop

shop_153:
	.db $a8, $02, $78, $6a
	.db $ff			; End of shop

shop_154:
	.db $02, $78, $6a
	.db $ff			; End of shop

shop_155:
	.db $56, $0e, $4a, $10, $03, $92, $34
	.db $ff			; End of shop

shop_156:
	.db $0e, $4a, $10, $03, $92, $34
	.db $ff			; End of shop

shop_157:
	.db $4a, $10, $03, $92, $34
	.db $ff			; End of shop

shop_158:
	.db $10, $03, $92, $34
	.db $ff			; End of shop

shop_159:
	.db $03, $92, $34
	.db $ff			; End of shop

shop_160:
	.db $80, $01, $21, $77
	.db $ff			; End of shop

shop_161:
	.db $01, $21, $77
	.db $ff			; End of shop

shop_162:
	.db $3b, $06, $9e, $7c, $7f
	.db $ff			; End of shop

shop_163:
	.db $06, $9e, $7c, $7f
	.db $ff			; End of shop

shop_164:
	.db $9e, $7c, $7f
	.db $ff			; End of shop

shop_165:
	.db $7b, $59, $62, $c5, $81, $62
	.db $ff			; End of shop

shop_166:
	.db $59, $62, $c5, $81, $62
	.db $ff			; End of shop

shop_167:
	.db $62, $c5, $81, $62
	.db $ff			; End of shop

shop_168:
	.db $c5, $81, $62
	.db $ff			; End of shop

shop_169:
	.db $84, $85, $39
	.db $ff			; End of shop

shop_170:
	.db $70, $65, $8e
	.db $ff			; End of shop

shop_171:
	.db $49, $a4, $54, $ac, $9e, $a9, $9f, $49, $9f, $5e
	.db $ff			; End of shop

shop_172:
	.db $a4, $54, $ac, $9e, $a9, $9f, $49, $9f, $5e
	.db $ff			; End of shop

shop_173:
	.db $54, $ac, $9e, $a9, $9f, $49, $9f, $5e
	.db $ff			; End of shop

shop_174:
	.db $ac, $9e, $a9, $9f, $49, $9f, $5e
	.db $ff			; End of shop

shop_175:
	.db $9e, $a9, $9f, $49, $9f, $5e
	.db $ff			; End of shop

shop_176:
	.db $a9, $9f, $49, $9f, $5e
	.db $ff			; End of shop

shop_177:
	.db $9f, $49, $9f, $5e
	.db $ff			; End of shop

shop_178:
	.db $49, $9f, $5e
	.db $ff			; End of shop

shop_179:
	.db $68, $7c, $7f
	.db $ff			; End of shop

; ============================================================================
; End of shop data
; ============================================================================
