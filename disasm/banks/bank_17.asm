; ============================================================
; Dragon Warrior IV - Bank 17 Disassembly
; ROM Offset: $44010
; CPU Address: $8000-$BFFF
; ============================================================
;
; Discovered Subroutines: 217
; Jump Targets: 814
;
; ============================================================

	.byte $32			  ; $8000 - Unknown opcode
	.byte $80			  ; $8001 - Unknown opcode
	CLD					  ; $8002: D8	  
	LDX #$04				 ; $8003: A2 04   
	.byte $A3			  ; $8005 - Unknown opcode
	ROL $4AA3				; $8006: 2E A3 4A
	.byte $A3			  ; $8009 - Unknown opcode
	.byte $54			  ; $800A - Unknown opcode
	.byte $A3			  ; $800B - Unknown opcode
	CPX $A2				  ; $800C: E4 A2   
	ORA ($A3),Y			  ; $800E: 11 A3   
	.byte $6B			  ; $8010 - Unknown opcode
	.byte $A3			  ; $8011 - Unknown opcode
	STY $A3,X				; $8012: 94 A3   
	AND $1AA3,Y			  ; $8014: 39 A3 1A
	.byte $A3			  ; $8017 - Unknown opcode
	ROR $5CA3,X			  ; $8018: 7E A3 5C
	LDY $A3DF				; $801B: AC DF A3
	LDY $A1,X				; $801E: B4 A1   
	.byte $F7			  ; $8020 - Unknown opcode
	.byte $A3			  ; $8021 - Unknown opcode
	JMP $C49E				; $8022: 4C 9E C4
	.byte $80			  ; $8025 - Unknown opcode
	ASL					  ; $8026: 0A	  
	LDX $BF5C				; $8027: AE 5C BF
	BRK					  ; $802A: 00	  
	BRK					  ; $802B: 00	  
	ROL $80,X				; $802C: 36 80   
	ADC $3A90,Y			  ; $802E: 79 90 3A ; Arithmetic
	.byte $80			  ; $8031 - Unknown opcode
loc_8032:
	LDA #$00				 ; $8032: A9 00   
	BEQ $803C				; $8034: F0 06   
	LDA #$80				 ; $8036: A9 80   
	BNE $803C				; $8038: D0 02   
	LDA #$40				 ; $803A: A9 40   
loc_803C:
	STA $72E9				; $803C: 8D E9 72
	LDA #$00				 ; $803F: A9 00   
	STA $6E81				; $8041: 8D 81 6E
	BRK					  ; $8044: 00	  
	BIT $2F				  ; $8045: 24 2F   
	BRK					  ; $8047: 00	  
	BRK					  ; $8048: 00	  
	.byte $2F			  ; $8049 - Unknown opcode
	BRK					  ; $804A: 00	  
	.byte $27			  ; $804B - Unknown opcode
	.byte $0F			  ; $804C - Unknown opcode
	BRK					  ; $804D: 00	  
	.byte $03			  ; $804E - Unknown opcode
	.byte $2F			  ; $804F - Unknown opcode
	JSR $B9FB				; $8050: 20 FB B9 ; -> sub_B9FB
loc_8053:
	BRK					  ; $8053: 00	  
	.byte $04			  ; $8054 - Unknown opcode
	.byte $2F			  ; $8055 - Unknown opcode
	JSR $80CF				; $8056: 20 CF 80 ; -> sub_80CF
	BRK					  ; $8059: 00	  
	.byte $13			  ; $805A - Unknown opcode
	.byte $2F			  ; $805B - Unknown opcode
	JSR $80C4				; $805C: 20 C4 80 ; -> sub_80C4
	BCC $808B				; $805F: 90 2A   
	BRK					  ; $8061: 00	  
	.byte $07			  ; $8062 - Unknown opcode
	.byte $6F			  ; $8063 - Unknown opcode
	AND $8620,X			  ; $8064: 3D 20 86
	.byte $BB			  ; $8067 - Unknown opcode
	JSR $B9F6				; $8068: 20 F6 B9 ; -> sub_B9F6
	JSR $9223				; $806B: 20 23 92 ; -> sub_9223
	BRK					  ; $806E: 00	  
	BMI $8080				; $806F: 30 0F   
	JSR $BEB2				; $8071: 20 B2 BE ; -> sub_BEB2
	JSR $A8EC				; $8074: 20 EC A8 ; -> sub_A8EC
	JSR $885B				; $8077: 20 5B 88 ; -> sub_885B
	BRK					  ; $807A: 00	  
	.byte $13			  ; $807B - Unknown opcode
	.byte $2F			  ; $807C - Unknown opcode
	JSR $AA4C				; $807D: 20 4C AA ; -> sub_AA4C
loc_8080:
	BRK					  ; $8080: 00	  
	.byte $0B			  ; $8081 - Unknown opcode
	.byte $3F			  ; $8082 - Unknown opcode
	JSR $92CF				; $8083: 20 CF 92 ; -> sub_92CF
	JSR $80C4				; $8086: 20 C4 80 ; -> sub_80C4
	BCS $8053				; $8089: B0 C8   
loc_808B:
	BRK					  ; $808B: 00	  
	.byte $13			  ; $808C - Unknown opcode
	.byte $2F			  ; $808D - Unknown opcode
	JSR $AB2A				; $808E: 20 2A AB ; -> sub_AB2A
	BRK					  ; $8091: 00	  
	ORA $2F				  ; $8092: 05 2F   
	LDA $6E45				; $8094: AD 45 6E
	CMP #$BB				 ; $8097: C9 BB	; Compare with 187
	BEQ $809C				; $8099: F0 01   
loc_809B:
	RTS					  ; $809B: 60	  
loc_809C:
	LDA $615A				; $809C: AD 5A 61
	CMP #$03				 ; $809F: C9 03	; Compare with 3
	BNE $809B				; $80A1: D0 F8   
	JSR $C5C5				; $80A3: 20 C5 C5 ; Call to fixed bank
	JSR $C54E				; $80A6: 20 4E C5 ; Call to fixed bank
	LDX #$01				 ; $80A9: A2 01   
	STX $6E49				; $80AB: 8E 49 6E
	DEX					  ; $80AE: CA	  
	STX $6E4A				; $80AF: 8E 4A 6E
	STX $6E4B				; $80B2: 8E 4B 6E
	STX $6E4C				; $80B5: 8E 4C 6E
	BRK					  ; $80B8: 00	  
	ORA $00FB				; $80B9: 0D FB 00
	.byte $27			  ; $80BC - Unknown opcode
	.byte $0F			  ; $80BD - Unknown opcode
	BRK					  ; $80BE: 00	  
	ASL					  ; $80BF: 0A	  
	.byte $4F			  ; $80C0 - Unknown opcode
	JMP $8032				; $80C1: 4C 32 80

; ---- Subroutine at $80C4 (Bank 17) ----
sub_80C4:
	LDA $72E7				; $80C4: AD E7 72
	AND #$60				 ; $80C7: 29 60   
	BEQ $80CD				; $80C9: F0 02   
	CLC					  ; $80CB: 18	  
	RTS					  ; $80CC: 60	  
loc_80CD:
	SEC					  ; $80CD: 38	  
	RTS					  ; $80CE: 60	  

; ---- Subroutine at $80CF (Bank 17) ----
sub_80CF:
	LDA $0553				; $80CF: AD 53 05
	AND #$7F				 ; $80D2: 29 7F   
	STA $0553				; $80D4: 8D 53 05
	LDX #$0B				 ; $80D7: A2 0B   
loc_80D9:
	LDA #$70				 ; $80D9: A9 70   
	STA $72F4,X			  ; $80DB: 9D F4 72
	LDA #$00				 ; $80DE: A9 00   
	STA $7300,X			  ; $80E0: 9D 00 73
	STA $730C,X			  ; $80E3: 9D 0C 73
	STA $7318,X			  ; $80E6: 9D 18 73
	LDA #$F7				 ; $80E9: A9 F7   
	STA $7324,X			  ; $80EB: 9D 24 73
	STA $7330,X			  ; $80EE: 9D 30 73
	STA $733C,X			  ; $80F1: 9D 3C 73
	DEX					  ; $80F4: CA	  
	BPL $80D9				; $80F5: 10 E2   
	JSR $87FB				; $80F7: 20 FB 87 ; -> sub_87FB
	LDA $72E9				; $80FA: AD E9 72
	BMI $8117				; $80FD: 30 18   
	LDA $6E44				; $80FF: AD 44 6E
	AND #$03				 ; $8102: 29 03   
	CMP #$01				 ; $8104: C9 01	; Compare with 1
	BEQ $8117				; $8106: F0 0F   
	LDA $72E6				; $8108: AD E6 72
	AND #$30				 ; $810B: 29 30   
	BNE $8117				; $810D: D0 08   
	JSR $AE0A				; $810F: 20 0A AE ; -> sub_AE0A
	BCS $8118				; $8112: B0 04   
	JMP $82E8				; $8114: 4C E8 82
loc_8117:
	RTS					  ; $8117: 60	  
loc_8118:
	JSR $87FB				; $8118: 20 FB 87 ; -> sub_87FB
	BRK					  ; $811B: 00	  
	.byte $62			  ; $811C - Unknown opcode
	.byte $23			  ; $811D - Unknown opcode
	EOR ($85,X)			  ; $811E: 41 85   
	BRK					  ; $8120: 00	  
	LDA #$10				 ; $8121: A9 10   
	JSR $880A				; $8123: 20 0A 88 ; -> sub_880A
	BCS $815F				; $8126: B0 37   
	LDA #$11				 ; $8128: A9 11   
	JSR $880A				; $812A: 20 0A 88 ; -> sub_880A
	BCS $815F				; $812D: B0 30   
	JSR $87BB				; $812F: 20 BB 87 ; -> sub_87BB
	LDA $03D4				; $8132: AD D4 03
	AND #$1F				 ; $8135: 29 1F   
	STA $03D4				; $8137: 8D D4 03
	BRK					  ; $813A: 00	  
	.byte $07			  ; $813B - Unknown opcode
	.byte $6F			  ; $813C - Unknown opcode
	AND $0700				; $813D: 2D 00 07
	.byte $6F			  ; $8140 - Unknown opcode
	BIT $00C9				; $8141: 2C C9 00
	BEQ $815F				; $8144: F0 19   
	CMP #$03				 ; $8146: C9 03	; Compare with 3
	BEQ $815C				; $8148: F0 12   
	CMP #$01				 ; $814A: C9 01	; Compare with 1
	BEQ $8162				; $814C: F0 14   
	CMP #$02				 ; $814E: C9 02	; Compare with 2
	BEQ $8168				; $8150: F0 16   
	CMP #$FD				 ; $8152: C9 FD	; Compare with 253
	BEQ $8165				; $8154: F0 0F   
	JMP $8118				; $8156: 4C 18 81
loc_8159:
	JMP $80CF				; $8159: 4C CF 80
loc_815C:
	JMP $82D4				; $815C: 4C D4 82
loc_815F:
	JMP $81FD				; $815F: 4C FD 81
loc_8162:
	JMP $8293				; $8162: 4C 93 82
loc_8165:
	JMP $82D8				; $8165: 4C D8 82
loc_8168:
	BRK					  ; $8168: 00	  
	EOR $9033,X			  ; $8169: 5D 33 90
	.byte $07			  ; $816C - Unknown opcode
	LDA $618E				; $816D: AD 8E 61
	AND #$07				 ; $8170: 29 07   
	BEQ $8183				; $8172: F0 0F   
	BRK					  ; $8174: 00	  
	.byte $07			  ; $8175 - Unknown opcode
	.byte $6F			  ; $8176 - Unknown opcode
	AND tmp0,X			   ; $8177: 3D 00 00
	.byte $0B			  ; $817A - Unknown opcode
	LDX #$28				 ; $817B: A2 28   
	JSR $C90C				; $817D: 20 0C C9 ; Call to fixed bank
	JMP $80CF				; $8180: 4C CF 80
loc_8183:
	BRK					  ; $8183: 00	  
	.byte $07			  ; $8184 - Unknown opcode
	.byte $6F			  ; $8185 - Unknown opcode
	AND $FB20				; $8186: 2D 20 FB
	.byte $87			  ; $8189 - Unknown opcode
	BRK					  ; $818A: 00	  
	.byte $62			  ; $818B - Unknown opcode
	.byte $23			  ; $818C - Unknown opcode
	RTI					  ; $818D: 40	  
	CMP #$04				 ; $818E: C9 04	; Compare with 4
	BEQ $819E				; $8190: F0 0C   
	CMP #$01				 ; $8192: C9 01	; Compare with 1
	BEQ $81A6				; $8194: F0 10   
	BRK					  ; $8196: 00	  
	.byte $07			  ; $8197 - Unknown opcode
	.byte $6F			  ; $8198 - Unknown opcode
	ADC $A2				  ; $8199: 65 A2	; Arithmetic
	BRK					  ; $819B: 00	  
	BEQ $81AC				; $819C: F0 0E   
loc_819E:
	BRK					  ; $819E: 00	  
	.byte $07			  ; $819F - Unknown opcode
	.byte $6F			  ; $81A0 - Unknown opcode
	ROR $A2				  ; $81A1: 66 A2   
	.byte $03			  ; $81A3 - Unknown opcode
	BNE $81AC				; $81A4: D0 06   
loc_81A6:
	BRK					  ; $81A6: 00	  
	.byte $07			  ; $81A7 - Unknown opcode
	.byte $6F			  ; $81A8 - Unknown opcode
	.byte $67			  ; $81A9 - Unknown opcode
	LDX #$05				 ; $81AA: A2 05   
loc_81AC:
	STX tmp0				 ; $81AC: 86 00   
	CMP #$FF				 ; $81AE: C9 FF	; Compare with 255
	BEQ $8159				; $81B0: F0 A7   
	CLC					  ; $81B2: 18	  
	ADC tmp0				 ; $81B3: 65 00	; Arithmetic
	TAX					  ; $81B5: AA	  
	LDA $884B,X			  ; $81B6: BD 4B 88
	BEQ $81D7				; $81B9: F0 1C   
	CMP #$01				 ; $81BB: C9 01	; Compare with 1
	BEQ $81CD				; $81BD: F0 0E   
	BRK					  ; $81BF: 00	  
	.byte $62			  ; $81C0 - Unknown opcode
	.byte $23			  ; $81C1 - Unknown opcode
	.byte $80			  ; $81C2 - Unknown opcode
	BEQ $81EE				; $81C3: F0 29   
	JSR $8757				; $81C5: 20 57 87 ; -> sub_8757
	BCC $8187				; $81C8: 90 BD   
	JMP $81FD				; $81CA: 4C FD 81
loc_81CD:
	LDA #$39				 ; $81CD: A9 39   
	JSR $8778				; $81CF: 20 78 87 ; -> sub_8778
	BCC $8187				; $81D2: 90 B3   
	JMP $81FD				; $81D4: 4C FD 81
loc_81D7:
	BRK					  ; $81D7: 00	  
	.byte $62			  ; $81D8 - Unknown opcode
	.byte $23			  ; $81D9 - Unknown opcode
	.byte $80			  ; $81DA - Unknown opcode
	BEQ $81EE				; $81DB: F0 11   
	LDA #$3A				 ; $81DD: A9 3A   
	JSR $8778				; $81DF: 20 78 87 ; -> sub_8778
	BCC $8187				; $81E2: 90 A3   
	LDA #$3B				 ; $81E4: A9 3B   
	JSR $8757				; $81E6: 20 57 87 ; -> sub_8757
	BCC $81D7				; $81E9: 90 EC   
	JMP $81FD				; $81EB: 4C FD 81
loc_81EE:
	BRK					  ; $81EE: 00	  
	.byte $07			  ; $81EF - Unknown opcode
	.byte $6F			  ; $81F0 - Unknown opcode
	AND $6F00,X			  ; $81F1: 3D 00 6F
	.byte $0B			  ; $81F4 - Unknown opcode
	LDX #$32				 ; $81F5: A2 32   
	JSR $C90C				; $81F7: 20 0C C9 ; Call to fixed bank
	JMP $80CF				; $81FA: 4C CF 80
loc_81FD:
	LDA $03D4				; $81FD: AD D4 03
	AND #$1F				 ; $8200: 29 1F   
	STA $03D4				; $8202: 8D D4 03
	JSR $8720				; $8205: 20 20 87 ; -> sub_8720
	LDA $7357				; $8208: AD 57 73
	CMP #$FF				 ; $820B: C9 FF	; Compare with 255
	STA $735A				; $820D: 8D 5A 73
	BNE $822F				; $8210: D0 1D   
	LDX #$00				 ; $8212: A2 00   
loc_8214:
	LDA $72F4,X			  ; $8214: BD F4 72
	AND #$70				 ; $8217: 29 70   
	CMP #$70				 ; $8219: C9 70	; Compare with 112
	BEQ $822C				; $821B: F0 0F   
	INX					  ; $821D: E8	  
	CPX #$04				 ; $821E: E0 04   
	BCC $8214				; $8220: 90 F2   
	LDA #$FF				 ; $8222: A9 FF   
	STA $7359				; $8224: 8D 59 73
	STA $7358				; $8227: 8D 58 73
	BNE $8241				; $822A: D0 15   
loc_822C:
	STX $735A				; $822C: 8E 5A 73
loc_822F:
	LDX $7358				; $822F: AE 58 73
	CPX #$FF				 ; $8232: E0 FF   
	BEQ $8241				; $8234: F0 0B   
	BRK					  ; $8236: 00	  
	PLA					  ; $8237: 68	  
	.byte $53			  ; $8238 - Unknown opcode
	ORA #$10				 ; $8239: 09 10   
	LDX $735A				; $823B: AE 5A 73
	STA $72F4,X			  ; $823E: 9D F4 72
loc_8241:
	JSR $870C				; $8241: 20 0C 87 ; -> sub_870C
	BCC $824B				; $8244: 90 05   
	CPX $7357				; $8246: EC 57 73
	BNE $8260				; $8249: D0 15   
loc_824B:
	LDX $7358				; $824B: AE 58 73
	CPX #$FF				 ; $824E: E0 FF   
	BEQ $8275				; $8250: F0 23   
	BRK					  ; $8252: 00	  
	.byte $2B			  ; $8253 - Unknown opcode
	.byte $73			  ; $8254 - Unknown opcode
	BNE $8275				; $8255: D0 1E   
	STX $7356				; $8257: 8E 56 73
	LDX $735A				; $825A: AE 5A 73
	JMP $8263				; $825D: 4C 63 82
loc_8260:
	STX $7356				; $8260: 8E 56 73
loc_8263:
	STX $96				  ; $8263: 86 96   
	JSR $86F4				; $8265: 20 F4 86 ; -> sub_86F4
	JSR $8321				; $8268: 20 21 83 ; -> sub_8321
	BCC $8275				; $826B: 90 08   
	JSR $8371				; $826D: 20 71 83 ; -> sub_8371
	BCS $8275				; $8270: B0 03   
	JMP $80CF				; $8272: 4C CF 80
loc_8275:
	LDX $96				  ; $8275: A6 96   
	LDA $7324,X			  ; $8277: BD 24 73
	STA $75EA				; $827A: 8D EA 75
	LDA $7300,X			  ; $827D: BD 00 73
	BMI $8292				; $8280: 30 10   
	PHA					  ; $8282: 48	  
	AND #$F0				 ; $8283: 29 F0   
	STA tmp0				 ; $8285: 85 00   
	PLA					  ; $8287: 68	  
	AND #$0F				 ; $8288: 29 0F   
	BRK					  ; $828A: 00	  
	.byte $67			  ; $828B - Unknown opcode
	.byte $73			  ; $828C - Unknown opcode
	ORA tmp0				 ; $828D: 05 00   
	STA $75EB				; $828F: 8D EB 75
loc_8292:
	RTS					  ; $8292: 60	  
loc_8293:
	BRK					  ; $8293: 00	  
	.byte $07			  ; $8294 - Unknown opcode
	.byte $6F			  ; $8295 - Unknown opcode
	AND $0700				; $8296: 2D 00 07
	.byte $6F			  ; $8299 - Unknown opcode
	.byte $64			  ; $829A - Unknown opcode
	CMP #$00				 ; $829B: C9 00	; Compare with 0
	BEQ $82B5				; $829D: F0 16   
	CMP #$01				 ; $829F: C9 01	; Compare with 1
	BEQ $82AE				; $82A1: F0 0B   
	CMP #$02				 ; $82A3: C9 02	; Compare with 2
	BNE $82E5				; $82A5: D0 3E   
	BRK					  ; $82A7: 00	  
	.byte $07			  ; $82A8 - Unknown opcode
	.byte $6F			  ; $82A9 - Unknown opcode
	EOR $974C,X			  ; $82AA: 5D 4C 97
	.byte $82			  ; $82AD - Unknown opcode
loc_82AE:
	BRK					  ; $82AE: 00	  
	.byte $07			  ; $82AF - Unknown opcode
	.byte $6F			  ; $82B0 - Unknown opcode
	.byte $5B			  ; $82B1 - Unknown opcode
	JMP $8297				; $82B2: 4C 97 82
loc_82B5:
	BRK					  ; $82B5: 00	  
	.byte $07			  ; $82B6 - Unknown opcode
	.byte $6F			  ; $82B7 - Unknown opcode
	JMP $FFC9				; $82B8: 4C C9 FF
	BEQ $82D1				; $82BB: F0 14   
	CMP #$06				 ; $82BD: C9 06	; Compare with 6
	BCS $82D1				; $82BF: B0 10   
	BRK					  ; $82C1: 00	  
	LSR $0073				; $82C2: 4E 73 00
	.byte $07			  ; $82C5 - Unknown opcode
	.byte $6F			  ; $82C6 - Unknown opcode
	EOR $D4AD				; $82C7: 4D AD D4
	.byte $03			  ; $82CA - Unknown opcode
	SEC					  ; $82CB: 38	  
	SBC #$20				 ; $82CC: E9 20	; Arithmetic
	STA $03D4				; $82CE: 8D D4 03
loc_82D1:
	JMP $8118				; $82D1: 4C 18 81
loc_82D4:
	JSR $8403				; $82D4: 20 03 84 ; -> sub_8403
	RTS					  ; $82D7: 60	  
loc_82D8:
	LDX #$03				 ; $82D8: A2 03   
	BRK					  ; $82DA: 00	  
	ORA ($6F,X)			  ; $82DB: 01 6F   
	ADC ($C9,X)			  ; $82DD: 61 C9	; Arithmetic
	.byte $FF			  ; $82DF - Unknown opcode
	BEQ $82E5				; $82E0: F0 03   
	STA $62EE				; $82E2: 8D EE 62
loc_82E5:
	JMP $8118				; $82E5: 4C 18 81
loc_82E8:
	LDX #$00				 ; $82E8: A2 00   
	STX $96				  ; $82EA: 86 96   
	STX $7356				; $82EC: 8E 56 73
loc_82EF:
	JSR $86F4				; $82EF: 20 F4 86 ; -> sub_86F4
	JSR $8321				; $82F2: 20 21 83 ; -> sub_8321
	BCC $82FF				; $82F5: 90 08   
	JSR $8371				; $82F7: 20 71 83 ; -> sub_8371
	BCS $82FF				; $82FA: B0 03   
	JSR $830D				; $82FC: 20 0D 83 ; -> sub_830D
loc_82FF:
	INC $7356				; $82FF: EE 56 73
	INC $96				  ; $8302: E6 96   
	BRK					  ; $8304: 00	  
	.byte $62			  ; $8305 - Unknown opcode
	.byte $23			  ; $8306 - Unknown opcode
	RTI					  ; $8307: 40	  
	CMP $96				  ; $8308: C5 96   
	BNE $82EF				; $830A: D0 E3   
	RTS					  ; $830C: 60	  

; ---- Subroutine at $830D (Bank 17) ----
sub_830D:
	LDA $96				  ; $830D: A5 96   
	BEQ $831B				; $830F: F0 0A   
	DEC $96				  ; $8311: C6 96   
	DEC $7356				; $8313: CE 56 73
	JSR $8321				; $8316: 20 21 83 ; -> sub_8321
	BCC $830D				; $8319: 90 F2   
loc_831B:
	DEC $96				  ; $831B: C6 96   
	DEC $7356				; $831D: CE 56 73
	RTS					  ; $8320: 60	  

; ---- Subroutine at $8321 (Bank 17) ----
sub_8321:
	LDX $7356				; $8321: AE 56 73

; ---- Subroutine at $8324 (Bank 17) ----
sub_8324:
	BRK					  ; $8324: 00	  
	LSR $93				  ; $8325: 46 93   
	.byte $07			  ; $8327 - Unknown opcode
	BCC $8362				; $8328: 90 38   
	BRK					  ; $832A: 00	  
	LSR $93				  ; $832B: 46 93   
	ASL $B0				  ; $832D: 06 B0   
	.byte $32			  ; $832F - Unknown opcode
	BRK					  ; $8330: 00	  
	LSR $93				  ; $8331: 46 93   
	BPL $82E5				; $8333: 10 B0   
	BIT $4600				; $8335: 2C 00 46
	.byte $93			  ; $8338 - Unknown opcode
	ORA ($B0),Y			  ; $8339: 11 B0   
	ROL tmp0				 ; $833B: 26 00   
	LSR $93				  ; $833D: 46 93   
	CLC					  ; $833F: 18	  
	BCS $8362				; $8340: B0 20   
	BRK					  ; $8342: 00	  
	LSR $93				  ; $8343: 46 93   
	ROL $B0				  ; $8345: 26 B0   
	.byte $1A			  ; $8347 - Unknown opcode
	BRK					  ; $8348: 00	  
	.byte $2B			  ; $8349 - Unknown opcode
	.byte $73			  ; $834A - Unknown opcode
	CMP #$08				 ; $834B: C9 08	; Compare with 8
	BCS $8364				; $834D: B0 15   
	LDA $72E5				; $834F: AD E5 72
	BPL $8360				; $8352: 10 0C   
	BRK					  ; $8354: 00	  
	PLA					  ; $8355: 68	  
	.byte $73			  ; $8356 - Unknown opcode
	LDA $72E6				; $8357: AD E6 72
	AND #$0F				 ; $835A: 29 0F   
	CMP $72				  ; $835C: C5 72   
	BNE $8362				; $835E: D0 02   
loc_8360:
	SEC					  ; $8360: 38	  
	RTS					  ; $8361: 60	  
loc_8362:
	CLC					  ; $8362: 18	  
	RTS					  ; $8363: 60	  

; ---- Subroutine at $8364 (Bank 17) ----
sub_8364:
	TYA					  ; $8364: 98	  
	PHA					  ; $8365: 48	  
	TXA					  ; $8366: 8A	  
	PHA					  ; $8367: 48	  
	BRK					  ; $8368: 00	  
	.byte $32			  ; $8369 - Unknown opcode
	.byte $0F			  ; $836A - Unknown opcode
	PLA					  ; $836B: 68	  
	TAX					  ; $836C: AA	  
	PLA					  ; $836D: 68	  
	TAY					  ; $836E: A8	  
	CLC					  ; $836F: 18	  
	RTS					  ; $8370: 60	  

; ---- Subroutine at $8371 (Bank 17) ----
sub_8371:
	JSR $87BB				; $8371: 20 BB 87 ; -> sub_87BB
	BRK					  ; $8374: 00	  
	.byte $07			  ; $8375 - Unknown opcode
	.byte $6F			  ; $8376 - Unknown opcode
	AND $00A0				; $8377: 2D A0 00
	JSR $AE0A				; $837A: 20 0A AE ; -> sub_AE0A
	BCC $8383				; $837D: 90 04   
	LDY #$02				 ; $837F: A0 02   
	BNE $8390				; $8381: D0 0D   
loc_8383:
	LDX $7356				; $8383: AE 56 73
loc_8386:
	DEX					  ; $8386: CA	  
	BMI $8390				; $8387: 30 07   
	JSR $8324				; $8389: 20 24 83 ; -> sub_8324
	BCC $8386				; $838C: 90 F8   
	LDY #$02				 ; $838E: A0 02   
loc_8390:
	JSR $86E2				; $8390: 20 E2 86 ; -> sub_86E2
	BRK					  ; $8393: 00	  
	.byte $3C			  ; $8394 - Unknown opcode
	.byte $93			  ; $8395 - Unknown opcode
	BRK					  ; $8396: 00	  
	STA tmp0				 ; $8397: 85 00   
	BRK					  ; $8399: 00	  
	.byte $3C			  ; $839A - Unknown opcode
	.byte $93			  ; $839B - Unknown opcode
	ORA (ptr0_hi,X)		  ; $839C: 01 05   
	BRK					  ; $839E: 00	  
	STA tmp0				 ; $839F: 85 00   
	BRK					  ; $83A1: 00	  
	.byte $2B			  ; $83A2 - Unknown opcode
	.byte $73			  ; $83A3 - Unknown opcode
	BNE $83AE				; $83A4: D0 08   
	BRK					  ; $83A6: 00	  
	.byte $3C			  ; $83A7 - Unknown opcode
	.byte $93			  ; $83A8 - Unknown opcode
	.byte $02			  ; $83A9 - Unknown opcode
	ORA tmp0				 ; $83AA: 05 00   
	STA tmp0				 ; $83AC: 85 00   
loc_83AE:
	LDA tmp0				 ; $83AE: A5 00   
	BNE $83B3				; $83B0: D0 01   
	INY					  ; $83B2: C8	  
loc_83B3:
	TYA					  ; $83B3: 98	  
	PHA					  ; $83B4: 48	  
	LDX $7356				; $83B5: AE 56 73
	LDA $8827,Y			  ; $83B8: B9 27 88
	BRK					  ; $83BB: 00	  
	BRK					  ; $83BC: 00	  
	.byte $6F			  ; $83BD - Unknown opcode
	STA tmp0				 ; $83BE: 85 00   
	TAX					  ; $83C0: AA	  
	PLA					  ; $83C1: 68	  
	CPX #$FF				 ; $83C2: E0 FF   
	BEQ $83E8				; $83C4: F0 22   
	CPX #$FD				 ; $83C6: E0 FD   
	BEQ $83F3				; $83C8: F0 29   
	ASL					  ; $83CA: 0A	  
	ASL					  ; $83CB: 0A	  
	ASL					  ; $83CC: 0A	  
	ADC tmp0				 ; $83CD: 65 00	; Arithmetic
	TAX					  ; $83CF: AA	  
	LDA $882B,X			  ; $83D0: BD 2B 88
	BEQ $83F0				; $83D3: F0 1B   
	CMP #$01				 ; $83D5: C9 01	; Compare with 1
	BEQ $83ED				; $83D7: F0 14   
	CMP #$02				 ; $83D9: C9 02	; Compare with 2
	BEQ $83EA				; $83DB: F0 0D   
	CMP #$03				 ; $83DD: C9 03	; Compare with 3
	BEQ $8458				; $83DF: F0 77   
	CMP #$04				 ; $83E1: C9 04	; Compare with 4
	BEQ $8403				; $83E3: F0 1E   
	SEC					  ; $83E5: 38	  
	SBC #$01				 ; $83E6: E9 01	; Arithmetic
loc_83E8:
	CLC					  ; $83E8: 18	  
	RTS					  ; $83E9: 60	  
loc_83EA:
	JMP $8530				; $83EA: 4C 30 85
loc_83ED:
	JMP $8479				; $83ED: 4C 79 84
loc_83F0:
	JMP $8464				; $83F0: 4C 64 84
loc_83F3:
	LDX #$03				 ; $83F3: A2 03   
	BRK					  ; $83F5: 00	  
	ORA ($6F,X)			  ; $83F6: 01 6F   
	ADC ($C9,X)			  ; $83F8: 61 C9	; Arithmetic
	.byte $FF			  ; $83FA - Unknown opcode
	BEQ $8400				; $83FB: F0 03   
	STA $62EE				; $83FD: 8D EE 62
loc_8400:
	JMP $8371				; $8400: 4C 71 83

; ---- Subroutine at $8403 (Bank 17) ----
sub_8403:
	BRK					  ; $8403: 00	  
	.byte $07			  ; $8404 - Unknown opcode
	.byte $6F			  ; $8405 - Unknown opcode
	AND $8300,X			  ; $8406: 3D 00 83
	.byte $FB			  ; $8409 - Unknown opcode
	LDA #$00				 ; $840A: A9 00   
	STA $6E				  ; $840C: 85 6E   
	LDA #$03				 ; $840E: A9 03   
	BRK					  ; $8410: 00	  
	AND $850F				; $8411: 2D 0F 85
	SBC $6200,Y			  ; $8414: F9 00 62 ; Arithmetic
	.byte $33			  ; $8417 - Unknown opcode
	LDY #$1D				 ; $8418: A0 1D   
	CMP #$01				 ; $841A: C9 01	; Compare with 1
	BEQ $8420				; $841C: F0 02   
	LDY #$1E				 ; $841E: A0 1E   
loc_8420:
	TYA					  ; $8420: 98	  
	BRK					  ; $8421: 00	  
	.byte $80			  ; $8422 - Unknown opcode
	.byte $E3			  ; $8423 - Unknown opcode
	JSR $8637				; $8424: 20 37 86 ; -> sub_8637
	BCS $844D				; $8427: B0 24   
	LDA $72E4				; $8429: AD E4 72
	PHA					  ; $842C: 48	  
	AND #$FC				 ; $842D: 29 FC   
	STA tmp0				 ; $842F: 85 00   
	PLA					  ; $8431: 68	  
	CLC					  ; $8432: 18	  
	ADC #$01				 ; $8433: 69 01	; Arithmetic
	AND #$03				 ; $8435: 29 03   
	ORA tmp0				 ; $8437: 05 00   
	STA $72E4				; $8439: 8D E4 72
	LDA $6E44				; $843C: AD 44 6E
	AND #$FC				 ; $843F: 29 FC   
	ORA #$01				 ; $8441: 09 01   
	STA $6E44				; $8443: 8D 44 6E
	BRK					  ; $8446: 00	  
	CPX $D3				  ; $8447: E4 D3   
	.byte $04			  ; $8449 - Unknown opcode
	PLA					  ; $844A: 68	  
	PLA					  ; $844B: 68	  
	RTS					  ; $844C: 60	  
loc_844D:
	LDA $72E7				; $844D: AD E7 72
	ORA #$60				 ; $8450: 09 60   
	STA $72E7				; $8452: 8D E7 72
	PLA					  ; $8455: 68	  
	PLA					  ; $8456: 68	  
	RTS					  ; $8457: 60	  
loc_8458:
	LDA #$41				 ; $8458: A9 41   
	JSR $8706				; $845A: 20 06 87 ; -> sub_8706
	LDA #$00				 ; $845D: A9 00   
	JSR $8700				; $845F: 20 00 87 ; -> sub_8700
	SEC					  ; $8462: 38	  
	RTS					  ; $8463: 60	  
loc_8464:
	JSR $85EA				; $8464: 20 EA 85 ; -> sub_85EA
	BCC $8476				; $8467: 90 0D   
	JSR $8700				; $8469: 20 00 87 ; -> sub_8700
	JSR $86F4				; $846C: 20 F4 86 ; -> sub_86F4
	LDA #$43				 ; $846F: A9 43   
	JSR $8706				; $8471: 20 06 87 ; -> sub_8706
	SEC					  ; $8474: 38	  
	RTS					  ; $8475: 60	  
loc_8476:
	JMP $8371				; $8476: 4C 71 83
loc_8479:
	LDX $7356				; $8479: AE 56 73
	BRK					  ; $847C: 00	  
	.byte $2B			  ; $847D - Unknown opcode
	.byte $73			  ; $847E - Unknown opcode
	TAX					  ; $847F: AA	  
	TAY					  ; $8480: A8	  
	LDA $6BDF,X			  ; $8481: BD DF 6B
	STA tmp0				 ; $8484: 85 00   
	LDA #$00				 ; $8486: A9 00   
	STA tmp1				 ; $8488: 85 01   
	LDA #$06				 ; $848A: A9 06   
	LDX #$00				 ; $848C: A2 00   
	JSR $C851				; $848E: 20 51 C8 ; Call to fixed bank
	TYA					  ; $8491: 98	  
	LDY #$01				 ; $8492: A0 01   
	CMP #$00				 ; $8494: C9 00	; Compare with 0
	BNE $849A				; $8496: D0 02   
	LDY #$02				 ; $8498: A0 02   
loc_849A:
	LDX $7356				; $849A: AE 56 73
	CPY tmp0				 ; $849D: C4 00   
	BCC $84A8				; $849F: 90 07   
	LDA tmp0				 ; $84A1: A5 00   
	BRK					  ; $84A3: 00	  
	.byte $3C			  ; $84A4 - Unknown opcode
	.byte $73			  ; $84A5 - Unknown opcode
	BNE $84BE				; $84A6: D0 16   
loc_84A8:
	LDY #$02				 ; $84A8: A0 02   
	BRK					  ; $84AA: 00	  
	.byte $2B			  ; $84AB - Unknown opcode
	.byte $53			  ; $84AC - Unknown opcode
	BEQ $84B1				; $84AD: F0 02   
	LDY #$01				 ; $84AF: A0 01   
loc_84B1:
	STY $6F				  ; $84B1: 84 6F   
loc_84B3:
	BRK					  ; $84B3: 00	  
	.byte $3C			  ; $84B4 - Unknown opcode
	.byte $53			  ; $84B5 - Unknown opcode
	BNE $84BE				; $84B6: D0 06   
	DEC $6F				  ; $84B8: C6 6F   
	BPL $84B3				; $84BA: 10 F7   
	BMI $852D				; $84BC: 30 6F   
loc_84BE:
	LDX $6F				  ; $84BE: A6 6F   
	LDA $8824,X			  ; $84C0: BD 24 88
	JSR $86E2				; $84C3: 20 E2 86 ; -> sub_86E2
	BRK					  ; $84C6: 00	  
	BRK					  ; $84C7: 00	  
	.byte $6F			  ; $84C8 - Unknown opcode
	CMP #$FF				 ; $84C9: C9 FF	; Compare with 255
	BEQ $852D				; $84CB: F0 60   
	PHA					  ; $84CD: 48	  
	LDX $7356				; $84CE: AE 56 73
	BRK					  ; $84D1: 00	  
	.byte $2B			  ; $84D2 - Unknown opcode
	.byte $73			  ; $84D3 - Unknown opcode
	TAX					  ; $84D4: AA	  
	PLA					  ; $84D5: 68	  
	STA $6BDF,X			  ; $84D6: 9D DF 6B
	JSR $86E2				; $84D9: 20 E2 86 ; -> sub_86E2
	BRK					  ; $84DC: 00	  
	.byte $3F			  ; $84DD - Unknown opcode
	.byte $73			  ; $84DE - Unknown opcode
	BCC $852D				; $84DF: 90 4C   
	PHA					  ; $84E1: 48	  
	JSR $8706				; $84E2: 20 06 87 ; -> sub_8706
	LDX $7356				; $84E5: AE 56 73
	TAY					  ; $84E8: A8	  
	BRK					  ; $84E9: 00	  
	PLA					  ; $84EA: 68	  
	.byte $73			  ; $84EB - Unknown opcode
	JSR $AB49				; $84EC: 20 49 AB ; -> sub_AB49
	PLA					  ; $84EF: 68	  
	BCC $850F				; $84F0: 90 1D   
	PHA					  ; $84F2: 48	  
	BRK					  ; $84F3: 00	  
	.byte $0C			  ; $84F4 - Unknown opcode
	.byte $3F			  ; $84F5 - Unknown opcode
	ROR					  ; $84F6: 6A	  
	AND #$80				 ; $84F7: 29 80   
	STA $7354				; $84F9: 8D 54 73
	PLA					  ; $84FC: 68	  
	BRK					  ; $84FD: 00	  
	ORA $903F				; $84FE: 0D 3F 90
	ORA $20				  ; $8501: 05 20   
	INC $85,X				; $8503: F6 85   
	BCC $852D				; $8505: 90 26   
	LDA $7354				; $8507: AD 54 73
	JSR $8700				; $850A: 20 00 87 ; -> sub_8700
	SEC					  ; $850D: 38	  
	RTS					  ; $850E: 60	  
loc_850F:
	PHA					  ; $850F: 48	  
	BRK					  ; $8510: 00	  
	.byte $07			  ; $8511 - Unknown opcode
	.byte $6F			  ; $8512 - Unknown opcode
	AND $C968,X			  ; $8513: 3D 68 C9
	.byte $12			  ; $8516 - Unknown opcode
	BNE $8527				; $8517: D0 0E   
	BRK					  ; $8519: 00	  
	.byte $62			  ; $851A - Unknown opcode
	.byte $23			  ; $851B - Unknown opcode
	.byte $43			  ; $851C - Unknown opcode
	CMP #$04				 ; $851D: C9 04	; Compare with 4
	BCS $8527				; $851F: B0 06   
	BRK					  ; $8521: 00	  
	RTS					  ; $8522: 60	  
	.byte $1B			  ; $8523 - Unknown opcode
	JMP $852A				; $8524: 4C 2A 85
loc_8527:
	BRK					  ; $8527: 00	  
	ORA ($0B,X)			  ; $8528: 01 0B   
loc_852A:
	JSR $8752				; $852A: 20 52 87 ; -> sub_8752
loc_852D:
	JMP $8371				; $852D: 4C 71 83
loc_8530:
	LDA #$00				 ; $8530: A9 00   
	STA $7354				; $8532: 8D 54 73
	LDX $7356				; $8535: AE 56 73
	BRK					  ; $8538: 00	  
	AND $D073				; $8539: 2D 73 D0
	.byte $12			  ; $853C - Unknown opcode
	BRK					  ; $853D: 00	  
	.byte $07			  ; $853E - Unknown opcode
	.byte $6F			  ; $853F - Unknown opcode
	AND $56AD,X			  ; $8540: 3D AD 56
	.byte $73			  ; $8543 - Unknown opcode
	STA $F9				  ; $8544: 85 F9   
	BRK					  ; $8546: 00	  
	.byte $02			  ; $8547 - Unknown opcode
	.byte $0B			  ; $8548 - Unknown opcode
	JSR $8752				; $8549: 20 52 87 ; -> sub_8752
	JMP $852D				; $854C: 4C 2D 85
	LDX $7356				; $854F: AE 56 73
	BRK					  ; $8552: 00	  
	ORA ($6F,X)			  ; $8553: 01 6F   
	.byte $37			  ; $8555 - Unknown opcode
	CMP #$FF				 ; $8556: C9 FF	; Compare with 255
	BEQ $852D				; $8558: F0 D3   
	LDX $7356				; $855A: AE 56 73
	BRK					  ; $855D: 00	  
	BIT $8D73				; $855E: 2C 73 8D
	EOR $73,X				; $8561: 55 73   
	JSR $8706				; $8563: 20 06 87 ; -> sub_8706
	BRK					  ; $8566: 00	  
	.byte $0B			  ; $8567 - Unknown opcode
	.byte $0F			  ; $8568 - Unknown opcode
	CPX #$00				 ; $8569: E0 00   
	BNE $85A9				; $856B: D0 3C   
	PHA					  ; $856D: 48	  
	BRK					  ; $856E: 00	  
	.byte $2B			  ; $856F - Unknown opcode
	.byte $33			  ; $8570 - Unknown opcode
	TAX					  ; $8571: AA	  
	PLA					  ; $8572: 68	  
	BRK					  ; $8573: 00	  
	ASL					  ; $8574: 0A	  
	.byte $0F			  ; $8575 - Unknown opcode
	BCC $85A9				; $8576: 90 31   
	BRK					  ; $8578: 00	  
	.byte $07			  ; $8579 - Unknown opcode
	.byte $6F			  ; $857A - Unknown opcode
	SEC					  ; $857B: 38	  
	CMP #$FF				 ; $857C: C9 FF	; Compare with 255
	BEQ $852D				; $857E: F0 AD   
	CMP #$00				 ; $8580: C9 00	; Compare with 0
	BEQ $85A9				; $8582: F0 25   
	LDX $7356				; $8584: AE 56 73
	BRK					  ; $8587: 00	  
	.byte $3B			  ; $8588 - Unknown opcode
	.byte $93			  ; $8589 - Unknown opcode
	BRK					  ; $858A: 00	  
	BCC $8592				; $858B: 90 05   
	BRK					  ; $858D: 00	  
	.byte $0C			  ; $858E - Unknown opcode
	.byte $0F			  ; $858F - Unknown opcode
	BCS $85D0				; $8590: B0 3E   
loc_8592:
	BRK					  ; $8592: 00	  
	.byte $2B			  ; $8593 - Unknown opcode
	.byte $53			  ; $8594 - Unknown opcode
	TAX					  ; $8595: AA	  
	LDA $7355				; $8596: AD 55 73
	BRK					  ; $8599: 00	  
	ASL					  ; $859A: 0A	  
	.byte $0F			  ; $859B - Unknown opcode
	JSR $85EA				; $859C: 20 EA 85 ; -> sub_85EA
	LDA $7354				; $859F: AD 54 73
	ORA #$10				 ; $85A2: 09 10   
	JSR $8700				; $85A4: 20 00 87 ; -> sub_8700
	SEC					  ; $85A7: 38	  
	RTS					  ; $85A8: 60	  
loc_85A9:
	LDA $7355				; $85A9: AD 55 73
	BRK					  ; $85AC: 00	  
	ORA $0F,X				; $85AD: 15 0F   
	BCC $85C6				; $85AF: 90 15   
	BRK					  ; $85B1: 00	  
	ASL $0F,X				; $85B2: 16 0F   
	PHA					  ; $85B4: 48	  
	ROR					  ; $85B5: 6A	  
	AND #$80				 ; $85B6: 29 80   
	STA $7354				; $85B8: 8D 54 73
	PLA					  ; $85BB: 68	  
	BRK					  ; $85BC: 00	  
	.byte $14			  ; $85BD - Unknown opcode
	.byte $0F			  ; $85BE - Unknown opcode
	BCC $85C6				; $85BF: 90 05   
	JSR $85F6				; $85C1: 20 F6 85 ; -> sub_85F6
	BCC $85E7				; $85C4: 90 21   
loc_85C6:
	LDA $7354				; $85C6: AD 54 73
	ORA #$20				 ; $85C9: 09 20   
	JSR $8700				; $85CB: 20 00 87 ; -> sub_8700
	SEC					  ; $85CE: 38	  
	RTS					  ; $85CF: 60	  
loc_85D0:
	BRK					  ; $85D0: 00	  
	.byte $07			  ; $85D1 - Unknown opcode
	.byte $6F			  ; $85D2 - Unknown opcode
	AND $56AD,X			  ; $85D3: 3D AD 56
	.byte $73			  ; $85D6 - Unknown opcode
	STA $F9				  ; $85D7: 85 F9   
	LDA $7355				; $85D9: AD 55 73
	STA $FA				  ; $85DC: 85 FA   
	BRK					  ; $85DE: 00	  
	.byte $03			  ; $85DF - Unknown opcode
	.byte $0B			  ; $85E0 - Unknown opcode
	JSR $8752				; $85E1: 20 52 87 ; -> sub_8752
	JMP $8530				; $85E4: 4C 30 85
loc_85E7:
	JMP $8371				; $85E7: 4C 71 83

; ---- Subroutine at $85EA (Bank 17) ----
sub_85EA:
	LDA #$80				 ; $85EA: A9 80   
	STA $7354				; $85EC: 8D 54 73
	BNE $85F6				; $85EF: D0 05   
	LDA #$00				 ; $85F1: A9 00   
	STA $7354				; $85F3: 8D 54 73

; ---- Subroutine at $85F6 (Bank 17) ----
sub_85F6:
	LDA #$33				 ; $85F6: A9 33   
	LDX $7354				; $85F8: AE 54 73
	BPL $85FF				; $85FB: 10 02   
	LDA #$2E				 ; $85FD: A9 2E   
loc_85FF:
	LDX #$FF				 ; $85FF: A2 FF   
	BRK					  ; $8601: 00	  
	BRK					  ; $8602: 00	  
	.byte $6F			  ; $8603 - Unknown opcode
	CMP #$FF				 ; $8604: C9 FF	; Compare with 255
	BEQ $8635				; $8606: F0 2D   
	CMP #$FE				 ; $8608: C9 FE	; Compare with 254
	BNE $8617				; $860A: D0 0B   
	LDA $7354				; $860C: AD 54 73
	EOR #$80				 ; $860F: 49 80   
	STA $7354				; $8611: 8D 54 73
	JMP $85F6				; $8614: 4C F6 85
loc_8617:
	PHA					  ; $8617: 48	  
	LDA $7354				; $8618: AD 54 73
	BMI $8627				; $861B: 30 0A   
	PLA					  ; $861D: 68	  
	TAX					  ; $861E: AA	  
	BRK					  ; $861F: 00	  
	PLA					  ; $8620: 68	  
	.byte $73			  ; $8621 - Unknown opcode
	STA $7354				; $8622: 8D 54 73
	BPL $8633				; $8625: 10 0C   
loc_8627:
	PLA					  ; $8627: 68	  
	BRK					  ; $8628: 00	  
	.byte $32			  ; $8629 - Unknown opcode
	.byte $B3			  ; $862A - Unknown opcode
	ORA #$80				 ; $862B: 09 80   
	CLC					  ; $862D: 18	  
	ADC #$08				 ; $862E: 69 08	; Arithmetic
	STA $7354				; $8630: 8D 54 73
loc_8633:
	SEC					  ; $8633: 38	  
	RTS					  ; $8634: 60	  
loc_8635:
	CLC					  ; $8635: 18	  
	RTS					  ; $8636: 60	  

; ---- Subroutine at $8637 (Bank 17) ----
sub_8637:
	BIT $6E44				; $8637: 2C 44 6E
	BVS $86B3				; $863A: 70 77   
	LDX #$FF				 ; $863C: A2 FF   
	BRK					  ; $863E: 00	  
	AND #$C3				 ; $863F: 29 C3   
	ASL $0085				; $8641: 0E 85 00
	BRK					  ; $8644: 00	  
	AND #$C3				 ; $8645: 29 C3   
	BRK					  ; $8647: 00	  
	STA tmp1				 ; $8648: 85 01   
	BRK					  ; $864A: 00	  
	AND #$C3				 ; $864B: 29 C3   
	ORA $0105				; $864D: 0D 05 01
	STA tmp1				 ; $8650: 85 01   
	BRK					  ; $8652: 00	  
	AND #$C3				 ; $8653: 29 C3   
	.byte $02			  ; $8655 - Unknown opcode
	ORA tmp1				 ; $8656: 05 01   
	STA tmp1				 ; $8658: 85 01   
	BRK					  ; $865A: 00	  
	AND #$C3				 ; $865B: 29 C3   
	ORA (ptr0_hi),Y		  ; $865D: 11 05   
	ORA ($25,X)			  ; $865F: 01 25   
	BRK					  ; $8661: 00	  
	CMP tmp0				 ; $8662: C5 00   
	BEQ $86B1				; $8664: F0 4B   
	LDA $6E44				; $8666: AD 44 6E
	AND #$03				 ; $8669: 29 03   
	CMP #$02				 ; $866B: C9 02	; Compare with 2
	BEQ $86B1				; $866D: F0 42   
	LDA $72E4				; $866F: AD E4 72
	AND #$03				 ; $8672: 29 03   
	CMP #$03				 ; $8674: C9 03	; Compare with 3
	BEQ $86B1				; $8676: F0 39   
	TAX					  ; $8678: AA	  
	LDA $8852,X			  ; $8679: BD 52 88
	STA tmp1				 ; $867C: 85 01   
	LDA #$00				 ; $867E: A9 00   
	STA tmp0				 ; $8680: 85 00   
	LSR tmp1				 ; $8682: 46 01   
	ROR tmp0				 ; $8684: 66 00   
	LSR tmp1				 ; $8686: 46 01   
	ROR tmp0				 ; $8688: 66 00   
	LSR tmp1				 ; $868A: 46 01   
	ROR tmp0				 ; $868C: 66 00   
	JSR $86B5				; $868E: 20 B5 86 ; -> sub_86B5
	LDA $75				  ; $8691: A5 75   
	SEC					  ; $8693: 38	  
	SBC $7396				; $8694: ED 96 73 ; Arithmetic
	BCS $869D				; $8697: B0 04   
	LDA #$08				 ; $8699: A9 08   
	BNE $86A5				; $869B: D0 08   
loc_869D:
	CMP #$05				 ; $869D: C9 05	; Compare with 5
	BCS $86B1				; $869F: B0 10   
	TAX					  ; $86A1: AA	  
	LDA $8856,X			  ; $86A2: BD 56 88
loc_86A5:
	LDX #$00				 ; $86A5: A2 00   
	JSR $C827				; $86A7: 20 27 C8 ; Call to fixed bank
	BRK					  ; $86AA: 00	  
	.byte $1B			  ; $86AB - Unknown opcode
	.byte $0F			  ; $86AC - Unknown opcode
	CMP tmp1				 ; $86AD: C5 01   
	BCC $86B3				; $86AF: 90 02   
loc_86B1:
	SEC					  ; $86B1: 38	  
	RTS					  ; $86B2: 60	  
loc_86B3:
	CLC					  ; $86B3: 18	  
	RTS					  ; $86B4: 60	  

; ---- Subroutine at $86B5 (Bank 17) ----
sub_86B5:
	BRK					  ; $86B5: 00	  
	.byte $64			  ; $86B6 - Unknown opcode
	.byte $63			  ; $86B7 - Unknown opcode
	ORA #$AD				 ; $86B8: 09 AD   
	.byte $5A			  ; $86BA - Unknown opcode
	ADC ($C9,X)			  ; $86BB: 61 C9	; Arithmetic
	.byte $04			  ; $86BD - Unknown opcode
	BCC $86E1				; $86BE: 90 21   
	LDA tmp0				 ; $86C0: A5 00   
	PHA					  ; $86C2: 48	  
	LDA tmp1				 ; $86C3: A5 01   
	PHA					  ; $86C5: 48	  
	LDA #$00				 ; $86C6: A9 00   
	BRK					  ; $86C8: 00	  
	ASL					  ; $86C9: 0A	  
	.byte $2F			  ; $86CA - Unknown opcode
	BCS $86D5				; $86CB: B0 08   
	BRK					  ; $86CD: 00	  
	.byte $64			  ; $86CE - Unknown opcode
	.byte $63			  ; $86CF - Unknown opcode
	ORA #$A6				 ; $86D0: 09 A6   
	ADC $D0,X				; $86D2: 75 D0	; Arithmetic
	.byte $04			  ; $86D4 - Unknown opcode
loc_86D5:
	BRK					  ; $86D5: 00	  
	.byte $0F			  ; $86D6 - Unknown opcode
	.byte $53			  ; $86D7 - Unknown opcode
	TAX					  ; $86D8: AA	  
	STX $75				  ; $86D9: 86 75   
	PLA					  ; $86DB: 68	  
	STA tmp1				 ; $86DC: 85 01   
	PLA					  ; $86DE: 68	  
	STA tmp0				 ; $86DF: 85 00   
loc_86E1:
	RTS					  ; $86E1: 60	  

; ---- Subroutine at $86E2 (Bank 17) ----
sub_86E2:
	PHA					  ; $86E2: 48	  
	LDX $7356				; $86E3: AE 56 73
	BRK					  ; $86E6: 00	  
	LSR $93				  ; $86E7: 46 93   
	.byte $1C			  ; $86E9 - Unknown opcode
	BCC $86F2				; $86EA: 90 06   
	LDA $73				  ; $86EC: A5 73   
	BRK					  ; $86EE: 00	  
	.byte $67			  ; $86EF - Unknown opcode
	.byte $73			  ; $86F0 - Unknown opcode
	TAX					  ; $86F1: AA	  
loc_86F2:
	PLA					  ; $86F2: 68	  
	RTS					  ; $86F3: 60	  

; ---- Subroutine at $86F4 (Bank 17) ----
sub_86F4:
	LDX $7356				; $86F4: AE 56 73
	BRK					  ; $86F7: 00	  
	PLA					  ; $86F8: 68	  
	.byte $73			  ; $86F9 - Unknown opcode
	LDX $96				  ; $86FA: A6 96   
	STA $72F4,X			  ; $86FC: 9D F4 72
	RTS					  ; $86FF: 60	  

; ---- Subroutine at $8700 (Bank 17) ----
sub_8700:
	LDX $96				  ; $8700: A6 96   
	STA $7300,X			  ; $8702: 9D 00 73
	RTS					  ; $8705: 60	  

; ---- Subroutine at $8706 (Bank 17) ----
sub_8706:
	LDX $96				  ; $8706: A6 96   
	STA $7324,X			  ; $8708: 9D 24 73
	RTS					  ; $870B: 60	  

; ---- Subroutine at $870C (Bank 17) ----
sub_870C:
	LDX #$00				 ; $870C: A2 00   
loc_870E:
	BRK					  ; $870E: 00	  
	.byte $2B			  ; $870F - Unknown opcode
	.byte $73			  ; $8710 - Unknown opcode
	BEQ $871E				; $8711: F0 0B   
	BRK					  ; $8713: 00	  
	.byte $62			  ; $8714 - Unknown opcode
	.byte $63			  ; $8715 - Unknown opcode
	RTI					  ; $8716: 40	  
	INX					  ; $8717: E8	  
	CPX $72				  ; $8718: E4 72   
	BNE $870E				; $871A: D0 F2   
	CLC					  ; $871C: 18	  
	RTS					  ; $871D: 60	  
loc_871E:
	SEC					  ; $871E: 38	  
	RTS					  ; $871F: 60	  

; ---- Subroutine at $8720 (Bank 17) ----
sub_8720:
	LDX #$00				 ; $8720: A2 00   
loc_8722:
	BRK					  ; $8722: 00	  
	PLA					  ; $8723: 68	  
	.byte $73			  ; $8724 - Unknown opcode
	STA $72F4,X			  ; $8725: 9D F4 72
	BRK					  ; $8728: 00	  
	LSR $93				  ; $8729: 46 93   
	CLC					  ; $872B: 18	  
	BCS $8748				; $872C: B0 1A   
	BRK					  ; $872E: 00	  
	LSR $93				  ; $872F: 46 93   
	ROL $B0				  ; $8731: 26 B0   
	.byte $14			  ; $8733 - Unknown opcode
	BRK					  ; $8734: 00	  
	.byte $2B			  ; $8735 - Unknown opcode
	.byte $53			  ; $8736 - Unknown opcode
	CMP #$08				 ; $8737: C9 08	; Compare with 8
	BCC $8740				; $8739: 90 05   
	STX $96				  ; $873B: 86 96   
	JSR $8364				; $873D: 20 64 83 ; -> sub_8364
loc_8740:
	LDA $72F4,X			  ; $8740: BD F4 72
	ORA #$10				 ; $8743: 09 10   
	STA $72F4,X			  ; $8745: 9D F4 72
loc_8748:
	INX					  ; $8748: E8	  
	BRK					  ; $8749: 00	  
	.byte $62			  ; $874A - Unknown opcode
	.byte $63			  ; $874B - Unknown opcode
	RTI					  ; $874C: 40	  
	CPX $72				  ; $874D: E4 72   
	BNE $8722				; $874F: D0 D1   
	RTS					  ; $8751: 60	  

; ---- Subroutine at $8752 (Bank 17) ----
sub_8752:
	LDX #$39				 ; $8752: A2 39   
	JMP $C90C				; $8754: 4C 0C C9

; ---- Subroutine at $8757 (Bank 17) ----
sub_8757:
	BRK					  ; $8757: 00	  
	.byte $07			  ; $8758 - Unknown opcode
	.byte $6F			  ; $8759 - Unknown opcode
	.byte $3B			  ; $875A - Unknown opcode
	CMP #$FF				 ; $875B: C9 FF	; Compare with 255
	BEQ $8776				; $875D: F0 17   
	STA $7358				; $875F: 8D 58 73
	LDA $7357				; $8762: AD 57 73
	CMP #$FF				 ; $8765: C9 FF	; Compare with 255
	BNE $8771				; $8767: D0 08   
	BRK					  ; $8769: 00	  
	.byte $07			  ; $876A - Unknown opcode
	.byte $6F			  ; $876B - Unknown opcode
	.byte $3C			  ; $876C - Unknown opcode
	CMP #$FF				 ; $876D: C9 FF	; Compare with 255
	BEQ $8776				; $876F: F0 05   
loc_8771:
	STA $7359				; $8771: 8D 59 73
	SEC					  ; $8774: 38	  
	RTS					  ; $8775: 60	  
loc_8776:
	CLC					  ; $8776: 18	  
	RTS					  ; $8777: 60	  

; ---- Subroutine at $8778 (Bank 17) ----
sub_8778:
	BRK					  ; $8778: 00	  
	BRK					  ; $8779: 00	  
	.byte $6F			  ; $877A - Unknown opcode
	CMP #$FF				 ; $877B: C9 FF	; Compare with 255
	BEQ $8784				; $877D: F0 05   
	STA $7357				; $877F: 8D 57 73
	SEC					  ; $8782: 38	  
	RTS					  ; $8783: 60	  
loc_8784:
	CLC					  ; $8784: 18	  
	RTS					  ; $8785: 60	  

; ---- Subroutine at $8786 (Bank 17) ----
sub_8786:
	PHA					  ; $8786: 48	  
	TXA					  ; $8787: 8A	  
	PHA					  ; $8788: 48	  
	TYA					  ; $8789: 98	  
	PHA					  ; $878A: 48	  
	JSR $87E6				; $878B: 20 E6 87 ; -> sub_87E6
	LDX #$04				 ; $878E: A2 04   
	LDA $6E45				; $8790: AD 45 6E
	CMP #$AE				 ; $8793: C9 AE	; Compare with 174
	BEQ $879B				; $8795: F0 04   
	CMP #$BC				 ; $8797: C9 BC	; Compare with 188
	BNE $879C				; $8799: D0 01   
loc_879B:
	DEX					  ; $879B: CA	  
loc_879C:
	TXA					  ; $879C: 8A	  
	ASL					  ; $879D: 0A	  
	ASL					  ; $879E: 0A	  
	ASL					  ; $879F: 0A	  
	ASL					  ; $87A0: 0A	  
	ORA #$01				 ; $87A1: 09 01   
	STA $04F2				; $87A3: 8D F2 04
	LDA #$1E				 ; $87A6: A9 1E   
	STA $04F3				; $87A8: 8D F3 04
	TXA					  ; $87AB: 8A	  
	PHA					  ; $87AC: 48	  
	BRK					  ; $87AD: 00	  
	.byte $12			  ; $87AE - Unknown opcode
	.byte $DF			  ; $87AF - Unknown opcode
	PLA					  ; $87B0: 68	  
	TAX					  ; $87B1: AA	  
	DEX					  ; $87B2: CA	  
	BNE $879C				; $87B3: D0 E7   
	PLA					  ; $87B5: 68	  
	TAY					  ; $87B6: A8	  
	PLA					  ; $87B7: 68	  
	TAX					  ; $87B8: AA	  
	PLA					  ; $87B9: 68	  
	RTS					  ; $87BA: 60	  

; ---- Subroutine at $87BB (Bank 17) ----
sub_87BB:
	PHA					  ; $87BB: 48	  
	TXA					  ; $87BC: 8A	  
	PHA					  ; $87BD: 48	  
	TYA					  ; $87BE: 98	  
	PHA					  ; $87BF: 48	  
	JSR $87E6				; $87C0: 20 E6 87 ; -> sub_87E6
	LDX #$0D				 ; $87C3: A2 0D   
loc_87C5:
	TXA					  ; $87C5: 8A	  
	ASL					  ; $87C6: 0A	  
	ASL					  ; $87C7: 0A	  
	ASL					  ; $87C8: 0A	  
	ASL					  ; $87C9: 0A	  
	ORA #$01				 ; $87CA: 09 01   
	STA $04F2				; $87CC: 8D F2 04
	LDA #$1E				 ; $87CF: A9 1E   
	STA $04F3				; $87D1: 8D F3 04
	TXA					  ; $87D4: 8A	  
	PHA					  ; $87D5: 48	  
	BRK					  ; $87D6: 00	  
	.byte $13			  ; $87D7 - Unknown opcode
	.byte $DF			  ; $87D8 - Unknown opcode
	PLA					  ; $87D9: 68	  
	TAX					  ; $87DA: AA	  
	DEX					  ; $87DB: CA	  
	CPX #$08				 ; $87DC: E0 08   
	BNE $87C5				; $87DE: D0 E5   
	PLA					  ; $87E0: 68	  
	TAY					  ; $87E1: A8	  
	PLA					  ; $87E2: 68	  
	TAX					  ; $87E3: AA	  
	PLA					  ; $87E4: 68	  
	RTS					  ; $87E5: 60	  

; ---- Subroutine at $87E6 (Bank 17) ----
sub_87E6:
	LDA #$00				 ; $87E6: A9 00   
	TAX					  ; $87E8: AA	  
loc_87E9:
	STA $0480,X			  ; $87E9: 9D 80 04
	INX					  ; $87EC: E8	  
	CPX #$40				 ; $87ED: E0 40   
	BNE $87E9				; $87EF: D0 F8   
	TAX					  ; $87F1: AA	  
loc_87F2:
	STA $04E0,X			  ; $87F2: 9D E0 04
	INX					  ; $87F5: E8	  
	CPX #$10				 ; $87F6: E0 10   
	BNE $87F2				; $87F8: D0 F8   
	RTS					  ; $87FA: 60	  

; ---- Subroutine at $87FB (Bank 17) ----
sub_87FB:
	LDA #$FF				 ; $87FB: A9 FF   
	STA $7357				; $87FD: 8D 57 73
	STA $7358				; $8800: 8D 58 73
	STA $7359				; $8803: 8D 59 73
	STA $735A				; $8806: 8D 5A 73
	RTS					  ; $8809: 60	  

; ---- Subroutine at $880A (Bank 17) ----
sub_880A:
	STA tmp1				 ; $880A: 85 01   
	LDX #$00				 ; $880C: A2 00   
	STX tmp2				 ; $880E: 86 02   
loc_8810:
	LDA tmp1				 ; $8810: A5 01   
	BRK					  ; $8812: 00	  
	LSR map_number		   ; $8813: 46 63   
	EOR ($90,X)			  ; $8815: 41 90   
	.byte $02			  ; $8817 - Unknown opcode
	INC tmp2				 ; $8818: E6 02   
	INX					  ; $881A: E8	  
	CPX tmp0				 ; $881B: E4 00   
	BCC $8810				; $881D: 90 F1   
	LDA tmp2				 ; $881F: A5 02   
	CMP tmp0				 ; $8821: C5 00   
	RTS					  ; $8823: 60	  
	ROL $35,X				; $8824: 36 35   
	.byte $34			  ; $8826 - Unknown opcode
	.byte $2F			  ; $8827 - Unknown opcode
	BMI $885B				; $8828: 30 31   
	.byte $32			  ; $882A - Unknown opcode
	BRK					  ; $882B: 00	  
	ORA (ptr0_lo,X)		  ; $882C: 01 04   
	.byte $02			  ; $882E - Unknown opcode
	ORA ptr1_lo			  ; $882F: 05 06   
	.byte $07			  ; $8831 - Unknown opcode
	PHP					  ; $8832: 08	  
	BRK					  ; $8833: 00	  
	.byte $04			  ; $8834 - Unknown opcode
	.byte $03			  ; $8835 - Unknown opcode
	.byte $02			  ; $8836 - Unknown opcode
	ORA ptr1_lo			  ; $8837: 05 06   
	.byte $07			  ; $8839 - Unknown opcode
	PHP					  ; $883A: 08	  
	BRK					  ; $883B: 00	  
	ORA (tmp3,X)			 ; $883C: 01 03   
	.byte $02			  ; $883E - Unknown opcode
	ORA ptr1_lo			  ; $883F: 05 06   
	.byte $07			  ; $8841 - Unknown opcode
	PHP					  ; $8842: 08	  
	BRK					  ; $8843: 00	  
	.byte $03			  ; $8844 - Unknown opcode
	.byte $02			  ; $8845 - Unknown opcode
	PHP					  ; $8846: 08	  
	ORA ptr1_lo			  ; $8847: 05 06   
	.byte $07			  ; $8849 - Unknown opcode
	BRK					  ; $884A: 00	  
	BRK					  ; $884B: 00	  
	ORA (tmp2,X)			 ; $884C: 01 02   
	BRK					  ; $884E: 00	  
	ORA (tmp0,X)			 ; $884F: 01 00   
	.byte $02			  ; $8851 - Unknown opcode
	.byte $80			  ; $8852 - Unknown opcode
	.byte $80			  ; $8853 - Unknown opcode
	RTI					  ; $8854: 40	  
	BRK					  ; $8855: 00	  
	PHP					  ; $8856: 08	  
	.byte $07			  ; $8857 - Unknown opcode
	ASL ptr0_hi			  ; $8858: 06 05   
	.byte $04			  ; $885A - Unknown opcode

; ---- Subroutine at $885B (Bank 17) ----
sub_885B:
	JSR $80C4				; $885B: 20 C4 80 ; -> sub_80C4
	BCC $887D				; $885E: 90 1D   
	BRK					  ; $8860: 00	  
	.byte $07			  ; $8861 - Unknown opcode
	.byte $6F			  ; $8862 - Unknown opcode
	AND $00A9,X			  ; $8863: 3D A9 00
	STA $735B				; $8866: 8D 5B 73
loc_8869:
	LDX #$00				 ; $8869: A2 00   
loc_886B:
	LDA $7348,X			  ; $886B: BD 48 73
	AND #$0F				 ; $886E: 29 0F   
	CMP $735B				; $8870: CD 5B 73
	BEQ $887E				; $8873: F0 09   
	INX					  ; $8875: E8	  
	CPX #$0C				 ; $8876: E0 0C   
	BNE $886B				; $8878: D0 F1   
	JSR $BC5A				; $887A: 20 5A BC ; -> sub_BC5A
loc_887D:
	RTS					  ; $887D: 60	  
loc_887E:
	STX $96				  ; $887E: 86 96   
	INC $735B				; $8880: EE 5B 73
	BRK					  ; $8883: 00	  
	.byte $2B			  ; $8884 - Unknown opcode
	.byte $2F			  ; $8885 - Unknown opcode
	JSR $80C4				; $8886: 20 C4 80 ; -> sub_80C4
	BCC $887D				; $8889: 90 F2   
	JSR $BC5A				; $888B: 20 5A BC ; -> sub_BC5A
	JSR $8894				; $888E: 20 94 88 ; -> sub_8894
	JMP $8869				; $8891: 4C 69 88

; ---- Subroutine at $8894 (Bank 17) ----
sub_8894:
	JSR $8D9D				; $8894: 20 9D 8D ; -> sub_8D9D
	BCC $88C6				; $8897: 90 2D   
	JSR $8DAB				; $8899: 20 AB 8D ; -> sub_8DAB
	BCC $88C6				; $889C: 90 28   
	JSR $8DCC				; $889E: 20 CC 8D ; -> sub_8DCC
	BCC $88C6				; $88A1: 90 23   
	BRK					  ; $88A3: 00	  
	.byte $04			  ; $88A4 - Unknown opcode
	.byte $1F			  ; $88A5 - Unknown opcode
	CMP #$02				 ; $88A6: C9 02	; Compare with 2
	BCS $88C6				; $88A8: B0 1C   
	JSR $8DDC				; $88AA: 20 DC 8D ; -> sub_8DDC
	JSR $89F1				; $88AD: 20 F1 89 ; -> sub_89F1
	BCC $88C6				; $88B0: 90 14   
	JSR $BBA1				; $88B2: 20 A1 BB ; -> sub_BBA1
	JSR $BBDF				; $88B5: 20 DF BB ; -> sub_BBDF
	BCC $88C6				; $88B8: 90 0C   
	JSR $BBED				; $88BA: 20 ED BB ; -> sub_BBED
	BCC $88C6				; $88BD: 90 07   
	JSR $88CA				; $88BF: 20 CA 88 ; -> sub_88CA
	JSR $A3F7				; $88C2: 20 F7 A3 ; -> sub_A3F7
	RTS					  ; $88C5: 60	  
loc_88C6:
	JSR $AC4D				; $88C6: 20 4D AC ; -> sub_AC4D
	RTS					  ; $88C9: 60	  

; ---- Subroutine at $88CA (Bank 17) ----
sub_88CA:
	LDA $615A				; $88CA: AD 5A 61
	CMP #$04				 ; $88CD: C9 04	; Compare with 4
	BCC $88D4				; $88CF: 90 03   
	BRK					  ; $88D1: 00	  
	BRK					  ; $88D2: 00	  
	.byte $3F			  ; $88D3 - Unknown opcode
loc_88D4:
	JSR $8A3A				; $88D4: 20 3A 8A ; -> sub_8A3A
loc_88D7:
	JSR $8DDC				; $88D7: 20 DC 8D ; -> sub_8DDC
	JSR $8A55				; $88DA: 20 55 8A ; -> sub_8A55
	JSR $8ACF				; $88DD: 20 CF 8A ; -> sub_8ACF
	BCC $8924				; $88E0: 90 42   
	JSR $AD25				; $88E2: 20 25 AD ; -> sub_AD25
	BCC $8924				; $88E5: 90 3D   
	JSR $B286				; $88E7: 20 86 B2 ; -> sub_B286
	JSR $B52D				; $88EA: 20 2D B5 ; -> sub_B52D
	JSR $B871				; $88ED: 20 71 B8 ; -> sub_B871
	BCC $8924				; $88F0: 90 32   
	JSR $BCF1				; $88F2: 20 F1 BC ; -> sub_BCF1
	BCC $8924				; $88F5: 90 2D   
	JSR $8DE5				; $88F7: 20 E5 8D ; -> sub_8DE5
	JSR $ABB5				; $88FA: 20 B5 AB ; -> sub_ABB5
	BCC $8924				; $88FD: 90 25   
	JSR $AFFF				; $88FF: 20 FF AF ; -> sub_AFFF
	JSR $8C49				; $8902: 20 49 8C ; -> sub_8C49
	BCC $8924				; $8905: 90 1D   
	JSR $B2F5				; $8907: 20 F5 B2 ; -> sub_B2F5
	BCC $8924				; $890A: 90 18   
	JSR $893A				; $890C: 20 3A 89 ; -> sub_893A
	JSR $AC3A				; $890F: 20 3A AC ; -> sub_AC3A
	JSR $80C4				; $8912: 20 C4 80 ; -> sub_80C4
	BCC $8924				; $8915: 90 0D   
	INC $735C				; $8917: EE 5C 73
	LDA $735C				; $891A: AD 5C 73
	CMP $735D				; $891D: CD 5D 73
	BCC $88D7				; $8920: 90 B5   
	BCS $8927				; $8922: B0 03   
loc_8924:
	JSR $AC4D				; $8924: 20 4D AC ; -> sub_AC4D
loc_8927:
	BRK					  ; $8927: 00	  
	ASL system_flags		 ; $8928: 06 1F   
	BCC $8939				; $892A: 90 0D   
	BRK					  ; $892C: 00	  
	.byte $23			  ; $892D - Unknown opcode
	.byte $A3			  ; $892E - Unknown opcode
	CMP #$02				 ; $892F: C9 02	; Compare with 2
	BCS $8939				; $8931: B0 06   
	BRK					  ; $8933: 00	  
	ORA $000F,X			  ; $8934: 1D 0F 00
	ASL $600F,X			  ; $8937: 1E 0F 60

; ---- Subroutine at $893A (Bank 17) ----
sub_893A:
	BRK					  ; $893A: 00	  
	.byte $03			  ; $893B - Unknown opcode
	.byte $1F			  ; $893C - Unknown opcode
	BRK					  ; $893D: 00	  
	ASL $C93F				; $893E: 0E 3F C9
	.byte $02			  ; $8941 - Unknown opcode
	BCC $89A7				; $8942: 90 63   
	CMP #$03				 ; $8944: C9 03	; Compare with 3
	BEQ $8952				; $8946: F0 0A   
	BRK					  ; $8948: 00	  
	ORA (system_flags,X)	 ; $8949: 01 1F   
	BMI $8952				; $894B: 30 05   
	BRK					  ; $894D: 00	  
	ASL $301F				; $894E: 0E 1F 30
	EOR $20,X				; $8951: 55 20   
	.byte $DC			  ; $8953 - Unknown opcode
	LDY $4A90				; $8954: AC 90 4A
	LDA #$00				 ; $8957: A9 00   
	STA $735E				; $8959: 8D 5E 73
loc_895C:
	JSR $904A				; $895C: 20 4A 90 ; -> sub_904A
	JSR $9611				; $895F: 20 11 96 ; -> sub_9611
	BCC $8989				; $8962: 90 25   
	JSR $ACBF				; $8964: 20 BF AC ; -> sub_ACBF
	BCC $8989				; $8967: 90 20   
	JSR $AC79				; $8969: 20 79 AC ; -> sub_AC79
	BCC $8989				; $896C: 90 1B   
	JSR $8D0D				; $896E: 20 0D 8D ; -> sub_8D0D
	BCC $8989				; $8971: 90 16   
	JSR $AD51				; $8973: 20 51 AD ; -> sub_AD51
	BCC $8989				; $8976: 90 11   
	JSR $8C88				; $8978: 20 88 8C ; -> sub_8C88
	JSR $80C4				; $897B: 20 C4 80 ; -> sub_80C4
	BCC $8986				; $897E: 90 06   
	JSR $A873				; $8980: 20 73 A8 ; -> sub_A873
	JSR $A8BC				; $8983: 20 BC A8 ; -> sub_A8BC
loc_8986:
	JSR $A3F7				; $8986: 20 F7 A3 ; -> sub_A3F7
loc_8989:
	JSR $80C4				; $8989: 20 C4 80 ; -> sub_80C4
	BCC $89A1				; $898C: 90 13   
	BRK					  ; $898E: 00	  
	.byte $02			  ; $898F - Unknown opcode
	.byte $1F			  ; $8990 - Unknown opcode
	BMI $8997				; $8991: 30 04   
	LDA #$04				 ; $8993: A9 04   
	BNE $8999				; $8995: D0 02   
loc_8997:
	LDA #$08				 ; $8997: A9 08   
loc_8999:
	INC $735E				; $8999: EE 5E 73
	CMP $735E				; $899C: CD 5E 73
	BNE $895C				; $899F: D0 BB   
loc_89A1:
	JSR $A3F7				; $89A1: 20 F7 A3 ; -> sub_A3F7
	JMP $8CAF				; $89A4: 4C AF 8C
loc_89A7:
	JSR $904A				; $89A7: 20 4A 90 ; -> sub_904A
	JSR $9518				; $89AA: 20 18 95 ; -> sub_9518
	BCC $89EB				; $89AD: 90 3C   
	BRK					  ; $89AF: 00	  
	.byte $07			  ; $89B0 - Unknown opcode
	.byte $1F			  ; $89B1 - Unknown opcode
	BCS $89BD				; $89B2: B0 09   
	BVS $89BD				; $89B4: 70 07   
	BRK					  ; $89B6: 00	  
	CPX $D3				  ; $89B7: E4 D3   
	ADC $EB4C				; $89B9: 6D 4C EB ; Arithmetic
	.byte $89			  ; $89BC - Unknown opcode
loc_89BD:
	BRK					  ; $89BD: 00	  
	.byte $03			  ; $89BE - Unknown opcode
	.byte $1F			  ; $89BF - Unknown opcode
	CMP #$43				 ; $89C0: C9 43	; Compare with 67
	BNE $89C9				; $89C2: D0 05   
	BRK					  ; $89C4: 00	  
	.byte $07			  ; $89C5 - Unknown opcode
	.byte $1F			  ; $89C6 - Unknown opcode
	BCS $89CE				; $89C7: B0 05   
loc_89C9:
	JSR $ACBF				; $89C9: 20 BF AC ; -> sub_ACBF
	BCC $89EB				; $89CC: 90 1D   
loc_89CE:
	JSR $AC79				; $89CE: 20 79 AC ; -> sub_AC79
	BCC $89EB				; $89D1: 90 18   
	JSR $8D0D				; $89D3: 20 0D 8D ; -> sub_8D0D
	BCC $89EB				; $89D6: 90 13   
	JSR $AD51				; $89D8: 20 51 AD ; -> sub_AD51
	BCC $89EB				; $89DB: 90 0E   
	JSR $8C88				; $89DD: 20 88 8C ; -> sub_8C88
	JSR $80C4				; $89E0: 20 C4 80 ; -> sub_80C4
	BCC $89EB				; $89E3: 90 06   
	JSR $A873				; $89E5: 20 73 A8 ; -> sub_A873
	JSR $A8BC				; $89E8: 20 BC A8 ; -> sub_A8BC
loc_89EB:
	JSR $A3F7				; $89EB: 20 F7 A3 ; -> sub_A3F7
	JMP $8CAF				; $89EE: 4C AF 8C

; ---- Subroutine at $89F1 (Bank 17) ----
sub_89F1:
	LDA $72E5				; $89F1: AD E5 72
	BPL $8A1F				; $89F4: 10 29   
	LDA $72E6				; $89F6: AD E6 72
	AND #$0F				 ; $89F9: 29 0F   
	STA tmp0				 ; $89FB: 85 00   
	BRK					  ; $89FD: 00	  
	.byte $67			  ; $89FE - Unknown opcode
	.byte $73			  ; $89FF - Unknown opcode
	BVC $8A21				; $8A00: 50 1F   
	BRK					  ; $8A02: 00	  
	ORA (system_flags,X)	 ; $8A03: 01 1F   
	CMP tmp0				 ; $8A05: C5 00   
	BNE $8A38				; $8A07: D0 2F   
	LDA $72E6				; $8A09: AD E6 72
	AND #$C0				 ; $8A0C: 29 C0   
	BEQ $8A21				; $8A0E: F0 11   
	SEC					  ; $8A10: 38	  
	SBC #$40				 ; $8A11: E9 40	; Arithmetic
	STA tmp0				 ; $8A13: 85 00   
	LDA $72E6				; $8A15: AD E6 72
	AND #$3F				 ; $8A18: 29 3F   
	ORA tmp0				 ; $8A1A: 05 00   
	STA $72E6				; $8A1C: 8D E6 72
loc_8A1F:
	SEC					  ; $8A1F: 38	  
	RTS					  ; $8A20: 60	  
loc_8A21:
	LDA $72E5				; $8A21: AD E5 72
	AND #$7F				 ; $8A24: 29 7F   
	STA $72E5				; $8A26: 8D E5 72
	BRK					  ; $8A29: 00	  
	SBC ($D3,X)			  ; $8A2A: E1 D3	; Arithmetic
	.byte $89			  ; $8A2C - Unknown opcode
	JSR $9053				; $8A2D: 20 53 90 ; -> sub_9053
	LDA $6E44				; $8A30: AD 44 6E
	ORA #$03				 ; $8A33: 09 03   
	STA $6E44				; $8A35: 8D 44 6E
loc_8A38:
	CLC					  ; $8A38: 18	  
	RTS					  ; $8A39: 60	  

; ---- Subroutine at $8A3A (Bank 17) ----
sub_8A3A:
	LDX #$00				 ; $8A3A: A2 00   
	STX $735C				; $8A3C: 8E 5C 73
	INX					  ; $8A3F: E8	  
	LDA $96				  ; $8A40: A5 96   
	CMP #$04				 ; $8A42: C9 04	; Compare with 4
	BCC $8A51				; $8A44: 90 0B   
	TAX					  ; $8A46: AA	  
	LDA $7348,X			  ; $8A47: BD 48 73
	AND #$F0				 ; $8A4A: 29 F0   
	LSR					  ; $8A4C: 4A	  
	LSR					  ; $8A4D: 4A	  
	LSR					  ; $8A4E: 4A	  
	LSR					  ; $8A4F: 4A	  
	TAX					  ; $8A50: AA	  
loc_8A51:
	STX $735D				; $8A51: 8E 5D 73
	RTS					  ; $8A54: 60	  

; ---- Subroutine at $8A55 (Bank 17) ----
sub_8A55:
	BRK					  ; $8A55: 00	  
	ASL system_flags		 ; $8A56: 06 1F   
	BCC $8A76				; $8A58: 90 1C   
	BRK					  ; $8A5A: 00	  
	AND #$C3				 ; $8A5B: 29 C3   
	.byte $02			  ; $8A5D - Unknown opcode
	BCS $8A67				; $8A5E: B0 07   
	BRK					  ; $8A60: 00	  
	.byte $23			  ; $8A61 - Unknown opcode
	.byte $A3			  ; $8A62 - Unknown opcode
	CMP #$02				 ; $8A63: C9 02	; Compare with 2
	BCC $8AAF				; $8A65: 90 48   
loc_8A67:
	LDA $735C				; $8A67: AD 5C 73
	STA tmp1				 ; $8A6A: 85 01   
	BRK					  ; $8A6C: 00	  
	.byte $33			  ; $8A6D - Unknown opcode
	.byte $0F			  ; $8A6E - Unknown opcode
	BRK					  ; $8A6F: 00	  
	ORA $000F,X			  ; $8A70: 1D 0F 00
	ASL $600F,X			  ; $8A73: 1E 0F 60
loc_8A76:
	BRK					  ; $8A76: 00	  
	.byte $2B			  ; $8A77 - Unknown opcode
	.byte $53			  ; $8A78 - Unknown opcode
	CMP #$08				 ; $8A79: C9 08	; Compare with 8
	BCC $8AB0				; $8A7B: 90 33   
	BRK					  ; $8A7D: 00	  
	LSR $93				  ; $8A7E: 46 93   
	.byte $12			  ; $8A80 - Unknown opcode
	BCS $8AA7				; $8A81: B0 24   
	BRK					  ; $8A83: 00	  
	LSR $93				  ; $8A84: 46 93   
	CLC					  ; $8A86: 18	  
	BCS $8ABD				; $8A87: B0 34   
	BRK					  ; $8A89: 00	  
	LSR $93				  ; $8A8A: 46 93   
	ROL $B0				  ; $8A8C: 26 B0   
	.byte $33			  ; $8A8E - Unknown opcode
	LDA #$23				 ; $8A8F: A9 23   
	STA $6E59				; $8A91: 8D 59 6E
	BRK					  ; $8A94: 00	  
	BRK					  ; $8A95: 00	  
	.byte $53			  ; $8A96 - Unknown opcode
	LDY #$05				 ; $8A97: A0 05   
	LDA ($79),Y			  ; $8A99: B1 79   
	BRK					  ; $8A9B: 00	  
loc_8A9C:
	AND $0F				  ; $8A9C: 25 0F   
	AND #$C0				 ; $8A9E: 29 C0   
	ASL					  ; $8AA0: 0A	  
	ROL					  ; $8AA1: 2A	  
	ROL					  ; $8AA2: 2A	  
	CMP #$02				 ; $8AA3: C9 02	; Compare with 2
	BCC $8AAF				; $8AA5: 90 08   
loc_8AA7:
	LDA $735C				; $8AA7: AD 5C 73
	STA tmp1				 ; $8AAA: 85 01   
	BRK					  ; $8AAC: 00	  
	.byte $34			  ; $8AAD - Unknown opcode
	.byte $0F			  ; $8AAE - Unknown opcode
loc_8AAF:
	RTS					  ; $8AAF: 60	  
loc_8AB0:
	BRK					  ; $8AB0: 00	  
	LSR $93				  ; $8AB1: 46 93   
	CLC					  ; $8AB3: 18	  
	BCS $8ABD				; $8AB4: B0 07   
	BRK					  ; $8AB6: 00	  
	LSR $93				  ; $8AB7: 46 93   
	ROL $B0				  ; $8AB9: 26 B0   
	ASL $60				  ; $8ABB: 06 60   
loc_8ABD:
	LDA #$C3				 ; $8ABD: A9 C3   
	JMP $8AC4				; $8ABF: 4C C4 8A
	LDA #$C4				 ; $8AC2: A9 C4   
loc_8AC4:
	PHA					  ; $8AC4: 48	  
	LDA $735C				; $8AC5: AD 5C 73
	STA tmp1				 ; $8AC8: 85 01   
	PLA					  ; $8ACA: 68	  
	BRK					  ; $8ACB: 00	  
	AND $600F,Y			  ; $8ACC: 39 0F 60

; ---- Subroutine at $8ACF (Bank 17) ----
sub_8ACF:
	BRK					  ; $8ACF: 00	  
	ASL system_flags		 ; $8AD0: 06 1F   
	BCS $8B1F				; $8AD2: B0 4B   
	BRK					  ; $8AD4: 00	  
	.byte $04			  ; $8AD5 - Unknown opcode
	.byte $1F			  ; $8AD6 - Unknown opcode
	CMP #$02				 ; $8AD7: C9 02	; Compare with 2
	BCS $8B17				; $8AD9: B0 3C   
	BRK					  ; $8ADB: 00	  
	LSR $93				  ; $8ADC: 46 93   
	.byte $07			  ; $8ADE - Unknown opcode
	BCC $8B17				; $8ADF: 90 36   
	BRK					  ; $8AE1: 00	  
	LSR $93				  ; $8AE2: 46 93   
	ASL $B0				  ; $8AE4: 06 B0   
	.byte $42			  ; $8AE6 - Unknown opcode
	BRK					  ; $8AE7: 00	  
	LSR $93				  ; $8AE8: 46 93   
	BPL $8A9C				; $8AEA: 10 B0   
	BIT $4500				; $8AEC: 2C 00 45
	.byte $93			  ; $8AEF - Unknown opcode
	ORA ($B0),Y			  ; $8AF0: 11 B0   
	PHA					  ; $8AF2: 48	  
	BRK					  ; $8AF3: 00	  
	EOR $93				  ; $8AF4: 45 93   
	.byte $23			  ; $8AF6 - Unknown opcode
	BCS $8B6D				; $8AF7: B0 74   
	BRK					  ; $8AF9: 00	  
	EOR $93				  ; $8AFA: 45 93   
	BIT $B0				  ; $8AFC: 24 B0   
	.byte $74			  ; $8AFE - Unknown opcode
	BRK					  ; $8AFF: 00	  
	EOR $93				  ; $8B00: 45 93   
	AND $B0				  ; $8B02: 25 B0   
	.byte $74			  ; $8B04 - Unknown opcode
	BRK					  ; $8B05: 00	  
	LSR $93				  ; $8B06: 46 93   
	.byte $12			  ; $8B08 - Unknown opcode
	BCS $8B59				; $8B09: B0 4E   
	BRK					  ; $8B0B: 00	  
	.byte $3B			  ; $8B0C - Unknown opcode
	.byte $93			  ; $8B0D - Unknown opcode
	.byte $03			  ; $8B0E - Unknown opcode
	BCC $8B15				; $8B0F: 90 04   
	CMP #$CC				 ; $8B11: C9 CC	; Compare with 204
	BEQ $8B91				; $8B13: F0 7C   
loc_8B15:
	SEC					  ; $8B15: 38	  
	RTS					  ; $8B16: 60	  
loc_8B17:
	CLC					  ; $8B17: 18	  
	RTS					  ; $8B18: 60	  
	JMP $8B97				; $8B19: 4C 97 8B
loc_8B1C:
	JMP $8BBE				; $8B1C: 4C BE 8B
loc_8B1F:
	BRK					  ; $8B1F: 00	  
	AND #$C3				 ; $8B20: 29 C3   
	ASL $F290				; $8B22: 0E 90 F2
	BRK					  ; $8B25: 00	  
	AND #$C3				 ; $8B26: 29 C3   
	ORA $60B0				; $8B28: 0D B0 60
	BRK					  ; $8B2B: 00	  
	AND #$C3				 ; $8B2C: 29 C3   
	ORA ($B0),Y			  ; $8B2E: 11 B0   
	BIT $2900				; $8B30: 2C 00 29
	.byte $C3			  ; $8B33 - Unknown opcode
	BRK					  ; $8B34: 00	  
	BCS $8B1C				; $8B35: B0 E5   
	BRK					  ; $8B37: 00	  
	.byte $2B			  ; $8B38 - Unknown opcode
	.byte $C3			  ; $8B39 - Unknown opcode
	ORA ($B0,X)			  ; $8B3A: 01 B0   
	PHA					  ; $8B3C: 48	  
	BRK					  ; $8B3D: 00	  
	.byte $2B			  ; $8B3E - Unknown opcode
	.byte $C3			  ; $8B3F - Unknown opcode
	.byte $14			  ; $8B40 - Unknown opcode
	BCS $8B6D				; $8B41: B0 2A   
	BRK					  ; $8B43: 00	  
	.byte $2B			  ; $8B44 - Unknown opcode
	.byte $C3			  ; $8B45 - Unknown opcode
	ORA $B0,X				; $8B46: 15 B0   
	ROL					  ; $8B48: 2A	  
	BRK					  ; $8B49: 00	  
	.byte $2B			  ; $8B4A - Unknown opcode
	.byte $C3			  ; $8B4B - Unknown opcode
	ASL $B0,X				; $8B4C: 16 B0   
	ROL					  ; $8B4E: 2A	  
	BRK					  ; $8B4F: 00	  
	.byte $2B			  ; $8B50 - Unknown opcode
	.byte $C3			  ; $8B51 - Unknown opcode
	.byte $17			  ; $8B52 - Unknown opcode
	BCS $8B7F				; $8B53: B0 2A   
	BRK					  ; $8B55: 00	  
	AND #$C3				 ; $8B56: 29 C3   
	.byte $02			  ; $8B58 - Unknown opcode
loc_8B59:
	BCS $8B91				; $8B59: B0 36   
	SEC					  ; $8B5B: 38	  
	RTS					  ; $8B5C: 60	  
	BRK					  ; $8B5D: 00	  
	BIT $11C3				; $8B5E: 2C C3 11
	BRK					  ; $8B61: 00	  
	AND #$C3				 ; $8B62: 29 C3   
	ORA ($B0),Y			  ; $8B64: 11 B0   
	.byte $04			  ; $8B66 - Unknown opcode
	BRK					  ; $8B67: 00	  
	SBC ($D3,X)			  ; $8B68: E1 D3	; Arithmetic
	.byte $FA			  ; $8B6A - Unknown opcode
	CLC					  ; $8B6B: 18	  
	RTS					  ; $8B6C: 60	  
loc_8B6D:
	BRK					  ; $8B6D: 00	  
	SBC ($D3,X)			  ; $8B6E: E1 D3	; Arithmetic
	SBC #$18				 ; $8B70: E9 18	; Arithmetic
	RTS					  ; $8B72: 60	  
	BRK					  ; $8B73: 00	  
	CPX #$D3				 ; $8B74: E0 D3   
	BIT $18				  ; $8B76: 24 18   
	RTS					  ; $8B78: 60	  
	BRK					  ; $8B79: 00	  
	CPX #$D3				 ; $8B7A: E0 D3   
	AND $18				  ; $8B7C: 25 18   
	RTS					  ; $8B7E: 60	  
loc_8B7F:
	BRK					  ; $8B7F: 00	  
	CPX #$D3				 ; $8B80: E0 D3   
	ROL $18				  ; $8B82: 26 18   
	RTS					  ; $8B84: 60	  
	BRK					  ; $8B85: 00	  
	CPX #$D3				 ; $8B86: E0 D3   
	.byte $27			  ; $8B88 - Unknown opcode
	CLC					  ; $8B89: 18	  
	RTS					  ; $8B8A: 60	  
	BRK					  ; $8B8B: 00	  
	CPX #$D3				 ; $8B8C: E0 D3   
	ORA ($18),Y			  ; $8B8E: 11 18   
	RTS					  ; $8B90: 60	  
loc_8B91:
	BRK					  ; $8B91: 00	  
	CPX #$D3				 ; $8B92: E0 D3   
	.byte $14			  ; $8B94 - Unknown opcode
	SEC					  ; $8B95: 38	  
	RTS					  ; $8B96: 60	  
loc_8B97:
	LDX $73				  ; $8B97: A6 73   
	BRK					  ; $8B99: 00	  
	.byte $03			  ; $8B9A - Unknown opcode
	.byte $3F			  ; $8B9B - Unknown opcode
	STA tmp0				 ; $8B9C: 85 00   
	BRK					  ; $8B9E: 00	  
	.byte $1B			  ; $8B9F - Unknown opcode
	.byte $0F			  ; $8BA0 - Unknown opcode
	CMP tmp0				 ; $8BA1: C5 00   
	BEQ $8BA7				; $8BA3: F0 02   
	BCS $8BB1				; $8BA5: B0 0A   
loc_8BA7:
	BRK					  ; $8BA7: 00	  
	ASL system_flags		 ; $8BA8: 06 1F   
	BRK					  ; $8BAA: 00	  
	EOR $93				  ; $8BAB: 45 93   
	BPL $8BFB				; $8BAD: 10 4C   
	CMP $8B,X				; $8BAF: D5 8B   
loc_8BB1:
	BRK					  ; $8BB1: 00	  
	ASL system_flags		 ; $8BB2: 06 1F   
	BRK					  ; $8BB4: 00	  
	ADC #$93				 ; $8BB5: 69 93	; Arithmetic
	BPL $8BB9				; $8BB7: 10 00   
loc_8BB9:
	CPX #$D3				 ; $8BB9: E0 D3   
	.byte $13			  ; $8BBB - Unknown opcode
	CLC					  ; $8BBC: 18	  
	RTS					  ; $8BBD: 60	  
loc_8BBE:
	LDX $7E				  ; $8BBE: A6 7E   
	BRK					  ; $8BC0: 00	  
	.byte $04			  ; $8BC1 - Unknown opcode
	.byte $3F			  ; $8BC2 - Unknown opcode
	STA tmp0				 ; $8BC3: 85 00   
	BRK					  ; $8BC5: 00	  
	.byte $1B			  ; $8BC6 - Unknown opcode
	.byte $0F			  ; $8BC7 - Unknown opcode
	CMP tmp0				 ; $8BC8: C5 00   
	BEQ $8BCE				; $8BCA: F0 02   
	BCS $8BDB				; $8BCC: B0 0D   
loc_8BCE:
	BRK					  ; $8BCE: 00	  
	ASL system_flags		 ; $8BCF: 06 1F   
	BRK					  ; $8BD1: 00	  
	.byte $2B			  ; $8BD2 - Unknown opcode
	.byte $C3			  ; $8BD3 - Unknown opcode
	BRK					  ; $8BD4: 00	  
	BRK					  ; $8BD5: 00	  
	CPX #$D3				 ; $8BD6: E0 D3   
	.byte $12			  ; $8BD8 - Unknown opcode
	CLC					  ; $8BD9: 18	  
	RTS					  ; $8BDA: 60	  
loc_8BDB:
	BRK					  ; $8BDB: 00	  
	ASL system_flags		 ; $8BDC: 06 1F   
	BRK					  ; $8BDE: 00	  
	BIT $00C3				; $8BDF: 2C C3 00
	JSR $8BB8				; $8BE2: 20 B8 8B ; -> sub_8BB8
	CLC					  ; $8BE5: 18	  
	LDA $72E9				; $8BE6: AD E9 72
	BMI $8C20				; $8BE9: 30 35   
	BRK					  ; $8BEB: 00	  
	ASL system_flags		 ; $8BEC: 06 1F   
	BRK					  ; $8BEE: 00	  
	AND $AAB3				; $8BEF: 2D B3 AA
	LDA $6E45,X			  ; $8BF2: BD 45 6E
	LDX #$01				 ; $8BF5: A2 01   
loc_8BF7:
	CMP $8C47,X			  ; $8BF7: DD 47 8C
	BEQ $8C02				; $8BFA: F0 06   
	DEX					  ; $8BFC: CA	  
	BPL $8BF7				; $8BFD: 10 F8   
	CLC					  ; $8BFF: 18	  
	BMI $8C20				; $8C00: 30 1E   
loc_8C02:
	TXA					  ; $8C02: 8A	  
	LSR					  ; $8C03: 4A	  
	BCC $8C21				; $8C04: 90 1B   
	LDA #$80				 ; $8C06: A9 80   
	BRK					  ; $8C08: 00	  
	ASL					  ; $8C09: 0A	  
	.byte $1F			  ; $8C0A - Unknown opcode
	LDA #$00				 ; $8C0B: A9 00   
	STA tmp0				 ; $8C0D: 85 00   
loc_8C0F:
	BRK					  ; $8C0F: 00	  
	ORA (system_flags,X)	 ; $8C10: 01 1F   
	BRK					  ; $8C12: 00	  
	ORA #$1F				 ; $8C13: 09 1F   
	LDA tmp0				 ; $8C15: A5 00   
	BRK					  ; $8C17: 00	  
	.byte $0B			  ; $8C18 - Unknown opcode
	.byte $1F			  ; $8C19 - Unknown opcode
	LDA #$01				 ; $8C1A: A9 01   
	STA $735D				; $8C1C: 8D 5D 73
	SEC					  ; $8C1F: 38	  
loc_8C20:
	RTS					  ; $8C20: 60	  
loc_8C21:
	LDA #$81				 ; $8C21: A9 81   
	BRK					  ; $8C23: 00	  
	ASL					  ; $8C24: 0A	  
	.byte $1F			  ; $8C25 - Unknown opcode
	LDA #$07				 ; $8C26: A9 07   
	BRK					  ; $8C28: 00	  
	BIT $850F				; $8C29: 2C 0F 85
	BRK					  ; $8C2C: 00	  
	BRK					  ; $8C2D: 00	  
	.byte $62			  ; $8C2E - Unknown opcode
	.byte $23			  ; $8C2F - Unknown opcode
	RTI					  ; $8C30: 40	  
	TAX					  ; $8C31: AA	  
	DEX					  ; $8C32: CA	  
	LDA #$00				 ; $8C33: A9 00   
loc_8C35:
	SEC					  ; $8C35: 38	  
	ROL					  ; $8C36: 2A	  
	DEX					  ; $8C37: CA	  
	BPL $8C35				; $8C38: 10 FB   
	AND tmp0				 ; $8C3A: 25 00   
	BRK					  ; $8C3C: 00	  
	ROL					  ; $8C3D: 2A	  
	.byte $0F			  ; $8C3E - Unknown opcode
	BRK					  ; $8C3F: 00	  
	.byte $67			  ; $8C40 - Unknown opcode
	.byte $73			  ; $8C41 - Unknown opcode
	STA tmp0				 ; $8C42: 85 00   
	JMP $8C0F				; $8C44: 4C 0F 8C
	.byte $1C			  ; $8C47 - Unknown opcode
	LDY $0300,X			  ; $8C48: BC 00 03
	.byte $1F			  ; $8C4B - Unknown opcode
	CMP #$3C				 ; $8C4C: C9 3C	; Compare with 60
	BCS $8C68				; $8C4E: B0 18   

; ---- Subroutine at $8C50 (Bank 17) ----
sub_8C50:
	BRK					  ; $8C50: 00	  
	ASL system_flags		 ; $8C51: 06 1F   
	BCC $8C5D				; $8C53: 90 08   
	BRK					  ; $8C55: 00	  
	AND #$C3				 ; $8C56: 29 C3   
	.byte $03			  ; $8C58 - Unknown opcode
	BCS $8C6A				; $8C59: B0 0F   
	BCC $8C63				; $8C5B: 90 06   
loc_8C5D:
	BRK					  ; $8C5D: 00	  
	LSR $93				  ; $8C5E: 46 93   
	.byte $13			  ; $8C60 - Unknown opcode
	BCS $8C6A				; $8C61: B0 07   
loc_8C63:
	LDA $72E4				; $8C63: AD E4 72
	BMI $8C79				; $8C66: 30 11   
loc_8C68:
	SEC					  ; $8C68: 38	  
	RTS					  ; $8C69: 60	  
loc_8C6A:
	BRK					  ; $8C6A: 00	  
	ASL system_flags		 ; $8C6B: 06 1F   
	BCC $8C73				; $8C6D: 90 04   
	BRK					  ; $8C6F: 00	  
	ROL					  ; $8C70: 2A	  
	.byte $C3			  ; $8C71 - Unknown opcode
	.byte $13			  ; $8C72 - Unknown opcode
loc_8C73:
	BRK					  ; $8C73: 00	  
	CPX $D3				  ; $8C74: E4 D3   
	BPL $8C90				; $8C76: 10 18   
	RTS					  ; $8C78: 60	  
loc_8C79:
	BRK					  ; $8C79: 00	  
	ASL system_flags		 ; $8C7A: 06 1F   
	BCC $8C82				; $8C7C: 90 04   
	BRK					  ; $8C7E: 00	  
	ROL					  ; $8C7F: 2A	  
	.byte $C3			  ; $8C80 - Unknown opcode
	.byte $13			  ; $8C81 - Unknown opcode
loc_8C82:
	BRK					  ; $8C82: 00	  
	SBC $D3				  ; $8C83: E5 D3	; Arithmetic
	ADC $6018				; $8C85: 6D 18 60 ; Arithmetic

; ---- Subroutine at $8C88 (Bank 17) ----
sub_8C88:
	LDA $8CAD				; $8C88: AD AD 8C
	STA tmp0				 ; $8C8B: 85 00   
	LDA $8CAE				; $8C8D: AD AE 8C
loc_8C90:
	STA tmp1				 ; $8C90: 85 01   
	BRK					  ; $8C92: 00	  
	.byte $03			  ; $8C93 - Unknown opcode
	.byte $1F			  ; $8C94 - Unknown opcode
	LDX #$00				 ; $8C95: A2 00   
	PHA					  ; $8C97: 48	  
	JSR $C813				; $8C98: 20 13 C8 ; Call to fixed bank
	PLA					  ; $8C9B: 68	  
	JSR $C813				; $8C9C: 20 13 C8 ; Call to fixed bank
	LDY #$00				 ; $8C9F: A0 00   
	LDA (tmp0),Y			 ; $8CA1: B1 00   
	STA tmp2				 ; $8CA3: 85 02   
	INY					  ; $8CA5: C8	  
	LDA (tmp0),Y			 ; $8CA6: B1 00   
	STA tmp3				 ; $8CA8: 85 03   
	JMP (tmp2)			   ; $8CAA: 6C 02 00
	ASL					  ; $8CAD: 0A	  
	LDY $20				  ; $8CAE: A4 20   
	CPY $80				  ; $8CB0: C4 80   
	BCC $8CFB				; $8CB2: 90 47   
	BRK					  ; $8CB4: 00	  
	.byte $03			  ; $8CB5 - Unknown opcode
	.byte $1F			  ; $8CB6 - Unknown opcode
	PHA					  ; $8CB7: 48	  
	AND #$07				 ; $8CB8: 29 07   
	STA tmp0				 ; $8CBA: 85 00   
	PLA					  ; $8CBC: 68	  
	LSR					  ; $8CBD: 4A	  
	LSR					  ; $8CBE: 4A	  
	LSR					  ; $8CBF: 4A	  
	TAX					  ; $8CC0: AA	  
	LDA $A61E,X			  ; $8CC1: BD 1E A6
	PHA					  ; $8CC4: 48	  
	LDX tmp0				 ; $8CC5: A6 00   
	BRK					  ; $8CC7: 00	  
	AND #$0F				 ; $8CC8: 29 0F   
	STA tmp0				 ; $8CCA: 85 00   
	PLA					  ; $8CCC: 68	  
	AND tmp0				 ; $8CCD: 25 00   
	BEQ $8CFB				; $8CCF: F0 2A   
	LDX #$FF				 ; $8CD1: A2 FF   
	STX tmp0				 ; $8CD3: 86 00   
	INX					  ; $8CD5: E8	  
	STX tmp2				 ; $8CD6: 86 02   
	BRK					  ; $8CD8: 00	  
	.byte $03			  ; $8CD9 - Unknown opcode
	.byte $1F			  ; $8CDA - Unknown opcode
	STA tmp1				 ; $8CDB: 85 01   
loc_8CDD:
	LDX tmp2				 ; $8CDD: A6 02   
	LDA $A61E,X			  ; $8CDF: BD 1E A6
	STA tmp3				 ; $8CE2: 85 03   
	LDY #$07				 ; $8CE4: A0 07   
loc_8CE6:
	LSR tmp3				 ; $8CE6: 46 03   
	LDA #$00				 ; $8CE8: A9 00   
	ADC tmp0				 ; $8CEA: 65 00	; Arithmetic
	STA tmp0				 ; $8CEC: 85 00   
	LDA tmp1				 ; $8CEE: A5 01   
	BEQ $8CFC				; $8CF0: F0 0A   
	DEC tmp1				 ; $8CF2: C6 01   
	DEY					  ; $8CF4: 88	  
	BPL $8CE6				; $8CF5: 10 EF   
	INC tmp2				 ; $8CF7: E6 02   
	BNE $8CDD				; $8CF9: D0 E2   
loc_8CFB:
	RTS					  ; $8CFB: 60	  
loc_8CFC:
	LDA tmp0				 ; $8CFC: A5 00   
	ASL					  ; $8CFE: 0A	  
	TAX					  ; $8CFF: AA	  
	LDA $A60A,X			  ; $8D00: BD 0A A6
	STA tmp0				 ; $8D03: 85 00   
	LDA $A60B,X			  ; $8D05: BD 0B A6
	STA tmp1				 ; $8D08: 85 01   
	JMP (tmp0)			   ; $8D0A: 6C 00 00

; ---- Subroutine at $8D0D (Bank 17) ----
sub_8D0D:
	BRK					  ; $8D0D: 00	  
	.byte $03			  ; $8D0E - Unknown opcode
	.byte $1F			  ; $8D0F - Unknown opcode
	CMP #$27				 ; $8D10: C9 27	; Compare with 39
	BEQ $8D3B				; $8D12: F0 27   
	BRK					  ; $8D14: 00	  
	ORA #$3F				 ; $8D15: 09 3F   
	BCS $8D3B				; $8D17: B0 22   
	BRK					  ; $8D19: 00	  
	ORA (system_flags,X)	 ; $8D1A: 01 1F   
	CMP $7363				; $8D1C: CD 63 73
	BEQ $8D3B				; $8D1F: F0 1A   
	LDA $7363				; $8D21: AD 63 73
	BPL $8D3D				; $8D24: 10 17   
	AND #$07				 ; $8D26: 29 07   
	TAX					  ; $8D28: AA	  
	BRK					  ; $8D29: 00	  
	AND #$C3				 ; $8D2A: 29 C3   
	ASL $0C90				; $8D2C: 0E 90 0C
	BRK					  ; $8D2F: 00	  
	AND #$C3				 ; $8D30: 29 C3   
	ASL $B0				  ; $8D32: 06 B0   
	AND $2900,Y			  ; $8D34: 39 00 29
	.byte $C3			  ; $8D37 - Unknown opcode
	.byte $07			  ; $8D38 - Unknown opcode
	BCS $8D64				; $8D39: B0 29   
loc_8D3B:
	SEC					  ; $8D3B: 38	  
	RTS					  ; $8D3C: 60	  
loc_8D3D:
	BRK					  ; $8D3D: 00	  
	.byte $67			  ; $8D3E - Unknown opcode
	.byte $73			  ; $8D3F - Unknown opcode
	TAX					  ; $8D40: AA	  
	BRK					  ; $8D41: 00	  
	LSR $93				  ; $8D42: 46 93   
	.byte $07			  ; $8D44 - Unknown opcode
	BCC $8D3B				; $8D45: 90 F4   
	BRK					  ; $8D47: 00	  
	LSR $93				  ; $8D48: 46 93   
	ASL $B0,X				; $8D4A: 16 B0   
	AND (tmp0,X)			 ; $8D4C: 21 00   
	.byte $3B			  ; $8D4E - Unknown opcode
	.byte $93			  ; $8D4F - Unknown opcode
	ORA ($90,X)			  ; $8D50: 01 90   
	.byte $0B			  ; $8D52 - Unknown opcode
	CMP #$BB				 ; $8D53: C9 BB	; Compare with 187
	BNE $8D5E				; $8D55: D0 07   
	BRK					  ; $8D57: 00	  
	.byte $1B			  ; $8D58 - Unknown opcode
	.byte $0F			  ; $8D59 - Unknown opcode
	CMP #$55				 ; $8D5A: C9 55	; Compare with 85
	BCC $8D6E				; $8D5C: 90 10   
loc_8D5E:
	BRK					  ; $8D5E: 00	  
	LSR $93				  ; $8D5F: 46 93   
	.byte $17			  ; $8D61 - Unknown opcode
	BCC $8D3B				; $8D62: 90 D7   
loc_8D64:
	JSR $BF2E				; $8D64: 20 2E BF ; -> sub_BF2E
	LDY $E800				; $8D67: AC 00 E8
	.byte $D3			  ; $8D6A - Unknown opcode
	ASL $6018				; $8D6B: 0E 18 60
loc_8D6E:
	LDA $72E7				; $8D6E: AD E7 72
	ORA #$02				 ; $8D71: 09 02   
	STA $72E7				; $8D73: 8D E7 72
	BRK					  ; $8D76: 00	  
	ORA (system_flags,X)	 ; $8D77: 01 1F   
	STA $7363				; $8D79: 8D 63 73
	PHA					  ; $8D7C: 48	  
	JSR $BF2E				; $8D7D: 20 2E BF ; -> sub_BF2E
	TXS					  ; $8D80: 9A	  
	BRK					  ; $8D81: 00	  
	INX					  ; $8D82: E8	  
	.byte $D3			  ; $8D83 - Unknown opcode
	.byte $0F			  ; $8D84 - Unknown opcode
	PLA					  ; $8D85: 68	  
	BPL $8D92				; $8D86: 10 0A   
	AND #$07				 ; $8D88: 29 07   
	TAX					  ; $8D8A: AA	  
	BRK					  ; $8D8B: 00	  
	AND #$C3				 ; $8D8C: 29 C3   
	ASL $A4B0				; $8D8E: 0E B0 A4
	RTS					  ; $8D91: 60	  
loc_8D92:
	BRK					  ; $8D92: 00	  
	.byte $67			  ; $8D93 - Unknown opcode
	.byte $73			  ; $8D94 - Unknown opcode
	TAX					  ; $8D95: AA	  
	BRK					  ; $8D96: 00	  
	LSR $93				  ; $8D97: 46 93   
	.byte $07			  ; $8D99 - Unknown opcode
	BCS $8D5E				; $8D9A: B0 C2   
	RTS					  ; $8D9C: 60	  

; ---- Subroutine at $8D9D (Bank 17) ----
sub_8D9D:
	LDA $72E9				; $8D9D: AD E9 72
	BPL $8DA9				; $8DA0: 10 07   
	BRK					  ; $8DA2: 00	  
	ORA (system_flags,X)	 ; $8DA3: 01 1F   
	BMI $8DA9				; $8DA5: 30 02   
	CLC					  ; $8DA7: 18	  
	RTS					  ; $8DA8: 60	  
loc_8DA9:
	SEC					  ; $8DA9: 38	  
	RTS					  ; $8DAA: 60	  

; ---- Subroutine at $8DAB (Bank 17) ----
sub_8DAB:
	LDA $6E44				; $8DAB: AD 44 6E
	AND #$03				 ; $8DAE: 29 03   
	CMP #$02				 ; $8DB0: C9 02	; Compare with 2
	BEQ $8DC5				; $8DB2: F0 11   
	CMP #$01				 ; $8DB4: C9 01	; Compare with 1
	BEQ $8DBE				; $8DB6: F0 06   
	CMP #$03				 ; $8DB8: C9 03	; Compare with 3
	BEQ $8DC3				; $8DBA: F0 07   
loc_8DBC:
	SEC					  ; $8DBC: 38	  
	RTS					  ; $8DBD: 60	  
loc_8DBE:
	BRK					  ; $8DBE: 00	  
	ORA (system_flags,X)	 ; $8DBF: 01 1F   
	BMI $8DBC				; $8DC1: 30 F9   
loc_8DC3:
	CLC					  ; $8DC3: 18	  
	RTS					  ; $8DC4: 60	  
loc_8DC5:
	BRK					  ; $8DC5: 00	  
	ORA (system_flags,X)	 ; $8DC6: 01 1F   
	BPL $8DBC				; $8DC8: 10 F2   
	CLC					  ; $8DCA: 18	  
	RTS					  ; $8DCB: 60	  

; ---- Subroutine at $8DCC (Bank 17) ----
sub_8DCC:
	LDA $72E6				; $8DCC: AD E6 72
	AND #$30				 ; $8DCF: 29 30   
	BEQ $8DDA				; $8DD1: F0 07   
	BRK					  ; $8DD3: 00	  
	ORA (system_flags,X)	 ; $8DD4: 01 1F   
	BMI $8DDA				; $8DD6: 30 02   
	CLC					  ; $8DD8: 18	  
	RTS					  ; $8DD9: 60	  
loc_8DDA:
	SEC					  ; $8DDA: 38	  
	RTS					  ; $8DDB: 60	  

; ---- Subroutine at $8DDC (Bank 17) ----
sub_8DDC:
	BRK					  ; $8DDC: 00	  
	.byte $13			  ; $8DDD - Unknown opcode
	.byte $2F			  ; $8DDE - Unknown opcode
	LDA #$00				 ; $8DDF: A9 00   
	BRK					  ; $8DE1: 00	  
	ASL $6F				  ; $8DE2: 06 6F   
	RTS					  ; $8DE4: 60	  

; ---- Subroutine at $8DE5 (Bank 17) ----
sub_8DE5:
	BRK					  ; $8DE5: 00	  
	ASL system_flags		 ; $8DE6: 06 1F   
	BCS $8DF0				; $8DE8: B0 06   
	JSR $8F3B				; $8DEA: 20 3B 8F ; -> sub_8F3B
	JSR $8F8B				; $8DED: 20 8B 8F ; -> sub_8F8B
loc_8DF0:
	BRK					  ; $8DF0: 00	  
	.byte $03			  ; $8DF1 - Unknown opcode
	.byte $1F			  ; $8DF2 - Unknown opcode
	LDX #$00				 ; $8DF3: A2 00   
loc_8DF5:
	CMP $8FA5,X			  ; $8DF5: DD A5 8F
	BCC $8DFE				; $8DF8: 90 04   
	INX					  ; $8DFA: E8	  
	BNE $8DF5				; $8DFB: D0 F8   
	RTS					  ; $8DFD: 60	  
loc_8DFE:
	TXA					  ; $8DFE: 8A	  
	ASL					  ; $8DFF: 0A	  
	TAX					  ; $8E00: AA	  
	LDA $8FDC,X			  ; $8E01: BD DC 8F
	STA tmp0				 ; $8E04: 85 00   
	LDA $8FDD,X			  ; $8E06: BD DD 8F
	STA tmp1				 ; $8E09: 85 01   
	JMP (tmp0)			   ; $8E0B: 6C 00 00
	LDA $72E4				; $8E0E: AD E4 72
	BMI $8E17				; $8E11: 30 04   
	JSR $BF2E				; $8E13: 20 2E BF ; -> sub_BF2E
	STX $0300				; $8E16: 8E 00 03
	.byte $1F			  ; $8E19 - Unknown opcode
	LDY #$10				 ; $8E1A: A0 10   
	CMP #$03				 ; $8E1C: C9 03	; Compare with 3
	BCC $8E3C				; $8E1E: 90 1C   
	CMP #$09				 ; $8E20: C9 09	; Compare with 9
	BCC $8E40				; $8E22: 90 1C   
	CMP #$0D				 ; $8E24: C9 0D	; Compare with 13
	BCC $8E44				; $8E26: 90 1C   
	CMP #$10				 ; $8E28: C9 10	; Compare with 16
	BCC $8E4C				; $8E2A: 90 20   
	CMP #$13				 ; $8E2C: C9 13	; Compare with 19
	BCC $8E4E				; $8E2E: 90 1E   
	CMP #$15				 ; $8E30: C9 15	; Compare with 21
	BEQ $8E48				; $8E32: F0 14   
	CMP #$16				 ; $8E34: C9 16	; Compare with 22
	BCS $8E4E				; $8E36: B0 16   
	LDY #$14				 ; $8E38: A0 14   
	BNE $8E4E				; $8E3A: D0 12   
loc_8E3C:
	LDY #$26				 ; $8E3C: A0 26   
	BNE $8E4E				; $8E3E: D0 0E   
loc_8E40:
	LDY #$28				 ; $8E40: A0 28   
	BNE $8E4E				; $8E42: D0 0A   
loc_8E44:
	LDY #$12				 ; $8E44: A0 12   
	BNE $8E4E				; $8E46: D0 06   
loc_8E48:
	LDY #$2A				 ; $8E48: A0 2A   
	BNE $8E4E				; $8E4A: D0 02   
loc_8E4C:
	LDY #$20				 ; $8E4C: A0 20   
loc_8E4E:
	BRK					  ; $8E4E: 00	  
	.byte $03			  ; $8E4F - Unknown opcode
	.byte $4F			  ; $8E50 - Unknown opcode
	JMP $8E96				; $8E51: 4C 96 8E
	LDY #$89				 ; $8E54: A0 89   
	BRK					  ; $8E56: 00	  
	ASL system_flags		 ; $8E57: 06 1F   
	BCC $8E70				; $8E59: 90 15   
	LDY #$8B				 ; $8E5B: A0 8B   
	LDA $72E9				; $8E5D: AD E9 72
	BPL $8E70				; $8E60: 10 0E   
	BRK					  ; $8E62: 00	  
	AND $ADA3				; $8E63: 2D A3 AD
	.byte $7F			  ; $8E66 - Unknown opcode
	ROR $0329				; $8E67: 6E 29 03
	CMP $7E				  ; $8E6A: C5 7E   
	BNE $8E70				; $8E6C: D0 02   
	LDY #$89				 ; $8E6E: A0 89   
loc_8E70:
	JMP $8E92				; $8E70: 4C 92 8E
	LDY #$91				 ; $8E73: A0 91   
	BNE $8E92				; $8E75: D0 1B   
	JSR $BF2E				; $8E77: 20 2E BF ; -> sub_BF2E
	BPL $8E7C				; $8E7A: 10 00   
loc_8E7C:
	.byte $62			  ; $8E7C - Unknown opcode
	.byte $D3			  ; $8E7D - Unknown opcode
	BRK					  ; $8E7E: 00	  
	JSR $9053				; $8E7F: 20 53 90 ; -> sub_9053
	BRK					  ; $8E82: 00	  
	ASL $2F				  ; $8E83: 06 2F   
	RTS					  ; $8E85: 60	  
	JSR $BF2E				; $8E86: 20 2E BF ; -> sub_BF2E
	.byte $9C			  ; $8E89 - Unknown opcode
	LDY #$20				 ; $8E8A: A0 20   
	BRK					  ; $8E8C: 00	  
	.byte $03			  ; $8E8D - Unknown opcode
	.byte $4F			  ; $8E8E - Unknown opcode
	JMP $8E96				; $8E8F: 4C 96 8E
loc_8E92:
	TYA					  ; $8E92: 98	  
	JSR $BF55				; $8E93: 20 55 BF ; -> sub_BF55

; ---- Subroutine at $8E96 (Bank 17) ----
sub_8E96:
	BRK					  ; $8E96: 00	  
	.byte $E2			  ; $8E97 - Unknown opcode
	.byte $D3			  ; $8E98 - Unknown opcode
	BRK					  ; $8E99: 00	  
	RTS					  ; $8E9A: 60	  
loc_8E9B:
	JSR $8E96				; $8E9B: 20 96 8E ; -> sub_8E96
loc_8E9E:
	BRK					  ; $8E9E: 00	  
	.byte $F2			  ; $8E9F - Unknown opcode
	.byte $D3			  ; $8EA0 - Unknown opcode
	.byte $04			  ; $8EA1 - Unknown opcode
	RTS					  ; $8EA2: 60	  
	LDA #$28				 ; $8EA3: A9 28   
	BNE $8EAF				; $8EA5: D0 08   
	LDA #$10				 ; $8EA7: A9 10   
	BNE $8EAF				; $8EA9: D0 04   
	LDA #$26				 ; $8EAB: A9 26   
	BNE $8EAF				; $8EAD: D0 00   
loc_8EAF:
	PHA					  ; $8EAF: 48	  
	JSR $8E96				; $8EB0: 20 96 8E ; -> sub_8E96
	JSR $BF2E				; $8EB3: 20 2E BF ; -> sub_BF2E
	STA $A868,X			  ; $8EB6: 9D 68 A8
loc_8EB9:
	BRK					  ; $8EB9: 00	  
	.byte $03			  ; $8EBA - Unknown opcode
	.byte $4F			  ; $8EBB - Unknown opcode
	JMP $8E9E				; $8EBC: 4C 9E 8E
	JSR $8E96				; $8EBF: 20 96 8E ; -> sub_8E96
	JSR $BF2E				; $8EC2: 20 2E BF ; -> sub_BF2E
	STA ($A0),Y			  ; $8EC5: 91 A0   
	.byte $12			  ; $8EC7 - Unknown opcode
	BNE $8EB9				; $8EC8: D0 EF   
	LDA #$88				 ; $8ECA: A9 88   
	BNE $8EE6				; $8ECC: D0 18   
	JSR $BF2E				; $8ECE: 20 2E BF ; -> sub_BF2E
	STX $10A0				; $8ED1: 8E A0 10
	BRK					  ; $8ED4: 00	  
	.byte $03			  ; $8ED5 - Unknown opcode
	.byte $4F			  ; $8ED6 - Unknown opcode
	JMP $8EE9				; $8ED7: 4C E9 8E
	JSR $BF2E				; $8EDA: 20 2E BF ; -> sub_BF2E
	.byte $8F			  ; $8EDD - Unknown opcode
	BRK					  ; $8EDE: 00	  
	.byte $02			  ; $8EDF - Unknown opcode
	.byte $4F			  ; $8EE0 - Unknown opcode
	JMP $8EE9				; $8EE1: 4C E9 8E
	LDA #$83				 ; $8EE4: A9 83   
loc_8EE6:
	JSR $BF55				; $8EE6: 20 55 BF ; -> sub_BF55
loc_8EE9:
	BRK					  ; $8EE9: 00	  
	.byte $F2			  ; $8EEA - Unknown opcode
	.byte $D3			  ; $8EEB - Unknown opcode
	BRK					  ; $8EEC: 00	  
	RTS					  ; $8EED: 60	  
	JSR $BF2E				; $8EEE: 20 2E BF ; -> sub_BF2E
	TYA					  ; $8EF1: 98	  
	BRK					  ; $8EF2: 00	  
	SBC ($D3),Y			  ; $8EF3: F1 D3	; Arithmetic
	.byte $8F			  ; $8EF5 - Unknown opcode
	BRK					  ; $8EF6: 00	  
	.byte $02			  ; $8EF7 - Unknown opcode
	.byte $4F			  ; $8EF8 - Unknown opcode
	JSR $BF2E				; $8EF9: 20 2E BF ; -> sub_BF2E
	DEY					  ; $8EFC: 88	  
	BRK					  ; $8EFD: 00	  
	SBC $D3				  ; $8EFE: E5 D3	; Arithmetic
	BCC $8F62				; $8F00: 90 60   
	JSR $BF2E				; $8F02: 20 2E BF ; -> sub_BF2E
	TYA					  ; $8F05: 98	  
	BRK					  ; $8F06: 00	  
	SBC $D3				  ; $8F07: E5 D3	; Arithmetic
	.byte $8F			  ; $8F09 - Unknown opcode
	BRK					  ; $8F0A: 00	  
	.byte $02			  ; $8F0B - Unknown opcode
loc_8F0C:
	.byte $4F			  ; $8F0C - Unknown opcode
	BRK					  ; $8F0D: 00	  
	.byte $03			  ; $8F0E - Unknown opcode
	.byte $4F			  ; $8F0F - Unknown opcode
	BRK					  ; $8F10: 00	  
	SBC #$D3				 ; $8F11: E9 D3	; Arithmetic
	STA ($60),Y			  ; $8F13: 91 60   
	BRK					  ; $8F15: 00	  
	SBC $D3				  ; $8F16: E5 D3	; Arithmetic
	STY $60				  ; $8F18: 84 60   
	BRK					  ; $8F1A: 00	  
	SBC $D3				  ; $8F1B: E5 D3	; Arithmetic
	TYA					  ; $8F1D: 98	  
	RTS					  ; $8F1E: 60	  
	JSR $BF2E				; $8F1F: 20 2E BF ; -> sub_BF2E
	.byte $9C			  ; $8F22 - Unknown opcode
	JMP $8E9B				; $8F23: 4C 9B 8E
	BRK					  ; $8F26: 00	  
	.byte $F2			  ; $8F27 - Unknown opcode
	.byte $D3			  ; $8F28 - Unknown opcode
	.byte $04			  ; $8F29 - Unknown opcode
	JMP $BDBC				; $8F2A: 4C BC BD
	JSR $BF2E				; $8F2D: 20 2E BF ; -> sub_BF2E
	DEY					  ; $8F30: 88	  
	LDY #$20				 ; $8F31: A0 20   
	BRK					  ; $8F33: 00	  
	.byte $03			  ; $8F34 - Unknown opcode
	.byte $4F			  ; $8F35 - Unknown opcode
	BRK					  ; $8F36: 00	  
	BEQ $8F0C				; $8F37: F0 D3   
	ROR $60,X				; $8F39: 76 60   

; ---- Subroutine at $8F3B (Bank 17) ----
sub_8F3B:
	BRK					  ; $8F3B: 00	  
	ORA system_flags		 ; $8F3C: 05 1F   
	CMP #$01				 ; $8F3E: C9 01	; Compare with 1
	BNE $8F8A				; $8F40: D0 48   
	JSR $8F9C				; $8F42: 20 9C 8F ; -> sub_8F9C
	PHA					  ; $8F45: 48	  
	BRK					  ; $8F46: 00	  
	CPX #$D3				 ; $8F47: E0 D3   
	AND $0600				; $8F49: 2D 00 06
	.byte $1F			  ; $8F4C - Unknown opcode
	TAX					  ; $8F4D: AA	  
	PLA					  ; $8F4E: 68	  
	BRK					  ; $8F4F: 00	  
	AND ($73),Y			  ; $8F50: 31 73   
	BRK					  ; $8F52: 00	  
	.byte $32			  ; $8F53 - Unknown opcode
	.byte $73			  ; $8F54 - Unknown opcode
	LDA #$FF				 ; $8F55: A9 FF   
	STA $70				  ; $8F57: 85 70   
	BRK					  ; $8F59: 00	  
	.byte $1A			  ; $8F5A - Unknown opcode
	.byte $73			  ; $8F5B - Unknown opcode
	BRK					  ; $8F5C: 00	  
	.byte $17			  ; $8F5D - Unknown opcode
	.byte $73			  ; $8F5E - Unknown opcode
	LDY $73				  ; $8F5F: A4 73   
	STY $70				  ; $8F61: 84 70   
	BRK					  ; $8F63: 00	  
	ORA $2073,Y			  ; $8F64: 19 73 20
	.byte $9C			  ; $8F67 - Unknown opcode
	.byte $8F			  ; $8F68 - Unknown opcode
	CMP #$1F				 ; $8F69: C9 1F	; Compare with 31
	BNE $8F74				; $8F6B: D0 07   
	LDA #$FF				 ; $8F6D: A9 FF   
	STA $70				  ; $8F6F: 85 70   
	BRK					  ; $8F71: 00	  
	ASL $2073,X			  ; $8F72: 1E 73 20
	.byte $9C			  ; $8F75 - Unknown opcode
	.byte $8F			  ; $8F76 - Unknown opcode
	BRK					  ; $8F77: 00	  
	.byte $0C			  ; $8F78 - Unknown opcode
	.byte $0F			  ; $8F79 - Unknown opcode
	BCC $8F85				; $8F7A: 90 09   
	BRK					  ; $8F7C: 00	  
	.byte $12			  ; $8F7D - Unknown opcode
	.byte $FB			  ; $8F7E - Unknown opcode
	BRK					  ; $8F7F: 00	  
	.byte $07			  ; $8F80 - Unknown opcode
	.byte $9F			  ; $8F81 - Unknown opcode
	JSR $9053				; $8F82: 20 53 90 ; -> sub_9053
loc_8F85:
	LDA #$43				 ; $8F85: A9 43   
	BRK					  ; $8F87: 00	  
	ASL					  ; $8F88: 0A	  
	.byte $1F			  ; $8F89 - Unknown opcode
loc_8F8A:
	RTS					  ; $8F8A: 60	  

; ---- Subroutine at $8F8B (Bank 17) ----
sub_8F8B:
	BRK					  ; $8F8B: 00	  
	ORA system_flags		 ; $8F8C: 05 1F   
	CMP #$02				 ; $8F8E: C9 02	; Compare with 2
	BNE $8F9B				; $8F90: D0 09   
	JSR $8F9C				; $8F92: 20 9C 8F ; -> sub_8F9C
	JSR $9079				; $8F95: 20 79 90 ; -> sub_9079
	BRK					  ; $8F98: 00	  
	ASL					  ; $8F99: 0A	  
	.byte $1F			  ; $8F9A - Unknown opcode
loc_8F9B:
	RTS					  ; $8F9B: 60	  

; ---- Subroutine at $8F9C (Bank 17) ----
sub_8F9C:
	BRK					  ; $8F9C: 00	  
	.byte $03			  ; $8F9D - Unknown opcode
	.byte $1F			  ; $8F9E - Unknown opcode
	AND #$7F				 ; $8F9F: 29 7F   
	STA $7355				; $8FA1: 8D 55 73
	RTS					  ; $8FA4: 60	  
	.byte $3C			  ; $8FA5 - Unknown opcode
	.byte $43			  ; $8FA6 - Unknown opcode
	EOR #$4C				 ; $8FA7: 49 4C   
	EOR $6753				; $8FA9: 4D 53 67
	PLA					  ; $8FAC: 68	  
	.byte $6F			  ; $8FAD - Unknown opcode
	BVS $9023				; $8FAE: 70 73   
	.byte $74			  ; $8FB0 - Unknown opcode
	ADC $77,X				; $8FB1: 75 77	; Arithmetic
	SEI					  ; $8FB3: 78	  
	.byte $7A			  ; $8FB4 - Unknown opcode
	.byte $7B			  ; $8FB5 - Unknown opcode
	.byte $83			  ; $8FB6 - Unknown opcode
	STY $85				  ; $8FB7: 84 85   
	STX $87				  ; $8FB9: 86 87   
	DEY					  ; $8FBB: 88	  
	.byte $89			  ; $8FBC - Unknown opcode
	TXA					  ; $8FBD: 8A	  
	STY $8E8D				; $8FBE: 8C 8D 8E
	.byte $8F			  ; $8FC1 - Unknown opcode
	TAY					  ; $8FC2: A8	  
	LDY $AEAD				; $8FC3: AC AD AE
	.byte $AF			  ; $8FC6 - Unknown opcode
	.byte $BF			  ; $8FC7 - Unknown opcode
	CMP ($CB,X)			  ; $8FC8: C1 CB   
	CPY $DDD5				; $8FCA: CC D5 DD
	DEC $E3E2,X			  ; $8FCD: DE E2 E3
	SBC #$EA				 ; $8FD0: E9 EA	; Arithmetic
	SBC ($F2),Y			  ; $8FD2: F1 F2	; Arithmetic
	SED					  ; $8FD4: F8	  
	SBC $FBFA,Y			  ; $8FD5: F9 FA FB ; Arithmetic
	.byte $FC			  ; $8FD8 - Unknown opcode
	SBC $FFFE,X			  ; $8FD9: FD FE FF ; Arithmetic
	ASL $968E				; $8FDC: 0E 8E 96
	STX $8E54				; $8FDF: 8E 54 8E
	STX $8E,Y				; $8FE2: 96 8E   
	.byte $9B			  ; $8FE4 - Unknown opcode
	STX $8E73				; $8FE5: 8E 73 8E
	STX $8E,Y				; $8FE8: 96 8E   
	.byte $73			  ; $8FEA - Unknown opcode
	STX $8E96				; $8FEB: 8E 96 8E
	STX $8E				  ; $8FEE: 86 8E   
	STX $8E,Y				; $8FF0: 96 8E   
	.byte $9B			  ; $8FF2 - Unknown opcode
	STX $8EA3				; $8FF3: 8E A3 8E
	STX $8E,Y				; $8FF6: 96 8E   
	.byte $9B			  ; $8FF8 - Unknown opcode
	STX $8E96				; $8FF9: 8E 96 8E
	.byte $77			  ; $8FFC - Unknown opcode
	STX $8E96				; $8FFD: 8E 96 8E
	.byte $A3			  ; $9000 - Unknown opcode
	STX $8EA7				; $9001: 8E A7 8E
	.byte $9B			  ; $9004 - Unknown opcode
	STX $8EA3				; $9005: 8E A3 8E
	.byte $BF			  ; $9008 - Unknown opcode
	STX $8E9B				; $9009: 8E 9B 8E
	.byte $A3			  ; $900C - Unknown opcode
	STX $8E9B				; $900D: 8E 9B 8E
	STX $8E				  ; $9010: 86 8E   
	.byte $9B			  ; $9012 - Unknown opcode
	STX $8EA3				; $9013: 8E A3 8E
	.byte $9B			  ; $9016 - Unknown opcode
	STX $8E96				; $9017: 8E 96 8E
	SBC #$8E				 ; $901A: E9 8E	; Arithmetic
	CPX $8E				  ; $901C: E4 8E   
	.byte $DA			  ; $901E - Unknown opcode
	STX $8EE9				; $901F: 8E E9 8E
	DEC $E98E				; $9022: CE 8E E9
	STX $8ECA				; $9025: 8E CA 8E
	SBC #$8E				 ; $9028: E9 8E	; Arithmetic
	STX $8E,Y				; $902A: 96 8E   
	.byte $02			  ; $902C - Unknown opcode
	.byte $8F			  ; $902D - Unknown opcode
	STX $8E,Y				; $902E: 96 8E   
	.byte $1A			  ; $9030 - Unknown opcode
	.byte $8F			  ; $9031 - Unknown opcode
	STX $8E,Y				; $9032: 96 8E   
	ORA $8F,X				; $9034: 15 8F   
	STX $8E,Y				; $9036: 96 8E   
	INC $968E				; $9038: EE 8E 96
	STX $8F1F				; $903B: 8E 1F 8F
	ROL $8F				  ; $903E: 26 8F   
	.byte $1F			  ; $9040 - Unknown opcode
	.byte $8F			  ; $9041 - Unknown opcode
	AND $968F				; $9042: 2D 8F 96
	STX $8E9B				; $9045: 8E 9B 8E
	.byte $9B			  ; $9048 - Unknown opcode
	STX $E7AD				; $9049: 8E AD E7
	.byte $72			  ; $904C - Unknown opcode
	AND #$7C				 ; $904D: 29 7C   
	STA $72E7				; $904F: 8D E7 72
	RTS					  ; $9052: 60	  

; ---- Subroutine at $9053 (Bank 17) ----
sub_9053:
	BRK					  ; $9053: 00	  
loc_9054:
	.byte $07			  ; $9054 - Unknown opcode
	.byte $9F			  ; $9055 - Unknown opcode
	LDA $72E5				; $9056: AD E5 72
	BMI $9078				; $9059: 30 1D   

; ---- Subroutine at $905B (Bank 17) ----
sub_905B:
	LDA #$0D				 ; $905B: A9 0D   
	LDX $6E45				; $905D: AE 45 6E
	CPX #$BC				 ; $9060: E0 BC   
	BEQ $906F				; $9062: F0 0B   
	CPX #$AE				 ; $9064: E0 AE   
	BNE $9075				; $9066: D0 0D   
	LDX $7206				; $9068: AE 06 72
	CPX #$D2				 ; $906B: E0 D2   
	BEQ $9073				; $906D: F0 04   
loc_906F:
	LDA #$1E				 ; $906F: A9 1E   
	BNE $9075				; $9071: D0 02   
loc_9073:
	LDA #$35				 ; $9073: A9 35   
loc_9075:
	BRK					  ; $9075: 00	  
	.byte $03			  ; $9076 - Unknown opcode
	.byte $9F			  ; $9077 - Unknown opcode
loc_9078:
	RTS					  ; $9078: 60	  

; ---- Subroutine at $9079 (Bank 17) ----
sub_9079:
	LDX #$27				 ; $9079: A2 27   
loc_907B:
	CMP $908B,X			  ; $907B: DD 8B 90
	BEQ $9087				; $907E: F0 07   
	DEX					  ; $9080: CA	  
	BPL $907B				; $9081: 10 F8   
	LDA #$7F				 ; $9083: A9 7F   
	BNE $908A				; $9085: D0 03   
loc_9087:
	LDA $90B3,X			  ; $9087: BD B3 90
loc_908A:
	RTS					  ; $908A: 60	  
	.byte $0B			  ; $908B - Unknown opcode
	ORA ($17),Y			  ; $908C: 11 17   
	CLC					  ; $908E: 18	  
	.byte $1A			  ; $908F - Unknown opcode
	.byte $1B			  ; $9090 - Unknown opcode
	ORA $1F1E,X			  ; $9091: 1D 1E 1F
	JSR $2221				; $9094: 20 21 22
	.byte $23			  ; $9097 - Unknown opcode
	RTI					  ; $9098: 40	  
	.byte $42			  ; $9099 - Unknown opcode
	.byte $44			  ; $909A - Unknown opcode
	EOR $50				  ; $909B: 45 50   
	.byte $74			  ; $909D - Unknown opcode
	.byte $53			  ; $909E - Unknown opcode
	EOR $56,X				; $909F: 55 56   
	.byte $57			  ; $90A1 - Unknown opcode
	CLI					  ; $90A2: 58	  
	EOR $5B5A,Y			  ; $90A3: 59 5A 5B
	.byte $0C			  ; $90A6 - Unknown opcode
	EOR $5F5E,X			  ; $90A7: 5D 5E 5F
	RTS					  ; $90AA: 60	  
	ADC ($62,X)			  ; $90AB: 61 62	; Arithmetic
	.byte $63			  ; $90AD - Unknown opcode
	.byte $64			  ; $90AE - Unknown opcode
	ADC $54				  ; $90AF: 65 54	; Arithmetic
	PHP					  ; $90B1: 08	  
	ROR $82				  ; $90B2: 66 82   
	.byte $83			  ; $90B4 - Unknown opcode
	STY $85				  ; $90B5: 84 85   
	STX $87				  ; $90B7: 86 87   
	DEY					  ; $90B9: 88	  
	.byte $89			  ; $90BA - Unknown opcode
	TXA					  ; $90BB: 8A	  
	.byte $8B			  ; $90BC - Unknown opcode
	STY $8E8D				; $90BD: 8C 8D 8E
	.byte $8F			  ; $90C0 - Unknown opcode
	BCC $9054				; $90C1: 90 91   
	.byte $92			  ; $90C3 - Unknown opcode
	.byte $93			  ; $90C4 - Unknown opcode
	STY $94,X				; $90C5: 94 94   
	STA $96,X				; $90C7: 95 96   
	.byte $97			  ; $90C9 - Unknown opcode
	TYA					  ; $90CA: 98	  
	STA $9B9A,Y			  ; $90CB: 99 9A 9B
	.byte $9C			  ; $90CE - Unknown opcode
	STA $9F9E,X			  ; $90CF: 9D 9E 9F
	LDY #$A1				 ; $90D2: A0 A1   
	LDX #$A3				 ; $90D4: A2 A3   
	LDY $A5				  ; $90D6: A4 A5   
	.byte $A7			  ; $90D8 - Unknown opcode
	SED					  ; $90D9: F8	  
	LDX $20				  ; $90DA: A6 20   
	.byte $93			  ; $90DC - Unknown opcode
	.byte $93			  ; $90DD - Unknown opcode
	JSR $AC5C				; $90DE: 20 5C AC ; -> sub_AC5C
	BCC $90E9				; $90E1: 90 06   
	ASL $7361				; $90E3: 0E 61 73
	ROL $7362				; $90E6: 2E 62 73
loc_90E9:
	LDA $7363				; $90E9: AD 63 73
	BMI $914B				; $90EC: 30 5D   
	JSR $A8D5				; $90EE: 20 D5 A8 ; -> sub_A8D5
	BRK					  ; $90F1: 00	  
	.byte $07			  ; $90F2 - Unknown opcode
	.byte $1F			  ; $90F3 - Unknown opcode
	BRK					  ; $90F4: 00	  
	LSR $93				  ; $90F5: 46 93   
	ORA $0C90,Y			  ; $90F7: 19 90 0C
	LDX #$80				 ; $90FA: A2 80   
	LDA $73				  ; $90FC: A5 73   
	BEQ $9102				; $90FE: F0 02   
	LDX #$33				 ; $9100: A2 33   
loc_9102:
	TXA					  ; $9102: 8A	  
	BRK					  ; $9103: 00	  
	PHP					  ; $9104: 08	  
	.byte $3F			  ; $9105 - Unknown opcode
	JSR $9383				; $9106: 20 83 93 ; -> sub_9383
	BEQ $913F				; $9109: F0 34   
	LDX $6E				  ; $910B: A6 6E   
	LDA $7362				; $910D: AD 62 73
	STA $70				  ; $9110: 85 70   
	LDA $7361				; $9112: AD 61 73
	BRK					  ; $9115: 00	  
	.byte $04			  ; $9116 - Unknown opcode
	.byte $73			  ; $9117 - Unknown opcode
	TXA					  ; $9118: 8A	  
	PHA					  ; $9119: 48	  
	JSR $BF2E				; $911A: 20 2E BF ; -> sub_BF2E
	TXA					  ; $911D: 8A	  
	BRK					  ; $911E: 00	  
	.byte $64			  ; $911F - Unknown opcode
	.byte $D3			  ; $9120 - Unknown opcode
	.byte $17			  ; $9121 - Unknown opcode
	BRK					  ; $9122: 00	  
	.byte $02			  ; $9123 - Unknown opcode
	.byte $4F			  ; $9124 - Unknown opcode
	BRK					  ; $9125: 00	  
	.byte $07			  ; $9126 - Unknown opcode
	.byte $2F			  ; $9127 - Unknown opcode
	BRK					  ; $9128: 00	  
	.byte $27			  ; $9129 - Unknown opcode
	.byte $0F			  ; $912A - Unknown opcode
	PLA					  ; $912B: 68	  
	TAX					  ; $912C: AA	  
	BRK					  ; $912D: 00	  
	BRK					  ; $912E: 00	  
	.byte $73			  ; $912F - Unknown opcode
	ORA $73				  ; $9130: 05 73   
	BNE $913E				; $9132: D0 0A   
	JSR $9272				; $9134: 20 72 92 ; -> sub_9272
	BRK					  ; $9137: 00	  
	INX					  ; $9138: E8	  
	.byte $D3			  ; $9139 - Unknown opcode
	.byte $1B			  ; $913A - Unknown opcode
	JSR $938A				; $913B: 20 8A 93 ; -> sub_938A
loc_913E:
	RTS					  ; $913E: 60	  
loc_913F:
	JSR $BF2E				; $913F: 20 2E BF ; -> sub_BF2E
	STA $E400				; $9142: 8D 00 E4
	.byte $D3			  ; $9145 - Unknown opcode
	ASL $20				  ; $9146: 06 20   
	TXA					  ; $9148: 8A	  
	.byte $93			  ; $9149 - Unknown opcode
	RTS					  ; $914A: 60	  
loc_914B:
	BRK					  ; $914B: 00	  
	.byte $07			  ; $914C - Unknown opcode
	.byte $1F			  ; $914D - Unknown opcode
	BRK					  ; $914E: 00	  
	AND #$C3				 ; $914F: 29 C3   
	ASL $7590				; $9151: 0E 90 75
	BRK					  ; $9154: 00	  
	AND #$C3				 ; $9155: 29 C3   
	ORA #$90				 ; $9157: 09 90   
	.byte $0C			  ; $9159 - Unknown opcode
	LDX #$80				 ; $915A: A2 80   
	LDA $7E				  ; $915C: A5 7E   
	BEQ $9162				; $915E: F0 02   
	LDX #$33				 ; $9160: A2 33   
loc_9162:
	TXA					  ; $9162: 8A	  
	BRK					  ; $9163: 00	  
	PHP					  ; $9164: 08	  
	.byte $3F			  ; $9165 - Unknown opcode
	JSR $9383				; $9166: 20 83 93 ; -> sub_9383
	BEQ $91CD				; $9169: F0 62   
	LDX $7B				  ; $916B: A6 7B   
	LDA $7362				; $916D: AD 62 73
	STA $7D				  ; $9170: 85 7D   
	LDA $7361				; $9172: AD 61 73
	BRK					  ; $9175: 00	  
	.byte $03			  ; $9176 - Unknown opcode
	.byte $B3			  ; $9177 - Unknown opcode
	TXA					  ; $9178: 8A	  
	PHA					  ; $9179: 48	  
	LDA $72E9				; $917A: AD E9 72
	BPL $9192				; $917D: 10 13   
	BRK					  ; $917F: 00	  
	AND $ADA3				; $9180: 2D A3 AD
	.byte $7F			  ; $9183 - Unknown opcode
	ROR $0329				; $9184: 6E 29 03
	CMP $7E				  ; $9187: C5 7E   
	BNE $9192				; $9189: D0 07   
	JSR $BF2E				; $918B: 20 2E BF ; -> sub_BF2E
	TXA					  ; $918E: 8A	  
	JMP $91A4				; $918F: 4C A4 91
loc_9192:
	LDA $7206				; $9192: AD 06 72
	CMP #$D2				 ; $9195: C9 D2	; Compare with 210
	BNE $91A0				; $9197: D0 07   
	JSR $BF2E				; $9199: 20 2E BF ; -> sub_BF2E
	STA ($4C,X)			  ; $919C: 81 4C   
	LDY $91				  ; $919E: A4 91   
loc_91A0:
	JSR $BF2E				; $91A0: 20 2E BF ; -> sub_BF2E
	.byte $87			  ; $91A3 - Unknown opcode
loc_91A4:
	BRK					  ; $91A4: 00	  
	.byte $64			  ; $91A5 - Unknown opcode
	.byte $D3			  ; $91A6 - Unknown opcode
	ASL $68,X				; $91A7: 16 68   
	TAX					  ; $91A9: AA	  
	PHA					  ; $91AA: 48	  
	JSR $9286				; $91AB: 20 86 92 ; -> sub_9286
	BRK					  ; $91AE: 00	  
	.byte $07			  ; $91AF - Unknown opcode
	.byte $2F			  ; $91B0 - Unknown opcode
	PLA					  ; $91B1: 68	  
	TAX					  ; $91B2: AA	  
	BRK					  ; $91B3: 00	  
	BRK					  ; $91B4: 00	  
	.byte $B3			  ; $91B5 - Unknown opcode
	ORA $7F				  ; $91B6: 05 7F   
	BNE $91CC				; $91B8: D0 12   
	BRK					  ; $91BA: 00	  
	.byte $13			  ; $91BB - Unknown opcode
	.byte $2F			  ; $91BC - Unknown opcode
	JSR $91F3				; $91BD: 20 F3 91 ; -> sub_91F3
	BRK					  ; $91C0: 00	  
	.byte $1A			  ; $91C1 - Unknown opcode
	.byte $2F			  ; $91C2 - Unknown opcode
	BCS $91CC				; $91C3: B0 07   
	BRK					  ; $91C5: 00	  
	INX					  ; $91C6: E8	  
	.byte $D3			  ; $91C7 - Unknown opcode
	PHP					  ; $91C8: 08	  
	JSR $938A				; $91C9: 20 8A 93 ; -> sub_938A
loc_91CC:
	RTS					  ; $91CC: 60	  
loc_91CD:
	BRK					  ; $91CD: 00	  
	.byte $07			  ; $91CE - Unknown opcode
	.byte $1F			  ; $91CF - Unknown opcode
	LDA $72E9				; $91D0: AD E9 72
	BPL $91E8				; $91D3: 10 13   
	BRK					  ; $91D5: 00	  
	AND $ADA3				; $91D6: 2D A3 AD
	.byte $7F			  ; $91D9 - Unknown opcode
	ROR $0329				; $91DA: 6E 29 03
	CMP $7E				  ; $91DD: C5 7E   
	BNE $91E8				; $91DF: D0 07   
	JSR $BF2E				; $91E1: 20 2E BF ; -> sub_BF2E
	STA $EC4C				; $91E4: 8D 4C EC
	STA ($20),Y			  ; $91E7: 91 20   
	ROL $8CBF				; $91E9: 2E BF 8C
	BRK					  ; $91EC: 00	  
	CPX $D3				  ; $91ED: E4 D3   
	.byte $07			  ; $91EF - Unknown opcode
	JMP $938A				; $91F0: 4C 8A 93

; ---- Subroutine at $91F3 (Bank 17) ----
sub_91F3:
	JSR $9290				; $91F3: 20 90 92 ; -> sub_9290
	LDA $72E4				; $91F6: AD E4 72
	ORA #$10				 ; $91F9: 09 10   
	STA $72E4				; $91FB: 8D E4 72

; ---- Subroutine at $91FE (Bank 17) ----
sub_91FE:
	JSR $92AE				; $91FE: 20 AE 92 ; -> sub_92AE
	STX $7200				; $9201: 8E 00 72

; ---- Subroutine at $9204 (Bank 17) ----
sub_9204:
	LDA $6E45				; $9204: AD 45 6E
	CMP #$AE				 ; $9207: C9 AE	; Compare with 174
	BNE $9215				; $9209: D0 0A   
	LDA $7206				; $920B: AD 06 72
	CMP #$D2				 ; $920E: C9 D2	; Compare with 210
	BNE $9235				; $9210: D0 23   
	INC $6E7E				; $9212: EE 7E 6E
loc_9215:
	JSR $927C				; $9215: 20 7C 92 ; -> sub_927C
	JSR $92C7				; $9218: 20 C7 92 ; -> sub_92C7
	BRK					  ; $921B: 00	  
	.byte $2B			  ; $921C - Unknown opcode
	.byte $C3			  ; $921D - Unknown opcode
	ASL $CF20				; $921E: 0E 20 CF
	.byte $92			  ; $9221 - Unknown opcode
	RTS					  ; $9222: 60	  

; ---- Subroutine at $9223 (Bank 17) ----
sub_9223:
	LDA $6E45				; $9223: AD 45 6E
	CMP #$AE				 ; $9226: C9 AE	; Compare with 174
	BNE $926A				; $9228: D0 40   
	LDA $6E7E				; $922A: AD 7E 6E
	CMP #$03				 ; $922D: C9 03	; Compare with 3
	BNE $926A				; $922F: D0 39   
	BRK					  ; $9231: 00	  
	CPX #$D3				 ; $9232: E0 D3   
	DEY					  ; $9234: 88	  
loc_9235:
	BRK					  ; $9235: 00	  
	ASL $4F,X				; $9236: 16 4F   
	INC $6E7E				; $9238: EE 7E 6E
	LDX $6E7E				; $923B: AE 7E 6E
	LDA $926A,X			  ; $923E: BD 6A 92
	STA $7206				; $9241: 8D 06 72
	LDX #$00				 ; $9244: A2 00   
	STX $720A				; $9246: 8E 0A 72
	TXA					  ; $9249: 8A	  
	BRK					  ; $924A: 00	  
	AND ($B3),Y			  ; $924B: 31 B3   
	BRK					  ; $924D: 00	  
	ORA $AD2F,Y			  ; $924E: 19 2F AD
	ROR $C96E,X			  ; $9251: 7E 6E C9
	.byte $04			  ; $9254 - Unknown opcode
	BEQ $9260				; $9255: F0 09   
	LDA $6E44				; $9257: AD 44 6E
	ORA #$03				 ; $925A: 09 03   
	STA $6E44				; $925C: 8D 44 6E
	RTS					  ; $925F: 60	  
loc_9260:
	LDA $6E44				; $9260: AD 44 6E
	AND #$FC				 ; $9263: 29 FC   
	ORA #$02				 ; $9265: 09 02   
	STA $6E44				; $9267: 8D 44 6E
loc_926A:
	RTS					  ; $926A: 60	  
	CMP $CECE				; $926B: CD CE CE
	.byte $CF			  ; $926E - Unknown opcode
	BNE $9242				; $926F: D0 D1   
	.byte $D2			  ; $9271 - Unknown opcode

; ---- Subroutine at $9272 (Bank 17) ----
sub_9272:
	BRK					  ; $9272: 00	  
	EOR $93				  ; $9273: 45 93   
	.byte $07			  ; $9275 - Unknown opcode
	BRK					  ; $9276: 00	  
	.byte $27			  ; $9277 - Unknown opcode
	.byte $0F			  ; $9278 - Unknown opcode
	JMP $92CF				; $9279: 4C CF 92

; ---- Subroutine at $927C (Bank 17) ----
sub_927C:
	TXA					  ; $927C: 8A	  
	PHA					  ; $927D: 48	  
	STA $C7				  ; $927E: 85 C7   
	BRK					  ; $9280: 00	  
	BRK					  ; $9281: 00	  
	.byte $4F			  ; $9282 - Unknown opcode
	PLA					  ; $9283: 68	  
	TAX					  ; $9284: AA	  
	RTS					  ; $9285: 60	  

; ---- Subroutine at $9286 (Bank 17) ----
sub_9286:
	TXA					  ; $9286: 8A	  
	PHA					  ; $9287: 48	  
	STA $C7				  ; $9288: 85 C7   
	BRK					  ; $928A: 00	  
	ORA ($4F,X)			  ; $928B: 01 4F   
	PLA					  ; $928D: 68	  
	TAX					  ; $928E: AA	  
	RTS					  ; $928F: 60	  

; ---- Subroutine at $9290 (Bank 17) ----
sub_9290:
	BRK					  ; $9290: 00	  
	AND #$C3				 ; $9291: 29 C3   
	PHP					  ; $9293: 08	  
	BCS $92C6				; $9294: B0 30   
	BRK					  ; $9296: 00	  
	.byte $1A			  ; $9297 - Unknown opcode
	.byte $B3			  ; $9298 - Unknown opcode
	CLC					  ; $9299: 18	  
	ADC $7203				; $929A: 6D 03 72 ; Arithmetic
	STA $7203				; $929D: 8D 03 72
	LDA $7F				  ; $92A0: A5 7F   
	ADC $7204				; $92A2: 6D 04 72 ; Arithmetic
	STA $7204				; $92A5: 8D 04 72
	BCC $92C6				; $92A8: 90 1C   
	INC $7205				; $92AA: EE 05 72
	RTS					  ; $92AD: 60	  

; ---- Subroutine at $92AE (Bank 17) ----
sub_92AE:
	BRK					  ; $92AE: 00	  
	AND #$C3				 ; $92AF: 29 C3   
	PHP					  ; $92B1: 08	  
	BCS $92C6				; $92B2: B0 12   
	BRK					  ; $92B4: 00	  
	.byte $1B			  ; $92B5 - Unknown opcode
	.byte $B3			  ; $92B6 - Unknown opcode
	CLC					  ; $92B7: 18	  
	ADC $7201				; $92B8: 6D 01 72 ; Arithmetic
	STA $7201				; $92BB: 8D 01 72
	LDA $7F				  ; $92BE: A5 7F   
	ADC $7202				; $92C0: 6D 02 72 ; Arithmetic
	STA $7202				; $92C3: 8D 02 72
loc_92C6:
	RTS					  ; $92C6: 60	  

; ---- Subroutine at $92C7 (Bank 17) ----
sub_92C7:
	LDA #$FF				 ; $92C7: A9 FF   
	STA $7D				  ; $92C9: 85 7D   
	BRK					  ; $92CB: 00	  
	.byte $03			  ; $92CC - Unknown opcode
	.byte $B3			  ; $92CD - Unknown opcode
	RTS					  ; $92CE: 60	  

; ---- Subroutine at $92CF (Bank 17) ----
sub_92CF:
	LDA $72E9				; $92CF: AD E9 72
	BMI $9334				; $92D2: 30 60   
	LDA $72E7				; $92D4: AD E7 72
	AND #$60				 ; $92D7: 29 60   
	BNE $9333				; $92D9: D0 58   
	LDX #$FF				 ; $92DB: A2 FF   
	BRK					  ; $92DD: 00	  
	AND #$C3				 ; $92DE: 29 C3   
	ASL $33F0				; $92E0: 0E F0 33
	PHA					  ; $92E3: 48	  
	BRK					  ; $92E4: 00	  
	AND #$C3				 ; $92E5: 29 C3   
	ASL					  ; $92E7: 0A	  
	EOR #$FF				 ; $92E8: 49 FF   
	STA $7E				  ; $92EA: 85 7E   
	PLA					  ; $92EC: 68	  
	AND $7E				  ; $92ED: 25 7E   
	BEQ $9316				; $92EF: F0 25   
	BRK					  ; $92F1: 00	  
	EOR $9033,X			  ; $92F2: 5D 33 90
	.byte $07			  ; $92F5 - Unknown opcode
	LDA $618E				; $92F6: AD 8E 61
	AND #$07				 ; $92F9: 29 07   
	BEQ $9305				; $92FB: F0 08   
	BRK					  ; $92FD: 00	  
	.byte $62			  ; $92FE - Unknown opcode
	.byte $23			  ; $92FF - Unknown opcode
	.byte $4B			  ; $9300 - Unknown opcode
	BEQ $930B				; $9301: F0 08   
	BNE $9321				; $9303: D0 1C   
loc_9305:
	BRK					  ; $9305: 00	  
	.byte $62			  ; $9306 - Unknown opcode
	.byte $23			  ; $9307 - Unknown opcode
	.byte $0B			  ; $9308 - Unknown opcode
	BNE $9321				; $9309: D0 16   
loc_930B:
	LDA $72E7				; $930B: AD E7 72
	AND #$9F				 ; $930E: 29 9F   
	ORA #$40				 ; $9310: 09 40   
	STA $72E7				; $9312: 8D E7 72
	RTS					  ; $9315: 60	  

; ---- Subroutine at $9316 (Bank 17) ----
sub_9316:
	LDA $72E7				; $9316: AD E7 72
	AND #$9F				 ; $9319: 29 9F   
	ORA #$20				 ; $931B: 09 20   
	STA $72E7				; $931D: 8D E7 72
	RTS					  ; $9320: 60	  
loc_9321:
	BRK					  ; $9321: 00	  
	EOR $9033,X			  ; $9322: 5D 33 90
	ORA $8EAD				; $9325: 0D AD 8E
	ADC ($29,X)			  ; $9328: 61 29	; Arithmetic
	.byte $07			  ; $932A - Unknown opcode
	BEQ $9333				; $932B: F0 06   
	BRK					  ; $932D: 00	  
	.byte $62			  ; $932E - Unknown opcode
	.byte $23			  ; $932F - Unknown opcode
	.byte $4B			  ; $9330 - Unknown opcode
	BEQ $930B				; $9331: F0 D8   
loc_9333:
	RTS					  ; $9333: 60	  
loc_9334:
	LDX #$80				 ; $9334: A2 80   
	BRK					  ; $9336: 00	  
	AND #$C3				 ; $9337: 29 C3   
	ASL $0048				; $9339: 0E 48 00
	AND #$C3				 ; $933C: 29 C3   
	ORA $C568				; $933E: 0D 68 C5
	ROR $14F0,X			  ; $9341: 7E F0 14
	CMP #$01				 ; $9344: C9 01	; Compare with 1
	BNE $9382				; $9346: D0 3A   
	LDX #$FF				 ; $9348: A2 FF   
	BRK					  ; $934A: 00	  
	AND #$C3				 ; $934B: 29 C3   
	ASL $00A2				; $934D: 0E A2 00
loc_9350:
	LSR					  ; $9350: 4A	  
	BCS $9363				; $9351: B0 10   
	INX					  ; $9353: E8	  
	CPX #$04				 ; $9354: E0 04   
	BCC $9350				; $9356: 90 F8   
	JSR $9316				; $9358: 20 16 93 ; -> sub_9316
	LDA $6E7F				; $935B: AD 7F 6E
	AND #$03				 ; $935E: 29 03   
	JMP $937F				; $9360: 4C 7F 93
loc_9363:
	JSR $9316				; $9363: 20 16 93 ; -> sub_9316
	LDA $6E7F				; $9366: AD 7F 6E
	AND #$03				 ; $9369: 29 03   
	STA $6E7F				; $936B: 8D 7F 6E
	CPX $6E7F				; $936E: EC 7F 6E
	BNE $937A				; $9371: D0 07   
	LDA $6E7F				; $9373: AD 7F 6E
	ORA #$40				 ; $9376: 09 40   
	BNE $937F				; $9378: D0 05   
loc_937A:
	LDA $6E7F				; $937A: AD 7F 6E
	ORA #$80				 ; $937D: 09 80   
loc_937F:
	STA $6E7F				; $937F: 8D 7F 6E
loc_9382:
	RTS					  ; $9382: 60	  

; ---- Subroutine at $9383 (Bank 17) ----
sub_9383:
	LDA $7361				; $9383: AD 61 73
	ORA $7362				; $9386: 0D 62 73
	RTS					  ; $9389: 60	  

; ---- Subroutine at $938A (Bank 17) ----
sub_938A:
	LDA $72E7				; $938A: AD E7 72
	ORA #$01				 ; $938D: 09 01   
	STA $72E7				; $938F: 8D E7 72
	RTS					  ; $9392: 60	  
	LDA $72E7				; $9393: AD E7 72
	AND #$FE				 ; $9396: 29 FE   
	STA $72E7				; $9398: 8D E7 72
	RTS					  ; $939B: 60	  

; ---- Subroutine at $939C (Bank 17) ----
sub_939C:
	LDX #$0F				 ; $939C: A2 0F   
	LDA #$00				 ; $939E: A9 00   
loc_93A0:
	STA $7374,X			  ; $93A0: 9D 74 73
	DEX					  ; $93A3: CA	  
	BPL $93A0				; $93A4: 10 FA   
	BRK					  ; $93A6: 00	  
	.byte $02			  ; $93A7 - Unknown opcode
	.byte $1F			  ; $93A8 - Unknown opcode
	BMI $93AE				; $93A9: 30 03   
	JMP $946D				; $93AB: 4C 6D 94
loc_93AE:
	AND #$7F				 ; $93AE: 29 7F   
	CMP #$08				 ; $93B0: C9 08	; Compare with 8
	BCS $93C9				; $93B2: B0 15   
	PHA					  ; $93B4: 48	  
	TAX					  ; $93B5: AA	  
	BRK					  ; $93B6: 00	  
	AND #$C3				 ; $93B7: 29 C3   
	ASL $0B90				; $93B9: 0E 90 0B
	JSR $99C0				; $93BC: 20 C0 99 ; -> sub_99C0
	PLA					  ; $93BF: 68	  
	ORA #$80				 ; $93C0: 09 80   
	STA $7363				; $93C2: 8D 63 73
	SEC					  ; $93C5: 38	  
	RTS					  ; $93C6: 60	  
	PLA					  ; $93C7: 68	  
	RTS					  ; $93C8: 60	  
loc_93C9:
	SBC #$08				 ; $93C9: E9 08	; Arithmetic
	AND #$03				 ; $93CB: 29 03   
	LDX #$FF				 ; $93CD: A2 FF   
	BRK					  ; $93CF: 00	  
	AND $F0B3				; $93D0: 2D B3 F0
	.byte $42			  ; $93D3 - Unknown opcode
	STA tmp0				 ; $93D4: 85 00   
	BRK					  ; $93D6: 00	  
	AND #$C3				 ; $93D7: 29 C3   
	ASL $0025				; $93D9: 0E 25 00
	BEQ $9416				; $93DC: F0 38   
	STA tmp0				 ; $93DE: 85 00   
	BRK					  ; $93E0: 00	  
	AND #$C3				 ; $93E1: 29 C3   
	.byte $02			  ; $93E3 - Unknown opcode
	EOR #$FF				 ; $93E4: 49 FF   
	AND tmp0				 ; $93E6: 25 00   
	BEQ $93F8				; $93E8: F0 0E   
	STA tmp0				 ; $93EA: 85 00   
	BRK					  ; $93EC: 00	  
	AND #$C3				 ; $93ED: 29 C3   
	ORA $FF49				; $93EF: 0D 49 FF
	AND tmp0				 ; $93F2: 25 00   
	BEQ $93F8				; $93F4: F0 02   
	STA tmp0				 ; $93F6: 85 00   
loc_93F8:
	BRK					  ; $93F8: 00	  
	AND #$C3				 ; $93F9: 29 C3   
	BRK					  ; $93FB: 00	  
	EOR #$FF				 ; $93FC: 49 FF   
	AND tmp0				 ; $93FE: 25 00   
	BEQ $9404				; $9400: F0 02   
	STA tmp0				 ; $9402: 85 00   
loc_9404:
	JSR $94B2				; $9404: 20 B2 94 ; -> sub_94B2
	LDX #$00				 ; $9407: A2 00   
loc_9409:
	LDA $737C,X			  ; $9409: BD 7C 73
	ORA $7374,X			  ; $940C: 1D 74 73
	BNE $9418				; $940F: D0 07   
	INX					  ; $9411: E8	  
	CPX #$08				 ; $9412: E0 08   
	BNE $9409				; $9414: D0 F3   
loc_9416:
	CLC					  ; $9416: 18	  
	RTS					  ; $9417: 60	  
loc_9418:
	LDX #$FF				 ; $9418: A2 FF   
	STX tmp1				 ; $941A: 86 01   
loc_941C:
	INX					  ; $941C: E8	  
	STX tmp2				 ; $941D: 86 02   
	STX tmp3				 ; $941F: 86 03   
loc_9421:
	LDA $737C,X			  ; $9421: BD 7C 73
	BPL $9452				; $9424: 10 2C   
	AND #$7F				 ; $9426: 29 7F   
	BEQ $9439				; $9428: F0 0F   
	LDY tmp3				 ; $942A: A4 03   
	BEQ $9444				; $942C: F0 16   
	CMP tmp3				 ; $942E: C5 03   
	BCC $9439				; $9430: 90 07   
	LDA $7374,X			  ; $9432: BD 74 73
	CMP tmp2				 ; $9435: C5 02   
	BCS $9452				; $9437: B0 19   
loc_9439:
	LDA tmp3				 ; $9439: A5 03   
	BNE $9452				; $943B: D0 15   
	LDA $7374,X			  ; $943D: BD 74 73
	CMP tmp2				 ; $9440: C5 02   
	BCC $9452				; $9442: 90 0E   
loc_9444:
	LDA $737C,X			  ; $9444: BD 7C 73
	AND #$7F				 ; $9447: 29 7F   
	STA tmp3				 ; $9449: 85 03   
	LDA $7374,X			  ; $944B: BD 74 73
	STA tmp2				 ; $944E: 85 02   
	STX tmp1				 ; $9450: 86 01   
loc_9452:
	INX					  ; $9452: E8	  
	CPX #$08				 ; $9453: E0 08   
	BNE $9421				; $9455: D0 CA   
	LDX tmp1				 ; $9457: A6 01   
	LDA $7364,X			  ; $9459: BD 64 73
	STA $7361				; $945C: 8D 61 73
	LDA $736C,X			  ; $945F: BD 6C 73
	STA $7362				; $9462: 8D 62 73
	TXA					  ; $9465: 8A	  
	ORA #$80				 ; $9466: 09 80   
	STA $7363				; $9468: 8D 63 73
	SEC					  ; $946B: 38	  
	RTS					  ; $946C: 60	  
loc_946D:
	STA $7363				; $946D: 8D 63 73
	BRK					  ; $9470: 00	  
	.byte $67			  ; $9471 - Unknown opcode
	.byte $73			  ; $9472 - Unknown opcode
	TAX					  ; $9473: AA	  
	BRK					  ; $9474: 00	  
	LSR $93				  ; $9475: 46 93   
	.byte $07			  ; $9477 - Unknown opcode
	BCC $94B1				; $9478: 90 37   
	BRK					  ; $947A: 00	  
	.byte $02			  ; $947B - Unknown opcode
	.byte $1F			  ; $947C - Unknown opcode
	TAX					  ; $947D: AA	  
	JSR $9980				; $947E: 20 80 99 ; -> sub_9980
	BRK					  ; $9481: 00	  
	LSR $93				  ; $9482: 46 93   
	.byte $12			  ; $9484 - Unknown opcode
	BCS $94B1				; $9485: B0 2A   
	BRK					  ; $9487: 00	  
	LSR $93				  ; $9488: 46 93   
	BPL $941C				; $948A: 10 90   
	.byte $23			  ; $948C - Unknown opcode
	BRK					  ; $948D: 00	  
	ORA (system_flags,X)	 ; $948E: 01 1F   
	BMI $94B0				; $9490: 30 1E   
	LSR $0F				  ; $9492: 46 0F   
	ROR $0E				  ; $9494: 66 0E   
	LSR $0F				  ; $9496: 46 0F   
	ROR $0E				  ; $9498: 66 0E   
	LSR $0F				  ; $949A: 46 0F   
	ROR $0E				  ; $949C: 66 0E   
	BRK					  ; $949E: 00	  
	.byte $1B			  ; $949F - Unknown opcode
	.byte $0F			  ; $94A0 - Unknown opcode
	AND #$03				 ; $94A1: 29 03   
	CLC					  ; $94A3: 18	  
	ADC $0E				  ; $94A4: 65 0E	; Arithmetic
	STA $7361				; $94A6: 8D 61 73
	LDA $0F				  ; $94A9: A5 0F   
	ADC #$00				 ; $94AB: 69 00	; Arithmetic
	STA $7362				; $94AD: 8D 62 73
loc_94B0:
	SEC					  ; $94B0: 38	  
loc_94B1:
	RTS					  ; $94B1: 60	  

; ---- Subroutine at $94B2 (Bank 17) ----
sub_94B2:
	LDX #$00				 ; $94B2: A2 00   
loc_94B4:
	STX $97				  ; $94B4: 86 97   
	LSR tmp0				 ; $94B6: 46 00   
	BCC $950F				; $94B8: 90 55   
	JSR $99C0				; $94BA: 20 C0 99 ; -> sub_99C0
	LDX $97				  ; $94BD: A6 97   
	LDA $7361				; $94BF: AD 61 73
	STA tmp2				 ; $94C2: 85 02   
	STA $7364,X			  ; $94C4: 9D 64 73
	LDA $7362				; $94C7: AD 62 73
	STA tmp3				 ; $94CA: 85 03   
	STA $736C,X			  ; $94CC: 9D 6C 73
	BRK					  ; $94CF: 00	  
	ORA (system_flags,X)	 ; $94D0: 01 1F   
	BRK					  ; $94D2: 00	  
	.byte $67			  ; $94D3 - Unknown opcode
	.byte $73			  ; $94D4 - Unknown opcode
	TAX					  ; $94D5: AA	  
	LDA #$00				 ; $94D6: A9 00   
	BRK					  ; $94D8: 00	  
	.byte $17			  ; $94D9 - Unknown opcode
	.byte $0F			  ; $94DA - Unknown opcode
	LSR					  ; $94DB: 4A	  
	LSR					  ; $94DC: 4A	  
	LDX #$02				 ; $94DD: A2 02   
	JSR $C827				; $94DF: 20 27 C8 ; Call to fixed bank
	LDX $97				  ; $94E2: A6 97   
	CLC					  ; $94E4: 18	  
	LDA tmp3				 ; $94E5: A5 03   
	ADC $7364,X			  ; $94E7: 7D 64 73 ; Arithmetic
	STA tmp2				 ; $94EA: 85 02   
	LDA #$00				 ; $94EC: A9 00   
	STA tmp1				 ; $94EE: 85 01   
	ADC $736C,X			  ; $94F0: 7D 6C 73 ; Arithmetic
	STA tmp3				 ; $94F3: 85 03   
	LDX $97				  ; $94F5: A6 97   
	BRK					  ; $94F7: 00	  
	BRK					  ; $94F8: 00	  
	.byte $B3			  ; $94F9 - Unknown opcode
	LDX #$01				 ; $94FA: A2 01   
	LDY #$7E				 ; $94FC: A0 7E   
	JSR $9A84				; $94FE: 20 84 9A ; -> sub_9A84
	LDX $97				  ; $9501: A6 97   
	LDA tmp1				 ; $9503: A5 01   
	STA $7374,X			  ; $9505: 9D 74 73
	LDA tmp2				 ; $9508: A5 02   
	ORA #$80				 ; $950A: 09 80   
	STA $737C,X			  ; $950C: 9D 7C 73
loc_950F:
	INX					  ; $950F: E8	  
	CPX #$08				 ; $9510: E0 08   
	BNE $94B4				; $9512: D0 A0   
	RTS					  ; $9514: 60	  
loc_9515:
	JMP $95DD				; $9515: 4C DD 95

; ---- Subroutine at $9518 (Bank 17) ----
sub_9518:
	BRK					  ; $9518: 00	  
	.byte $03			  ; $9519 - Unknown opcode
	.byte $1F			  ; $951A - Unknown opcode
	CMP #$30				 ; $951B: C9 30	; Compare with 48
	BEQ $9515				; $951D: F0 F6   
	CMP #$31				 ; $951F: C9 31	; Compare with 49
	BEQ $9515				; $9521: F0 F2   
	CMP #$71				 ; $9523: C9 71	; Compare with 113
	BEQ $9515				; $9525: F0 EE   
	CMP #$97				 ; $9527: C9 97	; Compare with 151
	BEQ $9515				; $9529: F0 EA   
	BRK					  ; $952B: 00	  
	ASL $C93F				; $952C: 0E 3F C9
	BRK					  ; $952F: 00	  
	BNE $9535				; $9530: D0 03   
	JMP $95B7				; $9532: 4C B7 95
loc_9535:
	BRK					  ; $9535: 00	  
	.byte $02			  ; $9536 - Unknown opcode
	.byte $1F			  ; $9537 - Unknown opcode
	BMI $9548				; $9538: 30 0E   
	STA $7363				; $953A: 8D 63 73
	BRK					  ; $953D: 00	  
	.byte $67			  ; $953E - Unknown opcode
	.byte $73			  ; $953F - Unknown opcode
	TAX					  ; $9540: AA	  
	BRK					  ; $9541: 00	  
	LSR $93				  ; $9542: 46 93   
	.byte $07			  ; $9544 - Unknown opcode
	BCC $95C2				; $9545: 90 7B   
	RTS					  ; $9547: 60	  
loc_9548:
	AND #$7F				 ; $9548: 29 7F   
	CMP #$08				 ; $954A: C9 08	; Compare with 8
	BCS $9561				; $954C: B0 13   
	TAX					  ; $954E: AA	  
	ORA #$80				 ; $954F: 09 80   
	STA $7363				; $9551: 8D 63 73
	BRK					  ; $9554: 00	  
	AND #$C3				 ; $9555: 29 C3   
	.byte $0F			  ; $9557 - Unknown opcode
	BCC $9560				; $9558: 90 06   
	BRK					  ; $955A: 00	  
	AND #$C3				 ; $955B: 29 C3   
	ASL $6290				; $955D: 0E 90 62
loc_9560:
	RTS					  ; $9560: 60	  
loc_9561:
	SBC #$08				 ; $9561: E9 08	; Arithmetic
	AND #$03				 ; $9563: 29 03   
	LDX #$FF				 ; $9565: A2 FF   
	BRK					  ; $9567: 00	  
	AND $85B3				; $9568: 2D B3 85
	BRK					  ; $956B: 00	  
	BEQ $95D0				; $956C: F0 62   
	BRK					  ; $956E: 00	  
	AND #$C3				 ; $956F: 29 C3   
	ASL $0025				; $9571: 0E 25 00
	BEQ $95BF				; $9574: F0 49   
	STA tmp0				 ; $9576: 85 00   
	BRK					  ; $9578: 00	  
	AND #$C3				 ; $9579: 29 C3   
	ORA $FF49				; $957B: 0D 49 FF
	AND tmp0				 ; $957E: 25 00   
	BEQ $9584				; $9580: F0 02   
	STA tmp0				 ; $9582: 85 00   
loc_9584:
	BRK					  ; $9584: 00	  
	.byte $03			  ; $9585 - Unknown opcode
	.byte $1F			  ; $9586 - Unknown opcode
	CMP #$3C				 ; $9587: C9 3C	; Compare with 60
	BCS $95A5				; $9589: B0 1A   
	LDX #$FF				 ; $958B: A2 FF   
	BRK					  ; $958D: 00	  
	AND #$C3				 ; $958E: 29 C3   
	ASL $49				  ; $9590: 06 49   
	.byte $FF			  ; $9592 - Unknown opcode
	AND tmp0				 ; $9593: 25 00   
	BEQ $9599				; $9595: F0 02   
	STA tmp0				 ; $9597: 85 00   
loc_9599:
	BRK					  ; $9599: 00	  
	AND #$C3				 ; $959A: 29 C3   
	.byte $07			  ; $959C - Unknown opcode
	EOR #$FF				 ; $959D: 49 FF   
	AND tmp0				 ; $959F: 25 00   
	BEQ $95A5				; $95A1: F0 02   
	STA tmp0				 ; $95A3: 85 00   
loc_95A5:
	BRK					  ; $95A5: 00	  
	AND #$C3				 ; $95A6: 29 C3   
	.byte $02			  ; $95A8 - Unknown opcode
	EOR #$FF				 ; $95A9: 49 FF   
	AND tmp0				 ; $95AB: 25 00   
	BEQ $95B1				; $95AD: F0 02   
	STA tmp0				 ; $95AF: 85 00   
loc_95B1:
	JSR $95D2				; $95B1: 20 D2 95 ; -> sub_95D2
	BCC $95C2				; $95B4: 90 0C   
	RTS					  ; $95B6: 60	  
loc_95B7:
	BRK					  ; $95B7: 00	  
	ORA (system_flags,X)	 ; $95B8: 01 1F   
	STA $7363				; $95BA: 8D 63 73
	SEC					  ; $95BD: 38	  
	RTS					  ; $95BE: 60	  
loc_95BF:
	JSR $95D2				; $95BF: 20 D2 95 ; -> sub_95D2
loc_95C2:
	BRK					  ; $95C2: 00	  
	.byte $07			  ; $95C3 - Unknown opcode
	.byte $1F			  ; $95C4 - Unknown opcode
	BCC $95CC				; $95C5: 90 05   
	BRK					  ; $95C7: 00	  
	ASL system_flags		 ; $95C8: 06 1F   
	BCC $95D0				; $95CA: 90 04   
loc_95CC:
	BRK					  ; $95CC: 00	  
	CPX $D3				  ; $95CD: E4 D3   
	ROR $6018				; $95CF: 6E 18 60

; ---- Subroutine at $95D2 (Bank 17) ----
sub_95D2:
	LDA tmp0				 ; $95D2: A5 00   
	BRK					  ; $95D4: 00	  
	.byte $2B			  ; $95D5 - Unknown opcode
	.byte $0F			  ; $95D6 - Unknown opcode
	ORA #$80				 ; $95D7: 09 80   
	STA $7363				; $95D9: 8D 63 73
	RTS					  ; $95DC: 60	  
loc_95DD:
	BRK					  ; $95DD: 00	  
	.byte $02			  ; $95DE - Unknown opcode
	.byte $1F			  ; $95DF - Unknown opcode
	BMI $95E7				; $95E0: 30 05   
	STA $7363				; $95E2: 8D 63 73
	SEC					  ; $95E5: 38	  
	RTS					  ; $95E6: 60	  
loc_95E7:
	AND #$7F				 ; $95E7: 29 7F   
	CMP #$08				 ; $95E9: C9 08	; Compare with 8
	BCS $95F5				; $95EB: B0 08   
	TAX					  ; $95ED: AA	  
	ORA #$80				 ; $95EE: 09 80   
	STA $7363				; $95F0: 8D 63 73
	SEC					  ; $95F3: 38	  
	RTS					  ; $95F4: 60	  
loc_95F5:
	SBC #$08				 ; $95F5: E9 08	; Arithmetic
	AND #$03				 ; $95F7: 29 03   
	LDX #$FF				 ; $95F9: A2 FF   
	BRK					  ; $95FB: 00	  
	AND $85B3				; $95FC: 2D B3 85
	BRK					  ; $95FF: 00	  
	BRK					  ; $9600: 00	  
	AND #$C3				 ; $9601: 29 C3   
	ASL $FF49				; $9603: 0E 49 FF
	AND tmp0				 ; $9606: 25 00   
	BRK					  ; $9608: 00	  
	.byte $2B			  ; $9609 - Unknown opcode
	.byte $0F			  ; $960A - Unknown opcode
	ORA #$80				 ; $960B: 09 80   
	STA $7363				; $960D: 8D 63 73
	RTS					  ; $9610: 60	  

; ---- Subroutine at $9611 (Bank 17) ----
sub_9611:
	BRK					  ; $9611: 00	  
	.byte $02			  ; $9612 - Unknown opcode
	.byte $1F			  ; $9613 - Unknown opcode
	BPL $9689				; $9614: 10 73   
	LDX #$FF				 ; $9616: A2 FF   
	BRK					  ; $9618: 00	  
	AND #$C3				 ; $9619: 29 C3   
	ASL $0300				; $961B: 0E 00 03
	.byte $1F			  ; $961E - Unknown opcode
	CMP #$30				 ; $961F: C9 30	; Compare with 48
	BEQ $9632				; $9621: F0 0F   
	CMP #$31				 ; $9623: C9 31	; Compare with 49
	BEQ $9632				; $9625: F0 0B   
	CMP #$32				 ; $9627: C9 32	; Compare with 50
	BNE $9638				; $9629: D0 0D   
	BRK					  ; $962B: 00	  
	AND #$C3				 ; $962C: 29 C3   
	.byte $0F			  ; $962E - Unknown opcode
	JMP $9638				; $962F: 4C 38 96
loc_9632:
	LDA $7E				  ; $9632: A5 7E   
	EOR #$FF				 ; $9634: 49 FF   
	STA $7E				  ; $9636: 85 7E   
loc_9638:
	LDA $7E				  ; $9638: A5 7E   
	STA tmp0				 ; $963A: 85 00   
	BRK					  ; $963C: 00	  
	.byte $03			  ; $963D - Unknown opcode
	.byte $1F			  ; $963E - Unknown opcode
	BRK					  ; $963F: 00	  
	ASL $C93F				; $9640: 0E 3F C9
	.byte $03			  ; $9643 - Unknown opcode
	BEQ $9657				; $9644: F0 11   
	BRK					  ; $9646: 00	  
	.byte $02			  ; $9647 - Unknown opcode
	.byte $1F			  ; $9648 - Unknown opcode
	AND #$7F				 ; $9649: 29 7F   
	SEC					  ; $964B: 38	  
	SBC #$08				 ; $964C: E9 08	; Arithmetic
	LDX #$FF				 ; $964E: A2 FF   
	BRK					  ; $9650: 00	  
	AND $25B3				; $9651: 2D B3 25
	BRK					  ; $9654: 00	  
	STA tmp0				 ; $9655: 85 00   
loc_9657:
	JSR $96D1				; $9657: 20 D1 96 ; -> sub_96D1
	LDA $735E				; $965A: AD 5E 73
	ORA #$80				 ; $965D: 09 80   
	STA $7363				; $965F: 8D 63 73
	PHP					  ; $9662: 08	  
	LDA $72E9				; $9663: AD E9 72
	BMI $966A				; $9666: 30 02   
	PLP					  ; $9668: 28	  
	RTS					  ; $9669: 60	  
loc_966A:
	BRK					  ; $966A: 00	  
	.byte $03			  ; $966B - Unknown opcode
	.byte $1F			  ; $966C - Unknown opcode
	BRK					  ; $966D: 00	  
	.byte $0C			  ; $966E - Unknown opcode
	.byte $3F			  ; $966F - Unknown opcode
	BCC $967C				; $9670: 90 0A   
	BRK					  ; $9672: 00	  
	ORA (system_flags,X)	 ; $9673: 01 1F   
	CMP $7363				; $9675: CD 63 73
	BEQ $9686				; $9678: F0 0C   
	PLP					  ; $967A: 28	  
	RTS					  ; $967B: 60	  
loc_967C:
	BRK					  ; $967C: 00	  
	ORA (system_flags,X)	 ; $967D: 01 1F   
	CMP $7363				; $967F: CD 63 73
	BNE $9686				; $9682: D0 02   
	PLP					  ; $9684: 28	  
	RTS					  ; $9685: 60	  
loc_9686:
	PLP					  ; $9686: 28	  
	CLC					  ; $9687: 18	  
	RTS					  ; $9688: 60	  
loc_9689:
	LDA #$07				 ; $9689: A9 07   
	BRK					  ; $968B: 00	  
	BIT $850F				; $968C: 2C 0F 85
	BRK					  ; $968F: 00	  
	BRK					  ; $9690: 00	  
	.byte $03			  ; $9691 - Unknown opcode
	.byte $1F			  ; $9692 - Unknown opcode
	CMP #$E8				 ; $9693: C9 E8	; Compare with 232
	BEQ $969F				; $9695: F0 08   
	CMP #$30				 ; $9697: C9 30	; Compare with 48
	BCC $96B1				; $9699: 90 16   
	CMP #$33				 ; $969B: C9 33	; Compare with 51
	BCS $96B1				; $969D: B0 12   
loc_969F:
	JSR $96D1				; $969F: 20 D1 96 ; -> sub_96D1
	BCS $96B6				; $96A2: B0 12   
	BRK					  ; $96A4: 00	  
	.byte $62			  ; $96A5 - Unknown opcode
	.byte $23			  ; $96A6 - Unknown opcode
	RTI					  ; $96A7: 40	  
	LDA $735E				; $96A8: AD 5E 73
	CMP $72				  ; $96AB: C5 72   
	BCS $96C1				; $96AD: B0 12   
	BCC $96B6				; $96AF: 90 05   
loc_96B1:
	JSR $96D1				; $96B1: 20 D1 96 ; -> sub_96D1
	BCC $96C1				; $96B4: 90 0B   
loc_96B6:
	LDX $735E				; $96B6: AE 5E 73
	BRK					  ; $96B9: 00	  
	PLA					  ; $96BA: 68	  
	.byte $73			  ; $96BB - Unknown opcode
	STA $7363				; $96BC: 8D 63 73
	SEC					  ; $96BF: 38	  
	RTS					  ; $96C0: 60	  
loc_96C1:
	CLC					  ; $96C1: 18	  
	RTS					  ; $96C2: 60	  

; ---- Subroutine at $96C3 (Bank 17) ----
sub_96C3:
	BRK					  ; $96C3: 00	  
	.byte $02			  ; $96C4 - Unknown opcode
	.byte $1F			  ; $96C5 - Unknown opcode
	BPL $9689				; $96C6: 10 C1   
	LDX #$FF				 ; $96C8: A2 FF   
	BRK					  ; $96CA: 00	  
	AND #$C3				 ; $96CB: 29 C3   
	ASL $554C				; $96CD: 0E 4C 55
	STX $AE,Y				; $96D0: 96 AE   
	LSR $4673,X			  ; $96D2: 5E 73 46
	BRK					  ; $96D5: 00	  
	DEX					  ; $96D6: CA	  
	BPL $96D4				; $96D7: 10 FB   
	RTS					  ; $96D9: 60	  
loc_96DA:
	RTS					  ; $96DA: 60	  

; ---- Subroutine at $96DB (Bank 17) ----
sub_96DB:
	LSR $72E7				; $96DB: 4E E7 72
	ASL $72E7				; $96DE: 0E E7 72
	BRK					  ; $96E1: 00	  
	ASL system_flags		 ; $96E2: 06 1F   
	BCS $970C				; $96E4: B0 26   
	BRK					  ; $96E6: 00	  
	.byte $3B			  ; $96E7 - Unknown opcode
	.byte $93			  ; $96E8 - Unknown opcode
	BRK					  ; $96E9: 00	  
	CMP #$96				 ; $96EA: C9 96	; Compare with 150
	BNE $970C				; $96EC: D0 1E   
	JSR $970C				; $96EE: 20 0C 97 ; -> sub_970C
	LDA $72E7				; $96F1: AD E7 72
	AND #$60				 ; $96F4: 29 60   
	BNE $9772				; $96F6: D0 7A   
	LDA $6E44				; $96F8: AD 44 6E
	LSR					  ; $96FB: 4A	  
	BCS $9772				; $96FC: B0 74   
	BRK					  ; $96FE: 00	  
	.byte $13			  ; $96FF - Unknown opcode
	.byte $2F			  ; $9700 - Unknown opcode
	LDA #$01				 ; $9701: A9 01   
	STA $735F				; $9703: 8D 5F 73
	STA $7360				; $9706: 8D 60 73
	BRK					  ; $9709: 00	  
	ASL $6F				  ; $970A: 06 6F   

; ---- Subroutine at $970C (Bank 17) ----
sub_970C:
	JSR $939C				; $970C: 20 9C 93 ; -> sub_939C
	BCC $9772				; $970F: 90 61   
	BRK					  ; $9711: 00	  
	.byte $07			  ; $9712 - Unknown opcode
	.byte $1F			  ; $9713 - Unknown opcode
	BCC $971B				; $9714: 90 05   
	JSR $ACBF				; $9716: 20 BF AC ; -> sub_ACBF
	BCC $96DA				; $9719: 90 BF   
loc_971B:
	BRK					  ; $971B: 00	  
	ASL system_flags		 ; $971C: 06 1F   
	BCC $9775				; $971E: 90 55   
	BRK					  ; $9720: 00	  
	AND #$C3				 ; $9721: 29 C3   
	.byte $04			  ; $9723 - Unknown opcode
	BCC $972B				; $9724: 90 05   
	JSR $97E6				; $9726: 20 E6 97 ; -> sub_97E6
	BCC $9789				; $9729: 90 5E   
loc_972B:
	JSR $A63E				; $972B: 20 3E A6 ; -> sub_A63E
	BCC $96DA				; $972E: 90 AA   
	BRK					  ; $9730: 00	  
	AND #$C3				 ; $9731: 29 C3   
	ORA $90				  ; $9733: 05 90   
	.byte $03			  ; $9735 - Unknown opcode
	JSR $9817				; $9736: 20 17 98 ; -> sub_9817
	BRK					  ; $9739: 00	  
	.byte $07			  ; $973A - Unknown opcode
	.byte $1F			  ; $973B - Unknown opcode
	BCS $976F				; $973C: B0 31   
	STA tmp1				 ; $973E: 85 01   
	BRK					  ; $9740: 00	  
	BRK					  ; $9741: 00	  
	.byte $53			  ; $9742 - Unknown opcode
	SEC					  ; $9743: 38	  
	SBC $7361				; $9744: ED 61 73 ; Arithmetic
	LDA $73				  ; $9747: A5 73   
	SBC $7362				; $9749: ED 62 73 ; Arithmetic
	BCS $976F				; $974C: B0 21   
	JSR $B31F				; $974E: 20 1F B3 ; -> sub_B31F
	BCC $976F				; $9751: 90 1C   
	CMP tmp1				 ; $9753: C5 01   
	BEQ $976F				; $9755: F0 18   
	BRK					  ; $9757: 00	  
	.byte $1B			  ; $9758 - Unknown opcode
	.byte $0F			  ; $9759 - Unknown opcode
	CMP #$40				 ; $975A: C9 40	; Compare with 64
	BCS $976F				; $975C: B0 11   
	LDA tmp0				 ; $975E: A5 00   
	STA $FA				  ; $9760: 85 FA   
	PHA					  ; $9762: 48	  
	BRK					  ; $9763: 00	  
	CPX $D3				  ; $9764: E4 D3   
	EOR #$68				 ; $9766: 49 68   
	TAX					  ; $9768: AA	  
	BRK					  ; $9769: 00	  
	PLA					  ; $976A: 68	  
	.byte $73			  ; $976B - Unknown opcode
	STA $7363				; $976C: 8D 63 73
loc_976F:
	JMP $97DA				; $976F: 4C DA 97
loc_9772:
	JMP $97E5				; $9772: 4C E5 97
loc_9775:
	JSR $9851				; $9775: 20 51 98 ; -> sub_9851
	JSR $A69F				; $9778: 20 9F A6 ; -> sub_A69F
	BCS $97E5				; $977B: B0 68   
	BRK					  ; $977D: 00	  
	ASL system_flags		 ; $977E: 06 1F   
	BRK					  ; $9780: 00	  
	LSR $93				  ; $9781: 46 93   
	.byte $14			  ; $9783 - Unknown opcode
	BCC $978B				; $9784: 90 05   
	JSR $97E6				; $9786: 20 E6 97 ; -> sub_97E6
loc_9789:
	BCC $97EC				; $9789: 90 61   
loc_978B:
	JSR $A63E				; $978B: 20 3E A6 ; -> sub_A63E
	BCC $97E5				; $978E: 90 55   
	JSR $A6E3				; $9790: 20 E3 A6 ; -> sub_A6E3
	BCS $97CC				; $9793: B0 37   
	BRK					  ; $9795: 00	  
	ASL system_flags		 ; $9796: 06 1F   
	BRK					  ; $9798: 00	  
	LSR $93				  ; $9799: 46 93   
	ORA $90,X				; $979B: 15 90   
	ASL $20				  ; $979D: 06 20   
	.byte $17			  ; $979F - Unknown opcode
	TYA					  ; $97A0: 98	  
	JMP $97D7				; $97A1: 4C D7 97
	LDA $72E7				; $97A4: AD E7 72
	AND #$08				 ; $97A7: 29 08   
	BEQ $97D7				; $97A9: F0 2C   
	LDA $72E4				; $97AB: AD E4 72
	AND #$08				 ; $97AE: 29 08   
	BNE $97CC				; $97B0: D0 1A   
	LDA #$04				 ; $97B2: A9 04   
	STA tmp0				 ; $97B4: 85 00   
	BRK					  ; $97B6: 00	  
	ASL system_flags		 ; $97B7: 06 1F   
	BRK					  ; $97B9: 00	  
	.byte $2B			  ; $97BA - Unknown opcode
	.byte $53			  ; $97BB - Unknown opcode
	CMP #$07				 ; $97BC: C9 07	; Compare with 7
	BNE $97C5				; $97BE: D0 05   
	BRK					  ; $97C0: 00	  
	.byte $0F			  ; $97C1 - Unknown opcode
	.byte $53			  ; $97C2 - Unknown opcode
	STA tmp0				 ; $97C3: 85 00   
loc_97C5:
	BRK					  ; $97C5: 00	  
	.byte $1B			  ; $97C6 - Unknown opcode
	.byte $0F			  ; $97C7 - Unknown opcode
	CMP tmp0				 ; $97C8: C5 00   
	BCS $97D7				; $97CA: B0 0B   
loc_97CC:
	JSR $9916				; $97CC: 20 16 99 ; -> sub_9916
	JSR $BF2E				; $97CF: 20 2E BF ; -> sub_BF2E
	DEY					  ; $97D2: 88	  
	BRK					  ; $97D3: 00	  
	.byte $F2			  ; $97D4 - Unknown opcode
	.byte $D3			  ; $97D5 - Unknown opcode
	.byte $04			  ; $97D6 - Unknown opcode
loc_97D7:
	JSR $A78B				; $97D7: 20 8B A7 ; -> sub_A78B
loc_97DA:
	JSR $9878				; $97DA: 20 78 98 ; -> sub_9878
	BCC $97E5				; $97DD: 90 06   
	JSR $90DB				; $97DF: 20 DB 90 ; -> sub_90DB
	JSR $A7C4				; $97E2: 20 C4 A7 ; -> sub_A7C4
loc_97E5:
	RTS					  ; $97E5: 60	  

; ---- Subroutine at $97E6 (Bank 17) ----
sub_97E6:
	BRK					  ; $97E6: 00	  
	.byte $1B			  ; $97E7 - Unknown opcode
	.byte $0F			  ; $97E8 - Unknown opcode
	CMP #$C0				 ; $97E9: C9 C0	; Compare with 192
	RTS					  ; $97EB: 60	  
loc_97EC:
	JSR $938A				; $97EC: 20 8A 93 ; -> sub_938A
	BRK					  ; $97EF: 00	  
	ASL system_flags		 ; $97F0: 06 1F   
	BCC $980E				; $97F2: 90 1A   
	LDA $72E9				; $97F4: AD E9 72
	BPL $9805				; $97F7: 10 0C   
	BRK					  ; $97F9: 00	  
	AND $ADA3				; $97FA: 2D A3 AD
	.byte $7F			  ; $97FD - Unknown opcode
	ROR $0329				; $97FE: 6E 29 03
	CMP $7E				  ; $9801: C5 7E   
	BEQ $980E				; $9803: F0 09   
loc_9805:
	JSR $BF2E				; $9805: 20 2E BF ; -> sub_BF2E
	STA $E400				; $9808: 8D 00 E4
	.byte $D3			  ; $980B - Unknown opcode
	ASL $60				  ; $980C: 06 60   
loc_980E:
	JSR $BF2E				; $980E: 20 2E BF ; -> sub_BF2E
	STY $E400				; $9811: 8C 00 E4
	.byte $D3			  ; $9814 - Unknown opcode
	.byte $07			  ; $9815 - Unknown opcode
	RTS					  ; $9816: 60	  

; ---- Subroutine at $9817 (Bank 17) ----
sub_9817:
	ASL $7361				; $9817: 0E 61 73
	ROL $7362				; $981A: 2E 62 73
	RTS					  ; $981D: 60	  

; ---- Subroutine at $981E (Bank 17) ----
sub_981E:
	LSR $7362				; $981E: 4E 62 73
	ROR $7361				; $9821: 6E 61 73
	JSR $9832				; $9824: 20 32 98 ; -> sub_9832
	LDX #$00				 ; $9827: A2 00   
	LDA #$03				 ; $9829: A9 03   
	JSR $C827				; $982B: 20 27 C8 ; Call to fixed bank
	JSR $983D				; $982E: 20 3D 98 ; -> sub_983D
	RTS					  ; $9831: 60	  

; ---- Subroutine at $9832 (Bank 17) ----
sub_9832:
	LDA $7361				; $9832: AD 61 73
	STA tmp0				 ; $9835: 85 00   
	LDA $7362				; $9837: AD 62 73
	STA tmp1				 ; $983A: 85 01   
	RTS					  ; $983C: 60	  

; ---- Subroutine at $983D (Bank 17) ----
sub_983D:
	LDA tmp0				 ; $983D: A5 00   
	STA $7361				; $983F: 8D 61 73
	LDA tmp1				 ; $9842: A5 01   
	STA $7362				; $9844: 8D 62 73
	RTS					  ; $9847: 60	  

; ---- Subroutine at $9848 (Bank 17) ----
sub_9848:
	BRK					  ; $9848: 00	  
	ASL system_flags		 ; $9849: 06 1F   
	LDA #$00				 ; $984B: A9 00   
	BRK					  ; $984D: 00	  
	.byte $3B			  ; $984E - Unknown opcode
	.byte $73			  ; $984F - Unknown opcode
	RTS					  ; $9850: 60	  

; ---- Subroutine at $9851 (Bank 17) ----
sub_9851:
	LDA $72E7				; $9851: AD E7 72
	ORA #$08				 ; $9854: 09 08   
	STA $72E7				; $9856: 8D E7 72
	RTS					  ; $9859: 60	  

; ---- Subroutine at $985A (Bank 17) ----
sub_985A:
	LDA $72E7				; $985A: AD E7 72
	AND #$F7				 ; $985D: 29 F7   
	STA $72E7				; $985F: 8D E7 72
	RTS					  ; $9862: 60	  

; ---- Subroutine at $9863 (Bank 17) ----
sub_9863:
	LSR $7362				; $9863: 4E 62 73
	ROR $7361				; $9866: 6E 61 73
	LSR $7362				; $9869: 4E 62 73
	ROR $7361				; $986C: 6E 61 73
	INC $7361				; $986F: EE 61 73
	BNE $9877				; $9872: D0 03   
	INC $7362				; $9874: EE 62 73
loc_9877:
	RTS					  ; $9877: 60	  

; ---- Subroutine at $9878 (Bank 17) ----
sub_9878:
	LDA $72E9				; $9878: AD E9 72
	BMI $98AB				; $987B: 30 2E   
	JSR $C891				; $987D: 20 91 C8 ; Call to fixed bank
	CMP #$6E				 ; $9880: C9 6E	; Compare with 110
	BCS $98AB				; $9882: B0 27   
	LDA $7363				; $9884: AD 63 73
	BPL $98AB				; $9887: 10 22   
	AND #$7F				 ; $9889: 29 7F   
	TAX					  ; $988B: AA	  
	BRK					  ; $988C: 00	  
	AND $AAA3				; $988D: 2D A3 AA
	LDA $6E45,X			  ; $9890: BD 45 6E
	CMP #$0D				 ; $9893: C9 0D	; Compare with 13
	BEQ $989B				; $9895: F0 04   
	CMP #$9F				 ; $9897: C9 9F	; Compare with 159
	BNE $98AB				; $9899: D0 10   
loc_989B:
	TXA					  ; $989B: 8A	  
	PHA					  ; $989C: 48	  
	LDA $7363				; $989D: AD 63 73
	AND #$7F				 ; $98A0: 29 7F   
	STA $C7				  ; $98A2: 85 C7   
	BRK					  ; $98A4: 00	  
	CLC					  ; $98A5: 18	  
	.byte $4F			  ; $98A6 - Unknown opcode
	BCS $98AD				; $98A7: B0 04   
	PLA					  ; $98A9: 68	  
	TAX					  ; $98AA: AA	  
loc_98AB:
	SEC					  ; $98AB: 38	  
	RTS					  ; $98AC: 60	  
loc_98AD:
	JSR $A1B4				; $98AD: 20 B4 A1 ; -> sub_A1B4
	STX $7B				  ; $98B0: 86 7B   
	TXA					  ; $98B2: 8A	  
	PHA					  ; $98B3: 48	  
	JSR $BF2E				; $98B4: 20 2E BF ; -> sub_BF2E
	.byte $87			  ; $98B7 - Unknown opcode
	BRK					  ; $98B8: 00	  
	ORA ($4F,X)			  ; $98B9: 01 4F   
	BRK					  ; $98BB: 00	  
	.byte $97			  ; $98BC - Unknown opcode
	.byte $FB			  ; $98BD - Unknown opcode
	PLA					  ; $98BE: 68	  
	STA $7B				  ; $98BF: 85 7B   
	BRK					  ; $98C1: 00	  
	.byte $12			  ; $98C2 - Unknown opcode
	.byte $4F			  ; $98C3 - Unknown opcode
	BCS $98CE				; $98C4: B0 08   
	BRK					  ; $98C6: 00	  
	SBC $D3				  ; $98C7: E5 D3	; Arithmetic
	BNE $9933				; $98C9: D0 68   
	TAX					  ; $98CB: AA	  
	CLC					  ; $98CC: 18	  
	RTS					  ; $98CD: 60	  
loc_98CE:
	LDA $7B				  ; $98CE: A5 7B   
	PHA					  ; $98D0: 48	  
	BRK					  ; $98D1: 00	  
	SBC $D3				  ; $98D2: E5 D3	; Arithmetic
	CMP ($68),Y			  ; $98D4: D1 68   
	STA $7B				  ; $98D6: 85 7B   
	PLA					  ; $98D8: 68	  
	STA $7C				  ; $98D9: 85 7C   
	LDX $7B				  ; $98DB: A6 7B   
	BRK					  ; $98DD: 00	  
	AND ($A3),Y			  ; $98DE: 31 A3   
	CLC					  ; $98E0: 18	  
	RTS					  ; $98E1: 60	  
	JSR $9916				; $98E2: 20 16 99 ; -> sub_9916
	BRK					  ; $98E5: 00	  
	.byte $1B			  ; $98E6 - Unknown opcode
	.byte $0F			  ; $98E7 - Unknown opcode
	AND #$03				 ; $98E8: 29 03   
	BEQ $98EF				; $98EA: F0 03   
	JMP $96DB				; $98EC: 4C DB 96
loc_98EF:
	JSR $BF2E				; $98EF: 20 2E BF ; -> sub_BF2E
	DEY					  ; $98F2: 88	  
	BRK					  ; $98F3: 00	  
	.byte $F2			  ; $98F4 - Unknown opcode
	.byte $D3			  ; $98F5 - Unknown opcode
	.byte $04			  ; $98F6 - Unknown opcode
	JMP $90DB				; $98F7: 4C DB 90
	BRK					  ; $98FA: 00	  
	ASL system_flags		 ; $98FB: 06 1F   
	BCC $9906				; $98FD: 90 07   
	BRK					  ; $98FF: 00	  
	.byte $12			  ; $9900 - Unknown opcode
	.byte $A3			  ; $9901 - Unknown opcode
	LDX #$7E				 ; $9902: A2 7E   
	BNE $990B				; $9904: D0 05   
loc_9906:
	BRK					  ; $9906: 00	  
	CLC					  ; $9907: 18	  
	.byte $53			  ; $9908 - Unknown opcode
	LDX #$72				 ; $9909: A2 72   
loc_990B:
	LDA #$05				 ; $990B: A9 05   
	JSR $C827				; $990D: 20 27 C8 ; Call to fixed bank
	JSR $993A				; $9910: 20 3A 99 ; -> sub_993A
	JMP $98EF				; $9913: 4C EF 98

; ---- Subroutine at $9916 (Bank 17) ----
sub_9916:
	LDA #$0B				 ; $9916: A9 0B   
	BRK					  ; $9918: 00	  
	.byte $17			  ; $9919 - Unknown opcode
	.byte $0F			  ; $991A - Unknown opcode
	CLC					  ; $991B: 18	  
	ADC #$40				 ; $991C: 69 40	; Arithmetic
	TAY					  ; $991E: A8	  
	BRK					  ; $991F: 00	  
	ASL system_flags		 ; $9920: 06 1F   
	BCC $992C				; $9922: 90 08   
	BRK					  ; $9924: 00	  
	.byte $12			  ; $9925 - Unknown opcode
	.byte $A3			  ; $9926 - Unknown opcode
	TYA					  ; $9927: 98	  
	LDX #$7E				 ; $9928: A2 7E   
	BNE $9932				; $992A: D0 06   
loc_992C:
	BRK					  ; $992C: 00	  
	CLC					  ; $992D: 18	  
	.byte $53			  ; $992E - Unknown opcode
	TYA					  ; $992F: 98	  
	LDX #$72				 ; $9930: A2 72   
loc_9932:
	JSR $C827				; $9932: 20 27 C8 ; Call to fixed bank
	LDA #$40				 ; $9935: A9 40   
	JSR $C851				; $9937: 20 51 C8 ; Call to fixed bank

; ---- Subroutine at $993A (Bank 17) ----
sub_993A:
	LDA tmp0,X			   ; $993A: B5 00   
	LDY tmp1,X			   ; $993C: B4 01   
	STA $7361				; $993E: 8D 61 73
	STY $7362				; $9941: 8C 62 73
	RTS					  ; $9944: 60	  
	JSR $96DB				; $9945: 20 DB 96 ; -> sub_96DB
	LDA #$60				 ; $9948: A9 60   
	JSR $996D				; $994A: 20 6D 99 ; -> sub_996D
	BCC $996C				; $994D: 90 1D   
	JMP $9CC3				; $994F: 4C C3 9C
	JSR $96DB				; $9952: 20 DB 96 ; -> sub_96DB
	LDA #$60				 ; $9955: A9 60   
	JSR $996D				; $9957: 20 6D 99 ; -> sub_996D
	BCC $996C				; $995A: 90 10   
	JMP $AFEA				; $995C: 4C EA AF
	JSR $96DB				; $995F: 20 DB 96 ; -> sub_96DB
	LDA #$20				 ; $9962: A9 20   
	JSR $996D				; $9964: 20 6D 99 ; -> sub_996D
	BCC $996C				; $9967: 90 03   
	JMP $AFF4				; $9969: 4C F4 AF
loc_996C:
	RTS					  ; $996C: 60	  

; ---- Subroutine at $996D (Bank 17) ----
sub_996D:
	STA tmp0				 ; $996D: 85 00   
	LDA $72E7				; $996F: AD E7 72
	LSR					  ; $9972: 4A	  
	BCS $997E				; $9973: B0 09   
	BRK					  ; $9975: 00	  
	.byte $1B			  ; $9976 - Unknown opcode
	.byte $0F			  ; $9977 - Unknown opcode
	CMP tmp0				 ; $9978: C5 00   
	BCS $997E				; $997A: B0 02   
	SEC					  ; $997C: 38	  
	RTS					  ; $997D: 60	  
loc_997E:
	CLC					  ; $997E: 18	  
	RTS					  ; $997F: 60	  

; ---- Subroutine at $9980 (Bank 17) ----
sub_9980:
	TXA					  ; $9980: 8A	  
	PHA					  ; $9981: 48	  
	BRK					  ; $9982: 00	  
	.byte $67			  ; $9983 - Unknown opcode
	.byte $73			  ; $9984 - Unknown opcode
	TAX					  ; $9985: AA	  
	BRK					  ; $9986: 00	  
	.byte $1C			  ; $9987 - Unknown opcode
	.byte $73			  ; $9988 - Unknown opcode
	STA $0E				  ; $9989: 85 0E   
	LDA $73				  ; $998B: A5 73   
	STA $0F				  ; $998D: 85 0F   
	JSR $9A33				; $998F: 20 33 9A ; -> sub_9A33
	LDX #$0C				 ; $9992: A2 0C   
	LDA #$0C				 ; $9994: A9 0C   
	JSR $C851				; $9996: 20 51 C8 ; Call to fixed bank
	SEC					  ; $9999: 38	  
	LDA $0E				  ; $999A: A5 0E   
	SBC $0C				  ; $999C: E5 0C	; Arithmetic
	LDA $0F				  ; $999E: A5 0F   
	SBC $0D				  ; $99A0: E5 0D	; Arithmetic
	BCC $99B0				; $99A2: 90 0C   
	LDA $0F				  ; $99A4: A5 0F   
	BNE $99D8				; $99A6: D0 30   
	LDA $0E				  ; $99A8: A5 0E   
	CMP #$08				 ; $99AA: C9 08	; Compare with 8
	BCS $99D8				; $99AC: B0 2A   
	BCC $9A16				; $99AE: 90 66   
loc_99B0:
	LDA $0C				  ; $99B0: A5 0C   
	BRK					  ; $99B2: 00	  
	.byte $17			  ; $99B3 - Unknown opcode
	.byte $0F			  ; $99B4 - Unknown opcode
	STA $7361				; $99B5: 8D 61 73
	LDA #$00				 ; $99B8: A9 00   
	STA $7362				; $99BA: 8D 62 73
	PLA					  ; $99BD: 68	  
	TAX					  ; $99BE: AA	  
	RTS					  ; $99BF: 60	  

; ---- Subroutine at $99C0 (Bank 17) ----
sub_99C0:
	TXA					  ; $99C0: 8A	  
	PHA					  ; $99C1: 48	  
	BRK					  ; $99C2: 00	  
	ASL $B3,X				; $99C3: 16 B3   
	STA $0E				  ; $99C5: 85 0E   
	LDA $7F				  ; $99C7: A5 7F   
	STA $0F				  ; $99C9: 85 0F   
	JSR $9A33				; $99CB: 20 33 9A ; -> sub_9A33
	LDA $0F				  ; $99CE: A5 0F   
	BNE $99D8				; $99D0: D0 06   
	LDA $0E				  ; $99D2: A5 0E   
	CMP #$08				 ; $99D4: C9 08	; Compare with 8
	BCC $9A16				; $99D6: 90 3E   
loc_99D8:
	LDA $0F				  ; $99D8: A5 0F   
	STA $0B				  ; $99DA: 85 0B   
	LSR					  ; $99DC: 4A	  
	STA $0D				  ; $99DD: 85 0D   
	LDA $0E				  ; $99DF: A5 0E   
	STA $0A				  ; $99E1: 85 0A   
	ROR					  ; $99E3: 6A	  
	STA $0C				  ; $99E4: 85 0C   
	LSR $0D				  ; $99E6: 46 0D   
	ROR $0C				  ; $99E8: 66 0C   
	INC $0C				  ; $99EA: E6 0C   
	BNE $99F0				; $99EC: D0 02   
	INC $0D				  ; $99EE: E6 0D   
loc_99F0:
	BRK					  ; $99F0: 00	  
	.byte $1B			  ; $99F1 - Unknown opcode
	.byte $0F			  ; $99F2 - Unknown opcode
	LDX #$0C				 ; $99F3: A2 0C   
	JSR $C827				; $99F5: 20 27 C8 ; Call to fixed bank
	LDA #$07				 ; $99F8: A9 07   
	LDX #$0A				 ; $99FA: A2 0A   
	JSR $C827				; $99FC: 20 27 C8 ; Call to fixed bank
	LDA #$08				 ; $99FF: A9 08   
	JSR $C851				; $9A01: 20 51 C8 ; Call to fixed bank
	CLC					  ; $9A04: 18	  
	LDA $0D				  ; $9A05: A5 0D   
	ADC $0A				  ; $9A07: 65 0A	; Arithmetic
	STA $7361				; $9A09: 8D 61 73
	LDA #$00				 ; $9A0C: A9 00   
	ADC $0B				  ; $9A0E: 65 0B	; Arithmetic
	STA $7362				; $9A10: 8D 62 73
	PLA					  ; $9A13: 68	  
	TAX					  ; $9A14: AA	  
	RTS					  ; $9A15: 60	  
loc_9A16:
	LDA #$03				 ; $9A16: A9 03   
	BRK					  ; $9A18: 00	  
	.byte $17			  ; $9A19 - Unknown opcode
	.byte $0F			  ; $9A1A - Unknown opcode
	CLC					  ; $9A1B: 18	  
	ADC $0E				  ; $9A1C: 65 0E	; Arithmetic
	STA $7361				; $9A1E: 8D 61 73
	DEC $7361				; $9A21: CE 61 73
	BPL $9A2B				; $9A24: 10 05   
	LDA #$00				 ; $9A26: A9 00   
	STA $7361				; $9A28: 8D 61 73
loc_9A2B:
	LDA $0F				  ; $9A2B: A5 0F   
	STA $7362				; $9A2D: 8D 62 73
	PLA					  ; $9A30: 68	  
	TAX					  ; $9A31: AA	  
	RTS					  ; $9A32: 60	  

; ---- Subroutine at $9A33 (Bank 17) ----
sub_9A33:
	LSR $0F				  ; $9A33: 46 0F   
	ROR $0E				  ; $9A35: 66 0E   
	BRK					  ; $9A37: 00	  
	ASL system_flags		 ; $9A38: 06 1F   
	BCS $9A61				; $9A3A: B0 25   
	BRK					  ; $9A3C: 00	  
	.byte $03			  ; $9A3D - Unknown opcode
	.byte $1F			  ; $9A3E - Unknown opcode
	CMP #$82				 ; $9A3F: C9 82	; Compare with 130
	BNE $9A59				; $9A41: D0 16   
	BRK					  ; $9A43: 00	  
	BPL $9AB9				; $9A44: 10 73   
	LDA #$0B				 ; $9A46: A9 0B   
	BRK					  ; $9A48: 00	  
	.byte $13			  ; $9A49 - Unknown opcode
	.byte $0F			  ; $9A4A - Unknown opcode
	CLC					  ; $9A4B: 18	  
	ADC $72				  ; $9A4C: 65 72	; Arithmetic
	STA $72				  ; $9A4E: 85 72   
	BCC $9A54				; $9A50: 90 02   
	INC $73				  ; $9A52: E6 73   
loc_9A54:
	LDX $73				  ; $9A54: A6 73   
	JMP $9A66				; $9A56: 4C 66 9A
loc_9A59:
	BRK					  ; $9A59: 00	  
	CLC					  ; $9A5A: 18	  
	.byte $73			  ; $9A5B - Unknown opcode
	LDX $73				  ; $9A5C: A6 73   
	JMP $9A66				; $9A5E: 4C 66 9A
loc_9A61:
	BRK					  ; $9A61: 00	  
	.byte $12			  ; $9A62 - Unknown opcode
	.byte $B3			  ; $9A63 - Unknown opcode
	LDX $7F				  ; $9A64: A6 7F   
loc_9A66:
	STA $0C				  ; $9A66: 85 0C   
	STX $0D				  ; $9A68: 86 0D   
	SEC					  ; $9A6A: 38	  
	LDA $0C				  ; $9A6B: A5 0C   
	SBC $0E				  ; $9A6D: E5 0E	; Arithmetic
	STA $0E				  ; $9A6F: 85 0E   
	LDA $0D				  ; $9A71: A5 0D   
	SBC $0F				  ; $9A73: E5 0F	; Arithmetic
	STA $0F				  ; $9A75: 85 0F   
	BCS $9A7F				; $9A77: B0 06   
	LDA #$00				 ; $9A79: A9 00   
	STA $0E				  ; $9A7B: 85 0E   
	STA $0F				  ; $9A7D: 85 0F   
loc_9A7F:
	LSR $0F				  ; $9A7F: 46 0F   
	ROR $0E				  ; $9A81: 66 0E   
	RTS					  ; $9A83: 60	  

; ---- Subroutine at $9A84 (Bank 17) ----
sub_9A84:
	LDA tmp0,Y			   ; $9A84: B9 00 00
	STA $6E14				; $9A87: 8D 14 6E
	LDA tmp1,Y			   ; $9A8A: B9 01 00
	STA $6E15				; $9A8D: 8D 15 6E
	TYA					  ; $9A90: 98	  
	PHA					  ; $9A91: 48	  
	LDY #$18				 ; $9A92: A0 18   
	LDA #$00				 ; $9A94: A9 00   
	STA $6E16				; $9A96: 8D 16 6E
	STA $6E11				; $9A99: 8D 11 6E
	STA $6E12				; $9A9C: 8D 12 6E
	STA $6E13				; $9A9F: 8D 13 6E
loc_9AA2:
	ASL tmp0,X			   ; $9AA2: 16 00   
	ROL tmp1,X			   ; $9AA4: 36 01   
	ROL tmp2,X			   ; $9AA6: 36 02   
	ROL $6E11				; $9AA8: 2E 11 6E
	ROL $6E12				; $9AAB: 2E 12 6E
	ROL $6E13				; $9AAE: 2E 13 6E
	INC tmp0,X			   ; $9AB1: F6 00   
	LDA $6E11				; $9AB3: AD 11 6E
	SEC					  ; $9AB6: 38	  
	SBC $6E14				; $9AB7: ED 14 6E ; Arithmetic
	PHA					  ; $9ABA: 48	  
	LDA $6E12				; $9ABB: AD 12 6E
	SBC $6E15				; $9ABE: ED 15 6E ; Arithmetic
	PHA					  ; $9AC1: 48	  
	LDA $6E13				; $9AC2: AD 13 6E
	SBC $6E16				; $9AC5: ED 16 6E ; Arithmetic
loc_9AC8:
	BCS $9AD1				; $9AC8: B0 07   
	PLA					  ; $9ACA: 68	  
	PLA					  ; $9ACB: 68	  
	DEC tmp0,X			   ; $9ACC: D6 00   
	JMP $9ADC				; $9ACE: 4C DC 9A
loc_9AD1:
	STA $6E13				; $9AD1: 8D 13 6E
	PLA					  ; $9AD4: 68	  
	STA $6E12				; $9AD5: 8D 12 6E
	PLA					  ; $9AD8: 68	  
	STA $6E11				; $9AD9: 8D 11 6E
loc_9ADC:
	DEY					  ; $9ADC: 88	  
	BNE $9AA2				; $9ADD: D0 C3   
	PLA					  ; $9ADF: 68	  
	TAY					  ; $9AE0: A8	  
	RTS					  ; $9AE1: 60	  
	BRK					  ; $9AE2: 00	  
	ORA (system_flags,X)	 ; $9AE3: 01 1F   
	BRK					  ; $9AE5: 00	  
	.byte $07			  ; $9AE6 - Unknown opcode
	.byte $3F			  ; $9AE7 - Unknown opcode
	JMP $90DB				; $9AE8: 4C DB 90
	BRK					  ; $9AEB: 00	  
	.byte $1B			  ; $9AEC - Unknown opcode
	.byte $0F			  ; $9AED - Unknown opcode
	CMP #$80				 ; $9AEE: C9 80	; Compare with 128
	BCC $9B0B				; $9AF0: 90 19   
	BRK					  ; $9AF2: 00	  
	BEQ $9AC8				; $9AF3: F0 D3   
	.byte $23			  ; $9AF5 - Unknown opcode
	LDA $7363				; $9AF6: AD 63 73
	BMI $9B02				; $9AF9: 30 07   
	TAX					  ; $9AFB: AA	  
	JSR $9980				; $9AFC: 20 80 99 ; -> sub_9980
	JMP $9B08				; $9AFF: 4C 08 9B
loc_9B02:
	AND #$07				 ; $9B02: 29 07   
	TAX					  ; $9B04: AA	  
	JSR $99C0				; $9B05: 20 C0 99 ; -> sub_99C0
loc_9B08:
	JMP $90DB				; $9B08: 4C DB 90
loc_9B0B:
	RTS					  ; $9B0B: 60	  
	BRK					  ; $9B0C: 00	  
	.byte $07			  ; $9B0D - Unknown opcode
	.byte $1F			  ; $9B0E - Unknown opcode
	BCC $9B29				; $9B0F: 90 18   
	TXA					  ; $9B11: 8A	  
	PHA					  ; $9B12: 48	  
	JSR $BF2E				; $9B13: 20 2E BF ; -> sub_BF2E
	.byte $9E			  ; $9B16 - Unknown opcode
	PLA					  ; $9B17: 68	  
	TAX					  ; $9B18: AA	  
	JSR $91F3				; $9B19: 20 F3 91 ; -> sub_91F3
	BRK					  ; $9B1C: 00	  
	.byte $1A			  ; $9B1D - Unknown opcode
	.byte $2F			  ; $9B1E - Unknown opcode
	BCS $9B28				; $9B1F: B0 07   
	BRK					  ; $9B21: 00	  
	INC $D3				  ; $9B22: E6 D3   
	ORA (tmp0,X)			 ; $9B24: 01 00   
	.byte $23			  ; $9B26 - Unknown opcode
	.byte $2F			  ; $9B27 - Unknown opcode
loc_9B28:
	RTS					  ; $9B28: 60	  
loc_9B29:
	BVC $9B7E				; $9B29: 50 53   
	BRK					  ; $9B2B: 00	  
	.byte $3B			  ; $9B2C - Unknown opcode
	.byte $93			  ; $9B2D - Unknown opcode
	ORA ($90,X)			  ; $9B2E: 01 90   
	.byte $0B			  ; $9B30 - Unknown opcode
	CMP #$B7				 ; $9B31: C9 B7	; Compare with 183
	BNE $9B3C				; $9B33: D0 07   
	BRK					  ; $9B35: 00	  
	.byte $1B			  ; $9B36 - Unknown opcode
	.byte $0F			  ; $9B37 - Unknown opcode
	CMP #$80				 ; $9B38: C9 80	; Compare with 128
	BCC $9B4B				; $9B3A: 90 0F   
loc_9B3C:
	JSR $9272				; $9B3C: 20 72 92 ; -> sub_9272
	JSR $BF2E				; $9B3F: 20 2E BF ; -> sub_BF2E
	.byte $9E			  ; $9B42 - Unknown opcode
	BRK					  ; $9B43: 00	  
	INC $D3				  ; $9B44: E6 D3   
	.byte $02			  ; $9B46 - Unknown opcode
	BRK					  ; $9B47: 00	  
	.byte $23			  ; $9B48 - Unknown opcode
	.byte $2F			  ; $9B49 - Unknown opcode
	RTS					  ; $9B4A: 60	  
loc_9B4B:
	BRK					  ; $9B4B: 00	  
	INC $D3				  ; $9B4C: E6 D3   
	.byte $03			  ; $9B4E - Unknown opcode
	BRK					  ; $9B4F: 00	  
	.byte $23			  ; $9B50 - Unknown opcode
	.byte $2F			  ; $9B51 - Unknown opcode
	RTS					  ; $9B52: 60	  
	BRK					  ; $9B53: 00	  
	.byte $07			  ; $9B54 - Unknown opcode
	.byte $1F			  ; $9B55 - Unknown opcode
	BCC $9B6E				; $9B56: 90 16   
	TXA					  ; $9B58: 8A	  
	PHA					  ; $9B59: 48	  
	JSR $B91C				; $9B5A: 20 1C B9 ; -> sub_B91C
	JSR $9204				; $9B5D: 20 04 92 ; -> sub_9204
	BRK					  ; $9B60: 00	  
	INC $D3				  ; $9B61: E6 D3   
	ORA (tmp0,X)			 ; $9B63: 01 00   
	.byte $23			  ; $9B65 - Unknown opcode
	.byte $2F			  ; $9B66 - Unknown opcode
	PLA					  ; $9B67: 68	  
	TAX					  ; $9B68: AA	  
	BRK					  ; $9B69: 00	  
	.byte $2B			  ; $9B6A - Unknown opcode
	.byte $C3			  ; $9B6B - Unknown opcode
	.byte $0F			  ; $9B6C - Unknown opcode
	RTS					  ; $9B6D: 60	  
loc_9B6E:
	BVC $9B7E				; $9B6E: 50 0E   
	BRK					  ; $9B70: 00	  
	.byte $2B			  ; $9B71 - Unknown opcode
	.byte $73			  ; $9B72 - Unknown opcode
	CMP #$08				 ; $9B73: C9 08	; Compare with 8
	BCS $9B7F				; $9B75: B0 08   
	BRK					  ; $9B77: 00	  
	INC $D3				  ; $9B78: E6 D3   
	.byte $03			  ; $9B7A - Unknown opcode
	BRK					  ; $9B7B: 00	  
	.byte $23			  ; $9B7C - Unknown opcode
	.byte $2F			  ; $9B7D - Unknown opcode
loc_9B7E:
	RTS					  ; $9B7E: 60	  
loc_9B7F:
	LDA #$80				 ; $9B7F: A9 80   
	BRK					  ; $9B81: 00	  
	INC $D3				  ; $9B82: E6 D3   
	.byte $03			  ; $9B84 - Unknown opcode
	RTS					  ; $9B85: 60	  
	BRK					  ; $9B86: 00	  
	.byte $07			  ; $9B87 - Unknown opcode
	.byte $1F			  ; $9B88 - Unknown opcode
	BCC $9BD9				; $9B89: 90 4E   
	BRK					  ; $9B8B: 00	  
	.byte $1B			  ; $9B8C - Unknown opcode
	.byte $0F			  ; $9B8D - Unknown opcode
	CMP #$80				 ; $9B8E: C9 80	; Compare with 128
	BCC $9BCA				; $9B90: 90 38   
loc_9B92:
	BRK					  ; $9B92: 00	  
	BRK					  ; $9B93: 00	  
	.byte $A3			  ; $9B94 - Unknown opcode
	LDX $7F				  ; $9B95: A6 7F   
	JSR $9C2B				; $9B97: 20 2B 9C ; -> sub_9C2B
	STA $7C				  ; $9B9A: 85 7C   
	STX $7D				  ; $9B9C: 86 7D   
	LDX $7B				  ; $9B9E: A6 7B   
	BRK					  ; $9BA0: 00	  
	.byte $03			  ; $9BA1 - Unknown opcode
	.byte $A3			  ; $9BA2 - Unknown opcode
	LDA $7E				  ; $9BA3: A5 7E   
	STA $7361				; $9BA5: 8D 61 73
	LDA $7F				  ; $9BA8: A5 7F   
	STA $7362				; $9BAA: 8D 62 73
	BRK					  ; $9BAD: 00	  
	BRK					  ; $9BAE: 00	  
	.byte $A3			  ; $9BAF - Unknown opcode
	LDX $7B				  ; $9BB0: A6 7B   
	ORA $7F				  ; $9BB2: 05 7F   
	BEQ $9BCA				; $9BB4: F0 14   
	LDA $7B				  ; $9BB6: A5 7B   
	PHA					  ; $9BB8: 48	  
	JSR $BF2E				; $9BB9: 20 2E BF ; -> sub_BF2E
	.byte $87			  ; $9BBC - Unknown opcode
	BRK					  ; $9BBD: 00	  
	ROR $D3				  ; $9BBE: 66 D3   
	ORA ($68,X)			  ; $9BC0: 01 68   
	TAX					  ; $9BC2: AA	  
	JSR $9286				; $9BC3: 20 86 92 ; -> sub_9286
	BRK					  ; $9BC6: 00	  
	.byte $07			  ; $9BC7 - Unknown opcode
	.byte $2F			  ; $9BC8 - Unknown opcode
	RTS					  ; $9BC9: 60	  
loc_9BCA:
	JSR $B91C				; $9BCA: 20 1C B9 ; -> sub_B91C
	JSR $9204				; $9BCD: 20 04 92 ; -> sub_9204
	JSR $BF2E				; $9BD0: 20 2E BF ; -> sub_BF2E
	.byte $9F			  ; $9BD3 - Unknown opcode
	BRK					  ; $9BD4: 00	  
	INC $D3				  ; $9BD5: E6 D3   
	.byte $04			  ; $9BD7 - Unknown opcode
	RTS					  ; $9BD8: 60	  
loc_9BD9:
	BVC $9C1F				; $9BD9: 50 44   
	BRK					  ; $9BDB: 00	  
	.byte $1B			  ; $9BDC - Unknown opcode
	.byte $0F			  ; $9BDD - Unknown opcode
	CMP #$80				 ; $9BDE: C9 80	; Compare with 128
	BCC $9C14				; $9BE0: 90 32   
loc_9BE2:
	BRK					  ; $9BE2: 00	  
	BRK					  ; $9BE3: 00	  
	.byte $53			  ; $9BE4 - Unknown opcode
	LDX $73				  ; $9BE5: A6 73   
	JSR $9C2B				; $9BE7: 20 2B 9C ; -> sub_9C2B
	STA $6F				  ; $9BEA: 85 6F   
	STX $70				  ; $9BEC: 86 70   
	BRK					  ; $9BEE: 00	  
	.byte $04			  ; $9BEF - Unknown opcode
	.byte $33			  ; $9BF0 - Unknown opcode
	STA $7361				; $9BF1: 8D 61 73
	LDA $73				  ; $9BF4: A5 73   
	STA $7362				; $9BF6: 8D 62 73
	BRK					  ; $9BF9: 00	  
	BRK					  ; $9BFA: 00	  
	.byte $33			  ; $9BFB - Unknown opcode
	LDX $6E				  ; $9BFC: A6 6E   
	ORA $73				  ; $9BFE: 05 73   
	BEQ $9C14				; $9C00: F0 12   
	JSR $BF2E				; $9C02: 20 2E BF ; -> sub_BF2E
	TXA					  ; $9C05: 8A	  
	BRK					  ; $9C06: 00	  
	ROR $D3				  ; $9C07: 66 D3   
	.byte $02			  ; $9C09 - Unknown opcode
	BRK					  ; $9C0A: 00	  
	.byte $02			  ; $9C0B - Unknown opcode
	.byte $4F			  ; $9C0C - Unknown opcode
	BRK					  ; $9C0D: 00	  
	.byte $27			  ; $9C0E - Unknown opcode
	.byte $0F			  ; $9C0F - Unknown opcode
	BRK					  ; $9C10: 00	  
	.byte $07			  ; $9C11 - Unknown opcode
	.byte $2F			  ; $9C12 - Unknown opcode
	RTS					  ; $9C13: 60	  
loc_9C14:
	JSR $9272				; $9C14: 20 72 92 ; -> sub_9272
	JSR $BF2E				; $9C17: 20 2E BF ; -> sub_BF2E
	.byte $9F			  ; $9C1A - Unknown opcode
	BRK					  ; $9C1B: 00	  
	INC $D3				  ; $9C1C: E6 D3   
	.byte $04			  ; $9C1E - Unknown opcode
loc_9C1F:
	RTS					  ; $9C1F: 60	  
	BRK					  ; $9C20: 00	  
	TXA					  ; $9C21: 8A	  
	.byte $FB			  ; $9C22 - Unknown opcode
	BRK					  ; $9C23: 00	  
	.byte $07			  ; $9C24 - Unknown opcode
	.byte $1F			  ; $9C25 - Unknown opcode
	BCC $9BE2				; $9C26: 90 BA   
	JMP $9B92				; $9C28: 4C 92 9B

; ---- Subroutine at $9C2B (Bank 17) ----
sub_9C2B:
	STA $72				  ; $9C2B: 85 72   
	STA $7E				  ; $9C2D: 85 7E   
	STX $73				  ; $9C2F: 86 73   
	STX $7F				  ; $9C31: 86 7F   
	LDA #$0D				 ; $9C33: A9 0D   
	LDX #$7E				 ; $9C35: A2 7E   
	JSR $C827				; $9C37: 20 27 C8 ; Call to fixed bank
	LDA $7F				  ; $9C3A: A5 7F   
	STA $7E				  ; $9C3C: 85 7E   
	LDA $72				  ; $9C3E: A5 72   
	SEC					  ; $9C40: 38	  
	SBC $7E				  ; $9C41: E5 7E	; Arithmetic
	STA $7E				  ; $9C43: 85 7E   
	LDA $73				  ; $9C45: A5 73   
	SBC #$00				 ; $9C47: E9 00	; Arithmetic
	STA $7F				  ; $9C49: 85 7F   
	LDA $7E				  ; $9C4B: A5 7E   
	LDX $7F				  ; $9C4D: A6 7F   
	RTS					  ; $9C4F: 60	  
	BRK					  ; $9C50: 00	  
	ASL system_flags		 ; $9C51: 06 1F   
	BCC $9C69				; $9C53: 90 14   
	JSR $B91C				; $9C55: 20 1C B9 ; -> sub_B91C
	BRK					  ; $9C58: 00	  
	ASL system_flags		 ; $9C59: 06 1F   
	BRK					  ; $9C5B: 00	  
	AND #$C3				 ; $9C5C: 29 C3   
	ASL $0790				; $9C5E: 0E 90 07
	JSR $9204				; $9C61: 20 04 92 ; -> sub_9204
	BRK					  ; $9C64: 00	  
	INX					  ; $9C65: E8	  
	.byte $D3			  ; $9C66 - Unknown opcode
	ORA $60,X				; $9C67: 15 60   
loc_9C69:
	JSR $9272				; $9C69: 20 72 92 ; -> sub_9272
	BRK					  ; $9C6C: 00	  
	INX					  ; $9C6D: E8	  
	.byte $D3			  ; $9C6E - Unknown opcode
	ORA $20,X				; $9C6F: 15 20   
	.byte $F7			  ; $9C71 - Unknown opcode
	.byte $A3			  ; $9C72 - Unknown opcode
	RTS					  ; $9C73: 60	  
loc_9C74:
	STA $8E				  ; $9C74: 85 8E   
	BRK					  ; $9C76: 00	  
	.byte $07			  ; $9C77 - Unknown opcode
	.byte $1F			  ; $9C78 - Unknown opcode
	BCC $9C90				; $9C79: 90 15   
	JSR $9C9B				; $9C7B: 20 9B 9C ; -> sub_9C9B
	LDA $8E				  ; $9C7E: A5 8E   
	BPL $9C88				; $9C80: 10 06   
	JSR $91F3				; $9C82: 20 F3 91 ; -> sub_91F3
	JMP $9C8B				; $9C85: 4C 8B 9C
loc_9C88:
	JSR $9204				; $9C88: 20 04 92 ; -> sub_9204
loc_9C8B:
	BRK					  ; $9C8B: 00	  
	INC $D3				  ; $9C8C: E6 D3   
	ORA ($60,X)			  ; $9C8E: 01 60   
loc_9C90:
	JSR $9C9B				; $9C90: 20 9B 9C ; -> sub_9C9B
	JSR $9272				; $9C93: 20 72 92 ; -> sub_9272
	BRK					  ; $9C96: 00	  
	INC $D3				  ; $9C97: E6 D3   
	.byte $02			  ; $9C99 - Unknown opcode
	RTS					  ; $9C9A: 60	  

; ---- Subroutine at $9C9B (Bank 17) ----
sub_9C9B:
	LDA $8E				  ; $9C9B: A5 8E   
	AND #$7F				 ; $9C9D: 29 7F   
	BEQ $9CAC				; $9C9F: F0 0B   
	ORA #$80				 ; $9CA1: 09 80   
	TAY					  ; $9CA3: A8	  
	TXA					  ; $9CA4: 8A	  
	PHA					  ; $9CA5: 48	  
	TYA					  ; $9CA6: 98	  
	JSR $BF55				; $9CA7: 20 55 BF ; -> sub_BF55
	PLA					  ; $9CAA: 68	  
	TAX					  ; $9CAB: AA	  
loc_9CAC:
	RTS					  ; $9CAC: 60	  
	BRK					  ; $9CAD: 00	  
	.byte $07			  ; $9CAE - Unknown opcode
	.byte $1F			  ; $9CAF - Unknown opcode
	BCC $9CBC				; $9CB0: 90 0A   
	LDA $6E45				; $9CB2: AD 45 6E
	CMP #$B4				 ; $9CB5: C9 B4	; Compare with 180
	BNE $9CBC				; $9CB7: D0 03   
	BRK					  ; $9CB9: 00	  
	ORA $A94F,Y			  ; $9CBA: 19 4F A9
	.byte $13			  ; $9CBD - Unknown opcode
	LDX #$03				 ; $9CBE: A2 03   
	JMP $9D4F				; $9CC0: 4C 4F 9D

; ---- Subroutine at $9CC3 (Bank 17) ----
sub_9CC3:
	LDA #$10				 ; $9CC3: A9 10   
	LDX #$00				 ; $9CC5: A2 00   
	JMP $9D4F				; $9CC7: 4C 4F 9D
	LDA #$14				 ; $9CCA: A9 14   
	LDX #$04				 ; $9CCC: A2 04   
	JMP $9D4F				; $9CCE: 4C 4F 9D
	BRK					  ; $9CD1: 00	  
	.byte $07			  ; $9CD2 - Unknown opcode
	.byte $1F			  ; $9CD3 - Unknown opcode
	BCS $9CF7				; $9CD4: B0 21   
	LDY #$80				 ; $9CD6: A0 80   
	BRK					  ; $9CD8: 00	  
	.byte $3B			  ; $9CD9 - Unknown opcode
	.byte $93			  ; $9CDA - Unknown opcode
	ORA ($90,X)			  ; $9CDB: 01 90   
	.byte $04			  ; $9CDD - Unknown opcode
	CMP #$B7				 ; $9CDE: C9 B7	; Compare with 183
	BEQ $9CEE				; $9CE0: F0 0C   
	BRK					  ; $9CE2: 00	  
	.byte $3B			  ; $9CE3 - Unknown opcode
	.byte $93			  ; $9CE4 - Unknown opcode
	.byte $03			  ; $9CE5 - Unknown opcode
	BCC $9CF7				; $9CE6: 90 0F   
	CMP #$CD				 ; $9CE8: C9 CD	; Compare with 205
	BNE $9CF7				; $9CEA: D0 0B   
	LDY #$55				 ; $9CEC: A0 55   
loc_9CEE:
	STY tmp0				 ; $9CEE: 84 00   
	BRK					  ; $9CF0: 00	  
	.byte $1B			  ; $9CF1 - Unknown opcode
	.byte $0F			  ; $9CF2 - Unknown opcode
	CMP tmp0				 ; $9CF3: C5 00   
	BCC $9CFE				; $9CF5: 90 07   
loc_9CF7:
	LDA #$12				 ; $9CF7: A9 12   
	LDX #$02				 ; $9CF9: A2 02   
	JMP $9D4F				; $9CFB: 4C 4F 9D
loc_9CFE:
	BRK					  ; $9CFE: 00	  
	INC $D3				  ; $9CFF: E6 D3   
	.byte $03			  ; $9D01 - Unknown opcode
	RTS					  ; $9D02: 60	  
	LDA #$16				 ; $9D03: A9 16   
	LDX #$06				 ; $9D05: A2 06   
	JMP $9D4F				; $9D07: 4C 4F 9D
	LDA #$17				 ; $9D0A: A9 17   
	LDX #$07				 ; $9D0C: A2 07   
	JMP $9D4F				; $9D0E: 4C 4F 9D
	BRK					  ; $9D11: 00	  
	.byte $F2			  ; $9D12 - Unknown opcode
	.byte $D3			  ; $9D13 - Unknown opcode
	.byte $04			  ; $9D14 - Unknown opcode
	LDA #$15				 ; $9D15: A9 15   
	LDX #$05				 ; $9D17: A2 05   
	JMP $9D4F				; $9D19: 4C 4F 9D
	BRK					  ; $9D1C: 00	  
	.byte $07			  ; $9D1D - Unknown opcode
	.byte $1F			  ; $9D1E - Unknown opcode
	BCS $9D23				; $9D1F: B0 02   
	BVC $9D2A				; $9D21: 50 07   
loc_9D23:
	LDA #$06				 ; $9D23: A9 06   
	LDX #$0D				 ; $9D25: A2 0D   
	JMP $9D6E				; $9D27: 4C 6E 9D
loc_9D2A:
	RTS					  ; $9D2A: 60	  
	LDA #$10				 ; $9D2B: A9 10   
	LDX #$00				 ; $9D2D: A2 00   
	JMP $9D6E				; $9D2F: 4C 6E 9D
	BRK					  ; $9D32: 00	  
	.byte $07			  ; $9D33 - Unknown opcode
	.byte $1F			  ; $9D34 - Unknown opcode
	BCS $9D2A				; $9D35: B0 F3   
	LDA #$18				 ; $9D37: A9 18   
	JSR $9D4F				; $9D39: 20 4F 9D ; -> sub_9D4F
	LDA #$4F				 ; $9D3C: A9 4F   
	JSR $B808				; $9D3E: 20 08 B8 ; -> sub_B808
	RTS					  ; $9D41: 60	  
	LDA $72E7				; $9D42: AD E7 72
	ORA #$10				 ; $9D45: 09 10   
	STA $72E7				; $9D47: 8D E7 72
	BRK					  ; $9D4A: 00	  
	INC $D3				  ; $9D4B: E6 D3   
	ORA ($60,X)			  ; $9D4D: 01 60   

; ---- Subroutine at $9D4F (Bank 17) ----
sub_9D4F:
	STA $6F				  ; $9D4F: 85 6F   
	STX $7C				  ; $9D51: 86 7C   
	BRK					  ; $9D53: 00	  
	.byte $07			  ; $9D54 - Unknown opcode
	.byte $1F			  ; $9D55 - Unknown opcode
	BCC $9D62				; $9D56: 90 0A   
	BRK					  ; $9D58: 00	  
	ROL					  ; $9D59: 2A	  
	.byte $A3			  ; $9D5A - Unknown opcode
	BCC $9D6D				; $9D5B: 90 10   
	BRK					  ; $9D5D: 00	  
	INC $D3				  ; $9D5E: E6 D3   
	ORA ($60,X)			  ; $9D60: 01 60   
loc_9D62:
	BVC $9D6D				; $9D62: 50 09   
	BRK					  ; $9D64: 00	  
	.byte $44			  ; $9D65 - Unknown opcode
	.byte $53			  ; $9D66 - Unknown opcode
	BCC $9D6D				; $9D67: 90 04   
	BRK					  ; $9D69: 00	  
	INC $D3				  ; $9D6A: E6 D3   
	.byte $02			  ; $9D6C - Unknown opcode
loc_9D6D:
	RTS					  ; $9D6D: 60	  
loc_9D6E:
	STA $6F				  ; $9D6E: 85 6F   
	STX $7C				  ; $9D70: 86 7C   
	BRK					  ; $9D72: 00	  
	.byte $07			  ; $9D73 - Unknown opcode
	.byte $1F			  ; $9D74 - Unknown opcode
	BCC $9D81				; $9D75: 90 0A   
	BRK					  ; $9D77: 00	  
	.byte $2B			  ; $9D78 - Unknown opcode
	.byte $A3			  ; $9D79 - Unknown opcode
	BCC $9D8B				; $9D7A: 90 0F   
	BRK					  ; $9D7C: 00	  
	INC $D3				  ; $9D7D: E6 D3   
	ORA ($60,X)			  ; $9D7F: 01 60   
loc_9D81:
	BRK					  ; $9D81: 00	  
	EOR $53				  ; $9D82: 45 53   
	BCC $9D8B				; $9D84: 90 05   
	BRK					  ; $9D86: 00	  
	INC $D3				  ; $9D87: E6 D3   
	.byte $02			  ; $9D89 - Unknown opcode
	RTS					  ; $9D8A: 60	  
loc_9D8B:
	BRK					  ; $9D8B: 00	  
	CPX $D3				  ; $9D8C: E4 D3   
	.byte $1A			  ; $9D8E - Unknown opcode
	RTS					  ; $9D8F: 60	  
	BRK					  ; $9D90: 00	  
	.byte $07			  ; $9D91 - Unknown opcode
	.byte $1F			  ; $9D92 - Unknown opcode
	BCC $9D9E				; $9D93: 90 09   
	BRK					  ; $9D95: 00	  
	ROL					  ; $9D96: 2A	  
	.byte $C3			  ; $9D97 - Unknown opcode
	ORA (tmp0),Y			 ; $9D98: 11 00   
	INC $D3				  ; $9D9A: E6 D3   
	ORA ($60,X)			  ; $9D9C: 01 60   
loc_9D9E:
	BRK					  ; $9D9E: 00	  
	.byte $44			  ; $9D9F - Unknown opcode
	.byte $93			  ; $9DA0 - Unknown opcode
	.byte $80			  ; $9DA1 - Unknown opcode
	BRK					  ; $9DA2: 00	  
	.byte $62			  ; $9DA3 - Unknown opcode
	.byte $23			  ; $9DA4 - Unknown opcode
	EOR ($C9,X)			  ; $9DA5: 41 C9   
	ORA ($D0,X)			  ; $9DA7: 01 D0   
	ORA tmp0				 ; $9DA9: 05 00   
	INC $D3				  ; $9DAB: E6 D3   
	ORA ($60,X)			  ; $9DAD: 01 60   
	BRK					  ; $9DAF: 00	  
	INC $D3				  ; $9DB0: E6 D3   
	.byte $02			  ; $9DB2 - Unknown opcode
	RTS					  ; $9DB3: 60	  
	BRK					  ; $9DB4: 00	  
	ASL system_flags		 ; $9DB5: 06 1F   
	STA $C7				  ; $9DB7: 85 C7   
	BCC $9DF6				; $9DB9: 90 3B   
	LDA $7363				; $9DBB: AD 63 73
	BMI $9DE6				; $9DBE: 30 26   
	STA $7D				  ; $9DC0: 85 7D   
	BRK					  ; $9DC2: 00	  
	.byte $07			  ; $9DC3 - Unknown opcode
	.byte $1F			  ; $9DC4 - Unknown opcode
	BVC $9DE6				; $9DC5: 50 1F   
	BRK					  ; $9DC7: 00	  
	ASL system_flags		 ; $9DC8: 06 1F   
	BRK					  ; $9DCA: 00	  
	AND #$C3				 ; $9DCB: 29 C3   
	.byte $0C			  ; $9DCD - Unknown opcode
	BCC $9DD6				; $9DCE: 90 06   
	LDA $7F				  ; $9DD0: A5 7F   
	CMP $7D				  ; $9DD2: C5 7D   
	BEQ $9E47				; $9DD4: F0 71   
loc_9DD6:
	LDA $7D				  ; $9DD6: A5 7D   
	JSR $9E4C				; $9DD8: 20 4C 9E ; -> sub_9E4C
	STA $C4				  ; $9DDB: 85 C4   
	BRK					  ; $9DDD: 00	  
	.byte $0F			  ; $9DDE - Unknown opcode
	.byte $4F			  ; $9DDF - Unknown opcode
	BCS $9DE7				; $9DE0: B0 05   
loc_9DE2:
	BRK					  ; $9DE2: 00	  
	CPX $D3				  ; $9DE3: E4 D3   
	.byte $1A			  ; $9DE5 - Unknown opcode
loc_9DE6:
	RTS					  ; $9DE6: 60	  
loc_9DE7:
	BRK					  ; $9DE7: 00	  
	INC $D3				  ; $9DE8: E6 D3   
	ORA (tmp0,X)			 ; $9DEA: 01 00   
	ASL system_flags		 ; $9DEC: 06 1F   
	BRK					  ; $9DEE: 00	  
	ROL					  ; $9DEF: 2A	  
	.byte $C3			  ; $9DF0 - Unknown opcode
	.byte $0C			  ; $9DF1 - Unknown opcode
	JSR $9E5C				; $9DF2: 20 5C 9E ; -> sub_9E5C
	RTS					  ; $9DF5: 60	  
loc_9DF6:
	LDA $7363				; $9DF6: AD 63 73
	BMI $9DE2				; $9DF9: 30 E7   
	STA $70				  ; $9DFB: 85 70   
	BRK					  ; $9DFD: 00	  
	.byte $07			  ; $9DFE - Unknown opcode
	.byte $1F			  ; $9DFF - Unknown opcode
	BVC $9DE2				; $9E00: 50 E0   
	BRK					  ; $9E02: 00	  
	.byte $2B			  ; $9E03 - Unknown opcode
	.byte $53			  ; $9E04 - Unknown opcode
	CMP #$08				 ; $9E05: C9 08	; Compare with 8
	BCS $9DE2				; $9E07: B0 D9   
	BRK					  ; $9E09: 00	  
	ASL system_flags		 ; $9E0A: 06 1F   
	BRK					  ; $9E0C: 00	  
	LSR $93				  ; $9E0D: 46 93   
	.byte $1C			  ; $9E0F - Unknown opcode
	BCS $9E1F				; $9E10: B0 0D   
	BRK					  ; $9E12: 00	  
	ORA (system_flags,X)	 ; $9E13: 01 1F   
	CMP $70				  ; $9E15: C5 70   
	BEQ $9E47				; $9E17: F0 2E   
	BRK					  ; $9E19: 00	  
	ASL system_flags		 ; $9E1A: 06 1F   
	JMP $9E3B				; $9E1C: 4C 3B 9E
loc_9E1F:
	BRK					  ; $9E1F: 00	  
	ORA (system_flags,X)	 ; $9E20: 01 1F   
	CMP $70				  ; $9E22: C5 70   
	BNE $9E32				; $9E24: D0 0C   
	BRK					  ; $9E26: 00	  
	ASL system_flags		 ; $9E27: 06 1F   
	BRK					  ; $9E29: 00	  
	.byte $44			  ; $9E2A - Unknown opcode
	.byte $93			  ; $9E2B - Unknown opcode
	.byte $1C			  ; $9E2C - Unknown opcode
	BRK					  ; $9E2D: 00	  
	INC $D3				  ; $9E2E: E6 D3   
	.byte $02			  ; $9E30 - Unknown opcode
	RTS					  ; $9E31: 60	  
loc_9E32:
	BRK					  ; $9E32: 00	  
	ASL system_flags		 ; $9E33: 06 1F   
	LDA $73				  ; $9E35: A5 73   
	CMP $70				  ; $9E37: C5 70   
	BEQ $9E47				; $9E39: F0 0C   
loc_9E3B:
	BRK					  ; $9E3B: 00	  
	.byte $44			  ; $9E3C - Unknown opcode
	.byte $93			  ; $9E3D - Unknown opcode
	.byte $1C			  ; $9E3E - Unknown opcode
	JSR $9E91				; $9E3F: 20 91 9E ; -> sub_9E91
	BRK					  ; $9E42: 00	  
loc_9E43:
	INC $D3				  ; $9E43: E6 D3   
	ORA ($60,X)			  ; $9E45: 01 60   
loc_9E47:
	BRK					  ; $9E47: 00	  
	INC $D3				  ; $9E48: E6 D3   
	.byte $03			  ; $9E4A - Unknown opcode
	RTS					  ; $9E4B: 60	  

; ---- Subroutine at $9E4C (Bank 17) ----
sub_9E4C:
	BRK					  ; $9E4C: 00	  
	.byte $67			  ; $9E4D - Unknown opcode
	.byte $73			  ; $9E4E - Unknown opcode
	TAX					  ; $9E4F: AA	  
	BRK					  ; $9E50: 00	  
	.byte $2B			  ; $9E51 - Unknown opcode
	.byte $53			  ; $9E52 - Unknown opcode
	BNE $9E5B				; $9E53: D0 06   
	BRK					  ; $9E55: 00	  
	AND #$53				 ; $9E56: 29 53   
	ASL					  ; $9E58: 0A	  
	ASL					  ; $9E59: 0A	  
	ASL					  ; $9E5A: 0A	  
loc_9E5B:
	RTS					  ; $9E5B: 60	  

; ---- Subroutine at $9E5C (Bank 17) ----
sub_9E5C:
	LDA $7D				  ; $9E5C: A5 7D   
	PHA					  ; $9E5E: 48	  
	LDA #$FF				 ; $9E5F: A9 FF   
	STA $7D				  ; $9E61: 85 7D   
	LDX $7B				  ; $9E63: A6 7B   
	BRK					  ; $9E65: 00	  
	ORA $B3,X				; $9E66: 15 B3   
	BRK					  ; $9E68: 00	  
	ORA ($A3),Y			  ; $9E69: 11 A3   
	BRK					  ; $9E6B: 00	  
	ORA $68A3,Y			  ; $9E6C: 19 A3 68
	STA $7D				  ; $9E6F: 85 7D   
	BRK					  ; $9E71: 00	  
	.byte $67			  ; $9E72 - Unknown opcode
	.byte $73			  ; $9E73 - Unknown opcode
	TAX					  ; $9E74: AA	  
	BRK					  ; $9E75: 00	  
	CLC					  ; $9E76: 18	  
	.byte $73			  ; $9E77 - Unknown opcode
	JSR $9ED6				; $9E78: 20 D6 9E ; -> sub_9ED6
	BRK					  ; $9E7B: 00	  
	.byte $14			  ; $9E7C - Unknown opcode
	.byte $B3			  ; $9E7D - Unknown opcode
	BRK					  ; $9E7E: 00	  
	.byte $1C			  ; $9E7F - Unknown opcode
	.byte $33			  ; $9E80 - Unknown opcode
	JSR $9ED6				; $9E81: 20 D6 9E ; -> sub_9ED6
	BRK					  ; $9E84: 00	  
	CLC					  ; $9E85: 18	  
	.byte $B3			  ; $9E86 - Unknown opcode
	BRK					  ; $9E87: 00	  
	.byte $14			  ; $9E88 - Unknown opcode
	.byte $33			  ; $9E89 - Unknown opcode
	JSR $9ED6				; $9E8A: 20 D6 9E ; -> sub_9ED6
	BRK					  ; $9E8D: 00	  
	BPL $9E43				; $9E8E: 10 B3   
	RTS					  ; $9E90: 60	  

; ---- Subroutine at $9E91 (Bank 17) ----
sub_9E91:
	LDA $70				  ; $9E91: A5 70   
	PHA					  ; $9E93: 48	  
	LDA #$FF				 ; $9E94: A9 FF   
	STA $70				  ; $9E96: 85 70   
	LDX $6E				  ; $9E98: A6 6E   
	BRK					  ; $9E9A: 00	  
	.byte $1A			  ; $9E9B - Unknown opcode
	.byte $73			  ; $9E9C - Unknown opcode
	BRK					  ; $9E9D: 00	  
	ASL $53,X				; $9E9E: 16 53   
	BRK					  ; $9EA0: 00	  
	ASL $8653,X			  ; $9EA1: 1E 53 86
	BRK					  ; $9EA4: 00	  
	PLA					  ; $9EA5: 68	  
	STA $70				  ; $9EA6: 85 70   
	BRK					  ; $9EA8: 00	  
	.byte $67			  ; $9EA9 - Unknown opcode
	.byte $73			  ; $9EAA - Unknown opcode
	TAX					  ; $9EAB: AA	  
	STA tmp1				 ; $9EAC: 85 01   
	TAX					  ; $9EAE: AA	  
	BRK					  ; $9EAF: 00	  
	CLC					  ; $9EB0: 18	  
	.byte $53			  ; $9EB1 - Unknown opcode
	JSR $9ECF				; $9EB2: 20 CF 9E ; -> sub_9ECF
	BRK					  ; $9EB5: 00	  
	ORA $A673,Y			  ; $9EB6: 19 73 A6
	ORA (tmp0,X)			 ; $9EB9: 01 00   
	.byte $1C			  ; $9EBB - Unknown opcode
	.byte $53			  ; $9EBC - Unknown opcode
	JSR $9ECF				; $9EBD: 20 CF 9E ; -> sub_9ECF
	BRK					  ; $9EC0: 00	  
	ORA $A673,X			  ; $9EC1: 1D 73 A6
	ORA (tmp0,X)			 ; $9EC4: 01 00   
	.byte $14			  ; $9EC6 - Unknown opcode
	.byte $53			  ; $9EC7 - Unknown opcode
	JSR $9ECF				; $9EC8: 20 CF 9E ; -> sub_9ECF
	BRK					  ; $9ECB: 00	  
	ORA $73,X				; $9ECC: 15 73   
	RTS					  ; $9ECE: 60	  

; ---- Subroutine at $9ECF (Bank 17) ----
sub_9ECF:
	LDX $73				  ; $9ECF: A6 73   
	STX $70				  ; $9ED1: 86 70   
	LDX tmp0				 ; $9ED3: A6 00   
	RTS					  ; $9ED5: 60	  

; ---- Subroutine at $9ED6 (Bank 17) ----
sub_9ED6:
	LDX $73				  ; $9ED6: A6 73   
	STX $7D				  ; $9ED8: 86 7D   
	LDX $7B				  ; $9EDA: A6 7B   
	RTS					  ; $9EDC: 60	  

; ---- Subroutine at $9EDD (Bank 17) ----
sub_9EDD:
	BRK					  ; $9EDD: 00	  
	.byte $07			  ; $9EDE - Unknown opcode
	.byte $1F			  ; $9EDF - Unknown opcode
	BCC $9EF3				; $9EE0: 90 11   
	BRK					  ; $9EE2: 00	  
	ORA $3F				  ; $9EE3: 05 3F   
	STA $7C				  ; $9EE5: 85 7C   
	BRK					  ; $9EE7: 00	  
	ASL					  ; $9EE8: 0A	  
	.byte $A3			  ; $9EE9 - Unknown opcode
	PHA					  ; $9EEA: 48	  
	BRK					  ; $9EEB: 00	  
	INC $D3				  ; $9EEC: E6 D3   
	ORA ($68,X)			  ; $9EEE: 01 68   
	JMP $9F03				; $9EF0: 4C 03 9F
loc_9EF3:
	BVC $9F13				; $9EF3: 50 1E   
	BRK					  ; $9EF5: 00	  
	ORA $3F				  ; $9EF6: 05 3F   
	STA $6F				  ; $9EF8: 85 6F   
	BRK					  ; $9EFA: 00	  
	.byte $0B			  ; $9EFB - Unknown opcode
	.byte $53			  ; $9EFC - Unknown opcode
	PHA					  ; $9EFD: 48	  
	BRK					  ; $9EFE: 00	  
	INC $D3				  ; $9EFF: E6 D3   
	.byte $02			  ; $9F01 - Unknown opcode
	PLA					  ; $9F02: 68	  
loc_9F03:
	STA tmp0				 ; $9F03: 85 00   
	BRK					  ; $9F05: 00	  
	ASL system_flags		 ; $9F06: 06 1F   
	LDA tmp0				 ; $9F08: A5 00   
	BCC $9F10				; $9F0A: 90 04   
	BRK					  ; $9F0C: 00	  
	ORA #$B3				 ; $9F0D: 09 B3   
	RTS					  ; $9F0F: 60	  
loc_9F10:
	BRK					  ; $9F10: 00	  
	ORA #$73				 ; $9F11: 09 73   
loc_9F13:
	RTS					  ; $9F13: 60	  
	BRK					  ; $9F14: 00	  
	.byte $07			  ; $9F15 - Unknown opcode
	.byte $1F			  ; $9F16 - Unknown opcode
	BCC $9F1F				; $9F17: 90 06   
	BRK					  ; $9F19: 00	  
	.byte $17			  ; $9F1A - Unknown opcode
	.byte $B3			  ; $9F1B - Unknown opcode
	JMP $9F36				; $9F1C: 4C 36 9F
loc_9F1F:
	BVC $9F63				; $9F1F: 50 42   
	BRK					  ; $9F21: 00	  
	.byte $1B			  ; $9F22 - Unknown opcode
	.byte $73			  ; $9F23 - Unknown opcode
	JMP $9F53				; $9F24: 4C 53 9F
	BRK					  ; $9F27: 00	  
	.byte $07			  ; $9F28 - Unknown opcode
	.byte $1F			  ; $9F29 - Unknown opcode
	BCC $9F47				; $9F2A: 90 1B   
	BRK					  ; $9F2C: 00	  
	ASL $A3,X				; $9F2D: 16 A3   
	LSR $7F				  ; $9F2F: 46 7F   
	LDA $7E				  ; $9F31: A5 7E   
	ROR					  ; $9F33: 6A	  
	ORA #$01				 ; $9F34: 09 01   
loc_9F36:
	STA $7C				  ; $9F36: 85 7C   
	LDA $7F				  ; $9F38: A5 7F   
	STA $7D				  ; $9F3A: 85 7D   
	JSR $A01F				; $9F3C: 20 1F A0 ; -> sub_A01F
	BRK					  ; $9F3F: 00	  
	ORA $00A3,Y			  ; $9F40: 19 A3 00
	INC $D3				  ; $9F43: E6 D3   
	ORA ($60,X)			  ; $9F45: 01 60   
loc_9F47:
	BVC $9F63				; $9F47: 50 1A   
	BRK					  ; $9F49: 00	  
	.byte $1C			  ; $9F4A - Unknown opcode
	.byte $53			  ; $9F4B - Unknown opcode
	LSR $73				  ; $9F4C: 46 73   
	LDA $72				  ; $9F4E: A5 72   
	ROR					  ; $9F50: 6A	  
	ORA #$01				 ; $9F51: 09 01   
loc_9F53:
	STA $6F				  ; $9F53: 85 6F   
	LDA $73				  ; $9F55: A5 73   
	STA $70				  ; $9F57: 85 70   
	JSR $A011				; $9F59: 20 11 A0 ; -> sub_A011
	BRK					  ; $9F5C: 00	  
	ASL $0053,X			  ; $9F5D: 1E 53 00
	INC $D3				  ; $9F60: E6 D3   
	.byte $02			  ; $9F62 - Unknown opcode
loc_9F63:
	RTS					  ; $9F63: 60	  
	BRK					  ; $9F64: 00	  
	.byte $07			  ; $9F65 - Unknown opcode
	.byte $1F			  ; $9F66 - Unknown opcode
	BCC $9F78				; $9F67: 90 0F   
	BRK					  ; $9F69: 00	  
	.byte $17			  ; $9F6A - Unknown opcode
	.byte $B3			  ; $9F6B - Unknown opcode
	TXA					  ; $9F6C: 8A	  
	PHA					  ; $9F6D: 48	  
	LDX #$7E				 ; $9F6E: A2 7E   
	JSR $9F89				; $9F70: 20 89 9F ; -> sub_9F89
	PLA					  ; $9F73: 68	  
	TAX					  ; $9F74: AA	  
	JMP $9F9B				; $9F75: 4C 9B 9F
loc_9F78:
	BVC $9F63				; $9F78: 50 E9   
	BRK					  ; $9F7A: 00	  
	.byte $1B			  ; $9F7B - Unknown opcode
	.byte $73			  ; $9F7C - Unknown opcode
	TXA					  ; $9F7D: 8A	  
	PHA					  ; $9F7E: 48	  
	LDX #$72				 ; $9F7F: A2 72   
	JSR $9F89				; $9F81: 20 89 9F ; -> sub_9F89
	PLA					  ; $9F84: 68	  
	TAX					  ; $9F85: AA	  
	JMP $9FB3				; $9F86: 4C B3 9F

; ---- Subroutine at $9F89 (Bank 17) ----
sub_9F89:
	LDA #$03				 ; $9F89: A9 03   
	JSR $C827				; $9F8B: 20 27 C8 ; Call to fixed bank
	LDA #$02				 ; $9F8E: A9 02   
	JMP $C851				; $9F90: 4C 51 C8
	BRK					  ; $9F93: 00	  
	.byte $07			  ; $9F94 - Unknown opcode
	.byte $1F			  ; $9F95 - Unknown opcode
	BCC $9FAE				; $9F96: 90 16   
	BRK					  ; $9F98: 00	  
	.byte $17			  ; $9F99 - Unknown opcode
	.byte $A3			  ; $9F9A - Unknown opcode
loc_9F9B:
	LDA $7E				  ; $9F9B: A5 7E   
	STA $7C				  ; $9F9D: 85 7C   
	LDA $7F				  ; $9F9F: A5 7F   
	STA $7D				  ; $9FA1: 85 7D   
	JSR $A01F				; $9FA3: 20 1F A0 ; -> sub_A01F
	BRK					  ; $9FA6: 00	  
	CLC					  ; $9FA7: 18	  
	.byte $A3			  ; $9FA8 - Unknown opcode
	BRK					  ; $9FA9: 00	  
	INC $D3				  ; $9FAA: E6 D3   
	ORA ($60,X)			  ; $9FAC: 01 60   
loc_9FAE:
	BVC $9F63				; $9FAE: 50 B3   
	BRK					  ; $9FB0: 00	  
	.byte $1B			  ; $9FB1 - Unknown opcode
	.byte $53			  ; $9FB2 - Unknown opcode
loc_9FB3:
	LDA $72				  ; $9FB3: A5 72   
	STA $6F				  ; $9FB5: 85 6F   
	LDA $73				  ; $9FB7: A5 73   
	STA $70				  ; $9FB9: 85 70   
	JSR $A011				; $9FBB: 20 11 A0 ; -> sub_A011
	BRK					  ; $9FBE: 00	  
	ORA $0053,X			  ; $9FBF: 1D 53 00
	INC $D3				  ; $9FC2: E6 D3   
	ORA ($60,X)			  ; $9FC4: 01 60   
	BRK					  ; $9FC6: 00	  
	.byte $07			  ; $9FC7 - Unknown opcode
	.byte $1F			  ; $9FC8 - Unknown opcode
	BCC $9FDB				; $9FC9: 90 10   
	BRK					  ; $9FCB: 00	  
	.byte $0F			  ; $9FCC - Unknown opcode
	.byte $B3			  ; $9FCD - Unknown opcode
	STA $7C				  ; $9FCE: 85 7C   
	JSR $A01F				; $9FD0: 20 1F A0 ; -> sub_A01F
	BRK					  ; $9FD3: 00	  
	BPL $9F79				; $9FD4: 10 A3   
	BRK					  ; $9FD6: 00	  
	INC $D3				  ; $9FD7: E6 D3   
	ORA ($60,X)			  ; $9FD9: 01 60   
loc_9FDB:
	BVC $9FEC				; $9FDB: 50 0F   
	BRK					  ; $9FDD: 00	  
	.byte $12			  ; $9FDE - Unknown opcode
	.byte $73			  ; $9FDF - Unknown opcode
	STA $6F				  ; $9FE0: 85 6F   
	JSR $A011				; $9FE2: 20 11 A0 ; -> sub_A011
	BRK					  ; $9FE5: 00	  
	ORA $53,X				; $9FE6: 15 53   
	BRK					  ; $9FE8: 00	  
	INC $D3				  ; $9FE9: E6 D3   
	ORA ($60,X)			  ; $9FEB: 01 60   
	BRK					  ; $9FED: 00	  
	.byte $07			  ; $9FEE - Unknown opcode
	.byte $1F			  ; $9FEF - Unknown opcode
	BCC $9FFF				; $9FF0: 90 0D   
	BRK					  ; $9FF2: 00	  
	ORA $3F				  ; $9FF3: 05 3F   
	STA $7C				  ; $9FF5: 85 7C   
	BRK					  ; $9FF7: 00	  
	.byte $02			  ; $9FF8 - Unknown opcode
	.byte $A3			  ; $9FF9 - Unknown opcode
	BRK					  ; $9FFA: 00	  
	INC $D3				  ; $9FFB: E6 D3   
	ORA ($60,X)			  ; $9FFD: 01 60   
loc_9FFF:
	BVC $A010				; $9FFF: 50 0F   
	BRK					  ; $A001: 00	  
	ORA $3F				  ; $A002: 05 3F   
	STA $6F				  ; $A004: 85 6F   
	BRK					  ; $A006: 00	  
	.byte $02			  ; $A007 - Unknown opcode
	.byte $53			  ; $A008 - Unknown opcode
	BRK					  ; $A009: 00	  
	INC $D3				  ; $A00A: E6 D3   
	ORA (tmp0,X)			 ; $A00C: 01 00   
	.byte $27			  ; $A00E - Unknown opcode
	.byte $0F			  ; $A00F - Unknown opcode
loc_A010:
	RTS					  ; $A010: 60	  

; ---- Subroutine at $A011 (Bank 17) ----
sub_A011:
	TXA					  ; $A011: 8A	  
	PHA					  ; $A012: 48	  
	JSR $AC5C				; $A013: 20 5C AC ; -> sub_AC5C
	BCC $A01C				; $A016: 90 04   
	ASL $6F				  ; $A018: 06 6F   
	ROL $70				  ; $A01A: 26 70   
loc_A01C:
	PLA					  ; $A01C: 68	  
	TAX					  ; $A01D: AA	  
	RTS					  ; $A01E: 60	  

; ---- Subroutine at $A01F (Bank 17) ----
sub_A01F:
	TXA					  ; $A01F: 8A	  
	PHA					  ; $A020: 48	  
	JSR $AC5C				; $A021: 20 5C AC ; -> sub_AC5C
	BCC $A01C				; $A024: 90 F6   
	ASL $7C				  ; $A026: 06 7C   
	ROL $7D				  ; $A028: 26 7D   
	PLA					  ; $A02A: 68	  
	TAX					  ; $A02B: AA	  
	RTS					  ; $A02C: 60	  
	LDA #$06				 ; $A02D: A9 06   
	STA $71				  ; $A02F: 85 71   
	JSR $A0B7				; $A031: 20 B7 A0 ; -> sub_A0B7
	BCC $A03B				; $A034: 90 05   
loc_A036:
	BRK					  ; $A036: 00	  
	CPX $D3				  ; $A037: E4 D3   
	.byte $1A			  ; $A039 - Unknown opcode
	RTS					  ; $A03A: 60	  
loc_A03B:
	BRK					  ; $A03B: 00	  
	.byte $1B			  ; $A03C - Unknown opcode
	.byte $0F			  ; $A03D - Unknown opcode
	CMP #$80				 ; $A03E: C9 80	; Compare with 128
	BCC $A050				; $A040: 90 0E   
	BRK					  ; $A042: 00	  
	INC $D3				  ; $A043: E6 D3   
	.byte $03			  ; $A045 - Unknown opcode
	RTS					  ; $A046: 60	  
loc_A047:
	LDA #$05				 ; $A047: A9 05   
	STA $71				  ; $A049: 85 71   
	JSR $A0B7				; $A04B: 20 B7 A0 ; -> sub_A0B7
	BCS $A036				; $A04E: B0 E6   
loc_A050:
	BRK					  ; $A050: 00	  
	.byte $07			  ; $A051 - Unknown opcode
	.byte $1F			  ; $A052 - Unknown opcode
	BCC $A078				; $A053: 90 23   
	JSR $A0C6				; $A055: 20 C6 A0 ; -> sub_A0C6
	BCC $A036				; $A058: 90 DC   
	BRK					  ; $A05A: 00	  
	ROL					  ; $A05B: 2A	  
	.byte $C3			  ; $A05C - Unknown opcode
	ASL $71A5				; $A05D: 0E A5 71
	CMP #$05				 ; $A060: C9 05	; Compare with 5
	BNE $A06A				; $A062: D0 06   
	BRK					  ; $A064: 00	  
	ORA $B3				  ; $A065: 05 B3   
	JMP $A06D				; $A067: 4C 6D A0
loc_A06A:
	BRK					  ; $A06A: 00	  
	ASL $B3				  ; $A06B: 06 B3   
loc_A06D:
	JSR $A0DC				; $A06D: 20 DC A0 ; -> sub_A0DC
	JSR $A0EF				; $A070: 20 EF A0 ; -> sub_A0EF
	BRK					  ; $A073: 00	  
	INC $D3				  ; $A074: E6 D3   
	ORA ($60,X)			  ; $A076: 01 60   
loc_A078:
	BVC $A08D				; $A078: 50 13   
	BRK					  ; $A07A: 00	  
	.byte $44			  ; $A07B - Unknown opcode
	.byte $93			  ; $A07C - Unknown opcode
	.byte $07			  ; $A07D - Unknown opcode
	LDA $71				  ; $A07E: A5 71   
	BRK					  ; $A080: 00	  
	BRK					  ; $A081: 00	  
	.byte $13			  ; $A082 - Unknown opcode
	JSR $A0EF				; $A083: 20 EF A0 ; -> sub_A0EF
	BRK					  ; $A086: 00	  
	.byte $27			  ; $A087 - Unknown opcode
	.byte $0F			  ; $A088 - Unknown opcode
	BRK					  ; $A089: 00	  
	INC $D3				  ; $A08A: E6 D3   
	ORA ($60,X)			  ; $A08C: 01 60   
	BRK					  ; $A08E: 00	  
	ORA (system_flags,X)	 ; $A08F: 01 1F   
	CMP $7363				; $A091: CD 63 73
	BEQ $A0A8				; $A094: F0 12   
	BRK					  ; $A096: 00	  
	.byte $07			  ; $A097 - Unknown opcode
	.byte $1F			  ; $A098 - Unknown opcode
	BCS $A0A9				; $A099: B0 0E   
	BRK					  ; $A09B: 00	  
	LSR $93				  ; $A09C: 46 93   
	.byte $07			  ; $A09E - Unknown opcode
	BCC $A047				; $A09F: 90 A6   
	BRK					  ; $A0A1: 00	  
	ORA $73				  ; $A0A2: 05 73   
	BRK					  ; $A0A4: 00	  
	INC $D3				  ; $A0A5: E6 D3   
	.byte $02			  ; $A0A7 - Unknown opcode
loc_A0A8:
	RTS					  ; $A0A8: 60	  
loc_A0A9:
	BRK					  ; $A0A9: 00	  
	AND #$C3				 ; $A0AA: 29 C3   
	ASL $9890				; $A0AC: 0E 90 98
	BRK					  ; $A0AF: 00	  
	ORA $A3				  ; $A0B0: 05 A3   
	BRK					  ; $A0B2: 00	  
	INC $D3				  ; $A0B3: E6 D3   
	.byte $02			  ; $A0B5 - Unknown opcode
	RTS					  ; $A0B6: 60	  

; ---- Subroutine at $A0B7 (Bank 17) ----
sub_A0B7:
	BRK					  ; $A0B7: 00	  
	.byte $07			  ; $A0B8 - Unknown opcode
	.byte $1F			  ; $A0B9 - Unknown opcode
	BCC $A0C1				; $A0BA: 90 05   
	BRK					  ; $A0BC: 00	  
	AND #$C3				 ; $A0BD: 29 C3   
	ASL $0060				; $A0BF: 0E 60 00
	LSR $93				  ; $A0C2: 46 93   
	.byte $07			  ; $A0C4 - Unknown opcode
	RTS					  ; $A0C5: 60	  

; ---- Subroutine at $A0C6 (Bank 17) ----
sub_A0C6:
	BRK					  ; $A0C6: 00	  
	.byte $07			  ; $A0C7 - Unknown opcode
	.byte $1F			  ; $A0C8 - Unknown opcode
	TXA					  ; $A0C9: 8A	  
	PHA					  ; $A0CA: 48	  
	STA $C7				  ; $A0CB: 85 C7   
	BRK					  ; $A0CD: 00	  
	AND $AAB3				; $A0CE: 2D B3 AA
	LDA $6E45,X			  ; $A0D1: BD 45 6E
	STA $C4				  ; $A0D4: 85 C4   
	BRK					  ; $A0D6: 00	  
	ORA $4F				  ; $A0D7: 05 4F   
	PLA					  ; $A0D9: 68	  
	TAX					  ; $A0DA: AA	  
	RTS					  ; $A0DB: 60	  

; ---- Subroutine at $A0DC (Bank 17) ----
sub_A0DC:
	TXA					  ; $A0DC: 8A	  
	PHA					  ; $A0DD: 48	  
	STA $C7				  ; $A0DE: 85 C7   
	BRK					  ; $A0E0: 00	  
	AND $AAB3				; $A0E1: 2D B3 AA
	LDA $6E45,X			  ; $A0E4: BD 45 6E
	STA $C4				  ; $A0E7: 85 C4   
	BRK					  ; $A0E9: 00	  
	ASL $4F				  ; $A0EA: 06 4F   
	PLA					  ; $A0EC: 68	  
	TAX					  ; $A0ED: AA	  
	RTS					  ; $A0EE: 60	  

; ---- Subroutine at $A0EF (Bank 17) ----
sub_A0EF:
	LDA $7363				; $A0EF: AD 63 73
	BRK					  ; $A0F2: 00	  
	ORA #$1F				 ; $A0F3: 09 1F   
	BCC $A0FC				; $A0F5: 90 05   
	LDA #$02				 ; $A0F7: A9 02   
	BRK					  ; $A0F9: 00	  
	PHP					  ; $A0FA: 08	  
	.byte $1F			  ; $A0FB - Unknown opcode
loc_A0FC:
	RTS					  ; $A0FC: 60	  
	JSR $A108				; $A0FD: 20 08 A1 ; -> sub_A108
	BCC $A107				; $A100: 90 05   
loc_A102:
	JSR $A10E				; $A102: 20 0E A1 ; -> sub_A10E
	BCS $A102				; $A105: B0 FB   
loc_A107:
	RTS					  ; $A107: 60	  

; ---- Subroutine at $A108 (Bank 17) ----
sub_A108:
	JSR $A10E				; $A108: 20 0E A1 ; -> sub_A10E
	BCC $A141				; $A10B: 90 34   
	RTS					  ; $A10D: 60	  

; ---- Subroutine at $A10E (Bank 17) ----
sub_A10E:
	JSR $A11A				; $A10E: 20 1A A1 ; -> sub_A11A
	BCS $A14C				; $A111: B0 39   
	RTS					  ; $A113: 60	  
	JSR $A11A				; $A114: 20 1A A1 ; -> sub_A11A
	BCS $A15A				; $A117: B0 41   
	RTS					  ; $A119: 60	  

; ---- Subroutine at $A11A (Bank 17) ----
sub_A11A:
	JSR $A1B4				; $A11A: 20 B4 A1 ; -> sub_A1B4
	BCC $A107				; $A11D: 90 E8   
	STX $C7				  ; $A11F: 86 C7   
	TXA					  ; $A121: 8A	  
	BRK					  ; $A122: 00	  
	ASL system_flags		 ; $A123: 06 1F   
	BRK					  ; $A125: 00	  
	AND $85B3				; $A126: 2D B3 85
	.byte $7C			  ; $A129 - Unknown opcode
	TAX					  ; $A12A: AA	  
	LDA $6E45,X			  ; $A12B: BD 45 6E
	JMP $A175				; $A12E: 4C 75 A1
	JSR $A13C				; $A131: 20 3C A1 ; -> sub_A13C
	BCC $A13B				; $A134: 90 05   
loc_A136:
	JSR $A147				; $A136: 20 47 A1 ; -> sub_A147
	BCS $A136				; $A139: B0 FB   
loc_A13B:
	RTS					  ; $A13B: 60	  

; ---- Subroutine at $A13C (Bank 17) ----
sub_A13C:
	JSR $A161				; $A13C: 20 61 A1 ; -> sub_A161
	BCS $A14C				; $A13F: B0 0B   
loc_A141:
	BRK					  ; $A141: 00	  
	INX					  ; $A142: E8	  
	.byte $D3			  ; $A143 - Unknown opcode
	.byte $1A			  ; $A144 - Unknown opcode
	CLC					  ; $A145: 18	  
	RTS					  ; $A146: 60	  

; ---- Subroutine at $A147 (Bank 17) ----
sub_A147:
	JSR $A161				; $A147: 20 61 A1 ; -> sub_A161
	BCC $A154				; $A14A: 90 08   
loc_A14C:
	JSR $A0EF				; $A14C: 20 EF A0 ; -> sub_A0EF
	BRK					  ; $A14F: 00	  
	INC $D3				  ; $A150: E6 D3   
	ORA ($38,X)			  ; $A152: 01 38   
loc_A154:
	RTS					  ; $A154: 60	  
	JSR $A161				; $A155: 20 61 A1 ; -> sub_A161
	BCC $A154				; $A158: 90 FA   
loc_A15A:
	BRK					  ; $A15A: 00	  
	INC $D3				  ; $A15B: E6 D3   
	ORA ($4C,X)			  ; $A15D: 01 4C   
	BNE $A102				; $A15F: D0 A1   

; ---- Subroutine at $A161 (Bank 17) ----
sub_A161:
	BRK					  ; $A161: 00	  
	.byte $03			  ; $A162 - Unknown opcode
	.byte $1F			  ; $A163 - Unknown opcode
	SEC					  ; $A164: 38	  
	SBC #$5C				 ; $A165: E9 5C	; Arithmetic
	TAY					  ; $A167: A8	  
	JSR $A1B4				; $A168: 20 B4 A1 ; -> sub_A1B4
	BCC $A199				; $A16B: 90 2C   
	STX $C7				  ; $A16D: 86 C7   
	BRK					  ; $A16F: 00	  
	ORA #$4F				 ; $A170: 09 4F   
	BRK					  ; $A172: 00	  
	ORA ($4F),Y			  ; $A173: 11 4F   
loc_A175:
	STA $C4				  ; $A175: 85 C4   
	BRK					  ; $A177: 00	  
	ORA $4F				  ; $A178: 05 4F   
	BCC $A199				; $A17A: 90 1D   

; ---- Subroutine at $A17C (Bank 17) ----
sub_A17C:
	LDA $C4				  ; $A17C: A5 C4   
	LDX $C6				  ; $A17E: A6 C6   
	STA $6E45,X			  ; $A180: 9D 45 6E
	STA $7206,X			  ; $A183: 9D 06 72
	LDA $C7				  ; $A186: A5 C7   
	TAX					  ; $A188: AA	  
	ORA #$80				 ; $A189: 09 80   
	STA $7363				; $A18B: 8D 63 73
	LDA $C6				  ; $A18E: A5 C6   
	STA $7C				  ; $A190: 85 7C   
	BRK					  ; $A192: 00	  
	AND ($A3),Y			  ; $A193: 31 A3   
	BRK					  ; $A195: 00	  
	ASL $4F				  ; $A196: 06 4F   
loc_A198:
	SEC					  ; $A198: 38	  
loc_A199:
	RTS					  ; $A199: 60	  

; ---- Subroutine at $A19A (Bank 17) ----
sub_A19A:
	JSR $A1B4				; $A19A: 20 B4 A1 ; -> sub_A1B4
	BCC $A1A8				; $A19D: 90 09   
	STX $C7				  ; $A19F: 86 C7   
	LDA #$84				 ; $A1A1: A9 84   
	STA $C4				  ; $A1A3: 85 C4   
	BRK					  ; $A1A5: 00	  
	ORA $4F				  ; $A1A6: 05 4F   
loc_A1A8:
	RTS					  ; $A1A8: 60	  

; ---- Subroutine at $A1A9 (Bank 17) ----
sub_A1A9:
	JSR $A19A				; $A1A9: 20 9A A1 ; -> sub_A19A
	BCC $A141				; $A1AC: 90 93   
	JSR $A17C				; $A1AE: 20 7C A1 ; -> sub_A17C
	JMP $A14C				; $A1B1: 4C 4C A1

; ---- Subroutine at $A1B4 (Bank 17) ----
sub_A1B4:
	LDX #$00				 ; $A1B4: A2 00   
loc_A1B6:
	BRK					  ; $A1B6: 00	  
	AND #$C3				 ; $A1B7: 29 C3   
	.byte $0F			  ; $A1B9 - Unknown opcode
	BCC $A198				; $A1BA: 90 DC   
	INX					  ; $A1BC: E8	  
	CPX #$08				 ; $A1BD: E0 08   
	BNE $A1B6				; $A1BF: D0 F5   
	LDX #$00				 ; $A1C1: A2 00   
loc_A1C3:
	BRK					  ; $A1C3: 00	  
	AND #$C3				 ; $A1C4: 29 C3   
	ASL $CF90				; $A1C6: 0E 90 CF
	INX					  ; $A1C9: E8	  
	CPX #$08				 ; $A1CA: E0 08   
	BNE $A1C3				; $A1CC: D0 F5   
	CLC					  ; $A1CE: 18	  
	RTS					  ; $A1CF: 60	  

; ---- Subroutine at $A1D0 (Bank 17) ----
sub_A1D0:
	LDA $96				  ; $A1D0: A5 96   
	PHA					  ; $A1D2: 48	  
	BRK					  ; $A1D3: 00	  
	.byte $03			  ; $A1D4 - Unknown opcode
	.byte $1F			  ; $A1D5 - Unknown opcode
	PHA					  ; $A1D6: 48	  
	BRK					  ; $A1D7: 00	  
	.byte $02			  ; $A1D8 - Unknown opcode
	.byte $1F			  ; $A1D9 - Unknown opcode
	PHA					  ; $A1DA: 48	  
	LDA $735D				; $A1DB: AD 5D 73
	PHA					  ; $A1DE: 48	  
	LDA $735C				; $A1DF: AD 5C 73
	PHA					  ; $A1E2: 48	  
	LDA $735E				; $A1E3: AD 5E 73
	PHA					  ; $A1E6: 48	  
	LDA $7363				; $A1E7: AD 63 73
	BRK					  ; $A1EA: 00	  
	ORA #$1F				 ; $A1EB: 09 1F   
	BCC $A20A				; $A1ED: 90 1B   
	STX $96				  ; $A1EF: 86 96   
	LDA #$00				 ; $A1F1: A9 00   
	BRK					  ; $A1F3: 00	  
	.byte $0C			  ; $A1F4 - Unknown opcode
	.byte $1F			  ; $A1F5 - Unknown opcode
	LDX $96				  ; $A1F6: A6 96   
	LDA #$00				 ; $A1F8: A9 00   
	BRK					  ; $A1FA: 00	  
	PHP					  ; $A1FB: 08	  
	.byte $1F			  ; $A1FC - Unknown opcode
	BRK					  ; $A1FD: 00	  
	AND ($0F),Y			  ; $A1FE: 31 0F   
	JSR $88CA				; $A200: 20 CA 88 ; -> sub_88CA
	LDX $96				  ; $A203: A6 96   
	LDA #$02				 ; $A205: A9 02   
	BRK					  ; $A207: 00	  
	PHP					  ; $A208: 08	  
	.byte $1F			  ; $A209 - Unknown opcode
loc_A20A:
	PLA					  ; $A20A: 68	  
	STA $735E				; $A20B: 8D 5E 73
	PLA					  ; $A20E: 68	  
	STA $735C				; $A20F: 8D 5C 73
	PLA					  ; $A212: 68	  
	STA $735D				; $A213: 8D 5D 73
	BRK					  ; $A216: 00	  
	ORA (system_flags,X)	 ; $A217: 01 1F   
	BRK					  ; $A219: 00	  
	ORA #$1F				 ; $A21A: 09 1F   
	PLA					  ; $A21C: 68	  
	BRK					  ; $A21D: 00	  
	.byte $0B			  ; $A21E - Unknown opcode
	.byte $1F			  ; $A21F - Unknown opcode
	PLA					  ; $A220: 68	  
	BRK					  ; $A221: 00	  
	ASL					  ; $A222: 0A	  
	.byte $1F			  ; $A223 - Unknown opcode
loc_A224:
	PLA					  ; $A224: 68	  
	STA $96				  ; $A225: 85 96   
	RTS					  ; $A227: 60	  
	BRK					  ; $A228: 00	  
	.byte $03			  ; $A229 - Unknown opcode
	.byte $1F			  ; $A22A - Unknown opcode
	SEC					  ; $A22B: 38	  
	SBC #$69				 ; $A22C: E9 69	; Arithmetic
	STA $C4				  ; $A22E: 85 C4   
	PHA					  ; $A230: 48	  
	STA $7D				  ; $A231: 85 7D   
	BRK					  ; $A233: 00	  
	ASL system_flags		 ; $A234: 06 1F   
	TXA					  ; $A236: 8A	  
	PHA					  ; $A237: 48	  
	STX $C7				  ; $A238: 86 C7   
	BRK					  ; $A23A: 00	  
	.byte $0C			  ; $A23B - Unknown opcode
	.byte $4F			  ; $A23C - Unknown opcode
	PLA					  ; $A23D: 68	  
	TAX					  ; $A23E: AA	  
	PLA					  ; $A23F: 68	  
	STA $C4				  ; $A240: 85 C4   
	BCC $A29C				; $A242: 90 58   
	BRK					  ; $A244: 00	  
	ROL					  ; $A245: 2A	  
	.byte $C3			  ; $A246 - Unknown opcode
	BPL $A249				; $A247: 10 00   
loc_A249:
	AND $A8B3				; $A249: 2D B3 A8
	LDA $7206,Y			  ; $A24C: B9 06 72
	PHA					  ; $A24F: 48	  
	LDA $C4				  ; $A250: A5 C4   
	CLC					  ; $A252: 18	  
	ADC #$D3				 ; $A253: 69 D3	; Arithmetic
	STA $7206,Y			  ; $A255: 99 06 72
	BRK					  ; $A258: 00	  
	ORA $B3				  ; $A259: 05 B3   
	BRK					  ; $A25B: 00	  
	ORA $A9B3				; $A25C: 0D B3 A9
	.byte $FF			  ; $A25F - Unknown opcode
	STA $7D				  ; $A260: 85 7D   
	BRK					  ; $A262: 00	  
	ORA ($B3),Y			  ; $A263: 11 B3   
	BRK					  ; $A265: 00	  
	ORA $A3,X				; $A266: 15 A3   
	BRK					  ; $A268: 00	  
	ORA $00A3,Y			  ; $A269: 19 A3 00
	.byte $0F			  ; $A26C - Unknown opcode
	.byte $B3			  ; $A26D - Unknown opcode
	BRK					  ; $A26E: 00	  
	BPL $A224				; $A26F: 10 B3   
	BRK					  ; $A271: 00	  
	.byte $13			  ; $A272 - Unknown opcode
	.byte $B3			  ; $A273 - Unknown opcode
	STA $7C				  ; $A274: 85 7C   
	LDA $7F				  ; $A276: A5 7F   
	STA $7D				  ; $A278: 85 7D   
	BRK					  ; $A27A: 00	  
	.byte $14			  ; $A27B - Unknown opcode
	.byte $A3			  ; $A27C - Unknown opcode
	BRK					  ; $A27D: 00	  
	.byte $17			  ; $A27E - Unknown opcode
	.byte $B3			  ; $A27F - Unknown opcode
	STA $7C				  ; $A280: 85 7C   
	LDA $7F				  ; $A282: A5 7F   
	STA $7D				  ; $A284: 85 7D   
	BRK					  ; $A286: 00	  
	CLC					  ; $A287: 18	  
	.byte $A3			  ; $A288 - Unknown opcode
	PLA					  ; $A289: 68	  
	STA $7206,Y			  ; $A28A: 99 06 72
	JSR $A293				; $A28D: 20 93 A2 ; -> sub_A293
	JSR $A1D0				; $A290: 20 D0 A1 ; -> sub_A1D0

; ---- Subroutine at $A293 (Bank 17) ----
sub_A293:
	LDA #$00				 ; $A293: A9 00   
	STA ptr1_lo			  ; $A295: 85 06   
	BRK					  ; $A297: 00	  
	.byte $1F			  ; $A298 - Unknown opcode
	.byte $0F			  ; $A299 - Unknown opcode
	SEC					  ; $A29A: 38	  
	RTS					  ; $A29B: 60	  
loc_A29C:
	BRK					  ; $A29C: 00	  
	CPX $D3				  ; $A29D: E4 D3   
	.byte $1A			  ; $A29F - Unknown opcode
	CLC					  ; $A2A0: 18	  
	RTS					  ; $A2A1: 60	  
	BRK					  ; $A2A2: 00	  
	ORA $A24F				; $A2A3: 0D 4F A2
	.byte $07			  ; $A2A6 - Unknown opcode
loc_A2A7:
	BRK					  ; $A2A7: 00	  
	.byte $2B			  ; $A2A8 - Unknown opcode
	.byte $C3			  ; $A2A9 - Unknown opcode
	.byte $0F			  ; $A2AA - Unknown opcode
	DEX					  ; $A2AB: CA	  
	BPL $A2A7				; $A2AC: 10 F9   
	LDA #$30				 ; $A2AE: A9 30   
	STA $6E45				; $A2B0: 8D 45 6E
	STA $6E46				; $A2B3: 8D 46 6E
	STA $7207				; $A2B6: 8D 07 72
	LDA #$00				 ; $A2B9: A9 00   
	TAX					  ; $A2BB: AA	  
	ORA #$80				 ; $A2BC: 09 80   
	STA $7363				; $A2BE: 8D 63 73
	LDA #$01				 ; $A2C1: A9 01   
	STA $7C				  ; $A2C3: 85 7C   
	BRK					  ; $A2C5: 00	  
	AND ($A3),Y			  ; $A2C6: 31 A3   
	JSR $A0EF				; $A2C8: 20 EF A0 ; -> sub_A0EF
	BRK					  ; $A2CB: 00	  
	CPX $D3				  ; $A2CC: E4 D3   
	EOR ($AD,X)			  ; $A2CE: 41 AD   
	.byte $44			  ; $A2D0 - Unknown opcode
	ROR $0309				; $A2D1: 6E 09 03
	STA $6E44				; $A2D4: 8D 44 6E
	RTS					  ; $A2D7: 60	  

; ---- Subroutine at $A2D8 (Bank 17) ----
sub_A2D8:
	TXA					  ; $A2D8: 8A	  
	PHA					  ; $A2D9: 48	  
	LDX $96				  ; $A2DA: A6 96   
	LDA $72F4,X			  ; $A2DC: BD F4 72
	AND #$8F				 ; $A2DF: 29 8F   
	JMP $A362				; $A2E1: 4C 62 A3
	JSR $A2D8				; $A2E4: 20 D8 A2 ; -> sub_A2D8
	BMI $A2FF				; $A2E7: 30 16   
loc_A2E9:
	TAX					  ; $A2E9: AA	  
	LDA $6E				  ; $A2EA: A5 6E   
	PHA					  ; $A2EC: 48	  
	LDA $6F				  ; $A2ED: A5 6F   
	PHA					  ; $A2EF: 48	  
	TXA					  ; $A2F0: 8A	  
	BRK					  ; $A2F1: 00	  
	.byte $67			  ; $A2F2 - Unknown opcode
	.byte $73			  ; $A2F3 - Unknown opcode
	PLA					  ; $A2F4: 68	  
	STA $6F				  ; $A2F5: 85 6F   
	PLA					  ; $A2F7: 68	  
	STA $6E				  ; $A2F8: 85 6E   
	LDX $72				  ; $A2FA: A6 72   
	TXA					  ; $A2FC: 8A	  
	CLC					  ; $A2FD: 18	  
	RTS					  ; $A2FE: 60	  
loc_A2FF:
	AND #$07				 ; $A2FF: 29 07   
	TAX					  ; $A301: AA	  
	SEC					  ; $A302: 38	  
	RTS					  ; $A303: 60	  

; ---- Subroutine at $A304 (Bank 17) ----
sub_A304:
	TXA					  ; $A304: 8A	  
	PHA					  ; $A305: 48	  
	JSR $A3B5				; $A306: 20 B5 A3 ; -> sub_A3B5
	LDA $7300,X			  ; $A309: BD 00 73
	AND #$8F				 ; $A30C: 29 8F   
	JMP $A362				; $A30E: 4C 62 A3
	LDA $7363				; $A311: AD 63 73
	AND #$8F				 ; $A314: 29 8F   
	BPL $A2E9				; $A316: 10 D1   
	BMI $A2FF				; $A318: 30 E5   
	JSR $A3C2				; $A31A: 20 C2 A3 ; -> sub_A3C2
	AND #$8F				 ; $A31D: 29 8F   
	STA $6E0F				; $A31F: 8D 0F 6E
	LDA $7300,X			  ; $A322: BD 00 73
	AND #$70				 ; $A325: 29 70   
	ORA $6E0F				; $A327: 0D 0F 6E
	STA $7300,X			  ; $A32A: 9D 00 73
	RTS					  ; $A32D: 60	  

; ---- Subroutine at $A32E (Bank 17) ----
sub_A32E:
	TXA					  ; $A32E: 8A	  
	PHA					  ; $A32F: 48	  
	JSR $A3B5				; $A330: 20 B5 A3 ; -> sub_A3B5
	LDA $7324,X			  ; $A333: BD 24 73
	JMP $A362				; $A336: 4C 62 A3
	STA $6E0F				; $A339: 8D 0F 6E
	TXA					  ; $A33C: 8A	  
	PHA					  ; $A33D: 48	  
	JSR $A3B5				; $A33E: 20 B5 A3 ; -> sub_A3B5
	LDA $6E0F				; $A341: AD 0F 6E
	STA $7324,X			  ; $A344: 9D 24 73
	JMP $A362				; $A347: 4C 62 A3
	TXA					  ; $A34A: 8A	  
	PHA					  ; $A34B: 48	  
	LDX $96				  ; $A34C: A6 96   
	LDA $72F4,X			  ; $A34E: BD F4 72
	JMP $A35C				; $A351: 4C 5C A3
	TXA					  ; $A354: 8A	  
	PHA					  ; $A355: 48	  
	JSR $A3B5				; $A356: 20 B5 A3 ; -> sub_A3B5
	LDA $7300,X			  ; $A359: BD 00 73
loc_A35C:
	LSR					  ; $A35C: 4A	  
	LSR					  ; $A35D: 4A	  
	LSR					  ; $A35E: 4A	  
	LSR					  ; $A35F: 4A	  
	AND #$07				 ; $A360: 29 07   
loc_A362:
	STA $6E0F				; $A362: 8D 0F 6E
	PLA					  ; $A365: 68	  
	TAX					  ; $A366: AA	  
	LDA $6E0F				; $A367: AD 0F 6E
	RTS					  ; $A36A: 60	  
	ASL					  ; $A36B: 0A	  
	ASL					  ; $A36C: 0A	  
	ASL					  ; $A36D: 0A	  
	ASL					  ; $A36E: 0A	  
	STA $6E0F				; $A36F: 8D 0F 6E
	LDA $72F4,X			  ; $A372: BD F4 72
	AND #$8F				 ; $A375: 29 8F   
	ORA $6E0F				; $A377: 0D 0F 6E
	STA $72F4,X			  ; $A37A: 9D F4 72
	RTS					  ; $A37D: 60	  
	JSR $A3C2				; $A37E: 20 C2 A3 ; -> sub_A3C2
	ASL					  ; $A381: 0A	  
	ASL					  ; $A382: 0A	  
	ASL					  ; $A383: 0A	  
	ASL					  ; $A384: 0A	  
	STA $6E0F				; $A385: 8D 0F 6E
	LDA $7300,X			  ; $A388: BD 00 73
	AND #$8F				 ; $A38B: 29 8F   
	ORA $6E0F				; $A38D: 0D 0F 6E
	STA $7300,X			  ; $A390: 9D 00 73
	RTS					  ; $A393: 60	  
	STA $6E0F				; $A394: 8D 0F 6E
	LDX #$00				 ; $A397: A2 00   
loc_A399:
	LDA $72F4,X			  ; $A399: BD F4 72
	AND #$70				 ; $A39C: 29 70   
	CMP #$70				 ; $A39E: C9 70	; Compare with 112
	BEQ $A3AC				; $A3A0: F0 0A   
	LDA $72F4,X			  ; $A3A2: BD F4 72
	AND #$8F				 ; $A3A5: 29 8F   
	CMP $6E0F				; $A3A7: CD 0F 6E
	BEQ $A3B3				; $A3AA: F0 07   
loc_A3AC:
	INX					  ; $A3AC: E8	  
	CPX #$0C				 ; $A3AD: E0 0C   
	BNE $A399				; $A3AF: D0 E8   
	CLC					  ; $A3B1: 18	  
	RTS					  ; $A3B2: 60	  
loc_A3B3:
	SEC					  ; $A3B3: 38	  
	RTS					  ; $A3B4: 60	  

; ---- Subroutine at $A3B5 (Bank 17) ----
sub_A3B5:
	LDA tmp0				 ; $A3B5: A5 00   
	PHA					  ; $A3B7: 48	  
	JSR $A3D4				; $A3B8: 20 D4 A3 ; -> sub_A3D4
	ADC $96				  ; $A3BB: 65 96	; Arithmetic
	TAX					  ; $A3BD: AA	  
	PLA					  ; $A3BE: 68	  
	STA tmp0				 ; $A3BF: 85 00   
	RTS					  ; $A3C1: 60	  

; ---- Subroutine at $A3C2 (Bank 17) ----
sub_A3C2:
	PHA					  ; $A3C2: 48	  
	LDA tmp0				 ; $A3C3: A5 00   
	PHA					  ; $A3C5: 48	  
	JSR $A3D4				; $A3C6: 20 D4 A3 ; -> sub_A3D4
	STA tmp0				 ; $A3C9: 85 00   
	TXA					  ; $A3CB: 8A	  
	ADC tmp0				 ; $A3CC: 65 00	; Arithmetic
	TAX					  ; $A3CE: AA	  
	PLA					  ; $A3CF: 68	  
	STA tmp0				 ; $A3D0: 85 00   
	PLA					  ; $A3D2: 68	  
	RTS					  ; $A3D3: 60	  

; ---- Subroutine at $A3D4 (Bank 17) ----
sub_A3D4:
	LDA $735C				; $A3D4: AD 5C 73
	ASL					  ; $A3D7: 0A	  
	ASL					  ; $A3D8: 0A	  
	STA tmp0				 ; $A3D9: 85 00   
	ASL					  ; $A3DB: 0A	  
	ADC tmp0				 ; $A3DC: 65 00	; Arithmetic
	RTS					  ; $A3DE: 60	  
	JSR $A2D8				; $A3DF: 20 D8 A2 ; -> sub_A2D8
	STA tmp0				 ; $A3E2: 85 00   
	JSR $A304				; $A3E4: 20 04 A3 ; -> sub_A304
	EOR tmp0				 ; $A3E7: 45 00   
	STA tmp0				 ; $A3E9: 85 00   
	JSR $A32E				; $A3EB: 20 2E A3 ; -> sub_A32E
	BRK					  ; $A3EE: 00	  
	.byte $0C			  ; $A3EF - Unknown opcode
	.byte $3F			  ; $A3F0 - Unknown opcode
	ROR					  ; $A3F1: 6A	  
	EOR tmp0				 ; $A3F2: 45 00   
	STA tmp0				 ; $A3F4: 85 00   
	RTS					  ; $A3F6: 60	  

; ---- Subroutine at $A3F7 (Bank 17) ----
sub_A3F7:
	LDA $72E9				; $A3F7: AD E9 72
	BMI $A409				; $A3FA: 30 0D   
	BRK					  ; $A3FC: 00	  
	.byte $07			  ; $A3FD - Unknown opcode
	.byte $6F			  ; $A3FE - Unknown opcode
	.byte $2B			  ; $A3FF - Unknown opcode
	JSR $AE0A				; $A400: 20 0A AE ; -> sub_AE0A
	BCC $A409				; $A403: 90 04   
	BRK					  ; $A405: 00	  
	.byte $07			  ; $A406 - Unknown opcode
	.byte $6F			  ; $A407 - Unknown opcode
	EOR $E260				; $A408: 4D 60 E2
	TXS					  ; $A40B: 9A	  
	.byte $E2			  ; $A40C - Unknown opcode
	TXS					  ; $A40D: 9A	  
	.byte $E2			  ; $A40E - Unknown opcode
	TXS					  ; $A40F: 9A	  
	.byte $E2			  ; $A410 - Unknown opcode
	TXS					  ; $A411: 9A	  
	.byte $E2			  ; $A412 - Unknown opcode
	TXS					  ; $A413: 9A	  
	.byte $E2			  ; $A414 - Unknown opcode
	TXS					  ; $A415: 9A	  
	.byte $E2			  ; $A416 - Unknown opcode
	TXS					  ; $A417: 9A	  
	.byte $E2			  ; $A418 - Unknown opcode
	TXS					  ; $A419: 9A	  
	.byte $E2			  ; $A41A - Unknown opcode
	TXS					  ; $A41B: 9A	  
	.byte $E2			  ; $A41C - Unknown opcode
	TXS					  ; $A41D: 9A	  
	.byte $E2			  ; $A41E - Unknown opcode
	TXS					  ; $A41F: 9A	  
	.byte $E2			  ; $A420 - Unknown opcode
	TXS					  ; $A421: 9A	  
	.byte $E2			  ; $A422 - Unknown opcode
	TXS					  ; $A423: 9A	  
	.byte $E2			  ; $A424 - Unknown opcode
	TXS					  ; $A425: 9A	  
	.byte $E2			  ; $A426 - Unknown opcode
	TXS					  ; $A427: 9A	  
	.byte $E2			  ; $A428 - Unknown opcode
	TXS					  ; $A429: 9A	  
	.byte $E2			  ; $A42A - Unknown opcode
	TXS					  ; $A42B: 9A	  
	.byte $E2			  ; $A42C - Unknown opcode
	TXS					  ; $A42D: 9A	  
	.byte $E2			  ; $A42E - Unknown opcode
	TXS					  ; $A42F: 9A	  
	.byte $0C			  ; $A430 - Unknown opcode
	.byte $9B			  ; $A431 - Unknown opcode
	.byte $0C			  ; $A432 - Unknown opcode
	.byte $9B			  ; $A433 - Unknown opcode
	STX $9B				  ; $A434: 86 9B   
	.byte $53			  ; $A436 - Unknown opcode
	.byte $9B			  ; $A437 - Unknown opcode
	.byte $C3			  ; $A438 - Unknown opcode
	.byte $9C			  ; $A439 - Unknown opcode
	.byte $C3			  ; $A43A - Unknown opcode
	.byte $9C			  ; $A43B - Unknown opcode
	LDY $CA9C,X			  ; $A43C: BC 9C CA
	.byte $9C			  ; $A43F - Unknown opcode
	CMP ($9C),Y			  ; $A440: D1 9C   
	CMP $0A9E,X			  ; $A442: DD 9E 0A
	STA $9D03,X			  ; $A445: 9D 03 9D
	.byte $14			  ; $A448 - Unknown opcode
	.byte $9F			  ; $A449 - Unknown opcode
	.byte $27			  ; $A44A - Unknown opcode
	.byte $9F			  ; $A44B - Unknown opcode
	.byte $64			  ; $A44C - Unknown opcode
	.byte $9F			  ; $A44D - Unknown opcode
	.byte $93			  ; $A44E - Unknown opcode
	.byte $9F			  ; $A44F - Unknown opcode
	DEC $9F				  ; $A450: C6 9F   
	.byte $42			  ; $A452 - Unknown opcode
	STA $9D15,X			  ; $A453: 9D 15 9D
	BCC $A3F5				; $A456: 90 9D   
	LDY $9D,X				; $A458: B4 9D   
	.byte $32			  ; $A45A - Unknown opcode
	STA $9FED,X			  ; $A45B: 9D ED 9F
	SBC $ED9F				; $A45E: ED 9F ED ; Arithmetic
	.byte $9F			  ; $A461 - Unknown opcode
	SBC $ED9F				; $A462: ED 9F ED ; Arithmetic
	.byte $9F			  ; $A465 - Unknown opcode
	.byte $1C			  ; $A466 - Unknown opcode
	STA $9D2B,X			  ; $A467: 9D 2B 9D
	AND $47A0				; $A46A: 2D A0 47
	LDY #$8E				 ; $A46D: A0 8E   
	LDY #$AD				 ; $A46F: A0 AD   
	.byte $AF			  ; $A471 - Unknown opcode
	.byte $23			  ; $A472 - Unknown opcode
	LDX $AE23				; $A473: AE 23 AE
	.byte $23			  ; $A476 - Unknown opcode
	LDX $AE23				; $A477: AE 23 AE
	.byte $23			  ; $A47A - Unknown opcode
	LDX $AE23				; $A47B: AE 23 AE
	.byte $23			  ; $A47E - Unknown opcode
	LDX $AE23				; $A47F: AE 23 AE
	.byte $23			  ; $A482 - Unknown opcode
	LDX $AE23				; $A483: AE 23 AE
	LSR $5EAE,X			  ; $A486: 5E AE 5E
	LDX $AE9D				; $A489: AE 9D AE
	BIT $AE				  ; $A48C: 24 AE   
	PLP					  ; $A48E: 28	  
	LDX $96DB				; $A48F: AE DB 96
	.byte $E2			  ; $A492 - Unknown opcode
	TYA					  ; $A493: 98	  
	.byte $FA			  ; $A494 - Unknown opcode
	TYA					  ; $A495: 98	  
	EOR $99				  ; $A496: 45 99   
	.byte $52			  ; $A498 - Unknown opcode
	STA $995F,Y			  ; $A499: 99 5F 99
	AND $AE,X				; $A49C: 35 AE   
	AND $AE,X				; $A49E: 35 AE   
	AND $AE,X				; $A4A0: 35 AE   
	.byte $0C			  ; $A4A2 - Unknown opcode
	.byte $9B			  ; $A4A3 - Unknown opcode
	.byte $E2			  ; $A4A4 - Unknown opcode
	TXS					  ; $A4A5: 9A	  
	.byte $E2			  ; $A4A6 - Unknown opcode
	TXS					  ; $A4A7: 9A	  
	.byte $E2			  ; $A4A8 - Unknown opcode
	TXS					  ; $A4A9: 9A	  
	.byte $E2			  ; $A4AA - Unknown opcode
	TXS					  ; $A4AB: 9A	  
	.byte $E2			  ; $A4AC - Unknown opcode
	TXS					  ; $A4AD: 9A	  
	.byte $E2			  ; $A4AE - Unknown opcode
	TXS					  ; $A4AF: 9A	  
	.byte $C3			  ; $A4B0 - Unknown opcode
	.byte $9C			  ; $A4B1 - Unknown opcode
	NOP					  ; $A4B2: EA	  
	.byte $AF			  ; $A4B3 - Unknown opcode
	.byte $F4			  ; $A4B4 - Unknown opcode
	.byte $AF			  ; $A4B5 - Unknown opcode
	LSR $55AE				; $A4B6: 4E AE 55
	LDX $AE65				; $A4B9: AE 65 AE
	PHP					  ; $A4BC: 08	  
	LDA ($14,X)			  ; $A4BD: A1 14   
	LDA ($FD,X)			  ; $A4BF: A1 FD   
	LDY #$3C				 ; $A4C1: A0 3C   
	LDA ($3C,X)			  ; $A4C3: A1 3C   
	LDA ($3C,X)			  ; $A4C5: A1 3C   
	LDA ($3C,X)			  ; $A4C7: A1 3C   
	LDA ($55,X)			  ; $A4C9: A1 55   
	LDA ($3C,X)			  ; $A4CB: A1 3C   
	LDA ($55,X)			  ; $A4CD: A1 55   
	LDA ($3C,X)			  ; $A4CF: A1 3C   
	LDA ($55,X)			  ; $A4D1: A1 55   
	LDA ($31,X)			  ; $A4D3: A1 31   
	LDA ($A2,X)			  ; $A4D5: A1 A2   
	LDX #$E2				 ; $A4D7: A2 E2   
	TXS					  ; $A4D9: 9A	  
	EOR $AE,X				; $A4DA: 55 AE   
	PLP					  ; $A4DC: 28	  
	LDX #$28				 ; $A4DD: A2 28   
	LDX #$28				 ; $A4DF: A2 28   
	LDX #$28				 ; $A4E1: A2 28   
	LDX #$E2				 ; $A4E3: A2 E2   
	TXS					  ; $A4E5: 9A	  
	JSR $BF9C				; $A4E6: 20 9C BF ; -> sub_BF9C
	LDX $9FED				; $A4E9: AE ED 9F
	CPX $B0				  ; $A4EC: E4 B0   
	STY $AE				  ; $A4EE: 84 AE   
	.byte $C3			  ; $A4F0 - Unknown opcode
	.byte $9C			  ; $A4F1 - Unknown opcode
	.byte $E2			  ; $A4F2 - Unknown opcode
	TXS					  ; $A4F3: 9A	  
	.byte $7C			  ; $A4F4 - Unknown opcode
	LDA (pos_y_hi),Y		 ; $A4F5: B1 ED   
	.byte $9F			  ; $A4F7 - Unknown opcode
	LDY $4E9C,X			  ; $A4F8: BC 9C 4E
	LDX $AE35				; $A4FB: AE 35 AE
	.byte $C3			  ; $A4FE - Unknown opcode
	.byte $9C			  ; $A4FF - Unknown opcode
	.byte $80			  ; $A500 - Unknown opcode
	LDA ($D0),Y			  ; $A501: B1 D0   
	LDA ($DE),Y			  ; $A503: B1 DE   
	LDA (system_flags),Y	 ; $A505: B1 1F   
	.byte $B2			  ; $A507 - Unknown opcode
	.byte $34			  ; $A508 - Unknown opcode
	BCS $A4ED				; $A509: B0 E2   
	TXS					  ; $A50B: 9A	  
	.byte $EB			  ; $A50C - Unknown opcode
	TXS					  ; $A50D: 9A	  
loc_A50E:
	.byte $7C			  ; $A50E - Unknown opcode
	LDA ($E2),Y			  ; $A50F: B1 E2   
	TXS					  ; $A511: 9A	  
	.byte $E2			  ; $A512 - Unknown opcode
	TXS					  ; $A513: 9A	  
	.byte $C3			  ; $A514 - Unknown opcode
loc_A515:
	.byte $9C			  ; $A515 - Unknown opcode
	.byte $E2			  ; $A516 - Unknown opcode
	TXS					  ; $A517: 9A	  
	.byte $E2			  ; $A518 - Unknown opcode
	TXS					  ; $A519: 9A	  
	LDY $E29C,X			  ; $A51A: BC 9C E2
	TXS					  ; $A51D: 9A	  
	.byte $27			  ; $A51E - Unknown opcode
	.byte $9F			  ; $A51F - Unknown opcode
	SBC $BF9F				; $A520: ED 9F BF ; Arithmetic
loc_A523:
	LDX $B0B3				; $A523: AE B3 B0
	.byte $E2			  ; $A526 - Unknown opcode
	TXS					  ; $A527: 9A	  
	SBC $399F				; $A528: ED 9F 39 ; Arithmetic
	BCS $A530				; $A52B: B0 03   
	STA $9D0A,X			  ; $A52D: 9D 0A 9D
loc_A530:
	AND $B0				  ; $A530: 25 B0   
	SBC $E29F				; $A532: ED 9F E2 ; Arithmetic
	TXS					  ; $A535: 9A	  
	LDA $E4AF				; $A536: AD AF E4
	BCS $A557				; $A539: B0 1C   
	STA $B055,X			  ; $A53B: 9D 55 B0
	.byte $77			  ; $A53E - Unknown opcode
	BCS $A52E				; $A53F: B0 ED   
	.byte $9F			  ; $A541 - Unknown opcode
loc_A542:
	.byte $53			  ; $A542 - Unknown opcode
	.byte $9B			  ; $A543 - Unknown opcode
	LDA $349C				; $A544: AD 9C 34
	BCS $A5A9				; $A547: B0 60   
	LDA $9FED,Y			  ; $A549: B9 ED 9F
	TSX					  ; $A54C: BA	  
	BCS $A50E				; $A54D: B0 BF   
	BCS $A515				; $A54F: B0 C4   
	BCS $A51C				; $A551: B0 C9   
	BCS $A523				; $A553: B0 CE   
	BCS $A542				; $A555: B0 EB   
loc_A557:
	BCS $A4FD				; $A557: B0 A4   
	BCS $A525				; $A559: B0 CA   
	.byte $9C			  ; $A55B - Unknown opcode
	SBC $B1,X				; $A55C: F5 B1	; Arithmetic
	CMP ($9C),Y			  ; $A55E: D1 9C   
	.byte $D7			  ; $A560 - Unknown opcode
	LDA ($23),Y			  ; $A561: B1 23   
	LDX $B034				; $A563: AE 34 B0
	.byte $34			  ; $A566 - Unknown opcode
	BCS $A5A0				; $A567: B0 37   
	LDY $B6,X				; $A569: B4 B6   
	.byte $B3			  ; $A56B - Unknown opcode
	.byte $80			  ; $A56C - Unknown opcode
	.byte $B3			  ; $A56D - Unknown opcode
	.byte $92			  ; $A56E - Unknown opcode
	.byte $B3			  ; $A56F - Unknown opcode
	.byte $34			  ; $A570 - Unknown opcode
	BCS $A5F2				; $A571: B0 7F   
	LDY $34,X				; $A573: B4 34   
	BCS $A5CA				; $A575: B0 53   
	LDY $34,X				; $A577: B4 34   
	BCS $A59E				; $A579: B0 23   
	LDX $AE23				; $A57B: AE 23 AE
	.byte $23			  ; $A57E - Unknown opcode
	LDX $B372				; $A57F: AE 72 B3
	CPX $B4				  ; $A582: E4 B4   
	.byte $72			  ; $A584 - Unknown opcode
	.byte $B3			  ; $A585 - Unknown opcode
	.byte $9C			  ; $A586 - Unknown opcode
	.byte $B3			  ; $A587 - Unknown opcode
	.byte $72			  ; $A588 - Unknown opcode
	.byte $B3			  ; $A589 - Unknown opcode
	.byte $64			  ; $A58A - Unknown opcode
	.byte $9F			  ; $A58B - Unknown opcode
	.byte $23			  ; $A58C - Unknown opcode
	LDX $B4C6				; $A58D: AE C6 B4
	ADC $B3				  ; $A590: 65 B3	; Arithmetic
	.byte $92			  ; $A592 - Unknown opcode
	.byte $B3			  ; $A593 - Unknown opcode
	LDY $B3				  ; $A594: A4 B3   
	.byte $D4			  ; $A596 - Unknown opcode
	.byte $B3			  ; $A597 - Unknown opcode
	.byte $72			  ; $A598 - Unknown opcode
	.byte $B3			  ; $A599 - Unknown opcode
	.byte $02			  ; $A59A - Unknown opcode
	LDY $72,X				; $A59B: B4 72   
	.byte $B3			  ; $A59D - Unknown opcode
loc_A59E:
	.byte $1C			  ; $A59E - Unknown opcode
	LDY $34,X				; $A59F: B4 34   
loc_A5A1:
	BCS $A5C6				; $A5A1: B0 23   
	LDX $AE23				; $A5A3: AE 23 AE
	DEC $34B3,X			  ; $A5A6: DE B3 34
loc_A5A9:
	BCS $A5DF				; $A5A9: B0 34   
	BCS $A5A1				; $A5AB: B0 F4   
	.byte $AF			  ; $A5AD - Unknown opcode
	.byte $34			  ; $A5AE - Unknown opcode
	BCS $A53C				; $A5AF: B0 8B   
	LDX $9C20				; $A5B1: AE 20 9C
	EOR ($B6),Y			  ; $A5B4: 51 B6   
	SBC $599F				; $A5B6: ED 9F 59 ; Arithmetic
	LDX $66,Y				; $A5B9: B6 66   
	LDX $93,Y				; $A5BB: B6 93   
	LDX $DB,Y				; $A5BD: B6 DB   
	LDX $72,Y				; $A5BF: B6 72   
	.byte $B3			  ; $A5C1 - Unknown opcode
	LDA $00AF				; $A5C2: AD AF 00
	.byte $B7			  ; $A5C5 - Unknown opcode
loc_A5C6:
	.byte $32			  ; $A5C6 - Unknown opcode
	STA $B705,X			  ; $A5C7: 9D 05 B7
loc_A5CA:
	AND $60B7,X			  ; $A5CA: 3D B7 60
	LDA $B79D,Y			  ; $A5CD: B9 9D B7
	LDX #$B7				 ; $A5D0: A2 B7   
	.byte $64			  ; $A5D2 - Unknown opcode
	.byte $9F			  ; $A5D3 - Unknown opcode
	DEX					  ; $A5D4: CA	  
	.byte $9C			  ; $A5D5 - Unknown opcode
	DEC $9F				  ; $A5D6: C6 9F   
	.byte $AF			  ; $A5D8 - Unknown opcode
	.byte $B7			  ; $A5D9 - Unknown opcode
	STX $A0,Y				; $A5DA: 96 A0   
	.byte $34			  ; $A5DC - Unknown opcode
	BCS $A644				; $A5DD: B0 65   
loc_A5DF:
	LDX $9FED				; $A5DF: AE ED 9F
	SBC $D19F				; $A5E2: ED 9F D1 ; Arithmetic
	.byte $9C			  ; $A5E5 - Unknown opcode
	CMP ($9C),Y			  ; $A5E6: D1 9C   
	.byte $C3			  ; $A5E8 - Unknown opcode
	.byte $9C			  ; $A5E9 - Unknown opcode
	.byte $C3			  ; $A5EA - Unknown opcode
	.byte $9C			  ; $A5EB - Unknown opcode
	.byte $F2			  ; $A5EC - Unknown opcode
	LDX $F2,Y				; $A5ED: B6 F2   
	LDX $5E,Y				; $A5EF: B6 5E   
	LDX $AE5E				; $A5F1: AE 5E AE
	.byte $DB			  ; $A5F4 - Unknown opcode
	LDX $DB,Y				; $A5F5: B6 DB   
	LDX $23,Y				; $A5F7: B6 23   
	LDX $9CBC				; $A5F9: AE BC 9C
	.byte $53			  ; $A5FC - Unknown opcode
	.byte $9B			  ; $A5FD - Unknown opcode
	.byte $FC			  ; $A5FE - Unknown opcode
	LDA $BE00,X			  ; $A5FF: BD 00 BE
	ORA ($9D),Y			  ; $A602: 11 9D   
	DEX					  ; $A604: CA	  
	.byte $9C			  ; $A605 - Unknown opcode
	SBC $239F				; $A606: ED 9F 23 ; Arithmetic
	LDX $9C50				; $A609: AE 50 9C
	BVC $A5AA				; $A60C: 50 9C   
	BVC $A5AC				; $A60E: 50 9C   
	SED					  ; $A610: F8	  
	.byte $B7			  ; $A611 - Unknown opcode
	SED					  ; $A612: F8	  
loc_A613:
	.byte $B7			  ; $A613 - Unknown opcode
	SED					  ; $A614: F8	  
	.byte $B7			  ; $A615 - Unknown opcode
	SED					  ; $A616: F8	  
	.byte $B7			  ; $A617 - Unknown opcode
	SED					  ; $A618: F8	  
	.byte $B7			  ; $A619 - Unknown opcode
	SED					  ; $A61A: F8	  
	.byte $B7			  ; $A61B - Unknown opcode
	SED					  ; $A61C: F8	  
	.byte $B7			  ; $A61D - Unknown opcode
	BRK					  ; $A61E: 00	  
	BRK					  ; $A61F: 00	  
	JSR tmp0				 ; $A620: 20 00 00
	BRK					  ; $A623: 00	  
	.byte $04			  ; $A624 - Unknown opcode
	BRK					  ; $A625: 00	  
	BRK					  ; $A626: 00	  
	BRK					  ; $A627: 00	  
	BRK					  ; $A628: 00	  
	BRK					  ; $A629: 00	  
	BRK					  ; $A62A: 00	  
	JSR tmp0				 ; $A62B: 20 00 00
	BRK					  ; $A62E: 00	  
	BRK					  ; $A62F: 00	  
	BRK					  ; $A630: 00	  
	BRK					  ; $A631: 00	  
	BRK					  ; $A632: 00	  
	BRK					  ; $A633: 00	  
	BRK					  ; $A634: 00	  
	BRK					  ; $A635: 00	  
	BRK					  ; $A636: 00	  
	BRK					  ; $A637: 00	  
	BRK					  ; $A638: 00	  
	BRK					  ; $A639: 00	  
	BRK					  ; $A63A: 00	  
	TAX					  ; $A63B: AA	  
	ROL					  ; $A63C: 2A	  
	BRK					  ; $A63D: 00	  

; ---- Subroutine at $A63E (Bank 17) ----
sub_A63E:
	BRK					  ; $A63E: 00	  
	.byte $07			  ; $A63F - Unknown opcode
	.byte $1F			  ; $A640 - Unknown opcode
	BCC $A65E				; $A641: 90 1B   
	BRK					  ; $A643: 00	  
loc_A644:
	AND #$C3				 ; $A644: 29 C3   
	BRK					  ; $A646: 00	  
	BCS $A687				; $A647: B0 3E   
	BRK					  ; $A649: 00	  
	AND #$C3				 ; $A64A: 29 C3   
	ORA $38B0				; $A64C: 0D B0 38
	BRK					  ; $A64F: 00	  
	AND #$C3				 ; $A650: 29 C3   
	ORA ($B0,X)			  ; $A652: 01 B0   
	.byte $32			  ; $A654 - Unknown opcode
	BRK					  ; $A655: 00	  
	BIT $A3				  ; $A656: 24 A3   
	ASL					  ; $A658: 0A	  
	ASL					  ; $A659: 0A	  
	TAY					  ; $A65A: A8	  
	JMP $A67E				; $A65B: 4C 7E A6
loc_A65E:
	BRK					  ; $A65E: 00	  
	LSR $93				  ; $A65F: 46 93   
	BPL $A613				; $A661: 10 B0   
	.byte $23			  ; $A663 - Unknown opcode
	BRK					  ; $A664: 00	  
	LSR $93				  ; $A665: 46 93   
	ASL $B0				  ; $A667: 06 B0   
	ORA $4600,X			  ; $A669: 1D 00 46
	.byte $93			  ; $A66C - Unknown opcode
	ORA ($B0),Y			  ; $A66D: 11 B0   
	.byte $17			  ; $A66F - Unknown opcode
	BRK					  ; $A670: 00	  
	.byte $3B			  ; $A671 - Unknown opcode
	.byte $93			  ; $A672 - Unknown opcode
	ORA ($A0,X)			  ; $A673: 01 A0   
	.byte $04			  ; $A675 - Unknown opcode
	BCC $A67E				; $A676: 90 06   
	CMP #$B3				 ; $A678: C9 B3	; Compare with 179
	BNE $A67E				; $A67A: D0 02   
	LDY #$2B				 ; $A67C: A0 2B   
loc_A67E:
	STY tmp0				 ; $A67E: 84 00   
	BRK					  ; $A680: 00	  
	.byte $1B			  ; $A681 - Unknown opcode
	.byte $0F			  ; $A682 - Unknown opcode
	CMP tmp0				 ; $A683: C5 00   
	BCC $A689				; $A685: 90 02   
loc_A687:
	SEC					  ; $A687: 38	  
	RTS					  ; $A688: 60	  
loc_A689:
	LDY #$8C				 ; $A689: A0 8C   
	BRK					  ; $A68B: 00	  
	ORA (system_flags,X)	 ; $A68C: 01 1F   
	BPL $A692				; $A68E: 10 02   
	LDY #$8D				 ; $A690: A0 8D   
loc_A692:
	TYA					  ; $A692: 98	  
	JSR $BF55				; $A693: 20 55 BF ; -> sub_BF55
	BRK					  ; $A696: 00	  
	CPX $D3				  ; $A697: E4 D3   
	.byte $62			  ; $A699 - Unknown opcode
	JSR $938A				; $A69A: 20 8A 93 ; -> sub_938A
	CLC					  ; $A69D: 18	  
	RTS					  ; $A69E: 60	  

; ---- Subroutine at $A69F (Bank 17) ----
sub_A69F:
	JSR $A86D				; $A69F: 20 6D A8 ; -> sub_A86D
	BEQ $A6E1				; $A6A2: F0 3D   
	JSR $9848				; $A6A4: 20 48 98 ; -> sub_9848
	BCC $A6E1				; $A6A7: 90 38   
	CMP #$8F				 ; $A6A9: C9 8F	; Compare with 143
	BNE $A6E1				; $A6AB: D0 34   
	BRK					  ; $A6AD: 00	  
	.byte $07			  ; $A6AE - Unknown opcode
	.byte $1F			  ; $A6AF - Unknown opcode
	BCC $A6D8				; $A6B0: 90 26   
	JSR $985A				; $A6B2: 20 5A 98 ; -> sub_985A
	BRK					  ; $A6B5: 00	  
	.byte $1B			  ; $A6B6 - Unknown opcode
	.byte $0F			  ; $A6B7 - Unknown opcode
	AND #$07				 ; $A6B8: 29 07   
	BNE $A6D8				; $A6BA: D0 1C   
	LDA $6E44				; $A6BC: AD 44 6E
	BMI $A6D8				; $A6BF: 30 17   
	JSR $BF2E				; $A6C1: 20 2E BF ; -> sub_BF2E
	STA $7000,Y			  ; $A6C4: 99 00 70
	.byte $D3			  ; $A6C7 - Unknown opcode
	.byte $4F			  ; $A6C8 - Unknown opcode
	BRK					  ; $A6C9: 00	  
	.byte $07			  ; $A6CA - Unknown opcode
	.byte $1F			  ; $A6CB - Unknown opcode
	JSR $91F3				; $A6CC: 20 F3 91 ; -> sub_91F3
	BRK					  ; $A6CF: 00	  
	.byte $07			  ; $A6D0 - Unknown opcode
	.byte $2F			  ; $A6D1 - Unknown opcode
	BRK					  ; $A6D2: 00	  
	ADC $67D3				; $A6D3: 6D D3 67 ; Arithmetic
	SEC					  ; $A6D6: 38	  
	RTS					  ; $A6D7: 60	  
loc_A6D8:
	LDX #$01				 ; $A6D8: A2 01   
	STX $7361				; $A6DA: 8E 61 73
	DEX					  ; $A6DD: CA	  
	STX $7362				; $A6DE: 8E 62 73
loc_A6E1:
	CLC					  ; $A6E1: 18	  
	RTS					  ; $A6E2: 60	  

; ---- Subroutine at $A6E3 (Bank 17) ----
sub_A6E3:
	JSR $A86D				; $A6E3: 20 6D A8 ; -> sub_A86D
	BEQ $A700				; $A6E6: F0 18   
	JSR $9848				; $A6E8: 20 48 98 ; -> sub_9848
	BCC $A700				; $A6EB: 90 13   
	CMP #$92				 ; $A6ED: C9 92	; Compare with 146
	BEQ $A702				; $A6EF: F0 11   
	CMP #$95				 ; $A6F1: C9 95	; Compare with 149
	BEQ $A727				; $A6F3: F0 32   
	CMP #$90				 ; $A6F5: C9 90	; Compare with 144
	BEQ $A74B				; $A6F7: F0 52   
	CMP #$8E				 ; $A6F9: C9 8E	; Compare with 142
	BNE $A700				; $A6FB: D0 03   
	JMP $A767				; $A6FD: 4C 67 A7
loc_A700:
	CLC					  ; $A700: 18	  
	RTS					  ; $A701: 60	  
loc_A702:
	BRK					  ; $A702: 00	  
	.byte $1B			  ; $A703 - Unknown opcode
	.byte $0F			  ; $A704 - Unknown opcode
	CMP #$AA				 ; $A705: C9 AA	; Compare with 170
	BCS $A714				; $A707: B0 0B   
	LDA #$00				 ; $A709: A9 00   
	STA $7361				; $A70B: 8D 61 73
	STA $7362				; $A70E: 8D 62 73
	JSR $985A				; $A711: 20 5A 98 ; -> sub_985A
loc_A714:
	RTS					  ; $A714: 60	  
	BRK					  ; $A715: 00	  
	.byte $07			  ; $A716 - Unknown opcode
	.byte $1F			  ; $A717 - Unknown opcode
	BCC $A725				; $A718: 90 0B   
	BRK					  ; $A71A: 00	  
	.byte $22			  ; $A71B - Unknown opcode
	.byte $C3			  ; $A71C - Unknown opcode
	.byte $0F			  ; $A71D - Unknown opcode
	CMP #$03				 ; $A71E: C9 03	; Compare with 3
	BEQ $A725				; $A720: F0 03   
loc_A722:
	JSR $981E				; $A722: 20 1E 98 ; -> sub_981E
loc_A725:
	CLC					  ; $A725: 18	  
	RTS					  ; $A726: 60	  
loc_A727:
	BRK					  ; $A727: 00	  
	.byte $07			  ; $A728 - Unknown opcode
	.byte $1F			  ; $A729 - Unknown opcode
	BCC $A73D				; $A72A: 90 11   
	BRK					  ; $A72C: 00	  
	AND $AAA3				; $A72D: 2D A3 AA
	LDA $6E45,X			  ; $A730: BD 45 6E
	LDX #$07				 ; $A733: A2 07   
loc_A735:
	CMP $A73F,X			  ; $A735: DD 3F A7
	BEQ $A722				; $A738: F0 E8   
	DEX					  ; $A73A: CA	  
	BPL $A735				; $A73B: 10 F8   
loc_A73D:
	CLC					  ; $A73D: 18	  
	RTS					  ; $A73E: 60	  
	RTI					  ; $A73F: 40	  
	.byte $6F			  ; $A740 - Unknown opcode
	STY $9E93				; $A741: 8C 93 9E
	.byte $A3			  ; $A744 - Unknown opcode
	LDA ($B8,X)			  ; $A745: A1 B8   
	JSR $141D				; $A747: 20 1D 14
	BPL $A74C				; $A74A: 10 00   
loc_A74C:
	ASL system_flags		 ; $A74C: 06 1F   
	BCS $A75D				; $A74E: B0 0D   
	LDA #$03				 ; $A750: A9 03   
	BRK					  ; $A752: 00	  
	.byte $0C			  ; $A753 - Unknown opcode
	.byte $73			  ; $A754 - Unknown opcode
	BCS $A75F				; $A755: B0 08   
	LSR $7362				; $A757: 4E 62 73
	ROR $7361				; $A75A: 6E 61 73
loc_A75D:
	CLC					  ; $A75D: 18	  
	RTS					  ; $A75E: 60	  
loc_A75F:
	BRK					  ; $A75F: 00	  
	.byte $0B			  ; $A760 - Unknown opcode
	.byte $33			  ; $A761 - Unknown opcode
	JSR $A3F7				; $A762: 20 F7 A3 ; -> sub_A3F7
	CLC					  ; $A765: 18	  
	RTS					  ; $A766: 60	  
loc_A767:
	BRK					  ; $A767: 00	  
	.byte $07			  ; $A768 - Unknown opcode
	.byte $1F			  ; $A769 - Unknown opcode
	BCC $A789				; $A76A: 90 1D   
	BRK					  ; $A76C: 00	  
	AND $AAA3				; $A76D: 2D A3 AA
	LDA $6E45,X			  ; $A770: BD 45 6E
	CMP #$75				 ; $A773: C9 75	; Compare with 117
	BEQ $A77F				; $A775: F0 08   
	CMP #$5C				 ; $A777: C9 5C	; Compare with 92
	BEQ $A77F				; $A779: F0 04   
	CMP #$A8				 ; $A77B: C9 A8	; Compare with 168
	BNE $A789				; $A77D: D0 0A   
loc_A77F:
	LDA #$02				 ; $A77F: A9 02   
	STA $7361				; $A781: 8D 61 73
	LDA #$00				 ; $A784: A9 00   
	STA $7362				; $A786: 8D 62 73
loc_A789:
	CLC					  ; $A789: 18	  
	RTS					  ; $A78A: 60	  

; ---- Subroutine at $A78B (Bank 17) ----
sub_A78B:
	BRK					  ; $A78B: 00	  
	ASL system_flags		 ; $A78C: 06 1F   
	BCS $A7AA				; $A78E: B0 1A   
	JSR $A86D				; $A790: 20 6D A8 ; -> sub_A86D
	BEQ $A7AA				; $A793: F0 15   
	JSR $9848				; $A795: 20 48 98 ; -> sub_9848
	BCC $A7AA				; $A798: 90 10   
	CMP #$A0				 ; $A79A: C9 A0	; Compare with 160
	BNE $A7AA				; $A79C: D0 0C   
	BRK					  ; $A79E: 00	  
	.byte $07			  ; $A79F - Unknown opcode
	.byte $1F			  ; $A7A0 - Unknown opcode
	JSR $A7AB				; $A7A1: 20 AB A7 ; -> sub_A7AB
	BRK					  ; $A7A4: 00	  
	SBC $D3				  ; $A7A5: E5 D3	; Arithmetic
	.byte $6B			  ; $A7A7 - Unknown opcode
	PLA					  ; $A7A8: 68	  
	PLA					  ; $A7A9: 68	  
loc_A7AA:
	RTS					  ; $A7AA: 60	  

; ---- Subroutine at $A7AB (Bank 17) ----
sub_A7AB:
	LDA $7362				; $A7AB: AD 62 73
	BCC $A7BB				; $A7AE: 90 0B   
	STA $7D				  ; $A7B0: 85 7D   
	LDA $7361				; $A7B2: AD 61 73
	BRK					  ; $A7B5: 00	  
	.byte $02			  ; $A7B6 - Unknown opcode
	.byte $B3			  ; $A7B7 - Unknown opcode
	JMP $A7C3				; $A7B8: 4C C3 A7
loc_A7BB:
	STA $70				  ; $A7BB: 85 70   
	LDA $7361				; $A7BD: AD 61 73
	BRK					  ; $A7C0: 00	  
	.byte $02			  ; $A7C1 - Unknown opcode
	.byte $73			  ; $A7C2 - Unknown opcode
loc_A7C3:
	RTS					  ; $A7C3: 60	  

; ---- Subroutine at $A7C4 (Bank 17) ----
sub_A7C4:
	LDA $72E7				; $A7C4: AD E7 72
	LSR					  ; $A7C7: 4A	  
	BCS $A7EF				; $A7C8: B0 25   
	BRK					  ; $A7CA: 00	  
	ASL system_flags		 ; $A7CB: 06 1F   
	BCS $A7EF				; $A7CD: B0 20   
	JSR $A86D				; $A7CF: 20 6D A8 ; -> sub_A86D
	JSR $9848				; $A7D2: 20 48 98 ; -> sub_9848
	BCC $A7EF				; $A7D5: 90 18   
	CMP #$93				 ; $A7D7: C9 93	; Compare with 147
	BEQ $A7F0				; $A7D9: F0 15   
	CMP #$9D				 ; $A7DB: C9 9D	; Compare with 157
	BEQ $A829				; $A7DD: F0 4A   
	CMP #$98				 ; $A7DF: C9 98	; Compare with 152
	BEQ $A817				; $A7E1: F0 34   
	CMP #$99				 ; $A7E3: C9 99	; Compare with 153
	BEQ $A83B				; $A7E5: F0 54   
	CMP #$9C				 ; $A7E7: C9 9C	; Compare with 156
	BEQ $A855				; $A7E9: F0 6A   
	CMP #$A2				 ; $A7EB: C9 A2	; Compare with 162
	BEQ $A868				; $A7ED: F0 79   
loc_A7EF:
	RTS					  ; $A7EF: 60	  
loc_A7F0:
	JSR $9863				; $A7F0: 20 63 98 ; -> sub_9863
	LDA $7363				; $A7F3: AD 63 73
	PHA					  ; $A7F6: 48	  
	BRK					  ; $A7F7: 00	  
	ASL system_flags		 ; $A7F8: 06 1F   
	BCC $A803				; $A7FA: 90 07   
	BRK					  ; $A7FC: 00	  
	AND #$C3				 ; $A7FD: 29 C3   
	ASL $074C				; $A7FF: 0E 4C 07
	TAY					  ; $A802: A8	  
loc_A803:
	BRK					  ; $A803: 00	  
	LSR $93				  ; $A804: 46 93   
	.byte $07			  ; $A806 - Unknown opcode
	BCC $A812				; $A807: 90 09   
	BRK					  ; $A809: 00	  
	ORA (system_flags,X)	 ; $A80A: 01 1F   
	STA $7363				; $A80C: 8D 63 73
	JSR $90DB				; $A80F: 20 DB 90 ; -> sub_90DB
loc_A812:
	PLA					  ; $A812: 68	  
	STA $7363				; $A813: 8D 63 73
	RTS					  ; $A816: 60	  
loc_A817:
	LDA #$60				 ; $A817: A9 60   
	JSR $996D				; $A819: 20 6D 99 ; -> sub_996D
	BCC $A7EF				; $A81C: 90 D1   
	LDA #$53				 ; $A81E: A9 53   
	BRK					  ; $A820: 00	  
	ASL					  ; $A821: 0A	  
	.byte $1F			  ; $A822 - Unknown opcode
	JSR $9CC3				; $A823: 20 C3 9C ; -> sub_9CC3
	JMP $A84F				; $A826: 4C 4F A8
loc_A829:
	LDA #$20				 ; $A829: A9 20   
	JSR $996D				; $A82B: 20 6D 99 ; -> sub_996D
	BCC $A7EF				; $A82E: 90 BF   
	LDA #$1C				 ; $A830: A9 1C   
	BRK					  ; $A832: 00	  
	ASL					  ; $A833: 0A	  
	.byte $1F			  ; $A834 - Unknown opcode
	JSR $9EDD				; $A835: 20 DD 9E ; -> sub_9EDD
	JMP $A84F				; $A838: 4C 4F A8
loc_A83B:
	LDA #$20				 ; $A83B: A9 20   
	JSR $996D				; $A83D: 20 6D 99 ; -> sub_996D
	BCC $A7EF				; $A840: 90 AD   
	LDA $6E44				; $A842: AD 44 6E
	BMI $A7EF				; $A845: 30 A8   
	LDA #$55				 ; $A847: A9 55   
	BRK					  ; $A849: 00	  
	ASL					  ; $A84A: 0A	  
	.byte $1F			  ; $A84B - Unknown opcode
	JSR $AFF4				; $A84C: 20 F4 AF ; -> sub_AFF4
loc_A84F:
	LDA #$43				 ; $A84F: A9 43   
	BRK					  ; $A851: 00	  
	ASL					  ; $A852: 0A	  
	.byte $1F			  ; $A853 - Unknown opcode
	RTS					  ; $A854: 60	  
loc_A855:
	JSR $9863				; $A855: 20 63 98 ; -> sub_9863
	BRK					  ; $A858: 00	  
	ASL system_flags		 ; $A859: 06 1F   
	JSR $A7AB				; $A85B: 20 AB A7 ; -> sub_A7AB
	BRK					  ; $A85E: 00	  
	ASL system_flags		 ; $A85F: 06 1F   
	STA $F9				  ; $A861: 85 F9   
	BRK					  ; $A863: 00	  
	CMP $D3				  ; $A864: C5 D3   
	.byte $6B			  ; $A866 - Unknown opcode
	RTS					  ; $A867: 60	  
loc_A868:
	BRK					  ; $A868: 00	  
	SBC #$D3				 ; $A869: E9 D3	; Arithmetic
	.byte $E7			  ; $A86B - Unknown opcode
	RTS					  ; $A86C: 60	  

; ---- Subroutine at $A86D (Bank 17) ----
sub_A86D:
	BRK					  ; $A86D: 00	  
	.byte $03			  ; $A86E - Unknown opcode
	.byte $1F			  ; $A86F - Unknown opcode
	CMP #$82				 ; $A870: C9 82	; Compare with 130
	RTS					  ; $A872: 60	  

; ---- Subroutine at $A873 (Bank 17) ----
sub_A873:
	BRK					  ; $A873: 00	  
	.byte $07			  ; $A874 - Unknown opcode
	.byte $1F			  ; $A875 - Unknown opcode
	BCS $A886				; $A876: B0 0E   
	BRK					  ; $A878: 00	  
	.byte $3B			  ; $A879 - Unknown opcode
	.byte $93			  ; $A87A - Unknown opcode
	ORA ($90,X)			  ; $A87B: 01 90   
	PHP					  ; $A87D: 08	  
	CMP #$B6				 ; $A87E: C9 B6	; Compare with 182
	BEQ $A887				; $A880: F0 05   
	CMP #$B8				 ; $A882: C9 B8	; Compare with 184
	BEQ $A8A7				; $A884: F0 21   
loc_A886:
	RTS					  ; $A886: 60	  
loc_A887:
	BRK					  ; $A887: 00	  
	.byte $03			  ; $A888 - Unknown opcode
	.byte $1F			  ; $A889 - Unknown opcode
	BRK					  ; $A88A: 00	  
	ASL					  ; $A88B: 0A	  
	.byte $3F			  ; $A88C - Unknown opcode
	BCC $A8A6				; $A88D: 90 17   
loc_A88F:
	STA $6F				  ; $A88F: 85 6F   
	BRK					  ; $A891: 00	  
	.byte $1B			  ; $A892 - Unknown opcode
	.byte $0F			  ; $A893 - Unknown opcode
	CMP #$20				 ; $A894: C9 20	; Compare with 32
	BCS $A8A6				; $A896: B0 0E   
	BRK					  ; $A898: 00	  
	.byte $07			  ; $A899 - Unknown opcode
	.byte $1F			  ; $A89A - Unknown opcode
	BRK					  ; $A89B: 00	  
	ORA #$53				 ; $A89C: 09 53   
	ORA $73				  ; $A89E: 05 73   
	BEQ $A8A6				; $A8A0: F0 04   
	BRK					  ; $A8A2: 00	  
	SBC #$D3				 ; $A8A3: E9 D3	; Arithmetic
	.byte $83			  ; $A8A5 - Unknown opcode
loc_A8A6:
	RTS					  ; $A8A6: 60	  
loc_A8A7:
	BRK					  ; $A8A7: 00	  
	.byte $03			  ; $A8A8 - Unknown opcode
	.byte $1F			  ; $A8A9 - Unknown opcode
	CMP #$43				 ; $A8AA: C9 43	; Compare with 67
	BCC $A8A6				; $A8AC: 90 F8   
	CMP #$49				 ; $A8AE: C9 49	; Compare with 73
	BCS $A8A6				; $A8B0: B0 F4   
	BRK					  ; $A8B2: 00	  
	.byte $1B			  ; $A8B3 - Unknown opcode
	.byte $0F			  ; $A8B4 - Unknown opcode
	CMP #$80				 ; $A8B5: C9 80	; Compare with 128
	BCS $A8A6				; $A8B7: B0 ED   
	JMP $A7F0				; $A8B9: 4C F0 A7

; ---- Subroutine at $A8BC (Bank 17) ----
sub_A8BC:
	BRK					  ; $A8BC: 00	  
	.byte $07			  ; $A8BD - Unknown opcode
	.byte $1F			  ; $A8BE - Unknown opcode
	BCS $A8A6				; $A8BF: B0 E5   
	BRK					  ; $A8C1: 00	  
	.byte $3B			  ; $A8C2 - Unknown opcode
	.byte $93			  ; $A8C3 - Unknown opcode
	.byte $02			  ; $A8C4 - Unknown opcode
	BCC $A8A6				; $A8C5: 90 DF   
	CMP #$C1				 ; $A8C7: C9 C1	; Compare with 193
	BNE $A8A6				; $A8C9: D0 DB   
	BRK					  ; $A8CB: 00	  
	.byte $03			  ; $A8CC - Unknown opcode
	.byte $1F			  ; $A8CD - Unknown opcode
	CMP #$13				 ; $A8CE: C9 13	; Compare with 19
	BCS $A8A6				; $A8D0: B0 D4   
	JMP $A7F0				; $A8D2: 4C F0 A7

; ---- Subroutine at $A8D5 (Bank 17) ----
sub_A8D5:
	BRK					  ; $A8D5: 00	  
	.byte $07			  ; $A8D6 - Unknown opcode
	.byte $1F			  ; $A8D7 - Unknown opcode
	BCS $A8EB				; $A8D8: B0 11   
	BRK					  ; $A8DA: 00	  
	LSR $93				  ; $A8DB: 46 93   
	BPL $A88F				; $A8DD: 10 B0   
	ASL tmp0				 ; $A8DF: 06 00   
	LSR $93				  ; $A8E1: 46 93   
	ASL $90				  ; $A8E3: 06 90   
	ORA $A9				  ; $A8E5: 05 A9   
	.byte $80			  ; $A8E7 - Unknown opcode
	BRK					  ; $A8E8: 00	  
	PHP					  ; $A8E9: 08	  
	.byte $3F			  ; $A8EA - Unknown opcode
loc_A8EB:
	RTS					  ; $A8EB: 60	  

; ---- Subroutine at $A8EC (Bank 17) ----
sub_A8EC:
	LDX #$0B				 ; $A8EC: A2 0B   
loc_A8EE:
	LDA $72F4,X			  ; $A8EE: BD F4 72
	AND #$70				 ; $A8F1: 29 70   
	BNE $A8FD				; $A8F3: D0 08   
	LDA $72F4,X			  ; $A8F5: BD F4 72
	BPL $A904				; $A8F8: 10 0A   
	JSR $A97A				; $A8FA: 20 7A A9 ; -> sub_A97A
loc_A8FD:
	JSR $A9F0				; $A8FD: 20 F0 A9 ; -> sub_A9F0
	DEX					  ; $A900: CA	  
	BPL $A8EE				; $A901: 10 EB   
	RTS					  ; $A903: 60	  
loc_A904:
	LDA $7300,X			  ; $A904: BD 00 73
	AND #$70				 ; $A907: 29 70   
	BNE $A911				; $A909: D0 06   
	JSR $A914				; $A90B: 20 14 A9 ; -> sub_A914
	JSR $A950				; $A90E: 20 50 A9 ; -> sub_A950
loc_A911:
	JMP $A8FD				; $A911: 4C FD A8

; ---- Subroutine at $A914 (Bank 17) ----
sub_A914:
	LDA $7324,X			  ; $A914: BD 24 73
	CMP #$26				 ; $A917: C9 26	; Compare with 38
	BNE $A94F				; $A919: D0 34   
	STX tmp2				 ; $A91B: 86 02   
	LDX #$0B				 ; $A91D: A2 0B   
loc_A91F:
	LDA $7348,X			  ; $A91F: BD 48 73
	AND #$0F				 ; $A922: 29 0F   
	BEQ $A929				; $A924: F0 03   
	DEX					  ; $A926: CA	  
	BPL $A91F				; $A927: 10 F6   
loc_A929:
	LDY tmp2				 ; $A929: A4 02   
	LDA $7348,Y			  ; $A92B: B9 48 73
	AND #$0F				 ; $A92E: 29 0F   
	STA tmp1				 ; $A930: 85 01   
	LDA $7348,Y			  ; $A932: B9 48 73
	AND #$F0				 ; $A935: 29 F0   
	STA tmp0				 ; $A937: 85 00   
	LDA $7348,X			  ; $A939: BD 48 73
	AND #$0F				 ; $A93C: 29 0F   
	ORA tmp0				 ; $A93E: 05 00   
	STA $7348,Y			  ; $A940: 99 48 73
	LDA $7348,X			  ; $A943: BD 48 73
	AND #$F0				 ; $A946: 29 F0   
	ORA tmp1				 ; $A948: 05 01   
	STA $7348,X			  ; $A94A: 9D 48 73
	LDX tmp2				 ; $A94D: A6 02   
loc_A94F:
	RTS					  ; $A94F: 60	  

; ---- Subroutine at $A950 (Bank 17) ----
sub_A950:
	LDA $7324,X			  ; $A950: BD 24 73
	CMP #$12				 ; $A953: C9 12	; Compare with 18
	BNE $A979				; $A955: D0 22   
	STX tmp0				 ; $A957: 86 00   
	LDX #$0B				 ; $A959: A2 0B   
loc_A95B:
	LDA $72F4,X			  ; $A95B: BD F4 72
	BMI $A974				; $A95E: 30 14   
	AND #$70				 ; $A960: 29 70   
	CMP #$70				 ; $A962: C9 70	; Compare with 112
	BEQ $A974				; $A964: F0 0E   
	CPX tmp0				 ; $A966: E4 00   
	BEQ $A974				; $A968: F0 0A   
	LDA $72F4,X			  ; $A96A: BD F4 72
	AND #$8F				 ; $A96D: 29 8F   
	ORA #$20				 ; $A96F: 09 20   
	STA $72F4,X			  ; $A971: 9D F4 72
loc_A974:
	DEX					  ; $A974: CA	  
	BPL $A95B				; $A975: 10 E4   
	LDX tmp0				 ; $A977: A6 00   
loc_A979:
	RTS					  ; $A979: 60	  

; ---- Subroutine at $A97A (Bank 17) ----
sub_A97A:
	LDA $7324,X			  ; $A97A: BD 24 73
	CMP #$66				 ; $A97D: C9 66	; Compare with 102
	BCC $A9E7				; $A97F: 90 66   
	CMP #$69				 ; $A981: C9 69	; Compare with 105
	BCS $A9E7				; $A983: B0 62   
	TXA					  ; $A985: 8A	  
	PHA					  ; $A986: 48	  
	LDA $72F4,X			  ; $A987: BD F4 72
	AND #$07				 ; $A98A: 29 07   
	STA tmp0				 ; $A98C: 85 00   
	TAX					  ; $A98E: AA	  
	BRK					  ; $A98F: 00	  
	AND $A2B3				; $A990: 2D B3 A2
	.byte $FF			  ; $A993 - Unknown opcode
	BRK					  ; $A994: 00	  
	AND $A6B3				; $A995: 2D B3 A6
	BRK					  ; $A998: 00	  
	BRK					  ; $A999: 00	  
	AND #$0F				 ; $A99A: 29 0F   
	EOR #$FF				 ; $A99C: 49 FF   
	AND $7E				  ; $A99E: 25 7E   
	BEQ $A9E8				; $A9A0: F0 46   
	STA tmp0				 ; $A9A2: 85 00   
	BRK					  ; $A9A4: 00	  
	AND #$C3				 ; $A9A5: 29 C3   
	ASL $0025				; $A9A7: 0E 25 00
	BEQ $A9E8				; $A9AA: F0 3C   
	STA tmp0				 ; $A9AC: 85 00   
	BRK					  ; $A9AE: 00	  
	AND #$C3				 ; $A9AF: 29 C3   
	ORA $0025				; $A9B1: 0D 25 00
	BEQ $A9E8				; $A9B4: F0 32   
	STA tmp0				 ; $A9B6: 85 00   
	BRK					  ; $A9B8: 00	  
	AND #$C3				 ; $A9B9: 29 C3   
	BRK					  ; $A9BB: 00	  
	AND tmp0				 ; $A9BC: 25 00   
	BEQ $A9E8				; $A9BE: F0 28   
	STA tmp0				 ; $A9C0: 85 00   
	BRK					  ; $A9C2: 00	  
	AND #$C3				 ; $A9C3: 29 C3   
	ORA ($25),Y			  ; $A9C5: 11 25   
	BRK					  ; $A9C7: 00	  
	BEQ $A9E8				; $A9C8: F0 1E   
	STA tmp0				 ; $A9CA: 85 00   
	LDX #$07				 ; $A9CC: A2 07   
loc_A9CE:
	TXA					  ; $A9CE: 8A	  
	PHA					  ; $A9CF: 48	  
	ASL tmp0				 ; $A9D0: 06 00   
	BCC $A9E0				; $A9D2: 90 0C   
	ORA #$80				 ; $A9D4: 09 80   
	BRK					  ; $A9D6: 00	  
	ORA #$1F				 ; $A9D7: 09 1F   
	BCC $A9E0				; $A9D9: 90 05   
	LDA #$02				 ; $A9DB: A9 02   
	BRK					  ; $A9DD: 00	  
	PHP					  ; $A9DE: 08	  
	.byte $1F			  ; $A9DF - Unknown opcode
loc_A9E0:
	PLA					  ; $A9E0: 68	  
	TAX					  ; $A9E1: AA	  
	DEX					  ; $A9E2: CA	  
	BPL $A9CE				; $A9E3: 10 E9   
	PLA					  ; $A9E5: 68	  
	TAX					  ; $A9E6: AA	  
loc_A9E7:
	RTS					  ; $A9E7: 60	  
loc_A9E8:
	PLA					  ; $A9E8: 68	  
	TAX					  ; $A9E9: AA	  
	LDA #$F7				 ; $A9EA: A9 F7   
	STA $7324,X			  ; $A9EC: 9D 24 73
	RTS					  ; $A9EF: 60	  

; ---- Subroutine at $A9F0 (Bank 17) ----
sub_A9F0:
	TXA					  ; $A9F0: 8A	  
	PHA					  ; $A9F1: 48	  
	LDA $7300,X			  ; $A9F2: BD 00 73
	AND #$70				 ; $A9F5: 29 70   
	BNE $AA04				; $A9F7: D0 0B   
	LDA $7324,X			  ; $A9F9: BD 24 73
	CMP #$41				 ; $A9FC: C9 41	; Compare with 65
	BEQ $AA07				; $A9FE: F0 07   
	CMP #$42				 ; $AA00: C9 42	; Compare with 66
	BEQ $AA0B				; $AA02: F0 07   
loc_AA04:
	PLA					  ; $AA04: 68	  
	TAX					  ; $AA05: AA	  
	RTS					  ; $AA06: 60	  
loc_AA07:
	LDA #$00				 ; $AA07: A9 00   
	BEQ $AA0D				; $AA09: F0 02   
loc_AA0B:
	LDA #$01				 ; $AA0B: A9 01   
loc_AA0D:
	STA $70				  ; $AA0D: 85 70   
	STA $7D				  ; $AA0F: 85 7D   
	LDA #$19				 ; $AA11: A9 19   
	LDX #$09				 ; $AA13: A2 09   
	STA $6F				  ; $AA15: 85 6F   
	STX $7C				  ; $AA17: 86 7C   
	PLA					  ; $AA19: 68	  
	TAX					  ; $AA1A: AA	  
	PHA					  ; $AA1B: 48	  
	LDA $72F4,X			  ; $AA1C: BD F4 72
	BPL $AA31				; $AA1F: 10 10   
	AND #$07				 ; $AA21: 29 07   
	TAX					  ; $AA23: AA	  
	LDA $6E44				; $AA24: AD 44 6E
	AND #$02				 ; $AA27: 29 02   
	BNE $AA2E				; $AA29: D0 03   
	BRK					  ; $AA2B: 00	  
	ROL					  ; $AA2C: 2A	  
	.byte $A3			  ; $AA2D - Unknown opcode
loc_AA2E:
	PLA					  ; $AA2E: 68	  
	TAX					  ; $AA2F: AA	  
	RTS					  ; $AA30: 60	  
loc_AA31:
	STA tmp0				 ; $AA31: 85 00   
	LDA $6F				  ; $AA33: A5 6F   
	PHA					  ; $AA35: 48	  
	LDA tmp0				 ; $AA36: A5 00   
	BRK					  ; $AA38: 00	  
	.byte $67			  ; $AA39 - Unknown opcode
	.byte $73			  ; $AA3A - Unknown opcode
	TAX					  ; $AA3B: AA	  
	PLA					  ; $AA3C: 68	  
	STA $6F				  ; $AA3D: 85 6F   
	LDA $6E44				; $AA3F: AD 44 6E
	AND #$01				 ; $AA42: 29 01   
	BNE $AA49				; $AA44: D0 03   
	BRK					  ; $AA46: 00	  
	.byte $44			  ; $AA47 - Unknown opcode
	.byte $53			  ; $AA48 - Unknown opcode
loc_AA49:
	PLA					  ; $AA49: 68	  
	TAX					  ; $AA4A: AA	  
	RTS					  ; $AA4B: 60	  

; ---- Subroutine at $AA4C (Bank 17) ----
sub_AA4C:
	INC $6E81				; $AA4C: EE 81 6E
	JSR $AA62				; $AA4F: 20 62 AA ; -> sub_AA62
	JSR $AA8C				; $AA52: 20 8C AA ; -> sub_AA8C
	JSR $AA95				; $AA55: 20 95 AA ; -> sub_AA95
	JSR $AAB1				; $AA58: 20 B1 AA ; -> sub_AAB1
	JSR $AAEE				; $AA5B: 20 EE AA ; -> sub_AAEE
	JSR $AAE0				; $AA5E: 20 E0 AA ; -> sub_AAE0
	RTS					  ; $AA61: 60	  

; ---- Subroutine at $AA62 (Bank 17) ----
sub_AA62:
	LDY #$00				 ; $AA62: A0 00   
loc_AA64:
	LDA $72F4,Y			  ; $AA64: B9 F4 72
	AND #$70				 ; $AA67: 29 70   
	CMP #$70				 ; $AA69: C9 70	; Compare with 112
	BEQ $AA86				; $AA6B: F0 19   
	LDA $72F4,Y			  ; $AA6D: B9 F4 72
	BPL $AA7C				; $AA70: 10 0A   
	AND #$07				 ; $AA72: 29 07   
	TAX					  ; $AA74: AA	  
	BRK					  ; $AA75: 00	  
	.byte $2B			  ; $AA76 - Unknown opcode
	.byte $C3			  ; $AA77 - Unknown opcode
	ORA #$4C				 ; $AA78: 09 4C   
	STX $AA				  ; $AA7A: 86 AA   
loc_AA7C:
	AND #$0F				 ; $AA7C: 29 0F   
	BRK					  ; $AA7E: 00	  
	.byte $67			  ; $AA7F - Unknown opcode
	.byte $73			  ; $AA80 - Unknown opcode
	TAX					  ; $AA81: AA	  
	BRK					  ; $AA82: 00	  
	EOR $93				  ; $AA83: 45 93   
	ORA $C0C8,Y			  ; $AA85: 19 C8 C0
	.byte $0C			  ; $AA88 - Unknown opcode
	BNE $AA64				; $AA89: D0 D9   
	RTS					  ; $AA8B: 60	  

; ---- Subroutine at $AA8C (Bank 17) ----
sub_AA8C:
	LDA $6E44				; $AA8C: AD 44 6E
	AND #$FC				 ; $AA8F: 29 FC   
	STA $6E44				; $AA91: 8D 44 6E
	RTS					  ; $AA94: 60	  

; ---- Subroutine at $AA95 (Bank 17) ----
sub_AA95:
	LDA $72E5				; $AA95: AD E5 72
	BPL $AAB0				; $AA98: 10 16   
	LDA $72E6				; $AA9A: AD E6 72
	AND #$C0				 ; $AA9D: 29 C0   
	BNE $AAB0				; $AA9F: D0 0F   
	LDA $72E5				; $AAA1: AD E5 72
	AND #$7F				 ; $AAA4: 29 7F   
	STA $72E5				; $AAA6: 8D E5 72
	BRK					  ; $AAA9: 00	  
	SBC ($D3,X)			  ; $AAAA: E1 D3	; Arithmetic
	.byte $89			  ; $AAAC - Unknown opcode
	BRK					  ; $AAAD: 00	  
	ORA $60FB				; $AAAE: 0D FB 60

; ---- Subroutine at $AAB1 (Bank 17) ----
sub_AAB1:
	LDA $72E6				; $AAB1: AD E6 72
	AND #$30				 ; $AAB4: 29 30   
	BEQ $AADF				; $AAB6: F0 27   
	LDA $72E6				; $AAB8: AD E6 72
	SEC					  ; $AABB: 38	  
	SBC #$10				 ; $AABC: E9 10	; Arithmetic
	STA $72E6				; $AABE: 8D E6 72
	AND #$30				 ; $AAC1: 29 30   
	BNE $AADF				; $AAC3: D0 1A   
	LDY #$F9				 ; $AAC5: A0 F9   
	BRK					  ; $AAC7: 00	  
	.byte $62			  ; $AAC8 - Unknown opcode
	.byte $43			  ; $AAC9 - Unknown opcode
	EOR ($C9,X)			  ; $AACA: 41 C9   
	.byte $02			  ; $AACC - Unknown opcode
	BCS $AAD0				; $AACD: B0 01   
	INY					  ; $AACF: C8	  
loc_AAD0:
	LDA #$00				 ; $AAD0: A9 00   
	STA $6E				  ; $AAD2: 85 6E   
	LDA #$41				 ; $AAD4: A9 41   
	BRK					  ; $AAD6: 00	  
	AND $850F				; $AAD7: 2D 0F 85
	SBC $0098,Y			  ; $AADA: F9 98 00 ; Arithmetic
	CMP ($E3,X)			  ; $AADD: C1 E3   
loc_AADF:
	RTS					  ; $AADF: 60	  

; ---- Subroutine at $AAE0 (Bank 17) ----
sub_AAE0:
	LDA $6E45				; $AAE0: AD 45 6E
	CMP #$BA				 ; $AAE3: C9 BA	; Compare with 186
	BNE $AAED				; $AAE5: D0 06   
	BRK					  ; $AAE7: 00	  
	ASL $2F,X				; $AAE8: 16 2F   
	BRK					  ; $AAEA: 00	  
	ORA $2F,X				; $AAEB: 15 2F   
loc_AAED:
	RTS					  ; $AAED: 60	  

; ---- Subroutine at $AAEE (Bank 17) ----
sub_AAEE:
	LDA $6E45				; $AAEE: AD 45 6E
	CMP #$BB				 ; $AAF1: C9 BB	; Compare with 187
	BNE $AB06				; $AAF3: D0 11   
	LDA $615A				; $AAF5: AD 5A 61
	CMP #$03				 ; $AAF8: C9 03	; Compare with 3
	BNE $AB06				; $AAFA: D0 0A   
	LDX #$FF				 ; $AAFC: A2 FF   
	STA $7D				  ; $AAFE: 85 7D   
	TXA					  ; $AB00: 8A	  
	INX					  ; $AB01: E8	  
	BRK					  ; $AB02: 00	  
	.byte $02			  ; $AB03 - Unknown opcode
	.byte $B3			  ; $AB04 - Unknown opcode
	RTS					  ; $AB05: 60	  
loc_AB06:
	LDX #$07				 ; $AB06: A2 07   
loc_AB08:
	BRK					  ; $AB08: 00	  
	AND #$C3				 ; $AB09: 29 C3   
	ASL $1890				; $AB0B: 0E 90 18
	BRK					  ; $AB0E: 00	  
	AND ($B3,X)			  ; $AB0F: 21 B3   
	ASL					  ; $AB11: 0A	  
	TAY					  ; $AB12: A8	  
	LDA $AB41,Y			  ; $AB13: B9 41 AB
	BRK					  ; $AB16: 00	  
	.byte $17			  ; $AB17 - Unknown opcode
	.byte $0F			  ; $AB18 - Unknown opcode
	CLC					  ; $AB19: 18	  
	ADC $AB42,Y			  ; $AB1A: 79 42 AB ; Arithmetic
	STA $7C				  ; $AB1D: 85 7C   
	LDA #$00				 ; $AB1F: A9 00   
	STA $7D				  ; $AB21: 85 7D   
	BRK					  ; $AB23: 00	  
	.byte $02			  ; $AB24 - Unknown opcode
	.byte $A3			  ; $AB25 - Unknown opcode
	DEX					  ; $AB26: CA	  
	BPL $AB08				; $AB27: 10 DF   
	RTS					  ; $AB29: 60	  

; ---- Subroutine at $AB2A (Bank 17) ----
sub_AB2A:
	LDX #$00				 ; $AB2A: A2 00   
	LDY #$09				 ; $AB2C: A0 09   
loc_AB2E:
	LDA #$00				 ; $AB2E: A9 00   
	STA $7215,X			  ; $AB30: 9D 15 72
	STA $7216,X			  ; $AB33: 9D 16 72
	TXA					  ; $AB36: 8A	  
	CLC					  ; $AB37: 18	  
	ADC #$0A				 ; $AB38: 69 0A	; Arithmetic
	TAX					  ; $AB3A: AA	  
	DEY					  ; $AB3B: 88	  
	BPL $AB2E				; $AB3C: 10 F0   
	JMP $A3F7				; $AB3E: 4C F7 A3
	BRK					  ; $AB41: 00	  
	BRK					  ; $AB42: 00	  
	PHP					  ; $AB43: 08	  
	BPL $AB52				; $AB44: 10 0C   
	BIT $5A14				; $AB46: 2C 14 5A

; ---- Subroutine at $AB49 (Bank 17) ----
sub_AB49:
	STA tmp0				 ; $AB49: 85 00   
	STY tmp1				 ; $AB4B: 84 01   
	TYA					  ; $AB4D: 98	  
	BRK					  ; $AB4E: 00	  
	ASL					  ; $AB4F: 0A	  
	.byte $3F			  ; $AB50 - Unknown opcode
	BCC $AB69				; $AB51: 90 16   
	STA tmp2				 ; $AB53: 85 02   
	LDA tmp0				 ; $AB55: A5 00   
	BPL $AB76				; $AB57: 10 1D   
	AND #$07				 ; $AB59: 29 07   
	TAX					  ; $AB5B: AA	  
	LDA tmp1				 ; $AB5C: A5 01   
	CMP #$32				 ; $AB5E: C9 32	; Compare with 50
	BEQ $AB6B				; $AB60: F0 09   
	LDA tmp2				 ; $AB62: A5 02   
	BRK					  ; $AB64: 00	  
	.byte $0B			  ; $AB65 - Unknown opcode
	.byte $B3			  ; $AB66 - Unknown opcode
	BCC $AB74				; $AB67: 90 0B   
loc_AB69:
	SEC					  ; $AB69: 38	  
	RTS					  ; $AB6A: 60	  
loc_AB6B:
	LDA #$FF				 ; $AB6B: A9 FF   
	STA tmp2				 ; $AB6D: 85 02   
	BRK					  ; $AB6F: 00	  
	.byte $07			  ; $AB70 - Unknown opcode
	.byte $A3			  ; $AB71 - Unknown opcode
	BNE $AB69				; $AB72: D0 F5   
loc_AB74:
	CLC					  ; $AB74: 18	  
	RTS					  ; $AB75: 60	  
loc_AB76:
	BRK					  ; $AB76: 00	  
	.byte $67			  ; $AB77 - Unknown opcode
	.byte $73			  ; $AB78 - Unknown opcode
	TAX					  ; $AB79: AA	  
	LDA tmp1				 ; $AB7A: A5 01   
	CMP #$32				 ; $AB7C: C9 32	; Compare with 50
	BEQ $AB8A				; $AB7E: F0 0A   
	CMP #$12				 ; $AB80: C9 12	; Compare with 18
	BEQ $AB97				; $AB82: F0 13   
	LDA tmp2				 ; $AB84: A5 02   
	BRK					  ; $AB86: 00	  
	.byte $0C			  ; $AB87 - Unknown opcode
	.byte $73			  ; $AB88 - Unknown opcode
	RTS					  ; $AB89: 60	  
loc_AB8A:
	LDA #$FF				 ; $AB8A: A9 FF   
	STA tmp2				 ; $AB8C: 85 02   
	BRK					  ; $AB8E: 00	  
	.byte $07			  ; $AB8F - Unknown opcode
	.byte $53			  ; $AB90 - Unknown opcode
	ORA $73				  ; $AB91: 05 73   
	BNE $AB69				; $AB93: D0 D4   
	BEQ $AB74				; $AB95: F0 DD   
loc_AB97:
	BRK					  ; $AB97: 00	  
	.byte $62			  ; $AB98 - Unknown opcode
	.byte $23			  ; $AB99 - Unknown opcode
	.byte $43			  ; $AB9A - Unknown opcode
	CMP #$04				 ; $AB9B: C9 04	; Compare with 4
	BCC $AB74				; $AB9D: 90 D5   
	LDX #$03				 ; $AB9F: A2 03   
loc_ABA1:
	LDA tmp2				 ; $ABA1: A5 02   
	BRK					  ; $ABA3: 00	  
	.byte $0C			  ; $ABA4 - Unknown opcode
	.byte $73			  ; $ABA5 - Unknown opcode
	ROL tmp3				 ; $ABA6: 26 03   
	DEX					  ; $ABA8: CA	  
	BPL $ABA1				; $ABA9: 10 F6   
	LDA tmp3				 ; $ABAB: A5 03   
	AND #$0F				 ; $ABAD: 29 0F   
	CMP #$0F				 ; $ABAF: C9 0F	; Compare with 15
	BNE $AB74				; $ABB1: D0 C1   
	BEQ $AB69				; $ABB3: F0 B4   

; ---- Subroutine at $ABB5 (Bank 17) ----
sub_ABB5:
	BRK					  ; $ABB5: 00	  
	.byte $03			  ; $ABB6 - Unknown opcode
	.byte $1F			  ; $ABB7 - Unknown opcode
	TAY					  ; $ABB8: A8	  
	BRK					  ; $ABB9: 00	  
	ORA (system_flags,X)	 ; $ABBA: 01 1F   
	JSR $AB49				; $ABBC: 20 49 AB ; -> sub_AB49
	BCC $AC00				; $ABBF: 90 3F   
	LDA tmp1				 ; $ABC1: A5 01   
	BRK					  ; $ABC3: 00	  
	ASL					  ; $ABC4: 0A	  
	.byte $3F			  ; $ABC5 - Unknown opcode
	BCC $ABFE				; $ABC6: 90 36   
	BRK					  ; $ABC8: 00	  
	ASL system_flags		 ; $ABC9: 06 1F   
	BCC $ABD8				; $ABCB: 90 0B   
	LDA tmp2				 ; $ABCD: A5 02   
	BRK					  ; $ABCF: 00	  
	ASL					  ; $ABD0: 0A	  
	.byte $B3			  ; $ABD1 - Unknown opcode
	BRK					  ; $ABD2: 00	  
	.byte $2B			  ; $ABD3 - Unknown opcode
	.byte $C3			  ; $ABD4 - Unknown opcode
	.byte $13			  ; $ABD5 - Unknown opcode
	SEC					  ; $ABD6: 38	  
	RTS					  ; $ABD7: 60	  
loc_ABD8:
	LDA tmp1				 ; $ABD8: A5 01   
	CMP #$12				 ; $ABDA: C9 12	; Compare with 18
	BEQ $ABF0				; $ABDC: F0 12   
	LDA tmp2				 ; $ABDE: A5 02   
	CMP #$FF				 ; $ABE0: C9 FF	; Compare with 255
	BEQ $ABEA				; $ABE2: F0 06   
	BRK					  ; $ABE4: 00	  
	.byte $0B			  ; $ABE5 - Unknown opcode
	.byte $73			  ; $ABE6 - Unknown opcode
	JMP $ABFA				; $ABE7: 4C FA AB
loc_ABEA:
	BRK					  ; $ABEA: 00	  
	ORA $4C73				; $ABEB: 0D 73 4C
	.byte $FA			  ; $ABEE - Unknown opcode
	.byte $AB			  ; $ABEF - Unknown opcode
loc_ABF0:
	LDX #$03				 ; $ABF0: A2 03   
loc_ABF2:
	LDA tmp2				 ; $ABF2: A5 02   
	BRK					  ; $ABF4: 00	  
	.byte $0B			  ; $ABF5 - Unknown opcode
	.byte $73			  ; $ABF6 - Unknown opcode
	DEX					  ; $ABF7: CA	  
	BPL $ABF2				; $ABF8: 10 F8   
loc_ABFA:
	BRK					  ; $ABFA: 00	  
	.byte $07			  ; $ABFB - Unknown opcode
	.byte $6F			  ; $ABFC - Unknown opcode
	.byte $2B			  ; $ABFD - Unknown opcode
loc_ABFE:
	SEC					  ; $ABFE: 38	  
	RTS					  ; $ABFF: 60	  
loc_AC00:
	LDA tmp1				 ; $AC00: A5 01   
	CMP #$12				 ; $AC02: C9 12	; Compare with 18
	BEQ $AC15				; $AC04: F0 0F   
	BRK					  ; $AC06: 00	  
	CPX $D3				  ; $AC07: E4 D3   
	ORA (tmp0,X)			 ; $AC09: 01 00   
	ASL system_flags		 ; $AC0B: 06 1F   
	BCC $AC13				; $AC0D: 90 04   
	BRK					  ; $AC0F: 00	  
	ROL					  ; $AC10: 2A	  
	.byte $C3			  ; $AC11 - Unknown opcode
	.byte $13			  ; $AC12 - Unknown opcode
loc_AC13:
	CLC					  ; $AC13: 18	  
	RTS					  ; $AC14: 60	  
loc_AC15:
	BRK					  ; $AC15: 00	  
	.byte $62			  ; $AC16 - Unknown opcode
	.byte $23			  ; $AC17 - Unknown opcode
	.byte $43			  ; $AC18 - Unknown opcode
	CMP #$04				 ; $AC19: C9 04	; Compare with 4
	BCC $AC34				; $AC1B: 90 17   
	LDX #$00				 ; $AC1D: A2 00   
loc_AC1F:
	LSR tmp3				 ; $AC1F: 46 03   
	BCS $AC29				; $AC21: B0 06   
	STX $F9				  ; $AC23: 86 F9   
	BRK					  ; $AC25: 00	  
	CMP $D3				  ; $AC26: C5 D3   
	ADC ($E8,X)			  ; $AC28: 61 E8	; Arithmetic
	CPX #$04				 ; $AC2A: E0 04   
	BCC $AC1F				; $AC2C: 90 F1   
	BRK					  ; $AC2E: 00	  
	SBC #$D3				 ; $AC2F: E9 D3	; Arithmetic
	.byte $62			  ; $AC31 - Unknown opcode
	CLC					  ; $AC32: 18	  
	RTS					  ; $AC33: 60	  
loc_AC34:
	BRK					  ; $AC34: 00	  
	SBC $D3				  ; $AC35: E5 D3	; Arithmetic
	RTS					  ; $AC37: 60	  
	CLC					  ; $AC38: 18	  
	RTS					  ; $AC39: 60	  

; ---- Subroutine at $AC3A (Bank 17) ----
sub_AC3A:
	BRK					  ; $AC3A: 00	  
	.byte $03			  ; $AC3B - Unknown opcode
	.byte $1F			  ; $AC3C - Unknown opcode
	CMP #$3E				 ; $AC3D: C9 3E	; Compare with 62
	BEQ $AC5B				; $AC3F: F0 1A   
	CMP #$3F				 ; $AC41: C9 3F	; Compare with 63
	BEQ $AC5B				; $AC43: F0 16   
	CMP #$F3				 ; $AC45: C9 F3	; Compare with 243
	BEQ $AC5B				; $AC47: F0 12   
	CMP #$F4				 ; $AC49: C9 F4	; Compare with 244
	BEQ $AC5B				; $AC4B: F0 0E   

; ---- Subroutine at $AC4D (Bank 17) ----
sub_AC4D:
	BRK					  ; $AC4D: 00	  
	ASL system_flags		 ; $AC4E: 06 1F   
	BCC $AC57				; $AC50: 90 05   
	BRK					  ; $AC52: 00	  
	.byte $2B			  ; $AC53 - Unknown opcode
	.byte $C3			  ; $AC54 - Unknown opcode
	.byte $0B			  ; $AC55 - Unknown opcode
	RTS					  ; $AC56: 60	  
loc_AC57:
	BRK					  ; $AC57: 00	  
	EOR $93				  ; $AC58: 45 93   
	.byte $1B			  ; $AC5A - Unknown opcode
loc_AC5B:
	RTS					  ; $AC5B: 60	  

; ---- Subroutine at $AC5C (Bank 17) ----
sub_AC5C:
	LDA $6F				  ; $AC5C: A5 6F   
	PHA					  ; $AC5E: 48	  
	LDA $7C				  ; $AC5F: A5 7C   
	PHA					  ; $AC61: 48	  
	BRK					  ; $AC62: 00	  
	ASL system_flags		 ; $AC63: 06 1F   
	BCC $AC6E				; $AC65: 90 07   
	BRK					  ; $AC67: 00	  
	AND #$C3				 ; $AC68: 29 C3   
	.byte $0B			  ; $AC6A - Unknown opcode
	JMP $AC72				; $AC6B: 4C 72 AC
loc_AC6E:
	BRK					  ; $AC6E: 00	  
	LSR $93				  ; $AC6F: 46 93   
	.byte $1B			  ; $AC71 - Unknown opcode
loc_AC72:
	PLA					  ; $AC72: 68	  
	STA $7C				  ; $AC73: 85 7C   
	PLA					  ; $AC75: 68	  
	STA $6F				  ; $AC76: 85 6F   
	RTS					  ; $AC78: 60	  

; ---- Subroutine at $AC79 (Bank 17) ----
sub_AC79:
	BRK					  ; $AC79: 00	  
	.byte $07			  ; $AC7A - Unknown opcode
	.byte $1F			  ; $AC7B - Unknown opcode
	BCC $ACAE				; $AC7C: 90 30   
	TXA					  ; $AC7E: 8A	  
	PHA					  ; $AC7F: 48	  
	BRK					  ; $AC80: 00	  
	ASL system_flags		 ; $AC81: 06 1F   
	PLA					  ; $AC83: 68	  
	BCC $AC8C				; $AC84: 90 06   
	STA tmp0				 ; $AC86: 85 00   
	CPX tmp0				 ; $AC88: E4 00   
	BEQ $ACAE				; $AC8A: F0 22   
loc_AC8C:
	BRK					  ; $AC8C: 00	  
	.byte $07			  ; $AC8D - Unknown opcode
	.byte $1F			  ; $AC8E - Unknown opcode
	BRK					  ; $AC8F: 00	  
	AND #$C3				 ; $AC90: 29 C3   
	ASL					  ; $AC92: 0A	  
	BCC $ACAE				; $AC93: 90 19   
	STX $C7				  ; $AC95: 86 C7   
	JSR $BF2E				; $AC97: 20 2E BF ; -> sub_BF2E
	.byte $A7			  ; $AC9A - Unknown opcode
	BRK					  ; $AC9B: 00	  
	CPX $D3				  ; $AC9C: E4 D3   
	.byte $83			  ; $AC9E - Unknown opcode
	BRK					  ; $AC9F: 00	  
	.byte $14			  ; $ACA0 - Unknown opcode
	.byte $4F			  ; $ACA1 - Unknown opcode
	JSR $ACB0				; $ACA2: 20 B0 AC ; -> sub_ACB0
	BCC $ACAE				; $ACA5: 90 07   
	STX $C7				  ; $ACA7: 86 C7   
	BRK					  ; $ACA9: 00	  
	ORA $4F,X				; $ACAA: 15 4F   
	CLC					  ; $ACAC: 18	  
	RTS					  ; $ACAD: 60	  
loc_ACAE:
	SEC					  ; $ACAE: 38	  
	RTS					  ; $ACAF: 60	  

; ---- Subroutine at $ACB0 (Bank 17) ----
sub_ACB0:
	LDX #$03				 ; $ACB0: A2 03   
loc_ACB2:
	BRK					  ; $ACB2: 00	  
	AND #$C3				 ; $ACB3: 29 C3   
	ASL					  ; $ACB5: 0A	  
	BCC $ACBD				; $ACB6: 90 05   
	DEX					  ; $ACB8: CA	  
	BPL $ACB2				; $ACB9: 10 F7   
	CLC					  ; $ACBB: 18	  
	RTS					  ; $ACBC: 60	  
loc_ACBD:
	SEC					  ; $ACBD: 38	  
	RTS					  ; $ACBE: 60	  

; ---- Subroutine at $ACBF (Bank 17) ----
sub_ACBF:
	JSR $AD06				; $ACBF: 20 06 AD ; -> sub_AD06
	BCC $ACE6				; $ACC2: 90 22   

; ---- Subroutine at $ACC4 (Bank 17) ----
sub_ACC4:
	BRK					  ; $ACC4: 00	  
	.byte $07			  ; $ACC5 - Unknown opcode
	.byte $1F			  ; $ACC6 - Unknown opcode
	BCC $ACD5				; $ACC7: 90 0C   
	BRK					  ; $ACC9: 00	  
	AND #$C3				 ; $ACCA: 29 C3   
	ORA ($90),Y			  ; $ACCC: 11 90   
	.byte $17			  ; $ACCE - Unknown opcode
loc_ACCF:
	BRK					  ; $ACCF: 00	  
	SBC $D3				  ; $ACD0: E5 D3	; Arithmetic
	INC $18				  ; $ACD2: E6 18   
	RTS					  ; $ACD4: 60	  
loc_ACD5:
	JSR $AD00				; $ACD5: 20 00 AD ; -> sub_AD00
	BEQ $ACE6				; $ACD8: F0 0C   
	BNE $ACCF				; $ACDA: D0 F3   
	JSR $AD06				; $ACDC: 20 06 AD ; -> sub_AD06
	BCC $ACE6				; $ACDF: 90 05   
	BRK					  ; $ACE1: 00	  
	.byte $02			  ; $ACE2 - Unknown opcode
	.byte $1F			  ; $ACE3 - Unknown opcode
	BPL $ACE8				; $ACE4: 10 02   
loc_ACE6:
	SEC					  ; $ACE6: 38	  
	RTS					  ; $ACE7: 60	  
loc_ACE8:
	JSR $AD00				; $ACE8: 20 00 AD ; -> sub_AD00
	BEQ $ACE6				; $ACEB: F0 F9   
	LDA #$00				 ; $ACED: A9 00   
	STA $6E				  ; $ACEF: 85 6E   
	LDA #$43				 ; $ACF1: A9 43   
	BRK					  ; $ACF3: 00	  
	AND $A50F				; $ACF4: 2D 0F A5
	.byte $72			  ; $ACF7 - Unknown opcode
	STA $F9				  ; $ACF8: 85 F9   
	BRK					  ; $ACFA: 00	  
	CMP $D3				  ; $ACFB: C5 D3   
	SBC $18				  ; $ACFD: E5 18	; Arithmetic
	RTS					  ; $ACFF: 60	  

; ---- Subroutine at $AD00 (Bank 17) ----
sub_AD00:
	LDA $72E6				; $AD00: AD E6 72
	AND #$30				 ; $AD03: 29 30   
	RTS					  ; $AD05: 60	  

; ---- Subroutine at $AD06 (Bank 17) ----
sub_AD06:
	BRK					  ; $AD06: 00	  
	.byte $03			  ; $AD07 - Unknown opcode
	.byte $1F			  ; $AD08 - Unknown opcode
	LDX #$0F				 ; $AD09: A2 0F   
loc_AD0B:
	CMP $AD15,X			  ; $AD0B: DD 15 AD
	BEQ $ACFE				; $AD0E: F0 EE   
	DEX					  ; $AD10: CA	  
	BPL $AD0B				; $AD11: 10 F8   
	SEC					  ; $AD13: 38	  
	RTS					  ; $AD14: 60	  
	.byte $27			  ; $AD15 - Unknown opcode
	LDX $A9				  ; $AD16: A6 A9   
	.byte $7B			  ; $AD18 - Unknown opcode
	ADC $B67E,X			  ; $AD19: 7D 7E B6 ; Arithmetic
	TSX					  ; $AD1C: BA	  
	.byte $BB			  ; $AD1D - Unknown opcode
	LDA $CAC8,X			  ; $AD1E: BD C8 CA
	CMP $E0DF,Y			  ; $AD21: D9 DF E0
	.byte $E2			  ; $AD24 - Unknown opcode

; ---- Subroutine at $AD25 (Bank 17) ----
sub_AD25:
	LDA $615A				; $AD25: AD 5A 61
	CMP #$04				 ; $AD28: C9 04	; Compare with 4
	BCS $AD49				; $AD2A: B0 1D   
	BRK					  ; $AD2C: 00	  
	ASL system_flags		 ; $AD2D: 06 1F   
	BCC $AD49				; $AD2F: 90 18   
	LDA $6E44				; $AD31: AD 44 6E
	AND #$03				 ; $AD34: 29 03   
	CMP #$01				 ; $AD36: C9 01	; Compare with 1
	BNE $AD49				; $AD38: D0 0F   
	LDA $72E7				; $AD3A: AD E7 72
	AND #$04				 ; $AD3D: 29 04   
	BNE $AD4B				; $AD3F: D0 0A   
	LDA $72E7				; $AD41: AD E7 72
	ORA #$04				 ; $AD44: 09 04   
	STA $72E7				; $AD46: 8D E7 72
loc_AD49:
	SEC					  ; $AD49: 38	  
	RTS					  ; $AD4A: 60	  
loc_AD4B:
	JSR $C891				; $AD4B: 20 91 C8 ; Call to fixed bank
	CMP #$55				 ; $AD4E: C9 55	; Compare with 85
	RTS					  ; $AD50: 60	  

; ---- Subroutine at $AD51 (Bank 17) ----
sub_AD51:
	JSR $AD89				; $AD51: 20 89 AD ; -> sub_AD89
	BCS $AD85				; $AD54: B0 2F   
	BRK					  ; $AD56: 00	  
	.byte $03			  ; $AD57 - Unknown opcode
	.byte $1F			  ; $AD58 - Unknown opcode
	CMP #$9D				 ; $AD59: C9 9D	; Compare with 157
	BEQ $AD65				; $AD5B: F0 08   
	CMP #$77				 ; $AD5D: C9 77	; Compare with 119
	BEQ $AD65				; $AD5F: F0 04   
	CMP #$19				 ; $AD61: C9 19	; Compare with 25
	BNE $AD71				; $AD63: D0 0C   
loc_AD65:
	BRK					  ; $AD65: 00	  
	.byte $07			  ; $AD66 - Unknown opcode
	.byte $1F			  ; $AD67 - Unknown opcode
	BCS $AD71				; $AD68: B0 07   
	BRK					  ; $AD6A: 00	  
	.byte $07			  ; $AD6B - Unknown opcode
	.byte $53			  ; $AD6C - Unknown opcode
	ORA $73				  ; $AD6D: 05 73   
	BEQ $AD81				; $AD6F: F0 10   
loc_AD71:
	BRK					  ; $AD71: 00	  
	.byte $03			  ; $AD72 - Unknown opcode
	.byte $1F			  ; $AD73 - Unknown opcode
	CMP #$4D				 ; $AD74: C9 4D	; Compare with 77
	BCC $AD7C				; $AD76: 90 04   
	CMP #$53				 ; $AD78: C9 53	; Compare with 83
	BCC $AD87				; $AD7A: 90 0B   
loc_AD7C:
	BRK					  ; $AD7C: 00	  
	ASL $3F				  ; $AD7D: 06 3F   
	BCS $AD87				; $AD7F: B0 06   
loc_AD81:
	BRK					  ; $AD81: 00	  
	INC $D3				  ; $AD82: E6 D3   
	.byte $03			  ; $AD84 - Unknown opcode
loc_AD85:
	CLC					  ; $AD85: 18	  
	RTS					  ; $AD86: 60	  
loc_AD87:
	SEC					  ; $AD87: 38	  
	RTS					  ; $AD88: 60	  

; ---- Subroutine at $AD89 (Bank 17) ----
sub_AD89:
	BRK					  ; $AD89: 00	  
	.byte $03			  ; $AD8A - Unknown opcode
	.byte $1F			  ; $AD8B - Unknown opcode
	CMP #$2E				 ; $AD8C: C9 2E	; Compare with 46
	BNE $ADA4				; $AD8E: D0 14   
	BRK					  ; $AD90: 00	  
	.byte $07			  ; $AD91 - Unknown opcode
	.byte $1F			  ; $AD92 - Unknown opcode
	BCS $AD9C				; $AD93: B0 07   
	BRK					  ; $AD95: 00	  
	LSR $93				  ; $AD96: 46 93   
	ASL $4C				  ; $AD98: 06 4C   
	LDY #$AD				 ; $AD9A: A0 AD   
loc_AD9C:
	BRK					  ; $AD9C: 00	  
	AND #$C3				 ; $AD9D: 29 C3   
	ORA $E590				; $AD9F: 0D 90 E5
	BCS $AD85				; $ADA2: B0 E1   
loc_ADA4:
	LDX #$15				 ; $ADA4: A2 15   
loc_ADA6:
	CMP $ADC8,X			  ; $ADA6: DD C8 AD
	BEQ $ADB0				; $ADA9: F0 05   
	DEX					  ; $ADAB: CA	  
	BPL $ADA6				; $ADAC: 10 F8   
	CLC					  ; $ADAE: 18	  
	RTS					  ; $ADAF: 60	  
loc_ADB0:
	TXA					  ; $ADB0: 8A	  
	ASL					  ; $ADB1: 0A	  
	PHA					  ; $ADB2: 48	  
	BRK					  ; $ADB3: 00	  
	.byte $07			  ; $ADB4 - Unknown opcode
	.byte $1F			  ; $ADB5 - Unknown opcode
	PLA					  ; $ADB6: 68	  
	TAY					  ; $ADB7: A8	  
	BCC $ADC1				; $ADB8: 90 07   
	LDA $ADDF,Y			  ; $ADBA: B9 DF AD
	BRK					  ; $ADBD: 00	  
	AND #$B3				 ; $ADBE: 29 B3   
	RTS					  ; $ADC0: 60	  
loc_ADC1:
	LDA $ADDE,Y			  ; $ADC1: B9 DE AD
	BRK					  ; $ADC4: 00	  
	LSR $73				  ; $ADC5: 46 73   
	RTS					  ; $ADC7: 60	  
	.byte $17			  ; $ADC8 - Unknown opcode
	CLC					  ; $ADC9: 18	  
	ORA $1B1A,Y			  ; $ADCA: 19 1A 1B
	.byte $53			  ; $ADCD - Unknown opcode
	.byte $54			  ; $ADCE - Unknown opcode
	EOR $56,X				; $ADCF: 55 56   
	.byte $73			  ; $ADD1 - Unknown opcode
	.byte $77			  ; $ADD2 - Unknown opcode
	SEI					  ; $ADD3: 78	  
	.byte $7A			  ; $ADD4 - Unknown opcode
	.byte $7C			  ; $ADD5 - Unknown opcode
	STA $88				  ; $ADD6: 85 88   
	STA $9D9C				; $ADD8: 8D 9C 9D
	TAY					  ; $ADDB: A8	  
	TAX					  ; $ADDC: AA	  
	.byte $AB			  ; $ADDD - Unknown opcode
	BPL $ADE0				; $ADDE: 10 00   
loc_ADE0:
	BPL $ADE2				; $ADE0: 10 00   
loc_ADE2:
	.byte $13			  ; $ADE2 - Unknown opcode
	.byte $03			  ; $ADE3 - Unknown opcode
	.byte $14			  ; $ADE4 - Unknown opcode
	.byte $04			  ; $ADE5 - Unknown opcode
	.byte $12			  ; $ADE6 - Unknown opcode
	.byte $02			  ; $ADE7 - Unknown opcode
	BPL $ADEA				; $ADE8: 10 00   
loc_ADEA:
	ORA $0E				  ; $ADEA: 05 0E   
	ASL $0D				  ; $ADEC: 06 0D   
	ORA (tmp1),Y			 ; $ADEE: 11 01   
	BPL $ADF2				; $ADF0: 10 00   
loc_ADF2:
	.byte $13			  ; $ADF2 - Unknown opcode
	.byte $03			  ; $ADF3 - Unknown opcode
	ORA (tmp1),Y			 ; $ADF4: 11 01   
	BPL $ADF8				; $ADF6: 10 00   
loc_ADF8:
	BIT $15				  ; $ADF8: 24 15   
	BPL $ADFC				; $ADFA: 10 00   
loc_ADFC:
	.byte $13			  ; $ADFC - Unknown opcode
	.byte $03			  ; $ADFD - Unknown opcode
	.byte $23			  ; $ADFE - Unknown opcode
	.byte $14			  ; $ADFF - Unknown opcode
	.byte $12			  ; $AE00 - Unknown opcode
	.byte $02			  ; $AE01 - Unknown opcode
	.byte $13			  ; $AE02 - Unknown opcode
	.byte $03			  ; $AE03 - Unknown opcode
	.byte $14			  ; $AE04 - Unknown opcode
	.byte $04			  ; $AE05 - Unknown opcode
	.byte $12			  ; $AE06 - Unknown opcode
	.byte $02			  ; $AE07 - Unknown opcode
	AND $16				  ; $AE08: 25 16   

; ---- Subroutine at $AE0A (Bank 17) ----
sub_AE0A:
	LDA $615A				; $AE0A: AD 5A 61
	CMP #$04				 ; $AE0D: C9 04	; Compare with 4
	BNE $AE1F				; $AE0F: D0 0E   
	BRK					  ; $AE11: 00	  
	.byte $62			  ; $AE12 - Unknown opcode
	.byte $33			  ; $AE13 - Unknown opcode
	TAX					  ; $AE14: AA	  
	CPX #$01				 ; $AE15: E0 01   
	BNE $AE21				; $AE17: D0 08   
	DEX					  ; $AE19: CA	  
	BRK					  ; $AE1A: 00	  
	.byte $2B			  ; $AE1B - Unknown opcode
	.byte $53			  ; $AE1C - Unknown opcode
	BNE $AE21				; $AE1D: D0 02   
loc_AE1F:
	CLC					  ; $AE1F: 18	  
	RTS					  ; $AE20: 60	  
loc_AE21:
	SEC					  ; $AE21: 38	  
	RTS					  ; $AE22: 60	  
	RTS					  ; $AE23: 60	  
	LDA #$00				 ; $AE24: A9 00   
	BEQ $AE2A				; $AE26: F0 02   
	LDA #$01				 ; $AE28: A9 01   
loc_AE2A:
	STA $70				  ; $AE2A: 85 70   
	STA $7D				  ; $AE2C: 85 7D   
	LDA #$19				 ; $AE2E: A9 19   
	LDX #$09				 ; $AE30: A2 09   
	JMP $9D4F				; $AE32: 4C 4F 9D
	BRK					  ; $AE35: 00	  
	.byte $07			  ; $AE36 - Unknown opcode
	.byte $1F			  ; $AE37 - Unknown opcode
	BCC $AE43				; $AE38: 90 09   
	BRK					  ; $AE3A: 00	  
	ORA $3F				  ; $AE3B: 05 3F   
	BRK					  ; $AE3D: 00	  
	ASL					  ; $AE3E: 0A	  
	.byte $B3			  ; $AE3F - Unknown opcode
	JMP $AE49				; $AE40: 4C 49 AE
loc_AE43:
	BRK					  ; $AE43: 00	  
	ORA $3F				  ; $AE44: 05 3F   
	BRK					  ; $AE46: 00	  
	.byte $0B			  ; $AE47 - Unknown opcode
	.byte $73			  ; $AE48 - Unknown opcode
loc_AE49:
	BRK					  ; $AE49: 00	  
	INC $D3				  ; $AE4A: E6 D3   
	ORA ($60,X)			  ; $AE4C: 01 60   
	LDA #$11				 ; $AE4E: A9 11   
	LDX #$01				 ; $AE50: A2 01   
	JMP $9D4F				; $AE52: 4C 4F 9D
	LDA $72E4				; $AE55: AD E4 72
	ORA #$80				 ; $AE58: 09 80   
	STA $72E4				; $AE5A: 8D E4 72
	RTS					  ; $AE5D: 60	  
	LDA #$1B				 ; $AE5E: A9 1B   
	LDX #$0B				 ; $AE60: A2 0B   
	JMP $9D4F				; $AE62: 4C 4F 9D
	JSR $BF2E				; $AE65: 20 2E BF ; -> sub_BF2E
	.byte $83			  ; $AE68 - Unknown opcode
loc_AE69:
	BRK					  ; $AE69: 00	  
	.byte $07			  ; $AE6A - Unknown opcode
	.byte $1F			  ; $AE6B - Unknown opcode
	BCC $AE83				; $AE6C: 90 15   
	TXA					  ; $AE6E: 8A	  
	PHA					  ; $AE6F: 48	  
	BRK					  ; $AE70: 00	  
	.byte $22			  ; $AE71 - Unknown opcode
	.byte $D3			  ; $AE72 - Unknown opcode
	ORA ($68,X)			  ; $AE73: 01 68   
	PHA					  ; $AE75: 48	  
	TAX					  ; $AE76: AA	  
	JSR $9204				; $AE77: 20 04 92 ; -> sub_9204
	BRK					  ; $AE7A: 00	  
	.byte $07			  ; $AE7B - Unknown opcode
	.byte $2F			  ; $AE7C - Unknown opcode
	PLA					  ; $AE7D: 68	  
	TAX					  ; $AE7E: AA	  
	BRK					  ; $AE7F: 00	  
	.byte $2B			  ; $AE80 - Unknown opcode
	.byte $C3			  ; $AE81 - Unknown opcode
	.byte $0F			  ; $AE82 - Unknown opcode
loc_AE83:
	RTS					  ; $AE83: 60	  
	JSR $BF2E				; $AE84: 20 2E BF ; -> sub_BF2E
	.byte $92			  ; $AE87 - Unknown opcode
	JMP $AE69				; $AE88: 4C 69 AE
	JSR $BF2E				; $AE8B: 20 2E BF ; -> sub_BF2E
	.byte $83			  ; $AE8E - Unknown opcode
	BRK					  ; $AE8F: 00	  
	.byte $07			  ; $AE90 - Unknown opcode
	.byte $1F			  ; $AE91 - Unknown opcode
	BCC $AE83				; $AE92: 90 EF   
	TXA					  ; $AE94: 8A	  
	PHA					  ; $AE95: 48	  
	BRK					  ; $AE96: 00	  
	.byte $B2			  ; $AE97 - Unknown opcode
	.byte $D3			  ; $AE98 - Unknown opcode
	ORA ($4C,X)			  ; $AE99: 01 4C   
	.byte $74			  ; $AE9B - Unknown opcode
	LDX $F4A9				; $AE9C: AE A9 F4
	STA $7C				  ; $AE9F: 85 7C   
	LDA #$01				 ; $AEA1: A9 01   
	STA $7D				  ; $AEA3: 85 7D   
	LDA #$65				 ; $AEA5: A9 65   
	BRK					  ; $AEA7: 00	  
	.byte $17			  ; $AEA8 - Unknown opcode
	.byte $0F			  ; $AEA9 - Unknown opcode
	LDX #$7C				 ; $AEAA: A2 7C   
	JSR $C813				; $AEAC: 20 13 C8 ; Call to fixed bank
	JSR $A01F				; $AEAF: 20 1F A0 ; -> sub_A01F
	BRK					  ; $AEB2: 00	  
	.byte $07			  ; $AEB3 - Unknown opcode
	.byte $1F			  ; $AEB4 - Unknown opcode
	BCC $AEBE				; $AEB5: 90 07   
	BRK					  ; $AEB7: 00	  
	.byte $02			  ; $AEB8 - Unknown opcode
	.byte $A3			  ; $AEB9 - Unknown opcode
	BRK					  ; $AEBA: 00	  
	INC $D3				  ; $AEBB: E6 D3   
	ORA ($60,X)			  ; $AEBD: 01 60   
	BRK					  ; $AEBF: 00	  
	CPX $D3				  ; $AEC0: E4 D3   
	LSR tmp0,X			   ; $AEC2: 56 00   
	.byte $07			  ; $AEC4 - Unknown opcode
	.byte $1F			  ; $AEC5 - Unknown opcode
	BCC $AF2A				; $AEC6: 90 62   
	BRK					  ; $AEC8: 00	  
	AND #$C3				 ; $AEC9: 29 C3   
	.byte $0C			  ; $AECB - Unknown opcode
	BCC $AEE0				; $AECC: 90 12   
	TXA					  ; $AECE: 8A	  
	PHA					  ; $AECF: 48	  
	JSR $B11F				; $AED0: 20 1F B1 ; -> sub_B11F
	BRK					  ; $AED3: 00	  
	SBC $D3				  ; $AED4: E5 D3	; Arithmetic
	.byte $A3			  ; $AED6 - Unknown opcode
	PLA					  ; $AED7: 68	  
	STA $C7				  ; $AED8: 85 C7   
	BRK					  ; $AEDA: 00	  
	.byte $13			  ; $AEDB - Unknown opcode
	.byte $4F			  ; $AEDC - Unknown opcode
	BRK					  ; $AEDD: 00	  
	.byte $07			  ; $AEDE - Unknown opcode
	.byte $1F			  ; $AEDF - Unknown opcode
loc_AEE0:
	LDA #$FF				 ; $AEE0: A9 FF   
	STA $7D				  ; $AEE2: 85 7D   
	BRK					  ; $AEE4: 00	  
	ORA ($B3),Y			  ; $AEE5: 11 B3   
	BRK					  ; $AEE7: 00	  
	ORA $00A3,Y			  ; $AEE8: 19 A3 00
	ORA $A3,X				; $AEEB: 15 A3   
	BRK					  ; $AEED: 00	  
	.byte $0F			  ; $AEEE - Unknown opcode
	.byte $A3			  ; $AEEF - Unknown opcode
	BRK					  ; $AEF0: 00	  
	BPL $AEA6				; $AEF1: 10 B3   
	BRK					  ; $AEF3: 00	  
	.byte $17			  ; $AEF4 - Unknown opcode
	.byte $A3			  ; $AEF5 - Unknown opcode
	JSR $AF9F				; $AEF6: 20 9F AF ; -> sub_AF9F
	BRK					  ; $AEF9: 00	  
	CLC					  ; $AEFA: 18	  
	.byte $B3			  ; $AEFB - Unknown opcode
	BRK					  ; $AEFC: 00	  
	.byte $13			  ; $AEFD - Unknown opcode
	.byte $A3			  ; $AEFE - Unknown opcode
	JSR $AF9F				; $AEFF: 20 9F AF ; -> sub_AF9F
	BRK					  ; $AF02: 00	  
	.byte $14			  ; $AF03 - Unknown opcode
	.byte $B3			  ; $AF04 - Unknown opcode
	BRK					  ; $AF05: 00	  
	.byte $0F			  ; $AF06 - Unknown opcode
	.byte $A3			  ; $AF07 - Unknown opcode
	BRK					  ; $AF08: 00	  
	.byte $2B			  ; $AF09 - Unknown opcode
	.byte $C3			  ; $AF0A - Unknown opcode
	.byte $03			  ; $AF0B - Unknown opcode
	BRK					  ; $AF0C: 00	  
	.byte $2B			  ; $AF0D - Unknown opcode
	.byte $C3			  ; $AF0E - Unknown opcode
	.byte $04			  ; $AF0F - Unknown opcode
	BRK					  ; $AF10: 00	  
	.byte $2B			  ; $AF11 - Unknown opcode
	.byte $C3			  ; $AF12 - Unknown opcode
	ORA tmp0				 ; $AF13: 05 00   
	.byte $2B			  ; $AF15 - Unknown opcode
	.byte $C3			  ; $AF16 - Unknown opcode
	ASL tmp0				 ; $AF17: 06 00   
	.byte $2B			  ; $AF19 - Unknown opcode
	.byte $C3			  ; $AF1A - Unknown opcode
	.byte $07			  ; $AF1B - Unknown opcode
	BRK					  ; $AF1C: 00	  
	.byte $2B			  ; $AF1D - Unknown opcode
	.byte $C3			  ; $AF1E - Unknown opcode
	ORA ($90),Y			  ; $AF1F: 11 90   
	.byte $03			  ; $AF21 - Unknown opcode
	JSR $A0EF				; $AF22: 20 EF A0 ; -> sub_A0EF
	BRK					  ; $AF25: 00	  
	SBC $D3				  ; $AF26: E5 D3	; Arithmetic
	LDX #$60				 ; $AF28: A2 60   
loc_AF2A:
	BRK					  ; $AF2A: 00	  
	LSR $93				  ; $AF2B: 46 93   
	.byte $1C			  ; $AF2D - Unknown opcode
	BCC $AF37				; $AF2E: 90 07   
	JSR $B11F				; $AF30: 20 1F B1 ; -> sub_B11F
	BRK					  ; $AF33: 00	  
	SBC $D3				  ; $AF34: E5 D3	; Arithmetic
	.byte $A3			  ; $AF36 - Unknown opcode
loc_AF37:
	LDA $72E7				; $AF37: AD E7 72
	AND #$EF				 ; $AF3A: 29 EF   
	STA $72E7				; $AF3C: 8D E7 72
	LDA #$FF				 ; $AF3F: A9 FF   
	STA $70				  ; $AF41: 85 70   
	BRK					  ; $AF43: 00	  
	ASL $73,X				; $AF44: 16 73   
	BRK					  ; $AF46: 00	  
	.byte $1A			  ; $AF47 - Unknown opcode
	.byte $53			  ; $AF48 - Unknown opcode
	BRK					  ; $AF49: 00	  
	ASL $0053,X			  ; $AF4A: 1E 53 00
	.byte $12			  ; $AF4D - Unknown opcode
	.byte $53			  ; $AF4E - Unknown opcode
	BRK					  ; $AF4F: 00	  
	ORA $73,X				; $AF50: 15 73   
	BRK					  ; $AF52: 00	  
	.byte $17			  ; $AF53 - Unknown opcode
	.byte $53			  ; $AF54 - Unknown opcode
	JSR $AFA6				; $AF55: 20 A6 AF ; -> sub_AFA6
	BRK					  ; $AF58: 00	  
	ORA $0073,Y			  ; $AF59: 19 73 00
	.byte $1B			  ; $AF5C - Unknown opcode
	.byte $53			  ; $AF5D - Unknown opcode
	JSR $AFA6				; $AF5E: 20 A6 AF ; -> sub_AFA6
	BRK					  ; $AF61: 00	  
	ORA $0073,X			  ; $AF62: 1D 73 00
	EOR $93				  ; $AF65: 45 93   
	.byte $13			  ; $AF67 - Unknown opcode
	BRK					  ; $AF68: 00	  
	EOR $93				  ; $AF69: 45 93   
	.byte $14			  ; $AF6B - Unknown opcode
	BRK					  ; $AF6C: 00	  
	EOR $93				  ; $AF6D: 45 93   
	ORA tmp0,X			   ; $AF6F: 15 00   
	EOR $93				  ; $AF71: 45 93   
	ASL tmp0,X			   ; $AF73: 16 00   
	EOR $93				  ; $AF75: 45 93   
	.byte $17			  ; $AF77 - Unknown opcode
	BRK					  ; $AF78: 00	  
	EOR $93				  ; $AF79: 45 93   
	CLC					  ; $AF7B: 18	  
	BCC $AF81				; $AF7C: 90 03   
	JSR $A0EF				; $AF7E: 20 EF A0 ; -> sub_A0EF
loc_AF81:
	LDA $72E6				; $AF81: AD E6 72
	AND #$30				 ; $AF84: 29 30   
	BEQ $AF9A				; $AF86: F0 12   
	LDA $72E6				; $AF88: AD E6 72
	AND #$CF				 ; $AF8B: 29 CF   
	STA $72E6				; $AF8D: 8D E6 72
	LDA $6E44				; $AF90: AD 44 6E
	AND #$FC				 ; $AF93: 29 FC   
	ORA #$01				 ; $AF95: 09 01   
	STA $6E44				; $AF97: 8D 44 6E
loc_AF9A:
	BRK					  ; $AF9A: 00	  
	SBC $D3				  ; $AF9B: E5 D3	; Arithmetic
	LDX #$60				 ; $AF9D: A2 60   

; ---- Subroutine at $AF9F (Bank 17) ----
sub_AF9F:
	LDA $7F				  ; $AF9F: A5 7F   
	STA $7D				  ; $AFA1: 85 7D   
	LDA $7E				  ; $AFA3: A5 7E   
	RTS					  ; $AFA5: 60	  

; ---- Subroutine at $AFA6 (Bank 17) ----
sub_AFA6:
	LDA $73				  ; $AFA6: A5 73   
	STA $70				  ; $AFA8: 85 70   
	LDA $72				  ; $AFAA: A5 72   
	RTS					  ; $AFAC: 60	  
	BRK					  ; $AFAD: 00	  
	ASL system_flags		 ; $AFAE: 06 1F   
	BCS $AFD5				; $AFB0: B0 23   
	BRK					  ; $AFB2: 00	  
	ROL $2C2F				; $AFB3: 2E 2F 2C
	.byte $44			  ; $AFB6 - Unknown opcode
	ROR $1730				; $AFB7: 6E 30 17
	BRK					  ; $AFBA: 00	  
	.byte $2B			  ; $AFBB - Unknown opcode
	.byte $EF			  ; $AFBC - Unknown opcode
	BCS $AFD6				; $AFBD: B0 17   
	BRK					  ; $AFBF: 00	  
	.byte $62			  ; $AFC0 - Unknown opcode
	.byte $23			  ; $AFC1 - Unknown opcode
	RTI					  ; $AFC2: 40	  
	DEC $72				  ; $AFC3: C6 72   
	BEQ $AFCC				; $AFC5: F0 05   
	BRK					  ; $AFC7: 00	  
	CPX $D3				  ; $AFC8: E4 D3   
	ADC #$60				 ; $AFCA: 69 60	; Arithmetic
loc_AFCC:
	BRK					  ; $AFCC: 00	  
	CPX $D3				  ; $AFCD: E4 D3   
	PLA					  ; $AFCF: 68	  
	RTS					  ; $AFD0: 60	  
	BRK					  ; $AFD1: 00	  
	CPX $D3				  ; $AFD2: E4 D3   
	.byte $5B			  ; $AFD4 - Unknown opcode
loc_AFD5:
	RTS					  ; $AFD5: 60	  
loc_AFD6:
	LDA #$00				 ; $AFD6: A9 00   
	BRK					  ; $AFD8: 00	  
	.byte $47			  ; $AFD9 - Unknown opcode
	.byte $73			  ; $AFDA - Unknown opcode
	LDA $75				  ; $AFDB: A5 75   
	BRK					  ; $AFDD: 00	  
	.byte $17			  ; $AFDE - Unknown opcode
	.byte $0F			  ; $AFDF - Unknown opcode
	BRK					  ; $AFE0: 00	  
	BIT $AEEF				; $AFE1: 2C EF AE
	.byte $1B			  ; $AFE4 - Unknown opcode
	ORA $9A				  ; $AFE5: 05 9A   
	JMP $CEBD				; $AFE7: 4C BD CE
loc_AFEA:
	BRK					  ; $AFEA: 00	  
	.byte $07			  ; $AFEB - Unknown opcode
	.byte $1F			  ; $AFEC - Unknown opcode
	BCS $AFFE				; $AFED: B0 0F   
	LDA #$05				 ; $AFEF: A9 05   
	JMP $9D4F				; $AFF1: 4C 4F 9D

; ---- Subroutine at $AFF4 (Bank 17) ----
sub_AFF4:
	LDA #$06				 ; $AFF4: A9 06   
	LDX #$0D				 ; $AFF6: A2 0D   
	JSR $9D4F				; $AFF8: 20 4F 9D ; -> sub_9D4F
	JMP $92CF				; $AFFB: 4C CF 92
loc_AFFE:
	RTS					  ; $AFFE: 60	  

; ---- Subroutine at $AFFF (Bank 17) ----
sub_AFFF:
	BRK					  ; $AFFF: 00	  
	ASL system_flags		 ; $B000: 06 1F   
	BCS $B024				; $B002: B0 20   
	STX tmp0				 ; $B004: 86 00   
	BRK					  ; $B006: 00	  
	ORA system_flags		 ; $B007: 05 1F   
	CMP #$02				 ; $B009: C9 02	; Compare with 2
	BNE $B024				; $B00B: D0 17   
	LDA $7355				; $B00D: AD 55 73
	BRK					  ; $B010: 00	  
	ASL $B00F				; $B011: 0E 0F B0
	.byte $0F			  ; $B014 - Unknown opcode
	BRK					  ; $B015: 00	  
	ORA $900F				; $B016: 0D 0F 90
	ASL					  ; $B019: 0A	  
	LDX tmp0				 ; $B01A: A6 00   
	BRK					  ; $B01C: 00	  
	AND ($73),Y			  ; $B01D: 31 73   
	BCC $B024				; $B01F: 90 03   
	BRK					  ; $B021: 00	  
	BMI $B097				; $B022: 30 73   
loc_B024:
	RTS					  ; $B024: 60	  
	BRK					  ; $B025: 00	  
	ASL system_flags		 ; $B026: 06 1F   
	BCS $B033				; $B028: B0 09   
	LDA $7355				; $B02A: AD 55 73
	BRK					  ; $B02D: 00	  
	AND ($73),Y			  ; $B02E: 31 73   
	BRK					  ; $B030: 00	  
	.byte $32			  ; $B031 - Unknown opcode
	.byte $73			  ; $B032 - Unknown opcode
loc_B033:
	RTS					  ; $B033: 60	  
	BRK					  ; $B034: 00	  
	INC $D3				  ; $B035: E6 D3   
	ORA ($60,X)			  ; $B037: 01 60   
	BRK					  ; $B039: 00	  
	.byte $07			  ; $B03A - Unknown opcode
	.byte $1F			  ; $B03B - Unknown opcode
	BCC $B054				; $B03C: 90 16   
	TXA					  ; $B03E: 8A	  
	PHA					  ; $B03F: 48	  
	JSR $BF2E				; $B040: 20 2E BF ; -> sub_BF2E
	.byte $93			  ; $B043 - Unknown opcode
	PLA					  ; $B044: 68	  
	TAX					  ; $B045: AA	  
	JSR $B91C				; $B046: 20 1C B9 ; -> sub_B91C
	JSR $9204				; $B049: 20 04 92 ; -> sub_9204
	BRK					  ; $B04C: 00	  
	INC $D3				  ; $B04D: E6 D3   
	ORA (tmp0,X)			 ; $B04F: 01 00   
	.byte $23			  ; $B051 - Unknown opcode
	.byte $2F			  ; $B052 - Unknown opcode
	RTS					  ; $B053: 60	  
loc_B054:
	RTS					  ; $B054: 60	  
	JSR $B07E				; $B055: 20 7E B0 ; -> sub_B07E
	BRK					  ; $B058: 00	  
	.byte $1B			  ; $B059 - Unknown opcode
	.byte $0F			  ; $B05A - Unknown opcode
	CMP #$F4				 ; $B05B: C9 F4	; Compare with 244
	BCS $B07A				; $B05D: B0 1B   
	BRK					  ; $B05F: 00	  
	ASL $2F				  ; $B060: 06 2F   
	BRK					  ; $B062: 00	  
	BIT $60D3				; $B063: 2C D3 60
	BRK					  ; $B066: 00	  
	SBC $D3				  ; $B067: E5 D3	; Arithmetic
	LDA $0600				; $B069: AD 00 06
	.byte $1F			  ; $B06C - Unknown opcode
	LDA $7355				; $B06D: AD 55 73
	BRK					  ; $B070: 00	  
	AND ($73),Y			  ; $B071: 31 73   
	BRK					  ; $B073: 00	  
	BMI $B0E9				; $B074: 30 73   
	RTS					  ; $B076: 60	  
	JSR $B07E				; $B077: 20 7E B0 ; -> sub_B07E
loc_B07A:
	BRK					  ; $B07A: 00	  
	ASL $2F				  ; $B07B: 06 2F   
	RTS					  ; $B07D: 60	  

; ---- Subroutine at $B07E (Bank 17) ----
sub_B07E:
	BRK					  ; $B07E: 00	  
	.byte $07			  ; $B07F - Unknown opcode
	.byte $1F			  ; $B080 - Unknown opcode
	BCC $B08E				; $B081: 90 0B   
	BRK					  ; $B083: 00	  
	ORA $3F				  ; $B084: 05 3F   
	BRK					  ; $B086: 00	  
	ORA #$B3				 ; $B087: 09 B3   
	BRK					  ; $B089: 00	  
	ROR $D3				  ; $B08A: 66 D3   
	ORA ($60,X)			  ; $B08C: 01 60   
loc_B08E:
	BVC $B09C				; $B08E: 50 0C   
	BRK					  ; $B090: 00	  
	ORA $3F				  ; $B091: 05 3F   
	BRK					  ; $B093: 00	  
	ORA #$73				 ; $B094: 09 73   
	BEQ $B09D				; $B096: F0 05   
	BRK					  ; $B098: 00	  
	ROR $D3				  ; $B099: 66 D3   
	ORA ($60,X)			  ; $B09B: 01 60   
loc_B09D:
	BRK					  ; $B09D: 00	  
	CPX $D3				  ; $B09E: E4 D3   
	.byte $1A			  ; $B0A0 - Unknown opcode
	PLA					  ; $B0A1: 68	  
	PLA					  ; $B0A2: 68	  
	RTS					  ; $B0A3: 60	  
	LDA $7363				; $B0A4: AD 63 73
	BMI $B0AE				; $B0A7: 30 05   
	LDA #$05				 ; $B0A9: A9 05   
	JMP $9D6E				; $B0AB: 4C 6E 9D
loc_B0AE:
	BRK					  ; $B0AE: 00	  
	CPX $D3				  ; $B0AF: E4 D3   
	.byte $1A			  ; $B0B1 - Unknown opcode
	RTS					  ; $B0B2: 60	  
	LDA #$23				 ; $B0B3: A9 23   
	LDX #$14				 ; $B0B5: A2 14   
	JMP $9D4F				; $B0B7: 4C 4F 9D
	LDA #$11				 ; $B0BA: A9 11   
	JMP $B0D0				; $B0BC: 4C D0 B0
	LDA #$13				 ; $B0BF: A9 13   
	JMP $B0D0				; $B0C1: 4C D0 B0
	LDA #$24				 ; $B0C4: A9 24   
	JMP $B0D0				; $B0C6: 4C D0 B0
	LDA #$03				 ; $B0C9: A9 03   
	JMP $B0D0				; $B0CB: 4C D0 B0
	LDA #$0A				 ; $B0CE: A9 0A   
loc_B0D0:
	PHA					  ; $B0D0: 48	  
	BRK					  ; $B0D1: 00	  
	.byte $07			  ; $B0D2 - Unknown opcode
	.byte $1F			  ; $B0D3 - Unknown opcode
	STA $6E				  ; $B0D4: 85 6E   
	BRK					  ; $B0D6: 00	  
	ORA $3F				  ; $B0D7: 05 3F   
	STA $6F				  ; $B0D9: 85 6F   
	PLA					  ; $B0DB: 68	  
	BRK					  ; $B0DC: 00	  
	BRK					  ; $B0DD: 00	  
	.byte $03			  ; $B0DE - Unknown opcode
	BRK					  ; $B0DF: 00	  
	INC $D3				  ; $B0E0: E6 D3   
	ORA ($60,X)			  ; $B0E2: 01 60   
	BRK					  ; $B0E4: 00	  
	.byte $E2			  ; $B0E5 - Unknown opcode
	.byte $D3			  ; $B0E6 - Unknown opcode
	.byte $02			  ; $B0E7 - Unknown opcode
	JMP $A047				; $B0E8: 4C 47 A0
	BRK					  ; $B0EB: 00	  
	.byte $07			  ; $B0EC - Unknown opcode
	.byte $1F			  ; $B0ED - Unknown opcode
	BCC $B115				; $B0EE: 90 25   
	BRK					  ; $B0F0: 00	  
	AND #$C3				 ; $B0F1: 29 C3   
	ORA ($B0),Y			  ; $B0F3: 11 B0   
	BIT tmp0				 ; $B0F5: 24 00   
	AND #$C3				 ; $B0F7: 29 C3   
	.byte $0C			  ; $B0F9 - Unknown opcode
	BCC $B115				; $B0FA: 90 19   
	BRK					  ; $B0FC: 00	  
	.byte $67			  ; $B0FD - Unknown opcode
	.byte $73			  ; $B0FE - Unknown opcode
	STA $F9				  ; $B0FF: 85 F9   
	BRK					  ; $B101: 00	  
loc_B102:
	SBC $D3				  ; $B102: E5 D3	; Arithmetic
	TSX					  ; $B104: BA	  
	JSR $B11F				; $B105: 20 1F B1 ; -> sub_B11F
	BRK					  ; $B108: 00	  
	.byte $07			  ; $B109 - Unknown opcode
	.byte $1F			  ; $B10A - Unknown opcode
	STX $C7				  ; $B10B: 86 C7   
	BRK					  ; $B10D: 00	  
	.byte $13			  ; $B10E - Unknown opcode
	.byte $4F			  ; $B10F - Unknown opcode
	BRK					  ; $B110: 00	  
	SBC #$D3				 ; $B111: E9 D3	; Arithmetic
	.byte $A3			  ; $B113 - Unknown opcode
	RTS					  ; $B114: 60	  
loc_B115:
	BRK					  ; $B115: 00	  
	SBC $D3				  ; $B116: E5 D3	; Arithmetic
	LDA $0060,Y			  ; $B118: B9 60 00
	CPX $D3				  ; $B11B: E4 D3   
	.byte $7B			  ; $B11D - Unknown opcode
	RTS					  ; $B11E: 60	  

; ---- Subroutine at $B11F (Bank 17) ----
sub_B11F:
	BRK					  ; $B11F: 00	  
	.byte $07			  ; $B120 - Unknown opcode
	.byte $1F			  ; $B121 - Unknown opcode
	BCC $B150				; $B122: 90 2C   
	BRK					  ; $B124: 00	  
	.byte $2B			  ; $B125 - Unknown opcode
	.byte $C3			  ; $B126 - Unknown opcode
	.byte $0C			  ; $B127 - Unknown opcode
	LDA #$FF				 ; $B128: A9 FF   
	STA $7D				  ; $B12A: 85 7D   
	BRK					  ; $B12C: 00	  
	ORA $B3,X				; $B12D: 15 B3   
	BRK					  ; $B12F: 00	  
	ORA $00A3,Y			  ; $B130: 19 A3 00
	ORA ($A3),Y			  ; $B133: 11 A3   
	BRK					  ; $B135: 00	  
	.byte $13			  ; $B136 - Unknown opcode
	.byte $A3			  ; $B137 - Unknown opcode
	LDY $7F				  ; $B138: A4 7F   
	STY $7D				  ; $B13A: 84 7D   
	BRK					  ; $B13C: 00	  
	.byte $14			  ; $B13D - Unknown opcode
	.byte $B3			  ; $B13E - Unknown opcode
	BRK					  ; $B13F: 00	  
	.byte $17			  ; $B140 - Unknown opcode
	.byte $A3			  ; $B141 - Unknown opcode
	LDY $7F				  ; $B142: A4 7F   
	STY $7D				  ; $B144: 84 7D   
	BRK					  ; $B146: 00	  
	CLC					  ; $B147: 18	  
	.byte $B3			  ; $B148 - Unknown opcode
	BRK					  ; $B149: 00	  
	.byte $0F			  ; $B14A - Unknown opcode
	.byte $A3			  ; $B14B - Unknown opcode
	BRK					  ; $B14C: 00	  
	BPL $B102				; $B14D: 10 B3   
	RTS					  ; $B14F: 60	  
loc_B150:
	BRK					  ; $B150: 00	  
	EOR $93				  ; $B151: 45 93   
	.byte $1C			  ; $B153 - Unknown opcode
	LDA #$FF				 ; $B154: A9 FF   
	STA $70				  ; $B156: 85 70   
	BRK					  ; $B158: 00	  
	.byte $1A			  ; $B159 - Unknown opcode
	.byte $73			  ; $B15A - Unknown opcode
	BRK					  ; $B15B: 00	  
	ASL $0073,X			  ; $B15C: 1E 73 00
	ASL $73,X				; $B15F: 16 73   
	BRK					  ; $B161: 00	  
	.byte $17			  ; $B162 - Unknown opcode
	.byte $53			  ; $B163 - Unknown opcode
	LDY $73				  ; $B164: A4 73   
	STY $70				  ; $B166: 84 70   
	BRK					  ; $B168: 00	  
	ORA $0073,Y			  ; $B169: 19 73 00
	.byte $1B			  ; $B16C - Unknown opcode
	.byte $53			  ; $B16D - Unknown opcode
	LDY $73				  ; $B16E: A4 73   
	STY $70				  ; $B170: 84 70   
	BRK					  ; $B172: 00	  
	ORA $0073,X			  ; $B173: 1D 73 00
	.byte $12			  ; $B176 - Unknown opcode
	.byte $53			  ; $B177 - Unknown opcode
	BRK					  ; $B178: 00	  
	ORA $73,X				; $B179: 15 73   
	RTS					  ; $B17B: 60	  
	JSR $96DB				; $B17C: 20 DB 96 ; -> sub_96DB
	RTS					  ; $B17F: 60	  
loc_B180:
	BIT $6E44				; $B180: 2C 44 6E
	BMI $B1C1				; $B183: 30 3C   
	BVS $B1C1				; $B185: 70 3A   
	BRK					  ; $B187: 00	  
	.byte $1B			  ; $B188 - Unknown opcode
	.byte $0F			  ; $B189 - Unknown opcode
	CMP #$80				 ; $B18A: C9 80	; Compare with 128
	BCC $B1C1				; $B18C: 90 33   
	BIT $72E4				; $B18E: 2C E4 72
	BVS $B19A				; $B191: 70 07   
	BRK					  ; $B193: 00	  
	AND $D3				  ; $B194: 25 D3   
	LSR					  ; $B196: 4A	  
	JMP $B19E				; $B197: 4C 9E B1
loc_B19A:
	BRK					  ; $B19A: 00	  
	AND $D3				  ; $B19B: 25 D3   
	EOR #$A9				 ; $B19D: 49 A9   
	BRK					  ; $B19F: 00	  
	STA $735E				; $B1A0: 8D 5E 73
loc_B1A3:
	JSR $96C3				; $B1A3: 20 C3 96 ; -> sub_96C3
	BCC $B1B6				; $B1A6: 90 0E   
	BRK					  ; $B1A8: 00	  
	.byte $07			  ; $B1A9 - Unknown opcode
	.byte $1F			  ; $B1AA - Unknown opcode
	TXA					  ; $B1AB: 8A	  
	PHA					  ; $B1AC: 48	  
	JSR $91FE				; $B1AD: 20 FE 91 ; -> sub_91FE
	PLA					  ; $B1B0: 68	  
	TAX					  ; $B1B1: AA	  
	BRK					  ; $B1B2: 00	  
	.byte $2B			  ; $B1B3 - Unknown opcode
	.byte $C3			  ; $B1B4 - Unknown opcode
	.byte $0F			  ; $B1B5 - Unknown opcode
loc_B1B6:
	INC $735E				; $B1B6: EE 5E 73
	LDA $735E				; $B1B9: AD 5E 73
	CMP #$08				 ; $B1BC: C9 08	; Compare with 8
	BCC $B1A3				; $B1BE: 90 E3   
	RTS					  ; $B1C0: 60	  
loc_B1C1:
	BIT $72E4				; $B1C1: 2C E4 72
	BVS $B1CB				; $B1C4: 70 05   
	BRK					  ; $B1C6: 00	  
	SBC $D3				  ; $B1C7: E5 D3	; Arithmetic
	JMP $0060				; $B1C9: 4C 60 00
	SBC $D3				  ; $B1CC: E5 D3	; Arithmetic
	.byte $4B			  ; $B1CE - Unknown opcode
	RTS					  ; $B1CF: 60	  
	LDA #$24				 ; $B1D0: A9 24   
	LDX #$15				 ; $B1D2: A2 15   
	JMP $9D4F				; $B1D4: 4C 4F 9D
	LDA #$25				 ; $B1D7: A9 25   
	LDX #$16				 ; $B1D9: A2 16   
	JMP $9D4F				; $B1DB: 4C 4F 9D
	BRK					  ; $B1DE: 00	  
	SBC $D3				  ; $B1DF: E5 D3	; Arithmetic
	EOR ($20),Y			  ; $B1E1: 51 20   
	CPY $AC				  ; $B1E3: C4 AC   
	BCC $B21E				; $B1E5: 90 37   
	JSR $BF2E				; $B1E7: 20 2E BF ; -> sub_BF2E
	DEY					  ; $B1EA: 88	  
	BRK					  ; $B1EB: 00	  
	BEQ $B1C1				; $B1EC: F0 D3   
	EOR $1620				; $B1EE: 4D 20 16
	STA $DB4C,Y			  ; $B1F1: 99 4C DB
	BCC $B1F6				; $B1F4: 90 00   
loc_B1F6:
	SBC $D3				  ; $B1F6: E5 D3	; Arithmetic
	EOR $A9,X				; $B1F8: 55 A9   
	.byte $03			  ; $B1FA - Unknown opcode
	STA $735E				; $B1FB: 8D 5E 73
loc_B1FE:
	JSR $BF2E				; $B1FE: 20 2E BF ; -> sub_BF2E
	.byte $89			  ; $B201 - Unknown opcode
	BRK					  ; $B202: 00	  
	SBC ($D3,X)			  ; $B203: E1 D3	; Arithmetic
	LSR $20,X				; $B205: 56 20   
	CPY $AC				  ; $B207: C4 AC   
	BCC $B20E				; $B209: 90 03   
	JSR $96DB				; $B20B: 20 DB 96 ; -> sub_96DB
loc_B20E:
	LDA $72E7				; $B20E: AD E7 72
	AND #$60				 ; $B211: 29 60   
	BNE $B21A				; $B213: D0 05   
	DEC $735E				; $B215: CE 5E 73
	BNE $B1FE				; $B218: D0 E4   
loc_B21A:
	BRK					  ; $B21A: 00	  
	SBC ($D3,X)			  ; $B21B: E1 D3	; Arithmetic
	.byte $57			  ; $B21D - Unknown opcode
loc_B21E:
	RTS					  ; $B21E: 60	  
	BRK					  ; $B21F: 00	  
	.byte $1B			  ; $B220 - Unknown opcode
	.byte $0F			  ; $B221 - Unknown opcode
	CMP #$80				 ; $B222: C9 80	; Compare with 128
	BCS $B275				; $B224: B0 4F   
	BRK					  ; $B226: 00	  
	ASL system_flags		 ; $B227: 06 1F   
	BRK					  ; $B229: 00	  
	AND $C953				; $B22A: 2D 53 C9
	PHP					  ; $B22D: 08	  
	BCS $B275				; $B22E: B0 45   
	LDX #$FF				 ; $B230: A2 FF   
	BRK					  ; $B232: 00	  
	AND #$C3				 ; $B233: 29 C3   
	ASL $00A2				; $B235: 0E A2 00
loc_B238:
	LSR					  ; $B238: 4A	  
	BCS $B241				; $B239: B0 06   
	INX					  ; $B23B: E8	  
	BNE $B238				; $B23C: D0 FA   
	JMP $B275				; $B23E: 4C 75 B2
loc_B241:
	TXA					  ; $B241: 8A	  
	ORA #$80				 ; $B242: 09 80   
	STA $7363				; $B244: 8D 63 73
	BRK					  ; $B247: 00	  
	.byte $1C			  ; $B248 - Unknown opcode
	.byte $B3			  ; $B249 - Unknown opcode
	STA $7355				; $B24A: 8D 55 73
	AND #$7F				 ; $B24D: 29 7F   
	CMP #$7F				 ; $B24F: C9 7F	; Compare with 127
	BEQ $B275				; $B251: F0 22   
	BRK					  ; $B253: 00	  
	BPL $B265				; $B254: 10 0F   
	BCC $B25F				; $B256: 90 07   
	AND #$7F				 ; $B258: 29 7F   
	BRK					  ; $B25A: 00	  
	ROR $73				  ; $B25B: 66 73   
	BCS $B275				; $B25D: B0 16   
loc_B25F:
	BRK					  ; $B25F: 00	  
	SBC ($D3,X)			  ; $B260: E1 D3	; Arithmetic
	.byte $47			  ; $B262 - Unknown opcode
	BRK					  ; $B263: 00	  
	ASL system_flags		 ; $B264: 06 1F   
	LDA $7355				; $B266: AD 55 73
	BRK					  ; $B269: 00	  
	ROL $AD73				; $B26A: 2E 73 AD
	SBC $72				  ; $B26D: E5 72	; Arithmetic
	ORA #$02				 ; $B26F: 09 02   
	STA $72E5				; $B271: 8D E5 72
	RTS					  ; $B274: 60	  
loc_B275:
	LDA #$7B				 ; $B275: A9 7B   
	BRK					  ; $B277: 00	  
	ASL					  ; $B278: 0A	  
	.byte $1F			  ; $B279 - Unknown opcode
	LDA #$80				 ; $B27A: A9 80   
	STA $7363				; $B27C: 8D 63 73
	BRK					  ; $B27F: 00	  
	.byte $E2			  ; $B280 - Unknown opcode
	.byte $D3			  ; $B281 - Unknown opcode
	BRK					  ; $B282: 00	  
	JMP $B180				; $B283: 4C 80 B1

; ---- Subroutine at $B286 (Bank 17) ----
sub_B286:
	BRK					  ; $B286: 00	  
	ASL system_flags		 ; $B287: 06 1F   
	BCS $B2F4				; $B289: B0 69   
	BRK					  ; $B28B: 00	  
	.byte $2B			  ; $B28C - Unknown opcode
	.byte $53			  ; $B28D - Unknown opcode
	CMP #$05				 ; $B28E: C9 05	; Compare with 5
	BNE $B2F4				; $B290: D0 62   
	LDA $615A				; $B292: AD 5A 61
	CMP #$02				 ; $B295: C9 02	; Compare with 2
	BEQ $B2F4				; $B297: F0 5B   
	BRK					  ; $B299: 00	  
	.byte $1B			  ; $B29A - Unknown opcode
	.byte $0F			  ; $B29B - Unknown opcode
	AND #$03				 ; $B29C: 29 03   
	BNE $B2F4				; $B29E: D0 54   
	BRK					  ; $B2A0: 00	  
	ORA system_flags		 ; $B2A1: 05 1F   
	CMP #$00				 ; $B2A3: C9 00	; Compare with 0
	BNE $B2F4				; $B2A5: D0 4D   
	LDA #$0D				 ; $B2A7: A9 0D   
	BRK					  ; $B2A9: 00	  
	.byte $17			  ; $B2AA - Unknown opcode
	.byte $0F			  ; $B2AB - Unknown opcode
	TAX					  ; $B2AC: AA	  
	LDA $B358,X			  ; $B2AD: BD 58 B3
	PHA					  ; $B2B0: 48	  
	BRK					  ; $B2B1: 00	  
	ASL					  ; $B2B2: 0A	  
	.byte $1F			  ; $B2B3 - Unknown opcode
	PLA					  ; $B2B4: 68	  
	BRK					  ; $B2B5: 00	  
	ASL $C93F				; $B2B6: 0E 3F C9
	.byte $03			  ; $B2B9 - Unknown opcode
	BNE $B2CA				; $B2BA: D0 0E   
	BRK					  ; $B2BC: 00	  
	ORA (system_flags,X)	 ; $B2BD: 01 1F   
	BRK					  ; $B2BF: 00	  
	ORA #$1F				 ; $B2C0: 09 1F   
	LDA #$80				 ; $B2C2: A9 80   
	BRK					  ; $B2C4: 00	  
	.byte $0B			  ; $B2C5 - Unknown opcode
	.byte $1F			  ; $B2C6 - Unknown opcode
	JMP $B34C				; $B2C7: 4C 4C B3
loc_B2CA:
	LDY #$00				 ; $B2CA: A0 00   
loc_B2CC:
	LDX #$FF				 ; $B2CC: A2 FF   
	TYA					  ; $B2CE: 98	  
	BRK					  ; $B2CF: 00	  
	AND $48B3				; $B2D0: 2D B3 48
	BRK					  ; $B2D3: 00	  
	AND #$C3				 ; $B2D4: 29 C3   
	ASL $2568				; $B2D6: 0E 68 25
	ROR $03D0,X			  ; $B2D9: 7E D0 03
	INY					  ; $B2DC: C8	  
	BNE $B2CC				; $B2DD: D0 ED   
	STY $7C				  ; $B2DF: 84 7C   
	BRK					  ; $B2E1: 00	  
	ORA (system_flags,X)	 ; $B2E2: 01 1F   
	BRK					  ; $B2E4: 00	  
	ORA #$1F				 ; $B2E5: 09 1F   
	BCC $B2F4				; $B2E7: 90 0B   
	LDA $7C				  ; $B2E9: A5 7C   
	CLC					  ; $B2EB: 18	  
	ADC #$88				 ; $B2EC: 69 88	; Arithmetic
	BRK					  ; $B2EE: 00	  
	.byte $0B			  ; $B2EF - Unknown opcode
	.byte $1F			  ; $B2F0 - Unknown opcode
	JSR $B34C				; $B2F1: 20 4C B3 ; -> sub_B34C
loc_B2F4:
	RTS					  ; $B2F4: 60	  

; ---- Subroutine at $B2F5 (Bank 17) ----
sub_B2F5:
	LDA $615A				; $B2F5: AD 5A 61
	CMP #$02				 ; $B2F8: C9 02	; Compare with 2
	BEQ $B31D				; $B2FA: F0 21   
	BRK					  ; $B2FC: 00	  
	.byte $03			  ; $B2FD - Unknown opcode
	.byte $1F			  ; $B2FE - Unknown opcode
	BRK					  ; $B2FF: 00	  
	ORA #$3F				 ; $B300: 09 3F   
	BCS $B31D				; $B302: B0 19   
	BRK					  ; $B304: 00	  
	ASL system_flags		 ; $B305: 06 1F   
	BCC $B31D				; $B307: 90 14   
	JSR $B31F				; $B309: 20 1F B3 ; -> sub_B31F
	BCC $B31D				; $B30C: 90 0F   
	STA $F9				  ; $B30E: 85 F9   
	JSR $C891				; $B310: 20 91 C8 ; Call to fixed bank
	CMP #$10				 ; $B313: C9 10	; Compare with 16
	BCS $B31D				; $B315: B0 06   
	BRK					  ; $B317: 00	  
	CMP $D3				  ; $B318: C5 D3   
	.byte $63			  ; $B31A - Unknown opcode
	CLC					  ; $B31B: 18	  
	RTS					  ; $B31C: 60	  
loc_B31D:
	SEC					  ; $B31D: 38	  
	RTS					  ; $B31E: 60	  

; ---- Subroutine at $B31F (Bank 17) ----
sub_B31F:
	BRK					  ; $B31F: 00	  
	.byte $62			  ; $B320 - Unknown opcode
	.byte $23			  ; $B321 - Unknown opcode
	.byte $43			  ; $B322 - Unknown opcode
	BEQ $B336				; $B323: F0 11   
	STA tmp0				 ; $B325: 85 00   
	LDX #$00				 ; $B327: A2 00   
loc_B329:
	BRK					  ; $B329: 00	  
	.byte $2B			  ; $B32A - Unknown opcode
	.byte $43			  ; $B32B - Unknown opcode
	.byte $43			  ; $B32C - Unknown opcode
	CMP #$05				 ; $B32D: C9 05	; Compare with 5
	BEQ $B338				; $B32F: F0 07   
	INX					  ; $B331: E8	  
	CPX tmp0				 ; $B332: E4 00   
	BCC $B329				; $B334: 90 F3   
loc_B336:
	CLC					  ; $B336: 18	  
	RTS					  ; $B337: 60	  
loc_B338:
	STX $6E				  ; $B338: 86 6E   
	BRK					  ; $B33A: 00	  
	ROL $A50F				; $B33B: 2E 0F A5
	.byte $72			  ; $B33E - Unknown opcode
	STA tmp0				 ; $B33F: 85 00   
	TAX					  ; $B341: AA	  
	BRK					  ; $B342: 00	  
	LSR $43				  ; $B343: 46 43   
	BPL $B2F7				; $B345: 10 B0   
	INC $00A5				; $B347: EE A5 00
	SEC					  ; $B34A: 38	  
	RTS					  ; $B34B: 60	  

; ---- Subroutine at $B34C (Bank 17) ----
sub_B34C:
	BRK					  ; $B34C: 00	  
	ORA (system_flags,X)	 ; $B34D: 01 1F   
	BRK					  ; $B34F: 00	  
	ORA #$1F				 ; $B350: 09 1F   
	LDA #$00				 ; $B352: A9 00   
	BRK					  ; $B354: 00	  
	.byte $0C			  ; $B355 - Unknown opcode
	.byte $1F			  ; $B356 - Unknown opcode
	RTS					  ; $B357: 60	  
	SEI					  ; $B358: 78	  
	ADC $7B7A,Y			  ; $B359: 79 7A 7B ; Arithmetic
	.byte $7C			  ; $B35C - Unknown opcode
	ADC $A87E,X			  ; $B35D: 7D 7E A8 ; Arithmetic
	LDA #$AA				 ; $B360: A9 AA   
	.byte $AB			  ; $B362 - Unknown opcode
	ROL $A93D,X			  ; $B363: 3E 3D A9
	.byte $7F			  ; $B366 - Unknown opcode
	BRK					  ; $B367: 00	  
	.byte $17			  ; $B368 - Unknown opcode
	.byte $0F			  ; $B369 - Unknown opcode
	STA $7355				; $B36A: 8D 55 73
	BRK					  ; $B36D: 00	  
	INC $D3				  ; $B36E: E6 D3   
	ORA ($60,X)			  ; $B370: 01 60   
	BRK					  ; $B372: 00	  
	.byte $F2			  ; $B373 - Unknown opcode
	.byte $D3			  ; $B374 - Unknown opcode
	ORA ($20,X)			  ; $B375: 01 20   
	CPY $AC				  ; $B377: C4 AC   
	BCC $B37F				; $B379: 90 04   
	BRK					  ; $B37B: 00	  
	INC $D3				  ; $B37C: E6 D3   
	.byte $02			  ; $B37E - Unknown opcode
loc_B37F:
	RTS					  ; $B37F: 60	  
	BRK					  ; $B380: 00	  
	ASL system_flags		 ; $B381: 06 1F   
	BRK					  ; $B383: 00	  
	AND #$53				 ; $B384: 29 53   
	BNE $B38D				; $B386: D0 05   
	BRK					  ; $B388: 00	  
	SBC ($D3),Y			  ; $B389: F1 D3	; Arithmetic
	.byte $12			  ; $B38B - Unknown opcode
	RTS					  ; $B38C: 60	  
loc_B38D:
	BRK					  ; $B38D: 00	  
	SBC ($D3),Y			  ; $B38E: F1 D3	; Arithmetic
	.byte $13			  ; $B390 - Unknown opcode
	RTS					  ; $B391: 60	  
	JSR $B51D				; $B392: 20 1D B5 ; -> sub_B51D
	BRK					  ; $B395: 00	  
	INC $D3				  ; $B396: E6 D3   
	ORA ($4C,X)			  ; $B398: 01 4C   
	.byte $DB			  ; $B39A - Unknown opcode
	BCC $B346				; $B39B: 90 A9   
	BIT $A2				  ; $B39D: 24 A2   
	.byte $17			  ; $B39F - Unknown opcode
	JSR $9D4F				; $B3A0: 20 4F 9D ; -> sub_9D4F
	RTS					  ; $B3A3: 60	  
	BRK					  ; $B3A4: 00	  
	LSR					  ; $B3A5: 4A	  
	.byte $33			  ; $B3A6 - Unknown opcode
	STA $FD				  ; $B3A7: 85 FD   
	LDA $73				  ; $B3A9: A5 73   
	STA $FE				  ; $B3AB: 85 FE   
	LDA $74				  ; $B3AD: A5 74   
	STA $FF				  ; $B3AF: 85 FF   
	BRK					  ; $B3B1: 00	  
	INC $D3				  ; $B3B2: E6 D3   
	ORA ($60,X)			  ; $B3B4: 01 60   
	BRK					  ; $B3B6: 00	  
	ASL system_flags		 ; $B3B7: 06 1F   
	BRK					  ; $B3B9: 00	  
	.byte $3B			  ; $B3BA - Unknown opcode
	.byte $93			  ; $B3BB - Unknown opcode
	BRK					  ; $B3BC: 00	  
	BCC $B3CB				; $B3BD: 90 0C   
	AND #$7F				 ; $B3BF: 29 7F   
	STA $7355				; $B3C1: 8D 55 73
	BRK					  ; $B3C4: 00	  
	SBC ($D3),Y			  ; $B3C5: F1 D3	; Arithmetic
	BPL $B415				; $B3C7: 10 4C   
	.byte $CF			  ; $B3C9 - Unknown opcode
	.byte $B3			  ; $B3CA - Unknown opcode
loc_B3CB:
	BRK					  ; $B3CB: 00	  
	SBC ($D3),Y			  ; $B3CC: F1 D3	; Arithmetic
	ORA (tmp0),Y			 ; $B3CE: 11 00   
	CPX $D3				  ; $B3D0: E4 D3   
	.byte $1A			  ; $B3D2 - Unknown opcode
	RTS					  ; $B3D3: 60	  
	BRK					  ; $B3D4: 00	  
	INC $D3				  ; $B3D5: E6 D3   
	ORA ($20,X)			  ; $B3D7: 01 20   
	ORA $4CB5,X			  ; $B3D9: 1D B5 4C
	.byte $DB			  ; $B3DC - Unknown opcode
	BCC $B3DF				; $B3DD: 90 00   
loc_B3DF:
	SBC $D3				  ; $B3DF: E5 D3	; Arithmetic
	ORA $2E20				; $B3E1: 0D 20 2E
	.byte $BF			  ; $B3E4 - Unknown opcode
	STY $E400				; $B3E5: 8C 00 E4
	.byte $D3			  ; $B3E8 - Unknown opcode
	.byte $62			  ; $B3E9 - Unknown opcode
	BRK					  ; $B3EA: 00	  
	ADC #$D3				 ; $B3EB: 69 D3	; Arithmetic
	EOR (tmp0,X)			 ; $B3ED: 41 00   
	ASL system_flags		 ; $B3EF: 06 1F   
	BCC $B401				; $B3F1: 90 0E   
	TXA					  ; $B3F3: 8A	  
	PHA					  ; $B3F4: 48	  
	JSR $9204				; $B3F5: 20 04 92 ; -> sub_9204
	BRK					  ; $B3F8: 00	  
	.byte $07			  ; $B3F9 - Unknown opcode
	.byte $2F			  ; $B3FA - Unknown opcode
	PLA					  ; $B3FB: 68	  
	TAX					  ; $B3FC: AA	  
	BRK					  ; $B3FD: 00	  
	.byte $2B			  ; $B3FE - Unknown opcode
	.byte $C3			  ; $B3FF - Unknown opcode
	.byte $0F			  ; $B400 - Unknown opcode
loc_B401:
	RTS					  ; $B401: 60	  
	LDX #$02				 ; $B402: A2 02   
loc_B404:
	TXA					  ; $B404: 8A	  
	PHA					  ; $B405: 48	  
	JSR $BF2E				; $B406: 20 2E BF ; -> sub_BF2E
	.byte $89			  ; $B409 - Unknown opcode
	BRK					  ; $B40A: 00	  
	CPX $D3				  ; $B40B: E4 D3   
	JMP $2E20				; $B40D: 4C 20 2E
	.byte $BF			  ; $B410 - Unknown opcode
	STY $E800				; $B411: 8C 00 E8
	.byte $D3			  ; $B414 - Unknown opcode
loc_B415:
	.byte $07			  ; $B415 - Unknown opcode
	PLA					  ; $B416: 68	  
	TAX					  ; $B417: AA	  
	DEX					  ; $B418: CA	  
	BPL $B404				; $B419: 10 E9   
loc_B41B:
	RTS					  ; $B41B: 60	  
	JSR $BF2E				; $B41C: 20 2E BF ; -> sub_BF2E
	.byte $93			  ; $B41F - Unknown opcode
	BRK					  ; $B420: 00	  
	SBC ($D3),Y			  ; $B421: F1 D3	; Arithmetic
	.byte $1C			  ; $B423 - Unknown opcode
	JSR $ACC4				; $B424: 20 C4 AC ; -> sub_ACC4
	BCC $B41B				; $B427: 90 F2   
	JSR $B51D				; $B429: 20 1D B5 ; -> sub_B51D
	LDA $7361				; $B42C: AD 61 73
	ADC #$0A				 ; $B42F: 69 0A	; Arithmetic
	STA $7361				; $B431: 8D 61 73
	JMP $90DB				; $B434: 4C DB 90
	BRK					  ; $B437: 00	  
	ASL system_flags		 ; $B438: 06 1F   
	LDA #$00				 ; $B43A: A9 00   
	STA $70				  ; $B43C: 85 70   
	BRK					  ; $B43E: 00	  
	.byte $3B			  ; $B43F - Unknown opcode
	.byte $73			  ; $B440 - Unknown opcode
	BCC $B452				; $B441: 90 0F   
	AND #$7F				 ; $B443: 29 7F   
	STA $7355				; $B445: 8D 55 73
	BRK					  ; $B448: 00	  
	.byte $13			  ; $B449 - Unknown opcode
	.byte $0F			  ; $B44A - Unknown opcode
	BRK					  ; $B44B: 00	  
	.byte $1A			  ; $B44C - Unknown opcode
	.byte $73			  ; $B44D - Unknown opcode
	BRK					  ; $B44E: 00	  
	SBC ($D3),Y			  ; $B44F: F1 D3	; Arithmetic
	.byte $14			  ; $B451 - Unknown opcode
loc_B452:
	RTS					  ; $B452: 60	  
	BRK					  ; $B453: 00	  
	ASL system_flags		 ; $B454: 06 1F   
	LDA #$00				 ; $B456: A9 00   
	STA $70				  ; $B458: 85 70   
	BRK					  ; $B45A: 00	  
	.byte $3B			  ; $B45B - Unknown opcode
	.byte $93			  ; $B45C - Unknown opcode
	ORA ($90,X)			  ; $B45D: 01 90   
	ASL $7F29,X			  ; $B45F: 1E 29 7F
	STA $7355				; $B462: 8D 55 73
	BRK					  ; $B465: 00	  
	.byte $13			  ; $B466 - Unknown opcode
	.byte $0F			  ; $B467 - Unknown opcode
	BRK					  ; $B468: 00	  
	ASL $0073,X			  ; $B469: 1E 73 00
	SBC ($D3),Y			  ; $B46C: F1 D3	; Arithmetic
	.byte $27			  ; $B46E - Unknown opcode
	BRK					  ; $B46F: 00	  
	.byte $07			  ; $B470 - Unknown opcode
	.byte $1F			  ; $B471 - Unknown opcode
	BCC $B47E				; $B472: 90 0A   
	BRK					  ; $B474: 00	  
	AND #$C3				 ; $B475: 29 C3   
	ORA ($B0),Y			  ; $B477: 11 B0   
	.byte $04			  ; $B479 - Unknown opcode
	BRK					  ; $B47A: 00	  
	SBC $D3				  ; $B47B: E5 D3	; Arithmetic
	PLP					  ; $B47D: 28	  
loc_B47E:
	RTS					  ; $B47E: 60	  
	LDA #$2B				 ; $B47F: A9 2B   
	JSR $B4A8				; $B481: 20 A8 B4 ; -> sub_B4A8
	BCS $B494				; $B484: B0 0E   
	LDA #$2A				 ; $B486: A9 2A   
	JSR $B4A8				; $B488: 20 A8 B4 ; -> sub_B4A8
	BCS $B494				; $B48B: B0 07   
	LDA #$29				 ; $B48D: A9 29   
	JSR $B4A8				; $B48F: 20 A8 B4 ; -> sub_B4A8
	BCC $B4A7				; $B492: 90 13   
loc_B494:
	BRK					  ; $B494: 00	  
	ASL					  ; $B495: 0A	  
	.byte $1F			  ; $B496 - Unknown opcode
	JSR $BF2E				; $B497: 20 2E BF ; -> sub_BF2E
	STX $10A0				; $B49A: 8E A0 10
	BRK					  ; $B49D: 00	  
	.byte $03			  ; $B49E - Unknown opcode
	.byte $4F			  ; $B49F - Unknown opcode
	BRK					  ; $B4A0: 00	  
	SBC ($D3),Y			  ; $B4A1: F1 D3	; Arithmetic
	LSR $3A20,X			  ; $B4A3: 5E 20 3A
	.byte $89			  ; $B4A6 - Unknown opcode
loc_B4A7:
	RTS					  ; $B4A7: 60	  

; ---- Subroutine at $B4A8 (Bank 17) ----
sub_B4A8:
	STA tmp0				 ; $B4A8: 85 00   
	BRK					  ; $B4AA: 00	  
	ASL system_flags		 ; $B4AB: 06 1F   
	STX $6E				  ; $B4AD: 86 6E   
	LDA #$00				 ; $B4AF: A9 00   
	STA $6F				  ; $B4B1: 85 6F   
loc_B4B3:
	BRK					  ; $B4B3: 00	  
	.byte $3F			  ; $B4B4 - Unknown opcode
	.byte $33			  ; $B4B5 - Unknown opcode
	CMP tmp0				 ; $B4B6: C5 00   
	BEQ $B4C4				; $B4B8: F0 0A   
	INC $6F				  ; $B4BA: E6 6F   
	LDA $6F				  ; $B4BC: A5 6F   
	CMP #$0C				 ; $B4BE: C9 0C	; Compare with 12
	BCC $B4B3				; $B4C0: 90 F1   
	CLC					  ; $B4C2: 18	  
	RTS					  ; $B4C3: 60	  
loc_B4C4:
	SEC					  ; $B4C4: 38	  
	RTS					  ; $B4C5: 60	  
	BRK					  ; $B4C6: 00	  
	EOR $9033,X			  ; $B4C7: 5D 33 90
	CLC					  ; $B4CA: 18	  
	BRK					  ; $B4CB: 00	  
	.byte $62			  ; $B4CC - Unknown opcode
	.byte $23			  ; $B4CD - Unknown opcode
	.byte $43			  ; $B4CE - Unknown opcode
	CMP #$01				 ; $B4CF: C9 01	; Compare with 1
	BEQ $B4E3				; $B4D1: F0 10   
	BRK					  ; $B4D3: 00	  
	.byte $F2			  ; $B4D4 - Unknown opcode
	.byte $D3			  ; $B4D5 - Unknown opcode
	ORA (tmp0,X)			 ; $B4D6: 01 00   
	ASL system_flags		 ; $B4D8: 06 1F   
	BRK					  ; $B4DA: 00	  
	.byte $5F			  ; $B4DB - Unknown opcode
	.byte $53			  ; $B4DC - Unknown opcode
	JSR $8786				; $B4DD: 20 86 87 ; -> sub_8786
	JSR $A3F7				; $B4E0: 20 F7 A3 ; -> sub_A3F7
loc_B4E3:
	RTS					  ; $B4E3: 60	  
	BRK					  ; $B4E4: 00	  
	.byte $62			  ; $B4E5 - Unknown opcode
	.byte $23			  ; $B4E6 - Unknown opcode
	.byte $43			  ; $B4E7 - Unknown opcode
	CMP #$01				 ; $B4E8: C9 01	; Compare with 1
	BEQ $B518				; $B4EA: F0 2C   
	LDX #$03				 ; $B4EC: A2 03   
loc_B4EE:
	LDA #$FF				 ; $B4EE: A9 FF   
	STA $6E,X				; $B4F0: 95 6E   
	DEX					  ; $B4F2: CA	  
	BPL $B4EE				; $B4F3: 10 F9   
	BRK					  ; $B4F5: 00	  
	ASL system_flags		 ; $B4F6: 06 1F   
	CPX #$00				 ; $B4F8: E0 00   
	BEQ $B518				; $B4FA: F0 1C   
	STX $6E				  ; $B4FC: 86 6E   
	BRK					  ; $B4FE: 00	  
	.byte $62			  ; $B4FF - Unknown opcode
	.byte $23			  ; $B500 - Unknown opcode
	RTI					  ; $B501: 40	  
	LDY #$00				 ; $B502: A0 00   
	LDX #$01				 ; $B504: A2 01   
loc_B506:
	CPY $6E				  ; $B506: C4 6E   
	BEQ $B50D				; $B508: F0 03   
	STY $6E,X				; $B50A: 94 6E   
	INX					  ; $B50C: E8	  
loc_B50D:
	INY					  ; $B50D: C8	  
	CPX $72				  ; $B50E: E4 72   
	BCC $B506				; $B510: 90 F4   
	BRK					  ; $B512: 00	  
	LSR $4C33,X			  ; $B513: 5E 33 4C
	.byte $F7			  ; $B516 - Unknown opcode
	.byte $A3			  ; $B517 - Unknown opcode
loc_B518:
	BRK					  ; $B518: 00	  
	CPX $D3				  ; $B519: E4 D3   
	.byte $1A			  ; $B51B - Unknown opcode
	RTS					  ; $B51C: 60	  

; ---- Subroutine at $B51D (Bank 17) ----
sub_B51D:
	LDA #$04				 ; $B51D: A9 04   
	BRK					  ; $B51F: 00	  
	.byte $17			  ; $B520 - Unknown opcode
	.byte $0F			  ; $B521 - Unknown opcode
	ADC #$01				 ; $B522: 69 01	; Arithmetic
	STA $7361				; $B524: 8D 61 73
	LDA #$00				 ; $B527: A9 00   
	STA $7362				; $B529: 8D 62 73
loc_B52C:
	RTS					  ; $B52C: 60	  

; ---- Subroutine at $B52D (Bank 17) ----
sub_B52D:
	BRK					  ; $B52D: 00	  
	ASL system_flags		 ; $B52E: 06 1F   
	BCS $B52C				; $B530: B0 FA   
	BRK					  ; $B532: 00	  
	.byte $3B			  ; $B533 - Unknown opcode
	.byte $93			  ; $B534 - Unknown opcode
	.byte $03			  ; $B535 - Unknown opcode
	CMP #$CC				 ; $B536: C9 CC	; Compare with 204
	BNE $B53E				; $B538: D0 04   
	BRK					  ; $B53A: 00	  
	.byte $44			  ; $B53B - Unknown opcode
	.byte $93			  ; $B53C - Unknown opcode
	.byte $12			  ; $B53D - Unknown opcode
loc_B53E:
	BRK					  ; $B53E: 00	  
	LSR $93				  ; $B53F: 46 93   
	.byte $12			  ; $B541 - Unknown opcode
	BCC $B52C				; $B542: 90 E8   
	BRK					  ; $B544: 00	  
	.byte $1B			  ; $B545 - Unknown opcode
	.byte $0F			  ; $B546 - Unknown opcode
	CMP #$80				 ; $B547: C9 80	; Compare with 128
	BCC $B553				; $B549: 90 08   
	CMP #$C0				 ; $B54B: C9 C0	; Compare with 192
	BCS $B564				; $B54D: B0 15   
	LDX #$43				 ; $B54F: A2 43   
	BNE $B555				; $B551: D0 02   
loc_B553:
	LDX #$29				 ; $B553: A2 29   
loc_B555:
	LDY #$80				 ; $B555: A0 80   
	BRK					  ; $B557: 00	  
	.byte $13			  ; $B558 - Unknown opcode
	.byte $3F			  ; $B559 - Unknown opcode
	PHA					  ; $B55A: 48	  
	LDA #$43				 ; $B55B: A9 43   
	BRK					  ; $B55D: 00	  
	ASL					  ; $B55E: 0A	  
	.byte $1F			  ; $B55F - Unknown opcode
	PLA					  ; $B560: 68	  
	JMP $B615				; $B561: 4C 15 B6
loc_B564:
	BRK					  ; $B564: 00	  
	.byte $1B			  ; $B565 - Unknown opcode
	.byte $0F			  ; $B566 - Unknown opcode
	AND #$07				 ; $B567: 29 07   
	LDA #$04				 ; $B569: A9 04   
	CMP #$04				 ; $B56B: C9 04	; Compare with 4
	BCS $B579				; $B56D: B0 0A   
	TAX					  ; $B56F: AA	  
	LDA $B625,X			  ; $B570: BD 25 B6
	BRK					  ; $B573: 00	  
	ASL					  ; $B574: 0A	  
	.byte $1F			  ; $B575 - Unknown opcode
	JMP $B60C				; $B576: 4C 0C B6
loc_B579:
	SBC #$04				 ; $B579: E9 04	; Arithmetic
	STA tmp0				 ; $B57B: 85 00   
	BRK					  ; $B57D: 00	  
	ASL system_flags		 ; $B57E: 06 1F   
	BRK					  ; $B580: 00	  
	.byte $2B			  ; $B581 - Unknown opcode
	.byte $53			  ; $B582 - Unknown opcode
	CMP #$08				 ; $B583: C9 08	; Compare with 8
	BCC $B589				; $B585: 90 02   
	LDA #$08				 ; $B587: A9 08   
loc_B589:
	TAY					  ; $B589: A8	  
	ASL					  ; $B58A: 0A	  
	ASL					  ; $B58B: 0A	  
	ADC tmp0				 ; $B58C: 65 00	; Arithmetic
	STA tmp0				 ; $B58E: 85 00   
	BRK					  ; $B590: 00	  
	.byte $1B			  ; $B591 - Unknown opcode
	.byte $0F			  ; $B592 - Unknown opcode
	AND #$03				 ; $B593: 29 03   
	CPY #$08				 ; $B595: C0 08   
	BNE $B59E				; $B597: D0 05   
	LDA #$06				 ; $B599: A9 06   
	BRK					  ; $B59B: 00	  
	.byte $17			  ; $B59C - Unknown opcode
	.byte $0F			  ; $B59D - Unknown opcode
loc_B59E:
	CLC					  ; $B59E: 18	  
	ADC tmp0				 ; $B59F: 65 00	; Arithmetic
	TAX					  ; $B5A1: AA	  
	LDA $B629,X			  ; $B5A2: BD 29 B6
	PHA					  ; $B5A5: 48	  
	BRK					  ; $B5A6: 00	  
	ASL					  ; $B5A7: 0A	  
	.byte $1F			  ; $B5A8 - Unknown opcode
	PLA					  ; $B5A9: 68	  
	CMP #$C6				 ; $B5AA: C9 C6	; Compare with 198
	BEQ $B5CE				; $B5AC: F0 20   
	CMP #$AF				 ; $B5AE: C9 AF	; Compare with 175
	BEQ $B5CE				; $B5B0: F0 1C   
	CMP #$B6				 ; $B5B2: C9 B6	; Compare with 182
	BEQ $B5DA				; $B5B4: F0 24   
	CMP #$BC				 ; $B5B6: C9 BC	; Compare with 188
	BEQ $B5E6				; $B5B8: F0 2C   
	CMP #$C2				 ; $B5BA: C9 C2	; Compare with 194
	BEQ $B5ED				; $B5BC: F0 2F   
	CMP #$C4				 ; $B5BE: C9 C4	; Compare with 196
	BEQ $B5F8				; $B5C0: F0 36   
	CMP #$C5				 ; $B5C2: C9 C5	; Compare with 197
	BEQ $B5F8				; $B5C4: F0 32   
	CMP #$C7				 ; $B5C6: C9 C7	; Compare with 199
	BEQ $B5ED				; $B5C8: F0 23   
	JSR $B60C				; $B5CA: 20 0C B6 ; -> sub_B60C
	RTS					  ; $B5CD: 60	  
loc_B5CE:
	BRK					  ; $B5CE: 00	  
	ASL system_flags		 ; $B5CF: 06 1F   
	BRK					  ; $B5D1: 00	  
	.byte $3B			  ; $B5D2 - Unknown opcode
	.byte $93			  ; $B5D3 - Unknown opcode
	BRK					  ; $B5D4: 00	  
	BCC $B604				; $B5D5: 90 2D   
	JMP $B60C				; $B5D7: 4C 0C B6
loc_B5DA:
	BRK					  ; $B5DA: 00	  
	ASL system_flags		 ; $B5DB: 06 1F   
	BRK					  ; $B5DD: 00	  
loc_B5DE:
	.byte $3B			  ; $B5DE - Unknown opcode
	.byte $93			  ; $B5DF - Unknown opcode
	ORA ($90,X)			  ; $B5E0: 01 90   
	AND ($4C,X)			  ; $B5E2: 21 4C   
	.byte $0C			  ; $B5E4 - Unknown opcode
	LDX tmp0,Y			   ; $B5E5: B6 00   
	ASL system_flags		 ; $B5E7: 06 1F   
	CPX #$00				 ; $B5E9: E0 00   
	BEQ $B604				; $B5EB: F0 17   
loc_B5ED:
	BRK					  ; $B5ED: 00	  
	.byte $62			  ; $B5EE - Unknown opcode
	.byte $23			  ; $B5EF - Unknown opcode
	.byte $43			  ; $B5F0 - Unknown opcode
	CMP #$01				 ; $B5F1: C9 01	; Compare with 1
	BEQ $B604				; $B5F3: F0 0F   
	JMP $B60C				; $B5F5: 4C 0C B6
loc_B5F8:
	BRK					  ; $B5F8: 00	  
	LSR					  ; $B5F9: 4A	  
	.byte $33			  ; $B5FA - Unknown opcode
	ORA $73				  ; $B5FB: 05 73   
	ORA $74				  ; $B5FD: 05 74   
	BEQ $B604				; $B5FF: F0 03   
	JMP $B60C				; $B601: 4C 0C B6
loc_B604:
	LDA #$AC				 ; $B604: A9 AC   
	BRK					  ; $B606: 00	  
	ASL					  ; $B607: 0A	  
	.byte $1F			  ; $B608 - Unknown opcode
	JMP $B60C				; $B609: 4C 0C B6

; ---- Subroutine at $B60C (Bank 17) ----
sub_B60C:
	BRK					  ; $B60C: 00	  
	.byte $03			  ; $B60D - Unknown opcode
	.byte $1F			  ; $B60E - Unknown opcode
	TAX					  ; $B60F: AA	  
	LDY #$80				 ; $B610: A0 80   
	BRK					  ; $B612: 00	  
	.byte $13			  ; $B613 - Unknown opcode
	.byte $3F			  ; $B614 - Unknown opcode
loc_B615:
	STA tmp0				 ; $B615: 85 00   
	BRK					  ; $B617: 00	  
	ORA (system_flags,X)	 ; $B618: 01 1F   
	BRK					  ; $B61A: 00	  
	ORA #$1F				 ; $B61B: 09 1F   
	LDA tmp0				 ; $B61D: A5 00   
loc_B61F:
	BRK					  ; $B61F: 00	  
	.byte $0B			  ; $B620 - Unknown opcode
	.byte $1F			  ; $B621 - Unknown opcode
	JMP $B34C				; $B622: 4C 4C B3
	LDY $D4AD				; $B625: AC AD D4
	BNE $B5D8				; $B628: D0 AE   
	.byte $AF			  ; $B62A - Unknown opcode
	BCS $B5DE				; $B62B: B0 B1   
	.byte $B2			  ; $B62D - Unknown opcode
	.byte $B3			  ; $B62E - Unknown opcode
	LDY $B5,X				; $B62F: B4 B5   
	LDX $B7,Y				; $B631: B6 B7   
	CLV					  ; $B633: B8	  
	LDA $BBBA,Y			  ; $B634: B9 BA BB
	LDY $BEBD,X			  ; $B637: BC BD BE
	.byte $BF			  ; $B63A - Unknown opcode
	CPY #$C1				 ; $B63B: C0 C1   
	.byte $C2			  ; $B63D - Unknown opcode
	.byte $C3			  ; $B63E - Unknown opcode
	CPY $C5				  ; $B63F: C4 C5   
	DEC $AF				  ; $B641: C6 AF   
	.byte $C7			  ; $B643 - Unknown opcode
	.byte $D2			  ; $B644 - Unknown opcode
	INY					  ; $B645: C8	  
	CMP #$CA				 ; $B646: C9 CA	; Compare with 202
	.byte $CB			  ; $B648 - Unknown opcode
	CPY $CFCD				; $B649: CC CD CF
	BNE $B61F				; $B64C: D0 D1   
	.byte $D2			  ; $B64E - Unknown opcode
	DEC $2058				; $B64F: CE 58 20
	.byte $1C			  ; $B652 - Unknown opcode
	LDA $1EA9,Y			  ; $B653: B9 A9 1E
	JMP $9C74				; $B656: 4C 74 9C
	LDA $72E4				; $B659: AD E4 72
	ORA #$08				 ; $B65C: 09 08   
	STA $72E4				; $B65E: 8D E4 72
	BRK					  ; $B661: 00	  
	INC $D3				  ; $B662: E6 D3   
	ORA ($60,X)			  ; $B664: 01 60   
	BRK					  ; $B666: 00	  
	ORA (system_flags,X)	 ; $B667: 01 1F   
	BMI $B692				; $B669: 30 27   
	STA tmp0				 ; $B66B: 85 00   
	LDA $72E6				; $B66D: AD E6 72
	AND #$30				 ; $B670: 29 30   
	ORA tmp0				 ; $B672: 05 00   
	ORA #$C0				 ; $B674: 09 C0   
	STA $72E6				; $B676: 8D E6 72
	LDA $72E5				; $B679: AD E5 72
	ORA #$80				 ; $B67C: 09 80   
	STA $72E5				; $B67E: 8D E5 72
	BRK					  ; $B681: 00	  
	BRK					  ; $B682: 00	  
	.byte $FB			  ; $B683 - Unknown opcode
	LDX #$5A				 ; $B684: A2 5A   
	JSR $C90C				; $B686: 20 0C C9 ; Call to fixed bank
	BRK					  ; $B689: 00	  
	INC $D3				  ; $B68A: E6 D3   
	ORA ($A2,X)			  ; $B68C: 01 A2   
	PLP					  ; $B68E: 28	  
	JSR $C90C				; $B68F: 20 0C C9 ; Call to fixed bank
loc_B692:
	RTS					  ; $B692: 60	  
	BRK					  ; $B693: 00	  
	INC $D3				  ; $B694: E6 D3   
	ORA (tmp0,X)			 ; $B696: 01 00   
	.byte $1B			  ; $B698 - Unknown opcode
	.byte $0F			  ; $B699 - Unknown opcode
	AND #$01				 ; $B69A: 29 01   
	TAX					  ; $B69C: AA	  
	INX					  ; $B69D: E8	  
	STX tmp0				 ; $B69E: 86 00   
	LDA $6E44				; $B6A0: AD 44 6E
	AND #$FC				 ; $B6A3: 29 FC   
	ORA tmp0				 ; $B6A5: 05 00   
	STA $6E44				; $B6A7: 8D 44 6E
	AND #$03				 ; $B6AA: 29 03   
	CMP #$01				 ; $B6AC: C9 01	; Compare with 1
	BEQ $B6BF				; $B6AE: F0 0F   
	LDY #$EB				 ; $B6B0: A0 EB   
	BIT $72E4				; $B6B2: 2C E4 72
	BVS $B6B8				; $B6B5: 70 01   
	INY					  ; $B6B7: C8	  
loc_B6B8:
	TYA					  ; $B6B8: 98	  
	BRK					  ; $B6B9: 00	  
	SBC $E3				  ; $B6BA: E5 E3	; Arithmetic
	JMP $B6CE				; $B6BC: 4C CE B6
loc_B6BF:
	LDY #$ED				 ; $B6BF: A0 ED   
	BRK					  ; $B6C1: 00	  
	.byte $62			  ; $B6C2 - Unknown opcode
	.byte $23			  ; $B6C3 - Unknown opcode
	ORA ($C9,X)			  ; $B6C4: 01 C9   
	ORA ($D0,X)			  ; $B6C6: 01 D0   
	ORA ($C8,X)			  ; $B6C8: 01 C8   
	TYA					  ; $B6CA: 98	  
	BRK					  ; $B6CB: 00	  
	SBC $E3				  ; $B6CC: E5 E3	; Arithmetic
loc_B6CE:
	PLA					  ; $B6CE: 68	  
	PLA					  ; $B6CF: 68	  
	PLA					  ; $B6D0: 68	  
	PLA					  ; $B6D1: 68	  
	PLA					  ; $B6D2: 68	  
	PLA					  ; $B6D3: 68	  
	PLA					  ; $B6D4: 68	  
	PLA					  ; $B6D5: 68	  
	PLA					  ; $B6D6: 68	  
	PLA					  ; $B6D7: 68	  
	JMP $8053				; $B6D8: 4C 53 80
	BRK					  ; $B6DB: 00	  
	.byte $07			  ; $B6DC - Unknown opcode
	.byte $1F			  ; $B6DD - Unknown opcode
	BCC $B6E8				; $B6DE: 90 08   
	BRK					  ; $B6E0: 00	  
	.byte $0C			  ; $B6E1 - Unknown opcode
	.byte $B3			  ; $B6E2 - Unknown opcode
	BRK					  ; $B6E3: 00	  
	INC $D3				  ; $B6E4: E6 D3   
	ORA ($60,X)			  ; $B6E6: 01 60   
loc_B6E8:
	BVC $B6F1				; $B6E8: 50 07   
	BRK					  ; $B6EA: 00	  
	ORA $0073				; $B6EB: 0D 73 00
	INC $D3				  ; $B6EE: E6 D3   
	ORA ($60,X)			  ; $B6F0: 01 60   
	BRK					  ; $B6F2: 00	  
	ORA $3F				  ; $B6F3: 05 3F   
	STA $7361				; $B6F5: 8D 61 73
	LDA $70				  ; $B6F8: A5 70   
	STA $7362				; $B6FA: 8D 62 73
	JMP $90DB				; $B6FD: 4C DB 90
	LDA #$93				 ; $B700: A9 93   
	JMP $9C74				; $B702: 4C 74 9C
	BRK					  ; $B705: 00	  
	INC $D3				  ; $B706: E6 D3   
	ORA ($A9,X)			  ; $B708: 01 A9   
	BRK					  ; $B70A: 00	  
	STA $735E				; $B70B: 8D 5E 73
loc_B70E:
	JSR $96C3				; $B70E: 20 C3 96 ; -> sub_96C3
	BCC $B72E				; $B711: 90 1B   
	JSR $BF2E				; $B713: 20 2E BF ; -> sub_BF2E
	.byte $89			  ; $B716 - Unknown opcode
	BRK					  ; $B717: 00	  
	SBC ($D3,X)			  ; $B718: E1 D3	; Arithmetic
	STY $20,X				; $B71A: 94 20   
	CPY $AC				  ; $B71C: C4 AC   
	BCC $B72E				; $B71E: 90 0E   
	BRK					  ; $B720: 00	  
	ORA $3F				  ; $B721: 05 3F   
	STA $7361				; $B723: 8D 61 73
	LDA $70				  ; $B726: A5 70   
	STA $7362				; $B728: 8D 62 73
	JSR $90DB				; $B72B: 20 DB 90 ; -> sub_90DB
loc_B72E:
	INC $735E				; $B72E: EE 5E 73
	LDA $735E				; $B731: AD 5E 73
	CMP #$08				 ; $B734: C9 08	; Compare with 8
	BCC $B70E				; $B736: 90 D6   
	BRK					  ; $B738: 00	  
	SBC ($D3,X)			  ; $B739: E1 D3	; Arithmetic
	STA $60,X				; $B73B: 95 60   
	BRK					  ; $B73D: 00	  
	PHP					  ; $B73E: 08	  
	.byte $4F			  ; $B73F - Unknown opcode
	BIT $72E4				; $B740: 2C E4 72
	BVS $B753				; $B743: 70 0E   
	LDA $6E45				; $B745: AD 45 6E
	CMP #$99				 ; $B748: C9 99	; Compare with 153
	BEQ $B753				; $B74A: F0 07   
	BRK					  ; $B74C: 00	  
	SBC $D3				  ; $B74D: E5 D3	; Arithmetic
	STX $4C,Y				; $B74F: 96 4C   
	.byte $57			  ; $B751 - Unknown opcode
	.byte $B7			  ; $B752 - Unknown opcode
loc_B753:
	BRK					  ; $B753: 00	  
	SBC $D3				  ; $B754: E5 D3	; Arithmetic
	EOR $03A2,X			  ; $B756: 5D A2 03
	LDA #$FF				 ; $B759: A9 FF   
loc_B75B:
	STA $6E45,X			  ; $B75B: 9D 45 6E
	DEX					  ; $B75E: CA	  
	BPL $B75B				; $B75F: 10 FA   
	LDA #$5C				 ; $B761: A9 5C   
	STA $6E45				; $B763: 8D 45 6E
	STA $7206				; $B766: 8D 06 72
	LDX #$80				 ; $B769: A2 80   
	BRK					  ; $B76B: 00	  
	AND #$C3				 ; $B76C: 29 C3   
	ASL $498D				; $B76E: 0E 8D 49
	ROR $FFA2				; $B771: 6E A2 FF
	BRK					  ; $B774: 00	  
	AND #$C3				 ; $B775: 29 C3   
	ASL $00A2				; $B777: 0E A2 00
loc_B77A:
	LSR					  ; $B77A: 4A	  
	PHA					  ; $B77B: 48	  
	BCS $B785				; $B77C: B0 07   
	BRK					  ; $B77E: 00	  
	.byte $2B			  ; $B77F - Unknown opcode
	.byte $C3			  ; $B780 - Unknown opcode
	.byte $0F			  ; $B781 - Unknown opcode
	JMP $B78C				; $B782: 4C 8C B7
loc_B785:
	LDA #$00				 ; $B785: A9 00   
	STA $7C				  ; $B787: 85 7C   
	BRK					  ; $B789: 00	  
	AND ($B3),Y			  ; $B78A: 31 B3   
loc_B78C:
	PLA					  ; $B78C: 68	  
	INX					  ; $B78D: E8	  
	CPX #$08				 ; $B78E: E0 08   
	BCC $B77A				; $B790: 90 E8   
	LDA $6E44				; $B792: AD 44 6E
	AND #$FC				 ; $B795: 29 FC   
	ORA #$02				 ; $B797: 09 02   
	STA $6E44				; $B799: 8D 44 6E
	RTS					  ; $B79C: 60	  
	LDA #$00				 ; $B79D: A9 00   
	JMP $9C74				; $B79F: 4C 74 9C
	BRK					  ; $B7A2: 00	  
	INC $D3				  ; $B7A3: E6 D3   
	ORA ($AD,X)			  ; $B7A5: 01 AD   
	SBC $72				  ; $B7A7: E5 72	; Arithmetic
	ORA #$01				 ; $B7A9: 09 01   
	STA $72E5				; $B7AB: 8D E5 72
	RTS					  ; $B7AE: 60	  
	BRK					  ; $B7AF: 00	  
	INC $D3				  ; $B7B0: E6 D3   
	ORA (tmp0,X)			 ; $B7B2: 01 00   
	ASL system_flags		 ; $B7B4: 06 1F   
	BRK					  ; $B7B6: 00	  
	BRK					  ; $B7B7: 00	  
	.byte $53			  ; $B7B8 - Unknown opcode
	LDA #$28				 ; $B7B9: A9 28   
	BRK					  ; $B7BB: 00	  
	.byte $17			  ; $B7BC - Unknown opcode
	.byte $0F			  ; $B7BD - Unknown opcode
	CLC					  ; $B7BE: 18	  
	ADC #$19				 ; $B7BF: 69 19	; Arithmetic
	LDX #$72				 ; $B7C1: A2 72   
	JSR $C827				; $B7C3: 20 27 C8 ; Call to fixed bank
	LDA #$20				 ; $B7C6: A9 20   
	JSR $C851				; $B7C8: 20 51 C8 ; Call to fixed bank
	LDA #$01				 ; $B7CB: A9 01   
	JSR $C813				; $B7CD: 20 13 C8 ; Call to fixed bank
	LDA $72				  ; $B7D0: A5 72   
	STA $7361				; $B7D2: 8D 61 73
	LDA $73				  ; $B7D5: A5 73   
	STA $7362				; $B7D7: 8D 62 73
	JSR $90DB				; $B7DA: 20 DB 90 ; -> sub_90DB
	JSR $A3F7				; $B7DD: 20 F7 A3 ; -> sub_A3F7
	LDA $72E7				; $B7E0: AD E7 72
	AND #$01				 ; $B7E3: 29 01   
	BNE $B7F7				; $B7E5: D0 10   
	BRK					  ; $B7E7: 00	  
	SBC #$D3				 ; $B7E8: E9 D3	; Arithmetic
	STA $0600,X			  ; $B7EA: 9D 00 06
	.byte $1F			  ; $B7ED - Unknown opcode
	BRK					  ; $B7EE: 00	  
	.byte $44			  ; $B7EF - Unknown opcode
	.byte $93			  ; $B7F0 - Unknown opcode
	ROL $A9				  ; $B7F1: 26 A9   
	.byte $52			  ; $B7F3 - Unknown opcode
	JSR $B808				; $B7F4: 20 08 B8 ; -> sub_B808
loc_B7F7:
	RTS					  ; $B7F7: 60	  
	BRK					  ; $B7F8: 00	  
	.byte $03			  ; $B7F9 - Unknown opcode
	.byte $1F			  ; $B7FA - Unknown opcode
	CLC					  ; $B7FB: 18	  
	ADC #$01				 ; $B7FC: 69 01	; Arithmetic
	BRK					  ; $B7FE: 00	  
	ASL					  ; $B7FF: 0A	  
	.byte $1F			  ; $B800 - Unknown opcode
	JSR $B8D4				; $B801: 20 D4 B8 ; -> sub_B8D4
	JSR $893A				; $B804: 20 3A 89 ; -> sub_893A
	RTS					  ; $B807: 60	  

; ---- Subroutine at $B808 (Bank 17) ----
sub_B808:
	STA tmp0				 ; $B808: 85 00   
	LDA $96				  ; $B80A: A5 96   
	PHA					  ; $B80C: 48	  
	BRK					  ; $B80D: 00	  
	.byte $03			  ; $B80E - Unknown opcode
	.byte $1F			  ; $B80F - Unknown opcode
	PHA					  ; $B810: 48	  
	BRK					  ; $B811: 00	  
	.byte $02			  ; $B812 - Unknown opcode
	.byte $1F			  ; $B813 - Unknown opcode
	PHA					  ; $B814: 48	  
	LDA $735D				; $B815: AD 5D 73
	PHA					  ; $B818: 48	  
	LDA $735C				; $B819: AD 5C 73
	PHA					  ; $B81C: 48	  
	LDA $735E				; $B81D: AD 5E 73
	PHA					  ; $B820: 48	  
	LDA $7363				; $B821: AD 63 73
	BRK					  ; $B824: 00	  
	ORA #$1F				 ; $B825: 09 1F   
	BCC $B850				; $B827: 90 27   
	STX $96				  ; $B829: 86 96   
	LDA #$00				 ; $B82B: A9 00   
	BRK					  ; $B82D: 00	  
	.byte $0C			  ; $B82E - Unknown opcode
	.byte $1F			  ; $B82F - Unknown opcode
	BRK					  ; $B830: 00	  
	.byte $04			  ; $B831 - Unknown opcode
	.byte $1F			  ; $B832 - Unknown opcode
	CMP #$02				 ; $B833: C9 02	; Compare with 2
	BCS $B849				; $B835: B0 12   
	LDX $96				  ; $B837: A6 96   
	LDA #$00				 ; $B839: A9 00   
	BRK					  ; $B83B: 00	  
	PHP					  ; $B83C: 08	  
	.byte $1F			  ; $B83D - Unknown opcode
	LDA tmp0				 ; $B83E: A5 00   
	BRK					  ; $B840: 00	  
	ASL					  ; $B841: 0A	  
	.byte $1F			  ; $B842 - Unknown opcode
	JSR $B8D4				; $B843: 20 D4 B8 ; -> sub_B8D4
	JSR $88CA				; $B846: 20 CA 88 ; -> sub_88CA
loc_B849:
	LDX $96				  ; $B849: A6 96   
	LDA #$02				 ; $B84B: A9 02   
	BRK					  ; $B84D: 00	  
	PHP					  ; $B84E: 08	  
	.byte $1F			  ; $B84F - Unknown opcode
loc_B850:
	PLA					  ; $B850: 68	  
	STA $735E				; $B851: 8D 5E 73
	PLA					  ; $B854: 68	  
	STA $735C				; $B855: 8D 5C 73
	PLA					  ; $B858: 68	  
	STA $735D				; $B859: 8D 5D 73
	BRK					  ; $B85C: 00	  
	ORA (system_flags,X)	 ; $B85D: 01 1F   
	BRK					  ; $B85F: 00	  
	ORA #$1F				 ; $B860: 09 1F   
	PLA					  ; $B862: 68	  
	BRK					  ; $B863: 00	  
	.byte $0B			  ; $B864 - Unknown opcode
	.byte $1F			  ; $B865 - Unknown opcode
	PLA					  ; $B866: 68	  
	BRK					  ; $B867: 00	  
	ASL					  ; $B868: 0A	  
	.byte $1F			  ; $B869 - Unknown opcode
	PLA					  ; $B86A: 68	  
	STA $96				  ; $B86B: 85 96   
	RTS					  ; $B86D: 60	  
loc_B86E:
	JMP $B8F8				; $B86E: 4C F8 B8

; ---- Subroutine at $B871 (Bank 17) ----
sub_B871:
	BRK					  ; $B871: 00	  
	ORA system_flags		 ; $B872: 05 1F   
	CMP #$00				 ; $B874: C9 00	; Compare with 0
	BNE $B86E				; $B876: D0 F6   
	BRK					  ; $B878: 00	  
	.byte $03			  ; $B879 - Unknown opcode
	.byte $1F			  ; $B87A - Unknown opcode
	CMP #$34				 ; $B87B: C9 34	; Compare with 52
	BNE $B86E				; $B87D: D0 EF   
	LDA $72E4				; $B87F: AD E4 72
	BMI $B888				; $B882: 30 04   
	JSR $BF2E				; $B884: 20 2E BF ; -> sub_BF2E
	STX $10A0				; $B887: 8E A0 10
	BRK					  ; $B88A: 00	  
	.byte $03			  ; $B88B - Unknown opcode
	.byte $4F			  ; $B88C - Unknown opcode
	BRK					  ; $B88D: 00	  
	.byte $E2			  ; $B88E - Unknown opcode
	.byte $D3			  ; $B88F - Unknown opcode
	BRK					  ; $B890: 00	  
	JSR $ABB5				; $B891: 20 B5 AB ; -> sub_ABB5
	BCC $B8FA				; $B894: 90 64   
	JSR $8C50				; $B896: 20 50 8C ; -> sub_8C50
	BCC $B8FA				; $B899: 90 5F   
	LDA $72E5				; $B89B: AD E5 72
	AND #$08				 ; $B89E: 29 08   
	BEQ $B8AE				; $B8A0: F0 0C   
	LDA $72E5				; $B8A2: AD E5 72
	AND #$F7				 ; $B8A5: 29 F7   
	STA $72E5				; $B8A7: 8D E5 72
	LDA #$E1				 ; $B8AA: A9 E1   
	BNE $B8C9				; $B8AC: D0 1B   
loc_B8AE:
	LDA #$1B				 ; $B8AE: A9 1B   
	LDX $6E44				; $B8B0: AE 44 6E
	BPL $B8B7				; $B8B3: 10 02   
	LDA #$0F				 ; $B8B5: A9 0F   
loc_B8B7:
	BRK					  ; $B8B7: 00	  
	.byte $17			  ; $B8B8 - Unknown opcode
	.byte $0F			  ; $B8B9 - Unknown opcode
	TAX					  ; $B8BA: AA	  
	LDA $6E44				; $B8BB: AD 44 6E
	BPL $B8C6				; $B8BE: 10 06   
	LDA $B951,X			  ; $B8C0: BD 51 B9
	JMP $B8C9				; $B8C3: 4C C9 B8
loc_B8C6:
	LDA $B936,X			  ; $B8C6: BD 36 B9
loc_B8C9:
	NOP					  ; $B8C9: EA	  
	PHA					  ; $B8CA: 48	  
	JSR $B8FC				; $B8CB: 20 FC B8 ; -> sub_B8FC
	PLA					  ; $B8CE: 68	  
	BCC $B8AE				; $B8CF: 90 DD   
	BRK					  ; $B8D1: 00	  
	ASL					  ; $B8D2: 0A	  
	.byte $1F			  ; $B8D3 - Unknown opcode

; ---- Subroutine at $B8D4 (Bank 17) ----
sub_B8D4:
	BRK					  ; $B8D4: 00	  
	.byte $03			  ; $B8D5 - Unknown opcode
	.byte $1F			  ; $B8D6 - Unknown opcode
	BRK					  ; $B8D7: 00	  
	.byte $0C			  ; $B8D8 - Unknown opcode
	.byte $3F			  ; $B8D9 - Unknown opcode
	BCS $B8E0				; $B8DA: B0 04   
	LDA #$00				 ; $B8DC: A9 00   
	BEQ $B8EB				; $B8DE: F0 0B   
loc_B8E0:
	LDX #$FF				 ; $B8E0: A2 FF   
	BRK					  ; $B8E2: 00	  
	AND #$C3				 ; $B8E3: 29 C3   
	ASL $2B00				; $B8E5: 0E 00 2B
	.byte $0F			  ; $B8E8 - Unknown opcode
	ORA #$80				 ; $B8E9: 09 80   
loc_B8EB:
	STA tmp0				 ; $B8EB: 85 00   
	BRK					  ; $B8ED: 00	  
	ORA (system_flags,X)	 ; $B8EE: 01 1F   
	BRK					  ; $B8F0: 00	  
	ORA #$1F				 ; $B8F1: 09 1F   
	LDA tmp0				 ; $B8F3: A5 00   
	BRK					  ; $B8F5: 00	  
	.byte $0B			  ; $B8F6 - Unknown opcode
	.byte $1F			  ; $B8F7 - Unknown opcode
loc_B8F8:
	SEC					  ; $B8F8: 38	  
	RTS					  ; $B8F9: 60	  
loc_B8FA:
	CLC					  ; $B8FA: 18	  
	RTS					  ; $B8FB: 60	  

; ---- Subroutine at $B8FC (Bank 17) ----
sub_B8FC:
	CMP #$E0				 ; $B8FC: C9 E0	; Compare with 224
	BEQ $B902				; $B8FE: F0 02   
	SEC					  ; $B900: 38	  
	RTS					  ; $B901: 60	  
loc_B902:
	LDX #$03				 ; $B902: A2 03   
loc_B904:
	LDA $6E45,X			  ; $B904: BD 45 6E
	CMP #$5C				 ; $B907: C9 5C	; Compare with 92
	BEQ $B91A				; $B909: F0 0F   
	DEX					  ; $B90B: CA	  
	BPL $B904				; $B90C: 10 F6   
	LDX #$FF				 ; $B90E: A2 FF   
	BRK					  ; $B910: 00	  
	AND #$C3				 ; $B911: 29 C3   
	ORA ($D0),Y			  ; $B913: 11 D0   
	.byte $04			  ; $B915 - Unknown opcode
	BRK					  ; $B916: 00	  
	.byte $07			  ; $B917 - Unknown opcode
	.byte $4F			  ; $B918 - Unknown opcode
	RTS					  ; $B919: 60	  
loc_B91A:
	CLC					  ; $B91A: 18	  
	RTS					  ; $B91B: 60	  

; ---- Subroutine at $B91C (Bank 17) ----
sub_B91C:
	PHA					  ; $B91C: 48	  
	LDA $72E4				; $B91D: AD E4 72
	AND #$CF				 ; $B920: 29 CF   
	ORA #$10				 ; $B922: 09 10   
	STA $72E4				; $B924: 8D E4 72
	PLA					  ; $B927: 68	  
	RTS					  ; $B928: 60	  
	PHA					  ; $B929: 48	  
	LDA $72E4				; $B92A: AD E4 72
	AND #$CF				 ; $B92D: 29 CF   
	ORA #$20				 ; $B92F: 09 20   
	STA $72E4				; $B931: 8D E4 72
	PLA					  ; $B934: 68	  
	RTS					  ; $B935: 60	  
	CMP $D6,X				; $B936: D5 D6   
	.byte $D7			  ; $B938 - Unknown opcode
	CLD					  ; $B939: D8	  
	CMP $DBDA,Y			  ; $B93A: D9 DA DB
	.byte $DC			  ; $B93D - Unknown opcode
	CMP $DFDE,X			  ; $B93E: DD DE DF
	CPX #$E2				 ; $B941: E0 E2   
	.byte $E3			  ; $B943 - Unknown opcode
	CPX $E5				  ; $B944: E4 E5   
	INC $E7				  ; $B946: E6 E7   
	INX					  ; $B948: E8	  
	SBC #$EB				 ; $B949: E9 EB	; Arithmetic
	SBC $F1EF				; $B94B: ED EF F1 ; Arithmetic
	.byte $F3			  ; $B94E - Unknown opcode
	SBC $57,X				; $B94F: F5 57	; Arithmetic
	DEC $D8,X				; $B951: D6 D8   
	.byte $DB			  ; $B953 - Unknown opcode
	DEC $E3DF,X			  ; $B954: DE DF E3
	CPX $E5				  ; $B957: E4 E5   
	INC $E7				  ; $B959: E6 E7   
	INX					  ; $B95B: E8	  
	.byte $EB			  ; $B95C - Unknown opcode
	.byte $EF			  ; $B95D - Unknown opcode
	SBC ($F3),Y			  ; $B95E: F1 F3	; Arithmetic
	LDA $6E45				; $B960: AD 45 6E
	CMP #$AE				 ; $B963: C9 AE	; Compare with 174
	BEQ $B9C1				; $B965: F0 5A   
	BIT $629B				; $B967: 2C 9B 62
	BVS $B9C1				; $B96A: 70 55   
	LDA $629B				; $B96C: AD 9B 62
	ORA #$40				 ; $B96F: 09 40   
	STA $629B				; $B971: 8D 9B 62
	JSR $BF2E				; $B974: 20 2E BF ; -> sub_BF2E
	LDX $6500				; $B977: AE 00 65
	.byte $D3			  ; $B97A - Unknown opcode
	.byte $97			  ; $B97B - Unknown opcode
	BRK					  ; $B97C: 00	  
	.byte $1B			  ; $B97D - Unknown opcode
	.byte $2F			  ; $B97E - Unknown opcode
	LDA $7600				; $B97F: AD 00 76
	PHA					  ; $B982: 48	  
	JSR $B9C6				; $B983: 20 C6 B9 ; -> sub_B9C6
	BRK					  ; $B986: 00	  
	PLP					  ; $B987: 28	  
	.byte $0F			  ; $B988 - Unknown opcode
	JSR $8786				; $B989: 20 86 87 ; -> sub_8786
	JSR $A3F7				; $B98C: 20 F7 A3 ; -> sub_A3F7
	BRK					  ; $B98F: 00	  
	BPL $B9E1				; $B990: 10 4F   
	PLA					  ; $B992: 68	  
	BRK					  ; $B993: 00	  
	.byte $1C			  ; $B994 - Unknown opcode
	.byte $2F			  ; $B995 - Unknown opcode
	BRK					  ; $B996: 00	  
	.byte $80			  ; $B997 - Unknown opcode
	.byte $FB			  ; $B998 - Unknown opcode
	LDA $72E4				; $B999: AD E4 72
	ORA #$04				 ; $B99C: 09 04   
	STA $72E4				; $B99E: 8D E4 72
	LDA $72E5				; $B9A1: AD E5 72
	BPL $B9AC				; $B9A4: 10 06   
	BRK					  ; $B9A6: 00	  
	BRK					  ; $B9A7: 00	  
	.byte $FB			  ; $B9A8 - Unknown opcode
	JMP $B9B4				; $B9A9: 4C B4 B9
loc_B9AC:
	LDA $BF				  ; $B9AC: A5 BF   
	LSR					  ; $B9AE: 4A	  
	BNE $B9B4				; $B9AF: D0 03   
	JSR $905B				; $B9B1: 20 5B 90 ; -> sub_905B
loc_B9B4:
	PLA					  ; $B9B4: 68	  
	PLA					  ; $B9B5: 68	  
	PLA					  ; $B9B6: 68	  
	PLA					  ; $B9B7: 68	  
	PLA					  ; $B9B8: 68	  
	PLA					  ; $B9B9: 68	  
	PLA					  ; $B9BA: 68	  
	PLA					  ; $B9BB: 68	  
	PLA					  ; $B9BC: 68	  
	PLA					  ; $B9BD: 68	  
	JMP $8053				; $B9BE: 4C 53 80
loc_B9C1:
	BRK					  ; $B9C1: 00	  
	CPX $D3				  ; $B9C2: E4 D3   
	.byte $1A			  ; $B9C4 - Unknown opcode
	RTS					  ; $B9C5: 60	  

; ---- Subroutine at $B9C6 (Bank 17) ----
sub_B9C6:
	LDA #$FF				 ; $B9C6: A9 FF   
	STA $0F				  ; $B9C8: 85 0F   
	JSR $B9FF				; $B9CA: 20 FF B9 ; -> sub_B9FF
	RTS					  ; $B9CD: 60	  
	LDX #$03				 ; $B9CE: A2 03   
	STX tmp0				 ; $B9D0: 86 00   
loc_B9D2:
	LDX #$FF				 ; $B9D2: A2 FF   
	BRK					  ; $B9D4: 00	  
	AND #$C3				 ; $B9D5: 29 C3   
	ASL $A548				; $B9D7: 0E 48 A5
	BRK					  ; $B9DA: 00	  
	BRK					  ; $B9DB: 00	  
	AND $68B3				; $B9DC: 2D B3 68
	AND $7E				  ; $B9DF: 25 7E   
loc_B9E1:
	LDX #$00				 ; $B9E1: A2 00   
loc_B9E3:
	LSR					  ; $B9E3: 4A	  
	BCC $B9E7				; $B9E4: 90 01   
	INX					  ; $B9E6: E8	  
loc_B9E7:
	CMP #$00				 ; $B9E7: C9 00	; Compare with 0
	BNE $B9E3				; $B9E9: D0 F8   
	TXA					  ; $B9EB: 8A	  
	LDX tmp0				 ; $B9EC: A6 00   
	STA $6E49,X			  ; $B9EE: 9D 49 6E
	DEC tmp0				 ; $B9F1: C6 00   
	BPL $B9D2				; $B9F3: 10 DD   
	RTS					  ; $B9F5: 60	  

; ---- Subroutine at $B9F6 (Bank 17) ----
sub_B9F6:
	JSR $BAFA				; $B9F6: 20 FA BA ; -> sub_BAFA
	BCC $BA08				; $B9F9: 90 0D   

; ---- Subroutine at $B9FB (Bank 17) ----
sub_B9FB:
	LDA #$00				 ; $B9FB: A9 00   
	STA $0F				  ; $B9FD: 85 0F   

; ---- Subroutine at $B9FF (Bank 17) ----
sub_B9FF:
	JSR $BA09				; $B9FF: 20 09 BA ; -> sub_BA09
	JSR $BA14				; $BA02: 20 14 BA ; -> sub_BA14
	JSR $BAA1				; $BA05: 20 A1 BA ; -> sub_BAA1
loc_BA08:
	RTS					  ; $BA08: 60	  

; ---- Subroutine at $BA09 (Bank 17) ----
sub_BA09:
	LDA $BB84				; $BA09: AD 84 BB
	STA $88				  ; $BA0C: 85 88   
	LDA $BB85				; $BA0E: AD 85 BB
	STA $89				  ; $BA11: 85 89   
	RTS					  ; $BA13: 60	  

; ---- Subroutine at $BA14 (Bank 17) ----
sub_BA14:
	JSR $BA1B				; $BA14: 20 1B BA ; -> sub_BA1B
	JSR $BA31				; $BA17: 20 31 BA ; -> sub_BA31
	RTS					  ; $BA1A: 60	  

; ---- Subroutine at $BA1B (Bank 17) ----
sub_BA1B:
	LDY #$00				 ; $BA1B: A0 00   
	BIT $618E				; $BA1D: 2C 8E 61
	BVC $BA24				; $BA20: 50 02   
	LDY #$03				 ; $BA22: A0 03   
loc_BA24:
	JSR $BAAB				; $BA24: 20 AB BA ; -> sub_BAAB
	BIT $618E				; $BA27: 2C 8E 61
	BPL $BA2D				; $BA2A: 10 01   
	INY					  ; $BA2C: C8	  
loc_BA2D:
	JSR $BAAB				; $BA2D: 20 AB BA ; -> sub_BAAB
	RTS					  ; $BA30: 60	  

; ---- Subroutine at $BA31 (Bank 17) ----
sub_BA31:
	LDX #$00				 ; $BA31: A2 00   
loc_BA33:
	LDA $7397,X			  ; $BA33: BD 97 73
	BPL $BA41				; $BA36: 10 09   
	AND #$7F				 ; $BA38: 29 7F   
	STA tmp1				 ; $BA3A: 85 01   
	STA $86				  ; $BA3C: 85 86   
	JSR $BA47				; $BA3E: 20 47 BA ; -> sub_BA47
loc_BA41:
	INX					  ; $BA41: E8	  
	CPX #$0E				 ; $BA42: E0 0E   
	BNE $BA33				; $BA44: D0 ED   
	RTS					  ; $BA46: 60	  

; ---- Subroutine at $BA47 (Bank 17) ----
sub_BA47:
	TXA					  ; $BA47: 8A	  
	PHA					  ; $BA48: 48	  
	LDA #$00				 ; $BA49: A9 00   
	STA $87				  ; $BA4B: 85 87   
	LDX #$86				 ; $BA4D: A2 86   
	LDY #$06				 ; $BA4F: A0 06   
	LDA $BB82				; $BA51: AD 82 BB
	STA $0D				  ; $BA54: 85 0D   
	LDA $BB83				; $BA56: AD 83 BB
	STA $0E				  ; $BA59: 85 0E   
	SEC					  ; $BA5B: 38	  
	LDA $86				  ; $BA5C: A5 86   
	SBC #$09				 ; $BA5E: E9 09	; Arithmetic
	BCS $BA70				; $BA60: B0 0E   
	LDY #$1E				 ; $BA62: A0 1E   
	LDA $BB80				; $BA64: AD 80 BB
	STA $0D				  ; $BA67: 85 0D   
	LDA $BB81				; $BA69: AD 81 BB
	STA $0E				  ; $BA6C: 85 0E   
	LDA $86				  ; $BA6E: A5 86   
loc_BA70:
	STA $86				  ; $BA70: 85 86   
	TYA					  ; $BA72: 98	  
	JSR $C827				; $BA73: 20 27 C8 ; Call to fixed bank
	LDA $0D				  ; $BA76: A5 0D   
	LDY $0E				  ; $BA78: A4 0E   
	JSR $C81D				; $BA7A: 20 1D C8 ; Call to fixed bank
	LDY #$00				 ; $BA7D: A0 00   
	LDA tmp1				 ; $BA7F: A5 01   
	CMP #$09				 ; $BA81: C9 09	; Compare with 9
	BCC $BA87				; $BA83: 90 02   
	LDY #$04				 ; $BA85: A0 04   
loc_BA87:
	STY tmp0				 ; $BA87: 84 00   
loc_BA89:
	LDY tmp0				 ; $BA89: A4 00   
	LDA $BB76,Y			  ; $BA8B: B9 76 BB
	STA tmp2				 ; $BA8E: 85 02   
	LDA $BB7B,Y			  ; $BA90: B9 7B BB
	JSR $BAB7				; $BA93: 20 B7 BA ; -> sub_BAB7
	INC tmp0				 ; $BA96: E6 00   
	LDA tmp0				 ; $BA98: A5 00   
	CMP #$05				 ; $BA9A: C9 05	; Compare with 5
	BCC $BA89				; $BA9C: 90 EB   
	PLA					  ; $BA9E: 68	  
	TAX					  ; $BA9F: AA	  
	RTS					  ; $BAA0: 60	  

; ---- Subroutine at $BAA1 (Bank 17) ----
sub_BAA1:
	LDY #$06				 ; $BAA1: A0 06   
loc_BAA3:
	JSR $BAAB				; $BAA3: 20 AB BA ; -> sub_BAAB
	CPY #$0B				 ; $BAA6: C0 0B   
	BCC $BAA3				; $BAA8: 90 F9   
	RTS					  ; $BAAA: 60	  

; ---- Subroutine at $BAAB (Bank 17) ----
sub_BAAB:
	TYA					  ; $BAAB: 98	  
	PHA					  ; $BAAC: 48	  
	JSR $BAE5				; $BAAD: 20 E5 BA ; -> sub_BAE5
	JSR $BAB7				; $BAB0: 20 B7 BA ; -> sub_BAB7
	PLA					  ; $BAB3: 68	  
	TAY					  ; $BAB4: A8	  
	INY					  ; $BAB5: C8	  
	RTS					  ; $BAB6: 60	  

; ---- Subroutine at $BAB7 (Bank 17) ----
sub_BAB7:
	STA tmp3				 ; $BAB7: 85 03   
loc_BAB9:
	LDA $0F				  ; $BAB9: A5 0F   
	BNE $BAC3				; $BABB: D0 06   
	JSR $BAD3				; $BABD: 20 D3 BA ; -> sub_BAD3
	JMP $BAC6				; $BAC0: 4C C6 BA
loc_BAC3:
	JSR $BADC				; $BAC3: 20 DC BA ; -> sub_BADC
loc_BAC6:
	INC tmp2				 ; $BAC6: E6 02   
	INC $88				  ; $BAC8: E6 88   
	BNE $BACE				; $BACA: D0 02   
	INC $89				  ; $BACC: E6 89   
loc_BACE:
	DEC tmp3				 ; $BACE: C6 03   
	BNE $BAB9				; $BAD0: D0 E7   
	RTS					  ; $BAD2: 60	  

; ---- Subroutine at $BAD3 (Bank 17) ----
sub_BAD3:
	LDY tmp2				 ; $BAD3: A4 02   
	LDA ($86),Y			  ; $BAD5: B1 86   
	LDY #$00				 ; $BAD7: A0 00   
	STA ($88),Y			  ; $BAD9: 91 88   
	RTS					  ; $BADB: 60	  

; ---- Subroutine at $BADC (Bank 17) ----
sub_BADC:
	LDY #$00				 ; $BADC: A0 00   
	LDA ($88),Y			  ; $BADE: B1 88   
	LDY tmp2				 ; $BAE0: A4 02   
	STA ($86),Y			  ; $BAE2: 91 86   
	RTS					  ; $BAE4: 60	  

; ---- Subroutine at $BAE5 (Bank 17) ----
sub_BAE5:
	TYA					  ; $BAE5: 98	  
	ASL					  ; $BAE6: 0A	  
	TAX					  ; $BAE7: AA	  
	LDA $BB55,X			  ; $BAE8: BD 55 BB
	STA $86				  ; $BAEB: 85 86   
	LDA $BB56,X			  ; $BAED: BD 56 BB
	STA $87				  ; $BAF0: 85 87   
	LDA #$00				 ; $BAF2: A9 00   
	STA tmp2				 ; $BAF4: 85 02   
	LDA $BB6B,Y			  ; $BAF6: B9 6B BB
	RTS					  ; $BAF9: 60	  

; ---- Subroutine at $BAFA (Bank 17) ----
sub_BAFA:
	LDA $72E4				; $BAFA: AD E4 72
	AND #$04				 ; $BAFD: 29 04   
	BNE $BB53				; $BAFF: D0 52   
	LDX #$03				 ; $BB01: A2 03   
loc_BB03:
	LDA $72F4,X			  ; $BB03: BD F4 72
	AND #$70				 ; $BB06: 29 70   
	BNE $BB1C				; $BB08: D0 12   
	LDA $7300,X			  ; $BB0A: BD 00 73
	AND #$70				 ; $BB0D: 29 70   
	BEQ $BB28				; $BB0F: F0 17   
	CMP #$20				 ; $BB11: C9 20	; Compare with 32
	BNE $BB1C				; $BB13: D0 07   
	LDA $7324,X			  ; $BB15: BD 24 73
	CMP #$5F				 ; $BB18: C9 5F	; Compare with 95
	BEQ $BB4B				; $BB1A: F0 2F   
loc_BB1C:
	DEX					  ; $BB1C: CA	  
	BPL $BB03				; $BB1D: 10 E4   
	LDA $72E5				; $BB1F: AD E5 72
	AND #$0C				 ; $BB22: 29 0C   
	BNE $BB53				; $BB24: D0 2D   
	SEC					  ; $BB26: 38	  
	RTS					  ; $BB27: 60	  
loc_BB28:
	LDA $7324,X			  ; $BB28: BD 24 73
	CMP #$34				 ; $BB2B: C9 34	; Compare with 52
	BNE $BB1C				; $BB2D: D0 ED   
	LDA #$1C				 ; $BB2F: A9 1C   
	BRK					  ; $BB31: 00	  
	.byte $17			  ; $BB32 - Unknown opcode
	.byte $0F			  ; $BB33 - Unknown opcode
	CMP #$00				 ; $BB34: C9 00	; Compare with 0
	BNE $BB1C				; $BB36: D0 E4   
	LDA #$5F				 ; $BB38: A9 5F   
	STA $6F				  ; $BB3A: 85 6F   
	BRK					  ; $BB3C: 00	  
	ROR $33				  ; $BB3D: 66 33   
	BCS $BB1C				; $BB3F: B0 DB   
	LDA $72E5				; $BB41: AD E5 72
	EOR #$08				 ; $BB44: 49 08   
	STA $72E5				; $BB46: 8D E5 72
	BNE $BB1C				; $BB49: D0 D1   
loc_BB4B:
	LDA $72E5				; $BB4B: AD E5 72
	ORA #$04				 ; $BB4E: 09 04   
	STA $72E5				; $BB50: 8D E5 72
loc_BB53:
	CLC					  ; $BB53: 18	  
	RTS					  ; $BB54: 60	  
	.byte $72			  ; $BB55 - Unknown opcode
	ADC ($6A,X)			  ; $BB56: 61 6A	; Arithmetic
	ADC ($6E,X)			  ; $BB58: 61 6E	; Arithmetic
	ADC ($7C,X)			  ; $BB5A: 61 7C	; Arithmetic
	ADC ($86,X)			  ; $BB5C: 61 86	; Arithmetic
	ADC ($8A,X)			  ; $BB5E: 61 8A	; Arithmetic
	ADC ($5B,X)			  ; $BB60: 61 5B	; Arithmetic
	ADC ($EE,X)			  ; $BB62: 61 EE	; Arithmetic
	.byte $62			  ; $BB64 - Unknown opcode
	.byte $DF			  ; $BB65 - Unknown opcode
	.byte $6B			  ; $BB66 - Unknown opcode
	EOR $6E				  ; $BB67: 45 6E   
	BRK					  ; $BB69: 00	  
	.byte $72			  ; $BB6A - Unknown opcode
	ASL					  ; $BB6B: 0A	  
	.byte $04			  ; $BB6C - Unknown opcode
	.byte $04			  ; $BB6D - Unknown opcode
	ASL					  ; $BB6E: 0A	  
	.byte $04			  ; $BB6F - Unknown opcode
	.byte $04			  ; $BB70 - Unknown opcode
	ORA (tmp1,X)			 ; $BB71: 01 01   
	.byte $0C			  ; $BB73 - Unknown opcode
	.byte $04			  ; $BB74 - Unknown opcode
	SBC #$06				 ; $BB75: E9 06	; Arithmetic
	ASL					  ; $BB77: 0A	  
	.byte $0C			  ; $BB78 - Unknown opcode
	.byte $13			  ; $BB79 - Unknown opcode
	BRK					  ; $BB7A: 00	  
	.byte $02			  ; $BB7B - Unknown opcode
	ORA (ptr0_lo,X)		  ; $BB7C: 01 04   
	PHP					  ; $BB7E: 08	  
	ORA tmp1				 ; $BB7F: 05 01   
	RTS					  ; $BB81: 60	  
	.byte $0F			  ; $BB82 - Unknown opcode
	ADC ($97,X)			  ; $BB83: 61 97	; Arithmetic
	.byte $73			  ; $BB85 - Unknown opcode
	LDX $7357				; $BB86: AE 57 73
	CPX #$FF				 ; $BB89: E0 FF   
	BEQ $BB93				; $BB8B: F0 06   
	BRK					  ; $BB8D: 00	  
	PLA					  ; $BB8E: 68	  
	.byte $53			  ; $BB8F - Unknown opcode
	STA $7357				; $BB90: 8D 57 73
loc_BB93:
	LDX $7358				; $BB93: AE 58 73
	CPX #$FF				 ; $BB96: E0 FF   
	BEQ $BBA0				; $BB98: F0 06   
	BRK					  ; $BB9A: 00	  
	PLA					  ; $BB9B: 68	  
	.byte $53			  ; $BB9C - Unknown opcode
	STA $7358				; $BB9D: 8D 58 73
loc_BBA0:
	RTS					  ; $BBA0: 60	  

; ---- Subroutine at $BBA1 (Bank 17) ----
sub_BBA1:
	BRK					  ; $BBA1: 00	  
	ORA (system_flags,X)	 ; $BBA2: 01 1F   
	BMI $BBDB				; $BBA4: 30 35   
	CMP $7357				; $BBA6: CD 57 73
	BEQ $BBB0				; $BBA9: F0 05   
	CMP $7358				; $BBAB: CD 58 73
	BNE $BBDB				; $BBAE: D0 2B   
loc_BBB0:
	LDA $7357				; $BBB0: AD 57 73
	CMP #$FF				 ; $BBB3: C9 FF	; Compare with 255
	BEQ $BBC1				; $BBB5: F0 0A   
	JSR $BBFA				; $BBB7: 20 FA BB ; -> sub_BBFA
	BRK					  ; $BBBA: 00	  
	.byte $67			  ; $BBBB - Unknown opcode
	.byte $73			  ; $BBBC - Unknown opcode
	TAX					  ; $BBBD: AA	  
	BRK					  ; $BBBE: 00	  
	.byte $5F			  ; $BBBF - Unknown opcode
	.byte $53			  ; $BBC0 - Unknown opcode
loc_BBC1:
	LDA $7358				; $BBC1: AD 58 73
	CMP #$FF				 ; $BBC4: C9 FF	; Compare with 255
	BEQ $BBD5				; $BBC6: F0 0D   
	JSR $BC06				; $BBC8: 20 06 BC ; -> sub_BC06
	BRK					  ; $BBCB: 00	  
	.byte $67			  ; $BBCC - Unknown opcode
	.byte $73			  ; $BBCD - Unknown opcode
	TAX					  ; $BBCE: AA	  
	LDA $7359				; $BBCF: AD 59 73
	BRK					  ; $BBD2: 00	  
	RTS					  ; $BBD3: 60	  
	.byte $73			  ; $BBD4 - Unknown opcode
loc_BBD5:
	JSR $8786				; $BBD5: 20 86 87 ; -> sub_8786
	JSR $A3F7				; $BBD8: 20 F7 A3 ; -> sub_A3F7
loc_BBDB:
	BRK					  ; $BBDB: 00	  
	.byte $27			  ; $BBDC - Unknown opcode
	.byte $0F			  ; $BBDD - Unknown opcode
	RTS					  ; $BBDE: 60	  

; ---- Subroutine at $BBDF (Bank 17) ----
sub_BBDF:
	BRK					  ; $BBDF: 00	  
	ASL system_flags		 ; $BBE0: 06 1F   
	BCS $BBEB				; $BBE2: B0 07   
	BRK					  ; $BBE4: 00	  
	ROR					  ; $BBE5: 6A	  
	.byte $53			  ; $BBE6 - Unknown opcode
	BEQ $BBEB				; $BBE7: F0 02   
	CLC					  ; $BBE9: 18	  
	RTS					  ; $BBEA: 60	  
loc_BBEB:
	SEC					  ; $BBEB: 38	  
	RTS					  ; $BBEC: 60	  

; ---- Subroutine at $BBED (Bank 17) ----
sub_BBED:
	BRK					  ; $BBED: 00	  
	ASL system_flags		 ; $BBEE: 06 1F   
	BCC $BBEB				; $BBF0: 90 F9   
	BRK					  ; $BBF2: 00	  
	AND #$C3				 ; $BBF3: 29 C3   
	ASL					  ; $BBF5: 0A	  
	BCC $BBEB				; $BBF6: 90 F3   
	CLC					  ; $BBF8: 18	  
	RTS					  ; $BBF9: 60	  

; ---- Subroutine at $BBFA (Bank 17) ----
sub_BBFA:
	PHA					  ; $BBFA: 48	  
	JSR $BC12				; $BBFB: 20 12 BC ; -> sub_BC12
	LDA $BC53,Y			  ; $BBFE: B9 53 BC
	BRK					  ; $BC01: 00	  
	CPY $68E3				; $BC02: CC E3 68
	RTS					  ; $BC05: 60	  

; ---- Subroutine at $BC06 (Bank 17) ----
sub_BC06:
	PHA					  ; $BC06: 48	  
	JSR $BC12				; $BC07: 20 12 BC ; -> sub_BC12
	LDA $BC56,Y			  ; $BC0A: B9 56 BC
	BRK					  ; $BC0D: 00	  
	CPY $68E3				; $BC0E: CC E3 68
	RTS					  ; $BC11: 60	  

; ---- Subroutine at $BC12 (Bank 17) ----
sub_BC12:
	BRK					  ; $BC12: 00	  
	.byte $67			  ; $BC13 - Unknown opcode
	.byte $73			  ; $BC14 - Unknown opcode
	TAX					  ; $BC15: AA	  
	LDY #$01				 ; $BC16: A0 01   
	BRK					  ; $BC18: 00	  
	LSR $93				  ; $BC19: 46 93   
	.byte $07			  ; $BC1B - Unknown opcode
	BCC $BC31				; $BC1C: 90 13   
	LDY #$02				 ; $BC1E: A0 02   
	BRK					  ; $BC20: 00	  
	LSR $93				  ; $BC21: 46 93   
	ASL $B0				  ; $BC23: 06 B0   
	.byte $0B			  ; $BC25 - Unknown opcode
	BRK					  ; $BC26: 00	  
	LSR $93				  ; $BC27: 46 93   
	BPL $BBDB				; $BC29: 10 B0   
	ORA $86				  ; $BC2B: 05 86   
	SBC $00A0,Y			  ; $BC2D: F9 A0 00 ; Arithmetic
	RTS					  ; $BC30: 60	  
loc_BC31:
	STX $FA				  ; $BC31: 86 FA   
	BRK					  ; $BC33: 00	  
	.byte $62			  ; $BC34 - Unknown opcode
	.byte $23			  ; $BC35 - Unknown opcode
	.byte $03			  ; $BC36 - Unknown opcode
	STA tmp0				 ; $BC37: 85 00   
	LDX #$00				 ; $BC39: A2 00   
loc_BC3B:
	BRK					  ; $BC3B: 00	  
	LSR $83				  ; $BC3C: 46 83   
	BPL $BC43				; $BC3E: 10 03   
	BCC $BC4B				; $BC40: 90 09   
	INX					  ; $BC42: E8	  
loc_BC43:
	CPX tmp0				 ; $BC43: E4 00   
	BCC $BC3B				; $BC45: 90 F4   
	LDA #$00				 ; $BC47: A9 00   
	BEQ $BC50				; $BC49: F0 05   
loc_BC4B:
	STX $6E				  ; $BC4B: 86 6E   
	BRK					  ; $BC4D: 00	  
	ROL $850F				; $BC4E: 2E 0F 85
	SBC $2960,Y			  ; $BC51: F9 60 29 ; Arithmetic
	ROL					  ; $BC54: 2A	  
	ROR $2B				  ; $BC55: 66 2B   
	BIT $6067				; $BC57: 2C 67 60

; ---- Subroutine at $BC5A (Bank 17) ----
sub_BC5A:
	JSR $80C4				; $BC5A: 20 C4 80 ; -> sub_80C4
	BCC $BC59				; $BC5D: 90 FA   
	BRK					  ; $BC5F: 00	  
	.byte $4F			  ; $BC60 - Unknown opcode
	.byte $33			  ; $BC61 - Unknown opcode
	CMP #$04				 ; $BC62: C9 04	; Compare with 4
	BCC $BC59				; $BC64: 90 F3   
	BRK					  ; $BC66: 00	  
	EOR $9033,X			  ; $BC67: 5D 33 90
	INC $8EAD				; $BC6A: EE AD 8E
	ADC ($29,X)			  ; $BC6D: 61 29	; Arithmetic
	.byte $07			  ; $BC6F - Unknown opcode
	BNE $BC59				; $BC70: D0 E7   
	BRK					  ; $BC72: 00	  
	.byte $62			  ; $BC73 - Unknown opcode
	.byte $23			  ; $BC74 - Unknown opcode
	.byte $43			  ; $BC75 - Unknown opcode
	BNE $BC59				; $BC76: D0 E1   
	BRK					  ; $BC78: 00	  
	.byte $62			  ; $BC79 - Unknown opcode
	.byte $23			  ; $BC7A - Unknown opcode
	.byte $83			  ; $BC7B - Unknown opcode
	BEQ $BC59				; $BC7C: F0 DB   
	CMP #$04				 ; $BC7E: C9 04	; Compare with 4
	BCC $BC84				; $BC80: 90 02   
	LDA #$04				 ; $BC82: A9 04   
loc_BC84:
	STA tmp0				 ; $BC84: 85 00   
	LDX #$03				 ; $BC86: A2 03   
	LDA #$FF				 ; $BC88: A9 FF   
loc_BC8A:
	STA tmp1,X			   ; $BC8A: 95 01   
	DEX					  ; $BC8C: CA	  
	BPL $BC8A				; $BC8D: 10 FB   
	LDX #$00				 ; $BC8F: A2 00   
loc_BC91:
	STX $6E				  ; $BC91: 86 6E   
	LDA #$83				 ; $BC93: A9 83   
	BRK					  ; $BC95: 00	  
	AND $950F				; $BC96: 2D 0F 95
	ORA ($E8,X)			  ; $BC99: 01 E8   
	CPX tmp0				 ; $BC9B: E4 00   
	BCC $BC91				; $BC9D: 90 F2   
	LDX #$03				 ; $BC9F: A2 03   
loc_BCA1:
	LDA tmp1,X			   ; $BCA1: B5 01   
	STA $6E,X				; $BCA3: 95 6E   
	DEX					  ; $BCA5: CA	  
	BPL $BCA1				; $BCA6: 10 F9   
	BRK					  ; $BCA8: 00	  
	LSR $A933,X			  ; $BCA9: 5E 33 A9
	BRK					  ; $BCAC: 00	  
	BRK					  ; $BCAD: 00	  
	ASL $6F				  ; $BCAE: 06 6F   
	BRK					  ; $BCB0: 00	  
	.byte $62			  ; $BCB1 - Unknown opcode
	.byte $23			  ; $BCB2 - Unknown opcode
	RTI					  ; $BCB3: 40	  
	STA $8E				  ; $BCB4: 85 8E   
	LDX #$00				 ; $BCB6: A2 00   
loc_BCB8:
	TXA					  ; $BCB8: 8A	  
	PHA					  ; $BCB9: 48	  
	STX $F9				  ; $BCBA: 86 F9   
	BRK					  ; $BCBC: 00	  
	EOR $93				  ; $BCBD: 45 93   
	BPL $BCC1				; $BCBF: 10 00   
loc_BCC1:
	EOR $93				  ; $BCC1: 45 93   
	ORA (tmp0),Y			 ; $BCC3: 11 00   
	EOR $93				  ; $BCC5: 45 93   
	.byte $1B			  ; $BCC7 - Unknown opcode
	BRK					  ; $BCC8: 00	  
	EOR $93				  ; $BCC9: 45 93   
	.byte $23			  ; $BCCB - Unknown opcode
	BRK					  ; $BCCC: 00	  
	EOR $93				  ; $BCCD: 45 93   
	BIT tmp0				 ; $BCCF: 24 00   
	EOR $93				  ; $BCD1: 45 93   
	AND tmp0				 ; $BCD3: 25 00   
	CPY $2BD3				; $BCD5: CC D3 2B
	PLA					  ; $BCD8: 68	  
	TAX					  ; $BCD9: AA	  
	INX					  ; $BCDA: E8	  
	CPX $8E				  ; $BCDB: E4 8E   
	BCC $BCB8				; $BCDD: 90 D9   
	JSR $8786				; $BCDF: 20 86 87 ; -> sub_8786
	JSR $A3F7				; $BCE2: 20 F7 A3 ; -> sub_A3F7
	BRK					  ; $BCE5: 00	  
	.byte $27			  ; $BCE6 - Unknown opcode
	.byte $0F			  ; $BCE7 - Unknown opcode
	LDA $6E44				; $BCE8: AD 44 6E
	ORA #$03				 ; $BCEB: 09 03   
	STA $6E44				; $BCED: 8D 44 6E
	RTS					  ; $BCF0: 60	  

; ---- Subroutine at $BCF1 (Bank 17) ----
sub_BCF1:
	BRK					  ; $BCF1: 00	  
	ORA system_flags		 ; $BCF2: 05 1F   
	CMP #$02				 ; $BCF4: C9 02	; Compare with 2
	BNE $BD4A				; $BCF6: D0 52   
	BRK					  ; $BCF8: 00	  
	.byte $03			  ; $BCF9 - Unknown opcode
	.byte $1F			  ; $BCFA - Unknown opcode
	AND #$7F				 ; $BCFB: 29 7F   
	CMP #$08				 ; $BCFD: C9 08	; Compare with 8
	BNE $BD4A				; $BCFF: D0 49   
	BRK					  ; $BD01: 00	  
	CPX #$D3				 ; $BD02: E0 D3   
	BVS $BD06				; $BD04: 70 00   
loc_BD06:
	ASL system_flags		 ; $BD06: 06 1F   
	BCS $BD4C				; $BD08: B0 42   
	BRK					  ; $BD0A: 00	  
	.byte $2B			  ; $BD0B - Unknown opcode
	.byte $53			  ; $BD0C - Unknown opcode
	CMP #$02				 ; $BD0D: C9 02	; Compare with 2
	BNE $BD4C				; $BD0F: D0 3B   
	JSR $BD52				; $BD11: 20 52 BD ; -> sub_BD52
	JSR $BD83				; $BD14: 20 83 BD ; -> sub_BD83
	JSR $BF2E				; $BD17: 20 2E BF ; -> sub_BF2E
	.byte $B3			  ; $BD1A - Unknown opcode
	LDA $8E				  ; $BD1B: A5 8E   
	CMP #$07				 ; $BD1D: C9 07	; Compare with 7
	BNE $BD28				; $BD1F: D0 07   
	BRK					  ; $BD21: 00	  
	CPX $D3				  ; $BD22: E4 D3   
	.byte $77			  ; $BD24 - Unknown opcode
	JMP $BD2C				; $BD25: 4C 2C BD
loc_BD28:
	BRK					  ; $BD28: 00	  
	CPX $D3				  ; $BD29: E4 D3   
	.byte $72			  ; $BD2B - Unknown opcode
loc_BD2C:
	LDX $8E				  ; $BD2C: A6 8E   
	LDA $BEA9,X			  ; $BD2E: BD A9 BE
	BRK					  ; $BD31: 00	  
	ASL					  ; $BD32: 0A	  
	.byte $1F			  ; $BD33 - Unknown opcode
	LDY #$40				 ; $BD34: A0 40   
	TAX					  ; $BD36: AA	  
	BRK					  ; $BD37: 00	  
	.byte $13			  ; $BD38 - Unknown opcode
	.byte $3F			  ; $BD39 - Unknown opcode
	PHA					  ; $BD3A: 48	  
	BRK					  ; $BD3B: 00	  
	ORA (system_flags,X)	 ; $BD3C: 01 1F   
	BRK					  ; $BD3E: 00	  
	ORA #$1F				 ; $BD3F: 09 1F   
	LDA #$00				 ; $BD41: A9 00   
	BRK					  ; $BD43: 00	  
	.byte $0C			  ; $BD44 - Unknown opcode
	.byte $1F			  ; $BD45 - Unknown opcode
	PLA					  ; $BD46: 68	  
	BRK					  ; $BD47: 00	  
	.byte $0B			  ; $BD48 - Unknown opcode
	.byte $1F			  ; $BD49 - Unknown opcode
loc_BD4A:
	SEC					  ; $BD4A: 38	  
	RTS					  ; $BD4B: 60	  
loc_BD4C:
	BRK					  ; $BD4C: 00	  
	CPX $D3				  ; $BD4D: E4 D3   
	ADC ($18),Y			  ; $BD4F: 71 18	; Arithmetic
	RTS					  ; $BD51: 60	  

; ---- Subroutine at $BD52 (Bank 17) ----
sub_BD52:
	LDA $72E8				; $BD52: AD E8 72
	BRK					  ; $BD55: 00	  
	.byte $2B			  ; $BD56 - Unknown opcode
	.byte $0F			  ; $BD57 - Unknown opcode
	BCS $BD5C				; $BD58: B0 02   
	LDA #$08				 ; $BD5A: A9 08   
loc_BD5C:
	PHA					  ; $BD5C: 48	  
	TAX					  ; $BD5D: AA	  
	BRK					  ; $BD5E: 00	  
	AND #$0F				 ; $BD5F: 29 0F   
	EOR #$FF				 ; $BD61: 49 FF   
	AND $72E8				; $BD63: 2D E8 72
	STA $72E8				; $BD66: 8D E8 72
	PLA					  ; $BD69: 68	  
	STA $8E				  ; $BD6A: 85 8E   
	ASL					  ; $BD6C: 0A	  
	ASL					  ; $BD6D: 0A	  
	ASL					  ; $BD6E: 0A	  
	ASL					  ; $BD6F: 0A	  
	SEC					  ; $BD70: 38	  
	SBC $8E				  ; $BD71: E5 8E	; Arithmetic
	TAX					  ; $BD73: AA	  
	LDY #$00				 ; $BD74: A0 00   
loc_BD76:
	LDA $BE22,X			  ; $BD76: BD 22 BE
	STA $0554,Y			  ; $BD79: 99 54 05
	INX					  ; $BD7C: E8	  
	INY					  ; $BD7D: C8	  
	CPY #$0F				 ; $BD7E: C0 0F   
	BCC $BD76				; $BD80: 90 F4   
	RTS					  ; $BD82: 60	  

; ---- Subroutine at $BD83 (Bank 17) ----
sub_BD83:
	BRK					  ; $BD83: 00	  
	.byte $9F			  ; $BD84 - Unknown opcode
	.byte $FB			  ; $BD85 - Unknown opcode
	LDA $05FC				; $BD86: AD FC 05
	STA $8A				  ; $BD89: 85 8A   
	LDA $05FD				; $BD8B: AD FD 05
	STA $8B				  ; $BD8E: 85 8B   
	LDX #$0C				 ; $BD90: A2 0C   
loc_BD92:
	TXA					  ; $BD92: 8A	  
	PHA					  ; $BD93: 48	  
	STA $05FC				; $BD94: 8D FC 05
	CLC					  ; $BD97: 18	  
	ADC #$20				 ; $BD98: 69 20	; Arithmetic
	STA $05FD				; $BD9A: 8D FD 05
	JSR $C5B9				; $BD9D: 20 B9 C5 ; Call to fixed bank
	LDX #$04				 ; $BDA0: A2 04   
	JSR $C90C				; $BDA2: 20 0C C9 ; Call to fixed bank
	PLA					  ; $BDA5: 68	  
	TAX					  ; $BDA6: AA	  
	DEX					  ; $BDA7: CA	  
	BPL $BD92				; $BDA8: 10 E8   
	LDA $8B				  ; $BDAA: A5 8B   
	STA $05FD				; $BDAC: 8D FD 05
	LDA $8A				  ; $BDAF: A5 8A   
	STA $05FC				; $BDB1: 8D FC 05
	JSR $C5B9				; $BDB4: 20 B9 C5 ; Call to fixed bank
	LDX #$0F				 ; $BDB7: A2 0F   
	JMP $C90C				; $BDB9: 4C 0C C9
loc_BDBC:
	JSR $BF2E				; $BDBC: 20 2E BF ; -> sub_BF2E
	STA ($A2,X)			  ; $BDBF: 81 A2   
	CLC					  ; $BDC1: 18	  
loc_BDC2:
	LDA $05FC,X			  ; $BDC2: BD FC 05
	STA $0364,X			  ; $BDC5: 9D 64 03
	DEX					  ; $BDC8: CA	  
	BPL $BDC2				; $BDC9: 10 F7   
	LDX #$0B				 ; $BDCB: A2 0B   
loc_BDCD:
	TXA					  ; $BDCD: 8A	  
	PHA					  ; $BDCE: 48	  
	LDA #$30				 ; $BDCF: A9 30   
	LDY #$18				 ; $BDD1: A0 18   
loc_BDD3:
	STA $05FC,Y			  ; $BDD3: 99 FC 05
	DEY					  ; $BDD6: 88	  
	BNE $BDD3				; $BDD7: D0 FA   
	JSR $C5B9				; $BDD9: 20 B9 C5 ; Call to fixed bank
	LDX #$01				 ; $BDDC: A2 01   
	JSR $C90C				; $BDDE: 20 0C C9 ; Call to fixed bank
	JSR $BDEE				; $BDE1: 20 EE BD ; -> sub_BDEE
	LDX #$01				 ; $BDE4: A2 01   
	JSR $C90C				; $BDE6: 20 0C C9 ; Call to fixed bank
	PLA					  ; $BDE9: 68	  
	TAX					  ; $BDEA: AA	  
	DEX					  ; $BDEB: CA	  
	BPL $BDCD				; $BDEC: 10 DF   

; ---- Subroutine at $BDEE (Bank 17) ----
sub_BDEE:
	LDX #$18				 ; $BDEE: A2 18   
loc_BDF0:
	LDA $0364,X			  ; $BDF0: BD 64 03
	STA $05FC,X			  ; $BDF3: 9D FC 05
	DEX					  ; $BDF6: CA	  
	BPL $BDF0				; $BDF7: 10 F7   
	JMP $C5B9				; $BDF9: 4C B9 C5
	JSR $A1A9				; $BDFC: 20 A9 A1 ; -> sub_A1A9
	RTS					  ; $BDFF: 60	  
	BRK					  ; $BE00: 00	  
	.byte $07			  ; $BE01 - Unknown opcode
	.byte $1F			  ; $BE02 - Unknown opcode
	BCS $BE21				; $BE03: B0 1C   
	BRK					  ; $BE05: 00	  
	ORA ($53,X)			  ; $BE06: 01 53   
	JSR $C891				; $BE08: 20 91 C8 ; Call to fixed bank
	AND #$3F				 ; $BE0B: 29 3F   
	ADC #$40				 ; $BE0D: 69 40	; Arithmetic
	LDX #$72				 ; $BE0F: A2 72   
	BRK					  ; $BE11: 00	  
	BPL $BE53				; $BE12: 10 3F   
	LDA $73				  ; $BE14: A5 73   
	STA $7361				; $BE16: 8D 61 73
	LDA $74				  ; $BE19: A5 74   
	STA $7362				; $BE1B: 8D 62 73
	JSR $90DB				; $BE1E: 20 DB 90 ; -> sub_90DB
loc_BE21:
	RTS					  ; $BE21: 60	  
	ROL $1D1F				; $BE22: 2E 1F 1D
	ASL $0D13,X			  ; $BE25: 1E 13 0D
	.byte $0F			  ; $BE28 - Unknown opcode
	RTI					  ; $BE29: 40	  
	BRK					  ; $BE2A: 00	  
	BRK					  ; $BE2B: 00	  
	BRK					  ; $BE2C: 00	  
	BRK					  ; $BE2D: 00	  
	BRK					  ; $BE2E: 00	  
	BRK					  ; $BE2F: 00	  
	BRK					  ; $BE30: 00	  
	.byte $37			  ; $BE31 - Unknown opcode
	ASL $0F1C,X			  ; $BE32: 1E 1C 0F
	CLC					  ; $BE35: 18	  
	ORA ($1E),Y			  ; $BE36: 11 1E   
	.byte $12			  ; $BE38 - Unknown opcode
	RTI					  ; $BE39: 40	  
	BRK					  ; $BE3A: 00	  
	BRK					  ; $BE3B: 00	  
	BRK					  ; $BE3C: 00	  
	BRK					  ; $BE3D: 00	  
	BRK					  ; $BE3E: 00	  
	BRK					  ; $BE3F: 00	  
	AND #$20				 ; $BE40: 29 20   
	.byte $13			  ; $BE42 - Unknown opcode
	ASL $40,X				; $BE43: 16 40   
	BRK					  ; $BE45: 00	  
	BRK					  ; $BE46: 00	  
	BRK					  ; $BE47: 00	  
	BRK					  ; $BE48: 00	  
	BRK					  ; $BE49: 00	  
	BRK					  ; $BE4A: 00	  
	BRK					  ; $BE4B: 00	  
	BRK					  ; $BE4C: 00	  
	BRK					  ; $BE4D: 00	  
	BRK					  ; $BE4E: 00	  
	ASL $0F12,X			  ; $BE4F: 1E 12 0F
	BRK					  ; $BE52: 00	  
loc_BE53:
	SEC					  ; $BE53: 38	  
	ORA $0F21,Y			  ; $BE54: 19 21 0F
	.byte $1C			  ; $BE57 - Unknown opcode
	RTI					  ; $BE58: 40	  
	BRK					  ; $BE59: 00	  
	BRK					  ; $BE5A: 00	  
	BRK					  ; $BE5B: 00	  
	BRK					  ; $BE5C: 00	  
	BRK					  ; $BE5D: 00	  
	ASL $0F12,X			  ; $BE5E: 1E 12 0F
	BRK					  ; $BE61: 00	  
	.byte $37			  ; $BE62 - Unknown opcode
	ASL $1C0B,X			  ; $BE63: 1E 0B 1C
	ORA $0040,X			  ; $BE66: 1D 40 00
	BRK					  ; $BE69: 00	  
	BRK					  ; $BE6A: 00	  
	BRK					  ; $BE6B: 00	  
	BRK					  ; $BE6C: 00	  
	ASL $0F12,X			  ; $BE6D: 1E 12 0F
	BRK					  ; $BE70: 00	  
	AND ($19),Y			  ; $BE71: 31 19   
	ORA $4018,Y			  ; $BE73: 19 18 40
	BRK					  ; $BE76: 00	  
	BRK					  ; $BE77: 00	  
	BRK					  ; $BE78: 00	  
	BRK					  ; $BE79: 00	  
	BRK					  ; $BE7A: 00	  
	BRK					  ; $BE7B: 00	  
	ASL $0F12,X			  ; $BE7C: 1E 12 0F
	BRK					  ; $BE7F: 00	  
	.byte $37			  ; $BE80 - Unknown opcode
	.byte $1F			  ; $BE81 - Unknown opcode
	CLC					  ; $BE82: 18	  
	RTI					  ; $BE83: 40	  
	BRK					  ; $BE84: 00	  
	BRK					  ; $BE85: 00	  
	BRK					  ; $BE86: 00	  
	BRK					  ; $BE87: 00	  
	BRK					  ; $BE88: 00	  
	BRK					  ; $BE89: 00	  
	BRK					  ; $BE8A: 00	  
	BRK					  ; $BE8B: 00	  
	BRK					  ; $BE8C: 00	  
	BRK					  ; $BE8D: 00	  
	BRK					  ; $BE8E: 00	  
	BRK					  ; $BE8F: 00	  
	BRK					  ; $BE90: 00	  
	BRK					  ; $BE91: 00	  
	BRK					  ; $BE92: 00	  
	BRK					  ; $BE93: 00	  
	BRK					  ; $BE94: 00	  
	BRK					  ; $BE95: 00	  
	BRK					  ; $BE96: 00	  
	BRK					  ; $BE97: 00	  
	BRK					  ; $BE98: 00	  
	BRK					  ; $BE99: 00	  
	ASL $0F12,X			  ; $BE9A: 1E 12 0F
	BRK					  ; $BE9D: 00	  
	SEC					  ; $BE9E: 38	  
	.byte $0F			  ; $BE9F - Unknown opcode
	.byte $1C			  ; $BEA0 - Unknown opcode
	.byte $17			  ; $BEA1 - Unknown opcode
	.byte $13			  ; $BEA2 - Unknown opcode
	CLC					  ; $BEA3: 18	  
	.byte $0B			  ; $BEA4 - Unknown opcode
	ASL $1C19,X			  ; $BEA5: 1E 19 1C
	RTI					  ; $BEA8: 40	  
	SBC $F8FC,Y			  ; $BEA9: F9 FC F8 ; Arithmetic
	.byte $FB			  ; $BEAC - Unknown opcode
	.byte $E3			  ; $BEAD - Unknown opcode
	SBC $4CFE,X			  ; $BEAE: FD FE 4C ; Arithmetic
	.byte $FA			  ; $BEB1 - Unknown opcode

; ---- Subroutine at $BEB2 (Bank 17) ----
sub_BEB2:
	LDX #$00				 ; $BEB2: A2 00   
	STX $0F				  ; $BEB4: 86 0F   
loc_BEB6:
	LDA $72F4,X			  ; $BEB6: BD F4 72
	AND #$70				 ; $BEB9: 29 70   
	CMP #$70				 ; $BEBB: C9 70	; Compare with 112
	BEQ $BEEB				; $BEBD: F0 2C   
	LDA $72F4,X			  ; $BEBF: BD F4 72
	BMI $BED0				; $BEC2: 30 0C   
	AND #$0F				 ; $BEC4: 29 0F   
	BRK					  ; $BEC6: 00	  
	.byte $67			  ; $BEC7 - Unknown opcode
	.byte $73			  ; $BEC8 - Unknown opcode
	TAX					  ; $BEC9: AA	  
	BRK					  ; $BECA: 00	  
	.byte $14			  ; $BECB - Unknown opcode
	.byte $53			  ; $BECC - Unknown opcode
	JMP $BED6				; $BECD: 4C D6 BE
loc_BED0:
	AND #$0F				 ; $BED0: 29 0F   
	TAX					  ; $BED2: AA	  
	BRK					  ; $BED3: 00	  
	ASL $85B3				; $BED4: 0E B3 85
	BRK					  ; $BED7: 00	  
	LSR					  ; $BED8: 4A	  
	LSR					  ; $BED9: 4A	  
	STA tmp1				 ; $BEDA: 85 01   
	LDA tmp0				 ; $BEDC: A5 00   
	SEC					  ; $BEDE: 38	  
	SBC tmp1				 ; $BEDF: E5 01	; Arithmetic
	BRK					  ; $BEE1: 00	  
	.byte $17			  ; $BEE2 - Unknown opcode
	.byte $0F			  ; $BEE3 - Unknown opcode
	CLC					  ; $BEE4: 18	  
	ADC tmp1				 ; $BEE5: 65 01	; Arithmetic
	LDX $0F				  ; $BEE7: A6 0F   
	STA tmp2,X			   ; $BEE9: 95 02   
loc_BEEB:
	LDA $7348,X			  ; $BEEB: BD 48 73
	ORA #$0F				 ; $BEEE: 09 0F   
	STA $7348,X			  ; $BEF0: 9D 48 73
	INX					  ; $BEF3: E8	  
	STX $0F				  ; $BEF4: 86 0F   
	CPX #$0C				 ; $BEF6: E0 0C   
	BNE $BEB6				; $BEF8: D0 BC   
	LDY #$00				 ; $BEFA: A0 00   
loc_BEFC:
	LDA #$00				 ; $BEFC: A9 00   
	STA $0E				  ; $BEFE: 85 0E   
	LDX #$0B				 ; $BF00: A2 0B   
loc_BF02:
	LDA $7348,X			  ; $BF02: BD 48 73
	AND #$0F				 ; $BF05: 29 0F   
	CMP #$0F				 ; $BF07: C9 0F	; Compare with 15
	BNE $BF17				; $BF09: D0 0C   
	LDA tmp2,X			   ; $BF0B: B5 02   
	CMP $0E				  ; $BF0D: C5 0E   
	BEQ $BF13				; $BF0F: F0 02   
	BCC $BF17				; $BF11: 90 04   
loc_BF13:
	STA $0E				  ; $BF13: 85 0E   
	STX $0F				  ; $BF15: 86 0F   
loc_BF17:
	DEX					  ; $BF17: CA	  
	BPL $BF02				; $BF18: 10 E8   
	LDX $0F				  ; $BF1A: A6 0F   
	STY tmp0				 ; $BF1C: 84 00   
	LDA $7348,X			  ; $BF1E: BD 48 73
	AND #$F0				 ; $BF21: 29 F0   
	ORA tmp0				 ; $BF23: 05 00   
	STA $7348,X			  ; $BF25: 9D 48 73
	INY					  ; $BF28: C8	  
	CPY #$0C				 ; $BF29: C0 0C   
	BNE $BEFC				; $BF2B: D0 CF   
	RTS					  ; $BF2D: 60	  

; ---- Subroutine at $BF2E (Bank 17) ----
sub_BF2E:
	TSX					  ; $BF2E: BA	  
	CLC					  ; $BF2F: 18	  
	LDA $0101,X			  ; $BF30: BD 01 01
	ADC #$01				 ; $BF33: 69 01	; Arithmetic
	STA tmp0				 ; $BF35: 85 00   
	LDA $0102,X			  ; $BF37: BD 02 01
	ADC #$00				 ; $BF3A: 69 00	; Arithmetic
	STA tmp1				 ; $BF3C: 85 01   
	LDY #$00				 ; $BF3E: A0 00   
	LDA (tmp0),Y			 ; $BF40: B1 00   
	PHA					  ; $BF42: 48	  
	LDA tmp0				 ; $BF43: A5 00   
	STA $0101,X			  ; $BF45: 9D 01 01
	LDA tmp1				 ; $BF48: A5 01   
	STA $0102,X			  ; $BF4A: 9D 02 01
	BRK					  ; $BF4D: 00	  
	.byte $13			  ; $BF4E - Unknown opcode
	.byte $2F			  ; $BF4F - Unknown opcode
loc_BF50:
	PLA					  ; $BF50: 68	  
	BRK					  ; $BF51: 00	  
	.byte $03			  ; $BF52 - Unknown opcode
	.byte $9F			  ; $BF53 - Unknown opcode
	RTS					  ; $BF54: 60	  

; ---- Subroutine at $BF55 (Bank 17) ----
sub_BF55:
	PHA					  ; $BF55: 48	  
	BRK					  ; $BF56: 00	  
	.byte $13			  ; $BF57 - Unknown opcode
	.byte $2F			  ; $BF58 - Unknown opcode
	JMP $BF50				; $BF59: 4C 50 BF
	LDA $6BDE				; $BF5C: AD DE 6B
	ORA #$80				 ; $BF5F: 09 80   
	STA $6BDE				; $BF61: 8D DE 6B
	BIT $C000				; $BF64: 2C 00 C0
	BVS $BFAE				; $BF67: 70 45   
loc_BF69:
	BRK					  ; $BF69: 00	  
	.byte $07			  ; $BF6A - Unknown opcode
	.byte $6F			  ; $BF6B - Unknown opcode
	BRK					  ; $BF6C: 00	  
	CMP #$FF				 ; $BF6D: C9 FF	; Compare with 255
	BEQ $BF69				; $BF6F: F0 F8   
	BNE $BF77				; $BF71: D0 04   
loc_BF73:
	BRK					  ; $BF73: 00	  
	.byte $07			  ; $BF74 - Unknown opcode
	.byte $6F			  ; $BF75 - Unknown opcode
	BRK					  ; $BF76: 00	  
loc_BF77:
	CMP #$FF				 ; $BF77: C9 FF	; Compare with 255
	BEQ $BF73				; $BF79: F0 F8   
	CMP #$F0				 ; $BF7B: C9 F0	; Compare with 240
	BEQ $BFAE				; $BF7D: F0 2F   
	STA $8A				  ; $BF7F: 85 8A   
loc_BF81:
	BRK					  ; $BF81: 00	  
	.byte $07			  ; $BF82 - Unknown opcode
	.byte $6F			  ; $BF83 - Unknown opcode
	BRK					  ; $BF84: 00	  
	CMP #$FF				 ; $BF85: C9 FF	; Compare with 255
	BEQ $BFA2				; $BF87: F0 19   
	LDX $8A				  ; $BF89: A6 8A   
	STA $6E45,X			  ; $BF8B: 9D 45 6E
loc_BF8E:
	BRK					  ; $BF8E: 00	  
	.byte $07			  ; $BF8F - Unknown opcode
	.byte $6F			  ; $BF90 - Unknown opcode
	BRK					  ; $BF91: 00	  
	CMP #$00				 ; $BF92: C9 00	; Compare with 0
	BEQ $BF8E				; $BF94: F0 F8   
	CMP #$FF				 ; $BF96: C9 FF	; Compare with 255
	BEQ $BF81				; $BF98: F0 E7   
	LDX $8A				  ; $BF9A: A6 8A   

; ---- Subroutine at $BF9C (Bank 17) ----
sub_BF9C:
	STA $6E49,X			  ; $BF9C: 9D 49 6E
	JMP $BF73				; $BF9F: 4C 73 BF
loc_BFA2:
	LDX $8A				  ; $BFA2: A6 8A   
	STA $6E45,X			  ; $BFA4: 9D 45 6E
	LDA #$00				 ; $BFA7: A9 00   
	STA $6E49,X			  ; $BFA9: 9D 49 6E
	BEQ $BF73				; $BFAC: F0 C5   
loc_BFAE:
	JMP $C54E				; $BFAE: 4C 4E C5
	.byte $FF			  ; $BFB1 - Unknown opcode
	.byte $FF			  ; $BFB2 - Unknown opcode
	.byte $FF			  ; $BFB3 - Unknown opcode
	.byte $FF			  ; $BFB4 - Unknown opcode
	.byte $FF			  ; $BFB5 - Unknown opcode
	.byte $FF			  ; $BFB6 - Unknown opcode
	.byte $FF			  ; $BFB7 - Unknown opcode
	.byte $FF			  ; $BFB8 - Unknown opcode
	.byte $FF			  ; $BFB9 - Unknown opcode
	.byte $FF			  ; $BFBA - Unknown opcode
	.byte $FF			  ; $BFBB - Unknown opcode
	.byte $FF			  ; $BFBC - Unknown opcode
	.byte $FF			  ; $BFBD - Unknown opcode
	.byte $FF			  ; $BFBE - Unknown opcode
	.byte $FF			  ; $BFBF - Unknown opcode
	.byte $FF			  ; $BFC0 - Unknown opcode
	.byte $FF			  ; $BFC1 - Unknown opcode
	.byte $FF			  ; $BFC2 - Unknown opcode
	.byte $FF			  ; $BFC3 - Unknown opcode
	.byte $FF			  ; $BFC4 - Unknown opcode
	.byte $FF			  ; $BFC5 - Unknown opcode
	.byte $FF			  ; $BFC6 - Unknown opcode
	.byte $FF			  ; $BFC7 - Unknown opcode
	.byte $FF			  ; $BFC8 - Unknown opcode
	.byte $FF			  ; $BFC9 - Unknown opcode
	.byte $FF			  ; $BFCA - Unknown opcode
	.byte $FF			  ; $BFCB - Unknown opcode
	.byte $FF			  ; $BFCC - Unknown opcode
	.byte $FF			  ; $BFCD - Unknown opcode
	.byte $FF			  ; $BFCE - Unknown opcode
	.byte $FF			  ; $BFCF - Unknown opcode
	.byte $FF			  ; $BFD0 - Unknown opcode
	.byte $FF			  ; $BFD1 - Unknown opcode
	.byte $FF			  ; $BFD2 - Unknown opcode
	.byte $FF			  ; $BFD3 - Unknown opcode
	.byte $FF			  ; $BFD4 - Unknown opcode
	.byte $FF			  ; $BFD5 - Unknown opcode
	.byte $FF			  ; $BFD6 - Unknown opcode
	.byte $FF			  ; $BFD7 - Unknown opcode
	SEI					  ; $BFD8: 78	  
	INC $BFDF				; $BFD9: EE DF BF
	JMP $FF8E				; $BFDC: 4C 8E FF
	.byte $80			  ; $BFDF - Unknown opcode
	JSR $5244				; $BFE0: 20 44 52
	EOR ($47,X)			  ; $BFE3: 41 47   
	.byte $4F			  ; $BFE5 - Unknown opcode
	LSR $5120				; $BFE6: 4E 20 51
	EOR $45,X				; $BFE9: 55 45   
	.byte $53			  ; $BFEB - Unknown opcode
	.byte $54			  ; $BFEC - Unknown opcode
	JSR $5649				; $BFED: 20 49 56
	BRK					  ; $BFF0: 00	  
	BRK					  ; $BFF1: 00	  
	BRK					  ; $BFF2: 00	  
	BRK					  ; $BFF3: 00	  
	PHA					  ; $BFF4: 48	  
	.byte $04			  ; $BFF5 - Unknown opcode
	ORA ($0E,X)			  ; $BFF6: 01 0E   
	.byte $07			  ; $BFF8 - Unknown opcode
	.byte $9E			  ; $BFF9 - Unknown opcode
	CLD					  ; $BFFA: D8	  
	.byte $BF			  ; $BFFB - Unknown opcode
	CLD					  ; $BFFC: D8	  
	.byte $BF			  ; $BFFD - Unknown opcode
	CLD					  ; $BFFE: D8	  
	.byte $BF			  ; $BFFF - Unknown opcode