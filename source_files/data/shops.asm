; ============================================================================
; Dragon Warrior IV - Shop Data
; ============================================================================
; Generated from shops.json by json_to_asm.py
; ============================================================================

; Shop format: List of item IDs terminated by $FF

.segment "PRG_BANK_08"

; Shop count
SHOP_COUNT = 180

; Shop pointer table
shop_pointer_table:
	.word shop_000
	.word shop_001
	.word shop_002
	.word shop_003
	.word shop_004
	.word shop_005
	.word shop_006
	.word shop_007
	.word shop_008
	.word shop_009
	.word shop_010
	.word shop_011
	.word shop_012
	.word shop_013
	.word shop_014
	.word shop_015
	.word shop_016
	.word shop_017
	.word shop_018
	.word shop_019
	.word shop_020
	.word shop_021
	.word shop_022
	.word shop_023
	.word shop_024
	.word shop_025
	.word shop_026
	.word shop_027
	.word shop_028
	.word shop_029
	.word shop_030
	.word shop_031
	.word shop_032
	.word shop_033
	.word shop_034
	.word shop_035
	.word shop_036
	.word shop_037
	.word shop_038
	.word shop_039
	.word shop_040
	.word shop_041
	.word shop_042
	.word shop_043
	.word shop_044
	.word shop_045
	.word shop_046
	.word shop_047
	.word shop_048
	.word shop_049
	.word shop_050
	.word shop_051
	.word shop_052
	.word shop_053
	.word shop_054
	.word shop_055
	.word shop_056
	.word shop_057
	.word shop_058
	.word shop_059
	.word shop_060
	.word shop_061
	.word shop_062
	.word shop_063
	.word shop_064
	.word shop_065
	.word shop_066
	.word shop_067
	.word shop_068
	.word shop_069
	.word shop_070
	.word shop_071
	.word shop_072
	.word shop_073
	.word shop_074
	.word shop_075
	.word shop_076
	.word shop_077
	.word shop_078
	.word shop_079
	.word shop_080
	.word shop_081
	.word shop_082
	.word shop_083
	.word shop_084
	.word shop_085
	.word shop_086
	.word shop_087
	.word shop_088
	.word shop_089
	.word shop_090
	.word shop_091
	.word shop_092
	.word shop_093
	.word shop_094
	.word shop_095
	.word shop_096
	.word shop_097
	.word shop_098
	.word shop_099
	.word shop_100
	.word shop_101
	.word shop_102
	.word shop_103
	.word shop_104
	.word shop_105
	.word shop_106
	.word shop_107
	.word shop_108
	.word shop_109
	.word shop_110
	.word shop_111
	.word shop_112
	.word shop_113
	.word shop_114
	.word shop_115
	.word shop_116
	.word shop_117
	.word shop_118
	.word shop_119
	.word shop_120
	.word shop_121
	.word shop_122
	.word shop_123
	.word shop_124
	.word shop_125
	.word shop_126
	.word shop_127
	.word shop_128
	.word shop_129
	.word shop_130
	.word shop_131
	.word shop_132
	.word shop_133
	.word shop_134
	.word shop_135
	.word shop_136
	.word shop_137
	.word shop_138
	.word shop_139
	.word shop_140
	.word shop_141
	.word shop_142
	.word shop_143
	.word shop_144
	.word shop_145
	.word shop_146
	.word shop_147
	.word shop_148
	.word shop_149
	.word shop_150
	.word shop_151
	.word shop_152
	.word shop_153
	.word shop_154
	.word shop_155
	.word shop_156
	.word shop_157
	.word shop_158
	.word shop_159
	.word shop_160
	.word shop_161
	.word shop_162
	.word shop_163
	.word shop_164
	.word shop_165
	.word shop_166
	.word shop_167
	.word shop_168
	.word shop_169
	.word shop_170
	.word shop_171
	.word shop_172
	.word shop_173
	.word shop_174
	.word shop_175
	.word shop_176
	.word shop_177
	.word shop_178
	.word shop_179

; Shop data

shop_000:
	.byte $28, $10, $02, $a0
	.byte $ff			; End of shop

shop_001:
	.byte $10, $02, $a0
	.byte $ff			; End of shop

shop_002:
	.byte $0c, $48, $a2, $1f, $a9
	.byte $ff			; End of shop

shop_003:
	.byte $48, $a2, $1f, $a9
	.byte $ff			; End of shop

shop_004:
	.byte $a2, $1f, $a9
	.byte $ff			; End of shop

shop_005:
	.byte $30, $12, $19, $30, $17, $26, $30, $24, $13, $30, $26, $04
	.byte $ff			; End of shop

shop_006:
	.byte $12, $19, $30, $17, $26, $30, $24, $13, $30, $26, $04
	.byte $ff			; End of shop

shop_007:
	.byte $19, $30, $17, $26, $30, $24, $13, $30, $26, $04
	.byte $ff			; End of shop

shop_008:
	.byte $30, $17, $26, $30, $24, $13, $30, $26, $04
	.byte $ff			; End of shop

shop_009:
	.byte $17, $26, $30, $24, $13, $30, $26, $04
	.byte $ff			; End of shop

shop_010:
	.byte $26, $30, $24, $13, $30, $26, $04
	.byte $ff			; End of shop

shop_011:
	.byte $30, $24, $13, $30, $26, $04
	.byte $ff			; End of shop

shop_012:
	.byte $24, $13, $30, $26, $04
	.byte $ff			; End of shop

shop_013:
	.byte $13, $30, $26, $04
	.byte $ff			; End of shop

shop_014:
	.byte $30, $26, $04
	.byte $ff			; End of shop

shop_015:
	.byte $09, $04, $08
	.byte $ff			; End of shop

shop_016:
	.byte $08, $26, $19, $76, $19
	.byte $ff			; End of shop

shop_017:
	.byte $26, $19, $76, $19
	.byte $ff			; End of shop

shop_018:
	.byte $19, $76, $19
	.byte $ff			; End of shop

shop_019:
	.byte $01, $01, $03, $01, $01, $01, $03, $01
	.byte $ff			; End of shop

shop_020:
	.byte $01, $03, $01, $01, $01, $03, $01
	.byte $ff			; End of shop

shop_021:
	.byte $03, $01, $01, $01, $03, $01
	.byte $ff			; End of shop

shop_022:
	.byte $01, $01, $01, $03, $01
	.byte $ff			; End of shop

shop_023:
	.byte $01, $01, $03, $01
	.byte $ff			; End of shop

shop_024:
	.byte $01, $03, $01
	.byte $ff			; End of shop

shop_025:
	.byte $04, $01, $03, $02
	.byte $ff			; End of shop

shop_026:
	.byte $01, $03, $02
	.byte $ff			; End of shop

shop_027:
	.byte $12, $01, $01, $02
	.byte $ff			; End of shop

shop_028:
	.byte $01, $01, $02
	.byte $ff			; End of shop

shop_029:
	.byte $0e, $01, $01
	.byte $ff			; End of shop

shop_030:
	.byte $02, $01, $01
	.byte $ff			; End of shop

shop_031:
	.byte $06, $07, $03
	.byte $ff			; End of shop

shop_032:
	.byte $01, $01, $06, $01, $01, $03, $01, $09, $01, $01, $07, $01
	.byte $ff			; End of shop

shop_033:
	.byte $01, $06, $01, $01, $03, $01, $09, $01, $01, $07, $01
	.byte $ff			; End of shop

shop_034:
	.byte $06, $01, $01, $03, $01, $09, $01, $01, $07, $01
	.byte $ff			; End of shop

shop_035:
	.byte $01, $01, $03, $01, $09, $01, $01, $07, $01
	.byte $ff			; End of shop

shop_036:
	.byte $01, $03, $01, $09, $01, $01, $07, $01
	.byte $ff			; End of shop

shop_037:
	.byte $03, $01, $09, $01, $01, $07, $01
	.byte $ff			; End of shop

shop_038:
	.byte $01, $09, $01, $01, $07, $01
	.byte $ff			; End of shop

shop_039:
	.byte $09, $01, $01, $07, $01
	.byte $ff			; End of shop

shop_040:
	.byte $01, $01, $07, $01
	.byte $ff			; End of shop

shop_041:
	.byte $01, $07, $01
	.byte $ff			; End of shop

shop_042:
	.byte $1c, $a8, $60, $a0, $1c, $60, $2a, $36, $37, $0d, $35, $34
	.byte $ff			; End of shop

shop_043:
	.byte $a8, $60, $a0, $1c, $60, $2a, $36, $37, $0d, $35, $34
	.byte $ff			; End of shop

shop_044:
	.byte $60, $a0, $1c, $60, $2a, $36, $37, $0d, $35, $34
	.byte $ff			; End of shop

shop_045:
	.byte $a0, $1c, $60, $2a, $36, $37, $0d, $35, $34
	.byte $ff			; End of shop

shop_046:
	.byte $1c, $60, $2a, $36, $37, $0d, $35, $34
	.byte $ff			; End of shop

shop_047:
	.byte $60, $2a, $36, $37, $0d, $35, $34
	.byte $ff			; End of shop

shop_048:
	.byte $2a, $36, $37, $0d, $35, $34
	.byte $ff			; End of shop

shop_049:
	.byte $36, $37, $0d, $35, $34
	.byte $ff			; End of shop

shop_050:
	.byte $37, $0d, $35, $34
	.byte $ff			; End of shop

shop_051:
	.byte $0d, $35, $34
	.byte $ff			; End of shop

shop_052:
	.byte $0a, $13, $14
	.byte $ff			; End of shop

shop_053:
	.byte $0b, $09, $82
	.byte $ff			; End of shop

shop_054:
	.byte $0a, $a0, $01, $2d
	.byte $ff			; End of shop

shop_055:
	.byte $a0, $01, $2d
	.byte $ff			; End of shop

shop_056:
	.byte $18, $80, $80
	.byte $ff			; End of shop

shop_057:
	.byte $25, $a0, $03, $3b, $80
	.byte $ff			; End of shop

shop_058:
	.byte $a0, $03, $3b, $80
	.byte $ff			; End of shop

shop_059:
	.byte $03, $3b, $80
	.byte $ff			; End of shop

shop_060:
	.byte $29, $80, $80
	.byte $ff			; End of shop

shop_061:
	.byte $02, $80, $80
	.byte $ff			; End of shop

shop_062:
	.byte $03, $23, $19, $03, $24, $19, $03, $23, $1c, $03, $24, $1c
	.byte $ff			; End of shop

shop_063:
	.byte $23, $19, $03, $24, $19, $03, $23, $1c, $03, $24, $1c
	.byte $ff			; End of shop

shop_064:
	.byte $19, $03, $24, $19, $03, $23, $1c, $03, $24, $1c
	.byte $ff			; End of shop

shop_065:
	.byte $03, $24, $19, $03, $23, $1c, $03, $24, $1c
	.byte $ff			; End of shop

shop_066:
	.byte $24, $19, $03, $23, $1c, $03, $24, $1c
	.byte $ff			; End of shop

shop_067:
	.byte $19, $03, $23, $1c, $03, $24, $1c
	.byte $ff			; End of shop

shop_068:
	.byte $03, $23, $1c, $03, $24, $1c
	.byte $ff			; End of shop

shop_069:
	.byte $23, $1c, $03, $24, $1c
	.byte $ff			; End of shop

shop_070:
	.byte $1c, $03, $24, $1c
	.byte $ff			; End of shop

shop_071:
	.byte $03, $24, $1c
	.byte $ff			; End of shop

shop_072:
	.byte $1c, $1b, $1c
	.byte $ff			; End of shop

shop_073:
	.byte $2d, $4a, $2d
	.byte $ff			; End of shop

shop_074:
	.byte $4e, $37, $45, $4e, $06, $04, $05, $06, $0f, $16, $10
	.byte $ff			; End of shop

shop_075:
	.byte $37, $45, $4e, $06, $04, $05, $06, $0f, $16, $10
	.byte $ff			; End of shop

shop_076:
	.byte $45, $4e, $06, $04, $05, $06, $0f, $16, $10
	.byte $ff			; End of shop

shop_077:
	.byte $4e, $06, $04, $05, $06, $0f, $16, $10
	.byte $ff			; End of shop

shop_078:
	.byte $06, $04, $05, $06, $0f, $16, $10
	.byte $ff			; End of shop

shop_079:
	.byte $04, $05, $06, $0f, $16, $10
	.byte $ff			; End of shop

shop_080:
	.byte $05, $06, $0f, $16, $10
	.byte $ff			; End of shop

shop_081:
	.byte $06, $0f, $16, $10
	.byte $ff			; End of shop

shop_082:
	.byte $0f, $16, $10
	.byte $ff			; End of shop

shop_083:
	.byte $4e, $47, $4f
	.byte $ff			; End of shop

shop_084:
	.byte $3c, $2b, $51, $3c, $05, $05, $05, $05, $5a, $55, $5f
	.byte $ff			; End of shop

shop_085:
	.byte $2b, $51, $3c, $05, $05, $05, $05, $5a, $55, $5f
	.byte $ff			; End of shop

shop_086:
	.byte $51, $3c, $05, $05, $05, $05, $5a, $55, $5f
	.byte $ff			; End of shop

shop_087:
	.byte $3c, $05, $05, $05, $05, $5a, $55, $5f
	.byte $ff			; End of shop

shop_088:
	.byte $05, $05, $05, $05, $5a, $55, $5f
	.byte $ff			; End of shop

shop_089:
	.byte $05, $05, $05, $5a, $55, $5f
	.byte $ff			; End of shop

shop_090:
	.byte $05, $05, $5a, $55, $5f
	.byte $ff			; End of shop

shop_091:
	.byte $05, $5a, $55, $5f
	.byte $ff			; End of shop

shop_092:
	.byte $5a, $55, $5f
	.byte $ff			; End of shop

shop_093:
	.byte $49, $5a, $50
	.byte $ff			; End of shop

shop_094:
	.byte $66, $58, $58, $52, $01, $09, $09, $07, $5d, $64, $68
	.byte $ff			; End of shop

shop_095:
	.byte $58, $58, $52, $01, $09, $09, $07, $5d, $64, $68
	.byte $ff			; End of shop

shop_096:
	.byte $58, $52, $01, $09, $09, $07, $5d, $64, $68
	.byte $ff			; End of shop

shop_097:
	.byte $52, $01, $09, $09, $07, $5d, $64, $68
	.byte $ff			; End of shop

shop_098:
	.byte $01, $09, $09, $07, $5d, $64, $68
	.byte $ff			; End of shop

shop_099:
	.byte $09, $09, $07, $5d, $64, $68
	.byte $ff			; End of shop

shop_100:
	.byte $09, $07, $5d, $64, $68
	.byte $ff			; End of shop

shop_101:
	.byte $07, $5d, $64, $68
	.byte $ff			; End of shop

shop_102:
	.byte $5d, $64, $68
	.byte $ff			; End of shop

shop_103:
	.byte $6e, $71, $86
	.byte $ff			; End of shop

shop_104:
	.byte $55, $78, $55
	.byte $ff			; End of shop

shop_105:
	.byte $7c, $6a, $7c
	.byte $ff			; End of shop

shop_106:
	.byte $7c, $70, $63, $63, $08, $05, $05, $05, $5d, $5f, $68
	.byte $ff			; End of shop

shop_107:
	.byte $70, $63, $63, $08, $05, $05, $05, $5d, $5f, $68
	.byte $ff			; End of shop

shop_108:
	.byte $63, $63, $08, $05, $05, $05, $5d, $5f, $68
	.byte $ff			; End of shop

shop_109:
	.byte $63, $08, $05, $05, $05, $5d, $5f, $68
	.byte $ff			; End of shop

shop_110:
	.byte $20, $1b, $c0, $28, $84, $06, $46, $68
	.byte $ff			; End of shop

shop_111:
	.byte $1b, $c0, $28, $84, $06, $46, $68
	.byte $ff			; End of shop

shop_112:
	.byte $c0, $28, $84, $06, $46, $68
	.byte $ff			; End of shop

shop_113:
	.byte $28, $84, $06, $46, $68
	.byte $ff			; End of shop

shop_114:
	.byte $84, $06, $46, $68
	.byte $ff			; End of shop

shop_115:
	.byte $06, $46, $68
	.byte $ff			; End of shop

shop_116:
	.byte $64, $31, $b2, $11
	.byte $ff			; End of shop

shop_117:
	.byte $31, $b2, $11
	.byte $ff			; End of shop

shop_118:
	.byte $3e, $87, $6b
	.byte $ff			; End of shop

shop_119:
	.byte $33, $42, $74, $9b, $5f, $b6, $6f, $68, $36, $8b, $6e, $b6
	.byte $ff			; End of shop

shop_120:
	.byte $42, $74, $9b, $5f, $b6, $6f, $68, $36, $8b, $6e, $b6
	.byte $ff			; End of shop

shop_121:
	.byte $74, $9b, $5f, $b6, $6f, $68, $36, $8b, $6e, $b6
	.byte $ff			; End of shop

shop_122:
	.byte $9b, $5f, $b6, $6f, $68, $36, $8b, $6e, $b6
	.byte $ff			; End of shop

shop_123:
	.byte $5f, $b6, $6f, $68, $36, $8b, $6e, $b6
	.byte $ff			; End of shop

shop_124:
	.byte $b6, $6f, $68, $36, $8b, $6e, $b6
	.byte $ff			; End of shop

shop_125:
	.byte $6f, $68, $36, $8b, $6e, $b6
	.byte $ff			; End of shop

shop_126:
	.byte $68, $36, $8b, $6e, $b6
	.byte $ff			; End of shop

shop_127:
	.byte $36, $8b, $6e, $b6
	.byte $ff			; End of shop

shop_128:
	.byte $8b, $6e, $b6
	.byte $ff			; End of shop

shop_129:
	.byte $77, $18, $71
	.byte $ff			; End of shop

shop_130:
	.byte $59, $2f, $bf, $aa, $7c, $04, $54
	.byte $ff			; End of shop

shop_131:
	.byte $2f, $bf, $aa, $7c, $04, $54
	.byte $ff			; End of shop

shop_132:
	.byte $bf, $aa, $7c, $04, $54
	.byte $ff			; End of shop

shop_133:
	.byte $aa, $7c, $04, $54
	.byte $ff			; End of shop

shop_134:
	.byte $7c, $04, $54
	.byte $ff			; End of shop

shop_135:
	.byte $3a, $48, $09, $16, $bf, $12, $b1, $33, $1f, $71
	.byte $ff			; End of shop

shop_136:
	.byte $48, $09, $16, $bf, $12, $b1, $33, $1f, $71
	.byte $ff			; End of shop

shop_137:
	.byte $09, $16, $bf, $12, $b1, $33, $1f, $71
	.byte $ff			; End of shop

shop_138:
	.byte $16, $bf, $12, $b1, $33, $1f, $71
	.byte $ff			; End of shop

shop_139:
	.byte $bf, $12, $b1, $33, $1f, $71
	.byte $ff			; End of shop

shop_140:
	.byte $12, $b1, $33, $1f, $71
	.byte $ff			; End of shop

shop_141:
	.byte $b1, $33, $1f, $71
	.byte $ff			; End of shop

shop_142:
	.byte $33, $1f, $71
	.byte $ff			; End of shop

shop_143:
	.byte $17, $5f, $77, $90
	.byte $ff			; End of shop

shop_144:
	.byte $5f, $77, $90
	.byte $ff			; End of shop

shop_145:
	.byte $10, $16, $88, $80, $85, $a4, $21, $8f, $a8, $02, $78, $6a
	.byte $ff			; End of shop

shop_146:
	.byte $16, $88, $80, $85, $a4, $21, $8f, $a8, $02, $78, $6a
	.byte $ff			; End of shop

shop_147:
	.byte $88, $80, $85, $a4, $21, $8f, $a8, $02, $78, $6a
	.byte $ff			; End of shop

shop_148:
	.byte $80, $85, $a4, $21, $8f, $a8, $02, $78, $6a
	.byte $ff			; End of shop

shop_149:
	.byte $85, $a4, $21, $8f, $a8, $02, $78, $6a
	.byte $ff			; End of shop

shop_150:
	.byte $a4, $21, $8f, $a8, $02, $78, $6a
	.byte $ff			; End of shop

shop_151:
	.byte $21, $8f, $a8, $02, $78, $6a
	.byte $ff			; End of shop

shop_152:
	.byte $8f, $a8, $02, $78, $6a
	.byte $ff			; End of shop

shop_153:
	.byte $a8, $02, $78, $6a
	.byte $ff			; End of shop

shop_154:
	.byte $02, $78, $6a
	.byte $ff			; End of shop

shop_155:
	.byte $56, $0e, $4a, $10, $03, $92, $34
	.byte $ff			; End of shop

shop_156:
	.byte $0e, $4a, $10, $03, $92, $34
	.byte $ff			; End of shop

shop_157:
	.byte $4a, $10, $03, $92, $34
	.byte $ff			; End of shop

shop_158:
	.byte $10, $03, $92, $34
	.byte $ff			; End of shop

shop_159:
	.byte $03, $92, $34
	.byte $ff			; End of shop

shop_160:
	.byte $80, $01, $21, $77
	.byte $ff			; End of shop

shop_161:
	.byte $01, $21, $77
	.byte $ff			; End of shop

shop_162:
	.byte $3b, $06, $9e, $7c, $7f
	.byte $ff			; End of shop

shop_163:
	.byte $06, $9e, $7c, $7f
	.byte $ff			; End of shop

shop_164:
	.byte $9e, $7c, $7f
	.byte $ff			; End of shop

shop_165:
	.byte $7b, $59, $62, $c5, $81, $62
	.byte $ff			; End of shop

shop_166:
	.byte $59, $62, $c5, $81, $62
	.byte $ff			; End of shop

shop_167:
	.byte $62, $c5, $81, $62
	.byte $ff			; End of shop

shop_168:
	.byte $c5, $81, $62
	.byte $ff			; End of shop

shop_169:
	.byte $84, $85, $39
	.byte $ff			; End of shop

shop_170:
	.byte $70, $65, $8e
	.byte $ff			; End of shop

shop_171:
	.byte $49, $a4, $54, $ac, $9e, $a9, $9f, $49, $9f, $5e
	.byte $ff			; End of shop

shop_172:
	.byte $a4, $54, $ac, $9e, $a9, $9f, $49, $9f, $5e
	.byte $ff			; End of shop

shop_173:
	.byte $54, $ac, $9e, $a9, $9f, $49, $9f, $5e
	.byte $ff			; End of shop

shop_174:
	.byte $ac, $9e, $a9, $9f, $49, $9f, $5e
	.byte $ff			; End of shop

shop_175:
	.byte $9e, $a9, $9f, $49, $9f, $5e
	.byte $ff			; End of shop

shop_176:
	.byte $a9, $9f, $49, $9f, $5e
	.byte $ff			; End of shop

shop_177:
	.byte $9f, $49, $9f, $5e
	.byte $ff			; End of shop

shop_178:
	.byte $49, $9f, $5e
	.byte $ff			; End of shop

shop_179:
	.byte $68, $7c, $7f
	.byte $ff			; End of shop

; ============================================================================
; End of shop data
; ============================================================================