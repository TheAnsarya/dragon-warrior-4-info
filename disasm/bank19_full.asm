; Dragon Warrior 4 (NES) - Bank 19 Complete Disassembly
; Battle System Code

; Bank loaded at $8000-$BFFF
; ROM offset: $4C000 - $4FFFF

; Auto-generated with labels and comments

; ======================================================================
; DISASSEMBLY
; ======================================================================

$8000:  38			SEC				 
							  ; Data region
		.byte $80, $73
$8003:  B5 6B		 LDA $6B,X		   
$8005:  B6 2E		 LDX $2E,Y		   
							  ; Data region
		.byte $B7, $32, $B7
$800A:  E4 B5		 CPX $B5			 
$800C:  18			CLC				 
							  ; Data region
		.byte $B7, $89
$800F:  B4 53		 LDY $53,X		   
$8011:  B5 0B		 LDA $0B,X		   
$8013:  B9 15 B9	  LDA spell_p1_tbl,Y  ; Spell param 1 table
$8016:  66 B0		 ROR $B0			 
$8018:  30 B9		 BMI $7FD3		   
							  ; Data region
		.byte $37
$801B:  B9 49 B9	  LDA spell_p2_tbl,Y  ; Spell param 2 table
							  ; Data region
		.byte $E3, $B7, $66, $83, $B6, $89, $F4, $83, $97, $A7, $62
$8029:  B4 CB		 LDY $CB,X		   
							  ; Data region
		.byte $BB
$802C:  EA			NOP				 
$802D:  BC E3 BD	  LDY $BDE3,X		 
$8030:  81 BE		 STA ($BE,X)		 
$8032:  A8			TAY				 
$8033:  BE 21 BF	  LDX $BF21,Y		 
$8036:  65 BF		 ADC $BF			 
btl_entry:					 ; $8038
$8038:  20 88 80	  JSR rd_tactics	  ; Read tactics
$803B:  20 A1 80	  JSR chk_char		; Check character state
$803E:  90 09		 BCC $8049		   
$8040:  20 4A 80	  JSR btl_setup	   ; Battle setup
$8043:  20 12 92	  JSR sum_stats	   ; Sum party stats
$8046:  20 5B 80	  JSR dispatch		; Dispatch action
$8049:  60			RTS				 

; --------------------------------------------------
; Battle setup
; --------------------------------------------------
btl_setup:					 ; $804A
$804A:  20 51 80	  JSR init_vars	   ; Initialize battle vars
$804D:  20 5A 84	  JSR btl_calc		; Battle calculation
$8050:  60			RTS				 

; --------------------------------------------------
; Initialize battle vars
; --------------------------------------------------
init_vars:					 ; $8051
$8051:  A2 FF		 LDX #$FF			
$8053:  00			BRK				 
$8054:  29 C3		 AND #$C3			
$8056:  0E 8D 77	  ASL $778D		   
$8059:  75 60		 ADC $60,X		   
dispatch:					 ; $805B
$805B:  AD 80 6E	  LDA action_type	 ; Current action type
$805E:  C9 04		 CMP #$04			
$8060:  F0 13		 BEQ mode4_jmp	   ; -> Mode 4 jump
$8062:  AD E8 75	  LDA spell_idx	   ; Spell index
$8065:  0A			ASL				 
$8066:  AA			TAX				 
$8067:  BD 78 80	  LDA act_table,X	 ; Action jump table
$806A:  85 00		 STA tmp0			; Temporary 0
$806C:  BD 79 80	  LDA $8079,X		 
$806F:  85 01		 STA tmp1			; Temporary 1
$8071:  6C 00 00	  JMP (tmp0)		  ; Temporary 0

; --------------------------------------------------
; Action 0 - NOP
; --------------------------------------------------
act_nop:					 ; $8074
$8074:  60			RTS				 

; --------------------------------------------------
; Mode 4 jump
; --------------------------------------------------
mode4_jmp:					 ; $8075
$8075:  4C C6 A8	  JMP $A8C6		   

; --------------------------------------------------
; Action jump table
; --------------------------------------------------
act_table:					 ; $8078
							  ; Data region
		.byte $74, $80, $F0, $AF, $97, $AF
$807E:  10 AF		 BPL $802F		   
$8080:  48			PHA				 
							  ; Data region
		.byte $AF
$8082:  49 B0		 EOR #$B0			
$8084:  49 B0		 EOR #$B0			
$8086:  49 B0		 EOR #$B0			
rd_tactics:					 ; $8088
$8088:  AD 5B 61	  LDA tactics		 ; Battle tactics setting
$808B:  8D 80 6E	  STA action_type	 ; Current action type
$808E:  F0 04		 BEQ $8094		   
$8090:  C9 02		 CMP #$02			
$8092:  D0 0A		 BNE $809E		   
$8094:  AD 44 6E	  LDA btl_mode		; Battle mode flag
$8097:  10 05		 BPL $809E		   
$8099:  A9 06		 LDA #$06			
$809B:  8D 80 6E	  STA action_type	 ; Current action type
$809E:  60			RTS				 
$809F:  18			CLC				 
$80A0:  60			RTS				 

; --------------------------------------------------
; Check character state
; --------------------------------------------------
chk_char:					 ; $80A1
$80A1:  A6 96		 LDX active_char	 ; Active character index
$80A3:  BD F4 72	  LDA char_state,X	; Character state array
$80A6:  29 70		 AND #$70			
$80A8:  C9 10		 CMP #$10			
$80AA:  D0 F3		 BNE $809F		   
$80AC:  00			BRK				 
$80AD:  06 1F		 ASL $1F			 
$80AF:  B0 EE		 BCS $809F		   
$80B1:  00			BRK				 
$80B2:  46 93		 LSR btl_flags	   ; Battle calculation flags
							  ; Data region
		.byte $07
$80B5:  90 E8		 BCC $809F		   
$80B7:  00			BRK				 
$80B8:  46 93		 LSR btl_flags	   ; Battle calculation flags
$80BA:  06 B0		 ASL $B0			 
							  ; Data region
		.byte $E2
$80BD:  00			BRK				 
$80BE:  46 93		 LSR btl_flags	   ; Battle calculation flags
$80C0:  10 B0		 BPL $8072		   
							  ; Data region
		.byte $DC
$80C3:  00			BRK				 
$80C4:  46 93		 LSR btl_flags	   ; Battle calculation flags
$80C6:  11 B0		 ORA ($B0),Y		 
$80C8:  D6 00		 DEC $00,X		   
$80CA:  46 93		 LSR btl_flags	   ; Battle calculation flags
							  ; Data region
		.byte $23
$80CD:  B0 D0		 BCS $809F		   
$80CF:  00			BRK				 
$80D0:  46 93		 LSR btl_flags	   ; Battle calculation flags
$80D2:  24 B0		 BIT $B0			 
$80D4:  CA			DEX				 
$80D5:  00			BRK				 
$80D6:  46 93		 LSR btl_flags	   ; Battle calculation flags
$80D8:  25 B0		 AND $B0			 
$80DA:  C4 00		 CPY tmp0			; Temporary 0
$80DC:  46 93		 LSR btl_flags	   ; Battle calculation flags
							  ; Data region
		.byte $12
$80DF:  B0 BE		 BCS $809F		   
$80E1:  00			BRK				 
							  ; Data region
		.byte $2B, $53
$80E4:  C9 08		 CMP #$08			
$80E6:  B0 B7		 BCS $809F		   
$80E8:  8D E8 75	  STA spell_idx	   ; Spell index
$80EB:  00			BRK				 
							  ; Data region
		.byte $07, $73
$80EE:  8D DC 75	  STA $75DC		   
$80F1:  A5 73		 LDA $73			 
$80F3:  F0 05		 BEQ clr_btl		 ; -> Clear battle vars
$80F5:  A9 FF		 LDA #$FF			
$80F7:  8D DC 75	  STA $75DC		   
clr_btl:					 ; $80FA
$80FA:  A2 00		 LDX #$00			
$80FC:  8E D4 75	  STX damage_lo	   ; Damage output low
$80FF:  8E D5 75	  STX damage_hi	   ; Damage output high
$8102:  8E D7 75	  STX $75D7		   
$8105:  8E D8 75	  STX $75D8		   
$8108:  8E D9 75	  STX actor		   ; Acting character
$810B:  8E DA 75	  STX act_cat		 ; Action category
$810E:  8E E6 75	  STX $75E6		   
$8111:  8E E7 75	  STX $75E7		   
$8114:  CA			DEX				 
$8115:  8E DB 75	  STX act_id		  ; Action ID
$8118:  00			BRK				 
$8119:  06 1F		 ASL $1F			 
$811B:  B0 82		 BCS $809F		   
$811D:  20 11 AE	  JSR $AE11		   
$8120:  00			BRK				 
							  ; Data region
		.byte $62, $23
$8123:  41 85		 EOR ($85,X)		 
							  ; Data region
		.byte $92
$8126:  A2 80		 LDX #$80			
$8128:  00			BRK				 
$8129:  29 C3		 AND #$C3			
$812B:  0E 8D E9	  ASL $E98D		   
$812E:  75 A9		 ADC $A9,X		   
$8130:  00			BRK				 
$8131:  A2 03		 LDX #$03			
$8133:  9D 91 75	  STA $7591,X		 
$8136:  9D 95 75	  STA $7595,X		 
$8139:  CA			DEX				 
$813A:  10 F7		 BPL $8133		   
$813C:  00			BRK				 
							  ; Data region
		.byte $62, $23
$813F:  40			RTI				 
$8140:  85 8A		 STA char_count	  ; Character count
$8142:  A2 00		 LDX #$00			
$8144:  00			BRK				 
$8145:  46 93		 LSR btl_flags	   ; Battle calculation flags
							  ; Data region
		.byte $07
$8148:  90 25		 BCC $816F		   
$814A:  A9 10		 LDA #$10			
$814C:  9D 91 75	  STA $7591,X		 
$814F:  9D 95 75	  STA $7595,X		 
$8152:  00			BRK				 
$8153:  46 93		 LSR btl_flags	   ; Battle calculation flags
$8155:  16 B0		 ASL $B0,X		   
$8157:  06 00		 ASL tmp0			; Temporary 0
$8159:  46 93		 LSR btl_flags	   ; Battle calculation flags
							  ; Data region
		.byte $17
$815C:  90 05		 BCC $8163		   
$815E:  A9 00		 LDA #$00			
$8160:  9D 95 75	  STA $7595,X		 
$8163:  00			BRK				 
$8164:  46 93		 LSR btl_flags	   ; Battle calculation flags
$8166:  19 90 06	  ORA $0690,Y		 
$8169:  5E 91 75	  LSR $7591,X		 
$816C:  5E 95 75	  LSR $7595,X		 
$816F:  E8			INX				 
$8170:  E4 8A		 CPX char_count	  ; Character count
$8172:  90 D0		 BCC $8144		   
$8174:  38			SEC				 
$8175:  60			RTS				 

; --------------------------------------------------
; Multiply by 16
; --------------------------------------------------
mul16:					 ; $8176
$8176:  16 00		 ASL $00,X		   
$8178:  36 01		 ROL $01,X		   
$817A:  16 00		 ASL $00,X		   
$817C:  36 01		 ROL $01,X		   
$817E:  16 00		 ASL $00,X		   
$8180:  36 01		 ROL $01,X		   
$8182:  16 00		 ASL $00,X		   
$8184:  36 01		 ROL $01,X		   
$8186:  60			RTS				 

; --------------------------------------------------
; Divide by 16
; --------------------------------------------------
div16:					 ; $8187
$8187:  56 01		 LSR $01,X		   
$8189:  76 00		 ROR $00,X		   
$818B:  56 01		 LSR $01,X		   
$818D:  76 00		 ROR $00,X		   
$818F:  56 01		 LSR $01,X		   
$8191:  76 00		 ROR $00,X		   
$8193:  56 01		 LSR $01,X		   
$8195:  76 00		 ROR $00,X		   
$8197:  60			RTS				 

; --------------------------------------------------
; Scale stat value
; --------------------------------------------------
scale_stat:					 ; $8198
$8198:  A2 94		 LDX #$94			
sub_819A:
$819A:  C9 00		 CMP #$00			
$819C:  F0 20		 BEQ $81BE		   
$819E:  C9 10		 CMP #$10			
$81A0:  F0 1B		 BEQ $81BD		   
$81A2:  20 30 83	  JSR mult_a		  ; Multiply by A
shift_ext:					 ; $81A5
$81A5:  46 19		 LSR mult_hi		 ; Product high
$81A7:  76 01		 ROR $01,X		   
$81A9:  76 00		 ROR $00,X		   
$81AB:  46 19		 LSR mult_hi		 ; Product high
$81AD:  76 01		 ROR $01,X		   
$81AF:  76 00		 ROR $00,X		   
$81B1:  46 19		 LSR mult_hi		 ; Product high
$81B3:  76 01		 ROR $01,X		   
$81B5:  76 00		 ROR $00,X		   
$81B7:  46 19		 LSR mult_hi		 ; Product high
$81B9:  76 01		 ROR $01,X		   
$81BB:  76 00		 ROR $00,X		   
$81BD:  60			RTS				 
$81BE:  A9 00		 LDA #$00			
$81C0:  95 00		 STA $00,X		   
$81C2:  95 01		 STA $01,X		   
$81C4:  60			RTS				 

; ------------------------------
sub_81C5:
$81C5:  20 31 82	  JSR $8231		   
$81C8:  C9 01		 CMP #$01			
$81CA:  F0 13		 BEQ $81DF		   
$81CC:  C9 02		 CMP #$02			
$81CE:  F0 0B		 BEQ $81DB		   
$81D0:  C9 04		 CMP #$04			
$81D2:  F0 03		 BEQ $81D7		   
$81D4:  4C 27 C8	  JMP $C827		   
$81D7:  06 94		 ASL $94			 
$81D9:  26 95		 ROL $95			 
$81DB:  06 94		 ASL $94			 
$81DD:  26 95		 ROL $95			 
$81DF:  60			RTS				 

; ------------------------------
sub_81E0:
$81E0:  20 31 82	  JSR $8231		   
$81E3:  C9 01		 CMP #$01			
$81E5:  F0 13		 BEQ $81FA		   
$81E7:  C9 02		 CMP #$02			
$81E9:  F0 0B		 BEQ $81F6		   
$81EB:  C9 04		 CMP #$04			
$81ED:  F0 03		 BEQ $81F2		   
$81EF:  4C 51 C8	  JMP $C851		   
$81F2:  46 95		 LSR $95			 
$81F4:  66 94		 ROR $94			 
$81F6:  46 95		 LSR $95			 
$81F8:  66 94		 ROR $94			 
$81FA:  60			RTS				 
$81FB:  20 33 82	  JSR $8233		   
$81FE:  C9 01		 CMP #$01			
$8200:  F0 13		 BEQ $8215		   
$8202:  C9 02		 CMP #$02			
$8204:  F0 0B		 BEQ $8211		   
$8206:  C9 04		 CMP #$04			
$8208:  F0 03		 BEQ $820D		   
$820A:  4C 27 C8	  JMP $C827		   
$820D:  16 00		 ASL $00,X		   
$820F:  36 01		 ROL $01,X		   
$8211:  16 00		 ASL $00,X		   
$8213:  36 01		 ROL $01,X		   
$8215:  60			RTS				 

; ------------------------------
sub_8216:
$8216:  20 33 82	  JSR $8233		   
$8219:  C9 01		 CMP #$01			
$821B:  F0 13		 BEQ $8230		   
$821D:  C9 02		 CMP #$02			
$821F:  F0 0B		 BEQ $822C		   
$8221:  C9 04		 CMP #$04			
$8223:  F0 03		 BEQ $8228		   
$8225:  4C 51 C8	  JMP $C851		   
$8228:  56 01		 LSR $01,X		   
$822A:  76 00		 ROR $00,X		   
$822C:  56 01		 LSR $01,X		   
$822E:  76 00		 ROR $00,X		   
$8230:  60			RTS				 

; ------------------------------
sub_8231:
$8231:  A2 94		 LDX #$94			
sub_8233:
$8233:  A5 92		 LDA $92			 
$8235:  60			RTS				 

; ------------------------------
sub_8236:
$8236:  AD 9A 75	  LDA $759A		   
$8239:  A2 94		 LDX #$94			
$823B:  C9 FF		 CMP #$FF			
$823D:  F0 0B		 BEQ $824A		   
$823F:  20 30 83	  JSR mult_a		  ; Multiply by A
$8242:  A5 95		 LDA $95			 
$8244:  85 94		 STA $94			 
$8246:  A5 19		 LDA mult_hi		 ; Product high
$8248:  85 95		 STA $95			 
$824A:  60			RTS				 
$824B:  20 36 82	  JSR $8236		   
$824E:  A5 94		 LDA $94			 
$8250:  18			CLC				 
$8251:  6D AD 75	  ADC btl_ad		  ; Battle stat AD
$8254:  8D AD 75	  STA btl_ad		  ; Battle stat AD
$8257:  A5 95		 LDA $95			 
$8259:  6D AE 75	  ADC $75AE		   
$825C:  8D AE 75	  STA $75AE		   
$825F:  60			RTS				 
$8260:  20 36 82	  JSR $8236		   
$8263:  A5 94		 LDA $94			 
$8265:  18			CLC				 
$8266:  6D AF 75	  ADC $75AF		   
$8269:  8D AF 75	  STA $75AF		   
$826C:  A5 95		 LDA $95			 
$826E:  6D B0 75	  ADC $75B0		   
$8271:  8D B0 75	  STA $75B0		   
$8274:  60			RTS				 

; ------------------------------
sub_8275:
$8275:  20 36 82	  JSR $8236		   
$8278:  A5 94		 LDA $94			 
$827A:  18			CLC				 
$827B:  6D B5 75	  ADC $75B5		   
$827E:  8D B5 75	  STA $75B5		   
$8281:  A5 95		 LDA $95			 
$8283:  6D B6 75	  ADC $75B6		   
$8286:  8D B6 75	  STA $75B6		   
$8289:  60			RTS				 

; ------------------------------
sub_828A:
$828A:  20 36 82	  JSR $8236		   
$828D:  A5 94		 LDA $94			 
$828F:  18			CLC				 
$8290:  6D B7 75	  ADC $75B7		   
$8293:  8D B7 75	  STA $75B7		   
$8296:  A5 95		 LDA $95			 
$8298:  6D B8 75	  ADC $75B8		   
$829B:  8D B8 75	  STA $75B8		   
$829E:  60			RTS				 
$829F:  20 36 82	  JSR $8236		   
$82A2:  A5 94		 LDA $94			 
$82A4:  18			CLC				 
$82A5:  6D B9 75	  ADC $75B9		   
$82A8:  8D B9 75	  STA $75B9		   
$82AB:  A5 95		 LDA $95			 
$82AD:  6D BA 75	  ADC $75BA		   
$82B0:  8D BA 75	  STA $75BA		   
$82B3:  60			RTS				 
$82B4:  20 36 82	  JSR $8236		   
$82B7:  A5 94		 LDA $94			 
$82B9:  18			CLC				 
$82BA:  6D BB 75	  ADC $75BB		   
$82BD:  8D BB 75	  STA $75BB		   
$82C0:  A5 95		 LDA $95			 
$82C2:  6D BC 75	  ADC $75BC		   
$82C5:  8D BC 75	  STA $75BC		   
$82C8:  60			RTS				 

; ------------------------------
sub_82C9:
$82C9:  20 36 82	  JSR $8236		   
$82CC:  A5 94		 LDA $94			 
$82CE:  18			CLC				 
$82CF:  6D B1 75	  ADC $75B1		   
$82D2:  8D B1 75	  STA $75B1		   
$82D5:  A5 95		 LDA $95			 
$82D7:  6D B2 75	  ADC $75B2		   
$82DA:  8D B2 75	  STA $75B2		   
$82DD:  60			RTS				 

; ------------------------------
sub_82DE:
$82DE:  20 36 82	  JSR $8236		   
$82E1:  A5 94		 LDA $94			 
$82E3:  18			CLC				 
$82E4:  6D B3 75	  ADC $75B3		   
$82E7:  8D B3 75	  STA $75B3		   
$82EA:  A5 95		 LDA $95			 
$82EC:  6D B4 75	  ADC $75B4		   
$82EF:  8D B4 75	  STA $75B4		   
$82F2:  60			RTS				 
$82F3:  20 36 82	  JSR $8236		   
$82F6:  A5 94		 LDA $94			 
$82F8:  18			CLC				 
$82F9:  6D BD 75	  ADC $75BD		   
$82FC:  8D BD 75	  STA $75BD		   
$82FF:  A5 95		 LDA $95			 
$8301:  6D BE 75	  ADC $75BE		   
$8304:  8D BE 75	  STA $75BE		   
$8307:  60			RTS				 
$8308:  20 36 82	  JSR $8236		   
$830B:  A5 94		 LDA $94			 
$830D:  18			CLC				 
$830E:  6D BF 75	  ADC $75BF		   
$8311:  8D BF 75	  STA $75BF		   
$8314:  A5 95		 LDA $95			 
$8316:  6D C0 75	  ADC $75C0		   
$8319:  8D C0 75	  STA $75C0		   
$831C:  60			RTS				 

; ------------------------------
sub_831D:
$831D:  A5 82		 LDA inner_loop	  ; Inner loop counter
$831F:  0A			ASL				 
$8320:  85 0A		 STA $0A			 
$8322:  98			TYA				 
$8323:  65 0A		 ADC $0A			 
$8325:  A8			TAY				 
$8326:  A5 94		 LDA $94			 
$8328:  91 88		 STA (char_ptr_lo),Y ; Character data pointer low
$832A:  C8			INY				 
$832B:  A5 95		 LDA $95			 
$832D:  91 88		 STA (char_ptr_lo),Y ; Character data pointer low
$832F:  60			RTS				 

; --------------------------------------------------
; Multiply by A
; --------------------------------------------------
mult_a:					 ; $8330
$8330:  85 16		 STA mult_a		  ; Multiplier A
$8332:  A9 00		 LDA #$00			
$8334:  85 17		 STA mult_lo		 ; Product low
$8336:  85 18		 STA mult_mid		; Product mid
$8338:  85 19		 STA mult_hi		 ; Product high
$833A:  85 1A		 STA mult_ext		; Product extended
$833C:  46 16		 LSR mult_a		  ; Multiplier A
$833E:  90 13		 BCC $8353		   
$8340:  B5 00		 LDA $00,X		   
$8342:  18			CLC				 
$8343:  65 17		 ADC mult_lo		 ; Product low
$8345:  85 17		 STA mult_lo		 ; Product low
$8347:  B5 01		 LDA $01,X		   
$8349:  65 18		 ADC mult_mid		; Product mid
$834B:  85 18		 STA mult_mid		; Product mid
$834D:  A5 19		 LDA mult_hi		 ; Product high
$834F:  65 1A		 ADC mult_ext		; Product extended
$8351:  85 19		 STA mult_hi		 ; Product high
$8353:  16 00		 ASL $00,X		   
$8355:  36 01		 ROL $01,X		   
$8357:  26 1A		 ROL mult_ext		; Product extended
$8359:  A5 16		 LDA mult_a		  ; Multiplier A
$835B:  D0 DF		 BNE $833C		   
$835D:  A5 17		 LDA mult_lo		 ; Product low
$835F:  95 00		 STA $00,X		   
$8361:  A5 18		 LDA mult_mid		; Product mid
$8363:  95 01		 STA $01,X		   
$8365:  60			RTS				 

; --------------------------------------------------
; Multiply pair
; --------------------------------------------------
mult_pair:					 ; $8366
$8366:  85 16		 STA mult_a		  ; Multiplier A
$8368:  A9 00		 LDA #$00			
$836A:  85 17		 STA mult_lo		 ; Product low
$836C:  85 18		 STA mult_mid		; Product mid
$836E:  85 19		 STA mult_hi		 ; Product high
$8370:  85 1A		 STA mult_ext		; Product extended
$8372:  85 1B		 STA $1B			 
$8374:  46 16		 LSR mult_a		  ; Multiplier A
$8376:  90 19		 BCC $8391		   
$8378:  B5 00		 LDA $00,X		   
$837A:  18			CLC				 
$837B:  65 17		 ADC mult_lo		 ; Product low
$837D:  85 17		 STA mult_lo		 ; Product low
$837F:  B5 01		 LDA $01,X		   
$8381:  65 18		 ADC mult_mid		; Product mid
$8383:  85 18		 STA mult_mid		; Product mid
$8385:  B5 02		 LDA $02,X		   
$8387:  65 19		 ADC mult_hi		 ; Product high
$8389:  85 19		 STA mult_hi		 ; Product high
$838B:  A5 1A		 LDA mult_ext		; Product extended
$838D:  65 1B		 ADC $1B			 
$838F:  85 1A		 STA mult_ext		; Product extended
$8391:  16 00		 ASL $00,X		   
$8393:  36 01		 ROL $01,X		   
$8395:  36 02		 ROL $02,X		   
$8397:  26 1B		 ROL $1B			 
$8399:  A5 16		 LDA mult_a		  ; Multiplier A
$839B:  D0 D7		 BNE $8374		   
$839D:  A5 17		 LDA mult_lo		 ; Product low
$839F:  95 00		 STA $00,X		   
$83A1:  A5 18		 LDA mult_mid		; Product mid
$83A3:  95 01		 STA $01,X		   
$83A5:  A5 19		 LDA mult_hi		 ; Product high
$83A7:  95 02		 STA $02,X		   
$83A9:  60			RTS				 

; --------------------------------------------------
; Add 16-bit pairs
; --------------------------------------------------
add_pairs:					 ; $83AA
$83AA:  B9 00 00	  LDA tmp0,Y		  ; Temporary 0
$83AD:  8D 14 6E	  STA div_div_lo	  ; Division divisor low
$83B0:  B9 01 00	  LDA tmp1,Y		  ; Temporary 1
$83B3:  8D 15 6E	  STA div_div_mid	 ; Division divisor mid
$83B6:  98			TYA				 
$83B7:  48			PHA				 
$83B8:  A0 10		 LDY #$10			
$83BA:  A9 00		 LDA #$00			
$83BC:  8D 16 6E	  STA div_div_hi	  ; Division divisor high
$83BF:  8D 11 6E	  STA div_rem_lo	  ; Division remainder low
$83C2:  8D 12 6E	  STA div_rem_mid	 ; Division remainder mid
div16_lp:					 ; $83C5
$83C5:  16 00		 ASL $00,X		   
$83C7:  36 01		 ROL $01,X		   
$83C9:  2E 11 6E	  ROL div_rem_lo	  ; Division remainder low
$83CC:  2E 12 6E	  ROL div_rem_mid	 ; Division remainder mid
$83CF:  F6 00		 INC $00,X		   
$83D1:  AD 11 6E	  LDA div_rem_lo	  ; Division remainder low
$83D4:  38			SEC				 
$83D5:  ED 14 6E	  SBC div_div_lo	  ; Division divisor low
$83D8:  48			PHA				 
$83D9:  AD 12 6E	  LDA div_rem_mid	 ; Division remainder mid
$83DC:  ED 15 6E	  SBC div_div_mid	 ; Division divisor mid
$83DF:  B0 06		 BCS $83E7		   
$83E1:  68			PLA				 
$83E2:  D6 00		 DEC $00,X		   
$83E4:  4C EE 83	  JMP $83EE		   
$83E7:  8D 12 6E	  STA div_rem_mid	 ; Division remainder mid
$83EA:  68			PLA				 
$83EB:  8D 11 6E	  STA div_rem_lo	  ; Division remainder low
$83EE:  88			DEY				 
$83EF:  D0 D4		 BNE div16_lp		; -> Division loop 16-bit
$83F1:  68			PLA				 
$83F2:  A8			TAY				 
$83F3:  60			RTS				 

; --------------------------------------------------
; 24-bit div setup
; --------------------------------------------------
div24_set:					 ; $83F4
$83F4:  A9 00		 LDA #$00			
$83F6:  8D 16 6E	  STA div_div_hi	  ; Division divisor high
$83F9:  B9 00 00	  LDA tmp0,Y		  ; Temporary 0
$83FC:  8D 14 6E	  STA div_div_lo	  ; Division divisor low
$83FF:  B9 01 00	  LDA tmp1,Y		  ; Temporary 1
$8402:  8D 15 6E	  STA div_div_mid	 ; Division divisor mid
$8405:  98			TYA				 
$8406:  48			PHA				 
$8407:  A0 18		 LDY #$18			
$8409:  A9 00		 LDA #$00			
$840B:  8D 11 6E	  STA div_rem_lo	  ; Division remainder low
$840E:  8D 12 6E	  STA div_rem_mid	 ; Division remainder mid
$8411:  8D 13 6E	  STA div_rem_hi	  ; Division remainder high
div24_lp:					 ; $8414
$8414:  16 00		 ASL $00,X		   
$8416:  36 01		 ROL $01,X		   
$8418:  36 02		 ROL $02,X		   
$841A:  2E 11 6E	  ROL div_rem_lo	  ; Division remainder low
$841D:  2E 12 6E	  ROL div_rem_mid	 ; Division remainder mid
$8420:  2E 13 6E	  ROL div_rem_hi	  ; Division remainder high
$8423:  F6 00		 INC $00,X		   
$8425:  AD 11 6E	  LDA div_rem_lo	  ; Division remainder low
$8428:  38			SEC				 
$8429:  ED 14 6E	  SBC div_div_lo	  ; Division divisor low
$842C:  48			PHA				 
$842D:  AD 12 6E	  LDA div_rem_mid	 ; Division remainder mid
$8430:  ED 15 6E	  SBC div_div_mid	 ; Division divisor mid
$8433:  48			PHA				 
$8434:  AD 13 6E	  LDA div_rem_hi	  ; Division remainder high
$8437:  ED 16 6E	  SBC div_div_hi	  ; Division divisor high
$843A:  B0 07		 BCS $8443		   
$843C:  68			PLA				 
$843D:  68			PLA				 
$843E:  D6 00		 DEC $00,X		   
$8440:  4C 4E 84	  JMP $844E		   
$8443:  8D 13 6E	  STA div_rem_hi	  ; Division remainder high
$8446:  68			PLA				 
$8447:  8D 12 6E	  STA div_rem_mid	 ; Division remainder mid
$844A:  68			PLA				 
$844B:  8D 11 6E	  STA div_rem_lo	  ; Division remainder low
$844E:  88			DEY				 
$844F:  D0 C3		 BNE div24_lp		; -> 24-bit division loop
$8451:  68			PLA				 
$8452:  A8			TAY				 
$8453:  60			RTS				 

; --------------------------------------------------
; 3-byte division
; --------------------------------------------------
div_3byte:					 ; $8454
$8454:  B9 02 00	  LDA tmp2,Y		  ; Temporary 2
$8457:  4C F6 83	  JMP $83F6		   

; --------------------------------------------------
; Battle calculation
; --------------------------------------------------
btl_calc:					 ; $845A
$845A:  00			BRK				 
							  ; Data region
		.byte $12, $8F
$845D:  20 88 84	  JSR helper_8488	 ; Unknown helper
$8460:  A2 FF		 LDX #$FF			
$8462:  00			BRK				 
$8463:  29 C3		 AND #$C3			
$8465:  0E 8D 78	  ASL $788D		   
$8468:  75 00		 ADC $00,X		   
$846A:  29 C3		 AND #$C3			
							  ; Data region
		.byte $0F
$846D:  2D 78 75	  AND $7578		   
$8470:  8D 78 75	  STA $7578		   
$8473:  20 17 85	  JSR $8517		   
$8476:  A9 00		 LDA #$00			
$8478:  85 93		 STA btl_flags	   ; Battle calculation flags
$847A:  20 A8 84	  JSR $84A8		   
$847D:  E6 93		 INC btl_flags	   ; Battle calculation flags
$847F:  A5 93		 LDA btl_flags	   ; Battle calculation flags
$8481:  C9 08		 CMP #$08			
$8483:  90 F5		 BCC $847A		   
$8485:  4C 26 8F	  JMP $8F26		   

; --------------------------------------------------
; Unknown helper
; --------------------------------------------------
helper_8488:					 ; $8488
$8488:  A2 39		 LDX #$39			
$848A:  A9 00		 LDA #$00			
$848C:  9D 00 76	  STA $7600,X		 
$848F:  9D 3A 76	  STA $763A,X		 
$8492:  9D 74 76	  STA $7674,X		 
$8495:  9D AE 76	  STA $76AE,X		 
$8498:  9D E8 76	  STA $76E8,X		 
$849B:  9D 22 77	  STA $7722,X		 
$849E:  9D 5C 77	  STA $775C,X		 
$84A1:  9D 96 77	  STA $7796,X		 
$84A4:  CA			DEX				 
$84A5:  10 E5		 BPL $848C		   
$84A7:  60			RTS				 

; ------------------------------
sub_84A8:
$84A8:  20 0C 85	  JSR $850C		   
$84AB:  A6 93		 LDX btl_flags	   ; Battle calculation flags
$84AD:  00			BRK				 
$84AE:  29 C3		 AND #$C3			
							  ; Data region
		.byte $0C
$84B1:  B0 30		 BCS $84E3		   
$84B3:  A2 05		 LDX #$05			
$84B5:  A5 93		 LDA btl_flags	   ; Battle calculation flags
$84B7:  0A			ASL				 
$84B8:  85 00		 STA tmp0			; Temporary 0
$84BA:  0A			ASL				 
$84BB:  65 00		 ADC tmp0			; Temporary 0
$84BD:  85 00		 STA tmp0			; Temporary 0
$84BF:  8A			TXA				 
$84C0:  65 00		 ADC tmp0			; Temporary 0
$84C2:  A8			TAY				 
$84C3:  B9 C2 6D	  LDA $6DC2,Y		 
$84C6:  F0 15		 BEQ $84DD		   
$84C8:  8D 9A 75	  STA $759A		   
$84CB:  B9 8C 6D	  LDA $6D8C,Y		 
$84CE:  C9 FF		 CMP #$FF			
$84D0:  F0 0B		 BEQ $84DD		   
$84D2:  8D 99 75	  STA $7599		   
$84D5:  A8			TAY				 
$84D6:  8A			TXA				 
$84D7:  48			PHA				 
$84D8:  20 E9 84	  JSR $84E9		   
$84DB:  68			PLA				 
$84DC:  AA			TAX				 
$84DD:  CA			DEX				 
$84DE:  10 D5		 BPL $84B5		   
$84E0:  4C 3C 8D	  JMP $8D3C		   
$84E3:  20 9B 85	  JSR $859B		   
$84E6:  4C 3C 8D	  JMP $8D3C		   

; ------------------------------
sub_84E9:
$84E9:  AD 99 85	  LDA $8599		   
$84EC:  85 00		 STA tmp0			; Temporary 0
$84EE:  AD 9A 85	  LDA $859A		   
$84F1:  85 01		 STA tmp1			; Temporary 1
$84F3:  A2 00		 LDX #$00			
$84F5:  98			TYA				 
$84F6:  48			PHA				 
$84F7:  20 13 C8	  JSR $C813		   
$84FA:  68			PLA				 
$84FB:  20 13 C8	  JSR $C813		   
$84FE:  A0 00		 LDY #$00			
$8500:  B1 00		 LDA (tmp0),Y		; Temporary 0
$8502:  85 02		 STA tmp2			; Temporary 2
$8504:  C8			INY				 
$8505:  B1 00		 LDA (tmp0),Y		; Temporary 0
$8507:  85 03		 STA tmp3			; Temporary 3
$8509:  6C 02 00	  JMP (tmp2)		  ; Temporary 2

; ------------------------------
sub_850C:
$850C:  A9 00		 LDA #$00			
$850E:  A2 2D		 LDX #$2D			
$8510:  9D A3 75	  STA $75A3,X		 
$8513:  CA			DEX				 
$8514:  10 FA		 BPL $8510		   
$8516:  60			RTS				 

; ------------------------------
sub_8517:
$8517:  A2 07		 LDX #$07			
$8519:  A9 10		 LDA #$10			
$851B:  9D 79 75	  STA $7579,X		 
$851E:  9D 81 75	  STA $7581,X		 
$8521:  9D 89 75	  STA $7589,X		 
$8524:  CA			DEX				 
$8525:  10 F4		 BPL $851B		   
$8527:  AD 78 75	  LDA $7578		   
$852A:  85 00		 STA tmp0			; Temporary 0
$852C:  A2 00		 LDX #$00			
$852E:  46 00		 LSR tmp0			; Temporary 0
$8530:  90 54		 BCC $8586		   
$8532:  A9 20		 LDA #$20			
$8534:  20 F2 85	  JSR $85F2		   
$8537:  D0 46		 BNE $857F		   
$8539:  A9 04		 LDA #$04			
$853B:  20 EE 85	  JSR $85EE		   
$853E:  D0 3F		 BNE $857F		   
$8540:  A9 02		 LDA #$02			
$8542:  20 F6 85	  JSR $85F6		   
$8545:  D0 38		 BNE $857F		   
$8547:  A9 01		 LDA #$01			
$8549:  20 EE 85	  JSR $85EE		   
$854C:  20 8D 85	  JSR $858D		   
$854F:  A9 08		 LDA #$08			
$8551:  20 F2 85	  JSR $85F2		   
$8554:  20 93 85	  JSR $8593		   
$8557:  A9 08		 LDA #$08			
$8559:  20 EE 85	  JSR $85EE		   
$855C:  F0 05		 BEQ $8563		   
$855E:  A9 00		 LDA #$00			
$8560:  9D 81 75	  STA $7581,X		 
$8563:  A9 10		 LDA #$10			
$8565:  20 EE 85	  JSR $85EE		   
$8568:  F0 05		 BEQ $856F		   
$856A:  A9 06		 LDA #$06			
$856C:  9D 89 75	  STA $7589,X		 
$856F:  A9 20		 LDA #$20			
$8571:  20 EE 85	  JSR $85EE		   
$8574:  F0 03		 BEQ $8579		   
$8576:  1E 89 75	  ASL $7589,X		 
$8579:  E8			INX				 
$857A:  E0 08		 CPX #$08			
$857C:  90 B0		 BCC $852E		   
$857E:  60			RTS				 
$857F:  A9 01		 LDA #$01			
$8581:  9D 79 75	  STA $7579,X		 
$8584:  D0 F3		 BNE $8579		   
$8586:  A9 00		 LDA #$00			
$8588:  9D 79 75	  STA $7579,X		 
$858B:  F0 EC		 BEQ $8579		   
sub_858D:
$858D:  F0 03		 BEQ $8592		   
$858F:  5E 79 75	  LSR $7579,X		 
$8592:  60			RTS				 

; ------------------------------
sub_8593:
$8593:  F0 FD		 BEQ $8592		   
$8595:  1E 79 75	  ASL $7579,X		 
$8598:  60			RTS				 
							  ; Data region
		.byte $8B, $8B

; ------------------------------
sub_859B:
$859B:  A9 FF		 LDA #$FF			
$859D:  8D 9A 75	  STA $759A		   
$85A0:  A6 93		 LDX btl_flags	   ; Battle calculation flags
$85A2:  20 9C 89	  JSR $899C		   
$85A5:  A0 05		 LDY #$05			
$85A7:  B1 86		 LDA (stat_ptr_lo),Y ; Stat table pointer low
$85A9:  29 08		 AND #$08			
$85AB:  D0 38		 BNE $85E5		   
$85AD:  A0 09		 LDY #$09			
$85AF:  B1 86		 LDA (stat_ptr_lo),Y ; Stat table pointer low
$85B1:  29 0F		 AND #$0F			
$85B3:  20 AB 8A	  JSR $8AAB		   
$85B6:  C9 09		 CMP #$09			
$85B8:  B0 2E		 BCS $85E8		   
$85BA:  48			PHA				 
$85BB:  29 07		 AND #$07			
$85BD:  C9 05		 CMP #$05			
$85BF:  68			PLA				 
$85C0:  B0 23		 BCS $85E5		   
$85C2:  48			PHA				 
$85C3:  20 B6 89	  JSR get_act		 ; Get action data
$85C6:  A0 05		 LDY #$05			
$85C8:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$85CA:  C9 32		 CMP #$32			
$85CC:  90 02		 BCC $85D0		   
$85CE:  A9 32		 LDA #$32			
$85D0:  85 94		 STA $94			 
$85D2:  A9 00		 LDA #$00			
$85D4:  85 95		 STA $95			 
$85D6:  68			PLA				 
$85D7:  29 07		 AND #$07			
$85D9:  AA			TAX				 
$85DA:  BD E9 85	  LDA $85E9,X		 
$85DD:  A2 94		 LDX #$94			
$85DF:  20 27 C8	  JSR $C827		   
$85E2:  20 76 8C	  JSR $8C76		   
$85E5:  4C 92 B3	  JMP $B392		   
$85E8:  60			RTS				 
$85E9:  05 03		 ORA tmp3			; Temporary 3
							  ; Data region
		.byte $03, $04, $04
sub_85EE:
$85EE:  A0 05		 LDY #$05			
$85F0:  D0 06		 BNE $85F8		   
sub_85F2:
$85F2:  A0 06		 LDY #$06			
$85F4:  D0 02		 BNE $85F8		   
sub_85F6:
$85F6:  A0 07		 LDY #$07			
$85F8:  85 76		 STA $76			 
$85FA:  20 9C 89	  JSR $899C		   
$85FD:  B1 86		 LDA (stat_ptr_lo),Y ; Stat table pointer low
$85FF:  25 76		 AND $76			 
$8601:  60			RTS				 

; ------------------------------
sub_8602:
$8602:  A0 0D		 LDY #$0D			
$8604:  A6 81		 LDX party_loop	  ; Party loop counter
$8606:  20 9C 89	  JSR $899C		   
$8609:  B1 86		 LDA (stat_ptr_lo),Y ; Stat table pointer low
$860B:  29 03		 AND #$03			
$860D:  C5 8D		 CMP $8D			 
$860F:  60			RTS				 

; ------------------------------
sub_8610:
$8610:  20 6B 8A	  JSR $8A6B		   
$8613:  90 36		 BCC $864B		   
$8615:  A0 01		 LDY #$01			
$8617:  A2 00		 LDX #$00			
$8619:  4C 41 86	  JMP $8641		   

; ------------------------------
sub_861C:
$861C:  20 6B 8A	  JSR $8A6B		   
$861F:  90 2A		 BCC $864B		   
$8621:  C9 09		 CMP #$09			
$8623:  90 18		 BCC $863D		   
$8625:  A5 79		 LDA action_ptr_lo   ; Action data pointer low
$8627:  48			PHA				 
$8628:  A5 7A		 LDA action_ptr_hi   ; Action data pointer high
$862A:  48			PHA				 
$862B:  20 BB 86	  JSR $86BB		   
$862E:  85 02		 STA tmp2			; Temporary 2
$8630:  AD 64 73	  LDA $7364		   
$8633:  85 03		 STA tmp3			; Temporary 3
$8635:  68			PLA				 
$8636:  85 7A		 STA action_ptr_hi   ; Action data pointer high
$8638:  68			PLA				 
$8639:  85 79		 STA action_ptr_lo   ; Action data pointer low
$863B:  38			SEC				 
$863C:  60			RTS				 
$863D:  A0 0C		 LDY #$0C			
$863F:  A2 02		 LDX #$02			
sub_8641:
$8641:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$8643:  95 00		 STA $00,X		   
$8645:  C8			INY				 
$8646:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$8648:  95 01		 STA $01,X		   
$864A:  38			SEC				 
$864B:  60			RTS				 

; ------------------------------
sub_864C:
$864C:  A9 00		 LDA #$00			
$864E:  85 00		 STA tmp0			; Temporary 0
$8650:  85 01		 STA tmp1			; Temporary 1
$8652:  20 32 8A	  JSR $8A32		   
$8655:  A0 03		 LDY #$03			
$8657:  98			TYA				 
$8658:  48			PHA				 
$8659:  BD 6A 61	  LDA btl_action,X	; Battle action data
$865C:  10 15		 BPL $8673		   
$865E:  29 0F		 AND #$0F			
$8660:  20 B6 89	  JSR get_act		 ; Get action data
$8663:  A0 01		 LDY #$01			
$8665:  18			CLC				 
$8666:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$8668:  65 00		 ADC tmp0			; Temporary 0
$866A:  85 00		 STA tmp0			; Temporary 0
$866C:  C8			INY				 
$866D:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$866F:  65 01		 ADC tmp1			; Temporary 1
$8671:  85 01		 STA tmp1			; Temporary 1
$8673:  68			PLA				 
$8674:  A8			TAY				 
$8675:  E8			INX				 
$8676:  88			DEY				 
$8677:  10 DE		 BPL $8657		   
$8679:  60			RTS				 

; ------------------------------
sub_867A:
$867A:  A9 00		 LDA #$00			
$867C:  85 02		 STA tmp2			; Temporary 2
$867E:  85 03		 STA tmp3			; Temporary 3
$8680:  20 32 8A	  JSR $8A32		   
$8683:  A0 03		 LDY #$03			
$8685:  98			TYA				 
$8686:  48			PHA				 
$8687:  BD 6A 61	  LDA btl_action,X	; Battle action data
$868A:  10 28		 BPL $86B4		   
$868C:  29 0F		 AND #$0F			
$868E:  48			PHA				 
$868F:  20 B6 89	  JSR get_act		 ; Get action data
$8692:  68			PLA				 
$8693:  C9 09		 CMP #$09			
$8695:  90 06		 BCC $869D		   
$8697:  20 BB 86	  JSR $86BB		   
$869A:  4C A8 86	  JMP $86A8		   
$869D:  A0 0D		 LDY #$0D			
$869F:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$86A1:  29 03		 AND #$03			
$86A3:  8D 64 73	  STA $7364		   
$86A6:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$86A8:  18			CLC				 
$86A9:  65 02		 ADC tmp2			; Temporary 2
$86AB:  85 02		 STA tmp2			; Temporary 2
$86AD:  AD 64 73	  LDA $7364		   
$86B0:  65 03		 ADC tmp3			; Temporary 3
$86B2:  85 03		 STA tmp3			; Temporary 3
$86B4:  68			PLA				 
$86B5:  A8			TAY				 
$86B6:  E8			INX				 
$86B7:  88			DEY				 
$86B8:  10 CB		 BPL $8685		   
$86BA:  60			RTS				 

; ------------------------------
sub_86BB:
$86BB:  A0 05		 LDY #$05			
$86BD:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$86BF:  A0 0F		 LDY #$0F			
$86C1:  A2 04		 LDX #$04			
$86C3:  00			BRK				 
							  ; Data region
		.byte $13, $8F
$86C6:  60			RTS				 

; ------------------------------
sub_86C7:
$86C7:  20 9C 89	  JSR $899C		   
$86CA:  A0 0A		 LDY #$0A			
$86CC:  B1 86		 LDA (stat_ptr_lo),Y ; Stat table pointer low
$86CE:  85 00		 STA tmp0			; Temporary 0
$86D0:  C8			INY				 
$86D1:  B1 86		 LDA (stat_ptr_lo),Y ; Stat table pointer low
$86D3:  85 01		 STA tmp1			; Temporary 1
$86D5:  60			RTS				 

; ------------------------------
sub_86D6:
$86D6:  A5 82		 LDA inner_loop	  ; Inner loop counter
$86D8:  20 6B 8A	  JSR $8A6B		   
$86DB:  90 07		 BCC $86E4		   
$86DD:  A2 00		 LDX #$00			
$86DF:  A0 03		 LDY #$03			
$86E1:  4C 41 86	  JMP $8641		   
$86E4:  60			RTS				 

; ------------------------------
sub_86E5:
$86E5:  A9 00		 LDA #$00			
$86E7:  85 00		 STA tmp0			; Temporary 0
$86E9:  85 01		 STA tmp1			; Temporary 1
$86EB:  20 32 8A	  JSR $8A32		   
$86EE:  A0 03		 LDY #$03			
$86F0:  98			TYA				 
$86F1:  48			PHA				 
$86F2:  BD 6A 61	  LDA btl_action,X	; Battle action data
$86F5:  10 1B		 BPL $8712		   
$86F7:  29 0F		 AND #$0F			
$86F9:  20 B6 89	  JSR get_act		 ; Get action data
$86FC:  A0 00		 LDY #$00			
$86FE:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$8700:  10 10		 BPL $8712		   
$8702:  A0 03		 LDY #$03			
$8704:  18			CLC				 
$8705:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$8707:  65 00		 ADC tmp0			; Temporary 0
$8709:  85 00		 STA tmp0			; Temporary 0
$870B:  C8			INY				 
$870C:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$870E:  65 01		 ADC tmp1			; Temporary 1
$8710:  85 01		 STA tmp1			; Temporary 1
$8712:  68			PLA				 
$8713:  A8			TAY				 
$8714:  E8			INX				 
$8715:  88			DEY				 
$8716:  10 D8		 BPL $86F0		   
$8718:  60			RTS				 

; ------------------------------
sub_8719:
$8719:  A5 82		 LDA inner_loop	  ; Inner loop counter
$871B:  20 6B 8A	  JSR $8A6B		   
$871E:  90 16		 BCC $8736		   
sub_8720:
$8720:  20 F5 89	  JSR get_act_2	   ; Get secondary action
$8723:  A2 0C		 LDX #$0C			
$8725:  A0 01		 LDY #$01			
$8727:  20 41 86	  JSR $8641		   
$872A:  A0 05		 LDY #$05			
$872C:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$872E:  29 20		 AND #$20			
$8730:  F0 04		 BEQ $8736		   
$8732:  06 0C		 ASL $0C			 
$8734:  26 0D		 ROL $0D			 
$8736:  60			RTS				 

; ------------------------------
sub_8737:
$8737:  A9 D4		 LDA #$D4			
$8739:  D0 02		 BNE $873D		   
sub_873B:
$873B:  A9 14		 LDA #$14			
$873D:  85 0B		 STA $0B			 
$873F:  A9 00		 LDA #$00			
$8741:  85 0C		 STA $0C			 
$8743:  85 0D		 STA $0D			 
$8745:  20 32 8A	  JSR $8A32		   
$8748:  A0 03		 LDY #$03			
$874A:  98			TYA				 
$874B:  48			PHA				 
$874C:  8A			TXA				 
$874D:  48			PHA				 
$874E:  BD 6A 61	  LDA btl_action,X	; Battle action data
$8751:  10 29		 BPL $877C		   
$8753:  29 0F		 AND #$0F			
$8755:  20 48 8A	  JSR $8A48		   
$8758:  D0 22		 BNE $877C		   
$875A:  A5 00		 LDA tmp0			; Temporary 0
$875C:  20 F5 89	  JSR get_act_2	   ; Get secondary action
$875F:  A0 05		 LDY #$05			
$8761:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$8763:  25 0B		 AND $0B			 
$8765:  D0 15		 BNE $877C		   
$8767:  20 5D 8A	  JSR $8A5D		   
$876A:  D0 10		 BNE $877C		   
$876C:  A0 01		 LDY #$01			
$876E:  18			CLC				 
$876F:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$8771:  65 0C		 ADC $0C			 
$8773:  85 0C		 STA $0C			 
$8775:  C8			INY				 
$8776:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$8778:  65 0D		 ADC $0D			 
$877A:  85 0D		 STA $0D			 
$877C:  68			PLA				 
$877D:  AA			TAX				 
$877E:  68			PLA				 
$877F:  A8			TAY				 
$8780:  88			DEY				 
$8781:  10 C7		 BPL $874A		   
$8783:  60			RTS				 

; ------------------------------
sub_8784:
$8784:  A9 00		 LDA #$00			
$8786:  F0 02		 BEQ $878A		   
sub_8788:
$8788:  A9 C0		 LDA #$C0			
$878A:  85 01		 STA tmp1			; Temporary 1
$878C:  8A			TXA				 
$878D:  20 6B 8A	  JSR $8A6B		   
$8790:  90 26		 BCC $87B8		   
$8792:  85 00		 STA tmp0			; Temporary 0
$8794:  A9 00		 LDA #$00			
$8796:  85 0E		 STA $0E			 
$8798:  85 0F		 STA $0F			 
$879A:  A0 00		 LDY #$00			
$879C:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$879E:  10 18		 BPL $87B8		   
$87A0:  A5 00		 LDA tmp0			; Temporary 0
$87A2:  20 F5 89	  JSR get_act_2	   ; Get secondary action
$87A5:  A0 05		 LDY #$05			
$87A7:  A5 01		 LDA tmp1			; Temporary 1
$87A9:  31 79		 AND (action_ptr_lo),Y; Action data pointer low
$87AB:  D0 0B		 BNE $87B8		   
$87AD:  A0 03		 LDY #$03			
$87AF:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$87B1:  85 0E		 STA $0E			 
$87B3:  C8			INY				 
$87B4:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$87B6:  85 0F		 STA $0F			 
$87B8:  60			RTS				 

; ------------------------------
sub_87B9:
$87B9:  A2 00		 LDX #$00			
$87BB:  86 94		 STX $94			 
$87BD:  86 95		 STX $95			 
$87BF:  8A			TXA				 
$87C0:  48			PHA				 
$87C1:  20 88 87	  JSR $8788		   
$87C4:  18			CLC				 
$87C5:  A5 0E		 LDA $0E			 
$87C7:  65 94		 ADC $94			 
$87C9:  85 94		 STA $94			 
$87CB:  A5 0F		 LDA $0F			 
$87CD:  65 95		 ADC $95			 
$87CF:  85 95		 STA $95			 
$87D1:  68			PLA				 
$87D2:  AA			TAX				 
$87D3:  E8			INX				 
$87D4:  E0 04		 CPX #$04			
$87D6:  90 E7		 BCC $87BF		   
$87D8:  60			RTS				 

; ------------------------------
sub_87D9:
$87D9:  A9 00		 LDA #$00			
$87DB:  85 0E		 STA $0E			 
$87DD:  85 0F		 STA $0F			 
$87DF:  A2 07		 LDX #$07			
$87E1:  8A			TXA				 
$87E2:  48			PHA				 
$87E3:  20 9C 89	  JSR $899C		   
$87E6:  A0 06		 LDY #$06			
$87E8:  B1 86		 LDA (stat_ptr_lo),Y ; Stat table pointer low
$87EA:  29 C0		 AND #$C0			
$87EC:  C9 C0		 CMP #$C0			
$87EE:  D0 10		 BNE $8800		   
$87F0:  18			CLC				 
$87F1:  A0 03		 LDY #$03			
$87F3:  B1 86		 LDA (stat_ptr_lo),Y ; Stat table pointer low
$87F5:  65 0E		 ADC $0E			 
$87F7:  85 0E		 STA $0E			 
$87F9:  C8			INY				 
$87FA:  B1 86		 LDA (stat_ptr_lo),Y ; Stat table pointer low
$87FC:  65 0F		 ADC $0F			 
$87FE:  85 0F		 STA $0F			 
$8800:  68			PLA				 
$8801:  AA			TAX				 
$8802:  CA			DEX				 
$8803:  10 DC		 BPL $87E1		   
$8805:  60			RTS				 
$8806:  8A			TXA				 
$8807:  20 9C 89	  JSR $899C		   
$880A:  A0 03		 LDY #$03			
$880C:  A2 0C		 LDX #$0C			
$880E:  4C 19 88	  JMP $8819		   

; ------------------------------
sub_8811:
$8811:  8A			TXA				 
$8812:  20 9C 89	  JSR $899C		   
$8815:  A0 03		 LDY #$03			
$8817:  A2 0E		 LDX #$0E			
sub_8819:
$8819:  B1 86		 LDA (stat_ptr_lo),Y ; Stat table pointer low
$881B:  95 00		 STA $00,X		   
$881D:  C8			INY				 
$881E:  B1 86		 LDA (stat_ptr_lo),Y ; Stat table pointer low
sub_8820:
$8820:  95 01		 STA $01,X		   
$8822:  60			RTS				 

; ------------------------------
sub_8823:
$8823:  46 0F		 LSR $0F			 
$8825:  66 0E		 ROR $0E			 
$8827:  38			SEC				 
$8828:  A5 0C		 LDA $0C			 
$882A:  E5 0E		 SBC $0E			 
$882C:  85 94		 STA $94			 
$882E:  A5 0D		 LDA $0D			 
$8830:  E5 0F		 SBC $0F			 
$8832:  85 95		 STA $95			 
$8834:  B0 07		 BCS $883D		   
$8836:  A9 00		 LDA #$00			
$8838:  85 94		 STA $94			 
$883A:  85 95		 STA $95			 
$883C:  60			RTS				 
$883D:  46 95		 LSR $95			 
$883F:  66 94		 ROR $94			 
$8841:  60			RTS				 

; ------------------------------
sub_8842:
$8842:  20 66 88	  JSR $8866		   
$8845:  90 0E		 BCC $8855		   
$8847:  20 F5 89	  JSR get_act_2	   ; Get secondary action
$884A:  A2 0C		 LDX #$0C			
$884C:  A0 00		 LDY #$00			
$884E:  20 41 86	  JSR $8641		   
$8851:  A9 00		 LDA #$00			
$8853:  85 0D		 STA $0D			 
$8855:  60			RTS				 

; ------------------------------
sub_8856:
$8856:  8A			TXA				 
$8857:  20 9C 89	  JSR $899C		   
$885A:  A0 00		 LDY #$00			
$885C:  A2 0E		 LDX #$0E			
$885E:  20 19 88	  JSR $8819		   
$8861:  A9 00		 LDA #$00			
$8863:  85 0F		 STA $0F			 
$8865:  60			RTS				 

; ------------------------------
sub_8866:
$8866:  A5 82		 LDA inner_loop	  ; Inner loop counter
$8868:  4C 76 8A	  JMP $8A76		   

; ------------------------------
sub_886B:
$886B:  A9 0C		 LDA #$0C			
$886D:  85 07		 STA $07			 
$886F:  A9 80		 LDA #$80			
$8871:  85 08		 STA $08			 
$8873:  D0 0C		 BNE $8881		   
sub_8875:
$8875:  A9 CC		 LDA #$CC			
$8877:  D0 02		 BNE $887B		   
sub_8879:
$8879:  A9 0C		 LDA #$0C			
$887B:  85 07		 STA $07			 
$887D:  A9 00		 LDA #$00			
$887F:  85 08		 STA $08			 
$8881:  0A			ASL				 
$8882:  85 94		 STA $94			 
$8884:  85 95		 STA $95			 
$8886:  AD E4 72	  LDA $72E4		   
$8889:  30 34		 BMI $88BF		   
$888B:  20 32 8A	  JSR $8A32		   
$888E:  A0 03		 LDY #$03			
$8890:  98			TYA				 
$8891:  48			PHA				 
$8892:  BD 6A 61	  LDA btl_action,X	; Battle action data
$8895:  10 22		 BPL $88B9		   
$8897:  29 0F		 AND #$0F			
$8899:  C9 05		 CMP #$05			
$889B:  B0 1C		 BCS $88B9		   
$889D:  85 00		 STA tmp0			; Temporary 0
$889F:  20 48 8A	  JSR $8A48		   
$88A2:  D0 15		 BNE $88B9		   
$88A4:  A5 00		 LDA tmp0			; Temporary 0
$88A6:  20 F5 89	  JSR get_act_2	   ; Get secondary action
$88A9:  A0 05		 LDY #$05			
$88AB:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$88AD:  25 07		 AND $07			 
$88AF:  D0 08		 BNE $88B9		   
$88B1:  20 5D 8A	  JSR $8A5D		   
$88B4:  D0 03		 BNE $88B9		   
$88B6:  20 C0 88	  JSR $88C0		   
$88B9:  68			PLA				 
$88BA:  A8			TAY				 
$88BB:  E8			INX				 
$88BC:  88			DEY				 
$88BD:  10 D1		 BPL $8890		   
$88BF:  60			RTS				 

; ------------------------------
sub_88C0:
$88C0:  8A			TXA				 
$88C1:  48			PHA				 
$88C2:  A5 00		 LDA tmp0			; Temporary 0
$88C4:  20 B6 89	  JSR get_act		 ; Get action data
$88C7:  A0 03		 LDY #$03			
$88C9:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$88CB:  85 02		 STA tmp2			; Temporary 2
$88CD:  C8			INY				 
$88CE:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$88D0:  F0 04		 BEQ $88D6		   
$88D2:  A9 FF		 LDA #$FF			
$88D4:  85 02		 STA tmp2			; Temporary 2
$88D6:  A0 1B		 LDY #$1B			
$88D8:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$88DA:  85 04		 STA $04			 
$88DC:  C8			INY				 
$88DD:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$88DF:  85 05		 STA $05			 
$88E1:  C8			INY				 
$88E2:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$88E4:  85 06		 STA $06			 
$88E6:  A0 12		 LDY #$12			
$88E8:  A5 00		 LDA tmp0			; Temporary 0
$88EA:  F0 02		 BEQ $88EE		   
$88EC:  A0 0C		 LDY #$0C			
$88EE:  84 01		 STY tmp1			; Temporary 1
$88F0:  A6 00		 LDX tmp0			; Temporary 0
$88F2:  BD 2B 89	  LDA $892B,X		 
$88F5:  AA			TAX				 
$88F6:  46 06		 LSR $06			 
$88F8:  66 05		 ROR $05			 
$88FA:  66 04		 ROR $04			 
$88FC:  90 25		 BCC $8923		   
$88FE:  BD 28 B3	  LDA $B328,X		 
$8901:  A8			TAY				 
$8902:  B9 67 B9	  LDA enemy_res_tbl,Y ; Enemy resistance table
$8905:  29 1F		 AND #$1F			
$8907:  C5 02		 CMP tmp2			; Temporary 2
$8909:  F0 02		 BEQ $890D		   
$890B:  B0 16		 BCS $8923		   
$890D:  A5 08		 LDA $08			 
$890F:  10 06		 BPL $8917		   
$8911:  98			TYA				 
$8912:  20 30 B9	  JSR $B930		   
$8915:  90 0C		 BCC $8923		   
$8917:  B9 EF 8A	  LDA $8AEF,Y		 
$891A:  18			CLC				 
$891B:  65 94		 ADC $94			 
$891D:  85 94		 STA $94			 
$891F:  90 02		 BCC $8923		   
$8921:  E6 95		 INC $95			 
$8923:  E8			INX				 
$8924:  C6 01		 DEC tmp1			; Temporary 1
$8926:  D0 CE		 BNE $88F6		   
$8928:  68			PLA				 
$8929:  AA			TAX				 
$892A:  60			RTS				 
$892B:  00			BRK				 
							  ; Data region
		.byte $12
$892D:  1E 2A 36	  ASL $362A,X		 
sub_8930:
$8930:  A9 C4		 LDA #$C4			
$8932:  D0 02		 BNE $8936		   
sub_8934:
$8934:  A9 04		 LDA #$04			
$8936:  85 01		 STA tmp1			; Temporary 1
$8938:  A9 00		 LDA #$00			
$893A:  85 94		 STA $94			 
$893C:  85 95		 STA $95			 
$893E:  20 32 8A	  JSR $8A32		   
$8941:  A0 03		 LDY #$03			
$8943:  98			TYA				 
$8944:  48			PHA				 
$8945:  BD 6A 61	  LDA btl_action,X	; Battle action data
$8948:  10 27		 BPL $8971		   
$894A:  29 0F		 AND #$0F			
$894C:  C9 08		 CMP #$08			
$894E:  B0 21		 BCS $8971		   
$8950:  20 48 8A	  JSR $8A48		   
$8953:  D0 1C		 BNE $8971		   
$8955:  A5 00		 LDA tmp0			; Temporary 0
$8957:  20 F5 89	  JSR get_act_2	   ; Get secondary action
$895A:  A0 05		 LDY #$05			
$895C:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$895E:  25 01		 AND tmp1			; Temporary 1
$8960:  D0 0F		 BNE $8971		   
$8962:  C8			INY				 
$8963:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$8965:  29 20		 AND #$20			
$8967:  D0 08		 BNE $8971		   
$8969:  20 5D 8A	  JSR $8A5D		   
$896C:  D0 03		 BNE $8971		   
$896E:  20 77 89	  JSR $8977		   
$8971:  68			PLA				 
$8972:  A8			TAY				 
$8973:  88			DEY				 
$8974:  10 CD		 BPL $8943		   
$8976:  60			RTS				 

; ------------------------------
sub_8977:
$8977:  8A			TXA				 
$8978:  48			PHA				 
$8979:  A5 00		 LDA tmp0			; Temporary 0
$897B:  20 B6 89	  JSR get_act		 ; Get action data
$897E:  A0 13		 LDY #$13			
$8980:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$8982:  29 7F		 AND #$7F			
$8984:  C9 67		 CMP #$67			
$8986:  B0 0C		 BCS $8994		   
$8988:  AA			TAX				 
$8989:  BD 24 8B	  LDA $8B24,X		 
$898C:  65 94		 ADC $94			 
$898E:  85 94		 STA $94			 
$8990:  90 02		 BCC $8994		   
$8992:  E6 95		 INC $95			 
$8994:  C8			INY				 
$8995:  C0 1B		 CPY #$1B			
$8997:  90 E7		 BCC $8980		   
$8999:  68			PLA				 
$899A:  AA			TAX				 
$899B:  60			RTS				 

; ------------------------------
sub_899C:
$899C:  8A			TXA				 
$899D:  0A			ASL				 
$899E:  85 86		 STA stat_ptr_lo	 ; Stat table pointer low
$89A0:  0A			ASL				 
$89A1:  0A			ASL				 
$89A2:  0A			ASL				 
$89A3:  38			SEC				 
$89A4:  E5 86		 SBC stat_ptr_lo	 ; Stat table pointer low
$89A6:  18			CLC				 
$89A7:  6D B4 89	  ADC $89B4		   
$89AA:  85 86		 STA stat_ptr_lo	 ; Stat table pointer low
$89AC:  AD B5 89	  LDA $89B5		   
$89AF:  69 00		 ADC #$00			
$89B1:  85 87		 STA stat_ptr_hi	 ; Stat table pointer high
$89B3:  60			RTS				 
							  ; Data region
		.byte $74, $72

; --------------------------------------------------
; Get action data
; --------------------------------------------------
get_act:					 ; $89B6
$89B6:  85 79		 STA action_ptr_lo   ; Action data pointer low
$89B8:  8A			TXA				 
$89B9:  48			PHA				 
$89BA:  A5 79		 LDA action_ptr_lo   ; Action data pointer low
$89BC:  0A			ASL				 
$89BD:  AA			TAX				 
$89BE:  BD CB 89	  LDA $89CB,X		 
$89C1:  85 79		 STA action_ptr_lo   ; Action data pointer low
$89C3:  BD CC 89	  LDA $89CC,X		 
$89C6:  85 7A		 STA action_ptr_hi   ; Action data pointer high
$89C8:  68			PLA				 
$89C9:  AA			TAX				 
$89CA:  60			RTS				 
$89CB:  01 60		 ORA ($60,X)		 
							  ; Data region
		.byte $1F
$89CE:  60			RTS				 
$89CF:  3D 60 5B	  AND $5B60,X		 
$89D2:  60			RTS				 
$89D3:  79 60 97	  ADC $9760,Y		 
$89D6:  60			RTS				 
$89D7:  B5 60		 LDA $60,X		   
							  ; Data region
		.byte $D3
$89DA:  60			RTS				 
$89DB:  F1 60		 SBC ($60),Y		 
							  ; Data region
		.byte $0F
$89DE:  61 15		 ADC ($15,X)		 
$89E0:  61 1B		 ADC ($1B,X)		 
$89E2:  61 21		 ADC ($21,X)		 
$89E4:  61 27		 ADC ($27,X)		 
$89E6:  61 2D		 ADC ($2D,X)		 
$89E8:  61 33		 ADC ($33,X)		 
$89EA:  61 39		 ADC ($39,X)		 
$89EC:  61 3F		 ADC ($3F,X)		 
$89EE:  61 45		 ADC ($45,X)		 
$89F0:  61 4B		 ADC ($4B,X)		 
$89F2:  61 51		 ADC ($51,X)		 
$89F4:  61 85		 ADC ($85,X)		 
							  ; Data region
		.byte $7A
$89F7:  8A			TXA				 
$89F8:  48			PHA				 
$89F9:  A2 09		 LDX #$09			
$89FB:  BD EA 72	  LDA $72EA,X		 
$89FE:  10 06		 BPL $8A06		   
$8A00:  29 1F		 AND #$1F			
$8A02:  C5 7A		 CMP action_ptr_hi   ; Action data pointer high
$8A04:  F0 07		 BEQ $8A0D		   
$8A06:  CA			DEX				 
$8A07:  10 F2		 BPL $89FB		   
$8A09:  18			CLC				 
$8A0A:  68			PLA				 
$8A0B:  AA			TAX				 
$8A0C:  60			RTS				 
$8A0D:  8A			TXA				 
$8A0E:  0A			ASL				 
$8A0F:  AA			TAX				 
$8A10:  BD 1E 8A	  LDA $8A1E,X		 
$8A13:  85 79		 STA action_ptr_lo   ; Action data pointer low
$8A15:  BD 1F 8A	  LDA $8A1F,X		 
$8A18:  85 7A		 STA action_ptr_hi   ; Action data pointer high
$8A1A:  68			PLA				 
$8A1B:  AA			TAX				 
$8A1C:  38			SEC				 
$8A1D:  60			RTS				 
$8A1E:  10 72		 BPL $8A92		   
							  ; Data region
		.byte $1A, $72, $24, $72, $2E, $72, $38, $72, $42, $72
$8A2A:  4C 72 56	  JMP $5672		   
							  ; Data region
		.byte $72
$8A2E:  60			RTS				 
							  ; Data region
		.byte $72
$8A30:  6A			ROR				 
							  ; Data region
		.byte $72
sub_8A32:
$8A32:  A0 00		 LDY #$00			
$8A34:  AD 8E 61	  LDA btl_state	   ; Battle state flags
$8A37:  10 02		 BPL $8A3B		   
$8A39:  A0 04		 LDY #$04			
$8A3B:  2C 8E 61	  BIT btl_state	   ; Battle state flags
$8A3E:  50 05		 BVC $8A45		   
$8A40:  98			TYA				 
$8A41:  18			CLC				 
$8A42:  69 1C		 ADC #$1C			
$8A44:  A8			TAY				 
$8A45:  98			TYA				 
$8A46:  AA			TAX				 
$8A47:  60			RTS				 

; ------------------------------
sub_8A48:
$8A48:  85 00		 STA tmp0			; Temporary 0
$8A4A:  20 B6 89	  JSR get_act		 ; Get action data
$8A4D:  A0 00		 LDY #$00			
$8A4F:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$8A51:  29 C0		 AND #$C0			
$8A53:  C9 80		 CMP #$80			
$8A55:  60			RTS				 
$8A56:  A0 05		 LDY #$05			
$8A58:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$8A5A:  29 C4		 AND #$C4			
$8A5C:  60			RTS				 

; ------------------------------
sub_8A5D:
$8A5D:  A0 06		 LDY #$06			
$8A5F:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$8A61:  29 01		 AND #$01			
$8A63:  D0 05		 BNE $8A6A		   
$8A65:  C8			INY				 
$8A66:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$8A68:  29 40		 AND #$40			
$8A6A:  60			RTS				 

; ------------------------------
sub_8A6B:
$8A6B:  20 76 8A	  JSR $8A76		   
$8A6E:  08			PHP				 
$8A6F:  48			PHA				 
$8A70:  20 B6 89	  JSR get_act		 ; Get action data
$8A73:  68			PLA				 
$8A74:  28			PLP				 
$8A75:  60			RTS				 

; ------------------------------
sub_8A76:
$8A76:  8D 64 73	  STA $7364		   
$8A79:  20 32 8A	  JSR $8A32		   
$8A7C:  A0 00		 LDY #$00			
$8A7E:  BD 6A 61	  LDA btl_action,X	; Battle action data
$8A81:  10 05		 BPL $8A88		   
$8A83:  CE 64 73	  DEC $7364		   
$8A86:  30 08		 BMI $8A90		   
$8A88:  E8			INX				 
$8A89:  C8			INY				 
$8A8A:  C0 04		 CPY #$04			
$8A8C:  90 F0		 BCC $8A7E		   
$8A8E:  18			CLC				 
$8A8F:  60			RTS				 
$8A90:  29 1F		 AND #$1F			
$8A92:  38			SEC				 
$8A93:  60			RTS				 
$8A94:  20 AB 8A	  JSR $8AAB		   
$8A97:  90 10		 BCC $8AA9		   
$8A99:  8D 65 73	  STA $7365		   
$8A9C:  20 32 8A	  JSR $8A32		   
$8A9F:  A0 00		 LDY #$00			
$8AA1:  20 D3 8A	  JSR $8AD3		   
$8AA4:  90 03		 BCC $8AA9		   
$8AA6:  98			TYA				 
$8AA7:  38			SEC				 
$8AA8:  60			RTS				 
$8AA9:  18			CLC				 
$8AAA:  60			RTS				 

; ------------------------------
sub_8AAB:
$8AAB:  AA			TAX				 
$8AAC:  BD EA 72	  LDA $72EA,X		 
$8AAF:  10 F8		 BPL $8AA9		   
$8AB1:  29 1F		 AND #$1F			
$8AB3:  38			SEC				 
$8AB4:  60			RTS				 

; ------------------------------
sub_8AB5:
$8AB5:  20 66 88	  JSR $8866		   
$8AB8:  90 14		 BCC $8ACE		   
sub_8ABA:
$8ABA:  8D 64 73	  STA $7364		   
$8ABD:  A2 09		 LDX #$09			
$8ABF:  BD EA 72	  LDA $72EA,X		 
$8AC2:  10 07		 BPL $8ACB		   
$8AC4:  29 7F		 AND #$7F			
$8AC6:  CD 64 73	  CMP $7364		   
$8AC9:  F0 05		 BEQ $8AD0		   
$8ACB:  CA			DEX				 
$8ACC:  10 F1		 BPL $8ABF		   
$8ACE:  18			CLC				 
$8ACF:  60			RTS				 
$8AD0:  38			SEC				 
$8AD1:  8A			TXA				 
$8AD2:  60			RTS				 

; ------------------------------
sub_8AD3:
$8AD3:  A9 03		 LDA #$03			
$8AD5:  8D 64 73	  STA $7364		   
$8AD8:  BD 6A 61	  LDA btl_action,X	; Battle action data
$8ADB:  10 08		 BPL $8AE5		   
$8ADD:  29 1F		 AND #$1F			
$8ADF:  CD 65 73	  CMP $7365		   
$8AE2:  F0 09		 BEQ $8AED		   
$8AE4:  C8			INY				 
$8AE5:  E8			INX				 
$8AE6:  CE 64 73	  DEC $7364		   
$8AE9:  10 ED		 BPL $8AD8		   
$8AEB:  18			CLC				 
$8AEC:  60			RTS				 
$8AED:  38			SEC				 
$8AEE:  60			RTS				 
$8AEF:  01 01		 ORA ($01,X)		 
$8AF1:  01 01		 ORA ($01,X)		 
$8AF3:  01 01		 ORA ($01,X)		 
$8AF5:  01 01		 ORA ($01,X)		 
$8AF7:  01 01		 ORA ($01,X)		 
$8AF9:  01 01		 ORA ($01,X)		 
$8AFB:  01 01		 ORA ($01,X)		 
$8AFD:  01 01		 ORA ($01,X)		 
$8AFF:  01 01		 ORA ($01,X)		 
$8B01:  01 01		 ORA ($01,X)		 
$8B03:  01 01		 ORA ($01,X)		 
$8B05:  01 01		 ORA ($01,X)		 
$8B07:  01 01		 ORA ($01,X)		 
$8B09:  01 01		 ORA ($01,X)		 
$8B0B:  01 01		 ORA ($01,X)		 
$8B0D:  01 01		 ORA ($01,X)		 
$8B0F:  01 01		 ORA ($01,X)		 
$8B11:  01 01		 ORA ($01,X)		 
$8B13:  01 01		 ORA ($01,X)		 
$8B15:  01 01		 ORA ($01,X)		 
$8B17:  01 01		 ORA ($01,X)		 
$8B19:  01 01		 ORA ($01,X)		 
$8B1B:  01 01		 ORA ($01,X)		 
$8B1D:  01 01		 ORA ($01,X)		 
$8B1F:  01 01		 ORA ($01,X)		 
$8B21:  01 01		 ORA ($01,X)		 
$8B23:  01 00		 ORA ($00,X)		 
$8B25:  00			BRK				 
$8B26:  00			BRK				 
$8B27:  00			BRK				 
$8B28:  00			BRK				 
$8B29:  00			BRK				 
$8B2A:  00			BRK				 
$8B2B:  00			BRK				 
$8B2C:  00			BRK				 
$8B2D:  00			BRK				 
$8B2E:  00			BRK				 
$8B2F:  01 00		 ORA ($00,X)		 
$8B31:  00			BRK				 
$8B32:  00			BRK				 
$8B33:  00			BRK				 
$8B34:  00			BRK				 
							  ; Data region
		.byte $02
$8B36:  00			BRK				 
$8B37:  00			BRK				 
$8B38:  00			BRK				 
$8B39:  00			BRK				 
$8B3A:  00			BRK				 
							  ; Data region
		.byte $03, $04
$8B3D:  00			BRK				 
$8B3E:  05 06		 ORA $06			 
$8B40:  00			BRK				 
							  ; Data region
		.byte $07
$8B42:  08			PHP				 
$8B43:  09 0A		 ORA #$0A			
							  ; Data region
		.byte $0B, $0C
$8B47:  0D 00 00	  ORA tmp0			; Temporary 0
$8B4A:  00			BRK				 
$8B4B:  00			BRK				 
$8B4C:  00			BRK				 
$8B4D:  00			BRK				 
$8B4E:  00			BRK				 
$8B4F:  00			BRK				 
$8B50:  00			BRK				 
$8B51:  00			BRK				 
$8B52:  00			BRK				 
$8B53:  00			BRK				 
$8B54:  00			BRK				 
$8B55:  00			BRK				 
$8B56:  00			BRK				 
$8B57:  00			BRK				 
$8B58:  00			BRK				 
$8B59:  00			BRK				 
$8B5A:  00			BRK				 
$8B5B:  00			BRK				 
$8B5C:  00			BRK				 
$8B5D:  00			BRK				 
$8B5E:  00			BRK				 
$8B5F:  00			BRK				 
$8B60:  00			BRK				 
$8B61:  00			BRK				 
$8B62:  00			BRK				 
$8B63:  00			BRK				 
$8B64:  0E 00 0F	  ASL $0F00		   
$8B67:  00			BRK				 
$8B68:  10 11		 BPL $8B7B		   
$8B6A:  00			BRK				 
$8B6B:  00			BRK				 
$8B6C:  00			BRK				 
$8B6D:  00			BRK				 
$8B6E:  00			BRK				 
$8B6F:  00			BRK				 
$8B70:  00			BRK				 
$8B71:  00			BRK				 
$8B72:  00			BRK				 
$8B73:  00			BRK				 
							  ; Data region
		.byte $12, $13
$8B76:  00			BRK				 
							  ; Data region
		.byte $14
$8B78:  15 16		 ORA $16,X		   
							  ; Data region
		.byte $17
$8B7B:  18			CLC				 
$8B7C:  19 1A 1B	  ORA $1B1A,Y		 
							  ; Data region
		.byte $1C
$8B80:  1D 1E 1F	  ORA $1F1E,X		 
$8B83:  20 21 22	  JSR $2221		   
							  ; Data region
		.byte $23
$8B87:  24 25		 BIT $25			 
$8B89:  26 27		 ROL $27			 
							  ; Data region
		.byte $5A
$8B8C:  8C 5A 8C	  STY $8C5A		   
							  ; Data region
		.byte $5A
$8B90:  8C 60 8C	  STY $8C60		   
$8B93:  60			RTS				 
$8B94:  8C 60 8C	  STY $8C60		   
$8B97:  60			RTS				 
$8B98:  8C 5A 8C	  STY $8C5A		   
$8B9B:  60			RTS				 
$8B9C:  8C 60 8C	  STY $8C60		   
$8B9F:  60			RTS				 
$8BA0:  8C 60 8C	  STY $8C60		   
$8BA3:  60			RTS				 
$8BA4:  8C 80 8C	  STY $8C80		   
$8BA7:  8E 8C 59	  STX $598C		   
$8BAA:  8C 75 B1	  STY $B175		   
$8BAD:  95 B1		 STA $B1,X		   
							  ; Data region
		.byte $5F
$8BB0:  B1 6A		 LDA ($6A),Y		 
$8BB2:  B1 B8		 LDA ($B8),Y		 
$8BB4:  B1 61		 LDA ($61),Y		 
$8BB6:  B4 42		 LDY $42,X		   
$8BB8:  B4 4B		 LDY $4B,X		   
$8BBA:  B4 A3		 LDY $A3,X		   
							  ; Data region
		.byte $B2
$8BBD:  59 8C 4C	  EOR $4C8C,Y		 
							  ; Data region
		.byte $B2, $57, $B2
$8BC3:  59 8C 59	  EOR $598C,Y		 
$8BC6:  8C 59 8C	  STY $8C59		   
$8BC9:  D8			CLD				 
$8BCA:  8C D8 8C	  STY $8CD8		   
$8BCD:  D8			CLD				 
$8BCE:  8C D8 8C	  STY $8CD8		   
$8BD1:  D8			CLD				 
$8BD2:  8C D8 8C	  STY $8CD8		   
$8BD5:  D8			CLD				 
$8BD6:  8C D8 8C	  STY $8CD8		   
$8BD9:  D8			CLD				 
$8BDA:  8C D8 8C	  STY $8CD8		   
$8BDD:  D8			CLD				 
$8BDE:  8C 59 8C	  STY $8C59		   
$8BE1:  59 8C 59	  EOR $598C,Y		 
$8BE4:  8C 59 8C	  STY $8C59		   
$8BE7:  59 8C 59	  EOR $598C,Y		 
$8BEA:  8C 59 8C	  STY $8C59		   
$8BED:  59 8C 92	  EOR $928C,Y		 
							  ; Data region
		.byte $B3, $B2, $B3
$8BF3:  CA			DEX				 
							  ; Data region
		.byte $B3, $FB, $B3
$8BF7:  21 B4		 AND ($B4,X)		 
$8BF9:  24 B4		 BIT $B4			 
							  ; Data region
		.byte $AB, $B2, $AB, $B2, $AB, $B2, $62, $B2
$8C03:  69 8C		 ADC #$8C			
$8C05:  69 8C		 ADC #$8C			
$8C07:  69 8C		 ADC #$8C			
$8C09:  69 8C		 ADC #$8C			
$8C0B:  69 8C		 ADC #$8C			
$8C0D:  69 8C		 ADC #$8C			
$8C0F:  EE B1 61	  INC btl_turn		; Battle turn counter
$8C12:  B4 29		 LDY $29,X		   
							  ; Data region
		.byte $B2
$8C15:  09 B2		 ORA #$B2			
							  ; Data region
		.byte $3B, $B2
$8C19:  59 8C 61	  EOR $618C,Y		 
$8C1C:  B4 61		 LDY $61,X		   
$8C1E:  B4 61		 LDY $61,X		   
$8C20:  B4 61		 LDY $61,X		   
$8C22:  B4 61		 LDY $61,X		   
$8C24:  B4 61		 LDY $61,X		   
$8C26:  B4 61		 LDY $61,X		   
$8C28:  B4 61		 LDY $61,X		   
$8C2A:  B4 61		 LDY $61,X		   
$8C2C:  B4 61		 LDY $61,X		   
$8C2E:  B4 61		 LDY $61,X		   
$8C30:  B4 61		 LDY $61,X		   
$8C32:  B4 61		 LDY $61,X		   
$8C34:  B4 61		 LDY $61,X		   
$8C36:  B4 61		 LDY $61,X		   
$8C38:  B4 61		 LDY $61,X		   
$8C3A:  B4 61		 LDY $61,X		   
$8C3C:  B4 61		 LDY $61,X		   
$8C3E:  B4 61		 LDY $61,X		   
$8C40:  B4 61		 LDY $61,X		   
$8C42:  B4 72		 LDY $72,X		   
$8C44:  8C 94 8C	  STY $8C94		   
$8C47:  61 B4		 ADC ($B4,X)		 
$8C49:  01 8D		 ORA ($8D,X)		 
$8C4B:  01 8D		 ORA ($8D,X)		 
$8C4D:  59 8C 7D	  EOR $7D8C,Y		 
							  ; Data region
		.byte $B2, $7C
$8C52:  8C 92 B3	  STY $B392		   
$8C55:  01 8D		 ORA ($8D,X)		 
$8C57:  98			TYA				 
							  ; Data region
		.byte $B2
$8C59:  60			RTS				 
$8C5A:  20 BC 8C	  JSR $8CBC		   
$8C5D:  4C 4B 82	  JMP $824B		   
$8C60:  20 BC 8C	  JSR $8CBC		   
$8C63:  20 C5 81	  JSR $81C5		   
$8C66:  4C 4B 82	  JMP $824B		   
$8C69:  20 BC 8C	  JSR $8CBC		   
$8C6C:  20 C5 81	  JSR $81C5		   
$8C6F:  4C 60 82	  JMP $8260		   
$8C72:  A9 14		 LDA #$14			
$8C74:  85 94		 STA $94			 
sub_8C76:
$8C76:  A9 00		 LDA #$00			
$8C78:  85 95		 STA $95			 
$8C7A:  F0 F0		 BEQ $8C6C		   
$8C7C:  A9 1C		 LDA #$1C			
$8C7E:  D0 F6		 BNE $8C76		   
$8C80:  20 A5 8C	  JSR $8CA5		   
$8C83:  20 E0 81	  JSR $81E0		   
$8C86:  A9 06		 LDA #$06			
$8C88:  20 98 81	  JSR scale_stat	  ; Scale stat value
$8C8B:  4C 4B 82	  JMP $824B		   
$8C8E:  20 A5 8C	  JSR $8CA5		   
$8C91:  4C 86 8C	  JMP $8C86		   
$8C94:  20 4C 86	  JSR $864C		   
$8C97:  A5 00		 LDA tmp0			; Temporary 0
$8C99:  85 94		 STA $94			 
$8C9B:  A5 01		 LDA tmp1			; Temporary 1
$8C9D:  85 95		 STA $95			 
$8C9F:  20 E0 81	  JSR $81E0		   
$8CA2:  4C 60 82	  JMP $8260		   

; ------------------------------
sub_8CA5:
$8CA5:  20 4C 86	  JSR $864C		   
$8CA8:  20 7A 86	  JSR $867A		   
$8CAB:  18			CLC				 
$8CAC:  A5 00		 LDA tmp0			; Temporary 0
$8CAE:  65 02		 ADC tmp2			; Temporary 2
$8CB0:  85 94		 STA $94			 
$8CB2:  A5 01		 LDA tmp1			; Temporary 1
$8CB4:  65 03		 ADC tmp3			; Temporary 3
$8CB6:  4A			LSR				 
$8CB7:  85 95		 STA $95			 
$8CB9:  66 94		 ROR $94			 
$8CBB:  60			RTS				 

; ------------------------------
sub_8CBC:
$8CBC:  A9 00		 LDA #$00			
$8CBE:  85 95		 STA $95			 
$8CC0:  AD 99 75	  LDA $7599		   
$8CC3:  0A			ASL				 
$8CC4:  AA			TAX				 
$8CC5:  E0 78		 CPX #$78			
$8CC7:  B0 06		 BCS $8CCF		   
$8CC9:  BD BD B7	  LDA $B7BD,X		 
$8CCC:  85 94		 STA $94			 
$8CCE:  60			RTS				 
$8CCF:  E9 78		 SBC #$78			
$8CD1:  AA			TAX				 
$8CD2:  BD D7 B7	  LDA $B7D7,X		 
$8CD5:  85 94		 STA $94			 
$8CD7:  60			RTS				 
$8CD8:  AE 99 75	  LDX $7599		   
$8CDB:  BD 0B 8D	  LDA $8D0B,X		 
$8CDE:  F0 20		 BEQ $8D00		   
$8CE0:  85 00		 STA tmp0			; Temporary 0
$8CE2:  AD AB 75	  LDA $75AB		   
$8CE5:  05 00		 ORA tmp0			; Temporary 0
$8CE7:  8D AB 75	  STA $75AB		   
$8CEA:  A5 00		 LDA tmp0			; Temporary 0
$8CEC:  A0 FF		 LDY #$FF			
$8CEE:  C8			INY				 
$8CEF:  4A			LSR				 
$8CF0:  90 FC		 BCC $8CEE		   
$8CF2:  18			CLC				 
$8CF3:  AD 9A 75	  LDA $759A		   
$8CF6:  79 C1 75	  ADC $75C1,Y		 
$8CF9:  90 02		 BCC $8CFD		   
$8CFB:  A9 FF		 LDA #$FF			
$8CFD:  99 C1 75	  STA $75C1,Y		 
$8D00:  60			RTS				 
$8D01:  AE 99 75	  LDX $7599		   
$8D04:  BD D6 8C	  LDA $8CD6,X		 
$8D07:  F0 20		 BEQ $8D29		   
$8D09:  85 00		 STA tmp0			; Temporary 0
$8D0B:  AD AC 75	  LDA $75AC		   
$8D0E:  05 00		 ORA tmp0			; Temporary 0
$8D10:  8D AC 75	  STA $75AC		   
$8D13:  A5 00		 LDA tmp0			; Temporary 0
$8D15:  A0 FF		 LDY #$FF			
$8D17:  C8			INY				 
$8D18:  4A			LSR				 
$8D19:  90 FC		 BCC $8D17		   
$8D1B:  18			CLC				 
$8D1C:  AD 9A 75	  LDA $759A		   
$8D1F:  79 C9 75	  ADC $75C9,Y		 
$8D22:  90 02		 BCC $8D26		   
$8D24:  A9 FF		 LDA #$FF			
$8D26:  99 C9 75	  STA $75C9,Y		 
$8D29:  60			RTS				 
$8D2A:  08			PHP				 
$8D2B:  10 80		 BPL $8CAD		   
$8D2D:  01 01		 ORA ($01,X)		 
$8D2F:  01 02		 ORA ($02,X)		 
							  ; Data region
		.byte $02, $02
$8D33:  20 40 02	  JSR $0240		   
$8D36:  10 00		 BPL $8D38		   
$8D38:  00			BRK				 
$8D39:  00			BRK				 
$8D3A:  00			BRK				 
$8D3B:  01 20		 ORA ($20,X)		 
$8D3D:  91 8D		 STA ($8D),Y		 
$8D3F:  A9 00		 LDA #$00			
$8D41:  8D D0 77	  STA $77D0		   
$8D44:  8D D1 77	  STA $77D1		   
$8D47:  A5 93		 LDA btl_flags	   ; Battle calculation flags
$8D49:  85 81		 STA party_loop	  ; Party loop counter
$8D4B:  20 69 8D	  JSR $8D69		   
$8D4E:  F0 18		 BEQ $8D68		   
$8D50:  20 77 8D	  JSR setup_ptr	   ; Setup char pointer
$8D53:  20 E7 8D	  JSR $8DE7		   
$8D56:  20 0B 8E	  JSR $8E0B		   
$8D59:  20 42 8E	  JSR $8E42		   
$8D5C:  20 5F 8E	  JSR $8E5F		   
$8D5F:  20 9E 8E	  JSR $8E9E		   
$8D62:  20 CE 8E	  JSR $8ECE		   
$8D65:  20 16 8F	  JSR $8F16		   
$8D68:  60			RTS				 

; ------------------------------
sub_8D69:
$8D69:  A6 81		 LDX party_loop	  ; Party loop counter
$8D6B:  BD 5E FF	  LDA $FF5E,X		 
$8D6E:  2D 78 75	  AND $7578		   
$8D71:  F0 03		 BEQ $8D76		   
$8D73:  BD 79 75	  LDA $7579,X		 
$8D76:  60			RTS				 

; --------------------------------------------------
; Setup char pointer
; --------------------------------------------------
setup_ptr:					 ; $8D77
$8D77:  A9 3A		 LDA #$3A			
$8D79:  85 88		 STA char_ptr_lo	 ; Character data pointer low
$8D7B:  A9 00		 LDA #$00			
$8D7D:  85 89		 STA char_ptr_hi	 ; Character data pointer high
$8D7F:  A5 81		 LDA party_loop	  ; Party loop counter
$8D81:  A2 88		 LDX #$88			
$8D83:  20 27 C8	  JSR $C827		   
$8D86:  AD 8F 8D	  LDA $8D8F		   
$8D89:  AC 90 8D	  LDY $8D90		   
$8D8C:  4C 1D C8	  JMP $C81D		   
$8D8F:  00			BRK				 
$8D90:  76 A9		 ROR $A9,X		   
$8D92:  00			BRK				 
$8D93:  8D D0 77	  STA $77D0		   
$8D96:  A0 00		 LDY #$00			
$8D98:  B9 91 75	  LDA $7591,Y		 
$8D9B:  48			PHA				 
$8D9C:  98			TYA				 
$8D9D:  0A			ASL				 
$8D9E:  AA			TAX				 
$8D9F:  BD A3 75	  LDA $75A3,X		 
$8DA2:  85 94		 STA $94			 
$8DA4:  BD A4 75	  LDA $75A4,X		 
$8DA7:  85 95		 STA $95			 
$8DA9:  68			PLA				 
$8DAA:  20 98 81	  JSR scale_stat	  ; Scale stat value
$8DAD:  A5 94		 LDA $94			 
$8DAF:  05 95		 ORA $95			 
$8DB1:  F0 11		 BEQ $8DC4		   
$8DB3:  A5 92		 LDA $92			 
$8DB5:  0A			ASL				 
$8DB6:  0A			ASL				 
$8DB7:  6D D0 77	  ADC $77D0		   
$8DBA:  AA			TAX				 
$8DBB:  BD D3 8D	  LDA $8DD3,X		 
$8DBE:  20 98 81	  JSR scale_stat	  ; Scale stat value
$8DC1:  EE D0 77	  INC $77D0		   
$8DC4:  98			TYA				 
$8DC5:  0A			ASL				 
$8DC6:  AA			TAX				 
$8DC7:  A5 94		 LDA $94			 
$8DC9:  9D A3 75	  STA $75A3,X		 
$8DCC:  A5 95		 LDA $95			 
$8DCE:  9D A4 75	  STA $75A4,X		 
$8DD1:  C8			INY				 
$8DD2:  C0 04		 CPY #$04			
$8DD4:  90 C2		 BCC $8D98		   
$8DD6:  60			RTS				 
$8DD7:  10 00		 BPL $8DD9		   
$8DD9:  00			BRK				 
$8DDA:  00			BRK				 
$8DDB:  09 07		 ORA #$07			
$8DDD:  00			BRK				 
$8DDE:  00			BRK				 
							  ; Data region
		.byte $07
$8DE0:  05 04		 ORA $04			 
$8DE2:  00			BRK				 
							  ; Data region
		.byte $07
$8DE4:  05 03		 ORA tmp3			; Temporary 3
$8DE6:  01 A9		 ORA ($A9,X)		 
							  ; Data region
		.byte $03
$8DE9:  85 82		 STA inner_loop	  ; Inner loop counter
$8DEB:  A5 82		 LDA inner_loop	  ; Inner loop counter
$8DED:  0A			ASL				 
$8DEE:  A8			TAY				 
$8DEF:  B9 A3 75	  LDA $75A3,Y		 
$8DF2:  85 94		 STA $94			 
$8DF4:  B9 A4 75	  LDA $75A4,Y		 
$8DF7:  85 95		 STA $95			 
$8DF9:  A6 81		 LDX party_loop	  ; Party loop counter
$8DFB:  BD 89 75	  LDA $7589,X		 
$8DFE:  20 98 81	  JSR scale_stat	  ; Scale stat value
$8E01:  A0 00		 LDY #$00			
$8E03:  20 1D 83	  JSR $831D		   
$8E06:  C6 82		 DEC inner_loop	  ; Inner loop counter
$8E08:  10 E1		 BPL $8DEB		   
$8E0A:  60			RTS				 

; ------------------------------
sub_8E0B:
$8E0B:  AD AD 75	  LDA btl_ad		  ; Battle stat AD
$8E0E:  85 00		 STA tmp0			; Temporary 0
$8E10:  AD AE 75	  LDA $75AE		   
$8E13:  85 01		 STA tmp1			; Temporary 1
$8E15:  A6 81		 LDX party_loop	  ; Party loop counter
$8E17:  BD 81 75	  LDA $7581,X		 
$8E1A:  F0 25		 BEQ $8E41		   
$8E1C:  A2 00		 LDX #$00			
$8E1E:  20 9A 81	  JSR $819A		   
$8E21:  20 16 82	  JSR $8216		   
$8E24:  A9 03		 LDA #$03			
$8E26:  85 82		 STA inner_loop	  ; Inner loop counter
$8E28:  A5 00		 LDA tmp0			; Temporary 0
$8E2A:  85 94		 STA $94			 
$8E2C:  A5 01		 LDA tmp1			; Temporary 1
$8E2E:  85 95		 STA $95			 
$8E30:  A6 82		 LDX inner_loop	  ; Inner loop counter
$8E32:  BD 95 75	  LDA $7595,X		 
$8E35:  20 98 81	  JSR scale_stat	  ; Scale stat value
$8E38:  A0 08		 LDY #$08			
$8E3A:  20 1D 83	  JSR $831D		   
$8E3D:  C6 82		 DEC inner_loop	  ; Inner loop counter
$8E3F:  10 E7		 BPL $8E28		   
$8E41:  60			RTS				 

; ------------------------------
sub_8E42:
$8E42:  AD AF 75	  LDA $75AF		   
$8E45:  85 94		 STA $94			 
$8E47:  AD B0 75	  LDA $75B0		   
$8E4A:  85 95		 STA $95			 
$8E4C:  A6 81		 LDX party_loop	  ; Party loop counter
$8E4E:  20 E0 81	  JSR $81E0		   
$8E51:  A9 03		 LDA #$03			
$8E53:  85 82		 STA inner_loop	  ; Inner loop counter
$8E55:  A0 10		 LDY #$10			
$8E57:  20 1D 83	  JSR $831D		   
$8E5A:  C6 82		 DEC inner_loop	  ; Inner loop counter
$8E5C:  10 F7		 BPL $8E55		   
$8E5E:  60			RTS				 

; ------------------------------
sub_8E5F:
$8E5F:  AD B1 75	  LDA $75B1		   
$8E62:  AE B2 75	  LDX $75B2		   
$8E65:  A0 18		 LDY #$18			
$8E67:  20 88 8E	  JSR $8E88		   
$8E6A:  AD B5 75	  LDA $75B5		   
$8E6D:  AE B6 75	  LDX $75B6		   
$8E70:  A0 1C		 LDY #$1C			
$8E72:  20 88 8E	  JSR $8E88		   
$8E75:  AD B9 75	  LDA $75B9		   
$8E78:  AE BA 75	  LDX $75BA		   
$8E7B:  A0 20		 LDY #$20			
$8E7D:  20 88 8E	  JSR $8E88		   
$8E80:  AD BD 75	  LDA $75BD		   
$8E83:  AE BE 75	  LDX $75BE		   
$8E86:  A0 36		 LDY #$36			
sub_8E88:
$8E88:  85 94		 STA $94			 
$8E8A:  86 95		 STX $95			 
$8E8C:  A6 81		 LDX party_loop	  ; Party loop counter
$8E8E:  BD 81 75	  LDA $7581,X		 
$8E91:  20 98 81	  JSR scale_stat	  ; Scale stat value
$8E94:  A5 94		 LDA $94			 
$8E96:  91 88		 STA (char_ptr_lo),Y ; Character data pointer low
$8E98:  C8			INY				 
$8E99:  A5 95		 LDA $95			 
$8E9B:  91 88		 STA (char_ptr_lo),Y ; Character data pointer low
$8E9D:  60			RTS				 

; ------------------------------
sub_8E9E:
$8E9E:  AD B3 75	  LDA $75B3		   
$8EA1:  AE B4 75	  LDX $75B4		   
$8EA4:  A0 1A		 LDY #$1A			
$8EA6:  20 C7 8E	  JSR $8EC7		   
$8EA9:  AD B7 75	  LDA $75B7		   
$8EAC:  AE B8 75	  LDX $75B8		   
$8EAF:  A0 1E		 LDY #$1E			
$8EB1:  20 C7 8E	  JSR $8EC7		   
$8EB4:  AD BB 75	  LDA $75BB		   
$8EB7:  AE BC 75	  LDX $75BC		   
$8EBA:  A0 22		 LDY #$22			
$8EBC:  20 C7 8E	  JSR $8EC7		   
$8EBF:  AD BF 75	  LDA $75BF		   
$8EC2:  AE C0 75	  LDX $75C0		   
$8EC5:  A0 38		 LDY #$38			
sub_8EC7:
$8EC7:  91 88		 STA (char_ptr_lo),Y ; Character data pointer low
$8EC9:  C8			INY				 
$8ECA:  8A			TXA				 
$8ECB:  91 88		 STA (char_ptr_lo),Y ; Character data pointer low
$8ECD:  60			RTS				 

; ------------------------------
sub_8ECE:
$8ECE:  A2 07		 LDX #$07			
$8ED0:  A0 2C		 LDY #$2C			
$8ED2:  BD C1 75	  LDA $75C1,X		 
$8ED5:  91 88		 STA (char_ptr_lo),Y ; Character data pointer low
$8ED7:  88			DEY				 
$8ED8:  CA			DEX				 
$8ED9:  10 F7		 BPL $8ED2		   
$8EDB:  A2 07		 LDX #$07			
$8EDD:  A0 35		 LDY #$35			
$8EDF:  BD C9 75	  LDA $75C9,X		 
$8EE2:  91 88		 STA (char_ptr_lo),Y ; Character data pointer low
$8EE4:  88			DEY				 
$8EE5:  CA			DEX				 
$8EE6:  10 F7		 BPL $8EDF		   
$8EE8:  A0 24		 LDY #$24			
$8EEA:  AD AB 75	  LDA $75AB		   
$8EED:  91 88		 STA (char_ptr_lo),Y ; Character data pointer low
$8EEF:  A0 2D		 LDY #$2D			
$8EF1:  AD AC 75	  LDA $75AC		   
$8EF4:  91 88		 STA (char_ptr_lo),Y ; Character data pointer low
$8EF6:  A6 81		 LDX party_loop	  ; Party loop counter
$8EF8:  BD 81 75	  LDA $7581,X		 
$8EFB:  85 00		 STA tmp0			; Temporary 0
$8EFD:  A0 25		 LDY #$25			
$8EFF:  B1 88		 LDA (char_ptr_lo),Y ; Character data pointer low
$8F01:  85 94		 STA $94			 
$8F03:  A9 00		 LDA #$00			
$8F05:  85 95		 STA $95			 
$8F07:  A5 00		 LDA tmp0			; Temporary 0
$8F09:  20 98 81	  JSR scale_stat	  ; Scale stat value
$8F0C:  A5 94		 LDA $94			 
$8F0E:  91 88		 STA (char_ptr_lo),Y ; Character data pointer low
$8F10:  C8			INY				 
$8F11:  C0 2D		 CPY #$2D			
$8F13:  90 EA		 BCC $8EFF		   
$8F15:  60			RTS				 

; ------------------------------
sub_8F16:
$8F16:  A0 38		 LDY #$38			
$8F18:  B1 88		 LDA (char_ptr_lo),Y ; Character data pointer low
$8F1A:  69 10		 ADC #$10			
$8F1C:  91 88		 STA (char_ptr_lo),Y ; Character data pointer low
$8F1E:  C8			INY				 
$8F1F:  B1 88		 LDA (char_ptr_lo),Y ; Character data pointer low
$8F21:  69 00		 ADC #$00			
$8F23:  91 88		 STA (char_ptr_lo),Y ; Character data pointer low
$8F25:  60			RTS				 
$8F26:  A9 07		 LDA #$07			
$8F28:  85 81		 STA party_loop	  ; Party loop counter
$8F2A:  20 77 8D	  JSR setup_ptr	   ; Setup char pointer
$8F2D:  A2 06		 LDX #$06			
$8F2F:  BD EC 90	  LDA $90EC,X		 
$8F32:  20 D0 90	  JSR $90D0		   
$8F35:  CA			DEX				 
$8F36:  10 F7		 BPL $8F2F		   
$8F38:  A2 0A		 LDX #$0A			
$8F3A:  BD F4 90	  LDA $90F4,X		 
$8F3D:  20 D4 90	  JSR $90D4		   
$8F40:  CA			DEX				 
$8F41:  10 F7		 BPL $8F3A		   
$8F43:  20 B6 90	  JSR $90B6		   
$8F46:  C6 81		 DEC party_loop	  ; Party loop counter
$8F48:  10 E0		 BPL $8F2A		   
$8F4A:  20 E8 A4	  JSR $A4E8		   
$8F4D:  20 21 90	  JSR $9021		   
$8F50:  A9 07		 LDA #$07			
$8F52:  85 81		 STA party_loop	  ; Party loop counter
$8F54:  20 77 8D	  JSR setup_ptr	   ; Setup char pointer
$8F57:  20 67 90	  JSR $9067		   
$8F5A:  A0 24		 LDY #$24			
$8F5C:  20 73 8F	  JSR $8F73		   
$8F5F:  A0 36		 LDY #$36			
$8F61:  20 12 90	  JSR $9012		   
$8F64:  A0 2D		 LDY #$2D			
$8F66:  20 73 8F	  JSR $8F73		   
$8F69:  A0 38		 LDY #$38			
$8F6B:  20 12 90	  JSR $9012		   
$8F6E:  C6 81		 DEC party_loop	  ; Party loop counter
$8F70:  10 E2		 BPL $8F54		   
$8F72:  60			RTS				 

; ------------------------------
sub_8F73:
$8F73:  A9 00		 LDA #$00			
$8F75:  85 94		 STA $94			 
$8F77:  85 95		 STA $95			 
$8F79:  B1 88		 LDA (char_ptr_lo),Y ; Character data pointer low
$8F7B:  85 0F		 STA $0F			 
$8F7D:  A2 00		 LDX #$00			
$8F7F:  8A			TXA				 
$8F80:  48			PHA				 
$8F81:  8D 9A 75	  STA $759A		   
$8F84:  46 0F		 LSR $0F			 
$8F86:  90 03		 BCC $8F8B		   
$8F88:  20 93 8F	  JSR $8F93		   
$8F8B:  68			PLA				 
$8F8C:  AA			TAX				 
$8F8D:  E8			INX				 
$8F8E:  E0 08		 CPX #$08			
$8F90:  90 ED		 BCC $8F7F		   
$8F92:  60			RTS				 

; ------------------------------
sub_8F93:
$8F93:  0A			ASL				 
$8F94:  AA			TAX				 
$8F95:  BD 00 91	  LDA $9100,X		 
$8F98:  85 00		 STA tmp0			; Temporary 0
$8F9A:  BD 01 91	  LDA $9101,X		 
$8F9D:  85 01		 STA tmp1			; Temporary 1
$8F9F:  6C 00 00	  JMP (tmp0)		  ; Temporary 0
$8FA2:  AD 9F 75	  LDA $759F		   
$8FA5:  AE A0 75	  LDX $75A0		   
$8FA8:  20 EF 8F	  JSR $8FEF		   
$8FAB:  46 01		 LSR tmp1			; Temporary 1
$8FAD:  66 00		 ROR tmp0			; Temporary 0
$8FAF:  4C F4 8F	  JMP $8FF4		   
$8FB2:  AD A1 75	  LDA $75A1		   
$8FB5:  AE A2 75	  LDX $75A2		   
$8FB8:  4C A8 8F	  JMP $8FA8		   
$8FBB:  AD A1 75	  LDA $75A1		   
$8FBE:  AE A2 75	  LDX $75A2		   
$8FC1:  20 EF 8F	  JSR $8FEF		   
$8FC4:  4C F4 8F	  JMP $8FF4		   
$8FC7:  AD 9B 75	  LDA $759B		   
$8FCA:  AE 9C 75	  LDX $759C		   
$8FCD:  20 EF 8F	  JSR $8FEF		   
$8FD0:  4C A8 8F	  JMP $8FA8		   
$8FD3:  AD 9B 75	  LDA $759B		   
$8FD6:  AE 9C 75	  LDX $759C		   
$8FD9:  4C C1 8F	  JMP $8FC1		   
$8FDC:  AD 9D 75	  LDA $759D		   
$8FDF:  AE 9E 75	  LDX $759E		   
$8FE2:  20 EF 8F	  JSR $8FEF		   
$8FE5:  A9 0C		 LDA #$0C			
$8FE7:  A2 00		 LDX #$00			
$8FE9:  20 9A 81	  JSR $819A		   
$8FEC:  4C F4 8F	  JMP $8FF4		   

; ------------------------------
sub_8FEF:
$8FEF:  85 00		 STA tmp0			; Temporary 0
$8FF1:  86 01		 STX tmp1			; Temporary 1
$8FF3:  60			RTS				 
$8FF4:  98			TYA				 
$8FF5:  48			PHA				 
$8FF6:  38			SEC				 
$8FF7:  6D 9A 75	  ADC $759A		   
$8FFA:  A8			TAY				 
$8FFB:  B1 88		 LDA (char_ptr_lo),Y ; Character data pointer low
$8FFD:  A2 00		 LDX #$00			
$8FFF:  20 30 83	  JSR mult_a		  ; Multiply by A
$9002:  18			CLC				 
$9003:  A5 01		 LDA tmp1			; Temporary 1
$9005:  65 94		 ADC $94			 
$9007:  85 94		 STA $94			 
$9009:  A5 19		 LDA mult_hi		 ; Product high
$900B:  65 95		 ADC $95			 
$900D:  85 95		 STA $95			 
$900F:  68			PLA				 
$9010:  A8			TAY				 
$9011:  60			RTS				 

; ------------------------------
sub_9012:
$9012:  18			CLC				 
$9013:  B1 88		 LDA (char_ptr_lo),Y ; Character data pointer low
$9015:  65 94		 ADC $94			 
$9017:  91 88		 STA (char_ptr_lo),Y ; Character data pointer low
$9019:  C8			INY				 
$901A:  B1 88		 LDA (char_ptr_lo),Y ; Character data pointer low
$901C:  65 95		 ADC $95			 
$901E:  91 88		 STA (char_ptr_lo),Y ; Character data pointer low
$9020:  60			RTS				 

; ------------------------------
sub_9021:
$9021:  A9 00		 LDA #$00			
$9023:  85 00		 STA tmp0			; Temporary 0
$9025:  85 01		 STA tmp1			; Temporary 1
$9027:  85 02		 STA tmp2			; Temporary 2
$9029:  A9 07		 LDA #$07			
$902B:  85 81		 STA party_loop	  ; Party loop counter
$902D:  AD 77 75	  LDA $7577		   
$9030:  85 03		 STA tmp3			; Temporary 3
$9032:  46 03		 LSR tmp3			; Temporary 3
$9034:  90 02		 BCC $9038		   
$9036:  E6 00		 INC tmp0			; Temporary 0
$9038:  20 77 8D	  JSR setup_ptr	   ; Setup char pointer
$903B:  A0 36		 LDY #$36			
$903D:  20 A7 90	  JSR $90A7		   
$9040:  A0 38		 LDY #$38			
$9042:  20 A7 90	  JSR $90A7		   
$9045:  C6 81		 DEC party_loop	  ; Party loop counter
$9047:  10 E9		 BPL $9032		   
$9049:  A5 01		 LDA tmp1			; Temporary 1
$904B:  8D 9B 75	  STA $759B		   
$904E:  A5 02		 LDA tmp2			; Temporary 2
$9050:  8D 9C 75	  STA $759C		   
$9053:  A2 01		 LDX #$01			
$9055:  A5 00		 LDA tmp0			; Temporary 0
$9057:  85 82		 STA inner_loop	  ; Inner loop counter
$9059:  20 51 C8	  JSR $C851		   
$905C:  A5 01		 LDA tmp1			; Temporary 1
$905E:  8D 9F 75	  STA $759F		   
$9061:  A5 02		 LDA tmp2			; Temporary 2
$9063:  8D A0 75	  STA $75A0		   
$9066:  60			RTS				 

; ------------------------------
sub_9067:
$9067:  AD 9B 75	  LDA $759B		   
$906A:  AE 9C 75	  LDX $759C		   
$906D:  20 EF 8F	  JSR $8FEF		   
$9070:  A0 37		 LDY #$37			
$9072:  20 9A 90	  JSR $909A		   
$9075:  A0 39		 LDY #$39			
$9077:  20 9A 90	  JSR $909A		   
$907A:  A5 00		 LDA tmp0			; Temporary 0
$907C:  8D 9D 75	  STA $759D		   
$907F:  A5 01		 LDA tmp1			; Temporary 1
$9081:  8D 9E 75	  STA $759E		   
$9084:  A6 82		 LDX inner_loop	  ; Inner loop counter
$9086:  CA			DEX				 
$9087:  8A			TXA				 
$9088:  F0 05		 BEQ $908F		   
$908A:  A2 00		 LDX #$00			
$908C:  20 51 C8	  JSR $C851		   
$908F:  A5 00		 LDA tmp0			; Temporary 0
$9091:  8D A1 75	  STA $75A1		   
$9094:  A5 01		 LDA tmp1			; Temporary 1
$9096:  8D A2 75	  STA $75A2		   
$9099:  60			RTS				 

; ------------------------------
sub_909A:
$909A:  B1 88		 LDA (char_ptr_lo),Y ; Character data pointer low
$909C:  48			PHA				 
$909D:  88			DEY				 
$909E:  B1 88		 LDA (char_ptr_lo),Y ; Character data pointer low
$90A0:  A8			TAY				 
$90A1:  68			PLA				 
$90A2:  A2 00		 LDX #$00			
$90A4:  4C 07 C8	  JMP $C807		   

; ------------------------------
sub_90A7:
$90A7:  18			CLC				 
$90A8:  B1 88		 LDA (char_ptr_lo),Y ; Character data pointer low
$90AA:  65 01		 ADC tmp1			; Temporary 1
$90AC:  85 01		 STA tmp1			; Temporary 1
$90AE:  C8			INY				 
$90AF:  B1 88		 LDA (char_ptr_lo),Y ; Character data pointer low
$90B1:  65 02		 ADC tmp2			; Temporary 2
$90B3:  85 02		 STA tmp2			; Temporary 2
$90B5:  60			RTS				 

; ------------------------------
sub_90B6:
$90B6:  A0 36		 LDY #$36			
$90B8:  20 BD 90	  JSR $90BD		   
$90BB:  A0 38		 LDY #$38			
sub_90BD:
$90BD:  18			CLC				 
$90BE:  B1 88		 LDA (char_ptr_lo),Y ; Character data pointer low
$90C0:  6D D0 77	  ADC $77D0		   
$90C3:  8D D0 77	  STA $77D0		   
$90C6:  C8			INY				 
$90C7:  B1 88		 LDA (char_ptr_lo),Y ; Character data pointer low
$90C9:  6D D1 77	  ADC $77D1		   
$90CC:  8D D1 77	  STA $77D1		   
$90CF:  60			RTS				 

; ------------------------------
sub_90D0:
$90D0:  A0 36		 LDY #$36			
$90D2:  D0 02		 BNE $90D6		   
sub_90D4:
$90D4:  A0 38		 LDY #$38			
$90D6:  84 00		 STY tmp0			; Temporary 0
$90D8:  A8			TAY				 
$90D9:  48			PHA				 
$90DA:  18			CLC				 
$90DB:  20 E3 90	  JSR $90E3		   
$90DE:  68			PLA				 
$90DF:  A8			TAY				 
$90E0:  C8			INY				 
$90E1:  E6 00		 INC tmp0			; Temporary 0
sub_90E3:
$90E3:  B1 88		 LDA (char_ptr_lo),Y ; Character data pointer low
$90E5:  A4 00		 LDY tmp0			; Temporary 0
$90E7:  71 88		 ADC (char_ptr_lo),Y ; Character data pointer low
$90E9:  91 88		 STA (char_ptr_lo),Y ; Character data pointer low
$90EB:  60			RTS				 
$90EC:  08			PHP				 
$90ED:  0A			ASL				 
							  ; Data region
		.byte $0C
$90EF:  0E 18 1C	  ASL $1C18		   
$90F2:  20 36 00	  JSR $0036		   
							  ; Data region
		.byte $02, $04
$90F7:  06 10		 ASL ptr_lo		  ; General pointer low
							  ; Data region
		.byte $12, $14
$90FB:  16 1A		 ASL $1A,X		   
$90FD:  1E 22 38	  ASL $3822,X		 
$9100:  A2 8F		 LDX #$8F			
$9102:  A2 8F		 LDX #$8F			
$9104:  A2 8F		 LDX #$8F			
							  ; Data region
		.byte $B2, $8F, $BB, $8F, $C7, $8F, $D3, $8F, $DC, $8F
finalize:					 ; $9110
$9110:  A6 96		 LDX active_char	 ; Active character index
$9112:  AD DB 75	  LDA act_id		  ; Action ID
$9115:  C9 FF		 CMP #$FF			
$9117:  F0 16		 BEQ $912F		   
$9119:  9D 24 73	  STA $7324,X		 
$911C:  AD DA 75	  LDA act_cat		 ; Action category
$911F:  9D 00 73	  STA $7300,X		 
$9122:  29 70		 AND #$70			
$9124:  C9 20		 CMP #$20			
$9126:  D0 06		 BNE $912E		   
$9128:  AD F2 75	  LDA $75F2		   
$912B:  9D 24 73	  STA $7324,X		 
$912E:  60			RTS				 
$912F:  A9 3C		 LDA #$3C			
$9131:  9D 24 73	  STA $7324,X		 
$9134:  60			RTS				 

; --------------------------------------------------
; Check hit/miss
; --------------------------------------------------
chk_hit:					 ; $9135
$9135:  AD DA 75	  LDA act_cat		 ; Action category
$9138:  29 70		 AND #$70			
$913A:  D0 19		 BNE $9155		   
$913C:  AD DB 75	  LDA act_id		  ; Action ID
$913F:  C9 13		 CMP #$13			
$9141:  90 35		 BCC $9178		   
$9143:  C9 1C		 CMP #$1C			
$9145:  90 53		 BCC hit_6		   ; -> Hit check type 6
$9147:  C9 29		 CMP #$29			
$9149:  90 29		 BCC $9174		   
$914B:  C9 33		 CMP #$33			
$914D:  90 27		 BCC $9176		   
$914F:  C9 43		 CMP #$43			
$9151:  F0 25		 BEQ $9178		   
$9153:  D0 1F		 BNE $9174		   
$9155:  A2 11		 LDX #$11			
$9157:  BD A9 91	  LDA act_codes,X	 ; Action code table
$915A:  CD DB 75	  CMP act_id		  ; Action ID
$915D:  F0 05		 BEQ $9164		   
$915F:  CA			DEX				 
$9160:  10 F5		 BPL $9157		   
$9162:  38			SEC				 
$9163:  60			RTS				 
$9164:  8A			TXA				 
$9165:  0A			ASL				 
$9166:  AA			TAX				 
$9167:  BD CD 91	  LDA act_jmptbl,X	; Action handlers table
$916A:  85 00		 STA tmp0			; Temporary 0
$916C:  BD CE 91	  LDA $91CE,X		 
$916F:  85 01		 STA tmp1			; Temporary 1
$9171:  6C 00 00	  JMP (tmp0)		  ; Temporary 0
$9174:  38			SEC				 
$9175:  60			RTS				 
$9176:  18			CLC				 
$9177:  60			RTS				 
$9178:  AD 99 BB	  LDA base_dmg		; Base damage value
$917B:  85 00		 STA tmp0			; Temporary 0
$917D:  A9 00		 LDA #$00			
$917F:  85 01		 STA tmp1			; Temporary 1
$9181:  AD D9 75	  LDA actor		   ; Acting character
$9184:  A2 00		 LDX #$00			
$9186:  20 27 C8	  JSR $C827		   
$9189:  20 87 81	  JSR div16		   ; Divide by 16
$918C:  A5 01		 LDA tmp1			; Temporary 1
$918E:  F0 04		 BEQ $9194		   
$9190:  A9 FF		 LDA #$FF			
$9192:  85 00		 STA tmp0			; Temporary 0
$9194:  AD EC 75	  LDA rng_val		 ; RNG value
$9197:  C5 00		 CMP tmp0			; Temporary 0
$9199:  60			RTS				 

; --------------------------------------------------
; Hit check type 6
; --------------------------------------------------
hit_6:					 ; $919A
$919A:  A9 06		 LDA #$06			
$919C:  CD EC 75	  CMP rng_val		 ; RNG value
$919F:  60			RTS				 

; --------------------------------------------------
; Clear damage vars
; --------------------------------------------------
clr_dmg:					 ; $91A0
$91A0:  A9 00		 LDA #$00			
$91A2:  8D D4 75	  STA damage_lo	   ; Damage output low
$91A5:  8D D5 75	  STA damage_hi	   ; Damage output high
$91A8:  60			RTS				 

; --------------------------------------------------
; Action code table
; --------------------------------------------------
act_codes:					 ; $91A9
$91A9:  11 17		 ORA (mult_lo),Y	 ; Product low
$91AB:  18			CLC				 
							  ; Data region
		.byte $1A, $1B
$91AE:  1D 1E 20	  ORA $201E,X		 
							  ; Data region
		.byte $23, $40, $42, $53, $57
$91B6:  58			CLI				 
							  ; Data region
		.byte $5B, $5C, $5D, $60, $80, $80, $84, $80, $80, $83, $80
$91C2:  81 80		 STA ($80,X)		 
$91C4:  81 80		 STA ($80,X)		 
$91C6:  81 82		 STA ($82,X)		 
							  ; Data region
		.byte $82
$91C9:  81 83		 STA ($83,X)		 
							  ; Data region
		.byte $83
$91CC:  81 78		 STA ($78,X)		 
$91CE:  91 78		 STA ($78),Y		 
$91D0:  91 9A		 STA ($9A),Y		 
$91D2:  91 78		 STA ($78),Y		 
$91D4:  91 78		 STA ($78),Y		 
$91D6:  91 9A		 STA ($9A),Y		 
$91D8:  91 78		 STA ($78),Y		 
$91DA:  91 76		 STA ($76),Y		 
$91DC:  91 78		 STA ($78),Y		 
$91DE:  91 76		 STA ($76),Y		 
$91E0:  91 9A		 STA ($9A),Y		 
$91E2:  91 76		 STA ($76),Y		 
$91E4:  91 76		 STA ($76),Y		 
$91E6:  91 76		 STA ($76),Y		 
$91E8:  91 76		 STA ($76),Y		 
$91EA:  91 9A		 STA ($9A),Y		 
$91EC:  91 76		 STA ($76),Y		 
$91EE:  91 AD		 STA ($AD),Y		 
							  ; Data region
		.byte $D3
$91F1:  75 C9		 ADC $C9,X		   
$91F3:  10 90		 BPL $9185		   
							  ; Data region
		.byte $03
$91F6:  20 BC B5	  JSR $B5BC		   
$91F9:  0A			ASL				 
$91FA:  AA			TAX				 
$91FB:  BD 4D B7	  LDA stat_tbl_1,X	; Stat modifier table 1
$91FE:  85 8A		 STA char_count	  ; Character count
$9200:  60			RTS				 

; --------------------------------------------------
; Get enemy index
; --------------------------------------------------
get_ene_idx:					 ; $9201
$9201:  AE D3 75	  LDX target		  ; Target index
$9204:  BD 67 B9	  LDA enemy_res_tbl,X ; Enemy resistance table
$9207:  29 1F		 AND #$1F			
$9209:  C9 1F		 CMP #$1F			
$920B:  D0 02		 BNE $920F		   
$920D:  A9 00		 LDA #$00			
$920F:  85 8B		 STA actor_idx	   ; Current actor index
$9211:  60			RTS				 

; --------------------------------------------------
; Sum party stats
; --------------------------------------------------
sum_stats:					 ; $9212
$9212:  A9 00		 LDA #$00			
$9214:  85 01		 STA tmp1			; Temporary 1
$9216:  85 02		 STA tmp2			; Temporary 2
$9218:  A9 07		 LDA #$07			
$921A:  85 81		 STA party_loop	  ; Party loop counter
party_lp:					 ; $921C
$921C:  20 77 8D	  JSR setup_ptr	   ; Setup char pointer
$921F:  A0 00		 LDY #$00			
$9221:  20 5F 92	  JSR add_stat		; Add stat pair
$9224:  A0 08		 LDY #$08			
$9226:  20 5F 92	  JSR add_stat		; Add stat pair
$9229:  A0 10		 LDY #$10			
$922B:  20 5F 92	  JSR add_stat		; Add stat pair
$922E:  C6 81		 DEC party_loop	  ; Party loop counter
$9230:  10 EA		 BPL party_lp		; -> Party stat loop
$9232:  A9 00		 LDA #$00			
$9234:  85 00		 STA tmp0			; Temporary 0
$9236:  85 04		 STA $04			 
$9238:  A9 B7		 LDA #$B7			
$923A:  85 03		 STA tmp3			; Temporary 3
$923C:  A2 00		 LDX #$00			
$923E:  A0 03		 LDY #$03			
$9240:  20 F4 83	  JSR div24_set	   ; 24-bit div setup
$9243:  A5 02		 LDA tmp2			; Temporary 2
$9245:  F0 06		 BEQ $924D		   
$9247:  A9 FF		 LDA #$FF			
$9249:  85 00		 STA tmp0			; Temporary 0
$924B:  85 01		 STA tmp1			; Temporary 1
$924D:  A5 00		 LDA tmp0			; Temporary 0
$924F:  8D ED 75	  STA stat_sum_lo	 ; Party stat sum low
$9252:  A5 01		 LDA tmp1			; Temporary 1
$9254:  8D EE 75	  STA stat_sum_hi	 ; Party stat sum high
$9257:  05 00		 ORA tmp0			; Temporary 0
$9259:  D0 03		 BNE $925E		   
$925B:  EE ED 75	  INC stat_sum_lo	 ; Party stat sum low
$925E:  60			RTS				 

; --------------------------------------------------
; Add stat pair
; --------------------------------------------------
add_stat:					 ; $925F
$925F:  A9 03		 LDA #$03			
$9261:  85 82		 STA inner_loop	  ; Inner loop counter
$9263:  B1 88		 LDA (char_ptr_lo),Y ; Character data pointer low
$9265:  65 01		 ADC tmp1			; Temporary 1
$9267:  85 01		 STA tmp1			; Temporary 1
$9269:  C8			INY				 
$926A:  B1 88		 LDA (char_ptr_lo),Y ; Character data pointer low
$926C:  65 02		 ADC tmp2			; Temporary 2
$926E:  85 02		 STA tmp2			; Temporary 2
$9270:  C8			INY				 
$9271:  C6 82		 DEC inner_loop	  ; Inner loop counter
$9273:  10 EE		 BPL $9263		   
$9275:  60			RTS				 

; --------------------------------------------------
; Stat table lookup
; --------------------------------------------------
stat_lookup:					 ; $9276
$9276:  AE D3 75	  LDX target		  ; Target index
$9279:  BD 0B B8	  LDA spell_eff_tbl,X ; Spell effect type table
$927C:  29 1F		 AND #$1F			
$927E:  AA			TAX				 
$927F:  BD CC 94	  LDA $94CC,X		 
$9282:  20 E2 92	  JSR $92E2		   
$9285:  85 00		 STA tmp0			; Temporary 0
$9287:  A9 00		 LDA #$00			
$9289:  AE D3 75	  LDX target		  ; Target index
$928C:  E0 18		 CPX #$18			
$928E:  D0 04		 BNE $9294		   
$9290:  A9 04		 LDA #$04			
$9292:  D0 06		 BNE $929A		   
$9294:  E0 1F		 CPX #$1F			
$9296:  D0 02		 BNE $929A		   
$9298:  A9 04		 LDA #$04			
$929A:  18			CLC				 
$929B:  65 00		 ADC tmp0			; Temporary 0
$929D:  85 00		 STA tmp0			; Temporary 0
$929F:  A6 81		 LDX party_loop	  ; Party loop counter
$92A1:  20 9C 89	  JSR $899C		   
$92A4:  A0 0D		 LDY #$0D			
$92A6:  B1 86		 LDA (stat_ptr_lo),Y ; Stat table pointer low
$92A8:  29 03		 AND #$03			
$92AA:  AA			TAX				 
$92AB:  A5 00		 LDA tmp0			; Temporary 0
$92AD:  48			PHA				 
$92AE:  BD 06 72	  LDA $7206,X		 
$92B1:  20 B4 B0	  JSR bit_rot		 ; Bit rotation
$92B4:  A8			TAY				 
$92B5:  68			PLA				 
$92B6:  0A			ASL				 
$92B7:  85 00		 STA tmp0			; Temporary 0
$92B9:  98			TYA				 
$92BA:  0A			ASL				 
$92BB:  0A			ASL				 
$92BC:  0A			ASL				 
$92BD:  0A			ASL				 
$92BE:  65 00		 ADC tmp0			; Temporary 0
$92C0:  A8			TAY				 
$92C1:  B9 DC 94	  LDA $94DC,Y		 
$92C4:  85 00		 STA tmp0			; Temporary 0
$92C6:  A9 00		 LDA #$00			
$92C8:  85 01		 STA tmp1			; Temporary 1
$92CA:  20 91 C8	  JSR $C891		   
$92CD:  A2 00		 LDX #$00			
$92CF:  20 27 C8	  JSR $C827		   
$92D2:  B9 DB 94	  LDA $94DB,Y		 
$92D5:  18			CLC				 
$92D6:  65 01		 ADC tmp1			; Temporary 1
$92D8:  4A			LSR				 
$92D9:  C9 10		 CMP #$10			
$92DB:  90 02		 BCC $92DF		   
$92DD:  A9 10		 LDA #$10			
$92DF:  85 8C		 STA action_param	; Action parameter
$92E1:  60			RTS				 

; ------------------------------
sub_92E2:
$92E2:  48			PHA				 
$92E3:  29 03		 AND #$03			
$92E5:  85 00		 STA tmp0			; Temporary 0
$92E7:  68			PLA				 
$92E8:  29 FC		 AND #$FC			
$92EA:  4A			LSR				 
$92EB:  4A			LSR				 
$92EC:  85 01		 STA tmp1			; Temporary 1
$92EE:  A5 81		 LDA party_loop	  ; Party loop counter
$92F0:  0A			ASL				 
$92F1:  0A			ASL				 
$92F2:  65 01		 ADC tmp1			; Temporary 1
$92F4:  A8			TAY				 
$92F5:  B9 4B 75	  LDA $754B,Y		 
$92F8:  A6 00		 LDX tmp0			; Temporary 0
$92FA:  F0 05		 BEQ $9301		   
$92FC:  4A			LSR				 
$92FD:  4A			LSR				 
$92FE:  CA			DEX				 
$92FF:  D0 FB		 BNE $92FC		   
$9301:  29 03		 AND #$03			
$9303:  60			RTS				 

; ------------------------------
sub_9304:
$9304:  85 02		 STA tmp2			; Temporary 2
$9306:  A9 00		 LDA #$00			
$9308:  85 03		 STA tmp3			; Temporary 3
$930A:  A9 07		 LDA #$07			
$930C:  20 14 93	  JSR $9314		   
$930F:  C6 81		 DEC party_loop	  ; Party loop counter
$9311:  10 F9		 BPL $930C		   
$9313:  60			RTS				 

; ------------------------------
sub_9314:
$9314:  A6 02		 LDX tmp2			; Temporary 2
$9316:  BD 0B B8	  LDA spell_eff_tbl,X ; Spell effect type table
$9319:  29 1F		 AND #$1F			
$931B:  AA			TAX				 
$931C:  BD CC 94	  LDA $94CC,X		 
$931F:  48			PHA				 
$9320:  29 03		 AND #$03			
$9322:  85 00		 STA tmp0			; Temporary 0
$9324:  68			PLA				 
$9325:  29 FC		 AND #$FC			
$9327:  4A			LSR				 
$9328:  4A			LSR				 
$9329:  85 01		 STA tmp1			; Temporary 1
$932B:  A5 81		 LDA party_loop	  ; Party loop counter
$932D:  0A			ASL				 
$932E:  0A			ASL				 
$932F:  65 01		 ADC tmp1			; Temporary 1
$9331:  A8			TAY				 
$9332:  B9 4B 75	  LDA $754B,Y		 
$9335:  A6 00		 LDX tmp0			; Temporary 0
$9337:  F0 05		 BEQ $933E		   
$9339:  4A			LSR				 
$933A:  4A			LSR				 
$933B:  CA			DEX				 
$933C:  D0 FB		 BNE $9339		   
$933E:  29 03		 AND #$03			
$9340:  AA			TAX				 
$9341:  BD DB 94	  LDA $94DB,X		 
$9344:  18			CLC				 
$9345:  65 03		 ADC tmp3			; Temporary 3
$9347:  85 03		 STA tmp3			; Temporary 3
$9349:  60			RTS				 

; ------------------------------
sub_934A:
$934A:  AD D3 75	  LDA target		  ; Target index
$934D:  20 20 B6	  JSR $B620		   
$9350:  0A			ASL				 
$9351:  AA			TAX				 
$9352:  BD E3 B7	  LDA $B7E3,X		 
$9355:  85 8A		 STA char_count	  ; Character count
$9357:  BD E4 B7	  LDA $B7E4,X		 
$935A:  4A			LSR				 
$935B:  18			CLC				 
$935C:  65 8A		 ADC char_count	  ; Character count
$935E:  90 02		 BCC $9362		   
$9360:  A9 FF		 LDA #$FF			
$9362:  85 8A		 STA char_count	  ; Character count
$9364:  60			RTS				 

; --------------------------------------------------
; Get tactics spell 1
; --------------------------------------------------
get_tact_1:					 ; $9365
$9365:  8A			TXA				 
$9366:  48			PHA				 
$9367:  20 8B 93	  JSR calc_tact	   ; Calc tactics index
$936A:  BD A5 BA	  LDA tact_sp_2,X	 ; Tactics spell data 2
$936D:  8D 11 6E	  STA div_rem_lo	  ; Division remainder low
$9370:  68			PLA				 
$9371:  AA			TAX				 
$9372:  AD 11 6E	  LDA div_rem_lo	  ; Division remainder low
$9375:  60			RTS				 
$9376:  AD 68 73	  LDA $7368		   
$9379:  60			RTS				 

; --------------------------------------------------
; Get tactics spell 2
; --------------------------------------------------
get_tact_2:					 ; $937A
$937A:  8A			TXA				 
$937B:  48			PHA				 
$937C:  20 8B 93	  JSR calc_tact	   ; Calc tactics index
$937F:  BD D5 BA	  LDA tact_sp_3,X	 ; Tactics spell data 3
$9382:  8D 11 6E	  STA div_rem_lo	  ; Division remainder low
$9385:  68			PLA				 
$9386:  AA			TAX				 
$9387:  AD 11 6E	  LDA div_rem_lo	  ; Division remainder low
$938A:  60			RTS				 

; --------------------------------------------------
; Calc tactics index
; --------------------------------------------------
calc_tact:					 ; $938B
$938B:  AD 80 6E	  LDA action_type	 ; Current action type
$938E:  0A			ASL				 
$938F:  0A			ASL				 
$9390:  0A			ASL				 
$9391:  38			SEC				 
$9392:  ED 80 6E	  SBC action_type	 ; Current action type
$9395:  6D E8 75	  ADC spell_idx	   ; Spell index
$9398:  AA			TAX				 
$9399:  60			RTS				 

; --------------------------------------------------
; Get tactics spell 3
; --------------------------------------------------
get_tact_3:					 ; $939A
$939A:  8A			TXA				 
$939B:  48			PHA				 
$939C:  20 8B 93	  JSR calc_tact	   ; Calc tactics index
$939F:  BD 74 BA	  LDA tact_sp_1,X	 ; Tactics spell data 1
$93A2:  8D 11 6E	  STA div_rem_lo	  ; Division remainder low
$93A5:  68			PLA				 
$93A6:  AA			TAX				 
$93A7:  AD 11 6E	  LDA div_rem_lo	  ; Division remainder low
$93AA:  60			RTS				 

; ------------------------------
sub_93AB:
$93AB:  A5 81		 LDA party_loop	  ; Party loop counter
$93AD:  09 80		 ORA #$80			
$93AF:  8D D2 75	  STA act_type		; Action type
$93B2:  D0 0E		 BNE $93C2		   
sub_93B4:
$93B4:  A5 8D		 LDA $8D			 
$93B6:  09 88		 ORA #$88			
$93B8:  8D D2 75	  STA act_type		; Action type
$93BB:  D0 05		 BNE $93C2		   
sub_93BD:
$93BD:  A9 80		 LDA #$80			
$93BF:  8D D2 75	  STA act_type		; Action type
sub_93C2:
$93C2:  AD F0 75	  LDA btl_f0		  ; Battle flag F0
$93C5:  10 08		 BPL $93CF		   
$93C7:  AD D2 75	  LDA act_type		; Action type
$93CA:  09 20		 ORA #$20			
$93CC:  8D D2 75	  STA act_type		; Action type
$93CF:  60			RTS				 

; ------------------------------
sub_93D0:
$93D0:  20 E1 93	  JSR $93E1		   
$93D3:  90 0A		 BCC $93DF		   
$93D5:  AD 5B 73	  LDA $735B		   
$93D8:  DD 48 73	  CMP $7348,X		 
$93DB:  90 02		 BCC $93DF		   
$93DD:  18			CLC				 
$93DE:  60			RTS				 
$93DF:  38			SEC				 
$93E0:  60			RTS				 

; ------------------------------
sub_93E1:
$93E1:  A2 03		 LDX #$03			
$93E3:  BD F4 72	  LDA char_state,X	; Character state array
$93E6:  30 17		 BMI $93FF		   
$93E8:  29 70		 AND #$70			
$93EA:  C9 02		 CMP #$02			
$93EC:  B0 11		 BCS $93FF		   
$93EE:  BD F4 72	  LDA char_state,X	; Character state array
$93F1:  29 0F		 AND #$0F			
$93F3:  A8			TAY				 
$93F4:  B9 EA 72	  LDA $72EA,Y		 
$93F7:  29 7F		 AND #$7F			
$93F9:  F0 09		 BEQ $9404		   
$93FB:  C9 08		 CMP #$08			
$93FD:  F0 05		 BEQ $9404		   
$93FF:  CA			DEX				 
$9400:  10 E1		 BPL $93E3		   
$9402:  18			CLC				 
$9403:  60			RTS				 
$9404:  38			SEC				 
$9405:  60			RTS				 

; ------------------------------
sub_9406:
$9406:  A0 00		 LDY #$00			
$9408:  AD DB 75	  LDA act_id		  ; Action ID
$940B:  C9 FF		 CMP #$FF			
$940D:  F0 3E		 BEQ $944D		   
$940F:  C9 15		 CMP #$15			
$9411:  90 42		 BCC $9455		   
$9413:  C9 17		 CMP #$17			
$9415:  90 36		 BCC $944D		   
$9417:  C9 1C		 CMP #$1C			
$9419:  90 44		 BCC $945F		   
$941B:  C9 1E		 CMP #$1E			
$941D:  F0 40		 BEQ $945F		   
$941F:  C9 29		 CMP #$29			
$9421:  90 40		 BCC $9463		   
$9423:  C9 2E		 CMP #$2E			
$9425:  90 30		 BCC $9457		   
$9427:  C9 33		 CMP #$33			
$9429:  90 30		 BCC $945B		   
$942B:  C9 3C		 CMP #$3C			
$942D:  90 1E		 BCC $944D		   
$942F:  A0 80		 LDY #$80			
$9431:  C9 43		 CMP #$43			
$9433:  F0 20		 BEQ $9455		   
$9435:  C9 41		 CMP #$41			
$9437:  F0 14		 BEQ $944D		   
$9439:  AD DA 75	  LDA act_cat		 ; Action category
$943C:  29 70		 AND #$70			
$943E:  F0 0D		 BEQ $944D		   
$9440:  A2 11		 LDX #$11			
$9442:  BD A9 91	  LDA act_codes,X	 ; Action code table
$9445:  CD F2 75	  CMP $75F2		   
$9448:  F0 07		 BEQ $9451		   
$944A:  CA			DEX				 
$944B:  10 F5		 BPL $9442		   
$944D:  98			TYA				 
$944E:  09 05		 ORA #$05			
$9450:  60			RTS				 
$9451:  BD BB 91	  LDA $91BB,X		 
$9454:  60			RTS				 
$9455:  98			TYA				 
$9456:  60			RTS				 
$9457:  98			TYA				 
$9458:  09 01		 ORA #$01			
$945A:  60			RTS				 
$945B:  98			TYA				 
$945C:  09 02		 ORA #$02			
$945E:  60			RTS				 
$945F:  98			TYA				 
$9460:  09 03		 ORA #$03			
$9462:  60			RTS				 
$9463:  98			TYA				 
$9464:  09 04		 ORA #$04			
$9466:  60			RTS				 

; ------------------------------
sub_9467:
$9467:  18			CLC				 
$9468:  B1 88		 LDA (char_ptr_lo),Y ; Character data pointer low
$946A:  75 00		 ADC $00,X		   
$946C:  95 00		 STA $00,X		   
$946E:  C8			INY				 
$946F:  B1 88		 LDA (char_ptr_lo),Y ; Character data pointer low
$9471:  75 01		 ADC $01,X		   
$9473:  95 01		 STA $01,X		   
$9475:  C8			INY				 
$9476:  60			RTS				 

; ------------------------------
sub_9477:
$9477:  8A			TXA				 
$9478:  48			PHA				 
$9479:  A2 00		 LDX #$00			
$947B:  20 67 94	  JSR $9467		   
$947E:  68			PLA				 
$947F:  AA			TAX				 
$9480:  60			RTS				 
$9481:  B9 00 00	  LDA tmp0,Y		  ; Temporary 0
$9484:  85 19		 STA mult_hi		 ; Product high
$9486:  B9 01 00	  LDA tmp1,Y		  ; Temporary 1
$9489:  85 1A		 STA mult_ext		; Product extended
$948B:  98			TYA				 
$948C:  48			PHA				 
$948D:  A0 18		 LDY #$18			
$948F:  A9 00		 LDA #$00			
$9491:  85 1B		 STA $1B			 
$9493:  85 16		 STA mult_a		  ; Multiplier A
$9495:  85 17		 STA mult_lo		 ; Product low
$9497:  85 18		 STA mult_mid		; Product mid
$9499:  16 00		 ASL $00,X		   
$949B:  36 01		 ROL $01,X		   
$949D:  36 02		 ROL $02,X		   
$949F:  26 16		 ROL mult_a		  ; Multiplier A
$94A1:  26 17		 ROL mult_lo		 ; Product low
$94A3:  26 18		 ROL mult_mid		; Product mid
$94A5:  F6 00		 INC $00,X		   
$94A7:  A5 16		 LDA mult_a		  ; Multiplier A
$94A9:  38			SEC				 
$94AA:  E5 19		 SBC mult_hi		 ; Product high
$94AC:  48			PHA				 
$94AD:  A5 17		 LDA mult_lo		 ; Product low
$94AF:  E5 1A		 SBC mult_ext		; Product extended
$94B1:  48			PHA				 
$94B2:  A5 18		 LDA mult_mid		; Product mid
$94B4:  E5 1B		 SBC $1B			 
$94B6:  B0 06		 BCS $94BE		   
$94B8:  D6 00		 DEC $00,X		   
$94BA:  68			PLA				 
$94BB:  68			PLA				 
$94BC:  90 08		 BCC $94C6		   
$94BE:  85 18		 STA mult_mid		; Product mid
$94C0:  68			PLA				 
$94C1:  85 17		 STA mult_lo		 ; Product low
$94C3:  68			PLA				 
$94C4:  85 16		 STA mult_a		  ; Multiplier A
$94C6:  88			DEY				 
$94C7:  D0 D0		 BNE $9499		   
$94C9:  68			PLA				 
$94CA:  A8			TAY				 
$94CB:  60			RTS				 
							  ; Data region
		.byte $02
$94CD:  01 00		 ORA ($00,X)		 
$94CF:  05 04		 ORA $04			 
							  ; Data region
		.byte $03
$94D2:  08			PHP				 
							  ; Data region
		.byte $07
$94D4:  06 0B		 ASL $0B			 
$94D6:  0A			ASL				 
$94D7:  09 0E		 ORA #$0E			
$94D9:  0D 0C 4C	  ORA $4C0C		   
$94DC:  35 33		 AND $33,X		   
$94DE:  4C 19 4D	  JMP $4D19		   
$94E1:  00			BRK				 
$94E2:  66 4C		 ROR $4C			 
$94E4:  35 4C		 AND $4C,X		   
$94E6:  35 26		 AND $26,X		   
$94E8:  4D 00 66	  EOR $6600		   
							  ; Data region
		.byte $5A, $33, $40, $33, $26, $33, $00, $33, $5A, $33, $5A, $33, $33, $33
$94F9:  00			BRK				 
							  ; Data region
		.byte $33, $5A
$94FC:  28			PLP				 
$94FD:  4D 26 26	  EOR $2626		   
$9500:  26 00		 ROL tmp0			; Temporary 0
$9502:  26 5A		 ROL $5A			 
$9504:  28			PLP				 
							  ; Data region
		.byte $5A
$9506:  28			PLP				 
$9507:  39 26 00	  AND $0026,Y		 
$950A:  26 80		 ROL $80			 
$950C:  00			BRK				 
$950D:  6D 00 33	  ADC $3300		   
$9510:  00			BRK				 
$9511:  00			BRK				 
$9512:  00			BRK				 
							  ; Data region
		.byte $80
$9514:  00			BRK				 
							  ; Data region
		.byte $80
$9516:  00			BRK				 
							  ; Data region
		.byte $5A
$9518:  00			BRK				 
$9519:  00			BRK				 
$951A:  00			BRK				 
$951B:  20 EF 91	  JSR $91EF		   
$951E:  20 01 92	  JSR get_ene_idx	 ; Get enemy index
$9521:  A9 07		 LDA #$07			
$9523:  85 81		 STA party_loop	  ; Party loop counter
$9525:  20 76 92	  JSR stat_lookup	 ; Stat table lookup
$9528:  20 AB 93	  JSR $93AB		   
$952B:  20 B8 95	  JSR $95B8		   
$952E:  C6 81		 DEC party_loop	  ; Party loop counter
$9530:  10 F3		 BPL $9525		   
$9532:  60			RTS				 
$9533:  20 EF 91	  JSR $91EF		   
$9536:  20 01 92	  JSR get_ene_idx	 ; Get enemy index
$9539:  A9 03		 LDA #$03			
$953B:  85 8D		 STA $8D			 
$953D:  20 B4 93	  JSR $93B4		   
$9540:  20 11 96	  JSR $9611		   
$9543:  C6 8D		 DEC $8D			 
$9545:  10 F6		 BPL $953D		   
$9547:  60			RTS				 
$9548:  20 EF 91	  JSR $91EF		   
$954B:  20 01 92	  JSR get_ene_idx	 ; Get enemy index
$954E:  20 BD 93	  JSR $93BD		   
$9551:  4C 37 96	  JMP $9637		   
$9554:  20 01 92	  JSR get_ene_idx	 ; Get enemy index
$9557:  A9 07		 LDA #$07			
$9559:  85 81		 STA party_loop	  ; Party loop counter
$955B:  20 76 92	  JSR stat_lookup	 ; Stat table lookup
$955E:  20 AB 93	  JSR $93AB		   
$9561:  20 A0 96	  JSR $96A0		   
$9564:  C6 81		 DEC party_loop	  ; Party loop counter
$9566:  10 F3		 BPL $955B		   
$9568:  60			RTS				 
$9569:  20 01 92	  JSR get_ene_idx	 ; Get enemy index
$956C:  A9 03		 LDA #$03			
$956E:  85 8D		 STA $8D			 
$9570:  20 B4 93	  JSR $93B4		   
$9573:  20 F3 96	  JSR $96F3		   
$9576:  C6 8D		 DEC $8D			 
$9578:  10 F6		 BPL $9570		   
$957A:  60			RTS				 
$957B:  20 01 92	  JSR get_ene_idx	 ; Get enemy index
$957E:  20 BD 93	  JSR $93BD		   
$9581:  4C 1C 97	  JMP $971C		   

; --------------------------------------------------
; Setup action
; --------------------------------------------------
setup_act:					 ; $9584
$9584:  AD F0 75	  LDA btl_f0		  ; Battle flag F0
$9587:  29 7F		 AND #$7F			
$9589:  8D F0 75	  STA btl_f0		  ; Battle flag F0
$958C:  A9 43		 LDA #$43			
$958E:  8D D3 75	  STA target		  ; Target index
$9591:  A9 00		 LDA #$00			
$9593:  85 8B		 STA actor_idx	   ; Current actor index
$9595:  A9 10		 LDA #$10			
$9597:  85 8C		 STA action_param	; Action parameter
$9599:  A9 07		 LDA #$07			
$959B:  85 81		 STA party_loop	  ; Party loop counter
$959D:  20 AB 93	  JSR $93AB		   
$95A0:  A6 81		 LDX party_loop	  ; Party loop counter
$95A2:  A9 40		 LDA #$40			
$95A4:  20 F2 85	  JSR $85F2		   
$95A7:  F0 0A		 BEQ $95B3		   
$95A9:  C8			INY				 
$95AA:  A9 02		 LDA #$02			
$95AC:  31 86		 AND (stat_ptr_lo),Y ; Stat table pointer low
$95AE:  D0 03		 BNE $95B3		   
$95B0:  20 36 97	  JSR $9736		   
$95B3:  C6 81		 DEC party_loop	  ; Party loop counter
$95B5:  10 E6		 BPL $959D		   
$95B7:  60			RTS				 

; ------------------------------
sub_95B8:
$95B8:  20 58 96	  JSR $9658		   
$95BB:  20 C5 95	  JSR $95C5		   
$95BE:  A5 0F		 LDA $0F			 
$95C0:  10 3A		 BPL $95FC		   
$95C2:  4C C2 A9	  JMP $A9C2		   

; ------------------------------
sub_95C5:
$95C5:  A9 00		 LDA #$00			
$95C7:  85 00		 STA tmp0			; Temporary 0
$95C9:  85 01		 STA tmp1			; Temporary 1
$95CB:  85 0F		 STA $0F			 
$95CD:  A6 81		 LDX party_loop	  ; Party loop counter
$95CF:  A9 40		 LDA #$40			
$95D1:  20 F2 85	  JSR $85F2		   
$95D4:  F0 26		 BEQ $95FC		   
$95D6:  88			DEY				 
$95D7:  AD F0 75	  LDA btl_f0		  ; Battle flag F0
$95DA:  30 06		 BMI $95E2		   
$95DC:  A9 C0		 LDA #$C0			
$95DE:  31 86		 AND (stat_ptr_lo),Y ; Stat table pointer low
$95E0:  D0 1B		 BNE $95FD		   
$95E2:  C8			INY				 
$95E3:  C8			INY				 
$95E4:  A9 02		 LDA #$02			
$95E6:  31 86		 AND (stat_ptr_lo),Y ; Stat table pointer low
$95E8:  D0 12		 BNE $95FC		   
$95EA:  A5 8C		 LDA action_param	; Action parameter
$95EC:  F0 0E		 BEQ $95FC		   
$95EE:  C6 0F		 DEC $0F			 
$95F0:  20 66 97	  JSR $9766		   
$95F3:  20 A3 97	  JSR $97A3		   
$95F6:  20 C0 97	  JSR $97C0		   
$95F9:  20 00 98	  JSR $9800		   
$95FC:  60			RTS				 
$95FD:  B1 86		 LDA (stat_ptr_lo),Y ; Stat table pointer low
$95FF:  0A			ASL				 
$9600:  10 FA		 BPL $95FC		   
$9602:  A5 8A		 LDA char_count	  ; Character count
$9604:  18			CLC				 
$9605:  6D E1 75	  ADC power_lo		; Action power low
$9608:  8D E1 75	  STA power_lo		; Action power low
$960B:  90 03		 BCC $9610		   
$960D:  EE E2 75	  INC power_hi		; Action power high
$9610:  60			RTS				 

; ------------------------------
sub_9611:
$9611:  20 58 96	  JSR $9658		   
$9614:  A9 07		 LDA #$07			
$9616:  85 81		 STA party_loop	  ; Party loop counter
$9618:  20 02 86	  JSR $8602		   
$961B:  D0 10		 BNE $962D		   
$961D:  20 76 92	  JSR stat_lookup	 ; Stat table lookup
$9620:  20 C5 95	  JSR $95C5		   
$9623:  A5 0F		 LDA $0F			 
$9625:  F0 06		 BEQ $962D		   
$9627:  20 6B 96	  JSR $966B		   
$962A:  20 7D 96	  JSR $967D		   
$962D:  C6 81		 DEC party_loop	  ; Party loop counter
$962F:  10 E7		 BPL $9618		   
$9631:  20 95 96	  JSR $9695		   
$9634:  4C C2 A9	  JMP $A9C2		   
$9637:  20 58 96	  JSR $9658		   
$963A:  A9 07		 LDA #$07			
$963C:  85 81		 STA party_loop	  ; Party loop counter
$963E:  20 76 92	  JSR stat_lookup	 ; Stat table lookup
$9641:  20 C5 95	  JSR $95C5		   
$9644:  A5 0F		 LDA $0F			 
$9646:  F0 06		 BEQ $964E		   
$9648:  20 6B 96	  JSR $966B		   
$964B:  20 7D 96	  JSR $967D		   
$964E:  C6 81		 DEC party_loop	  ; Party loop counter
$9650:  10 EC		 BPL $963E		   
$9652:  20 95 96	  JSR $9695		   
$9655:  4C C2 A9	  JMP $A9C2		   

; ------------------------------
sub_9658:
$9658:  A9 00		 LDA #$00			
$965A:  8D DF 75	  STA $75DF		   
$965D:  8D E0 75	  STA $75E0		   
$9660:  8D E1 75	  STA power_lo		; Action power low
$9663:  8D E2 75	  STA power_hi		; Action power high
$9666:  85 02		 STA tmp2			; Temporary 2
$9668:  85 03		 STA tmp3			; Temporary 3
$966A:  60			RTS				 

; ------------------------------
sub_966B:
$966B:  18			CLC				 
$966C:  A5 00		 LDA tmp0			; Temporary 0
$966E:  6D DF 75	  ADC $75DF		   
$9671:  8D DF 75	  STA $75DF		   
$9674:  A5 01		 LDA tmp1			; Temporary 1
$9676:  6D E0 75	  ADC $75E0		   
$9679:  8D E0 75	  STA $75E0		   
$967C:  60			RTS				 

; ------------------------------
sub_967D:
$967D:  AD D1 75	  LDA act_ptr		 ; Action pointer
$9680:  65 02		 ADC tmp2			; Temporary 2
$9682:  85 02		 STA tmp2			; Temporary 2
$9684:  90 02		 BCC $9688		   
$9686:  E6 03		 INC tmp3			; Temporary 3
$9688:  AD DF 75	  LDA $75DF		   
$968B:  0D E0 75	  ORA $75E0		   
$968E:  F0 04		 BEQ $9694		   
$9690:  46 03		 LSR tmp3			; Temporary 3
$9692:  66 02		 ROR tmp2			; Temporary 2
$9694:  60			RTS				 

; ------------------------------
sub_9695:
$9695:  AD DF 75	  LDA $75DF		   
$9698:  85 00		 STA tmp0			; Temporary 0
$969A:  AD E0 75	  LDA $75E0		   
$969D:  85 01		 STA tmp1			; Temporary 1
$969F:  60			RTS				 

; ------------------------------
sub_96A0:
$96A0:  20 58 96	  JSR $9658		   
$96A3:  20 AD 96	  JSR $96AD		   
$96A6:  A5 0F		 LDA $0F			 
$96A8:  10 1B		 BPL $96C5		   
$96AA:  4C C2 A9	  JMP $A9C2		   

; ------------------------------
sub_96AD:
$96AD:  20 C6 96	  JSR $96C6		   
$96B0:  90 13		 BCC $96C5		   
$96B2:  C6 0F		 DEC $0F			 
$96B4:  A9 10		 LDA #$10			
$96B6:  8D D1 75	  STA act_ptr		 ; Action pointer
$96B9:  20 A3 97	  JSR $97A3		   
$96BC:  20 C0 97	  JSR $97C0		   
$96BF:  20 00 98	  JSR $9800		   
$96C2:  20 D7 97	  JSR $97D7		   
$96C5:  60			RTS				 

; ------------------------------
sub_96C6:
$96C6:  A9 00		 LDA #$00			
$96C8:  85 00		 STA tmp0			; Temporary 0
$96CA:  85 01		 STA tmp1			; Temporary 1
$96CC:  85 0F		 STA $0F			 
$96CE:  A6 81		 LDX party_loop	  ; Party loop counter
$96D0:  A9 40		 LDA #$40			
$96D2:  20 F2 85	  JSR $85F2		   
$96D5:  F0 1A		 BEQ $96F1		   
$96D7:  88			DEY				 
$96D8:  AD F0 75	  LDA btl_f0		  ; Battle flag F0
$96DB:  30 06		 BMI $96E3		   
$96DD:  A9 C0		 LDA #$C0			
$96DF:  31 86		 AND (stat_ptr_lo),Y ; Stat table pointer low
$96E1:  D0 0E		 BNE $96F1		   
$96E3:  C8			INY				 
$96E4:  C8			INY				 
$96E5:  A9 02		 LDA #$02			
$96E7:  31 86		 AND (stat_ptr_lo),Y ; Stat table pointer low
$96E9:  D0 06		 BNE $96F1		   
$96EB:  A5 8C		 LDA action_param	; Action parameter
$96ED:  F0 02		 BEQ $96F1		   
$96EF:  38			SEC				 
$96F0:  60			RTS				 
$96F1:  18			CLC				 
$96F2:  60			RTS				 

; ------------------------------
sub_96F3:
$96F3:  20 58 96	  JSR $9658		   
$96F6:  A9 07		 LDA #$07			
$96F8:  85 81		 STA party_loop	  ; Party loop counter
$96FA:  20 02 86	  JSR $8602		   
$96FD:  D0 12		 BNE $9711		   
$96FF:  A6 81		 LDX party_loop	  ; Party loop counter
$9701:  A9 40		 LDA #$40			
$9703:  20 EE 85	  JSR $85EE		   
$9706:  D0 13		 BNE $971B		   
$9708:  20 76 92	  JSR stat_lookup	 ; Stat table lookup
$970B:  20 AD 96	  JSR $96AD		   
$970E:  20 6B 96	  JSR $966B		   
$9711:  C6 81		 DEC party_loop	  ; Party loop counter
$9713:  10 E5		 BPL $96FA		   
$9715:  20 95 96	  JSR $9695		   
$9718:  4C C2 A9	  JMP $A9C2		   
$971B:  60			RTS				 
$971C:  20 58 96	  JSR $9658		   
$971F:  A9 07		 LDA #$07			
$9721:  85 81		 STA party_loop	  ; Party loop counter
$9723:  20 76 92	  JSR stat_lookup	 ; Stat table lookup
$9726:  20 AD 96	  JSR $96AD		   
$9729:  20 6B 96	  JSR $966B		   
$972C:  C6 81		 DEC party_loop	  ; Party loop counter
$972E:  10 F3		 BPL $9723		   
$9730:  20 95 96	  JSR $9695		   
$9733:  4C C2 A9	  JMP $A9C2		   

; ------------------------------
sub_9736:
$9736:  20 58 96	  JSR $9658		   
$9739:  AD E8 75	  LDA spell_idx	   ; Spell index
$973C:  20 20 87	  JSR $8720		   
$973F:  A6 81		 LDX party_loop	  ; Party loop counter
$9741:  20 11 88	  JSR $8811		   
$9744:  20 23 88	  JSR $8823		   
$9747:  A5 94		 LDA $94			 
$9749:  05 95		 ORA $95			 
$974B:  D0 02		 BNE $974F		   
$974D:  E6 94		 INC $94			 
$974F:  A5 94		 LDA $94			 
$9751:  85 02		 STA tmp2			; Temporary 2
$9753:  A5 95		 LDA $95			 
$9755:  85 03		 STA tmp3			; Temporary 3
$9757:  20 7C 97	  JSR $977C		   
$975A:  20 A3 97	  JSR $97A3		   
$975D:  20 C0 97	  JSR $97C0		   
$9760:  20 00 98	  JSR $9800		   
$9763:  4C C2 A9	  JMP $A9C2		   

; ------------------------------
sub_9766:
$9766:  20 87 97	  JSR $9787		   
$9769:  A5 8A		 LDA char_count	  ; Character count
$976B:  20 51 C8	  JSR $C851		   
$976E:  A5 01		 LDA tmp1			; Temporary 1
$9770:  F0 04		 BEQ $9776		   
$9772:  A9 FF		 LDA #$FF			
$9774:  85 00		 STA tmp0			; Temporary 0
$9776:  A5 00		 LDA tmp0			; Temporary 0
$9778:  8D D1 75	  STA act_ptr		 ; Action pointer
$977B:  60			RTS				 

; ------------------------------
sub_977C:
$977C:  20 87 97	  JSR $9787		   
$977F:  A0 02		 LDY #$02			
$9781:  20 AA 83	  JSR add_pairs	   ; Add 16-bit pairs
$9784:  4C 6E 97	  JMP $976E		   

; ------------------------------
sub_9787:
$9787:  A6 81		 LDX party_loop	  ; Party loop counter
$9789:  20 C7 86	  JSR $86C7		   
$978C:  AD 80 6E	  LDA action_type	 ; Current action type
$978F:  C9 06		 CMP #$06			
$9791:  D0 0B		 BNE $979E		   
$9793:  18			CLC				 
$9794:  A5 00		 LDA tmp0			; Temporary 0
$9796:  69 64		 ADC #$64			
$9798:  85 00		 STA tmp0			; Temporary 0
$979A:  90 02		 BCC $979E		   
$979C:  E6 01		 INC tmp1			; Temporary 1
$979E:  A2 00		 LDX #$00			
$97A0:  4C 76 81	  JMP mul16		   ; Multiply by 16

; ------------------------------
sub_97A3:
$97A3:  20 77 8D	  JSR setup_ptr	   ; Setup char pointer
$97A6:  A0 36		 LDY #$36			
$97A8:  B1 88		 LDA (char_ptr_lo),Y ; Character data pointer low
$97AA:  85 00		 STA tmp0			; Temporary 0
$97AC:  C8			INY				 
$97AD:  B1 88		 LDA (char_ptr_lo),Y ; Character data pointer low
$97AF:  85 01		 STA tmp1			; Temporary 1
$97B1:  A0 38		 LDY #$38			
$97B3:  B1 88		 LDA (char_ptr_lo),Y ; Character data pointer low
$97B5:  48			PHA				 
$97B6:  C8			INY				 
$97B7:  B1 88		 LDA (char_ptr_lo),Y ; Character data pointer low
$97B9:  A8			TAY				 
$97BA:  68			PLA				 
$97BB:  A2 00		 LDX #$00			
$97BD:  4C 1D C8	  JMP $C81D		   

; ------------------------------
sub_97C0:
$97C0:  A2 00		 LDX #$00			
$97C2:  20 76 81	  JSR mul16		   ; Multiply by 16
$97C5:  AD D1 75	  LDA act_ptr		 ; Action pointer
$97C8:  29 F0		 AND #$F0			
$97CA:  D0 04		 BNE $97D0		   
$97CC:  A9 10		 LDA #$10			
$97CE:  D0 03		 BNE $97D3		   
$97D0:  AD D1 75	  LDA act_ptr		 ; Action pointer
$97D3:  4C 51 C8	  JMP $C851		   
$97D6:  60			RTS				 

; ------------------------------
sub_97D7:
$97D7:  A5 00		 LDA tmp0			; Temporary 0
$97D9:  48			PHA				 
$97DA:  A5 01		 LDA tmp1			; Temporary 1
$97DC:  48			PHA				 
$97DD:  00			BRK				 
							  ; Data region
		.byte $0F, $8F
$97E0:  A6 81		 LDX party_loop	  ; Party loop counter
$97E2:  20 C7 86	  JSR $86C7		   
$97E5:  A2 00		 LDX #$00			
$97E7:  A0 02		 LDY #$02			
$97E9:  20 76 81	  JSR mul16		   ; Multiply by 16
$97EC:  20 AA 83	  JSR add_pairs	   ; Add 16-bit pairs
$97EF:  A5 00		 LDA tmp0			; Temporary 0
$97F1:  29 1F		 AND #$1F			
$97F3:  85 02		 STA tmp2			; Temporary 2
$97F5:  68			PLA				 
$97F6:  85 01		 STA tmp1			; Temporary 1
$97F8:  68			PLA				 
$97F9:  85 00		 STA tmp0			; Temporary 0
$97FB:  A5 02		 LDA tmp2			; Temporary 2
$97FD:  4C 9A 81	  JMP $819A		   

; ------------------------------
sub_9800:
$9800:  A5 8C		 LDA action_param	; Action parameter
$9802:  C9 10		 CMP #$10			
$9804:  B0 D0		 BCS $97D6		   
$9806:  A2 00		 LDX #$00			
$9808:  4C 9A 81	  JMP $819A		   
$980B:  A9 00		 LDA #$00			
$980D:  8D D2 75	  STA act_type		; Action type
$9810:  20 C5 99	  JSR $99C5		   
$9813:  A9 00		 LDA #$00			
$9815:  85 82		 STA inner_loop	  ; Inner loop counter
$9817:  A5 7B		 LDA calc_hit		; Calculated hit value
$9819:  29 03		 AND #$03			
$981B:  F0 03		 BEQ $9820		   
$981D:  20 26 AD	  JSR $AD26		   
$9820:  20 4A 93	  JSR $934A		   
$9823:  20 01 92	  JSR get_ene_idx	 ; Get enemy index
$9826:  20 B5 8A	  JSR $8AB5		   
$9829:  8D D2 75	  STA act_type		; Action type
$982C:  20 C2 93	  JSR $93C2		   
$982F:  A5 7B		 LDA calc_hit		; Calculated hit value
$9831:  46 7B		 LSR calc_hit		; Calculated hit value
$9833:  46 7B		 LSR calc_hit		; Calculated hit value
$9835:  29 03		 AND #$03			
$9837:  F0 0B		 BEQ $9844		   
$9839:  0A			ASL				 
$983A:  0A			ASL				 
$983B:  0A			ASL				 
$983C:  0A			ASL				 
$983D:  05 8D		 ORA $8D			 
$983F:  85 8D		 STA $8D			 
$9841:  20 48 99	  JSR $9948		   
$9844:  E6 82		 INC inner_loop	  ; Inner loop counter
$9846:  A5 82		 LDA inner_loop	  ; Inner loop counter
$9848:  C9 04		 CMP #$04			
$984A:  90 CB		 BCC $9817		   
$984C:  60			RTS				 
$984D:  A9 00		 LDA #$00			
$984F:  8D D2 75	  STA act_type		; Action type
$9852:  20 C2 93	  JSR $93C2		   
$9855:  20 C5 99	  JSR $99C5		   
$9858:  AD 80 6E	  LDA action_type	 ; Current action type
$985B:  C9 01		 CMP #$01			
$985D:  F0 4C		 BEQ $98AB		   
$985F:  A5 7C		 LDA $7C			 
$9861:  C9 03		 CMP #$03			
$9863:  90 46		 BCC $98AB		   
$9865:  A9 00		 LDA #$00			
$9867:  85 82		 STA inner_loop	  ; Inner loop counter
$9869:  85 8A		 STA char_count	  ; Character count
$986B:  A5 7B		 LDA calc_hit		; Calculated hit value
$986D:  29 03		 AND #$03			
$986F:  F0 25		 BEQ $9896		   
$9871:  20 10 86	  JSR $8610		   
$9874:  90 20		 BCC $9896		   
$9876:  20 1C 86	  JSR $861C		   
$9879:  38			SEC				 
$987A:  A5 02		 LDA tmp2			; Temporary 2
$987C:  E5 00		 SBC tmp0			; Temporary 0
$987E:  85 02		 STA tmp2			; Temporary 2
$9880:  A5 03		 LDA tmp3			; Temporary 3
$9882:  E5 01		 SBC tmp1			; Temporary 1
$9884:  85 03		 STA tmp3			; Temporary 3
$9886:  A5 03		 LDA tmp3			; Temporary 3
$9888:  D0 0A		 BNE $9894		   
$988A:  A5 02		 LDA tmp2			; Temporary 2
$988C:  C9 46		 CMP #$46			
$988E:  90 06		 BCC $9896		   
$9890:  C9 6E		 CMP #$6E			
$9892:  B0 02		 BCS $9896		   
$9894:  E6 8A		 INC char_count	  ; Character count
$9896:  46 7B		 LSR calc_hit		; Calculated hit value
$9898:  46 7B		 LSR calc_hit		; Calculated hit value
$989A:  E6 82		 INC inner_loop	  ; Inner loop counter
$989C:  A5 82		 LDA inner_loop	  ; Inner loop counter
$989E:  C9 04		 CMP #$04			
$98A0:  90 C9		 BCC $986B		   
$98A2:  A9 FF		 LDA #$FF			
$98A4:  85 8C		 STA action_param	; Action parameter
$98A6:  85 8D		 STA $8D			 
$98A8:  4C CA AB	  JMP $ABCA		   
$98AB:  60			RTS				 
$98AC:  20 33 99	  JSR $9933		   
$98AF:  D0 07		 BNE $98B8		   
$98B1:  AD DB 75	  LDA act_id		  ; Action ID
$98B4:  C9 29		 CMP #$29			
$98B6:  D0 03		 BNE $98BB		   
$98B8:  4C 0B 98	  JMP $980B		   
$98BB:  60			RTS				 
$98BC:  20 33 99	  JSR $9933		   
$98BF:  D0 25		 BNE $98E6		   
$98C1:  AD DB 75	  LDA act_id		  ; Action ID
$98C4:  C9 29		 CMP #$29			
$98C6:  F0 13		 BEQ $98DB		   
$98C8:  C9 2A		 CMP #$2A			
$98CA:  F0 0F		 BEQ $98DB		   
$98CC:  C9 2B		 CMP #$2B			
$98CE:  F0 05		 BEQ $98D5		   
$98D0:  C9 94		 CMP #$94			
$98D2:  D0 07		 BNE $98DB		   
$98D4:  60			RTS				 
$98D5:  AE 80 6E	  LDX action_type	 ; Current action type
$98D8:  CA			DEX				 
$98D9:  D0 F9		 BNE $98D4		   
$98DB:  AD DA 75	  LDA act_cat		 ; Action category
$98DE:  29 0F		 AND #$0F			
$98E0:  20 AB 8A	  JSR $8AAB		   
$98E3:  CD E8 75	  CMP spell_idx	   ; Spell index
$98E6:  4C 0B 98	  JMP $980B		   
$98E9:  20 33 99	  JSR $9933		   
$98EC:  D0 0B		 BNE $98F9		   
$98EE:  A5 00		 LDA tmp0			; Temporary 0
$98F0:  10 0A		 BPL $98FC		   
$98F2:  AD F2 75	  LDA $75F2		   
$98F5:  C9 60		 CMP #$60			
$98F7:  F0 14		 BEQ $990D		   
$98F9:  4C 0B 98	  JMP $980B		   
$98FC:  AE 80 6E	  LDX action_type	 ; Current action type
$98FF:  CA			DEX				 
$9900:  F0 F7		 BEQ $98F9		   
$9902:  AD DB 75	  LDA act_id		  ; Action ID
$9905:  C9 2B		 CMP #$2B			
$9907:  F0 04		 BEQ $990D		   
$9909:  C9 2C		 CMP #$2C			
$990B:  D0 EC		 BNE $98F9		   
$990D:  60			RTS				 
$990E:  20 33 99	  JSR $9933		   
$9911:  D0 13		 BNE $9926		   
$9913:  A5 00		 LDA tmp0			; Temporary 0
$9915:  30 14		 BMI $992B		   
$9917:  AD DB 75	  LDA act_id		  ; Action ID
$991A:  C9 2B		 CMP #$2B			
$991C:  D0 0D		 BNE $992B		   
$991E:  20 3D 99	  JSR $993D		   
$9921:  C9 02		 CMP #$02			
$9923:  B0 06		 BCS $992B		   
$9925:  60			RTS				 
$9926:  20 3D 99	  JSR $993D		   
$9929:  F0 FA		 BEQ $9925		   
$992B:  A9 20		 LDA #$20			
$992D:  8D D2 75	  STA act_type		; Action type
$9930:  4C CA AB	  JMP $ABCA		   

; ------------------------------
sub_9933:
$9933:  20 06 94	  JSR $9406		   
$9936:  85 00		 STA tmp0			; Temporary 0
$9938:  29 7F		 AND #$7F			
$993A:  C9 01		 CMP #$01			
$993C:  60			RTS				 

; ------------------------------
sub_993D:
$993D:  A9 20		 LDA #$20			
$993F:  8D D2 75	  STA act_type		; Action type
$9942:  20 C5 99	  JSR $99C5		   
$9945:  A5 7C		 LDA $7C			 
$9947:  60			RTS				 

; ------------------------------
sub_9948:
$9948:  A9 00		 LDA #$00			
$994A:  85 00		 STA tmp0			; Temporary 0
$994C:  85 01		 STA tmp1			; Temporary 1
$994E:  A5 82		 LDA inner_loop	  ; Inner loop counter
$9950:  20 10 86	  JSR $8610		   
$9953:  A5 82		 LDA inner_loop	  ; Inner loop counter
$9955:  20 1C 86	  JSR $861C		   
$9958:  20 9F 99	  JSR $999F		   
$995B:  A5 8A		 LDA char_count	  ; Character count
$995D:  C9 FF		 CMP #$FF			
$995F:  F0 33		 BEQ $9994		   
$9961:  A2 00		 LDX #$00			
$9963:  20 13 C8	  JSR $C813		   
$9966:  A5 82		 LDA inner_loop	  ; Inner loop counter
$9968:  20 1C 86	  JSR $861C		   
$996B:  A2 00		 LDX #$00			
$996D:  20 76 81	  JSR mul16		   ; Multiply by 16
$9970:  A0 02		 LDY #$02			
$9972:  20 AA 83	  JSR add_pairs	   ; Add 16-bit pairs
$9975:  A5 00		 LDA tmp0			; Temporary 0
$9977:  29 F0		 AND #$F0			
$9979:  05 01		 ORA tmp1			; Temporary 1
$997B:  D0 17		 BNE $9994		   
$997D:  A5 00		 LDA tmp0			; Temporary 0
$997F:  85 01		 STA tmp1			; Temporary 1
$9981:  A9 00		 LDA #$00			
$9983:  85 00		 STA tmp0			; Temporary 0
$9985:  20 65 93	  JSR get_tact_1	  ; Get tactics spell 1
$9988:  C5 01		 CMP tmp1			; Temporary 1
$998A:  90 08		 BCC $9994		   
$998C:  F0 06		 BEQ $9994		   
$998E:  20 51 C8	  JSR $C851		   
$9991:  4C 98 99	  JMP $9998		   
$9994:  A9 FF		 LDA #$FF			
$9996:  85 00		 STA tmp0			; Temporary 0
$9998:  A9 00		 LDA #$00			
$999A:  85 01		 STA tmp1			; Temporary 1
$999C:  4C 92 AB	  JMP $AB92		   

; ------------------------------
sub_999F:
$999F:  38			SEC				 
$99A0:  A5 02		 LDA tmp2			; Temporary 2
$99A2:  E5 00		 SBC tmp0			; Temporary 0
$99A4:  85 04		 STA $04			 
$99A6:  A5 03		 LDA tmp3			; Temporary 3
$99A8:  E5 01		 SBC tmp1			; Temporary 1
$99AA:  85 05		 STA $05			 
$99AC:  A5 8A		 LDA char_count	  ; Character count
$99AE:  C9 FF		 CMP #$FF			
$99B0:  F0 12		 BEQ $99C4		   
$99B2:  A5 05		 LDA $05			 
$99B4:  D0 06		 BNE $99BC		   
$99B6:  A5 04		 LDA $04			 
$99B8:  C5 8A		 CMP char_count	  ; Character count
$99BA:  90 08		 BCC $99C4		   
$99BC:  A5 8A		 LDA char_count	  ; Character count
$99BE:  85 04		 STA $04			 
$99C0:  A9 00		 LDA #$00			
$99C2:  85 05		 STA $05			 
$99C4:  60			RTS				 

; ------------------------------
sub_99C5:
$99C5:  20 0B 9A	  JSR $9A0B		   
$99C8:  A9 00		 LDA #$00			
$99CA:  85 7C		 STA $7C			 
$99CC:  85 7B		 STA calc_hit		; Calculated hit value
$99CE:  85 82		 STA inner_loop	  ; Inner loop counter
$99D0:  A5 82		 LDA inner_loop	  ; Inner loop counter
$99D2:  20 0D 9B	  JSR $9B0D		   
$99D5:  90 23		 BCC $99FA		   
$99D7:  AD D3 75	  LDA target		  ; Target index
$99DA:  C9 8F		 CMP #$8F			
$99DC:  D0 08		 BNE $99E6		   
$99DE:  20 66 88	  JSR $8866		   
$99E1:  CD E8 75	  CMP spell_idx	   ; Spell index
$99E4:  D0 14		 BNE $99FA		   
$99E6:  20 03 9A	  JSR $9A03		   
$99E9:  05 7B		 ORA calc_hit		; Calculated hit value
$99EB:  85 7B		 STA calc_hit		; Calculated hit value
$99ED:  88			DEY				 
$99EE:  30 08		 BMI $99F8		   
$99F0:  20 03 9A	  JSR $9A03		   
$99F3:  18			CLC				 
$99F4:  65 7B		 ADC calc_hit		; Calculated hit value
$99F6:  85 7B		 STA calc_hit		; Calculated hit value
$99F8:  E6 7C		 INC $7C			 
$99FA:  E6 82		 INC inner_loop	  ; Inner loop counter
$99FC:  A5 82		 LDA inner_loop	  ; Inner loop counter
$99FE:  C9 04		 CMP #$04			
$9A00:  90 CE		 BCC $99D0		   
$9A02:  60			RTS				 

; ------------------------------
sub_9A03:
$9A03:  A5 82		 LDA inner_loop	  ; Inner loop counter
$9A05:  0A			ASL				 
$9A06:  AA			TAX				 
$9A07:  BD 5E FF	  LDA $FF5E,X		 
$9A0A:  60			RTS				 

; ------------------------------
sub_9A0B:
$9A0B:  A9 00		 LDA #$00			
$9A0D:  85 8A		 STA char_count	  ; Character count
$9A0F:  85 8B		 STA actor_idx	   ; Current actor index
$9A11:  85 8C		 STA action_param	; Action parameter
$9A13:  85 8D		 STA $8D			 
$9A15:  85 8E		 STA $8E			 
$9A17:  85 8F		 STA $8F			 
$9A19:  85 90		 STA $90			 
$9A1B:  85 91		 STA $91			 
$9A1D:  8D C1 75	  STA $75C1		   
$9A20:  8D C2 75	  STA $75C2		   
$9A23:  8D C3 75	  STA $75C3		   
$9A26:  8D C4 75	  STA $75C4		   
$9A29:  8D C5 75	  STA $75C5		   
$9A2C:  8D C6 75	  STA $75C6		   
$9A2F:  8D C7 75	  STA $75C7		   
$9A32:  8D C8 75	  STA $75C8		   
$9A35:  A9 07		 LDA #$07			
$9A37:  85 81		 STA party_loop	  ; Party loop counter
$9A39:  20 77 8D	  JSR setup_ptr	   ; Setup char pointer
$9A3C:  A0 00		 LDY #$00			
$9A3E:  20 50 9A	  JSR $9A50		   
$9A41:  A0 08		 LDY #$08			
$9A43:  20 50 9A	  JSR $9A50		   
$9A46:  A0 10		 LDY #$10			
$9A48:  20 50 9A	  JSR $9A50		   
$9A4B:  C6 81		 DEC party_loop	  ; Party loop counter
$9A4D:  10 EA		 BPL $9A39		   
$9A4F:  60			RTS				 

; ------------------------------
sub_9A50:
$9A50:  A9 00		 LDA #$00			
$9A52:  85 82		 STA inner_loop	  ; Inner loop counter
$9A54:  20 AA 9A	  JSR $9AAA		   
$9A57:  C8			INY				 
$9A58:  A6 81		 LDX party_loop	  ; Party loop counter
$9A5A:  BD 5E FF	  LDA $FF5E,X		 
$9A5D:  25 7B		 AND calc_hit		; Calculated hit value
$9A5F:  F0 3F		 BEQ $9AA0		   
$9A61:  88			DEY				 
$9A62:  B1 88		 LDA (char_ptr_lo),Y ; Character data pointer low
$9A64:  85 01		 STA tmp1			; Temporary 1
$9A66:  85 03		 STA tmp3			; Temporary 3
$9A68:  C8			INY				 
$9A69:  B1 88		 LDA (char_ptr_lo),Y ; Character data pointer low
$9A6B:  85 02		 STA tmp2			; Temporary 2
$9A6D:  85 04		 STA $04			 
$9A6F:  20 9A 93	  JSR get_tact_3	  ; Get tactics spell 3
$9A72:  A2 01		 LDX #$01			
$9A74:  20 9A 81	  JSR $819A		   
$9A77:  20 7A 93	  JSR get_tact_2	  ; Get tactics spell 2
$9A7A:  A2 03		 LDX #$03			
$9A7C:  20 30 83	  JSR mult_a		  ; Multiply by A
$9A7F:  A5 82		 LDA inner_loop	  ; Inner loop counter
$9A81:  0A			ASL				 
$9A82:  AA			TAX				 
$9A83:  A5 01		 LDA tmp1			; Temporary 1
$9A85:  75 8A		 ADC $8A,X		   
$9A87:  95 8A		 STA $8A,X		   
$9A89:  A5 02		 LDA tmp2			; Temporary 2
$9A8B:  75 8B		 ADC $8B,X		   
$9A8D:  95 8B		 STA $8B,X		   
$9A8F:  18			CLC				 
$9A90:  BD C1 75	  LDA $75C1,X		 
$9A93:  65 04		 ADC $04			 
$9A95:  9D C1 75	  STA $75C1,X		 
$9A98:  BD C2 75	  LDA $75C2,X		 
$9A9B:  65 19		 ADC mult_hi		 ; Product high
$9A9D:  9D C2 75	  STA $75C2,X		 
$9AA0:  C8			INY				 
$9AA1:  E6 82		 INC inner_loop	  ; Inner loop counter
$9AA3:  A5 82		 LDA inner_loop	  ; Inner loop counter
$9AA5:  C9 04		 CMP #$04			
$9AA7:  90 AB		 BCC $9A54		   
$9AA9:  60			RTS				 

; ------------------------------
sub_9AAA:
$9AAA:  98			TYA				 
$9AAB:  48			PHA				 
$9AAC:  20 B2 9A	  JSR $9AB2		   
$9AAF:  68			PLA				 
$9AB0:  A8			TAY				 
$9AB1:  60			RTS				 

; ------------------------------
sub_9AB2:
$9AB2:  20 D0 93	  JSR $93D0		   
$9AB5:  90 1F		 BCC $9AD6		   
$9AB7:  BD 48 73	  LDA $7348,X		 
$9ABA:  85 00		 STA tmp0			; Temporary 0
$9ABC:  AE EA 75	  LDX $75EA		   
$9ABF:  AD EB 75	  LDA $75EB		   
$9AC2:  30 12		 BMI $9AD6		   
$9AC4:  29 70		 AND #$70			
$9AC6:  C9 20		 CMP #$20			
$9AC8:  F0 12		 BEQ $9ADC		   
$9ACA:  C9 10		 CMP #$10			
$9ACC:  F0 08		 BEQ $9AD6		   
$9ACE:  E0 29		 CPX #$29			
$9AD0:  90 04		 BCC $9AD6		   
$9AD2:  E0 2C		 CPX #$2C			
$9AD4:  90 0E		 BCC $9AE4		   
$9AD6:  A9 FF		 LDA #$FF			
$9AD8:  85 7B		 STA calc_hit		; Calculated hit value
$9ADA:  D0 2D		 BNE $9B09		   
$9ADC:  E0 53		 CPX #$53			
$9ADE:  F0 04		 BEQ $9AE4		   
$9AE0:  E0 40		 CPX #$40			
$9AE2:  D0 F2		 BNE $9AD6		   
$9AE4:  AD EB 75	  LDA $75EB		   
$9AE7:  29 0F		 AND #$0F			
$9AE9:  C5 82		 CMP inner_loop	  ; Inner loop counter
$9AEB:  D0 E9		 BNE $9AD6		   
$9AED:  A9 00		 LDA #$00			
$9AEF:  85 7B		 STA calc_hit		; Calculated hit value
$9AF1:  A2 07		 LDX #$07			
$9AF3:  BD 4C 73	  LDA $734C,X		 
$9AF6:  CD 5B 73	  CMP $735B		   
$9AF9:  90 0B		 BCC $9B06		   
$9AFB:  C5 00		 CMP tmp0			; Temporary 0
$9AFD:  B0 07		 BCS $9B06		   
$9AFF:  BD 5E FF	  LDA $FF5E,X		 
$9B02:  05 7B		 ORA calc_hit		; Calculated hit value
$9B04:  85 7B		 STA calc_hit		; Calculated hit value
$9B06:  CA			DEX				 
$9B07:  10 EA		 BPL $9AF3		   
$9B09:  A5 7B		 LDA calc_hit		; Calculated hit value
$9B0B:  60			RTS				 
$9B0C:  60			RTS				 

; ------------------------------
sub_9B0D:
$9B0D:  A5 82		 LDA inner_loop	  ; Inner loop counter
$9B0F:  20 1C 86	  JSR $861C		   
$9B12:  90 F8		 BCC $9B0C		   
$9B14:  A0 00		 LDY #$00			
$9B16:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$9B18:  10 7B		 BPL $9B95		   
$9B1A:  AD D2 75	  LDA act_type		; Action type
$9B1D:  29 70		 AND #$70			
$9B1F:  F0 18		 BEQ $9B39		   
$9B21:  20 66 88	  JSR $8866		   
$9B24:  CD E8 75	  CMP spell_idx	   ; Spell index
$9B27:  F0 10		 BEQ $9B39		   
$9B29:  20 F5 89	  JSR get_act_2	   ; Get secondary action
$9B2C:  AD F0 75	  LDA btl_f0		  ; Battle flag F0
$9B2F:  30 08		 BMI $9B39		   
$9B31:  A0 05		 LDY #$05			
$9B33:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$9B35:  29 C0		 AND #$C0			
$9B37:  D0 5C		 BNE $9B95		   
$9B39:  A5 82		 LDA inner_loop	  ; Inner loop counter
$9B3B:  20 66 88	  JSR $8866		   
$9B3E:  20 F5 89	  JSR get_act_2	   ; Get secondary action
$9B41:  A0 05		 LDY #$05			
$9B43:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$9B45:  29 04		 AND #$04			
$9B47:  D0 4C		 BNE $9B95		   
$9B49:  A5 82		 LDA inner_loop	  ; Inner loop counter
$9B4B:  20 10 86	  JSR $8610		   
$9B4E:  20 97 9B	  JSR $9B97		   
$9B51:  90 42		 BCC $9B95		   
$9B53:  A9 03		 LDA #$03			
$9B55:  AE 80 6E	  LDX action_type	 ; Current action type
$9B58:  E0 03		 CPX #$03			
$9B5A:  F0 02		 BEQ $9B5E		   
$9B5C:  A9 04		 LDA #$04			
$9B5E:  A2 02		 LDX #$02			
$9B60:  20 51 C8	  JSR $C851		   
$9B63:  A5 82		 LDA inner_loop	  ; Inner loop counter
$9B65:  20 10 86	  JSR $8610		   
$9B68:  A5 82		 LDA inner_loop	  ; Inner loop counter
$9B6A:  0A			ASL				 
$9B6B:  AA			TAX				 
$9B6C:  38			SEC				 
$9B6D:  A5 00		 LDA tmp0			; Temporary 0
$9B6F:  F5 8A		 SBC $8A,X		   
$9B71:  85 04		 STA $04			 
$9B73:  A5 01		 LDA tmp1			; Temporary 1
$9B75:  F5 8B		 SBC $8B,X		   
$9B77:  85 05		 STA $05			 
$9B79:  A0 01		 LDY #$01			
$9B7B:  90 16		 BCC $9B93		   
$9B7D:  A5 04		 LDA $04			 
$9B7F:  E5 02		 SBC tmp2			; Temporary 2
$9B81:  A5 05		 LDA $05			 
$9B83:  E5 03		 SBC tmp3			; Temporary 3
$9B85:  B0 0E		 BCS $9B95		   
$9B87:  A5 82		 LDA inner_loop	  ; Inner loop counter
$9B89:  20 1C 86	  JSR $861C		   
$9B8C:  20 97 9B	  JSR $9B97		   
$9B8F:  90 04		 BCC $9B95		   
$9B91:  A0 00		 LDY #$00			
$9B93:  38			SEC				 
$9B94:  60			RTS				 
$9B95:  18			CLC				 
$9B96:  60			RTS				 

; ------------------------------
sub_9B97:
$9B97:  A2 00		 LDX #$00			
$9B99:  A0 02		 LDY #$02			
$9B9B:  20 76 81	  JSR mul16		   ; Multiply by 16
$9B9E:  20 AA 83	  JSR add_pairs	   ; Add 16-bit pairs
$9BA1:  A9 0D		 LDA #$0D			
$9BA3:  C5 00		 CMP tmp0			; Temporary 0
$9BA5:  60			RTS				 
$9BA6:  20 01 92	  JSR get_ene_idx	 ; Get enemy index
$9BA9:  A9 07		 LDA #$07			
$9BAB:  85 81		 STA party_loop	  ; Party loop counter
$9BAD:  20 76 92	  JSR stat_lookup	 ; Stat table lookup
$9BB0:  20 AB 93	  JSR $93AB		   
$9BB3:  20 A8 9C	  JSR $9CA8		   
$9BB6:  C6 81		 DEC party_loop	  ; Party loop counter
$9BB8:  10 F3		 BPL $9BAD		   
$9BBA:  60			RTS				 
$9BBB:  20 01 92	  JSR get_ene_idx	 ; Get enemy index
$9BBE:  A9 03		 LDA #$03			
$9BC0:  85 8D		 STA $8D			 
$9BC2:  20 B4 93	  JSR $93B4		   
$9BC5:  20 3A 9C	  JSR $9C3A		   
$9BC8:  C6 8D		 DEC $8D			 
$9BCA:  10 F6		 BPL $9BC2		   
$9BCC:  60			RTS				 
$9BCD:  20 01 92	  JSR get_ene_idx	 ; Get enemy index
$9BD0:  A9 07		 LDA #$07			
$9BD2:  85 81		 STA party_loop	  ; Party loop counter
$9BD4:  20 76 92	  JSR stat_lookup	 ; Stat table lookup
$9BD7:  20 AB 93	  JSR $93AB		   
$9BDA:  20 4B 9D	  JSR $9D4B		   
$9BDD:  C6 81		 DEC party_loop	  ; Party loop counter
$9BDF:  10 F3		 BPL $9BD4		   
$9BE1:  60			RTS				 
$9BE2:  AD E8 75	  LDA spell_idx	   ; Spell index
$9BE5:  20 F5 89	  JSR get_act_2	   ; Get secondary action
$9BE8:  A0 05		 LDY #$05			
$9BEA:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$9BEC:  29 C0		 AND #$C0			
$9BEE:  D0 49		 BNE $9C39		   
$9BF0:  20 01 92	  JSR get_ene_idx	 ; Get enemy index
$9BF3:  A9 07		 LDA #$07			
$9BF5:  85 81		 STA party_loop	  ; Party loop counter
$9BF7:  A9 00		 LDA #$00			
$9BF9:  85 00		 STA tmp0			; Temporary 0
$9BFB:  85 01		 STA tmp1			; Temporary 1
$9BFD:  20 77 8D	  JSR setup_ptr	   ; Setup char pointer
$9C00:  A0 08		 LDY #$08			
$9C02:  20 77 94	  JSR $9477		   
$9C05:  A0 18		 LDY #$18			
$9C07:  20 77 94	  JSR $9477		   
$9C0A:  A0 1C		 LDY #$1C			
$9C0C:  20 77 94	  JSR $9477		   
$9C0F:  A0 20		 LDY #$20			
$9C11:  20 77 94	  JSR $9477		   
$9C14:  C6 81		 DEC party_loop	  ; Party loop counter
$9C16:  10 E5		 BPL $9BFD		   
$9C18:  A2 00		 LDX #$00			
$9C1A:  20 16 82	  JSR $8216		   
$9C1D:  A9 10		 LDA #$10			
$9C1F:  85 8C		 STA action_param	; Action parameter
$9C21:  8D D1 75	  STA act_ptr		 ; Action pointer
$9C24:  A9 00		 LDA #$00			
$9C26:  8D D2 75	  STA act_type		; Action type
$9C29:  AD F0 75	  LDA btl_f0		  ; Battle flag F0
$9C2C:  10 08		 BPL $9C36		   
$9C2E:  AD D2 75	  LDA act_type		; Action type
$9C31:  09 20		 ORA #$20			
$9C33:  8D D2 75	  STA act_type		; Action type
$9C36:  4C A3 AC	  JMP $ACA3		   
$9C39:  60			RTS				 

; ------------------------------
sub_9C3A:
$9C3A:  A9 00		 LDA #$00			
$9C3C:  8D DF 75	  STA $75DF		   
$9C3F:  8D E0 75	  STA $75E0		   
$9C42:  A9 07		 LDA #$07			
$9C44:  85 81		 STA party_loop	  ; Party loop counter
$9C46:  20 02 86	  JSR $8602		   
$9C49:  D0 2C		 BNE $9C77		   
$9C4B:  AD F0 75	  LDA btl_f0		  ; Battle flag F0
$9C4E:  30 10		 BMI $9C60		   
$9C50:  AD D3 75	  LDA target		  ; Target index
$9C53:  C9 19		 CMP #$19			
$9C55:  D0 09		 BNE $9C60		   
$9C57:  A6 81		 LDX party_loop	  ; Party loop counter
$9C59:  A9 40		 LDA #$40			
$9C5B:  20 EE 85	  JSR $85EE		   
$9C5E:  D0 28		 BNE $9C88		   
$9C60:  20 76 92	  JSR stat_lookup	 ; Stat table lookup
$9C63:  20 89 9C	  JSR $9C89		   
$9C66:  18			CLC				 
$9C67:  A5 00		 LDA tmp0			; Temporary 0
$9C69:  6D DF 75	  ADC $75DF		   
$9C6C:  8D DF 75	  STA $75DF		   
$9C6F:  A5 01		 LDA tmp1			; Temporary 1
$9C71:  6D E0 75	  ADC $75E0		   
$9C74:  8D E0 75	  STA $75E0		   
$9C77:  C6 81		 DEC party_loop	  ; Party loop counter
$9C79:  10 CB		 BPL $9C46		   
$9C7B:  AD DF 75	  LDA $75DF		   
$9C7E:  85 00		 STA tmp0			; Temporary 0
$9C80:  AD E0 75	  LDA $75E0		   
$9C83:  85 01		 STA tmp1			; Temporary 1
$9C85:  4C A3 AC	  JMP $ACA3		   
$9C88:  60			RTS				 

; ------------------------------
sub_9C89:
$9C89:  AD D3 75	  LDA target		  ; Target index
$9C8C:  C9 17		 CMP #$17			
$9C8E:  F0 22		 BEQ $9CB2		   
$9C90:  C9 19		 CMP #$19			
$9C92:  F0 70		 BEQ $9D04		   
$9C94:  C9 88		 CMP #$88			
$9C96:  F0 6C		 BEQ $9D04		   
$9C98:  C9 9D		 CMP #$9D			
$9C9A:  F0 68		 BEQ $9D04		   
$9C9C:  C9 8D		 CMP #$8D			
$9C9E:  F0 3C		 BEQ $9CDC		   
$9CA0:  C9 1A		 CMP #$1A			
$9CA2:  F0 01		 BEQ $9CA5		   
$9CA4:  60			RTS				 
$9CA5:  4C 2D 9D	  JMP $9D2D		   

; ------------------------------
sub_9CA8:
$9CA8:  20 B2 9C	  JSR $9CB2		   
$9CAB:  A5 0F		 LDA $0F			 
$9CAD:  10 22		 BPL $9CD1		   
$9CAF:  4C A3 AC	  JMP $ACA3		   

; ------------------------------
sub_9CB2:
$9CB2:  20 C6 96	  JSR $96C6		   
$9CB5:  90 1A		 BCC $9CD1		   
$9CB7:  A0 05		 LDY #$05			
$9CB9:  B1 86		 LDA (stat_ptr_lo),Y ; Stat table pointer low
$9CBB:  4A			LSR				 
$9CBC:  B0 13		 BCS $9CD1		   
$9CBE:  C6 0F		 DEC $0F			 
$9CC0:  A9 20		 LDA #$20			
$9CC2:  8D D1 75	  STA act_ptr		 ; Action pointer
$9CC5:  20 A3 97	  JSR $97A3		   
$9CC8:  20 C0 97	  JSR $97C0		   
$9CCB:  20 D7 97	  JSR $97D7		   
$9CCE:  20 00 98	  JSR $9800		   
$9CD1:  60			RTS				 
$9CD2:  20 DC 9C	  JSR $9CDC		   
$9CD5:  A5 0F		 LDA $0F			 
$9CD7:  10 2A		 BPL $9D03		   
$9CD9:  4C A3 AC	  JMP $ACA3		   

; ------------------------------
sub_9CDC:
$9CDC:  20 C6 96	  JSR $96C6		   
$9CDF:  90 22		 BCC $9D03		   
$9CE1:  A0 05		 LDY #$05			
$9CE3:  B1 86		 LDA (stat_ptr_lo),Y ; Stat table pointer low
$9CE5:  4A			LSR				 
$9CE6:  B0 1B		 BCS $9D03		   
$9CE8:  C8			INY				 
$9CE9:  C8			INY				 
$9CEA:  B1 86		 LDA (stat_ptr_lo),Y ; Stat table pointer low
$9CEC:  29 F0		 AND #$F0			
$9CEE:  D0 13		 BNE $9D03		   
$9CF0:  C6 0F		 DEC $0F			 
$9CF2:  A9 60		 LDA #$60			
$9CF4:  8D D1 75	  STA act_ptr		 ; Action pointer
$9CF7:  20 A3 97	  JSR $97A3		   
$9CFA:  20 C0 97	  JSR $97C0		   
$9CFD:  20 D7 97	  JSR $97D7		   
$9D00:  20 00 98	  JSR $9800		   
$9D03:  60			RTS				 
$9D04:  20 C6 96	  JSR $96C6		   
$9D07:  90 23		 BCC $9D2C		   
$9D09:  A0 05		 LDY #$05			
$9D0B:  B1 86		 LDA (stat_ptr_lo),Y ; Stat table pointer low
$9D0D:  29 08		 AND #$08			
$9D0F:  D0 1B		 BNE $9D2C		   
$9D11:  C6 0F		 DEC $0F			 
$9D13:  A9 10		 LDA #$10			
$9D15:  8D D1 75	  STA act_ptr		 ; Action pointer
$9D18:  20 77 8D	  JSR setup_ptr	   ; Setup char pointer
$9D1B:  A0 36		 LDY #$36			
$9D1D:  B1 88		 LDA (char_ptr_lo),Y ; Character data pointer low
$9D1F:  85 00		 STA tmp0			; Temporary 0
$9D21:  C8			INY				 
$9D22:  B1 88		 LDA (char_ptr_lo),Y ; Character data pointer low
$9D24:  85 01		 STA tmp1			; Temporary 1
$9D26:  20 D7 97	  JSR $97D7		   
$9D29:  20 00 98	  JSR $9800		   
$9D2C:  60			RTS				 
$9D2D:  20 C6 96	  JSR $96C6		   
$9D30:  90 18		 BCC $9D4A		   
$9D32:  A0 05		 LDY #$05			
$9D34:  B1 86		 LDA (stat_ptr_lo),Y ; Stat table pointer low
$9D36:  29 10		 AND #$10			
$9D38:  D0 10		 BNE $9D4A		   
$9D3A:  C6 0F		 DEC $0F			 
$9D3C:  A9 10		 LDA #$10			
$9D3E:  8D D1 75	  STA act_ptr		 ; Action pointer
$9D41:  20 76 9D	  JSR $9D76		   
$9D44:  20 D7 97	  JSR $97D7		   
$9D47:  20 00 98	  JSR $9800		   
$9D4A:  60			RTS				 

; ------------------------------
sub_9D4B:
$9D4B:  20 55 9D	  JSR $9D55		   
$9D4E:  A5 0F		 LDA $0F			 
$9D50:  10 23		 BPL $9D75		   
$9D52:  4C A3 AC	  JMP $ACA3		   

; ------------------------------
sub_9D55:
$9D55:  20 C6 96	  JSR $96C6		   
$9D58:  90 1B		 BCC $9D75		   
$9D5A:  A0 05		 LDY #$05			
$9D5C:  B1 86		 LDA (stat_ptr_lo),Y ; Stat table pointer low
$9D5E:  29 04		 AND #$04			
$9D60:  D0 13		 BNE $9D75		   
$9D62:  C6 0F		 DEC $0F			 
$9D64:  A9 10		 LDA #$10			
$9D66:  8D D1 75	  STA act_ptr		 ; Action pointer
$9D69:  20 A3 97	  JSR $97A3		   
$9D6C:  20 C0 97	  JSR $97C0		   
$9D6F:  20 D7 97	  JSR $97D7		   
$9D72:  20 00 98	  JSR $9800		   
$9D75:  60			RTS				 

; ------------------------------
sub_9D76:
$9D76:  20 77 8D	  JSR setup_ptr	   ; Setup char pointer
$9D79:  A9 00		 LDA #$00			
$9D7B:  85 00		 STA tmp0			; Temporary 0
$9D7D:  85 01		 STA tmp1			; Temporary 1
$9D7F:  A2 03		 LDX #$03			
$9D81:  A0 00		 LDY #$00			
$9D83:  18			CLC				 
$9D84:  B1 88		 LDA (char_ptr_lo),Y ; Character data pointer low
$9D86:  65 00		 ADC tmp0			; Temporary 0
$9D88:  85 00		 STA tmp0			; Temporary 0
$9D8A:  C8			INY				 
$9D8B:  B1 88		 LDA (char_ptr_lo),Y ; Character data pointer low
$9D8D:  65 01		 ADC tmp1			; Temporary 1
$9D8F:  85 01		 STA tmp1			; Temporary 1
$9D91:  C8			INY				 
$9D92:  CA			DEX				 
$9D93:  10 EE		 BPL $9D83		   
$9D95:  A9 0A		 LDA #$0A			
$9D97:  A2 00		 LDX #$00			
$9D99:  4C 9A 81	  JMP $819A		   
$9D9C:  A9 00		 LDA #$00			
$9D9E:  8D D2 75	  STA act_type		; Action type
$9DA1:  20 B0 9D	  JSR $9DB0		   
$9DA4:  A5 8A		 LDA char_count	  ; Character count
$9DA6:  F0 07		 BEQ $9DAF		   
$9DA8:  A9 02		 LDA #$02			
$9DAA:  85 8C		 STA action_param	; Action parameter
$9DAC:  20 63 AC	  JSR $AC63		   
$9DAF:  60			RTS				 

; ------------------------------
sub_9DB0:
$9DB0:  A9 00		 LDA #$00			
$9DB2:  85 82		 STA inner_loop	  ; Inner loop counter
$9DB4:  85 8A		 STA char_count	  ; Character count
$9DB6:  20 6B 8A	  JSR $8A6B		   
$9DB9:  90 28		 BCC $9DE3		   
$9DBB:  48			PHA				 
$9DBC:  A0 00		 LDY #$00			
$9DBE:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$9DC0:  10 20		 BPL $9DE2		   
$9DC2:  0A			ASL				 
$9DC3:  10 1D		 BPL $9DE2		   
$9DC5:  68			PLA				 
$9DC6:  AD D2 75	  LDA act_type		; Action type
$9DC9:  29 70		 AND #$70			
$9DCB:  C9 20		 CMP #$20			
$9DCD:  F0 0B		 BEQ $9DDA		   
$9DCF:  20 F5 89	  JSR get_act_2	   ; Get secondary action
$9DD2:  A0 05		 LDY #$05			
$9DD4:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$9DD6:  29 C0		 AND #$C0			
$9DD8:  D0 09		 BNE $9DE3		   
$9DDA:  A5 82		 LDA inner_loop	  ; Inner loop counter
$9DDC:  85 7B		 STA calc_hit		; Calculated hit value
$9DDE:  E6 8A		 INC char_count	  ; Character count
$9DE0:  10 01		 BPL $9DE3		   
$9DE2:  68			PLA				 
$9DE3:  E6 82		 INC inner_loop	  ; Inner loop counter
$9DE5:  A5 82		 LDA inner_loop	  ; Inner loop counter
$9DE7:  C9 04		 CMP #$04			
$9DE9:  90 CB		 BCC $9DB6		   
$9DEB:  60			RTS				 
$9DEC:  AD DB 75	  LDA act_id		  ; Action ID
$9DEF:  C9 98		 CMP #$98			
$9DF1:  F0 3D		 BEQ $9E30		   
$9DF3:  20 06 94	  JSR $9406		   
$9DF6:  29 7F		 AND #$7F			
$9DF8:  C9 01		 CMP #$01			
$9DFA:  F0 34		 BEQ $9E30		   
$9DFC:  48			PHA				 
$9DFD:  A9 20		 LDA #$20			
$9DFF:  8D D2 75	  STA act_type		; Action type
$9E02:  20 B0 9D	  JSR $9DB0		   
$9E05:  68			PLA				 
$9E06:  C9 02		 CMP #$02			
$9E08:  D0 08		 BNE $9E12		   
$9E0A:  A5 8A		 LDA char_count	  ; Character count
$9E0C:  F0 22		 BEQ $9E30		   
$9E0E:  C9 02		 CMP #$02			
$9E10:  B0 17		 BCS $9E29		   
$9E12:  A5 8A		 LDA char_count	  ; Character count
$9E14:  F0 1A		 BEQ $9E30		   
$9E16:  A5 7B		 LDA calc_hit		; Calculated hit value
$9E18:  85 82		 STA inner_loop	  ; Inner loop counter
$9E1A:  20 B5 8A	  JSR $8AB5		   
$9E1D:  09 20		 ORA #$20			
$9E1F:  8D D2 75	  STA act_type		; Action type
$9E22:  A9 02		 LDA #$02			
$9E24:  85 8C		 STA action_param	; Action parameter
$9E26:  4C 63 AC	  JMP $AC63		   
$9E29:  AD DB 75	  LDA act_id		  ; Action ID
$9E2C:  C9 2E		 CMP #$2E			
$9E2E:  D0 E2		 BNE $9E12		   
$9E30:  60			RTS				 
$9E31:  A9 00		 LDA #$00			
$9E33:  D0 02		 BNE $9E37		   
$9E35:  A9 01		 LDA #$01			
$9E37:  85 8C		 STA action_param	; Action parameter
$9E39:  A9 00		 LDA #$00			
$9E3B:  85 82		 STA inner_loop	  ; Inner loop counter
$9E3D:  85 8A		 STA char_count	  ; Character count
$9E3F:  8D D2 75	  STA act_type		; Action type
$9E42:  85 00		 STA tmp0			; Temporary 0
$9E44:  85 01		 STA tmp1			; Temporary 1
$9E46:  20 6B 8A	  JSR $8A6B		   
$9E49:  90 30		 BCC $9E7B		   
$9E4B:  A0 00		 LDY #$00			
$9E4D:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$9E4F:  30 2A		 BMI $9E7B		   
$9E51:  A5 82		 LDA inner_loop	  ; Inner loop counter
$9E53:  20 1C 86	  JSR $861C		   
$9E56:  38			SEC				 
$9E57:  A5 00		 LDA tmp0			; Temporary 0
$9E59:  E5 02		 SBC tmp2			; Temporary 2
$9E5B:  A5 01		 LDA tmp1			; Temporary 1
$9E5D:  E5 03		 SBC tmp3			; Temporary 3
$9E5F:  B0 18		 BCS $9E79		   
$9E61:  A5 02		 LDA tmp2			; Temporary 2
$9E63:  85 00		 STA tmp0			; Temporary 0
$9E65:  A5 03		 LDA tmp3			; Temporary 3
$9E67:  85 01		 STA tmp1			; Temporary 1
$9E69:  20 B5 8A	  JSR $8AB5		   
$9E6C:  8D D2 75	  STA act_type		; Action type
$9E6F:  AE F0 75	  LDX btl_f0		  ; Battle flag F0
$9E72:  10 05		 BPL $9E79		   
$9E74:  09 20		 ORA #$20			
$9E76:  8D D2 75	  STA act_type		; Action type
$9E79:  E6 8A		 INC char_count	  ; Character count
$9E7B:  E6 82		 INC inner_loop	  ; Inner loop counter
$9E7D:  A5 82		 LDA inner_loop	  ; Inner loop counter
$9E7F:  C9 04		 CMP #$04			
$9E81:  90 C3		 BCC $9E46		   
$9E83:  A5 8A		 LDA char_count	  ; Character count
$9E85:  F0 03		 BEQ $9E8A		   
$9E87:  20 63 AC	  JSR $AC63		   
$9E8A:  60			RTS				 
$9E8B:  AD 80 6E	  LDA action_type	 ; Current action type
$9E8E:  C9 03		 CMP #$03			
$9E90:  D0 30		 BNE $9EC2		   
$9E92:  AD DC 75	  LDA $75DC		   
$9E95:  C9 0C		 CMP #$0C			
$9E97:  B0 29		 BCS $9EC2		   
$9E99:  A9 00		 LDA #$00			
$9E9B:  8D D2 75	  STA act_type		; Action type
$9E9E:  85 82		 STA inner_loop	  ; Inner loop counter
$9EA0:  85 8A		 STA char_count	  ; Character count
$9EA2:  20 6B 8A	  JSR $8A6B		   
$9EA5:  90 08		 BCC $9EAF		   
$9EA7:  A0 00		 LDY #$00			
$9EA9:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$9EAB:  30 02		 BMI $9EAF		   
$9EAD:  E6 8A		 INC char_count	  ; Character count
$9EAF:  E6 82		 INC inner_loop	  ; Inner loop counter
$9EB1:  A5 82		 LDA inner_loop	  ; Inner loop counter
$9EB3:  C9 04		 CMP #$04			
$9EB5:  90 EB		 BCC $9EA2		   
$9EB7:  A5 8A		 LDA char_count	  ; Character count
$9EB9:  C9 03		 CMP #$03			
$9EBB:  D0 05		 BNE $9EC2		   
$9EBD:  85 8C		 STA action_param	; Action parameter
$9EBF:  20 63 AC	  JSR $AC63		   
$9EC2:  60			RTS				 
$9EC3:  AD DC 75	  LDA $75DC		   
$9EC6:  C9 14		 CMP #$14			
$9EC8:  B0 59		 BCS $9F23		   
$9ECA:  85 00		 STA tmp0			; Temporary 0
$9ECC:  A9 14		 LDA #$14			
$9ECE:  20 4E 9F	  JSR $9F4E		   
$9ED1:  A9 0C		 LDA #$0C			
$9ED3:  20 27 C8	  JSR $C827		   
$9ED6:  A5 00		 LDA tmp0			; Temporary 0
$9ED8:  20 91 C8	  JSR $C891		   
$9EDB:  C5 00		 CMP tmp0			; Temporary 0
$9EDD:  B0 44		 BCS $9F23		   
$9EDF:  A2 FF		 LDX #$FF			
$9EE1:  8E D2 75	  STX act_type		; Action type
$9EE4:  E8			INX				 
$9EE5:  86 94		 STX $94			 
$9EE7:  86 95		 STX $95			 
$9EE9:  A9 07		 LDA #$07			
$9EEB:  85 81		 STA party_loop	  ; Party loop counter
$9EED:  20 24 9F	  JSR $9F24		   
$9EF0:  A5 00		 LDA tmp0			; Temporary 0
$9EF2:  05 01		 ORA tmp1			; Temporary 1
$9EF4:  F0 17		 BEQ $9F0D		   
$9EF6:  A5 00		 LDA tmp0			; Temporary 0
$9EF8:  E5 94		 SBC $94			 
$9EFA:  A5 01		 LDA tmp1			; Temporary 1
$9EFC:  E5 95		 SBC $95			 
$9EFE:  90 0D		 BCC $9F0D		   
$9F00:  A5 00		 LDA tmp0			; Temporary 0
$9F02:  85 94		 STA $94			 
$9F04:  A5 01		 LDA tmp1			; Temporary 1
$9F06:  85 94		 STA $94			 
$9F08:  A5 81		 LDA party_loop	  ; Party loop counter
$9F0A:  8D D2 75	  STA act_type		; Action type
$9F0D:  C6 81		 DEC party_loop	  ; Party loop counter
$9F0F:  10 DC		 BPL $9EED		   
$9F11:  AD D2 75	  LDA act_type		; Action type
$9F14:  C9 FF		 CMP #$FF			
$9F16:  F0 0B		 BEQ $9F23		   
$9F18:  09 80		 ORA #$80			
$9F1A:  8D DA 75	  STA act_cat		 ; Action category
$9F1D:  AD D3 75	  LDA target		  ; Target index
$9F20:  8D DB 75	  STA act_id		  ; Action ID
$9F23:  60			RTS				 

; ------------------------------
sub_9F24:
$9F24:  20 C6 96	  JSR $96C6		   
$9F27:  90 24		 BCC $9F4D		   
$9F29:  A0 0C		 LDY #$0C			
$9F2B:  B1 86		 LDA (stat_ptr_lo),Y ; Stat table pointer low
$9F2D:  F0 1E		 BEQ $9F4D		   
$9F2F:  B1 86		 LDA (stat_ptr_lo),Y ; Stat table pointer low
$9F31:  85 00		 STA tmp0			; Temporary 0
$9F33:  C9 FF		 CMP #$FF			
$9F35:  D0 04		 BNE $9F3B		   
$9F37:  A9 F0		 LDA #$F0			
$9F39:  85 00		 STA tmp0			; Temporary 0
$9F3B:  38			SEC				 
$9F3C:  A9 FF		 LDA #$FF			
$9F3E:  E5 00		 SBC tmp0			; Temporary 0
$9F40:  48			PHA				 
$9F41:  20 76 92	  JSR stat_lookup	 ; Stat table lookup
$9F44:  20 4E 9F	  JSR $9F4E		   
$9F47:  68			PLA				 
$9F48:  A2 00		 LDX #$00			
$9F4A:  20 27 C8	  JSR $C827		   
$9F4D:  60			RTS				 

; ------------------------------
sub_9F4E:
$9F4E:  38			SEC				 
$9F4F:  E5 00		 SBC tmp0			; Temporary 0
$9F51:  85 00		 STA tmp0			; Temporary 0
$9F53:  A9 00		 LDA #$00			
$9F55:  85 01		 STA tmp1			; Temporary 1
$9F57:  A2 00		 LDX #$00			
$9F59:  60			RTS				 
$9F5A:  20 D9 A3	  JSR $A3D9		   
$9F5D:  90 16		 BCC $9F75		   
$9F5F:  20 F1 A3	  JSR $A3F1		   
$9F62:  A9 07		 LDA #$07			
$9F64:  85 81		 STA party_loop	  ; Party loop counter
$9F66:  20 B2 A3	  JSR $A3B2		   
$9F69:  90 06		 BCC $9F71		   
$9F6B:  20 AB 93	  JSR $93AB		   
$9F6E:  20 B1 AC	  JSR $ACB1		   
$9F71:  C6 81		 DEC party_loop	  ; Party loop counter
$9F73:  10 F1		 BPL $9F66		   
$9F75:  60			RTS				 
$9F76:  20 D9 A3	  JSR $A3D9		   
$9F79:  90 11		 BCC $9F8C		   
$9F7B:  20 F1 A3	  JSR $A3F1		   
$9F7E:  A9 03		 LDA #$03			
$9F80:  85 8D		 STA $8D			 
$9F82:  20 B4 93	  JSR $93B4		   
$9F85:  20 66 A3	  JSR $A366		   
$9F88:  C6 8D		 DEC $8D			 
$9F8A:  10 F6		 BPL $9F82		   
$9F8C:  60			RTS				 
$9F8D:  20 06 94	  JSR $9406		   
$9F90:  29 7F		 AND #$7F			
$9F92:  C9 04		 CMP #$04			
$9F94:  F0 08		 BEQ $9F9E		   
$9F96:  20 E7 A2	  JSR $A2E7		   
$9F99:  90 03		 BCC $9F9E		   
$9F9B:  20 DC A4	  JSR $A4DC		   
$9F9E:  60			RTS				 
$9F9F:  20 06 94	  JSR $9406		   
$9FA2:  29 7F		 AND #$7F			
$9FA4:  AE 80 6E	  LDX action_type	 ; Current action type
$9FA7:  E0 03		 CPX #$03			
$9FA9:  F0 04		 BEQ $9FAF		   
$9FAB:  C9 04		 CMP #$04			
$9FAD:  F0 08		 BEQ $9FB7		   
$9FAF:  20 76 A2	  JSR $A276		   
$9FB2:  90 03		 BCC $9FB7		   
$9FB4:  20 DC A4	  JSR $A4DC		   
$9FB7:  60			RTS				 
$9FB8:  AE 80 6E	  LDX action_type	 ; Current action type
$9FBB:  CA			DEX				 
$9FBC:  F0 08		 BEQ $9FC6		   
$9FBE:  20 F2 A1	  JSR $A1F2		   
$9FC1:  90 03		 BCC $9FC6		   
$9FC3:  20 DC A4	  JSR $A4DC		   
$9FC6:  60			RTS				 
$9FC7:  20 E5 A0	  JSR $A0E5		   
$9FCA:  90 15		 BCC $9FE1		   
$9FCC:  20 13 A1	  JSR $A113		   
$9FCF:  A5 7D		 LDA $7D			 
$9FD1:  30 0E		 BMI $9FE1		   
$9FD3:  85 82		 STA inner_loop	  ; Inner loop counter
$9FD5:  20 B5 8A	  JSR $8AB5		   
$9FD8:  8D DA 75	  STA act_cat		 ; Action category
$9FDB:  AD D3 75	  LDA target		  ; Target index
$9FDE:  8D DB 75	  STA act_id		  ; Action ID
$9FE1:  60			RTS				 
$9FE2:  20 06 94	  JSR $9406		   
$9FE5:  29 7F		 AND #$7F			
$9FE7:  C9 04		 CMP #$04			
$9FE9:  F0 21		 BEQ $A00C		   
$9FEB:  20 85 A0	  JSR $A085		   
$9FEE:  90 1C		 BCC $A00C		   
$9FF0:  A9 00		 LDA #$00			
$9FF2:  85 82		 STA inner_loop	  ; Inner loop counter
$9FF4:  20 43 A0	  JSR $A043		   
$9FF7:  90 0B		 BCC $A004		   
$9FF9:  20 B5 8A	  JSR $8AB5		   
$9FFC:  8D D2 75	  STA act_type		; Action type
$9FFF:  90 03		 BCC $A004		   
$A001:  20 0E AD	  JSR $AD0E		   
$A004:  E6 82		 INC inner_loop	  ; Inner loop counter
$A006:  A5 82		 LDA inner_loop	  ; Inner loop counter
$A008:  C9 04		 CMP #$04			
$A00A:  90 E8		 BCC $9FF4		   
$A00C:  60			RTS				 
$A00D:  AD DB 75	  LDA act_id		  ; Action ID
$A010:  C9 21		 CMP #$21			
$A012:  D0 2E		 BNE $A042		   
$A014:  A9 00		 LDA #$00			
$A016:  85 7B		 STA calc_hit		; Calculated hit value
$A018:  85 82		 STA inner_loop	  ; Inner loop counter
$A01A:  20 43 A0	  JSR $A043		   
$A01D:  90 0A		 BCC $A029		   
$A01F:  20 B5 8A	  JSR $8AB5		   
$A022:  8D D2 75	  STA act_type		; Action type
$A025:  90 02		 BCC $A029		   
$A027:  E6 7B		 INC calc_hit		; Calculated hit value
$A029:  E6 82		 INC inner_loop	  ; Inner loop counter
$A02B:  A5 82		 LDA inner_loop	  ; Inner loop counter
$A02D:  C9 04		 CMP #$04			
$A02F:  90 E9		 BCC $A01A		   
$A031:  A5 7B		 LDA calc_hit		; Calculated hit value
$A033:  C9 02		 CMP #$02			
$A035:  90 0B		 BCC $A042		   
$A037:  AD D3 75	  LDA target		  ; Target index
$A03A:  8D DB 75	  STA act_id		  ; Action ID
$A03D:  A9 00		 LDA #$00			
$A03F:  8D DA 75	  STA act_cat		 ; Action category
$A042:  60			RTS				 

; ------------------------------
sub_A043:
$A043:  20 66 88	  JSR $8866		   
$A046:  90 3B		 BCC $A083		   
$A048:  85 00		 STA tmp0			; Temporary 0
$A04A:  20 B6 89	  JSR get_act		 ; Get action data
$A04D:  A0 00		 LDY #$00			
$A04F:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$A051:  10 30		 BPL $A083		   
$A053:  A5 00		 LDA tmp0			; Temporary 0
$A055:  20 F5 89	  JSR get_act_2	   ; Get secondary action
$A058:  A0 05		 LDY #$05			
$A05A:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$A05C:  29 C4		 AND #$C4			
$A05E:  D0 23		 BNE $A083		   
$A060:  20 C0 A0	  JSR $A0C0		   
$A063:  A5 82		 LDA inner_loop	  ; Inner loop counter
$A065:  20 1C 86	  JSR $861C		   
$A068:  A2 00		 LDX #$00			
$A06A:  A0 02		 LDY #$02			
$A06C:  20 76 81	  JSR mul16		   ; Multiply by 16
$A06F:  20 AA 83	  JSR add_pairs	   ; Add 16-bit pairs
$A072:  A5 01		 LDA tmp1			; Temporary 1
$A074:  F0 04		 BEQ $A07A		   
$A076:  A9 FF		 LDA #$FF			
$A078:  85 00		 STA tmp0			; Temporary 0
$A07A:  A5 00		 LDA tmp0			; Temporary 0
$A07C:  AE 80 6E	  LDX action_type	 ; Current action type
$A07F:  DD 76 BB	  CMP $BB76,X		 
$A082:  60			RTS				 
$A083:  18			CLC				 
$A084:  60			RTS				 

; ------------------------------
sub_A085:
$A085:  20 A5 A0	  JSR $A0A5		   
$A088:  AD D0 77	  LDA $77D0		   
$A08B:  85 00		 STA tmp0			; Temporary 0
$A08D:  AD D1 77	  LDA $77D1		   
$A090:  85 01		 STA tmp1			; Temporary 1
$A092:  A0 00		 LDY #$00			
$A094:  A2 94		 LDX #$94			
$A096:  20 76 81	  JSR mul16		   ; Multiply by 16
$A099:  20 AA 83	  JSR add_pairs	   ; Add 16-bit pairs
$A09C:  A5 00		 LDA tmp0			; Temporary 0
$A09E:  AE 80 6E	  LDX action_type	 ; Current action type
$A0A1:  DD 6F BB	  CMP $BB6F,X		 
$A0A4:  60			RTS				 

; ------------------------------
sub_A0A5:
$A0A5:  A9 00		 LDA #$00			
$A0A7:  85 94		 STA $94			 
$A0A9:  85 95		 STA $95			 
$A0AB:  A9 07		 LDA #$07			
$A0AD:  85 81		 STA party_loop	  ; Party loop counter
$A0AF:  20 76 9D	  JSR $9D76		   
$A0B2:  A5 00		 LDA tmp0			; Temporary 0
$A0B4:  A4 01		 LDY tmp1			; Temporary 1
$A0B6:  A2 94		 LDX #$94			
$A0B8:  20 1D C8	  JSR $C81D		   
$A0BB:  C6 81		 DEC party_loop	  ; Party loop counter
$A0BD:  10 F0		 BPL $A0AF		   
$A0BF:  60			RTS				 

; ------------------------------
sub_A0C0:
$A0C0:  A9 00		 LDA #$00			
$A0C2:  85 00		 STA tmp0			; Temporary 0
$A0C4:  85 01		 STA tmp1			; Temporary 1
$A0C6:  A9 07		 LDA #$07			
$A0C8:  85 81		 STA party_loop	  ; Party loop counter
$A0CA:  20 77 8D	  JSR setup_ptr	   ; Setup char pointer
$A0CD:  A5 82		 LDA inner_loop	  ; Inner loop counter
$A0CF:  0A			ASL				 
$A0D0:  69 00		 ADC #$00			
$A0D2:  A8			TAY				 
$A0D3:  B1 88		 LDA (char_ptr_lo),Y ; Character data pointer low
$A0D5:  65 00		 ADC tmp0			; Temporary 0
$A0D7:  85 00		 STA tmp0			; Temporary 0
$A0D9:  C8			INY				 
$A0DA:  B1 88		 LDA (char_ptr_lo),Y ; Character data pointer low
$A0DC:  65 01		 ADC tmp1			; Temporary 1
$A0DE:  85 01		 STA tmp1			; Temporary 1
$A0E0:  C6 81		 DEC party_loop	  ; Party loop counter
$A0E2:  10 E6		 BPL $A0CA		   
$A0E4:  60			RTS				 

; ------------------------------
sub_A0E5:
$A0E5:  A9 00		 LDA #$00			
$A0E7:  85 7C		 STA $7C			 
$A0E9:  A9 07		 LDA #$07			
$A0EB:  85 81		 STA party_loop	  ; Party loop counter
$A0ED:  20 C6 96	  JSR $96C6		   
$A0F0:  90 09		 BCC $A0FB		   
$A0F2:  A6 81		 LDX party_loop	  ; Party loop counter
$A0F4:  BD 5E FF	  LDA $FF5E,X		 
$A0F7:  05 7C		 ORA $7C			 
$A0F9:  85 7C		 STA $7C			 
$A0FB:  C6 81		 DEC party_loop	  ; Party loop counter
$A0FD:  10 EE		 BPL $A0ED		   
$A0FF:  A9 30		 LDA #$30			
$A101:  85 94		 STA $94			 
$A103:  A5 7C		 LDA $7C			 
$A105:  F0 03		 BEQ $A10A		   
$A107:  20 2F A4	  JSR $A42F		   
$A10A:  A5 94		 LDA $94			 
$A10C:  AE 80 6E	  LDX action_type	 ; Current action type
$A10F:  DD 68 BB	  CMP $BB68,X		 
$A112:  60			RTS				 

; ------------------------------
sub_A113:
$A113:  20 B8 A1	  JSR $A1B8		   
$A116:  A2 FF		 LDX #$FF			
$A118:  86 7D		 STX $7D			 
$A11A:  E8			INX				 
$A11B:  86 82		 STX inner_loop	  ; Inner loop counter
$A11D:  86 7B		 STX calc_hit		; Calculated hit value
$A11F:  86 7C		 STX $7C			 
$A121:  20 66 88	  JSR $8866		   
$A124:  85 8A		 STA char_count	  ; Character count
$A126:  90 68		 BCC $A190		   
$A128:  20 B6 89	  JSR get_act		 ; Get action data
$A12B:  A0 00		 LDY #$00			
$A12D:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$A12F:  10 5F		 BPL $A190		   
$A131:  0A			ASL				 
$A132:  30 5C		 BMI $A190		   
$A134:  A5 8A		 LDA char_count	  ; Character count
$A136:  20 F5 89	  JSR get_act_2	   ; Get secondary action
$A139:  A0 05		 LDY #$05			
$A13B:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$A13D:  29 34		 AND #$34			
$A13F:  D0 4F		 BNE $A190		   
$A141:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$A143:  29 C0		 AND #$C0			
$A145:  F0 07		 BEQ $A14E		   
$A147:  A5 8A		 LDA char_count	  ; Character count
$A149:  CD E8 75	  CMP spell_idx	   ; Spell index
$A14C:  D0 42		 BNE $A190		   
$A14E:  20 99 A1	  JSR $A199		   
$A151:  05 02		 ORA tmp2			; Temporary 2
$A153:  F0 3B		 BEQ $A190		   
$A155:  A2 02		 LDX #$02			
$A157:  A0 94		 LDY #$94			
$A159:  20 76 81	  JSR mul16		   ; Multiply by 16
$A15C:  20 AA 83	  JSR add_pairs	   ; Add 16-bit pairs
$A15F:  A5 03		 LDA tmp3			; Temporary 3
$A161:  D0 2D		 BNE $A190		   
$A163:  AD 99 BB	  LDA base_dmg		; Base damage value
$A166:  0A			ASL				 
$A167:  C5 02		 CMP tmp2			; Temporary 2
$A169:  90 25		 BCC $A190		   
$A16B:  A5 02		 LDA tmp2			; Temporary 2
$A16D:  AE 80 6E	  LDX action_type	 ; Current action type
$A170:  DD 7D BB	  CMP $BB7D,X		 
$A173:  90 1B		 BCC $A190		   
$A175:  A0 01		 LDY #$01			
$A177:  38			SEC				 
$A178:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$A17A:  E5 7B		 SBC calc_hit		; Calculated hit value
$A17C:  C8			INY				 
$A17D:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$A17F:  E5 7C		 SBC $7C			 
$A181:  90 0D		 BCC $A190		   
$A183:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$A185:  85 7C		 STA $7C			 
$A187:  88			DEY				 
$A188:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$A18A:  85 7B		 STA calc_hit		; Calculated hit value
$A18C:  A5 82		 LDA inner_loop	  ; Inner loop counter
$A18E:  85 7D		 STA $7D			 
$A190:  E6 82		 INC inner_loop	  ; Inner loop counter
$A192:  A5 82		 LDA inner_loop	  ; Inner loop counter
$A194:  C9 04		 CMP #$04			
$A196:  90 89		 BCC $A121		   
$A198:  60			RTS				 

; ------------------------------
sub_A199:
$A199:  A0 01		 LDY #$01			
$A19B:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$A19D:  85 0C		 STA $0C			 
$A19F:  C8			INY				 
$A1A0:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$A1A2:  85 0D		 STA $0D			 
$A1A4:  A5 8B		 LDA actor_idx	   ; Current actor index
$A1A6:  85 0E		 STA $0E			 
$A1A8:  A5 8C		 LDA action_param	; Action parameter
$A1AA:  85 0F		 STA $0F			 
$A1AC:  20 23 88	  JSR $8823		   
$A1AF:  A5 8D		 LDA $8D			 
$A1B1:  85 02		 STA tmp2			; Temporary 2
$A1B3:  A5 8E		 LDA $8E			 
$A1B5:  85 03		 STA tmp3			; Temporary 3
$A1B7:  60			RTS				 

; ------------------------------
sub_A1B8:
$A1B8:  A2 00		 LDX #$00			
$A1BA:  86 8D		 STX $8D			 
$A1BC:  86 8E		 STX $8E			 
$A1BE:  8A			TXA				 
$A1BF:  48			PHA				 
$A1C0:  20 C7 86	  JSR $86C7		   
$A1C3:  A0 06		 LDY #$06			
$A1C5:  B1 86		 LDA (stat_ptr_lo),Y ; Stat table pointer low
$A1C7:  10 21		 BPL $A1EA		   
$A1C9:  0A			ASL				 
$A1CA:  10 1E		 BPL $A1EA		   
$A1CC:  38			SEC				 
$A1CD:  A5 8D		 LDA $8D			 
$A1CF:  E5 00		 SBC tmp0			; Temporary 0
$A1D1:  A5 8E		 LDA $8E			 
$A1D3:  E5 01		 SBC tmp1			; Temporary 1
$A1D5:  B0 13		 BCS $A1EA		   
$A1D7:  A5 00		 LDA tmp0			; Temporary 0
$A1D9:  85 8D		 STA $8D			 
$A1DB:  A5 01		 LDA tmp1			; Temporary 1
$A1DD:  85 8E		 STA $8E			 
$A1DF:  A0 03		 LDY #$03			
$A1E1:  B1 86		 LDA (stat_ptr_lo),Y ; Stat table pointer low
$A1E3:  85 8B		 STA actor_idx	   ; Current actor index
$A1E5:  C8			INY				 
$A1E6:  B1 86		 LDA (stat_ptr_lo),Y ; Stat table pointer low
$A1E8:  85 8C		 STA action_param	; Action parameter
$A1EA:  68			PLA				 
$A1EB:  AA			TAX				 
$A1EC:  E8			INX				 
$A1ED:  E0 08		 CPX #$08			
$A1EF:  90 CD		 BCC $A1BE		   
$A1F1:  60			RTS				 

; ------------------------------
sub_A1F2:
$A1F2:  AD 06 72	  LDA $7206		   
$A1F5:  C9 D2		 CMP #$D2			
$A1F7:  D0 0F		 BNE $A208		   
$A1F9:  A2 00		 LDX #$00			
$A1FB:  86 81		 STX party_loop	  ; Party loop counter
$A1FD:  20 9C 89	  JSR $899C		   
$A200:  A0 05		 LDY #$05			
$A202:  B1 86		 LDA (stat_ptr_lo),Y ; Stat table pointer low
$A204:  29 C0		 AND #$C0			
$A206:  D0 33		 BNE $A23B		   
$A208:  A9 00		 LDA #$00			
$A20A:  85 7B		 STA calc_hit		; Calculated hit value
$A20C:  85 7C		 STA $7C			 
$A20E:  85 7D		 STA $7D			 
$A210:  A2 03		 LDX #$03			
$A212:  BD 45 6E	  LDA $6E45,X		 
$A215:  C9 5C		 CMP #$5C			
$A217:  F0 24		 BEQ $A23D		   
$A219:  C9 75		 CMP #$75			
$A21B:  F0 24		 BEQ $A241		   
$A21D:  C9 A8		 CMP #$A8			
$A21F:  F0 24		 BEQ $A245		   
$A221:  CA			DEX				 
$A222:  10 EE		 BPL $A212		   
$A224:  A5 7D		 LDA $7D			 
$A226:  D0 13		 BNE $A23B		   
$A228:  AE 80 6E	  LDX action_type	 ; Current action type
$A22B:  A5 7B		 LDA calc_hit		; Calculated hit value
$A22D:  DD 5A BB	  CMP $BB5A,X		 
$A230:  B0 09		 BCS $A23B		   
$A232:  A5 7C		 LDA $7C			 
$A234:  DD 61 BB	  CMP $BB61,X		 
$A237:  B0 02		 BCS $A23B		   
$A239:  18			CLC				 
$A23A:  60			RTS				 
$A23B:  38			SEC				 
$A23C:  60			RTS				 
$A23D:  A0 7B		 LDY #$7B			
$A23F:  D0 06		 BNE $A247		   
$A241:  A0 7C		 LDY #$7C			
$A243:  D0 02		 BNE $A247		   
$A245:  A0 7D		 LDY #$7D			
$A247:  8A			TXA				 
$A248:  48			PHA				 
$A249:  84 01		 STY tmp1			; Temporary 1
$A24B:  85 00		 STA tmp0			; Temporary 0
$A24D:  A2 07		 LDX #$07			
$A24F:  86 81		 STX party_loop	  ; Party loop counter
$A251:  A6 81		 LDX party_loop	  ; Party loop counter
$A253:  20 9C 89	  JSR $899C		   
$A256:  A0 06		 LDY #$06			
$A258:  B1 86		 LDA (stat_ptr_lo),Y ; Stat table pointer low
$A25A:  10 11		 BPL $A26D		   
$A25C:  0A			ASL				 
$A25D:  10 0E		 BPL $A26D		   
$A25F:  A0 0D		 LDY #$0D			
$A261:  B1 86		 LDA (stat_ptr_lo),Y ; Stat table pointer low
$A263:  29 03		 AND #$03			
$A265:  C5 00		 CMP tmp0			; Temporary 0
$A267:  D0 04		 BNE $A26D		   
$A269:  A6 01		 LDX tmp1			; Temporary 1
$A26B:  F6 00		 INC $00,X		   
$A26D:  C6 81		 DEC party_loop	  ; Party loop counter
$A26F:  10 E0		 BPL $A251		   
$A271:  68			PLA				 
$A272:  AA			TAX				 
$A273:  4C 21 A2	  JMP $A221		   

; ------------------------------
sub_A276:
$A276:  AD E7 72	  LDA $72E7		   
$A279:  29 10		 AND #$10			
$A27B:  D0 68		 BNE $A2E5		   
$A27D:  A9 00		 LDA #$00			
$A27F:  85 00		 STA tmp0			; Temporary 0
$A281:  85 01		 STA tmp1			; Temporary 1
$A283:  85 02		 STA tmp2			; Temporary 2
$A285:  85 03		 STA tmp3			; Temporary 3
$A287:  A9 07		 LDA #$07			
$A289:  85 81		 STA party_loop	  ; Party loop counter
$A28B:  A6 81		 LDX party_loop	  ; Party loop counter
$A28D:  20 9C 89	  JSR $899C		   
$A290:  A0 06		 LDY #$06			
$A292:  B1 86		 LDA (stat_ptr_lo),Y ; Stat table pointer low
$A294:  10 32		 BPL $A2C8		   
$A296:  0A			ASL				 
$A297:  10 2F		 BPL $A2C8		   
$A299:  0A			ASL				 
$A29A:  30 2C		 BMI $A2C8		   
$A29C:  E6 03		 INC tmp3			; Temporary 3
$A29E:  A5 81		 LDA party_loop	  ; Party loop counter
$A2A0:  0A			ASL				 
$A2A1:  85 04		 STA $04			 
$A2A3:  0A			ASL				 
$A2A4:  65 04		 ADC $04			 
$A2A6:  A8			TAY				 
$A2A7:  A2 05		 LDX #$05			
$A2A9:  B9 8C 6D	  LDA $6D8C,Y		 
$A2AC:  C9 3C		 CMP #$3C			
$A2AE:  90 14		 BCC $A2C4		   
$A2B0:  C9 42		 CMP #$42			
$A2B2:  B0 10		 BCS $A2C4		   
$A2B4:  B9 C2 6D	  LDA $6DC2,Y		 
$A2B7:  F0 0B		 BEQ $A2C4		   
$A2B9:  18			CLC				 
$A2BA:  65 00		 ADC tmp0			; Temporary 0
$A2BC:  85 00		 STA tmp0			; Temporary 0
$A2BE:  A5 01		 LDA tmp1			; Temporary 1
$A2C0:  69 00		 ADC #$00			
$A2C2:  85 01		 STA tmp1			; Temporary 1
$A2C4:  C8			INY				 
$A2C5:  CA			DEX				 
$A2C6:  10 E1		 BPL $A2A9		   
$A2C8:  C6 81		 DEC party_loop	  ; Party loop counter
$A2CA:  10 BF		 BPL $A28B		   
$A2CC:  A2 00		 LDX #$00			
$A2CE:  A0 02		 LDY #$02			
$A2D0:  20 76 81	  JSR mul16		   ; Multiply by 16
$A2D3:  20 AA 83	  JSR add_pairs	   ; Add 16-bit pairs
$A2D6:  A5 01		 LDA tmp1			; Temporary 1
$A2D8:  D0 09		 BNE $A2E3		   
$A2DA:  A5 00		 LDA tmp0			; Temporary 0
$A2DC:  AE 80 6E	  LDX action_type	 ; Current action type
$A2DF:  DD 53 BB	  CMP $BB53,X		 
$A2E2:  60			RTS				 
$A2E3:  38			SEC				 
$A2E4:  60			RTS				 
$A2E5:  18			CLC				 
$A2E6:  60			RTS				 

; ------------------------------
sub_A2E7:
$A2E7:  A9 00		 LDA #$00			
$A2E9:  85 82		 STA inner_loop	  ; Inner loop counter
$A2EB:  85 7B		 STA calc_hit		; Calculated hit value
$A2ED:  85 7C		 STA $7C			 
$A2EF:  85 7D		 STA $7D			 
$A2F1:  85 7E		 STA $7E			 
$A2F3:  20 42 88	  JSR $8842		   
$A2F6:  90 21		 BCC $A319		   
$A2F8:  A5 82		 LDA inner_loop	  ; Inner loop counter
$A2FA:  20 6B 8A	  JSR $8A6B		   
$A2FD:  A0 00		 LDY #$00			
$A2FF:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$A301:  10 16		 BPL $A319		   
$A303:  0A			ASL				 
$A304:  30 13		 BMI $A319		   
$A306:  38			SEC				 
$A307:  A5 7B		 LDA calc_hit		; Calculated hit value
$A309:  E5 0C		 SBC $0C			 
$A30B:  A5 7C		 LDA $7C			 
$A30D:  E5 0D		 SBC $0D			 
$A30F:  B0 08		 BCS $A319		   
$A311:  A5 0C		 LDA $0C			 
$A313:  85 7B		 STA calc_hit		; Calculated hit value
$A315:  A5 0D		 LDA $0D			 
$A317:  85 7C		 STA $7C			 
$A319:  E6 82		 INC inner_loop	  ; Inner loop counter
$A31B:  A5 82		 LDA inner_loop	  ; Inner loop counter
$A31D:  C9 04		 CMP #$04			
$A31F:  90 D2		 BCC $A2F3		   
$A321:  A9 07		 LDA #$07			
$A323:  85 81		 STA party_loop	  ; Party loop counter
$A325:  A6 81		 LDX party_loop	  ; Party loop counter
$A327:  20 56 88	  JSR $8856		   
$A32A:  A0 06		 LDY #$06			
$A32C:  B1 86		 LDA (stat_ptr_lo),Y ; Stat table pointer low
$A32E:  10 19		 BPL $A349		   
$A330:  0A			ASL				 
$A331:  10 16		 BPL $A349		   
$A333:  0A			ASL				 
$A334:  30 13		 BMI $A349		   
$A336:  38			SEC				 
$A337:  A5 7D		 LDA $7D			 
$A339:  E5 0E		 SBC $0E			 
$A33B:  A5 7E		 LDA $7E			 
$A33D:  E5 0F		 SBC $0F			 
$A33F:  B0 08		 BCS $A349		   
$A341:  A5 0E		 LDA $0E			 
$A343:  85 7D		 STA $7D			 
$A345:  A5 0F		 LDA $0F			 
$A347:  85 7E		 STA $7E			 
$A349:  C6 81		 DEC party_loop	  ; Party loop counter
$A34B:  10 D8		 BPL $A325		   
$A34D:  A2 7D		 LDX #$7D			
$A34F:  A0 7B		 LDY #$7B			
$A351:  20 AA 83	  JSR add_pairs	   ; Add 16-bit pairs
$A354:  A5 7E		 LDA $7E			 
$A356:  D0 0C		 BNE $A364		   
$A358:  A5 7D		 LDA $7D			 
$A35A:  C9 04		 CMP #$04			
$A35C:  90 06		 BCC $A364		   
$A35E:  C9 08		 CMP #$08			
$A360:  B0 02		 BCS $A364		   
$A362:  38			SEC				 
$A363:  60			RTS				 
$A364:  18			CLC				 
$A365:  60			RTS				 

; ------------------------------
sub_A366:
$A366:  A9 00		 LDA #$00			
$A368:  8D E1 75	  STA power_lo		; Action power low
$A36B:  8D E2 75	  STA power_hi		; Action power high
$A36E:  8D E3 75	  STA $75E3		   
$A371:  A9 07		 LDA #$07			
$A373:  85 81		 STA party_loop	  ; Party loop counter
$A375:  20 02 86	  JSR $8602		   
$A378:  D0 19		 BNE $A393		   
$A37A:  20 B2 A3	  JSR $A3B2		   
$A37D:  90 14		 BCC $A393		   
$A37F:  18			CLC				 
$A380:  A5 0E		 LDA $0E			 
$A382:  6D E1 75	  ADC power_lo		; Action power low
$A385:  8D E1 75	  STA power_lo		; Action power low
$A388:  A5 0F		 LDA $0F			 
$A38A:  6D E2 75	  ADC power_hi		; Action power high
$A38D:  8D E2 75	  STA power_hi		; Action power high
$A390:  20 C8 A4	  JSR $A4C8		   
$A393:  C6 81		 DEC party_loop	  ; Party loop counter
$A395:  10 DE		 BPL $A375		   
$A397:  AD E2 75	  LDA power_hi		; Action power high
$A39A:  4A			LSR				 
$A39B:  85 0F		 STA $0F			 
$A39D:  AD E1 75	  LDA power_lo		; Action power low
$A3A0:  6A			ROR				 
$A3A1:  85 0E		 STA $0E			 
$A3A3:  05 0F		 ORA $0F			 
$A3A5:  F0 0A		 BEQ $A3B1		   
$A3A7:  AD E3 75	  LDA $75E3		   
$A3AA:  F0 05		 BEQ $A3B1		   
$A3AC:  85 8C		 STA action_param	; Action parameter
$A3AE:  20 B1 AC	  JSR $ACB1		   
$A3B1:  60			RTS				 

; ------------------------------
sub_A3B2:
$A3B2:  20 76 92	  JSR stat_lookup	 ; Stat table lookup
$A3B5:  20 C6 96	  JSR $96C6		   
$A3B8:  90 1D		 BCC $A3D7		   
$A3BA:  A6 81		 LDX party_loop	  ; Party loop counter
$A3BC:  BD 5E FF	  LDA $FF5E,X		 
$A3BF:  85 7C		 STA $7C			 
$A3C1:  20 2F A4	  JSR $A42F		   
$A3C4:  A5 94		 LDA $94			 
$A3C6:  C9 18		 CMP #$18			
$A3C8:  90 0D		 BCC $A3D7		   
$A3CA:  A6 81		 LDX party_loop	  ; Party loop counter
$A3CC:  20 11 88	  JSR $8811		   
$A3CF:  A5 0E		 LDA $0E			 
$A3D1:  05 0F		 ORA $0F			 
$A3D3:  F0 02		 BEQ $A3D7		   
$A3D5:  38			SEC				 
$A3D6:  60			RTS				 
$A3D7:  18			CLC				 
$A3D8:  60			RTS				 

; ------------------------------
sub_A3D9:
$A3D9:  20 06 94	  JSR $9406		   
$A3DC:  29 7F		 AND #$7F			
$A3DE:  C9 04		 CMP #$04			
$A3E0:  D0 0B		 BNE $A3ED		   
$A3E2:  AD D3 75	  LDA target		  ; Target index
$A3E5:  C9 1F		 CMP #$1F			
$A3E7:  F0 04		 BEQ $A3ED		   
$A3E9:  C9 20		 CMP #$20			
$A3EB:  D0 02		 BNE $A3EF		   
$A3ED:  38			SEC				 
$A3EE:  60			RTS				 
$A3EF:  18			CLC				 
$A3F0:  60			RTS				 

; ------------------------------
sub_A3F1:
$A3F1:  A2 00		 LDX #$00			
$A3F3:  86 82		 STX inner_loop	  ; Inner loop counter
$A3F5:  8E DF 75	  STX $75DF		   
$A3F8:  8E E0 75	  STX $75E0		   
$A3FB:  20 66 88	  JSR $8866		   
$A3FE:  90 26		 BCC $A426		   
$A400:  20 B6 89	  JSR get_act		 ; Get action data
$A403:  A0 00		 LDY #$00			
$A405:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$A407:  10 1D		 BPL $A426		   
$A409:  0A			ASL				 
$A40A:  30 1A		 BMI $A426		   
$A40C:  20 19 87	  JSR $8719		   
$A40F:  38			SEC				 
$A410:  AD DF 75	  LDA $75DF		   
$A413:  E5 0C		 SBC $0C			 
$A415:  AD E0 75	  LDA $75E0		   
$A418:  E5 0D		 SBC $0D			 
$A41A:  B0 0A		 BCS $A426		   
$A41C:  A5 0C		 LDA $0C			 
$A41E:  8D DF 75	  STA $75DF		   
$A421:  A5 0D		 LDA $0D			 
$A423:  8D E0 75	  STA $75E0		   
$A426:  E6 82		 INC inner_loop	  ; Inner loop counter
$A428:  A5 82		 LDA inner_loop	  ; Inner loop counter
$A42A:  C9 04		 CMP #$04			
$A42C:  90 CD		 BCC $A3FB		   
$A42E:  60			RTS				 

; ------------------------------
sub_A42F:
$A42F:  A5 81		 LDA party_loop	  ; Party loop counter
$A431:  48			PHA				 
$A432:  20 44 A4	  JSR $A444		   
$A435:  A9 30		 LDA #$30			
$A437:  85 94		 STA $94			 
$A439:  A5 7B		 LDA calc_hit		; Calculated hit value
$A43B:  F0 03		 BEQ $A440		   
$A43D:  20 88 A4	  JSR $A488		   
$A440:  68			PLA				 
$A441:  85 81		 STA party_loop	  ; Party loop counter
$A443:  60			RTS				 

; ------------------------------
sub_A444:
$A444:  A9 00		 LDA #$00			
$A446:  85 7B		 STA calc_hit		; Calculated hit value
$A448:  85 82		 STA inner_loop	  ; Inner loop counter
$A44A:  20 66 88	  JSR $8866		   
$A44D:  90 30		 BCC $A47F		   
$A44F:  85 0C		 STA $0C			 
$A451:  20 B6 89	  JSR get_act		 ; Get action data
$A454:  A0 00		 LDY #$00			
$A456:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$A458:  10 25		 BPL $A47F		   
$A45A:  0A			ASL				 
$A45B:  30 22		 BMI $A47F		   
$A45D:  A9 0B		 LDA #$0B			
$A45F:  85 0D		 STA $0D			 
$A461:  20 AA A5	  JSR find_tgt		; Find valid target
$A464:  90 15		 BCC $A47B		   
$A466:  C0 15		 CPY #$15			
$A468:  B0 11		 BCS $A47B		   
$A46A:  B9 0B B8	  LDA spell_eff_tbl,Y ; Spell effect type table
$A46D:  29 1F		 AND #$1F			
$A46F:  AA			TAX				 
$A470:  BD CC 94	  LDA $94CC,X		 
$A473:  AA			TAX				 
$A474:  BD 5E FF	  LDA $FF5E,X		 
$A477:  05 7B		 ORA calc_hit		; Calculated hit value
$A479:  85 7B		 STA calc_hit		; Calculated hit value
$A47B:  C6 0D		 DEC $0D			 
$A47D:  10 E2		 BPL $A461		   
$A47F:  E6 82		 INC inner_loop	  ; Inner loop counter
$A481:  A5 82		 LDA inner_loop	  ; Inner loop counter
$A483:  C9 04		 CMP #$04			
$A485:  90 C3		 BCC $A44A		   
$A487:  60			RTS				 

; ------------------------------
sub_A488:
$A488:  A9 00		 LDA #$00			
$A48A:  85 94		 STA $94			 
$A48C:  A9 07		 LDA #$07			
$A48E:  85 81		 STA party_loop	  ; Party loop counter
$A490:  06 7C		 ASL $7C			 
$A492:  90 2F		 BCC $A4C3		   
$A494:  A5 7B		 LDA calc_hit		; Calculated hit value
$A496:  85 02		 STA tmp2			; Temporary 2
$A498:  A9 00		 LDA #$00			
$A49A:  85 95		 STA $95			 
$A49C:  46 02		 LSR tmp2			; Temporary 2
$A49E:  90 1B		 BCC $A4BB		   
$A4A0:  A5 95		 LDA $95			 
$A4A2:  20 E2 92	  JSR $92E2		   
$A4A5:  0A			ASL				 
$A4A6:  0A			ASL				 
$A4A7:  0A			ASL				 
$A4A8:  0A			ASL				 
$A4A9:  85 03		 STA tmp3			; Temporary 3
$A4AB:  A5 94		 LDA $94			 
$A4AD:  48			PHA				 
$A4AE:  18			CLC				 
$A4AF:  65 03		 ADC tmp3			; Temporary 3
$A4B1:  85 94		 STA $94			 
$A4B3:  AA			TAX				 
$A4B4:  68			PLA				 
$A4B5:  F0 04		 BEQ $A4BB		   
$A4B7:  8A			TXA				 
$A4B8:  4A			LSR				 
$A4B9:  85 94		 STA $94			 
$A4BB:  E6 95		 INC $95			 
$A4BD:  A5 95		 LDA $95			 
$A4BF:  C9 07		 CMP #$07			
$A4C1:  90 D9		 BCC $A49C		   
$A4C3:  C6 81		 DEC party_loop	  ; Party loop counter
$A4C5:  10 C9		 BPL $A490		   
$A4C7:  60			RTS				 

; ------------------------------
sub_A4C8:
$A4C8:  AD E3 75	  LDA $75E3		   
$A4CB:  48			PHA				 
$A4CC:  18			CLC				 
$A4CD:  A5 8C		 LDA action_param	; Action parameter
$A4CF:  6D E3 75	  ADC $75E3		   
$A4D2:  8D E3 75	  STA $75E3		   
$A4D5:  68			PLA				 
$A4D6:  F0 03		 BEQ $A4DB		   
$A4D8:  4E E3 75	  LSR $75E3		   
$A4DB:  60			RTS				 

; ------------------------------
sub_A4DC:
$A4DC:  A9 00		 LDA #$00			
$A4DE:  8D DA 75	  STA act_cat		 ; Action category
$A4E1:  AD D3 75	  LDA target		  ; Target index
$A4E4:  8D DB 75	  STA act_id		  ; Action ID
$A4E7:  60			RTS				 

; ------------------------------
sub_A4E8:
$A4E8:  A2 07		 LDX #$07			
$A4EA:  86 81		 STX party_loop	  ; Party loop counter
$A4EC:  A6 81		 LDX party_loop	  ; Party loop counter
$A4EE:  BD 79 75	  LDA $7579,X		 
$A4F1:  C9 10		 CMP #$10			
$A4F3:  F0 0F		 BEQ $A504		   
$A4F5:  85 00		 STA tmp0			; Temporary 0
$A4F7:  20 77 8D	  JSR setup_ptr	   ; Setup char pointer
$A4FA:  20 09 A5	  JSR $A509		   
$A4FD:  A5 00		 LDA tmp0			; Temporary 0
$A4FF:  F0 03		 BEQ $A504		   
$A501:  20 16 8F	  JSR $8F16		   
$A504:  C6 81		 DEC party_loop	  ; Party loop counter
$A506:  10 E4		 BPL $A4EC		   
$A508:  60			RTS				 

; ------------------------------
sub_A509:
$A509:  A2 13		 LDX #$13			
$A50B:  BC EC 90	  LDY $90EC,X		 
$A50E:  B1 88		 LDA (char_ptr_lo),Y ; Character data pointer low
$A510:  85 94		 STA $94			 
$A512:  C8			INY				 
$A513:  B1 88		 LDA (char_ptr_lo),Y ; Character data pointer low
$A515:  85 95		 STA $95			 
$A517:  8A			TXA				 
$A518:  48			PHA				 
$A519:  A2 94		 LDX #$94			
$A51B:  A5 00		 LDA tmp0			; Temporary 0
$A51D:  20 30 83	  JSR mult_a		  ; Multiply by A
$A520:  A5 94		 LDA $94			 
$A522:  29 0F		 AND #$0F			
$A524:  08			PHP				 
$A525:  20 A5 81	  JSR shift_ext	   ; Extended shift
$A528:  28			PLP				 
$A529:  F0 05		 BEQ $A530		   
$A52B:  A9 01		 LDA #$01			
$A52D:  20 13 C8	  JSR $C813		   
$A530:  A5 19		 LDA mult_hi		 ; Product high
$A532:  F0 06		 BEQ $A53A		   
$A534:  A9 FF		 LDA #$FF			
$A536:  85 94		 STA $94			 
$A538:  85 95		 STA $95			 
$A53A:  68			PLA				 
$A53B:  AA			TAX				 
$A53C:  BC EC 90	  LDY $90EC,X		 
$A53F:  A5 94		 LDA $94			 
$A541:  91 88		 STA (char_ptr_lo),Y ; Character data pointer low
$A543:  C8			INY				 
$A544:  A5 95		 LDA $95			 
$A546:  91 88		 STA (char_ptr_lo),Y ; Character data pointer low
$A548:  CA			DEX				 
$A549:  10 C0		 BPL $A50B		   
$A54B:  60			RTS				 
$A54C:  60			RTS				 

; --------------------------------------------------
; Execute action step
; --------------------------------------------------
exec_step:					 ; $A54D
$A54D:  48			PHA				 
$A54E:  20 FC A5	  JSR chk_exec		; Check if can execute
$A551:  68			PLA				 
$A552:  90 F8		 BCC $A54C		   
$A554:  20 8D A5	  JSR valid_act	   ; Validate action
$A557:  90 F3		 BCC $A54C		   
$A559:  AD E8 75	  LDA spell_idx	   ; Spell index
$A55C:  0A			ASL				 
$A55D:  AA			TAX				 
$A55E:  BD 26 A6	  LDA $A626,X		 
$A561:  85 86		 STA stat_ptr_lo	 ; Stat table pointer low
$A563:  BD 27 A6	  LDA $A627,X		 
$A566:  85 87		 STA stat_ptr_hi	 ; Stat table pointer high
$A568:  A5 0D		 LDA $0D			 
$A56A:  0A			ASL				 
$A56B:  A8			TAY				 
$A56C:  B1 86		 LDA (stat_ptr_lo),Y ; Stat table pointer low
$A56E:  85 88		 STA char_ptr_lo	 ; Character data pointer low
$A570:  C8			INY				 
$A571:  B1 86		 LDA (stat_ptr_lo),Y ; Stat table pointer low
$A573:  85 89		 STA char_ptr_hi	 ; Character data pointer high
$A575:  AD F0 75	  LDA btl_f0		  ; Battle flag F0
$A578:  29 7F		 AND #$7F			
$A57A:  8D F0 75	  STA btl_f0		  ; Battle flag F0
$A57D:  A5 0F		 LDA $0F			 
$A57F:  8D D3 75	  STA target		  ; Target index
$A582:  AC 80 6E	  LDY action_type	 ; Current action type
$A585:  C0 04		 CPY #$04			
$A587:  F0 03		 BEQ $A58C		   
$A589:  6C 88 00	  JMP (char_ptr_lo)   ; Character data pointer low
$A58C:  60			RTS				 

; --------------------------------------------------
; Validate action
; --------------------------------------------------
valid_act:					 ; $A58D
$A58D:  85 0D		 STA $0D			 
$A58F:  AD E8 75	  LDA spell_idx	   ; Spell index
$A592:  85 0C		 STA $0C			 
$A594:  20 AA A5	  JSR find_tgt		; Find valid target
$A597:  90 0F		 BCC $A5A8		   
$A599:  B9 67 B9	  LDA enemy_res_tbl,Y ; Enemy resistance table
$A59C:  29 1F		 AND #$1F			
$A59E:  38			SEC				 
$A59F:  ED DC 75	  SBC $75DC		   
$A5A2:  F0 02		 BEQ $A5A6		   
$A5A4:  B0 02		 BCS $A5A8		   
$A5A6:  38			SEC				 
$A5A7:  60			RTS				 
$A5A8:  18			CLC				 
$A5A9:  60			RTS				 

; --------------------------------------------------
; Find valid target
; --------------------------------------------------
find_tgt:					 ; $A5AA
$A5AA:  20 1A A6	  JSR calc_off		; Calculate offset
$A5AD:  18			CLC				 
$A5AE:  65 0D		 ADC $0D			 
$A5B0:  AA			TAX				 
$A5B1:  BD 8A A6	  LDA $A68A,X		 
$A5B4:  85 0F		 STA $0F			 
$A5B6:  A5 0C		 LDA $0C			 
$A5B8:  20 B6 89	  JSR get_act		 ; Get action data
$A5BB:  AD 24 A6	  LDA act_ptr_tbl	 ; Action pointer table
$A5BE:  85 86		 STA stat_ptr_lo	 ; Stat table pointer low
$A5C0:  AD 25 A6	  LDA $A625		   
$A5C3:  85 87		 STA stat_ptr_hi	 ; Stat table pointer high
$A5C5:  A2 86		 LDX #$86			
$A5C7:  20 1A A6	  JSR calc_off		; Calculate offset
$A5CA:  20 13 C8	  JSR $C813		   
$A5CD:  A0 1B		 LDY #$1B			
$A5CF:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$A5D1:  85 00		 STA tmp0			; Temporary 0
$A5D3:  C8			INY				 
$A5D4:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$A5D6:  85 01		 STA tmp1			; Temporary 1
$A5D8:  A0 00		 LDY #$00			
$A5DA:  46 01		 LSR tmp1			; Temporary 1
$A5DC:  66 00		 ROR tmp0			; Temporary 0
$A5DE:  90 06		 BCC $A5E6		   
$A5E0:  B1 86		 LDA (stat_ptr_lo),Y ; Stat table pointer low
$A5E2:  C5 0F		 CMP $0F			 
$A5E4:  F0 07		 BEQ $A5ED		   
$A5E6:  C8			INY				 
$A5E7:  C0 0C		 CPY #$0C			
$A5E9:  90 EF		 BCC $A5DA		   
$A5EB:  18			CLC				 
$A5EC:  60			RTS				 
$A5ED:  A4 0F		 LDY $0F			 
$A5EF:  C0 32		 CPY #$32			
$A5F1:  D0 07		 BNE $A5FA		   
$A5F3:  AD DC 75	  LDA $75DC		   
$A5F6:  D0 02		 BNE $A5FA		   
$A5F8:  18			CLC				 
$A5F9:  60			RTS				 
$A5FA:  38			SEC				 
$A5FB:  60			RTS				 

; --------------------------------------------------
; Check if can execute
; --------------------------------------------------
chk_exec:					 ; $A5FC
$A5FC:  AD 80 6E	  LDA action_type	 ; Current action type
$A5FF:  C9 05		 CMP #$05			
$A601:  F0 15		 BEQ $A618		   
$A603:  AD E4 72	  LDA $72E4		   
$A606:  30 10		 BMI $A618		   
$A608:  AD E8 75	  LDA spell_idx	   ; Spell index
$A60B:  20 F5 89	  JSR get_act_2	   ; Get secondary action
$A60E:  A0 05		 LDY #$05			
$A610:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$A612:  29 08		 AND #$08			
$A614:  D0 02		 BNE $A618		   
$A616:  38			SEC				 
$A617:  60			RTS				 
$A618:  18			CLC				 
$A619:  60			RTS				 

; --------------------------------------------------
; Calculate offset
; --------------------------------------------------
calc_off:					 ; $A61A
$A61A:  A5 0C		 LDA $0C			 
$A61C:  0A			ASL				 
$A61D:  0A			ASL				 
$A61E:  85 00		 STA tmp0			; Temporary 0
$A620:  0A			ASL				 
$A621:  65 00		 ADC tmp0			; Temporary 0
$A623:  60			RTS				 

; --------------------------------------------------
; Action pointer table
; --------------------------------------------------
act_ptr_tbl:					 ; $A624
$A624:  2E B3 4E	  ROL $4EB3		   
$A627:  A6 4E		 LDX $4E			 
$A629:  A6 36		 LDX $36			 
$A62B:  A6 66		 LDX $66			 
$A62D:  A6 7E		 LDX $7E			 
$A62F:  A6 4E		 LDX $4E			 
$A631:  A6 4E		 LDX $4E			 
$A633:  A6 4E		 LDX $4E			 
$A635:  A6 33		 LDX $33			 
$A637:  95 33		 STA $33,X		   
$A639:  95 33		 STA $33,X		   
$A63B:  95 BB		 STA $BB,X		   
							  ; Data region
		.byte $9B, $A6, $9B, $9F, $9F, $0B
$A643:  98			TYA				 
							  ; Data region
		.byte $0B
$A645:  98			TYA				 
							  ; Data region
		.byte $0B, $98, $9C
$A649:  9D 31 9E	  STA $9E31,X		 
							  ; Data region
		.byte $8B, $9E, $54, $95, $69, $95, $BB, $9B, $BB, $9B, $E2, $9F
$A658:  0D A0 0B	  ORA $0BA0		   
$A65B:  98			TYA				 
							  ; Data region
		.byte $0B
$A65D:  98			TYA				 
							  ; Data region
		.byte $0B
$A65F:  98			TYA				 
$A660:  4D 98 31	  EOR $3198		   
							  ; Data region
		.byte $9E
$A664:  35 9E		 AND $9E,X		   
							  ; Data region
		.byte $1B
$A667:  95 1B		 STA $1B,X		   
$A669:  95 1B		 STA $1B,X		   
$A66B:  95 33		 STA $33,X		   
$A66D:  95 33		 STA $33,X		   
$A66F:  95 33		 STA $33,X		   
$A671:  95 48		 STA $48,X		   
$A673:  95 48		 STA $48,X		   
$A675:  95 48		 STA $48,X		   
$A677:  95 C3		 STA $C3,X		   
							  ; Data region
		.byte $9E, $5A, $9F
$A67C:  B8			CLV				 
							  ; Data region
		.byte $9F, $1B
$A67F:  95 33		 STA $33,X		   
$A681:  95 48		 STA $48,X		   
$A683:  95 33		 STA $33,X		   
$A685:  95 CD		 STA $CD,X		   
sub_A687:
							  ; Data region
		.byte $9B, $C3, $9E, $E2, $9B, $5A, $9F
$A68E:  76 9F		 ROR $9F,X		   
$A690:  8D 9F C7	  STA $C79F		   
							  ; Data region
		.byte $9F
$A694:  4C A5 13	  JMP $13A5		   
							  ; Data region
		.byte $14
$A698:  19 1A 21	  ORA $211A,Y		 
							  ; Data region
		.byte $22
$A69C:  29 2A		 AND #$2A			
							  ; Data region
		.byte $2B
$A69F:  2C 30 31	  BIT $3130		   
$A6A2:  0D 0E 0F	  ORA $0F0E		   
							  ; Data region
		.byte $17
$A6A6:  18			CLC				 
$A6A7:  24 29		 BIT $29			 
$A6A9:  2A			ROL				 
							  ; Data region
		.byte $2B
$A6AB:  2E 30 32	  ROL $3230		   
$A6AE:  00			BRK				 
$A6AF:  01 02		 ORA ($02,X)		 
							  ; Data region
		.byte $03, $04
$A6B3:  05 06		 ORA $06			 
							  ; Data region
		.byte $07
$A6B6:  08			PHP				 
							  ; Data region
		.byte $1C, $1F
$A6B9:  28			PLP				 
$A6BA:  09 0A		 ORA #$0A			
							  ; Data region
		.byte $0B, $0C, $1B, $1C
$A6C0:  1E 1F 20	  ASL $201F,X		 
							  ; Data region
		.byte $23
$A6C4:  25 33		 AND $33			 
st_setup1:					 ; $A6C6
$A6C6:  A2 00		 LDX #$00			
$A6C8:  F0 0A		 BEQ $A6D4		   
st_setup2:					 ; $A6CA
$A6CA:  A2 02		 LDX #$02			
$A6CC:  D0 06		 BNE $A6D4		   
st_setup3:					 ; $A6CE
$A6CE:  A2 04		 LDX #$04			
$A6D0:  D0 02		 BNE $A6D4		   
st_clean:					 ; $A6D2
$A6D2:  A2 06		 LDX #$06			
$A6D4:  8E F1 75	  STX $75F1		   
$A6D7:  AD E8 75	  LDA spell_idx	   ; Spell index
$A6DA:  C9 08		 CMP #$08			
$A6DC:  B0 24		 BCS $A702		   
$A6DE:  20 B6 89	  JSR get_act		 ; Get action data
$A6E1:  A0 13		 LDY #$13			
$A6E3:  98			TYA				 
$A6E4:  48			PHA				 
$A6E5:  A5 79		 LDA action_ptr_lo   ; Action data pointer low
$A6E7:  48			PHA				 
$A6E8:  A5 7A		 LDA action_ptr_hi   ; Action data pointer high
$A6EA:  48			PHA				 
$A6EB:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$A6ED:  20 03 A7	  JSR $A703		   
$A6F0:  90 03		 BCC $A6F5		   
$A6F2:  20 3C A7	  JSR $A73C		   
$A6F5:  68			PLA				 
$A6F6:  85 7A		 STA action_ptr_hi   ; Action data pointer high
$A6F8:  68			PLA				 
$A6F9:  85 79		 STA action_ptr_lo   ; Action data pointer low
$A6FB:  68			PLA				 
$A6FC:  A8			TAY				 
$A6FD:  C8			INY				 
$A6FE:  C0 1B		 CPY #$1B			
$A700:  90 E1		 BCC $A6E3		   
$A702:  60			RTS				 

; ------------------------------
sub_A703:
$A703:  29 7F		 AND #$7F			
$A705:  8D 55 73	  STA $7355		   
$A708:  AE F1 75	  LDX $75F1		   
$A70B:  BD 47 A7	  LDA $A747,X		 
$A70E:  85 00		 STA tmp0			; Temporary 0
$A710:  BD 48 A7	  LDA $A748,X		 
$A713:  85 01		 STA tmp1			; Temporary 1
$A715:  A0 00		 LDY #$00			
$A717:  B1 00		 LDA (tmp0),Y		; Temporary 0
$A719:  C9 FF		 CMP #$FF			
$A71B:  F0 0B		 BEQ $A728		   
$A71D:  CD 55 73	  CMP $7355		   
$A720:  F0 08		 BEQ $A72A		   
$A722:  C8			INY				 
$A723:  C8			INY				 
$A724:  C8			INY				 
$A725:  C8			INY				 
$A726:  D0 EF		 BNE $A717		   
$A728:  18			CLC				 
$A729:  60			RTS				 
$A72A:  C8			INY				 
$A72B:  B1 00		 LDA (tmp0),Y		; Temporary 0
$A72D:  8D D3 75	  STA target		  ; Target index
$A730:  C8			INY				 
$A731:  B1 00		 LDA (tmp0),Y		; Temporary 0
$A733:  85 86		 STA stat_ptr_lo	 ; Stat table pointer low
$A735:  C8			INY				 
$A736:  B1 00		 LDA (tmp0),Y		; Temporary 0
$A738:  85 87		 STA stat_ptr_hi	 ; Stat table pointer high
$A73A:  38			SEC				 
$A73B:  60			RTS				 

; ------------------------------
sub_A73C:
$A73C:  AD F0 75	  LDA btl_f0		  ; Battle flag F0
$A73F:  09 80		 ORA #$80			
$A741:  8D F0 75	  STA btl_f0		  ; Battle flag F0
$A744:  6C 86 00	  JMP (stat_ptr_lo)   ; Stat table pointer low
							  ; Data region
		.byte $4F, $A7, $7C, $A7, $8D, $A7, $92, $A7
$A74F:  11 83		 ORA ($83),Y		 
							  ; Data region
		.byte $33
$A752:  95 17		 STA $17,X		   
$A754:  84 33		 STY $33			 
$A756:  95 18		 STA $18,X		   
$A758:  85 A6		 STA $A6			 
							  ; Data region
		.byte $9B, $1A
$A75C:  86 1B		 STX $1B			 
$A75E:  95 1B		 STA $1B,X		   
							  ; Data region
		.byte $87, $33
$A762:  95 1D		 STA $1D,X		   
$A764:  88			DEY				 
							  ; Data region
		.byte $BB, $9B
$A767:  1E 89 48	  ASL $4889,X		 
$A76A:  95 22		 STA $22,X		   
$A76C:  8D BB 9B	  STA $9BBB		   
							  ; Data region
		.byte $23
$A770:  8E 33 95	  STX $9533		   
$A773:  45 92		 EOR $92			 
							  ; Data region
		.byte $E2, $9B
$A777:  5D 9D BB	  EOR $BB9D,X		 
							  ; Data region
		.byte $9B, $FF
$A77C:  20 8B E9	  JSR $E98B		   
$A77F:  98			TYA				 
$A780:  40			RTI				 
							  ; Data region
		.byte $8F
$A782:  BC 98 53	  LDY $5398,X		 
$A785:  94 AC		 STY $AC,X		   
$A787:  98			TYA				 
$A788:  60			RTS				 
$A789:  A0 0E		 LDY #$0E			
$A78B:  99 FF 58	  STA $58FF,Y		 
$A78E:  98			TYA				 
$A78F:  EC 9D FF	  CPX $FF9D		   
							  ; Data region
		.byte $1F
$A793:  8A			TXA				 
$A794:  76 9F		 ROR $9F,X		   
							  ; Data region
		.byte $FF
sub_A797:
$A797:  48			PHA				 
$A798:  8A			TXA				 
$A799:  48			PHA				 
$A79A:  98			TYA				 
$A79B:  48			PHA				 
$A79C:  84 01		 STY tmp1			; Temporary 1
$A79E:  BD 67 B9	  LDA enemy_res_tbl,X ; Enemy resistance table
$A7A1:  48			PHA				 
$A7A2:  29 80		 AND #$80			
$A7A4:  85 00		 STA tmp0			; Temporary 0
$A7A6:  68			PLA				 
$A7A7:  29 60		 AND #$60			
$A7A9:  F0 0C		 BEQ $A7B7		   
$A7AB:  C9 60		 CMP #$60			
$A7AD:  F0 08		 BEQ $A7B7		   
$A7AF:  C9 20		 CMP #$20			
$A7B1:  F0 0C		 BEQ $A7BF		   
$A7B3:  C9 40		 CMP #$40			
$A7B5:  F0 71		 BEQ $A828		   
$A7B7:  68			PLA				 
$A7B8:  A8			TAY				 
$A7B9:  68			PLA				 
$A7BA:  AA			TAX				 
$A7BB:  68			PLA				 
$A7BC:  A5 00		 LDA tmp0			; Temporary 0
$A7BE:  60			RTS				 
$A7BF:  A5 00		 LDA tmp0			; Temporary 0
$A7C1:  10 14		 BPL $A7D7		   
$A7C3:  A9 00		 LDA #$00			
$A7C5:  85 02		 STA tmp2			; Temporary 2
$A7C7:  A2 07		 LDX #$07			
$A7C9:  8A			TXA				 
$A7CA:  48			PHA				 
$A7CB:  20 AA A8	  JSR $A8AA		   
$A7CE:  26 02		 ROL tmp2			; Temporary 2
$A7D0:  68			PLA				 
$A7D1:  AA			TAX				 
$A7D2:  CA			DEX				 
$A7D3:  10 F4		 BPL $A7C9		   
$A7D5:  30 39		 BMI $A810		   
$A7D7:  A9 00		 LDA #$00			
$A7D9:  85 02		 STA tmp2			; Temporary 2
$A7DB:  A2 03		 LDX #$03			
$A7DD:  8A			TXA				 
$A7DE:  48			PHA				 
$A7DF:  20 6B 8A	  JSR $8A6B		   
$A7E2:  90 25		 BCC $A809		   
$A7E4:  48			PHA				 
$A7E5:  A0 00		 LDY #$00			
$A7E7:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$A7E9:  6A			ROR				 
$A7EA:  29 E0		 AND #$E0			
$A7EC:  85 04		 STA $04			 
$A7EE:  68			PLA				 
$A7EF:  20 F5 89	  JSR get_act_2	   ; Get secondary action
$A7F2:  A0 05		 LDY #$05			
$A7F4:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$A7F6:  85 03		 STA tmp3			; Temporary 3
$A7F8:  C8			INY				 
$A7F9:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$A7FB:  29 1F		 AND #$1F			
$A7FD:  05 04		 ORA $04			 
$A7FF:  85 04		 STA $04			 
$A801:  C8			INY				 
$A802:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$A804:  85 05		 STA $05			 
$A806:  20 5B A8	  JSR $A85B		   
$A809:  26 02		 ROL tmp2			; Temporary 2
$A80B:  68			PLA				 
$A80C:  AA			TAX				 
$A80D:  CA			DEX				 
$A80E:  10 CD		 BPL $A7DD		   
$A810:  A5 02		 LDA tmp2			; Temporary 2
$A812:  00			BRK				 
							  ; Data region
		.byte $2B, $0F
$A815:  05 00		 ORA tmp0			; Temporary 0
$A817:  85 00		 STA tmp0			; Temporary 0
$A819:  30 0A		 BMI $A825		   
$A81B:  20 76 8A	  JSR $8A76		   
$A81E:  90 05		 BCC $A825		   
$A820:  20 BA 8A	  JSR $8ABA		   
$A823:  85 00		 STA tmp0			; Temporary 0
$A825:  4C B7 A7	  JMP $A7B7		   
$A828:  A5 00		 LDA tmp0			; Temporary 0
$A82A:  10 F9		 BPL $A825		   
$A82C:  A9 00		 LDA #$00			
$A82E:  85 02		 STA tmp2			; Temporary 2
$A830:  A2 07		 LDX #$07			
$A832:  8A			TXA				 
$A833:  48			PHA				 
$A834:  20 AA A8	  JSR $A8AA		   
$A837:  90 0E		 BCC $A847		   
$A839:  A0 0D		 LDY #$0D			
$A83B:  B1 86		 LDA (stat_ptr_lo),Y ; Stat table pointer low
$A83D:  29 03		 AND #$03			
$A83F:  AA			TAX				 
$A840:  BD 5E FF	  LDA $FF5E,X		 
$A843:  05 02		 ORA tmp2			; Temporary 2
$A845:  85 02		 STA tmp2			; Temporary 2
$A847:  68			PLA				 
$A848:  AA			TAX				 
$A849:  CA			DEX				 
$A84A:  10 E6		 BPL $A832		   
$A84C:  A5 02		 LDA tmp2			; Temporary 2
$A84E:  00			BRK				 
$A84F:  2A			ROL				 
							  ; Data region
		.byte $0F
$A851:  18			CLC				 
$A852:  69 08		 ADC #$08			
$A854:  05 00		 ORA tmp0			; Temporary 0
$A856:  85 00		 STA tmp0			; Temporary 0
$A858:  4C B7 A7	  JMP $A7B7		   

; ------------------------------
sub_A85B:
$A85B:  A5 04		 LDA $04			 
$A85D:  10 39		 BPL $A898		   
$A85F:  A5 01		 LDA tmp1			; Temporary 1
$A861:  85 06		 STA $06			 
$A863:  A5 00		 LDA tmp0			; Temporary 0
$A865:  4A			LSR				 
$A866:  4A			LSR				 
$A867:  4A			LSR				 
$A868:  4A			LSR				 
$A869:  29 08		 AND #$08			
$A86B:  AA			TAX				 
$A86C:  BD 9A A8	  LDA $A89A,X		 
$A86F:  48			PHA				 
$A870:  29 07		 AND #$07			
$A872:  A8			TAY				 
$A873:  B9 5E FF	  LDA $FF5E,Y		 
$A876:  85 07		 STA $07			 
$A878:  85 08		 STA $08			 
$A87A:  06 06		 ASL $06			 
$A87C:  B0 04		 BCS $A882		   
$A87E:  A9 00		 LDA #$00			
$A880:  85 07		 STA $07			 
$A882:  68			PLA				 
$A883:  4A			LSR				 
$A884:  4A			LSR				 
$A885:  4A			LSR				 
$A886:  A8			TAY				 
$A887:  B9 03 00	  LDA tmp3,Y		  ; Temporary 3
$A88A:  45 08		 EOR $08			 
$A88C:  25 07		 AND $07			 
$A88E:  D0 08		 BNE $A898		   
$A890:  E8			INX				 
$A891:  8A			TXA				 
$A892:  29 07		 AND #$07			
$A894:  D0 D6		 BNE $A86C		   
$A896:  38			SEC				 
$A897:  60			RTS				 
$A898:  18			CLC				 
$A899:  60			RTS				 
$A89A:  0E 0E 02	  ASL $020E		   
							  ; Data region
		.byte $07
$A89E:  06 0D		 ASL $0D			 
							  ; Data region
		.byte $0F, $0F
$A8A2:  0E 11 02	  ASL $0211		   
							  ; Data region
		.byte $07
$A8A6:  06 0D		 ASL $0D			 
							  ; Data region
		.byte $0F, $0F
sub_A8AA:
$A8AA:  20 9C 89	  JSR $899C		   
$A8AD:  A0 05		 LDY #$05			
$A8AF:  B1 86		 LDA (stat_ptr_lo),Y ; Stat table pointer low
$A8B1:  85 03		 STA tmp3			; Temporary 3
$A8B3:  C8			INY				 
$A8B4:  B1 86		 LDA (stat_ptr_lo),Y ; Stat table pointer low
$A8B6:  85 04		 STA $04			 
$A8B8:  C8			INY				 
$A8B9:  B1 86		 LDA (stat_ptr_lo),Y ; Stat table pointer low
$A8BB:  85 05		 STA $05			 
$A8BD:  4C 5B A8	  JMP $A85B		   
$A8C0:  AD 80 6E	  LDA action_type	 ; Current action type
$A8C3:  C9 04		 CMP #$04			
$A8C5:  60			RTS				 
$A8C6:  20 D5 A8	  JSR $A8D5		   
$A8C9:  20 E1 A8	  JSR $A8E1		   
$A8CC:  20 06 A9	  JSR $A906		   
$A8CF:  20 2E A9	  JSR $A92E		   
$A8D2:  4C 10 91	  JMP finalize		; Finalize action

; ------------------------------
sub_A8D5:
$A8D5:  A9 00		 LDA #$00			
$A8D7:  8D F3 75	  STA $75F3		   
$A8DA:  8D F5 75	  STA $75F5		   
$A8DD:  8D F4 75	  STA $75F4		   
$A8E0:  60			RTS				 

; ------------------------------
sub_A8E1:
$A8E1:  A2 0B		 LDX #$0B			
$A8E3:  8A			TXA				 
$A8E4:  48			PHA				 
$A8E5:  20 8D A5	  JSR valid_act	   ; Validate action
$A8E8:  90 06		 BCC $A8F0		   
$A8EA:  C0 32		 CPY #$32			
$A8EC:  18			CLC				 
$A8ED:  F0 01		 BEQ $A8F0		   
$A8EF:  38			SEC				 
$A8F0:  2E F3 75	  ROL $75F3		   
$A8F3:  2E F4 75	  ROL $75F4		   
$A8F6:  68			PLA				 
$A8F7:  AA			TAX				 
$A8F8:  CA			DEX				 
$A8F9:  10 E8		 BPL $A8E3		   
$A8FB:  A9 30		 LDA #$30			
$A8FD:  0D F4 75	  ORA $75F4		   
$A900:  29 3F		 AND #$3F			
$A902:  8D F4 75	  STA $75F4		   
$A905:  60			RTS				 

; ------------------------------
sub_A906:
$A906:  AD E8 75	  LDA spell_idx	   ; Spell index
$A909:  20 B6 89	  JSR get_act		 ; Get action data
$A90C:  A0 13		 LDY #$13			
$A90E:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$A910:  29 7F		 AND #$7F			
$A912:  00			BRK				 
$A913:  15 0F		 ORA $0F,X		   
$A915:  90 05		 BCC $A91C		   
$A917:  C9 7F		 CMP #$7F			
$A919:  4C 1D A9	  JMP $A91D		   
$A91C:  38			SEC				 
$A91D:  6E F5 75	  ROR $75F5		   
$A920:  C8			INY				 
$A921:  C0 1B		 CPY #$1B			
$A923:  90 E9		 BCC $A90E		   
$A925:  AD F5 75	  LDA $75F5		   
$A928:  49 FF		 EOR #$FF			
$A92A:  8D F5 75	  STA $75F5		   
$A92D:  60			RTS				 

; ------------------------------
sub_A92E:
$A92E:  AD F0 75	  LDA btl_f0		  ; Battle flag F0
$A931:  29 7F		 AND #$7F			
$A933:  8D F0 75	  STA btl_f0		  ; Battle flag F0
$A936:  A2 02		 LDX #$02			
$A938:  BD F3 75	  LDA $75F3,X		 
$A93B:  00			BRK				 
							  ; Data region
		.byte $2B, $0F
$A93E:  2E DA 75	  ROL act_cat		 ; Action category
$A941:  9D F3 75	  STA $75F3,X		 
$A944:  CA			DEX				 
$A945:  10 F1		 BPL $A938		   
$A947:  AD DA 75	  LDA act_cat		 ; Action category
$A94A:  29 07		 AND #$07			
$A94C:  00			BRK				 
$A94D:  2A			ROL				 
							  ; Data region
		.byte $0F
$A94F:  AA			TAX				 
$A950:  BD F3 75	  LDA $75F3,X		 
$A953:  E0 02		 CPX #$02			
$A955:  B0 22		 BCS $A979		   
$A957:  E0 01		 CPX #$01			
$A959:  D0 07		 BNE $A962		   
$A95B:  18			CLC				 
$A95C:  69 08		 ADC #$08			
$A95E:  C9 0C		 CMP #$0C			
$A960:  B0 38		 BCS $A99A		   
$A962:  85 00		 STA tmp0			; Temporary 0
$A964:  AE E8 75	  LDX spell_idx	   ; Spell index
$A967:  CA			DEX				 
$A968:  8A			TXA				 
$A969:  0A			ASL				 
$A96A:  0A			ASL				 
$A96B:  85 01		 STA tmp1			; Temporary 1
$A96D:  0A			ASL				 
$A96E:  65 01		 ADC tmp1			; Temporary 1
$A970:  65 00		 ADC tmp0			; Temporary 0
$A972:  AA			TAX				 
$A973:  BD 96 A6	  LDA $A696,X		 
$A976:  4C 9E A9	  JMP $A99E		   
$A979:  48			PHA				 
$A97A:  AD F0 75	  LDA btl_f0		  ; Battle flag F0
$A97D:  09 80		 ORA #$80			
$A97F:  8D F0 75	  STA btl_f0		  ; Battle flag F0
$A982:  AD E8 75	  LDA spell_idx	   ; Spell index
$A985:  20 B6 89	  JSR get_act		 ; Get action data
$A988:  68			PLA				 
$A989:  18			CLC				 
$A98A:  69 13		 ADC #$13			
$A98C:  A8			TAY				 
$A98D:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$A98F:  29 7F		 AND #$7F			
$A991:  8D F2 75	  STA $75F2		   
$A994:  00			BRK				 
							  ; Data region
		.byte $17, $1F
$A997:  4C 9E A9	  JMP $A99E		   
$A99A:  AA			TAX				 
$A99B:  BD B4 A9	  LDA $A9B4,X		 
$A99E:  8D DB 75	  STA act_id		  ; Action ID
$A9A1:  AA			TAX				 
$A9A2:  A0 00		 LDY #$00			
$A9A4:  E0 30		 CPX #$30			
$A9A6:  F0 0A		 BEQ $A9B2		   
$A9A8:  E0 31		 CPX #$31			
$A9AA:  F0 06		 BEQ $A9B2		   
$A9AC:  E0 97		 CPX #$97			
$A9AE:  F0 02		 BEQ $A9B2		   
$A9B0:  A0 80		 LDY #$80			
$A9B2:  20 97 A7	  JSR $A797		   
$A9B5:  AE F0 75	  LDX btl_f0		  ; Battle flag F0
$A9B8:  10 02		 BPL $A9BC		   
$A9BA:  09 20		 ORA #$20			
$A9BC:  8D DA 75	  STA act_cat		 ; Action category
$A9BF:  60			RTS				 
							  ; Data region
		.byte $43
$A9C1:  41 A5		 EOR ($A5,X)		 
$A9C3:  00			BRK				 
$A9C4:  05 01		 ORA tmp1			; Temporary 1
$A9C6:  F0 31		 BEQ $A9F9		   
$A9C8:  20 67 AA	  JSR dmg_calc		; Damage calculation
$A9CB:  AD DB 75	  LDA act_id		  ; Action ID
$A9CE:  C9 FF		 CMP #$FF			
$A9D0:  F0 40		 BEQ $AA12		   
$A9D2:  38			SEC				 
$A9D3:  AD D4 75	  LDA damage_lo	   ; Damage output low
$A9D6:  E5 0A		 SBC $0A			 
$A9D8:  85 0F		 STA $0F			 
$A9DA:  AD D5 75	  LDA damage_hi	   ; Damage output high
$A9DD:  E5 0B		 SBC $0B			 
$A9DF:  05 0F		 ORA $0F			 
$A9E1:  85 0F		 STA $0F			 
$A9E3:  AD D6 75	  LDA $75D6		   
$A9E6:  E5 0C		 SBC $0C			 
$A9E8:  05 0F		 ORA $0F			 
$A9EA:  F0 04		 BEQ $A9F0		   
$A9EC:  B0 64		 BCS $AA52		   
$A9EE:  90 22		 BCC $AA12		   
$A9F0:  A5 8B		 LDA actor_idx	   ; Current actor index
$A9F2:  D0 07		 BNE $A9FB		   
$A9F4:  AD DB 75	  LDA act_id		  ; Action ID
$A9F7:  C9 43		 CMP #$43			
$A9F9:  F0 57		 BEQ $AA52		   
$A9FB:  AD 80 6E	  LDA action_type	 ; Current action type
$A9FE:  C9 06		 CMP #$06			
$AA00:  D0 09		 BNE $AA0B		   
$AA02:  A5 8B		 LDA actor_idx	   ; Current actor index
$AA04:  CD E5 75	  CMP temp_e5		 ; Temp E5
$AA07:  90 49		 BCC $AA52		   
$AA09:  B0 07		 BCS $AA12		   
$AA0B:  AD E5 75	  LDA temp_e5		 ; Temp E5
$AA0E:  C5 8B		 CMP actor_idx	   ; Current actor index
$AA10:  90 40		 BCC $AA52		   
$AA12:  AD 80 6E	  LDA action_type	 ; Current action type
$AA15:  C9 02		 CMP #$02			
$AA17:  B0 0A		 BCS $AA23		   
$AA19:  A5 8B		 LDA actor_idx	   ; Current actor index
$AA1B:  F0 06		 BEQ $AA23		   
$AA1D:  A5 8C		 LDA action_param	; Action parameter
$AA1F:  C9 07		 CMP #$07			
$AA21:  90 2F		 BCC $AA52		   
$AA23:  20 59 AB	  JSR chk_resist	  ; Check resistance
$AA26:  90 2A		 BCC $AA52		   
$AA28:  A5 0A		 LDA $0A			 
$AA2A:  8D D4 75	  STA damage_lo	   ; Damage output low
$AA2D:  A5 0B		 LDA $0B			 
$AA2F:  8D D5 75	  STA damage_hi	   ; Damage output high
$AA32:  A5 0C		 LDA $0C			 
$AA34:  8D D6 75	  STA $75D6		   
$AA37:  A5 8B		 LDA actor_idx	   ; Current actor index
$AA39:  8D E5 75	  STA temp_e5		 ; Temp E5
$AA3C:  A5 8C		 LDA action_param	; Action parameter
$AA3E:  8D D9 75	  STA actor		   ; Acting character
$AA41:  AD D1 75	  LDA act_ptr		 ; Action pointer
$AA44:  8D EC 75	  STA rng_val		 ; RNG value
$AA47:  AD D3 75	  LDA target		  ; Target index
$AA4A:  8D DB 75	  STA act_id		  ; Action ID
$AA4D:  20 54 AA	  JSR store_act	   ; Store action type
$AA50:  38			SEC				 
$AA51:  60			RTS				 
$AA52:  18			CLC				 
$AA53:  60			RTS				 

; --------------------------------------------------
; Store action type
; --------------------------------------------------
store_act:					 ; $AA54
$AA54:  AD D2 75	  LDA act_type		; Action type
$AA57:  8D DA 75	  STA act_cat		 ; Action category
$AA5A:  29 70		 AND #$70			
$AA5C:  C9 20		 CMP #$20			
$AA5E:  D0 06		 BNE $AA66		   
$AA60:  AD 55 73	  LDA $7355		   
$AA63:  8D F2 75	  STA $75F2		   
$AA66:  60			RTS				 

; --------------------------------------------------
; Damage calculation
; --------------------------------------------------
dmg_calc:					 ; $AA67
$AA67:  A9 00		 LDA #$00			
$AA69:  85 0A		 STA $0A			 
$AA6B:  85 0E		 STA $0E			 
$AA6D:  85 0F		 STA $0F			 
$AA6F:  A5 00		 LDA tmp0			; Temporary 0
$AA71:  85 0B		 STA $0B			 
$AA73:  A5 01		 LDA tmp1			; Temporary 1
$AA75:  85 0C		 STA $0C			 
$AA77:  A5 8B		 LDA actor_idx	   ; Current actor index
$AA79:  85 0D		 STA $0D			 
$AA7B:  A2 0D		 LDX #$0D			
$AA7D:  20 76 81	  JSR mul16		   ; Multiply by 16
$AA80:  18			CLC				 
$AA81:  AD ED 75	  LDA stat_sum_lo	 ; Party stat sum low
$AA84:  65 0D		 ADC $0D			 
$AA86:  85 0D		 STA $0D			 
$AA88:  AD EE 75	  LDA stat_sum_hi	 ; Party stat sum high
$AA8B:  65 0E		 ADC $0E			 
$AA8D:  85 0E		 STA $0E			 
$AA8F:  A5 0F		 LDA $0F			 
$AA91:  69 00		 ADC #$00			
$AA93:  85 0F		 STA $0F			 
$AA95:  90 08		 BCC apply_def	   ; -> Apply defense
$AA97:  A9 FF		 LDA #$FF			
$AA99:  85 0D		 STA $0D			 
$AA9B:  85 0E		 STA $0E			 
$AA9D:  85 0F		 STA $0F			 
apply_def:					 ; $AA9F
$AA9F:  A2 0A		 LDX #$0A			
$AAA1:  A0 0D		 LDY #$0D			
$AAA3:  20 54 84	  JSR div_3byte	   ; 3-byte division
$AAA6:  AC 80 6E	  LDY action_type	 ; Current action type
$AAA9:  B9 8B BB	  LDA stat_mult,Y	 ; Stat multiplier table
$AAAC:  20 66 83	  JSR mult_pair	   ; Multiply pair
$AAAF:  06 0A		 ASL $0A			 
$AAB1:  26 0B		 ROL $0B			 
$AAB3:  26 0C		 ROL $0C			 
$AAB5:  26 1A		 ROL mult_ext		; Product extended
$AAB7:  06 0A		 ASL $0A			 
$AAB9:  26 0B		 ROL $0B			 
$AABB:  26 0C		 ROL $0C			 
$AABD:  26 1A		 ROL mult_ext		; Product extended
$AABF:  06 0A		 ASL $0A			 
$AAC1:  26 0B		 ROL $0B			 
$AAC3:  26 0C		 ROL $0C			 
$AAC5:  26 1A		 ROL mult_ext		; Product extended
$AAC7:  06 0A		 ASL $0A			 
$AAC9:  26 0B		 ROL $0B			 
$AACB:  26 0C		 ROL $0C			 
$AACD:  26 1A		 ROL mult_ext		; Product extended
$AACF:  A5 00		 LDA tmp0			; Temporary 0
$AAD1:  85 0D		 STA $0D			 
$AAD3:  A5 01		 LDA tmp1			; Temporary 1
$AAD5:  85 0E		 STA $0E			 
$AAD7:  AC 80 6E	  LDY action_type	 ; Current action type
$AADA:  B9 84 BB	  LDA atk_mult,Y	  ; Attack multiplier table
$AADD:  A2 0D		 LDX #$0D			
$AADF:  20 30 83	  JSR mult_a		  ; Multiply by A
$AAE2:  18			CLC				 
$AAE3:  A5 0A		 LDA $0A			 
$AAE5:  65 0D		 ADC $0D			 
$AAE7:  85 0D		 STA $0D			 
$AAE9:  A5 0B		 LDA $0B			 
$AAEB:  65 0E		 ADC $0E			 
$AAED:  85 0E		 STA $0E			 
$AAEF:  A5 0C		 LDA $0C			 
$AAF1:  65 19		 ADC mult_hi		 ; Product high
$AAF3:  85 0F		 STA $0F			 
$AAF5:  A9 00		 LDA #$00			
$AAF7:  85 08		 STA $08			 
$AAF9:  85 0B		 STA $0B			 
$AAFB:  A5 8B		 LDA actor_idx	   ; Current actor index
$AAFD:  0A			ASL				 
$AAFE:  26 0B		 ROL $0B			 
$AB00:  0A			ASL				 
$AB01:  26 0B		 ROL $0B			 
$AB03:  0A			ASL				 
$AB04:  26 0B		 ROL $0B			 
$AB06:  85 0A		 STA $0A			 
$AB08:  38			SEC				 
$AB09:  ED EF 75	  SBC def_mod		 ; Defense modifier
$AB0C:  85 0A		 STA $0A			 
$AB0E:  A5 0B		 LDA $0B			 
$AB10:  E9 00		 SBC #$00			
$AB12:  85 0B		 STA $0B			 
$AB14:  05 0A		 ORA $0A			 
$AB16:  F0 34		 BEQ $AB4C		   
$AB18:  90 32		 BCC $AB4C		   
$AB1A:  A9 08		 LDA #$08			
$AB1C:  A2 0A		 LDX #$0A			
$AB1E:  20 13 C8	  JSR $C813		   
$AB21:  A9 08		 LDA #$08			
$AB23:  85 09		 STA $09			 
$AB25:  A2 08		 LDX #$08			
$AB27:  A0 0A		 LDY #$0A			
$AB29:  20 AA 83	  JSR add_pairs	   ; Add 16-bit pairs
$AB2C:  A5 09		 LDA $09			 
$AB2E:  F0 08		 BEQ $AB38		   
$AB30:  A9 00		 LDA #$00			
$AB32:  85 09		 STA $09			 
$AB34:  A9 FF		 LDA #$FF			
$AB36:  85 08		 STA $08			 
$AB38:  A5 08		 LDA $08			 
$AB3A:  A2 0D		 LDX #$0D			
$AB3C:  20 66 83	  JSR mult_pair	   ; Multiply pair
$AB3F:  A5 0E		 LDA $0E			 
$AB41:  85 0A		 STA $0A			 
$AB43:  A5 0F		 LDA $0F			 
$AB45:  85 0B		 STA $0B			 
$AB47:  A5 1A		 LDA mult_ext		; Product extended
$AB49:  85 0C		 STA $0C			 
$AB4B:  60			RTS				 
$AB4C:  A5 0D		 LDA $0D			 
$AB4E:  85 0A		 STA $0A			 
$AB50:  A5 0E		 LDA $0E			 
$AB52:  85 0B		 STA $0B			 
$AB54:  A5 0F		 LDA $0F			 
$AB56:  85 0C		 STA $0C			 
$AB58:  60			RTS				 

; --------------------------------------------------
; Check resistance
; --------------------------------------------------
chk_resist:					 ; $AB59
$AB59:  AD E8 75	  LDA spell_idx	   ; Spell index
$AB5C:  20 B6 89	  JSR get_act		 ; Get action data
$AB5F:  A0 01		 LDY #$01			
$AB61:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$AB63:  85 08		 STA $08			 
$AB65:  C8			INY				 
$AB66:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$AB68:  85 09		 STA $09			 
$AB6A:  AD E1 75	  LDA power_lo		; Action power low
$AB6D:  85 0E		 STA $0E			 
$AB6F:  AD E2 75	  LDA power_hi		; Action power high
$AB72:  85 0F		 STA $0F			 
$AB74:  A9 00		 LDA #$00			
$AB76:  85 0D		 STA $0D			 
$AB78:  A2 0D		 LDX #$0D			
$AB7A:  A0 08		 LDY #$08			
$AB7C:  20 F4 83	  JSR div24_set	   ; 24-bit div setup
$AB7F:  A5 0E		 LDA $0E			 
$AB81:  05 0F		 ORA $0F			 
$AB83:  F0 04		 BEQ $AB89		   
$AB85:  A9 FF		 LDA #$FF			
$AB87:  85 0D		 STA $0D			 
$AB89:  AE 80 6E	  LDX action_type	 ; Current action type
$AB8C:  BD 92 BB	  LDA hit_thresh,X	; Hit threshold table
$AB8F:  C5 0D		 CMP $0D			 
$AB91:  60			RTS				 
$AB92:  A5 00		 LDA tmp0			; Temporary 0
$AB94:  05 01		 ORA tmp1			; Temporary 1
$AB96:  F0 5E		 BEQ $ABF6		   
$AB98:  AD DB 75	  LDA act_id		  ; Action ID
$AB9B:  C9 FF		 CMP #$FF			
$AB9D:  F0 2B		 BEQ $ABCA		   
$AB9F:  20 09 AC	  JSR $AC09		   
$ABA2:  90 52		 BCC $ABF6		   
$ABA4:  20 F7 AB	  JSR $ABF7		   
$ABA7:  90 4D		 BCC $ABF6		   
$ABA9:  20 19 AC	  JSR $AC19		   
$ABAC:  20 3C AC	  JSR $AC3C		   
$ABAF:  38			SEC				 
$ABB0:  A5 0C		 LDA $0C			 
$ABB2:  E5 0A		 SBC $0A			 
$ABB4:  85 0E		 STA $0E			 
$ABB6:  A5 0D		 LDA $0D			 
$ABB8:  E5 0B		 SBC $0B			 
$ABBA:  90 0E		 BCC $ABCA		   
$ABBC:  05 0E		 ORA $0E			 
$ABBE:  F0 02		 BEQ $ABC2		   
$ABC0:  B0 34		 BCS $ABF6		   
$ABC2:  AD E5 75	  LDA temp_e5		 ; Temp E5
$ABC5:  38			SEC				 
$ABC6:  E5 8B		 SBC actor_idx	   ; Current actor index
$ABC8:  90 2C		 BCC $ABF6		   
$ABCA:  A5 00		 LDA tmp0			; Temporary 0
$ABCC:  8D D4 75	  STA damage_lo	   ; Damage output low
$ABCF:  A5 01		 LDA tmp1			; Temporary 1
$ABD1:  8D D5 75	  STA damage_hi	   ; Damage output high
$ABD4:  A5 02		 LDA tmp2			; Temporary 2
$ABD6:  8D D7 75	  STA $75D7		   
$ABD9:  A5 03		 LDA tmp3			; Temporary 3
$ABDB:  8D D8 75	  STA $75D8		   
$ABDE:  A5 8B		 LDA actor_idx	   ; Current actor index
$ABE0:  8D E5 75	  STA temp_e5		 ; Temp E5
$ABE3:  A5 8C		 LDA action_param	; Action parameter
$ABE5:  8D E6 75	  STA $75E6		   
$ABE8:  A5 8D		 LDA $8D			 
$ABEA:  8D E7 75	  STA $75E7		   
$ABED:  AD D3 75	  LDA target		  ; Target index
$ABF0:  8D DB 75	  STA act_id		  ; Action ID
$ABF3:  20 54 AA	  JSR store_act	   ; Store action type
$ABF6:  60			RTS				 

; ------------------------------
sub_ABF7:
$ABF7:  A5 7C		 LDA $7C			 
$ABF9:  C9 01		 CMP #$01			
$ABFB:  F0 0B		 BEQ $AC08		   
$ABFD:  38			SEC				 
$ABFE:  A5 8C		 LDA action_param	; Action parameter
$AC00:  ED E6 75	  SBC $75E6		   
$AC03:  A5 8D		 LDA $8D			 
$AC05:  ED E7 75	  SBC $75E7		   
$AC08:  60			RTS				 

; ------------------------------
sub_AC09:
$AC09:  A5 82		 LDA inner_loop	  ; Inner loop counter
$AC0B:  0A			ASL				 
$AC0C:  AA			TAX				 
$AC0D:  38			SEC				 
$AC0E:  A5 04		 LDA $04			 
$AC10:  FD C1 75	  SBC $75C1,X		 
$AC13:  A5 05		 LDA $05			 
$AC15:  FD C2 75	  SBC $75C2,X		 
$AC18:  60			RTS				 

; ------------------------------
sub_AC19:
$AC19:  A5 00		 LDA tmp0			; Temporary 0
$AC1B:  85 0A		 STA $0A			 
$AC1D:  A9 00		 LDA #$00			
$AC1F:  85 0B		 STA $0B			 
$AC21:  60			RTS				 
$AC22:  A5 02		 LDA tmp2			; Temporary 2
$AC24:  85 0A		 STA $0A			 
$AC26:  A5 03		 LDA tmp3			; Temporary 3
$AC28:  85 0B		 STA $0B			 
$AC2A:  A5 00		 LDA tmp0			; Temporary 0
$AC2C:  A2 0A		 LDX #$0A			
$AC2E:  20 30 83	  JSR mult_a		  ; Multiply by A
$AC31:  A5 0B		 LDA $0B			 
$AC33:  85 0A		 STA $0A			 
$AC35:  A5 19		 LDA mult_hi		 ; Product high
$AC37:  85 0B		 STA $0B			 
$AC39:  4C 87 81	  JMP div16		   ; Divide by 16

; ------------------------------
sub_AC3C:
$AC3C:  AD D4 75	  LDA damage_lo	   ; Damage output low
$AC3F:  85 0C		 STA $0C			 
$AC41:  A9 00		 LDA #$00			
$AC43:  85 0D		 STA $0D			 
$AC45:  60			RTS				 
$AC46:  AD D7 75	  LDA $75D7		   
$AC49:  85 0C		 STA $0C			 
$AC4B:  AD D8 75	  LDA $75D8		   
$AC4E:  85 0D		 STA $0D			 
$AC50:  AD D4 75	  LDA damage_lo	   ; Damage output low
$AC53:  A2 0C		 LDX #$0C			
$AC55:  20 30 83	  JSR mult_a		  ; Multiply by A
$AC58:  A5 0D		 LDA $0D			 
$AC5A:  85 0C		 STA $0C			 
$AC5C:  A5 19		 LDA mult_hi		 ; Product high
$AC5E:  85 0D		 STA $0D			 
$AC60:  4C 87 81	  JMP div16		   ; Divide by 16

; ------------------------------
sub_AC63:
$AC63:  AD DB 75	  LDA act_id		  ; Action ID
$AC66:  C9 29		 CMP #$29			
$AC68:  90 04		 BCC $AC6E		   
$AC6A:  C9 2D		 CMP #$2D			
$AC6C:  90 34		 BCC $ACA2		   
$AC6E:  AD DB 75	  LDA act_id		  ; Action ID
$AC71:  C9 2E		 CMP #$2E			
$AC73:  90 04		 BCC $AC79		   
$AC75:  C9 33		 CMP #$33			
$AC77:  90 05		 BCC $AC7E		   
$AC79:  A9 00		 LDA #$00			
$AC7B:  8D E6 75	  STA $75E6		   
$AC7E:  A5 8C		 LDA action_param	; Action parameter
$AC80:  CD E6 75	  CMP $75E6		   
$AC83:  90 1D		 BCC $ACA2		   
$AC85:  A5 00		 LDA tmp0			; Temporary 0
$AC87:  8D D4 75	  STA damage_lo	   ; Damage output low
$AC8A:  A5 01		 LDA tmp1			; Temporary 1
$AC8C:  8D D5 75	  STA damage_hi	   ; Damage output high
$AC8F:  A5 8B		 LDA actor_idx	   ; Current actor index
$AC91:  8D E5 75	  STA temp_e5		 ; Temp E5
$AC94:  A5 8C		 LDA action_param	; Action parameter
$AC96:  8D E6 75	  STA $75E6		   
$AC99:  AD D3 75	  LDA target		  ; Target index
$AC9C:  8D DB 75	  STA act_id		  ; Action ID
$AC9F:  20 54 AA	  JSR store_act	   ; Store action type
$ACA2:  60			RTS				 
$ACA3:  A9 00		 LDA #$00			
$ACA5:  8D E1 75	  STA power_lo		; Action power low
$ACA8:  8D E2 75	  STA power_hi		; Action power high
$ACAB:  20 C2 A9	  JSR $A9C2		   
$ACAE:  B0 00		 BCS $ACB0		   
$ACB0:  60			RTS				 

; ------------------------------
sub_ACB1:
$ACB1:  A5 0E		 LDA $0E			 
$ACB3:  85 0A		 STA $0A			 
$ACB5:  A5 0F		 LDA $0F			 
$ACB7:  85 0B		 STA $0B			 
$ACB9:  AD DF 75	  LDA $75DF		   
$ACBC:  85 0C		 STA $0C			 
$ACBE:  AD E0 75	  LDA $75E0		   
$ACC1:  85 0D		 STA $0D			 
$ACC3:  A2 0A		 LDX #$0A			
$ACC5:  A0 0C		 LDY #$0C			
$ACC7:  20 76 81	  JSR mul16		   ; Multiply by 16
$ACCA:  20 AA 83	  JSR add_pairs	   ; Add 16-bit pairs
$ACCD:  A5 0A		 LDA $0A			 
$ACCF:  A4 0B		 LDY $0B			 
$ACD1:  F0 02		 BEQ $ACD5		   
$ACD3:  A9 1F		 LDA #$1F			
$ACD5:  85 0A		 STA $0A			 
$ACD7:  A9 00		 LDA #$00			
$ACD9:  85 0B		 STA $0B			 
$ACDB:  A5 8C		 LDA action_param	; Action parameter
$ACDD:  20 9A 81	  JSR $819A		   
$ACE0:  A5 0A		 LDA $0A			 
$ACE2:  C9 18		 CMP #$18			
$ACE4:  90 27		 BCC $AD0D		   
$ACE6:  A2 0E		 LDX #$0E			
$ACE8:  A5 8C		 LDA action_param	; Action parameter
$ACEA:  20 9A 81	  JSR $819A		   
$ACED:  38			SEC				 
$ACEE:  A5 0E		 LDA $0E			 
$ACF0:  ED D4 75	  SBC damage_lo	   ; Damage output low
$ACF3:  A5 0F		 LDA $0F			 
$ACF5:  ED D5 75	  SBC damage_hi	   ; Damage output high
$ACF8:  90 13		 BCC $AD0D		   
$ACFA:  A5 0E		 LDA $0E			 
$ACFC:  8D D4 75	  STA damage_lo	   ; Damage output low
$ACFF:  A5 0F		 LDA $0F			 
$AD01:  8D D5 75	  STA damage_hi	   ; Damage output high
$AD04:  AD D3 75	  LDA target		  ; Target index
$AD07:  8D DB 75	  STA act_id		  ; Action ID
$AD0A:  20 54 AA	  JSR store_act	   ; Store action type
$AD0D:  60			RTS				 

; ------------------------------
sub_AD0E:
$AD0E:  A5 00		 LDA tmp0			; Temporary 0
$AD10:  CD D4 75	  CMP damage_lo	   ; Damage output low
$AD13:  90 0F		 BCC $AD24		   
$AD15:  8D D4 75	  STA damage_lo	   ; Damage output low
$AD18:  AD D2 75	  LDA act_type		; Action type
$AD1B:  8D DA 75	  STA act_cat		 ; Action category
$AD1E:  AD D3 75	  LDA target		  ; Target index
$AD21:  8D DB 75	  STA act_id		  ; Action ID
$AD24:  60			RTS				 
$AD25:  60			RTS				 

; ------------------------------
sub_AD26:
$AD26:  20 19 87	  JSR $8719		   
$AD29:  90 FA		 BCC $AD25		   
$AD2B:  20 D9 87	  JSR $87D9		   
$AD2E:  AD E9 75	  LDA $75E9		   
$AD31:  A2 0E		 LDX #$0E			
$AD33:  20 51 C8	  JSR $C851		   
$AD36:  20 23 88	  JSR $8823		   
$AD39:  A0 05		 LDY #$05			
$AD3B:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$AD3D:  29 10		 AND #$10			
$AD3F:  F0 05		 BEQ $AD46		   
$AD41:  A9 06		 LDA #$06			
$AD43:  20 98 81	  JSR scale_stat	  ; Scale stat value
$AD46:  AD E4 72	  LDA $72E4		   
$AD49:  30 40		 BMI $AD8B		   
$AD4B:  A0 05		 LDY #$05			
$AD4D:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$AD4F:  29 08		 AND #$08			
$AD51:  D0 38		 BNE $AD8B		   
$AD53:  20 66 88	  JSR $8866		   
$AD56:  C9 05		 CMP #$05			
$AD58:  B0 31		 BCS $AD8B		   
$AD5A:  85 0C		 STA $0C			 
$AD5C:  A2 0B		 LDX #$0B			
$AD5E:  8A			TXA				 
$AD5F:  48			PHA				 
$AD60:  85 0D		 STA $0D			 
$AD62:  20 AA A5	  JSR find_tgt		; Find valid target
$AD65:  90 1F		 BCC $AD86		   
$AD67:  C0 12		 CPY #$12			
$AD69:  B0 1B		 BCS $AD86		   
$AD6B:  B9 67 B9	  LDA enemy_res_tbl,Y ; Enemy resistance table
$AD6E:  29 1F		 AND #$1F			
$AD70:  48			PHA				 
$AD71:  20 D6 86	  JSR $86D6		   
$AD74:  A5 01		 LDA tmp1			; Temporary 1
$AD76:  F0 04		 BEQ $AD7C		   
$AD78:  A9 FF		 LDA #$FF			
$AD7A:  85 00		 STA tmp0			; Temporary 0
$AD7C:  68			PLA				 
$AD7D:  C5 00		 CMP tmp0			; Temporary 0
$AD7F:  F0 02		 BEQ $AD83		   
$AD81:  B0 03		 BCS $AD86		   
$AD83:  20 C0 AD	  JSR $ADC0		   
$AD86:  68			PLA				 
$AD87:  AA			TAX				 
$AD88:  CA			DEX				 
$AD89:  10 D3		 BPL $AD5E		   
$AD8B:  A5 95		 LDA $95			 
$AD8D:  29 0F		 AND #$0F			
$AD8F:  F0 04		 BEQ $AD95		   
$AD91:  A9 FF		 LDA #$FF			
$AD93:  85 95		 STA $95			 
$AD95:  A5 94		 LDA $94			 
$AD97:  85 8C		 STA action_param	; Action parameter
$AD99:  A5 95		 LDA $95			 
$AD9B:  29 0F		 AND #$0F			
$AD9D:  85 8D		 STA $8D			 
$AD9F:  60			RTS				 
$ADA0:  A5 82		 LDA inner_loop	  ; Inner loop counter
$ADA2:  20 6B 8A	  JSR $8A6B		   
$ADA5:  A0 13		 LDY #$13			
$ADA7:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$ADA9:  29 7F		 AND #$7F			
$ADAB:  C9 7F		 CMP #$7F			
$ADAD:  F0 0F		 BEQ $ADBE		   
$ADAF:  A2 09		 LDX #$09			
$ADB1:  DD BF AD	  CMP $ADBF,X		 
$ADB4:  F0 05		 BEQ $ADBB		   
$ADB6:  CA			DEX				 
$ADB7:  10 F8		 BPL $ADB1		   
$ADB9:  30 03		 BMI $ADBE		   
$ADBB:  20 C0 AD	  JSR $ADC0		   
$ADBE:  60			RTS				 
$ADBF:  00			BRK				 
sub_ADC0:
$ADC0:  A5 0D		 LDA $0D			 
$ADC2:  C9 12		 CMP #$12			
$ADC4:  B0 0C		 BCS $ADD2		   
$ADC6:  0A			ASL				 
$ADC7:  BD 4D B7	  LDA stat_tbl_1,X	; Stat modifier table 1
$ADCA:  85 8A		 STA char_count	  ; Character count
$ADCC:  A9 00		 LDA #$00			
$ADCE:  85 8B		 STA actor_idx	   ; Current actor index
$ADD0:  F0 08		 BEQ $ADDA		   
$ADD2:  A9 F4		 LDA #$F4			
$ADD4:  85 8A		 STA char_count	  ; Character count
$ADD6:  A9 01		 LDA #$01			
$ADD8:  85 8B		 STA actor_idx	   ; Current actor index
$ADDA:  A5 0D		 LDA $0D			 
$ADDC:  20 04 93	  JSR $9304		   
$ADDF:  A6 0D		 LDX $0D			 
$ADE1:  BD 67 B9	  LDA enemy_res_tbl,X ; Enemy resistance table
$ADE4:  29 60		 AND #$60			
$ADE6:  C9 40		 CMP #$40			
$ADE8:  B0 0C		 BCS $ADF6		   
$ADEA:  A9 00		 LDA #$00			
$ADEC:  85 04		 STA $04			 
$ADEE:  A2 03		 LDX #$03			
$ADF0:  AD E9 75	  LDA $75E9		   
$ADF3:  20 51 C8	  JSR $C851		   
$ADF6:  A2 8A		 LDX #$8A			
$ADF8:  A5 03		 LDA tmp3			; Temporary 3
$ADFA:  20 9A 81	  JSR $819A		   
$ADFD:  38			SEC				 
$ADFE:  A5 94		 LDA $94			 
$AE00:  E5 8A		 SBC char_count	  ; Character count
$AE02:  A5 95		 LDA $95			 
$AE04:  E5 8B		 SBC actor_idx	   ; Current actor index
$AE06:  B0 08		 BCS $AE10		   
$AE08:  A5 8A		 LDA char_count	  ; Character count
$AE0A:  85 94		 STA $94			 
$AE0C:  A5 8B		 LDA actor_idx	   ; Current actor index
$AE0E:  85 95		 STA $95			 
$AE10:  60			RTS				 

; ------------------------------
sub_AE11:
$AE11:  A9 00		 LDA #$00			
$AE13:  85 82		 STA inner_loop	  ; Inner loop counter
$AE15:  85 94		 STA $94			 
$AE17:  85 95		 STA $95			 
$AE19:  A9 00		 LDA #$00			
$AE1B:  85 8B		 STA actor_idx	   ; Current actor index
$AE1D:  85 8C		 STA action_param	; Action parameter
$AE1F:  A5 82		 LDA inner_loop	  ; Inner loop counter
$AE21:  20 6B 8A	  JSR $8A6B		   
$AE24:  90 34		 BCC $AE5A		   
$AE26:  85 8A		 STA char_count	  ; Character count
$AE28:  A0 00		 LDY #$00			
$AE2A:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$AE2C:  0A			ASL				 
$AE2D:  90 2B		 BCC $AE5A		   
$AE2F:  30 29		 BMI $AE5A		   
$AE31:  A5 8A		 LDA char_count	  ; Character count
$AE33:  20 F5 89	  JSR get_act_2	   ; Get secondary action
$AE36:  A0 05		 LDY #$05			
$AE38:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$AE3A:  29 04		 AND #$04			
$AE3C:  D0 1C		 BNE $AE5A		   
$AE3E:  E6 8C		 INC action_param	; Action parameter
$AE40:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$AE42:  29 08		 AND #$08			
$AE44:  F0 03		 BEQ $AE49		   
$AE46:  20 A6 AE	  JSR get_sp_pwr	  ; Get spell power
$AE49:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$AE4B:  29 10		 AND #$10			
$AE4D:  F0 03		 BEQ $AE52		   
$AE4F:  20 B4 AE	  JSR get_sp_atr	  ; Get spell attribute
$AE52:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$AE54:  4A			LSR				 
$AE55:  90 03		 BCC $AE5A		   
$AE57:  20 AF AE	  JSR shift_8c		; Shift $8C:$8B
$AE5A:  A5 8B		 LDA actor_idx	   ; Current actor index
$AE5C:  A4 8C		 LDY action_param	; Action parameter
$AE5E:  A2 94		 LDX #$94			
$AE60:  20 1D C8	  JSR $C81D		   
$AE63:  E6 82		 INC inner_loop	  ; Inner loop counter
$AE65:  A5 82		 LDA inner_loop	  ; Inner loop counter
$AE67:  C9 04		 CMP #$04			
$AE69:  90 AE		 BCC $AE19		   
$AE6B:  38			SEC				 
$AE6C:  A9 00		 LDA #$00			
$AE6E:  E5 94		 SBC $94			 
$AE70:  85 8B		 STA actor_idx	   ; Current actor index
$AE72:  A9 04		 LDA #$04			
$AE74:  E5 95		 SBC $95			 
$AE76:  85 8C		 STA action_param	; Action parameter
$AE78:  AD E8 75	  LDA spell_idx	   ; Spell index
$AE7B:  F0 21		 BEQ $AE9E		   
$AE7D:  C9 05		 CMP #$05			
$AE7F:  B0 1D		 BCS $AE9E		   
$AE81:  AD 80 6E	  LDA action_type	 ; Current action type
$AE84:  0A			ASL				 
$AE85:  0A			ASL				 
$AE86:  6D E8 75	  ADC spell_idx	   ; Spell index
$AE89:  A8			TAY				 
$AE8A:  B9 06 BB	  LDA tact_mod,Y	  ; Tactics modifier table
$AE8D:  A2 8B		 LDX #$8B			
$AE8F:  20 30 83	  JSR mult_a		  ; Multiply by A
$AE92:  A5 19		 LDA mult_hi		 ; Product high
$AE94:  D0 08		 BNE $AE9E		   
$AE96:  A5 8C		 LDA action_param	; Action parameter
$AE98:  18			CLC				 
$AE99:  79 22 BB	  ADC sp_bonus,Y	  ; Spell bonus table
$AE9C:  90 02		 BCC $AEA0		   
$AE9E:  A9 FF		 LDA #$FF			
$AEA0:  8D 68 73	  STA $7368		   
$AEA3:  4C CA AE	  JMP $AECA		   

; --------------------------------------------------
; Get spell power
; --------------------------------------------------
get_sp_pwr:					 ; $AEA6
$AEA6:  20 C0 AE	  JSR cap_sp_idx	  ; Cap spell index
$AEA9:  BD 3F BB	  LDA sp_power,X	  ; Spell power table
$AEAC:  4C BA AE	  JMP $AEBA		   

; --------------------------------------------------
; Shift $8C:$8B
; --------------------------------------------------
shift_8c:					 ; $AEAF
$AEAF:  46 8C		 LSR action_param	; Action parameter
$AEB1:  66 8B		 ROR actor_idx	   ; Current actor index
$AEB3:  60			RTS				 

; --------------------------------------------------
; Get spell attribute
; --------------------------------------------------
get_sp_atr:					 ; $AEB4
$AEB4:  20 C0 AE	  JSR cap_sp_idx	  ; Cap spell index
$AEB7:  BD 49 BB	  LDA sp_attr,X	   ; Spell attribute table
$AEBA:  A2 8B		 LDX #$8B			
$AEBC:  20 FB C7	  JSR $C7FB		   
$AEBF:  60			RTS				 

; --------------------------------------------------
; Cap spell index
; --------------------------------------------------
cap_sp_idx:					 ; $AEC0
$AEC0:  AE E8 75	  LDX spell_idx	   ; Spell index
$AEC3:  E0 08		 CPX #$08			
$AEC5:  90 02		 BCC $AEC9		   
$AEC7:  A2 08		 LDX #$08			
$AEC9:  60			RTS				 
$AECA:  A9 00		 LDA #$00			
$AECC:  85 7B		 STA calc_hit		; Calculated hit value
$AECE:  A9 0B		 LDA #$0B			
$AED0:  85 0D		 STA $0D			 
$AED2:  AD E8 75	  LDA spell_idx	   ; Spell index
$AED5:  85 0C		 STA $0C			 
$AED7:  20 AA A5	  JSR find_tgt		; Find valid target
$AEDA:  90 0B		 BCC $AEE7		   
$AEDC:  B9 67 B9	  LDA enemy_res_tbl,Y ; Enemy resistance table
$AEDF:  29 1F		 AND #$1F			
$AEE1:  C5 7B		 CMP calc_hit		; Calculated hit value
$AEE3:  90 02		 BCC $AEE7		   
$AEE5:  85 7B		 STA calc_hit		; Calculated hit value
$AEE7:  C6 0D		 DEC $0D			 
$AEE9:  10 EC		 BPL $AED7		   
$AEEB:  AD 68 73	  LDA $7368		   
$AEEE:  85 00		 STA tmp0			; Temporary 0
$AEF0:  A9 00		 LDA #$00			
$AEF2:  85 01		 STA tmp1			; Temporary 1
$AEF4:  A5 7B		 LDA calc_hit		; Calculated hit value
$AEF6:  A2 00		 LDX #$00			
$AEF8:  20 30 83	  JSR mult_a		  ; Multiply by A
$AEFB:  20 87 81	  JSR div16		   ; Divide by 16
$AEFE:  46 01		 LSR tmp1			; Temporary 1
$AF00:  66 00		 ROR tmp0			; Temporary 0
$AF02:  A5 01		 LDA tmp1			; Temporary 1
$AF04:  F0 04		 BEQ $AF0A		   
$AF06:  A9 FF		 LDA #$FF			
$AF08:  85 00		 STA tmp0			; Temporary 0
$AF0A:  A5 00		 LDA tmp0			; Temporary 0
$AF0C:  8D EF 75	  STA def_mod		 ; Defense modifier
$AF0F:  60			RTS				 

; --------------------------------------------------
; Attack handler
; --------------------------------------------------
atk_handler:					 ; $AF10
$AF10:  20 84 95	  JSR setup_act	   ; Setup action
$AF13:  20 C6 A6	  JSR st_setup1	   ; State setup 1
$AF16:  A2 08		 LDX #$08			
$AF18:  8A			TXA				 
$AF19:  48			PHA				 
$AF1A:  20 4D A5	  JSR exec_step	   ; Execute action step
$AF1D:  68			PLA				 
$AF1E:  AA			TAX				 
$AF1F:  CA			DEX				 
$AF20:  10 F6		 BPL $AF18		   
$AF22:  20 CA A6	  JSR st_setup2	   ; State setup 2
$AF25:  20 CE A6	  JSR st_setup3	   ; State setup 3
$AF28:  20 35 91	  JSR chk_hit		 ; Check hit/miss
$AF2B:  90 10		 BCC $AF3D		   
$AF2D:  20 A0 91	  JSR clr_dmg		 ; Clear damage vars
$AF30:  A9 09		 LDA #$09			
$AF32:  20 4D A5	  JSR exec_step	   ; Execute action step
$AF35:  A9 0A		 LDA #$0A			
$AF37:  20 4D A5	  JSR exec_step	   ; Execute action step
$AF3A:  20 D2 A6	  JSR st_clean		; State cleanup
$AF3D:  A9 0B		 LDA #$0B			
$AF3F:  20 4D A5	  JSR exec_step	   ; Execute action step
$AF42:  20 E0 B0	  JSR spec_enemy	  ; Special enemy check
$AF45:  4C 10 91	  JMP finalize		; Finalize action

; --------------------------------------------------
; Spell handler
; --------------------------------------------------
spell_hand:					 ; $AF48
$AF48:  20 84 95	  JSR setup_act	   ; Setup action
$AF4B:  20 C6 A6	  JSR st_setup1	   ; State setup 1
$AF4E:  A9 00		 LDA #$00			
$AF50:  20 4D A5	  JSR exec_step	   ; Execute action step
$AF53:  A9 01		 LDA #$01			
$AF55:  20 4D A5	  JSR exec_step	   ; Execute action step
$AF58:  A9 02		 LDA #$02			
$AF5A:  20 4D A5	  JSR exec_step	   ; Execute action step
$AF5D:  A9 03		 LDA #$03			
$AF5F:  20 4D A5	  JSR exec_step	   ; Execute action step
$AF62:  A9 04		 LDA #$04			
$AF64:  20 4D A5	  JSR exec_step	   ; Execute action step
$AF67:  A9 06		 LDA #$06			
$AF69:  20 4D A5	  JSR exec_step	   ; Execute action step
$AF6C:  20 CA A6	  JSR st_setup2	   ; State setup 2
$AF6F:  20 CE A6	  JSR st_setup3	   ; State setup 3
$AF72:  20 35 91	  JSR chk_hit		 ; Check hit/miss
$AF75:  90 1A		 BCC $AF91		   
$AF77:  20 A0 91	  JSR clr_dmg		 ; Clear damage vars
$AF7A:  A9 07		 LDA #$07			
$AF7C:  20 4D A5	  JSR exec_step	   ; Execute action step
$AF7F:  A9 08		 LDA #$08			
$AF81:  20 4D A5	  JSR exec_step	   ; Execute action step
$AF84:  A9 09		 LDA #$09			
$AF86:  20 4D A5	  JSR exec_step	   ; Execute action step
$AF89:  A9 0A		 LDA #$0A			
$AF8B:  20 4D A5	  JSR exec_step	   ; Execute action step
$AF8E:  20 D2 A6	  JSR st_clean		; State cleanup
$AF91:  20 E0 B0	  JSR spec_enemy	  ; Special enemy check
$AF94:  4C 10 91	  JMP finalize		; Finalize action

; --------------------------------------------------
; Item handler
; --------------------------------------------------
item_hand:					 ; $AF97
$AF97:  20 84 95	  JSR setup_act	   ; Setup action
$AF9A:  20 C6 A6	  JSR st_setup1	   ; State setup 1
$AF9D:  A9 00		 LDA #$00			
$AF9F:  20 4D A5	  JSR exec_step	   ; Execute action step
$AFA2:  A9 01		 LDA #$01			
$AFA4:  20 4D A5	  JSR exec_step	   ; Execute action step
$AFA7:  A9 02		 LDA #$02			
$AFA9:  20 4D A5	  JSR exec_step	   ; Execute action step
$AFAC:  A9 03		 LDA #$03			
$AFAE:  20 4D A5	  JSR exec_step	   ; Execute action step
$AFB1:  A9 04		 LDA #$04			
$AFB3:  20 4D A5	  JSR exec_step	   ; Execute action step
$AFB6:  A9 06		 LDA #$06			
$AFB8:  20 4D A5	  JSR exec_step	   ; Execute action step
$AFBB:  A9 07		 LDA #$07			
$AFBD:  20 4D A5	  JSR exec_step	   ; Execute action step
$AFC0:  A9 08		 LDA #$08			
$AFC2:  20 4D A5	  JSR exec_step	   ; Execute action step
$AFC5:  20 CA A6	  JSR st_setup2	   ; State setup 2
$AFC8:  A9 09		 LDA #$09			
$AFCA:  20 4D A5	  JSR exec_step	   ; Execute action step
$AFCD:  A9 0A		 LDA #$0A			
$AFCF:  20 4D A5	  JSR exec_step	   ; Execute action step
$AFD2:  A9 0B		 LDA #$0B			
$AFD4:  20 4D A5	  JSR exec_step	   ; Execute action step
$AFD7:  20 CE A6	  JSR st_setup3	   ; State setup 3
$AFDA:  20 35 91	  JSR chk_hit		 ; Check hit/miss
$AFDD:  90 0B		 BCC $AFEA		   
$AFDF:  20 A0 91	  JSR clr_dmg		 ; Clear damage vars
$AFE2:  A9 05		 LDA #$05			
$AFE4:  20 4D A5	  JSR exec_step	   ; Execute action step
$AFE7:  20 D2 A6	  JSR st_clean		; State cleanup
$AFEA:  20 E0 B0	  JSR spec_enemy	  ; Special enemy check
$AFED:  4C 10 91	  JMP finalize		; Finalize action

; --------------------------------------------------
; Handler at AFF0
; --------------------------------------------------
act_ff0:					 ; $AFF0
$AFF0:  20 84 95	  JSR setup_act	   ; Setup action
$AFF3:  20 C6 A6	  JSR st_setup1	   ; State setup 1
$AFF6:  A9 00		 LDA #$00			
$AFF8:  20 4D A5	  JSR exec_step	   ; Execute action step
$AFFB:  A9 01		 LDA #$01			
$AFFD:  20 4D A5	  JSR exec_step	   ; Execute action step
$B000:  A9 02		 LDA #$02			
$B002:  20 4D A5	  JSR exec_step	   ; Execute action step
$B005:  A9 03		 LDA #$03			
$B007:  20 4D A5	  JSR exec_step	   ; Execute action step
$B00A:  A9 06		 LDA #$06			
$B00C:  20 4D A5	  JSR exec_step	   ; Execute action step
$B00F:  A9 07		 LDA #$07			
$B011:  20 4D A5	  JSR exec_step	   ; Execute action step
$B014:  A9 08		 LDA #$08			
$B016:  20 4D A5	  JSR exec_step	   ; Execute action step
$B019:  A9 09		 LDA #$09			
$B01B:  20 4D A5	  JSR exec_step	   ; Execute action step
$B01E:  20 CA A6	  JSR st_setup2	   ; State setup 2
$B021:  A9 0A		 LDA #$0A			
$B023:  20 4D A5	  JSR exec_step	   ; Execute action step
$B026:  A9 0B		 LDA #$0B			
$B028:  20 4D A5	  JSR exec_step	   ; Execute action step
$B02B:  20 CE A6	  JSR st_setup3	   ; State setup 3
$B02E:  20 35 91	  JSR chk_hit		 ; Check hit/miss
$B031:  90 10		 BCC $B043		   
$B033:  20 A0 91	  JSR clr_dmg		 ; Clear damage vars
$B036:  A9 04		 LDA #$04			
$B038:  20 4D A5	  JSR exec_step	   ; Execute action step
$B03B:  A9 05		 LDA #$05			
$B03D:  20 4D A5	  JSR exec_step	   ; Execute action step
$B040:  20 D2 A6	  JSR st_clean		; State cleanup
$B043:  20 E0 B0	  JSR spec_enemy	  ; Special enemy check
$B046:  4C 10 91	  JMP finalize		; Finalize action

; --------------------------------------------------
; Defense handler
; --------------------------------------------------
def_hand:					 ; $B049
$B049:  20 84 95	  JSR setup_act	   ; Setup action
$B04C:  20 C6 A6	  JSR st_setup1	   ; State setup 1
$B04F:  20 CA A6	  JSR st_setup2	   ; State setup 2
$B052:  20 CE A6	  JSR st_setup3	   ; State setup 3
$B055:  20 35 91	  JSR chk_hit		 ; Check hit/miss
$B058:  90 06		 BCC $B060		   
$B05A:  20 A0 91	  JSR clr_dmg		 ; Clear damage vars
$B05D:  20 D2 A6	  JSR st_clean		; State cleanup
$B060:  20 E0 B0	  JSR spec_enemy	  ; Special enemy check
$B063:  4C 10 91	  JMP finalize		; Finalize action

; --------------------------------------------------
; Check chapter 4
; --------------------------------------------------
chk_ch4:					 ; $B066
$B066:  AD 5A 61	  LDA chapter		 ; Current chapter/battle actor
$B069:  C9 04		 CMP #$04			
$B06B:  D0 46		 BNE $B0B3		   
$B06D:  AD 44 6E	  LDA btl_mode		; Battle mode flag
$B070:  4A			LSR				 
$B071:  B0 40		 BCS $B0B3		   
$B073:  A2 03		 LDX #$03			
$B075:  8A			TXA				 
$B076:  48			PHA				 
$B077:  BD 49 6E	  LDA $6E49,X		 
$B07A:  F0 0A		 BEQ $B086		   
$B07C:  BD 06 72	  LDA $7206,X		 
$B07F:  C9 FF		 CMP #$FF			
$B081:  F0 03		 BEQ $B086		   
$B083:  20 8C B0	  JSR chk_party	   ; Check party status
$B086:  68			PLA				 
$B087:  AA			TAX				 
$B088:  CA			DEX				 
$B089:  10 EA		 BPL $B075		   
$B08B:  60			RTS				 

; --------------------------------------------------
; Check party status
; --------------------------------------------------
chk_party:					 ; $B08C
$B08C:  48			PHA				 
$B08D:  20 B4 B0	  JSR bit_rot		 ; Bit rotation
$B090:  AA			TAX				 
$B091:  20 91 C8	  JSR $C891		   
$B094:  DD DC B0	  CMP $B0DC,X		 
$B097:  68			PLA				 
$B098:  B0 19		 BCS $B0B3		   
$B09A:  20 BD B0	  JSR $B0BD		   
$B09D:  C5 00		 CMP tmp0			; Temporary 0
$B09F:  F0 12		 BEQ $B0B3		   
$B0A1:  18			CLC				 
$B0A2:  79 5E FF	  ADC $FF5E,Y		 
$B0A5:  85 01		 STA tmp1			; Temporary 1
$B0A7:  A5 00		 LDA tmp0			; Temporary 0
$B0A9:  49 FF		 EOR #$FF			
$B0AB:  3D 9B 61	  AND btl_flags,X	 ; Battle flags
$B0AE:  05 01		 ORA tmp1			; Temporary 1
$B0B0:  9D 9B 61	  STA btl_flags,X	 ; Battle flags
$B0B3:  60			RTS				 

; --------------------------------------------------
; Bit rotation
; --------------------------------------------------
bit_rot:					 ; $B0B4
$B0B4:  20 BD B0	  JSR $B0BD		   
$B0B7:  0A			ASL				 
$B0B8:  6A			ROR				 
$B0B9:  88			DEY				 
$B0BA:  10 FC		 BPL $B0B8		   
$B0BC:  60			RTS				 

; ------------------------------
sub_B0BD:
$B0BD:  20 C3 B0	  JSR $B0C3		   
$B0C0:  25 00		 AND tmp0			; Temporary 0
$B0C2:  60			RTS				 

; ------------------------------
sub_B0C3:
$B0C3:  48			PHA				 
$B0C4:  4A			LSR				 
$B0C5:  4A			LSR				 
$B0C6:  AA			TAX				 
$B0C7:  68			PLA				 
$B0C8:  29 03		 AND #$03			
$B0CA:  0A			ASL				 
$B0CB:  A8			TAY				 
$B0CC:  B9 5E FF	  LDA $FF5E,Y		 
$B0CF:  85 00		 STA tmp0			; Temporary 0
$B0D1:  B9 5F FF	  LDA $FF5F,Y		 
$B0D4:  05 00		 ORA tmp0			; Temporary 0
$B0D6:  85 00		 STA tmp0			; Temporary 0
$B0D8:  BD 9B 61	  LDA btl_flags,X	 ; Battle flags
$B0DB:  60			RTS				 
							  ; Data region
		.byte $FF, $80
$B0DE:  40			RTI				 
$B0DF:  00			BRK				 
spec_enemy:					 ; $B0E0
$B0E0:  AD DB 75	  LDA act_id		  ; Action ID
$B0E3:  C9 43		 CMP #$43			
$B0E5:  D0 4A		 BNE $B131		   
$B0E7:  AD EC 75	  LDA rng_val		 ; RNG value
$B0EA:  CD 99 BB	  CMP base_dmg		; Base damage value
$B0ED:  90 42		 BCC $B131		   
$B0EF:  20 32 B1	  JSR find_char	   ; Find valid character
$B0F2:  90 3D		 BCC $B131		   
$B0F4:  AD E8 75	  LDA spell_idx	   ; Spell index
$B0F7:  20 B6 89	  JSR get_act		 ; Get action data
$B0FA:  A0 01		 LDY #$01			
$B0FC:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$B0FE:  85 01		 STA tmp1			; Temporary 1
$B100:  C8			INY				 
$B101:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$B103:  85 02		 STA tmp2			; Temporary 2
$B105:  A9 00		 LDA #$00			
$B107:  85 00		 STA tmp0			; Temporary 0
$B109:  A0 0C		 LDY #$0C			
$B10B:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$B10D:  85 03		 STA tmp3			; Temporary 3
$B10F:  C8			INY				 
$B110:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$B112:  85 04		 STA $04			 
$B114:  A2 00		 LDX #$00			
$B116:  A0 03		 LDY #$03			
$B118:  20 F4 83	  JSR div24_set	   ; 24-bit div setup
$B11B:  A5 01		 LDA tmp1			; Temporary 1
$B11D:  05 02		 ORA tmp2			; Temporary 2
$B11F:  D0 10		 BNE $B131		   
$B121:  A5 00		 LDA tmp0			; Temporary 0
$B123:  C9 55		 CMP #$55			
$B125:  B0 0A		 BCS $B131		   
$B127:  A9 41		 LDA #$41			
$B129:  8D DB 75	  STA act_id		  ; Action ID
$B12C:  A9 00		 LDA #$00			
$B12E:  8D DA 75	  STA act_cat		 ; Action category
$B131:  60			RTS				 

; --------------------------------------------------
; Find valid character
; --------------------------------------------------
find_char:					 ; $B132
$B132:  AC 5B 73	  LDY $735B		   
$B135:  88			DEY				 
$B136:  20 4B B1	  JSR $B14B		   
$B139:  BD F4 72	  LDA char_state,X	; Character state array
$B13C:  10 04		 BPL $B142		   
$B13E:  29 70		 AND #$70			
$B140:  F0 07		 BEQ $B149		   
$B142:  C8			INY				 
$B143:  C0 0C		 CPY #$0C			
$B145:  90 EF		 BCC $B136		   
$B147:  18			CLC				 
$B148:  60			RTS				 
$B149:  38			SEC				 
$B14A:  60			RTS				 

; ------------------------------
sub_B14B:
$B14B:  84 00		 STY tmp0			; Temporary 0
$B14D:  A2 00		 LDX #$00			
$B14F:  BD 48 73	  LDA $7348,X		 
$B152:  29 0F		 AND #$0F			
$B154:  C5 00		 CMP tmp0			; Temporary 0
$B156:  F0 06		 BEQ $B15E		   
$B158:  E8			INX				 
$B159:  E0 0C		 CPX #$0C			
$B15B:  D0 F2		 BNE $B14F		   
$B15D:  18			CLC				 
$B15E:  60			RTS				 
$B15F:  20 75 88	  JSR $8875		   
$B162:  A9 12		 LDA #$12			
$B164:  20 98 81	  JSR scale_stat	  ; Scale stat value
$B167:  4C C9 82	  JMP $82C9		   
$B16A:  20 E5 B1	  JSR $B1E5		   
$B16D:  A9 12		 LDA #$12			
$B16F:  20 98 81	  JSR scale_stat	  ; Scale stat value
$B172:  4C 75 82	  JMP $8275		   
$B175:  20 E5 B1	  JSR $B1E5		   
$B178:  20 90 B1	  JSR $B190		   
$B17B:  20 75 82	  JSR $8275		   
$B17E:  20 75 88	  JSR $8875		   
$B181:  20 90 B1	  JSR $B190		   
$B184:  20 C9 82	  JSR $82C9		   
$B187:  20 30 89	  JSR $8930		   
$B18A:  20 90 B1	  JSR $B190		   
$B18D:  4C 9F 82	  JMP $829F		   

; ------------------------------
sub_B190:
$B190:  A9 0C		 LDA #$0C			
$B192:  4C 98 81	  JMP scale_stat	  ; Scale stat value
$B195:  20 E5 B1	  JSR $B1E5		   
$B198:  20 B0 B1	  JSR $B1B0		   
$B19B:  20 75 82	  JSR $8275		   
$B19E:  20 75 88	  JSR $8875		   
$B1A1:  20 B0 B1	  JSR $B1B0		   
$B1A4:  20 C9 82	  JSR $82C9		   
$B1A7:  20 30 89	  JSR $8930		   
$B1AA:  20 B0 B1	  JSR $B1B0		   
$B1AD:  4C 9F 82	  JMP $829F		   

; ------------------------------
sub_B1B0:
$B1B0:  A9 18		 LDA #$18			
$B1B2:  20 98 81	  JSR scale_stat	  ; Scale stat value
$B1B5:  4C E0 81	  JMP $81E0		   
$B1B8:  20 E5 B1	  JSR $B1E5		   
$B1BB:  06 94		 ASL $94			 
$B1BD:  26 95		 ROL $95			 
$B1BF:  20 E0 81	  JSR $81E0		   
$B1C2:  20 75 82	  JSR $8275		   
$B1C5:  20 75 88	  JSR $8875		   
$B1C8:  06 94		 ASL $94			 
$B1CA:  26 95		 ROL $95			 
$B1CC:  20 E0 81	  JSR $81E0		   
$B1CF:  20 C9 82	  JSR $82C9		   
$B1D2:  20 30 89	  JSR $8930		   
$B1D5:  06 94		 ASL $94			 
$B1D7:  26 95		 ROL $95			 
$B1D9:  20 E0 81	  JSR $81E0		   
$B1DC:  4C 9F 82	  JMP $829F		   

; ------------------------------
sub_B1DF:
$B1DF:  20 3B 87	  JSR $873B		   
$B1E2:  4C E8 B1	  JMP $B1E8		   

; ------------------------------
sub_B1E5:
$B1E5:  20 37 87	  JSR $8737		   
$B1E8:  20 D9 87	  JSR $87D9		   
$B1EB:  4C 23 88	  JMP $8823		   
$B1EE:  20 DF B1	  JSR $B1DF		   
$B1F1:  20 90 B1	  JSR $B190		   
$B1F4:  20 8A 82	  JSR $828A		   
$B1F7:  20 79 88	  JSR $8879		   
$B1FA:  20 90 B1	  JSR $B190		   
$B1FD:  20 DE 82	  JSR $82DE		   
$B200:  20 34 89	  JSR $8934		   
$B203:  20 90 B1	  JSR $B190		   
$B206:  4C B4 82	  JMP $82B4		   
$B209:  20 DF B1	  JSR $B1DF		   
$B20C:  20 24 B2	  JSR $B224		   
$B20F:  20 8A 82	  JSR $828A		   
$B212:  20 79 88	  JSR $8879		   
$B215:  20 24 B2	  JSR $B224		   
$B218:  20 DE 82	  JSR $82DE		   
$B21B:  20 34 89	  JSR $8934		   
$B21E:  20 24 B2	  JSR $B224		   
$B221:  4C B4 82	  JMP $82B4		   

; ------------------------------
sub_B224:
$B224:  A9 06		 LDA #$06			
$B226:  4C 98 81	  JMP scale_stat	  ; Scale stat value
$B229:  20 DF B1	  JSR $B1DF		   
$B22C:  20 8A 82	  JSR $828A		   
$B22F:  20 79 88	  JSR $8879		   
$B232:  20 DE 82	  JSR $82DE		   
$B235:  20 34 89	  JSR $8934		   
$B238:  4C B4 82	  JMP $82B4		   
$B23B:  AD E4 72	  LDA $72E4		   
$B23E:  30 0B		 BMI $B24B		   
$B240:  20 79 88	  JSR $8879		   
$B243:  A9 30		 LDA #$30			
$B245:  20 98 81	  JSR scale_stat	  ; Scale stat value
$B248:  4C DE 82	  JMP $82DE		   
$B24B:  60			RTS				 
$B24C:  20 6B 88	  JSR $886B		   
$B24F:  A9 28		 LDA #$28			
$B251:  20 98 81	  JSR scale_stat	  ; Scale stat value
$B254:  4C C9 82	  JMP $82C9		   
$B257:  20 6B 88	  JSR $886B		   
$B25A:  A9 18		 LDA #$18			
$B25C:  20 98 81	  JSR scale_stat	  ; Scale stat value
$B25F:  4C C9 82	  JMP $82C9		   
$B262:  20 DF B1	  JSR $B1DF		   
$B265:  20 E0 81	  JSR $81E0		   
$B268:  A9 0C		 LDA #$0C			
$B26A:  20 98 81	  JSR scale_stat	  ; Scale stat value
$B26D:  20 8A 82	  JSR $828A		   
$B270:  20 34 89	  JSR $8934		   
$B273:  20 E0 81	  JSR $81E0		   
$B276:  06 94		 ASL $94			 
$B278:  26 95		 ROL $95			 
$B27A:  4C B4 82	  JMP $82B4		   
$B27D:  20 DF B1	  JSR $B1DF		   
$B280:  20 B0 B1	  JSR $B1B0		   
$B283:  20 8A 82	  JSR $828A		   
$B286:  20 79 88	  JSR $8879		   
$B289:  20 B0 B1	  JSR $B1B0		   
$B28C:  20 DE 82	  JSR $82DE		   
$B28F:  20 34 89	  JSR $8934		   
$B292:  20 B0 B1	  JSR $B1B0		   
$B295:  4C B4 82	  JMP $82B4		   
$B298:  20 79 88	  JSR $8879		   
$B29B:  A9 12		 LDA #$12			
$B29D:  20 98 81	  JSR scale_stat	  ; Scale stat value
$B2A0:  4C DE 82	  JMP $82DE		   
$B2A3:  A9 07		 LDA #$07			
$B2A5:  20 BA B2	  JSR $B2BA		   
$B2A8:  4C C9 82	  JMP $82C9		   
$B2AB:  AE 99 75	  LDX $7599		   
$B2AE:  BD 7F B2	  LDA $B27F,X		 
$B2B1:  20 BA B2	  JSR $B2BA		   
$B2B4:  4C DE 82	  JMP $82DE		   
							  ; Data region
		.byte $02
$B2B8:  05 07		 ORA $07			 
sub_B2BA:
$B2BA:  85 0F		 STA $0F			 
$B2BC:  20 E5 86	  JSR $86E5		   
$B2BF:  A5 00		 LDA tmp0			; Temporary 0
$B2C1:  05 01		 ORA tmp1			; Temporary 1
$B2C3:  F0 5C		 BEQ $B321		   
$B2C5:  A2 00		 LDX #$00			
$B2C7:  A5 92		 LDA $92			 
$B2C9:  20 51 C8	  JSR $C851		   
$B2CC:  A9 01		 LDA #$01			
$B2CE:  20 13 C8	  JSR $C813		   
$B2D1:  A6 00		 LDX tmp0			; Temporary 0
$B2D3:  A5 01		 LDA tmp1			; Temporary 1
$B2D5:  F0 02		 BEQ $B2D9		   
$B2D7:  A2 FF		 LDX #$FF			
$B2D9:  86 00		 STX tmp0			; Temporary 0
$B2DB:  A5 0F		 LDA $0F			 
$B2DD:  0A			ASL				 
$B2DE:  0A			ASL				 
$B2DF:  0A			ASL				 
$B2E0:  C5 00		 CMP tmp0			; Temporary 0
$B2E2:  B0 15		 BCS $B2F9		   
$B2E4:  85 0F		 STA $0F			 
$B2E6:  A9 00		 LDA #$00			
$B2E8:  85 0E		 STA $0E			 
$B2EA:  A2 0E		 LDX #$0E			
$B2EC:  A5 00		 LDA tmp0			; Temporary 0
$B2EE:  20 51 C8	  JSR $C851		   
$B2F1:  A5 0E		 LDA $0E			 
$B2F3:  4A			LSR				 
$B2F4:  4A			LSR				 
$B2F5:  4A			LSR				 
$B2F6:  4A			LSR				 
$B2F7:  10 00		 BPL $B2F9		   
$B2F9:  A9 10		 LDA #$10			
$B2FB:  48			PHA				 
$B2FC:  A2 00		 LDX #$00			
$B2FE:  86 94		 STX $94			 
$B300:  86 95		 STX $95			 
$B302:  BD 67 B9	  LDA enemy_res_tbl,X ; Enemy resistance table
$B305:  29 1F		 AND #$1F			
$B307:  C5 00		 CMP tmp0			; Temporary 0
$B309:  F0 02		 BEQ $B30D		   
$B30B:  B0 0B		 BCS $B318		   
$B30D:  BD EF 8A	  LDA $8AEF,X		 
$B310:  65 94		 ADC $94			 
$B312:  85 94		 STA $94			 
$B314:  90 02		 BCC $B318		   
$B316:  E6 95		 INC $95			 
$B318:  E8			INX				 
$B319:  E0 35		 CPX #$35			
$B31B:  90 E5		 BCC $B302		   
$B31D:  68			PLA				 
$B31E:  4C 98 81	  JMP scale_stat	  ; Scale stat value
$B321:  A9 00		 LDA #$00			
$B323:  85 94		 STA $94			 
$B325:  85 95		 STA $95			 
$B327:  60			RTS				 
$B328:  16 2A		 ASL $2A,X		   
$B32A:  00			BRK				 
							  ; Data region
		.byte $33
$B32C:  18			CLC				 
							  ; Data region
		.byte $2F, $03, $2B
$B330:  26 1D		 ROL $1D			 
$B332:  10 27		 BPL $B35B		   
							  ; Data region
		.byte $07
$B335:  2D 11 30	  AND $3011		   
							  ; Data region
		.byte $12, $34
$B33A:  21 29		 AND ($29,X)		 
							  ; Data region
		.byte $1A
$B33D:  2A			ROL				 
$B33E:  19 2B 22	  ORA $222B,Y		 
$B341:  2C 13 30	  BIT $3013		   
							  ; Data region
		.byte $14
$B345:  31 0D		 AND ($0D),Y		 
$B347:  29 17		 AND #$17			
$B349:  2A			ROL				 
$B34A:  2E 2B 0E	  ROL $0E2B		   
$B34D:  24 18		 BIT mult_mid		; Product mid
$B34F:  30 0F		 BMI $B360		   
							  ; Data region
		.byte $32
$B352:  00			BRK				 
							  ; Data region
		.byte $1F, $03, $1C
$B356:  06 28		 ASL $28			 
$B358:  01 02		 ORA ($02,X)		 
							  ; Data region
		.byte $04
$B35B:  05 07		 ORA $07			 
$B35D:  08			PHP				 
$B35E:  09 1F		 ORA #$1F			
$B360:  0A			ASL				 
$B361:  1E 0B 33	  ASL $330B,X		 
							  ; Data region
		.byte $1C, $20, $1B, $23, $0C, $25, $FF, $FF, $33
$B36D:  2A			ROL				 
							  ; Data region
		.byte $3B
$B36F:  35 2B		 AND $2B,X		   
$B371:  30 29		 BMI $B39C		   
							  ; Data region
		.byte $3A
$B374:  2A			ROL				 
$B375:  30 2B		 BMI $B3A2		   
$B377:  2C 31 FF	  BIT $FF31		   
$B37A:  29 2E		 AND #$2E			
$B37C:  2A			ROL				 
$B37D:  30 2B		 BMI $B3AA		   
							  ; Data region
		.byte $FF, $FF, $FF, $33, $35, $37, $FF, $FF, $FF, $FF, $FF, $33
$B38B:  35 38		 AND $38,X		   
$B38D:  36 FF		 ROL $FF,X		   
							  ; Data region
		.byte $FF, $FF, $FF
sub_B392:
$B392:  20 EB B3	  JSR $B3EB		   
$B395:  A2 00		 LDX #$00			
$B397:  8A			TXA				 
$B398:  48			PHA				 
$B399:  20 84 87	  JSR $8784		   
$B39C:  20 23 88	  JSR $8823		   
$B39F:  20 36 82	  JSR $8236		   
$B3A2:  A9 04		 LDA #$04			
$B3A4:  20 13 C8	  JSR $C813		   
$B3A7:  68			PLA				 
$B3A8:  AA			TAX				 
$B3A9:  20 D7 B3	  JSR $B3D7		   
$B3AC:  E8			INX				 
$B3AD:  E0 04		 CPX #$04			
$B3AF:  90 E6		 BCC $B397		   
$B3B1:  60			RTS				 
$B3B2:  20 EB B3	  JSR $B3EB		   
$B3B5:  A5 0C		 LDA $0C			 
$B3B7:  85 94		 STA $94			 
$B3B9:  A5 0D		 LDA $0D			 
$B3BB:  85 95		 STA $95			 
$B3BD:  20 36 82	  JSR $8236		   
$B3C0:  A2 03		 LDX #$03			
$B3C2:  8A			TXA				 
$B3C3:  20 D7 B3	  JSR $B3D7		   
$B3C6:  CA			DEX				 
$B3C7:  10 F9		 BPL $B3C2		   
$B3C9:  60			RTS				 
$B3CA:  20 EB B3	  JSR $B3EB		   
$B3CD:  A2 0C		 LDX #$0C			
$B3CF:  A9 05		 LDA #$05			
$B3D1:  20 27 C8	  JSR $C827		   
$B3D4:  4C B5 B3	  JMP $B3B5		   

; ------------------------------
sub_B3D7:
$B3D7:  0A			ASL				 
$B3D8:  A8			TAY				 
$B3D9:  18			CLC				 
$B3DA:  B9 A3 75	  LDA $75A3,Y		 
$B3DD:  65 94		 ADC $94			 
$B3DF:  99 A3 75	  STA $75A3,Y		 
$B3E2:  B9 A4 75	  LDA $75A4,Y		 
$B3E5:  65 95		 ADC $95			 
$B3E7:  99 A4 75	  STA $75A4,Y		 
$B3EA:  60			RTS				 

; ------------------------------
sub_B3EB:
$B3EB:  A6 93		 LDX btl_flags	   ; Battle calculation flags
$B3ED:  20 9C 89	  JSR $899C		   
$B3F0:  A0 0D		 LDY #$0D			
$B3F2:  B1 86		 LDA (stat_ptr_lo),Y ; Stat table pointer low
$B3F4:  29 03		 AND #$03			
$B3F6:  AA			TAX				 
$B3F7:  00			BRK				 
$B3F8:  10 8F		 BPL $B389		   
$B3FA:  60			RTS				 
$B3FB:  20 92 B3	  JSR $B392		   
$B3FE:  20 DF B1	  JSR $B1DF		   
$B401:  20 19 B4	  JSR $B419		   
$B404:  20 8A 82	  JSR $828A		   
$B407:  20 79 88	  JSR $8879		   
$B40A:  20 19 B4	  JSR $B419		   
$B40D:  20 DE 82	  JSR $82DE		   
$B410:  20 34 89	  JSR $8934		   
$B413:  20 19 B4	  JSR $B419		   
$B416:  4C B4 82	  JMP $82B4		   

; ------------------------------
sub_B419:
$B419:  A9 0C		 LDA #$0C			
$B41B:  20 98 81	  JSR scale_stat	  ; Scale stat value
$B41E:  4C E0 81	  JMP $81E0		   
$B421:  4C 92 B3	  JMP $B392		   
$B424:  20 92 B3	  JSR $B392		   
$B427:  20 DF B1	  JSR $B1DF		   
$B42A:  20 E0 81	  JSR $81E0		   
$B42D:  20 8A 82	  JSR $828A		   
$B430:  20 79 88	  JSR $8879		   
$B433:  20 E0 81	  JSR $81E0		   
$B436:  20 DE 82	  JSR $82DE		   
$B439:  20 34 89	  JSR $8934		   
$B43C:  20 E0 81	  JSR $81E0		   
$B43F:  4C B4 82	  JMP $82B4		   
$B442:  20 B9 87	  JSR $87B9		   
$B445:  20 E0 81	  JSR $81E0		   
$B448:  4C F3 82	  JMP $82F3		   
$B44B:  20 B9 87	  JSR $87B9		   
$B44E:  46 94		 LSR $94			 
$B450:  66 95		 ROR $95			 
$B452:  A9 01		 LDA #$01			
$B454:  A2 94		 LDX #$94			
$B456:  20 13 C8	  JSR $C813		   
$B459:  A9 06		 LDA #$06			
$B45B:  20 98 81	  JSR scale_stat	  ; Scale stat value
$B45E:  4C F3 82	  JMP $82F3		   
$B461:  60			RTS				 
$B462:  98			TYA				 
$B463:  48			PHA				 
$B464:  A5 82		 LDA inner_loop	  ; Inner loop counter
$B466:  48			PHA				 
$B467:  A9 00		 LDA #$00			
$B469:  85 6E		 STA $6E			 
$B46B:  A9 03		 LDA #$03			
$B46D:  85 82		 STA inner_loop	  ; Inner loop counter
$B46F:  A5 82		 LDA inner_loop	  ; Inner loop counter
$B471:  20 6B 8A	  JSR $8A6B		   
$B474:  90 05		 BCC $B47B		   
$B476:  A0 00		 LDY #$00			
$B478:  B1 79		 LDA (action_ptr_lo),Y; Action data pointer low
$B47A:  0A			ASL				 
$B47B:  26 6E		 ROL $6E			 
$B47D:  C6 82		 DEC inner_loop	  ; Inner loop counter
$B47F:  10 EE		 BPL $B46F		   
$B481:  68			PLA				 
$B482:  85 82		 STA inner_loop	  ; Inner loop counter
$B484:  68			PLA				 
$B485:  A8			TAY				 
$B486:  A5 6E		 LDA $6E			 
$B488:  60			RTS				 
$B489:  20 73 B5	  JSR $B573		   
$B48C:  20 96 B4	  JSR $B496		   
$B48F:  20 BA B4	  JSR $B4BA		   
$B492:  20 E8 B4	  JSR $B4E8		   
$B495:  60			RTS				 

; ------------------------------
sub_B496:
$B496:  48			PHA				 
$B497:  A9 00		 LDA #$00			
$B499:  85 04		 STA $04			 
$B49B:  68			PLA				 
$B49C:  48			PHA				 
$B49D:  C9 13		 CMP #$13			
$B49F:  90 17		 BCC $B4B8		   
$B4A1:  C9 19		 CMP #$19			
$B4A3:  B0 13		 BCS $B4B8		   
$B4A5:  AD 63 73	  LDA $7363		   
$B4A8:  30 0E		 BMI $B4B8		   
$B4AA:  AD E7 72	  LDA $72E7		   
$B4AD:  29 10		 AND #$10			
$B4AF:  F0 07		 BEQ $B4B8		   
$B4B1:  A9 80		 LDA #$80			
$B4B3:  85 04		 STA $04			 
$B4B5:  20 53 B5	  JSR $B553		   
$B4B8:  68			PLA				 
$B4B9:  60			RTS				 

; ------------------------------
sub_B4BA:
$B4BA:  48			PHA				 
$B4BB:  A2 02		 LDX #$02			
$B4BD:  C9 13		 CMP #$13			
$B4BF:  90 25		 BCC $B4E6		   
$B4C1:  C9 16		 CMP #$16			
$B4C3:  90 06		 BCC $B4CB		   
$B4C5:  C9 19		 CMP #$19			
$B4C7:  B0 1D		 BCS $B4E6		   
$B4C9:  A2 05		 LDX #$05			
$B4CB:  86 00		 STX tmp0			; Temporary 0
$B4CD:  00			BRK				 
							  ; Data region
		.byte $07, $1F
$B4D0:  90 14		 BCC $B4E6		   
$B4D2:  A5 00		 LDA tmp0			; Temporary 0
$B4D4:  00			BRK				 
							  ; Data region
		.byte $22, $B3
$B4D7:  AA			TAX				 
$B4D8:  BD 49 B7	  LDA $B749,X		 
$B4DB:  20 53 B5	  JSR $B553		   
$B4DE:  EE 61 73	  INC $7361		   
$B4E1:  D0 03		 BNE $B4E6		   
$B4E3:  EE 62 73	  INC $7362		   
$B4E6:  68			PLA				 
$B4E7:  60			RTS				 

; ------------------------------
sub_B4E8:
$B4E8:  85 03		 STA tmp3			; Temporary 3
$B4EA:  00			BRK				 
							  ; Data region
		.byte $07, $1F
$B4ED:  B0 50		 BCS $B53F		   
$B4EF:  A9 01		 LDA #$01			
$B4F1:  00			BRK				 
							  ; Data region
		.byte $3B, $73
$B4F4:  B0 0E		 BCS $B504		   
$B4F6:  A9 02		 LDA #$02			
$B4F8:  00			BRK				 
							  ; Data region
		.byte $3B, $73
$B4FB:  B0 07		 BCS $B504		   
$B4FD:  A9 03		 LDA #$03			
$B4FF:  00			BRK				 
							  ; Data region
		.byte $3B, $73
$B502:  90 3B		 BCC $B53F		   
$B504:  29 7F		 AND #$7F			
$B506:  A2 06		 LDX #$06			
$B508:  DD 40 B5	  CMP $B540,X		 
$B50B:  F0 04		 BEQ $B511		   
$B50D:  CA			DEX				 
$B50E:  10 F8		 BPL $B508		   
$B510:  60			RTS				 
$B511:  8A			TXA				 
$B512:  4A			LSR				 
$B513:  AA			TAX				 
$B514:  BD 47 B5	  LDA $B547,X		 
$B517:  90 04		 BCC $B51D		   
$B519:  4A			LSR				 
$B51A:  4A			LSR				 
$B51B:  4A			LSR				 
$B51C:  4A			LSR				 
$B51D:  29 0F		 AND #$0F			
$B51F:  85 04		 STA $04			 
$B521:  A2 00		 LDX #$00			
$B523:  46 04		 LSR $04			 
$B525:  90 0C		 BCC $B533		   
$B527:  A5 03		 LDA tmp3			; Temporary 3
$B529:  DD 4B B5	  CMP $B54B,X		 
$B52C:  90 05		 BCC $B533		   
$B52E:  DD 4C B5	  CMP $B54C,X		 
$B531:  90 07		 BCC $B53A		   
$B533:  E8			INX				 
$B534:  E8			INX				 
$B535:  E0 08		 CPX #$08			
$B537:  D0 EA		 BNE $B523		   
$B539:  60			RTS				 
$B53A:  A9 AA		 LDA #$AA			
$B53C:  20 53 B5	  JSR $B553		   
$B53F:  60			RTS				 
							  ; Data region
		.byte $32, $34
$B542:  35 37		 AND $37,X		   
							  ; Data region
		.byte $3C
$B545:  41 43		 EOR ($43,X)		 
$B547:  78			SEI				 
$B548:  F9 79 08	  SBC $0879,Y		 
$B54B:  00			BRK				 
$B54C:  09 09		 ORA #$09			
$B54E:  0D 0D 10	  ORA $100D		   
							  ; Data region
		.byte $13
$B552:  19 48 AD	  ORA $AD48,Y		 
$B555:  61 73		 ADC ($73,X)		 
$B557:  85 00		 STA tmp0			; Temporary 0
$B559:  AD 62 73	  LDA $7362		   
$B55C:  85 01		 STA tmp1			; Temporary 1
$B55E:  68			PLA				 
$B55F:  A2 00		 LDX #$00			
$B561:  00			BRK				 
$B562:  36 0F		 ROL $0F,X		   
$B564:  A5 01		 LDA tmp1			; Temporary 1
$B566:  85 00		 STA tmp0			; Temporary 0
$B568:  8D 61 73	  STA $7361		   
$B56B:  A5 02		 LDA tmp2			; Temporary 2
$B56D:  85 01		 STA tmp1			; Temporary 1
$B56F:  8D 62 73	  STA $7362		   
$B572:  60			RTS				 

; ------------------------------
sub_B573:
$B573:  85 00		 STA tmp0			; Temporary 0
$B575:  20 AD B5	  JSR $B5AD		   
$B578:  48			PHA				 
$B579:  0A			ASL				 
$B57A:  06 00		 ASL tmp0			; Temporary 0
$B57C:  90 02		 BCC $B580		   
$B57E:  69 37		 ADC #$37			
$B580:  AA			TAX				 
$B581:  A9 00		 LDA #$00			
$B583:  85 01		 STA tmp1			; Temporary 1
$B585:  E0 24		 CPX #$24			
$B587:  D0 08		 BNE $B591		   
$B589:  A9 4A		 LDA #$4A			
$B58B:  85 00		 STA tmp0			; Temporary 0
$B58D:  E6 01		 INC tmp1			; Temporary 1
$B58F:  D0 05		 BNE $B596		   
$B591:  BD 4D B7	  LDA stat_tbl_1,X	; Stat modifier table 1
$B594:  85 00		 STA tmp0			; Temporary 0
$B596:  BD 4E B7	  LDA $B74E,X		 
$B599:  00			BRK				 
							  ; Data region
		.byte $17, $0F
$B59C:  A2 00		 LDX #$00			
$B59E:  20 13 C8	  JSR $C813		   
$B5A1:  A5 00		 LDA tmp0			; Temporary 0
$B5A3:  8D 61 73	  STA $7361		   
$B5A6:  A5 01		 LDA tmp1			; Temporary 1
$B5A8:  8D 62 73	  STA $7362		   
$B5AB:  68			PLA				 
$B5AC:  60			RTS				 

; ------------------------------
sub_B5AD:
$B5AD:  00			BRK				 
							  ; Data region
		.byte $03, $1F
$B5B0:  C9 4D		 CMP #$4D			
$B5B2:  90 19		 BCC $B5CD		   
$B5B4:  C9 67		 CMP #$67			
$B5B6:  F0 04		 BEQ $B5BC		   
$B5B8:  C9 6D		 CMP #$6D			
$B5BA:  90 0F		 BCC $B5CB		   
sub_B5BC:
$B5BC:  A2 0A		 LDX #$0A			
$B5BE:  DD CE B5	  CMP $B5CE,X		 
$B5C1:  F0 04		 BEQ $B5C7		   
$B5C3:  CA			DEX				 
$B5C4:  10 F8		 BPL $B5BE		   
$B5C6:  60			RTS				 
$B5C7:  BD D9 B5	  LDA $B5D9,X		 
$B5CA:  60			RTS				 
$B5CB:  E9 39		 SBC #$39			
$B5CD:  60			RTS				 
$B5CE:  6D 80 83	  ADC $8380		   
$B5D1:  84 86		 STY stat_ptr_lo	 ; Stat table pointer low
							  ; Data region
		.byte $87, $89
$B5D5:  8E 95 74	  STX $7495		   
							  ; Data region
		.byte $67
$B5D9:  19 1A 04	  ORA $041A,Y		 
$B5DC:  0E 04 0A	  ASL $0A04		   
$B5DF:  06 03		 ASL tmp3			; Temporary 3
							  ; Data region
		.byte $1B, $04, $14
$B5E4:  8A			TXA				 
$B5E5:  48			PHA				 
$B5E6:  A9 00		 LDA #$00			
$B5E8:  85 70		 STA $70			 
$B5EA:  85 7D		 STA $7D			 
$B5EC:  20 1D B6	  JSR $B61D		   
$B5EF:  0A			ASL				 
$B5F0:  AA			TAX				 
$B5F1:  BD E3 B7	  LDA $B7E3,X		 
$B5F4:  85 00		 STA tmp0			; Temporary 0
$B5F6:  BD E4 B7	  LDA $B7E4,X		 
$B5F9:  C9 FF		 CMP #$FF			
$B5FB:  F0 0A		 BEQ $B607		   
$B5FD:  00			BRK				 
							  ; Data region
		.byte $17, $0F
$B600:  18			CLC				 
$B601:  65 00		 ADC tmp0			; Temporary 0
$B603:  85 00		 STA tmp0			; Temporary 0
$B605:  90 04		 BCC $B60B		   
$B607:  C6 70		 DEC $70			 
$B609:  C6 7D		 DEC $7D			 
$B60B:  00			BRK				 
$B60C:  0D 1F 90	  ORA $901F		   
$B60F:  08			PHP				 
$B610:  06 00		 ASL tmp0			; Temporary 0
$B612:  08			PHP				 
$B613:  26 70		 ROL $70			 
$B615:  28			PLP				 
$B616:  26 7D		 ROL $7D			 
$B618:  68			PLA				 
$B619:  AA			TAX				 
$B61A:  A5 00		 LDA tmp0			; Temporary 0
$B61C:  60			RTS				 

; ------------------------------
sub_B61D:
$B61D:  00			BRK				 
							  ; Data region
		.byte $03, $1F
sub_B620:
$B620:  A2 1D		 LDX #$1D			
$B622:  DD 2F B6	  CMP $B62F,X		 
$B625:  F0 04		 BEQ $B62B		   
$B627:  CA			DEX				 
$B628:  10 F8		 BPL $B622		   
$B62A:  60			RTS				 
$B62B:  BD 4D B6	  LDA $B64D,X		 
$B62E:  60			RTS				 
$B62F:  29 2A		 AND #$2A			
							  ; Data region
		.byte $2B
$B632:  2C 2D 8B	  BIT $8B2D		   
							  ; Data region
		.byte $8F
$B636:  94 9B		 STY $9B,X		   
$B638:  A0 99		 LDY #$99			
$B63A:  9A			TXS				 
$B63B:  A1 A2		 LDA ($A2,X)		 
							  ; Data region
		.byte $A3
$B63E:  A4 A5		 LDY $A5			 
$B640:  49 4A		 EOR #$4A			
							  ; Data region
		.byte $4B, $79, $DF
$B645:  F1 F2		 SBC ($F2),Y		 
							  ; Data region
		.byte $77
$B648:  70 1C		 BVS $B666		   
							  ; Data region
		.byte $EB
$B64B:  EC FE 00	  CPX $00FE		   
$B64E:  01 02		 ORA ($02,X)		 
$B650:  01 02		 ORA ($02,X)		 
$B652:  01 01		 ORA ($01,X)		 
							  ; Data region
		.byte $03, $02, $04
$B657:  05 06		 ORA $06			 
							  ; Data region
		.byte $07, $07, $07
$B65C:  08			PHP				 
$B65D:  09 0A		 ORA #$0A			
							  ; Data region
		.byte $0B, $0C, $0D, $0E, $0F, $0F, $01, $03, $0C, $02, $02, $02
sub_B66B:
$B66B:  AD E7 72	  LDA $72E7		   
$B66E:  29 02		 AND #$02			
$B670:  AD E9 72	  LDA $72E9		   
$B673:  30 05		 BMI $B67A		   
$B675:  00			BRK				 
$B676:  0E 1F 30	  ASL $301F		   
							  ; Data region
		.byte $4F
$B67A:  00			BRK				 
							  ; Data region
		.byte $03, $1F
$B67D:  AA			TAX				 
$B67E:  AD 63 73	  LDA $7363		   
$B681:  30 10		 BMI $B693		   
$B683:  BD 0B B8	  LDA spell_eff_tbl,X ; Spell effect type table
$B686:  29 E0		 AND #$E0			
$B688:  C9 E0		 CMP #$E0			
$B68A:  F0 3D		 BEQ $B6C9		   
$B68C:  20 CB B6	  JSR $B6CB		   
$B68F:  20 DD B6	  JSR $B6DD		   
$B692:  60			RTS				 
$B693:  BD 0B B8	  LDA spell_eff_tbl,X ; Spell effect type table
$B696:  29 1F		 AND #$1F			
$B698:  AA			TAX				 
$B699:  BD 36 B7	  LDA $B736,X		 
$B69C:  E0 10		 CPX #$10			
$B69E:  B0 2B		 BCS $B6CB		   
$B6A0:  48			PHA				 
$B6A1:  AD 63 73	  LDA $7363		   
$B6A4:  29 07		 AND #$07			
$B6A6:  AA			TAX				 
$B6A7:  68			PLA				 
$B6A8:  00			BRK				 
							  ; Data region
		.byte $22, $B3
$B6AB:  48			PHA				 
$B6AC:  00			BRK				 
							  ; Data region
		.byte $03, $1F
$B6AF:  A2 00		 LDX #$00			
$B6B1:  C9 18		 CMP #$18			
$B6B3:  F0 04		 BEQ $B6B9		   
$B6B5:  C9 1F		 CMP #$1F			
$B6B7:  D0 02		 BNE $B6BB		   
$B6B9:  A2 04		 LDX #$04			
$B6BB:  86 00		 STX tmp0			; Temporary 0
$B6BD:  68			PLA				 
$B6BE:  18			CLC				 
$B6BF:  65 00		 ADC tmp0			; Temporary 0
$B6C1:  AA			TAX				 
$B6C2:  BD 03 B8	  LDA unk_tbl_b803,X  ; Unknown table
$B6C5:  20 CB B6	  JSR $B6CB		   
$B6C8:  60			RTS				 
$B6C9:  A9 FF		 LDA #$FF			
sub_B6CB:
$B6CB:  85 00		 STA tmp0			; Temporary 0
$B6CD:  00			BRK				 
$B6CE:  0D 1F 90	  ORA $901F		   
$B6D1:  08			PHP				 
$B6D2:  06 00		 ASL tmp0			; Temporary 0
$B6D4:  90 04		 BCC $B6DA		   
$B6D6:  A9 FF		 LDA #$FF			
$B6D8:  85 00		 STA tmp0			; Temporary 0
$B6DA:  A5 00		 LDA tmp0			; Temporary 0
$B6DC:  60			RTS				 

; ------------------------------
sub_B6DD:
$B6DD:  85 00		 STA tmp0			; Temporary 0
$B6DF:  60			RTS				 
$B6E0:  AD 63 73	  LDA $7363		   
$B6E3:  30 30		 BMI $B715		   
$B6E5:  00			BRK				 
							  ; Data region
		.byte $67, $73
$B6E8:  AA			TAX				 
$B6E9:  00			BRK				 
							  ; Data region
		.byte $23, $53
$B6EC:  38			SEC				 
$B6ED:  A9 80		 LDA #$80			
$B6EF:  E5 72		 SBC $72			 
$B6F1:  85 01		 STA tmp1			; Temporary 1
$B6F3:  A9 01		 LDA #$01			
$B6F5:  E9 00		 SBC #$00			
$B6F7:  85 02		 STA tmp2			; Temporary 2
$B6F9:  46 02		 LSR tmp2			; Temporary 2
$B6FB:  66 01		 ROR tmp1			; Temporary 1
$B6FD:  A2 01		 LDX #$01			
$B6FF:  A5 00		 LDA tmp0			; Temporary 0
$B701:  20 27 C8	  JSR $C827		   
$B704:  A9 80		 LDA #$80			
$B706:  20 51 C8	  JSR $C851		   
$B709:  06 01		 ASL tmp1			; Temporary 1
$B70B:  26 02		 ROL tmp2			; Temporary 2
$B70D:  B0 03		 BCS $B712		   
$B70F:  A5 02		 LDA tmp2			; Temporary 2
$B711:  60			RTS				 
$B712:  A9 FF		 LDA #$FF			
$B714:  60			RTS				 
$B715:  A5 00		 LDA tmp0			; Temporary 0
$B717:  60			RTS				 
$B718:  20 6B B6	  JSR $B66B		   
$B71B:  85 00		 STA tmp0			; Temporary 0
$B71D:  A5 00		 LDA tmp0			; Temporary 0
$B71F:  F0 09		 BEQ $B72A		   
$B721:  00			BRK				 
							  ; Data region
		.byte $1B, $0F
$B724:  C5 00		 CMP tmp0			; Temporary 0
$B726:  F0 04		 BEQ $B72C		   
$B728:  90 02		 BCC $B72C		   
$B72A:  18			CLC				 
$B72B:  60			RTS				 
$B72C:  38			SEC				 
$B72D:  60			RTS				 
$B72E:  BD 6C BA	  LDA ai_tbl_2,X	  ; AI table 2
$B731:  60			RTS				 
$B732:  BD 70 BA	  LDA ai_tbl_3,X	  ; AI table 3
$B735:  60			RTS				 
							  ; Data region
		.byte $03, $02
$B738:  01 07		 ORA ($07,X)		 
$B73A:  06 05		 ASL $05			 
							  ; Data region
		.byte $0B
$B73D:  0A			ASL				 
$B73E:  09 0F		 ORA #$0F			
$B740:  0E 0D 13	  ASL $130D		   
							  ; Data region
		.byte $12
$B744:  11 00		 ORA (tmp0),Y		; Temporary 0
$B746:  00			BRK				 
$B747:  20 FF FF	  JSR $FFFF		   
$B74A:  C0 80		 CPY #$80			
$B74C:  00			BRK				 
stat_tbl_1:					 ; $B74D
$B74D:  08			PHP				 
							  ; Data region
		.byte $07
$B74F:  46 15		 LSR $15			 
$B751:  A0 29		 LDY #$29			
$B753:  10 09		 BPL $B75E		   
$B755:  1E 0D 58	  ASL $580D,X		 
$B758:  19 10 09	  ORA $0910,Y		 
							  ; Data region
		.byte $34
$B75C:  11 78		 ORA ($78),Y		 
$B75E:  29 0A		 AND #$0A			
							  ; Data region
		.byte $07, $23, $0B, $3C
$B764:  15 58		 ORA $58,X		   
$B766:  19 08 11	  ORA $1108,Y		 
$B769:  19 1F 3C	  ORA $3C1F,Y		 
$B76C:  3D 46 15	  AND $1546,X		 
							  ; Data region
		.byte $AF, $33, $FF
$B772:  29 06		 AND #$06			
$B774:  05 1E		 ORA $1E			 
							  ; Data region
		.byte $0B
$B777:  50 15		 BVC $B78E		   
$B779:  09 04		 ORA #$04			
$B77B:  28			PLP				 
$B77C:  15 64		 ORA $64,X		   
$B77E:  29 12		 AND #$12			
$B780:  05 2D		 ORA $2D			 
							  ; Data region
		.byte $0B
$B783:  0A			ASL				 
$B784:  06 07		 ASL $07			 
$B786:  06 34		 ASL $34			 
							  ; Data region
		.byte $0B, $5C
$B78A:  25 0A		 AND $0A			 
$B78C:  09 16		 ORA #$16			
$B78E:  0D 2D 0B	  ORA $0B2D		   
$B791:  10 09		 BPL $B79C		   
							  ; Data region
		.byte $34
$B794:  11 48		 ORA ($48),Y		 
$B796:  11 0A		 ORA ($0A),Y		 
							  ; Data region
		.byte $07
$B799:  1E 0B 3C	  ASL $3C0B,X		 
$B79C:  15 37		 ORA $37,X		   
$B79E:  0D 06 0D	  ORA $0D06		   
$B7A1:  0E 15 1E	  ASL $1E15		   
$B7A4:  21 46		 AND ($46,X)		 
$B7A6:  15 AF		 ORA $AF,X		   
							  ; Data region
		.byte $33, $FF, $33
$B7AB:  06 05		 ASL $05			 
$B7AD:  1E 0B 50	  ASL $500B,X		 
$B7B0:  15 09		 ORA $09,X		   
$B7B2:  05 28		 ORA $28			 
$B7B4:  15 64		 ORA $64,X		   
$B7B6:  29 12		 AND #$12			
$B7B8:  05 2D		 ORA $2D			 
							  ; Data region
		.byte $0B
$B7BB:  0A			ASL				 
$B7BC:  06 09		 ASL $09			 
							  ; Data region
		.byte $03
$B7BF:  39 05 6E	  AND $6E05,Y		 
							  ; Data region
		.byte $12
$B7C3:  0E 04 1C	  ASL $1C04		   
$B7C6:  06 32		 ASL $32			 
$B7C8:  05 50		 ORA $50			 
$B7CA:  08			PHP				 
$B7CB:  0D 03 23	  ORA $2303		   
$B7CE:  05 3D		 ORA $3D			 
$B7D0:  06 0C		 ASL $0C			 
$B7D2:  06 18		 ASL mult_mid		; Product mid
$B7D4:  0A			ASL				 
$B7D5:  2E 10 08	  ROL $0810		   
							  ; Data region
		.byte $02, $23
$B7DA:  05 5A		 ORA $5A			 
$B7DC:  0A			ASL				 
							  ; Data region
		.byte $0B, $02, $32
$B7E0:  0A			ASL				 
$B7E1:  78			SEI				 
							  ; Data region
		.byte $14, $1E, $0B, $4B, $15, $FF, $FF, $1E, $0B, $32, $0B, $14, $0B, $0A, $06, $01
		.byte $03, $04, $03, $03, $03
$B7F7:  01 02		 ORA ($02,X)		 
							  ; Data region
		.byte $03
$B7FA:  05 05		 ORA $05			 
$B7FC:  06 0F		 ASL $0F			 
$B7FE:  06 64		 ASL $64			 
$B800:  15 32		 ORA $32,X		   
							  ; Data region
		.byte $0B, $FF
$B804:  D8			CLD				 
$B805:  66 00		 ROR tmp0			; Temporary 0
							  ; Data region
		.byte $FF, $FF, $B2
$B80A:  00			BRK				 
spell_eff_tbl:					 ; $B80B
							  ; Data region
		.byte $E2, $E2, $E2
$B80E:  E1 E1		 SBC ($E1,X)		 
$B810:  E1 E0		 SBC ($E0,X)		 
$B812:  E0 E0		 CPX #$E0			
$B814:  E5 E5		 SBC $E5			 
$B816:  E5 E5		 SBC $E5			 
$B818:  E4 E4		 CPX $E4			 
$B81A:  E4 E3		 CPX $E3			 
							  ; Data region
		.byte $E3, $E3
$B81E:  68			PLA				 
$B81F:  68			PLA				 
$B820:  EE E9 67	  INC $67E9		   
							  ; Data region
		.byte $C7, $6B
$B825:  A6 4C		 LDX $4C			 
$B827:  EA			NOP				 
							  ; Data region
		.byte $F2, $F2, $CD, $CD, $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2
		.byte $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2
		.byte $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2, $72
$B858:  E1 E1		 SBC ($E1,X)		 
$B85A:  E1 E5		 SBC ($E5,X)		 
$B85C:  E5 E5		 SBC $E5			 
							  ; Data region
		.byte $67, $72, $31, $67, $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2
		.byte $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2
		.byte $67, $E1, $F2, $F2, $EB, $67, $F2, $67, $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2
$B88E:  E1 E4		 SBC ($E4,X)		 
							  ; Data region
		.byte $67
$B891:  E1 E5		 SBC ($E5,X)		 
							  ; Data region
		.byte $6B
$B894:  E0 ED		 CPX #$ED			
							  ; Data region
		.byte $F2, $F2, $67, $E1, $F2, $28, $F2, $F2, $F2, $F2, $E9, $F2, $F2, $F2, $F2, $F2
		.byte $F2, $E9, $EB, $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2, $66, $F2, $EC
		.byte $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2
		.byte $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2
		.byte $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2
		.byte $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2
		.byte $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F2, $92, $09, $F2
		.byte $F2, $F2
$B908:  E6 F2		 INC $F2			 
							  ; Data region
		.byte $F2
sub_B90B:
$B90B:  48			PHA				 
$B90C:  20 53 B9	  JSR $B953		   
$B90F:  29 1F		 AND #$1F			
$B911:  C9 1E		 CMP #$1E			
$B913:  68			PLA				 
$B914:  60			RTS				 

; --------------------------------------------------
; Spell param 1 table
; --------------------------------------------------
spell_p1_tbl:					 ; $B915
$B915:  20 0B B9	  JSR $B90B		   
$B918:  B0 12		 BCS $B92C		   
$B91A:  8D 10 6E	  STA $6E10		   
$B91D:  20 53 B9	  JSR $B953		   
$B920:  29 1F		 AND #$1F			
$B922:  C9 19		 CMP #$19			
$B924:  90 04		 BCC $B92A		   
$B926:  AA			TAX				 
$B927:  BD 4E BA	  LDA ai_tbl_1,X	  ; AI decision table 1
$B92A:  38			SEC				 
$B92B:  60			RTS				 
$B92C:  A9 00		 LDA #$00			
$B92E:  18			CLC				 
$B92F:  60			RTS				 

; ------------------------------
sub_B930:
$B930:  48			PHA				 
$B931:  20 53 B9	  JSR $B953		   
$B934:  2A			ROL				 
$B935:  68			PLA				 
$B936:  60			RTS				 
$B937:  48			PHA				 
$B938:  20 53 B9	  JSR $B953		   
$B93B:  29 60		 AND #$60			
$B93D:  F0 07		 BEQ $B946		   
$B93F:  C9 60		 CMP #$60			
$B941:  F0 03		 BEQ $B946		   
$B943:  68			PLA				 
$B944:  38			SEC				 
$B945:  60			RTS				 
$B946:  68			PLA				 
$B947:  18			CLC				 
$B948:  60			RTS				 

; --------------------------------------------------
; Spell param 2 table
; --------------------------------------------------
spell_p2_tbl:					 ; $B949
$B949:  20 53 B9	  JSR $B953		   
$B94C:  29 60		 AND #$60			
$B94E:  0A			ASL				 
$B94F:  2A			ROL				 
$B950:  2A			ROL				 
$B951:  2A			ROL				 
$B952:  60			RTS				 

; ------------------------------
sub_B953:
$B953:  8D 10 6E	  STA $6E10		   
$B956:  8A			TXA				 
$B957:  48			PHA				 
$B958:  AE 10 6E	  LDX $6E10		   
$B95B:  BD 67 B9	  LDA enemy_res_tbl,X ; Enemy resistance table
$B95E:  8D 10 6E	  STA $6E10		   
$B961:  68			PLA				 
$B962:  AA			TAX				 
$B963:  AD 10 6E	  LDA $6E10		   
$B966:  60			RTS				 

; --------------------------------------------------
; Enemy resistance table
; --------------------------------------------------
enemy_res_tbl:					 ; $B967
$B967:  A2 A4		 LDX #$A4			
$B969:  AA			TAX				 
$B96A:  C4 C6		 CPY $C6			 
$B96C:  CA			DEX				 
$B96D:  E5 E8		 SBC $E8			 
							  ; Data region
		.byte $EF
$B970:  A2 C5		 LDX #$C5			
$B972:  E8			INX				 
							  ; Data region
		.byte $CB, $C2
$B975:  C4 C8		 CPY $C8			 
$B977:  A4 EF		 LDY $EF			 
							  ; Data region
		.byte $AF, $A4, $C7
$B97C:  E1 C3		 SBC ($C3,X)		 
							  ; Data region
		.byte $C3, $A3, $C3
$B981:  C4 A5		 CPY $A5			 
$B983:  A0 22		 LDY #$22			
							  ; Data region
		.byte $04, $A3
$B987:  C4 23		 CPY $23			 
							  ; Data region
		.byte $64, $63
$B98B:  06 26		 ASL $26			 
							  ; Data region
		.byte $02, $25, $12, $23, $25, $27, $72
$B994:  79 62 62	  ADC $6262,Y		 
$B997:  2C 34 61	  BIT $6134		   
$B99A:  08			PHP				 
							  ; Data region
		.byte $74
$B99C:  68			PLA				 
							  ; Data region
		.byte $63, $62, $6C, $60, $22, $68, $1F, $1F, $1F, $1F, $1F, $1F, $1F, $BF, $BF, $BF
		.byte $BF, $BF, $BF, $BF, $BF, $BF, $7F, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
		.byte $FF, $1F, $1F, $1F, $1F, $1F, $1F, $1F, $1F, $1F, $1F, $1F, $1F, $1F, $1F, $1F
		.byte $7F, $FF, $1F, $1F, $1F, $1F, $1F, $FF, $BF, $FF, $3F, $3F, $1F, $BF, $DF, $BF
		.byte $1F, $DF, $FF, $BF, $FF, $BF, $FF, $BF, $BF, $1F, $FF, $3F, $BF, $DF, $DF, $BF
		.byte $BF, $DF, $DF, $FF, $DF, $3F, $BF, $BF, $DF, $1F, $FF, $1F, $1F, $1F, $3F, $BF
		.byte $1F, $3F, $3F, $1F, $1F, $7F, $DF, $DF, $FF, $1F, $7F, $1F, $1F, $1F, $1F, $1F
		.byte $BF, $3F, $FF, $BF, $BF, $BF, $1F, $1F, $1F, $1F, $1F, $1F, $BF, $1F, $BF, $BF
		.byte $BF, $1F, $1F, $1F, $1F, $BF, $1F, $BF, $BF, $1F, $BF, $1F, $1F, $1F, $BF, $1F
		.byte $1F, $3F, $BF, $1F, $BF, $1F, $1F, $1F, $3F, $1F, $1F, $1F, $1F, $1F, $BF, $FF
		.byte $7F, $1F, $1F, $BF, $FF, $1F, $1F, $FF, $7F, $BF, $BF, $1F, $FF, $1F, $7F, $FF
		.byte $7F, $1F, $7F, $7F, $FF, $7F, $FF, $FF, $7F, $FF, $7F, $FF, $7F, $7F, $FF, $FF
		.byte $7F, $1F, $1F, $FF, $1F, $7F, $3F, $FF, $7F, $1F
$BA67:  24 00		 BIT tmp0			; Temporary 0
$BA69:  00			BRK				 
$BA6A:  00			BRK				 
$BA6B:  00			BRK				 
ai_tbl_2:					 ; $BA6C
							  ; Data region
		.byte $FF
$BA6D:  C0 80		 CPY #$80			
$BA6F:  40			RTI				 

; --------------------------------------------------
; AI table 3
; --------------------------------------------------
ai_tbl_3:					 ; $BA70
							  ; Data region
		.byte $FF
$BA71:  C0 80		 CPY #$80			
$BA73:  40			RTI				 

; --------------------------------------------------
; Tactics spell data 1
; --------------------------------------------------
tact_sp_1:					 ; $BA74
$BA74:  10 10		 BPL $BA86		   
$BA76:  08			PHP				 
$BA77:  08			PHP				 
$BA78:  08			PHP				 
$BA79:  08			PHP				 
$BA7A:  08			PHP				 
$BA7B:  0E 0E 10	  ASL $100E		   
$BA7E:  10 10		 BPL $BA90		   
$BA80:  10 10		 BPL $BA92		   
$BA82:  10 10		 BPL $BA94		   
$BA84:  00			BRK				 
$BA85:  00			BRK				 
$BA86:  00			BRK				 
$BA87:  00			BRK				 
$BA88:  00			BRK				 
$BA89:  18			CLC				 
$BA8A:  18			CLC				 
$BA8B:  10 10		 BPL $BA9D		   
$BA8D:  10 10		 BPL $BA9F		   
$BA8F:  10 08		 BPL $BA99		   
$BA91:  08			PHP				 
$BA92:  08			PHP				 
$BA93:  08			PHP				 
$BA94:  08			PHP				 
$BA95:  08			PHP				 
$BA96:  08			PHP				 
$BA97:  10 10		 BPL $BAA9		   
$BA99:  10 10		 BPL $BAAB		   
$BA9B:  08			PHP				 
$BA9C:  08			PHP				 
$BA9D:  08			PHP				 
							  ; Data region
		.byte $0F
$BA9F:  0D 00 00	  ORA tmp0			; Temporary 0
$BAA2:  10 00		 BPL $BAA4		   
$BAA4:  00			BRK				 
tact_sp_2:					 ; $BAA5
$BAA5:  0E 0E 0E	  ASL $0E0E		   
$BAA8:  0E 0E 0E	  ASL $0E0E		   
$BAAB:  0E 08 08	  ASL $0808		   
$BAAE:  0E 0E 0E	  ASL $0E0E		   
$BAB1:  0E 0E 10	  ASL $100E		   
$BAB4:  10 10		 BPL $BAC6		   
$BAB6:  10 10		 BPL $BAC8		   
$BAB8:  10 10		 BPL $BACA		   
$BABA:  10 10		 BPL $BACC		   
$BABC:  10 10		 BPL $BACE		   
$BABE:  10 10		 BPL $BAD0		   
$BAC0:  10 05		 BPL $BAC7		   
$BAC2:  05 10		 ORA ptr_lo		  ; General pointer low
$BAC4:  10 10		 BPL $BAD6		   
$BAC6:  10 10		 BPL $BAD8		   
$BAC8:  10 10		 BPL $BADA		   
$BACA:  08			PHP				 
$BACB:  08			PHP				 
$BACC:  10 08		 BPL $BAD6		   
$BACE:  08			PHP				 
$BACF:  10 10		 BPL $BAE1		   
$BAD1:  10 10		 BPL $BAE3		   
$BAD3:  10 10		 BPL $BAE5		   
tact_sp_3:					 ; $BAD5
$BAD5:  10 80		 BPL $BA57		   
							  ; Data region
		.byte $64, $FF, $FF, $FF, $FF, $FF, $C8, $C8, $80, $80, $80, $80, $80, $C8, $B4, $FF
		.byte $FF, $FF, $FF, $FF
$BAEB:  00			BRK				 
$BAEC:  00			BRK				 
$BAED:  00			BRK				 
$BAEE:  00			BRK				 
$BAEF:  00			BRK				 
$BAF0:  00			BRK				 
$BAF1:  00			BRK				 
							  ; Data region
		.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
$BAFB:  50 50		 BVC $BB4D		   
$BAFD:  0A			ASL				 
							  ; Data region
		.byte $64, $64, $C8, $C8, $FF, $FF, $FF, $FF, $FF
$BB07:  1E 1A 26	  ASL $261A,X		 
$BB0A:  26 0C		 ROL $0C			 
$BB0C:  0A			ASL				 
							  ; Data region
		.byte $12
$BB0E:  0A			ASL				 
$BB0F:  00			BRK				 
$BB10:  00			BRK				 
$BB11:  00			BRK				 
$BB12:  00			BRK				 
$BB13:  1E 1A 26	  ASL $261A,X		 
$BB16:  26 0F		 ROL $0F			 
							  ; Data region
		.byte $0F, $0F, $0F
$BB1B:  00			BRK				 
$BB1C:  00			BRK				 
$BB1D:  00			BRK				 
$BB1E:  00			BRK				 
$BB1F:  00			BRK				 
$BB20:  00			BRK				 
$BB21:  00			BRK				 
sp_bonus:					 ; $BB22
$BB22:  00			BRK				 
$BB23:  40			RTI				 
							  ; Data region
		.byte $32
$BB25:  46 3C		 LSR $3C			 
$BB27:  16 16		 ASL $16,X		   
$BB29:  20 20 FF	  JSR $FF20		   
							  ; Data region
		.byte $FF, $FF, $FF
$BB2F:  16 16		 ASL $16,X		   
$BB31:  4D 4D 4D	  EOR $4D4D		   
$BB34:  4D 4D 4D	  EOR $4D4D		   
$BB37:  00			BRK				 
$BB38:  00			BRK				 
$BB39:  00			BRK				 
$BB3A:  00			BRK				 
							  ; Data region
		.byte $FF, $FF, $FF, $FF
sp_power:					 ; $BB3F
$BB3F:  55 64		 EOR $64,X		   
							  ; Data region
		.byte $64
$BB42:  C0 C0		 CPY #$C0			
$BB44:  00			BRK				 
$BB45:  00			BRK				 
$BB46:  00			BRK				 
$BB47:  55 70		 EOR $70,X		   
sp_attr:					 ; $BB49
$BB49:  55 64		 EOR $64,X		   
							  ; Data region
		.byte $64
$BB4C:  20 20 A0	  JSR $A020		   
$BB4F:  A0 A0		 LDY #$A0			
$BB51:  55 70		 EOR $70,X		   
							  ; Data region
		.byte $04
$BB54:  0A			ASL				 
$BB55:  0A			ASL				 
$BB56:  01 08		 ORA ($08,X)		 
$BB58:  10 02		 BPL $BB5C		   
							  ; Data region
		.byte $04
$BB5B:  08			PHP				 
$BB5C:  01 04		 ORA ($04,X)		 
$BB5E:  01 08		 ORA ($08,X)		 
$BB60:  01 02		 ORA ($02,X)		 
							  ; Data region
		.byte $04
$BB63:  01 02		 ORA ($02,X)		 
$BB65:  01 08		 ORA ($08,X)		 
$BB67:  01 18		 ORA ($18,X)		 
$BB69:  20 20 18	  JSR $1820		   
$BB6C:  10 40		 BPL $BBAE		   
$BB6E:  18			CLC				 
							  ; Data region
		.byte $04, $08, $0C, $02, $03
$BB74:  10 03		 BPL $BB79		   
							  ; Data region
		.byte $03
$BB77:  05 05		 ORA $05			 
$BB79:  01 02		 ORA ($02,X)		 
$BB7B:  10 02		 BPL $BB7F		   
$BB7D:  18			CLC				 
$BB7E:  28			PLP				 
$BB7F:  10 18		 BPL base_dmg		; -> Base damage value
$BB81:  20 FF 10	  JSR $10FF		   
atk_mult:					 ; $BB84
$BB84:  10 00		 BPL $BB86		   
$BB86:  10 10		 BPL $BB98		   
$BB88:  10 10		 BPL $BB9A		   
$BB8A:  10 10		 BPL $BB9C		   
$BB8C:  10 00		 BPL $BB8E		   
$BB8E:  10 00		 BPL $BB90		   
$BB90:  00			BRK				 
$BB91:  00			BRK				 
hit_thresh:					 ; $BB92
$BB92:  66 33		 ROR $33			 
$BB94:  8C 01 FF	  STY $FF01		   
$BB97:  01 A0		 ORA ($A0,X)		 
base_dmg:					 ; $BB99
$BB99:  40			RTI				 
							  ; Data region
		.byte $80, $80, $80, $80, $80, $80, $80
$BBA1:  C8			INY				 
$BBA2:  C8			INY				 
$BBA3:  C8			INY				 
$BBA4:  C8			INY				 
$BBA5:  C8			INY				 
$BBA6:  C8			INY				 
$BBA7:  C8			INY				 
							  ; Data region
		.byte $64, $64, $64, $64, $64, $64, $64
$BBAF:  00			BRK				 
$BBB0:  00			BRK				 
$BBB1:  00			BRK				 
$BBB2:  00			BRK				 
$BBB3:  00			BRK				 
$BBB4:  00			BRK				 
$BBB5:  00			BRK				 
							  ; Data region
		.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $80, $80, $80, $80, $80, $80, $80
$BBC4:  C8			INY				 
$BBC5:  C8			INY				 
$BBC6:  C8			INY				 
$BBC7:  C8			INY				 
$BBC8:  C8			INY				 
$BBC9:  C8			INY				 
$BBCA:  C8			INY				 
$BBCB:  6C E1 44	  JMP ($44E1)		 
$BBCE:  EE F0 FB	  INC $FBF0		   
$BBD1:  00			BRK				 
$BBD2:  FE D4 BC	  INC $BCD4,X		 
$BBD5:  FE 87 BC	  INC $BC87,X		 
$BBD8:  ED B3 EE	  SBC $EEB3		   
$BBDB:  F0 75		 BEQ $BC52		   
$BBDD:  8C 0B C0	  STY $C00B		   
$BBE0:  06 EE		 ASL $EE			 
$BBE2:  D0 2A		 BNE $BC0E		   
$BBE4:  E9 2A		 SBC #$2A			
$BBE6:  EE A0 2A	  INC $2AA0		   
$BBE9:  E9 2A		 SBC #$2A			
$BBEB:  EE 70 2A	  INC $2A70		   
$BBEE:  E9 2A		 SBC #$2A			
$BBF0:  E8			INX				 
							  ; Data region
		.byte $FF
$BBF2:  F9 E4 FB	  SBC $FBE4,Y		 
$BBF5:  00			BRK				 
$BBF6:  ED 00 FE	  SBC $FE00		   
							  ; Data region
		.byte $87
$BBFA:  BC 77 98	  LDY $9877,X		 
$BBFD:  15 21		 ORA $21,X		   
$BBFF:  25 77		 AND $77			 
$BC01:  A4 21		 LDY $21			 
$BC03:  6C 8C 0B	  JMP ($0B8C)		 
$BC06:  25 2C		 AND $2C			 
$BC08:  6C 06 25	  JMP ($2506)		 
							  ; Data region
		.byte $77
$BC0C:  8C 04 B7	  STY $B704		   
							  ; Data region
		.byte $0B
$BC10:  2C FB FE	  BIT $FEFB		   
$BC13:  F9 E6 FB	  SBC $FBE6,Y		 
$BC16:  00			BRK				 
$BC17:  EE D0 65	  INC $65D0		   
$BC1A:  98			TYA				 
							  ; Data region
		.byte $12, $FA
$BC1D:  08			PHP				 
							  ; Data region
		.byte $FA
$BC1F:  E1 1A		 SBC ($1A,X)		 
$BC21:  ED FF EE	  SBC $EEFF		   
$BC24:  D0 7C		 BNE $BCA2		   
$BC26:  98			TYA				 
							  ; Data region
		.byte $0C
$BC28:  26 2A		 ROL $2A			 
$BC2A:  6A			ROR				 
$BC2B:  A4 12		 LDY $12			 
							  ; Data region
		.byte $7C
$BC2E:  8C 08 26	  STY $2608		   
$BC31:  2A			ROL				 
$BC32:  6A			ROR				 
$BC33:  98			TYA				 
							  ; Data region
		.byte $0C, $7C
$BC36:  8C 08 26	  STY $2608		   
$BC39:  75 B0		 ADC $B0,X		   
$BC3B:  18			CLC				 
							  ; Data region
		.byte $1F, $2F
$BC3E:  24 68		 BIT $68			 
$BC40:  98			TYA				 
							  ; Data region
		.byte $0C
$BC42:  28			PLP				 
$BC43:  24 7A		 BIT action_ptr_hi   ; Action data pointer high
$BC45:  A4 12		 LDY $12			 
$BC47:  68			PLA				 
$BC48:  8C 08 28	  STY $2808		   
$BC4B:  24 7A		 BIT action_ptr_hi   ; Action data pointer high
$BC4D:  98			TYA				 
							  ; Data region
		.byte $0C, $73
$BC50:  8C 08 1D	  STY $1D08		   
							  ; Data region
		.byte $6F
$BC54:  B0 18		 BCS $BC6E		   
							  ; Data region
		.byte $7A
$BC57:  C8			INY				 
$BC58:  24 76		 BIT $76			 
$BC5A:  98			TYA				 
							  ; Data region
		.byte $0C
$BC5C:  70 B0		 BVS $BC0E		   
$BC5E:  18			CLC				 
$BC5F:  EE D0 ED	  INC $EDD0		   
$BC62:  00			BRK				 
$BC63:  E1 44		 SBC ($44,X)		 
							  ; Data region
		.byte $FB
$BC66:  00			BRK				 
$BC67:  FE 74 BC	  INC $BC74,X		 
							  ; Data region
		.byte $FB
$BC6B:  01 FE		 ORA ($FE,X)		 
							  ; Data region
		.byte $74
$BC6E:  BC F9 F4	  LDY $F4F9,X		 
$BC71:  FE CE BB	  INC $BBCE,X		 
$BC74:  70 86		 BVS $BBFC		   
							  ; Data region
		.byte $04
$BC77:  25 25		 AND $25			 
$BC79:  25 49		 AND $49			 
$BC7B:  25 49		 AND $49			 
$BC7D:  49 25		 EOR #$25			
$BC7F:  49 49		 EOR #$49			
$BC81:  25 94		 AND $94			 
$BC83:  8C 0C 25	  STY $250C		   
$BC86:  FD EE D0	  SBC $D0EE,X		 
$BC89:  65 98		 ADC $98			 
							  ; Data region
		.byte $0C, $FA
$BC8D:  08			PHP				 
							  ; Data region
		.byte $FA
$BC8F:  EE F0 7C	  INC $7CF0		   
$BC92:  98			TYA				 
$BC93:  15 26		 ORA $26,X		   
$BC95:  2A			ROL				 
$BC96:  6A			ROR				 
$BC97:  A4 21		 LDY $21			 
$BC99:  EE D0 7C	  INC $7CD0		   
$BC9C:  8C 0B 26	  STY $260B		   
$BC9F:  2A			ROL				 
$BCA0:  EE F0 6A	  INC $6AF0		   
$BCA3:  98			TYA				 
$BCA4:  15 7C		 ORA $7C,X		   
$BCA6:  8C 0B 26	  STY $260B		   
$BCA9:  F9 E4 75	  SBC $75E4,Y		 
$BCAC:  98			TYA				 
$BCAD:  15 1F		 ORA $1F,X		   
							  ; Data region
		.byte $23, $63
$BCB1:  A4 21		 LDY $21			 
$BCB3:  75 8C		 ADC $8C,X		   
							  ; Data region
		.byte $0B, $1F, $23, $63
$BCB9:  98			TYA				 
$BCBA:  15 6E		 ORA $6E,X		   
$BCBC:  8C 0B 2A	  STY $2A0B		   
							  ; Data region
		.byte $7C
$BCC0:  98			TYA				 
$BCC1:  15 26		 ORA $26,X		   
$BCC3:  2A			ROL				 
$BCC4:  6A			ROR				 
$BCC5:  A4 21		 LDY $21			 
							  ; Data region
		.byte $7C
$BCC8:  8C 0B 26	  STY $260B		   
$BCCB:  2A			ROL				 
$BCCC:  6A			ROR				 
$BCCD:  98			TYA				 
$BCCE:  15 7C		 ORA $7C,X		   
$BCD0:  8C 0B 26	  STY $260B		   
$BCD3:  FD 7F 86	  SBC $867F,X		 
							  ; Data region
		.byte $04
$BCD7:  30 49		 BMI $BD22		   
$BCD9:  2C 28 49	  BIT $4928		   
$BCDC:  24 20		 BIT $20			 
$BCDE:  49 1C		 EOR #$1C			
$BCE0:  18			CLC				 
$BCE1:  49 14		 EOR #$14			
$BCE3:  49 66		 EOR #$66			
$BCE5:  8C 0C FB	  STY $FB0C		   
$BCE8:  00			BRK				 
$BCE9:  FD E1 3E	  SBC $3EE1,X		 
$BCEC:  EE F0 F7	  INC $F7F0		   
							  ; Data region
		.byte $FB
$BCF0:  F8			SED				 
$BCF1:  FE D4 BC	  INC $BCD4,X		 
$BCF4:  F8			SED				 
							  ; Data region
		.byte $52
$BCF6:  86 03		 STX tmp3			; Temporary 3
$BCF8:  FE CF BD	  INC $BDCF,X		 
$BCFB:  FE CC BD	  INC $BDCC,X		 
							  ; Data region
		.byte $FA
$BCFF:  05 FA		 ORA $FA			 
							  ; Data region
		.byte $57
$BD02:  86 03		 STX tmp3			; Temporary 3
							  ; Data region
		.byte $FB
$BD05:  05 FE		 ORA $FE			 
							  ; Data region
		.byte $CF
$BD08:  BD FE CC	  LDA $CCFE,X		 
$BD0B:  BD FB 00	  LDA $00FB,X		 
							  ; Data region
		.byte $52
$BD0F:  86 03		 STX tmp3			; Temporary 3
$BD11:  FE CF BD	  INC $BDCF,X		 
$BD14:  FE CC BD	  INC $BDCC,X		 
$BD17:  ED B3 F7	  SBC $F7B3		   
$BD1A:  EE F0 15	  INC $15F0		   
$BD1D:  EE D0 1F	  INC $1FD0		   
$BD20:  E9 15		 SBC #$15			
$BD22:  EE 90 1F	  INC $1F90		   
$BD25:  EE 70 15	  INC $1570		   
$BD28:  EE 50 1F	  INC $1F50		   
$BD2B:  E9 15		 SBC #$15			
$BD2D:  E9 1F		 SBC #$1F			
$BD2F:  E8			INX				 
							  ; Data region
		.byte $FF
$BD31:  F9 E4 FB	  SBC $FBE4,Y		 
$BD34:  00			BRK				 
$BD35:  ED 00 F8	  SBC $F800		   
$BD38:  EE F0 52	  INC $52F0		   
$BD3B:  86 03		 STX tmp3			; Temporary 3
$BD3D:  FE CF BD	  INC $BDCF,X		 
$BD40:  FE CC BD	  INC $BDCC,X		 
							  ; Data region
		.byte $FA
$BD44:  05 FA		 ORA $FA			 
							  ; Data region
		.byte $57
$BD47:  86 03		 STX tmp3			; Temporary 3
							  ; Data region
		.byte $FB
$BD4A:  05 FE		 ORA $FE			 
							  ; Data region
		.byte $CF
$BD4D:  BD FE CC	  LDA $CCFE,X		 
$BD50:  BD FB 00	  LDA $00FB,X		 
							  ; Data region
		.byte $52
$BD54:  86 03		 STX tmp3			; Temporary 3
$BD56:  FE CF BD	  INC $BDCF,X		 
$BD59:  FE CC BD	  INC $BDCC,X		 
$BD5C:  59 86 03	  EOR $0386,Y		 
							  ; Data region
		.byte $FB, $07
$BD61:  FE CF BD	  INC $BDCF,X		 
$BD64:  FE CC BD	  INC $BDCC,X		 
							  ; Data region
		.byte $FB
$BD68:  05 52		 ORA $52			 
$BD6A:  86 03		 STX tmp3			; Temporary 3
$BD6C:  FE CF BD	  INC $BDCF,X		 
$BD6F:  FE CC BD	  INC $BDCC,X		 
							  ; Data region
		.byte $FB
$BD73:  00			BRK				 
							  ; Data region
		.byte $52
$BD75:  86 03		 STX tmp3			; Temporary 3
$BD77:  FE CF BD	  INC $BDCF,X		 
$BD7A:  FE CC BD	  INC $BDCC,X		 
$BD7D:  95 0C		 STA $0C,X		   
$BD7F:  94 54		 STY $54,X		   
$BD81:  94 60		 STY $60,X		   
							  ; Data region
		.byte $53
$BD84:  98			TYA				 
$BD85:  15 13		 ORA $13,X		   
							  ; Data region
		.byte $0F
$BD88:  65 A4		 ADC $A4			 
$BD8A:  21 53		 AND ($53,X)		 
$BD8C:  8C 0B 13	  STY $130B		   
							  ; Data region
		.byte $0F
$BD90:  65 98		 ADC $98			 
$BD92:  15 5E		 ORA $5E,X		   
$BD94:  8C 0B 08	  STY $080B		   
							  ; Data region
		.byte $64
$BD98:  B0 2D		 BCS $BDC7		   
$BD9A:  0E 12 52	  ASL $5212		   
$BD9D:  C8			INY				 
$BD9E:  45 58		 EOR $58			 
$BDA0:  98			TYA				 
$BDA1:  15 1A		 ORA $1A,X		   
							  ; Data region
		.byte $57
$BDA4:  B0 2D		 BCS $BDD3		   
							  ; Data region
		.byte $12
$BDA7:  5E 98 15	  LSR $1598,X		 
							  ; Data region
		.byte $F7
$BDAB:  EE D0 FB	  INC $FBD0		   
$BDAE:  00			BRK				 
$BDAF:  FE BD BD	  INC $BDBD,X		 
							  ; Data region
		.byte $FB
$BDB3:  01 FE		 ORA ($FE,X)		 
$BDB5:  BD BD F9	  LDA $F9BD,X		 
							  ; Data region
		.byte $F4
$BDB9:  F8			SED				 
$BDBA:  FE EA BC	  INC $BCEA,X		 
							  ; Data region
		.byte $13, $17, $13, $17
$BDC1:  49 13		 EOR #$13			
$BDC3:  49 49		 EOR #$49			
							  ; Data region
		.byte $17
$BDC6:  49 49		 EOR #$49			
							  ; Data region
		.byte $13
$BDC9:  49 17		 EOR #$17			
$BDCB:  FD 95 86	  SBC $8695,X		 
							  ; Data region
		.byte $03, $54
$BDD0:  86 03		 STX tmp3			; Temporary 3
$BDD2:  09 07		 ORA #$07			
$BDD4:  09 49		 ORA #$49			
							  ; Data region
		.byte $07
$BDD7:  09 49		 ORA #$49			
							  ; Data region
		.byte $07
$BDDA:  09 49		 ORA #$49			
							  ; Data region
		.byte $07, $54
$BDDE:  8C 0A 52	  STY $520A		   
$BDE1:  06 FD		 ASL $FD			 
							  ; Data region
		.byte $F7, $FB, $07
$BDE6:  FE D4 BC	  INC $BCD4,X		 
$BDE9:  F8			SED				 
$BDEA:  FE 69 BE	  INC $BE69,X		 
							  ; Data region
		.byte $73
$BDEE:  8C 0C C6	  STY $C60C		   
$BDF1:  09 BE		 ORA #$BE			
							  ; Data region
		.byte $07
$BDF4:  C6 05		 DEC $05			 
$BDF6:  BE 03 C6	  LDX $C603,Y		 
							  ; Data region
		.byte $03
$BDFA:  BE 02 C6	  LDX $C602,Y		 
							  ; Data region
		.byte $02
$BDFE:  BC 0C C6	  LDY $C60C,X		 
$BE01:  09 BC		 ORA #$BC			
							  ; Data region
		.byte $07
$BE04:  C6 05		 DEC $05			 
$BE06:  BC 03 C6	  LDY $C603,X		 
							  ; Data region
		.byte $03
$BE0A:  BC 02 C6	  LDY $C602,X		 
							  ; Data region
		.byte $02
$BE0E:  FE 69 BE	  INC $BE69,X		 
$BE11:  6C 86 03	  JMP ($0386)		 
$BE14:  2A			ROL				 
							  ; Data region
		.byte $FA
$BE16:  10 F9		 BPL $BE11		   
							  ; Data region
		.byte $1F
$BE19:  28			PLP				 
							  ; Data region
		.byte $FA
$BE1B:  10 FB		 BPL $BE18		   
$BE1D:  6E 98 15	  ROR $1598		   
							  ; Data region
		.byte $FA
$BE21:  08			PHP				 
							  ; Data region
		.byte $FA
$BE23:  6E 0C 94	  ROR $940C		   
							  ; Data region
		.byte $54
$BE27:  94 60		 STY $60,X		   
$BE29:  49 49		 EOR #$49			
$BE2B:  49 94		 EOR #$94			
$BE2D:  30 7C		 BMI $BEAB		   
$BE2F:  98			TYA				 
$BE30:  15 26		 ORA $26,X		   
$BE32:  2A			ROL				 
$BE33:  6A			ROR				 
$BE34:  A4 21		 LDY $21			 
							  ; Data region
		.byte $7C
$BE37:  8C 09 26	  STY $2609		   
$BE3A:  2A			ROL				 
$BE3B:  6A			ROR				 
$BE3C:  98			TYA				 
$BE3D:  15 7C		 ORA $7C,X		   
$BE3F:  8C 09 71	  STY $7109		   
$BE42:  98			TYA				 
$BE43:  15 6A		 ORA $6A,X		   
$BE45:  8C 09 26	  STY $2609		   
$BE48:  31 F7		 AND ($F7),Y		 
							  ; Data region
		.byte $FB
$BE4B:  00			BRK				 
$BE4C:  FE 5A BE	  INC $BE5A,X		 
							  ; Data region
		.byte $FB
$BE50:  01 FE		 ORA ($FE,X)		 
							  ; Data region
		.byte $5A
$BE53:  BE F9 F4	  LDX $F4F9,Y		 
$BE56:  F8			SED				 
$BE57:  FE E3 BD	  INC $BDE3,X		 
$BE5A:  28			PLP				 
$BE5B:  2D 28 2D	  AND $2D28		   
$BE5E:  49 28		 EOR #$28			
$BE60:  49 49		 EOR #$49			
$BE62:  2D 49 49	  AND $4949		   
$BE65:  28			PLP				 
$BE66:  49 2D		 EOR #$2D			
$BE68:  FD 6E 98	  SBC $986E,X		 
							  ; Data region
		.byte $0C, $FA
$BE6D:  08			PHP				 
							  ; Data region
		.byte $FA
$BE6F:  6E 86 03	  ROR $0386		   
$BE72:  26 FA		 ROL $FA			 
$BE74:  20 F9 1F	  JSR $1FF9		   
$BE77:  28			PLP				 
							  ; Data region
		.byte $FA
$BE79:  10 FB		 BPL $BE76		   
							  ; Data region
		.byte $23
$BE7C:  26 FA		 ROL $FA			 
$BE7E:  10 FB		 BPL $BE7B		   
$BE80:  FD E1 1C	  SBC $1CE1,X		 
$BE83:  EE F0 4D	  INC $4DF0		   
$BE86:  98			TYA				 
$BE87:  60			RTS				 
							  ; Data region
		.byte $02, $02, $02
$BE8B:  4D 98 60	  EOR $6098		   
							  ; Data region
		.byte $FA
$BE8F:  28			PLP				 
							  ; Data region
		.byte $FA
$BE91:  94 60		 STY $60,X		   
$BE93:  49 4D		 EOR #$4D			
$BE95:  18			CLC				 
							  ; Data region
		.byte $FA
$BE97:  41 FB		 EOR ($FB,X)		 
$BE99:  94 48		 STY $48,X		   
$BE9B:  94 60		 STY $60,X		   
							  ; Data region
		.byte $FA, $07, $FB
$BEA0:  4D 18 FA	  EOR $FA18		   
$BEA3:  10 FB		 BPL $BEA0		   
$BEA5:  FE 8B BE	  INC $BE8B,X		 
$BEA8:  96 E1		 STX $E1,Y		   
$BEAA:  3E 73 06	  ROL $0673,X		 
$BEAD:  4A			LSR				 
$BEAE:  4A			LSR				 
$BEAF:  29 28		 AND #$28			
$BEB1:  4A			LSR				 
$BEB2:  4A			LSR				 
$BEB3:  29 26		 AND #$26			
$BEB5:  49 49		 EOR #$49			
$BEB7:  49 76		 EOR #$76			
$BEB9:  2A			ROL				 
$BEBA:  78			SEI				 
$BEBB:  06 76		 ASL $76			 
$BEBD:  18			CLC				 
$BEBE:  95 12		 STA $12,X		   
$BEC0:  78			SEI				 
$BEC1:  06 76		 ASL $76			 
$BEC3:  18			CLC				 
$BEC4:  95 08		 STA $08,X		   
$BEC6:  4A			LSR				 
$BEC7:  2D 2B 4A	  AND $4A2B		   
$BECA:  2D 2E 30	  AND $302E		   
$BECD:  2E 2D 2B	  ROL $2B2D		   
$BED0:  29 28		 AND #$28			
$BED2:  26 24		 ROL $24			 
							  ; Data region
		.byte $22
$BED5:  21 1F		 AND ($1F,X)		 
$BED7:  1D 1C 1A	  ORA $1A1C,X		 
$BEDA:  18			CLC				 
$BEDB:  16 15		 ASL $15,X		   
$BEDD:  F9 CC 5E	  SBC $5ECC,Y		 
$BEE0:  98			TYA				 
$BEE1:  08			PHP				 
$BEE2:  94 48		 STY $48,X		   
$BEE4:  94 60		 STY $60,X		   
$BEE6:  78			SEI				 
$BEE7:  B0 00		 BCS $BEE9		   
							  ; Data region
		.byte $2B
$BEEA:  78			SEI				 
$BEEB:  06 4A		 ASL $4A			 
$BEED:  4A			LSR				 
							  ; Data region
		.byte $2B, $7B
$BEF0:  18			CLC				 
$BEF1:  2D 73 06	  AND $0673		   
$BEF4:  4A			LSR				 
$BEF5:  4A			LSR				 
$BEF6:  29 76		 AND #$76			
$BEF8:  30 26		 BMI $BF20		   
							  ; Data region
		.byte $73
$BEFB:  06 4A		 ASL $4A			 
$BEFD:  4A			LSR				 
$BEFE:  26 76		 ROL $76			 
$BF00:  18			CLC				 
$BF01:  28			PLP				 
							  ; Data region
		.byte $6F
$BF03:  06 4A		 ASL $4A			 
$BF05:  4A			LSR				 
$BF06:  28			PLP				 
$BF07:  71 30		 ADC ($30),Y		 
$BF09:  21 71		 AND ($71,X)		 
$BF0B:  06 4A		 ASL $4A			 
$BF0D:  4A			LSR				 
$BF0E:  24 78		 BIT $78			 
$BF10:  18			CLC				 
$BF11:  24 73		 BIT $73			 
$BF13:  06 4A		 ASL $4A			 
$BF15:  4A			LSR				 
$BF16:  24 6C		 BIT $6C			 
$BF18:  30 28		 BMI $BF42		   
$BF1A:  78			SEI				 
$BF1B:  60			RTS				 
$BF1C:  F9 C8 FE	  SBC $FEC8,Y		 
$BF1F:  A9 BE		 LDA #$BE			
$BF21:  E1 3E		 SBC ($3E,X)		 
$BF23:  EE E0 94	  INC $94E0		   
$BF26:  98			TYA				 
$BF27:  00			BRK				 
							  ; Data region
		.byte $1A
$BF29:  49 1B		 EOR #$1B			
$BF2B:  49 1C		 EOR #$1C			
$BF2D:  49 1D		 EOR #$1D			
$BF2F:  49 1C		 EOR #$1C			
$BF31:  B1 06		 LDA ($06),Y		 
$BF33:  49 18		 EOR #$18			
							  ; Data region
		.byte $13
$BF36:  15 10		 ORA $10,X		   
$BF38:  F9 EB 94	  SBC $94EB,Y		 
$BF3B:  18			CLC				 
$BF3C:  26 FA		 ROL $FA			 
							  ; Data region
		.byte $07, $FC
$BF40:  26 26		 ROL $26			 
$BF42:  26 26		 ROL $26			 
$BF44:  25 25		 AND $25			 
$BF46:  25 25		 AND $25			 
$BF48:  24 24		 BIT $24			 
							  ; Data region
		.byte $23, $23, $22, $22
$BF4E:  21 21		 AND ($21,X)		 
$BF50:  20 20 1F	  JSR $1F20		   
							  ; Data region
		.byte $1F
$BF54:  1E 1E 1D	  ASL $1D1E,X		 
$BF57:  1D 1C 1C	  ORA $1C1C,X		 
							  ; Data region
		.byte $1C, $1C, $1C, $1C, $1C, $1C
$BF60:  F9 DE FE	  SBC $FEDE,Y		 
$BF63:  21 BF		 AND ($BF,X)		 
$BF65:  FE 96 BF	  INC $BF96,X		 
$BF68:  FE 96 BF	  INC $BF96,X		 
							  ; Data region
		.byte $DF
$BF6C:  05 2E		 ORA $2E			 
							  ; Data region
		.byte $FA, $07, $FC
$BF71:  2E 2E 2E	  ROL $2E2E		   
$BF74:  2E 2E 2E	  ROL $2E2E		   
$BF77:  2E 2E 2D	  ROL $2D2E		   
$BF7A:  2D 2C 2C	  AND $2C2C		   
							  ; Data region
		.byte $2B, $2B
$BF7F:  2A			ROL				 
$BF80:  2A			ROL				 
$BF81:  29 29		 AND #$29			
$BF83:  28			PLP				 
$BF84:  28			PLP				 
							  ; Data region
		.byte $27, $27
$BF87:  26 26		 ROL $26			 
$BF89:  26 26		 ROL $26			 
$BF8B:  25 25		 AND $25			 
							  ; Data region
		.byte $23, $23
$BF8F:  25 25		 AND $25			 
$BF91:  F9 DE FE	  SBC $FEDE,Y		 
$BF94:  65 BF		 ADC $BF			 
$BF96:  6A			ROR				 
$BF97:  98			TYA				 
$BF98:  08			PHP				 
$BF99:  B8			CLV				 
$BF9A:  0E FA 05	  ASL $05FA		   
$BF9D:  F8			SED				 
$BF9E:  B5 08		 LDA $08,X		   
$BFA0:  49 B7		 EOR #$B7			
$BFA2:  06 1B		 ASL $1B			 
							  ; Data region
		.byte $1A, $15, $FD, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
		.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
		.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
		.byte $FF, $FF, $FF, $FF
$BFD8:  78			SEI				 
$BFD9:  EE DF BF	  INC $BFDF		   
$BFDC:  4C 8E FF	  JMP $FF8E		   
							  ; Data region
		.byte $80
$BFE0:  20 44 52	  JSR $5244		   
$BFE3:  41 47		 EOR ($47,X)		 
							  ; Data region
		.byte $4F
$BFE6:  4E 20 51	  LSR $5120		   
$BFE9:  55 45		 EOR $45,X		   
							  ; Data region
		.byte $53, $54
$BFED:  20 49 56	  JSR $5649		   
$BFF0:  00			BRK				 
$BFF1:  00			BRK				 
$BFF2:  00			BRK				 
$BFF3:  00			BRK				 
$BFF4:  48			PHA				 
							  ; Data region
		.byte $04
$BFF6:  01 0E		 ORA ($0E,X)		 
							  ; Data region
		.byte $07, $9E
$BFFA:  D8			CLD				 
							  ; Data region
		.byte $BF
$BFFC:  D8			CLD				 
							  ; Data region
		.byte $BF, $D8, $BF