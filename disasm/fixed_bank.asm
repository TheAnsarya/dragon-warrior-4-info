; Dragon Warrior IV (NES) - Fixed Bank Disassembly
; ================================================
; PRG-ROM: 512KB (32 x 16KB banks)
; Fixed banks: $C000-$FFFF (last 16KB)
;
; CPU Vectors:
;   NMI:   $0502 (RAM - jumps to $C15A on init)
;   RESET: $FFD8
;   IRQ:   $C408
;

; ============================================
; Hardware Registers
; ============================================
PPUCTRL    = $2000
PPUMASK    = $2001
PPUSTATUS  = $2002
OAMADDR    = $2003
OAMDATA    = $2004
PPUSCROLL  = $2005
PPUADDR    = $2006
PPUDATA    = $2007
OAMDMA     = $4014
APU_STATUS = $4015
JOY1       = $4016
JOY2       = $4017

; ============================================
; RAM Variables
; ============================================
MapNumber     = $63
SubmapNumber  = $64
vblank_flag   = $0500
ppuctrl_shad  = $0501
NMI_JMP       = $0502
NMI_target_lo = $0503
NMI_target_hi = $0504
current_bank  = $0507

; ============================================
; RESET HANDLER ($FFD8)
; ============================================

RESET_entry:
$FFD8:  SEI    ; Entry point from RESET vector
$FFD9:  INC  $FFDF
$FFDC:  JMP  main_init
$FFDF:  .byte $80
$FFE0:  .byte $44
$FFE1:  .byte $52
$FFE2:  EOR  ($47,X)
$FFE4:  .byte $4F
$FFE5:  LSR  $5120
$FFE8:  EOR  $45,X
$FFEA:  .byte $53
$FFEB:  .byte $54
$FFEC:  JSR  sub_5649
$FFEF:  JSR  sub_FFFF
$FFF2:  BRK  
$FFF3:  BRK  
$FFF4:  PHA  
$FFF5:  .byte $04
$FFF6:  ORA  ($0F,X)
$FFF8:  .byte $07
$FFF9:  STA  NMI_JMP,X

; ============================================
; VECTORS ($FFFA-$FFFF)
; ============================================
  .word $0502  ; NMI
  .word $FFD8  ; RESET
  .word $C408  ; IRQ

; ============================================
; MAIN INIT ($C03D)
; ============================================

main_init:
$C03D:  CLD    ; Main initialization routine

loc_C03E:
$C03E:  LDA  PPUSTATUS
$C041:  BPL  loc_C03E

loc_C043:
$C043:  LDA  PPUSTATUS
$C046:  BPL  loc_C043
$C048:  NOP  
$C049:  NOP  
$C04A:  NOP  
$C04B:  NOP  
$C04C:  NOP  
$C04D:  NOP  
$C04E:  LDA  #$10
$C050:  STA  PPUCTRL
$C053:  LDA  #$00
$C055:  STA  PPUMASK
$C058:  STA  sub_FFFF
$C05B:  STA  sub_FFFF
$C05E:  STA  sub_FFFF
$C061:  STA  sub_FFFF
$C064:  STA  sub_FFFF
$C067:  LDA  #$4C  ; Set up NMI jump instruction in RAM
$C069:  STA  NMI_JMP
$C06C:  LDA  $C0D2
$C06F:  STA  NMI_target_lo
$C072:  LDA  $C0D3
$C075:  STA  NMI_target_hi
$C078:  LDX  #$FF  ; Initialize stack pointer
$C07A:  TXS  
$C07B:  LDA  #$00
$C07D:  TAX  

loc_C07E:
$C07E:  STA  $00,X  ; Clear zero page and RAM
$C080:  STA  $0300,X
$C083:  STA  $0400,X
$C086:  STA  $0505,X
$C089:  STA  $0600,X
$C08C:  STA  $0700,X
$C08F:  INX  
$C090:  BNE  loc_C07E
$C092:  LDA  #$0E
$C094:  STA  vblank_flag
$C097:  LDA  #$10
$C099:  STA  ppuctrl_shadow
$C09C:  STA  $39
$C09E:  JSR  init_subroutine
$C0A1:  LDA  PPUSTATUS
$C0A4:  LDA  #$10
$C0A6:  STA  PPUADDR
$C0A9:  LDA  #$00
$C0AB:  STA  PPUADDR
$C0AE:  LDX  #$10

loc_C0B0:
$C0B0:  STA  PPUDATA
$C0B3:  DEX  
$C0B4:  BNE  loc_C0B0
$C0B6:  LDA  #$90
$C0B8:  STA  $0505
$C0BB:  STA  PPUCTRL
$C0BE:  JSR  sub_C569
$C0C1:  JSR  sub_C543
$C0C4:  JSR  sub_FF74
$C0C7:  LDA  #$18
$C0C9:  STA  $0506
$C0CC:  STA  PPUMASK
$C0CF:  JMP  loc_C968
$C0D2:  .byte $5A
$C0D3:  CMP  ($AD,X)
$C0D5:  .byte $02
$C0D6:  JSR  sub_FB10

loc_C0D9:
$C0D9:  LDA  PPUSTATUS
$C0DC:  BMI  loc_C0D9

loc_C0DE:
$C0DE:  LDA  PPUSTATUS
$C0E1:  BPL  loc_C0DE

loc_C0E3:
$C0E3:  LDA  PPUSTATUS
$C0E6:  BMI  loc_C0E3
$C0E8:  RTS  
$C0E9:  LDA  #$40
$C0EB:  STA  NMI_JMP
$C0EE:  LDA  #$00
$C0F0:  STA  sub_FFFF
$C0F3:  STA  sub_FFFF
$C0F6:  STA  sub_FFFF
$C0F9:  STA  sub_FFFF
$C0FC:  LDA  #$01
$C0FE:  STA  sub_FFFF

loc_C101:
$C101:  JMP  loc_C101

init_subroutine:
$C104:  INC  $FFDF
$C107:  LDA  vblank_flag
$C10A:  JSR  sub_C118
$C10D:  LDA  ppuctrl_shadow
$C110:  JSR  sub_C12F
$C113:  LDA  #$00
$C115:  JMP  loc_C146

sub_C118:
$C118:  STA  vblank_flag
$C11B:  STA  $9FFF
$C11E:  LSR  A
$C11F:  STA  $9FFF
$C122:  LSR  A
$C123:  STA  $9FFF
$C126:  LSR  A
$C127:  STA  $9FFF
$C12A:  LSR  A
$C12B:  STA  $9FFF
$C12E:  RTS  

sub_C12F:
$C12F:  STA  ppuctrl_shadow
$C132:  STA  $BFFF
$C135:  LSR  A
$C136:  STA  $BFFF
$C139:  LSR  A
$C13A:  STA  $BFFF
$C13D:  LSR  A
$C13E:  STA  $BFFF
$C141:  LSR  A
$C142:  STA  $BFFF
$C145:  RTS  

loc_C146:
$C146:  STA  $DFFF
$C149:  LSR  A
$C14A:  STA  $DFFF
$C14D:  LSR  A
$C14E:  STA  $DFFF
$C151:  LSR  A
$C152:  STA  $DFFF
$C155:  LSR  A
$C156:  STA  $DFFF
$C159:  RTS  

NMI_main:
$C15A:  PHA  
$C15B:  TXA  
$C15C:  PHA  
$C15D:  TYA  
$C15E:  PHA  
$C15F:  LDA  $1F
$C161:  BMI  loc_C181
$C163:  TSX  
$C164:  LDY  $0106,X
$C167:  INY  
$C168:  BNE  loc_C181
$C16A:  LDA  $0105,X
$C16D:  CMP  #$77
$C16F:  BCC  loc_C181
$C171:  CMP  #$81
$C173:  BCS  loc_C181
$C175:  LDA  PPUSTATUS
$C178:  JSR  sub_C222
$C17B:  JSR  sub_C303
$C17E:  JSR  sub_C2EA

loc_C181:
$C181:  TSX  
$C182:  LDY  $0106,X
$C185:  INY  
$C186:  BNE  loc_C19B
$C188:  LDA  $0105,X
$C18B:  CMP  #$AB
$C18D:  BCC  loc_C19B
$C18F:  CMP  #$D6
$C191:  BCS  loc_C19B
$C193:  LDA  #$D6
$C195:  STA  $0105,X
$C198:  JSR  init_subroutine

loc_C19B:
$C19B:  LDA  $0519
$C19E:  BNE  loc_C1B0
$C1A0:  INC  $C221
$C1A3:  LDA  #$10
$C1A5:  JSR  sub_C12F
$C1A8:  LDA  #$10
$C1AA:  JSR  sub_C12F
$C1AD:  JSR  sub_C019

loc_C1B0:
$C1B0:  LDA  current_bank
$C1B3:  JSR  sub_FF91
$C1B6:  NOP  
$C1B7:  NOP  
$C1B8:  NOP  
$C1B9:  NOP  
$C1BA:  NOP  
$C1BB:  NOP  
$C1BC:  NOP  
$C1BD:  TSX  
$C1BE:  LDA  $0106,X
$C1C1:  CMP  #$6C
$C1C3:  BNE  loc_C1EF
$C1C5:  LDA  $0105,X
$C1C8:  CMP  #$B9
$C1CA:  BCC  loc_C1DD
$C1CC:  CMP  #$D6
$C1CE:  BCS  loc_C1DD
$C1D0:  LDA  #$D6
$C1D2:  STA  $0105,X
$C1D5:  LDA  #$00
$C1D7:  JSR  sub_C12F
$C1DA:  JMP  loc_C1EF

loc_C1DD:
$C1DD:  CMP  #$E9
$C1DF:  BCC  loc_C1EF
$C1E1:  CMP  #$FF
$C1E3:  BCS  loc_C1EF
$C1E5:  LDA  #$FF
$C1E7:  STA  $0105,X
$C1EA:  LDA  #$10
$C1EC:  JSR  sub_C12F

loc_C1EF:
$C1EF:  INC  $050C
$C1F2:  TSX  
$C1F3:  LDA  $0105,X
$C1F6:  STA  $10
$C1F8:  LDA  $0106,X
$C1FB:  STA  $11
$C1FD:  LDY  #$00
$C1FF:  LDA  ($10),Y

; ============================================
; NMI HANDLER ($C15A)
; ============================================

NMI_main:
$C15A:  PHA  
$C15B:  TXA  
$C15C:  PHA  
$C15D:  TYA  
$C15E:  PHA  
$C15F:  LDA  $1F
$C161:  BMI  loc_C181
$C163:  TSX  
$C164:  LDY  $0106,X
$C167:  INY  
$C168:  BNE  loc_C181
$C16A:  LDA  $0105,X
$C16D:  CMP  #$77
$C16F:  BCC  loc_C181
$C171:  CMP  #$81
$C173:  BCS  loc_C181
$C175:  LDA  PPUSTATUS
$C178:  JSR  sub_C222
$C17B:  JSR  sub_C303
$C17E:  JSR  sub_C2EA

loc_C181:
$C181:  TSX  
$C182:  LDY  $0106,X
$C185:  INY  
$C186:  BNE  loc_C19B
$C188:  LDA  $0105,X
$C18B:  CMP  #$AB
$C18D:  BCC  loc_C19B
$C18F:  CMP  #$D6
$C191:  BCS  loc_C19B
$C193:  LDA  #$D6
$C195:  STA  $0105,X
$C198:  JSR  init_subroutine

loc_C19B:
$C19B:  LDA  $0519
$C19E:  BNE  loc_C1B0
$C1A0:  INC  $C221
$C1A3:  LDA  #$10
$C1A5:  JSR  sub_C12F
$C1A8:  LDA  #$10
$C1AA:  JSR  sub_C12F
$C1AD:  JSR  sub_C019

loc_C1B0:
$C1B0:  LDA  current_bank
$C1B3:  JSR  sub_FF91
$C1B6:  NOP  
$C1B7:  NOP  
$C1B8:  NOP  
$C1B9:  NOP  
$C1BA:  NOP  
$C1BB:  NOP  
$C1BC:  NOP  
$C1BD:  TSX  
$C1BE:  LDA  $0106,X
$C1C1:  CMP  #$6C
$C1C3:  BNE  loc_C1EF
$C1C5:  LDA  $0105,X
$C1C8:  CMP  #$B9
$C1CA:  BCC  loc_C1DD
$C1CC:  CMP  #$D6
$C1CE:  BCS  loc_C1DD
$C1D0:  LDA  #$D6
$C1D2:  STA  $0105,X
$C1D5:  LDA  #$00
$C1D7:  JSR  sub_C12F
$C1DA:  JMP  loc_C1EF

loc_C1DD:
$C1DD:  CMP  #$E9
$C1DF:  BCC  loc_C1EF
$C1E1:  CMP  #$FF
$C1E3:  BCS  loc_C1EF
$C1E5:  LDA  #$FF
$C1E7:  STA  $0105,X
$C1EA:  LDA  #$10
$C1EC:  JSR  sub_C12F

loc_C1EF:
$C1EF:  INC  $050C
$C1F2:  TSX  
$C1F3:  LDA  $0105,X
$C1F6:  STA  $10
$C1F8:  LDA  $0106,X
$C1FB:  STA  $11
$C1FD:  LDY  #$00
$C1FF:  LDA  ($10),Y
$C201:  AND  #$0F
$C203:  CMP  #$07
$C205:  BEQ  loc_C219
$C207:  CMP  #$0F
$C209:  BEQ  loc_C219
$C20B:  CMP  #$03
$C20D:  BEQ  loc_C219
$C20F:  CMP  #$0B
$C211:  BEQ  loc_C219
$C213:  PLA  
$C214:  TAY  
$C215:  PLA  
$C216:  TAX  
$C217:  PLA  
$C218:  RTI  

loc_C219:
$C219:  PLA  
$C21A:  TAY  
$C21B:  PLA  
$C21C:  TAX  
$C21D:  PLA  
$C21E:  JMP  IRQ_handler
$C221:  .byte $80

sub_C222:
$C222:  LDA  $1F
$C224:  AND  #$20
$C226:  BNE  loc_C23A
$C228:  LDA  $1F
$C22A:  AND  #$10
$C22C:  BEQ  loc_C231
$C22E:  JMP  loc_C297

loc_C231:
$C231:  LDA  $1F
$C233:  AND  #$04
$C235:  BEQ  loc_C276
$C237:  JMP  loc_C315

loc_C23A:
$C23A:  LDX  #$00
$C23C:  LDA  $050B
$C23F:  BEQ  loc_C276

loc_C241:
$C241:  LDY  #$01
$C243:  LDA  $0300,X
$C246:  BPL  loc_C25C
$C248:  TAY  
$C249:  LSR  A
$C24A:  LSR  A
$C24B:  LSR  A
$C24C:  LSR  A
$C24D:  AND  #$04
$C24F:  ORA  $0505
$C252:  STA  PPUCTRL
$C255:  TYA  
$C256:  INX  
$C257:  LDY  $0300,X
$C25A:  AND  #$3F

loc_C25C:
$C25C:  INX  
$C25D:  STA  PPUADDR
$C260:  LDA  $0300,X
$C263:  INX  
$C264:  STA  PPUADDR

loc_C267:
$C267:  LDA  $0300,X
$C26A:  INX  
$C26B:  STA  PPUDATA
$C26E:  DEY  
$C26F:  BNE  loc_C267
$C271:  DEC  $050B
$C274:  BNE  loc_C241

loc_C276:
$C276:  LDA  $0506
$C279:  AND  #$08
$C27B:  BEQ  loc_C296
$C27D:  LDA  #$3F
$C27F:  STA  PPUADDR
$C282:  LDA  #$00
$C284:  STA  PPUADDR
$C287:  STA  $050A
$C28A:  LDA  $05FC
$C28D:  STA  PPUDATA
$C290:  LDA  $1F
$C292:  AND  #$DF
$C294:  STA  $1F

loc_C296:
$C296:  RTS  

loc_C297:
$C297:  LDX  #$00

loc_C299:
$C299:  LDA  $0300,X
$C29C:  STA  PPUADDR
$C29F:  LDA  $0301,X
$C2A2:  STA  PPUADDR
$C2A5:  PHA  
$C2A6:  LDA  $0302,X
$C2A9:  STA  PPUDATA
$C2AC:  LDA  $0303,X
$C2AF:  STA  PPUDATA
$C2B2:  LDA  $0300,X
$C2B5:  STA  PPUADDR
$C2B8:  PLA  
$C2B9:  CLC  
$C2BA:  ADC  #$20
$C2BC:  STA  PPUADDR
$C2BF:  LDA  $0304,X
$C2C2:  STA  PPUDATA
$C2C5:  LDA  $0305,X
$C2C8:  STA  PPUDATA
$C2CB:  LDA  $0306,X
$C2CE:  STA  PPUADDR
$C2D1:  LDA  $0307,X
$C2D4:  STA  PPUADDR
$C2D7:  LDA  $0308,X
$C2DA:  STA  PPUDATA
$C2DD:  TXA  
$C2DE:  CLC  
$C2DF:  ADC  #$09
$C2E1:  TAX  
$C2E2:  DEC  $050B
$C2E5:  BNE  loc_C299
$C2E7:  JMP  loc_C276

sub_C2EA:
$C2EA:  LDA  $0505
$C2ED:  STA  PPUCTRL
$C2F0:  LDA  $0506
$C2F3:  STA  PPUMASK
$C2F6:  LDA  $0508
$C2F9:  STA  PPUSCROLL
$C2FC:  LDA  $0509
$C2FF:  STA  PPUSCROLL

; ============================================
; IRQ HANDLER ($C408)
; ============================================

IRQ_handler:
$C408:  SEI  
$C409:  PHP  
$C40A:  BIT  APU_STATUS
$C40D:  STA  $20
$C40F:  STX  $21
$C411:  STY  $22
$C413:  TSX  
$C414:  LDA  $0103,X
$C417:  SEC  
$C418:  SBC  #$01
$C41A:  STA  $26
$C41C:  LDA  $0104,X
$C41F:  SBC  #$00
$C421:  STA  $27
$C423:  LDY  #$01
$C425:  LDA  ($26),Y
$C427:  PHA  
$C428:  AND  #$0F
$C42A:  CMP  #$0B
$C42C:  BEQ  loc_C463
$C42E:  CMP  #$03
$C430:  BEQ  loc_C460
$C432:  PLA  
$C433:  PHA  
$C434:  AND  #$08
$C436:  CMP  #$08
$C438:  PLA  
$C439:  ROR  A
$C43A:  LSR  A
$C43B:  LSR  A
$C43C:  LSR  A
$C43D:  STA  $23
$C43F:  DEY  
$C440:  LDA  ($26),Y
$C442:  BMI  loc_C451
$C444:  STA  $24
$C446:  LDY  $22
$C448:  LDX  $21
$C44A:  PLP  
$C44B:  PLA  
$C44C:  LDA  $20
$C44E:  JMP  loc_C38B

loc_C451:
$C451:  AND  #$3F
$C453:  STA  $24
$C455:  LDY  $22
$C457:  LDX  $21
$C459:  PLP  
$C45A:  PLA  
$C45B:  LDA  $20
$C45D:  JMP  loc_C3CE

loc_C460:
$C460:  JMP  loc_C4F8

loc_C463:
$C463:  PLA  
$C464:  CMP  #$CB
$C466:  BCC  loc_C484
$C468:  CMP  #$FB
$C46A:  BCC  loc_C4A1
$C46C:  LDA  #$19
$C46E:  STA  $23
$C470:  LDA  #$03
$C472:  STA  $24
$C474:  DEY  
$C475:  LDA  ($26),Y
$C477:  STA  $20
$C479:  LDY  $22
$C47B:  LDX  $21
$C47D:  PLP  
$C47E:  PLA  
$C47F:  LDA  $20
$C481:  JMP  loc_C38B

loc_C484:
$C484:  PHA  
$C485:  LDA  #$16
$C487:  STA  $23
$C489:  LDA  #$04
$C48B:  STA  $24
$C48D:  DEY  
$C48E:  PLA  
$C48F:  LSR  A
$C490:  LSR  A
$C491:  LSR  A
$C492:  LSR  A
$C493:  TAX  
$C494:  LDA  ($26),Y
$C496:  STA  $20
$C498:  LDY  $22
$C49A:  PLP  
$C49B:  PLA  
$C49C:  LDA  $20
$C49E:  JMP  loc_C38B

loc_C4A1:
$C4A1:  PLP  
$C4A2:  PHA  
$C4A3:  TSX  
$C4A4:  INC  $0103,X
$C4A7:  BNE  loc_C4AC
$C4A9:  INC  $0104,X

loc_C4AC:
$C4AC:  PLA  
$C4AD:  PLP  
$C4AE:  CMP  #$CB
$C4B0:  BEQ  loc_C4CA
$C4B2:  CMP  #$DB
$C4B4:  BEQ  loc_C4E1
$C4B6:  DEY  
$C4B7:  LDA  ($26),Y
$C4B9:  TAX  
$C4BA:  INY  
$C4BB:  INY  
$C4BC:  LDA  $627B,X
$C4BF:  AND  ($26),Y
$C4C1:  PHP  
$C4C2:  LDX  $21
$C4C4:  LDY  $22
$C4C6:  LDA  $20
$C4C8:  PLP  
$C4C9:  RTS  

loc_C4CA:
$C4CA:  DEY  
$C4CB:  LDA  ($26),Y
$C4CD:  TAX  
$C4CE:  INY  
$C4CF:  INY  
$C4D0:  LDA  $627B,X
$C4D3:  ORA  ($26),Y
$C4D5:  STA  $627B,X
$C4D8:  PHP  
$C4D9:  LDX  $21
$C4DB:  LDY  $22
$C4DD:  LDA  $20
$C4DF:  PLP  
$C4E0:  RTS  

loc_C4E1:
$C4E1:  DEY  
$C4E2:  LDA  ($26),Y
$C4E4:  TAX  
$C4E5:  INY  
$C4E6:  INY  
$C4E7:  LDA  $627B,X
$C4EA:  AND  ($26),Y
$C4EC:  STA  $627B,X
$C4EF:  PHP  
$C4F0:  LDX  $21
$C4F2:  LDY  $22
$C4F4:  LDA  $20
$C4F6:  PLP  
$C4F7:  RTS  

loc_C4F8:
$C4F8:  INY  
$C4F9:  LDA  ($26),Y
$C4FB:  STA  $78
$C4FD:  DEY  
$C4FE:  DEY  
$C4FF:  LDA  ($26),Y
$C501:  STA  $76
$C503:  PLA  
$C504:  STA  $77
$C506:  AND  #$F0
$C508:  LSR  A
$C509:  LSR  A
$C50A:  LSR  A
$C50B:  LSR  A
$C50C:  CMP  #$0A
$C50E:  BCC  loc_C516
$C510:  CMP  #$0D
$C512:  BCS  loc_C527
$C514:  ADC  #$18

loc_C516:
$C516:  STA  $24
$C518:  LDA  #$10

loc_C51A:
$C51A:  STA  $23
$C51C:  LDY  $22
$C51E:  LDX  $21
$C520:  PLP  
$C521:  PLA  
$C522:  LDA  $20
$C524:  JMP  loc_C38B

loc_C527:
$C527:  SBC  #$0C
$C529:  STA  $24
$C52B:  LDA  #$12
$C52D:  BNE  loc_C51A
$C52F:  LDA  #$00
$C531:  STA  $1F
$C533:  STA  $050A
$C536:  STA  $050B
$C539:  STA  $0508
$C53C:  STA  $0509
$C53F:  STA  $0513
$C542:  RTS  

sub_C543:
$C543:  LDA  #$F7
$C545:  LDX  #$00

loc_C547:
$C547:  STA  $0200,X
$C54A:  INX  
$C54B:  BNE  loc_C547
$C54D:  RTS  
$C54E:  JSR  sub_C5AF

; ============================================
; MAIN GAME LOOP AREA ($C900-$CA00)
; ============================================
$C900:  ASL  $40,X
$C902:  LSR  A
$C903:  BCS  loc_C906
$C905:  LSR  A

loc_C906:
$C906:  ROR  $14,X
$C908:  DEY  
$C909:  BNE  loc_C8FF
$C90B:  RTS  

loc_C90C:
$C90C:  JSR  sub_FF74
$C90F:  DEX  
$C910:  BNE  loc_C90C
$C912:  RTS  
$C913:  TXA  
$C914:  PHA  
$C915:  TYA  
$C916:  PHA  
$C917:  JSR  sub_C91F
$C91A:  PLA  
$C91B:  TAY  
$C91C:  PLA  
$C91D:  TAX  
$C91E:  RTS  

sub_C91F:
$C91F:  LDA  $1F
$C921:  AND  #$C8
$C923:  BNE  loc_C94A
$C925:  LDA  $0513
$C928:  AND  #$01
$C92A:  TAX  
$C92B:  LDA  $C94B,X
$C92E:  PHA  
$C92F:  LDA  $C94C,X
$C932:  LDX  #$40
$C934:  JSR  sub_C94E
$C937:  LDX  #$10
$C939:  PLA  
$C93A:  JSR  sub_C94E
$C93D:  LDX  $0513
$C940:  INX  
$C941:  CPX  #$0A
$C943:  BCC  loc_C947
$C945:  LDX  #$00

loc_C947:
$C947:  STX  $0513

loc_C94A:
$C94A:  RTS  
$C94B:  BNE  loc_C8ED
$C94D:  BVS  loc_C8F7
$C94F:  LDA  #$30
$C951:  STA  $10

loc_C953:
$C953:  LDA  $0200,X
$C956:  PHA  
$C957:  LDA  $0200,Y
$C95A:  STA  $0200,X
$C95D:  PLA  
$C95E:  STA  $0200,Y
$C961:  INX  
$C962:  INY  
$C963:  DEC  $10
$C965:  BNE  loc_C953
$C967:  RTS  

loc_C968:
$C968:  JSR  sub_C983
$C96B:  JSR  sub_C52F
$C96E:  BRK  
$C96F:  .byte $0B
$C970:  .byte $BF
$C971:  BRK  
$C972:  ORA  $002F
$C975:  .byte $0C
$C976:  .byte $EF
$C977:  BRK  
$C978:  .byte $34
$C979:  .byte $EF
$C97A:  BRK  
$C97B:  .byte $22
$C97C:  .byte $EF

loc_C97D:
$C97D:  JSR  sub_C9ED
$C980:  JMP  loc_C97D

sub_C983:
$C983:  LDX  #$5D

loc_C985:
$C985:  LDA  $C98F,X
$C988:  STA  $6CAD,X
$C98B:  DEX  
$C98C:  BPL  loc_C985
$C98E:  RTS  
$C98F:  PHP  
$C990:  LDA  current_bank
$C993:  STA  $07CC
$C996:  LDA  #$0F
$C998:  STA  current_bank
$C99B:  NOP  
$C99C:  NOP  
$C99D:  LDA  #$00
$C99F:  STA  ppuctrl_shadow
$C9A2:  STA  $39
$C9A4:  STA  $BFFF
$C9A7:  LSR  A
$C9A8:  STA  $BFFF
$C9AB:  LSR  A
$C9AC:  STA  $BFFF
$C9AF:  LSR  A
$C9B0:  STA  $BFFF
$C9B3:  LSR  A
$C9B4:  STA  $BFFF
$C9B7:  NOP  
$C9B8:  NOP  
$C9B9:  LDA  $07CA
$C9BC:  PLP  
$C9BD:  JSR  sub_0000
$C9C0:  PHP  
$C9C1:  STA  $07CA
$C9C4:  LDA  #$10
$C9C6:  STA  ppuctrl_shadow
$C9C9:  STA  $39
$C9CB:  NOP  
$C9CC:  NOP  
$C9CD:  STA  $BFFF
$C9D0:  LSR  A
$C9D1:  STA  $BFFF
$C9D4:  LSR  A
$C9D5:  STA  $BFFF
$C9D8:  LSR  A
$C9D9:  STA  $BFFF
$C9DC:  LSR  A
$C9DD:  STA  $BFFF
$C9E0:  NOP  
$C9E1:  NOP  
$C9E2:  LDA  $07CC
$C9E5:  JSR  sub_FF91
$C9E8:  LDA  $07CA
$C9EB:  PLP  
$C9EC:  RTS  

sub_C9ED:
$C9ED:  JSR  sub_CBB4
$C9F0:  JSR  sub_CB98
$C9F3:  JSR  sub_CA21
$C9F6:  JSR  sub_D542
$C9F9:  JSR  sub_E06E
$C9FC:  BRK  
$C9FD:  BRK  
$C9FE:  .byte $DF
$C9FF:  JSR  sub_C001

; ============================================
; UTILITY ROUTINES ($FF00-$FFFF)
; ============================================
$FF00:  .byte $03
$FF01:  .byte $03
$FF02:  DEX  
$FF03:  BPL  loc_FEFF
$FF05:  LDA  #$0F
$FF07:  JSR  sub_C118
$FF0A:  INC  $050B
$FF0D:  JMP  loc_C626
$FF10:  LDY  #$02
$FF12:  LDX  #$00

loc_FF14:
$FF14:  NOP  
$FF15:  DEX  
$FF16:  BNE  loc_FF14
$FF18:  DEY  
$FF19:  BNE  loc_FF14

loc_FF1B:
$FF1B:  BIT  PPUSTATUS
$FF1E:  BVC  loc_FF1B
$FF20:  LDA  $7B
$FF22:  STA  PPUSCROLL
$FF25:  LDA  #$80
$FF27:  STA  PPUSCROLL
$FF2A:  LDY  #$01
$FF2C:  LDX  #$00

loc_FF2E:
$FF2E:  NOP  
$FF2F:  DEX  
$FF30:  BNE  loc_FF2E
$FF32:  DEY  
$FF33:  BNE  loc_FF2E
$FF35:  LDA  $7C
$FF37:  STA  PPUSCROLL
$FF3A:  LDA  #$00
$FF3C:  STA  PPUSCROLL
$FF3F:  LDA  $7F
$FF41:  AND  #$03
$FF43:  BNE  loc_FF4C
$FF45:  LDA  $7B
$FF47:  CLC  
$FF48:  ADC  #$01
$FF4A:  STA  $7B

loc_FF4C:
$FF4C:  LDA  $7F
$FF4E:  AND  #$01
$FF50:  BNE  loc_FF59
$FF52:  LDA  $7C
$FF54:  CLC  
$FF55:  ADC  #$01
$FF57:  STA  $7C

loc_FF59:
$FF59:  INC  $7F
$FF5B:  JMP  sub_FF74
$FF5E:  ORA  ($02,X)
$FF60:  .byte $04
$FF61:  PHP  
$FF62:  BPL  loc_FF84
$FF64:  RTI  
$FF65:  .byte $80
$FF66:  .byte $FF
$FF67:  .byte $FF
$FF68:  .byte $FF
$FF69:  .byte $FF
$FF6A:  .byte $FF
$FF6B:  .byte $FF
$FF6C:  .byte $FF
$FF6D:  .byte $FF
$FF6E:  .byte $FF
$FF6F:  .byte $FF
$FF70:  .byte $FF
$FF71:  .byte $FF
$FF72:  .byte $FF
$FF73:  .byte $FF

sub_FF74:
$FF74:  LDA  $050C

loc_FF77:
$FF77:  NOP  
$FF78:  NOP  
$FF79:  INC  $12
$FF7B:  CMP  $050C
$FF7E:  BEQ  loc_FF77
$FF80:  NOP  
$FF81:  NOP  
$FF82:  JSR  sub_C913
$FF85:  RTS  
$FF86:  .byte $FF
$FF87:  .byte $FF
$FF88:  .byte $FF
$FF89:  .byte $FF
$FF8A:  .byte $FF
$FF8B:  .byte $FF
$FF8C:  .byte $FF
$FF8D:  .byte $FF
$FF8E:  JMP  main_init

sub_FF91:
$FF91:  STA  current_bank
$FF94:  PHA  
$FF95:  LDA  ppuctrl_shadow
$FF98:  AND  #$EF
$FF9A:  STA  ppuctrl_shadow
$FF9D:  PLA  
$FF9E:  PHA  
$FF9F:  AND  #$10
$FFA1:  ORA  ppuctrl_shadow
$FFA4:  STA  ppuctrl_shadow
$FFA7:  PLA  
$FFA8:  AND  #$0F
$FFAA:  NOP  
$FFAB:  NOP  
$FFAC:  STA  sub_FFFF
$FFAF:  LSR  A
$FFB0:  STA  sub_FFFF
$FFB3:  LSR  A
$FFB4:  STA  sub_FFFF
$FFB7:  LSR  A
$FFB8:  STA  sub_FFFF
$FFBB:  LSR  A
$FFBC:  STA  sub_FFFF
$FFBF:  LDA  ppuctrl_shadow
$FFC2:  STA  $BFFF
$FFC5:  LSR  A
$FFC6:  STA  $BFFF
$FFC9:  LSR  A
$FFCA:  STA  $BFFF
$FFCD:  LSR  A
$FFCE:  STA  $BFFF
$FFD1:  LSR  A
$FFD2:  STA  $BFFF
$FFD5:  NOP  
$FFD6:  NOP  
$FFD7:  RTS  
