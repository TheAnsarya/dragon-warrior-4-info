; Dragon Warrior IV - Bank 27 Disassembly
; ROM Offset: $6C010 - $7000F
; CPU Address: $8000-$BFFF (when mapped)
; ======================================================================

	JSR $E080			   ; $8000: 20 80 E0
	.byte $80			; $8003
	TSX					 ; $8004: BA
	.byte $80			; $8005
	.byte $12			; $8006
	.byte $87			; $8007
	LDY $8F88			   ; $8008: AC 88 8F
	.byte $9E			; $800B
	AND $91,X			   ; $800C: 35 91
	.byte $97			; $800E
	.byte $9E			; $800F
	BRK					 ; $8010: 00
	BRK					 ; $8011: 00
	INC $8AA0,X			 ; $8012: FE A0 8A
	.byte $B7			; $8015
	.byte $EF			; $8016
	LDY $1C				 ; $8017: A4 1C
	.byte $A7			; $8019
	BIT $F9A7			   ; $801A: 2C A7 F9
	TAX					 ; $801D: AA
	.byte $F7			; $801E
	.byte $AF			; $801F
	LDY #$01				; $8020: A0 01
	JSR $8097			   ; $8022: 20 97 80
	BCS $802E			   ; $8025: B0 07
	LDY #$00				; $8027: A0 00
	JSR $8097			   ; $8029: 20 97 80
	BCS $8030			   ; $802C: B0 02
	CLC					 ; $802E: 18
	RTS					 ; $802F: 60
	LDA $05A2,X			 ; $8030: BD A2 05
	STA $63				 ; $8033: 85 63
	LDY #$00				; $8035: A0 00
	LDA $63				 ; $8037: A5 63
	CMP #$43				; $8039: C9 43
	BNE $8055			   ; $803B: D0 18
	LDA $64				 ; $803D: A5 64
	CMP $8091,Y			 ; $803F: D9 91 80
	BNE $8055			   ; $8042: D0 11
	LDA $05A3,X			 ; $8044: BD A3 05
	CMP $8092,Y			 ; $8047: D9 92 80
	BNE $8055			   ; $804A: D0 09
	LDA $8093,Y			 ; $804C: B9 93 80
	STA $0515			   ; $804F: 8D 15 05
	JMP $805C			   ; $8052: 4C 5C 80
	INY					 ; $8055: C8
	INY					 ; $8056: C8
	INY					 ; $8057: C8
	CPY #$06				; $8058: C0 06
	BCC $8037			   ; $805A: 90 DB
	LDA $05A3,X			 ; $805C: BD A3 05
	STA $64				 ; $805F: 85 64
	LDA $05A4,X			 ; $8061: BD A4 05
	STA $44				 ; $8064: 85 44
	LDA $05A5,X			 ; $8066: BD A5 05
	STA $45				 ; $8069: 85 45
	LDA $05A6,X			 ; $806B: BD A6 05
	PHA					 ; $806E: 48
	AND #$40				; $806F: 29 40
	BNE $8079			   ; $8071: D0 06
	BRK					 ; $8073: 00
	.byte $82			; $8074
	.byte $FB			; $8075
	JMP $8082			   ; $8076: 4C 82 80
	LDA $63				 ; $8079: A5 63
	CMP #$38				; $807B: C9 38
	BNE $8082			   ; $807D: D0 03
	BRK					 ; $807F: 00
	.byte $93			; $8080
	.byte $FB			; $8081
	JSR $C5C5			   ; $8082: 20 C5 C5
	PLA					 ; $8085: 68
	BRK					 ; $8086: 00
	ASL $00EF,X			 ; $8087: 1E EF 00
	ORA ($87,X)			 ; $808A: 01 87
	BRK					 ; $808C: 00
	ORA #$9F				; $808D: 09 9F
	SEC					 ; $808F: 38
	RTS					 ; $8090: 60
	.byte $07			; $8091
	ASL tmp0				; $8092: 06 00
	ASL $07				 ; $8094: 06 07
	BRK					 ; $8096: 00
	LDX #$00				; $8097: A2 00
	LDA $05A0,X			 ; $8099: BD A0 05
	CMP #$FF				; $809C: C9 FF
	BEQ $80B8			   ; $809E: F0 18
	CMP $6F60,Y			 ; $80A0: D9 60 6F
	BNE $80AF			   ; $80A3: D0 0A
	LDA $05A1,X			 ; $80A5: BD A1 05
	CMP $6F80,Y			 ; $80A8: D9 80 6F
	BNE $80AF			   ; $80AB: D0 02
	SEC					 ; $80AD: 38
	RTS					 ; $80AE: 60
	TXA					 ; $80AF: 8A
	CLC					 ; $80B0: 18
	ADC #$07				; $80B1: 69 07
	TAX					 ; $80B3: AA
	CPX #$5B				; $80B4: E0 5B
	BCC $8099			   ; $80B6: 90 E1
	CLC					 ; $80B8: 18
	RTS					 ; $80B9: 60
	LDA $63				 ; $80BA: A5 63
	CMP #$43				; $80BC: C9 43
	BNE $80CC			   ; $80BE: D0 0C
	LDA $64				 ; $80C0: A5 64
	CMP #$07				; $80C2: C9 07
	BCC $80CC			   ; $80C4: 90 06
	CMP #$0A				; $80C6: C9 0A
	BCS $80CC			   ; $80C8: B0 02
	SEC					 ; $80CA: 38
	RTS					 ; $80CB: 60
	LDA $63				 ; $80CC: A5 63
	CMP #$11				; $80CE: C9 11
	BNE $80DE			   ; $80D0: D0 0C
	LDA $64				 ; $80D2: A5 64
	CMP #$00				; $80D4: C9 00
	BNE $80DE			   ; $80D6: D0 06
	LDA $44				 ; $80D8: A5 44
	CMP #$10				; $80DA: C9 10
	BEQ $80CA			   ; $80DC: F0 EC
	CLC					 ; $80DE: 18
	RTS					 ; $80DF: 60
	JSR $810D			   ; $80E0: 20 0D 81
	LDA $63				 ; $80E3: A5 63
	CMP #$2C				; $80E5: C9 2C
	BEQ $8101			   ; $80E7: F0 18
	CMP #$48				; $80E9: C9 48
	BNE $810C			   ; $80EB: D0 1F
	LDA $64				 ; $80ED: A5 64
	CMP #$00				; $80EF: C9 00
	BNE $810C			   ; $80F1: D0 19
	BRK					 ; $80F3: 00
	ASL					 ; $80F4: 0A
	.byte $EB			; $80F5
	.byte $04			; $80F6
	BEQ $810C			   ; $80F7: F0 13
	LDA #$1B				; $80F9: A9 1B
	STA $05A5			   ; $80FB: 8D A5 05
	JMP $810C			   ; $80FE: 4C 0C 81
	BRK					 ; $8101: 00
	ASL					 ; $8102: 0A
	.byte $EB			; $8103
	.byte $04			; $8104
	BEQ $810C			   ; $8105: F0 05
	LDA #$1B				; $8107: A9 1B
	STA $05A1			   ; $8109: 8D A1 05
	RTS					 ; $810C: 60
	LDA $822D			   ; $810D: AD 2D 82
	STA $51				 ; $8110: 85 51
	LDA $822E			   ; $8112: AD 2E 82
	STA $52				 ; $8115: 85 52
	LDX #$00				; $8117: A2 00
	LDY #$00				; $8119: A0 00
	JSR $8207			   ; $811B: 20 07 82
	BCS $8135			   ; $811E: B0 15
	LDY #$05				; $8120: A0 05
	JSR $8207			   ; $8122: 20 07 82
	BCS $8142			   ; $8125: B0 1B
	LDA $51				 ; $8127: A5 51
	CLC					 ; $8129: 18
	ADC #$0A				; $812A: 69 0A
	STA $51				 ; $812C: 85 51
	BCC $8119			   ; $812E: 90 E9
	INC $52				 ; $8130: E6 52
	JMP $8119			   ; $8132: 4C 19 81
	LDY #$02				; $8135: A0 02
	JSR $814F			   ; $8137: 20 4F 81
	LDY #$05				; $813A: A0 05
	JSR $815D			   ; $813C: 20 5D 81
	JMP $8120			   ; $813F: 4C 20 81
	LDY #$07				; $8142: A0 07
	JSR $814F			   ; $8144: 20 4F 81
	LDY #$00				; $8147: A0 00
	JSR $815D			   ; $8149: 20 5D 81
	JMP $8127			   ; $814C: 4C 27 81
	LDA ($51),Y			 ; $814F: B1 51
	STA $05A0,X			 ; $8151: 9D A0 05
	INY					 ; $8154: C8
	INX					 ; $8155: E8
	LDA ($51),Y			 ; $8156: B1 51
	STA $05A0,X			 ; $8158: 9D A0 05
	INX					 ; $815B: E8
	RTS					 ; $815C: 60
	LDA ($51),Y			 ; $815D: B1 51
	STA $05A0,X			 ; $815F: 9D A0 05
	INY					 ; $8162: C8
	INX					 ; $8163: E8
	CMP #$45				; $8164: C9 45
	BNE $8170			   ; $8166: D0 08
	LDA ($51),Y			 ; $8168: B1 51
	JSR $81CB			   ; $816A: 20 CB 81
	JMP $8188			   ; $816D: 4C 88 81
	CMP #$38				; $8170: C9 38
	BNE $817A			   ; $8172: D0 06
	JSR $81ED			   ; $8174: 20 ED 81
	JMP $8188			   ; $8177: 4C 88 81
	CMP #$43				; $817A: C9 43
	BNE $8186			   ; $817C: D0 08
	LDA ($51),Y			 ; $817E: B1 51
	JSR $81FA			   ; $8180: 20 FA 81
	JMP $8188			   ; $8183: 4C 88 81
	LDA ($51),Y			 ; $8186: B1 51
	STA $05A0,X			 ; $8188: 9D A0 05
	INY					 ; $818B: C8
	INX					 ; $818C: E8
	LDA ($51),Y			 ; $818D: B1 51
	STA $05A0,X			 ; $818F: 9D A0 05
	INY					 ; $8192: C8
	INX					 ; $8193: E8
	LDA ($51),Y			 ; $8194: B1 51
	STA $05A0,X			 ; $8196: 9D A0 05
	INY					 ; $8199: C8
	INX					 ; $819A: E8
	LDA ($51),Y			 ; $819B: B1 51
	PHA					 ; $819D: 48
	AND #$04				; $819E: 29 04
	BEQ $81BC			   ; $81A0: F0 1A
	PLA					 ; $81A2: 68
	PHA					 ; $81A3: 48
	AND #$03				; $81A4: 29 03
	ASL					 ; $81A6: 0A
	TAY					 ; $81A7: A8
	LDA $059E,X			 ; $81A8: BD 9E 05
	CLC					 ; $81AB: 18
	ADC $D239,Y			 ; $81AC: 79 39 D2
	STA $059E,X			 ; $81AF: 9D 9E 05
	LDA $059F,X			 ; $81B2: BD 9F 05
	CLC					 ; $81B5: 18
	ADC $D23A,Y			 ; $81B6: 79 3A D2
	STA $059F,X			 ; $81B9: 9D 9F 05
	PLA					 ; $81BC: 68
	AND #$C3				; $81BD: 29 C3
	STA $05A0,X			 ; $81BF: 9D A0 05
	INX					 ; $81C2: E8
	CPX #$5C				; $81C3: E0 5C
	BCS $81C8			   ; $81C5: B0 01
	RTS					 ; $81C7: 60
	JMP $81C8			   ; $81C8: 4C C8 81
	CMP #$05				; $81CB: C9 05
	BNE $81DC			   ; $81CD: D0 0D
	LDA $62AA			   ; $81CF: AD AA 62
	AND #$02				; $81D2: 29 02
	BEQ $81D9			   ; $81D4: F0 03
	LDA #$07				; $81D6: A9 07
	RTS					 ; $81D8: 60
	LDA #$05				; $81D9: A9 05
	RTS					 ; $81DB: 60
	CMP #$04				; $81DC: C9 04
	BNE $81EC			   ; $81DE: D0 0C
	LDA $62AA			   ; $81E0: AD AA 62
	AND #$10				; $81E3: 29 10
	BEQ $81EA			   ; $81E5: F0 03
	LDA #$06				; $81E7: A9 06
	RTS					 ; $81E9: 60
	LDA #$04				; $81EA: A9 04
	RTS					 ; $81EC: 60
	LDA $62AA			   ; $81ED: AD AA 62
	ASL					 ; $81F0: 0A
	ASL					 ; $81F1: 0A
	ASL					 ; $81F2: 0A
	LDA #$03				; $81F3: A9 03
	BCC $81F9			   ; $81F5: 90 02
	LDA #$04				; $81F7: A9 04
	RTS					 ; $81F9: 60
	CMP #$00				; $81FA: C9 00
	BNE $8206			   ; $81FC: D0 08
	BRK					 ; $81FE: 00
	CLC					 ; $81FF: 18
	.byte $EB			; $8200
	BPL $81F3			   ; $8201: 10 F0
	.byte $02			; $8203
	LDA #$0A				; $8204: A9 0A
	RTS					 ; $8206: 60
	LDA ($51),Y			 ; $8207: B1 51
	CMP #$FF				; $8209: C9 FF
	BEQ $8227			   ; $820B: F0 1A
	CMP $63				 ; $820D: C5 63
	BNE $8225			   ; $820F: D0 14
	INY					 ; $8211: C8
	CMP #$45				; $8212: C9 45
	BNE $821E			   ; $8214: D0 08
	LDA ($51),Y			 ; $8216: B1 51
	JSR $81CB			   ; $8218: 20 CB 81
	JMP $8220			   ; $821B: 4C 20 82
	LDA ($51),Y			 ; $821E: B1 51
	CMP $64				 ; $8220: C5 64
	BNE $8225			   ; $8222: D0 01
	RTS					 ; $8224: 60
	CLC					 ; $8225: 18
	RTS					 ; $8226: 60
	STA $05A0,X			 ; $8227: 9D A0 05
	PLA					 ; $822A: 68
	PLA					 ; $822B: 68
	RTS					 ; $822C: 60
	.byte $2F			; $822D
	.byte $82			; $822E
	.byte $04			; $822F
	BRK					 ; $8230: 00
	ORA ($09),Y			 ; $8231: 11 09
	.byte $82			; $8233
	.byte $04			; $8234
	.byte $02			; $8235
	.byte $03			; $8236
	.byte $23			; $8237
	STY ptr0_lo			 ; $8238: 84 04
	BRK					 ; $823A: 00
	ORA ($09),Y			 ; $823B: 11 09
	.byte $82			; $823D
	.byte $04			; $823E
	.byte $02			; $823F
	.byte $04			; $8240
	.byte $23			; $8241
	STY ptr0_lo			 ; $8242: 84 04
	BRK					 ; $8244: 00
	.byte $17			; $8245
	ORA #$82				; $8246: 09 82
	.byte $04			; $8248
	.byte $02			; $8249
	ORA $8423			   ; $824A: 0D 23 84
	.byte $04			; $824D
	BRK					 ; $824E: 00
	.byte $17			; $824F
	ORA #$82				; $8250: 09 82
	.byte $04			; $8252
	.byte $02			; $8253
	.byte $0C			; $8254
	.byte $23			; $8255
	STY ptr0_lo			 ; $8256: 84 04
	BRK					 ; $8258: 00
	.byte $17			; $8259
	ORA #$82				; $825A: 09 82
	.byte $04			; $825C
	.byte $02			; $825D
	.byte $0B			; $825E
	.byte $23			; $825F
	STY ptr0_lo			 ; $8260: 84 04
	BRK					 ; $8262: 00
	CLC					 ; $8263: 18
	ORA #$82				; $8264: 09 82
	.byte $04			; $8266
	.byte $02			; $8267
	ASL $8423			   ; $8268: 0E 23 84
	.byte $04			; $826B
	BRK					 ; $826C: 00
	CLC					 ; $826D: 18
	ORA #$82				; $826E: 09 82
	.byte $04			; $8270
	.byte $02			; $8271
	.byte $0F			; $8272
	.byte $23			; $8273
	STY ptr0_lo			 ; $8274: 84 04
	BRK					 ; $8276: 00
	ASL $8209,X			 ; $8277: 1E 09 82
	.byte $04			; $827A
	.byte $02			; $827B
	ASL $23,X			   ; $827C: 16 23
	STY ptr0_lo			 ; $827E: 84 04
	BRK					 ; $8280: 00
	ASL $8209,X			 ; $8281: 1E 09 82
	.byte $04			; $8284
	.byte $02			; $8285
	.byte $17			; $8286
	.byte $23			; $8287
	STY ptr0_lo			 ; $8288: 84 04
	BRK					 ; $828A: 00
	ROL					 ; $828B: 2A
	.byte $0F			; $828C
	.byte $82			; $828D
	.byte $04			; $828E
	.byte $04			; $828F
	.byte $04			; $8290
	PHP					 ; $8291: 08
	STY ptr0_lo			 ; $8292: 84 04
	BRK					 ; $8294: 00
	.byte $27			; $8295
	ORA $0482,X			 ; $8296: 1D 82 04
	.byte $03			; $8299
	.byte $03			; $829A
	PHP					 ; $829B: 08
	STY tmp2				; $829C: 84 02
	BRK					 ; $829E: 00
	.byte $12			; $829F
	ASL					 ; $82A0: 0A
	.byte $82			; $82A1
	.byte $02			; $82A2
	ORA ($0F,X)			 ; $82A3: 01 0F
	BIT $84				 ; $82A5: 24 84
	.byte $02			; $82A7
	BRK					 ; $82A8: 00
	.byte $13			; $82A9
	ASL					 ; $82AA: 0A
	.byte $82			; $82AB
	.byte $02			; $82AC
	ORA (ptr_lo,X)		  ; $82AD: 01 10
	BIT $84				 ; $82AF: 24 84
	AND $1300,X			 ; $82B1: 3D 00 13
	AND #$82				; $82B4: 29 82
	AND $1001,X			 ; $82B6: 3D 01 10
	ASL					 ; $82B9: 0A
	STY $3D				 ; $82BA: 84 3D
	BRK					 ; $82BC: 00
	.byte $0B			; $82BD
	BIT $82				 ; $82BE: 24 82
	AND $0202,X			 ; $82C0: 3D 02 02
	PHP					 ; $82C3: 08
	STY $3D				 ; $82C4: 84 3D
	BRK					 ; $82C6: 00
	.byte $1A			; $82C7
	ROL $82				 ; $82C8: 26 82
	AND $0803,X			 ; $82CA: 3D 03 08
	ORA #$84				; $82CD: 09 84
	AND $1C00,X			 ; $82CF: 3D 00 1C
	.byte $1A			; $82D2
	.byte $82			; $82D3
	AND $0407,X			 ; $82D4: 3D 07 04
	ORA $3D84			   ; $82D7: 0D 84 3D
	BRK					 ; $82DA: 00
	.byte $0C			; $82DB
	.byte $13			; $82DC
	.byte $82			; $82DD
	AND $070A,X			 ; $82DE: 3D 0A 07
	ORA #$84				; $82E1: 09 84
	AND $1D00,X			 ; $82E3: 3D 00 1D
	ORA ($82),Y			 ; $82E6: 11 82
	AND $040B,X			 ; $82E8: 3D 0B 04
	ASL					 ; $82EB: 0A
	STY $3D				 ; $82EC: 84 3D
	BRK					 ; $82EE: 00
	.byte $0C			; $82EF
	ASL $3D82			   ; $82F0: 0E 82 3D
	.byte $0C			; $82F3
	ORA $08				 ; $82F4: 05 08
	STY $3D				 ; $82F6: 84 3D
	BRK					 ; $82F8: 00
	.byte $13			; $82F9
	.byte $0C			; $82FA
	.byte $82			; $82FB
	AND $040D,X			 ; $82FC: 3D 0D 04
	ORA #$84				; $82FF: 09 84
	AND $0C00,X			 ; $8301: 3D 00 0C
	.byte $07			; $8304
	.byte $82			; $8305
	AND $060F,X			 ; $8306: 3D 0F 06
	ORA ($84),Y			 ; $8309: 11 84
	LSR tmp0				; $830B: 46 00
	ORA $8213			   ; $830D: 0D 13 82
	LSR tmp2				; $8310: 46 02
	ASL					 ; $8312: 0A
	.byte $13			; $8313
	STY $46				 ; $8314: 84 46
	BRK					 ; $8316: 00
	.byte $0C			; $8317
	.byte $0C			; $8318
	.byte $82			; $8319
	LSR tmp3				; $831A: 46 03
	.byte $0C			; $831C
	ASL $4684,X			 ; $831D: 1E 84 46
	BRK					 ; $8320: 00
	.byte $13			; $8321
	PHP					 ; $8322: 08
	.byte $82			; $8323
	LSR tmp3				; $8324: 46 03
	ASL $1D,X			   ; $8326: 16 1D
	STY $46				 ; $8328: 84 46
	BRK					 ; $832A: 00
	.byte $14			; $832B
	PHP					 ; $832C: 08
	.byte $82			; $832D
	LSR tmp3				; $832E: 46 03
	.byte $17			; $8330
	ORA $4684,X			 ; $8331: 1D 84 46
	BRK					 ; $8334: 00
	.byte $1B			; $8335
	.byte $0C			; $8336
	.byte $82			; $8337
	LSR tmp3				; $8338: 46 03
	AND ($1E,X)			 ; $833A: 21 1E
	STY $46				 ; $833C: 84 46
	BRK					 ; $833E: 00
	ORA $8212,X			 ; $833F: 1D 12 82
	LSR tmp2				; $8342: 46 02
	.byte $1B			; $8344
	.byte $12			; $8345
	STY $46				 ; $8346: 84 46
	BRK					 ; $8348: 00
	.byte $1F			; $8349
	CLC					 ; $834A: 18
	.byte $82			; $834B
	LSR tmp1				; $834C: 46 01
	.byte $04			; $834E
	ASL $4684			   ; $834F: 0E 84 46
	.byte $03			; $8352
	ASL $15,X			   ; $8353: 16 15
	.byte $82			; $8355
	LSR tmp3				; $8356: 46 03
	.byte $04			; $8358
	.byte $07			; $8359
	STY $46				 ; $835A: 84 46
	.byte $03			; $835C
	.byte $17			; $835D
	ORA $82,X			   ; $835E: 15 82
	LSR tmp3				; $8360: 46 03
	ORA $07				 ; $8362: 05 07
	STY $2C				 ; $8364: 84 2C
	BRK					 ; $8366: 00
	.byte $0B			; $8367
	ORA #$82				; $8368: 09 82
	PHA					 ; $836A: 48
	BRK					 ; $836B: 00
	ASL					 ; $836C: 0A
	.byte $14			; $836D
	.byte $04			; $836E
	PHA					 ; $836F: 48
	BRK					 ; $8370: 00
	ASL					 ; $8371: 0A
	PHP					 ; $8372: 08
	.byte $82			; $8373
	PHA					 ; $8374: 48
	ORA ($12,X)			 ; $8375: 01 12
	.byte $1A			; $8377
	.byte $04			; $8378
	PHA					 ; $8379: 48
	ASL $1E				 ; $837A: 06 1E
	.byte $12			; $837C
	STY $48				 ; $837D: 84 48
	.byte $07			; $837F
	ASL $08,X			   ; $8380: 16 08
	.byte $82			; $8382
	PHA					 ; $8383: 48
	ASL ptr0_lo			 ; $8384: 06 04
	.byte $12			; $8386
	STY $48				 ; $8387: 84 48
	.byte $07			; $8389
	.byte $04			; $838A
	PHP					 ; $838B: 08
	.byte $82			; $838C
	AND $1204			   ; $838D: 2D 04 12
	BRK					 ; $8390: 00
	STX $2D				 ; $8391: 86 2D
	PHP					 ; $8393: 08
	ASL					 ; $8394: 0A
	CLC					 ; $8395: 18
	.byte $04			; $8396
	AND $2508			   ; $8397: 2D 08 25
	ASL $82,X			   ; $839A: 16 82
	AND $1207			   ; $839C: 2D 07 12
	ORA $2D84,Y			 ; $839F: 19 84 2D
	PHP					 ; $83A2: 08
	ROL $16				 ; $83A3: 26 16
	.byte $82			; $83A5
	AND $1307			   ; $83A6: 2D 07 13
	ORA $2D84,Y			 ; $83A9: 19 84 2D
	PHP					 ; $83AC: 08
	.byte $27			; $83AD
	ASL $82,X			   ; $83AE: 16 82
	AND $1407			   ; $83B0: 2D 07 14
	ORA $2D84,Y			 ; $83B3: 19 84 2D
	PHP					 ; $83B6: 08
	.byte $1F			; $83B7
	.byte $0B			; $83B8
	.byte $82			; $83B9
	AND $0206			   ; $83BA: 2D 06 02
	.byte $12			; $83BD
	STY $2D				 ; $83BE: 84 2D
	PHP					 ; $83C0: 08
	AND $820B			   ; $83C1: 2D 0B 82
	AND $1006			   ; $83C4: 2D 06 10
	ORA #$84				; $83C7: 09 84
	AND $1307			   ; $83C9: 2D 07 13
	ASL $2D82			   ; $83CC: 0E 82 2D
	ORA $0F				 ; $83CF: 05 0F
	.byte $0C			; $83D1
	STY $2D				 ; $83D2: 84 2D
	PHP					 ; $83D4: 08
	ORA $8210			   ; $83D5: 0D 10 82
	AND $0609			   ; $83D8: 2D 09 06
	.byte $0F			; $83DB
	STY $35				 ; $83DC: 84 35
	BRK					 ; $83DE: 00
	ORA ($14,X)			 ; $83DF: 01 14
	STA $35				 ; $83E1: 85 35
	ORA ($22,X)			 ; $83E3: 01 22
	.byte $04			; $83E5
	.byte $87			; $83E6
	AND tmp0,X			  ; $83E7: 35 00
	ORA ($15,X)			 ; $83E9: 01 15
	STA $35				 ; $83EB: 85 35
	ORA ($22,X)			 ; $83ED: 01 22
	ORA $87				 ; $83EF: 05 87
	AND tmp0,X			  ; $83F1: 35 00
	ORA #$14				; $83F3: 09 14
	STA $35				 ; $83F5: 85 35
	.byte $03			; $83F7
	BIT ptr0_lo			 ; $83F8: 24 04
	.byte $87			; $83FA
	AND tmp0,X			  ; $83FB: 35 00
	ORA #$15				; $83FD: 09 15
	STA $35				 ; $83FF: 85 35
	.byte $03			; $8401
	BIT ptr0_hi			 ; $8402: 24 05
	.byte $87			; $8404
	AND tmp0,X			  ; $8405: 35 00
	ORA ($14),Y			 ; $8407: 11 14
	STA $35				 ; $8409: 85 35
	.byte $02			; $840B
	BIT $8704			   ; $840C: 2C 04 87
	AND tmp0,X			  ; $840F: 35 00
	ORA ($15),Y			 ; $8411: 11 15
	STA $35				 ; $8413: 85 35
	.byte $02			; $8415
	BIT $8705			   ; $8416: 2C 05 87
	AND $08,X			   ; $8419: 35 08
	.byte $04			; $841B
	.byte $03			; $841C
	.byte $82			; $841D
	AND $07,X			   ; $841E: 35 07
	.byte $04			; $8420
	PLP					 ; $8421: 28
	STY $35				 ; $8422: 84 35
	PHP					 ; $8424: 08
	ORA tmp3				; $8425: 05 03
	.byte $82			; $8427
	AND $07,X			   ; $8428: 35 07
	ORA $28				 ; $842A: 05 28
	STY $40				 ; $842C: 84 40
	ORA ptr_lo			  ; $842E: 05 10
	ASL					 ; $8430: 0A
	.byte $82			; $8431
	RTI					 ; $8432: 40
	.byte $04			; $8433
	ORA $8418			   ; $8434: 0D 18 84
	BRK					 ; $8437: 00
	BRK					 ; $8438: 00
	.byte $0F			; $8439
	PHP					 ; $843A: 08
	STX tmp0				; $843B: 86 00
	.byte $02			; $843D
	ASL $841B			   ; $843E: 0E 1B 84
	BRK					 ; $8441: 00
	BRK					 ; $8442: 00
	BPL $844D			   ; $8443: 10 08
	STX tmp0				; $8445: 86 00
	.byte $02			; $8447
	.byte $0F			; $8448
	.byte $1B			; $8449
	STY tmp0				; $844A: 84 00
	BRK					 ; $844C: 00
	.byte $07			; $844D
	PHP					 ; $844E: 08
	.byte $82			; $844F
	BRK					 ; $8450: 00
	.byte $02			; $8451
	.byte $04			; $8452
	.byte $1B			; $8453
	STY tmp0				; $8454: 84 00
	BRK					 ; $8456: 00
	CLC					 ; $8457: 18
	PHP					 ; $8458: 08
	.byte $82			; $8459
	BRK					 ; $845A: 00
	.byte $02			; $845B
	ORA $841B,Y			 ; $845C: 19 1B 84
	BRK					 ; $845F: 00
	BRK					 ; $8460: 00
	.byte $0F			; $8461
	ASL $0082			   ; $8462: 0E 82 00
	ORA ($0E,X)			 ; $8465: 01 0E
	.byte $1B			; $8467
	STY tmp0				; $8468: 84 00
	BRK					 ; $846A: 00
	BPL $847B			   ; $846B: 10 0E
	.byte $82			; $846D
	BRK					 ; $846E: 00
	ORA ($0F,X)			 ; $846F: 01 0F
	.byte $1B			; $8471
	STY tmp0				; $8472: 84 00
	BRK					 ; $8474: 00
	ORA $12,X			   ; $8475: 15 12
	.byte $82			; $8477
	BRK					 ; $8478: 00
	ORA ($14,X)			 ; $8479: 01 14
	ASL $0984,X			 ; $847B: 1E 84 09
	BRK					 ; $847E: 00
	.byte $0C			; $847F
	BPL $8448			   ; $8480: 10 C6
	ORA #$06				; $8482: 09 06
	.byte $04			; $8484
	BPL $844B			   ; $8485: 10 C4
	ORA #$00				; $8487: 09 00
	ORA $C610			   ; $8489: 0D 10 C6
	ORA #$06				; $848C: 09 06
	ORA ptr_lo			  ; $848E: 05 10
	CPY $09				 ; $8490: C4 09
	BRK					 ; $8492: 00
	ORA $C610			   ; $8493: 0D 10 C6
	ORA #$06				; $8496: 09 06
	ASL ptr_lo			  ; $8498: 06 10
	CPY $09				 ; $849A: C4 09
	BRK					 ; $849C: 00
	ORA $18,X			   ; $849D: 15 18
	STX $09				 ; $849F: 86 09
	ASL $0E				 ; $84A1: 06 0E
	.byte $0B			; $84A3
	STY $09				 ; $84A4: 84 09
	BRK					 ; $84A6: 00
	ASL $18,X			   ; $84A7: 16 18
	STX $09				 ; $84A9: 86 09
	ASL $0F				 ; $84AB: 06 0F
	.byte $0B			; $84AD
	STY $09				 ; $84AE: 84 09
	BRK					 ; $84B0: 00
	ASL ptr_lo,X			; $84B1: 16 10
	DEC $09				 ; $84B3: C6 09
	ORA ptr0_hi			 ; $84B5: 05 05
	ORA #$C4				; $84B7: 09 C4
	ORA #$00				; $84B9: 09 00
	.byte $17			; $84BB
	BPL $8484			   ; $84BC: 10 C6
	ORA #$05				; $84BE: 09 05
	ASL $09				 ; $84C0: 06 09
	CPY $09				 ; $84C2: C4 09
	BRK					 ; $84C4: 00
	ORA ($07),Y			 ; $84C5: 11 07
	DEC $09				 ; $84C7: C6 09
	ORA (ptr_hi,X)		  ; $84C9: 01 11
	AND ($C4,X)			 ; $84CB: 21 C4
	ORA #$00				; $84CD: 09 00
	.byte $12			; $84CF
	.byte $07			; $84D0
	DEC $09				 ; $84D1: C6 09
	ORA ($12,X)			 ; $84D3: 01 12
	AND ($C4,X)			 ; $84D5: 21 C4
	ORA #$01				; $84D7: 09 01
	PHP					 ; $84D9: 08
	.byte $0F			; $84DA
	DEC $09				 ; $84DB: C6 09
	.byte $03			; $84DD
	ASL					 ; $84DE: 0A
	ORA ($C4),Y			 ; $84DF: 11 C4
	ORA #$01				; $84E1: 09 01
	ORA #$0F				; $84E3: 09 0F
	DEC $09				 ; $84E5: C6 09
	.byte $03			; $84E7
	.byte $0B			; $84E8
	ORA ($C4),Y			 ; $84E9: 11 C4
	ORA #$01				; $84EB: 09 01
	ORA #$0F				; $84ED: 09 0F
	DEC $09				 ; $84EF: C6 09
	.byte $03			; $84F1
	.byte $0C			; $84F2
	ORA ($C4),Y			 ; $84F3: 11 C4
	ORA #$01				; $84F5: 09 01
	ORA ($08),Y			 ; $84F7: 11 08
	STX $09				 ; $84F9: 86 09
	.byte $03			; $84FB
	CLC					 ; $84FC: 18
	ORA ($84),Y			 ; $84FD: 11 84
	ORA #$01				; $84FF: 09 01
	.byte $12			; $8501
	PHP					 ; $8502: 08
	STX $09				 ; $8503: 86 09
	.byte $03			; $8505
	ORA $8411,Y			 ; $8506: 19 11 84
	ORA #$01				; $8509: 09 01
	.byte $12			; $850B
	PHP					 ; $850C: 08
	STX $09				 ; $850D: 86 09
	.byte $03			; $850F
	.byte $1A			; $8510
	ORA ($84),Y			 ; $8511: 11 84
	ORA #$01				; $8513: 09 01
	.byte $1A			; $8515
	.byte $0F			; $8516
	DEC $09				 ; $8517: C6 09
	.byte $03			; $8519
	ROL ptr_hi			  ; $851A: 26 11
	CPY $09				 ; $851C: C4 09
	ORA ($1B,X)			 ; $851E: 01 1B
	.byte $0F			; $8520
	DEC $09				 ; $8521: C6 09
	.byte $03			; $8523
	.byte $27			; $8524
	ORA ($C4),Y			 ; $8525: 11 C4
	ORA #$01				; $8527: 09 01
	.byte $1B			; $8529
	.byte $0F			; $852A
	DEC $09				 ; $852B: C6 09
	.byte $03			; $852D
	PLP					 ; $852E: 28
	ORA ($C4),Y			 ; $852F: 11 C4
	ORA #$01				; $8531: 09 01
	ORA ($0F),Y			 ; $8533: 11 0F
	DEC $09				 ; $8535: C6 09
	.byte $02			; $8537
	BPL $854F			   ; $8538: 10 15
	CPY $09				 ; $853A: C4 09
	ORA ($12,X)			 ; $853C: 01 12
	.byte $0F			; $853E
	DEC $09				 ; $853F: C6 09
	.byte $02			; $8541
	ORA ($15),Y			 ; $8542: 11 15
	CPY $09				 ; $8544: C4 09
	.byte $03			; $8546
	ORA #$0B				; $8547: 09 0B
	DEC $09				 ; $8549: C6 09
	.byte $02			; $854B
	ORA ($0A,X)			 ; $854C: 01 0A
	CPY $09				 ; $854E: C4 09
	.byte $03			; $8550
	ASL					 ; $8551: 0A
	.byte $0B			; $8552
	DEC $09				 ; $8553: C6 09
	.byte $02			; $8555
	.byte $02			; $8556
	ASL					 ; $8557: 0A
	CPY $09				 ; $8558: C4 09
	.byte $03			; $855A
	PLP					 ; $855B: 28
	.byte $0B			; $855C
	DEC $09				 ; $855D: C6 09
	.byte $02			; $855F
	.byte $1F			; $8560
	ASL					 ; $8561: 0A
	CPY $09				 ; $8562: C4 09
	.byte $03			; $8564
	AND #$0B				; $8565: 29 0B
	DEC $09				 ; $8567: C6 09
	.byte $02			; $8569
	JSR $C40A			   ; $856A: 20 0A C4
	ORA (tmp0),Y			; $856D: 11 00
	.byte $13			; $856F
	PHP					 ; $8570: 08
	STA ptr_hi			  ; $8571: 85 11
	.byte $03			; $8573
	.byte $1B			; $8574
	.byte $0B			; $8575
	.byte $87			; $8576
	ORA (tmp3),Y			; $8577: 11 03
	.byte $0F			; $8579
	.byte $12			; $857A
	.byte $82			; $857B
	ORA (ptr0_hi),Y		 ; $857C: 11 05
	ORA $08				 ; $857E: 05 08
	STY $13				 ; $8580: 84 13
	BRK					 ; $8582: 00
	ORA $8208			   ; $8583: 0D 08 82
	.byte $13			; $8586
	.byte $03			; $8587
	.byte $04			; $8588
	.byte $07			; $8589
	STY $13				 ; $858A: 84 13
	BRK					 ; $858C: 00
	ORA $820D			   ; $858D: 0D 0D 82
	.byte $13			; $8590
	.byte $02			; $8591
	.byte $04			; $8592
	BPL $8519			   ; $8593: 10 84
	.byte $13			; $8595
	BRK					 ; $8596: 00
	.byte $07			; $8597
	.byte $0B			; $8598
	.byte $82			; $8599
	.byte $13			; $859A
	.byte $03			; $859B
	.byte $0C			; $859C
	.byte $04			; $859D
	STY $13				 ; $859E: 84 13
	BRK					 ; $85A0: 00
	.byte $13			; $85A1
	.byte $0B			; $85A2
	.byte $82			; $85A3
	.byte $13			; $85A4
	.byte $03			; $85A5
	ASL ptr0_lo,X		   ; $85A6: 16 04
	STY $13				 ; $85A8: 84 13
	BRK					 ; $85AA: 00
	AND $07				 ; $85AB: 25 07
	.byte $82			; $85AD
	.byte $13			; $85AE
	.byte $04			; $85AF
	.byte $07			; $85B0
	ASL $84				 ; $85B1: 06 84
	.byte $1B			; $85B3
	BRK					 ; $85B4: 00
	.byte $0C			; $85B5
	.byte $0C			; $85B6
	.byte $82			; $85B7
	.byte $1B			; $85B8
	ORA (tmp3,X)			; $85B9: 01 03
	.byte $0F			; $85BB
	STY $1B				 ; $85BC: 84 1B
	BRK					 ; $85BE: 00
	ORA $820C			   ; $85BF: 0D 0C 82
	.byte $1B			; $85C2
	ORA (ptr0_lo,X)		 ; $85C3: 01 04
	.byte $0F			; $85C5
	STY $1B				 ; $85C6: 84 1B
	BRK					 ; $85C8: 00
	ORA $820C			   ; $85C9: 0D 0C 82
	.byte $1B			; $85CC
	ORA (ptr0_hi,X)		 ; $85CD: 01 05
	.byte $0F			; $85CF
	STY $43				 ; $85D0: 84 43
	ASL $1A				 ; $85D2: 06 1A
	.byte $0B			; $85D4
	.byte $82			; $85D5
	.byte $43			; $85D6
	BRK					 ; $85D7: 00
	ORA $842A,Y			 ; $85D8: 19 2A 84
	.byte $43			; $85DB
	ASL $1A				 ; $85DC: 06 1A
	.byte $0B			; $85DE
	.byte $82			; $85DF
	.byte $43			; $85E0
	BRK					 ; $85E1: 00
	.byte $1A			; $85E2
	ROL					 ; $85E3: 2A
	STY $43				 ; $85E4: 84 43
	ASL $1A				 ; $85E6: 06 1A
	.byte $0B			; $85E8
	.byte $82			; $85E9
	.byte $43			; $85EA
	ASL					 ; $85EB: 0A
	ORA $842A,Y			 ; $85EC: 19 2A 84
	.byte $43			; $85EF
	ASL $1A				 ; $85F0: 06 1A
	.byte $0B			; $85F2
	.byte $82			; $85F3
	.byte $43			; $85F4
	ASL					 ; $85F5: 0A
	.byte $1A			; $85F6
	ROL					 ; $85F7: 2A
	STY $43				 ; $85F8: 84 43
	BRK					 ; $85FA: 00
	BPL $8610			   ; $85FB: 10 13
	.byte $82			; $85FD
	.byte $43			; $85FE
	.byte $02			; $85FF
	ORA $08				 ; $8600: 05 08
	STY $43				 ; $8602: 84 43
	ASL $0E				 ; $8604: 06 0E
	.byte $0C			; $8606
	STA $43				 ; $8607: 85 43
	.byte $07			; $8609
	ASL $8710			   ; $860A: 0E 10 87
	.byte $43			; $860D
	.byte $07			; $860E
	ASL					 ; $860F: 0A
	.byte $0F			; $8610
	.byte $82			; $8611
	.byte $43			; $8612
	ORA #$05				; $8613: 09 05
	PHP					 ; $8615: 08
	STY $25				 ; $8616: 84 25
	ORA ($09,X)			 ; $8618: 01 09
	ORA #$82				; $861A: 09 82
	AND tmp0				; $861C: 25 00
	ORA $15				 ; $861E: 05 15
	STY $25				 ; $8620: 84 25
	ORA ($09,X)			 ; $8622: 01 09
	ORA #$82				; $8624: 09 82
	AND tmp0				; $8626: 25 00
	ASL $15				 ; $8628: 06 15
	STY $2A				 ; $862A: 84 2A
	BRK					 ; $862C: 00
	ORA $08				 ; $862D: 05 08
	.byte $82			; $862F
	AND $09,X			   ; $8630: 35 09
	ASL $09				 ; $8632: 06 09
	.byte $04			; $8634
	EOR tmp0				; $8635: 45 00
	ORA $821B,X			 ; $8637: 1D 1B 82
	EOR tmp1				; $863A: 45 01
	ORA $0F,X			   ; $863C: 15 0F
	STY $45				 ; $863E: 84 45
	BRK					 ; $8640: 00
	.byte $23			; $8641
	.byte $1B			; $8642
	.byte $82			; $8643
	EOR ptr0_hi			 ; $8644: 45 05
	ORA $13				 ; $8646: 05 13
	STY $45				 ; $8648: 84 45
	BRK					 ; $864A: 00
	BIT $8212			   ; $864B: 2C 12 82
	EOR ptr0_lo			 ; $864E: 45 04
	AND (ptr0_hi,X)		 ; $8650: 21 05
	STY $45				 ; $8652: 84 45
	BRK					 ; $8654: 00
	ORA $8215			   ; $8655: 0D 15 82
	EOR ptr0_lo			 ; $8658: 45 04
	.byte $02			; $865A
	.byte $0B			; $865B
	STY $45				 ; $865C: 84 45
	BRK					 ; $865E: 00
	.byte $1A			; $865F
	ORA $82,X			   ; $8660: 15 82
	EOR ptr0_lo			 ; $8662: 45 04
	AND $841B			   ; $8664: 2D 1B 84
	EOR tmp0				; $8667: 45 00
	.byte $12			; $8669
	ORA $82,X			   ; $866A: 15 82
	EOR ptr0_lo			 ; $866C: 45 04
	BIT $1B				 ; $866E: 24 1B
	STY $45				 ; $8670: 84 45
	BRK					 ; $8672: 00
	ROL $0F				 ; $8673: 26 0F
	.byte $82			; $8675
	EOR tmp2				; $8676: 45 02
	ASL ptr_lo,X			; $8678: 16 10
	STY $45				 ; $867A: 84 45
	BRK					 ; $867C: 00
	.byte $1B			; $867D
	.byte $0F			; $867E
	.byte $82			; $867F
	EOR tmp2				; $8680: 45 02
	BPL $8694			   ; $8682: 10 10
	STY $45				 ; $8684: 84 45
	BRK					 ; $8686: 00
	ORA $8209,Y			 ; $8687: 19 09 82
	EOR tmp3				; $868A: 45 03
	.byte $03			; $868C
	ASL $4584			   ; $868D: 0E 84 45
	.byte $02			; $8690
	ORA (ptr0_lo,X)		 ; $8691: 01 04
	STY $45				 ; $8693: 84 45
	.byte $04			; $8695
	.byte $1F			; $8696
	ORA $4586			   ; $8697: 0D 86 45
	.byte $04			; $869A
	.byte $14			; $869B
	ORA $4587			   ; $869C: 0D 87 45
	ORA tmp0				; $869F: 05 00
	ORA #$85				; $86A1: 09 85
	PHP					 ; $86A3: 08
	BRK					 ; $86A4: 00
	BPL $86B1			   ; $86A5: 10 0A
	.byte $82			; $86A7
	PHP					 ; $86A8: 08
	ORA ($0C,X)			 ; $86A9: 01 0C
	ORA $0804,X			 ; $86AB: 1D 04 08
	BRK					 ; $86AE: 00
	BPL $86BB			   ; $86AF: 10 0A
	.byte $82			; $86B1
	PHP					 ; $86B2: 08
	ORA ($0B,X)			 ; $86B3: 01 0B
	ORA $0804,X			 ; $86B5: 1D 04 08
	BRK					 ; $86B8: 00
	ORA ($0A),Y			 ; $86B9: 11 0A
	.byte $82			; $86BB
	PHP					 ; $86BC: 08
	ORA ($0D,X)			 ; $86BD: 01 0D
	ORA $0D04,X			 ; $86BF: 1D 04 0D
	BRK					 ; $86C2: 00
	PHP					 ; $86C3: 08
	ASL					 ; $86C4: 0A
	.byte $82			; $86C5
	ORA $0601			   ; $86C6: 0D 01 06
	ORA #$84				; $86C9: 09 84
	ORA $0900			   ; $86CB: 0D 00 09
	ASL					 ; $86CE: 0A
	.byte $82			; $86CF
	ORA $0701			   ; $86D0: 0D 01 07
	ORA #$84				; $86D3: 09 84
	.byte $34			; $86D5
	BRK					 ; $86D6: 00
	.byte $0F			; $86D7
	PHP					 ; $86D8: 08
	.byte $82			; $86D9
	.byte $34			; $86DA
	.byte $03			; $86DB
	.byte $03			; $86DC
	.byte $12			; $86DD
	STY $38				 ; $86DE: 84 38
	BRK					 ; $86E0: 00
	ORA $C00E,Y			 ; $86E1: 19 0E C0
	SEC					 ; $86E4: 38
	.byte $03			; $86E5
	PHP					 ; $86E6: 08
	ASL $38C7,X			 ; $86E7: 1E C7 38
	BRK					 ; $86EA: 00
	ORA $C00F,Y			 ; $86EB: 19 0F C0
	SEC					 ; $86EE: 38
	.byte $03			; $86EF
	PHP					 ; $86F0: 08
	.byte $1F			; $86F1
	.byte $C7			; $86F2
	AND #$00				; $86F3: 29 00
	.byte $07			; $86F5
	ORA $82				 ; $86F6: 05 82
	AND #$01				; $86F8: 29 01
	.byte $07			; $86FA
	ASL $2984			   ; $86FB: 0E 84 29
	BRK					 ; $86FE: 00
	.byte $07			; $86FF
	ORA $82				 ; $8700: 05 82
	AND #$01				; $8702: 29 01
	ASL $0E				 ; $8704: 06 0E
	STY $29				 ; $8706: 84 29
	BRK					 ; $8708: 00
	.byte $07			; $8709
	ORA $82				 ; $870A: 05 82
	AND #$01				; $870C: 29 01
	PHP					 ; $870E: 08
	ASL $FF84			   ; $870F: 0E 84 FF
	JSR $8719			   ; $8712: 20 19 87
	BRK					 ; $8715: 00
	ORA #$8F				; $8716: 09 8F
	RTS					 ; $8718: 60
	JSR $87E9			   ; $8719: 20 E9 87
	JSR $87C0			   ; $871C: 20 C0 87
	JSR $8728			   ; $871F: 20 28 87
	JSR $87AE			   ; $8722: 20 AE 87
	JMP $871C			   ; $8725: 4C 1C 87
	JSR $877E			   ; $8728: 20 7E 87
	JSR $873D			   ; $872B: 20 3D 87
	LDX $058E			   ; $872E: AE 8E 05
	LDA $8738,X			 ; $8731: BD 38 87
	TAX					 ; $8734: AA
	JMP $C90C			   ; $8735: 4C 0C C9
	BRK					 ; $8738: 00
	.byte $14			; $8739
	.byte $0F			; $873A
	ORA (tmp3,X)			; $873B: 01 03
	LDA $0540			   ; $873D: AD 40 05
	JSR $8774			   ; $8740: 20 74 87
	INC $053E			   ; $8743: EE 3E 05
	INC $0540			   ; $8746: EE 40 05
	LDA $0540			   ; $8749: AD 40 05
	DEC $0540			   ; $874C: CE 40 05
	JSR $8774			   ; $874F: 20 74 87
	DEC $053E			   ; $8752: CE 3E 05
	INC $053F			   ; $8755: EE 3F 05
	LDA $0541			   ; $8758: AD 41 05
	JSR $8774			   ; $875B: 20 74 87
	INC $053E			   ; $875E: EE 3E 05
	INC $0541			   ; $8761: EE 41 05
	LDA $0541			   ; $8764: AD 41 05
	DEC $0541			   ; $8767: CE 41 05
	JSR $8774			   ; $876A: 20 74 87
	DEC $053E			   ; $876D: CE 3E 05
	DEC $053F			   ; $8770: CE 3F 05
	RTS					 ; $8773: 60
	LDX $053E			   ; $8774: AE 3E 05
	LDY $053F			   ; $8777: AC 3F 05
	BRK					 ; $877A: 00
	ORA #$EF				; $877B: 09 EF
	RTS					 ; $877D: 60
	LDA $57				 ; $877E: A5 57
	AND #$01				; $8780: 29 01
	ASL					 ; $8782: 0A
	ASL					 ; $8783: 0A
	ASL					 ; $8784: 0A
	ASL					 ; $8785: 0A
	TAX					 ; $8786: AA
	LDA $0540			   ; $8787: AD 40 05
	ASL					 ; $878A: 0A
	ASL					 ; $878B: 0A
	TAY					 ; $878C: A8
	LDA $7710,X			 ; $878D: BD 10 77
	STA $7600,Y			 ; $8790: 99 00 76
	INX					 ; $8793: E8
	INY					 ; $8794: C8
	TXA					 ; $8795: 8A
	AND #$07				; $8796: 29 07
	BNE $878D			   ; $8798: D0 F3
	LDA $0541			   ; $879A: AD 41 05
	ASL					 ; $879D: 0A
	ASL					 ; $879E: 0A
	TAY					 ; $879F: A8
	LDA $7710,X			 ; $87A0: BD 10 77
	STA $7600,Y			 ; $87A3: 99 00 76
	INX					 ; $87A6: E8
	INY					 ; $87A7: C8
	TXA					 ; $87A8: 8A
	AND #$07				; $87A9: 29 07
	BNE $87A0			   ; $87AB: D0 F3
	RTS					 ; $87AD: 60
	LDA $56				 ; $87AE: A5 56
	CLC					 ; $87B0: 18
	ADC #$08				; $87B1: 69 08
	STA $56				 ; $87B3: 85 56
	INC $57				 ; $87B5: E6 57
	LDA $57				 ; $87B7: A5 57
	CMP #$04				; $87B9: C9 04
	BCC $87BF			   ; $87BB: 90 02
	PLA					 ; $87BD: 68
	PLA					 ; $87BE: 68
	RTS					 ; $87BF: 60
	LDA #$00				; $87C0: A9 00
	STA $55				 ; $87C2: 85 55
	JSR $8853			   ; $87C4: 20 53 88
	JSR $887D			   ; $87C7: 20 7D 88
	JSR $C62D			   ; $87CA: 20 2D C6
	JSR $87D3			   ; $87CD: 20 D3 87
	JMP $87C4			   ; $87D0: 4C C4 87
	LDA $53				 ; $87D3: A5 53
	CLC					 ; $87D5: 18
	ADC #$40				; $87D6: 69 40
	STA $53				 ; $87D8: 85 53
	BCC $87DE			   ; $87DA: 90 02
	INC $54				 ; $87DC: E6 54
	INC $55				 ; $87DE: E6 55
	LDA $55				 ; $87E0: A5 55
	CMP #$04				; $87E2: C9 04
	BCC $87E8			   ; $87E4: 90 02
	PLA					 ; $87E6: 68
	PLA					 ; $87E7: 68
	RTS					 ; $87E8: 60
	LDA $88A8,X			 ; $87E9: BD A8 88
	STA $53				 ; $87EC: 85 53
	LDA $88A9,X			 ; $87EE: BD A9 88
	STA $54				 ; $87F1: 85 54
	LDA #$00				; $87F3: A9 00
	STA $56				 ; $87F5: 85 56
	STA $57				 ; $87F7: 85 57
	TAX					 ; $87F9: AA
	TAY					 ; $87FA: A8
	TXA					 ; $87FB: 8A
	STA $7710,Y			 ; $87FC: 99 10 77
	INX					 ; $87FF: E8
	INY					 ; $8800: C8
	CPY #$10				; $8801: C0 10
	BCC $87FB			   ; $8803: 90 F6
	LDA $0540			   ; $8805: AD 40 05
	ASL					 ; $8808: 0A
	ASL					 ; $8809: 0A
	TAX					 ; $880A: AA
	LDA $7600,X			 ; $880B: BD 00 76
	STA $7710,Y			 ; $880E: 99 10 77
	INX					 ; $8811: E8
	INY					 ; $8812: C8
	CPY #$18				; $8813: C0 18
	BCC $880B			   ; $8815: 90 F4
	LDA $0541			   ; $8817: AD 41 05
	ASL					 ; $881A: 0A
	ASL					 ; $881B: 0A
	TAX					 ; $881C: AA
	LDA $7600,X			 ; $881D: BD 00 76
	STA $7710,Y			 ; $8820: 99 10 77
	INX					 ; $8823: E8
	INY					 ; $8824: C8
	CPY #$20				; $8825: C0 20
	BCC $881D			   ; $8827: 90 F4
	LDX #$00				; $8829: A2 00
	LDY #$00				; $882B: A0 00
	LDA #$01				; $882D: A9 01
	STA $7701,X			 ; $882F: 9D 01 77
	LDA $7710,Y			 ; $8832: B9 10 77
	ASL					 ; $8835: 0A
	ROL $7701,X			 ; $8836: 3E 01 77
	ASL					 ; $8839: 0A
	ROL $7701,X			 ; $883A: 3E 01 77
	ASL					 ; $883D: 0A
	ROL $7701,X			 ; $883E: 3E 01 77
	ASL					 ; $8841: 0A
	ROL $7701,X			 ; $8842: 3E 01 77
	STA $7700,X			 ; $8845: 9D 00 77
	INY					 ; $8848: C8
	INY					 ; $8849: C8
	INY					 ; $884A: C8
	INY					 ; $884B: C8
	INX					 ; $884C: E8
	INX					 ; $884D: E8
	CPX #$10				; $884E: E0 10
	BCC $882D			   ; $8850: 90 DB
	RTS					 ; $8852: 60
	LDA $55				 ; $8853: A5 55
	ASL					 ; $8855: 0A
	CLC					 ; $8856: 18
	ADC $56				 ; $8857: 65 56
	AND #$0E				; $8859: 29 0E
	TAX					 ; $885B: AA
	LDA $7700,X			 ; $885C: BD 00 77
	STA $51				 ; $885F: 85 51
	LDA $7701,X			 ; $8861: BD 01 77
	STA $52				 ; $8864: 85 52
	LDX $0540			   ; $8866: AE 40 05
	LDA #$80				; $8869: A9 80
	STA $6F40,X			 ; $886B: 9D 40 6F
	STA $6F41,X			 ; $886E: 9D 41 6F
	LDX $0541			   ; $8871: AE 41 05
	LDA #$24				; $8874: A9 24
	STA $6F40,X			 ; $8876: 9D 40 6F
	STA $6F41,X			 ; $8879: 9D 41 6F
	RTS					 ; $887C: 60
	LDX $050A			   ; $887D: AE 0A 05
	LDA $52				 ; $8880: A5 52
	ORA #$80				; $8882: 09 80
	STA $0300,X			 ; $8884: 9D 00 03
	INX					 ; $8887: E8
	LDA #$40				; $8888: A9 40
	STA $0300,X			 ; $888A: 9D 00 03
	INX					 ; $888D: E8
	LDA $51				 ; $888E: A5 51
	STA $0300,X			 ; $8890: 9D 00 03
	INX					 ; $8893: E8
	LDY #$00				; $8894: A0 00
	LDA ($53),Y			 ; $8896: B1 53
	STA $0300,X			 ; $8898: 9D 00 03
	INX					 ; $889B: E8
	INY					 ; $889C: C8
	CPY #$40				; $889D: C0 40
	BCC $8896			   ; $889F: 90 F5
	STX $050A			   ; $88A1: 8E 0A 05
	INC $050B			   ; $88A4: EE 0B 05
	RTS					 ; $88A7: 60
	AND $89,X			   ; $88A8: 35 89
	AND $8D,X			   ; $88AA: 35 8D
	LDX #$00				; $88AC: A2 00
	LDA $8916,X			 ; $88AE: BD 16 89
	BMI $88C3			   ; $88B1: 30 10
	CMP $63				 ; $88B3: C5 63
	BNE $88BE			   ; $88B5: D0 07
	LDA $8917,X			 ; $88B7: BD 17 89
	CMP $64				 ; $88BA: C5 64
	BEQ $88C4			   ; $88BC: F0 06
	INX					 ; $88BE: E8
	INX					 ; $88BF: E8
	JMP $88AE			   ; $88C0: 4C AE 88
	RTS					 ; $88C3: 60
	LDA $8929,X			 ; $88C4: BD 29 89
	STA tmp0				; $88C7: 85 00
	LDA $892A,X			 ; $88C9: BD 2A 89
	STA tmp1				; $88CC: 85 01
	LDA $2002			   ; $88CE: AD 02 20
	LDA $891E,X			 ; $88D1: BD 1E 89
	STA $2006			   ; $88D4: 8D 06 20
	LDA $891D,X			 ; $88D7: BD 1D 89
	STA $2006			   ; $88DA: 8D 06 20
	LDY #$00				; $88DD: A0 00
	LDA (tmp0),Y			; $88DF: B1 00
	STA $2007			   ; $88E1: 8D 07 20
	INY					 ; $88E4: C8
	BPL $88DF			   ; $88E5: 10 F8
	LDA $8924,X			 ; $88E7: BD 24 89
	STA $2006			   ; $88EA: 8D 06 20
	LDA $8923,X			 ; $88ED: BD 23 89
	STA $2006			   ; $88F0: 8D 06 20
	LDA (tmp0),Y			; $88F3: B1 00
	STA $2007			   ; $88F5: 8D 07 20
	INY					 ; $88F8: C8
	BMI $88F3			   ; $88F9: 30 F8
	LDA #$24				; $88FB: A9 24
	LDY $8930,X			 ; $88FD: BC 30 89
	STA $6F40,Y			 ; $8900: 99 40 6F
	STA $6F41,Y			 ; $8903: 99 41 6F
	CPX #$04				; $8906: E0 04
	BCC $890C			   ; $8908: 90 02
	LDA #$80				; $890A: A9 80
	LDY $892F,X			 ; $890C: BC 2F 89
	STA $6F40,Y			 ; $890F: 99 40 6F
	STA $6F41,Y			 ; $8912: 99 41 6F
	RTS					 ; $8915: 60
	ORA #$00				; $8916: 09 00
	ORA #$03				; $8918: 09 03
	.byte $1B			; $891A
	BRK					 ; $891B: 00
	.byte $FF			; $891C
	BCS $893A			   ; $891D: B0 1B
	LDY #$1A				; $891F: A0 1A
	BVS $893E			   ; $8921: 70 1B
	BMI $8941			   ; $8923: 30 1C
	JSR $001B			   ; $8925: 20 1B 00
	.byte $1C			; $8928
	AND $8C,X			   ; $8929: 35 8C
	AND $8C,X			   ; $892B: 35 8C
	AND $8C,X			   ; $892D: 35 8C
	BPL $8945			   ; $892F: 10 14
	BPL $8947			   ; $8931: 10 14
	BPL $8949			   ; $8933: 10 14
	BVS $899A			   ; $8935: 70 63
	.byte $44			; $8937
	.byte $0B			; $8938
	.byte $53			; $8939
	RTI					 ; $893A: 40
	RTI					 ; $893B: 40
	.byte $47			; $893C
	.byte $07			; $893D
	.byte $0C			; $893E
	CLC					 ; $893F: 18
	BMI $8962			   ; $8940: 30 20
	BIT $202F			   ; $8942: 2C 2F 20
	BRK					 ; $8945: 00
	.byte $FF			; $8946
	BRK					 ; $8947: 00
	.byte $FA			; $8948
	.byte $3A			; $8949
	.byte $82			; $894A
	.byte $42			; $894B
	TSX					 ; $894C: BA
	.byte $FF			; $894D
	BRK					 ; $894E: 00
	BRK					 ; $894F: 00
	BRK					 ; $8950: 00
	BRK					 ; $8951: 00
	RTI					 ; $8952: 40
	CLV					 ; $8953: B8
	RTI					 ; $8954: 40
	PHA					 ; $8955: 48
	LSR $4F4F			   ; $8956: 4E 4F 4F
	.byte $4F			; $8959
	RTI					 ; $895A: 40
	RTI					 ; $895B: 40
	LSR $2021			   ; $895C: 4E 21 20
	JSR $2020			   ; $895F: 20 20 20
	JSR $202F			   ; $8962: 20 2F 20
	RTI					 ; $8965: 40
	SEC					 ; $8966: 38
	.byte $80			; $8967
	RTI					 ; $8968: 40
	SEI					 ; $8969: 78
	SEI					 ; $896A: 78
	CLC					 ; $896B: 18
	PHP					 ; $896C: 08
	TSX					 ; $896D: BA
	.byte $42			; $896E
	.byte $3A			; $896F
	.byte $02			; $8970
	.byte $82			; $8971
	.byte $02			; $8972
	.byte $82			; $8973
	.byte $E2			; $8974
	BRK					 ; $8975: 00
	.byte $FF			; $8976
	BRK					 ; $8977: 00
	.byte $5F			; $8978
	.byte $5C			; $8979
	EOR ($42,X)			 ; $897A: 41 42
	EOR $00FF,X			 ; $897C: 5D FF 00
	BRK					 ; $897F: 00
	BRK					 ; $8980: 00
	BRK					 ; $8981: 00
	.byte $02			; $8982
	ORA $0C02,X			 ; $8983: 1D 02 0C
	DEC $23				 ; $8986: C6 23
	BNE $8952			   ; $8988: D0 C8
	.byte $04			; $898A
	.byte $04			; $898B
	CPX $E3				 ; $898C: E4 E3
	AND ($18),Y			 ; $898E: 31 18
	.byte $0C			; $8990
	ASL $32				 ; $8991: 06 32
	.byte $F2			; $8993
	.byte $02			; $8994
	.byte $02			; $8995
	.byte $1C			; $8996
	ORA (tmp2,X)			; $8997: 01 02
	ASL $181E,X			 ; $8999: 1E 1E 18
	BPL $89FB			   ; $899C: 10 5D
	.byte $42			; $899E
	.byte $5C			; $899F
	RTI					 ; $89A0: 40
	EOR ($40,X)			 ; $89A1: 41 40
	EOR ($47,X)			 ; $89A3: 41 47
	.byte $14			; $89A5
	.byte $74			; $89A6
	.byte $F4			; $89A7
	.byte $F4			; $89A8
	.byte $F4			; $89A9
	.byte $04			; $89AA
	.byte $04			; $89AB
	.byte $74			; $89AC
	.byte $82			; $89AD
	.byte $02			; $89AE
	.byte $02			; $89AF
	.byte $02			; $89B0
	.byte $02			; $89B1
	.byte $02			; $89B2
	.byte $F2			; $89B3
	.byte $02			; $89B4
	LSR $4040			   ; $89B5: 4E 40 40
	LSR $404E			   ; $89B8: 4E 4E 40
	RTI					 ; $89BB: 40
	.byte $4F			; $89BC
	JSR $2F21			   ; $89BD: 20 21 2F
	AND ($20,X)			 ; $89C0: 21 20
	JSR $202F			   ; $89C2: 20 2F 20
	RTI					 ; $89C5: 40
	RTI					 ; $89C6: 40
	PHP					 ; $89C7: 08
	CLC					 ; $89C8: 18
	SEI					 ; $89C9: 78
	SED					 ; $89CA: F8
	SED					 ; $89CB: F8
	BRK					 ; $89CC: 00
	BVS $89A9			   ; $89CD: 70 DA
	LDY $E2,X			   ; $89CF: B4 E2
	.byte $80			; $89D1
	.byte $02			; $89D2
	.byte $02			; $89D3
	.byte $02			; $89D4
	RTI					 ; $89D5: 40
	RTI					 ; $89D6: 40
	EOR $4F				 ; $89D7: 45 4F
	.byte $4F			; $89D9
	RTI					 ; $89DA: 40
	BRK					 ; $89DB: 00
	BRK					 ; $89DC: 00
	JSR $2F2F			   ; $89DD: 20 2F 2F
	.byte $2F			; $89E0
	.byte $2F			; $89E1
	JSR $002F			   ; $89E2: 20 2F 00
	BRK					 ; $89E5: 00
	BVC $89E2			   ; $89E6: 50 FA
	.byte $FA			; $89E8
	.byte $02			; $89E9
	BRK					 ; $89EA: 00
	ORA (tmp0,X)			; $89EB: 01 00
	.byte $FA			; $89ED
	.byte $FA			; $89EE
	SED					 ; $89EF: F8
	SED					 ; $89F0: F8
	.byte $04			; $89F1
	SED					 ; $89F2: F8
	BRK					 ; $89F3: 00
	BRK					 ; $89F4: 00
	.byte $02			; $89F5
	.byte $02			; $89F6
	BPL $8A11			   ; $89F7: 10 18
	ASL $1F1F,X			 ; $89F9: 1E 1F 1F
	BRK					 ; $89FC: 00
	ASL $2D5B			   ; $89FD: 0E 5B 2D
	.byte $47			; $8A00
	ORA ($40,X)			 ; $8A01: 01 40
	RTI					 ; $8A03: 40
	RTI					 ; $8A04: 40
	.byte $74			; $8A05
	.byte $04			; $8A06
	.byte $04			; $8A07
	.byte $74			; $8A08
	.byte $74			; $8A09
	.byte $04			; $8A0A
	.byte $04			; $8A0B
	.byte $F4			; $8A0C
	.byte $02			; $8A0D
	.byte $82			; $8A0E
	.byte $F2			; $8A0F
	.byte $82			; $8A10
	.byte $02			; $8A11
	.byte $02			; $8A12
	.byte $F2			; $8A13
	.byte $02			; $8A14
	BRK					 ; $8A15: 00
	ASL					 ; $8A16: 0A
	.byte $5F			; $8A17
	.byte $5F			; $8A18
	RTI					 ; $8A19: 40
	BRK					 ; $8A1A: 00
	.byte $80			; $8A1B
	BRK					 ; $8A1C: 00
	.byte $5F			; $8A1D
	.byte $5F			; $8A1E
	.byte $1F			; $8A1F
	.byte $1F			; $8A20
	JSR $001F			   ; $8A21: 20 1F 00
	BRK					 ; $8A24: 00
	.byte $04			; $8A25
	.byte $04			; $8A26
	LDY $F4				 ; $8A27: A4 F4
	.byte $F4			; $8A29
	.byte $04			; $8A2A
	.byte $04			; $8A2B
	BRK					 ; $8A2C: 00
	.byte $02			; $8A2D
	.byte $F2			; $8A2E
	.byte $F2			; $8A2F
	.byte $F2			; $8A30
	.byte $F2			; $8A31
	.byte $02			; $8A32
	BEQ $8A35			   ; $8A33: F0 00
	BVS $8A9A			   ; $8A35: 70 63
	.byte $44			; $8A37
	.byte $0B			; $8A38
	BVC $8A7B			   ; $8A39: 50 40
	.byte $43			; $8A3B
	.byte $44			; $8A3C
	.byte $07			; $8A3D
	.byte $0C			; $8A3E
	CLC					 ; $8A3F: 18
	BMI $8A62			   ; $8A40: 30 20
	.byte $2F			; $8A42
	BIT $0023			   ; $8A43: 2C 23 00
	.byte $FF			; $8A46
	BRK					 ; $8A47: 00
	DEY					 ; $8A48: 88
	PLP					 ; $8A49: 28
	INY					 ; $8A4A: C8
	PLP					 ; $8A4B: 28
	INY					 ; $8A4C: C8
	.byte $FF			; $8A4D
	BRK					 ; $8A4E: 00
	BRK					 ; $8A4F: 00
	BRK					 ; $8A50: 00
	RTI					 ; $8A51: 40
	JSR $20C0			   ; $8A52: 20 C0 20
	PHA					 ; $8A55: 48
	.byte $4F			; $8A56
	.byte $4F			; $8A57
	.byte $4F			; $8A58
	JMP $4240			   ; $8A59: 4C 40 42
	LSR $2020			   ; $8A5C: 4E 20 20
	JSR $2020			   ; $8A5F: 20 20 20
	.byte $23			; $8A62
	BIT $2020			   ; $8A63: 2C 20 20
	BRK					 ; $8A66: 00
	CPY #$60				; $8A67: C0 60
	RTS					 ; $8A69: 60
	BRK					 ; $8A6A: 00
	BRK					 ; $8A6B: 00
	RTI					 ; $8A6C: 40
	INY					 ; $8A6D: C8
	PLP					 ; $8A6E: 28
	PHP					 ; $8A6F: 08
	PHP					 ; $8A70: 08
	DEY					 ; $8A71: 88
	PHP					 ; $8A72: 08
	INX					 ; $8A73: E8
	CPX #$00				; $8A74: E0 00
	.byte $FF			; $8A76
	BRK					 ; $8A77: 00
	ORA ($14),Y			 ; $8A78: 11 14
	.byte $13			; $8A7A
	.byte $14			; $8A7B
	.byte $13			; $8A7C
	.byte $FF			; $8A7D
	BRK					 ; $8A7E: 00
	BRK					 ; $8A7F: 00
	BRK					 ; $8A80: 00
	.byte $02			; $8A81
	.byte $04			; $8A82
	.byte $03			; $8A83
	.byte $04			; $8A84
	.byte $0C			; $8A85
	DEC $23				 ; $8A86: C6 23
	BNE $8A92			   ; $8A88: D0 08
	.byte $04			; $8A8A
	CPY $24				 ; $8A8B: C4 24
	.byte $E3			; $8A8D
	AND ($18),Y			 ; $8A8E: 31 18
	.byte $0C			; $8A90
	ASL $F2				 ; $8A91: 06 F2
	.byte $32			; $8A93
	.byte $C2			; $8A94
	.byte $04			; $8A95
	BRK					 ; $8A96: 00
	.byte $03			; $8A97
	ASL $06				 ; $8A98: 06 06
	BRK					 ; $8A9A: 00
	BRK					 ; $8A9B: 00
	.byte $02			; $8A9C
	.byte $13			; $8A9D
	.byte $14			; $8A9E
	BPL $8AB1			   ; $8A9F: 10 10
	ORA (ptr_lo),Y		  ; $8AA1: 11 10
	.byte $17			; $8AA3
	.byte $07			; $8AA4
	.byte $14			; $8AA5
	.byte $F4			; $8AA6
	.byte $F4			; $8AA7
	.byte $F4			; $8AA8
	.byte $34			; $8AA9
	.byte $04			; $8AAA
	.byte $44			; $8AAB
	.byte $74			; $8AAC
	.byte $02			; $8AAD
	.byte $02			; $8AAE
	.byte $02			; $8AAF
	.byte $02			; $8AB0
	.byte $02			; $8AB1
	.byte $C2			; $8AB2
	.byte $32			; $8AB3
	.byte $02			; $8AB4
	JMP $4240			   ; $8AB5: 4C 40 42
	LSR $404C			   ; $8AB8: 4E 4C 40
	.byte $43			; $8ABB
	JMP $2321			   ; $8ABC: 4C 21 23
	AND $2020			   ; $8ABF: 2D 20 20
	.byte $23			; $8AC2
	BIT $4020			   ; $8AC3: 2C 20 40
	BRK					 ; $8AC6: 00
	BRK					 ; $8AC7: 00
	RTS					 ; $8AC8: 60
	RTS					 ; $8AC9: 60
	CPX #$80				; $8ACA: E0 80
	BRK					 ; $8ACC: 00
	PHA					 ; $8ACD: 48
	LDY #$E8				; $8ACE: A0 E8
	.byte $80			; $8AD0
	DEY					 ; $8AD1: 88
	PHP					 ; $8AD2: 08
	PHP					 ; $8AD3: 08
	PLA					 ; $8AD4: 68
	RTI					 ; $8AD5: 40
	EOR ($47,X)			 ; $8AD6: 41 47
	.byte $4F			; $8AD8
	JMP $0040			   ; $8AD9: 4C 40 00
	BRK					 ; $8ADC: 00
	.byte $23			; $8ADD
	.byte $2F			; $8ADE
	.byte $2F			; $8ADF
	.byte $2F			; $8AE0
	BIT $2C23			   ; $8AE1: 2C 23 2C
	BRK					 ; $8AE4: 00
	PHA					 ; $8AE5: 48
	PLA					 ; $8AE6: 68
	INX					 ; $8AE7: E8
	DEY					 ; $8AE8: 88
	ORA (tmp0),Y			; $8AE9: 11 00
	ORA $E000			   ; $8AEB: 0D 00 E0
	CPX #$E0				; $8AEE: E0 E0
	.byte $80			; $8AF0
	ADC ($80,X)			 ; $8AF1: 61 80
	BRK					 ; $8AF3: 00
	BRK					 ; $8AF4: 00
	.byte $02			; $8AF5
	BRK					 ; $8AF6: 00
	BRK					 ; $8AF7: 00
	ASL $06				 ; $8AF8: 06 06
	.byte $07			; $8AFA
	ORA (tmp0,X)			; $8AFB: 01 00
	.byte $12			; $8AFD
	ORA $17				 ; $8AFE: 05 17
	ORA (ptr_hi,X)		  ; $8B00: 01 11
	BPL $8B14			   ; $8B02: 10 10
	ASL $34,X			   ; $8B04: 16 34
	.byte $04			; $8B06
	.byte $44			; $8B07
	.byte $74			; $8B08
	.byte $34			; $8B09
	.byte $04			; $8B0A
	CPY $34				 ; $8B0B: C4 34
	.byte $82			; $8B0D
	.byte $C2			; $8B0E
	.byte $B2			; $8B0F
	.byte $02			; $8B10
	.byte $02			; $8B11
	.byte $C2			; $8B12
	.byte $32			; $8B13
	.byte $02			; $8B14
	.byte $12			; $8B15
	ASL $17,X			   ; $8B16: 16 17
	ORA ($48),Y			 ; $8B18: 11 48
	BRK					 ; $8B1A: 00
	BNE $8B1D			   ; $8B1B: D0 00
	.byte $07			; $8B1D
	.byte $07			; $8B1E
	.byte $07			; $8B1F
	ORA ($46,X)			 ; $8B20: 01 46
	ORA (tmp0,X)			; $8B22: 01 00
	BRK					 ; $8B24: 00
	.byte $04			; $8B25
	STY $E4				 ; $8B26: 84 E4
	.byte $F4			; $8B28
	.byte $34			; $8B29
	.byte $04			; $8B2A
	.byte $04			; $8B2B
	BRK					 ; $8B2C: 00
	.byte $C2			; $8B2D
	.byte $F2			; $8B2E
	.byte $F2			; $8B2F
	.byte $F2			; $8B30
	.byte $32			; $8B31
	.byte $C2			; $8B32
	BMI $8B35			   ; $8B33: 30 00
	BVS $8B9A			   ; $8B35: 70 63
	.byte $44			; $8B37
	PHP					 ; $8B38: 08
	EOR ($40),Y			 ; $8B39: 51 40
	.byte $47			; $8B3B
	RTI					 ; $8B3C: 40
	.byte $07			; $8B3D
	.byte $0C			; $8B3E
	CLC					 ; $8B3F: 18
	BMI $8B64			   ; $8B40: 30 22
	.byte $2F			; $8B42
	PLP					 ; $8B43: 28
	AND (tmp0,X)			; $8B44: 21 00
	.byte $FF			; $8B46
	BRK					 ; $8B47: 00
	RTI					 ; $8B48: 40
	RTI					 ; $8B49: 40
	RTI					 ; $8B4A: 40
	RTI					 ; $8B4B: 40
	RTI					 ; $8B4C: 40
	.byte $FF			; $8B4D
	BRK					 ; $8B4E: 00
	BRK					 ; $8B4F: 00
	BRK					 ; $8B50: 00
	BRK					 ; $8B51: 00
	BRK					 ; $8B52: 00
	BRK					 ; $8B53: 00
	BRK					 ; $8B54: 00
	LSR $4F4F			   ; $8B55: 4E 4F 4F
	EOR #$48				; $8B58: 49 48
	.byte $44			; $8B5A
	.byte $44			; $8B5B
	LSR $2020			   ; $8B5C: 4E 20 20
	JSR $2620			   ; $8B5F: 20 20 26
	AND ($29,X)			 ; $8B62: 21 29
	JSR $4040			   ; $8B64: 20 40 40
	RTI					 ; $8B67: 40
	RTI					 ; $8B68: 40
	.byte $80			; $8B69
	RTI					 ; $8B6A: 40
	CPY #$80				; $8B6B: C0 80
	BRK					 ; $8B6D: 00
	BRK					 ; $8B6E: 00
	BRK					 ; $8B6F: 00
	BRK					 ; $8B70: 00
	BRK					 ; $8B71: 00
	.byte $80			; $8B72
	.byte $80			; $8B73
	.byte $80			; $8B74
	BRK					 ; $8B75: 00
	.byte $FF			; $8B76
	BRK					 ; $8B77: 00
	.byte $02			; $8B78
	.byte $02			; $8B79
	.byte $02			; $8B7A
	.byte $02			; $8B7B
	.byte $02			; $8B7C
	.byte $FF			; $8B7D
	BRK					 ; $8B7E: 00
	BRK					 ; $8B7F: 00
	BRK					 ; $8B80: 00
	BRK					 ; $8B81: 00
	BRK					 ; $8B82: 00
	BRK					 ; $8B83: 00
	BRK					 ; $8B84: 00
	.byte $0C			; $8B85
	DEC $23				 ; $8B86: C6 23
	BPL $8B12			   ; $8B88: 10 88
	.byte $04			; $8B8A
	CPX ptr0_lo			 ; $8B8B: E4 04
	.byte $E3			; $8B8D
	AND ($18),Y			 ; $8B8E: 31 18
	.byte $0C			; $8B90
	LSR $F2				 ; $8B91: 46 F2
	.byte $12			; $8B93
	.byte $82			; $8B94
	.byte $02			; $8B95
	.byte $02			; $8B96
	.byte $02			; $8B97
	.byte $02			; $8B98
	ORA (tmp2,X)			; $8B99: 01 02
	.byte $03			; $8B9B
	ORA (tmp0,X)			; $8B9C: 01 00
	BRK					 ; $8B9E: 00
	BRK					 ; $8B9F: 00
	BRK					 ; $8BA0: 00
	BRK					 ; $8BA1: 00
	ORA (tmp1,X)			; $8BA2: 01 01
	ORA ($74,X)			 ; $8BA4: 01 74
	.byte $F4			; $8BA6
	.byte $F4			; $8BA7
	STY $14,X			   ; $8BA8: 94 14
	BIT $24				 ; $8BAA: 24 24
	.byte $74			; $8BAC
	.byte $02			; $8BAD
	.byte $02			; $8BAE
	.byte $02			; $8BAF
	.byte $02			; $8BB0
	.byte $62			; $8BB1
	.byte $82			; $8BB2
	.byte $92			; $8BB3
	.byte $02			; $8BB4
	PHA					 ; $8BB5: 48
	EOR ($47,X)			 ; $8BB6: 41 47
	LSR $4148			   ; $8BB8: 4E 48 41
	LSR $48				 ; $8BBB: 46 48
	.byte $23			; $8BBD
	ROL $28				 ; $8BBE: 26 28
	JSR $2621			   ; $8BC0: 20 21 26
	PLP					 ; $8BC3: 28
	AND ($40,X)			 ; $8BC4: 21 40
	BRK					 ; $8BC6: 00
	RTI					 ; $8BC7: 40
	RTI					 ; $8BC8: 40
	RTI					 ; $8BC9: 40
	RTI					 ; $8BCA: 40
	RTI					 ; $8BCB: 40
	RTI					 ; $8BCC: 40
	BRK					 ; $8BCD: 00
	.byte $80			; $8BCE
	BRK					 ; $8BCF: 00
	BRK					 ; $8BD0: 00
	BRK					 ; $8BD1: 00
	BRK					 ; $8BD2: 00
	BRK					 ; $8BD3: 00
	BRK					 ; $8BD4: 00
	EOR ($45,X)			 ; $8BD5: 41 45
	.byte $47			; $8BD7
	LSR $4048			   ; $8BD8: 4E 48 40
	BRK					 ; $8BDB: 00
	BRK					 ; $8BDC: 00
	.byte $27			; $8BDD
	.byte $2F			; $8BDE
	.byte $2F			; $8BDF
	ROL $2629			   ; $8BE0: 2E 29 26
	PLP					 ; $8BE3: 28
	BRK					 ; $8BE4: 00
	RTI					 ; $8BE5: 40
	RTI					 ; $8BE6: 40
	EOR $4A				 ; $8BE7: 45 4A
	ORA $0A,X			   ; $8BE9: 15 0A
	EOR $0000,X			 ; $8BEB: 5D 00 00
	BRK					 ; $8BEE: 00
	ORA $0A				 ; $8BEF: 05 0A
	STA $0A,X			   ; $8BF1: 95 0A
	BRK					 ; $8BF3: 00
	BRK					 ; $8BF4: 00
	.byte $02			; $8BF5
	BRK					 ; $8BF6: 00
	.byte $02			; $8BF7
	.byte $02			; $8BF8
	.byte $02			; $8BF9
	.byte $02			; $8BFA
	.byte $02			; $8BFB
	.byte $02			; $8BFC
	BRK					 ; $8BFD: 00
	ORA (tmp0,X)			; $8BFE: 01 00
	BRK					 ; $8C00: 00
	BRK					 ; $8C01: 00
	BRK					 ; $8C02: 00
	BRK					 ; $8C03: 00
	BRK					 ; $8C04: 00
	.byte $14			; $8C05
	STY $E4				 ; $8C06: 84 E4
	.byte $74			; $8C08
	.byte $14			; $8C09
	STY $64				 ; $8C0A: 84 64
	.byte $14			; $8C0C
	.byte $C2			; $8C0D
	.byte $62			; $8C0E
	.byte $12			; $8C0F
	.byte $02			; $8C10
	.byte $82			; $8C11
	.byte $62			; $8C12
	.byte $12			; $8C13
	.byte $82			; $8C14
	.byte $02			; $8C15
	.byte $02			; $8C16
	.byte $42			; $8C17
	LDX #$50				; $8C18: A2 50
	TAY					 ; $8C1A: A8
	CMP $0000,X			 ; $8C1B: DD 00 00
	BRK					 ; $8C1E: 00
	RTI					 ; $8C1F: 40
	LDY #$51				; $8C20: A0 51
	LDY #$00				; $8C22: A0 00
	BRK					 ; $8C24: 00
	STY $A4				 ; $8C25: 84 A4
	CPX $74				 ; $8C27: E4 74
	.byte $14			; $8C29
	.byte $04			; $8C2A
	.byte $04			; $8C2B
	BRK					 ; $8C2C: 00
	.byte $E2			; $8C2D
	.byte $F2			; $8C2E
	.byte $F2			; $8C2F
	.byte $72			; $8C30
	.byte $92			; $8C31
	.byte $62			; $8C32
	BPL $8C35			   ; $8C33: 10 00
	BVS $8C9A			   ; $8C35: 70 63
	.byte $44			; $8C37
	PHP					 ; $8C38: 08
	.byte $54			; $8C39
	.byte $44			; $8C3A
	JMP $074C			   ; $8C3B: 4C 4C 07
	.byte $0C			; $8C3E
	CLC					 ; $8C3F: 18
	BMI $8C62			   ; $8C40: 30 20
	JSR $2020			   ; $8C42: 20 20 20
	BRK					 ; $8C45: 00
	.byte $FF			; $8C46
	BRK					 ; $8C47: 00
	BRK					 ; $8C48: 00
	BRK					 ; $8C49: 00
	BRK					 ; $8C4A: 00
	BRK					 ; $8C4B: 00
	BRK					 ; $8C4C: 00
	.byte $FF			; $8C4D
	BRK					 ; $8C4E: 00
	BRK					 ; $8C4F: 00
	BRK					 ; $8C50: 00
	BRK					 ; $8C51: 00
	BRK					 ; $8C52: 00
	BRK					 ; $8C53: 00
	BRK					 ; $8C54: 00
	JMP $4C4C			   ; $8C55: 4C 4C 4C
	JMP $4C4C			   ; $8C58: 4C 4C 4C
	JMP $204C			   ; $8C5B: 4C 4C 20
	JSR $2020			   ; $8C5E: 20 20 20
	JSR $2020			   ; $8C61: 20 20 20
	JSR $0000			   ; $8C64: 20 00 00
	BRK					 ; $8C67: 00
	BRK					 ; $8C68: 00
	BRK					 ; $8C69: 00
	BRK					 ; $8C6A: 00
	BRK					 ; $8C6B: 00
	BRK					 ; $8C6C: 00
	BRK					 ; $8C6D: 00
	BRK					 ; $8C6E: 00
	BRK					 ; $8C6F: 00
	BRK					 ; $8C70: 00
	BRK					 ; $8C71: 00
	BRK					 ; $8C72: 00
	BRK					 ; $8C73: 00
	BRK					 ; $8C74: 00
	BRK					 ; $8C75: 00
	.byte $FF			; $8C76
	BRK					 ; $8C77: 00
	BRK					 ; $8C78: 00
	BRK					 ; $8C79: 00
	BRK					 ; $8C7A: 00
	BRK					 ; $8C7B: 00
	BRK					 ; $8C7C: 00
	.byte $FF			; $8C7D
	BRK					 ; $8C7E: 00
	BRK					 ; $8C7F: 00
	BRK					 ; $8C80: 00
	BRK					 ; $8C81: 00
	BRK					 ; $8C82: 00
	BRK					 ; $8C83: 00
	BRK					 ; $8C84: 00
	.byte $0C			; $8C85
	DEC $23				 ; $8C86: C6 23
	BPL $8CB2			   ; $8C88: 10 28
	BIT $34				 ; $8C8A: 24 34
	.byte $34			; $8C8C
	.byte $E3			; $8C8D
	AND ($18),Y			 ; $8C8E: 31 18
	.byte $0C			; $8C90
	ASL tmp2				; $8C91: 06 02
	.byte $02			; $8C93
	.byte $02			; $8C94
	BRK					 ; $8C95: 00
	BRK					 ; $8C96: 00
	BRK					 ; $8C97: 00
	BRK					 ; $8C98: 00
	BRK					 ; $8C99: 00
	BRK					 ; $8C9A: 00
	BRK					 ; $8C9B: 00
	BRK					 ; $8C9C: 00
	BRK					 ; $8C9D: 00
	BRK					 ; $8C9E: 00
	BRK					 ; $8C9F: 00
	BRK					 ; $8CA0: 00
	BRK					 ; $8CA1: 00
	BRK					 ; $8CA2: 00
	BRK					 ; $8CA3: 00
	BRK					 ; $8CA4: 00
	.byte $34			; $8CA5
	.byte $34			; $8CA6
	.byte $34			; $8CA7
	.byte $34			; $8CA8
	.byte $34			; $8CA9
	.byte $34			; $8CAA
	.byte $34			; $8CAB
	.byte $34			; $8CAC
	.byte $02			; $8CAD
	.byte $02			; $8CAE
	.byte $02			; $8CAF
	.byte $02			; $8CB0
	.byte $02			; $8CB1
	.byte $02			; $8CB2
	.byte $02			; $8CB3
	.byte $02			; $8CB4
	JMP $4C4C			   ; $8CB5: 4C 4C 4C
	JMP $4C4C			   ; $8CB8: 4C 4C 4C
	JMP $204C			   ; $8CBB: 4C 4C 20
	JSR $2020			   ; $8CBE: 20 20 20
	JSR $2020			   ; $8CC1: 20 20 20
	JSR $0000			   ; $8CC4: 20 00 00
	BRK					 ; $8CC7: 00
	BRK					 ; $8CC8: 00
	BRK					 ; $8CC9: 00
	BRK					 ; $8CCA: 00
	BRK					 ; $8CCB: 00
	BRK					 ; $8CCC: 00
	BRK					 ; $8CCD: 00
	BRK					 ; $8CCE: 00
	BRK					 ; $8CCF: 00
	BRK					 ; $8CD0: 00
	BRK					 ; $8CD1: 00
	BRK					 ; $8CD2: 00
	BRK					 ; $8CD3: 00
	BRK					 ; $8CD4: 00
	JMP $4C4C			   ; $8CD5: 4C 4C 4C
	JMP $4849			   ; $8CD8: 4C 49 48
	ORA (tmp0,X)			; $8CDB: 01 00
	JSR $2020			   ; $8CDD: 20 20 20
	JSR $2021			   ; $8CE0: 20 21 20
	JSR $0000			   ; $8CE3: 20 00 00
	ROL					 ; $8CE6: 2A
	EOR $AA,X			   ; $8CE7: 55 AA
	EOR $AA,X			   ; $8CE9: 55 AA
	CMP $0000,X			 ; $8CEB: DD 00 00
	ROL					 ; $8CEE: 2A
	EOR $AA,X			   ; $8CEF: 55 AA
	EOR $AA,X			   ; $8CF1: 55 AA
	BRK					 ; $8CF3: 00
	BRK					 ; $8CF4: 00
	BRK					 ; $8CF5: 00
	BRK					 ; $8CF6: 00
	BRK					 ; $8CF7: 00
	BRK					 ; $8CF8: 00
	BRK					 ; $8CF9: 00
	BRK					 ; $8CFA: 00
	BRK					 ; $8CFB: 00
	BRK					 ; $8CFC: 00
	BRK					 ; $8CFD: 00
	BRK					 ; $8CFE: 00
	BRK					 ; $8CFF: 00
	BRK					 ; $8D00: 00
	BRK					 ; $8D01: 00
	BRK					 ; $8D02: 00
	BRK					 ; $8D03: 00
	BRK					 ; $8D04: 00
	.byte $34			; $8D05
	.byte $34			; $8D06
	.byte $34			; $8D07
	.byte $34			; $8D08
	.byte $34			; $8D09
	.byte $34			; $8D0A
	.byte $34			; $8D0B
	.byte $34			; $8D0C
	.byte $02			; $8D0D
	.byte $02			; $8D0E
	.byte $02			; $8D0F
	.byte $02			; $8D10
	.byte $02			; $8D11
	.byte $02			; $8D12
	.byte $02			; $8D13
	.byte $02			; $8D14
	BRK					 ; $8D15: 00
	TAX					 ; $8D16: AA
	EOR $AA,X			   ; $8D17: 55 AA
	EOR $AA,X			   ; $8D19: 55 AA
	CMP $0000,X			 ; $8D1B: DD 00 00
	TAX					 ; $8D1E: AA
	EOR $AA,X			   ; $8D1F: 55 AA
	EOR $AA,X			   ; $8D21: 55 AA
	BRK					 ; $8D23: 00
	BRK					 ; $8D24: 00
	.byte $34			; $8D25
	.byte $34			; $8D26
	.byte $34			; $8D27
	LDY $14,X			   ; $8D28: B4 14
	STY $C4,X			   ; $8D2A: 94 C4
	BRK					 ; $8D2C: 00
	.byte $02			; $8D2D
	.byte $02			; $8D2E
	.byte $02			; $8D2F
	.byte $82			; $8D30
	.byte $02			; $8D31
	.byte $82			; $8D32
	BRK					 ; $8D33: 00
	BRK					 ; $8D34: 00
	.byte $3F			; $8D35
	ROR $58				 ; $8D36: 66 58
	BRK					 ; $8D38: 00
	BRK					 ; $8D39: 00
	ORA $0808			   ; $8D3A: 0D 08 08
	BRK					 ; $8D3D: 00
	ORA $7F27,Y			 ; $8D3E: 19 27 7F
	BRK					 ; $8D41: 00
	ADC $6B6A			   ; $8D42: 6D 6A 6B
	.byte $FF			; $8D45
	BMI $8D95			   ; $8D46: 30 4D
	BRK					 ; $8D48: 00
	BRK					 ; $8D49: 00
	RTS					 ; $8D4A: 60
	JSR $00A8			   ; $8D4B: 20 A8 00
	.byte $CF			; $8D4E
	.byte $B2			; $8D4F
	.byte $FF			; $8D50
	BRK					 ; $8D51: 00
	ROR					 ; $8D52: 6A
	TAX					 ; $8D53: AA
	.byte $22			; $8D54
	BIT $2F2E			   ; $8D55: 2C 2E 2F
	AND ($2D,X)			 ; $8D58: 21 2D
	.byte $2F			; $8D5A
	JSR $4C29			   ; $8D5B: 20 29 4C
	LSR $4040			   ; $8D5E: 4E 40 40
	JMP $4040			   ; $8D61: 4C 40 40
	PHA					 ; $8D64: 48
	DEY					 ; $8D65: 88
	.byte $72			; $8D66
	TXA					 ; $8D67: 8A
	.byte $FA			; $8D68
	.byte $FA			; $8D69
	.byte $02			; $8D6A
	.byte $FA			; $8D6B
	.byte $02			; $8D6C
	.byte $02			; $8D6D
	BRK					 ; $8D6E: 00
	DEY					 ; $8D6F: 88
	SED					 ; $8D70: F8
	BRK					 ; $8D71: 00
	BRK					 ; $8D72: 00
	BRK					 ; $8D73: 00
	BRK					 ; $8D74: 00
	.byte $FF			; $8D75
	BMI $8DC5			   ; $8D76: 30 4D
	BRK					 ; $8D78: 00
	BRK					 ; $8D79: 00
	ASL ptr0_lo			 ; $8D7A: 06 04
	ORA tmp0,X			  ; $8D7C: 15 00
	.byte $CF			; $8D7E
	.byte $B2			; $8D7F
	.byte $FF			; $8D80
	BRK					 ; $8D81: 00
	LSR $55,X			   ; $8D82: 56 55
	.byte $44			; $8D84
	.byte $FC			; $8D85
	ROR $1A				 ; $8D86: 66 1A
	BRK					 ; $8D88: 00
	BRK					 ; $8D89: 00
	BCS $8D9C			   ; $8D8A: B0 10
	BPL $8D8E			   ; $8D8C: 10 00
	TYA					 ; $8D8E: 98
	CPX $FE				 ; $8D8F: E4 FE
	BRK					 ; $8D91: 00
	LDX $56,Y			   ; $8D92: B6 56
	DEC ptr_hi,X			; $8D94: D6 11
	LSR $5F51			   ; $8D96: 4E 51 5F
	.byte $5F			; $8D99
	RTI					 ; $8D9A: 40
	.byte $5F			; $8D9B
	RTI					 ; $8D9C: 40
	RTI					 ; $8D9D: 40
	BRK					 ; $8D9E: 00
	ORA (system_flags),Y	; $8D9F: 11 1F
	BRK					 ; $8DA1: 00
	BRK					 ; $8DA2: 00
	BRK					 ; $8DA3: 00
	BRK					 ; $8DA4: 00
	.byte $32			; $8DA5
	.byte $72			; $8DA6
	.byte $F2			; $8DA7
	.byte $82			; $8DA8
	.byte $B2			; $8DA9
	.byte $F2			; $8DAA
	.byte $02			; $8DAB
	.byte $92			; $8DAC
	.byte $34			; $8DAD
	.byte $74			; $8DAE
	.byte $04			; $8DAF
	.byte $04			; $8DB0
	.byte $34			; $8DB1
	.byte $04			; $8DB2
	.byte $04			; $8DB3
	.byte $14			; $8DB4
	.byte $27			; $8DB5
	AND $27				 ; $8DB6: 25 27
	ROL $27				 ; $8DB8: 26 27
	.byte $2B			; $8DBA
	ROL $25				 ; $8DBB: 26 25
	RTI					 ; $8DBD: 40
	RTI					 ; $8DBE: 40
	.byte $42			; $8DBF
	.byte $42			; $8DC0
	EOR ($48,X)			 ; $8DC1: 41 48
	RTI					 ; $8DC3: 40
	EOR ($FA,X)			 ; $8DC4: 41 FA
	NOP					 ; $8DC6: EA
	.byte $1C			; $8DC7
	BNE $8D8A			   ; $8DC8: D0 C0
	RTI					 ; $8DCA: 40
	RTI					 ; $8DCB: 40
	.byte $42			; $8DCC
	INY					 ; $8DCD: C8
	PHP					 ; $8DCE: 08
	BPL $8D9D			   ; $8DCF: 10 CC
	.byte $14			; $8DD1
	.byte $14			; $8DD2
	.byte $1C			; $8DD3
	CLC					 ; $8DD4: 18
	.byte $27			; $8DD5
	.byte $27			; $8DD6
	.byte $2B			; $8DD7
	PLP					 ; $8DD8: 28
	.byte $27			; $8DD9
	JSR $002F			   ; $8DDA: 20 2F 00
	.byte $43			; $8DDD
	EOR ($48,X)			 ; $8DDE: 41 48
	PHA					 ; $8DE0: 48
	RTI					 ; $8DE1: 40
	RTI					 ; $8DE2: 40
	BRK					 ; $8DE3: 00
	BRK					 ; $8DE4: 00
	.byte $42			; $8DE5
	.byte $7A			; $8DE6
	PHP					 ; $8DE7: 08
	SED					 ; $8DE8: F8
	.byte $04			; $8DE9
	SED					 ; $8DEA: F8
	ORA (tmp0,X)			; $8DEB: 01 00
	BRK					 ; $8DED: 00
	BRK					 ; $8DEE: 00
	.byte $02			; $8DEF
	.byte $02			; $8DF0
	.byte $02			; $8DF1
	BRK					 ; $8DF2: 00
	ORA (tmp0,X)			; $8DF3: 01 00
	.byte $5F			; $8DF5
	.byte $57			; $8DF6
	SEC					 ; $8DF7: 38
	.byte $0B			; $8DF8
	.byte $03			; $8DF9
	.byte $02			; $8DFA
	.byte $02			; $8DFB
	.byte $42			; $8DFC
	.byte $13			; $8DFD
	BPL $8E08			   ; $8DFE: 10 08
	.byte $33			; $8E00
	PLP					 ; $8E01: 28
	PLP					 ; $8E02: 28
	SEC					 ; $8E03: 38
	CLC					 ; $8E04: 18
	.byte $E2			; $8E05
	LDX #$E2				; $8E06: A2 E2
	.byte $62			; $8E08
	.byte $E2			; $8E09
	.byte $D2			; $8E0A
	.byte $62			; $8E0B
	LDX #$04				; $8E0C: A2 04
	.byte $04			; $8E0E
	.byte $44			; $8E0F
	.byte $44			; $8E10
	STY $14				 ; $8E11: 84 14
	.byte $04			; $8E13
	STY $42				 ; $8E14: 84 42
	LSR $1F10,X			 ; $8E16: 5E 10 1F
	JSR $801F			   ; $8E19: 20 1F 80
	BRK					 ; $8E1C: 00
	BRK					 ; $8E1D: 00
	BRK					 ; $8E1E: 00
	RTI					 ; $8E1F: 40
	RTI					 ; $8E20: 40
	RTI					 ; $8E21: 40
	BRK					 ; $8E22: 00
	.byte $80			; $8E23
	BRK					 ; $8E24: 00
	.byte $E2			; $8E25
	.byte $E2			; $8E26
	.byte $D2			; $8E27
	.byte $12			; $8E28
	.byte $E2			; $8E29
	.byte $02			; $8E2A
	BEQ $8E2D			   ; $8E2B: F0 00
	CPY $84				 ; $8E2D: C4 84
	.byte $14			; $8E2F
	.byte $14			; $8E30
	.byte $04			; $8E31
	.byte $04			; $8E32
	.byte $04			; $8E33
	BRK					 ; $8E34: 00
	.byte $3F			; $8E35
	ROR $58				 ; $8E36: 66 58
	BRK					 ; $8E38: 00
	BRK					 ; $8E39: 00
	.byte $0C			; $8E3A
	PHP					 ; $8E3B: 08
	PHP					 ; $8E3C: 08
	BRK					 ; $8E3D: 00
	ORA $7F27,Y			 ; $8E3E: 19 27 7F
	BRK					 ; $8E41: 00
	ROR $686B			   ; $8E42: 6E 6B 68
	.byte $FF			; $8E45
	BMI $8E95			   ; $8E46: 30 4D
	BRK					 ; $8E48: 00
	BRK					 ; $8E49: 00
	RTS					 ; $8E4A: 60
	JSR $0080			   ; $8E4B: 20 80 00
	.byte $CF			; $8E4E
	.byte $B2			; $8E4F
	.byte $FF			; $8E50
	BRK					 ; $8E51: 00
	PLA					 ; $8E52: 68
	TAY					 ; $8E53: A8
	PLP					 ; $8E54: 28
	.byte $2F			; $8E55
	.byte $2F			; $8E56
	AND $2E21			   ; $8E57: 2D 21 2E
	BIT $2F21			   ; $8E5A: 2C 21 2F
	LSR $404C			   ; $8E5D: 4E 4C 40
	RTI					 ; $8E60: 40
	JMP $4040			   ; $8E61: 4C 40 40
	JMP $00C0			   ; $8E64: 4C C0 00
	PLA					 ; $8E67: 68
	INY					 ; $8E68: C8
	DEY					 ; $8E69: 88
	PHA					 ; $8E6A: 48
	DEY					 ; $8E6B: 88
	RTS					 ; $8E6C: 60
	PHP					 ; $8E6D: 08
	PHP					 ; $8E6E: 08
	RTS					 ; $8E6F: 60
	LDY #$00				; $8E70: A0 00
	JSR $6000			   ; $8E72: 20 00 60
	.byte $FF			; $8E75
	BMI $8EC5			   ; $8E76: 30 4D
	BRK					 ; $8E78: 00
	BRK					 ; $8E79: 00
	ASL ptr0_lo			 ; $8E7A: 06 04
	ORA (tmp0,X)			; $8E7C: 01 00
	.byte $CF			; $8E7E
	.byte $B2			; $8E7F
	.byte $FF			; $8E80
	BRK					 ; $8E81: 00
	ASL $15,X			   ; $8E82: 16 15
	.byte $14			; $8E84
	.byte $FC			; $8E85
	ROR $1A				 ; $8E86: 66 1A
	BRK					 ; $8E88: 00
	BRK					 ; $8E89: 00
	BMI $8E9C			   ; $8E8A: 30 10
	BPL $8E8E			   ; $8E8C: 10 00
	TYA					 ; $8E8E: 98
	CPX $FE				 ; $8E8F: E4 FE
	BRK					 ; $8E91: 00
	ROR $D6,X			   ; $8E92: 76 D6
	ASL tmp3,X			  ; $8E94: 16 03
	BRK					 ; $8E96: 00
	ASL $13,X			   ; $8E97: 16 13
	ORA ($12),Y			 ; $8E99: 11 12
	ORA ($06),Y			 ; $8E9B: 11 06
	BPL $8EAF			   ; $8E9D: 10 10
	ASL ptr0_hi			 ; $8E9F: 06 05
	BRK					 ; $8EA1: 00
	.byte $04			; $8EA2
	BRK					 ; $8EA3: 00
	ASL $F2				 ; $8EA4: 06 F2
	.byte $F2			; $8EA6
	.byte $B2			; $8EA7
	.byte $82			; $8EA8
	.byte $72			; $8EA9
	.byte $32			; $8EAA
	.byte $82			; $8EAB
	.byte $F2			; $8EAC
	.byte $74			; $8EAD
	.byte $34			; $8EAE
	.byte $04			; $8EAF
	.byte $04			; $8EB0
	.byte $34			; $8EB1
	.byte $04			; $8EB2
	.byte $04			; $8EB3
	.byte $34			; $8EB4
	AND $25				 ; $8EB5: 25 25
	ROL $27				 ; $8EB7: 26 27
	.byte $27			; $8EB9
	ROL					 ; $8EBA: 2A
	AND $27				 ; $8EBB: 25 27
	RTI					 ; $8EBD: 40
	RTI					 ; $8EBE: 40
	.byte $42			; $8EBF
	EOR ($40,X)			 ; $8EC0: 41 40
	PHA					 ; $8EC2: 48
	EOR ($43,X)			 ; $8EC3: 41 43
	INY					 ; $8EC5: C8
	BCC $8F08			   ; $8EC6: 90 40
	CPY #$C0				; $8EC8: C0 C0
	PHA					 ; $8ECA: 48
	PHA					 ; $8ECB: 48
	RTS					 ; $8ECC: 60
	LDY #$08				; $8ECD: A0 08
	BVC $8E69			   ; $8ECF: 50 98
	BPL $8ED3			   ; $8ED1: 10 00
	BRK					 ; $8ED3: 00
	PLP					 ; $8ED4: 28
	.byte $27			; $8ED5
	.byte $27			; $8ED6
	PLP					 ; $8ED7: 28
	.byte $2B			; $8ED8
	BIT $23				 ; $8ED9: 24 23
	BIT $4100			   ; $8EDB: 2C 00 41
	RTI					 ; $8EDE: 40
	PHA					 ; $8EDF: 48
	PHA					 ; $8EE0: 48
	RTI					 ; $8EE1: 40
	RTI					 ; $8EE2: 40
	BRK					 ; $8EE3: 00
	BRK					 ; $8EE4: 00
	RTI					 ; $8EE5: 40
	.byte $80			; $8EE6
	RTI					 ; $8EE7: 40
	.byte $80			; $8EE8
	EOR ($80,X)			 ; $8EE9: 41 80
	ORA $2800			   ; $8EEB: 0D 00 28
	DEY					 ; $8EEE: 88
	PLP					 ; $8EEF: 28
	PHP					 ; $8EF0: 08
	AND (tmp0),Y			; $8EF1: 31 00
	ORA $1300			   ; $8EF3: 0D 00 13
	ORA #$02				; $8EF6: 09 02
	.byte $03			; $8EF8
	.byte $03			; $8EF9
	.byte $12			; $8EFA
	.byte $12			; $8EFB
	ASL ptr0_hi			 ; $8EFC: 06 05
	BPL $8F0A			   ; $8EFE: 10 0A
	ORA $0008,Y			 ; $8F00: 19 08 00
	BRK					 ; $8F03: 00
	.byte $14			; $8F04
	LDX #$A2				; $8F05: A2 A2
	.byte $62			; $8F07
	.byte $E2			; $8F08
	.byte $E2			; $8F09
	.byte $52			; $8F0A
	LDX #$E2				; $8F0B: A2 E2
	.byte $04			; $8F0D
	.byte $04			; $8F0E
	.byte $44			; $8F0F
	STY ptr0_lo			 ; $8F10: 84 04
	.byte $14			; $8F12
	STY $C4				 ; $8F13: 84 C4
	.byte $02			; $8F15
	ORA (tmp2,X)			; $8F16: 01 02
	ORA ($42,X)			 ; $8F18: 01 42
	ORA ($D8,X)			 ; $8F1A: 01 D8
	BRK					 ; $8F1C: 00
	.byte $14			; $8F1D
	ORA ($14),Y			 ; $8F1E: 11 14
	BPL $8F6E			   ; $8F20: 10 4C
	BRK					 ; $8F22: 00
	CLD					 ; $8F23: D8
	BRK					 ; $8F24: 00
	.byte $E2			; $8F25
	.byte $E2			; $8F26
	.byte $12			; $8F27
	.byte $D2			; $8F28
	.byte $22			; $8F29
	.byte $C2			; $8F2A
	BMI $8F2D			   ; $8F2B: 30 00
	STY ptr0_lo			 ; $8F2D: 84 04
	.byte $14			; $8F2F
	.byte $14			; $8F30
	.byte $04			; $8F31
	.byte $04			; $8F32
	.byte $04			; $8F33
	BRK					 ; $8F34: 00
	.byte $3F			; $8F35
	ROR $58				 ; $8F36: 66 58
	BRK					 ; $8F38: 00
	BRK					 ; $8F39: 00
	PHP					 ; $8F3A: 08
	PHP					 ; $8F3B: 08
	ASL $1900			   ; $8F3C: 0E 00 19
	.byte $27			; $8F3F
	.byte $7F			; $8F40
	BRK					 ; $8F41: 00
	ROR					 ; $8F42: 6A
	ADC #$6F				; $8F43: 69 6F
	.byte $FF			; $8F45
	BMI $8F95			   ; $8F46: 30 4D
	BRK					 ; $8F48: 00
	BRK					 ; $8F49: 00
	BRK					 ; $8F4A: 00
	BRK					 ; $8F4B: 00
	BRK					 ; $8F4C: 00
	BRK					 ; $8F4D: 00
	.byte $CF			; $8F4E
	.byte $B2			; $8F4F
	.byte $FF			; $8F50
	BRK					 ; $8F51: 00
	RTI					 ; $8F52: 40
	RTI					 ; $8F53: 40
	RTI					 ; $8F54: 40
	ROL $282C			   ; $8F55: 2E 2C 28
	ROL $2C				 ; $8F58: 26 2C
	PLP					 ; $8F5A: 28
	ROL $2C				 ; $8F5B: 26 2C
	EOR $4049			   ; $8F5D: 4D 49 40
	.byte $44			; $8F60
	EOR #$41				; $8F61: 49 41
	EOR $48				 ; $8F63: 45 48
	BRK					 ; $8F65: 00
	BRK					 ; $8F66: 00
	BRK					 ; $8F67: 00
	BRK					 ; $8F68: 00
	BRK					 ; $8F69: 00
	BRK					 ; $8F6A: 00
	BRK					 ; $8F6B: 00
	BRK					 ; $8F6C: 00
	RTI					 ; $8F6D: 40
	RTI					 ; $8F6E: 40
	RTI					 ; $8F6F: 40
	RTI					 ; $8F70: 40
	RTI					 ; $8F71: 40
	BRK					 ; $8F72: 00
	RTI					 ; $8F73: 40
	RTI					 ; $8F74: 40
	.byte $FF			; $8F75
	BMI $8FC5			   ; $8F76: 30 4D
	BRK					 ; $8F78: 00
	BRK					 ; $8F79: 00
	BRK					 ; $8F7A: 00
	BRK					 ; $8F7B: 00
	BRK					 ; $8F7C: 00
	BRK					 ; $8F7D: 00
	.byte $CF			; $8F7E
	.byte $B2			; $8F7F
	.byte $FF			; $8F80
	BRK					 ; $8F81: 00
	.byte $02			; $8F82
	.byte $02			; $8F83
	.byte $02			; $8F84
	.byte $FC			; $8F85
	ROR $1A				 ; $8F86: 66 1A
	BRK					 ; $8F88: 00
	BRK					 ; $8F89: 00
	BPL $8F9C			   ; $8F8A: 10 10
	BVS $8F8E			   ; $8F8C: 70 00
	TYA					 ; $8F8E: 98
	CPX $FE				 ; $8F8F: E4 FE
	BRK					 ; $8F91: 00
	LSR $96,X			   ; $8F92: 56 96
	INC tmp0,X			  ; $8F94: F6 00
	BRK					 ; $8F96: 00
	BRK					 ; $8F97: 00
	BRK					 ; $8F98: 00
	BRK					 ; $8F99: 00
	BRK					 ; $8F9A: 00
	BRK					 ; $8F9B: 00
	BRK					 ; $8F9C: 00
	.byte $02			; $8F9D
	.byte $02			; $8F9E
	.byte $02			; $8F9F
	.byte $02			; $8FA0
	.byte $02			; $8FA1
	BRK					 ; $8FA2: 00
	.byte $02			; $8FA3
	.byte $02			; $8FA4
	.byte $72			; $8FA5
	.byte $32			; $8FA6
	.byte $12			; $8FA7
	.byte $62			; $8FA8
	.byte $32			; $8FA9
	.byte $12			; $8FAA
	.byte $62			; $8FAB
	.byte $32			; $8FAC
	LDY $94,X			   ; $8FAD: B4 94
	.byte $04			; $8FAF
	BIT $94				 ; $8FB0: 24 94
	STY $A4				 ; $8FB2: 84 A4
	.byte $14			; $8FB4
	BIT $26				 ; $8FB5: 24 26
	ROL $26				 ; $8FB7: 26 26
	.byte $23			; $8FB9
	AND $2627			   ; $8FBA: 2D 27 26
	EOR ($42,X)			 ; $8FBD: 41 42
	EOR ($40,X)			 ; $8FBF: 41 40
	EOR ($49,X)			 ; $8FC1: 41 49
	.byte $43			; $8FC3
	EOR (tmp0,X)			; $8FC4: 41 00
	BRK					 ; $8FC6: 00
	BRK					 ; $8FC7: 00
	BRK					 ; $8FC8: 00
	BRK					 ; $8FC9: 00
	BRK					 ; $8FCA: 00
	BRK					 ; $8FCB: 00
	BRK					 ; $8FCC: 00
	RTI					 ; $8FCD: 40
	RTI					 ; $8FCE: 40
	BRK					 ; $8FCF: 00
	RTI					 ; $8FD0: 40
	RTI					 ; $8FD1: 40
	RTI					 ; $8FD2: 40
	RTI					 ; $8FD3: 40
	RTI					 ; $8FD4: 40
	ROL $20				 ; $8FD5: 26 20
	ROL					 ; $8FD7: 2A
	BIT $2620			   ; $8FD8: 2C 20 26
	PLP					 ; $8FDB: 28
	BRK					 ; $8FDC: 00
	RTI					 ; $8FDD: 40
	EOR ($49,X)			 ; $8FDE: 41 49
	PHA					 ; $8FE0: 48
	EOR ($40,X)			 ; $8FE1: 41 40
	BRK					 ; $8FE3: 00
	BRK					 ; $8FE4: 00
	BRK					 ; $8FE5: 00
	BRK					 ; $8FE6: 00
	ORA $0A				 ; $8FE7: 05 0A
	ORA $0A,X			   ; $8FE9: 15 0A
	EOR $4000,X			 ; $8FEB: 5D 00 40
	RTI					 ; $8FEE: 40
	EOR $4A				 ; $8FEF: 45 4A
	STA $0A,X			   ; $8FF1: 95 0A
	EOR $0000,X			 ; $8FF3: 5D 00 00
	BRK					 ; $8FF6: 00
	BRK					 ; $8FF7: 00
	BRK					 ; $8FF8: 00
	BRK					 ; $8FF9: 00
	BRK					 ; $8FFA: 00
	BRK					 ; $8FFB: 00
	BRK					 ; $8FFC: 00
	.byte $02			; $8FFD
	.byte $02			; $8FFE
	BRK					 ; $8FFF: 00
	.byte $02			; $9000
	.byte $02			; $9001
	.byte $02			; $9002
	.byte $02			; $9003
	.byte $02			; $9004
	.byte $22			; $9005
	.byte $62			; $9006
	.byte $62			; $9007
	.byte $62			; $9008
	.byte $C2			; $9009
	.byte $B2			; $900A
	.byte $E2			; $900B
	.byte $62			; $900C
	STY $44				 ; $900D: 84 44
	STY ptr0_lo			 ; $900F: 84 04
	STY $94				 ; $9011: 84 94
	CPY $84				 ; $9013: C4 84
	BRK					 ; $9015: 00
	BRK					 ; $9016: 00
	RTI					 ; $9017: 40
	LDY #$50				; $9018: A0 50
	TAY					 ; $901A: A8
	CMP $0200,X			 ; $901B: DD 00 02
	.byte $02			; $901E
	.byte $42			; $901F
	LDX #$51				; $9020: A2 51
	TAY					 ; $9022: A8
	CMP $6200,X			 ; $9023: DD 00 62
	.byte $02			; $9026
	.byte $52			; $9027
	.byte $32			; $9028
	.byte $02			; $9029
	.byte $62			; $902A
	BPL $902D			   ; $902B: 10 00
	.byte $04			; $902D
	STY $94				 ; $902E: 84 94
	.byte $14			; $9030
	STY ptr0_lo			 ; $9031: 84 04
	.byte $04			; $9033
	BRK					 ; $9034: 00
	.byte $3F			; $9035
	ROR $58				 ; $9036: 66 58
	BRK					 ; $9038: 00
	BRK					 ; $9039: 00
	BRK					 ; $903A: 00
	BRK					 ; $903B: 00
	BRK					 ; $903C: 00
	BRK					 ; $903D: 00
	ORA $7F27,Y			 ; $903E: 19 27 7F
	BRK					 ; $9041: 00
	.byte $64			; $9042
	JMP ($FF6C)			 ; $9043: 6C 6C FF
	BMI $9095			   ; $9046: 30 4D
	BRK					 ; $9048: 00
	BRK					 ; $9049: 00
	BRK					 ; $904A: 00
	BRK					 ; $904B: 00
	BRK					 ; $904C: 00
	BRK					 ; $904D: 00
	.byte $CF			; $904E
	.byte $B2			; $904F
	.byte $FF			; $9050
	BRK					 ; $9051: 00
	BRK					 ; $9052: 00
	BRK					 ; $9053: 00
	BRK					 ; $9054: 00
	JSR $2020			   ; $9055: 20 20 20
	JSR $2020			   ; $9058: 20 20 20
	JSR $4C20			   ; $905B: 20 20 4C
	JMP $4C4C			   ; $905E: 4C 4C 4C
	JMP $4C4C			   ; $9061: 4C 4C 4C
	JMP $0000			   ; $9064: 4C 00 00
	BRK					 ; $9067: 00
	BRK					 ; $9068: 00
	BRK					 ; $9069: 00
	BRK					 ; $906A: 00
	BRK					 ; $906B: 00
	BRK					 ; $906C: 00
	BRK					 ; $906D: 00
	BRK					 ; $906E: 00
	BRK					 ; $906F: 00
	BRK					 ; $9070: 00
	BRK					 ; $9071: 00
	BRK					 ; $9072: 00
	BRK					 ; $9073: 00
	BRK					 ; $9074: 00
	.byte $FF			; $9075
	BMI $90C5			   ; $9076: 30 4D
	BRK					 ; $9078: 00
	BRK					 ; $9079: 00
	BRK					 ; $907A: 00
	BRK					 ; $907B: 00
	BRK					 ; $907C: 00
	BRK					 ; $907D: 00
	.byte $CF			; $907E
	.byte $B2			; $907F
	.byte $FF			; $9080
	BRK					 ; $9081: 00
	BRK					 ; $9082: 00
	BRK					 ; $9083: 00
	BRK					 ; $9084: 00
	.byte $FC			; $9085
	ROR $1A				 ; $9086: 66 1A
	BRK					 ; $9088: 00
	BRK					 ; $9089: 00
	BRK					 ; $908A: 00
	BRK					 ; $908B: 00
	BRK					 ; $908C: 00
	BRK					 ; $908D: 00
	TYA					 ; $908E: 98
	CPX $FE				 ; $908F: E4 FE
	BRK					 ; $9091: 00
	ROL $36				 ; $9092: 26 36
	ROL tmp0,X			  ; $9094: 36 00
	BRK					 ; $9096: 00
	BRK					 ; $9097: 00
	BRK					 ; $9098: 00
	BRK					 ; $9099: 00
	BRK					 ; $909A: 00
	BRK					 ; $909B: 00
	BRK					 ; $909C: 00
	BRK					 ; $909D: 00
	BRK					 ; $909E: 00
	BRK					 ; $909F: 00
	BRK					 ; $90A0: 00
	BRK					 ; $90A1: 00
	BRK					 ; $90A2: 00
	BRK					 ; $90A3: 00
	BRK					 ; $90A4: 00
	.byte $02			; $90A5
	.byte $02			; $90A6
	.byte $02			; $90A7
	.byte $02			; $90A8
	.byte $02			; $90A9
	.byte $02			; $90AA
	.byte $02			; $90AB
	.byte $02			; $90AC
	.byte $34			; $90AD
	.byte $34			; $90AE
	.byte $34			; $90AF
	.byte $34			; $90B0
	.byte $34			; $90B1
	.byte $34			; $90B2
	.byte $34			; $90B3
	.byte $34			; $90B4
	JSR $2020			   ; $90B5: 20 20 20
	JSR $2020			   ; $90B8: 20 20 20
	JSR $4C20			   ; $90BB: 20 20 4C
	JMP $4C4C			   ; $90BE: 4C 4C 4C
	JMP $4C4C			   ; $90C1: 4C 4C 4C
	JMP $0000			   ; $90C4: 4C 00 00
	BRK					 ; $90C7: 00
	BRK					 ; $90C8: 00
	BRK					 ; $90C9: 00
	BRK					 ; $90CA: 00
	BRK					 ; $90CB: 00
	BRK					 ; $90CC: 00
	BRK					 ; $90CD: 00
	BRK					 ; $90CE: 00
	BRK					 ; $90CF: 00
	BRK					 ; $90D0: 00
	BRK					 ; $90D1: 00
	BRK					 ; $90D2: 00
	BRK					 ; $90D3: 00
	BRK					 ; $90D4: 00
	JSR $2020			   ; $90D5: 20 20 20
	JSR $2021			   ; $90D8: 20 21 20
	AND (tmp0,X)			; $90DB: 21 00
	JMP $4C4C			   ; $90DD: 4C 4C 4C
	JMP $4849			   ; $90E0: 4C 49 48
	ORA (tmp0,X)			; $90E3: 01 00
	BRK					 ; $90E5: 00
	ROL					 ; $90E6: 2A
	EOR $AA,X			   ; $90E7: 55 AA
	EOR $AA,X			   ; $90E9: 55 AA
	CMP $0000,X			 ; $90EB: DD 00 00
	ROL					 ; $90EE: 2A
	EOR $AA,X			   ; $90EF: 55 AA
	EOR $AA,X			   ; $90F1: 55 AA
	CMP $0000,X			 ; $90F3: DD 00 00
	BRK					 ; $90F6: 00
	BRK					 ; $90F7: 00
	BRK					 ; $90F8: 00
	BRK					 ; $90F9: 00
	BRK					 ; $90FA: 00
	BRK					 ; $90FB: 00
	BRK					 ; $90FC: 00
	BRK					 ; $90FD: 00
	BRK					 ; $90FE: 00
	BRK					 ; $90FF: 00
	BRK					 ; $9100: 00
	BRK					 ; $9101: 00
	BRK					 ; $9102: 00
	BRK					 ; $9103: 00
	BRK					 ; $9104: 00
	.byte $02			; $9105
	.byte $02			; $9106
	.byte $02			; $9107
	.byte $02			; $9108
	.byte $02			; $9109
	.byte $02			; $910A
	.byte $02			; $910B
	.byte $02			; $910C
	.byte $34			; $910D
	.byte $34			; $910E
	.byte $34			; $910F
	.byte $34			; $9110
	.byte $34			; $9111
	.byte $34			; $9112
	.byte $34			; $9113
	.byte $34			; $9114
	BRK					 ; $9115: 00
	TAX					 ; $9116: AA
	EOR $AA,X			   ; $9117: 55 AA
	EOR $AA,X			   ; $9119: 55 AA
	CMP $0000,X			 ; $911B: DD 00 00
	TAX					 ; $911E: AA
	EOR $AA,X			   ; $911F: 55 AA
	EOR $AA,X			   ; $9121: 55 AA
	CMP $0200,X			 ; $9123: DD 00 02
	.byte $02			; $9126
	.byte $02			; $9127
	.byte $82			; $9128
	.byte $02			; $9129
	.byte $82			; $912A
	CPY #$00				; $912B: C0 00
	.byte $34			; $912D
	.byte $34			; $912E
	.byte $34			; $912F
	LDY $14,X			   ; $9130: B4 14
	STY $C4,X			   ; $9132: 94 C4
	BRK					 ; $9134: 00
	JSR $92B3			   ; $9135: 20 B3 92
	JSR $9292			   ; $9138: 20 92 92
	JSR $9227			   ; $913B: 20 27 92
	JSR $924B			   ; $913E: 20 4B 92
	JSR $FF74			   ; $9141: 20 74 FF
	JSR $91A8			   ; $9144: 20 A8 91
	BRK					 ; $9147: 00
	ASL					 ; $9148: 0A
	.byte $FB			; $9149
	LDA #$10				; $914A: A9 10
	STA $16				 ; $914C: 85 16
	JSR $917E			   ; $914E: 20 7E 91
	JSR $FF74			   ; $9151: 20 74 FF
	JSR $917E			   ; $9154: 20 7E 91
	BRK					 ; $9157: 00
	.byte $AF			; $9158
	.byte $FB			; $9159
	JSR $FF74			   ; $915A: 20 74 FF
	INC $52				 ; $915D: E6 52
	LDA $52				 ; $915F: A5 52
	CMP #$81				; $9161: C9 81
	BCC $914E			   ; $9163: 90 E9
	JSR $C5DE			   ; $9165: 20 DE C5
	LDA $52				 ; $9168: A5 52
	AND #$03				; $916A: 29 03
	BNE $9175			   ; $916C: D0 07
	LDA $16				 ; $916E: A5 16
	CLC					 ; $9170: 18
	ADC #$10				; $9171: 69 10
	STA $16				 ; $9173: 85 16
	LDA $52				 ; $9175: A5 52
	CMP #$90				; $9177: C9 90
	BCC $914E			   ; $9179: 90 D3
	JMP $FF74			   ; $917B: 4C 74 FF
	LDA $52				 ; $917E: A5 52
	CMP #$60				; $9180: C9 60
	BCS $918A			   ; $9182: B0 06
	JSR $918E			   ; $9184: 20 8E 91
	JSR $924B			   ; $9187: 20 4B 92
	JSR $93BF			   ; $918A: 20 BF 93
	RTS					 ; $918D: 60
	LDA $0508			   ; $918E: AD 08 05
	SEC					 ; $9191: 38
	SBC #$08				; $9192: E9 08
	STA $0508			   ; $9194: 8D 08 05
	BCS $91A1			   ; $9197: B0 08
	LDA $0505			   ; $9199: AD 05 05
	EOR #$01				; $919C: 49 01
	STA $0505			   ; $919E: 8D 05 05
	DEC $0509			   ; $91A1: CE 09 05
	DEC $0509			   ; $91A4: CE 09 05
	RTS					 ; $91A7: 60
	JSR $9323			   ; $91A8: 20 23 93
	JSR $9209			   ; $91AB: 20 09 92
	JSR $91C3			   ; $91AE: 20 C3 91
	JSR $91E6			   ; $91B1: 20 E6 91
	JSR $932D			   ; $91B4: 20 2D 93
	JSR $FF74			   ; $91B7: 20 74 FF
	INC $52				 ; $91BA: E6 52
	LDA $52				 ; $91BC: A5 52
	CMP #$50				; $91BE: C9 50
	BCC $91A8			   ; $91C0: 90 E6
	RTS					 ; $91C2: 60
	LDA $52				 ; $91C3: A5 52
	LSR					 ; $91C5: 4A
	BCS $91D9			   ; $91C6: B0 11
	JSR $C891			   ; $91C8: 20 91 C8
	AND #$07				; $91CB: 29 07
	STA $53				 ; $91CD: 85 53
	LDA $0508			   ; $91CF: AD 08 05
	CLC					 ; $91D2: 18
	ADC $53				 ; $91D3: 65 53
	STA $0508			   ; $91D5: 8D 08 05
	RTS					 ; $91D8: 60
	LDA $0508			   ; $91D9: AD 08 05
	SEC					 ; $91DC: 38
	SBC $53				 ; $91DD: E5 53
	STA $0508			   ; $91DF: 8D 08 05
	BRK					 ; $91E2: 00
	STA $FB,X			   ; $91E3: 95 FB
	RTS					 ; $91E5: 60
	LDY $53				 ; $91E6: A4 53
	LDA $52				 ; $91E8: A5 52
	LSR					 ; $91EA: 4A
	BCS $91F3			   ; $91EB: B0 06
	LDA $53				 ; $91ED: A5 53
	EOR #$FF				; $91EF: 49 FF
	TAY					 ; $91F1: A8
	INY					 ; $91F2: C8
	STY $54				 ; $91F3: 84 54
	LDX #$00				; $91F5: A2 00
	LDA $0203,X			 ; $91F7: BD 03 02
	CLC					 ; $91FA: 18
	ADC $54				 ; $91FB: 65 54
	STA $0203,X			 ; $91FD: 9D 03 02
	INX					 ; $9200: E8
	INX					 ; $9201: E8
	INX					 ; $9202: E8
	INX					 ; $9203: E8
	CPX #$30				; $9204: E0 30
	BCC $91F7			   ; $9206: 90 EF
	RTS					 ; $9208: 60
	JSR $9227			   ; $9209: 20 27 92
	JSR $9241			   ; $920C: 20 41 92
	JSR $924B			   ; $920F: 20 4B 92
	LDA $52				 ; $9212: A5 52
	LSR					 ; $9214: 4A
	LSR					 ; $9215: 4A
	LSR					 ; $9216: 4A
	LSR					 ; $9217: 4A
	TAY					 ; $9218: A8
	LDX $9222,Y			 ; $9219: BE 22 92
	BEQ $9221			   ; $921C: F0 03
	JSR $C90C			   ; $921E: 20 0C C9
	RTS					 ; $9221: 60
	PHP					 ; $9222: 08
	ASL tmp3				; $9223: 06 03
	BRK					 ; $9225: 00
	BRK					 ; $9226: 00
	LDA $52				 ; $9227: A5 52
	CMP #$50				; $9229: C9 50
	BCS $9240			   ; $922B: B0 13
	LDX #$00				; $922D: A2 00
	LDA $0200,X			 ; $922F: BD 00 02
	CLC					 ; $9232: 18
	ADC $51				 ; $9233: 65 51
	STA $0200,X			 ; $9235: 9D 00 02
	INX					 ; $9238: E8
	INX					 ; $9239: E8
	INX					 ; $923A: E8
	INX					 ; $923B: E8
	CPX #$30				; $923C: E0 30
	BCC $922F			   ; $923E: 90 EF
	RTS					 ; $9240: 60
	LDA $0509			   ; $9241: AD 09 05
	SEC					 ; $9244: 38
	SBC $51				 ; $9245: E5 51
	STA $0509			   ; $9247: 8D 09 05
	RTS					 ; $924A: 60
	LDA $0509			   ; $924B: AD 09 05
	AND #$07				; $924E: 29 07
	CMP #$07				; $9250: C9 07
	BNE $9291			   ; $9252: D0 3D
	LDA #$00				; $9254: A9 00
	STA tmp0				; $9256: 85 00
	STA tmp1				; $9258: 85 01
	JSR $C662			   ; $925A: 20 62 C6
	LDA $1C				 ; $925D: A5 1C
	ORA #$80				; $925F: 09 80
	STA $0300			   ; $9261: 8D 00 03
	EOR #$04				; $9264: 49 04
	STA $0323			   ; $9266: 8D 23 03
	LDA #$20				; $9269: A9 20
	STA $0301			   ; $926B: 8D 01 03
	STA $0324			   ; $926E: 8D 24 03
	LDA $1D				 ; $9271: A5 1D
	AND #$E0				; $9273: 29 E0
	STA $0302			   ; $9275: 8D 02 03
	STA $0325			   ; $9278: 8D 25 03
	LDA #$00				; $927B: A9 00
	TAX					 ; $927D: AA
	STA $0303,X			 ; $927E: 9D 03 03
	STA $0326,X			 ; $9281: 9D 26 03
	INX					 ; $9284: E8
	CPX #$20				; $9285: E0 20
	BCC $927E			   ; $9287: 90 F5
	LDA #$02				; $9289: A9 02
	STA $050B			   ; $928B: 8D 0B 05
	JSR $C626			   ; $928E: 20 26 C6
	RTS					 ; $9291: 60
	LDX #$01				; $9292: A2 01
	STX $51				 ; $9294: 86 51
	DEX					 ; $9296: CA
	STX $52				 ; $9297: 86 52
	LDA #$EF				; $9299: A9 EF
	STA $0509			   ; $929B: 8D 09 05
	LDX #$30				; $929E: A2 30
	LDA #$02				; $92A0: A9 02
	STA $0202,X			 ; $92A2: 9D 02 02
	LDA #$F7				; $92A5: A9 F7
	STA $0200,X			 ; $92A7: 9D 00 02
	INX					 ; $92AA: E8
	INX					 ; $92AB: E8
	INX					 ; $92AC: E8
	INX					 ; $92AD: E8
	CPX #$A0				; $92AE: E0 A0
	BCC $92A0			   ; $92B0: 90 EE
	RTS					 ; $92B2: 60
	LDA #$D0				; $92B3: A9 D0
	STA $49				 ; $92B5: 85 49
	LDA #$07				; $92B7: A9 07
	STA $4A				 ; $92B9: 85 4A
	LDA $9321			   ; $92BB: AD 21 93
	STA $4B				 ; $92BE: 85 4B
	LDA $9322			   ; $92C0: AD 22 93
	STA $4C				 ; $92C3: 85 4C
	LDA #$20				; $92C5: A9 20
	STA $55				 ; $92C7: 85 55
	JSR $92E5			   ; $92C9: 20 E5 92
	DEC $55				 ; $92CC: C6 55
	BNE $92C9			   ; $92CE: D0 F9
	LDA #$30				; $92D0: A9 30
	STA $060F			   ; $92D2: 8D 0F 06
	LDA #$27				; $92D5: A9 27
	STA $0610			   ; $92D7: 8D 10 06
	LDA #$17				; $92DA: A9 17
	STA $0611			   ; $92DC: 8D 11 06
	JSR $C5B9			   ; $92DF: 20 B9 C5
	JMP $FF74			   ; $92E2: 4C 74 FF
	LDA $4A				 ; $92E5: A5 4A
	ORA #$80				; $92E7: 09 80
	STA $0300			   ; $92E9: 8D 00 03
	LDA #$40				; $92EC: A9 40
	STA $0301			   ; $92EE: 8D 01 03
	LDA $49				 ; $92F1: A5 49
	STA $0302			   ; $92F3: 8D 02 03
	LDY #$00				; $92F6: A0 00
	LDA ($4B),Y			 ; $92F8: B1 4B
	STA $0303,Y			 ; $92FA: 99 03 03
	INY					 ; $92FD: C8
	CPY #$40				; $92FE: C0 40
	BCC $92F8			   ; $9300: 90 F6
	LDA #$01				; $9302: A9 01
	STA $050B			   ; $9304: 8D 0B 05
	JSR $C62D			   ; $9307: 20 2D C6
	LDA $4B				 ; $930A: A5 4B
	CLC					 ; $930C: 18
	ADC #$40				; $930D: 69 40
	STA $4B				 ; $930F: 85 4B
	BCC $9315			   ; $9311: 90 02
	INC $4C				 ; $9313: E6 4C
	LDA $49				 ; $9315: A5 49
	CLC					 ; $9317: 18
	ADC #$40				; $9318: 69 40
	STA $49				 ; $931A: 85 49
	BCC $9320			   ; $931C: 90 02
	INC $4A				 ; $931E: E6 4A
	RTS					 ; $9320: 60
	.byte $8F			; $9321
	STX $A9,Y			   ; $9322: 96 A9
	BRK					 ; $9324: 00
	STA $56				 ; $9325: 85 56
	JSR $9331			   ; $9327: 20 31 93
	JMP $FF74			   ; $932A: 4C 74 FF
	LDA #$02				; $932D: A9 02
	STA $56				 ; $932F: 85 56
	LDA $52				 ; $9331: A5 52
	CMP #$40				; $9333: C9 40
	BCC $9351			   ; $9335: 90 1A
	SBC #$40				; $9337: E9 40
	PHA					 ; $9339: 48
	ASL					 ; $933A: 0A
	ASL					 ; $933B: 0A
	ADC $56				 ; $933C: 65 56
	TAX					 ; $933E: AA
	LDA $936F,X			 ; $933F: BD 6F 93
	STA $57				 ; $9342: 85 57
	LDA $9370,X			 ; $9344: BD 70 93
	STA $58				 ; $9347: 85 58
	PLA					 ; $9349: 68
	TAX					 ; $934A: AA
	LDA $93AF,X			 ; $934B: BD AF 93
	JSR $947E			   ; $934E: 20 7E 94
	LDA $52				 ; $9351: A5 52
	CMP #$48				; $9353: C9 48
	BCC $935A			   ; $9355: 90 03
	JSR $FF74			   ; $9357: 20 74 FF
	LDA $52				 ; $935A: A5 52
	CMP #$4C				; $935C: C9 4C
	BCC $9363			   ; $935E: 90 03
	JSR $FF74			   ; $9360: 20 74 FF
	LDA $52				 ; $9363: A5 52
	CMP #$4E				; $9365: C9 4E
	BCC $936E			   ; $9367: 90 05
	LDX #$02				; $9369: A2 02
	JSR $C90C			   ; $936B: 20 0C C9
	RTS					 ; $936E: 60
	BNE $93CD			   ; $936F: D0 5C
	CLD					 ; $9371: D8
	LSR $DB,X			   ; $9372: 56 DB
	.byte $4F			; $9374
	DEC $E049,X			 ; $9375: DE 49 E0
	LSR $E0				 ; $9378: 46 E0
	RTI					 ; $937A: 40
	.byte $DF			; $937B
	.byte $3C			; $937C
	.byte $DA			; $937D
	.byte $3C			; $937E
	CLD					 ; $937F: D8
	AND $40D4,X			 ; $9380: 3D D4 40
	.byte $CF			; $9383
	.byte $44			; $9384
	DEX					 ; $9385: CA
	EOR $58C6			   ; $9386: 4D C6 58
	CMP ($62,X)			 ; $9389: C1 62
	TSX					 ; $938B: BA
	JMP ($74B6)			 ; $938C: 6C B6 74
	LDX $A77D			   ; $938F: AE 7D A7
	.byte $82			; $9392
	LDY #$89				; $9393: A0 89
	TXS					 ; $9395: 9A
	STY $8F97			   ; $9396: 8C 97 8F
	.byte $92			; $9399
	BCC $932B			   ; $939A: 90 8F
	BCC $932A			   ; $939C: 90 8C
	STA ($88),Y			 ; $939E: 91 88
	STA ($85),Y			 ; $93A0: 91 85
	.byte $92			; $93A2
	.byte $82			; $93A3
	.byte $92			; $93A4
	.byte $7F			; $93A5
	.byte $93			; $93A6
	.byte $7C			; $93A7
	.byte $93			; $93A8
	.byte $7A			; $93A9
	STY $79,X			   ; $93AA: 94 79
	STY $78,X			   ; $93AC: 94 78
	STY tmp0,X			  ; $93AE: 94 00
	BRK					 ; $93B0: 00
	BRK					 ; $93B1: 00
	BRK					 ; $93B2: 00
	ORA (tmp1,X)			; $93B3: 01 01
	.byte $02			; $93B5
	.byte $02			; $93B6
	.byte $03			; $93B7
	.byte $03			; $93B8
	.byte $04			; $93B9
	.byte $04			; $93BA
	.byte $04			; $93BB
	ASL					 ; $93BC: 0A
	ASL					 ; $93BD: 0A
	ORA #$A5				; $93BE: 09 A5
	.byte $52			; $93C0
	CMP #$56				; $93C1: C9 56
	BCS $93F8			   ; $93C3: B0 33
	SEC					 ; $93C5: 38
	SBC #$50				; $93C6: E9 50
	PHA					 ; $93C8: 48
	TAY					 ; $93C9: A8
	LDA $9472,Y			 ; $93CA: B9 72 94
	PHA					 ; $93CD: 48
	TYA					 ; $93CE: 98
	ASL					 ; $93CF: 0A
	TAY					 ; $93D0: A8
	LDA $9466,Y			 ; $93D1: B9 66 94
	STA $59				 ; $93D4: 85 59
	LDA $9467,Y			 ; $93D6: B9 67 94
	STA $5A				 ; $93D9: 85 5A
	LDA $57				 ; $93DB: A5 57
	SEC					 ; $93DD: 38
	SBC $59				 ; $93DE: E5 59
	STA $57				 ; $93E0: 85 57
	LDA $58				 ; $93E2: A5 58
	SEC					 ; $93E4: 38
	SBC $5A				 ; $93E5: E5 5A
	STA $58				 ; $93E7: 85 58
	PLA					 ; $93E9: 68
	JSR $947E			   ; $93EA: 20 7E 94
	JSR $9449			   ; $93ED: 20 49 94
	PLA					 ; $93F0: 68
	TAY					 ; $93F1: A8
	LDX $9478,Y			 ; $93F2: BE 78 94
	JMP $C90C			   ; $93F5: 4C 0C C9
	LDA #$01				; $93F8: A9 01
	STA $59				 ; $93FA: 85 59
	STA $5A				 ; $93FC: 85 5A
	LDA $52				 ; $93FE: A5 52
	CMP #$68				; $9400: C9 68
	BCC $9430			   ; $9402: 90 2C
	CMP #$78				; $9404: C9 78
	BCC $9420			   ; $9406: 90 18
	CMP #$85				; $9408: C9 85
	BCC $9418			   ; $940A: 90 0C
	DEC $59				 ; $940C: C6 59
	LDA $52				 ; $940E: A5 52
	LSR					 ; $9410: 4A
	BCC $942A			   ; $9411: 90 17
	DEC $5A				 ; $9413: C6 5A
	JMP $942A			   ; $9415: 4C 2A 94
	LDA $52				 ; $9418: A5 52
	AND #$03				; $941A: 29 03
	BEQ $9432			   ; $941C: F0 14
	BNE $940C			   ; $941E: D0 EC
	LDA $52				 ; $9420: A5 52
	LSR					 ; $9422: 4A
	BCC $942A			   ; $9423: 90 05
	DEC $59				 ; $9425: C6 59
	JMP $9430			   ; $9427: 4C 30 94
	LDA $52				 ; $942A: A5 52
	LSR					 ; $942C: 4A
	JMP $9432			   ; $942D: 4C 32 94
	LDA $52				 ; $9430: A5 52
	AND #$03				; $9432: 29 03
	ORA #$04				; $9434: 09 04
	PHA					 ; $9436: 48
	LDA $57				 ; $9437: A5 57
	SEC					 ; $9439: 38
	SBC $59				 ; $943A: E5 59
	STA $57				 ; $943C: 85 57
	LDA $58				 ; $943E: A5 58
	SEC					 ; $9440: 38
	SBC $5A				 ; $9441: E5 5A
	STA $58				 ; $9443: 85 58
	PLA					 ; $9445: 68
	JSR $947E			   ; $9446: 20 7E 94
	LDX #$00				; $9449: A2 00
	LDA $0200,X			 ; $944B: BD 00 02
	SEC					 ; $944E: 38
	SBC $5A				 ; $944F: E5 5A
	STA $0200,X			 ; $9451: 9D 00 02
	LDA $0203,X			 ; $9454: BD 03 02
	SEC					 ; $9457: 38
	SBC $59				 ; $9458: E5 59
	STA $0203,X			 ; $945A: 9D 03 02
	INX					 ; $945D: E8
	INX					 ; $945E: E8
	INX					 ; $945F: E8
	INX					 ; $9460: E8
	CPX #$30				; $9461: E0 30
	BCC $944B			   ; $9463: 90 E6
	RTS					 ; $9465: 60
	.byte $02			; $9466
	ASL					 ; $9467: 0A
	.byte $03			; $9468
	ORA ptr0_lo			 ; $9469: 05 04
	.byte $04			; $946B
	ORA tmp3				; $946C: 05 03
	.byte $03			; $946E
	.byte $02			; $946F
	ORA (tmp1,X)			; $9470: 01 01
	ORA #$08				; $9472: 09 08
	.byte $07			; $9474
	.byte $04			; $9475
	ORA $06				 ; $9476: 05 06
	.byte $04			; $9478
	.byte $03			; $9479
	.byte $03			; $947A
	.byte $02			; $947B
	.byte $02			; $947C
	.byte $02			; $947D
	CMP #$04				; $947E: C9 04
	BCS $9485			   ; $9480: B0 03
	JMP $94FE			   ; $9482: 4C FE 94
	SBC #$04				; $9485: E9 04
	STA $55				 ; $9487: 85 55
	ASL					 ; $9489: 0A
	ASL					 ; $948A: 0A
	STA $56				 ; $948B: 85 56
	ASL					 ; $948D: 0A
	ADC $56				 ; $948E: 65 56
	ASL					 ; $9490: 0A
	ADC $55				 ; $9491: 65 55
	TAX					 ; $9493: AA
	LDA $57				 ; $9494: A5 57
	STA $56				 ; $9496: 85 56
	LDA $58				 ; $9498: A5 58
	STA $55				 ; $949A: 85 55
	LDY #$00				; $949C: A0 00
	JSR $94AA			   ; $949E: 20 AA 94
	JSR $94AA			   ; $94A1: 20 AA 94
	JSR $94AA			   ; $94A4: 20 AA 94
	JSR $94AA			   ; $94A7: 20 AA 94
	LDA $55				 ; $94AA: A5 55
	STA $0230,Y			 ; $94AC: 99 30 02
	STA $0234,Y			 ; $94AF: 99 34 02
	STA $0238,Y			 ; $94B2: 99 38 02
	STA $023C,Y			 ; $94B5: 99 3C 02
	STA $0240,Y			 ; $94B8: 99 40 02
	LDA $56				 ; $94BB: A5 56
	STA $0233,Y			 ; $94BD: 99 33 02
	ADC #$08				; $94C0: 69 08
	STA $0237,Y			 ; $94C2: 99 37 02
	ADC #$08				; $94C5: 69 08
	STA $023B,Y			 ; $94C7: 99 3B 02
	ADC #$08				; $94CA: 69 08
	STA $023F,Y			 ; $94CC: 99 3F 02
	ADC #$08				; $94CF: 69 08
	STA $0243,Y			 ; $94D1: 99 43 02
	JSR $94EB			   ; $94D4: 20 EB 94
	JSR $94EB			   ; $94D7: 20 EB 94
	JSR $94EB			   ; $94DA: 20 EB 94
	JSR $94EB			   ; $94DD: 20 EB 94
	JSR $94EB			   ; $94E0: 20 EB 94
	LDA $55				 ; $94E3: A5 55
	CLC					 ; $94E5: 18
	ADC #$08				; $94E6: 69 08
	STA $55				 ; $94E8: 85 55
	RTS					 ; $94EA: 60
	LDA $95E0,X			 ; $94EB: BD E0 95
	BNE $94F5			   ; $94EE: D0 05
	LDA #$F7				; $94F0: A9 F7
	STA $0230,Y			 ; $94F2: 99 30 02
	STA $0231,Y			 ; $94F5: 99 31 02
	INY					 ; $94F8: C8
	INY					 ; $94F9: C8
	INY					 ; $94FA: C8
	INY					 ; $94FB: C8
	INX					 ; $94FC: E8
	RTS					 ; $94FD: 60
	PHA					 ; $94FE: 48
	JSR $95B9			   ; $94FF: 20 B9 95
	PLA					 ; $9502: 68
	CMP #$00				; $9503: C9 00
	BNE $951E			   ; $9505: D0 17
	LDA $57				 ; $9507: A5 57
	CLC					 ; $9509: 18
	ADC #$10				; $950A: 69 10
	STA $0233			   ; $950C: 8D 33 02
	LDA $95C9			   ; $950F: AD C9 95
	STA $0231			   ; $9512: 8D 31 02
	LDA $58				 ; $9515: A5 58
	CLC					 ; $9517: 18
	ADC #$10				; $9518: 69 10
	STA $0230			   ; $951A: 8D 30 02
	RTS					 ; $951D: 60
	CMP #$01				; $951E: C9 01
	BNE $9559			   ; $9520: D0 37
	LDA $57				 ; $9522: A5 57
	ADC #$0C				; $9524: 69 0C
	STA $0233			   ; $9526: 8D 33 02
	STA $023B			   ; $9529: 8D 3B 02
	ADC #$08				; $952C: 69 08
	STA $0237			   ; $952E: 8D 37 02
	STA $023F			   ; $9531: 8D 3F 02
	LDA $58				 ; $9534: A5 58
	ADC #$0C				; $9536: 69 0C
	STA $0230			   ; $9538: 8D 30 02
	STA $0234			   ; $953B: 8D 34 02
	ADC #$08				; $953E: 69 08
	STA $0238			   ; $9540: 8D 38 02
	STA $023C			   ; $9543: 8D 3C 02
	LDX $95CA			   ; $9546: AE CA 95
	STX $0231			   ; $9549: 8E 31 02
	INX					 ; $954C: E8
	STX $0235			   ; $954D: 8E 35 02
	INX					 ; $9550: E8
	STX $0239			   ; $9551: 8E 39 02
	INX					 ; $9554: E8
	STX $023D			   ; $9555: 8E 3D 02
	RTS					 ; $9558: 60
	CMP #$02				; $9559: C9 02
	BNE $9576			   ; $955B: D0 19
	LDA $58				 ; $955D: A5 58
	ADC #$08				; $955F: 69 08
	STA $55				 ; $9561: 85 55
	LDY #$30				; $9563: A0 30
	LDX #$02				; $9565: A2 02
	JSR $956D			   ; $9567: 20 6D 95
	JSR $956D			   ; $956A: 20 6D 95
	LDA $57				 ; $956D: A5 57
	ADC #$08				; $956F: 69 08
	STA $56				 ; $9571: 85 56
	JMP $958F			   ; $9573: 4C 8F 95
	LDA $58				 ; $9576: A5 58
	ADC #$04				; $9578: 69 04
	STA $55				 ; $957A: 85 55
	LDY #$30				; $957C: A0 30
	LDX #$0B				; $957E: A2 0B
	JSR $9586			   ; $9580: 20 86 95
	JSR $9586			   ; $9583: 20 86 95
	LDA $57				 ; $9586: A5 57
	ADC #$04				; $9588: 69 04
	STA $56				 ; $958A: 85 56
	JSR $959F			   ; $958C: 20 9F 95
	JSR $959F			   ; $958F: 20 9F 95
	JSR $959F			   ; $9592: 20 9F 95
	JSR $959F			   ; $9595: 20 9F 95
	LDA $55				 ; $9598: A5 55
	ADC #$08				; $959A: 69 08
	STA $55				 ; $959C: 85 55
	RTS					 ; $959E: 60
	LDA $55				 ; $959F: A5 55
	STA $0200,Y			 ; $95A1: 99 00 02
	LDA $95C9,X			 ; $95A4: BD C9 95
	STA $0201,Y			 ; $95A7: 99 01 02
	LDA $56				 ; $95AA: A5 56
	STA $0203,Y			 ; $95AC: 99 03 02
	ADC #$08				; $95AF: 69 08
	STA $56				 ; $95B1: 85 56
	INX					 ; $95B3: E8
	INY					 ; $95B4: C8
	INY					 ; $95B5: C8
	INY					 ; $95B6: C8
	INY					 ; $95B7: C8
	RTS					 ; $95B8: 60
	LDX #$30				; $95B9: A2 30
	LDA #$F7				; $95BB: A9 F7
	STA $0200,X			 ; $95BD: 9D 00 02
	INX					 ; $95C0: E8
	INX					 ; $95C1: E8
	INX					 ; $95C2: E8
	INX					 ; $95C3: E8
	CPX #$A0				; $95C4: E0 A0
	BCC $95BD			   ; $95C6: 90 F5
	RTS					 ; $95C8: 60
	ADC $827E,X			 ; $95C9: 7D 7E 82
	.byte $83			; $95CC
	STY $85				 ; $95CD: 84 85
	STX $87				 ; $95CF: 86 87
	DEY					 ; $95D1: 88
	.byte $89			; $95D2
	TXA					 ; $95D3: 8A
	.byte $8B			; $95D4
	STY $8E8D			   ; $95D5: 8C 8D 8E
	.byte $8F			; $95D8
	BCC $956C			   ; $95D9: 90 91
	.byte $92			; $95DB
	.byte $93			; $95DC
	STY $95,X			   ; $95DD: 94 95
	STX $97,Y			   ; $95DF: 96 97
	TYA					 ; $95E1: 98
	STA $009A,Y			 ; $95E2: 99 9A 00
	.byte $9B			; $95E5
	.byte $9C			; $95E6
	STA $009E,X			 ; $95E7: 9D 9E 00
	BRK					 ; $95EA: 00
	.byte $9F			; $95EB
	LDY #$A1				; $95EC: A0 A1
	BRK					 ; $95EE: 00
	LDX #$A3				; $95EF: A2 A3
	LDY $A5				 ; $95F1: A4 A5
	LDX $A7				 ; $95F3: A6 A7
	TAY					 ; $95F5: A8
	LDA #$AA				; $95F6: A9 AA
	.byte $AB			; $95F8
	LDY $0000			   ; $95F9: AC 00 00
	BRK					 ; $95FC: 00
	BRK					 ; $95FD: 00
	LDA $AFAE			   ; $95FE: AD AE AF
	BCS $95B4			   ; $9601: B0 B1
	.byte $B2			; $9603
	.byte $B3			; $9604
	LDY $B5,X			   ; $9605: B4 B5
	LDX $A2,Y			   ; $9607: B6 A2
	.byte $A3			; $9609
	LDY $A5				 ; $960A: A4 A5
	.byte $B7			; $960C
	.byte $A7			; $960D
	TAY					 ; $960E: A8
	LDA #$B8				; $960F: A9 B8
	LDA $0000,Y			 ; $9611: B9 00 00
	BRK					 ; $9614: 00
	BRK					 ; $9615: 00
	BRK					 ; $9616: 00
	BRK					 ; $9617: 00
	BRK					 ; $9618: 00
	BRK					 ; $9619: 00
	BRK					 ; $961A: 00
	BRK					 ; $961B: 00
	TSX					 ; $961C: BA
	.byte $BB			; $961D
	LDY $00BD,X			 ; $961E: BC BD 00
	LDX $BFA3,Y			 ; $9621: BE A3 BF
	CPY #$C1				; $9624: C0 C1
	.byte $C2			; $9626
	TAY					 ; $9627: A8
	LDA #$C3				; $9628: A9 C3
	CPY tmp0				; $962A: C4 00
	BRK					 ; $962C: 00
	BRK					 ; $962D: 00
	BRK					 ; $962E: 00
	BRK					 ; $962F: 00
	CMP $C6				 ; $9630: C5 C6
	.byte $C7			; $9632
	INY					 ; $9633: C8
	CMP #$CA				; $9634: C9 CA
	.byte $CB			; $9636
	LDY $CC,X			   ; $9637: B4 CC
	CMP $A3CE			   ; $9639: CD CE A3
	LDY $CF				 ; $963C: A4 CF
	BNE $95E7			   ; $963E: D0 A7
	TAY					 ; $9640: A8
	LDA #$D1				; $9641: A9 D1
	.byte $D2			; $9643
	BRK					 ; $9644: 00
	BRK					 ; $9645: 00
	BRK					 ; $9646: 00
	BRK					 ; $9647: 00
	BRK					 ; $9648: 00
	.byte $D3			; $9649
	.byte $D4			; $964A
	CMP $BD,X			   ; $964B: D5 BD
	BRK					 ; $964D: 00
	DEC $D7,X			   ; $964E: D6 D7
	CLD					 ; $9650: D8
	CPY #$C1				; $9651: C0 C1
	CMP $DBDA,Y			 ; $9653: D9 DA DB
	.byte $DC			; $9656
	CMP $DFDE,X			 ; $9657: DD DE DF
	CPX #$E1				; $965A: E0 E1
	.byte $E2			; $965C
	BRK					 ; $965D: 00
	.byte $E3			; $965E
	CPX $E5				 ; $965F: E4 E5
	INC $A2				 ; $9661: E6 A2
	.byte $E7			; $9663
	INX					 ; $9664: E8
	SBC #$EA				; $9665: E9 EA
	.byte $EB			; $9667
	CPX $EEED			   ; $9668: EC ED EE
	.byte $EF			; $966B
	BEQ $965F			   ; $966C: F0 F1
	.byte $F2			; $966E
	.byte $F3			; $966F
	.byte $F4			; $9670
	SBC $F6,X			   ; $9671: F5 F6
	.byte $F7			; $9673
	SED					 ; $9674: F8
	BRK					 ; $9675: 00
	BRK					 ; $9676: 00
	BRK					 ; $9677: 00
	BRK					 ; $9678: 00
	BRK					 ; $9679: 00
	BRK					 ; $967A: 00
	.byte $D3			; $967B
	.byte $D4			; $967C
	CMP $BD,X			   ; $967D: D5 BD
	BRK					 ; $967F: 00
	DEC $D7,X			   ; $9680: D6 D7
	CLD					 ; $9682: D8
	CPY #$C1				; $9683: C0 C1
	CMP $DBDA,Y			 ; $9685: D9 DA DB
	.byte $DC			; $9688
	CMP $FAF9,X			 ; $9689: DD F9 FA
	.byte $FB			; $968C
	.byte $FC			; $968D
	.byte $E2			; $968E
	BRK					 ; $968F: 00
	BRK					 ; $9690: 00
	.byte $82			; $9691
	.byte $44			; $9692
	CLC					 ; $9693: 18
	JSR $0040			   ; $9694: 20 40 00
	BRK					 ; $9697: 00
	.byte $83			; $9698
	DEC $7C				 ; $9699: C6 7C
	SEC					 ; $969B: 38
	.byte $64			; $969C
	.byte $C2			; $969D
	BRK					 ; $969E: 00
	BRK					 ; $969F: 00
	BRK					 ; $96A0: 00
	BRK					 ; $96A1: 00
	BRK					 ; $96A2: 00
	RTI					 ; $96A3: 40
	BIT $18				 ; $96A4: 24 18
	.byte $04			; $96A6
	BRK					 ; $96A7: 00
	BRK					 ; $96A8: 00
	.byte $80			; $96A9
	RTS					 ; $96AA: 60
	SEI					 ; $96AB: 78
	AND $061A,X			 ; $96AC: 3D 1A 06
	BRK					 ; $96AF: 00
	BRK					 ; $96B0: 00
	BRK					 ; $96B1: 00
	BRK					 ; $96B2: 00
	.byte $1C			; $96B3
	SEC					 ; $96B4: 38
	RTI					 ; $96B5: 40
	.byte $80			; $96B6
	BRK					 ; $96B7: 00
	BRK					 ; $96B8: 00
	BRK					 ; $96B9: 00
	.byte $1C			; $96BA
	.byte $3F			; $96BB
	ROR $B0C8,X			 ; $96BC: 7E C8 B0
	ASL $07,X			   ; $96BF: 16 07
	ROL $0619			   ; $96C1: 2E 19 06
	BRK					 ; $96C4: 00
	BRK					 ; $96C5: 00
	BRK					 ; $96C6: 00
	.byte $03			; $96C7
	.byte $1F			; $96C8
	.byte $3A			; $96C9
	AND ($66,X)			 ; $96CA: 21 66
	BRK					 ; $96CC: 00
	BRK					 ; $96CD: 00
	BRK					 ; $96CE: 00
	BMI $96E1			   ; $96CF: 30 10
	RTI					 ; $96D1: 40
	RTS					 ; $96D2: 60
	BRK					 ; $96D3: 00
	BRK					 ; $96D4: 00
	BRK					 ; $96D5: 00
	BRK					 ; $96D6: 00
	SEI					 ; $96D7: 78
	SED					 ; $96D8: F8
	ROR					 ; $96D9: 6A
	ADC $C0				 ; $96DA: 65 C0
	BRK					 ; $96DC: 00
	BRK					 ; $96DD: 00
	BRK					 ; $96DE: 00
	BRK					 ; $96DF: 00
	BRK					 ; $96E0: 00
	RTI					 ; $96E1: 40
	TYA					 ; $96E2: 98
	JSR $205C			   ; $96E3: 20 5C 20
	.byte $14			; $96E6
	.byte $80			; $96E7
	CPY #$E0				; $96E8: C0 E0
	SED					 ; $96EA: F8
	ROR $3C7C,X			 ; $96EB: 7E 7C 3C
	ROL $0000,X			 ; $96EE: 3E 00 00
	BRK					 ; $96F1: 00
	BRK					 ; $96F2: 00
	BRK					 ; $96F3: 00
	BRK					 ; $96F4: 00
	BRK					 ; $96F5: 00
	ORA (tmp0,X)			; $96F6: 01 00
	BRK					 ; $96F8: 00
	BRK					 ; $96F9: 00
	BRK					 ; $96FA: 00
	ORA (tmp1,X)			; $96FB: 01 01
	.byte $03			; $96FD
	.byte $03			; $96FE
	BRK					 ; $96FF: 00
	BRK					 ; $9700: 00
	BRK					 ; $9701: 00
	ORA (tmp2,X)			; $9702: 01 02
	.byte $04			; $9704
	STY $00F8			   ; $9705: 8C F8 00
	BRK					 ; $9708: 00
	ORA ($07,X)			 ; $9709: 01 07
	ASL $FCDE			   ; $970B: 0E DE FC
	.byte $FC			; $970E
	PHP					 ; $970F: 08
	.byte $07			; $9710
	ASL tmp2				; $9711: 06 02
	BRK					 ; $9713: 00
	.byte $03			; $9714
	ORA $0E				 ; $9715: 05 0E
	.byte $0F			; $9717
	.byte $07			; $9718
	ASL tmp2				; $9719: 06 02
	ORA (tmp1,X)			; $971B: 01 01
	BRK					 ; $971D: 00
	ASL $2391			   ; $971E: 0E 91 23
	ASL $48				 ; $9721: 06 48
	SBC ($E0,X)			 ; $9723: E1 E0
	.byte $80			; $9725
	.byte $12			; $9726
	.byte $B7			; $9727
	.byte $6F			; $9728
	.byte $DF			; $9729
	CLD					 ; $972A: D8
	SBC $7A				 ; $972B: E5 7A
	TXS					 ; $972D: 9A
	ROR $B0,X			   ; $972E: 76 B0
	BRK					 ; $9730: 00
	BRK					 ; $9731: 00
	BRK					 ; $9732: 00
	.byte $80			; $9733
	CPY #$80				; $9734: C0 80
	CPY #$F8				; $9736: C0 F8
	BEQ $975A			   ; $9738: F0 20
	BRK					 ; $973A: 00
	.byte $80			; $973B
	CPY #$C0				; $973C: C0 C0
	.byte $E2			; $973E
	ORA ($4B),Y			 ; $973F: 11 4B
	.byte $42			; $9741
	ADC $30				 ; $9742: 65 30
	BRK					 ; $9744: 00
	BRK					 ; $9745: 00
	BRK					 ; $9746: 00
	ASL $3C08,X			 ; $9747: 1E 08 3C
	EOR $0070,Y			 ; $974A: 59 70 00
	BRK					 ; $974D: 00
	BRK					 ; $974E: 00
	.byte $44			; $974F
	BRK					 ; $9750: 00
	INY					 ; $9751: C8
	TYA					 ; $9752: 98
	BRK					 ; $9753: 00
	BRK					 ; $9754: 00
	BRK					 ; $9755: 00
	BRK					 ; $9756: 00
	JMP ($CC00)			 ; $9757: 6C 00 CC
	TYA					 ; $975A: 98
	BRK					 ; $975B: 00
	BRK					 ; $975C: 00
	BRK					 ; $975D: 00
	BRK					 ; $975E: 00
	RTI					 ; $975F: 40
	RTI					 ; $9760: 40
	JSR $0000			   ; $9761: 20 00 00
	BRK					 ; $9764: 00
	BRK					 ; $9765: 00
	BRK					 ; $9766: 00
	.byte $64			; $9767
	.byte $64			; $9768
	SEC					 ; $9769: 38
	BRK					 ; $976A: 00
	BRK					 ; $976B: 00
	BRK					 ; $976C: 00
	BRK					 ; $976D: 00
	BRK					 ; $976E: 00
	BRK					 ; $976F: 00
	RTI					 ; $9770: 40
	BMI $9781			   ; $9771: 30 0E
	.byte $0B			; $9773
	.byte $04			; $9774
	ASL ptr0_hi			 ; $9775: 06 05
	.byte $80			; $9777
	SED					 ; $9778: F8
	ROR $1F3F,X			 ; $9779: 7E 3F 1F
	.byte $0F			; $977C
	.byte $1F			; $977D
	.byte $0F			; $977E
	BRK					 ; $977F: 00
	BRK					 ; $9780: 00
	BRK					 ; $9781: 00
	BRK					 ; $9782: 00
	BRK					 ; $9783: 00
	BRK					 ; $9784: 00
	.byte $80			; $9785
	JSR $0000			   ; $9786: 20 00 00
	BRK					 ; $9789: 00
	.byte $80			; $978A
	BRK					 ; $978B: 00
	BRK					 ; $978C: 00
	.byte $80			; $978D
	CPX $0000			   ; $978E: EC 00 00
	BRK					 ; $9791: 00
	BRK					 ; $9792: 00
	BRK					 ; $9793: 00
	BRK					 ; $9794: 00
	BPL $97D3			   ; $9795: 10 3C
	BRK					 ; $9797: 00
	BRK					 ; $9798: 00
	BRK					 ; $9799: 00
	BRK					 ; $979A: 00
	BRK					 ; $979B: 00
	BMI $981C			   ; $979C: 30 7E
	.byte $FF			; $979E
	BRK					 ; $979F: 00
	BRK					 ; $97A0: 00
	BRK					 ; $97A1: 00
	BRK					 ; $97A2: 00
	PHP					 ; $97A3: 08
	BPL $97C6			   ; $97A4: 10 20
	RTS					 ; $97A6: 60
	BRK					 ; $97A7: 00
	BRK					 ; $97A8: 00
	BRK					 ; $97A9: 00
	.byte $0C			; $97AA
	CLC					 ; $97AB: 18
	SEC					 ; $97AC: 38
	BVS $978F			   ; $97AD: 70 E0
	.byte $02			; $97AF
	ORA (tmp1,X)			; $97B0: 01 01
	BRK					 ; $97B2: 00
	ORA (tmp3,X)			; $97B3: 01 03
	ASL $0A				 ; $97B5: 06 0A
	.byte $03			; $97B7
	ORA (tmp1,X)			; $97B8: 01 01
	BRK					 ; $97BA: 00
	BRK					 ; $97BB: 00
	.byte $03			; $97BC
	.byte $07			; $97BD
	.byte $02			; $97BE
	CPY #$80				; $97BF: C0 80
	AND ($F0),Y			 ; $97C1: 31 F0
	BVS $9765			   ; $97C3: 70 A0
	JMP ($DBE4)			 ; $97C5: 6C E4 DB
	.byte $B7			; $97C8
	.byte $37			; $97C9
	RTI					 ; $97CA: 40
	ASL $EF,X			   ; $97CB: 16 EF
	.byte $EF			; $97CD
	.byte $47			; $97CE
	.byte $7F			; $97CF
	.byte $E3			; $97D0
	STY $91,X			   ; $97D1: 94 91
	.byte $0C			; $97D3
	ROR $2A33			   ; $97D4: 6E 33 2A
	.byte $FF			; $97D7
	.byte $FF			; $97D8
	.byte $FF			; $97D9
	.byte $F3			; $97DA
	ORA $B36E			   ; $97DB: 0D 6E B3
	.byte $BB			; $97DE
	CPY #$00				; $97DF: C0 00
	.byte $80			; $97E1
	BRK					 ; $97E2: 00
	BRK					 ; $97E3: 00
	BRK					 ; $97E4: 00
	BRK					 ; $97E5: 00
	BRK					 ; $97E6: 00
	CPX #$C0				; $97E7: E0 C0
	.byte $80			; $97E9
	BRK					 ; $97EA: 00
	BRK					 ; $97EB: 00
	BRK					 ; $97EC: 00
	BRK					 ; $97ED: 00
	BRK					 ; $97EE: 00
	.byte $3F			; $97EF
	AND $1E3B,X			 ; $97F0: 3D 3B 1E
	BRK					 ; $97F3: 00
	BRK					 ; $97F4: 00
	ORA (tmp1,X)			; $97F5: 01 01
	.byte $12			; $97F7
	.byte $0F			; $97F8
	ROL $001C			   ; $97F9: 2E 1C 00
	BRK					 ; $97FC: 00
	ORA (tmp1,X)			; $97FD: 01 01
	.byte $F2			; $97FF
	SBC ($C8),Y			 ; $9800: F1 C8
	BIT $6014			   ; $9802: 2C 14 60
	CMP (tmp1,X)			; $9805: C1 01
	.byte $43			; $9807
	STA $0E				 ; $9808: 85 0E
	.byte $2F			; $980A
	ASL $60,X			   ; $980B: 16 60
	CMP ($41,X)			 ; $980D: C1 41
	.byte $42			; $980F
	.byte $42			; $9810
	DEC $06				 ; $9811: C6 06
	.byte $03			; $9813
	EOR ($C0,X)			 ; $9814: 41 C0
	BRK					 ; $9816: 00
	.byte $7B			; $9817
	.byte $7B			; $9818
	.byte $F7			; $9819
	.byte $67			; $981A
	.byte $13			; $981B
	ADC ($E0),Y			 ; $981C: 71 E0
	RTI					 ; $981E: 40
	BRK					 ; $981F: 00
	BRK					 ; $9820: 00
	BPL $9823			   ; $9821: 10 00
	JSR $00C0			   ; $9823: 20 C0 00
	BRK					 ; $9826: 00
	BRK					 ; $9827: 00
	CLC					 ; $9828: 18
	.byte $34			; $9829
	.byte $64			; $982A
	CPX #$C0				; $982B: E0 C0
	BRK					 ; $982D: 00
	BRK					 ; $982E: 00
	BRK					 ; $982F: 00
	BRK					 ; $9830: 00
	BRK					 ; $9831: 00
	BRK					 ; $9832: 00
	BRK					 ; $9833: 00
	BRK					 ; $9834: 00
	BRK					 ; $9835: 00
	.byte $02			; $9836
	BRK					 ; $9837: 00
	BRK					 ; $9838: 00
	BRK					 ; $9839: 00
	BRK					 ; $983A: 00
	BRK					 ; $983B: 00
	BRK					 ; $983C: 00
	BRK					 ; $983D: 00
	.byte $03			; $983E
	BRK					 ; $983F: 00
	BRK					 ; $9840: 00
	BRK					 ; $9841: 00
	ORA (ptr0_lo,X)		 ; $9842: 01 04
	.byte $13			; $9844
	EOR $00B3			   ; $9845: 4D B3 00
	BRK					 ; $9848: 00
	BRK					 ; $9849: 00
	.byte $03			; $984A
	.byte $0C			; $984B
	.byte $33			; $984C
	.byte $CF			; $984D
	.byte $BF			; $984E
	BRK					 ; $984F: 00
	JSR $4000			   ; $9850: 20 00 40
	.byte $80			; $9853
	.byte $82			; $9854
	STA $AB,X			   ; $9855: 95 AB
	BRK					 ; $9857: 00
	RTS					 ; $9858: 60
	.byte $80			; $9859
	RTI					 ; $985A: 40
	STA ($86,X)			 ; $985B: 81 86
	STA $01BB,X			 ; $985D: 9D BB 01
	BRK					 ; $9860: 00
	ASL					 ; $9861: 0A
	BIT $98				 ; $9862: 24 98
	RTS					 ; $9864: 60
	.byte $80			; $9865
	CLC					 ; $9866: 18
	.byte $03			; $9867
	.byte $04			; $9868
	.byte $1A			; $9869
	.byte $64			; $986A
	.byte $9C			; $986B
	.byte $7C			; $986C
	.byte $FC			; $986D
	SED					 ; $986E: F8
	ORA $08				 ; $986F: 05 08
	.byte $04			; $9871
	.byte $02			; $9872
	.byte $02			; $9873
	BRK					 ; $9874: 00
	ORA (tmp1,X)			; $9875: 01 01
	.byte $07			; $9877
	ASL $0307			   ; $9878: 0E 07 03
	.byte $03			; $987B
	ORA (tmp1,X)			; $987C: 01 01
	ORA ($63,X)			 ; $987E: 01 63
	.byte $CF			; $9880
	.byte $5F			; $9881
	.byte $4F			; $9882
	.byte $67			; $9883
	.byte $3F			; $9884
	.byte $27			; $9885
	.byte $3F			; $9886
	.byte $7F			; $9887
	.byte $FF			; $9888
	.byte $7F			; $9889
	.byte $7F			; $988A
	.byte $7F			; $988B
	.byte $BF			; $988C
	.byte $BF			; $988D
	.byte $BF			; $988E
	LSR $23				 ; $988F: 46 23
	.byte $12			; $9891
	.byte $93			; $9892
	.byte $92			; $9893
	.byte $D3			; $9894
	.byte $D2			; $9895
	.byte $89			; $9896
	.byte $77			; $9897
	.byte $3B			; $9898
	.byte $1B			; $9899
	.byte $9B			; $989A
	.byte $9B			; $989B
	.byte $DB			; $989C
	.byte $DB			; $989D
	STA $8060			   ; $989E: 8D 60 80
	RTS					 ; $98A1: 60
	CLC					 ; $98A2: 18
	STX $60				 ; $98A3: 86 60
	TYA					 ; $98A5: 98
	RTS					 ; $98A6: 60
	SED					 ; $98A7: F8
	SED					 ; $98A8: F8
	.byte $FC			; $98A9
	.byte $FC			; $98AA
	INC $FCFE,X			 ; $98AB: FE FE FC
	SED					 ; $98AE: F8
	.byte $3F			; $98AF
	.byte $9E			; $98B0
	CMP $67DB,X			 ; $98B1: DD DB 67
	ADC $E8,X			   ; $98B4: 75 E8
	.byte $5C			; $98B6
	.byte $BF			; $98B7
	DEC $DBDD,X			 ; $98B8: DE DD DB
	.byte $67			; $98BB
	.byte $F7			; $98BC
	.byte $EF			; $98BD
	.byte $5F			; $98BE
	.byte $89			; $98BF
	ADC #$D9				; $98C0: 69 D9
	LDA ($63),Y			 ; $98C2: B1 63
	.byte $7B			; $98C4
	.byte $83			; $98C5
	LDY #$8D				; $98C6: A0 8D
	ADC $BDDD			   ; $98C8: 6D DD BD
	.byte $7B			; $98CB
	.byte $7B			; $98CC
	.byte $83			; $98CD
	CLV					 ; $98CE: B8
	CLC					 ; $98CF: 18
	.byte $80			; $98D0
	BVS $9873			   ; $98D1: 70 A0
	CPY #$B0				; $98D3: C0 B0
	CLC					 ; $98D5: 18
	CLD					 ; $98D6: D8
	SED					 ; $98D7: F8
	BEQ $98CA			   ; $98D8: F0 F0
	CPX #$C0				; $98DA: E0 C0
	LDY $DF1F,X			 ; $98DC: BC 1F DF
	BRK					 ; $98DF: 00
	BRK					 ; $98E0: 00
	ORA (tmp3,X)			; $98E1: 01 03
	ASL ptr0_hi			 ; $98E3: 06 05
	ASL					 ; $98E5: 0A
	ORA $0000			   ; $98E6: 0D 00 00
	BRK					 ; $98E9: 00
	.byte $03			; $98EA
	.byte $07			; $98EB
	.byte $07			; $98EC
	.byte $02			; $98ED
	BRK					 ; $98EE: 00
	.byte $33			; $98EF
	CMP $F7BA			   ; $98F0: CD BA F7
	TXS					 ; $98F3: 9A
	.byte $54			; $98F4
	LDA #$9A				; $98F5: A9 9A
	.byte $33			; $98F7
	ORA (tmp2,X)			; $98F8: 01 02
	.byte $E7			; $98FA
	.byte $FA			; $98FB
	.byte $74			; $98FC
	AND $4132,Y			 ; $98FD: 39 32 41
	ADC ($70,X)			 ; $9900: 61 70
	PLP					 ; $9902: 28
	CLD					 ; $9903: D8
	STX $E955			   ; $9904: 8E 55 E9
	ADC $7E7D,X			 ; $9907: 7D 7D 7E
	ROL $8EDE			   ; $990A: 2E DE 8E
	ADC $F9,X			   ; $990D: 75 F9
	CPX $86CE			   ; $990F: EC CE 86
	.byte $82			; $9912
	.byte $82			; $9913
	.byte $82			; $9914
	ASL					 ; $9915: 0A
	ASL					 ; $9916: 0A
	.byte $EF			; $9917
	.byte $EF			; $9918
	.byte $F7			; $9919
	.byte $FB			; $991A
	.byte $FB			; $991B
	.byte $FB			; $991C
	.byte $FB			; $991D
	.byte $FB			; $991E
	BRK					 ; $991F: 00
	BRK					 ; $9920: 00
	BRK					 ; $9921: 00
	BRK					 ; $9922: 00
	BRK					 ; $9923: 00
	BRK					 ; $9924: 00
	BRK					 ; $9925: 00
	BRK					 ; $9926: 00
	.byte $80			; $9927
	CPY #$C0				; $9928: C0 C0
	CPY #$C0				; $992A: C0 C0
	CPY #$C0				; $992C: C0 C0
	CPY #$2F				; $992E: C0 2F
	ROL $6718,X			 ; $9930: 3E 18 67
	.byte $4F			; $9933
	.byte $3C			; $9934
	BRK					 ; $9935: 00
	ORA ($0F,X)			 ; $9936: 01 0F
	.byte $0F			; $9938
	.byte $2F			; $9939
	.byte $77			; $993A
	JMP $0038			   ; $993B: 4C 38 00
	BRK					 ; $993E: 00
	TSX					 ; $993F: BA
	.byte $7A			; $9940
	.byte $F4			; $9941
	.byte $82			; $9942
	ASL $F83E			   ; $9943: 0E 3E F8
	BVC $992A			   ; $9946: 50 E2
	.byte $C2			; $9948
	STY tmp2				; $9949: 84 02
	ASL $F83C			   ; $994B: 0E 3C F8
	BRK					 ; $994E: 00
	STA $20				 ; $994F: 85 20
	DEY					 ; $9951: 88
	JSR $0300			   ; $9952: 20 00 03
	ASL					 ; $9955: 0A
	ORA $1D,X			   ; $9956: 15 1D
	.byte $34			; $9958
	JMP ($0018)			 ; $9959: 6C 18 00
	.byte $03			; $995C
	.byte $0F			; $995D
	BRK					 ; $995E: 00
	.byte $92			; $995F
	.byte $E2			; $9960
	.byte $12			; $9961
	.byte $72			; $9962
	LDA ($61,X)			 ; $9963: A1 61
	.byte $80			; $9965
	BRK					 ; $9966: 00
	.byte $F3			; $9967
	.byte $E3			; $9968
	.byte $13			; $9969
	.byte $73			; $996A
	SBC ($C1,X)			 ; $996B: E1 C1
	.byte $80			; $996D
	BRK					 ; $996E: 00
	BRK					 ; $996F: 00
	BRK					 ; $9970: 00
	BRK					 ; $9971: 00
	BRK					 ; $9972: 00
	BPL $9975			   ; $9973: 10 00
	CPX #$00				; $9975: E0 00
	.byte $80			; $9977
	DEY					 ; $9978: 88
	DEY					 ; $9979: 88
	DEY					 ; $997A: 88
	TYA					 ; $997B: 98
	BEQ $995E			   ; $997C: F0 E0
	BRK					 ; $997E: 00
	BRK					 ; $997F: 00
	BRK					 ; $9980: 00
	BRK					 ; $9981: 00
	BRK					 ; $9982: 00
	BPL $998D			   ; $9983: 10 08
	.byte $04			; $9985
	.byte $04			; $9986
	BRK					 ; $9987: 00
	BRK					 ; $9988: 00
	BRK					 ; $9989: 00
	RTI					 ; $998A: 40
	CLI					 ; $998B: 58
	BIT $1616			   ; $998C: 2C 16 16
	BIT $09				 ; $998F: 24 09
	LSR $2449			   ; $9991: 4E 49 24
	.byte $22			; $9994
	ORA (ptr0_lo),Y		 ; $9995: 11 04
	.byte $37			; $9997
	.byte $2F			; $9998
	.byte $6F			; $9999
	.byte $6F			; $999A
	.byte $37			; $999B
	.byte $3B			; $999C
	ORA $001E,X			 ; $999D: 1D 1E 00
	.byte $80			; $99A0
	RTS					 ; $99A1: 60
	.byte $80			; $99A2
	JSR $20C0			   ; $99A3: 20 C0 20
	TYA					 ; $99A6: 98
	BRK					 ; $99A7: 00
	CPY #$E0				; $99A8: C0 E0
	BEQ $998C			   ; $99AA: F0 E0
	CPX #$F0				; $99AC: E0 F0
	SED					 ; $99AE: F8
	BRK					 ; $99AF: 00
	BRK					 ; $99B0: 00
	BRK					 ; $99B1: 00
	BRK					 ; $99B2: 00
	BRK					 ; $99B3: 00
	BRK					 ; $99B4: 00
	BRK					 ; $99B5: 00
	BRK					 ; $99B6: 00
	BRK					 ; $99B7: 00
	BRK					 ; $99B8: 00
	BRK					 ; $99B9: 00
	BRK					 ; $99BA: 00
	BRK					 ; $99BB: 00
	BRK					 ; $99BC: 00
	ORA (tmp3,X)			; $99BD: 01 03
	BRK					 ; $99BF: 00
	BRK					 ; $99C0: 00
	BRK					 ; $99C1: 00
	BRK					 ; $99C2: 00
	BRK					 ; $99C3: 00
	SEI					 ; $99C4: 78
	.byte $C7			; $99C5
	CLV					 ; $99C6: B8
	BRK					 ; $99C7: 00
	BRK					 ; $99C8: 00
	BRK					 ; $99C9: 00
	RTS					 ; $99CA: 60
	SED					 ; $99CB: F8
	.byte $FF			; $99CC
	.byte $C7			; $99CD
	CLV					 ; $99CE: B8
	BRK					 ; $99CF: 00
	BRK					 ; $99D0: 00
	BRK					 ; $99D1: 00
	.byte $03			; $99D2
	.byte $04			; $99D3
	.byte $0C			; $99D4
	TYA					 ; $99D5: 98
	SEI					 ; $99D6: 78
	BRK					 ; $99D7: 00
	.byte $03			; $99D8
	.byte $04			; $99D9
	.byte $0B			; $99DA
	ASL $EE,X			   ; $99DB: 16 EE
	.byte $9C			; $99DD
	.byte $7C			; $99DE
	.byte $1C			; $99DF
	.byte $02			; $99E0
	ORA (tmp0,X)			; $99E1: 01 00
	BRK					 ; $99E3: 00
	BRK					 ; $99E4: 00
	BRK					 ; $99E5: 00
	BRK					 ; $99E6: 00
	.byte $1F			; $99E7
	.byte $03			; $99E8
	ORA (tmp0,X)			; $99E9: 01 00
	BRK					 ; $99EB: 00
	BRK					 ; $99EC: 00
	BRK					 ; $99ED: 00
	BRK					 ; $99EE: 00
	.byte $47			; $99EF
	.byte $3A			; $99F0
	ORA $CA,X			   ; $99F1: 15 CA
	ORA $75,X			   ; $99F3: 15 75
	CPX #$4C				; $99F5: E0 4C
	.byte $7F			; $99F7
	LDX $EBDD,Y			 ; $99F8: BE DD EB
	.byte $77			; $99FB
	.byte $F7			; $99FC
	.byte $EF			; $99FD
	.byte $5F			; $99FE
	ORA ($6A,X)			 ; $99FF: 01 6A
	CMP $A5,X			   ; $9A01: D5 A5
	.byte $6B			; $9A03
	.byte $7B			; $9A04
	.byte $83			; $9A05
	LDY #$07				; $9A06: A0 07
	ROR $BDDD			   ; $9A08: 6E DD BD
	.byte $7B			; $9A0B
	.byte $7B			; $9A0C
	.byte $83			; $9A0D
	CLV					 ; $9A0E: B8
	.byte $7F			; $9A0F
	INC $E9				 ; $9A10: E6 E9
	INY					 ; $9A12: C8
	BNE $9A03			   ; $9A13: D0 EE
	.byte $1F			; $9A15
	CMP $FF7F,Y			 ; $9A16: D9 7F FF
	.byte $FF			; $9A19
	.byte $FC			; $9A1A
	BEQ $9A0B			   ; $9A1B: F0 EE
	.byte $1F			; $9A1D
	.byte $DF			; $9A1E
	.byte $F4			; $9A1F
	JSR $0050			   ; $9A20: 20 50 00
	BRK					 ; $9A23: 00
	BRK					 ; $9A24: 00
	.byte $80			; $9A25
	CPY #$FC				; $9A26: C0 FC
	SED					 ; $9A28: F8
	SED					 ; $9A29: F8
	BVS $9A3C			   ; $9A2A: 70 10
	BRK					 ; $9A2C: 00
	.byte $80			; $9A2D
	CPY #$40				; $9A2E: C0 40
	BRK					 ; $9A30: 00
	BRK					 ; $9A31: 00
	BRK					 ; $9A32: 00
	BRK					 ; $9A33: 00
	BRK					 ; $9A34: 00
	BRK					 ; $9A35: 00
	RTI					 ; $9A36: 40
	CPY #$C0				; $9A37: C0 C0
	CPY #$C0				; $9A39: C0 C0
	CPY #$C0				; $9A3B: C0 C0
	CPY #$CC				; $9A3D: C0 CC
	.byte $92			; $9A3F
	.byte $E2			; $9A40
	ORA ($70),Y			 ; $9A41: 11 70
	LDY #$60				; $9A43: A0 60
	.byte $80			; $9A45
	BRK					 ; $9A46: 00
	.byte $F3			; $9A47
	.byte $E3			; $9A48
	ORA ($70),Y			 ; $9A49: 11 70
	CPX #$C0				; $9A4B: E0 C0
	.byte $80			; $9A4D
	BRK					 ; $9A4E: 00
	.byte $44			; $9A4F
	ASL					 ; $9A50: 0A
	BPL $9A33			   ; $9A51: 10 E0
	BRK					 ; $9A53: 00
	BRK					 ; $9A54: 00
	BRK					 ; $9A55: 00
	BRK					 ; $9A56: 00
	DEC $F1FB,X			 ; $9A57: DE FB F1
	SBC (tmp0,X)			; $9A5A: E1 00
	BRK					 ; $9A5C: 00
	BRK					 ; $9A5D: 00
	BRK					 ; $9A5E: 00
	BRK					 ; $9A5F: 00
	BRK					 ; $9A60: 00
	BRK					 ; $9A61: 00
	BRK					 ; $9A62: 00
	BRK					 ; $9A63: 00
	BRK					 ; $9A64: 00
	BRK					 ; $9A65: 00
	ORA (tmp0,X)			; $9A66: 01 00
	BRK					 ; $9A68: 00
	BRK					 ; $9A69: 00
	BRK					 ; $9A6A: 00
	BRK					 ; $9A6B: 00
	ORA (tmp3,X)			; $9A6C: 01 03
	.byte $07			; $9A6E
	BRK					 ; $9A6F: 00
	BRK					 ; $9A70: 00
	BRK					 ; $9A71: 00
	BRK					 ; $9A72: 00
	ORA ($71,X)			 ; $9A73: 01 71
	CPX #$4C				; $9A75: E0 4C
	BRK					 ; $9A77: 00
	BRK					 ; $9A78: 00
	BRK					 ; $9A79: 00
	.byte $3B			; $9A7A
	.byte $F7			; $9A7B
	.byte $F7			; $9A7C
	.byte $EF			; $9A7D
	.byte $5F			; $9A7E
	BRK					 ; $9A7F: 00
	BPL $9A82			   ; $9A80: 10 00
	STA ($20,X)			 ; $9A82: 81 20
	SEI					 ; $9A84: 78
	STY $BA				 ; $9A85: 84 BA
	BRK					 ; $9A87: 00
	BVS $9A51			   ; $9A88: 70 C7
	LDA $7E7E,Y			 ; $9A8A: B9 7E 7E
	.byte $87			; $9A8D
	.byte $BB			; $9A8E
	BRK					 ; $9A8F: 00
	BRK					 ; $9A90: 00
	BRK					 ; $9A91: 00
	JSR $98C0			   ; $9A92: 20 C0 98
	RTS					 ; $9A95: 60
	CLI					 ; $9A96: 58
	BRK					 ; $9A97: 00
	BRK					 ; $9A98: 00
	.byte $80			; $9A99
	CPX #$F0				; $9A9A: E0 F0
	SED					 ; $9A9C: F8
	.byte $7C			; $9A9D
	ROR $0402,X			 ; $9A9E: 7E 02 04
	ORA #$0B				; $9AA1: 09 0B
	ASL $15,X			   ; $9AA3: 16 15
	ROL					 ; $9AA5: 2A
	EOR $1C06			   ; $9AA6: 4D 06 1C
	CLC					 ; $9AA9: 18
	.byte $1B			; $9AAA
	.byte $37			; $9AAB
	.byte $37			; $9AAC
	.byte $62			; $9AAD
	RTI					 ; $9AAE: 40
	.byte $7B			; $9AAF
	ADC $2E7E,X			 ; $9AB0: 7D 7E 2E
	DEC $558E,X			 ; $9AB3: DE 8E 55
	SBC #$7B				; $9AB6: E9 7B
	ADC $2E7E,X			 ; $9AB8: 7D 7E 2E
	DEC $758E,X			 ; $9ABB: DE 8E 75
	SBC $2027,Y			 ; $9ABE: F9 27 20
	.byte $9C			; $9AC1
	.byte $4B			; $9AC2
	LDY $A2				 ; $9AC3: A4 A2
	.byte $D3			; $9AC5
	SBC #$BF				; $9AC6: E9 BF
	.byte $BF			; $9AC8
	.byte $DF			; $9AC9
	.byte $6F			; $9ACA
	.byte $B7			; $9ACB
	.byte $BB			; $9ACC
	.byte $DB			; $9ACD
	SBC $0000			   ; $9ACE: ED 00 00
	.byte $80			; $9AD1
	BRK					 ; $9AD2: 00
	CPY #$00				; $9AD3: C0 00
	RTI					 ; $9AD5: 40
	.byte $80			; $9AD6
	BRK					 ; $9AD7: 00
	BRK					 ; $9AD8: 00
	.byte $80			; $9AD9
	.byte $80			; $9ADA
	CPY #$E0				; $9ADB: C0 E0
	CPY #$80				; $9ADD: C0 80
	.byte $AF			; $9ADF
	LDX $6798,Y			 ; $9AE0: BE 98 67
	.byte $4F			; $9AE3
	.byte $3C			; $9AE4
	RTI					 ; $9AE5: 40
	EOR ($8F,X)			 ; $9AE6: 41 8F
	.byte $8F			; $9AE8
	.byte $AF			; $9AE9
	.byte $77			; $9AEA
	JMP $4038			   ; $9AEB: 4C 38 40
	RTI					 ; $9AEE: 40
	SBC ($E5),Y			 ; $9AEF: F1 E5
	BPL $9B65			   ; $9AF1: 10 72
	CPX $E4				 ; $9AF3: E4 E4
	.byte $82			; $9AF5
	ORA ($F5,X)			 ; $9AF6: 01 F5
	SBC $12				 ; $9AF8: E5 12
	.byte $72			; $9AFA
	SBC $C5				 ; $9AFB: E5 C5
	.byte $82			; $9AFD
	ORA (tmp0,X)			; $9AFE: 01 00
	BRK					 ; $9B00: 00
	.byte $80			; $9B01
	.byte $80			; $9B02
	PHA					 ; $9B03: 48
	RTI					 ; $9B04: 40
	BPL $9B07			   ; $9B05: 10 00
	.byte $80			; $9B07
	STY $C4				 ; $9B08: 84 C4
	CPY $4C				 ; $9B0A: C4 4C
	CLI					 ; $9B0C: 58
	BCC $9B4F			   ; $9B0D: 90 40
	BRK					 ; $9B0F: 00
	BRK					 ; $9B10: 00
	BRK					 ; $9B11: 00
	BRK					 ; $9B12: 00
	BRK					 ; $9B13: 00
	.byte $02			; $9B14
	BRK					 ; $9B15: 00
	BRK					 ; $9B16: 00
	BRK					 ; $9B17: 00
	BRK					 ; $9B18: 00
	BRK					 ; $9B19: 00
	BRK					 ; $9B1A: 00
	BRK					 ; $9B1B: 00
	.byte $03			; $9B1C
	.byte $04			; $9B1D
	.byte $0F			; $9B1E
	BRK					 ; $9B1F: 00
	BRK					 ; $9B20: 00
	BRK					 ; $9B21: 00
	BRK					 ; $9B22: 00
	BRK					 ; $9B23: 00
	BRK					 ; $9B24: 00
	LDY #$58				; $9B25: A0 58
	BRK					 ; $9B27: 00
	BRK					 ; $9B28: 00
	BRK					 ; $9B29: 00
	BRK					 ; $9B2A: 00
	BRK					 ; $9B2B: 00
	.byte $80			; $9B2C
	BEQ $9BA7			   ; $9B2D: F0 78
	BRK					 ; $9B2F: 00
	BRK					 ; $9B30: 00
	BRK					 ; $9B31: 00
	BRK					 ; $9B32: 00
	BRK					 ; $9B33: 00
	ORA (tmp1,X)			; $9B34: 01 01
	.byte $02			; $9B36
	BRK					 ; $9B37: 00
	BRK					 ; $9B38: 00
	BRK					 ; $9B39: 00
	BRK					 ; $9B3A: 00
	BRK					 ; $9B3B: 00
	ORA (tmp1,X)			; $9B3C: 01 01
	.byte $03			; $9B3E
	BRK					 ; $9B3F: 00
	BRK					 ; $9B40: 00
	BRK					 ; $9B41: 00
	BRK					 ; $9B42: 00
	.byte $80			; $9B43
	BRK					 ; $9B44: 00
	.byte $7C			; $9B45
	.byte $82			; $9B46
	BRK					 ; $9B47: 00
	BRK					 ; $9B48: 00
	BRK					 ; $9B49: 00
	BRK					 ; $9B4A: 00
	CPY #$FE				; $9B4B: C0 FE
	.byte $FF			; $9B4D
	.byte $83			; $9B4E
	BRK					 ; $9B4F: 00
	BRK					 ; $9B50: 00
	BRK					 ; $9B51: 00
	BRK					 ; $9B52: 00
	BRK					 ; $9B53: 00
	BRK					 ; $9B54: 00
	BVC $9BC3			   ; $9B55: 50 6C
	BRK					 ; $9B57: 00
	BRK					 ; $9B58: 00
	BRK					 ; $9B59: 00
	BRK					 ; $9B5A: 00
	BRK					 ; $9B5B: 00
	CPX #$78				; $9B5C: E0 78
	.byte $7C			; $9B5E
	.byte $07			; $9B5F
	ORA $2E06,Y			 ; $9B60: 19 06 2E
	.byte $1F			; $9B63
	.byte $3A			; $9B64
	JSR $1F20			   ; $9B65: 20 20 1F
	AND $6E26,Y			 ; $9B68: 39 26 6E
	.byte $5F			; $9B6B
	TSX					 ; $9B6C: BA
	LDY #$A0				; $9B6D: A0 A0
	.byte $27			; $9B6F
	.byte $12			; $9B70
	STA $98,X			   ; $9B71: 95 98
	EOR ($71,X)			 ; $9B73: 41 71
	CPX #$4C				; $9B75: E0 4C
	.byte $BF			; $9B77
	.byte $9E			; $9B78
	CMP $67DB,X			 ; $9B79: DD DB 67
	.byte $F7			; $9B7C
	.byte $EF			; $9B7D
	.byte $5F			; $9B7E
	ADC $FFFE,X			 ; $9B7F: 7D FE FF
	SED					 ; $9B82: F8
	.byte $C7			; $9B83
	.byte $BF			; $9B84
	.byte $1F			; $9B85
	.byte $DF			; $9B86
	ADC $FFFE,X			 ; $9B87: 7D FE FF
	SED					 ; $9B8A: F8
	.byte $C7			; $9B8B
	.byte $BF			; $9B8C
	.byte $1F			; $9B8D
	.byte $DF			; $9B8E
	.byte $32			; $9B8F
	.byte $9C			; $9B90
	LSR $0524			   ; $9B91: 4E 24 05
	.byte $D2			; $9B94
	.byte $E3			; $9B95
	.byte $E2			; $9B96
	LDX $6EDF,Y			 ; $9B97: BE DF 6E
	ROL $17,X			   ; $9B9A: 36 17
	.byte $DB			; $9B9C
	.byte $EB			; $9B9D
	.byte $EB			; $9B9E
	BRK					 ; $9B9F: 00
	BRK					 ; $9BA0: 00
	ORA (tmp3,X)			; $9BA1: 01 03
	ASL ptr0_hi			 ; $9BA3: 06 05
	ASL					 ; $9BA5: 0A
	ORA $4080			   ; $9BA6: 0D 80 40
	BRK					 ; $9BA9: 00
	.byte $03			; $9BAA
	.byte $07			; $9BAB
	.byte $07			; $9BAC
	.byte $02			; $9BAD
	BRK					 ; $9BAE: 00
	.byte $EF			; $9BAF
	.byte $EF			; $9BB0
	.byte $F3			; $9BB1
	CLD					 ; $9BB2: D8
	DEY					 ; $9BB3: 88
	.byte $80			; $9BB4
	PHP					 ; $9BB5: 08
	PHP					 ; $9BB6: 08
	.byte $EF			; $9BB7
	.byte $EF			; $9BB8
	.byte $F3			; $9BB9
	SED					 ; $9BBA: F8
	SED					 ; $9BBB: F8
	SED					 ; $9BBC: F8
	SED					 ; $9BBD: F8
	SED					 ; $9BBE: F8
	SBC ($F1),Y			 ; $9BBF: F1 F1
	SED					 ; $9BC1: F8
	SED					 ; $9BC2: F8
	SEI					 ; $9BC3: 78
	SEI					 ; $9BC4: 78
	SEC					 ; $9BC5: 38
	PLP					 ; $9BC6: 28
	SBC $F5,X			   ; $9BC7: F5 F5
	.byte $FA			; $9BC9
	SBC $7878,Y			 ; $9BCA: F9 78 78
	SEC					 ; $9BCD: 38
	SEC					 ; $9BCE: 38
	BCC $9BB1			   ; $9BCF: 90 E0
	BPL $9C43			   ; $9BD1: 10 70
	LDY #$60				; $9BD3: A0 60
	.byte $80			; $9BD5
	BRK					 ; $9BD6: 00
	BEQ $9BB9			   ; $9BD7: F0 E0
	BPL $9C4B			   ; $9BD9: 10 70
	CPX #$C0				; $9BDB: E0 C0
	.byte $80			; $9BDD
	BRK					 ; $9BDE: 00
	BVC $9C31			   ; $9BDF: 50 50
	.byte $80			; $9BE1
	.byte $80			; $9BE2
	.byte $80			; $9BE3
	RTI					 ; $9BE4: 40
	JSR $7000			   ; $9BE5: 20 00 70
	BVS $9BCA			   ; $9BE8: 70 E0
	CPY #$C0				; $9BEA: C0 C0
	RTS					 ; $9BEC: 60
	BMI $9BFB			   ; $9BED: 30 0C
	BRK					 ; $9BEF: 00
	BRK					 ; $9BF0: 00
	BRK					 ; $9BF1: 00
	BRK					 ; $9BF2: 00
	BRK					 ; $9BF3: 00
	BRK					 ; $9BF4: 00
	ORA (tmp2,X)			; $9BF5: 01 02
	BRK					 ; $9BF7: 00
	BRK					 ; $9BF8: 00
	BRK					 ; $9BF9: 00
	BRK					 ; $9BFA: 00
	BRK					 ; $9BFB: 00
	ORA (tmp3,X)			; $9BFC: 01 03
	ASL tmp0				; $9BFE: 06 00
	BRK					 ; $9C00: 00
	BRK					 ; $9C01: 00
	BRK					 ; $9C02: 00
	ADC ($C0,X)			 ; $9C03: 61 C0
	JMP $0033			   ; $9C05: 4C 33 00
	BRK					 ; $9C08: 00
	BRK					 ; $9C09: 00
	BVS $9BFB			   ; $9C0A: 70 EF
	.byte $DF			; $9C0C
	.byte $5F			; $9C0D
	.byte $33			; $9C0E
	BRK					 ; $9C0F: 00
	BRK					 ; $9C10: 00
	BRK					 ; $9C11: 00
	ORA ($20,X)			 ; $9C12: 01 20
	SEI					 ; $9C14: 78
	STY $A2				 ; $9C15: 84 A2
	BRK					 ; $9C17: 00
	BRK					 ; $9C18: 00
	.byte $07			; $9C19
	AND $7E7E,Y			 ; $9C1A: 39 7E 7E
	.byte $87			; $9C1D
	.byte $BB			; $9C1E
	.byte $04			; $9C1F
	ORA #$1B				; $9C20: 09 1B
	ASL $15				 ; $9C22: 06 15
	ROL					 ; $9C24: 2A
	ORA $0C2F			   ; $9C25: 0D 2F 0C
	PHP					 ; $9C28: 08
	.byte $1B			; $9C29
	.byte $07			; $9C2A
	.byte $37			; $9C2B
	.byte $62			; $9C2C
	RTI					 ; $9C2D: 40
	.byte $0F			; $9C2E
	CMP $F7BA			   ; $9C2F: CD BA F7
	TXS					 ; $9C32: 9A
	.byte $54			; $9C33
	LDA #$9B				; $9C34: A9 9B
	.byte $BB			; $9C36
	ORA (tmp2,X)			; $9C37: 01 02
	.byte $E7			; $9C39
	.byte $FA			; $9C3A
	.byte $74			; $9C3B
	AND $E333,Y			 ; $9C3C: 39 33 E3
	.byte $43			; $9C3F
	ADC ($70,X)			 ; $9C40: 61 70
	PHP					 ; $9C42: 08
	.byte $44			; $9C43
	.byte $12			; $9C44
	EOR ($A1,X)			 ; $9C45: 41 A1
	.byte $7B			; $9C47
	ADC $0E7E,X			 ; $9C48: 7D 7E 0E
	ROR $5A,X			   ; $9C4B: 76 5A
	ORA #$95				; $9C4D: 09 95
	ROL $6718,X			 ; $9C4F: 3E 18 67
	EOR $0838			   ; $9C52: 4D 38 08
	BRK					 ; $9C55: 00
	ORA ($0F,X)			 ; $9C56: 01 0F
	.byte $2F			; $9C58
	.byte $77			; $9C59
	JMP $0038			   ; $9C5A: 4C 38 00
	ORA ($08,X)			 ; $9C5D: 01 08
	.byte $7B			; $9C5F
	LDA $26,X			   ; $9C60: B5 26
	LSR $B43E,X			 ; $9C62: 5E 3E B4
	BPL $9C73			   ; $9C65: 10 0C
	.byte $C3			; $9C67
	STA $06				 ; $9C68: 85 06
	ASL $3CBE,X			 ; $9C6A: 1E BE 3C
	.byte $1C			; $9C6D
	ASL $D3C1			   ; $9C6E: 0E C1 D3
	.byte $E7			; $9C71
	.byte $07			; $9C72
	ASL tmp2				; $9C73: 06 02
	ORA (tmp0,X)			; $9C75: 01 00
	CMP $CB				 ; $9C77: C5 CB
	.byte $E7			; $9C79
	.byte $07			; $9C7A
	.byte $07			; $9C7B
	.byte $03			; $9C7C
	ORA (tmp0,X)			; $9C7D: 01 00
	SBC ($F5),Y			 ; $9C7F: F1 F5
	BEQ $9C6D			   ; $9C81: F0 EA
	CPX $C244			   ; $9C83: EC 44 C2
	.byte $23			; $9C86
	SBC $F5,X			   ; $9C87: F5 F5
	.byte $F2			; $9C89
	NOP					 ; $9C8A: EA
	SBC $C2C5			   ; $9C8B: ED C5 C2
	.byte $E3			; $9C8E
	BRK					 ; $9C8F: 00
	BRK					 ; $9C90: 00
	.byte $80			; $9C91
	.byte $80			; $9C92
	RTI					 ; $9C93: 40
	RTI					 ; $9C94: 40
	BRK					 ; $9C95: 00
	BRK					 ; $9C96: 00
	.byte $80			; $9C97
	.byte $80			; $9C98
	CPY #$C0				; $9C99: C0 C0
	RTI					 ; $9C9B: 40
	RTI					 ; $9C9C: 40
	.byte $80			; $9C9D
	RTI					 ; $9C9E: 40
	.byte $02			; $9C9F
	BRK					 ; $9CA0: 00
	BRK					 ; $9CA1: 00
	BRK					 ; $9CA2: 00
	ORA (tmp2,X)			; $9CA3: 01 02
	.byte $02			; $9CA5
	BRK					 ; $9CA6: 00
	.byte $04			; $9CA7
	BRK					 ; $9CA8: 00
	BRK					 ; $9CA9: 00
	BRK					 ; $9CAA: 00
	ORA (tmp2,X)			; $9CAB: 01 02
	BRK					 ; $9CAD: 00
	BRK					 ; $9CAE: 00
	.byte $02			; $9CAF
	.byte $1C			; $9CB0
	.byte $34			; $9CB1
	.byte $64			; $9CB2
	SED					 ; $9CB3: F8
	BRK					 ; $9CB4: 00
	LDY tmp0				; $9CB5: A4 00
	ASL $3C1C			   ; $9CB7: 0E 1C 3C
	.byte $7C			; $9CBA
	.byte $FA			; $9CBB
	LDX #$00				; $9CBC: A2 00
	BRK					 ; $9CBE: 00
	BRK					 ; $9CBF: 00
	ORA (tmp3,X)			; $9CC0: 01 03
	ASL system_flags		; $9CC2: 06 1F
	JSR $002A			   ; $9CC4: 20 2A 00
	BRK					 ; $9CC7: 00
	ORA (tmp3,X)			; $9CC8: 01 03
	.byte $07			; $9CCA
	.byte $1F			; $9CCB
	ROL					 ; $9CCC: 2A
	BRK					 ; $9CCD: 00
	BRK					 ; $9CCE: 00
	AND ($C1,X)			 ; $9CCF: 21 C1
	EOR ($41,X)			 ; $9CD1: 41 41
	LDX #$22				; $9CD3: A2 22
	RTI					 ; $9CD5: 40
	BRK					 ; $9CD6: 00
	SBC ($C1,X)			 ; $9CD7: E1 C1
	CMP ($C1,X)			 ; $9CD9: C1 C1
	.byte $A3			; $9CDB
	.byte $23			; $9CDC
	ASL $18				 ; $9CDD: 06 18
	BRK					 ; $9CDF: 00
	BRK					 ; $9CE0: 00
	BRK					 ; $9CE1: 00
	BRK					 ; $9CE2: 00
	BRK					 ; $9CE3: 00
	BRK					 ; $9CE4: 00
	BRK					 ; $9CE5: 00
	BRK					 ; $9CE6: 00
	.byte $80			; $9CE7
	.byte $80			; $9CE8
	.byte $80			; $9CE9
	.byte $80			; $9CEA
	BRK					 ; $9CEB: 00
	BRK					 ; $9CEC: 00
	BRK					 ; $9CED: 00
	BRK					 ; $9CEE: 00
	BRK					 ; $9CEF: 00
	BRK					 ; $9CF0: 00
	BRK					 ; $9CF1: 00
	ORA (tmp2,X)			; $9CF2: 01 02
	.byte $02			; $9CF4
	.byte $02			; $9CF5
	ASL tmp0				; $9CF6: 06 00
	ORA (tmp3,X)			; $9CF8: 01 03
	.byte $03			; $9CFA
	ASL $06				 ; $9CFB: 06 06
	ASL $06				 ; $9CFD: 06 06
	BRK					 ; $9CFF: 00
	BRK					 ; $9D00: 00
	.byte $80			; $9D01
	EOR ($B9),Y			 ; $9D02: 51 B9
	CMP #$F1				; $9D04: C9 F1
	SBC $8100,Y			 ; $9D06: F9 00 81
	CMP ($73,X)			 ; $9D09: C1 73
	.byte $BB			; $9D0B
	.byte $CB			; $9D0C
	.byte $F3			; $9D0D
	.byte $FB			; $9D0E
	BRK					 ; $9D0F: 00
	RTI					 ; $9D10: 40
	LDY #$50				; $9D11: A0 50
	RTS					 ; $9D13: 60
	.byte $5C			; $9D14
	.byte $53			; $9D15
	EOR #$C0				; $9D16: 49 C0
	CPX #$B8				; $9D18: E0 B8
	.byte $5C			; $9D1A
	.byte $63			; $9D1B
	.byte $7C			; $9D1C
	.byte $7F			; $9D1D
	.byte $7F			; $9D1E
	BRK					 ; $9D1F: 00
	BRK					 ; $9D20: 00
	BRK					 ; $9D21: 00
	BRK					 ; $9D22: 00
	BRK					 ; $9D23: 00
	BRK					 ; $9D24: 00
	BRK					 ; $9D25: 00
	CPY #$00				; $9D26: C0 00
	BRK					 ; $9D28: 00
	BRK					 ; $9D29: 00
	BRK					 ; $9D2A: 00
	BRK					 ; $9D2B: 00
	CPY #$30				; $9D2C: C0 30
	CPY $CC02			   ; $9D2E: CC 02 CC
	.byte $BB			; $9D31
	.byte $F7			; $9D32
	TXS					 ; $9D33: 9A
	LSR $EB,X			   ; $9D34: 56 EB
	.byte $9B			; $9D36
	.byte $02			; $9D37
	BRK					 ; $9D38: 00
	.byte $03			; $9D39
	.byte $E7			; $9D3A
	.byte $FB			; $9D3B
	.byte $77			; $9D3C
	.byte $7B			; $9D3D
	.byte $33			; $9D3E
	.byte $F2			; $9D3F
	.byte $E2			; $9D40
	.byte $02			; $9D41
	STA $0D,X			   ; $9D42: 95 0D
	.byte $03			; $9D44
	BPL $9CE7			   ; $9D45: 10 A0
	INC $E6,X			   ; $9D47: F6 E6
	ASL $EDDD			   ; $9D49: 0E DD ED
	.byte $F3			; $9D4C
	BEQ $9D3D			   ; $9D4D: F0 EE
	NOP					 ; $9D4F: EA
	LDA $D4				 ; $9D50: A5 D4
	BCC $9D94			   ; $9D52: 90 40
	BRK					 ; $9D54: 00
	BRK					 ; $9D55: 00
	BRK					 ; $9D56: 00
	.byte $FF			; $9D57
	.byte $FF			; $9D58
	INC $F8FC,X			 ; $9D59: FE FC F8
	BPL $9D5E			   ; $9D5C: 10 00
	BRK					 ; $9D5E: 00
	BVS $9D61			   ; $9D5F: 70 00
	BRK					 ; $9D61: 00
	BRK					 ; $9D62: 00
	BRK					 ; $9D63: 00
	BRK					 ; $9D64: 00
	BRK					 ; $9D65: 00
	BRK					 ; $9D66: 00
	BEQ $9D29			   ; $9D67: F0 C0
	BRK					 ; $9D69: 00
	BRK					 ; $9D6A: 00
	BRK					 ; $9D6B: 00
	BRK					 ; $9D6C: 00
	BRK					 ; $9D6D: 00
	BRK					 ; $9D6E: 00
	.byte $2F			; $9D6F
	ROL $6718,X			 ; $9D70: 3E 18 67
	.byte $4F			; $9D73
	.byte $3C			; $9D74
	.byte $02			; $9D75
	.byte $03			; $9D76
	.byte $0F			; $9D77
	.byte $0F			; $9D78
	.byte $2F			; $9D79
	.byte $77			; $9D7A
	JMP $0238			   ; $9D7B: 4C 38 02
	.byte $02			; $9D7E
	.byte $BB			; $9D7F
	SEI					 ; $9D80: 78
	INC $8C,X			   ; $9D81: F6 8C
	ADC #$99				; $9D83: 69 99
	LDA $E338,Y			 ; $9D85: B9 38 E3
	CMP ($87,X)			 ; $9D88: C1 87
	.byte $0F			; $9D8A
	.byte $6F			; $9D8B
	.byte $9F			; $9D8C
	.byte $3F			; $9D8D
	.byte $3F			; $9D8E
	CLD					 ; $9D8F: D8
	BVC $9DDB			   ; $9D90: 50 49
	STX $51				 ; $9D92: 86 51
	.byte $43			; $9D94
	STA ($E1),Y			 ; $9D95: 91 E1
	.byte $DF			; $9D97
	.byte $D7			; $9D98
	.byte $CF			; $9D99
	LDX $59,Y			   ; $9D9A: B6 59
	.byte $0B			; $9D9C
	STA $E5				 ; $9D9D: 85 E5
	BRK					 ; $9D9F: 00
	BRK					 ; $9DA0: 00
	BRK					 ; $9DA1: 00
	BRK					 ; $9DA2: 00
	BRK					 ; $9DA3: 00
	.byte $80			; $9DA4
	.byte $80			; $9DA5
	BRK					 ; $9DA6: 00
	BRK					 ; $9DA7: 00
	BRK					 ; $9DA8: 00
	BRK					 ; $9DA9: 00
	BRK					 ; $9DAA: 00
	BRK					 ; $9DAB: 00
	.byte $80			; $9DAC
	.byte $80			; $9DAD
	.byte $80			; $9DAE
	BRK					 ; $9DAF: 00
	BRK					 ; $9DB0: 00
	BRK					 ; $9DB1: 00
	BRK					 ; $9DB2: 00
	BRK					 ; $9DB3: 00
	BRK					 ; $9DB4: 00
	BRK					 ; $9DB5: 00
	PHP					 ; $9DB6: 08
	BRK					 ; $9DB7: 00
	BRK					 ; $9DB8: 00
	BRK					 ; $9DB9: 00
	BRK					 ; $9DBA: 00
	RTS					 ; $9DBB: 60
	BPL $9DC6			   ; $9DBC: 10 08
	.byte $0C			; $9DBE
	BRK					 ; $9DBF: 00
	.byte $03			; $9DC0
	BRK					 ; $9DC1: 00
	BRK					 ; $9DC2: 00
	BRK					 ; $9DC3: 00
	BRK					 ; $9DC4: 00
	BRK					 ; $9DC5: 00
	BRK					 ; $9DC6: 00
	BRK					 ; $9DC7: 00
	.byte $02			; $9DC8
	BRK					 ; $9DC9: 00
	BRK					 ; $9DCA: 00
	BRK					 ; $9DCB: 00
	BRK					 ; $9DCC: 00
	BRK					 ; $9DCD: 00
	BRK					 ; $9DCE: 00
	BMI $9E01			   ; $9DCF: 30 30
	CLI					 ; $9DD1: 58
	.byte $DC			; $9DD2
	CMP $D7AF,X			 ; $9DD3: DD AF D7
	EOR #$3F				; $9DD6: 49 3F
	.byte $3F			; $9DD8
	.byte $5F			; $9DD9
	.byte $DF			; $9DDA
	.byte $DF			; $9DDB
	.byte $EF			; $9DDC
	.byte $F7			; $9DDD
	ADC $6153,Y			 ; $9DDE: 79 53 61
	RTI					 ; $9DE1: 40
	.byte $80			; $9DE2
	RTI					 ; $9DE3: 40
	RTI					 ; $9DE4: 40
	RTS					 ; $9DE5: 60
	LDY #$CB				; $9DE6: A0 CB
	SBC $DE				 ; $9DE8: E5 DE
	.byte $BF			; $9DEA
	.byte $7F			; $9DEB
	.byte $7F			; $9DEC
	.byte $7F			; $9DED
	LDX $0080,Y			 ; $9DEE: BE 80 00
	CPY #$40				; $9DF1: C0 40
	RTI					 ; $9DF3: 40
	RTS					 ; $9DF4: 60
	ADC ($FF),Y			 ; $9DF5: 71 FF
	.byte $80			; $9DF7
	BRK					 ; $9DF8: 00
	CPY #$60				; $9DF9: C0 60
	.byte $77			; $9DFB
	.byte $7F			; $9DFC
	.byte $7F			; $9DFD
	.byte $FF			; $9DFE
	PHP					 ; $9DFF: 08
	BPL $9E26			   ; $9E00: 10 24
	BRK					 ; $9E02: 00
	CLC					 ; $9E03: 18
	BVS $9DC6			   ; $9E04: 70 C0
	BRK					 ; $9E06: 00
	.byte $0C			; $9E07
	.byte $1C			; $9E08
	.byte $3C			; $9E09
	SED					 ; $9E0A: F8
	SED					 ; $9E0B: F8
	BEQ $9DCE			   ; $9E0C: F0 C0
	BRK					 ; $9E0E: 00
	BRK					 ; $9E0F: 00
	BRK					 ; $9E10: 00
	BRK					 ; $9E11: 00
	BRK					 ; $9E12: 00
	BRK					 ; $9E13: 00
	ORA (tmp2,X)			; $9E14: 01 02
	.byte $02			; $9E16
	BRK					 ; $9E17: 00
	BRK					 ; $9E18: 00
	BRK					 ; $9E19: 00
	BRK					 ; $9E1A: 00
	BRK					 ; $9E1B: 00
	ORA (tmp2,X)			; $9E1C: 01 02
	BRK					 ; $9E1E: 00
	JSR $1414			   ; $9E1F: 20 14 14
	BMI $9E8C			   ; $9E22: 30 68
	CPY #$A5				; $9E24: C0 A5
	LDA ($38,X)			 ; $9E26: A1 38
	.byte $1C			; $9E28
	.byte $1C			; $9E29
	SEC					 ; $9E2A: 38
	SEI					 ; $9E2B: 78
	.byte $FC			; $9E2C
	LDA (tmp0,X)			; $9E2D: A1 00
	BPL $9E3B			   ; $9E2F: 10 0A
	ASL					 ; $9E31: 0A
	CLC					 ; $9E32: 18
	.byte $34			; $9E33
	CPX #$32				; $9E34: E0 32
	BVC $9E54			   ; $9E36: 50 1C
	ASL $1C0E			   ; $9E38: 0E 0E 1C
	.byte $3C			; $9E3B
	INC $0070,X			 ; $9E3C: FE 70 00
	.byte $7C			; $9E3F
	BRK					 ; $9E40: 00
	BRK					 ; $9E41: 00
	BRK					 ; $9E42: 00
	BRK					 ; $9E43: 00
	BRK					 ; $9E44: 00
	BRK					 ; $9E45: 00
	BRK					 ; $9E46: 00
	.byte $7C			; $9E47
	BRK					 ; $9E48: 00
	BRK					 ; $9E49: 00
	BRK					 ; $9E4A: 00
	BRK					 ; $9E4B: 00
	BRK					 ; $9E4C: 00
	BRK					 ; $9E4D: 00
	BRK					 ; $9E4E: 00
	.byte $02			; $9E4F
	BRK					 ; $9E50: 00
	.byte $02			; $9E51
	.byte $02			; $9E52
	ORA (tmp0,X)			; $9E53: 01 00
	BRK					 ; $9E55: 00
	BRK					 ; $9E56: 00
	.byte $04			; $9E57
	BRK					 ; $9E58: 00
	.byte $02			; $9E59
	.byte $02			; $9E5A
	BRK					 ; $9E5B: 00
	BRK					 ; $9E5C: 00
	BRK					 ; $9E5D: 00
	BRK					 ; $9E5E: 00
	.byte $02			; $9E5F
	CPX $B4				 ; $9E60: E4 B4
	.byte $04			; $9E62
	.byte $42			; $9E63
	PLP					 ; $9E64: 28
	.byte $04			; $9E65
	BRK					 ; $9E66: 00
	ASL $3CF4			   ; $9E67: 0E F4 3C
	.byte $0C			; $9E6A
	LSR $0A				 ; $9E6B: 46 0A
	BRK					 ; $9E6D: 00
	BRK					 ; $9E6E: 00
	BRK					 ; $9E6F: 00
	ASL $202B			   ; $9E70: 0E 2B 20
	.byte $14			; $9E73
	.byte $02			; $9E74
	BRK					 ; $9E75: 00
	BRK					 ; $9E76: 00
	BRK					 ; $9E77: 00
	.byte $0F			; $9E78
	.byte $23			; $9E79
	JSR $0004			   ; $9E7A: 20 04 00
	BRK					 ; $9E7D: 00
	BRK					 ; $9E7E: 00
	AND ($41,X)			 ; $9E7F: 21 41
	EOR ($41,X)			 ; $9E81: 41 41
	.byte $22			; $9E83
	.byte $02			; $9E84
	RTI					 ; $9E85: 40
	BRK					 ; $9E86: 00
	SBC ($41,X)			 ; $9E87: E1 41
	CMP ($C1,X)			 ; $9E89: C1 C1
	.byte $63			; $9E8B
	.byte $23			; $9E8C
	ASL $18				 ; $9E8D: 06 18
	BRK					 ; $9E8F: 00
	ROL $CB				 ; $9E90: 26 CB
	.byte $80			; $9E92
	JSR $F1BF			   ; $9E93: 20 BF F1
	RTS					 ; $9E96: 60
	LDX #$14				; $9E97: A2 14
	JSR $C90C			   ; $9E99: 20 0C C9
	BRK					 ; $9E9C: 00
	.byte $23			; $9E9D
	.byte $FB			; $9E9E
	JSR $9F91			   ; $9E9F: 20 91 9F
	JSR $9F16			   ; $9EA2: 20 16 9F
	LDA system_flags		; $9EA5: A5 1F
	ORA #$40				; $9EA7: 09 40
	STA system_flags		; $9EA9: 85 1F
	JSR $C62D			   ; $9EAB: 20 2D C6
	LDA system_flags		; $9EAE: A5 1F
	AND #$BF				; $9EB0: 29 BF
	STA system_flags		; $9EB2: 85 1F
	JSR $9ED0			   ; $9EB4: 20 D0 9E
	INC $51				 ; $9EB7: E6 51
	LDA $51				 ; $9EB9: A5 51
	CMP #$05				; $9EBB: C9 05
	BCC $9EA2			   ; $9EBD: 90 E3
	BRK					 ; $9EBF: 00
	ROL $CB				 ; $9EC0: 26 CB
	RTI					 ; $9EC2: 40
	BRK					 ; $9EC3: 00
	ORA #$9F				; $9EC4: 09 9F
	LDX #$0F				; $9EC6: A2 0F
	LDY #$08				; $9EC8: A0 08
	LDA #$1A				; $9ECA: A9 1A
	BRK					 ; $9ECC: 00
	ORA #$EF				; $9ECD: 09 EF
	RTS					 ; $9ECF: 60
	LDX #$28				; $9ED0: A2 28
	TXA					 ; $9ED2: 8A
	PHA					 ; $9ED3: 48
	AND #$03				; $9ED4: 29 03
	BNE $9F0D			   ; $9ED6: D0 35
	LDA #$BF				; $9ED8: A9 BF
	STA $0300			   ; $9EDA: 8D 00 03
	LDA #$03				; $9EDD: A9 03
	STA $0301			   ; $9EDF: 8D 01 03
	LDA #$09				; $9EE2: A9 09
	STA $0302			   ; $9EE4: 8D 02 03
	LDA $0603			   ; $9EE7: AD 03 06
	PHA					 ; $9EEA: 48
	LDA $0604			   ; $9EEB: AD 04 06
	STA $0603			   ; $9EEE: 8D 03 06
	STA $0303			   ; $9EF1: 8D 03 03
	LDA $0605			   ; $9EF4: AD 05 06
	STA $0604			   ; $9EF7: 8D 04 06
	STA $0304			   ; $9EFA: 8D 04 03
	PLA					 ; $9EFD: 68
	STA $0605			   ; $9EFE: 8D 05 06
	STA $0305			   ; $9F01: 8D 05 03
	INC $050B			   ; $9F04: EE 0B 05
	LDA system_flags		; $9F07: A5 1F
	ORA #$20				; $9F09: 09 20
	STA system_flags		; $9F0B: 85 1F
	JSR $FF74			   ; $9F0D: 20 74 FF
	PLA					 ; $9F10: 68
	TAX					 ; $9F11: AA
	DEX					 ; $9F12: CA
	BNE $9ED2			   ; $9F13: D0 BD
	RTS					 ; $9F15: 60
	LDA $51				 ; $9F16: A5 51
	BNE $9F1D			   ; $9F18: D0 03
	JSR $9F51			   ; $9F1A: 20 51 9F
	LDX $050A			   ; $9F1D: AE 0A 05
	LDA #$9F				; $9F20: A9 9F
	STA $0300,X			 ; $9F22: 9D 00 03
	LDA #$40				; $9F25: A9 40
	STA $0301,X			 ; $9F27: 9D 01 03
	LDA #$C0				; $9F2A: A9 C0
	STA $0302,X			 ; $9F2C: 9D 02 03
	INX					 ; $9F2F: E8
	INX					 ; $9F30: E8
	INX					 ; $9F31: E8
	LDY #$00				; $9F32: A0 00
	LDA ($49),Y			 ; $9F34: B1 49
	STA $0300,X			 ; $9F36: 9D 00 03
	INX					 ; $9F39: E8
	INY					 ; $9F3A: C8
	CPY #$40				; $9F3B: C0 40
	BCC $9F34			   ; $9F3D: 90 F5
	STX $050A			   ; $9F3F: 8E 0A 05
	INC $050B			   ; $9F42: EE 0B 05
	LDA $49				 ; $9F45: A5 49
	CLC					 ; $9F47: 18
	ADC #$40				; $9F48: 69 40
	STA $49				 ; $9F4A: 85 49
	BCC $9F50			   ; $9F4C: 90 02
	INC $4A				 ; $9F4E: E6 4A
	RTS					 ; $9F50: 60
	LDX $050A			   ; $9F51: AE 0A 05
	LDA $1C				 ; $9F54: A5 1C
	ORA #$80				; $9F56: 09 80
	STA $0300,X			 ; $9F58: 9D 00 03
	STA $0305,X			 ; $9F5B: 9D 05 03
	LDA #$02				; $9F5E: A9 02
	STA $0301,X			 ; $9F60: 9D 01 03
	STA $0306,X			 ; $9F63: 9D 06 03
	LDA $1D				 ; $9F66: A5 1D
	STA $0302,X			 ; $9F68: 9D 02 03
	CLC					 ; $9F6B: 18
	ADC #$20				; $9F6C: 69 20
	STA $0307,X			 ; $9F6E: 9D 07 03
	LDA $52				 ; $9F71: A5 52
	STA $0303,X			 ; $9F73: 9D 03 03
	LDA $53				 ; $9F76: A5 53
	STA $0304,X			 ; $9F78: 9D 04 03
	LDA $54				 ; $9F7B: A5 54
	STA $0308,X			 ; $9F7D: 9D 08 03
	LDA $55				 ; $9F80: A5 55
	STA $0309,X			 ; $9F82: 9D 09 03
	INC $050B			   ; $9F85: EE 0B 05
	INC $050B			   ; $9F88: EE 0B 05
	LDX #$0A				; $9F8B: A2 0A
	STX $050A			   ; $9F8D: 8E 0A 05
	RTS					 ; $9F90: 60
	LDA #$00				; $9F91: A9 00
	STA $51				 ; $9F93: 85 51
	LDA $9FBC			   ; $9F95: AD BC 9F
	STA $49				 ; $9F98: 85 49
	LDA $9FBD			   ; $9F9A: AD BD 9F
	STA $4A				 ; $9F9D: 85 4A
	JSR $9FB3			   ; $9F9F: 20 B3 9F
	JSR $C662			   ; $9FA2: 20 62 C6
	LDX #$FC				; $9FA5: A2 FC
	STX $52				 ; $9FA7: 86 52
	INX					 ; $9FA9: E8
	STX $53				 ; $9FAA: 86 53
	INX					 ; $9FAC: E8
	STX $54				 ; $9FAD: 86 54
	INX					 ; $9FAF: E8
	STX $55				 ; $9FB0: 86 55
	RTS					 ; $9FB2: 60
	LDA #$10				; $9FB3: A9 10
	STA tmp0				; $9FB5: 85 00
	LDA #$0C				; $9FB7: A9 0C
	STA tmp1				; $9FB9: 85 01
	RTS					 ; $9FBB: 60
	LDX $D39F,Y			 ; $9FBC: BE 9F D3
	ROR $AD,X			   ; $9FBF: 76 AD
	.byte $CB			; $9FC1
	.byte $7A			; $9FC2
	BCS $9F8E			   ; $9FC3: B0 C9
	.byte $4F			; $9FC5
	ROR $DBAD,X			 ; $9FC6: 7E AD DB
	ROR $CFB5,X			 ; $9FC9: 7E B5 CF
	.byte $7F			; $9FCC
	INC $6C,X			   ; $9FCD: F6 6C
	ORA ($4B,X)			 ; $9FCF: 01 4B
	INC $CBB5,X			 ; $9FD1: FE B5 CB
	SEI					 ; $9FD4: 78
	.byte $33			; $9FD5
	.byte $FF			; $9FD6
	.byte $FF			; $9FD7
	INC $CBB5,X			 ; $9FD8: FE B5 CB
	ROR $CFB7,X			 ; $9FDB: 7E B7 CF
	ROR $39				 ; $9FDE: 66 39
	.byte $9E			; $9FE0
	CMP $7A				 ; $9FE1: C5 7A
	CPX $90				 ; $9FE3: E4 90
	RTI					 ; $9FE5: 40
	LDA $E4DE,Y			 ; $9FE6: B9 DE E4
	SEI					 ; $9FE9: 78
	LDY #$00				; $9FEA: A0 00
	BRK					 ; $9FEC: 00
	BRK					 ; $9FED: 00
	.byte $87			; $9FEE
	.byte $9C			; $9FEF
	ADC $5EA3,Y			 ; $9FF0: 79 A3 5E
	.byte $27			; $9FF3
	ASL					 ; $9FF4: 0A
	ORA ($FC,X)			 ; $9FF5: 01 FC
	.byte $7B			; $9FF7
	.byte $27			; $9FF8
	ASL $0005,X			 ; $9FF9: 1E 05 00
	BRK					 ; $9FFC: 00
	BRK					 ; $9FFD: 00
	.byte $D3			; $9FFE
	ROR $AD,X			   ; $9FFF: 76 AD
	.byte $CB			; $A001
	.byte $7A			; $A002
	LDA ($CA),Y			 ; $A003: B1 CA
	EOR $AD7E			   ; $A005: 4D 7E AD
	.byte $DB			; $A008
	ROR $CEB5,X			 ; $A009: 7E B5 CE
	.byte $7C			; $A00C
	BEQ $A07B			   ; $A00D: F0 6C
	ORA ($4B,X)			 ; $A00F: 01 4B
	INC $CBB5,X			 ; $A011: FE B5 CB
	SEI					 ; $A014: 78
	.byte $B3			; $A015
	.byte $FF			; $A016
	.byte $FF			; $A017
	INC $CBB5,X			 ; $A018: FE B5 CB
	ROR $0F37,X			 ; $A01B: 7E 37 0F
	ROR					 ; $A01E: 6A
	BMI $9FE9			   ; $A01F: 30 C8
	BCS $A067			   ; $A021: B0 44
	BRK					 ; $A023: 00
	BRK					 ; $A024: 00
	BRK					 ; $A025: 00
	BCS $9FE8			   ; $A026: B0 C0
	.byte $80			; $A028
	BRK					 ; $A029: 00
	BRK					 ; $A02A: 00
	BRK					 ; $A02B: 00
	BRK					 ; $A02C: 00
	BRK					 ; $A02D: 00
	.byte $5F			; $A02E
	.byte $04			; $A02F
	.byte $5B			; $A030
	ORA tmp2				; $A031: 05 02
	BRK					 ; $A033: 00
	BRK					 ; $A034: 00
	BRK					 ; $A035: 00
	.byte $04			; $A036
	.byte $03			; $A037
	ORA (tmp0,X)			; $A038: 01 00
	BRK					 ; $A03A: 00
	BRK					 ; $A03B: 00
	BRK					 ; $A03C: 00
	BRK					 ; $A03D: 00
	.byte $D3			; $A03E
	.byte $77			; $A03F
	LDX $7ACD			   ; $A040: AE CD 7A
	LDY $D0				 ; $A043: A4 D0
	BIT $7E				 ; $A045: 24 7E
	LDY $78D8			   ; $A047: AC D8 78
	LDY #$C0				; $A04A: A0 C0
	BRK					 ; $A04C: 00
	BRK					 ; $A04D: 00
	JMP ($4B81)			 ; $A04E: 6C 81 4B
	LDX $0B55,Y			 ; $A051: BE 55 0B
	ASL $09,X			   ; $A054: 16 09
	.byte $FF			; $A056
	.byte $7F			; $A057
	ROL $0B15,X			 ; $A058: 3E 15 0B
	ASL tmp1				; $A05B: 06 01
	BRK					 ; $A05D: 00
	.byte $80			; $A05E
	BRK					 ; $A05F: 00
	BRK					 ; $A060: 00
	RTI					 ; $A061: 40
	BRK					 ; $A062: 00
	BRK					 ; $A063: 00
	BRK					 ; $A064: 00
	BRK					 ; $A065: 00
	BRK					 ; $A066: 00
	BRK					 ; $A067: 00
	BRK					 ; $A068: 00
	BRK					 ; $A069: 00
	BRK					 ; $A06A: 00
	BRK					 ; $A06B: 00
	BRK					 ; $A06C: 00
	BRK					 ; $A06D: 00
	.byte $02			; $A06E
	BPL $A071			   ; $A06F: 10 00
	BPL $A073			   ; $A071: 10 00
	BRK					 ; $A073: 00
	BRK					 ; $A074: 00
	BRK					 ; $A075: 00
	BRK					 ; $A076: 00
	BRK					 ; $A077: 00
	BRK					 ; $A078: 00
	BRK					 ; $A079: 00
	BRK					 ; $A07A: 00
	BRK					 ; $A07B: 00
	BRK					 ; $A07C: 00
	BRK					 ; $A07D: 00
	.byte $D3			; $A07E
	.byte $7C			; $A07F
	.byte $B2			; $A080
	CPY ptr_lo			  ; $A081: C4 10
	LDY #$00				; $A083: A0 00
	RTI					 ; $A085: 40
	.byte $7C			; $A086
	LDY #$80				; $A087: A0 80
	BRK					 ; $A089: 00
	BRK					 ; $A08A: 00
	BRK					 ; $A08B: 00
	BRK					 ; $A08C: 00
	BRK					 ; $A08D: 00
	CPX $4D31			   ; $A08E: EC 31 4D
	.byte $23			; $A091
	.byte $0C			; $A092
	ORA (tmp0,X)			; $A093: 01 00
	PHP					 ; $A095: 08
	.byte $3F			; $A096
	.byte $0F			; $A097
	BRK					 ; $A098: 00
	BRK					 ; $A099: 00
	BRK					 ; $A09A: 00
	BRK					 ; $A09B: 00
	BRK					 ; $A09C: 00
	BRK					 ; $A09D: 00
	BRK					 ; $A09E: 00
	.byte $80			; $A09F
	BRK					 ; $A0A0: 00
	.byte $04			; $A0A1
	BRK					 ; $A0A2: 00
	BRK					 ; $A0A3: 00
	BRK					 ; $A0A4: 00
	JSR $0000			   ; $A0A5: 20 00 00
	BRK					 ; $A0A8: 00
	BRK					 ; $A0A9: 00
	BRK					 ; $A0AA: 00
	BRK					 ; $A0AB: 00
	BRK					 ; $A0AC: 00
	BRK					 ; $A0AD: 00
	BRK					 ; $A0AE: 00
	ORA (tmp0,X)			; $A0AF: 01 00
	BRK					 ; $A0B1: 00
	BRK					 ; $A0B2: 00
	BPL $A0B5			   ; $A0B3: 10 00
	BPL $A0B7			   ; $A0B5: 10 00
	BRK					 ; $A0B7: 00
	BRK					 ; $A0B8: 00
	BRK					 ; $A0B9: 00
	BRK					 ; $A0BA: 00
	BRK					 ; $A0BB: 00
	BRK					 ; $A0BC: 00
	BRK					 ; $A0BD: 00
	EOR $A8,X			   ; $A0BE: 55 A8
	BRK					 ; $A0C0: 00
	BRK					 ; $A0C1: 00
	BRK					 ; $A0C2: 00
	BRK					 ; $A0C3: 00
	BRK					 ; $A0C4: 00
	BRK					 ; $A0C5: 00
	BRK					 ; $A0C6: 00
	BRK					 ; $A0C7: 00
	BRK					 ; $A0C8: 00
	BRK					 ; $A0C9: 00
	BRK					 ; $A0CA: 00
	BRK					 ; $A0CB: 00
	BRK					 ; $A0CC: 00
	BRK					 ; $A0CD: 00
	EOR $0A,X			   ; $A0CE: 55 0A
	BRK					 ; $A0D0: 00
	BRK					 ; $A0D1: 00
	BRK					 ; $A0D2: 00
	BRK					 ; $A0D3: 00
	BRK					 ; $A0D4: 00
	BRK					 ; $A0D5: 00
	BRK					 ; $A0D6: 00
	BRK					 ; $A0D7: 00
	BRK					 ; $A0D8: 00
	BRK					 ; $A0D9: 00
	BRK					 ; $A0DA: 00
	BRK					 ; $A0DB: 00
	BRK					 ; $A0DC: 00
	BRK					 ; $A0DD: 00
	BRK					 ; $A0DE: 00
	BRK					 ; $A0DF: 00
	BRK					 ; $A0E0: 00
	BRK					 ; $A0E1: 00
	BRK					 ; $A0E2: 00
	RTI					 ; $A0E3: 40
	BRK					 ; $A0E4: 00
	.byte $80			; $A0E5
	BRK					 ; $A0E6: 00
	BRK					 ; $A0E7: 00
	BRK					 ; $A0E8: 00
	BRK					 ; $A0E9: 00
	BRK					 ; $A0EA: 00
	BRK					 ; $A0EB: 00
	BRK					 ; $A0EC: 00
	BRK					 ; $A0ED: 00
	BRK					 ; $A0EE: 00
	BRK					 ; $A0EF: 00
	BRK					 ; $A0F0: 00
	BRK					 ; $A0F1: 00
	BRK					 ; $A0F2: 00
	PHP					 ; $A0F3: 08
	BRK					 ; $A0F4: 00
	ORA (tmp0,X)			; $A0F5: 01 00
	BRK					 ; $A0F7: 00
	BRK					 ; $A0F8: 00
	BRK					 ; $A0F9: 00
	BRK					 ; $A0FA: 00
	BRK					 ; $A0FB: 00
	BRK					 ; $A0FC: 00
	BRK					 ; $A0FD: 00
	BRK					 ; $A0FE: 00
	STY $FB,X			   ; $A0FF: 94 FB
	JSR $A11D			   ; $A101: 20 1D A1
	JSR $C54E			   ; $A104: 20 4E C5
	BRK					 ; $A107: 00
	ASL					 ; $A108: 0A
	.byte $87			; $A109
	LDA #$02				; $A10A: A9 02
	STA $3D				 ; $A10C: 85 3D
	ORA #$80				; $A10E: 09 80
	BRK					 ; $A110: 00
	.byte $3C			; $A111
	.byte $EF			; $A112
	JSR $A498			   ; $A113: 20 98 A4
	BRK					 ; $A116: 00
	ORA #$9F				; $A117: 09 9F
	JSR $A127			   ; $A119: 20 27 A1
	RTS					 ; $A11C: 60
	JSR $A2D3			   ; $A11D: 20 D3 A2
	JSR $A29E			   ; $A120: 20 9E A2
	JSR $A137			   ; $A123: 20 37 A1
	RTS					 ; $A126: 60
	JSR $C5A8			   ; $A127: 20 A8 C5
	JSR $C592			   ; $A12A: 20 92 C5
	JSR $A2D3			   ; $A12D: 20 D3 A2
	JSR $A203			   ; $A130: 20 03 A2
	JSR $A168			   ; $A133: 20 68 A1
	RTS					 ; $A136: 60
	JSR $A32D			   ; $A137: 20 2D A3
	JSR $A2D9			   ; $A13A: 20 D9 A2
	JSR $A194			   ; $A13D: 20 94 A1
	JSR $A2E9			   ; $A140: 20 E9 A2
	DEC $52				 ; $A143: C6 52
	BNE $A137			   ; $A145: D0 F0
	JSR $A380			   ; $A147: 20 80 A3
	LDA $53				 ; $A14A: A5 53
	CMP #$FF				; $A14C: C9 FF
	BNE $A154			   ; $A14E: D0 04
	LDA #$20				; $A150: A9 20
	BNE $A15F			   ; $A152: D0 0B
	CMP #$02				; $A154: C9 02
	BEQ $A15F			   ; $A156: F0 07
	SEC					 ; $A158: 38
	SBC #$10				; $A159: E9 10
	BNE $A15F			   ; $A15B: D0 02
	LDA #$02				; $A15D: A9 02
	STA $53				 ; $A15F: 85 53
	STA $52				 ; $A161: 85 52
	DEC $51				 ; $A163: C6 51
	BNE $A137			   ; $A165: D0 D0
	RTS					 ; $A167: 60
	JSR $A320			   ; $A168: 20 20 A3
	JSR $A2D9			   ; $A16B: 20 D9 A2
	JSR $A194			   ; $A16E: 20 94 A1
	JSR $A2E9			   ; $A171: 20 E9 A2
	DEC $52				 ; $A174: C6 52
	BNE $A168			   ; $A176: D0 F0
	JSR $A3C8			   ; $A178: 20 C8 A3
	LDA $51				 ; $A17B: A5 51
	CMP #$06				; $A17D: C9 06
	BCS $A18F			   ; $A17F: B0 0E
	LDA $53				 ; $A181: A5 53
	CLC					 ; $A183: 18
	ADC #$06				; $A184: 69 06
	STA $53				 ; $A186: 85 53
	STA $52				 ; $A188: 85 52
	DEC $51				 ; $A18A: C6 51
	BNE $A168			   ; $A18C: D0 DA
	RTS					 ; $A18E: 60
	LDA $53				 ; $A18F: A5 53
	JMP $A188			   ; $A191: 4C 88 A1
	LDA #$04				; $A194: A9 04
	STA $58				 ; $A196: 85 58
	LDY #$00				; $A198: A0 00
	LDX #$00				; $A19A: A2 00
	STY $56				 ; $A19C: 84 56
	LDA $2002			   ; $A19E: AD 02 20
	LDA $7782,X			 ; $A1A1: BD 82 77
	STA $2000			   ; $A1A4: 8D 00 20
	LDA $7700,Y			 ; $A1A7: B9 00 77
	STA $2005			   ; $A1AA: 8D 05 20
	LDA $54				 ; $A1AD: A5 54
	STA $2005			   ; $A1AF: 8D 05 20
	INY					 ; $A1B2: C8
	INY					 ; $A1B3: C8
	INX					 ; $A1B4: E8
	INC $56				 ; $A1B5: E6 56
	LDA $56				 ; $A1B7: A5 56
	CMP #$05				; $A1B9: C9 05
	BEQ $A1C4			   ; $A1BB: F0 07
	LDA #$00				; $A1BD: A9 00
	STA $56				 ; $A1BF: 85 56
	JMP $A1C8			   ; $A1C1: 4C C8 A1
	EOR #$FF				; $A1C4: 49 FF
	EOR #$80				; $A1C6: 49 80
	EOR #$FF				; $A1C8: 49 FF
	EOR #$80				; $A1CA: 49 80
	NOP					 ; $A1CC: EA
	NOP					 ; $A1CD: EA
	NOP					 ; $A1CE: EA
	TXA					 ; $A1CF: 8A
	PHA					 ; $A1D0: 48
	LDX #$05				; $A1D1: A2 05
	DEX					 ; $A1D3: CA
	BNE $A1D3			   ; $A1D4: D0 FD
	PLA					 ; $A1D6: 68
	TAX					 ; $A1D7: AA
	CPY #$80				; $A1D8: C0 80
	BEQ $A1E5			   ; $A1DA: F0 09
	EOR #$FF				; $A1DC: 49 FF
	EOR #$80				; $A1DE: 49 80
	EOR #$01				; $A1E0: 49 01
	JMP $A19E			   ; $A1E2: 4C 9E A1
	LDX #$00				; $A1E5: A2 00
	LDY #$00				; $A1E7: A0 00
	DEC $58				 ; $A1E9: C6 58
	BNE $A19E			   ; $A1EB: D0 B1
	LDA $0505			   ; $A1ED: AD 05 05
	STA $2000			   ; $A1F0: 8D 00 20
	LDA $2002			   ; $A1F3: AD 02 20
	LDA $0508			   ; $A1F6: AD 08 05
	STA $2005			   ; $A1F9: 8D 05 20
	LDA $0509			   ; $A1FC: AD 09 05
	STA $2005			   ; $A1FF: 8D 05 20
	RTS					 ; $A202: 60
	LDA #$30				; $A203: A9 30
	STA $51				 ; $A205: 85 51
	LDA #$02				; $A207: A9 02
	STA $53				 ; $A209: 85 53
	STA $52				 ; $A20B: 85 52
	LDA #$00				; $A20D: A9 00
	STA $54				 ; $A20F: 85 54
	LDA #$8B				; $A211: A9 8B
	STA $55				 ; $A213: 85 55
	LDX #$00				; $A215: A2 00
	LDY #$00				; $A217: A0 00
	LDA $A479,X			 ; $A219: BD 79 A4
	STA $7700,Y			 ; $A21C: 99 00 77
	INY					 ; $A21F: C8
	LDA #$00				; $A220: A9 00
	STA $7700,Y			 ; $A222: 99 00 77
	INY					 ; $A225: C8
	INX					 ; $A226: E8
	CPX #$1B				; $A227: E0 1B
	BNE $A219			   ; $A229: D0 EE
	STA $7701,Y			 ; $A22B: 99 01 77
	LDA #$6D				; $A22E: A9 6D
	STA $7700,Y			 ; $A230: 99 00 77
	INY					 ; $A233: C8
	INY					 ; $A234: C8
	DEX					 ; $A235: CA
	LDA $A479,X			 ; $A236: BD 79 A4
	STA $7700,Y			 ; $A239: 99 00 77
	INY					 ; $A23C: C8
	LDA #$00				; $A23D: A9 00
	STA $7700,Y			 ; $A23F: 99 00 77
	INY					 ; $A242: C8
	DEX					 ; $A243: CA
	BPL $A236			   ; $A244: 10 F0
	LDX #$00				; $A246: A2 00
	LDA $A494,X			 ; $A248: BD 94 A4
	STA $7700,Y			 ; $A24B: 99 00 77
	INY					 ; $A24E: C8
	LDA #$00				; $A24F: A9 00
	STA $7700,Y			 ; $A251: 99 00 77
	INY					 ; $A254: C8
	INX					 ; $A255: E8
	CPX #$04				; $A256: E0 04
	BNE $A248			   ; $A258: D0 EE
	STA $7701,Y			 ; $A25A: 99 01 77
	LDA #$23				; $A25D: A9 23
	STA $7700,Y			 ; $A25F: 99 00 77
	INY					 ; $A262: C8
	INY					 ; $A263: C8
	DEX					 ; $A264: CA
	LDA $A494,X			 ; $A265: BD 94 A4
	STA $7700,Y			 ; $A268: 99 00 77
	INY					 ; $A26B: C8
	LDA #$00				; $A26C: A9 00
	STA $7700,Y			 ; $A26E: 99 00 77
	INY					 ; $A271: C8
	DEX					 ; $A272: CA
	BPL $A265			   ; $A273: 10 F0
	LDA #$30				; $A275: A9 30
	STA $7700,Y			 ; $A277: 99 00 77
	INY					 ; $A27A: C8
	LDA #$20				; $A27B: A9 20
	STA $7700,Y			 ; $A27D: 99 00 77
	INY					 ; $A280: C8
	LDA #$91				; $A281: A9 91
	STA $7700,Y			 ; $A283: 99 00 77
	INY					 ; $A286: C8
	CPY #$8C				; $A287: C0 8C
	BNE $A283			   ; $A289: D0 F8
	STA $7700,Y			 ; $A28B: 99 00 77
	INY					 ; $A28E: C8
	CPY #$AF				; $A28F: C0 AF
	BNE $A28B			   ; $A291: D0 F8
	LDA #$91				; $A293: A9 91
	STA $7700,Y			 ; $A295: 99 00 77
	INY					 ; $A298: C8
	CPY #$C2				; $A299: C0 C2
	BNE $A295			   ; $A29B: D0 F8
	RTS					 ; $A29D: 60
	LDA #$30				; $A29E: A9 30
	STA $51				 ; $A2A0: 85 51
	LDA #$01				; $A2A2: A9 01
	STA $52				 ; $A2A4: 85 52
	LDA #$FF				; $A2A6: A9 FF
	STA $53				 ; $A2A8: 85 53
	LDA $0509			   ; $A2AA: AD 09 05
	STA $54				 ; $A2AD: 85 54
	LDA #$00				; $A2AF: A9 00
	STA $55				 ; $A2B1: 85 55
	TAX					 ; $A2B3: AA
	LDA $0508			   ; $A2B4: AD 08 05
	STA $7700,X			 ; $A2B7: 9D 00 77
	INX					 ; $A2BA: E8
	LDA #$00				; $A2BB: A9 00
	STA $7700,X			 ; $A2BD: 9D 00 77
	INX					 ; $A2C0: E8
	CPX #$80				; $A2C1: E0 80
	BNE $A2B4			   ; $A2C3: D0 EF
	LDX #$00				; $A2C5: A2 00
	LDA $0505			   ; $A2C7: AD 05 05
	STA $7782,X			 ; $A2CA: 9D 82 77
	INX					 ; $A2CD: E8
	CPX #$40				; $A2CE: E0 40
	BNE $A2CA			   ; $A2D0: D0 F8
	RTS					 ; $A2D2: 60
	JSR $C543			   ; $A2D3: 20 43 C5
	JMP $FF74			   ; $A2D6: 4C 74 FF
	LDA system_flags		; $A2D9: A5 1F
	ORA #$08				; $A2DB: 09 08
	STA system_flags		; $A2DD: 85 1F
	JSR $FF74			   ; $A2DF: 20 74 FF
	LDA system_flags		; $A2E2: A5 1F
	AND #$F7				; $A2E4: 29 F7
	STA system_flags		; $A2E6: 85 1F
	RTS					 ; $A2E8: 60
	LDX #$7F				; $A2E9: A2 7F
	LDA $7700,X			 ; $A2EB: BD 00 77
	INX					 ; $A2EE: E8
	INX					 ; $A2EF: E8
	STA $7700,X			 ; $A2F0: 9D 00 77
	DEX					 ; $A2F3: CA
	DEX					 ; $A2F4: CA
	DEX					 ; $A2F5: CA
	CPX #$FF				; $A2F6: E0 FF
	BNE $A2EB			   ; $A2F8: D0 F1
	LDA $7780			   ; $A2FA: AD 80 77
	STA $7700			   ; $A2FD: 8D 00 77
	LDA $7781			   ; $A300: AD 81 77
	STA $7701			   ; $A303: 8D 01 77
	LDA $77C1			   ; $A306: AD C1 77
	PHA					 ; $A309: 48
	LDX #$3E				; $A30A: A2 3E
	LDA $7782,X			 ; $A30C: BD 82 77
	INX					 ; $A30F: E8
	STA $7782,X			 ; $A310: 9D 82 77
	DEX					 ; $A313: CA
	DEX					 ; $A314: CA
	CPX #$FF				; $A315: E0 FF
	BNE $A30C			   ; $A317: D0 F3
	PLA					 ; $A319: 68
	STA $7782			   ; $A31A: 8D 82 77
	INC $55				 ; $A31D: E6 55
	RTS					 ; $A31F: 60
	LDA $51				 ; $A320: A5 51
	CMP #$29				; $A322: C9 29
	BCC $A31F			   ; $A324: 90 F9
	SEC					 ; $A326: 38
	SBC #$29				; $A327: E9 29
	LSR					 ; $A329: 4A
	JMP $A33B			   ; $A32A: 4C 3B A3
	LDX $51				 ; $A32D: A6 51
	CPX #$09				; $A32F: E0 09
	BCS $A31F			   ; $A331: B0 EC
	DEX					 ; $A333: CA
	TXA					 ; $A334: 8A
	LSR					 ; $A335: 4A
	EOR #$03				; $A336: 49 03
	CLC					 ; $A338: 18
	ADC #$01				; $A339: 69 01
	ASL					 ; $A33B: 0A
	ASL					 ; $A33C: 0A
	ASL					 ; $A33D: 0A
	ASL					 ; $A33E: 0A
	STA $57				 ; $A33F: 85 57
	LDX #$00				; $A341: A2 00
	LDA #$BF				; $A343: A9 BF
	STA $0300,X			 ; $A345: 9D 00 03
	INX					 ; $A348: E8
	LDA #$20				; $A349: A9 20
	STA $0300,X			 ; $A34B: 9D 00 03
	INX					 ; $A34E: E8
	LDA #$00				; $A34F: A9 00
	STA $0300,X			 ; $A351: 9D 00 03
	INX					 ; $A354: E8
	LDY #$01				; $A355: A0 01
	TXA					 ; $A357: 8A
	SEC					 ; $A358: 38
	SBC #$03				; $A359: E9 03
	AND #$03				; $A35B: 29 03
	BEQ $A36B			   ; $A35D: F0 0C
	LDA $05FC,Y			 ; $A35F: B9 FC 05
	SEC					 ; $A362: 38
	SBC $57				 ; $A363: E5 57
	CMP #$40				; $A365: C9 40
	BCC $A36F			   ; $A367: 90 06
	BCS $A36C			   ; $A369: B0 01
	DEY					 ; $A36B: 88
	LDA $05FC			   ; $A36C: AD FC 05
	STA $0300,X			 ; $A36F: 9D 00 03
	INX					 ; $A372: E8
	INY					 ; $A373: C8
	CPY #$20				; $A374: C0 20
	BNE $A357			   ; $A376: D0 DF
	LDA #$01				; $A378: A9 01
	STA $050B			   ; $A37A: 8D 0B 05
	JMP $C626			   ; $A37D: 4C 26 C6
	LDA $55				 ; $A380: A5 55
	ASL					 ; $A382: 0A
	AND #$7F				; $A383: 29 7F
	TAY					 ; $A385: A8
	LDX #$00				; $A386: A2 00
	LDA $7701,Y			 ; $A388: B9 01 77
	CLC					 ; $A38B: 18
	ADC $A3FA,X			 ; $A38C: 7D FA A3
	STA $7701,Y			 ; $A38F: 99 01 77
	LDA $7700,Y			 ; $A392: B9 00 77
	STA $59				 ; $A395: 85 59
	ADC $A3F9,X			 ; $A397: 7D F9 A3
	STA $7700,Y			 ; $A39A: 99 00 77
	EOR $59				 ; $A39D: 45 59
	BPL $A3A3			   ; $A39F: 10 02
	BMI $A3B0			   ; $A3A1: 30 0D
	INY					 ; $A3A3: C8
	INY					 ; $A3A4: C8
	TYA					 ; $A3A5: 98
	AND #$7F				; $A3A6: 29 7F
	TAY					 ; $A3A8: A8
	INX					 ; $A3A9: E8
	INX					 ; $A3AA: E8
	CPX #$80				; $A3AB: E0 80
	BNE $A388			   ; $A3AD: D0 D9
	RTS					 ; $A3AF: 60
	LDA $59				 ; $A3B0: A5 59
	SEC					 ; $A3B2: 38
	SBC #$20				; $A3B3: E9 20
	CMP #$C0				; $A3B5: C9 C0
	BCC $A3C7			   ; $A3B7: 90 0E
	TYA					 ; $A3B9: 98
	PHA					 ; $A3BA: 48
	LSR					 ; $A3BB: 4A
	TAY					 ; $A3BC: A8
	LDA #$01				; $A3BD: A9 01
	EOR $7782,Y			 ; $A3BF: 59 82 77
	STA $7782,Y			 ; $A3C2: 99 82 77
	PLA					 ; $A3C5: 68
	TAY					 ; $A3C6: A8
	RTS					 ; $A3C7: 60
	LDA $55				 ; $A3C8: A5 55
	ASL					 ; $A3CA: 0A
	AND #$7F				; $A3CB: 29 7F
	TAY					 ; $A3CD: A8
	LDX #$00				; $A3CE: A2 00
	LDA $7701,Y			 ; $A3D0: B9 01 77
	SEC					 ; $A3D3: 38
	SBC $A3FA,X			 ; $A3D4: FD FA A3
	STA $7701,Y			 ; $A3D7: 99 01 77
	LDA $7700,Y			 ; $A3DA: B9 00 77
	STA $59				 ; $A3DD: 85 59
	SBC $A3F9,X			 ; $A3DF: FD F9 A3
	STA $7700,Y			 ; $A3E2: 99 00 77
	EOR $59				 ; $A3E5: 45 59
	BPL $A3EC			   ; $A3E7: 10 03
	JSR $A3B0			   ; $A3E9: 20 B0 A3
	INY					 ; $A3EC: C8
	INY					 ; $A3ED: C8
	TYA					 ; $A3EE: 98
	AND #$7F				; $A3EF: 29 7F
	TAY					 ; $A3F1: A8
	INX					 ; $A3F2: E8
	INX					 ; $A3F3: E8
	CPX #$80				; $A3F4: E0 80
	BNE $A3D0			   ; $A3F6: D0 D8
	RTS					 ; $A3F8: 60
	BRK					 ; $A3F9: 00
	BRK					 ; $A3FA: 00
	BRK					 ; $A3FB: 00
	BMI $A3FE			   ; $A3FC: 30 00
	RTS					 ; $A3FE: 60
	BRK					 ; $A3FF: 00
	.byte $80			; $A400
	BRK					 ; $A401: 00
	BCS $A404			   ; $A402: B0 00
	CPX #$01				; $A404: E0 01
	BPL $A409			   ; $A406: 10 01
	BMI $A40B			   ; $A408: 30 01
	BVC $A40D			   ; $A40A: 50 01
	BVS $A40F			   ; $A40C: 70 01
	BCC $A411			   ; $A40E: 90 01
	BCS $A413			   ; $A410: B0 01
	CPY #$01				; $A412: C0 01
	BNE $A417			   ; $A414: D0 01
	CPX #$01				; $A416: E0 01
	CPX #$01				; $A418: E0 01
	BEQ $A41D			   ; $A41A: F0 01
	CPX #$01				; $A41C: E0 01
	CPX #$01				; $A41E: E0 01
	BNE $A423			   ; $A420: D0 01
	CPY #$01				; $A422: C0 01
	BCS $A427			   ; $A424: B0 01
	BCC $A429			   ; $A426: 90 01
	BVS $A42B			   ; $A428: 70 01
	BVC $A42D			   ; $A42A: 50 01
	BMI $A42F			   ; $A42C: 30 01
	BPL $A430			   ; $A42E: 10 00
	CPX #$00				; $A430: E0 00
	BCS $A434			   ; $A432: B0 00
	.byte $80			; $A434
	BRK					 ; $A435: 00
	RTS					 ; $A436: 60
	BRK					 ; $A437: 00
	BMI $A43A			   ; $A438: 30 00
	BRK					 ; $A43A: 00
	.byte $FF			; $A43B
	BNE $A43D			   ; $A43C: D0 FF
	LDY #$FF				; $A43E: A0 FF
	.byte $80			; $A440
	.byte $FF			; $A441
	BVC $A443			   ; $A442: 50 FF
	JSR $F0FE			   ; $A444: 20 FE F0
	INC $FED0,X			 ; $A447: FE D0 FE
	BCS $A44A			   ; $A44A: B0 FE
	BCC $A44C			   ; $A44C: 90 FE
	BVS $A44E			   ; $A44E: 70 FE
	BVC $A450			   ; $A450: 50 FE
	RTI					 ; $A452: 40
	INC $FE30,X			 ; $A453: FE 30 FE
	JSR $20FE			   ; $A456: 20 FE 20
	INC $FE10,X			 ; $A459: FE 10 FE
	JSR $20FE			   ; $A45C: 20 FE 20
	INC $FE30,X			 ; $A45F: FE 30 FE
	RTI					 ; $A462: 40
	INC $FE50,X			 ; $A463: FE 50 FE
	BVS $A466			   ; $A466: 70 FE
	BCC $A468			   ; $A468: 90 FE
	BCS $A46A			   ; $A46A: B0 FE
	BNE $A46C			   ; $A46C: D0 FE
	BEQ $A46F			   ; $A46E: F0 FF
	JSR $50FF			   ; $A470: 20 FF 50
	.byte $FF			; $A473
	.byte $80			; $A474
	.byte $FF			; $A475
	LDY #$FF				; $A476: A0 FF
	BNE $A4A9			   ; $A478: D0 2F
	AND $3B,X			   ; $A47A: 35 3B
	EOR ($47,X)			 ; $A47C: 41 47
	EOR $5F56			   ; $A47E: 4D 56 5F
	PLA					 ; $A481: 68
	ROR $8077			   ; $A482: 6E 77 80
	.byte $89			; $A485
	.byte $92			; $A486
	TYA					 ; $A487: 98
	LDA ($AA,X)			 ; $A488: A1 AA
	.byte $B3			; $A48A
	LDA $C5BF,Y			 ; $A48B: B9 BF C5
	.byte $CB			; $A48E
	CMP ($D4),Y			 ; $A48F: D1 D4
	.byte $D7			; $A491
	.byte $DA			; $A492
	.byte $DA			; $A493
	BIT $2629			   ; $A494: 2C 29 26
	ROL $20				 ; $A497: 26 20
	.byte $AF			; $A499
	CMP $A5				 ; $A49A: C5 A5
	LSR $D0				 ; $A49C: 46 D0
	.byte $3B			; $A49E
	LDA $2002			   ; $A49F: AD 02 20
	LDA #$20				; $A4A2: A9 20
	STA $2006			   ; $A4A4: 8D 06 20
	LDA #$00				; $A4A7: A9 00
	STA $2006			   ; $A4A9: 8D 06 20
	LDX #$08				; $A4AC: A2 08
	TAY					 ; $A4AE: A8
	LDA #$91				; $A4AF: A9 91
	STA $2007			   ; $A4B1: 8D 07 20
	DEY					 ; $A4B4: 88
	BNE $A4B1			   ; $A4B5: D0 FA
	DEX					 ; $A4B7: CA
	BNE $A4B1			   ; $A4B8: D0 F7
	LDA $2002			   ; $A4BA: AD 02 20
	LDA #$23				; $A4BD: A9 23
	STA $2006			   ; $A4BF: 8D 06 20
	JSR $A4DD			   ; $A4C2: 20 DD A4
	LDA #$27				; $A4C5: A9 27
	STA $2006			   ; $A4C7: 8D 06 20
	JSR $A4DD			   ; $A4CA: 20 DD A4
	LDX #$7F				; $A4CD: A2 7F
	LDA #$AA				; $A4CF: A9 AA
	STA $0400,X			 ; $A4D1: 9D 00 04
	DEX					 ; $A4D4: CA
	BPL $A4D1			   ; $A4D5: 10 FA
	JSR $C00A			   ; $A4D7: 20 0A C0
	JMP $C58F			   ; $A4DA: 4C 8F C5
	LDA #$C0				; $A4DD: A9 C0
	STA $2006			   ; $A4DF: 8D 06 20
	LDX #$00				; $A4E2: A2 00
	LDA #$AA				; $A4E4: A9 AA
	STA $2007			   ; $A4E6: 8D 07 20
	INX					 ; $A4E9: E8
	CPX #$40				; $A4EA: E0 40
	BCC $A4E6			   ; $A4EC: 90 F8
	RTS					 ; $A4EE: 60
	LDA system_flags		; $A4EF: A5 1F
	ORA #$08				; $A4F1: 09 08
	STA system_flags		; $A4F3: 85 1F
	LDA #$80				; $A4F5: A9 80
	BRK					 ; $A4F7: 00
	.byte $02			; $A4F8
	.byte $9F			; $A4F9
	JSR $A71C			   ; $A4FA: 20 1C A7
	JSR $C5AF			   ; $A4FD: 20 AF C5
	JSR $A706			   ; $A500: 20 06 A7
	JSR $C5B9			   ; $A503: 20 B9 C5
	JSR $A530			   ; $A506: 20 30 A5
	BCS $A521			   ; $A509: B0 16
	JSR $A71C			   ; $A50B: 20 1C A7
	JSR $A7B2			   ; $A50E: 20 B2 A7
	LDA $B0				 ; $A511: A5 B0
	AND #$20				; $A513: 29 20
	BNE $A521			   ; $A515: D0 0A
	BRK					 ; $A517: 00
	.byte $04			; $A518
	.byte $9F			; $A519
	JSR $FF74			   ; $A51A: 20 74 FF
	BIT $BB				 ; $A51D: 24 BB
	BCS $A51A			   ; $A51F: B0 F9
	LDA system_flags		; $A521: A5 1F
	AND #$F7				; $A523: 29 F7
	STA system_flags		; $A525: 85 1F
	JSR $A71C			   ; $A527: 20 1C A7
	BRK					 ; $A52A: 00
	PHP					 ; $A52B: 08
	.byte $8F			; $A52C
	JMP $A75B			   ; $A52D: 4C 5B A7
	LDX #$01				; $A530: A2 01
	JSR $F3FB			   ; $A532: 20 FB F3
	LDA #$00				; $A535: A9 00
	JSR $A580			   ; $A537: 20 80 A5
	LDA #$01				; $A53A: A9 01
	JSR $A580			   ; $A53C: 20 80 A5
	JSR $C58F			   ; $A53F: 20 8F C5
	LDX #$78				; $A542: A2 78
	JSR $C90C			   ; $A544: 20 0C C9
	JSR $C5C5			   ; $A547: 20 C5 C5
	JSR $C54E			   ; $A54A: 20 4E C5
	JSR $C5AF			   ; $A54D: 20 AF C5
	LDA #$09				; $A550: A9 09
	JSR $A580			   ; $A552: 20 80 A5
	JSR $C5BF			   ; $A555: 20 BF C5
	JSR $C58F			   ; $A558: 20 8F C5
	LDA #$98				; $A55B: A9 98
	STA $0505			   ; $A55D: 8D 05 05
	LDA system_flags		; $A560: A5 1F
	AND #$BF				; $A562: 29 BF
	STA system_flags		; $A564: 85 1F
	BRK					 ; $A566: 00
	ASL $B7				 ; $A567: 06 B7
	LDA system_flags		; $A569: A5 1F
	ORA #$40				; $A56B: 09 40
	STA system_flags		; $A56D: 85 1F
	BCS $A57A			   ; $A56F: B0 09
	LDX #$0F				; $A571: A2 0F
	JSR $C90C			   ; $A573: 20 0C C9
	BRK					 ; $A576: 00
	.byte $02			; $A577
	.byte $FB			; $A578
	CLC					 ; $A579: 18
	LDA #$90				; $A57A: A9 90
	STA $0505			   ; $A57C: 8D 05 05
	RTS					 ; $A57F: 60
	PHA					 ; $A580: 48
	JSR $A588			   ; $A581: 20 88 A5
	PLA					 ; $A584: 68
	JMP $A58C			   ; $A585: 4C 8C A5
	LDX #$00				; $A588: A2 00
	BEQ $A58E			   ; $A58A: F0 02
	LDX #$01				; $A58C: A2 01
	STX ptr0_lo			 ; $A58E: 86 04
	ASL					 ; $A590: 0A
	TAX					 ; $A591: AA
	LDA $A5DF,X			 ; $A592: BD DF A5
	STA tmp0				; $A595: 85 00
	LDA $A5E0,X			 ; $A597: BD E0 A5
	STA tmp1				; $A59A: 85 01
	LDY #$00				; $A59C: A0 00
	LDA (tmp0),Y			; $A59E: B1 00
	STA tmp3				; $A5A0: 85 03
	INY					 ; $A5A2: C8
	LDA (tmp0),Y			; $A5A3: B1 00
	LDX ptr0_lo			 ; $A5A5: A6 04
	BEQ $A5B0			   ; $A5A7: F0 07
	CLC					 ; $A5A9: 18
	ADC #$20				; $A5AA: 69 20
	BCC $A5B0			   ; $A5AC: 90 02
	INC tmp3				; $A5AE: E6 03
	STA tmp2				; $A5B0: 85 02
	LDA $2002			   ; $A5B2: AD 02 20
	LDA tmp3				; $A5B5: A5 03
	STA $2006			   ; $A5B7: 8D 06 20
	LDA tmp2				; $A5BA: A5 02
	STA $2006			   ; $A5BC: 8D 06 20
	INY					 ; $A5BF: C8
	LDA (tmp0),Y			; $A5C0: B1 00
	CMP #$FE				; $A5C2: C9 FE
	BCS $A5D9			   ; $A5C4: B0 13
	CMP #$FD				; $A5C6: C9 FD
	BNE $A5D0			   ; $A5C8: D0 06
	LDA #$02				; $A5CA: A9 02
	CLC					 ; $A5CC: 18
	ADC $615A			   ; $A5CD: 6D 5A 61
	CLC					 ; $A5D0: 18
	ADC ptr0_lo			 ; $A5D1: 65 04
	STA $2007			   ; $A5D3: 8D 07 20
	JMP $A5BF			   ; $A5D6: 4C BF A5
	INY					 ; $A5D9: C8
	CMP #$FF				; $A5DA: C9 FF
	BNE $A59E			   ; $A5DC: D0 C0
	RTS					 ; $A5DE: 60
	.byte $F3			; $A5DF
	LDA $47				 ; $A5E0: A5 47
	LDX $5B				 ; $A5E2: A6 5B
	LDX $6A				 ; $A5E4: A6 6A
	LDX $76				 ; $A5E6: A6 76
	LDX $8B				 ; $A5E8: A6 8B
	LDX $A8				 ; $A5EA: A6 A8
	LDX $C3				 ; $A5EC: A6 C3
	LDX $DE				 ; $A5EE: A6 DE
	LDX $4C				 ; $A5F0: A6 4C
	LDX $20				 ; $A5F2: A6 20
	.byte $E7			; $A5F4
	PHP					 ; $A5F5: 08
	BIT tmp2				; $A5F6: 24 02
	ASL $1C1E			   ; $A5F8: 0E 1E 1C
	BRK					 ; $A5FB: 00
	ROL $2402			   ; $A5FC: 2E 02 24
	BIT $12				 ; $A5FF: 24 12
	ASL $0024,X			 ; $A601: 1E 24 00
	.byte $3A			; $A604
	.byte $3C			; $A605
	INC $8821,X			 ; $A606: FE 21 88
	PLP					 ; $A609: 28
	RTI					 ; $A60A: 40
	.byte $1A			; $A60B
	RTI					 ; $A60C: 40
	BRK					 ; $A60D: 00
	.byte $02			; $A60E
	.byte $1C			; $A60F
	PHP					 ; $A610: 08
	BRK					 ; $A611: 00
	ROL $38,X			   ; $A612: 36 38
	BRK					 ; $A614: 00
	LSR $48				 ; $A615: 46 48
	PHA					 ; $A617: 48
	JMP $21FE			   ; $A618: 4C FE 21
	INX					 ; $A61B: E8
	ASL					 ; $A61C: 0A
	.byte $1C			; $A61D
	.byte $12			; $A61E
	BMI $A621			   ; $A61F: 30 00
	ASL $1E				 ; $A621: 06 1E
	BIT $20				 ; $A623: 24 20
	ASL $0224,X			 ; $A625: 1E 24 02
	PLP					 ; $A628: 28
	.byte $12			; $A629
	ASL $FE1C,X			 ; $A62A: 1E 1C FE
	.byte $22			; $A62D
	TXA					 ; $A62E: 8A
	CLC					 ; $A62F: 18
	.byte $12			; $A630
	ASL $0A				 ; $A631: 06 0A
	.byte $1C			; $A633
	ROL $0A				 ; $A634: 26 0A
	PHP					 ; $A636: 08
	BRK					 ; $A637: 00
	.byte $04			; $A638
	.byte $32			; $A639
	INC $EB22,X			 ; $A63A: FE 22 EB
	BRK					 ; $A63D: 00
	.byte $1C			; $A63E
	.byte $12			; $A63F
	.byte $1C			; $A640
	PLP					 ; $A641: 28
	ASL					 ; $A642: 0A
	.byte $1C			; $A643
	PHP					 ; $A644: 08
	ASL $20FF,X			 ; $A645: 1E FF 20
	.byte $97			; $A648
	.byte $42			; $A649
	.byte $44			; $A64A
	.byte $FF			; $A64B
	AND ($8A,X)			 ; $A64C: 21 8A
	JSR $0A24			   ; $A64E: 20 24 0A
	ROL $0A				 ; $A651: 26 0A
	.byte $1C			; $A653
	PLP					 ; $A654: 28
	ASL					 ; $A655: 0A
	PHP					 ; $A656: 08
	BRK					 ; $A657: 00
	.byte $04			; $A658
	.byte $32			; $A659
	.byte $FF			; $A65A
	AND ($0D,X)			 ; $A65B: 21 0D
	SEC					 ; $A65D: 38
	.byte $12			; $A65E
	.byte $0F			; $A65F
	BRK					 ; $A660: 00
	AND #$18				; $A661: 29 18
	ASL $21FE			   ; $A663: 0E FE 21
	BVC $A681			   ; $A666: 50 19
	BPL $A669			   ; $A668: 10 FF
	AND ($AC,X)			 ; $A66A: 21 AC
	.byte $27			; $A66C
	.byte $12			; $A66D
	.byte $0B			; $A66E
	.byte $1A			; $A66F
	ASL $1C0F,X			 ; $A670: 1E 0F 1C
	BRK					 ; $A673: 00
	SBC $22FF,X			 ; $A674: FD FF 22
	.byte $07			; $A677
	SEC					 ; $A678: 38
	.byte $12			; $A679
	.byte $0F			; $A67A
	BRK					 ; $A67B: 00
	ROL $19,X			   ; $A67C: 36 19
	.byte $23			; $A67E
	.byte $0B			; $A67F
	ASL tmp0,X			  ; $A680: 16 00
	.byte $37			; $A682
	ORA $0E16,Y			 ; $A683: 19 16 0E
	.byte $13			; $A686
	.byte $0F			; $A687
	.byte $1C			; $A688
	ORA $22FF,X			 ; $A689: 1D FF 22
	.byte $03			; $A68C
	.byte $34			; $A68D
	.byte $1C			; $A68E
	.byte $13			; $A68F
	CLC					 ; $A690: 18
	ORA $1D0F			   ; $A691: 0D 0F 1D
	ORA $2500,X			 ; $A694: 1D 00 25
	ASL $0F,X			   ; $A697: 16 0F
	CLC					 ; $A699: 18
	.byte $0B			; $A69A
	ROR					 ; $A69B: 6A
	ORA $2500,X			 ; $A69C: 1D 00 25
	ASL $0F20			   ; $A69F: 0E 20 0F
	CLC					 ; $A6A2: 18
	ASL $1C1F,X			 ; $A6A3: 1E 1F 1C
	.byte $0F			; $A6A6
	.byte $FF			; $A6A7
	.byte $22			; $A6A8
	.byte $04			; $A6A9
	SEC					 ; $A6AA: 38
	.byte $0B			; $A6AB
	ASL $19,X			   ; $A6AC: 16 19
	ORA $0018,Y			 ; $A6AE: 19 18 00
	ASL $0F12,X			 ; $A6B1: 1E 12 0F
	BRK					 ; $A6B4: 00
	AND $1C				 ; $A6B5: 25 1C
	.byte $17			; $A6B7
	ORA $3100,X			 ; $A6B8: 1D 00 31
	.byte $0F			; $A6BB
	.byte $1C			; $A6BC
	ORA $0B12			   ; $A6BD: 0D 12 0B
	CLC					 ; $A6C0: 18
	ASL $22FF,X			 ; $A6C1: 1E FF 22
	.byte $04			; $A6C4
	SEC					 ; $A6C5: 38
	.byte $12			; $A6C6
	.byte $0F			; $A6C7
	BRK					 ; $A6C8: 00
	.byte $37			; $A6C9
	.byte $13			; $A6CA
	ORA $0F1E,X			 ; $A6CB: 1D 1E 0F
	.byte $1C			; $A6CE
	ORA $1900,X			 ; $A6CF: 1D 00 19
	BPL $A6D4			   ; $A6D2: 10 00
	AND ($19),Y			 ; $A6D4: 31 19
	CLC					 ; $A6D6: 18
	.byte $0C			; $A6D7
	.byte $0B			; $A6D8
	.byte $1C			; $A6D9
	.byte $0B			; $A6DA
	.byte $0C			; $A6DB
	.byte $0B			; $A6DC
	.byte $FF			; $A6DD
	.byte $22			; $A6DE
	ORA #$38				; $A6DF: 09 38
	.byte $12			; $A6E1
	.byte $0F			; $A6E2
	BRK					 ; $A6E3: 00
	.byte $27			; $A6E4
	.byte $12			; $A6E5
	ORA $0F1D,Y			 ; $A6E6: 19 1D 0F
	CLC					 ; $A6E9: 18
	BRK					 ; $A6EA: 00
	.byte $33			; $A6EB
	CLC					 ; $A6EC: 18
	.byte $0F			; $A6ED
	ORA $ADFF,X			 ; $A6EE: 1D FF AD
	.byte $02			; $A6F1
	JSR $23A9			   ; $A6F2: 20 A9 23
	STA $2006			   ; $A6F5: 8D 06 20
	LDA #$C0				; $A6F8: A9 C0
	STA $2006			   ; $A6FA: 8D 06 20
	LDA #$55				; $A6FD: A9 55
	STA $2007			   ; $A6FF: 8D 07 20
	DEX					 ; $A702: CA
	BPL $A6FF			   ; $A703: 10 FA
	RTS					 ; $A705: 60
	LDX #$17				; $A706: A2 17
	LDA #$13				; $A708: A9 13
	CPX #$04				; $A70A: E0 04
	BCS $A711			   ; $A70C: B0 03
	LDA $A718,X			 ; $A70E: BD 18 A7
	STA $05FC,X			 ; $A711: 9D FC 05
	DEX					 ; $A714: CA
	BPL $A70A			   ; $A715: 10 F3
	RTS					 ; $A717: 60
	.byte $0F			; $A718
	AND ($0F,X)			 ; $A719: 21 0F
	.byte $32			; $A71B
	LDA #$0F				; $A71C: A9 0F
	LDX #$18				; $A71E: A2 18
	STA $05FC,X			 ; $A720: 9D FC 05
	DEX					 ; $A723: CA
	BPL $A720			   ; $A724: 10 FA
	JSR $C5B9			   ; $A726: 20 B9 C5
	JMP $FF74			   ; $A729: 4C 74 FF
	LDA #$00				; $A72C: A9 00
	BEQ $A732			   ; $A72E: F0 02
	LDA #$01				; $A730: A9 01
	STA $0F				 ; $A732: 85 0F
	JSR $A77B			   ; $A734: 20 7B A7
	LDX #$1F				; $A737: A2 1F
	JSR $A6F0			   ; $A739: 20 F0 A6
	JSR $A75B			   ; $A73C: 20 5B A7
	JSR $FF74			   ; $A73F: 20 74 FF
	JSR $C58F			   ; $A742: 20 8F C5
	JSR $D218			   ; $A745: 20 18 D2
	LDA $0F				 ; $A748: A5 0F
	BEQ $A754			   ; $A74A: F0 08
	LDA $6BF9			   ; $A74C: AD F9 6B
	BEQ $A74C			   ; $A74F: F0 FB
	JSR $C8E1			   ; $A751: 20 E1 C8
	JSR $C5C5			   ; $A754: 20 C5 C5
	BRK					 ; $A757: 00
	PHP					 ; $A758: 08
	.byte $8F			; $A759
	RTS					 ; $A75A: 60
	LDX #$03				; $A75B: A2 03
	LDA $A772,X			 ; $A75D: BD 72 A7
	STA $05FC,X			 ; $A760: 9D FC 05
	DEX					 ; $A763: CA
	BPL $A75D			   ; $A764: 10 F7
	LDX $615A			   ; $A766: AE 5A 61
	LDA $A776,X			 ; $A769: BD 76 A7
	STA $0600			   ; $A76C: 8D 00 06
	JMP $C5B9			   ; $A76F: 4C B9 C5
	.byte $0F			; $A772
	BMI $A784			   ; $A773: 30 0F
	.byte $0F			; $A775
	AND ($24,X)			 ; $A776: 21 24
	ROL					 ; $A778: 2A
	.byte $23			; $A779
	BIT $C520			   ; $A77A: 2C 20 C5
	CMP $20				 ; $A77D: C5 20
	LSR $20C5			   ; $A77F: 4E C5 20
	.byte $AF			; $A782
	CMP $A9				 ; $A783: C5 A9
	BRK					 ; $A785: 00
	STA $0508			   ; $A786: 8D 08 05
	STA $0509			   ; $A789: 8D 09 05
	LDA #$90				; $A78C: A9 90
	STA $0505			   ; $A78E: 8D 05 05
	LDA #$18				; $A791: A9 18
	STA $0506			   ; $A793: 8D 06 05
	LDX #$00				; $A796: A2 00
	JSR $F3FB			   ; $A798: 20 FB F3
	LDA $0F				 ; $A79B: A5 0F
	BEQ $A7A4			   ; $A79D: F0 05
	LDA #$02				; $A79F: A9 02
	JSR $A588			   ; $A7A1: 20 88 A5
	LDA #$03				; $A7A4: A9 03
	JSR $A588			   ; $A7A6: 20 88 A5
	LDA $615A			   ; $A7A9: AD 5A 61
	CLC					 ; $A7AC: 18
	ADC #$04				; $A7AD: 69 04
	JMP $A588			   ; $A7AF: 4C 88 A5
	LDA system_flags		; $A7B2: A5 1F
	ORA #$08				; $A7B4: 09 08
	STA system_flags		; $A7B6: 85 1F
	JSR $C54E			   ; $A7B8: 20 4E C5
	JSR $AF67			   ; $A7BB: 20 67 AF
	JSR $C03A			   ; $A7BE: 20 3A C0
	JSR $C5AF			   ; $A7C1: 20 AF C5
	LDX #$00				; $A7C4: A2 00
	JSR $F3FB			   ; $A7C6: 20 FB F3
	JSR $A8A8			   ; $A7C9: 20 A8 A8
	JSR $C5A8			   ; $A7CC: 20 A8 C5
	JSR $FF74			   ; $A7CF: 20 74 FF
	LDX #$0C				; $A7D2: A2 0C
	JSR $A85A			   ; $A7D4: 20 5A A8
	JSR $C592			   ; $A7D7: 20 92 C5
	JSR $FECD			   ; $A7DA: 20 CD FE
	JSR $FF74			   ; $A7DD: 20 74 FF
	LDA $6BF9			   ; $A7E0: AD F9 6B
	STA $58				 ; $A7E3: 85 58
	LDA #$00				; $A7E5: A9 00
	STA $0D				 ; $A7E7: 85 0D
	STA $0E				 ; $A7E9: 85 0E
	STA $0F				 ; $A7EB: 85 0F
	JSR $A9F0			   ; $A7ED: 20 F0 A9
	JSR $FF10			   ; $A7F0: 20 10 FF
	JSR $A816			   ; $A7F3: 20 16 A8
	LDA $B0				 ; $A7F6: A5 B0
	AND #$20				; $A7F8: 29 20
	BNE $A803			   ; $A7FA: D0 07
	JSR $C8EC			   ; $A7FC: 20 EC C8
	LDA $14				 ; $A7FF: A5 14
	BEQ $A7ED			   ; $A801: F0 EA
	LDA system_flags		; $A803: A5 1F
	AND #$F7				; $A805: 29 F7
	STA system_flags		; $A807: 85 1F
	JSR $A82B			   ; $A809: 20 2B A8
	LDA #$30				; $A80C: A9 30
	STA $05FD			   ; $A80E: 8D FD 05
	LDA #$0E				; $A811: A9 0E
	JMP $C118			   ; $A813: 4C 18 C1
	LDX $58				 ; $A816: A6 58
	LDA $6BF9			   ; $A818: AD F9 6B
	STA $58				 ; $A81B: 85 58
	CMP #$02				; $A81D: C9 02
	BNE $A82A			   ; $A81F: D0 09
	CPX #$01				; $A821: E0 01
	BNE $A82A			   ; $A823: D0 05
	LDX #$19				; $A825: A2 19
	JSR $A85A			   ; $A827: 20 5A A8
	RTS					 ; $A82A: 60
	LDX #$26				; $A82B: A2 26
	JSR $A85A			   ; $A82D: 20 5A A8
	LDA #$10				; $A830: A9 10
	STA $16				 ; $A832: 85 16
	JSR $A83D			   ; $A834: 20 3D A8
	JSR $A83D			   ; $A837: 20 3D A8
	JSR $A83D			   ; $A83A: 20 3D A8
	JSR $C5DE			   ; $A83D: 20 DE C5
	JSR $FF10			   ; $A840: 20 10 FF
	JSR $FF10			   ; $A843: 20 10 FF
	JSR $FF10			   ; $A846: 20 10 FF
	JSR $FF10			   ; $A849: 20 10 FF
	JSR $FF10			   ; $A84C: 20 10 FF
	JSR $FF10			   ; $A84F: 20 10 FF
	LDA $16				 ; $A852: A5 16
	CLC					 ; $A854: 18
	ADC #$10				; $A855: 69 10
	STA $16				 ; $A857: 85 16
	RTS					 ; $A859: 60
	JSR $A860			   ; $A85A: 20 60 A8
	JMP $C62D			   ; $A85D: 4C 2D C6
	LDY #$0C				; $A860: A0 0C
	LDA $A874,X			 ; $A862: BD 74 A8
	STA $05FC,Y			 ; $A865: 99 FC 05
	DEX					 ; $A868: CA
	DEY					 ; $A869: 88
	BPL $A862			   ; $A86A: 10 F6
	LDA #$3C				; $A86C: A9 3C
	STA $060B			   ; $A86E: 8D 0B 06
	JMP $C5B9			   ; $A871: 4C B9 C5
	.byte $3C			; $A874
	JSR $2C3C			   ; $A875: 20 3C 2C
	ASL $2C				 ; $A878: 06 2C
	BIT $3C3C			   ; $A87A: 2C 3C 3C
	.byte $3C			; $A87D
	.byte $3C			; $A87E
	.byte $3C			; $A87F
	.byte $3C			; $A880
	ASL $20,X			   ; $A881: 16 20
	.byte $37			; $A883
	ASL $20				 ; $A884: 06 20
	ASL $26				 ; $A886: 06 26
	PHP					 ; $A888: 08
	BPL $A8C1			   ; $A889: 10 36
	BMI $A89D			   ; $A88B: 30 10
	BRK					 ; $A88D: 00
	.byte $0F			; $A88E
	JSR $0637			   ; $A88F: 20 37 06
	JSR $2606			   ; $A892: 20 06 26
	.byte $0F			; $A895
	.byte $0F			; $A896
	.byte $0F			; $A897
	BMI $A8AA			   ; $A898: 30 10
	BRK					 ; $A89A: 00
	.byte $3C			; $A89B
	JSR $2C3C			   ; $A89C: 20 3C 2C
	ASL $2C				 ; $A89F: 06 2C
	BIT $3C3C			   ; $A8A1: 2C 3C 3C
	.byte $3C			; $A8A4
	BMI $A8B7			   ; $A8A5: 30 10
	BRK					 ; $A8A7: 00
	JSR $A9A2			   ; $A8A8: 20 A2 A9
	LDA $A9AF			   ; $A8AB: AD AF A9
	STA tmp0				; $A8AE: 85 00
	LDA $A9B0			   ; $A8B0: AD B0 A9
	STA tmp1				; $A8B3: 85 01
	LDA #$04				; $A8B5: A9 04
	STA ptr0_lo			 ; $A8B7: 85 04
	LDX #$00				; $A8B9: A2 00
	LDY #$00				; $A8BB: A0 00
	JSR $A969			   ; $A8BD: 20 69 A9
	STX tmp3				; $A8C0: 86 03
	LDX tmp3				; $A8C2: A6 03
	JSR $A969			   ; $A8C4: 20 69 A9
	DEC ptr0_lo			 ; $A8C7: C6 04
	BNE $A8C2			   ; $A8C9: D0 F7
	JSR $A969			   ; $A8CB: 20 69 A9
	JSR $A91E			   ; $A8CE: 20 1E A9
	JSR $A9B1			   ; $A8D1: 20 B1 A9
	JSR $A8D8			   ; $A8D4: 20 D8 A8
	RTS					 ; $A8D7: 60
	LDA $2002			   ; $A8D8: AD 02 20
	LDA #$18				; $A8DB: A9 18
	STA $2006			   ; $A8DD: 8D 06 20
	LDA #$C0				; $A8E0: A9 C0
	STA $2006			   ; $A8E2: 8D 06 20
	LDA #$03				; $A8E5: A9 03
	STA tmp0				; $A8E7: 85 00
	LDX #$09				; $A8E9: A2 09
	JSR $A902			   ; $A8EB: 20 02 A9
	DEC tmp0				; $A8EE: C6 00
	TXA					 ; $A8F0: 8A
	BEQ $A8F6			   ; $A8F1: F0 03
	JSR $A902			   ; $A8F3: 20 02 A9
	INC tmp0				; $A8F6: E6 00
	DEX					 ; $A8F8: CA
	BPL $A8EB			   ; $A8F9: 10 F0
	DEC tmp0				; $A8FB: C6 00
	DEC tmp0				; $A8FD: C6 00
	BPL $A8E9			   ; $A8FF: 10 E8
	RTS					 ; $A901: 60
	TXA					 ; $A902: 8A
	PHA					 ; $A903: 48
	LDX tmp0				; $A904: A6 00
	LDY $A91A,X			 ; $A906: BC 1A A9
	LDX #$00				; $A909: A2 00
	LDA $FA8B,Y			 ; $A90B: B9 8B FA
	STA $2007			   ; $A90E: 8D 07 20
	INY					 ; $A911: C8
	INX					 ; $A912: E8
	CPX #$10				; $A913: E0 10
	BNE $A90B			   ; $A915: D0 F4
	PLA					 ; $A917: 68
	TAX					 ; $A918: AA
	RTS					 ; $A919: 60
	BRK					 ; $A91A: 00
	BPL $A95D			   ; $A91B: 10 40
	BVC $A8C1			   ; $A91D: 50 A2
	.byte $0B			; $A91F
	LDA $A93F,X			 ; $A920: BD 3F A9
	STA tmp2				; $A923: 85 02
	DEX					 ; $A925: CA
	LDY $A93F,X			 ; $A926: BC 3F A9
	DEX					 ; $A929: CA
	LDA $A93F,X			 ; $A92A: BD 3F A9
	STA tmp3				; $A92D: 85 03
	LDA tmp3				; $A92F: A5 03
	STA $78C0,Y			 ; $A931: 99 C0 78
	INY					 ; $A934: C8
	INC tmp3				; $A935: E6 03
	DEC tmp2				; $A937: C6 02
	BNE $A92F			   ; $A939: D0 F4
	DEX					 ; $A93B: CA
	BPL $A920			   ; $A93C: 10 E2
	RTS					 ; $A93E: 60
	STY $0906			   ; $A93F: 8C 06 09
	STA ptr_lo,X			; $A942: 95 10
	ASL					 ; $A944: 0A
	.byte $9F			; $A945
	ROL $09				 ; $A946: 26 09
	TAY					 ; $A948: A8
	BMI $A955			   ; $A949: 30 0A
	LDA $A973,X			 ; $A94B: BD 73 A9
	STA (tmp0),Y			; $A94E: 91 00
	INY					 ; $A950: C8
	LDA $A974,X			 ; $A951: BD 74 A9
	STA (tmp0),Y			; $A954: 91 00
	DEY					 ; $A956: 88
	LDA tmp0				; $A957: A5 00
	CLC					 ; $A959: 18
	ADC #$02				; $A95A: 69 02
	STA tmp0				; $A95C: 85 00
	BCC $A962			   ; $A95E: 90 02
	INC tmp1				; $A960: E6 01
	DEC tmp2				; $A962: C6 02
	BNE $A94B			   ; $A964: D0 E5
	INX					 ; $A966: E8
	INX					 ; $A967: E8
	INX					 ; $A968: E8
	LDA $A972,X			 ; $A969: BD 72 A9
	STA tmp2				; $A96C: 85 02
	BNE $A94B			   ; $A96E: D0 DB
	INX					 ; $A970: E8
	RTS					 ; $A971: 60
	ORA ($80,X)			 ; $A972: 01 80
	STA ($0A,X)			 ; $A974: 81 0A
	.byte $82			; $A976
	STA (tmp1,X)			; $A977: 81 01
	.byte $82			; $A979
	.byte $83			; $A97A
	.byte $04			; $A97B
	BRK					 ; $A97C: 00
	BRK					 ; $A97D: 00
	BRK					 ; $A97E: 00
	ORA ($84,X)			 ; $A97F: 01 84
	SBC ($0A,X)			 ; $A981: E1 0A
	.byte $E2			; $A983
	SBC (tmp1,X)			; $A984: E1 01
	.byte $E2			; $A986
	STX ptr0_lo			 ; $A987: 86 04
	BRK					 ; $A989: 00
	BRK					 ; $A98A: 00
	ORA ($85,X)			 ; $A98B: 01 85
	SBC $0A				 ; $A98D: E5 0A
	INC $E5				 ; $A98F: E6 E5
	ORA ($E6,X)			 ; $A991: 01 E6
	.byte $87			; $A993
	.byte $04			; $A994
	BRK					 ; $A995: 00
	BRK					 ; $A996: 00
	BRK					 ; $A997: 00
	ORA ($88,X)			 ; $A998: 01 88
	.byte $89			; $A99A
	ASL					 ; $A99B: 0A
	TXA					 ; $A99C: 8A
	.byte $89			; $A99D
	ORA ($8A,X)			 ; $A99E: 01 8A
	.byte $8B			; $A9A0
	BRK					 ; $A9A1: 00
	LDA #$00				; $A9A2: A9 00
	TAY					 ; $A9A4: A8
	STA $7800,Y			 ; $A9A5: 99 00 78
	STA $7900,Y			 ; $A9A8: 99 00 79
	INY					 ; $A9AB: C8
	BNE $A9A5			   ; $A9AC: D0 F7
	RTS					 ; $A9AE: 60
	STY $78				 ; $A9AF: 84 78
	LDA $2002			   ; $A9B1: AD 02 20
	LDA #$20				; $A9B4: A9 20
	STA $2006			   ; $A9B6: 8D 06 20
	LDA #$00				; $A9B9: A9 00
	STA $2006			   ; $A9BB: 8D 06 20
	LDY #$00				; $A9BE: A0 00
	LDA $7800,Y			 ; $A9C0: B9 00 78
	STA $2007			   ; $A9C3: 8D 07 20
	INY					 ; $A9C6: C8
	BNE $A9C0			   ; $A9C7: D0 F7
	LDA $7900,Y			 ; $A9C9: B9 00 79
	STA $2007			   ; $A9CC: 8D 07 20
	INY					 ; $A9CF: C8
	CPY #$C0				; $A9D0: C0 C0
	BNE $A9C9			   ; $A9D2: D0 F5
	LDA #$23				; $A9D4: A9 23
	STA $2006			   ; $A9D6: 8D 06 20
	LDA #$C0				; $A9D9: A9 C0
	STA $2006			   ; $A9DB: 8D 06 20
	LDA #$FF				; $A9DE: A9 FF
	LDX #$17				; $A9E0: A2 17
	JSR $A9E9			   ; $A9E2: 20 E9 A9
	LDA #$5F				; $A9E5: A9 5F
	LDX #$07				; $A9E7: A2 07
	STA $2007			   ; $A9E9: 8D 07 20
	DEX					 ; $A9EC: CA
	BPL $A9E9			   ; $A9ED: 10 FA
	RTS					 ; $A9EF: 60
	LDA $0E				 ; $A9F0: A5 0E
	CLC					 ; $A9F2: 18
	ADC #$20				; $A9F3: 69 20
	STA $0E				 ; $A9F5: 85 0E
	BCC $A9FB			   ; $A9F7: 90 02
	INC $0F				 ; $A9F9: E6 0F
	LDA $0F				 ; $A9FB: A5 0F
	CMP #$24				; $A9FD: C9 24
	BEQ $AA1E			   ; $A9FF: F0 1D
	CMP #$40				; $AA01: C9 40
	BCC $AA1D			   ; $AA03: 90 18
	LDA $0E				 ; $AA05: A5 0E
	AND #$60				; $AA07: 29 60
	BNE $AA11			   ; $AA09: D0 06
	LDA $0D				 ; $AA0B: A5 0D
	CMP #$98				; $AA0D: C9 98
	BCC $AA5A			   ; $AA0F: 90 49
	LDA $0F				 ; $AA11: A5 0F
	CMP #$92				; $AA13: C9 92
	BEQ $AA26			   ; $AA15: F0 0F
	CMP #$FF				; $AA17: C9 FF
	BNE $AA1D			   ; $AA19: D0 02
	DEC $0F				 ; $AA1B: C6 0F
	RTS					 ; $AA1D: 60
	LDX #$33				; $AA1E: A2 33
	JSR $A860			   ; $AA20: 20 60 A8
	JMP $C626			   ; $AA23: 4C 26 C6
	LDX #$20				; $AA26: A2 20
	LDA $AA39,X			 ; $AA28: BD 39 AA
	STA $0300,X			 ; $AA2B: 9D 00 03
	DEX					 ; $AA2E: CA
	BPL $AA28			   ; $AA2F: 10 F7
	LDA #$05				; $AA31: A9 05
	STA $050B			   ; $AA33: 8D 0B 05
	JMP $C626			   ; $AA36: 4C 26 C6
	LDY #$02				; $AA39: A0 02
	CLV					 ; $AA3B: B8
	.byte $C2			; $AA3C
	.byte $C3			; $AA3D
	LDA (ptr0_lo,X)		 ; $AA3E: A1 04
	ROL $B3B2			   ; $AA40: 2E B2 B3
	LDY $B5,X			   ; $AA43: B4 B5
	LDA (ptr0_lo,X)		 ; $AA45: A1 04
	LSR $B7B6			   ; $AA47: 4E B6 B7
	CLV					 ; $AA4A: B8
	LDA $04A1,Y			 ; $AA4B: B9 A1 04
	ROR $BBBA			   ; $AA4E: 6E BA BB
	LDY $A1E1,X			 ; $AA51: BC E1 A1
	.byte $04			; $AA54
	STX $BFBE			   ; $AA55: 8E BE BF
	CPY #$E5				; $AA58: C0 E5
	LDA $0D				 ; $AA5A: A5 0D
	AND #$07				; $AA5C: 29 07
	TAX					 ; $AA5E: AA
	LDA $AAED,X			 ; $AA5F: BD ED AA
	STA tmp3				; $AA62: 85 03
	EOR #$FF				; $AA64: 49 FF
	STA ptr0_lo			 ; $AA66: 85 04
	LDA #$02				; $AA68: A9 02
	STA tmp2				; $AA6A: 85 02
	LDA #$00				; $AA6C: A9 00
	STA tmp1				; $AA6E: 85 01
	LDA $0D				 ; $AA70: A5 0D
	AND #$F8				; $AA72: 29 F8
	ASL					 ; $AA74: 0A
	STA tmp0				; $AA75: 85 00
	BCC $AA7B			   ; $AA77: 90 02
	INC tmp1				; $AA79: E6 01
	LDX tmp2				; $AA7B: A6 02
	LDY $AAE9,X			 ; $AA7D: BC E9 AA
	LDA $AAE5,X			 ; $AA80: BD E5 AA
	CLC					 ; $AA83: 18
	ADC tmp0				; $AA84: 65 00
	STA $0302,Y			 ; $AA86: 99 02 03
	LDA $AAE6,X			 ; $AA89: BD E6 AA
	ADC tmp1				; $AA8C: 65 01
	STA $0300,Y			 ; $AA8E: 99 00 03
	LDA #$10				; $AA91: A9 10
	STA $0301,Y			 ; $AA93: 99 01 03
	STY $06				 ; $AA96: 84 06
	LDA tmp0				; $AA98: A5 00
	CLC					 ; $AA9A: 18
	ADC $AAF5,X			 ; $AA9B: 7D F5 AA
	STA tmp0				; $AA9E: 85 00
	LDA tmp1				; $AAA0: A5 01
	ADC $AAF6,X			 ; $AAA2: 7D F6 AA
	STA tmp1				; $AAA5: 85 01
	LDA $0D				 ; $AAA7: A5 0D
	LSR					 ; $AAA9: 4A
	BCC $AAAD			   ; $AAAA: 90 01
	INX					 ; $AAAC: E8
	LDA $AAE1,X			 ; $AAAD: BD E1 AA
	STA ptr0_hi			 ; $AAB0: 85 05
	LDY #$00				; $AAB2: A0 00
	LDX ptr0_hi			 ; $AAB4: A6 05
	LDA $FA8B,X			 ; $AAB6: BD 8B FA
	AND tmp3				; $AAB9: 25 03
	LDX $06				 ; $AABB: A6 06
	STA $0303,X			 ; $AABD: 9D 03 03
	LDA (tmp0),Y			; $AAC0: B1 00
	AND ptr0_lo			 ; $AAC2: 25 04
	ORA $0303,X			 ; $AAC4: 1D 03 03
	STA $0303,X			 ; $AAC7: 9D 03 03
	INC ptr0_hi			 ; $AACA: E6 05
	INC $06				 ; $AACC: E6 06
	INY					 ; $AACE: C8
	CPY #$10				; $AACF: C0 10
	BNE $AAB4			   ; $AAD1: D0 E1
	INC $050B			   ; $AAD3: EE 0B 05
	DEC tmp2				; $AAD6: C6 02
	DEC tmp2				; $AAD8: C6 02
	BPL $AA6C			   ; $AADA: 10 90
	INC $0D				 ; $AADC: E6 0D
	JMP $C626			   ; $AADE: 4C 26 C6
	BVC $AB23			   ; $AAE1: 50 40
	BPL $AAE5			   ; $AAE3: 10 00
	CPY #$98				; $AAE5: C0 98
	BEQ $AA82			   ; $AAE7: F0 99
	BRK					 ; $AAE9: 00
	BRK					 ; $AAEA: 00
	.byte $13			; $AAEB
	.byte $13			; $AAEC
	.byte $7F			; $AAED
	.byte $3F			; $AAEE
	.byte $1F			; $AAEF
	.byte $0F			; $AAF0
	.byte $07			; $AAF1
	.byte $03			; $AAF2
	ORA (tmp0,X)			; $AAF3: 01 00
	.byte $3B			; $AAF5
	SBC $6B,X			   ; $AAF6: F5 6B
	INC $08,X			   ; $AAF8: F6 08
	LDA $615A			   ; $AAFA: AD 5A 61
	ASL					 ; $AAFD: 0A
	TAX					 ; $AAFE: AA
	LDA $AC5B,X			 ; $AAFF: BD 5B AC
	STA tmp0				; $AB02: 85 00
	LDA $AC5C,X			 ; $AB04: BD 5C AC
	STA tmp1				; $AB07: 85 01
	PLP					 ; $AB09: 28
	JMP ($0000)			 ; $AB0A: 6C 00 00
	LDA $6283			   ; $AB0D: AD 83 62
	AND #$A0				; $AB10: 29 A0
	CMP #$80				; $AB12: C9 80
	BNE $AB38			   ; $AB14: D0 22
	LDA $63				 ; $AB16: A5 63
	CMP #$02				; $AB18: C9 02
	BNE $AB38			   ; $AB1A: D0 1C
	LDA $64				 ; $AB1C: A5 64
	CMP #$00				; $AB1E: C9 00
	BNE $AB38			   ; $AB20: D0 16
	BRK					 ; $AB22: 00
	ASL					 ; $AB23: 0A
	.byte $EB			; $AB24
	.byte $04			; $AB25
	BEQ $AB38			   ; $AB26: F0 10
	LDA #$80				; $AB28: A9 80
	STA $6282			   ; $AB2A: 8D 82 62
	BRK					 ; $AB2D: 00
	ASL $DB				 ; $AB2E: 06 DB
	.byte $BF			; $AB30
	LDX #$03				; $AB31: A2 03
	LDA #$46				; $AB33: A9 46
	JMP $ABB6			   ; $AB35: 4C B6 AB
	RTS					 ; $AB38: 60
	BCS $AB41			   ; $AB39: B0 06
	LDA $64				 ; $AB3B: A5 64
	CMP #$00				; $AB3D: C9 00
	BNE $AB51			   ; $AB3F: D0 10
	BRK					 ; $AB41: 00
	.byte $0C			; $AB42
	.byte $EB			; $AB43
	CLC					 ; $AB44: 18
	BEQ $AB51			   ; $AB45: F0 0A
	BRK					 ; $AB47: 00
	AND $A22F			   ; $AB48: 2D 2F A2
	.byte $03			; $AB4B
	LDA #$8B				; $AB4C: A9 8B
	JMP $ABB6			   ; $AB4E: 4C B6 AB
	RTS					 ; $AB51: 60
	LDA $63				 ; $AB52: A5 63
	CMP #$3A				; $AB54: C9 3A
	BNE $AB74			   ; $AB56: D0 1C
	LDA $44				 ; $AB58: A5 44
	CMP #$1F				; $AB5A: C9 1F
	BNE $AB74			   ; $AB5C: D0 16
	LDA #$02				; $AB5E: A9 02
	STA $3D				 ; $AB60: 85 3D
	BRK					 ; $AB62: 00
	ROL $A2EF,X			 ; $AB63: 3E EF A2
	INY					 ; $AB66: C8
	JSR $C90C			   ; $AB67: 20 0C C9
	JSR $C5C5			   ; $AB6A: 20 C5 C5
	LDA #$7C				; $AB6D: A9 7C
	LDX #$03				; $AB6F: A2 03
	JMP $ABB6			   ; $AB71: 4C B6 AB
	RTS					 ; $AB74: 60
	BRK					 ; $AB75: 00
	.byte $0F			; $AB76
	.byte $EB			; $AB77
	BPL $AB6A			   ; $AB78: 10 F0
	.byte $2B			; $AB7A
	LDA $63				 ; $AB7B: A5 63
	CMP #$04				; $AB7D: C9 04
	BNE $AB8C			   ; $AB7F: D0 0B
	BRK					 ; $AB81: 00
	.byte $13			; $AB82
	.byte $DB			; $AB83
	INC $ACA9,X			 ; $AB84: FE A9 AC
	LDX #$03				; $AB87: A2 03
	JMP $ABB6			   ; $AB89: 4C B6 AB
	CMP #$11				; $AB8C: C9 11
	BNE $ABA6			   ; $AB8E: D0 16
	DEC $42				 ; $AB90: C6 42
	LDA #$80				; $AB92: A9 80
	STA $0533			   ; $AB94: 8D 33 05
	LDA #$18				; $AB97: A9 18
	STA $0532			   ; $AB99: 8D 32 05
	LDA #$8A				; $AB9C: A9 8A
	STA $0530			   ; $AB9E: 8D 30 05
	LDA #$0F				; $ABA1: A9 0F
	STA $0531			   ; $ABA3: 8D 31 05
	BRK					 ; $ABA6: 00
	ROL $EB				 ; $ABA7: 26 EB
	JSR $09F0			   ; $ABA9: 20 F0 09
	LDA $63				 ; $ABAC: A5 63
	CMP #$3E				; $ABAE: C9 3E
	BNE $ABB5			   ; $ABB0: D0 03
	JMP $AC65			   ; $ABB2: 4C 65 AC
	RTS					 ; $ABB5: 60
	PHA					 ; $ABB6: 48
	TXA					 ; $ABB7: 8A
	PHA					 ; $ABB8: 48
	LDA #$04				; $ABB9: A9 04
	BRK					 ; $ABBB: 00
	.byte $12			; $ABBC
	.byte $2F			; $ABBD
	BRK					 ; $ABBE: 00
	.byte $04			; $ABBF
	.byte $9F			; $ABC0
	JSR $C54E			   ; $ABC1: 20 4E C5
	LDA #$30				; $ABC4: A9 30
	STA $05FD			   ; $ABC6: 8D FD 05
	LDA #$80				; $ABC9: A9 80
	STA $6BDE			   ; $ABCB: 8D DE 6B
	BRK					 ; $ABCE: 00
	.byte $07			; $ABCF
	.byte $6F			; $ABD0
	.byte $43			; $ABD1
	JSR $C5BF			   ; $ABD2: 20 BF C5
	LDA #$00				; $ABD5: A9 00
	STA $6BDE			   ; $ABD7: 8D DE 6B
	PLA					 ; $ABDA: 68
	TAX					 ; $ABDB: AA
	PLA					 ; $ABDC: 68
	BRK					 ; $ABDD: 00
	.byte $04			; $ABDE
	.byte $6F			; $ABDF
	JSR $D218			   ; $ABE0: 20 18 D2
	LDA $615A			   ; $ABE3: AD 5A 61
	CLC					 ; $ABE6: 18
	ADC #$25				; $ABE7: 69 25
	BRK					 ; $ABE9: 00
	.byte $03			; $ABEA
	.byte $9F			; $ABEB
	SEC					 ; $ABEC: 38
	ROR $6282			   ; $ABED: 6E 82 62
	JSR $A730			   ; $ABF0: 20 30 A7
	JSR $C54E			   ; $ABF3: 20 4E C5
	LDA #$80				; $ABF6: A9 80
	STA $6BDE			   ; $ABF8: 8D DE 6B
	BRK					 ; $ABFB: 00
	.byte $07			; $ABFC
	.byte $6F			; $ABFD
	.byte $43			; $ABFE
	JSR $C5BF			   ; $ABFF: 20 BF C5
	INC $615A			   ; $AC02: EE 5A 61
	LDA $615A			   ; $AC05: AD 5A 61
	STA $FD				 ; $AC08: 85 FD
	LDA #$00				; $AC0A: A9 00
	STA $FE				 ; $AC0C: 85 FE
	STA $FF				 ; $AC0E: 85 FF
	BRK					 ; $AC10: 00
	ASL $DB,X			   ; $AC11: 16 DB
	.byte $7F			; $AC13
	BRK					 ; $AC14: 00
	ORA $7FDB			   ; $AC15: 0D DB 7F
	BRK					 ; $AC18: 00
	.byte $0B			; $AC19
	.byte $DB			; $AC1A
	.byte $FB			; $AC1B
	BRK					 ; $AC1C: 00
	ASL					 ; $AC1D: 0A
	.byte $DB			; $AC1E
	.byte $3F			; $AC1F
	BRK					 ; $AC20: 00
	ASL $DB				 ; $AC21: 06 DB
	.byte $BF			; $AC23
	BRK					 ; $AC24: 00
	.byte $1F			; $AC25
	.byte $FB			; $AC26
	LDA #$00				; $AC27: A9 00
	STA $6BDE			   ; $AC29: 8D DE 6B
	BRK					 ; $AC2C: 00
	LDX $203B,Y			 ; $AC2D: BE 3B 20
	.byte $43			; $AC30
	LDY $1B90			   ; $AC31: AC 90 1B
	LDA #$00				; $AC34: A9 00
	STA $6BDE			   ; $AC36: 8D DE 6B
	BRK					 ; $AC39: 00
	.byte $BF			; $AC3A
	.byte $3B			; $AC3B
	JSR $AC43			   ; $AC3C: 20 43 AC
	BCS $AC27			   ; $AC3F: B0 E6
	BCC $AC52			   ; $AC41: 90 0F
	LDA #$80				; $AC43: A9 80
	STA $6BDE			   ; $AC45: 8D DE 6B
	BRK					 ; $AC48: 00
	.byte $07			; $AC49
	.byte $6F			; $AC4A
	PHA					 ; $AC4B: 48
	CMP #$01				; $AC4C: C9 01
	RTS					 ; $AC4E: 60
	BRK					 ; $AC4F: 00
	ASL $002F			   ; $AC50: 0E 2F 00
	.byte $04			; $AC53
	.byte $9F			; $AC54
	LDX #$FF				; $AC55: A2 FF
	TXS					 ; $AC57: 9A
	JMP $C974			   ; $AC58: 4C 74 C9
	ORA $39AB			   ; $AC5B: 0D AB 39
	.byte $AB			; $AC5E
	.byte $52			; $AC5F
	.byte $AB			; $AC60
	ADC $AB,X			   ; $AC61: 75 AB
	LDX $AB				 ; $AC63: A6 AB
	LDA system_flags		; $AC65: A5 1F
	ORA #$08				; $AC67: 09 08
	STA system_flags		; $AC69: 85 1F
	LDA #$00				; $AC6B: A9 00
	STA $0513			   ; $AC6D: 8D 13 05
	JSR $AD49			   ; $AC70: 20 49 AD
	JSR $AE32			   ; $AC73: 20 32 AE
	JMP $AC7C			   ; $AC76: 4C 7C AC
	JSR $C5C5			   ; $AC79: 20 C5 C5
	JSR $AE80			   ; $AC7C: 20 80 AE
	BRK					 ; $AC7F: 00
	ORA ($87,X)			 ; $AC80: 01 87
	JSR $ACEA			   ; $AC82: 20 EA AC
	JSR $ACB5			   ; $AC85: 20 B5 AC
	LDA $41				 ; $AC88: A5 41
	BPL $ACA6			   ; $AC8A: 10 1A
	DEC $6B				 ; $AC8C: C6 6B
	BNE $AC85			   ; $AC8E: D0 F5
	LDY #$00				; $AC90: A0 00
	LDA ($69),Y			 ; $AC92: B1 69
	CMP #$FF				; $AC94: C9 FF
	BNE $AC79			   ; $AC96: D0 E1
	LDX #$78				; $AC98: A2 78
	JSR $C90C			   ; $AC9A: 20 0C C9
	JSR $B54C			   ; $AC9D: 20 4C B5
	JSR $C031			   ; $ACA0: 20 31 C0
	JMP $C0E9			   ; $ACA3: 4C E9 C0
	LDA $0530			   ; $ACA6: AD 30 05
	BMI $AC85			   ; $ACA9: 30 DA
	LDA #$00				; $ACAB: A9 00
	STA $3C				 ; $ACAD: 85 3C
	BRK					 ; $ACAF: 00
	CLC					 ; $ACB0: 18
	.byte $EF			; $ACB1
	JMP $AC90			   ; $ACB2: 4C 90 AC
	LDX #$10				; $ACB5: A2 10
	TXA					 ; $ACB7: 8A
	PHA					 ; $ACB8: 48
	JSR $ACC5			   ; $ACB9: 20 C5 AC
	JSR $C9ED			   ; $ACBC: 20 ED C9
	PLA					 ; $ACBF: 68
	TAX					 ; $ACC0: AA
	DEX					 ; $ACC1: CA
	BNE $ACB7			   ; $ACC2: D0 F3
	RTS					 ; $ACC4: 60
	LDA $41				 ; $ACC5: A5 41
	BPL $ACDB			   ; $ACC7: 10 12
	LDA #$8F				; $ACC9: A9 8F
	STA $0530			   ; $ACCB: 8D 30 05
	LDA #$01				; $ACCE: A9 01
	STA $0531			   ; $ACD0: 8D 31 05
	LDA #$00				; $ACD3: A9 00
	STA $0533			   ; $ACD5: 8D 33 05
	STA $0532			   ; $ACD8: 8D 32 05
	LDA #$80				; $ACDB: A9 80
	STA $6BE7			   ; $ACDD: 8D E7 6B
	STA $6BE8			   ; $ACE0: 8D E8 6B
	STA $6BE9			   ; $ACE3: 8D E9 6B
	STA $6BEA			   ; $ACE6: 8D EA 6B
	RTS					 ; $ACE9: 60
	LDA $41				 ; $ACEA: A5 41
	BPL $AD19			   ; $ACEC: 10 2B
	BRK					 ; $ACEE: 00
	.byte $1A			; $ACEF
	.byte $EF			; $ACF0
	LDA #$00				; $ACF1: A9 00
	STA $3D				 ; $ACF3: 85 3D
	BRK					 ; $ACF5: 00
	.byte $3C			; $ACF6
	.byte $EF			; $ACF7
	JSR $C5AF			   ; $ACF8: 20 AF C5
	LDA $2002			   ; $ACFB: AD 02 20
	LDA #$10				; $ACFE: A9 10
	STA $2006			   ; $AD00: 8D 06 20
	LDA #$00				; $AD03: A9 00
	STA $2006			   ; $AD05: 8D 06 20
	LDX #$1F				; $AD08: A2 1F
	STA $2007			   ; $AD0A: 8D 07 20
	STA $6F40,X			 ; $AD0D: 9D 40 6F
	DEX					 ; $AD10: CA
	BPL $AD0A			   ; $AD11: 10 F7
	JSR $C58F			   ; $AD13: 20 8F C5
	JMP $C5BF			   ; $AD16: 4C BF C5
	LDA #$1E				; $AD19: A9 1E
	STA $62ED			   ; $AD1B: 8D ED 62
	BRK					 ; $AD1E: 00
	.byte $33			; $AD1F
	.byte $EF			; $AD20
	BRK					 ; $AD21: 00
	ROL					 ; $AD22: 2A
	.byte $EB			; $AD23
	RTI					 ; $AD24: 40
	BEQ $AD2F			   ; $AD25: F0 08
	LDA #$0F				; $AD27: A9 0F
	STA $060A			   ; $AD29: 8D 0A 06
	JSR $C5BF			   ; $AD2C: 20 BF C5
	LDA #$00				; $AD2F: A9 00
	STA $3C				 ; $AD31: 85 3C
	BRK					 ; $AD33: 00
	PHP					 ; $AD34: 08
	.byte $EF			; $AD35
	BRK					 ; $AD36: 00
	ROL					 ; $AD37: 2A
	.byte $EB			; $AD38
	RTI					 ; $AD39: 40
	BNE $AD48			   ; $AD3A: D0 0C
	LDA #$0F				; $AD3C: A9 0F
	STA $060A			   ; $AD3E: 8D 0A 06
	JSR $C5BF			   ; $AD41: 20 BF C5
	BRK					 ; $AD44: 00
	ROL					 ; $AD45: 2A
	.byte $CB			; $AD46
	RTI					 ; $AD47: 40
	RTS					 ; $AD48: 60
	BRK					 ; $AD49: 00
	.byte $04			; $AD4A
	.byte $9F			; $AD4B
	JSR $FF74			   ; $AD4C: 20 74 FF
	LDA $BB				 ; $AD4F: A5 BB
	BNE $AD4C			   ; $AD51: D0 F9
	LDX #$3C				; $AD53: A2 3C
	JSR $C90C			   ; $AD55: 20 0C C9
	BRK					 ; $AD58: 00
	AND ($FB),Y			 ; $AD59: 31 FB
	LDX #$00				; $AD5B: A2 00
	JSR $C90C			   ; $AD5D: 20 0C C9
	JSR $C54E			   ; $AD60: 20 4E C5
	JSR $AF67			   ; $AD63: 20 67 AF
	LDX #$78				; $AD66: A2 78
	JSR $C90C			   ; $AD68: 20 0C C9
	JSR $C037			   ; $AD6B: 20 37 C0
	JSR $FECD			   ; $AD6E: 20 CD FE
	JSR $FF74			   ; $AD71: 20 74 FF
	LDA #$00				; $AD74: A9 00
	STA $0508			   ; $AD76: 8D 08 05
	STA $0509			   ; $AD79: 8D 09 05
	LDA $0505			   ; $AD7C: AD 05 05
	AND #$FC				; $AD7F: 29 FC
	STA $0505			   ; $AD81: 8D 05 05
	LDA $AE06			   ; $AD84: AD 06 AE
	STA tmp0				; $AD87: 85 00
	LDA $AE07			   ; $AD89: AD 07 AE
	STA tmp1				; $AD8C: 85 01
	LDA #$06				; $AD8E: A9 06
	STA tmp2				; $AD90: 85 02
	LDY #$07				; $AD92: A0 07
	LDA (tmp0),Y			; $AD94: B1 00
	STA $05FC,Y			 ; $AD96: 99 FC 05
	DEY					 ; $AD99: 88
	BPL $AD94			   ; $AD9A: 10 F8
	LDA tmp0				; $AD9C: A5 00
	CLC					 ; $AD9E: 18
	ADC #$07				; $AD9F: 69 07
	STA tmp0				; $ADA1: 85 00
	BCC $ADA7			   ; $ADA3: 90 02
	INC tmp1				; $ADA5: E6 01
	JSR $C5B9			   ; $ADA7: 20 B9 C5
	LDA tmp2				; $ADAA: A5 02
	CMP #$06				; $ADAC: C9 06
	BNE $ADB3			   ; $ADAE: D0 03
	JSR $FF74			   ; $ADB0: 20 74 FF
	JSR $C592			   ; $ADB3: 20 92 C5
	LDX #$C8				; $ADB6: A2 C8
	JSR $ADF5			   ; $ADB8: 20 F5 AD
	LDY tmp2				; $ADBB: A4 02
	LDX $ADFF,Y			 ; $ADBD: BE FF AD
	JSR $ADF5			   ; $ADC0: 20 F5 AD
	DEC tmp2				; $ADC3: C6 02
	BNE $AD92			   ; $ADC5: D0 CB
	LDA #$0F				; $ADC7: A9 0F
	STA $05FC			   ; $ADC9: 8D FC 05
	JSR $ADD4			   ; $ADCC: 20 D4 AD
	LDA #$0E				; $ADCF: A9 0E
	JMP $C118			   ; $ADD1: 4C 18 C1
	LDA #$10				; $ADD4: A9 10
	STA $16				 ; $ADD6: 85 16
	JSR $ADE1			   ; $ADD8: 20 E1 AD
	JSR $ADE1			   ; $ADDB: 20 E1 AD
	JSR $ADE1			   ; $ADDE: 20 E1 AD
	JSR $C5DE			   ; $ADE1: 20 DE C5
	JSR $FF10			   ; $ADE4: 20 10 FF
	JSR $FF10			   ; $ADE7: 20 10 FF
	JSR $FF10			   ; $ADEA: 20 10 FF
	LDA $16				 ; $ADED: A5 16
	CLC					 ; $ADEF: 18
	ADC #$10				; $ADF0: 69 10
	STA $16				 ; $ADF2: 85 16
	RTS					 ; $ADF4: 60
	TXA					 ; $ADF5: 8A
	PHA					 ; $ADF6: 48
	JSR $FF10			   ; $ADF7: 20 10 FF
	PLA					 ; $ADFA: 68
	TAX					 ; $ADFB: AA
	DEX					 ; $ADFC: CA
	BNE $ADF5			   ; $ADFD: D0 F6
	RTS					 ; $ADFF: 60
	BVC $ADCA			   ; $AE00: 50 C8
	.byte $73			; $AE02
	.byte $73			; $AE03
	.byte $73			; $AE04
	EOR ($08),Y			 ; $AE05: 51 08
	LDX $0C0F			   ; $AE07: AE 0F 0C
	.byte $0F			; $AE0A
	.byte $0F			; $AE0B
	JSR $0C0F			   ; $AE0C: 20 0F 0C
	.byte $0C			; $AE0F
	.byte $1C			; $AE10
	.byte $0C			; $AE11
	.byte $0F			; $AE12
	JSR $1C0F			   ; $AE13: 20 0F 1C
	.byte $02			; $AE16
	BIT $0F1C			   ; $AE17: 2C 1C 0F
	JSR $1C0F			   ; $AE1A: 20 0F 1C
	ORA ($3C),Y			 ; $AE1D: 11 3C
	BIT $2002			   ; $AE1F: 2C 02 20
	.byte $02			; $AE22
	.byte $22			; $AE23
	AND ($20,X)			 ; $AE24: 21 20
	AND ($12),Y			 ; $AE26: 31 12
	JSR $3212			   ; $AE28: 20 12 32
	.byte $12			; $AE2B
	JSR $023C			   ; $AE2C: 20 3C 02
	JSR $2202			   ; $AE2F: 20 02 22
	BRK					 ; $AE32: 00
	ORA $80CB			   ; $AE33: 0D CB 80
	LDA #$00				; $AE36: A9 00
	STA $65				 ; $AE38: 85 65
	LDA #$89				; $AE3A: A9 89
	STA $42				 ; $AE3C: 85 42
	STA $6197			   ; $AE3E: 8D 97 61
	LDA #$86				; $AE41: A9 86
	STA $43				 ; $AE43: 85 43
	STA $6198			   ; $AE45: 8D 98 61
	LDA #$02				; $AE48: A9 02
	STA $0515			   ; $AE4A: 8D 15 05
	LDA $AEDD			   ; $AE4D: AD DD AE
	STA $69				 ; $AE50: 85 69
	LDA $AEDE			   ; $AE52: AD DE AE
	STA $6A				 ; $AE55: 85 6A
	LDA #$21				; $AE57: A9 21
	STA $618E			   ; $AE59: 8D 8E 61
	BRK					 ; $AE5C: 00
	ROL					 ; $AE5D: 2A
	.byte $CB			; $AE5E
	.byte $80			; $AE5F
	JSR $C5AF			   ; $AE60: 20 AF C5
	LDX #$00				; $AE63: A2 00
	JSR $AE7A			   ; $AE65: 20 7A AE
	LDX #$01				; $AE68: A2 01
	JSR $AE7A			   ; $AE6A: 20 7A AE
	LDX #$02				; $AE6D: A2 02
	JSR $AE7A			   ; $AE6F: 20 7A AE
	LDX #$03				; $AE72: A2 03
	JSR $AE7A			   ; $AE74: 20 7A AE
	JMP $C58F			   ; $AE77: 4C 8F C5
	LDA #$53				; $AE7A: A9 53
	BRK					 ; $AE7C: 00
	.byte $0B			; $AE7D
	.byte $87			; $AE7E
	RTS					 ; $AE7F: 60
	LDY #$00				; $AE80: A0 00
	LDA ($69),Y			 ; $AE82: B1 69
	BMI $AEAE			   ; $AE84: 30 28
	STA $63				 ; $AE86: 85 63
	JSR $AEA5			   ; $AE88: 20 A5 AE
	STA $64				 ; $AE8B: 85 64
	JSR $AEA5			   ; $AE8D: 20 A5 AE
	STA $44				 ; $AE90: 85 44
	JSR $AEA5			   ; $AE92: 20 A5 AE
	STA $45				 ; $AE95: 85 45
	JSR $AEA5			   ; $AE97: 20 A5 AE
	STA $62ED			   ; $AE9A: 8D ED 62
	AND #$7F				; $AE9D: 29 7F
	STA $6B				 ; $AE9F: 85 6B
	LDA #$80				; $AEA1: A9 80
	STA $41				 ; $AEA3: 85 41
	INC $69				 ; $AEA5: E6 69
	BNE $AEAB			   ; $AEA7: D0 02
	INC $6A				 ; $AEA9: E6 6A
	LDA ($69),Y			 ; $AEAB: B1 69
	RTS					 ; $AEAD: 60
	STA $0530			   ; $AEAE: 8D 30 05
	JSR $AEA5			   ; $AEB1: 20 A5 AE
	STA $51				 ; $AEB4: 85 51
	JSR $AEA5			   ; $AEB6: 20 A5 AE
	STA $52				 ; $AEB9: 85 52
	JSR $AEA5			   ; $AEBB: 20 A5 AE
	STA $0531			   ; $AEBE: 8D 31 05
	TAX					 ; $AEC1: AA
	JSR $AEA5			   ; $AEC2: 20 A5 AE
	LDY #$00				; $AEC5: A0 00
	LDA ($51),Y			 ; $AEC7: B1 51
	STA $7E00,Y			 ; $AEC9: 99 00 7E
	INY					 ; $AECC: C8
	DEX					 ; $AECD: CA
	BNE $AEC7			   ; $AECE: D0 F7
	LDA #$00				; $AED0: A9 00
	STA $41				 ; $AED2: 85 41
	STA $0532			   ; $AED4: 8D 32 05
	LDA #$7E				; $AED7: A9 7E
	STA $0533			   ; $AED9: 8D 33 05
	RTS					 ; $AEDC: 60
	.byte $DF			; $AEDD
	LDX $003E			   ; $AEDE: AE 3E 00
	ORA $1505			   ; $AEE1: 0D 05 15
	.byte $8F			; $AEE4
	ROL					 ; $AEE5: 2A
	.byte $AF			; $AEE6
	.byte $0B			; $AEE7
	ORA (tmp0,X)			; $AEE8: 01 00
	.byte $0F			; $AEEA
	ORA $15,X			   ; $AEEB: 15 15
	ORA (tmp1,X)			; $AEED: 01 01
	ORA #$0B				; $AEEF: 09 0B
	.byte $0F			; $AEF1
	ORA (tmp2,X)			; $AEF2: 01 02
	ASL					 ; $AEF4: 0A
	ORA $14				 ; $AEF5: 05 14
	.byte $8F			; $AEF7
	AND $AF,X			   ; $AEF8: 35 AF
	.byte $0C			; $AEFA
	.byte $02			; $AEFB
	ORA (ptr_lo,X)		  ; $AEFC: 01 10
	.byte $17			; $AEFE
	ROL					 ; $AEFF: 2A
	.byte $8F			; $AF00
	EOR ($AF,X)			 ; $AF01: 41 AF
	ASL					 ; $AF03: 0A
	.byte $04			; $AF04
	BRK					 ; $AF05: 00
	ORA #$15				; $AF06: 09 15
	ORA $4B8F,X			 ; $AF08: 1D 8F 4B
	.byte $AF			; $AF0B
	.byte $0B			; $AF0C
	.byte $17			; $AF0D
	BRK					 ; $AF0E: 00
	ASL $1E05			   ; $AF0F: 0E 05 1E
	.byte $8F			; $AF12
	LSR $AF,X			   ; $AF13: 56 AF
	.byte $04			; $AF15
	ORA tmp0,X			  ; $AF16: 15 00
	.byte $13			; $AF18
	ORA $19,X			   ; $AF19: 15 19
	ORA tmp3,X			  ; $AF1B: 15 03
	.byte $0C			; $AF1D
	.byte $0C			; $AF1E
	.byte $9B			; $AF1F
	STA $AF5A			   ; $AF20: 8D 5A AF
	ORA $0214			   ; $AF23: 0D 14 02
	ORA $4710			   ; $AF26: 0D 10 47
	.byte $FF			; $AF29
	.byte $4F			; $AF2A
	LSR					 ; $AF2B: 4A
	.byte $1F			; $AF2C
	.byte $1F			; $AF2D
	.byte $1F			; $AF2E
	.byte $1F			; $AF2F
	.byte $4F			; $AF30
	.byte $4F			; $AF31
	.byte $4F			; $AF32
	.byte $4F			; $AF33
	LSR $4F4F			   ; $AF34: 4E 4F 4F
	.byte $4F			; $AF37
	.byte $4F			; $AF38
	.byte $4F			; $AF39
	.byte $1F			; $AF3A
	.byte $1F			; $AF3B
	ORA $4F,X			   ; $AF3C: 15 4F
	.byte $4F			; $AF3E
	.byte $4F			; $AF3F
	JMP $2A2F			   ; $AF40: 4C 2F 2A
	.byte $4F			; $AF43
	.byte $4F			; $AF44
	.byte $4F			; $AF45
	.byte $2F			; $AF46
	.byte $2F			; $AF47
	AND ($4F,X)			 ; $AF48: 21 4F
	EOR ($2F,X)			 ; $AF4A: 41 2F
	EOR $4F				 ; $AF4C: 45 4F
	.byte $4F			; $AF4E
	EOR $2F				 ; $AF4F: 45 2F
	.byte $2F			; $AF51
	.byte $2F			; $AF52
	.byte $2F			; $AF53
	AND $2F4B			   ; $AF54: 2D 4B 2F
	.byte $2F			; $AF57
	STY $2C				 ; $AF58: 84 2C
	.byte $2F			; $AF5A
	.byte $2F			; $AF5B
	.byte $2F			; $AF5C
	AND #$8F				; $AF5D: 29 8F
	.byte $8F			; $AF5F
	.byte $8F			; $AF60
	.byte $8F			; $AF61
	.byte $8F			; $AF62
	.byte $8F			; $AF63
	STX $2F				 ; $AF64: 86 2F
	AND #$A0				; $AF66: 29 A0
	STA $B9				 ; $AF68: 85 B9
	.byte $72			; $AF6A
	.byte $AF			; $AF6B
	STA $77FF,Y			 ; $AF6C: 99 FF 77
	DEY					 ; $AF6F: 88
	BNE $AF69			   ; $AF70: D0 F7
	RTS					 ; $AF72: 60
	.byte $FF			; $AF73
	.byte $FF			; $AF74
	.byte $FF			; $AF75
	.byte $FF			; $AF76
	.byte $F7			; $AF77
	.byte $7F			; $AF78
	.byte $FF			; $AF79
	.byte $FF			; $AF7A
	.byte $F7			; $AF7B
	.byte $FF			; $AF7C
	.byte $DF			; $AF7D
	.byte $FF			; $AF7E
	.byte $DF			; $AF7F
	INC $FFF7,X			 ; $AF80: FE F7 FF
	.byte $FF			; $AF83
	.byte $FF			; $AF84
	.byte $FF			; $AF85
	ROR $FFFF,X			 ; $AF86: 7E FF FF
	.byte $FF			; $AF89
	.byte $DF			; $AF8A
	.byte $07			; $AF8B
	.byte $03			; $AF8C
	.byte $07			; $AF8D
	.byte $03			; $AF8E
	.byte $07			; $AF8F
	.byte $03			; $AF90
	ASL $1F0F,X			 ; $AF91: 1E 0F 1F
	.byte $0F			; $AF94
	.byte $07			; $AF95
	ORA ($FF,X)			 ; $AF96: 01 FF
	.byte $FF			; $AF98
	INC $FFFF,X			 ; $AF99: FE FF FF
	.byte $FF			; $AF9C
	.byte $FF			; $AF9D
	.byte $FF			; $AF9E
	.byte $FF			; $AF9F
	.byte $FF			; $AFA0
	.byte $1F			; $AFA1
	.byte $1F			; $AFA2
	.byte $FF			; $AFA3
	.byte $FF			; $AFA4
	INC $FFFF,X			 ; $AFA5: FE FF FF
	.byte $FF			; $AFA8
	.byte $FF			; $AFA9
	.byte $FF			; $AFAA
	.byte $03			; $AFAB
	.byte $03			; $AFAC
	BRK					 ; $AFAD: 00
	.byte $FF			; $AFAE
	CPX $00FF			   ; $AFAF: EC FF 00
	ASL $0F				 ; $AFB2: 06 0F
	.byte $0F			; $AFB4
	.byte $C7			; $AFB5
	.byte $FF			; $AFB6
	BRK					 ; $AFB7: 00
	.byte $FF			; $AFB8
	.byte $FB			; $AFB9
	.byte $FF			; $AFBA
	ASL $7F				 ; $AFBB: 06 7F
	ASL $0F				 ; $AFBD: 06 0F
	.byte $1F			; $AFBF
	.byte $FF			; $AFC0
	.byte $07			; $AFC1
	.byte $1F			; $AFC2
	.byte $03			; $AFC3
	.byte $0F			; $AFC4
	SEC					 ; $AFC5: 38
	.byte $3F			; $AFC6
	.byte $1C			; $AFC7
	.byte $FF			; $AFC8
	.byte $77			; $AFC9
	.byte $FF			; $AFCA
	ASL $FF				 ; $AFCB: 06 FF
	BVC $AFCE			   ; $AFCD: 50 FF
	ASL $FF				 ; $AFCF: 06 FF
	ROR $3DFF,X			 ; $AFD1: 7E FF 3D
	.byte $FF			; $AFD4
	JSR $19FF			   ; $AFD5: 20 FF 19
	.byte $FF			; $AFD8
	CMP $00FF,Y			 ; $AFD9: D9 FF 00
	.byte $FF			; $AFDC
	BRK					 ; $AFDD: 00
	.byte $FF			; $AFDE
	BRK					 ; $AFDF: 00
	.byte $FF			; $AFE0
	CPX #$FF				; $AFE1: E0 FF
	LDY #$FF				; $AFE3: A0 FF
	ASL $FF,X			   ; $AFE5: 16 FF
	BCS $AFE8			   ; $AFE7: B0 FF
	BRK					 ; $AFE9: 00
	.byte $FF			; $AFEA
	BRK					 ; $AFEB: 00
	.byte $FF			; $AFEC
	CPY #$FF				; $AFED: C0 FF
	.byte $B3			; $AFEF
	.byte $FF			; $AFF0
	BRK					 ; $AFF1: 00
	.byte $FF			; $AFF2
	BRK					 ; $AFF3: 00
	.byte $FF			; $AFF4
	BRK					 ; $AFF5: 00
	.byte $FF			; $AFF6
	JSR $D1F3			   ; $AFF7: 20 F3 D1
	LDX #$1E				; $AFFA: A2 1E
	JSR $C90C			   ; $AFFC: 20 0C C9
	JSR $C543			   ; $AFFF: 20 43 C5
	LDX #$00				; $B002: A2 00
	LDY #$00				; $B004: A0 00
	JSR $B309			   ; $B006: 20 09 B3
	JSR $B32A			   ; $B009: 20 2A B3
	JSR $B0F2			   ; $B00C: 20 F2 B0
	JSR $B4D6			   ; $B00F: 20 D6 B4
	JSR $B05E			   ; $B012: 20 5E B0
	JSR $B32E			   ; $B015: 20 2E B3
	JSR $C543			   ; $B018: 20 43 C5
	JSR $FF74			   ; $B01B: 20 74 FF
	LDA $62ED			   ; $B01E: AD ED 62
	CMP #$78				; $B021: C9 78
	BCS $B02C			   ; $B023: B0 07
	LDA #$8C				; $B025: A9 8C
	STA $62ED			   ; $B027: 8D ED 62
	BNE $B031			   ; $B02A: D0 05
	LDA #$00				; $B02C: A9 00
	STA $62ED			   ; $B02E: 8D ED 62
	BRK					 ; $B031: 00
	ORA $00EF,Y			 ; $B032: 19 EF 00
	.byte $27			; $B035
	.byte $EF			; $B036
	LDA $41				 ; $B037: A5 41
	BMI $B03F			   ; $B039: 30 04
	BRK					 ; $B03B: 00
	ROL $60EF,X			 ; $B03C: 3E EF 60
	LDA $63				 ; $B03F: A5 63
	CMP #$0E				; $B041: C9 0E
	BNE $B049			   ; $B043: D0 04
	LDA #$00				; $B045: A9 00
	STA $3D				 ; $B047: 85 3D
	BRK					 ; $B049: 00
	BRK					 ; $B04A: 00
	.byte $E7			; $B04B
	BRK					 ; $B04C: 00
	PHP					 ; $B04D: 08
	.byte $87			; $B04E
	BRK					 ; $B04F: 00
	ASL $A9EF,X			 ; $B050: 1E EF A9
	.byte $FF			; $B053
	STA $0598			   ; $B054: 8D 98 05
	STA $054E			   ; $B057: 8D 4E 05
	STA $054F			   ; $B05A: 8D 4F 05
	RTS					 ; $B05D: 60
	LDA #$00				; $B05E: A9 00
	STA $53				 ; $B060: 85 53
	LDA $53				 ; $B062: A5 53
	PHA					 ; $B064: 48
	JSR $B0DC			   ; $B065: 20 DC B0
	JSR $B0DC			   ; $B068: 20 DC B0
	JSR $B0DC			   ; $B06B: 20 DC B0
	JSR $B0DC			   ; $B06E: 20 DC B0
	PLA					 ; $B071: 68
	STA $53				 ; $B072: 85 53
	JSR $B0DC			   ; $B074: 20 DC B0
	JSR $B0DC			   ; $B077: 20 DC B0
	JSR $B0DC			   ; $B07A: 20 DC B0
	JSR $B0DC			   ; $B07D: 20 DC B0
	LDA $53				 ; $B080: A5 53
	CMP #$0C				; $B082: C9 0C
	BCC $B062			   ; $B084: 90 DC
	LDA #$10				; $B086: A9 10
	STA $16				 ; $B088: 85 16
	LDA $53				 ; $B08A: A5 53
	SEC					 ; $B08C: 38
	SBC #$04				; $B08D: E9 04
	STA $53				 ; $B08F: 85 53
	JSR $B09A			   ; $B091: 20 9A B0
	JSR $B09A			   ; $B094: 20 9A B0
	JSR $B09A			   ; $B097: 20 9A B0
	JSR $B0DC			   ; $B09A: 20 DC B0
	JSR $B32E			   ; $B09D: 20 2E B3
	JSR $C5DE			   ; $B0A0: 20 DE C5
	LDA $16				 ; $B0A3: A5 16
	CLC					 ; $B0A5: 18
	ADC #$10				; $B0A6: 69 10
	STA $16				 ; $B0A8: 85 16
	JSR $C543			   ; $B0AA: 20 43 C5
	JMP $B32A			   ; $B0AD: 4C 2A B3
	LDA #$0B				; $B0B0: A9 0B
	STA $53				 ; $B0B2: 85 53
	LDA $53				 ; $B0B4: A5 53
	PHA					 ; $B0B6: 48
	JSR $B0E7			   ; $B0B7: 20 E7 B0
	JSR $B0E7			   ; $B0BA: 20 E7 B0
	JSR $B0E7			   ; $B0BD: 20 E7 B0
	JSR $B0E7			   ; $B0C0: 20 E7 B0
	PLA					 ; $B0C3: 68
	STA $53				 ; $B0C4: 85 53
	JSR $B0E7			   ; $B0C6: 20 E7 B0
	JSR $B0E7			   ; $B0C9: 20 E7 B0
	JSR $B0E7			   ; $B0CC: 20 E7 B0
	JSR $B0E7			   ; $B0CF: 20 E7 B0
	LDA $53				 ; $B0D2: A5 53
	CMP #$FF				; $B0D4: C9 FF
	BNE $B0B4			   ; $B0D6: D0 DC
	JSR $B0EC			   ; $B0D8: 20 EC B0
	RTS					 ; $B0DB: 60
	JSR $B36F			   ; $B0DC: 20 6F B3
	INC $53				 ; $B0DF: E6 53
	JSR $B112			   ; $B0E1: 20 12 B1
	JMP $B511			   ; $B0E4: 4C 11 B5
	JSR $B36F			   ; $B0E7: 20 6F B3
	DEC $53				 ; $B0EA: C6 53
	JSR $B112			   ; $B0EC: 20 12 B1
	JMP $B511			   ; $B0EF: 4C 11 B5
	JSR $B13D			   ; $B0F2: 20 3D B1
	JSR $B158			   ; $B0F5: 20 58 B1
	JSR $B2C8			   ; $B0F8: 20 C8 B2
	JSR $B149			   ; $B0FB: 20 49 B1
	LDA $4B				 ; $B0FE: A5 4B
	CLC					 ; $B100: 18
	ADC #$B0				; $B101: 69 B0
	STA $4B				 ; $B103: 85 4B
	BCC $B109			   ; $B105: 90 02
	INC $4C				 ; $B107: E6 4C
	INC $52				 ; $B109: E6 52
	LDA $52				 ; $B10B: A5 52
	CMP #$0B				; $B10D: C9 0B
	BCC $B0F5			   ; $B10F: 90 E4
	RTS					 ; $B111: 60
	LDX #$02				; $B112: A2 02
	LDY #$00				; $B114: A0 00
	JSR $B309			   ; $B116: 20 09 B3
	JSR $B143			   ; $B119: 20 43 B1
	LDX #$02				; $B11C: A2 02
	LDY #$02				; $B11E: A0 02
	JSR $B309			   ; $B120: 20 09 B3
	LDX #$02				; $B123: A2 02
	JSR $B319			   ; $B125: 20 19 B3
	JSR $B346			   ; $B128: 20 46 B3
	JSR $B176			   ; $B12B: 20 76 B1
	JSR $B2C8			   ; $B12E: 20 C8 B2
	JSR $B164			   ; $B131: 20 64 B1
	INC $52				 ; $B134: E6 52
	LDA $52				 ; $B136: A5 52
	CMP #$06				; $B138: C9 06
	BCC $B123			   ; $B13A: 90 E7
	RTS					 ; $B13C: 60
	JSR $B182			   ; $B13D: 20 82 B1
	JMP $B2C3			   ; $B140: 4C C3 B2
	JSR $B198			   ; $B143: 20 98 B1
	JMP $B2C3			   ; $B146: 4C C3 B2
	LDA $75C0			   ; $B149: AD C0 75
	CLC					 ; $B14C: 18
	ADC #$B0				; $B14D: 69 B0
	STA $75C0			   ; $B14F: 8D C0 75
	BCC $B157			   ; $B152: 90 03
	INC $75BB			   ; $B154: EE BB 75
	RTS					 ; $B157: 60
	LDA $52				 ; $B158: A5 52
	CMP #$0A				; $B15A: C9 0A
	BCC $B163			   ; $B15C: 90 05
	LDA #$60				; $B15E: A9 60
	STA $7A96			   ; $B160: 8D 96 7A
	RTS					 ; $B163: 60
	LDA $75C0			   ; $B164: AD C0 75
	CLC					 ; $B167: 18
	ADC #$33				; $B168: 69 33
	STA $75C0			   ; $B16A: 8D C0 75
	LDA $75BB			   ; $B16D: AD BB 75
	ADC #$01				; $B170: 69 01
	STA $75BB			   ; $B172: 8D BB 75
	RTS					 ; $B175: 60
	LDA $52				 ; $B176: A5 52
	CMP #$05				; $B178: C9 05
	BCC $B181			   ; $B17A: 90 05
	LDA #$60				; $B17C: A9 60
	STA $7BB9			   ; $B17E: 8D B9 7B
	RTS					 ; $B181: 60
	LDY #$00				; $B182: A0 00
	JSR $B1AE			   ; $B184: 20 AE B1
	LDX #$B0				; $B187: A2 B0
	LDA $52				 ; $B189: A5 52
	CMP #$0A				; $B18B: C9 0A
	BCC $B191			   ; $B18D: 90 02
	LDX #$50				; $B18F: A2 50
	JSR $B262			   ; $B191: 20 62 B2
	DEX					 ; $B194: CA
	BNE $B191			   ; $B195: D0 FA
	RTS					 ; $B197: 60
	LDY #$00				; $B198: A0 00
	JSR $B219			   ; $B19A: 20 19 B2
	LDX #$00				; $B19D: A2 00
	JSR $B293			   ; $B19F: 20 93 B2
	DEX					 ; $B1A2: CA
	BNE $B19F			   ; $B1A3: D0 FA
	LDX #$33				; $B1A5: A2 33
	JSR $B293			   ; $B1A7: 20 93 B2
	DEX					 ; $B1AA: CA
	BNE $B1A7			   ; $B1AB: D0 FA
	RTS					 ; $B1AD: 60
	LDA $B209			   ; $B1AE: AD 09 B2
	STA ($49),Y			 ; $B1B1: 91 49
	INY					 ; $B1B3: C8
	LDA $B20A			   ; $B1B4: AD 0A B2
	STA ($49),Y			 ; $B1B7: 91 49
	INY					 ; $B1B9: C8
	LDA $B20B			   ; $B1BA: AD 0B B2
	STA ($49),Y			 ; $B1BD: 91 49
	INY					 ; $B1BF: C8
	LDA $B20C			   ; $B1C0: AD 0C B2
	STA ($49),Y			 ; $B1C3: 91 49
	INY					 ; $B1C5: C8
	LDA $B20D			   ; $B1C6: AD 0D B2
	STA ($49),Y			 ; $B1C9: 91 49
	INY					 ; $B1CB: C8
	LDA $B20E			   ; $B1CC: AD 0E B2
	STA ($49),Y			 ; $B1CF: 91 49
	INY					 ; $B1D1: C8
	LDA $B20F			   ; $B1D2: AD 0F B2
	STA ($49),Y			 ; $B1D5: 91 49
	INY					 ; $B1D7: C8
	LDA $B210			   ; $B1D8: AD 10 B2
	STA ($49),Y			 ; $B1DB: 91 49
	INY					 ; $B1DD: C8
	LDA $B211			   ; $B1DE: AD 11 B2
	STA ($49),Y			 ; $B1E1: 91 49
	INY					 ; $B1E3: C8
	LDA $B212			   ; $B1E4: AD 12 B2
	STA ($49),Y			 ; $B1E7: 91 49
	INY					 ; $B1E9: C8
	LDA $B213			   ; $B1EA: AD 13 B2
	STA ($49),Y			 ; $B1ED: 91 49
	INY					 ; $B1EF: C8
	LDA $B214			   ; $B1F0: AD 14 B2
	STA ($49),Y			 ; $B1F3: 91 49
	INY					 ; $B1F5: C8
	LDA $B215			   ; $B1F6: AD 15 B2
	STA ($49),Y			 ; $B1F9: 91 49
	INY					 ; $B1FB: C8
	TYA					 ; $B1FC: 98
	CLC					 ; $B1FD: 18
	ADC $49				 ; $B1FE: 65 49
	STA $49				 ; $B200: 85 49
	BCC $B206			   ; $B202: 90 02
	INC $4A				 ; $B204: E6 4A
	LDY #$00				; $B206: A0 00
	RTS					 ; $B208: 60
	LDA #$18				; $B209: A9 18
	STA $2006			   ; $B20B: 8D 06 20
	LDA #$D0				; $B20E: A9 D0
	STA $2006			   ; $B210: 8D 06 20
	LDA $2007			   ; $B213: AD 07 20
	STA ($4B),Y			 ; $B216: 91 4B
	INY					 ; $B218: C8
	LDA $B209			   ; $B219: AD 09 B2
	STA ($49),Y			 ; $B21C: 91 49
	INY					 ; $B21E: C8
	LDA $B20A			   ; $B21F: AD 0A B2
	STA ($49),Y			 ; $B222: 91 49
	INY					 ; $B224: C8
	LDA $B20B			   ; $B225: AD 0B B2
	STA ($49),Y			 ; $B228: 91 49
	INY					 ; $B22A: C8
	LDA $B20C			   ; $B22B: AD 0C B2
	STA ($49),Y			 ; $B22E: 91 49
	INY					 ; $B230: C8
	LDA $B20D			   ; $B231: AD 0D B2
	STA ($49),Y			 ; $B234: 91 49
	INY					 ; $B236: C8
	LDA $B20E			   ; $B237: AD 0E B2
	STA ($49),Y			 ; $B23A: 91 49
	INY					 ; $B23C: C8
	LDA $B20F			   ; $B23D: AD 0F B2
	STA ($49),Y			 ; $B240: 91 49
	INY					 ; $B242: C8
	LDA $B210			   ; $B243: AD 10 B2
	STA ($49),Y			 ; $B246: 91 49
	INY					 ; $B248: C8
	LDA $B211			   ; $B249: AD 11 B2
	STA ($49),Y			 ; $B24C: 91 49
	INY					 ; $B24E: C8
	LDA $B212			   ; $B24F: AD 12 B2
	STA ($49),Y			 ; $B252: 91 49
	INY					 ; $B254: C8
	TYA					 ; $B255: 98
	CLC					 ; $B256: 18
	ADC $49				 ; $B257: 65 49
	STA $49				 ; $B259: 85 49
	BCC $B25F			   ; $B25B: 90 02
	INC $4A				 ; $B25D: E6 4A
	LDY #$00				; $B25F: A0 00
	RTS					 ; $B261: 60
	LDA $B213			   ; $B262: AD 13 B2
	STA ($49),Y			 ; $B265: 91 49
	INY					 ; $B267: C8
	LDA $B214			   ; $B268: AD 14 B2
	STA ($49),Y			 ; $B26B: 91 49
	INY					 ; $B26D: C8
	LDA $B215			   ; $B26E: AD 15 B2
	STA ($49),Y			 ; $B271: 91 49
	INY					 ; $B273: C8
	LDA $B216			   ; $B274: AD 16 B2
	STA ($49),Y			 ; $B277: 91 49
	INY					 ; $B279: C8
	LDA $B217			   ; $B27A: AD 17 B2
	STA ($49),Y			 ; $B27D: 91 49
	INY					 ; $B27F: C8
	LDA $B218			   ; $B280: AD 18 B2
	STA ($49),Y			 ; $B283: 91 49
	INY					 ; $B285: C8
	TYA					 ; $B286: 98
	CLC					 ; $B287: 18
	ADC $49				 ; $B288: 65 49
	STA $49				 ; $B28A: 85 49
	BCC $B290			   ; $B28C: 90 02
	INC $4A				 ; $B28E: E6 4A
	LDY #$00				; $B290: A0 00
	RTS					 ; $B292: 60
	LDA $B2BE			   ; $B293: AD BE B2
	STA ($49),Y			 ; $B296: 91 49
	INY					 ; $B298: C8
	LDA $B2BF			   ; $B299: AD BF B2
	STA ($49),Y			 ; $B29C: 91 49
	INY					 ; $B29E: C8
	LDA $B2C0			   ; $B29F: AD C0 B2
	STA ($49),Y			 ; $B2A2: 91 49
	INY					 ; $B2A4: C8
	LDA $B2C1			   ; $B2A5: AD C1 B2
	STA ($49),Y			 ; $B2A8: 91 49
	INY					 ; $B2AA: C8
	LDA $B2C2			   ; $B2AB: AD C2 B2
	STA ($49),Y			 ; $B2AE: 91 49
	INY					 ; $B2B0: C8
	TYA					 ; $B2B1: 98
	CLC					 ; $B2B2: 18
	ADC $49				 ; $B2B3: 65 49
	STA $49				 ; $B2B5: 85 49
	BCC $B2BB			   ; $B2B7: 90 02
	INC $4A				 ; $B2B9: E6 4A
	LDY #$00				; $B2BB: A0 00
	RTS					 ; $B2BD: 60
	LDA #$00				; $B2BE: A9 00
	STA $2007			   ; $B2C0: 8D 07 20
	LDA #$60				; $B2C3: A9 60
	STA ($49),Y			 ; $B2C5: 91 49
	RTS					 ; $B2C7: 60
	LDA #$80				; $B2C8: A9 80
	STA $51				 ; $B2CA: 85 51
	LDY #$00				; $B2CC: A0 00
	BIT $51				 ; $B2CE: 24 51
	BMI $B2CE			   ; $B2D0: 30 FC
	RTS					 ; $B2D2: 60
	PHA					 ; $B2D3: 48
	TXA					 ; $B2D4: 8A
	PHA					 ; $B2D5: 48
	TYA					 ; $B2D6: 98
	PHA					 ; $B2D7: 48
	BIT $2002			   ; $B2D8: 2C 02 20
	BIT $51				 ; $B2DB: 24 51
	BPL $B2E4			   ; $B2DD: 10 05
	LSR $51				 ; $B2DF: 46 51
	JSR $75BA			   ; $B2E1: 20 BA 75
	LDA #$3F				; $B2E4: A9 3F
	STA $2006			   ; $B2E6: 8D 06 20
	LDA #$00				; $B2E9: A9 00
	STA $2006			   ; $B2EB: 8D 06 20
	LDA $05FC			   ; $B2EE: AD FC 05
	STA $2007			   ; $B2F1: 8D 07 20
	LDA $0505			   ; $B2F4: AD 05 05
	STA $2000			   ; $B2F7: 8D 00 20
	LDA $0508			   ; $B2FA: AD 08 05
	STA $2005			   ; $B2FD: 8D 05 20
	LDA $0509			   ; $B300: AD 09 05
	STA $2005			   ; $B303: 8D 05 20
	JMP $C1A0			   ; $B306: 4C A0 C1
	LDA #$00				; $B309: A9 00
	STA $51				 ; $B30B: 85 51
	STA $52				 ; $B30D: 85 52
	LDA $B324,Y			 ; $B30F: B9 24 B3
	STA $49				 ; $B312: 85 49
	LDA $B325,Y			 ; $B314: B9 25 B3
	STA $4A				 ; $B317: 85 4A
	LDA $B326,X			 ; $B319: BD 26 B3
	STA $4B				 ; $B31C: 85 4B
	LDA $B327,X			 ; $B31E: BD 27 B3
	STA $4C				 ; $B321: 85 4C
	RTS					 ; $B323: 60
	TSX					 ; $B324: BA
	ADC $8A,X			   ; $B325: 75 8A
	ROR $75C5			   ; $B327: 6E C5 75
	LDX #$00				; $B32A: A2 00
	BEQ $B332			   ; $B32C: F0 04
	LDX #$02				; $B32E: A2 02
	BNE $B335			   ; $B330: D0 03
	JSR $FF74			   ; $B332: 20 74 FF
	LDA $B342,X			 ; $B335: BD 42 B3
	STA $0503			   ; $B338: 8D 03 05
	LDA $B343,X			 ; $B33B: BD 43 B3
	STA $0504			   ; $B33E: 8D 04 05
	RTS					 ; $B341: 60
	.byte $D3			; $B342
	.byte $B2			; $B343
	.byte $5A			; $B344
	CMP ($A0,X)			 ; $B345: C1 A0
	BRK					 ; $B347: 00
	LDX #$00				; $B348: A2 00
	JSR $B359			   ; $B34A: 20 59 B3
	INX					 ; $B34D: E8
	BNE $B34A			   ; $B34E: D0 FA
	LDX #$33				; $B350: A2 33
	JSR $B359			   ; $B352: 20 59 B3
	DEX					 ; $B355: CA
	BNE $B352			   ; $B356: D0 FA
	RTS					 ; $B358: 60
	LDA ($49),Y			 ; $B359: B1 49
	STA ($4B),Y			 ; $B35B: 91 4B
	INC $49				 ; $B35D: E6 49
	BNE $B363			   ; $B35F: D0 02
	INC $4A				 ; $B361: E6 4A
	LDA $4B				 ; $B363: A5 4B
	CLC					 ; $B365: 18
	ADC #$05				; $B366: 69 05
	STA $4B				 ; $B368: 85 4B
	BCC $B36E			   ; $B36A: 90 02
	INC $4C				 ; $B36C: E6 4C
	RTS					 ; $B36E: 60
	LDX #$00				; $B36F: A2 00
	JSR $B319			   ; $B371: 20 19 B3
	LDX #$73				; $B374: A2 73
	JSR $B37D			   ; $B376: 20 7D B3
	DEX					 ; $B379: CA
	BNE $B376			   ; $B37A: D0 FA
	RTS					 ; $B37C: 60
	LDY #$00				; $B37D: A0 00
	JSR $B38E			   ; $B37F: 20 8E B3
	LDA $4B				 ; $B382: A5 4B
	CLC					 ; $B384: 18
	ADC #$10				; $B385: 69 10
	STA $4B				 ; $B387: 85 4B
	BCC $B38D			   ; $B389: 90 02
	INC $4C				 ; $B38B: E6 4C
	RTS					 ; $B38D: 60
	JSR $B391			   ; $B38E: 20 91 B3
	LDA $53				 ; $B391: A5 53
	AND #$02				; $B393: 29 02
	BNE $B3BC			   ; $B395: D0 25
	JSR $B419			   ; $B397: 20 19 B4
	STA ($4B),Y			 ; $B39A: 91 4B
	INY					 ; $B39C: C8
	STA ($4B),Y			 ; $B39D: 91 4B
	INY					 ; $B39F: C8
	JSR $B3E9			   ; $B3A0: 20 E9 B3
	STA ($4B),Y			 ; $B3A3: 91 4B
	INY					 ; $B3A5: C8
	STA ($4B),Y			 ; $B3A6: 91 4B
	INY					 ; $B3A8: C8
	JSR $B3F4			   ; $B3A9: 20 F4 B3
	STA ($4B),Y			 ; $B3AC: 91 4B
	INY					 ; $B3AE: C8
	STA ($4B),Y			 ; $B3AF: 91 4B
	INY					 ; $B3B1: C8
	JSR $B3E9			   ; $B3B2: 20 E9 B3
	STA ($4B),Y			 ; $B3B5: 91 4B
	INY					 ; $B3B7: C8
	STA ($4B),Y			 ; $B3B8: 91 4B
	INY					 ; $B3BA: C8
	RTS					 ; $B3BB: 60
	INY					 ; $B3BC: C8
	JSR $B419			   ; $B3BD: 20 19 B4
	STA ($4B),Y			 ; $B3C0: 91 4B
	DEY					 ; $B3C2: 88
	STA ($4B),Y			 ; $B3C3: 91 4B
	INY					 ; $B3C5: C8
	INY					 ; $B3C6: C8
	INY					 ; $B3C7: C8
	JSR $B3FF			   ; $B3C8: 20 FF B3
	STA ($4B),Y			 ; $B3CB: 91 4B
	DEY					 ; $B3CD: 88
	STA ($4B),Y			 ; $B3CE: 91 4B
	INY					 ; $B3D0: C8
	INY					 ; $B3D1: C8
	INY					 ; $B3D2: C8
	JSR $B40C			   ; $B3D3: 20 0C B4
	STA ($4B),Y			 ; $B3D6: 91 4B
	DEY					 ; $B3D8: 88
	STA ($4B),Y			 ; $B3D9: 91 4B
	INY					 ; $B3DB: C8
	INY					 ; $B3DC: C8
	INY					 ; $B3DD: C8
	JSR $B3FF			   ; $B3DE: 20 FF B3
	STA ($4B),Y			 ; $B3E1: 91 4B
	DEY					 ; $B3E3: 88
	STA ($4B),Y			 ; $B3E4: 91 4B
	INY					 ; $B3E6: C8
	INY					 ; $B3E7: C8
	RTS					 ; $B3E8: 60
	LDA $53				 ; $B3E9: A5 53
	CMP #$04				; $B3EB: C9 04
	BCC $B419			   ; $B3ED: 90 2A
	DEY					 ; $B3EF: 88
	LDA ($4B),Y			 ; $B3F0: B1 4B
	INY					 ; $B3F2: C8
	RTS					 ; $B3F3: 60
	LDA $53				 ; $B3F4: A5 53
	CMP #$08				; $B3F6: C9 08
	BCC $B419			   ; $B3F8: 90 1F
	DEY					 ; $B3FA: 88
	LDA ($4B),Y			 ; $B3FB: B1 4B
	INY					 ; $B3FD: C8
	RTS					 ; $B3FE: 60
	LDA $53				 ; $B3FF: A5 53
	CMP #$04				; $B401: C9 04
	BCC $B419			   ; $B403: 90 14
	DEY					 ; $B405: 88
	DEY					 ; $B406: 88
	LDA ($4B),Y			 ; $B407: B1 4B
	INY					 ; $B409: C8
	INY					 ; $B40A: C8
	RTS					 ; $B40B: 60
	LDA $53				 ; $B40C: A5 53
	CMP #$08				; $B40E: C9 08
	BCC $B419			   ; $B410: 90 07
	DEY					 ; $B412: 88
	DEY					 ; $B413: 88
	LDA ($4B),Y			 ; $B414: B1 4B
	INY					 ; $B416: C8
	INY					 ; $B417: C8
	RTS					 ; $B418: 60
	LDA $53				 ; $B419: A5 53
	AND #$0C				; $B41B: 29 0C
	BEQ $B43E			   ; $B41D: F0 1F
	CMP #$04				; $B41F: C9 04
	BEQ $B496			   ; $B421: F0 73
	LDA $53				 ; $B423: A5 53
	AND #$01				; $B425: 29 01
	BNE $B433			   ; $B427: D0 0A
	LDA ($4B),Y			 ; $B429: B1 4B
	BPL $B430			   ; $B42B: 10 03
	LDA #$FF				; $B42D: A9 FF
	RTS					 ; $B42F: 60
	LDA #$00				; $B430: A9 00
	RTS					 ; $B432: 60
	LDA ($4B),Y			 ; $B433: B1 4B
	LSR					 ; $B435: 4A
	BCC $B43B			   ; $B436: 90 03
	LDA #$FF				; $B438: A9 FF
	RTS					 ; $B43A: 60
	LDA #$00				; $B43B: A9 00
	RTS					 ; $B43D: 60
	LDA $53				 ; $B43E: A5 53
	AND #$01				; $B440: 29 01
	BNE $B46D			   ; $B442: D0 29
	LDA ($4B),Y			 ; $B444: B1 4B
	ASL					 ; $B446: 0A
	BCC $B44F			   ; $B447: 90 06
	ASL					 ; $B449: 0A
	ORA #$03				; $B44A: 09 03
	JMP $B450			   ; $B44C: 4C 50 B4
	ASL					 ; $B44F: 0A
	ASL					 ; $B450: 0A
	BCC $B459			   ; $B451: 90 06
	ASL					 ; $B453: 0A
	ORA #$03				; $B454: 09 03
	JMP $B45A			   ; $B456: 4C 5A B4
	ASL					 ; $B459: 0A
	ASL					 ; $B45A: 0A
	BCC $B463			   ; $B45B: 90 06
	ASL					 ; $B45D: 0A
	ORA #$03				; $B45E: 09 03
	JMP $B464			   ; $B460: 4C 64 B4
	ASL					 ; $B463: 0A
	ASL					 ; $B464: 0A
	BCC $B46B			   ; $B465: 90 04
	ASL					 ; $B467: 0A
	ORA #$03				; $B468: 09 03
	RTS					 ; $B46A: 60
	ASL					 ; $B46B: 0A
	RTS					 ; $B46C: 60
	LDA ($4B),Y			 ; $B46D: B1 4B
	LSR					 ; $B46F: 4A
	BCC $B478			   ; $B470: 90 06
	LSR					 ; $B472: 4A
	ORA #$C0				; $B473: 09 C0
	JMP $B479			   ; $B475: 4C 79 B4
	LSR					 ; $B478: 4A
	LSR					 ; $B479: 4A
	BCC $B482			   ; $B47A: 90 06
	LSR					 ; $B47C: 4A
	ORA #$C0				; $B47D: 09 C0
	JMP $B483			   ; $B47F: 4C 83 B4
	LSR					 ; $B482: 4A
	LSR					 ; $B483: 4A
	BCC $B48C			   ; $B484: 90 06
	LSR					 ; $B486: 4A
	ORA #$C0				; $B487: 09 C0
	JMP $B48D			   ; $B489: 4C 8D B4
	LSR					 ; $B48C: 4A
	LSR					 ; $B48D: 4A
	BCC $B494			   ; $B48E: 90 04
	LSR					 ; $B490: 4A
	ORA #$C0				; $B491: 09 C0
	RTS					 ; $B493: 60
	LSR					 ; $B494: 4A
	RTS					 ; $B495: 60
	LDA $53				 ; $B496: A5 53
	AND #$01				; $B498: 29 01
	BNE $B4B9			   ; $B49A: D0 1D
	LDA ($4B),Y			 ; $B49C: B1 4B
	ASL					 ; $B49E: 0A
	BPL $B4A9			   ; $B49F: 10 08
	ASL					 ; $B4A1: 0A
	ASL					 ; $B4A2: 0A
	ASL					 ; $B4A3: 0A
	ORA #$0F				; $B4A4: 09 0F
	JMP $B4AC			   ; $B4A6: 4C AC B4
	ASL					 ; $B4A9: 0A
	ASL					 ; $B4AA: 0A
	ASL					 ; $B4AB: 0A
	ASL					 ; $B4AC: 0A
	BCC $B4B5			   ; $B4AD: 90 06
	ASL					 ; $B4AF: 0A
	ASL					 ; $B4B0: 0A
	ASL					 ; $B4B1: 0A
	ORA #$0F				; $B4B2: 09 0F
	RTS					 ; $B4B4: 60
	ASL					 ; $B4B5: 0A
	ASL					 ; $B4B6: 0A
	ASL					 ; $B4B7: 0A
	RTS					 ; $B4B8: 60
	LDA ($4B),Y			 ; $B4B9: B1 4B
	LSR					 ; $B4BB: 4A
	BPL $B4C6			   ; $B4BC: 10 08
	LSR					 ; $B4BE: 4A
	LSR					 ; $B4BF: 4A
	LSR					 ; $B4C0: 4A
	ORA #$0F				; $B4C1: 09 0F
	JMP $B4C9			   ; $B4C3: 4C C9 B4
	LSR					 ; $B4C6: 4A
	LSR					 ; $B4C7: 4A
	LSR					 ; $B4C8: 4A
	LSR					 ; $B4C9: 4A
	BCC $B4D2			   ; $B4CA: 90 06
	LSR					 ; $B4CC: 4A
	LSR					 ; $B4CD: 4A
	LSR					 ; $B4CE: 4A
	ORA #$0F				; $B4CF: 09 0F
	RTS					 ; $B4D1: 60
	LSR					 ; $B4D2: 4A
	LSR					 ; $B4D3: 4A
	LSR					 ; $B4D4: 4A
	RTS					 ; $B4D5: 60
	LDX #$00				; $B4D6: A2 00
	LDA $6E8A,X			 ; $B4D8: BD 8A 6E
	STA $7BCF,X			 ; $B4DB: 9D CF 7B
	LDA $6F8A,X			 ; $B4DE: BD 8A 6F
	STA $7CCF,X			 ; $B4E1: 9D CF 7C
	LDA $708A,X			 ; $B4E4: BD 8A 70
	STA $7DCF,X			 ; $B4E7: 9D CF 7D
	LDA $718A,X			 ; $B4EA: BD 8A 71
	STA $7ECF,X			 ; $B4ED: 9D CF 7E
	LDA $72BA,X			 ; $B4F0: BD BA 72
	STA $0200,X			 ; $B4F3: 9D 00 02
	LDA $73BA,X			 ; $B4F6: BD BA 73
	STA $0300,X			 ; $B4F9: 9D 00 03
	LDA $74BA,X			 ; $B4FC: BD BA 74
	STA $0400,X			 ; $B4FF: 9D 00 04
	INX					 ; $B502: E8
	BNE $B4D8			   ; $B503: D0 D3
	LDX #$2F				; $B505: A2 2F
	LDA $728A,X			 ; $B507: BD 8A 72
	STA $7FCF,X			 ; $B50A: 9D CF 7F
	DEX					 ; $B50D: CA
	BPL $B507			   ; $B50E: 10 F7
	RTS					 ; $B510: 60
	LDX #$00				; $B511: A2 00
	LDA $7BCF,X			 ; $B513: BD CF 7B
	STA $6E8A,X			 ; $B516: 9D 8A 6E
	LDA $7CCF,X			 ; $B519: BD CF 7C
	STA $6F8A,X			 ; $B51C: 9D 8A 6F
	LDA $7DCF,X			 ; $B51F: BD CF 7D
	STA $708A,X			 ; $B522: 9D 8A 70
	LDA $7ECF,X			 ; $B525: BD CF 7E
	STA $718A,X			 ; $B528: 9D 8A 71
	LDA $0200,X			 ; $B52B: BD 00 02
	STA $72BA,X			 ; $B52E: 9D BA 72
	LDA $0300,X			 ; $B531: BD 00 03
	STA $73BA,X			 ; $B534: 9D BA 73
	LDA $0400,X			 ; $B537: BD 00 04
	STA $74BA,X			 ; $B53A: 9D BA 74
	INX					 ; $B53D: E8
	BNE $B513			   ; $B53E: D0 D3
	LDX #$2F				; $B540: A2 2F
	LDA $7FCF,X			 ; $B542: BD CF 7F
	STA $728A,X			 ; $B545: 9D 8A 72
	DEX					 ; $B548: CA
	BPL $B542			   ; $B549: 10 F7
	RTS					 ; $B54B: 60
	JSR $C5C5			   ; $B54C: 20 C5 C5
	JSR $C5AF			   ; $B54F: 20 AF C5
	LDX #$01				; $B552: A2 01
	JSR $F3FB			   ; $B554: 20 FB F3
	JSR $C54E			   ; $B557: 20 4E C5
	JSR $C034			   ; $B55A: 20 34 C0
	JSR $B5FF			   ; $B55D: 20 FF B5
	LDX #$64				; $B560: A2 64
	JSR $C90C			   ; $B562: 20 0C C9
	LDA #$21				; $B565: A9 21
	STA $05FD			   ; $B567: 8D FD 05
	LDA #$32				; $B56A: A9 32
	STA $05FF			   ; $B56C: 8D FF 05
	JSR $C58F			   ; $B56F: 20 8F C5
	JSR $C5BF			   ; $B572: 20 BF C5
	LDA system_flags		; $B575: A5 1F
	ORA #$40				; $B577: 09 40
	STA system_flags		; $B579: 85 1F
	JSR $B597			   ; $B57B: 20 97 B5
	LDA $52				 ; $B57E: A5 52
	AND #$0F				; $B580: 29 0F
	BNE $B58A			   ; $B582: D0 06
	JSR $B5AF			   ; $B584: 20 AF B5
	JSR $B626			   ; $B587: 20 26 B6
	JSR $B6C6			   ; $B58A: 20 C6 B6
	INC $52				 ; $B58D: E6 52
	LDX #$03				; $B58F: A2 03
	JSR $C90C			   ; $B591: 20 0C C9
	JMP $B57B			   ; $B594: 4C 7B B5
	LDA $0509			   ; $B597: AD 09 05
	CLC					 ; $B59A: 18
	ADC #$01				; $B59B: 69 01
	CMP #$F0				; $B59D: C9 F0
	BCC $B5AB			   ; $B59F: 90 0A
	LDA $0505			   ; $B5A1: AD 05 05
	EOR #$02				; $B5A4: 49 02
	STA $0505			   ; $B5A6: 8D 05 05
	LDA #$00				; $B5A9: A9 00
	STA $0509			   ; $B5AB: 8D 09 05
	RTS					 ; $B5AE: 60
	LDA $4B				 ; $B5AF: A5 4B
	AND #$C0				; $B5B1: 29 C0
	CLC					 ; $B5B3: 18
	ADC #$40				; $B5B4: 69 40
	STA $4B				 ; $B5B6: 85 4B
	BCS $B5D5			   ; $B5B8: B0 1B
	CMP #$C0				; $B5BA: C9 C0
	BNE $B5D7			   ; $B5BC: D0 19
	LDA $4C				 ; $B5BE: A5 4C
	AND #$03				; $B5C0: 29 03
	CMP #$03				; $B5C2: C9 03
	BNE $B5D7			   ; $B5C4: D0 11
	LDA $4C				 ; $B5C6: A5 4C
	EOR #$08				; $B5C8: 49 08
	AND #$28				; $B5CA: 29 28
	STA $4C				 ; $B5CC: 85 4C
	LDA #$00				; $B5CE: A9 00
	STA $4B				 ; $B5D0: 85 4B
	JMP $B5D7			   ; $B5D2: 4C D7 B5
	INC $4C				 ; $B5D5: E6 4C
	LDA $4C				 ; $B5D7: A5 4C
	ORA #$80				; $B5D9: 09 80
	STA $0300			   ; $B5DB: 8D 00 03
	LDX #$40				; $B5DE: A2 40
	STX $0301			   ; $B5E0: 8E 01 03
	LDA $4B				 ; $B5E3: A5 4B
	STA $0302			   ; $B5E5: 8D 02 03
	LDA #$00				; $B5E8: A9 00
	STA $0302,X			 ; $B5EA: 9D 02 03
	DEX					 ; $B5ED: CA
	BNE $B5EA			   ; $B5EE: D0 FA
	INC $050B			   ; $B5F0: EE 0B 05
	LDA #$43				; $B5F3: A9 43
	STA $050A			   ; $B5F5: 8D 0A 05
	LDA system_flags		; $B5F8: A5 1F
	ORA #$20				; $B5FA: 09 20
	STA system_flags		; $B5FC: 85 1F
	RTS					 ; $B5FE: 60
	LDA #$00				; $B5FF: A9 00
	STA $4B				 ; $B601: 85 4B
	LDA #$28				; $B603: A9 28
	STA $4C				 ; $B605: 85 4C
	LDX #$00				; $B607: A2 00
	JSR $B64F			   ; $B609: 20 4F B6
	LDA #$00				; $B60C: A9 00
	STA $52				 ; $B60E: 85 52
	STA $0508			   ; $B610: 8D 08 05
	STA $0509			   ; $B613: 8D 09 05
	LDA $0505			   ; $B616: AD 05 05
	AND #$FC				; $B619: 29 FC
	STA $0505			   ; $B61B: 8D 05 05
	LDA $0500			   ; $B61E: AD 00 05
	ORA #$01				; $B621: 09 01
	JMP $C118			   ; $B623: 4C 18 C1
	LDX #$01				; $B626: A2 01
	JSR $B64F			   ; $B628: 20 4F B6
	TXA					 ; $B62B: 8A
	BEQ $B64E			   ; $B62C: F0 20
	PLA					 ; $B62E: 68
	PLA					 ; $B62F: 68
	LDX #$FF				; $B630: A2 FF
	JSR $C90C			   ; $B632: 20 0C C9
	LDX #$FF				; $B635: A2 FF
	JSR $C90C			   ; $B637: 20 0C C9
	LDX #$FF				; $B63A: A2 FF
	JSR $C90C			   ; $B63C: 20 0C C9
	LDX #$FF				; $B63F: A2 FF
	JSR $C90C			   ; $B641: 20 0C C9
	LDX #$FF				; $B644: A2 FF
	JSR $C90C			   ; $B646: 20 0C C9
	LDX #$FF				; $B649: A2 FF
	JSR $C90C			   ; $B64B: 20 0C C9
	RTS					 ; $B64E: 60
	TXA					 ; $B64F: 8A
	BNE $B665			   ; $B650: D0 13
	LDA $B6C4			   ; $B652: AD C4 B6
	STA $06				 ; $B655: 85 06
	LDA $B6C5			   ; $B657: AD C5 B6
	STA $07				 ; $B65A: 85 07
	LDA #$00				; $B65C: A9 00
	STA $08				 ; $B65E: 85 08
	STA $09				 ; $B660: 85 09
	STA $0A				 ; $B662: 85 0A
	RTS					 ; $B664: 60
	LDA $08				 ; $B665: A5 08
	CMP #$0F				; $B667: C9 0F
	BNE $B66E			   ; $B669: D0 03
	LDX #$01				; $B66B: A2 01
	RTS					 ; $B66D: 60
	CMP #$0E				; $B66E: C9 0E
	BEQ $B6AD			   ; $B670: F0 3B
	DEC $08				 ; $B672: C6 08
	BPL $B6AA			   ; $B674: 10 34
	LDY #$FF				; $B676: A0 FF
	LDX #$21				; $B678: A2 21
	INY					 ; $B67A: C8
	DEX					 ; $B67B: CA
	LDA ($06),Y			 ; $B67C: B1 06
	BPL $B67A			   ; $B67E: 10 FA
	TXA					 ; $B680: 8A
	LSR					 ; $B681: 4A
	STA $09				 ; $B682: 85 09
	TAX					 ; $B684: AA
	STY $0A				 ; $B685: 84 0A
	LDY #$00				; $B687: A0 00
	JMP $B69C			   ; $B689: 4C 9C B6
	STA $0303,X			 ; $B68C: 9D 03 03
	STA $0323,X			 ; $B68F: 9D 23 03
	INC $0323,X			 ; $B692: FE 23 03
	INX					 ; $B695: E8
	INC $06				 ; $B696: E6 06
	BNE $B69C			   ; $B698: D0 02
	INC $07				 ; $B69A: E6 07
	LDA ($06),Y			 ; $B69C: B1 06
	BPL $B68C			   ; $B69E: 10 EC
	AND #$0F				; $B6A0: 29 0F
	STA $08				 ; $B6A2: 85 08
	INC $06				 ; $B6A4: E6 06
	BNE $B6AA			   ; $B6A6: D0 02
	INC $07				 ; $B6A8: E6 07
	LDX #$00				; $B6AA: A2 00
	RTS					 ; $B6AC: 60
	LDA #$4E				; $B6AD: A9 4E
	LDX $09				 ; $B6AF: A6 09
	STA $0303,X			 ; $B6B1: 9D 03 03
	STA $0323,X			 ; $B6B4: 9D 23 03
	INC $0323,X			 ; $B6B7: FE 23 03
	INX					 ; $B6BA: E8
	DEC $0A				 ; $B6BB: C6 0A
	BNE $B6B1			   ; $B6BD: D0 F2
	LDX #$00				; $B6BF: A2 00
	STX $08				 ; $B6C1: 86 08
	RTS					 ; $B6C3: 60
	BRK					 ; $B6C4: 00
	SEI					 ; $B6C5: 78
	LDA $52				 ; $B6C6: A5 52
	LSR					 ; $B6C8: 4A
	BCC $B707			   ; $B6C9: 90 3C
	AND #$07				; $B6CB: 29 07
	ASL					 ; $B6CD: 0A
	ASL					 ; $B6CE: 0A
	ASL					 ; $B6CF: 0A
	TAX					 ; $B6D0: AA
	LDA $B709			   ; $B6D1: AD 09 B7
	STA $0300			   ; $B6D4: 8D 00 03
	LDA #$20				; $B6D7: A9 20
	STA $0301			   ; $B6D9: 8D 01 03
	LDA $B708			   ; $B6DC: AD 08 B7
	STA $0302			   ; $B6DF: 8D 02 03
	LDY #$00				; $B6E2: A0 00
	LDA $B70A,X			 ; $B6E4: BD 0A B7
	STA $0303,Y			 ; $B6E7: 99 03 03
	LDA $B74A,X			 ; $B6EA: BD 4A B7
	STA $0313,Y			 ; $B6ED: 99 13 03
	LDA #$00				; $B6F0: A9 00
	STA $030B,Y			 ; $B6F2: 99 0B 03
	STA $031B,Y			 ; $B6F5: 99 1B 03
	INX					 ; $B6F8: E8
	INY					 ; $B6F9: C8
	CPY #$08				; $B6FA: C0 08
	BNE $B6E4			   ; $B6FC: D0 E6
	INC $050B			   ; $B6FE: EE 0B 05
	LDA system_flags		; $B701: A5 1F
	ORA #$20				; $B703: 09 20
	STA system_flags		; $B705: 85 1F
	RTS					 ; $B707: 60
	CPX #$94				; $B708: E0 94
	BRK					 ; $B70A: 00
	LDY #$14				; $B70B: A0 14
	BRK					 ; $B70D: 00
	.byte $44			; $B70E
	BRK					 ; $B70F: 00
	JSR $0000			   ; $B710: 20 00 00
	AND #$80				; $B713: 29 80
	.byte $04			; $B715
	BRK					 ; $B716: 00
	RTI					 ; $B717: 40
	BRK					 ; $B718: 00
	BPL $B71B			   ; $B719: 10 00
	PHA					 ; $B71B: 48
	ORA ($80,X)			 ; $B71C: 01 80
	.byte $04			; $B71E
	BRK					 ; $B71F: 00
	RTI					 ; $B720: 40
	BRK					 ; $B721: 00
	BRK					 ; $B722: 00
	ROL					 ; $B723: 2A
	BRK					 ; $B724: 00
	ORA ($80),Y			 ; $B725: 11 80
	.byte $04			; $B727
	BRK					 ; $B728: 00
	RTI					 ; $B729: 40
	BRK					 ; $B72A: 00
	BPL $B74F			   ; $B72B: 10 22
	PHP					 ; $B72D: 08
	ORA ($80,X)			 ; $B72E: 01 80
	.byte $04			; $B730
	BRK					 ; $B731: 00
	BRK					 ; $B732: 00
	PHA					 ; $B733: 48
	BRK					 ; $B734: 00
	.byte $22			; $B735
	BRK					 ; $B736: 00
	ORA ($80,X)			 ; $B737: 01 80
	.byte $04			; $B739
	BRK					 ; $B73A: 00
	.byte $12			; $B73B
	PHA					 ; $B73C: 48
	BRK					 ; $B73D: 00
	JSR $0100			   ; $B73E: 20 00 01
	.byte $80			; $B741
	BRK					 ; $B742: 00
	.byte $14			; $B743
	BRK					 ; $B744: 00
	RTI					 ; $B745: 40
	.byte $04			; $B746
	JSR $0100			   ; $B747: 20 00 01
	ORA ($80,X)			 ; $B74A: 01 80
	BRK					 ; $B74C: 00
	BRK					 ; $B74D: 00
	BRK					 ; $B74E: 00
	BRK					 ; $B74F: 00
	BRK					 ; $B750: 00
	BRK					 ; $B751: 00
	BRK					 ; $B752: 00
	ORA ($80,X)			 ; $B753: 01 80
	BRK					 ; $B755: 00
	BRK					 ; $B756: 00
	BRK					 ; $B757: 00
	BRK					 ; $B758: 00
	BRK					 ; $B759: 00
	BPL $B75C			   ; $B75A: 10 00
	ORA (tmp0,X)			; $B75C: 01 00
	BRK					 ; $B75E: 00
	BRK					 ; $B75F: 00
	BRK					 ; $B760: 00
	BRK					 ; $B761: 00
	BRK					 ; $B762: 00
	BPL $B765			   ; $B763: 10 00
	ORA (tmp0,X)			; $B765: 01 00
	BRK					 ; $B767: 00
	BRK					 ; $B768: 00
	BRK					 ; $B769: 00
	RTI					 ; $B76A: 40
	BRK					 ; $B76B: 00
	BPL $B76E			   ; $B76C: 10 00
	ORA (tmp0,X)			; $B76E: 01 00
	BRK					 ; $B770: 00
	BRK					 ; $B771: 00
	BRK					 ; $B772: 00
	BRK					 ; $B773: 00
	BRK					 ; $B774: 00
	BPL $B777			   ; $B775: 10 00
	ORA (tmp0,X)			; $B777: 01 00
	BRK					 ; $B779: 00
	.byte $04			; $B77A
	BRK					 ; $B77B: 00
	BRK					 ; $B77C: 00
	BRK					 ; $B77D: 00
	BPL $B780			   ; $B77E: 10 00
	ORA (tmp0,X)			; $B780: 01 00
	.byte $80			; $B782
	BRK					 ; $B783: 00
	BRK					 ; $B784: 00
	BRK					 ; $B785: 00
	BRK					 ; $B786: 00
	BRK					 ; $B787: 00
	BRK					 ; $B788: 00
	ORA ($38,X)			 ; $B789: 01 38
	SBC $F3				 ; $B78B: E5 F3
	LSR					 ; $B78D: 4A
	CPY $F26B			   ; $B78E: CC 6B F2
	DEC $2CFD,X			 ; $B791: DE FD 2C
	.byte $E3			; $B794
	.byte $97			; $B795
	.byte $D4			; $B796
	LSR $BF30			   ; $B797: 4E 30 BF
	.byte $D7			; $B79A
	SBC $AC				 ; $B79B: E5 AC
	.byte $3A			; $B79D
	TSX					 ; $B79E: BA
	ORA #$6B				; $B79F: 09 6B
	BIT $1AF7			   ; $B7A1: 2C F7 1A
	CPY $36CB			   ; $B7A4: CC CB 36
	ORA $CA4D,X			 ; $B7A7: 1D 4D CA
	CLV					 ; $B7AA: B8
	INC $E6E3,X			 ; $B7AB: FE E3 E6
	STY $B2,X			   ; $B7AE: 94 B2
	.byte $12			; $B7B0
	.byte $93			; $B7B1
	.byte $F7			; $B7B2
	AND $F3D5,X			 ; $B7B3: 3D D5 F3
	JSR $3F9D			   ; $B7B6: 20 9D 3F
	.byte $67			; $B7B9
	CLD					 ; $B7BA: D8
	.byte $B7			; $B7BB
	.byte $5C			; $B7BC
	.byte $47			; $B7BD
	BEQ $B7BA			   ; $B7BE: F0 FA
	BVC $B78E			   ; $B7C0: 50 CC
	TXA					 ; $B7C2: 8A
	.byte $53			; $B7C3
	.byte $04			; $B7C4
	.byte $BF			; $B7C5
	BIT $F5				 ; $B7C6: 24 F5
	.byte $D7			; $B7C8
	CMP $0364,X			 ; $B7C9: DD 64 03
	.byte $DC			; $B7CC
	.byte $B7			; $B7CD
	INY					 ; $B7CE: C8
	.byte $FA			; $B7CF
	.byte $02			; $B7D0
	.byte $37			; $B7D1
	ADC ($D5,X)			 ; $B7D2: 61 D5
	ADC ($F7,X)			 ; $B7D4: 61 F7
	LDY $FBF4,X			 ; $B7D6: BC F4 FB
	ROL $C7E1,X			 ; $B7D9: 3E E1 C7
	.byte $3F			; $B7DC
	.byte $F3			; $B7DD
	.byte $3F			; $B7DE
	.byte $57			; $B7DF
	ORA $35EE,Y			 ; $B7E0: 19 EE 35
	EOR #$30				; $B7E3: 49 30
	.byte $F4			; $B7E5
	ASL $FD6E,X			 ; $B7E6: 1E 6E FD
	.byte $63			; $B7E9
	BPL $B7FA			   ; $B7EA: 10 0E
	CMP $2D4F,Y			 ; $B7EC: D9 4F 2D
	LDX $C461,Y			 ; $B7EF: BE 61 C4
	SEC					 ; $B7F2: 38
	.byte $3F			; $B7F3
	LDA $0C				 ; $B7F4: A5 0C
	.byte $F7			; $B7F6
	CLC					 ; $B7F7: 18
	.byte $52			; $B7F8
	CPX $32				 ; $B7F9: E4 32
	.byte $4F			; $B7FB
	.byte $D4			; $B7FC
	CMP ($5F,X)			 ; $B7FD: C1 5F
	.byte $92			; $B7FF
	ADC $47E2,X			 ; $B800: 7D E2 47
	.byte $1F			; $B803
	.byte $1B			; $B804
	STA $A5				 ; $B805: 85 A5
	.byte $3F			; $B807
	.byte $DF			; $B808
	JMP $DB07			   ; $B809: 4C 07 DB
	.byte $32			; $B80C
	.byte $54			; $B80D
	.byte $9C			; $B80E
	.byte $7F			; $B80F
	.byte $74			; $B810
	.byte $BF			; $B811
	.byte $5A			; $B812
	BIT $EA				 ; $B813: 24 EA
	CMP $63				 ; $B815: C5 63
	BPL $B836			   ; $B817: 10 1D
	ORA $2E,X			   ; $B819: 15 2E
	.byte $DC			; $B81B
	BIT $19F7			   ; $B81C: 2C F7 19
	.byte $1C			; $B81F
	ROR $2E5B,X			 ; $B820: 7E 5B 2E
	.byte $EB			; $B823
	BRK					 ; $B824: 00
	SED					 ; $B825: F8
	.byte $F7			; $B826
	.byte $E2			; $B827
	.byte $9E			; $B828
	.byte $53			; $B829
	.byte $F7			; $B82A
	EOR $A936,X			 ; $B82B: 5D 36 A9
	.byte $EF			; $B82E
	EOR ($46,X)			 ; $B82F: 41 46
	.byte $0F			; $B831
	CMP $37,X			   ; $B832: D5 37
	RTS					 ; $B834: 60
	.byte $C7			; $B835
	ORA $87,X			   ; $B836: 15 87
	.byte $CB			; $B838
	.byte $E7			; $B839
	INY					 ; $B83A: C8
	.byte $5F			; $B83B
	STX $7B,Y			   ; $B83C: 96 7B
	.byte $AB			; $B83E
	INC $4A				 ; $B83F: E6 4A
	.byte $93			; $B841
	.byte $8F			; $B842
	INC $EB97			   ; $B843: EE 97 EB
	.byte $44			; $B846
	.byte $9E			; $B847
	TSX					 ; $B848: BA
	STX $58,Y			   ; $B849: 96 58
	.byte $34			; $B84B
	LDA $96,X			   ; $B84C: B5 96
	STA $3D7E			   ; $B84E: 8D 7E 3D
	.byte $CB			; $B851
	ROR $52				 ; $B852: 66 52
	.byte $FA			; $B854
	LDA $DD				 ; $B855: A5 DD
	.byte $E2			; $B857
	.byte $64			; $B858
	LDA #$D7				; $B859: A9 D7
	.byte $AB			; $B85B
	.byte $0B			; $B85C
	.byte $F2			; $B85D
	.byte $CB			; $B85E
	.byte $44			; $B85F
	LDX $5D,Y			   ; $B860: B6 5D
	.byte $47			; $B862
	.byte $3F			; $B863
	.byte $0C			; $B864
	BNE $B89E			   ; $B865: D0 37
	DEC $47CB,X			 ; $B867: DE CB 47
	.byte $9E			; $B86A
	BVS $B8CC			   ; $B86B: 70 5F
	LDA $9FF2,X			 ; $B86D: BD F2 9F
	LDA $0801,Y			 ; $B870: B9 01 08
	ROR $841E			   ; $B873: 6E 1E 84
	.byte $D2			; $B876
	ORA $3DAE,Y			 ; $B877: 19 AE 3D
	.byte $F2			; $B87A
	NOP					 ; $B87B: EA
	SBC $27				 ; $B87C: E5 27
	LSR $6A				 ; $B87E: 46 6A
	.byte $67			; $B880
	.byte $D2			; $B881
	LDA $4D,X			   ; $B882: B5 4D
	.byte $87			; $B884
	.byte $57			; $B885
	STA $78C5			   ; $B886: 8D C5 78
	LDX $4F				 ; $B889: A6 4F
	EOR $CB7D,X			 ; $B88B: 5D 7D CB
	.byte $A3			; $B88E
	.byte $BF			; $B88F
	AND ($EB,X)			 ; $B890: 21 EB
	ASL $54A6			   ; $B892: 0E A6 54
	LDX $9D84,Y			 ; $B895: BE 84 9D
	ORA $7150,Y			 ; $B898: 19 50 71
	INC $CF,X			   ; $B89B: F6 CF
	ADC ($9A),Y			 ; $B89D: 71 9A
	STA $ADF4,Y			 ; $B89F: 99 F4 AD
	.byte $53			; $B8A2
	CMP $6229			   ; $B8A3: CD 29 62
	.byte $7F			; $B8A6
	LDX $36				 ; $B8A7: A6 36
	.byte $7A			; $B8A9
	CMP $7579			   ; $B8AA: CD 79 75
	STA $E983,Y			 ; $B8AD: 99 83 E9
	.byte $43			; $B8B0
	.byte $43			; $B8B1
	STY $5D,X			   ; $B8B2: 94 5D
	.byte $CF			; $B8B4
	.byte $87			; $B8B5
	LSR $53				 ; $B8B6: 46 53
	.byte $F7			; $B8B8
	.byte $7B			; $B8B9
	CMP ($EF,X)			 ; $B8BA: C1 EF
	.byte $7F			; $B8BC
	.byte $1B			; $B8BD
	STA $3F47			   ; $B8BE: 8D 47 3F
	.byte $0C			; $B8C1
	.byte $D2			; $B8C2
	STX $75,Y			   ; $B8C3: 96 75
	ROR $0F				 ; $B8C5: 66 0F
	EOR $D958,Y			 ; $B8C7: 59 58 D9
	.byte $E7			; $B8CA
	STA $01D6,X			 ; $B8CB: 9D D6 01
	SBC ($EF),Y			 ; $B8CE: F1 EF
	CMP $61				 ; $B8D0: C5 61
	CMP $D7,X			   ; $B8D2: D5 D7
	CLV					 ; $B8D4: B8
	CPX $C558			   ; $B8D5: EC 58 C5
	AND ($FC,X)			 ; $B8D8: 21 FC
	STY $FE				 ; $B8DA: 84 FE
	.byte $89			; $B8DC
	.byte $77			; $B8DD
	.byte $07			; $B8DE
	.byte $9E			; $B8DF
	.byte $E3			; $B8E0
	.byte $47			; $B8E1
	ROR $DC43,X			 ; $B8E2: 7E 43 DC
	.byte $57			; $B8E5
	.byte $1A			; $B8E6
	ORA ($07,X)			 ; $B8E7: 01 07
	DEC $45,X			   ; $B8E9: D6 45
	SED					 ; $B8EB: F8
	ROR $3CE9,X			 ; $B8EC: 7E E9 3C
	.byte $17			; $B8EF
	.byte $EF			; $B8F0
	ROR $1D,X			   ; $B8F1: 76 1D
	LSR ptr_lo,X			; $B8F3: 56 10
	CMP $71				 ; $B8F5: C5 71
	.byte $89			; $B8F7
	.byte $5A			; $B8F8
	CMP $2E,X			   ; $B8F9: D5 2E
	JMP ($1D57)			 ; $B8FB: 6C 57 1D
	LDA $FED1,X			 ; $B8FE: BD D1 FE
	LDY $1ED7,X			 ; $B901: BC D7 1E
	SBC $9ABE,Y			 ; $B904: F9 BE 9A
	.byte $FB			; $B907
	SBC $E6,X			   ; $B908: F5 E6
	.byte $CF			; $B90A
	.byte $47			; $B90B
	LSR $F46C,X			 ; $B90C: 5E 6C F4
	.byte $44			; $B90F
	.byte $8B			; $B910
	ADC $7E,X			   ; $B911: 75 7E
	CMP $AE				 ; $B913: C5 AE
	LDX $837C,Y			 ; $B915: BE 7C 83
	SBC ($D1,X)			 ; $B918: E1 D1
	.byte $4F			; $B91A
	EOR ($D5),Y			 ; $B91B: 51 D5
	DEC $DB,X			   ; $B91D: D6 DB
	.byte $C3			; $B91F
	STY $96,X			   ; $B920: 94 96
	STX $9F12			   ; $B922: 8E 12 9F
	.byte $4B			; $B925
	.byte $2F			; $B926
	DEC $8E				 ; $B927: C6 8E
	ADC #$0F				; $B929: 69 0F
	BEQ $B915			   ; $B92B: F0 E8
	.byte $CF			; $B92D
	ADC ($82),Y			 ; $B92E: 71 82
	SBC $DEEF,X			 ; $B930: FD EF DE
	BIT $5B				 ; $B933: 24 5B
	.byte $AB			; $B935
	SBC $B7				 ; $B936: E5 B7
	CLI					 ; $B938: 58
	DEC $0ECF,X			 ; $B939: DE CF 0E
	TXA					 ; $B93C: 8A
	ADC $B563,X			 ; $B93D: 7D 63 B5
	TSX					 ; $B940: BA
	.byte $8F			; $B941
	.byte $CB			; $B942
	.byte $5C			; $B943
	.byte $3A			; $B944
	.byte $33			; $B945
	.byte $53			; $B946
	SED					 ; $B947: F8
	.byte $7B			; $B948
	.byte $9F			; $B949
	CPX #$13				; $B94A: E0 13
	ASL $1DAB			   ; $B94C: 0E AB 1D
	LDA ($0D,X)			 ; $B94F: A1 0D
	.byte $47			; $B951
	AND #$0D				; $B952: 29 0D
	.byte $5C			; $B954
	.byte $A7			; $B955
	AND $E9C6,X			 ; $B956: 3D C6 E9
	.byte $43			; $B959
	.byte $5A			; $B95A
	BVC $B925			   ; $B95B: 50 C8
	.byte $B3			; $B95D
	SED					 ; $B95E: F8
	.byte $7B			; $B95F
	LDY $037E,X			 ; $B960: BC 7E 03
	ASL $38				 ; $B963: 06 38
	.byte $9B			; $B965
	INC $2D,X			   ; $B966: F6 2D
	ROL $5D,X			   ; $B968: 36 5D
	SEI					 ; $B96A: 78
	.byte $63			; $B96B
	.byte $DC			; $B96C
	.byte $F7			; $B96D
	.byte $1B			; $B96E
	LDA $0D				 ; $B96F: A5 0D
	ADC #$43				; $B971: 69 43
	.byte $22			; $B973
	.byte $CF			; $B974
	SBC ($EE,X)			 ; $B975: E1 EE
	SBC ($F8),Y			 ; $B977: F1 F8
	ORA $62,X			   ; $B979: 15 62
	LDA ($AD),Y			 ; $B97B: B1 AD
	ASL					 ; $B97D: 0A
	.byte $6F			; $B97E
	CLV					 ; $B97F: B8
	SBC $A5AC			   ; $B980: ED AC A5
	SBC $72,X			   ; $B983: F5 72
	STA $9F1A,X			 ; $B985: 9D 1A 9F
	.byte $67			; $B988
	CMP ($AF),Y			 ; $B989: D1 AF
	.byte $FF			; $B98B
	LSR $AF53,X			 ; $B98C: 5E 53 AF
	.byte $5B			; $B98F
	.byte $3F			; $B990
	ORA $C3EF,Y			 ; $B991: 19 EF C3
	LDY #$BB				; $B994: A0 BB
	.byte $B7			; $B996
	LDX $D1				 ; $B997: A6 D1
	LDY $6CAC			   ; $B999: AC AC 6C
	.byte $F2			; $B99C
	BNE $B95B			   ; $B99D: D0 BC
	ROL $75F1,X			 ; $B99F: 3E F1 75
	.byte $B7			; $B9A2
	ADC $A75C			   ; $B9A3: 6D 5C A7
	.byte $34			; $B9A6
	LDX $F9				 ; $B9A7: A6 F9
	INC $4A37			   ; $B9A9: EE 37 4A
	.byte $1A			; $B9AC
	.byte $D2			; $B9AD
	STX $45				 ; $B9AE: 86 45
	.byte $9F			; $B9B0
	.byte $C3			; $B9B1
	CMP $F0E3,X			 ; $B9B2: DD E3 F0
	AND #$EA				; $B9B5: 29 EA
	CLC					 ; $B9B7: 18
	.byte $E2			; $B9B8
	SBC #$64				; $B9B9: E9 64
	.byte $FB			; $B9BB
	ROL $31B2,X			 ; $B9BC: 3E B2 31
	LSR $E0A3			   ; $B9BF: 4E A3 E0
	.byte $7B			; $B9C2
	.byte $5F			; $B9C3
	.byte $74			; $B9C4
	.byte $5B			; $B9C5
	.byte $83			; $B9C6
	.byte $DC			; $B9C7
	ROR $A8C5,X			 ; $B9C8: 7E C5 A8
	.byte $93			; $B9CB
	ORA $76AC			   ; $B9CC: 0D AC 76
	STY $35				 ; $B9CF: 84 35
	.byte $1C			; $B9D1
	LDY $35				 ; $B9D2: A4 35
	.byte $72			; $B9D4
	STA $FC6C,X			 ; $B9D5: 9D 6C FC
	.byte $77			; $B9D8
	.byte $89			; $B9D9
	ASL $7ADB,X			 ; $B9DA: 1E DB 7A
	AND $EC93,X			 ; $B9DD: 3D 93 EC
	SBC $21C4,Y			 ; $B9E0: F9 C4 21
	STY $EB,X			   ; $B9E3: 94 EB
	.byte $93			; $B9E5
	ORA $D4BA			   ; $B9E6: 0D BA D4
	ADC $3D				 ; $B9E9: 65 3D
	.byte $43			; $B9EB
	.byte $1C			; $B9EC
	EOR $23,X			   ; $B9ED: 55 23
	.byte $53			; $B9EF
	ROL $DA				 ; $B9F0: 26 DA
	LDY $6A				 ; $B9F2: A4 6A
	.byte $64			; $B9F4
	.byte $FB			; $B9F5
	CMP $52				 ; $B9F6: C5 52
	ADC $4F3F,X			 ; $B9F8: 7D 3F 4F
	.byte $D3			; $B9FB
	CMP ($15),Y			 ; $B9FC: D1 15
	.byte $87			; $B9FE
	CPX $E35B			   ; $B9FF: EC 5B E3
	CPY $C7FD			   ; $BA02: CC FD C7
	LDA $AFEE,Y			 ; $BA05: B9 EE AF
	STA $3F42,Y			 ; $BA08: 99 42 3F
	CMP #$2F				; $BA0B: C9 2F
	.byte $E7			; $BA0D
	EOR $204F,Y			 ; $BA0E: 59 4F 20
	.byte $FA			; $BA11
	DEX					 ; $BA12: CA
	.byte $FF			; $BA13
	.byte $FC			; $BA14
	.byte $1F			; $BA15
	BIT $BCF3			   ; $BA16: 2C F3 BC
	INC $465C,X			 ; $BA19: FE 5C 46
	SBC $37EE,Y			 ; $BA1C: F9 EE 37
	.byte $5C			; $BA1F
	.byte $47			; $BA20
	BEQ $BA1D			   ; $BA21: F0 FA
	BVC $B9F1			   ; $BA23: 50 CC
	TXA					 ; $BA25: 8A
	.byte $53			; $BA26
	.byte $04			; $BA27
	.byte $BF			; $BA28
	BIT $D8				 ; $BA29: 24 D8
	ADC $78,X			   ; $BA2B: 75 78
	DEC $9F27			   ; $BA2D: CE 27 9F
	.byte $3A			; $BA30
	.byte $FC			; $BA31
	LDA $B3,X			   ; $BA32: B5 B3
	.byte $DC			; $BA34
	.byte $6B			; $BA35
	.byte $2B			; $BA36
	.byte $FF			; $BA37
	BEQ $BAB6			   ; $BA38: F0 7C
	LDA $A9,X			   ; $BA3A: B5 A9
	.byte $27			; $BA3C
	DEC $46,X			   ; $BA3D: D6 46
	.byte $B3			; $BA3F
	SBC $0D66,Y			 ; $BA40: F9 66 0D
	.byte $87			; $BA43
	EOR $49,X			   ; $BA44: 55 49
	.byte $33			; $BA46
	INC $6382			   ; $BA47: EE 82 63
	ROR $DA				 ; $BA4A: 66 DA
	LDA $D5				 ; $BA4C: A5 D5
	.byte $62			; $BA4E
	.byte $6F			; $BA4F
	.byte $DB			; $BA50
	STY $C7,X			   ; $BA51: 94 C7
	CMP $E9				 ; $BA53: C5 E9
	SED					 ; $BA55: F8
	CLI					 ; $BA56: 58
	ROR $ABC5,X			 ; $BA57: 7E C5 AB
	STY $D5,X			   ; $BA5A: 94 D5
	DEC $5337,X			 ; $BA5C: DE 37 53
	ROR $59				 ; $BA5F: 66 59
	.byte $E7			; $BA61
	.byte $57			; $BA62
	AND #$6D				; $BA63: 29 6D
	.byte $63			; $BA65
	LSR $A7				 ; $BA66: 46 A7
	STA $8D59,X			 ; $BA68: 9D 59 8D
	.byte $1A			; $BA6B
	.byte $FC			; $BA6C
	ADC #$43				; $BA6D: 69 43
	AND $0DC1,X			 ; $BA6F: 3D C1 0D
	ORA $0FF9,X			 ; $BA72: 1D F9 0F
	ROR $830D,X			 ; $BA75: 7E 0D 83
	.byte $1B			; $BA78
	.byte $72			; $BA79
	TYA					 ; $BA7A: 98
	SED					 ; $BA7B: F8
	LDA $0B3F,X			 ; $BA7C: BD 3F 0B
	ORA $37A5,Y			 ; $BA7F: 19 A5 37
	.byte $CF			; $BA82
	SEC					 ; $BA83: 38
	.byte $AF			; $BA84
	AND $6B6B			   ; $BA85: 2D 6B 6B
	.byte $CB			; $BA88
	.byte $E7			; $BA89
	.byte $CF			; $BA8A
	CPY $7C				 ; $BA8B: C4 7C
	.byte $57			; $BA8D
	CPX $9F				 ; $BA8E: E4 9F
	.byte $43			; $BA90
	ASL $38				 ; $BA91: 06 38
	.byte $80			; $BA93
	SBC ($BF),Y			 ; $BA94: F1 BF
	.byte $0B			; $BA96
	BVS $BA4C			   ; $BA97: 70 B3
	.byte $DC			; $BA99
	ROR $5B				 ; $BA9A: 66 5B
	.byte $C3			; $BA9C
	CLI					 ; $BA9D: 58
	ROR $2090			   ; $BA9E: 6E 90 20
	TXS					 ; $BAA1: 9A
	.byte $07			; $BAA2
	.byte $7B			; $BAA3
	ORA $0DA9,X			 ; $BAA4: 1D A9 0D
	.byte $64			; $BAA7
	.byte $03			; $BAA8
	CMP $1F2F			   ; $BAA9: CD 2F 1F
	.byte $87			; $BAAC
	LSR $42				 ; $BAAD: 46 42
	.byte $7F			; $BAAF
	.byte $AB			; $BAB0
	STY $B0,X			   ; $BAB1: 94 B0
	.byte $63			; $BAB3
	.byte $89			; $BAB4
	STY $23,X			   ; $BAB5: 94 23
	.byte $FC			; $BAB7
	.byte $92			; $BAB8
	INC $D475,X			 ; $BAB9: FE 75 D4
	LDA $95,X			   ; $BABC: B5 95
	.byte $FF			; $BABE
	SED					 ; $BABF: F8
	ROL $7F59,X			 ; $BAC0: 3E 59 7F
	AND #$3F				; $BAC3: 29 3F
	ADC $F8,X			   ; $BAC5: 75 F8
	.byte $5B			; $BAC7
	DEX					 ; $BAC8: CA
	CMP ($63,X)			 ; $BAC9: C1 63
	ORA $F8D1,X			 ; $BACB: 1D D1 F8
	CLI					 ; $BACE: 58
	.byte $52			; $BACF
	TYA					 ; $BAD0: 98
	AND $F9				 ; $BAD1: 25 F9
	.byte $27			; $BAD3
	CLV					 ; $BAD4: B8
	.byte $5B			; $BAD5
	.byte $87			; $BAD6
	LDY $68FE,X			 ; $BAD7: BC FE 68
	SED					 ; $BADA: F8
	.byte $22			; $BADB
	ADC ($D5,X)			 ; $BADC: 61 D5
	DEC $47,X			   ; $BADE: D6 47
	BRK					 ; $BAE0: 00
	EOR $AB				 ; $BAE1: 45 AB
	STY $EB,X			   ; $BAE3: 94 EB
	.byte $3F			; $BAE5
	ASL					 ; $BAE6: 0A
	.byte $CF			; $BAE7
	AND $42C6,X			 ; $BAE8: 3D C6 42
	.byte $53			; $BAEB
	SBC $7F65,X			 ; $BAEC: FD 65 7F
	INC $930F,X			 ; $BAEF: FE 0F 93
	.byte $62			; $BAF2
	.byte $9B			; $BAF3
	LSR $B6				 ; $BAF4: 46 B6
	.byte $B2			; $BAF6
	ADC ($FE),Y			 ; $BAF7: 71 FE
	LSR					 ; $BAF9: 4A
	.byte $4B			; $BAFA
	AND ($3F,X)			 ; $BAFB: 21 3F
	STY $B966			   ; $BAFD: 8C 66 B9
	PHP					 ; $BB00: 08
	.byte $6F			; $BB01
	.byte $3F			; $BB02
	.byte $14			; $BB03
	STA ($BE,X)			 ; $BB04: 81 BE
	LDX $FD53			   ; $BB06: AE 53 FD
	.byte $E7			; $BB09
	.byte $F3			; $BB0A
	.byte $47			; $BB0B
	CMP ($13,X)			 ; $BB0C: C1 13
	ASL $EFA6			   ; $BB0E: 0E A6 EF
	.byte $C2			; $BB11
	.byte $B3			; $BB12
	.byte $CF			; $BB13
	ADC ($AC),Y			 ; $BB14: 71 AC
	.byte $AF			; $BB16
	.byte $FF			; $BB17
	CMP ($F2,X)			 ; $BB18: C1 F2
	INY					 ; $BB1A: C8
	.byte $73			; $BB1B
	CPX $F5				 ; $BB1C: E4 F5
	ROR					 ; $BB1E: 6A
	CLC					 ; $BB1F: 18
	.byte $E2			; $BB20
	SBC ($B8),Y			 ; $BB21: F1 B8
	DEC $57,X			   ; $BB23: D6 57
	.byte $FF			; $BB25
	CPX #$F9				; $BB26: E0 F9
	ADC $F8				 ; $BB28: 65 F8
	.byte $D4			; $BB2A
	EOR #$8A				; $BB2B: 49 8A
	LDA $1D,X			   ; $BB2D: B5 1D
	EOR $9F2C,X			 ; $BB2F: 5D 2C 9F
	.byte $67			; $BB32
	INY					 ; $BB33: C8
	.byte $4F			; $BB34
	INX					 ; $BB35: E8
	.byte $0F			; $BB36
	DEC $1AC2,X			 ; $BB37: DE C2 1A
	LDA $494E,Y			 ; $BB3A: B9 4E 49
	.byte $0C			; $BB3D
	.byte $F7			; $BB3E
	ORA $BFBA,Y			 ; $BB3F: 19 BA BF
	.byte $93			; $BB42
	CPX $1E59			   ; $BB43: EC 59 1E
	ROR $C87A,X			 ; $BB46: 7E 7A C8
	.byte $42			; $BB49
	ROR $DC33,X			 ; $BB4A: 7E 33 DC
	.byte $64			; $BB4D
	SEC					 ; $BB4E: 38
	.byte $6B			; $BB4F
	ORA $5D65			   ; $BB50: 0D 65 5D
	CPX #$1B				; $BB53: E0 1B
	.byte $57			; $BB55
	AND #$D1				; $BB56: 29 D1
	LDA #$E8				; $BB58: A9 E8
	DEC ptr_lo,X			; $BB5A: D6 10
	.byte $CF			; $BB5C
	ADC ($9A),Y			 ; $BB5D: 71 9A
	.byte $5A			; $BB5F
	BIT $D8				 ; $BB60: 24 D8
	AND ($C4),Y			 ; $BB62: 31 C4
	CMP $FA04,X			 ; $BB64: DD 04 FA
	BVC $BB39			   ; $BB67: 50 D0
	JMP $F36C			   ; $BB69: 4C 6C F3
	DEC $CA62			   ; $BB6C: CE 62 CA
	ROR $B8E7,X			 ; $BB6F: 7E E7 B8
	CMP ($CD),Y			 ; $BB72: D1 CD
	LDX $F954,Y			 ; $BB74: BE 54 F9
	ROL $55				 ; $BB77: 26 55
	.byte $62			; $BB79
	.byte $6F			; $BB7A
	CLD					 ; $BB7B: D8
	.byte $FC			; $BB7C
	.byte $3A			; $BB7D
	EOR $CAD5,Y			 ; $BB7E: 59 D5 CA
	.byte $73			; $BB81
	.byte $5C			; $BB82
	.byte $2B			; $BB83
	.byte $E7			; $BB84
	STA $A475,X			 ; $BB85: 9D 75 A4
	AND $72,X			   ; $BB88: 35 72
	.byte $9F			; $BB8A
	.byte $EF			; $BB8B
	.byte $3F			; $BB8C
	TXS					 ; $BB8D: 9A
	ROL $B708,X			 ; $BB8E: 3E 08 B7
	CPY $73				 ; $BB91: C4 73
	.byte $FF			; $BB93
	.byte $47			; $BB94
	TSX					 ; $BB95: BA
	.byte $4F			; $BB96
	AND $B1C6,X			 ; $BB97: 3D C6 B1
	.byte $6F			; $BB9A
	STA ($FE),Y			 ; $BB9B: 91 FE
	BIT $5E37			   ; $BB9D: 2C 37 5E
	.byte $3F			; $BBA0
	CPY $5A20			   ; $BBA1: CC 20 5A
	BVC $BB6E			   ; $BBA4: 50 C8
	.byte $F2			; $BBA6
	.byte $73			; $BBA7
	.byte $FA			; $BBA8
	.byte $7A			; $BBA9
	DEY					 ; $BBAA: 88
	LDY $C768			   ; $BBAB: AC 68 C7
	CMP $7078,X			 ; $BBAE: DD 78 70
	.byte $AF			; $BBB1
	.byte $7C			; $BBB2
	.byte $47			; $BBB3
	.byte $3F			; $BBB4
	.byte $F4			; $BBB5
	.byte $7B			; $BBB6
	CLV					 ; $BBB7: B8
	CPX $E218			   ; $BBB8: EC 18 E2
	LDA #$27				; $BBBB: A9 27
	.byte $1C			; $BBBD
	LDA $DE,X			   ; $BBBE: B5 DE
	.byte $2B			; $BBC0
	.byte $1A			; $BBC1
	AND $D0B6,Y			 ; $BBC2: 39 B6 D0
	ROR $E5EA,X			 ; $BBC5: 7E EA E5
	AND $FE09,Y			 ; $BBC8: 39 09 FE
	STX $E16D			   ; $BBCB: 8E 6D E1
	CMP ($9E),Y			 ; $BBCE: D1 9E
	.byte $FC			; $BBD0
	BIT $FE82			   ; $BBD1: 2C 82 FE
	LDA $5547			   ; $BBD4: AD 47 55
	STX $86D0			   ; $BBD7: 8E D0 86
	.byte $A3			; $BBDA
	STY $86,X			   ; $BBDB: 94 86
	LDX $9753			   ; $BBDD: AE 53 97
	.byte $7C			; $BBE0
	.byte $34			; $BBE1
	.byte $BF			; $BBE2
	.byte $F7			; $BBE3
	.byte $BB			; $BBE4
	.byte $7A			; $BBE5
	.byte $E2			; $BBE6
	ROL $79,X			   ; $BBE7: 36 79
	INC $1032			   ; $BBE9: EE 32 10
	STA $B2FE,Y			 ; $BBEC: 99 FE B2
	.byte $2F			; $BBEF
	.byte $C3			; $BBF0
	.byte $F7			; $BBF1
	.byte $57			; $BBF2
	AND #$EF				; $BBF3: 29 EF
	.byte $12			; $BBF5
	SEC					 ; $BBF6: 38
	JMP ($1B8E)			 ; $BBF7: 6C 8E 1B
	.byte $23			; $BBFA
	TXA					 ; $BBFB: 8A
	TSX					 ; $BBFC: BA
	.byte $A7			; $BBFD
	AND #$D1				; $BBFE: 29 D1
	DEX					 ; $BC00: CA
	ADC ($EE,X)			 ; $BC01: 61 EE
	TSX					 ; $BC03: BA
	.byte $D2			; $BC04
	CLC					 ; $BC05: 18
	.byte $1F			; $BC06
	.byte $A3			; $BC07
	CMP $A75C,X			 ; $BC08: DD 5C A7
	.byte $FA			; $BC0B
	.byte $1C			; $BC0C
	RTI					 ; $BC0D: 40
	ROR $F21E			   ; $BC0E: 6E 1E F2
	ASL $31,X			   ; $BC11: 16 31
	CLV					 ; $BC13: B8
	STX $AE				 ; $BC14: 86 AE
	.byte $53			; $BC16
	LDX $9FBE			   ; $BC17: AE BE 9F
	.byte $67			; $BC1A
	CPY $FF				 ; $BC1B: C4 FF
	EOR $4014			   ; $BC1D: 4D 14 40
	.byte $7A			; $BC20
	.byte $C3			; $BC21
	TAX					 ; $BC22: AA
	.byte $A7			; $BC23
	AND #$C8				; $BC24: 29 C8
	JMP $AAC0			   ; $BC26: 4C C0 AA
	CMP $61				 ; $BC29: C5 61
	.byte $FB			; $BC2B
	ASL $B6,X			   ; $BC2C: 16 B6
	LDA $5EEA,X			 ; $BC2E: BD EA 5E
	LDY $A8F3,X			 ; $BC31: BC F3 A8
	LSR					 ; $BC34: 4A
	.byte $FF			; $BC35
	.byte $DC			; $BC36
	.byte $F7			; $BC37
	.byte $04			; $BC38
	AND $95,X			   ; $BC39: 35 95
	.byte $FF			; $BC3B
	SED					 ; $BC3C: F8
	ROL $3A4C,X			 ; $BC3D: 3E 4C 3A
	LDY $A466			   ; $BC40: AC 66 A4
	.byte $FB			; $BC43
	ROL $7D80,X			 ; $BC44: 3E 80 7D
	.byte $5C			; $BC47
	.byte $A7			; $BC48
	EOR $56F8,Y			 ; $BC49: 59 F8 56
	ADC $2DEE,Y			 ; $BC4C: 79 EE 2D
	INC $9BDE			   ; $BC4F: EE DE 9B
	LSR $43				 ; $BC52: 46 43
	STY $5D,X			   ; $BC54: 94 5D
	.byte $F7			; $BC56
	BPL $BC2E			   ; $BC57: 10 D5
	DEX					 ; $BC59: CA
	.byte $77			; $BC5A
	.byte $AB			; $BC5B
	SBC ($56),Y			 ; $BC5C: F1 56
	ROL					 ; $BC5E: 2A
	.byte $67			; $BC5F
	DEC $AE				 ; $BC60: C6 AE
	.byte $53			; $BC62
	.byte $9E			; $BC63
	.byte $E3			; $BC64
	EOR #$82				; $BC65: 49 82
	CMP $735E			   ; $BC67: CD 5E 73
	.byte $DF			; $BC6A
	SBC ($5C,X)			 ; $BC6B: E1 5C
	ASL $0865,X			 ; $BC6D: 1E 65 08
	.byte $FF			; $BC70
	BIT $BF				 ; $BC71: 24 BF
	.byte $9E			; $BC73
	CMP $85				 ; $BC74: C5 85
	AND #$82				; $BC76: 29 82
	.byte $5F			; $BC78
	.byte $92			; $BC79
	.byte $74			; $BC7A
	SBC $1D,X			   ; $BC7B: F5 1D
	LSR $3B,X			   ; $BC7D: 56 3B
	.byte $42			; $BC7F
	CLC					 ; $BC80: 18
	STA ($FB,X)			 ; $BC81: 81 FB
	.byte $AB			; $BC83
	STY $E7,X			   ; $BC84: 94 E7
	STA $6136,X			 ; $BC86: 9D 36 61
	DEX					 ; $BC89: CA
	.byte $5C			; $BC8A
	.byte $93			; $BC8B
	.byte $AB			; $BC8C
	ORA $8E,X			   ; $BC8D: 15 8E
	DEC $EE,X			   ; $BC8F: D6 EE
	.byte $5B			; $BC91
	.byte $E7			; $BC92
	CPX #$88				; $BC93: E0 88
	.byte $7B			; $BC95
	.byte $AB			; $BC96
	STY $EF,X			   ; $BC97: 94 EF
	STA $8E				 ; $BC99: 85 8E
	.byte $E3			; $BC9B
	CMP $F071,X			 ; $BC9C: DD 71 F0
	CMP $8789,Y			 ; $BC9F: D9 89 87
	.byte $53			; $BCA2
	ADC $2F,X			   ; $BCA3: 75 2F
	CLV					 ; $BCA5: B8
	SBC $3C8B,X			 ; $BCA6: FD 8B 3C
	DEC $B882			   ; $BCA9: CE 82 B8
	ADC ($D5,X)			 ; $BCAC: 61 D5
	.byte $D7			; $BCAE
	STA $CA3C,Y			 ; $BCAF: 99 3C CA
	ORA ($FE),Y			 ; $BCB2: 11 FE
	EOR #$7F				; $BCB4: 49 7F
	SEC					 ; $BCB6: 38
	LDX $86B0			   ; $BCB7: AE B0 86
	LSR $95,X			   ; $BCBA: 56 95
	TYA					 ; $BCBC: 98
	DEX					 ; $BCBD: CA
	.byte $5A			; $BCBE
	.byte $53			; $BCBF
	SBC $C0F4,X			 ; $BCC0: FD F4 C0
	ADC $5787,X			 ; $BCC3: 7D 87 57
	.byte $5A			; $BCC6
	BVS $BC78			   ; $BCC7: 70 AF
	EOR $E35F,X			 ; $BCC9: 5D 5F E3
	.byte $DC			; $BCCC
	.byte $57			; $BCCD
	CLI					 ; $BCCE: 58
	.byte $43			; $BCCF
	.byte $7C			; $BCD0
	.byte $5A			; $BCD1
	LDY $C33D,X			 ; $BCD2: BC 3D C3
	.byte $D7			; $BCD5
	SBC ($62,X)			 ; $BCD6: E1 62
	STY $C1,X			   ; $BCD8: 94 C1
	.byte $87			; $BCDA
	EOR $8C,X			   ; $BCDB: 55 8C
	.byte $57			; $BCDD
	CLI					 ; $BCDE: 58
	.byte $43			; $BCDF
	.byte $7A			; $BCE0
	AND $7098			   ; $BCE1: 2D 98 70
	.byte $AF			; $BCE4
	.byte $AB			; $BCE5
	STY $D5,X			   ; $BCE6: 94 D5
	TAY					 ; $BCE8: A8
	.byte $63			; $BCE9
	TXA					 ; $BCEA: 8A
	.byte $C7			; $BCEB
	.byte $6B			; $BCEC
	.byte $73			; $BCED
	.byte $DC			; $BCEE
	ADC #$31				; $BCEF: 69 31
	TXS					 ; $BCF1: 9A
	LDY $FFE9,X			 ; $BCF2: BC E9 FF
	.byte $A3			; $BCF5
	.byte $E3			; $BCF6
	.byte $DC			; $BCF7
	.byte $F7			; $BCF8
	ORA $FA6C,Y			 ; $BCF9: 19 6C FA
	TYA					 ; $BCFC: 98
	.byte $DF			; $BCFD
	.byte $92			; $BCFE
	.byte $7A			; $BCFF
	BVC $BCDF			   ; $BD00: 50 DD
	BIT $92				 ; $BD02: 24 92
	.byte $F7			; $BD04
	.byte $47			; $BD05
	LSR $C8,X			   ; $BD06: 56 C8
	NOP					 ; $BD08: EA
	CMP $6A1D,Y			 ; $BD09: D9 1D 6A
	CMP $D6				 ; $BD0C: C5 D6
	CMP $15B3,X			 ; $BD0E: DD B3 15
	EOR $9453,X			 ; $BD11: 5D 53 94
	INC $F8,X			   ; $BD14: F6 F8
	.byte $CF			; $BD16
	ADC ($9F),Y			 ; $BD17: 71 9F
	SBC #$19				; $BD19: E9 19
	.byte $1C			; $BD1B
	ROR $C56A,X			 ; $BD1C: 7E 6A C5
	.byte $63			; $BD1F
	LDY $21,X			   ; $BD20: B4 21
	LDY $658D			   ; $BD22: AC 8D 65
	AND $5D				 ; $BD25: 25 5D
	EOR $5D63,X			 ; $BD27: 5D 63 5D
	ADC #$0C				; $BD2A: 69 0C
	.byte $F3			; $BD2C
	.byte $97			; $BD2D
	.byte $DF			; $BD2E
	.byte $73			; $BD2F
	.byte $DF			; $BD30
	STA $A0				 ; $BD31: 85 A0
	LDX $F009			   ; $BD33: AE 09 F0
	LDY $0D				 ; $BD36: A4 0D
	.byte $F3			; $BD38
	DEC $8D7B			   ; $BD39: CE 7B 8D
	ROR $CF13,X			 ; $BD3C: 7E 13 CF
	.byte $EB			; $BD3F
	.byte $EF			; $BD40
	.byte $17			; $BD41
	EOR $9379,Y			 ; $BD42: 59 79 93
	.byte $DF			; $BD45
	PHP					 ; $BD46: 08
	RTI					 ; $BD47: 40
	LSR $FC				 ; $BD48: 46 FC
	.byte $93			; $BD4A
	ADC $3D63			   ; $BD4B: 6D 63 3D
	SED					 ; $BD4E: F8
	JMP ($28F3)			 ; $BD4F: 6C F3 28
	.byte $47			; $BD52
	SBC $FC25,Y			 ; $BD53: F9 25 FC
	INC $94				 ; $BD56: E6 94
	.byte $B2			; $BD58
	EOR $FB09			   ; $BD59: 4D 09 FB
	LDY $D5				 ; $BD5C: A4 D5
	DEC $79				 ; $BD5E: C6 79
	.byte $9E			; $BD60
	SBC ($78),Y			 ; $BD61: F1 78
	LDA $CF,X			   ; $BD63: B5 CF
	.byte $C3			; $BD65
	.byte $A3			; $BD66
	CMP $AE				 ; $BD67: C5 AE
	ROR $1D1D,X			 ; $BD69: 7E 1D 1D
	SBC #$A1				; $BD6C: E9 A1
	.byte $63			; $BD6E
	.byte $1A			; $BD6F
	NOP					 ; $BD70: EA
	.byte $5B			; $BD71
	SBC ($D3,X)			 ; $BD72: E1 D3
	.byte $F3			; $BD74
	ASL $9CE7,X			 ; $BD75: 1E E7 9C
	.byte $F7			; $BD78
	ORA $FCA9,Y			 ; $BD79: 19 A9 FC
	AND $13AB,X			 ; $BD7C: 3D AB 13
	ROR $F1DC,X			 ; $BD7F: 7E DC F1
	.byte $D7			; $BD82
	.byte $A7			; $BD83
	CPX #$DC				; $BD84: E0 DC
	.byte $87			; $BD86
	CPX $C85A			   ; $BD87: EC 5A C8
	INY					 ; $BD8A: C8
	.byte $7F			; $BD8B
	.byte $80			; $BD8C
	SBC $872C,X			 ; $BD8D: FD 2C 87
	INC $DC				 ; $BD90: E6 DC
	.byte $72			; $BD92
	DEC $93,X			   ; $BD93: D6 93
	ADC ($12,X)			 ; $BD95: 61 12
	AND $F4B6,X			 ; $BD97: 3D B6 F4
	.byte $1C			; $BD9A
	LDX $4358,Y			 ; $BD9B: BE 58 43
	EOR $A936,X			 ; $BD9E: 5D 36 A9
	STX $5F,Y			   ; $BDA1: 96 5F
	STA $7D65			   ; $BDA3: 8D 65 7D
	.byte $EF			; $BDA6
	.byte $D2			; $BDA7
	CMP #$F6				; $BDA8: C9 F6
	ADC $A75C,X			 ; $BDAA: 7D 5C A7
	AND $6CF8,X			 ; $BDAD: 3D F8 6C
	SBC ($4B),Y			 ; $BDB0: F1 4B
	ROR $E7				 ; $BDB2: 66 E7
	STX $F5B4			   ; $BDB4: 8E B4 F5
	.byte $0C			; $BDB7
	ADC $1DCF			   ; $BDB8: 6D CF 1D
	.byte $7A			; $BDBB
	ROR $3216,X			 ; $BDBC: 7E 16 32
	CMP ($F0),Y			 ; $BDBF: D1 F0
	.byte $1B			; $BDC1
	.byte $17			; $BDC2
	ORA #$C7				; $BDC3: 09 C7
	CLD					 ; $BDC5: D8
	.byte $44			; $BDC6
	INY					 ; $BDC7: C8
	LDY $3F				 ; $BDC8: A4 3F
	.byte $5B			; $BDCA
	.byte $DF			; $BDCB
	.byte $87			; $BDCC
	LSR $74				 ; $BDCD: 46 74
	.byte $FC			; $BDCF
	.byte $C7			; $BDD0
	TSX					 ; $BDD1: BA
	.byte $52			; $BDD2
	SBC $180E,Y			 ; $BDD3: F9 0E 18
	.byte $AB			; $BDD6
	.byte $17			; $BDD7
	STA $D9D4			   ; $BDD8: 8D D4 D9
	NOP					 ; $BDDB: EA
	SBC $3A				 ; $BDDC: E5 3A
	BCC $BDDD			   ; $BDDE: 90 FD
	.byte $7A			; $BDE0
	.byte $D4			; $BDE1
	.byte $C7			; $BDE2
	ROR $33F6,X			 ; $BDE3: 7E F6 33
	.byte $52			; $BDE6
	ADC $5D9F,X			 ; $BDE7: 7D 9F 5D
	ADC #$0C				; $BDEA: 69 0C
	.byte $F3			; $BDEC
	TXS					 ; $BDED: 9A
	.byte $57			; $BDEE
	STX $C8FB			   ; $BDEF: 8E FB C8
	.byte $9F			; $BDF2
	BMI $BE0D			   ; $BDF3: 30 18
	.byte $92			; $BDF5
	.byte $82			; $BDF6
	.byte $03			; $BDF7
	SBC $BB4E,Y			 ; $BDF8: F9 4E BB
	.byte $67			; $BDFB
	.byte $E3			; $BDFC
	LDY $2255,X			 ; $BDFD: BC 55 22
	PLA					 ; $BE00: 68
	STA $D536,Y			 ; $BE01: 99 36 D5
	.byte $22			; $BE04
	PLA					 ; $BE05: 68
	STA $F13E,Y			 ; $BE06: 99 3E F1
	.byte $54			; $BE09
	SBC $3B				 ; $BE0A: E5 3B
	BNE $BD8E			   ; $BE0C: D0 80
	.byte $57			; $BE0E
	ASL $B8E7,X			 ; $BE0F: 1E E7 B8
	CPY $23				 ; $BE12: C4 23
	.byte $93			; $BE14
	.byte $F7			; $BE15
	.byte $74			; $BE16
	.byte $89			; $BE17
	.byte $80			; $BE18
	INC $3394,X			 ; $BE19: FE 94 33
	.byte $22			; $BE1C
	.byte $97			; $BE1D
	AND ($4F,X)			 ; $BE1E: 21 4F
	LDY $7F1C			   ; $BE20: AC 1C 7F
	ASL $CCF2,X			 ; $BE23: 1E F2 CC
	ORA $58				 ; $BE26: 05 58
	.byte $9B			; $BE28
	INC $7E96,X			 ; $BE29: FE 96 7E
	.byte $A7			; $BE2C
	.byte $D3			; $BE2D
	BEQ $BDD9			   ; $BE2E: F0 A9
	ROL $89				 ; $BE30: 26 89
	LDX #$64				; $BE32: A2 64
	NOP					 ; $BE34: EA
	.byte $D4			; $BE35
	.byte $44			; $BE36
	.byte $DF			; $BE37
	.byte $B7			; $BE38
	AND #$8F				; $BE39: 29 8F
	.byte $8B			; $BE3B
	.byte $D3			; $BE3C
	BEQ $BDE8			   ; $BE3D: F0 A9
	ROR $53,X			   ; $BE3F: 76 53
	.byte $F7			; $BE41
	.byte $4B			; $BE42
	.byte $DC			; $BE43
	.byte $7C			; $BE44
	TAX					 ; $BE45: AA
	.byte $EB			; $BE46
	ORA $0CA1,X			 ; $BE47: 1D A1 0C
	BCS $BEB5			   ; $BE4A: B0 69
	.byte $6B			; $BE4C
	AND $6F64			   ; $BE4D: 2D 64 6F
	.byte $3F			; $BE50
	STY $FB,X			   ; $BE51: 94 FB
	.byte $9E			; $BE53
	NOP					 ; $BE54: EA
	.byte $FA			; $BE55
	DEC $7F				 ; $BE56: C6 7F
	LDA $0121			   ; $BE58: AD 21 01
	INC $8F6B			   ; $BE5B: EE 6B 8F
	ADC $A65C,X			 ; $BE5E: 7D 5C A6
	LDA $4844			   ; $BE61: AD 44 48
	LDX #$10				; $BE64: A2 10
	DEC $8AC9,X			 ; $BE66: DE C9 8A
	TSX					 ; $BE69: BA
	DEC $7B				 ; $BE6A: C6 7B
	BEQ $BE47			   ; $BE6C: F0 D9
	.byte $EB			; $BE6E
	AND ($DC,X)			 ; $BE6F: 21 DC
	.byte $7F			; $BE71
	LSR					 ; $BE72: 4A
	.byte $1A			; $BE73
	LDA $394E,Y			 ; $BE74: B9 4E 39
	.byte $6B			; $BE77
	LDY $CC4D,X			 ; $BE78: BC 4D CC
	.byte $CB			; $BE7B
	.byte $3C			; $BE7C
	.byte $AF			; $BE7D
	.byte $9E			; $BE7E
	.byte $E3			; $BE7F
	ORA $FB				 ; $BE80: 05 FB
	.byte $DF			; $BE82
	ADC $E613,Y			 ; $BE83: 79 13 E6
	.byte $03			; $BE86
	LDA ($66),Y			 ; $BE87: B1 66
	.byte $FA			; $BE89
	.byte $6B			; $BE8A
	STY $96,X			   ; $BE8B: 94 96
	EOR ($63,X)			 ; $BE8D: 41 63
	ORA $DE				 ; $BE8F: 05 DE
	ROL $26				 ; $BE91: 26 26
	.byte $C2			; $BE93
	BCC $BED2			   ; $BE94: 90 3C
	.byte $F7			; $BE96
	STY $D1,X			   ; $BE97: 94 D1
	ADC $A75C,X			 ; $BE99: 7D 5C A7
	.byte $7B			; $BE9C
	.byte $27			; $BE9D
	CMP $D6F5,Y			 ; $BE9E: D9 F5 D6
	BCC $BE6E			   ; $BEA1: 90 CB
	BCC $BEFC			   ; $BEA3: 90 57
	CLV					 ; $BEA5: B8
	INC $E59F,X			 ; $BEA6: FE 9F E5
	DEC $CB,X			   ; $BEA9: D6 CB
	.byte $DC			; $BEAB
	ADC $72B5,X			 ; $BEAC: 7D B5 72
	STA $A475,X			 ; $BEAF: 9D 75 A4
	AND ($26),Y			 ; $BEB2: 31 26
	.byte $3B			; $BEB4
	CPX $38				 ; $BEB5: E4 38
	.byte $63			; $BEB7
	AND ($FE,X)			 ; $BEB8: 21 FE
	.byte $03			; $BEBA
	.byte $F4			; $BEBB
	TSX					 ; $BEBC: BA
	CLC					 ; $BEBD: 18
	ADC $32,X			   ; $BEBE: 75 32
	AND #$0F				; $BEC0: 29 0F
	.byte $D7			; $BEC2
	ROL $1B				 ; $BEC3: 26 1B
	ADC $5280,Y			 ; $BEC5: 79 80 52
	.byte $1A			; $BEC8
	INY					 ; $BEC9: C8
	.byte $CF			; $BECA
	.byte $F4			; $BECB
	STY $F887			   ; $BECC: 8C 87 F8
	.byte $0F			; $BECF
	.byte $D2			; $BED0
	.byte $CF			; $BED1
	AND $218B,Y			 ; $BED2: 39 8B 21
	.byte $3F			; $BED5
	.byte $14			; $BED6
	.byte $87			; $BED7
	.byte $FB			; $BED8
	SBC $E6,X			   ; $BED9: F5 E6
	.byte $CF			; $BEDB
	.byte $47			; $BEDC
	LSR $F46C,X			 ; $BEDD: 5E 6C F4
	.byte $44			; $BEE0
	TXA					 ; $BEE1: 8A
	AND ($5E),Y			 ; $BEE2: 31 5E
	.byte $53			; $BEE4
	.byte $0F			; $BEE5
	.byte $4F			; $BEE6
	.byte $B3			; $BEE7
	CPX $9F				 ; $BEE8: E4 9F
	.byte $A3			; $BEEA
	CPX #$9F				; $BEEB: E0 9F
	STX $AB,Y			   ; $BEED: 96 AB
	STA $DA74			   ; $BEEF: 8D 74 DA
	.byte $A7			; $BEF2
	.byte $A3			; $BEF3
	STY $FD,X			   ; $BEF4: 94 FD
	PLA					 ; $BEF6: 68
	ORA $A9E2,X			 ; $BEF7: 1D E2 A9
	DEX					 ; $BEFA: CA
	.byte $7F			; $BEFB
	TXS					 ; $BEFC: 9A
	.byte $9F			; $BEFD
	.byte $FA			; $BEFE
	EOR $42AE,Y			 ; $BEFF: 59 AE 42
	.byte $1A			; $BF02
	INY					 ; $BF03: C8
	.byte $DF			; $BF04
	ORA ($CF),Y			 ; $BF05: 11 CF
	SBC $EB1E,X			 ; $BF07: FD 1E EB
	.byte $8F			; $BF0A
	STY $EEA7			   ; $BF0B: 8C A7 EE
	.byte $6B			; $BF0E
	BCC $BE97			   ; $BF0F: 90 86
	.byte $B2			; $BF11
	AND $D4,X			   ; $BF12: 35 D4
	SBC $EF1E,X			 ; $BF14: FD 1E EF
	ADC $A3				 ; $BF17: 65 A3
	.byte $CF			; $BF19
	AND $BA04,Y			 ; $BF1A: 39 04 BA
	ROR $0035,X			 ; $BF1D: 7E 35 00
	.byte $C7			; $BF20
	CMP $F9,X			   ; $BF21: D5 F9
	ROL $5D				 ; $BF23: 26 5D
	.byte $E2			; $BF25
	ROR $FA21			   ; $BF26: 6E 21 FA
	SBC $8B,X			   ; $BF29: F5 8B
	.byte $7C			; $BF2B
	.byte $FC			; $BF2C
	ORA ($72),Y			 ; $BF2D: 11 72
	BCC $BEDC			   ; $BF2F: 90 AB
	.byte $9B			; $BF31
	DEY					 ; $BF32: 88
	ROR $B9BA,X			 ; $BF33: 7E BA B9
	ASL $F5,X			   ; $BF36: 16 F5
	.byte $EF			; $BF38
	.byte $64			; $BF39
	.byte $FB			; $BF3A
	ROL $53AE,X			 ; $BF3B: 3E AE 53
	.byte $89			; $BF3E
	DEC $BC,X			   ; $BF3F: D6 BC
	.byte $A7			; $BF41
	INC $2987			   ; $BF42: EE 87 29
	.byte $0C			; $BF45
	.byte $D7			; $BF46
	ASL $25F9,X			 ; $BF47: 1E F9 25
	.byte $4F			; $BF4A
	ORA $4E,X			   ; $BF4B: 15 4E
	.byte $53			; $BF4D
	LDY #$B1				; $BF4E: A0 B1
	.byte $B3			; $BF50
	CMP $E870			   ; $BF51: CD 70 E8
	ROL $D5				 ; $BF54: 26 D5
	.byte $87			; $BF56
	CMP $CA,X			   ; $BF57: D5 CA
	.byte $77			; $BF59
	LDA (tmp0,X)			; $BF5A: A1 00
	LDX $CF3D			   ; $BF5C: AE 3D CF
	ADC ($BA),Y			 ; $BF5F: 71 BA
	.byte $44			; $BF61
	CPY #$7F				; $BF62: C0 7F
	LSR					 ; $BF64: 4A
	ORA $4B91,Y			 ; $BF65: 19 91 4B
	BCC $BF15			   ; $BF68: 90 AB
	STA ($D7),Y			 ; $BF6A: 91 D7
	INC $9DE7,X			 ; $BF6C: FE E7 9D
	.byte $64			; $BF6F
	.byte $43			; $BF70
	.byte $82			; $BF71
	BCC $BF1F			   ; $BF72: 90 AB
	BPL $BF1F			   ; $BF74: 10 A9
	DEX					 ; $BF76: CA
	.byte $7B			; $BF77
	.byte $7C			; $BF78
	PLA					 ; $BF79: 68
	ORA $A5				 ; $BF7A: 05 A5
	.byte $C3			; $BF7C
	LDA ($B2,X)			 ; $BF7D: A1 B2
	.byte $FC			; $BF7F
	.byte $1F			; $BF80
	.byte $67			; $BF81
	CMP $CA,X			   ; $BF82: D5 CA
	ADC #$F7				; $BF84: 69 F7
	TXA					 ; $BF86: 8A
	.byte $B3			; $BF87
	.byte $1A			; $BF88
	AND $F8,X			   ; $BF89: 35 F8
	INX					 ; $BF8B: E8
	.byte $EF			; $BF8C
	.byte $13			; $BF8D
	.byte $22			; $BF8E
	BCC $BFCE			   ; $BF8F: 90 3D
	CPY $33				 ; $BF91: C4 33
	.byte $DC			; $BF93
	ROR $A7				 ; $BF94: 66 A7
	BEQ $BF8F			   ; $BF96: F0 F7
	.byte $03			; $BF98
	.byte $F4			; $BF99
	.byte $B3			; $BF9A
	.byte $CF			; $BF9B
	.byte $AB			; $BF9C
	.byte $5B			; $BF9D
	ADC #$4F				; $BF9E: 69 4F
	.byte $F4			; $BFA0
	ROL $90				 ; $BFA1: 26 90
	CMP $75				 ; $BFA3: C5 75
	STY $37				 ; $BFA5: 84 37
	CMP $AB				 ; $BFA7: C5 AB
	.byte $C3			; $BFA9
	CMP #$38				; $BFAA: C9 38
	INC $40A7			   ; $BFAC: EE A7 40
	.byte $F7			; $BFAF
	AND ($3F,X)			 ; $BFB0: 21 3F
	.byte $14			; $BFB2
	.byte $87			; $BFB3
	.byte $FB			; $BFB4
	LDX #$DD				; $BFB5: A2 DD
	.byte $5F			; $BFB7
	ROL $0C87			   ; $BFB8: 2E 87 0C
	ROL $BA,X			   ; $BFBB: 36 BA
	.byte $6F			; $BFBD
	.byte $4F			; $BFBE
	ORA $4E,X			   ; $BFBF: 15 4E
	.byte $53			; $BFC1
	SBC $6165,X			 ; $BFC2: FD 65 61
	ORA #$93				; $BFC5: 09 93
	DEX					 ; $BFC7: CA
	ROR $96E6,X			 ; $BFC8: 7E E6 96
	.byte $89			; $BFCB
	.byte $3C			; $BFCC
	.byte $BF			; $BFCD
	.byte $1A			; $BFCE
	.byte $52			; $BFCF
	SBC $CF				 ; $BFD0: E5 CF
	.byte $47			; $BFD2
	SEI					 ; $BFD3: 78
	LDX #$FF				; $BFD4: A2 FF
	.byte $FF			; $BFD6
	.byte $FF			; $BFD7
	SEI					 ; $BFD8: 78
	INC $BFDF			   ; $BFD9: EE DF BF
	JMP $FF8E			   ; $BFDC: 4C 8E FF
	.byte $80			; $BFDF
	JSR $5244			   ; $BFE0: 20 44 52
	EOR ($47,X)			 ; $BFE3: 41 47
	.byte $4F			; $BFE5
	LSR $5120			   ; $BFE6: 4E 20 51
	EOR $45,X			   ; $BFE9: 55 45
	.byte $53			; $BFEB
	.byte $54			; $BFEC
	JSR $5649			   ; $BFED: 20 49 56
	BRK					 ; $BFF0: 00
	BRK					 ; $BFF1: 00
	BRK					 ; $BFF2: 00
	BRK					 ; $BFF3: 00
	PHA					 ; $BFF4: 48
	.byte $04			; $BFF5
	ORA ($0E,X)			 ; $BFF6: 01 0E
	.byte $07			; $BFF8
	.byte $9E			; $BFF9
	CLD					 ; $BFFA: D8
	.byte $BF			; $BFFB
	CLD					 ; $BFFC: D8
	.byte $BF			; $BFFD
	CLD					 ; $BFFE: D8
	.byte $BF			; $BFFF