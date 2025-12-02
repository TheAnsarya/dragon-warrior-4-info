; Dragon Warrior IV (NES) - Text Handler Disassembly
; Bank 22 ($8000-$BFFF when switched in)
; =; =; =; =; =; =; =; =; =; =; =; =; =; =; =; =; =; =; =; =; =; =; =; =; =; =; =; =; =; =; =; =; =; =; =

; ============================================================
; TEXT CONTROL CODE HANDLER - $FD (LINE/CLEAR)
; Located at $8B1F (ROM 0x58B2F)
; ============================================================

  $8ADF  96 8C      STX  $8C,Y
  $8AE1  AD D4 03   LDA  $03D4
  $8AE4  18         CLC  
  $8AE5  69 20      ADC  #$20
  $8AE7  8D D4 03   STA  $03D4
  $8AEA  AD B4 07   LDA  $07B4
  $8AED  09 08      ORA  #$08
  $8AEF  8D B4 07   STA  $07B4
  $8AF2  A9 00      LDA  #$00
  $8AF4  4C B3 8A   JMP  $8AB3
  $8AF7  20 F0 90   JSR  $90F0
  $8AFA  AD D4 03   LDA  $03D4
  $8AFD  29 1F      AND  #$1F
  $8AFF  C9 01      CMP  #$01
  $8B01  D0 B0      BNE  $8AB3
  $8B03  AD B4 07   LDA  $07B4
  $8B06  10 09      BPL  loc_8B11
  $8B08  A5 F8      LDA  $F8
  $8B0A  48         PHA  
  $8B0B  20 96 8C   JSR  $8C96
  $8B0E  68         PLA  
  $8B0F  85 F8      STA  $F8

loc_8B11:
  $8B11  A5 F8      LDA  $F8
  $8B13  C9 F0      CMP  #$F0
  $8B15  90 10      BCC  loc_8B27
  $8B17  C9 FF      CMP  #$FF  ; END
  $8B19  F0 0C      BEQ  loc_8B27
  $8B1B  C9 FE      CMP  #$FE  ; CTRL
  $8B1D  F0 08      BEQ  loc_8B27
  $8B1F  C9 FD      CMP  #$FD  ; LINE
  $8B21  F0 04      BEQ  loc_8B27
  $8B23  A9 F0      LDA  #$F0
  $8B25  85 F8      STA  $F8

loc_8B27:
  $8B27  60         RTS  
  $8B28  C9 FF      CMP  #$FF  ; END
  $8B2A  F0 37      BEQ  loc_8B63
  $8B2C  C9 FE      CMP  #$FE  ; CTRL
  $8B2E  D0 18      BNE  loc_8B48
  $8B30  0E D4 03   ASL  $03D4
  $8B33  0E D4 03   ASL  $03D4
  $8B36  0E D4 03   ASL  $03D4
  $8B39  A5 F7      LDA  $F7
  $8B3B  4A         LSR  
  $8B3C  6E D4 03   ROR  $03D4
  $8B3F  4A         LSR  
  $8B40  6E D4 03   ROR  $03D4
  $8B43  4A         LSR  
  $8B44  6E D4 03   ROR  $03D4
  $8B47  60         RTS  

loc_8B48:
  $8B48  AD B4 07   LDA  $07B4
  $8B4B  29 04      AND  #$04
  $8B4D  F0 11      BEQ  loc_8B60
  $8B4F  AD D4 03   LDA  $03D4
  $8B52  18         CLC  
  $8B53  69 20      ADC  #$20
  $8B55  8D D4 03   STA  $03D4
  $8B58  AD B4 07   LDA  $07B4
  $8B5B  29 FB      AND  #$FB
  $8B5D  8D B4 07   STA  $07B4

loc_8B60:
  $8B60  4C 96 8C   JMP  $8C96

loc_8B63:
  $8B63  A9 D1      LDA  #$D1
  $8B65  8D F2 04   STA  $04F2
  $8B68  A9 1E      LDA  #$1E
  $8B6A  8D F3 04   STA  $04F3
  $8B6D  A9 0C      LDA  #$0C
  $8B6F  8D E1 03   STA  $03E1
  $8B72  AD E1 03   LDA  $03E1
  $8B75  0A         ASL  
  $8B76  AA         TAX  
  $8B77  BD 6C 07   LDA  $076C,X
  $8B7A  1D 6D 07   ORA  $076D,X
  $8B7D  F0 37      BEQ  $8BB6
  $8B7F  A9 00      LDA  #$00
  $8B81  9D 6C 07   STA  $076C,X
  $8B84  9D 6D 07   STA  $076D,X
  $8B87  A9 0E      LDA  #$0E
  $8B89  85 0D      STA  $0D
  $8B8B  20 D4 8D   JSR  $8DD4
  $8B8E  A5 0D      LDA  $0D
  $8B90  A8         TAY  
  $8B91  88         DEY  
  $8B92  A5 04      LDA  $04
  $8B94  99 E0 04   STA  $04E0,Y
  $8B97  A5 0D      LDA  $0D
  $8B99  0A         ASL  
  $8B9A  AA         TAX  
  $8B9B  A5 00      LDA  $00
  $8B9D  9D 7E 04   STA  $047E,X

; ============================================================
; MENU TEXT DATA - $B3F0
; ROM offset 0x5B400
; ============================================================

; Menu text at $B3F0:
;   +$00: 3D 8B 29 36 25 37 29 8B 32 25 31 29 28 19 00 23
;        "Y[8B]ERASE[8B]NAMEDo you want toerase "
;   +$20: 1E 12 13 1D 1B 1F 0F 1D 1E 6D 37 0F 16 0F 0D 1E
;        "thisquest[6D]Select the message 1 2"
;   +$40: 00 04 00 05 00 06 00 07 00 08 00 09 2A 0B 1D 1E
;        " 3 4 5 6 7 8Fast        Slow Cha"
;   +$60: 1A 1E 0F 1C 00 30 29 3A 29 30 00 00 89 25 28 3A
;        "pter LEVEL  [89]ADVENTURE LOGFIGHTT"
;   +$80: 25 27 38 2D 27 37 31 29 31 26 29 36 36 39 32 37
;        "ACTICSMEMBERRUNSPELLITEMATTACKPA"
;   +$A0: 36 36 3D 27 00 01 01 01 01 01 01 37 29 29 00 A0
;        "RRYC 000000SEE [A0]SSEE [A1]SSWITCHREM"
;   +$C0: 33 3A 29 25 28 28 A9 00 8D DD 03 00 62 33 60 A9
;        "OVEADD[A9] [8D][DD]2 [62]O[60][A9]7[8D][DD]2 [62]y7[60][A9][80][8D][DD]2 [62]"
;   +$E0: 23 80 60 A9 40 8D DD 03 00 62 23 40 60 00 62 23
;        "y[80][60][A9][40][8D][DD]2 [62]y[40][60] [62]y[40][8D][D2]2[C5][F7][90]4[F0]2[CE][D2]2[A2] [A0]"

; ============================================================
; LOOKING FOR TEXT RENDERING ROUTINE
; Search for code that reads text and writes to PPU
; ============================================================

; Found 30 LDA ($xx),Y patterns

; Pattern at $8BE7, pointer in $EE:
  $8BDF  0E B4 07   ASL  $07B4
  $8BE2  4E B4 07   LSR  $07B4
  $8BE5  A0 01      LDY  #$01
  $8BE7  B1 EE      LDA  ($EE),Y
  $8BE9  29 04      AND  #$04
  $8BEB  F0 17      BEQ  loc_8C04
  $8BED  C8         INY  
  $8BEE  B1 EE      LDA  ($EE),Y
  $8BF0  29 30      AND  #$30
  $8BF2  A8         TAY  
  $8BF3  F0 0F      BEQ  loc_8C04
  $8BF5  C9 10      CMP  #$10
  $8BF7  F0 5B      BEQ  $8C54
  $8BF9  C9 30      CMP  #$30
  $8BFB  F0 07      BEQ  loc_8C04
  $8BFD  0E B4 07   ASL  $07B4
  $8C00  38         SEC  
  $8C01  6E B4 07   ROR  $07B4

loc_8C04:
  $8C04  AD 88 07   LDA  $0788
  $8C07  F0 53      BEQ  $8C5C
  $8C09  20 CB 9C   JSR  $9CCB
  $8C0C  BD 88 07   LDA  $0788,X
  $8C0F  C5 F6      CMP  $F6
  $8C11  D0 0F      BNE  $8C22
  $8C13  C9 00      CMP  #$00
  $8C15  F0 04      BEQ  $8C1B

; Pattern at $8BEE, pointer in $EE:
  $8BE6  01 B1      ORA  ($B1,X)
  $8BE8  EE 29 04   INC  $0429
  $8BEB  F0 17      BEQ  loc_8C04
  $8BED  C8         INY  
  $8BEE  B1 EE      LDA  ($EE),Y
  $8BF0  29 30      AND  #$30
  $8BF2  A8         TAY  
  $8BF3  F0 0F      BEQ  loc_8C04
  $8BF5  C9 10      CMP  #$10
  $8BF7  F0 5B      BEQ  $8C54
  $8BF9  C9 30      CMP  #$30
  $8BFB  F0 07      BEQ  loc_8C04
  $8BFD  0E B4 07   ASL  $07B4
  $8C00  38         SEC  
  $8C01  6E B4 07   ROR  $07B4

loc_8C04:
  $8C04  AD 88 07   LDA  $0788
  $8C07  F0 53      BEQ  $8C5C
  $8C09  20 CB 9C   JSR  $9CCB
  $8C0C  BD 88 07   LDA  $0788,X
  $8C0F  C5 F6      CMP  $F6
  $8C11  D0 0F      BNE  $8C22
  $8C13  C9 00      CMP  #$00
  $8C15  F0 04      BEQ  loc_8C1B
  $8C17  C9 00      CMP  #$00
  $8C19  D0 16      BNE  $8C31

loc_8C1B:
  $8C1B  BD A0 07   LDA  $07A0,X

; Pattern at $9088, pointer in $EE:
  $9080  03            .db  $03
  $9081  29 1F      AND  #$1F
  $9083  D0 19      BNE  loc_909E
  $9085  AC D9 03   LDY  $03D9
  $9088  B1 EE      LDA  ($EE),Y
  $908A  4A         LSR  
  $908B  C9 60      CMP  #$60
  $908D  F0 0F      BEQ  loc_909E
  $908F  A2 08      LDX  #$08
  $9091  C9 62      CMP  #$62
  $9093  F0 02      BEQ  loc_9097
  $9095  A2 10      LDX  #$10

loc_9097:
  $9097  8A         TXA  
  $9098  0D D4 03   ORA  $03D4
  $909B  8D D4 03   STA  $03D4

loc_909E:
  $909E  A5 F8      LDA  $F8
  $90A0  C9 F0      CMP  #$F0
  $90A2  B0 10      BCS  loc_90B4
  $90A4  AC D9 03   LDY  $03D9
  $90A7  F0 0B      BEQ  loc_90B4
  $90A9  B1 EE      LDA  ($EE),Y
  $90AB  4A         LSR  
  $90AC  90 06      BCC  loc_90B4
  $90AE  C8         INY  
  $90AF  B1 EE      LDA  ($EE),Y
  $90B1  20 F4 A4   JSR  $A4F4

loc_90B4:
  $90B4  A5 F5      LDA  $F5
  $90B6  29 08      AND  #$08

; Pattern at $91F9, pointer in $EE:
  $91F1  02            .db  $02
  $91F2  E6 F2      INC  $F2
  $91F4  20 30 92   JSR  $9230
  $91F7  A4 F0      LDY  $F0
  $91F9  B1 EE      LDA  ($EE),Y
  $91FB  20 2D 98   JSR  $982D
  $91FE  20 AE 93   JSR  $93AE
  $9201  AD F4 00   LDA  $00F4
  $9204  29 F0      AND  #$F0
  $9206  F0 0F      BEQ  loc_9217
  $9208  C9 10      CMP  #$10
  $920A  F0 0B      BEQ  loc_9217
  $920C  AD CB 03   LDA  $03CB
  $920F  4A         LSR  
  $9210  90 C8      BCC  $91DA
  $9212  E6 F2      INC  $F2
  $9214  4C DA 91   JMP  $91DA

loc_9217:
  $9217  A0 01      LDY  #$01
  $9219  4C 1E 92   JMP  loc_921E
  $921C  A0 00      LDY  #$00

loc_921E:
  $921E  68         PLA  
  $921F  8D F4 00   STA  $00F4
  $9222  68         PLA  
  $9223  85 F0      STA  $F0
  $9225  68         PLA  
  $9226  8D F2 04   STA  $04F2

; Pattern at $93B9, pointer in $EE:
  $93B1  F0 C5      BEQ  $9378
  $93B3  F1 F0      SBC  ($F0),Y
  $93B5  5A            .db  $5A
  $93B6  B0 23      BCS  loc_93DB
  $93B8  A8         TAY  
  $93B9  B1 EE      LDA  ($EE),Y
  $93BB  10 14      BPL  loc_93D1
  $93BD  29 E0      AND  #$E0
  $93BF  C9 C0      CMP  #$C0
  $93C1  F0 0E      BEQ  loc_93D1
  $93C3  C9 E0      CMP  #$E0
  $93C5  D0 E7      BNE  $93AE
  $93C7  B1 EE      LDA  ($EE),Y
  $93C9  29 1F      AND  #$1F
  $93CB  8D C6 03   STA  $03C6
  $93CE  4C AE 93   JMP  $93AE

loc_93D1:
  $93D1  20 FE 94   JSR  $94FE
  $93D4  B0 19      BCS  $93EF
  $93D6  20 17 95   JSR  $9517
  $93D9  B0 14      BCS  $93EF

loc_93DB:
  $93DB  AD F4 00   LDA  $00F4
  $93DE  29 0F      AND  #$0F
  $93E0  0A         ASL  
  $93E1  A8         TAY  
  $93E2  B9 F1 93   LDA  $93F1,Y
  $93E5  48         PHA  
  $93E6  B9 F0 93   LDA  $93F0,Y

; ============================================================
; PPU WRITE LOCATIONS IN BANK 22
; ============================================================

; Found 0 STA PPUDATA in Bank 22