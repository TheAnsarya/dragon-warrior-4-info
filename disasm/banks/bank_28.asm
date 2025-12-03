; Dragon Warrior IV - Bank 28 Disassembly
; ROM Offset: $70010 - $7400F
; CPU Address: $8000-$BFFF (when mapped)
; ======================================================================

    .byte $5A            ; $8000
    TYA                     ; $8001: 98
    .byte $C7            ; $8002
    STX $C7,Y               ; $8003: 96 C7
    .byte $97            ; $8005
    BCC $7FA0               ; $8006: 90 98
    BRK                     ; $8008: 00
    BRK                     ; $8009: 00
    BRK                     ; $800A: 00
    BRK                     ; $800B: 00
    BRK                     ; $800C: 00
    BRK                     ; $800D: 00
    .byte $5F            ; $800E
    LDA $9EA6               ; $800F: AD A6 9E
    .byte $B3            ; $8012
    TYA                     ; $8013: 98
    LSR $2C80               ; $8014: 4E 80 2C
    .byte $80            ; $8017
    .byte $1A            ; $8018
    STY $1A                 ; $8019: 84 1A
    TXA                     ; $801B: 8A
    .byte $1A            ; $801C
    STA $17                 ; $801D: 85 17
    .byte $89            ; $801F
    .byte $13            ; $8020
    .byte $87            ; $8021
    .byte $12            ; $8022
    .byte $82            ; $8023
    .byte $12            ; $8024
    .byte $82            ; $8025
    .byte $1A            ; $8026
    BRK                     ; $8027: 00
    BRK                     ; $8028: 00
    BRK                     ; $8029: 00
    .byte $9E            ; $802A
    .byte $B2            ; $802B
    ORA (tmp1,X)            ; $802C: 01 01
    ORA (tmp1,X)            ; $802E: 01 01
    ORA (tmp1,X)            ; $8030: 01 01
    ORA (tmp1,X)            ; $8032: 01 01
    ORA (tmp1,X)            ; $8034: 01 01
    ORA ($16,X)             ; $8036: 01 16
    ORA (ptr0_lo,X)         ; $8038: 01 04
    ASL ptr0_lo             ; $803A: 06 04
    .byte $03            ; $803C
    ORA (tmp3,X)            ; $803D: 01 03
    ORA ($07,X)             ; $803F: 01 07
    .byte $04            ; $8041
    .byte $07            ; $8042
    .byte $03            ; $8043
    .byte $02            ; $8044
    BRK                     ; $8045: 00
    .byte $03            ; $8046
    BPL $804B               ; $8047: 10 02
    ORA $0F                 ; $8049: 05 0F
    ORA (tmp2,X)            ; $804B: 01 02
    ASL $0201,X             ; $804D: 1E 01 02
    .byte $03            ; $8050
    .byte $04            ; $8051
    ORA $06                 ; $8052: 05 06
    .byte $07            ; $8054
    PHP                     ; $8055: 08
    ORA #$0A                ; $8056: 09 0A
    .byte $0B            ; $8058
    .byte $12            ; $8059
    .byte $43            ; $805A
    ORA ($46,X)             ; $805B: 01 46
    ORA $43,X               ; $805D: 15 43
    .byte $13            ; $805F
    ORA ($1E,X)             ; $8060: 01 1E
    ORA (ptr_hi,X)          ; $8062: 01 11
    DEY                     ; $8064: 88
    .byte $27            ; $8065
    ORA ($25,X)             ; $8066: 01 25
    .byte $03            ; $8068
    CLC                     ; $8069: 18
    DEY                     ; $806A: 88
    .byte $03            ; $806B
    .byte $43            ; $806C
    .byte $2B            ; $806D
    ORA ($86,X)             ; $806E: 01 86
    ASL                     ; $8070: 0A
    .byte $1F            ; $8071
    ORA $4403,X             ; $8072: 1D 03 44
    .byte $13            ; $8075
    .byte $43            ; $8076
    .byte $23            ; $8077
    .byte $02            ; $8078
    STA ($0F,X)             ; $8079: 81 0F
    .byte $0F            ; $807B
    .byte $0F            ; $807C
    .byte $0F            ; $807D
    .byte $22            ; $807E
    ORA ($81,X)             ; $807F: 01 81
    .byte $82            ; $8081
    ORA tmp1,X              ; $8082: 15 01
    .byte $2F            ; $8084
    ASL $0314               ; $8085: 0E 14 03
    .byte $14            ; $8088
    ORA (system_flags,X)    ; $8089: 01 1F
    .byte $13            ; $808B
    .byte $0F            ; $808C
    .byte $14            ; $808D
    ORA ($12,X)             ; $808E: 01 12
    .byte $0F            ; $8090
    .byte $0F            ; $8091
    .byte $0F            ; $8092
    ASL                     ; $8093: 0A
    .byte $1B            ; $8094
    .byte $82            ; $8095
    ORA ($0A),Y             ; $8096: 11 0A
    STX $23                 ; $8098: 86 23
    .byte $02            ; $809A
    AND $47                 ; $809B: 25 47
    .byte $03            ; $809D
    .byte $2F            ; $809E
    AND #$8B                ; $809F: 29 8B
    CLC                     ; $80A1: 18
    ORA ($16,X)             ; $80A2: 01 16
    STA $12                 ; $80A4: 85 12
    ROL tmp1                ; $80A6: 26 01
    AND ($81,X)             ; $80A8: 21 81
    PLP                     ; $80AA: 28
    EOR ($0F,X)             ; $80AB: 41 0F
    .byte $0F            ; $80AD
    .byte $0F            ; $80AE
    .byte $0F            ; $80AF
    .byte $4F            ; $80B0
    .byte $0F            ; $80B1
    .byte $14            ; $80B2
    .byte $44            ; $80B3
    ORA ($42),Y             ; $80B4: 11 42
    .byte $0C            ; $80B6
    STY $13                 ; $80B7: 84 13
    EOR #$14                ; $80B9: 49 14
    .byte $4B            ; $80BB
    .byte $22            ; $80BC
    STA tmp1                ; $80BD: 85 01
    STA ($12,X)             ; $80BF: 81 12
    STA (ptr_hi,X)          ; $80C1: 81 11
    EOR ($21,X)             ; $80C3: 41 21
    PHP                     ; $80C5: 08
    PLP                     ; $80C6: 28
    .byte $22            ; $80C7
    .byte $0F            ; $80C8
    .byte $22            ; $80C9
    ORA ($21,X)             ; $80CA: 01 21
    ORA ($21,X)             ; $80CC: 01 21
    ORA ($21,X)             ; $80CE: 01 21
    ORA ($21,X)             ; $80D0: 01 21
    ORA ($21,X)             ; $80D2: 01 21
    ORA ($21,X)             ; $80D4: 01 21
    ORA ($21,X)             ; $80D6: 01 21
    ORA ($21,X)             ; $80D8: 01 21
    ORA ($21,X)             ; $80DA: 01 21
    ORA ($21,X)             ; $80DC: 01 21
    ORA ($21,X)             ; $80DE: 01 21
    ORA ($21,X)             ; $80E0: 01 21
    ORA ($21,X)             ; $80E2: 01 21
    ORA ($21,X)             ; $80E4: 01 21
    .byte $02            ; $80E6
    .byte $17            ; $80E7
    BRK                     ; $80E8: 00
    BRK                     ; $80E9: 00
    ROL $8C08,X             ; $80EA: 3E 08 8C
    STA $15                 ; $80ED: 85 15
    .byte $07            ; $80EF
    AND $0C                 ; $80F0: 25 0C
    ORA $060C               ; $80F2: 0D 0C 06
    .byte $82            ; $80F5
    ORA tmp1                ; $80F6: 05 01
    STA ($8A,X)             ; $80F8: 81 8A
    EOR $0501,X             ; $80FA: 5D 01 05
    ORA (tmp1,X)            ; $80FD: 01 01
    ORA ($24,X)             ; $80FF: 01 24
    .byte $0C            ; $8101
    ASL tmp3,X              ; $8102: 16 03
    .byte $17            ; $8104
    BRK                     ; $8105: 00
    JSR $08E4               ; $8106: 20 E4 08
    .byte $89            ; $8109
    STA $2429,Y             ; $810A: 99 29 24
    ORA #$12                ; $810D: 09 12
    .byte $03            ; $810F
    ASL $06                 ; $8110: 06 06
    ASL $24                 ; $8112: 06 24
    ORA $0312               ; $8114: 0D 12 03
    ORA $06                 ; $8117: 05 06
    ASL $24                 ; $8119: 06 24
    ORA $030D               ; $811B: 0D 0D 03
    ASL $06                 ; $811E: 06 06
    BRK                     ; $8120: 00
    BRK                     ; $8121: 00
    TXA                     ; $8122: 8A
    ASL $0012,X             ; $8123: 1E 12 00
    BRK                     ; $8126: 00
    ORA $82                 ; $8127: 05 82
    PHP                     ; $8129: 08
    ORA ($81,X)             ; $812A: 01 81
    ASL $8A                 ; $812C: 06 8A
    .byte $5C            ; $812E
    ORA (tmp1,X)            ; $812F: 01 01
    BIT $0D                 ; $8131: 24 0D
    ORA $9703,Y             ; $8133: 19 03 97
    BRK                     ; $8136: 00
    BRK                     ; $8137: 00
    STY $08,X               ; $8138: 94 08
    STY $0499               ; $813A: 8C 99 04
    BIT $0C                 ; $813D: 24 0C
    ORA tmp3                ; $813F: 05 03
    .byte $97            ; $8141
    BRK                     ; $8142: 00
    BRK                     ; $8143: 00
    TYA                     ; $8144: 98
    PHP                     ; $8145: 08
    STA $0399               ; $8146: 8D 99 03
    STY $3D                 ; $8149: 84 3D
    STA ($97,X)             ; $814B: 81 97
    BRK                     ; $814D: 00
    BRK                     ; $814E: 00
    DEY                     ; $814F: 88
    PHP                     ; $8150: 08
    STX $0399               ; $8151: 8E 99 03
    STY $3D                 ; $8154: 84 3D
    STA ($97,X)             ; $8156: 81 97
    BRK                     ; $8158: 00
    BRK                     ; $8159: 00
    STY $8C08               ; $815A: 8C 08 8C
    TXS                     ; $815D: 9A
    .byte $03            ; $815E
    STY $3D                 ; $815F: 84 3D
    STA ($97,X)             ; $8161: 81 97
    BRK                     ; $8163: 00
    BRK                     ; $8164: 00
    .byte $80            ; $8165
    PHP                     ; $8166: 08
    STA $039A               ; $8167: 8D 9A 03
    STY $3D                 ; $816A: 84 3D
    STA ($97,X)             ; $816C: 81 97
    BRK                     ; $816E: 00
    BRK                     ; $816F: 00
    BCC $817A               ; $8170: 90 08
    .byte $8F            ; $8172
    TXS                     ; $8173: 9A
    .byte $03            ; $8174
    STY $3D                 ; $8175: 84 3D
    STA ($97,X)             ; $8177: 81 97
    BRK                     ; $8179: 00
    BRK                     ; $817A: 00
    STY $08                 ; $817B: 84 08
    STX $039A               ; $817D: 8E 9A 03
    STY $3D                 ; $8180: 84 3D
    STA (tmp0,X)            ; $8182: 81 00
    .byte $17            ; $8184
    BRK                     ; $8185: 00
    BPL $818E               ; $8186: 10 06
    PHP                     ; $8188: 08
    .byte $8F            ; $8189
    .byte $93            ; $818A
    ORA #$2E                ; $818B: 09 2E
    .byte $0F            ; $818D
    ORA $8A2A,Y             ; $818E: 19 2A 8A
    SEC                     ; $8191: 38
    .byte $22            ; $8192
    ORA ($2A),Y             ; $8193: 11 2A
    .byte $17            ; $8195
    BRK                     ; $8196: 00
    BPL $819B               ; $8197: 10 02
    PHP                     ; $8199: 08
    BCC $812F               ; $819A: 90 93
    .byte $0F            ; $819C
    ROL $1510               ; $819D: 2E 10 15
    ROL                     ; $81A0: 2A
    ORA ($8A,X)             ; $81A1: 01 8A
    .byte $37            ; $81A3
    ROL $1910               ; $81A4: 2E 10 19
    ROL                     ; $81A7: 2A
    ROL $45                 ; $81A8: 26 45
    .byte $03            ; $81AA
    ROL                     ; $81AB: 2A
    .byte $17            ; $81AC
    PHP                     ; $81AD: 08
    BPL $81B9               ; $81AE: 10 09
    ROR                     ; $81B0: 6A
    STX $099A               ; $81B1: 8E 9A 09
    ROL $1910               ; $81B4: 2E 10 19
    ROL                     ; $81B7: 2A
    TXA                     ; $81B8: 8A
    SEC                     ; $81B9: 38
    .byte $22            ; $81BA
    .byte $12            ; $81BB
    ROL                     ; $81BC: 2A
    .byte $17            ; $81BD
    PHP                     ; $81BE: 08
    BPL $81CC               ; $81BF: 10 0B
    ROR                     ; $81C1: 6A
    STA ($9A),Y             ; $81C2: 91 9A
    .byte $03            ; $81C4
    TXA                     ; $81C5: 8A
    ROL $2A,X               ; $81C6: 36 2A
    .byte $17            ; $81C8
    BRK                     ; $81C9: 00
    BRK                     ; $81CA: 00
    ROL $08                 ; $81CB: 26 08
    .byte $8F            ; $81CD
    TYA                     ; $81CE: 98
    PHP                     ; $81CF: 08
    BIT $0E                 ; $81D0: 24 0E
    .byte $17            ; $81D2
    .byte $03            ; $81D3
    .byte $23            ; $81D4
    STA (tmp1,X)            ; $81D5: 81 01
    .byte $2F            ; $81D7
    .byte $17            ; $81D8
    BRK                     ; $81D9: 00
    BRK                     ; $81DA: 00
    ROL $08                 ; $81DB: 26 08
    BCC $8177               ; $81DD: 90 98
    PHP                     ; $81DF: 08
    BIT ptr_hi              ; $81E0: 24 11
    .byte $17            ; $81E2
    .byte $03            ; $81E3
    .byte $23            ; $81E4
    .byte $83            ; $81E5
    ORA ($2F,X)             ; $81E6: 01 2F
    .byte $17            ; $81E8
    BRK                     ; $81E9: 00
    BRK                     ; $81EA: 00
    ROL $08                 ; $81EB: 26 08
    STA ($98),Y             ; $81ED: 91 98
    ASL tmp1                ; $81EF: 06 01
    ORA ($23,X)             ; $81F1: 01 23
    .byte $83            ; $81F3
    ORA ($2F,X)             ; $81F4: 01 2F
    .byte $17            ; $81F6
    BRK                     ; $81F7: 00
    BRK                     ; $81F8: 00
    ROL $08                 ; $81F9: 26 08
    STA ($96),Y             ; $81FB: 91 96
    .byte $03            ; $81FD
    STY $F0                 ; $81FE: 84 F0
    STA ($17,X)             ; $8200: 81 17
    BRK                     ; $8202: 00
    BRK                     ; $8203: 00
    ROL $08                 ; $8204: 26 08
    STX $0798               ; $8206: 8E 98 07
    ORA (tmp1,X)            ; $8209: 01 01
    BPL $8230               ; $820B: 10 23
    STA (tmp1,X)            ; $820D: 81 01
    .byte $2F            ; $820F
    .byte $17            ; $8210
    BRK                     ; $8211: 00
    BRK                     ; $8212: 00
    ROL $08                 ; $8213: 26 08
    STX $0396               ; $8215: 8E 96 03
    STY $09                 ; $8218: 84 09
    .byte $82            ; $821A
    .byte $17            ; $821B
    BRK                     ; $821C: 00
    BRK                     ; $821D: 00
    ROL $08                 ; $821E: 26 08
    .byte $8F            ; $8220
    STX $08,Y               ; $8221: 96 08
    BIT $0E                 ; $8223: 24 0E
    ORA tmp3,X              ; $8225: 15 03
    .byte $23            ; $8227
    STA (tmp1,X)            ; $8228: 81 01
    .byte $2F            ; $822A
    .byte $17            ; $822B
    BRK                     ; $822C: 00
    BRK                     ; $822D: 00
    ROL $08                 ; $822E: 26 08
    BCC $81C8               ; $8230: 90 96
    PHP                     ; $8232: 08
    BIT ptr_hi              ; $8233: 24 11
    ORA tmp3,X              ; $8235: 15 03
    .byte $23            ; $8237
    .byte $83            ; $8238
    ORA ($2F,X)             ; $8239: 01 2F
    BRK                     ; $823B: 00
    .byte $1F            ; $823C
    ASL                     ; $823D: 0A
    BRK                     ; $823E: 00
    .byte $43            ; $823F
    .byte $83            ; $8240
    STY $85                 ; $8241: 84 85
    BRK                     ; $8243: 00
    BRK                     ; $8244: 00
    .byte $1F            ; $8245
    ROR                     ; $8246: 6A
    BRK                     ; $8247: 00
    AND ($88),Y             ; $8248: 31 88
    .byte $22            ; $824A
    .byte $07            ; $824B
    BRK                     ; $824C: 00
    BRK                     ; $824D: 00
    .byte $1F            ; $824E
    ASL                     ; $824F: 0A
    ROR $1D                 ; $8250: 66 1D
    .byte $87            ; $8252
    LDA ($87,X)             ; $8253: A1 87
    ORA ($2B,X)             ; $8255: 01 2B
    ORA ($2A,X)             ; $8257: 01 2A
    BRK                     ; $8259: 00
    .byte $17            ; $825A
    PHP                     ; $825B: 08
    BPL $8263               ; $825C: 10 05
    .byte $5C            ; $825E
    STA ($84,X)             ; $825F: 81 84
    ORA $23                 ; $8261: 05 23
    STA (tmp1,X)            ; $8263: 81 01
    .byte $83            ; $8265
    SBC $0817,X             ; $8266: FD 17 08
    JSR $5D1B               ; $8269: 20 1B 5D
    STA $82                 ; $826C: 85 82
    .byte $1A            ; $826E
    .byte $82            ; $826F
    ASL tmp1                ; $8270: 06 01
    STA ($23,X)             ; $8272: 81 23
    STA ($82,X)             ; $8274: 81 82
    .byte $02            ; $8276
    ORA ($81,X)             ; $8277: 01 81
    .byte $23            ; $8279
    .byte $83            ; $827A
    .byte $82            ; $827B
    PHP                     ; $827C: 08
    ORA ($81,X)             ; $827D: 01 81
    .byte $23            ; $827F
    STA ($82,X)             ; $8280: 81 82
    .byte $04            ; $8282
    ORA ($81,X)             ; $8283: 01 81
    .byte $23            ; $8285
    .byte $83            ; $8286
    .byte $83            ; $8287
    INX                     ; $8288: E8
    .byte $17            ; $8289
    PHP                     ; $828A: 08
    BPL $82A8               ; $828B: 10 1B
    LSR $8287,X             ; $828D: 5E 87 82
    ORA $23                 ; $8290: 05 23
    .byte $83            ; $8292
    ORA ($83,X)             ; $8293: 01 83
    SBC $0817,X             ; $8295: FD 17 08
    BPL $82B5               ; $8298: 10 1B
    .byte $5F            ; $829A
    STA $84                 ; $829B: 85 84
    ORA $23                 ; $829D: 05 23
    .byte $83            ; $829F
    ORA ($83,X)             ; $82A0: 01 83
    SBC $0817,X             ; $82A2: FD 17 08
    BPL $82C2               ; $82A5: 10 1B
    .byte $4F            ; $82A7
    .byte $83            ; $82A8
    TXA                     ; $82A9: 8A
    .byte $12            ; $82AA
    BIT tmp1                ; $82AB: 24 01
    ASL                     ; $82AD: 0A
    .byte $03            ; $82AE
    BIT tmp1                ; $82AF: 24 01
    ORA #$03                ; $82B1: 09 03
    BIT ptr0_hi             ; $82B3: 24 05
    ORA #$03                ; $82B5: 09 03
    BIT ptr0_hi             ; $82B7: 24 05
    ASL                     ; $82B9: 0A
    .byte $03            ; $82BA
    .byte $83            ; $82BB
    BEQ $82D5               ; $82BC: F0 17
    PHP                     ; $82BE: 08
    BPL $82D4               ; $82BF: 10 13
    LSR $8A84               ; $82C1: 4E 84 8A
    .byte $12            ; $82C4
    BIT tmp1                ; $82C5: 24 01
    ASL                     ; $82C7: 0A
    .byte $03            ; $82C8
    BIT tmp1                ; $82C9: 24 01
    ORA #$03                ; $82CB: 09 03
    BIT ptr0_hi             ; $82CD: 24 05
    ORA #$03                ; $82CF: 09 03
    BIT ptr0_hi             ; $82D1: 24 05
    ASL                     ; $82D3: 0A
    .byte $03            ; $82D4
    .byte $83            ; $82D5
    BEQ $82EF               ; $82D6: F0 17
    PHP                     ; $82D8: 08
    BRK                     ; $82D9: 00
    ASL $60,X               ; $82DA: 16 60
    STA $8C                 ; $82DC: 85 8C
    BRK                     ; $82DE: 00
    .byte $17            ; $82DF
    PHP                     ; $82E0: 08
    BRK                     ; $82E1: 00
    .byte $1B            ; $82E2
    EOR $918C,Y             ; $82E3: 59 8C 91
    .byte $12            ; $82E6
    BIT $0B                 ; $82E7: 24 0B
    ORA (tmp3),Y            ; $82E9: 11 03
    BIT $0B                 ; $82EB: 24 0B
    BPL $82F2               ; $82ED: 10 03
    BIT $0C                 ; $82EF: 24 0C
    BPL $82F6               ; $82F1: 10 03
    BIT $0C                 ; $82F3: 24 0C
    ORA (tmp3),Y            ; $82F5: 11 03
    .byte $83            ; $82F7
    BEQ $8311               ; $82F8: F0 17
    PHP                     ; $82FA: 08
    BRK                     ; $82FB: 00
    AND ($62,X)             ; $82FC: 21 62
    .byte $89            ; $82FE
    .byte $97            ; $82FF
    BRK                     ; $8300: 00
    .byte $17            ; $8301
    PHP                     ; $8302: 08
    BPL $831D               ; $8303: 10 18
    .byte $57            ; $8305
    .byte $97            ; $8306
    TXS                     ; $8307: 9A
    .byte $0C            ; $8308
    TXA                     ; $8309: 8A
    .byte $33            ; $830A
    BIT $0E                 ; $830B: 24 0E
    .byte $13            ; $830D
    .byte $03            ; $830E
    BIT $0E                 ; $830F: 24 0E
    .byte $12            ; $8311
    .byte $03            ; $8312
    ASL $2A                 ; $8313: 06 2A
    .byte $17            ; $8315
    .byte $04            ; $8316
    .byte $80            ; $8317
    .byte $9E            ; $8318
    .byte $0B            ; $8319
    STY $98,X               ; $831A: 94 98
    ORA ($2B,X)             ; $831C: 01 2B
    .byte $17            ; $831E
    PHP                     ; $831F: 08
    BRK                     ; $8320: 00
    .byte $22            ; $8321
    ADC ($91,X)             ; $8322: 61 91
    .byte $92            ; $8324
    BRK                     ; $8325: 00
    .byte $17            ; $8326
    PHP                     ; $8327: 08
    .byte $80            ; $8328
    ROL $5B                 ; $8329: 26 5B
    .byte $93            ; $832B
    STY $2B01               ; $832C: 8C 01 2B
    .byte $17            ; $832F
    BRK                     ; $8330: 00
    BRK                     ; $8331: 00
    .byte $32            ; $8332
    ORA $99                 ; $8333: 05 99
    .byte $83            ; $8335
    BRK                     ; $8336: 00
    .byte $17            ; $8337
    BRK                     ; $8338: 00
    BRK                     ; $8339: 00
    .byte $22            ; $833A
    .byte $03            ; $833B
    STA ($83),Y             ; $833C: 91 83
    BRK                     ; $833E: 00
    .byte $17            ; $833F
    BRK                     ; $8340: 00
    BRK                     ; $8341: 00
    .byte $22            ; $8342
    ORA ($8F,X)             ; $8343: 01 8F
    .byte $83            ; $8345
    BRK                     ; $8346: 00
    .byte $17            ; $8347
    PHP                     ; $8348: 08
    BRK                     ; $8349: 00
    .byte $12            ; $834A
    .byte $5A            ; $834B
    .byte $8B            ; $834C
    BCC $8361               ; $834D: 90 12
    BIT $0C                 ; $834F: 24 0C
    BPL $8356               ; $8351: 10 03
    BIT $0C                 ; $8353: 24 0C
    ORA (tmp3),Y            ; $8355: 11 03
    BIT $0B                 ; $8357: 24 0B
    ORA (tmp3),Y            ; $8359: 11 03
    BIT $0B                 ; $835B: 24 0B
    BPL $8362               ; $835D: 10 03
    .byte $83            ; $835F
    BEQ $8379               ; $8360: F0 17
    PHP                     ; $8362: 08
    BPL $837D               ; $8363: 10 18
    EOR $9A96,Y             ; $8365: 59 96 9A
    ORA ($8A),Y             ; $8368: 11 8A
    .byte $33            ; $836A
    BIT $0D                 ; $836B: 24 0D
    .byte $13            ; $836D
    .byte $03            ; $836E
    BIT $0C                 ; $836F: 24 0C
    .byte $13            ; $8371
    .byte $03            ; $8372
    BIT $0C                 ; $8373: 24 0C
    ORA (tmp3),Y            ; $8375: 11 03
    TXA                     ; $8377: 8A
    AND $2A,X               ; $8378: 35 2A
    .byte $17            ; $837A
    PHP                     ; $837B: 08
    BRK                     ; $837C: 00
    .byte $12            ; $837D
    CLI                     ; $837E: 58
    STA $0092               ; $837F: 8D 92 00
    .byte $17            ; $8382
    PHP                     ; $8383: 08
    BRK                     ; $8384: 00
    .byte $1B            ; $8385
    .byte $57            ; $8386
    STX $0092               ; $8387: 8E 92 00
    BRK                     ; $838A: 00
    .byte $5A            ; $838B
    BRK                     ; $838C: 00
    BPL $83C2               ; $838D: 10 33
    ORA $83                 ; $838F: 05 83
    TYA                     ; $8391: 98
    .byte $32            ; $8392
    .byte $07            ; $8393
    ORA ptr_hi,X            ; $8394: 15 11
    ROL $1708               ; $8396: 2E 08 17
    ROL                     ; $8399: 2A
    BIT ptr0_lo             ; $839A: 24 04
    CLC                     ; $839C: 18
    .byte $03            ; $839D
    BIT ptr0_lo             ; $839E: 24 04
    .byte $17            ; $83A0
    .byte $03            ; $83A1
    BIT $06                 ; $83A2: 24 06
    .byte $17            ; $83A4
    .byte $03            ; $83A5
    ROL                     ; $83A6: 2A
    BRK                     ; $83A7: 00
    .byte $1F            ; $83A8
    BRK                     ; $83A9: 00
    BRK                     ; $83AA: 00
    .byte $22            ; $83AB
    ASL $91                 ; $83AC: 06 91
    STY $0000               ; $83AE: 8C 00 00
    .byte $1C            ; $83B1
    BRK                     ; $83B2: 00
    BRK                     ; $83B3: 00
    ORA $F0,X               ; $83B4: 15 F0
    STA ($84),Y             ; $83B6: 91 84
    ROR $EF                 ; $83B8: 66 EF
    BRK                     ; $83BA: 00
    BRK                     ; $83BB: 00
    .byte $1B            ; $83BC
    JSR $1920               ; $83BD: 20 20 19
    .byte $F2            ; $83C0
    TXS                     ; $83C1: 9A
    .byte $14            ; $83C2
    .byte $0F            ; $83C3
    .byte $03            ; $83C4
    .byte $02            ; $83C5
    AND $0011               ; $83C6: 2D 11 00
    .byte $1A            ; $83C9
    JSR $1E00               ; $83CA: 20 00 1E
    SBC ($9B),Y             ; $83CD: F1 9B
    ORA $1D                 ; $83CF: 05 1D
    .byte $1B            ; $83D1
    ASL tmp0                ; $83D2: 06 00
    BRK                     ; $83D4: 00
    .byte $1A            ; $83D5
    ASL                     ; $83D6: 0A
    .byte $14            ; $83D7
    .byte $54            ; $83D8
    STX $9B                 ; $83D9: 86 9B
    STA $56,X               ; $83DB: 95 56
    ORA $07,X               ; $83DD: 15 07
    .byte $02            ; $83DF
    AND $0111               ; $83E0: 2D 11 01
    .byte $2B            ; $83E3
    CLC                     ; $83E4: 18
    JSR $6600               ; $83E5: 20 00 66
    .byte $EF            ; $83E8
    .byte $92            ; $83E9
    .byte $03            ; $83EA
    ORA $F0,X               ; $83EB: 15 F0
    .byte $0F            ; $83ED
    .byte $04            ; $83EE
    BRK                     ; $83EF: 00
    BRK                     ; $83F0: 00
    .byte $17            ; $83F1
    PHP                     ; $83F2: 08
    .byte $80            ; $83F3
    .byte $12            ; $83F4
    .byte $89            ; $83F5
    .byte $97            ; $83F6
    STY tmp1                ; $83F7: 84 01
    .byte $2B            ; $83F9
    .byte $17            ; $83FA
    BRK                     ; $83FB: 00
    BRK                     ; $83FC: 00
    .byte $22            ; $83FD
    ORA ($9C,X)             ; $83FE: 01 9C
    .byte $8B            ; $8400
    BRK                     ; $8401: 00
    .byte $17            ; $8402
    BRK                     ; $8403: 00
    BRK                     ; $8404: 00
    AND (tmp2,X)            ; $8405: 21 02
    .byte $93            ; $8407
    STX tmp0,Y              ; $8408: 96 00
    BRK                     ; $840A: 00
    .byte $17            ; $840B
    PHP                     ; $840C: 08
    .byte $80            ; $840D
    ROR $63                 ; $840E: 66 63
    .byte $83            ; $8410
    .byte $82            ; $8411
    ORA ($2B,X)             ; $8412: 01 2B
    .byte $17            ; $8414
    PHP                     ; $8415: 08
    RTI                     ; $8416: 40
    .byte $5A            ; $8417
    AND #$9C                ; $8418: 29 9C
    .byte $82            ; $841A
    ORA ($2B,X)             ; $841B: 01 2B
    BRK                     ; $841D: 00
    .byte $17            ; $841E
    BRK                     ; $841F: 00
    BRK                     ; $8420: 00
    .byte $32            ; $8421
    ORA $85                 ; $8422: 05 85
    STY tmp0,X              ; $8424: 94 00
    .byte $17            ; $8426
    BRK                     ; $8427: 00
    BRK                     ; $8428: 00
    .byte $22            ; $8429
    ORA ($8D,X)             ; $842A: 01 8D
    STX tmp0,Y              ; $842C: 96 00
    .byte $17            ; $842E
    BRK                     ; $842F: 00
    BRK                     ; $8430: 00
    .byte $23            ; $8431
    .byte $02            ; $8432
    TYA                     ; $8433: 98
    STA tmp0,X              ; $8434: 95 00
    .byte $17            ; $8436
    PHP                     ; $8437: 08
    .byte $80            ; $8438
    ASL $9664,X             ; $8439: 1E 64 96
    STY $2B01               ; $843C: 8C 01 2B
    .byte $17            ; $843F
    BRK                     ; $8440: 00
    .byte $80            ; $8441
    ROL $19                 ; $8442: 26 19
    .byte $93            ; $8444
    .byte $97            ; $8445
    ORA ($2B,X)             ; $8446: 01 2B
    .byte $17            ; $8448
    PHP                     ; $8449: 08
    BRK                     ; $844A: 00
    .byte $12            ; $844B
    ROR $A0                 ; $844C: 66 A0
    STA tmp0,X              ; $844E: 95 00
    .byte $57            ; $8450
    BRK                     ; $8451: 00
    BPL $8475               ; $8452: 10 21
    ORA $969F               ; $8454: 0D 9F 96
    ORA ($2E),Y             ; $8457: 11 2E
    .byte $1F            ; $8459
    .byte $1B            ; $845A
    ROL                     ; $845B: 2A
    BIT system_flags        ; $845C: 24 1F
    ORA $8A03,Y             ; $845E: 19 03 8A
    .byte $13            ; $8461
    BIT system_flags        ; $8462: 24 1F
    ASL tmp3,X              ; $8464: 16 03
    ORA $83                 ; $8466: 05 83
    SBC ($17),Y             ; $8468: F1 17
    PHP                     ; $846A: 08
    .byte $80            ; $846B
    .byte $12            ; $846C
    ADC $9D                 ; $846D: 65 9D
    STA $2B01,X             ; $846F: 9D 01 2B
    .byte $17            ; $8472
    BRK                     ; $8473: 00
    BRK                     ; $8474: 00
    ASL $18,X               ; $8475: 16 18
    .byte $93            ; $8477
    LDA tmp0                ; $8478: A5 00
    .byte $17            ; $847A
    BRK                     ; $847B: 00
    BRK                     ; $847C: 00
    .byte $23            ; $847D
    ASL $95                 ; $847E: 06 95
    LDA (tmp0,X)            ; $8480: A1 00
    .byte $17            ; $8482
    BRK                     ; $8483: 00
    RTS                     ; $8484: 60
    ASL $A20E,X             ; $8485: 1E 0E A2
    LDY $3A                 ; $8488: A4 3A
    .byte $82            ; $848A
    ASL tmp1                ; $848B: 06 01
    STA ($24,X)             ; $848D: 81 24
    JSR $0324               ; $848F: 20 24 03
    BIT $20                 ; $8492: 24 20
    AND tmp3                ; $8494: 25 03
    BIT $1D                 ; $8496: 24 1D
    AND tmp3                ; $8498: 25 03
    BIT $1D                 ; $849A: 24 1D
    .byte $23            ; $849C
    .byte $03            ; $849D
    BIT $1A                 ; $849E: 24 1A
    .byte $23            ; $84A0
    .byte $03            ; $84A1
    BIT $1A                 ; $84A2: 24 1A
    AND tmp3                ; $84A4: 25 03
    .byte $82            ; $84A6
    ASL tmp1                ; $84A7: 06 01
    STA ($24,X)             ; $84A9: 81 24
    .byte $1A            ; $84AB
    .byte $23            ; $84AC
    .byte $03            ; $84AD
    BIT $1D                 ; $84AE: 24 1D
    .byte $23            ; $84B0
    .byte $03            ; $84B1
    BIT $1D                 ; $84B2: 24 1D
    AND tmp3                ; $84B4: 25 03
    BIT $20                 ; $84B6: 24 20
    AND tmp3                ; $84B8: 25 03
    BIT $20                 ; $84BA: 24 20
    BIT tmp3                ; $84BC: 24 03
    BIT $22                 ; $84BE: 24 22
    BIT tmp3                ; $84C0: 24 03
    .byte $83            ; $84C2
    INY                     ; $84C3: C8
    .byte $17            ; $84C4
    PHP                     ; $84C5: 08
    BMI $84DE               ; $84C6: 30 16
    EOR ($86,X)             ; $84C8: 41 86
    .byte $9C            ; $84CA
    ORA ($2B,X)             ; $84CB: 01 2B
    BRK                     ; $84CD: 00
    .byte $17            ; $84CE
    PHP                     ; $84CF: 08
    .byte $80            ; $84D0
    .byte $1A            ; $84D1
    .byte $67            ; $84D2
    .byte $93            ; $84D3
    STY tmp1                ; $84D4: 84 01
    .byte $2B            ; $84D6
    .byte $17            ; $84D7
    PHP                     ; $84D8: 08
    BRK                     ; $84D9: 00
    ORA ($68),Y             ; $84DA: 11 68
    STA ($83,X)             ; $84DC: 81 83
    BRK                     ; $84DE: 00
    .byte $17            ; $84DF
    PHP                     ; $84E0: 08
    BRK                     ; $84E1: 00
    .byte $2B            ; $84E2
    ADC #$83                ; $84E3: 69 83
    .byte $83            ; $84E5
    BRK                     ; $84E6: 00
    BRK                     ; $84E7: 00
    .byte $17            ; $84E8
    BRK                     ; $84E9: 00
    BRK                     ; $84EA: 00
    ASL $08                 ; $84EB: 06 08
    .byte $8F            ; $84ED
    .byte $93            ; $84EE
    BRK                     ; $84EF: 00
    .byte $17            ; $84F0
    BRK                     ; $84F1: 00
    BRK                     ; $84F2: 00
    .byte $02            ; $84F3
    PHP                     ; $84F4: 08
    BCC $848A               ; $84F5: 90 93
    BRK                     ; $84F7: 00
    .byte $17            ; $84F8
    BRK                     ; $84F9: 00
    BRK                     ; $84FA: 00
    AND $08                 ; $84FB: 25 08
    ASL $0098               ; $84FD: 0E 98 00
    .byte $17            ; $8500
    BRK                     ; $8501: 00
    BRK                     ; $8502: 00
    AND $08                 ; $8503: 25 08
    ASL $0097               ; $8505: 0E 97 00
    .byte $17            ; $8508
    BRK                     ; $8509: 00
    BRK                     ; $850A: 00
    AND $08                 ; $850B: 25 08
    ASL $0096               ; $850D: 0E 96 00
    .byte $17            ; $8510
    BRK                     ; $8511: 00
    BRK                     ; $8512: 00
    AND $08                 ; $8513: 25 08
    ASL $0095               ; $8515: 0E 95 00
    .byte $17            ; $8518
    BRK                     ; $8519: 00
    BRK                     ; $851A: 00
    .byte $27            ; $851B
    PHP                     ; $851C: 08
    ORA ($95),Y             ; $851D: 11 95
    BRK                     ; $851F: 00
    .byte $17            ; $8520
    BRK                     ; $8521: 00
    BRK                     ; $8522: 00
    .byte $27            ; $8523
    PHP                     ; $8524: 08
    ORA ($96),Y             ; $8525: 11 96
    BRK                     ; $8527: 00
    .byte $17            ; $8528
    BRK                     ; $8529: 00
    BRK                     ; $852A: 00
    .byte $27            ; $852B
    PHP                     ; $852C: 08
    ORA ($97),Y             ; $852D: 11 97
    BRK                     ; $852F: 00
    .byte $17            ; $8530
    BRK                     ; $8531: 00
    BRK                     ; $8532: 00
    .byte $27            ; $8533
    PHP                     ; $8534: 08
    ORA ($98),Y             ; $8535: 11 98
    BRK                     ; $8537: 00
    .byte $17            ; $8538
    BRK                     ; $8539: 00
    BRK                     ; $853A: 00
    ORA #$08                ; $853B: 09 08
    ASL $009A               ; $853D: 0E 9A 00
    .byte $17            ; $8540
    BRK                     ; $8541: 00
    BRK                     ; $8542: 00
    .byte $0B            ; $8543
    PHP                     ; $8544: 08
    ORA ($9A),Y             ; $8545: 11 9A
    BRK                     ; $8547: 00
    .byte $17            ; $8548
    BRK                     ; $8549: 00
    JSR $08FC               ; $854A: 20 FC 08
    BCC $84E5               ; $854D: 90 96
    .byte $1C            ; $854F
    BIT ptr_lo              ; $8550: 24 10
    .byte $14            ; $8552
    .byte $03            ; $8553
    .byte $82            ; $8554
    ASL tmp1                ; $8555: 06 01
    STA ($23,X)             ; $8557: 81 23
    .byte $82            ; $8559
    ORA ($24,X)             ; $855A: 01 24
    ORA ($14),Y             ; $855C: 11 14
    .byte $03            ; $855E
    .byte $23            ; $855F
    .byte $83            ; $8560
    .byte $82            ; $8561
    PHP                     ; $8562: 08
    ORA ($81,X)             ; $8563: 01 81
    .byte $12            ; $8565
    BIT ptr_lo              ; $8566: 24 10
    .byte $14            ; $8568
    .byte $03            ; $8569
    ASL $2A                 ; $856A: 06 2A
    .byte $17            ; $856C
    BRK                     ; $856D: 00
    JSR $08E4               ; $856E: 20 E4 08
    .byte $8F            ; $8571
    STX $14,Y               ; $8572: 96 14
    .byte $82            ; $8574
    ORA #$01                ; $8575: 09 01
    STA ($24,X)             ; $8577: 81 24
    BPL $8591               ; $8579: 10 16
    .byte $03            ; $857B
    BIT ptr_lo              ; $857C: 24 10
    .byte $14            ; $857E
    .byte $03            ; $857F
    .byte $82            ; $8580
    ORA tmp1                ; $8581: 05 01
    STA ($24,X)             ; $8583: 81 24
    .byte $0F            ; $8585
    AND (tmp3,X)            ; $8586: 21 03
    BRK                     ; $8588: 00
    ORA $0060,X             ; $8589: 1D 60 00
    ORA $30,X               ; $858C: 15 30
    .byte $22            ; $858E
    .byte $03            ; $858F
    PHP                     ; $8590: 08
    BRK                     ; $8591: 00
    BRK                     ; $8592: 00
    ASL $0000,X             ; $8593: 1E 00 00
    .byte $43            ; $8596
    .byte $F3            ; $8597
    STY $85                 ; $8598: 84 85
    .byte $42            ; $859A
    BRK                     ; $859B: 00
    BRK                     ; $859C: 00
    BRK                     ; $859D: 00
    .byte $1F            ; $859E
    BRK                     ; $859F: 00
    BRK                     ; $85A0: 00
    .byte $32            ; $85A1
    AND $988B               ; $85A2: 2D 8B 98
    BRK                     ; $85A5: 00
    BRK                     ; $85A6: 00
    .byte $1F            ; $85A7
    BRK                     ; $85A8: 00
    BRK                     ; $85A9: 00
    .byte $22            ; $85AA
    ASL $88                 ; $85AB: 06 88
    TAY                     ; $85AD: A8
    BRK                     ; $85AE: 00
    BRK                     ; $85AF: 00
    .byte $1F            ; $85B0
    BRK                     ; $85B1: 00
    BRK                     ; $85B2: 00
    ORA ($EA),Y             ; $85B3: 11 EA
    .byte $93            ; $85B5
    LDA tmp0                ; $85B6: A5 00
    BRK                     ; $85B8: 00
    .byte $1F            ; $85B9
    BRK                     ; $85BA: 00
    BRK                     ; $85BB: 00
    .byte $1F            ; $85BC
    INX                     ; $85BD: E8
    STY $9F,X               ; $85BE: 94 9F
    BRK                     ; $85C0: 00
    BRK                     ; $85C1: 00
    .byte $1C            ; $85C2
    BRK                     ; $85C3: 00
    BRK                     ; $85C4: 00
    .byte $67            ; $85C5
    CPX $A595               ; $85C6: EC 95 A5
    .byte $07            ; $85C9
    .byte $EB            ; $85CA
    BRK                     ; $85CB: 00
    BRK                     ; $85CC: 00
    .byte $1B            ; $85CD
    BRK                     ; $85CE: 00
    RTS                     ; $85CF: 60
    ASL $8BE9               ; $85D0: 0E E9 8B
    STY $17                 ; $85D3: 84 17
    ORA $2B01,Y             ; $85D5: 19 01 2B
    BRK                     ; $85D8: 00
    .byte $1A            ; $85D9
    BRK                     ; $85DA: 00
    BRK                     ; $85DB: 00
    ASL $2E,X               ; $85DC: 16 2E
    STY $A4,X               ; $85DE: 94 A4
    .byte $17            ; $85E0
    .byte $03            ; $85E1
    AND (tmp0,X)            ; $85E2: 21 00
    BRK                     ; $85E4: 00
    CLC                     ; $85E5: 18
    BRK                     ; $85E6: 00
    BRK                     ; $85E7: 00
    .byte $22            ; $85E8
    .byte $02            ; $85E9
    STY $9A                 ; $85EA: 84 9A
    AND ($ED,X)             ; $85EC: 21 ED
    .byte $02            ; $85EE
    AND (tmp0,X)            ; $85EF: 21 00
    BRK                     ; $85F1: 00
    CLC                     ; $85F2: 18
    .byte $22            ; $85F3
    BRK                     ; $85F4: 00
    .byte $07            ; $85F5
    .byte $EB            ; $85F6
    STY $6522               ; $85F7: 8C 22 65
    .byte $2B            ; $85FA
    .byte $17            ; $85FB
    AND #$00                ; $85FC: 29 00
    BRK                     ; $85FE: 00
    CLC                     ; $85FF: 18
    .byte $22            ; $8600
    BRK                     ; $8601: 00
    .byte $1A            ; $8602
    .byte $E7            ; $8603
    STX $1928               ; $8604: 8E 28 19
    .byte $2B            ; $8607
    .byte $14            ; $8608
    ORA $0000,X             ; $8609: 1D 00 00
    BRK                     ; $860C: 00
    .byte $1F            ; $860D
    ROR                     ; $860E: 6A
    ORA ($2B),Y             ; $860F: 11 2B
    BCS $8614               ; $8611: B0 01
    ORA $2E0C               ; $8613: 0D 0C 2E
    ORA $0D                 ; $8616: 05 0D
    .byte $2F            ; $8618
    .byte $23            ; $8619
    ORA tmp1                ; $861A: 05 01
    BIT tmp3                ; $861C: 24 03
    ORA $2A03               ; $861E: 0D 03 2A
    .byte $0C            ; $8621
    ROL $0D05               ; $8622: 2E 05 0D
    .byte $2F            ; $8625
    .byte $23            ; $8626
    ORA tmp1                ; $8627: 05 01
    BIT tmp3                ; $8629: 24 03
    ORA $2A03               ; $862B: 0D 03 2A
    .byte $1F            ; $862E
    ASL                     ; $862F: 0A
    BRK                     ; $8630: 00
    PLP                     ; $8631: 28
    BCS $8634               ; $8632: B0 00
    BPL $8636               ; $8634: 10 00
    BRK                     ; $8636: 00
    ORA $8009,Y             ; $8637: 19 09 80
    .byte $12            ; $863A
    SBC ($88,X)             ; $863B: E1 88
    STX $BD                 ; $863D: 86 BD
    ORA tmp2                ; $863F: 05 02
    ORA ($2B,X)             ; $8641: 01 2B
    BRK                     ; $8643: 00
    CLC                     ; $8644: 18
    ORA #$00                ; $8645: 09 00
    ASL                     ; $8647: 0A
    CPX #$83                ; $8648: E0 83
    .byte $82            ; $864A
    PHP                     ; $864B: 08
    LDA (tmp3),Y            ; $864C: B1 03
    .byte $04            ; $864E
    BRK                     ; $864F: 00
    BRK                     ; $8650: 00
    CLC                     ; $8651: 18
    ORA #$30                ; $8652: 09 30
    .byte $64            ; $8654
    LDX $868D               ; $8655: AE 8D 86
    ROR $BC                 ; $8658: 66 BC
    .byte $02            ; $865A
    .byte $02            ; $865B
    .byte $2F            ; $865C
    .byte $82            ; $865D
    ASL tmp1                ; $865E: 06 01
    STA ($24,X)             ; $8660: 81 24
    .byte $0B            ; $8662
    ASL tmp3                ; $8663: 06 03
    BIT $0B                 ; $8665: 24 0B
    ORA #$03                ; $8667: 09 03
    ORA $30                 ; $8669: 05 30
    BCC $8699               ; $866B: 90 2C
    ASL                     ; $866D: 0A
    ASL $09                 ; $866E: 06 09
    BIT $06                 ; $8670: 24 06
    ORA #$03                ; $8672: 09 03
    .byte $82            ; $8674
    ASL tmp1                ; $8675: 06 01
    STA ($24,X)             ; $8677: 81 24
    .byte $0B            ; $8679
    ORA #$03                ; $867A: 09 03
    .byte $23            ; $867C
    .byte $83            ; $867D
    ORA ($2C,X)             ; $867E: 01 2C
    ASL                     ; $8680: 0A
    ASL                     ; $8681: 0A
    ORA #$24                ; $8682: 09 24
    .byte $0B            ; $8684
    ASL tmp3                ; $8685: 06 03
    BIT $0D                 ; $8687: 24 0D
    ASL $83                 ; $8689: 06 83
    .byte $D3            ; $868B
    BRK                     ; $868C: 00
    BRK                     ; $868D: 00
    .byte $1F            ; $868E
    ASL                     ; $868F: 0A
    DEY                     ; $8690: 88
    INC $93E2,X             ; $8691: FE E2 93
    STX tmp1                ; $8694: 86 01
    .byte $2B            ; $8696
    ORA ($2B,X)             ; $8697: 01 2B
    BRK                     ; $8699: 00
    .byte $1F            ; $869A
    BRK                     ; $869B: 00
    BRK                     ; $869C: 00
    .byte $32            ; $869D
    ORA $85                 ; $869E: 05 85
    TXA                     ; $86A0: 8A
    BRK                     ; $86A1: 00
    BRK                     ; $86A2: 00
    .byte $1F            ; $86A3
    ASL                     ; $86A4: 0A
    BRK                     ; $86A5: 00
    .byte $2B            ; $86A6
    .byte $D7            ; $86A7
    STA $009A               ; $86A8: 8D 9A 00
    BRK                     ; $86AB: 00
    .byte $1F            ; $86AC
    BRK                     ; $86AD: 00
    BRK                     ; $86AE: 00
    .byte $22            ; $86AF
    ASL $92                 ; $86B0: 06 92
    TYA                     ; $86B2: 98
    BRK                     ; $86B3: 00
    BRK                     ; $86B4: 00
    ASL $800A,X             ; $86B5: 1E 0A 80
    .byte $12            ; $86B8
    TYA                     ; $86B9: 98
    .byte $8B            ; $86BA
    .byte $9B            ; $86BB
    ORA (tmp1),Y            ; $86BC: 11 01
    .byte $2B            ; $86BE
    ORA ($2B,X)             ; $86BF: 01 2B
    ORA $8809,X             ; $86C1: 1D 09 88
    .byte $12            ; $86C4
    DEC $AB,X               ; $86C5: D6 AB
    STY $01A3               ; $86C7: 8C A3 01
    .byte $2B            ; $86CA
    ORA ($2B,X)             ; $86CB: 01 2B
    .byte $1C            ; $86CD
    ORA #$88                ; $86CE: 09 88
    ROR $D9                 ; $86D0: 66 D9
    TXS                     ; $86D2: 9A
    .byte $8F            ; $86D3
    ROL                     ; $86D4: 2A
    ROR                     ; $86D5: 6A
    ORA ($2B,X)             ; $86D6: 01 2B
    BPL $865C               ; $86D8: 10 82
    .byte $04            ; $86DA
    .byte $02            ; $86DB
    STA ($23,X)             ; $86DC: 81 23
    ORA $8201,Y             ; $86DE: 19 01 82
    .byte $02            ; $86E1
    BRK                     ; $86E2: 00
    STA ($23,X)             ; $86E3: 81 23
    .byte $07            ; $86E5
    ORA ($83,X)             ; $86E6: 01 83
    .byte $F2            ; $86E8
    ORA $0801,Y             ; $86E9: 19 01 08
    ASL                     ; $86EC: 0A
    BVS $8685               ; $86ED: 70 96
    TXA                     ; $86EF: 8A
    .byte $A7            ; $86F0
    .byte $17            ; $86F1
    ASL $0100,X             ; $86F2: 1E 00 01
    .byte $2B            ; $86F5
    CLC                     ; $86F6: 18
    ORA ($80,X)             ; $86F7: 01 80
    ASL                     ; $86F9: 0A
    ADC ($85),Y             ; $86FA: 71 85
    .byte $93            ; $86FC
    .byte $23            ; $86FD
    .byte $BB            ; $86FE
    ORA $011C               ; $86FF: 0D 1C 01
    .byte $2B            ; $8702
    BRK                     ; $8703: 00
    CLC                     ; $8704: 18
    ORA ($08,X)             ; $8705: 01 08
    .byte $67            ; $8707
    .byte $03            ; $8708
    .byte $9B            ; $8709
    .byte $9B            ; $870A
    ROR $BA                 ; $870B: 66 BA
    .byte $04            ; $870D
    .byte $0C            ; $870E
    BRK                     ; $870F: 00
    ORA ($2B,X)             ; $8710: 01 2B
    CLC                     ; $8712: 18
    AND #$80                ; $8713: 29 80
    .byte $12            ; $8715
    CLD                     ; $8716: D8
    .byte $97            ; $8717
    .byte $14            ; $8718
    PLP                     ; $8719: 28
    .byte $9F            ; $871A
    .byte $2F            ; $871B
    BRK                     ; $871C: 00
    ORA ($2B,X)             ; $871D: 01 2B
    BRK                     ; $871F: 00
    .byte $17            ; $8720
    BRK                     ; $8721: 00
    BRK                     ; $8722: 00
    .byte $22            ; $8723
    .byte $02            ; $8724
    LDX #$91                ; $8725: A2 91
    BRK                     ; $8727: 00
    .byte $17            ; $8728
    PHP                     ; $8729: 08
    .byte $80            ; $872A
    ASL $95,X               ; $872B: 16 95
    STA $019E,Y             ; $872D: 99 9E 01
    .byte $2B            ; $8730
    .byte $17            ; $8731
    BRK                     ; $8732: 00
    BRK                     ; $8733: 00
    BPL $87AB               ; $8734: 10 75
    STX $9C                 ; $8736: 86 9C
    BRK                     ; $8738: 00
    .byte $17            ; $8739
    BRK                     ; $873A: 00
    RTI                     ; $873B: 40
    ASL                     ; $873C: 0A
    .byte $44            ; $873D
    TAX                     ; $873E: AA
    STY $33,X               ; $873F: 94 33
    BIT $22                 ; $8741: 24 22
    .byte $14            ; $8743
    .byte $03            ; $8744
    BIT $22                 ; $8745: 24 22
    ORA tmp3,X              ; $8747: 15 03
    BIT $1E                 ; $8749: 24 1E
    .byte $13            ; $874B
    .byte $03            ; $874C
    BIT $1D                 ; $874D: 24 1D
    .byte $17            ; $874F
    .byte $03            ; $8750
    BIT $19                 ; $8751: 24 19
    .byte $13            ; $8753
    .byte $03            ; $8754
    BIT $19                 ; $8755: 24 19
    CLC                     ; $8757: 18
    .byte $03            ; $8758
    BIT $15                 ; $8759: 24 15
    .byte $1A            ; $875B
    .byte $03            ; $875C
    BIT $12                 ; $875D: 24 12
    .byte $1A            ; $875F
    .byte $03            ; $8760
    BIT $13                 ; $8761: 24 13
    ORA $2403,X             ; $8763: 1D 03 24
    ORA $031D               ; $8766: 0D 1D 03
    BIT $0D                 ; $8769: 24 0D
    .byte $1B            ; $876B
    .byte $03            ; $876C
    .byte $27            ; $876D
    .byte $80            ; $876E
    .byte $89            ; $876F
    .byte $62            ; $8770
    .byte $23            ; $8771
    .byte $83            ; $8772
    ROL                     ; $8773: 2A
    .byte $17            ; $8774
    BRK                     ; $8775: 00
    BRK                     ; $8776: 00
    .byte $22            ; $8777
    ORA ($8C,X)             ; $8778: 01 8C
    .byte $8F            ; $877A
    BRK                     ; $877B: 00
    BRK                     ; $877C: 00
    .byte $1C            ; $877D
    BRK                     ; $877E: 00
    .byte $04            ; $877F
    ASL                     ; $8780: 0A
    RTI                     ; $8781: 40
    STY $099C               ; $8782: 8C 9C 09
    PLP                     ; $8785: 28
    BRK                     ; $8786: 00
    ASL                     ; $8787: 0A
    BIT ptr_hi              ; $8788: 24 11
    .byte $1C            ; $878A
    .byte $03            ; $878B
    BIT $09                 ; $878C: 24 09
    .byte $1C            ; $878E
    .byte $03            ; $878F
    .byte $83            ; $8790
    SED                     ; $8791: F8
    CLC                     ; $8792: 18
    BRK                     ; $8793: 00
    BRK                     ; $8794: 00
    ASL $923E,X             ; $8795: 1E 3E 92
    .byte $12            ; $8798
    PHP                     ; $8799: 08
    PHP                     ; $879A: 08
    .byte $1A            ; $879B
    .byte $FF            ; $879C
    BRK                     ; $879D: 00
    .byte $0C            ; $879E
    ORA ($24),Y             ; $879F: 11 24
    .byte $80            ; $87A1
    BRK                     ; $87A2: 00
    .byte $03            ; $87A3
    .byte $12            ; $87A4
    ROL $8E                 ; $87A5: 26 8E
    .byte $03            ; $87A7
    TXA                     ; $87A8: 8A
    JMP $182F               ; $87A9: 4C 2F 18
    BRK                     ; $87AC: 00
    ORA ($26,X)             ; $87AD: 01 26
    .byte $3F            ; $87AF
    STA ($12),Y             ; $87B0: 91 12
    PHP                     ; $87B2: 08
    PHP                     ; $87B3: 08
    .byte $1B            ; $87B4
    .byte $FF            ; $87B5
    BRK                     ; $87B6: 00
    .byte $03            ; $87B7
    TXA                     ; $87B8: 8A
    .byte $4B            ; $87B9
    .byte $2F            ; $87BA
    .byte $1F            ; $87BB
    BRK                     ; $87BC: 00
    BRK                     ; $87BD: 00
    ASL                     ; $87BE: 0A
    .byte $3C            ; $87BF
    BCC $874A               ; $87C0: 90 88
    BRK                     ; $87C2: 00
    BRK                     ; $87C3: 00
    ORA $0000,X             ; $87C4: 1D 00 00
    ASL                     ; $87C7: 0A
    AND $8891,X             ; $87C8: 3D 91 88
    .byte $3C            ; $87CB
    BRK                     ; $87CC: 00
    BRK                     ; $87CD: 00
    ORA $8001,Y             ; $87CE: 19 01 80
    ASL $41,X               ; $87D1: 16 41
    .byte $92            ; $87D3
    STA $11BF,Y             ; $87D4: 99 BF 11
    .byte $12            ; $87D7
    ORA ($2B,X)             ; $87D8: 01 2B
    BRK                     ; $87DA: 00
    .byte $0F            ; $87DB
    .byte $04            ; $87DC
    BRK                     ; $87DD: 00
    ASL $12BE,X             ; $87DE: 1E BE 12
    .byte $92            ; $87E1
    BRK                     ; $87E2: 00
    .byte $0F            ; $87E3
    BIT tmp0                ; $87E4: 24 00
    ORA #$AB                ; $87E6: 09 AB
    PHP                     ; $87E8: 08
    .byte $12            ; $87E9
    BRK                     ; $87EA: 00
    BRK                     ; $87EB: 00
    .byte $1F            ; $87EC
    ASL                     ; $87ED: 0A
    .byte $44            ; $87EE
    .byte $6B            ; $87EF
    .byte $DF            ; $87F0
    STA $1B89,Y             ; $87F1: 99 89 1B
    .byte $82            ; $87F4
    .byte $07            ; $87F5
    ORA ($81,X)             ; $87F6: 01 81
    BIT $19                 ; $87F8: 24 19
    PHP                     ; $87FA: 08
    .byte $03            ; $87FB
    BIT $16                 ; $87FC: 24 16
    PHP                     ; $87FE: 08
    .byte $03            ; $87FF
    ORA $82                 ; $8800: 05 82
    .byte $03            ; $8802
    ORA ($81,X)             ; $8803: 01 81
    BIT $19                 ; $8805: 24 19
    PHP                     ; $8807: 08
    .byte $03            ; $8808
    BIT $19                 ; $8809: 24 19
    ORA #$03                ; $880B: 09 03
    .byte $83            ; $880D
    .byte $E7            ; $880E
    .byte $1B            ; $880F
    .byte $82            ; $8810
    .byte $07            ; $8811
    ORA ($81,X)             ; $8812: 01 81
    BIT $19                 ; $8814: 24 19
    PHP                     ; $8816: 08
    .byte $03            ; $8817
    BIT $16                 ; $8818: 24 16
    PHP                     ; $881A: 08
    .byte $03            ; $881B
    ORA $82                 ; $881C: 05 82
    .byte $04            ; $881E
    ORA ($81,X)             ; $881F: 01 81
    BIT $19                 ; $8821: 24 19
    PHP                     ; $8823: 08
    .byte $03            ; $8824
    BIT $19                 ; $8825: 24 19
    ORA #$03                ; $8827: 09 03
    .byte $83            ; $8829
    .byte $E7            ; $882A
    ORA $0009,X             ; $882B: 1D 09 00
    ASL                     ; $882E: 0A
    .byte $AB            ; $882F
    STY $AD8D               ; $8830: 8C 8D AD
    BRK                     ; $8833: 00
    BRK                     ; $8834: 00
    .byte $17            ; $8835
    BRK                     ; $8836: 00
    BRK                     ; $8837: 00
    .byte $02            ; $8838
    .byte $72            ; $8839
    .byte $8B            ; $883A
    TXA                     ; $883B: 8A
    BIT $22                 ; $883C: 24 22
    PHP                     ; $883E: 08
    BIT $0B                 ; $883F: 24 0B
    .byte $0C            ; $8841
    .byte $03            ; $8842
    BIT $0E                 ; $8843: 24 0E
    .byte $0C            ; $8845
    .byte $03            ; $8846
    BIT $0E                 ; $8847: 24 0E
    .byte $0B            ; $8849
    .byte $03            ; $884A
    .byte $23            ; $884B
    STA ($26,X)             ; $884C: 81 26
    LDA (tmp3,X)            ; $884E: A1 03
    .byte $22            ; $8850
    .byte $07            ; $8851
    BIT $0E                 ; $8852: 24 0E
    .byte $0C            ; $8854
    .byte $03            ; $8855
    BIT $0B                 ; $8856: 24 0B
    .byte $0C            ; $8858
    .byte $03            ; $8859
    BIT $0B                 ; $885A: 24 0B
    ASL                     ; $885C: 0A
    .byte $03            ; $885D
    .byte $23            ; $885E
    .byte $82            ; $885F
    ROL                     ; $8860: 2A
    .byte $17            ; $8861
    BRK                     ; $8862: 00
    BRK                     ; $8863: 00
    ROL $8F73               ; $8864: 2E 73 8F
    TXA                     ; $8867: 8A
    BRK                     ; $8868: 00
    .byte $17            ; $8869
    PHP                     ; $886A: 08
    BRK                     ; $886B: 00
    ASL $DE                 ; $886C: 06 DE
    STA $008B               ; $886E: 8D 8B 00
    BRK                     ; $8871: 00
    CLI                     ; $8872: 58
    AND (ptr_lo,X)          ; $8873: 21 10
    .byte $0B            ; $8875
    PHP                     ; $8876: 08
    TXS                     ; $8877: 9A
    ASL                     ; $8878: 0A
    PLP                     ; $8879: 28
    .byte $9F            ; $887A
    .byte $2F            ; $887B
    BRK                     ; $887C: 00
    .byte $07            ; $887D
    TXA                     ; $887E: 8A
    EOR $0103               ; $887F: 4D 03 01
    TXA                     ; $8882: 8A
    LSR $002F               ; $8883: 4E 2F 00
    .byte $17            ; $8886
    BRK                     ; $8887: 00
    .byte $80            ; $8888
    ASL                     ; $8889: 0A
    LSR                     ; $888A: 4A
    STA $93                 ; $888B: 85 93
    ORA ($2B,X)             ; $888D: 01 2B
    .byte $17            ; $888F
    PHP                     ; $8890: 08
    .byte $80            ; $8891
    .byte $12            ; $8892
    LDX $9B8B,Y             ; $8893: BE 8B 9B
    ORA ($2B,X)             ; $8896: 01 2B
    .byte $17            ; $8898
    PHP                     ; $8899: 08
    BRK                     ; $889A: 00
    .byte $2B            ; $889B
    .byte $BF            ; $889C
    STA $009A               ; $889D: 8D 9A 00
    .byte $17            ; $88A0
    BRK                     ; $88A1: 00
    BRK                     ; $88A2: 00
    .byte $22            ; $88A3
    ASL $92                 ; $88A4: 06 92
    TYA                     ; $88A6: 98
    BRK                     ; $88A7: 00
    .byte $17            ; $88A8
    BRK                     ; $88A9: 00
    BRK                     ; $88AA: 00
    .byte $67            ; $88AB
    .byte $03            ; $88AC
    .byte $9B            ; $88AD
    .byte $9B            ; $88AE
    BRK                     ; $88AF: 00
    .byte $17            ; $88B0
    PHP                     ; $88B1: 08
    .byte $80            ; $88B2
    .byte $12            ; $88B3
    LDY $9497,X             ; $88B4: BC 97 94
    ORA ($2B,X)             ; $88B7: 01 2B
    .byte $17            ; $88B9
    PHP                     ; $88BA: 08
    .byte $80            ; $88BB
    .byte $12            ; $88BC
    .byte $9B            ; $88BD
    .byte $AB            ; $88BE
    STY $2B01               ; $88BF: 8C 01 2B
    .byte $17            ; $88C2
    BRK                     ; $88C3: 00
    BRK                     ; $88C4: 00
    .byte $32            ; $88C5
    ORA $85                 ; $88C6: 05 85
    TXA                     ; $88C8: 8A
    BRK                     ; $88C9: 00
    .byte $17            ; $88CA
    PHP                     ; $88CB: 08
    .byte $80            ; $88CC
    ROR $BD                 ; $88CD: 66 BD
    TXS                     ; $88CF: 9A
    .byte $8F            ; $88D0
    ORA ($2B,X)             ; $88D1: 01 2B
    .byte $17            ; $88D3
    BRK                     ; $88D4: 00
    BRK                     ; $88D5: 00
    .byte $22            ; $88D6
    .byte $02            ; $88D7
    LDX #$91                ; $88D8: A2 91
    BRK                     ; $88DA: 00
    .byte $17            ; $88DB
    PHP                     ; $88DC: 08
    .byte $80            ; $88DD
    ASL $95,X               ; $88DE: 16 95
    STA $019E,Y             ; $88E0: 99 9E 01
    .byte $2B            ; $88E3
    .byte $17            ; $88E4
    BRK                     ; $88E5: 00
    BRK                     ; $88E6: 00
    BPL $895E               ; $88E7: 10 75
    STX $9C                 ; $88E9: 86 9C
    BRK                     ; $88EB: 00
    .byte $17            ; $88EC
    BRK                     ; $88ED: 00
    RTI                     ; $88EE: 40
    ASL                     ; $88EF: 0A
    .byte $44            ; $88F0
    TAX                     ; $88F1: AA
    STY $33,X               ; $88F2: 94 33
    BIT $22                 ; $88F4: 24 22
    .byte $14            ; $88F6
    .byte $03            ; $88F7
    BIT $22                 ; $88F8: 24 22
    ORA tmp3,X              ; $88FA: 15 03
    BIT $1E                 ; $88FC: 24 1E
    .byte $13            ; $88FE
    .byte $03            ; $88FF
    BIT $1D                 ; $8900: 24 1D
    .byte $17            ; $8902
    .byte $03            ; $8903
    BIT $19                 ; $8904: 24 19
    .byte $13            ; $8906
    .byte $03            ; $8907
    BIT $19                 ; $8908: 24 19
    CLC                     ; $890A: 18
    .byte $03            ; $890B
    BIT $15                 ; $890C: 24 15
    .byte $1A            ; $890E
    .byte $03            ; $890F
    BIT $12                 ; $8910: 24 12
    .byte $1A            ; $8912
    .byte $03            ; $8913
    BIT $13                 ; $8914: 24 13
    ORA $2403,X             ; $8916: 1D 03 24
    ORA $031D               ; $8919: 0D 1D 03
    BIT $0D                 ; $891C: 24 0D
    .byte $1B            ; $891E
    .byte $03            ; $891F
    .byte $27            ; $8920
    BPL $88A8               ; $8921: 10 85
    .byte $62            ; $8923
    .byte $23            ; $8924
    .byte $83            ; $8925
    ROL                     ; $8926: 2A
    .byte $17            ; $8927
    BRK                     ; $8928: 00
    BRK                     ; $8929: 00
    .byte $22            ; $892A
    ORA ($8C,X)             ; $892B: 01 8C
    .byte $8F            ; $892D
    BRK                     ; $892E: 00
    BRK                     ; $892F: 00
    .byte $9F            ; $8930
    .byte $80            ; $8931
    ORA ($3C),Y             ; $8932: 11 3C
    PHP                     ; $8934: 08
    PHP                     ; $8935: 08
    BRK                     ; $8936: 00
    PHP                     ; $8937: 08
    ROL $88                 ; $8938: 26 88
    .byte $03            ; $893A
    .byte $27            ; $893B
    PHP                     ; $893C: 08
    .byte $87            ; $893D
    .byte $62            ; $893E
    .byte $2F            ; $893F
    .byte $03            ; $8940
    STY $38                 ; $8941: 84 38
    .byte $89            ; $8943
    .byte $1F            ; $8944
    .byte $0F            ; $8945
    .byte $44            ; $8946
    .byte $5A            ; $8947
    .byte $6F            ; $8948
    .byte $97            ; $8949
    .byte $89            ; $894A
    .byte $0C            ; $894B
    .byte $13            ; $894C
    .byte $82            ; $894D
    ORA tmp2                ; $894E: 05 02
    STA ($16,X)             ; $8950: 81 16
    .byte $82            ; $8952
    ORA tmp2                ; $8953: 05 02
    STA ($83,X)             ; $8955: 81 83
    INC tmp3,X              ; $8957: F6 03
    STY $4C                 ; $8959: 84 4C
    .byte $89            ; $895B
    BRK                     ; $895C: 00
    .byte $9F            ; $895D
    .byte $80            ; $895E
    ORA ($3C),Y             ; $895F: 11 3C
    PHP                     ; $8961: 08
    PHP                     ; $8962: 08
    BRK                     ; $8963: 00
    PHP                     ; $8964: 08
    ROL $89                 ; $8965: 26 89
    .byte $03            ; $8967
    .byte $27            ; $8968
    BPL $88F2               ; $8969: 10 87
    .byte $62            ; $896B
    .byte $2F            ; $896C
    .byte $03            ; $896D
    STY $65                 ; $896E: 84 65
    .byte $89            ; $8970
    BRK                     ; $8971: 00
    .byte $1F            ; $8972
    .byte $0F            ; $8973
    ORA ($0A),Y             ; $8974: 11 0A
    .byte $13            ; $8976
    STY $1192               ; $8977: 8C 92 11
    ROL $A9                 ; $897A: 26 A9
    .byte $03            ; $897C
    TXA                     ; $897D: 8A
    .byte $53            ; $897E
    .byte $22            ; $897F
    .byte $17            ; $8980
    ROL $160F               ; $8981: 2E 0F 16
    ROL                     ; $8984: 2A
    ROL $AA                 ; $8985: 26 AA
    .byte $03            ; $8987
    TXA                     ; $8988: 8A
    .byte $52            ; $8989
    ROL                     ; $898A: 2A
    .byte $03            ; $898B
    STY $7A                 ; $898C: 84 7A
    .byte $89            ; $898E
    ORA $0003,X             ; $898F: 1D 03 00
    ASL                     ; $8992: 0A
    .byte $44            ; $8993
    .byte $8F            ; $8994
    .byte $80            ; $8995
    .byte $13            ; $8996
    ASL                     ; $8997: 0A
    ORA ($25,X)             ; $8998: 01 25
    .byte $0F            ; $899A
    ASL $240B               ; $899B: 0E 0B 24
    .byte $0F            ; $899E
    .byte $0F            ; $899F
    .byte $03            ; $89A0
    ROL                     ; $89A1: 2A
    .byte $03            ; $89A2
    STY $98                 ; $89A3: 84 98
    .byte $89            ; $89A5
    .byte $1F            ; $89A6
    .byte $0F            ; $89A7
    BRK                     ; $89A8: 00
    ASL                     ; $89A9: 0A
    .byte $13            ; $89AA
    BCC $892D               ; $89AB: 90 80
    ASL                     ; $89AD: 0A
    ORA ($25,X)             ; $89AE: 01 25
    BPL $89C0               ; $89B0: 10 0E
    .byte $0B            ; $89B2
    BIT ptr_lo              ; $89B3: 24 10
    .byte $0F            ; $89B5
    .byte $03            ; $89B6
    ROL                     ; $89B7: 2A
    .byte $03            ; $89B8
    STY $AE                 ; $89B9: 84 AE
    .byte $89            ; $89BB
    .byte $1F            ; $89BC
    .byte $0F            ; $89BD
    BRK                     ; $89BE: 00
    ASL                     ; $89BF: 0A
    .byte $13            ; $89C0
    BCC $8944               ; $89C1: 90 81
    .byte $1A            ; $89C3
    AND ptr_lo              ; $89C4: 25 10
    ASL $240B               ; $89C6: 0E 0B 24
    BPL $89DB               ; $89C9: 10 10
    .byte $03            ; $89CB
    BIT ptr_hi              ; $89CC: 24 11
    BPL $89D3               ; $89CE: 10 03
    ORA $82                 ; $89D0: 05 82
    .byte $07            ; $89D2
    ORA ($81,X)             ; $89D3: 01 81
    BIT ptr_lo              ; $89D5: 24 10
    BPL $89DC               ; $89D7: 10 03
    .byte $23            ; $89D9
    .byte $83            ; $89DA
    ORA ($83,X)             ; $89DB: 01 83
    SBC $8403,X             ; $89DD: FD 03 84
    CPY $89                 ; $89E0: C4 89
    .byte $1F            ; $89E2
    RTS                     ; $89E3: 60
    BRK                     ; $89E4: 00
    AND #$83                ; $89E5: 29 83
    .byte $0F            ; $89E7
    BPL $89EA               ; $89E8: 10 00
    BRK                     ; $89EA: 00
    .byte $1F            ; $89EB
    .byte $0F            ; $89EC
    BRK                     ; $89ED: 00
    ASL                     ; $89EE: 0A
    .byte $13            ; $89EF
    .byte $8F            ; $89F0
    STA ($16,X)             ; $89F1: 81 16
    AND $0F                 ; $89F3: 25 0F
    ASL $240B               ; $89F5: 0E 0B 24
    .byte $0F            ; $89F8
    BPL $89FE               ; $89F9: 10 03
    BIT $0E                 ; $89FB: 24 0E
    BPL $8A02               ; $89FD: 10 03
    ASL $82                 ; $89FF: 06 82
    .byte $07            ; $8A01
    ORA ($81,X)             ; $8A02: 01 81
    .byte $23            ; $8A04
    STA (tmp1,X)            ; $8A05: 81 01
    .byte $83            ; $8A07
    SBC $8403,X             ; $8A08: FD 03 84
    .byte $F3            ; $8A0B
    .byte $89            ; $8A0C
    .byte $1F            ; $8A0D
    BRK                     ; $8A0E: 00
    BRK                     ; $8A0F: 00
    PLP                     ; $8A10: 28
    .byte $82            ; $8A11
    .byte $8F            ; $8A12
    .byte $82            ; $8A13
    ORA #$24                ; $8A14: 09 24
    .byte $0F            ; $8A16
    BPL $8A1C               ; $8A17: 10 03
    .byte $23            ; $8A19
    .byte $80            ; $8A1A
    ORA ($83,X)             ; $8A1B: 01 83
    SBC $8403,X             ; $8A1D: FD 03 84
    ORA $8A,X               ; $8A20: 15 8A
    BRK                     ; $8A22: 00
    .byte $1F            ; $8A23
    ASL                     ; $8A24: 0A
    ORA ($09),Y             ; $8A25: 11 09
    SBC $83                 ; $8A27: E5 83
    DEY                     ; $8A29: 88
    ORA ($8A),Y             ; $8A2A: 11 8A
    BPL $8A50               ; $8A2C: 10 22
    ASL $24                 ; $8A2E: 06 24
    .byte $03            ; $8A30
    .byte $07            ; $8A31
    .byte $03            ; $8A32
    BIT ptr0_lo             ; $8A33: 24 04
    .byte $07            ; $8A35
    .byte $03            ; $8A36
    BIT ptr0_lo             ; $8A37: 24 04
    ASL tmp3                ; $8A39: 06 03
    ROL                     ; $8A3B: 2A
    .byte $03            ; $8A3C
    STY $2B                 ; $8A3D: 84 2B
    TXA                     ; $8A3F: 8A
    BRK                     ; $8A40: 00
    .byte $1F            ; $8A41
    BRK                     ; $8A42: 00
    BRK                     ; $8A43: 00
    .byte $23            ; $8A44
    .byte $74            ; $8A45
    TXA                     ; $8A46: 8A
    TXA                     ; $8A47: 8A
    BRK                     ; $8A48: 00
    BRK                     ; $8A49: 00
    .byte $1F            ; $8A4A
    ASL                     ; $8A4B: 0A
    BRK                     ; $8A4C: 00
    .byte $9E            ; $8A4D
    INC $8A                 ; $8A4E: E6 8A
    STX tmp0                ; $8A50: 86 00
    BRK                     ; $8A52: 00
    BRK                     ; $8A53: 00
    .byte $1C            ; $8A54
    .byte $0C            ; $8A55
    .byte $04            ; $8A56
    ASL                     ; $8A57: 0A
    ROL $9C8C               ; $8A58: 2E 8C 9C
    ORA #$28                ; $8A5B: 09 28
    BRK                     ; $8A5D: 00
    ASL                     ; $8A5E: 0A
    BIT ptr_hi              ; $8A5F: 24 11
    .byte $1C            ; $8A61
    .byte $03            ; $8A62
    BIT $09                 ; $8A63: 24 09
    .byte $1C            ; $8A65
    .byte $03            ; $8A66
    .byte $83            ; $8A67
    SED                     ; $8A68: F8
    CLC                     ; $8A69: 18
    PHP                     ; $8A6A: 08
    BRK                     ; $8A6B: 00
    ASL                     ; $8A6C: 0A
    LDY $82                 ; $8A6D: A4 82
    AND ($08,X)             ; $8A6F: 21 08
    PHP                     ; $8A71: 08
    .byte $1A            ; $8A72
    .byte $FF            ; $8A73
    BRK                     ; $8A74: 00
    .byte $0C            ; $8A75
    ORA ($24),Y             ; $8A76: 11 24
    .byte $80            ; $8A78
    BRK                     ; $8A79: 00
    .byte $03            ; $8A7A
    .byte $12            ; $8A7B
    ROL $8E                 ; $8A7C: 26 8E
    .byte $03            ; $8A7E
    TXA                     ; $8A7F: 8A
    JMP $182F               ; $8A80: 4C 2F 18
    .byte $0C            ; $8A83
    STA ($26,X)             ; $8A84: 81 26
    AND ($90),Y             ; $8A86: 31 90
    ORA ($08),Y             ; $8A88: 11 08
    PHP                     ; $8A8A: 08
    .byte $1B            ; $8A8B
    .byte $FF            ; $8A8C
    ORA ($2B,X)             ; $8A8D: 01 2B
    .byte $03            ; $8A8F
    TXA                     ; $8A90: 8A
    .byte $4B            ; $8A91
    .byte $2F            ; $8A92
    .byte $1F            ; $8A93
    .byte $0F            ; $8A94
    BRK                     ; $8A95: 00
    ASL $9230,X             ; $8A96: 1E 30 92
    .byte $92            ; $8A99
    BRK                     ; $8A9A: 00
    BRK                     ; $8A9B: 00
    ORA $000D,X             ; $8A9C: 1D 0D 00
    ASL                     ; $8A9F: 0A
    AND $8890               ; $8AA0: 2D 90 88
    .byte $F2            ; $8AA3
    BRK                     ; $8AA4: 00
    BRK                     ; $8AA5: 00
    ORA $0009,Y             ; $8AA6: 19 09 00
    ASL                     ; $8AA9: 0A
    LDY $98                 ; $8AAA: A4 98
    LDA ($F3,X)             ; $8AAC: A1 F3
    ORA ($08),Y             ; $8AAE: 11 08
    BRK                     ; $8AB0: 00
    BRK                     ; $8AB1: 00
    ORA $8001,Y             ; $8AB2: 19 01 80
    ASL $91,X               ; $8AB5: 16 91
    .byte $92            ; $8AB7
    STA $11F1,Y             ; $8AB8: 99 F1 11
    .byte $12            ; $8ABB
    ORA ($2B,X)             ; $8ABC: 01 2B
    BRK                     ; $8ABE: 00
    CLC                     ; $8ABF: 18
    AND $6680               ; $8AC0: 2D 80 66
    .byte $2F            ; $8AC3
    STA $0916               ; $8AC4: 8D 16 09
    .byte $AB            ; $8AC7
    PHP                     ; $8AC8: 08
    .byte $12            ; $8AC9
    ORA ($2B,X)             ; $8ACA: 01 2B
    BRK                     ; $8ACC: 00
    BRK                     ; $8ACD: 00
    .byte $1F            ; $8ACE
    BRK                     ; $8ACF: 00
    BRK                     ; $8AD0: 00
    .byte $0B            ; $8AD1
    STA $9385               ; $8AD2: 8D 85 93
    ORA ($2B,X)             ; $8AD5: 01 2B
    ORA ($2B,X)             ; $8AD7: 01 2B
    .byte $1F            ; $8AD9
    BRK                     ; $8ADA: 00
    BRK                     ; $8ADB: 00
    SBC $848E               ; $8ADC: ED 8E 84
    .byte $93            ; $8ADF
    BRK                     ; $8AE0: 00
    BRK                     ; $8AE1: 00
    .byte $1F            ; $8AE2
    BRK                     ; $8AE3: 00
    BRK                     ; $8AE4: 00
    .byte $32            ; $8AE5
    ORA $85                 ; $8AE6: 05 85
    TXA                     ; $8AE8: 8A
    BRK                     ; $8AE9: 00
    BRK                     ; $8AEA: 00
    .byte $1F            ; $8AEB
    BRK                     ; $8AEC: 00
    BRK                     ; $8AED: 00
    .byte $2B            ; $8AEE
    STY $9A8D               ; $8AEF: 8C 8D 9A
    BRK                     ; $8AF2: 00
    BRK                     ; $8AF3: 00
    .byte $1F            ; $8AF4
    BRK                     ; $8AF5: 00
    BRK                     ; $8AF6: 00
    .byte $22            ; $8AF7
    ASL $92                 ; $8AF8: 06 92
    TYA                     ; $8AFA: 98
    BRK                     ; $8AFB: 00
    BRK                     ; $8AFC: 00
    .byte $1F            ; $8AFD
    .byte $0F            ; $8AFE
    DEY                     ; $8AFF: 88
    .byte $12            ; $8B00
    .byte $2B            ; $8B01
    .byte $AB            ; $8B02
    STY $2B01               ; $8B03: 8C 01 2B
    ORA ($2B,X)             ; $8B06: 01 2B
    ASL $800A,X             ; $8B08: 1E 0A 80
    .byte $12            ; $8B0B
    TYA                     ; $8B0C: 98
    .byte $8B            ; $8B0D
    .byte $9B            ; $8B0E
    ORA (tmp1),Y            ; $8B0F: 11 01
    .byte $2B            ; $8B11
    ORA ($2B,X)             ; $8B12: 01 2B
    .byte $1C            ; $8B14
    ORA #$88                ; $8B15: 09 88
    ROR $D9                 ; $8B17: 66 D9
    TXS                     ; $8B19: 9A
    .byte $8F            ; $8B1A
    ROL                     ; $8B1B: 2A
    LDX tmp1                ; $8B1C: A6 01
    .byte $2B            ; $8B1E
    BPL $8AA3               ; $8B1F: 10 82
    .byte $04            ; $8B21
    .byte $02            ; $8B22
    STA ($23,X)             ; $8B23: 81 23
    ORA $8201,X             ; $8B25: 1D 01 82
    .byte $02            ; $8B28
    BRK                     ; $8B29: 00
    STA ($23,X)             ; $8B2A: 81 23
    .byte $0F            ; $8B2C
    ORA ($83,X)             ; $8B2D: 01 83
    .byte $F2            ; $8B2F
    CLC                     ; $8B30: 18
    ORA $0A00               ; $8B31: 0D 00 0A
    ROL                     ; $8B34: 2A
    STX $8A,Y               ; $8B35: 96 8A
    .byte $23            ; $8B37
    LDA $0D                 ; $8B38: A5 0D
    .byte $1C            ; $8B3A
    BRK                     ; $8B3B: 00
    BRK                     ; $8B3C: 00
    CLC                     ; $8B3D: 18
    ORA ($08,X)             ; $8B3E: 01 08
    .byte $67            ; $8B40
    .byte $03            ; $8B41
    .byte $9B            ; $8B42
    .byte $9B            ; $8B43
    ROR $BA                 ; $8B44: 66 BA
    .byte $04            ; $8B46
    .byte $0C            ; $8B47
    BRK                     ; $8B48: 00
    ORA ($2B,X)             ; $8B49: 01 2B
    CLC                     ; $8B4B: 18
    AND $1280               ; $8B4C: 2D 80 12
    AND #$97                ; $8B4F: 29 97
    .byte $14            ; $8B51
    PLP                     ; $8B52: 28
    .byte $9F            ; $8B53
    .byte $2F            ; $8B54
    BRK                     ; $8B55: 00
    ORA ($2B,X)             ; $8B56: 01 2B
    BRK                     ; $8B58: 00
    .byte $17            ; $8B59
    BRK                     ; $8B5A: 00
    BRK                     ; $8B5B: 00
    .byte $22            ; $8B5C
    .byte $02            ; $8B5D
    LDX #$91                ; $8B5E: A2 91
    BRK                     ; $8B60: 00
    .byte $17            ; $8B61
    PHP                     ; $8B62: 08
    .byte $80            ; $8B63
    ASL $95,X               ; $8B64: 16 95
    STA $019E,Y             ; $8B66: 99 9E 01
    .byte $2B            ; $8B69
    .byte $17            ; $8B6A
    BRK                     ; $8B6B: 00
    BRK                     ; $8B6C: 00
    BPL $8BE4               ; $8B6D: 10 75
    STX $9C                 ; $8B6F: 86 9C
    BRK                     ; $8B71: 00
    .byte $17            ; $8B72
    BRK                     ; $8B73: 00
    RTI                     ; $8B74: 40
    ASL                     ; $8B75: 0A
    .byte $44            ; $8B76
    TAX                     ; $8B77: AA
    STY $33,X               ; $8B78: 94 33
    BIT $22                 ; $8B7A: 24 22
    .byte $14            ; $8B7C
    .byte $03            ; $8B7D
    BIT $22                 ; $8B7E: 24 22
    ORA tmp3,X              ; $8B80: 15 03
    BIT $1E                 ; $8B82: 24 1E
    .byte $13            ; $8B84
    .byte $03            ; $8B85
    BIT $1D                 ; $8B86: 24 1D
    .byte $17            ; $8B88
    .byte $03            ; $8B89
    BIT $19                 ; $8B8A: 24 19
    .byte $13            ; $8B8C
    .byte $03            ; $8B8D
    BIT $19                 ; $8B8E: 24 19
    CLC                     ; $8B90: 18
    .byte $03            ; $8B91
    BIT $15                 ; $8B92: 24 15
    .byte $1A            ; $8B94
    .byte $03            ; $8B95
    BIT $12                 ; $8B96: 24 12
    .byte $1A            ; $8B98
    .byte $03            ; $8B99
    BIT $13                 ; $8B9A: 24 13
    ORA $2403,X             ; $8B9C: 1D 03 24
    ORA $031D               ; $8B9F: 0D 1D 03
    BIT $0D                 ; $8BA2: 24 0D
    .byte $1B            ; $8BA4
    .byte $03            ; $8BA5
    .byte $27            ; $8BA6
    .byte $80            ; $8BA7
    .byte $89            ; $8BA8
    .byte $62            ; $8BA9
    .byte $23            ; $8BAA
    .byte $83            ; $8BAB
    ROL                     ; $8BAC: 2A
    .byte $17            ; $8BAD
    BRK                     ; $8BAE: 00
    BRK                     ; $8BAF: 00
    .byte $22            ; $8BB0
    ORA ($8C,X)             ; $8BB1: 01 8C
    .byte $8F            ; $8BB3
    BRK                     ; $8BB4: 00
    BRK                     ; $8BB5: 00
    .byte $1F            ; $8BB6
    ROR                     ; $8BB7: 6A
    ORA ($2B),Y             ; $8BB8: 11 2B
    BCS $8BBD               ; $8BBA: B0 01
    ORA $2E0C               ; $8BBC: 0D 0C 2E
    ORA $0D                 ; $8BBF: 05 0D
    .byte $2F            ; $8BC1
    .byte $23            ; $8BC2
    ORA tmp1                ; $8BC3: 05 01
    BIT tmp3                ; $8BC5: 24 03
    ORA $2A03               ; $8BC7: 0D 03 2A
    .byte $0C            ; $8BCA
    ROL $0D05               ; $8BCB: 2E 05 0D
    .byte $2F            ; $8BCE
    .byte $23            ; $8BCF
    ORA tmp1                ; $8BD0: 05 01
    BIT tmp3                ; $8BD2: 24 03
    ORA $2A03               ; $8BD4: 0D 03 2A
    .byte $1F            ; $8BD7
    ASL                     ; $8BD8: 0A
    BRK                     ; $8BD9: 00
    PLP                     ; $8BDA: 28
    BCS $8BDD               ; $8BDB: B0 00
    BPL $8BDF               ; $8BDD: 10 00
    BRK                     ; $8BDF: 00
    ORA $800C,Y             ; $8BE0: 19 0C 80
    .byte $12            ; $8BE3
    .byte $33            ; $8BE4
    DEY                     ; $8BE5: 88
    STX $43                 ; $8BE6: 86 43
    ORA tmp2                ; $8BE8: 05 02
    ORA ($2B,X)             ; $8BEA: 01 2B
    BRK                     ; $8BEC: 00
    CLC                     ; $8BED: 18
    ORA $0A00               ; $8BEE: 0D 00 0A
    .byte $32            ; $8BF1
    .byte $83            ; $8BF2
    .byte $82            ; $8BF3
    PHP                     ; $8BF4: 08
    LDA (tmp3),Y            ; $8BF5: B1 03
    .byte $04            ; $8BF7
    BRK                     ; $8BF8: 00
    BRK                     ; $8BF9: 00
    CLC                     ; $8BFA: 18
    ORA #$30                ; $8BFB: 09 30
    .byte $64            ; $8BFD
    LDX $868D               ; $8BFE: AE 8D 86
    ROR $F4                 ; $8C01: 66 F4
    .byte $02            ; $8C03
    .byte $02            ; $8C04
    .byte $2F            ; $8C05
    .byte $82            ; $8C06
    ASL tmp1                ; $8C07: 06 01
    STA ($24,X)             ; $8C09: 81 24
    .byte $0B            ; $8C0B
    ASL tmp3                ; $8C0C: 06 03
    BIT $0B                 ; $8C0E: 24 0B
    ORA #$03                ; $8C10: 09 03
    ORA $30                 ; $8C12: 05 30
    BCC $8C42               ; $8C14: 90 2C
    ASL                     ; $8C16: 0A
    ASL $09                 ; $8C17: 06 09
    BIT $06                 ; $8C19: 24 06
    ORA #$03                ; $8C1B: 09 03
    .byte $82            ; $8C1D
    ASL tmp1                ; $8C1E: 06 01
    STA ($24,X)             ; $8C20: 81 24
    .byte $0B            ; $8C22
    ORA #$03                ; $8C23: 09 03
    .byte $23            ; $8C25
    .byte $83            ; $8C26
    ORA ($2C,X)             ; $8C27: 01 2C
    ASL                     ; $8C29: 0A
    ASL                     ; $8C2A: 0A
    ORA #$24                ; $8C2B: 09 24
    .byte $0B            ; $8C2D
    ASL tmp3                ; $8C2E: 06 03
    BIT $0D                 ; $8C30: 24 0D
    ASL $83                 ; $8C32: 06 83
    .byte $D3            ; $8C34
    BRK                     ; $8C35: 00
    BRK                     ; $8C36: 00
    .byte $1F            ; $8C37
    .byte $0F            ; $8C38
    .byte $44            ; $8C39
    .byte $6B            ; $8C3A
    AND $99,X               ; $8C3B: 35 99
    .byte $89            ; $8C3D
    .byte $1B            ; $8C3E
    .byte $82            ; $8C3F
    .byte $07            ; $8C40
    ORA ($81,X)             ; $8C41: 01 81
    BIT $19                 ; $8C43: 24 19
    PHP                     ; $8C45: 08
    .byte $03            ; $8C46
    BIT $16                 ; $8C47: 24 16
    PHP                     ; $8C49: 08
    .byte $03            ; $8C4A
    ORA $82                 ; $8C4B: 05 82
    .byte $03            ; $8C4D
    ORA ($81,X)             ; $8C4E: 01 81
    BIT $19                 ; $8C50: 24 19
    PHP                     ; $8C52: 08
    .byte $03            ; $8C53
    BIT $19                 ; $8C54: 24 19
    ORA #$03                ; $8C56: 09 03
    .byte $83            ; $8C58
    .byte $E7            ; $8C59
    .byte $1B            ; $8C5A
    .byte $82            ; $8C5B
    .byte $07            ; $8C5C
    ORA ($81,X)             ; $8C5D: 01 81
    BIT $19                 ; $8C5F: 24 19
    PHP                     ; $8C61: 08
    .byte $03            ; $8C62
    BIT $16                 ; $8C63: 24 16
    PHP                     ; $8C65: 08
    .byte $03            ; $8C66
    ORA $82                 ; $8C67: 05 82
    .byte $04            ; $8C69
    ORA ($81,X)             ; $8C6A: 01 81
    BIT $19                 ; $8C6C: 24 19
    PHP                     ; $8C6E: 08
    .byte $03            ; $8C6F
    BIT $19                 ; $8C70: 24 19
    ORA #$03                ; $8C72: 09 03
    .byte $83            ; $8C74
    .byte $E7            ; $8C75
    ORA $0009,X             ; $8C76: 1D 09 00
    ASL                     ; $8C79: 0A
    .byte $AB            ; $8C7A
    STY $AD8D               ; $8C7B: 8C 8D AD
    BRK                     ; $8C7E: 00
    BRK                     ; $8C7F: 00
    .byte $17            ; $8C80
    .byte $0C            ; $8C81
    .byte $80            ; $8C82
    ASL $34                 ; $8C83: 06 34
    STA $018B               ; $8C85: 8D 8B 01
    .byte $2B            ; $8C88
    BRK                     ; $8C89: 00
    ORA $8809,X             ; $8C8A: 1D 09 88
    ADC $AD                 ; $8C8D: 65 AD
    .byte $82            ; $8C8F
    STY $0AAE               ; $8C90: 8C AE 0A
    BIT $06                 ; $8C93: 24 06
    .byte $0C            ; $8C95
    .byte $03            ; $8C96
    BIT tmp2                ; $8C97: 24 02
    .byte $0C            ; $8C99
    .byte $03            ; $8C9A
    .byte $83            ; $8C9B
    SED                     ; $8C9C: F8
    ASL                     ; $8C9D: 0A
    BIT $06                 ; $8C9E: 24 06
    .byte $0C            ; $8CA0
    .byte $03            ; $8CA1
    BIT tmp2                ; $8CA2: 24 02
    .byte $0C            ; $8CA4
    .byte $03            ; $8CA5
    .byte $83            ; $8CA6
    SED                     ; $8CA7: F8
    CLC                     ; $8CA8: 18
    AND $1200               ; $8CA9: 2D 00 12
    ROL $88,X               ; $8CAC: 36 88
    .byte $04            ; $8CAE
    ORA $04F6               ; $8CAF: 0D F6 04
    .byte $04            ; $8CB2
    BRK                     ; $8CB3: 00
    BRK                     ; $8CB4: 00
    .byte $0F            ; $8CB5
    .byte $04            ; $8CB6
    PHP                     ; $8CB7: 08
    .byte $02            ; $8CB8
    SBC $0C,X               ; $8CB9: F5 0C
    .byte $82            ; $8CBB
    ORA ($2B,X)             ; $8CBC: 01 2B
    .byte $0F            ; $8CBE
    BIT tmp0                ; $8CBF: 24 00
    AND $04F7               ; $8CC1: 2D F7 04
    ASL tmp0                ; $8CC4: 06 00
    BRK                     ; $8CC6: 00
    .byte $97            ; $8CC7
    PHP                     ; $8CC8: 08
    BPL $8D0A               ; $8CC9: 10 3F
    .byte $BB            ; $8CCB
    STA $89,X               ; $8CCC: 95 89
    .byte $02            ; $8CCE
    .byte $07            ; $8CCF
    .byte $2F            ; $8CD0
    .byte $97            ; $8CD1
    .byte $0C            ; $8CD2
    BPL $8D14               ; $8CD3: 10 3F
    .byte $3A            ; $8CD5
    STX $89,Y               ; $8CD6: 96 89
    .byte $02            ; $8CD8
    .byte $07            ; $8CD9
    .byte $2F            ; $8CDA
    .byte $97            ; $8CDB
    PHP                     ; $8CDC: 08
    BPL $8D1E               ; $8CDD: 10 3F
    CLV                     ; $8CDF: B8
    .byte $97            ; $8CE0
    TXA                     ; $8CE1: 8A
    .byte $02            ; $8CE2
    .byte $07            ; $8CE3
    .byte $2F            ; $8CE4
    .byte $97            ; $8CE5
    .byte $0C            ; $8CE6
    BPL $8D28               ; $8CE7: 10 3F
    .byte $37            ; $8CE9
    .byte $97            ; $8CEA
    .byte $8B            ; $8CEB
    .byte $02            ; $8CEC
    .byte $07            ; $8CED
    .byte $2F            ; $8CEE
    .byte $97            ; $8CEF
    .byte $0C            ; $8CF0
    BPL $8D32               ; $8CF1: 10 3F
    SEC                     ; $8CF3: 38
    STX $8C,Y               ; $8CF4: 96 8C
    .byte $02            ; $8CF6
    .byte $07            ; $8CF7
    .byte $2F            ; $8CF8
    .byte $97            ; $8CF9
    .byte $0C            ; $8CFA
    BPL $8D3C               ; $8CFB: 10 3F
    AND $8C95,Y             ; $8CFD: 39 95 8C
    .byte $02            ; $8D00
    .byte $07            ; $8D01
    .byte $2F            ; $8D02
    .byte $17            ; $8D03
    BRK                     ; $8D04: 00
    BRK                     ; $8D05: 00
    .byte $02            ; $8D06
    .byte $07            ; $8D07
    STA $0084               ; $8D08: 8D 84 00
    .byte $17            ; $8D0B
    BRK                     ; $8D0C: 00
    BRK                     ; $8D0D: 00
    .byte $02            ; $8D0E
    .byte $07            ; $8D0F
    STX $0084               ; $8D10: 8E 84 00
    .byte $17            ; $8D13
    BRK                     ; $8D14: 00
    BRK                     ; $8D15: 00
    ORA $9007               ; $8D16: 0D 07 90
    .byte $89            ; $8D19
    BRK                     ; $8D1A: 00
    .byte $17            ; $8D1B
    BRK                     ; $8D1C: 00
    BRK                     ; $8D1D: 00
    AND $9007               ; $8D1E: 2D 07 90
    TXA                     ; $8D21: 8A
    BRK                     ; $8D22: 00
    .byte $17            ; $8D23
    BRK                     ; $8D24: 00
    BRK                     ; $8D25: 00
    .byte $33            ; $8D26
    .byte $07            ; $8D27
    STA ($89),Y             ; $8D28: 91 89
    BRK                     ; $8D2A: 00
    .byte $17            ; $8D2B
    BRK                     ; $8D2C: 00
    BRK                     ; $8D2D: 00
    .byte $6F            ; $8D2E
    PHP                     ; $8D2F: 08
    STA $0084,Y             ; $8D30: 99 84 00
    BRK                     ; $8D33: 00
    .byte $1F            ; $8D34
    BRK                     ; $8D35: 00
    DEY                     ; $8D36: 88
    DEC $DF,X               ; $8D37: D6 DF
    .byte $82            ; $8D39
    DEY                     ; $8D3A: 88
    .byte $02            ; $8D3B
    AND $0255               ; $8D3C: 2D 55 02
    AND $1F55               ; $8D3F: 2D 55 1F
    .byte $0F            ; $8D42
    DEY                     ; $8D43: 88
    DEC $6C,X               ; $8D44: D6 6C
    STX $028E               ; $8D46: 8E 8E 02
    AND $0255               ; $8D49: 2D 55 02
    AND $1F55               ; $8D4C: 2D 55 1F
    .byte $0F            ; $8D4F
    BRK                     ; $8D50: 00
    .byte $62            ; $8D51
    SBC $95                 ; $8D52: E5 95
    STA tmp0                ; $8D54: 85 00
    BRK                     ; $8D56: 00
    BRK                     ; $8D57: 00
    .byte $1F            ; $8D58
    .byte $0F            ; $8D59
    BRK                     ; $8D5A: 00
    .byte $5B            ; $8D5B
    .byte $6F            ; $8D5C
    .byte $93            ; $8D5D
    STX tmp0                ; $8D5E: 86 00
    BRK                     ; $8D60: 00
    .byte $1F            ; $8D61
    .byte $0F            ; $8D62
    BRK                     ; $8D63: 00
    ADC $926E               ; $8D64: 6D 6E 92
    STX tmp0                ; $8D67: 86 00
    BRK                     ; $8D69: 00
    .byte $1F            ; $8D6A
    BRK                     ; $8D6B: 00
    BRK                     ; $8D6C: 00
    .byte $D7            ; $8D6D
    PHP                     ; $8D6E: 08
    LDX $87                 ; $8D6F: A6 87
    ORA $0C82,Y             ; $8D71: 19 82 0C
    ORA ($81,X)             ; $8D74: 01 81
    .byte $27            ; $8D76
    .byte $8F            ; $8D77
    BMI $8D7F               ; $8D78: 30 05
    .byte $07            ; $8D7A
    AND $0F                 ; $8D7B: 25 0F
    .byte $07            ; $8D7D
    .byte $0C            ; $8D7E
    ROL $09                 ; $8D7F: 26 09
    .byte $04            ; $8D81
    ORA #$28                ; $8D82: 09 28
    BRK                     ; $8D84: 00
    BMI $8D8C               ; $8D85: 30 05
    AND $0F                 ; $8D87: 25 0F
    BRK                     ; $8D89: 00
    .byte $2F            ; $8D8A
    .byte $03            ; $8D8B
    STY $72                 ; $8D8C: 84 72
    STA $0F1F               ; $8D8E: 8D 1F 0F
    DEY                     ; $8D91: 88
    DEC $6D,X               ; $8D92: D6 6D
    TXA                     ; $8D94: 8A
    STA $2D02               ; $8D95: 8D 02 2D
    .byte $33            ; $8D98
    .byte $02            ; $8D99
    AND $1F33               ; $8D9A: 2D 33 1F
    BRK                     ; $8D9D: 00
    BRK                     ; $8D9E: 00
    DEC $08,X               ; $8D9F: D6 08
    LDY $85                 ; $8DA1: A4 85
    ORA $82,X               ; $8DA3: 15 82
    .byte $04            ; $8DA5
    BRK                     ; $8DA6: 00
    STA ($07,X)             ; $8DA7: 81 07
    AND $0D                 ; $8DA9: 25 0D
    ORA $0C                 ; $8DAB: 05 0C
    ROL $07                 ; $8DAD: 26 07
    .byte $04            ; $8DAF
    .byte $82            ; $8DB0
    PHP                     ; $8DB1: 08
    ORA ($81,X)             ; $8DB2: 01 81
    ORA #$25                ; $8DB4: 09 25
    ORA $2F00               ; $8DB6: 0D 00 2F
    .byte $03            ; $8DB9
    STY $A4                 ; $8DBA: 84 A4
    STA $001F               ; $8DBC: 8D 1F 00
    BRK                     ; $8DBF: 00
    CMP $08,X               ; $8DC0: D5 08
    LDX #$87                ; $8DC2: A2 87
    ORA $82,X               ; $8DC4: 15 82
    PHP                     ; $8DC6: 08
    ORA ($81,X)             ; $8DC7: 01 81
    .byte $07            ; $8DC9
    AND $0B                 ; $8DCA: 25 0B
    .byte $07            ; $8DCC
    .byte $0C            ; $8DCD
    ROL $08                 ; $8DCE: 26 08
    .byte $04            ; $8DD0
    .byte $82            ; $8DD1
    .byte $04            ; $8DD2
    ORA ($81,X)             ; $8DD3: 01 81
    ORA #$25                ; $8DD5: 09 25
    .byte $0B            ; $8DD7
    BRK                     ; $8DD8: 00
    .byte $2F            ; $8DD9
    .byte $03            ; $8DDA
    STY $C5                 ; $8DDB: 84 C5
    STA $001F               ; $8DDD: 8D 1F 00
    BRK                     ; $8DE0: 00
    DEC $E0                 ; $8DE1: C6 E0
    STA $0C87               ; $8DE3: 8D 87 0C
    ROL $06                 ; $8DE6: 26 06
    .byte $04            ; $8DE8
    .byte $82            ; $8DE9
    ASL $8100               ; $8DEA: 0E 00 81
    ORA #$25                ; $8DED: 09 25
    ORA $2F00               ; $8DEF: 0D 00 2F
    .byte $03            ; $8DF2
    STY $E6                 ; $8DF3: 84 E6
    STA $1F00               ; $8DF5: 8D 00 1F
    BRK                     ; $8DF8: 00
    BRK                     ; $8DF9: 00
    ASL $8AC9               ; $8DFA: 0E C9 8A
    TYA                     ; $8DFD: 98
    ASL $0A24               ; $8DFE: 0E 24 0A
    ORA $2403,Y             ; $8E01: 19 03 24
    .byte $0F            ; $8E04
    ORA $2403,Y             ; $8E05: 19 03 24
    .byte $0F            ; $8E08
    .byte $1A            ; $8E09
    .byte $03            ; $8E0A
    PHP                     ; $8E0B: 08
    ROL                     ; $8E0C: 2A
    .byte $03            ; $8E0D
    STY $FF                 ; $8E0E: 84 FF
    STA $001F               ; $8E10: 8D 1F 00
    BRK                     ; $8E13: 00
    ORA #$BD                ; $8E14: 09 BD
    .byte $82            ; $8E16
    STA tmp0,X              ; $8E17: 95 00
    BRK                     ; $8E19: 00
    .byte $1B            ; $8E1A
    BRK                     ; $8E1B: 00
    PHP                     ; $8E1C: 08
    ASL                     ; $8E1D: 0A
    LDY $908F,X             ; $8E1E: BC 8F 90
    ASL $13                 ; $8E21: 06 13
    BRK                     ; $8E23: 00
    ORA ($2B,X)             ; $8E24: 01 2B
    CLC                     ; $8E26: 18
    .byte $0C            ; $8E27
    BRK                     ; $8E28: 00
    ASL                     ; $8E29: 0A
    ADC #$90                ; $8E2A: 69 90
    BCC $8E68               ; $8E2C: 90 3A
    .byte $BF            ; $8E2E
    .byte $07            ; $8E2F
    ORA $0000               ; $8E30: 0D 00 00
    .byte $0F            ; $8E33
    BRK                     ; $8E34: 00
    .byte $04            ; $8E35
    ROL                     ; $8E36: 2A
    LDX $8C08,Y             ; $8E37: BE 08 8C
    .byte $12            ; $8E3A
    BIT $08                 ; $8E3B: 24 08
    ASL $2403               ; $8E3D: 0E 03 24
    ASL $0E                 ; $8E40: 06 0E
    .byte $03            ; $8E42
    BIT $06                 ; $8E43: 24 06
    .byte $0C            ; $8E45
    .byte $03            ; $8E46
    BIT $08                 ; $8E47: 24 08
    .byte $0C            ; $8E49
    .byte $03            ; $8E4A
    .byte $83            ; $8E4B
    BEQ $8E4E               ; $8E4C: F0 00
    .byte $1F            ; $8E4E
    BRK                     ; $8E4F: 00
    BRK                     ; $8E50: 00
    .byte $32            ; $8E51
    ORA $8E                 ; $8E52: 05 8E
    STY tmp0                ; $8E54: 84 00
    BRK                     ; $8E56: 00
    .byte $1F            ; $8E57
    BRK                     ; $8E58: 00
    BRK                     ; $8E59: 00
    .byte $23            ; $8E5A
    TSX                     ; $8E5B: BA
    STA $8F                 ; $8E5C: 85 8F
    BRK                     ; $8E5E: 00
    BRK                     ; $8E5F: 00
    .byte $1F            ; $8E60
    BRK                     ; $8E61: 00
    BRK                     ; $8E62: 00
    .byte $57            ; $8E63
    EOR $9A97,X             ; $8E64: 5D 97 9A
    .byte $07            ; $8E67
    BIT $17                 ; $8E68: 24 17
    ORA $2303,Y             ; $8E6A: 19 03 23
    .byte $82            ; $8E6D
    ROL                     ; $8E6E: 2A
    .byte $03            ; $8E6F
    STY $68                 ; $8E70: 84 68
    STX $001A               ; $8E72: 8E 1A 00
    BRK                     ; $8E75: 00
    ASL $9858,X             ; $8E76: 1E 58 98
    .byte $0B            ; $8E79
    ORA $0B16,X             ; $8E7A: 1D 16 0B
    .byte $03            ; $8E7D
    ASL $FF83               ; $8E7E: 0E 83 FF
    BRK                     ; $8E81: 00
    ORA $0022,Y             ; $8E82: 19 22 00
    ORA $55,X               ; $8E85: 15 55
    .byte $82            ; $8E87
    .byte $1A            ; $8E88
    ROL                     ; $8E89: 2A
    ORA ($13,X)             ; $8E8A: 01 13
    BRK                     ; $8E8C: 00
    BRK                     ; $8E8D: 00
    .byte $17            ; $8E8E
    BRK                     ; $8E8F: 00
    BRK                     ; $8E90: 00
    .byte $22            ; $8E91
    .byte $03            ; $8E92
    STY $85                 ; $8E93: 84 85
    BRK                     ; $8E95: 00
    .byte $17            ; $8E96
    BRK                     ; $8E97: 00
    .byte $80            ; $8E98
    .byte $17            ; $8E99
    LDA $8D86,Y             ; $8E9A: B9 86 8D
    ORA ($2B,X)             ; $8E9D: 01 2B
    .byte $17            ; $8E9F
    BRK                     ; $8EA0: 00
    BRK                     ; $8EA1: 00
    .byte $9E            ; $8EA2
    .byte $5B            ; $8EA3
    STA $0087               ; $8EA4: 8D 87 00
    .byte $17            ; $8EA7
    BRK                     ; $8EA8: 00
    BRK                     ; $8EA9: 00
    .byte $17            ; $8EAA
    .byte $5C            ; $8EAB
    .byte $9B            ; $8EAC
    STA (tmp0),Y            ; $8EAD: 91 00
    BRK                     ; $8EAF: 00
    CLC                     ; $8EB0: 18
    ASL                     ; $8EB1: 0A
    .byte $80            ; $8EB2
    ROR $C5                 ; $8EB3: 66 C5
    STA $86                 ; $8EB5: 85 86
    STA $1B0E,X             ; $8EB7: 9D 0E 1B
    .byte $03            ; $8EBA
    ORA ($2B,X)             ; $8EBB: 01 2B
    BRK                     ; $8EBD: 00
    .byte $0F            ; $8EBE
    PHP                     ; $8EBF: 08
    BRK                     ; $8EC0: 00
    .byte $17            ; $8EC1
    .byte $0F            ; $8EC2
    ORA $0083,X             ; $8EC3: 1D 83 00
    .byte $0F            ; $8EC6
    BRK                     ; $8EC7: 00
    BRK                     ; $8EC8: 00
    AND ($56,X)             ; $8EC9: 21 56
    .byte $02            ; $8ECB
    STY tmp0                ; $8ECC: 84 00
    .byte $0F            ; $8ECE
    PLP                     ; $8ECF: 28
    BRK                     ; $8ED0: 00
    ADC $2B                 ; $8ED1: 65 2B
    .byte $02            ; $8ED3
    ASL tmp0                ; $8ED4: 06 00
    BRK                     ; $8ED6: 00
    CLC                     ; $8ED7: 18
    .byte $22            ; $8ED8
    BRK                     ; $8ED9: 00
    ROL                     ; $8EDA: 2A
    .byte $BB            ; $8EDB
    .byte $87            ; $8EDC
    .byte $04            ; $8EDD
    AND #$2A                ; $8EDE: 29 2A
    PHP                     ; $8EE0: 08
    ASL tmp0                ; $8EE1: 06 00
    BRK                     ; $8EE3: 00
    BRK                     ; $8EE4: 00
    .byte $1F            ; $8EE5
    BRK                     ; $8EE6: 00
    BRK                     ; $8EE7: 00
    ASL                     ; $8EE8: 0A
    .byte $37            ; $8EE9
    .byte $80            ; $8EEA
    STY $0000               ; $8EEB: 8C 00 00
    .byte $1F            ; $8EEE
    BRK                     ; $8EEF: 00
    BRK                     ; $8EF0: 00
    .byte $23            ; $8EF1
    SEC                     ; $8EF2: 38
    TXA                     ; $8EF3: 8A
    TXA                     ; $8EF4: 8A
    BRK                     ; $8EF5: 00
    BRK                     ; $8EF6: 00
    BRK                     ; $8EF7: 00
    .byte $1F            ; $8EF8
    BRK                     ; $8EF9: 00
    BRK                     ; $8EFA: 00
    .byte $43            ; $8EFB
    .byte $F3            ; $8EFC
    STY $85                 ; $8EFD: 84 85
    BRK                     ; $8EFF: 00
    BRK                     ; $8F00: 00
    .byte $1F            ; $8F01
    RTS                     ; $8F02: 60
    BRK                     ; $8F03: 00
    AND #$F4                ; $8F04: 29 F4
    .byte $22            ; $8F06
    .byte $03            ; $8F07
    BRK                     ; $8F08: 00
    BRK                     ; $8F09: 00
    .byte $1F            ; $8F0A
    .byte $0F            ; $8F0B
    BRK                     ; $8F0C: 00
    SEC                     ; $8F0D: 38
    ADC $A2,X               ; $8F0E: 75 A2
    STY tmp0                ; $8F10: 84 00
    BRK                     ; $8F12: 00
    BRK                     ; $8F13: 00
    .byte $17            ; $8F14
    .byte $04            ; $8F15
    BRK                     ; $8F16: 00
    ORA ptr0_lo             ; $8F17: 05 04
    .byte $8B            ; $8F19
    .byte $83            ; $8F1A
    BRK                     ; $8F1B: 00
    .byte $57            ; $8F1C
    .byte $04            ; $8F1D
    BRK                     ; $8F1E: 00
    .byte $B3            ; $8F1F
    ASL $8D                 ; $8F20: 06 8D
    .byte $83            ; $8F22
    ROL $24                 ; $8F23: 26 24
    ORA $0304               ; $8F25: 0D 04 03
    BIT $0C                 ; $8F28: 24 0C
    .byte $04            ; $8F2A
    .byte $03            ; $8F2B
    BIT $0C                 ; $8F2C: 24 0C
    .byte $07            ; $8F2E
    .byte $03            ; $8F2F
    BIT $16                 ; $8F30: 24 16
    .byte $07            ; $8F32
    .byte $03            ; $8F33
    BIT $16                 ; $8F34: 24 16
    ORA tmp3,X              ; $8F36: 15 03
    BIT $13                 ; $8F38: 24 13
    ORA tmp3,X              ; $8F3A: 15 03
    BIT $13                 ; $8F3C: 24 13
    .byte $17            ; $8F3E
    .byte $03            ; $8F3F
    BIT $0C                 ; $8F40: 24 0C
    .byte $17            ; $8F42
    .byte $03            ; $8F43
    BIT $0C                 ; $8F44: 24 0C
    .byte $1B            ; $8F46
    .byte $03            ; $8F47
    PHP                     ; $8F48: 08
    .byte $2F            ; $8F49
    BRK                     ; $8F4A: 00
    .byte $1F            ; $8F4B
    BRK                     ; $8F4C: 00
    BRK                     ; $8F4D: 00
    .byte $FC            ; $8F4E
    .byte $C7            ; $8F4F
    STX $86,Y               ; $8F50: 96 86
    ASL $24                 ; $8F52: 06 24
    .byte $14            ; $8F54
    ASL                     ; $8F55: 0A
    .byte $03            ; $8F56
    PHP                     ; $8F57: 08
    .byte $2F            ; $8F58
    .byte $03            ; $8F59
    STY $53                 ; $8F5A: 84 53
    .byte $8F            ; $8F5C
    .byte $1F            ; $8F5D
    BRK                     ; $8F5E: 00
    ORA ($FC),Y             ; $8F5F: 11 FC
    INY                     ; $8F61: C8
    STY $8D,X               ; $8F62: 94 8D
    .byte $1A            ; $8F64
    TXA                     ; $8F65: 8A
    ADC $24,X               ; $8F66: 75 24
    .byte $14            ; $8F68
    .byte $0C            ; $8F69
    .byte $03            ; $8F6A
    ROL tmp0                ; $8F6B: 26 00
    .byte $04            ; $8F6D
    BMI $8EF7               ; $8F6E: 30 87
    .byte $23            ; $8F70
    STA (tmp1,X)            ; $8F71: 81 01
    BMI $8EFC               ; $8F73: 30 87
    .byte $23            ; $8F75
    .byte $83            ; $8F76
    ORA ($30,X)             ; $8F77: 01 30
    .byte $93            ; $8F79
    .byte $23            ; $8F7A
    .byte $82            ; $8F7B
    STY $51                 ; $8F7C: 84 51
    BCC $8F83               ; $8F7E: 90 03
    STY $65                 ; $8F80: 84 65
    .byte $8F            ; $8F82
    .byte $1F            ; $8F83
    ASL                     ; $8F84: 0A
    BRK                     ; $8F85: 00
    PHP                     ; $8F86: 08
    PLP                     ; $8F87: 28
    .byte $93            ; $8F88
    STA $2418               ; $8F89: 8D 18 24
    .byte $13            ; $8F8C
    .byte $0C            ; $8F8D
    .byte $03            ; $8F8E
    .byte $23            ; $8F8F
    STA (tmp1,X)            ; $8F90: 81 01
    ORA ($23,X)             ; $8F92: 01 23
    .byte $0B            ; $8F94
    ORA (tmp1),Y            ; $8F95: 11 01
    ORA ($24,X)             ; $8F97: 01 24
    ORA ($0C),Y             ; $8F99: 11 0C
    .byte $03            ; $8F9B
    .byte $23            ; $8F9C
    .byte $82            ; $8F9D
    ORA #$25                ; $8F9E: 09 25
    ASL $0A                 ; $8FA0: 06 0A
    ROL                     ; $8FA2: 2A
    .byte $03            ; $8FA3
    STY $8B                 ; $8FA4: 84 8B
    .byte $8F            ; $8FA6
    .byte $1F            ; $8FA7
    ASL                     ; $8FA8: 0A
    BRK                     ; $8FA9: 00
    PHP                     ; $8FAA: 08
    PLP                     ; $8FAB: 28
    STA $8D,X               ; $8FAC: 95 8D
    AND ($24,X)             ; $8FAE: 21 24
    ORA $0C,X               ; $8FB0: 15 0C
    .byte $03            ; $8FB2
    .byte $23            ; $8FB3
    .byte $83            ; $8FB4
    ORA ($23,X)             ; $8FB5: 01 23
    ORA #$11                ; $8FB7: 09 11
    ORA (tmp1,X)            ; $8FB9: 01 01
    ORA (tmp1,X)            ; $8FBB: 01 01
    BIT $17                 ; $8FBD: 24 17
    .byte $0C            ; $8FBF
    .byte $03            ; $8FC0
    .byte $23            ; $8FC1
    .byte $82            ; $8FC2
    ORA #$25                ; $8FC3: 09 25
    ASL $09                 ; $8FC5: 06 09
    PLP                     ; $8FC7: 28
    BRK                     ; $8FC8: 00
    BMI $8FD0               ; $8FC9: 30 05
    .byte $27            ; $8FCB
    ORA ($91,X)             ; $8FCC: 01 91
    .byte $62            ; $8FCE
    ROL                     ; $8FCF: 2A
    .byte $03            ; $8FD0
    STY $AF                 ; $8FD1: 84 AF
    .byte $8F            ; $8FD3
    .byte $1F            ; $8FD4
    BRK                     ; $8FD5: 00
    ORA ($08),Y             ; $8FD6: 11 08
    DEX                     ; $8FD8: CA
    STX $8A,Y               ; $8FD9: 96 8A
    BPL $900B               ; $8FDB: 10 2E
    ASL $2A08               ; $8FDD: 0E 08 2A
    ORA (tmp1,X)            ; $8FE0: 01 01
    ORA ($25,X)             ; $8FE2: 01 25
    .byte $14            ; $8FE4
    ASL                     ; $8FE5: 0A
    BIT $14                 ; $8FE6: 24 14
    PHP                     ; $8FE8: 08
    .byte $03            ; $8FE9
    ASL $2A                 ; $8FEA: 06 2A
    .byte $03            ; $8FEC
    STY $DC                 ; $8FED: 84 DC
    .byte $8F            ; $8FEF
    .byte $1F            ; $8FF0
    BRK                     ; $8FF1: 00
    ORA ($08),Y             ; $8FF2: 11 08
    DEX                     ; $8FF4: CA
    .byte $97            ; $8FF5
    TXA                     ; $8FF6: 8A
    .byte $1C            ; $8FF7
    ROL $080E               ; $8FF8: 2E 0E 08
    ROL                     ; $8FFB: 2A
    ORA (tmp1,X)            ; $8FFC: 01 01
    ORA (tmp1,X)            ; $8FFE: 01 01
    AND $14                 ; $9000: 25 14
    ASL                     ; $9002: 0A
    BIT $14                 ; $9003: 24 14
    ORA #$03                ; $9005: 09 03
    BIT $13                 ; $9007: 24 13
    ORA #$03                ; $9009: 09 03
    .byte $82            ; $900B
    ASL tmp1                ; $900C: 06 01
    STA ($23,X)             ; $900E: 81 23
    .byte $80            ; $9010
    ORA ($83,X)             ; $9011: 01 83
    SBC $8403,X             ; $9013: FD 03 84
    SED                     ; $9016: F8
    .byte $8F            ; $9017
    .byte $1F            ; $9018
    BRK                     ; $9019: 00
    ORA ($08),Y             ; $901A: 11 08
    DEX                     ; $901C: CA
    STX $89,Y               ; $901D: 96 89
    .byte $1C            ; $901F
    ROL $080E               ; $9020: 2E 0E 08
    ROL                     ; $9023: 2A
    ROL tmp3                ; $9024: 26 03
    .byte $04            ; $9026
    AND $14                 ; $9027: 25 14
    ASL                     ; $9029: 0A
    ORA ($24,X)             ; $902A: 01 24
    .byte $14            ; $902C
    .byte $07            ; $902D
    .byte $03            ; $902E
    BIT $13                 ; $902F: 24 13
    .byte $07            ; $9031
    .byte $03            ; $9032
    .byte $82            ; $9033
    ASL tmp1                ; $9034: 06 01
    STA ($23,X)             ; $9036: 81 23
    .byte $82            ; $9038
    ORA ($83,X)             ; $9039: 01 83
    SBC $8403,X             ; $903B: FD 03 84
    JSR $1F90               ; $903E: 20 90 1F
    RTS                     ; $9041: 60
    BRK                     ; $9042: 00
    PHP                     ; $9043: 08
    DEX                     ; $9044: CA
    ASL $08,X               ; $9045: 16 08
    BRK                     ; $9047: 00
    BRK                     ; $9048: 00
    .byte $1F            ; $9049
    BRK                     ; $904A: 00
    BRK                     ; $904B: 00
    INC $97C8,X             ; $904C: FE C8 97
    .byte $89            ; $904F
    EOR $8A,X               ; $9050: 55 8A
    ROR tmp1,X              ; $9052: 76 01
    .byte $23            ; $9054
    .byte $80            ; $9055
    BMI $8FE0               ; $9056: 30 88
    BIT $0314               ; $9058: 2C 14 03
    .byte $0B            ; $905B
    BIT $14                 ; $905C: 24 14
    .byte $0B            ; $905E
    .byte $03            ; $905F
    .byte $22            ; $9060
    ORA $2507,X             ; $9061: 1D 07 25
    .byte $14            ; $9064
    ORA #$0B                ; $9065: 09 0B
    BIT ptr_lo              ; $9067: 24 10
    ORA #$03                ; $9069: 09 03
    BIT ptr_lo              ; $906B: 24 10
    PHP                     ; $906D: 08
    .byte $03            ; $906E
    BIT $0E                 ; $906F: 24 0E
    PHP                     ; $9071: 08
    .byte $03            ; $9072
    BIT $0E                 ; $9073: 24 0E
    .byte $07            ; $9075
    .byte $03            ; $9076
    ORA ($23,X)             ; $9077: 01 23
    STA (tmp1,X)            ; $9079: 81 01
    ORA (tmp1,X)            ; $907B: 01 01
    .byte $23            ; $907D
    .byte $82            ; $907E
    ROL ptr0_lo             ; $907F: 26 04
    .byte $04            ; $9081
    BIT $12                 ; $9082: 24 12
    .byte $07            ; $9084
    .byte $03            ; $9085
    BIT $12                 ; $9086: 24 12
    PHP                     ; $9088: 08
    .byte $03            ; $9089
    BIT $13                 ; $908A: 24 13
    PHP                     ; $908C: 08
    .byte $03            ; $908D
    .byte $27            ; $908E
    JSR $6289               ; $908F: 20 89 62
    .byte $82            ; $9092
    ASL $23                 ; $9093: 06 23
    STA (tmp1,X)            ; $9095: 81 01
    STA ($82,X)             ; $9097: 81 82
    ASL $23                 ; $9099: 06 23
    .byte $80            ; $909B
    ORA ($81,X)             ; $909C: 01 81
    .byte $82            ; $909E
    ASL $23                 ; $909F: 06 23
    .byte $82            ; $90A1
    ORA ($81,X)             ; $90A2: 01 81
    .byte $83            ; $90A4
    INC $8403               ; $90A5: EE 03 84
    EOR ($90),Y             ; $90A8: 51 90
    .byte $1F            ; $90AA
    BRK                     ; $90AB: 00
    BRK                     ; $90AC: 00
    DEC $8EC6,X             ; $90AD: DE C6 8E
    STA ptr0_lo             ; $90B0: 85 04
    ROL ptr0_hi             ; $90B2: 26 05
    .byte $04            ; $90B4
    .byte $2F            ; $90B5
    .byte $03            ; $90B6
    STY $B2                 ; $90B7: 84 B2
    BCC $90DA               ; $90B9: 90 1F
    ROR                     ; $90BB: 6A
    BRK                     ; $90BC: 00
    CMP $1628,X             ; $90BD: DD 28 16
    BRK                     ; $90C0: 00
    BRK                     ; $90C1: 00
    BRK                     ; $90C2: 00
    .byte $1F            ; $90C3
    BRK                     ; $90C4: 00
    BRK                     ; $90C5: 00
    ASL $7F                 ; $90C6: 06 7F
    .byte $9B            ; $90C8
    LDA (tmp0,X)            ; $90C9: A1 00
    BRK                     ; $90CB: 00
    .byte $1F            ; $90CC
    BRK                     ; $90CD: 00
    DEY                     ; $90CE: 88
    ASL                     ; $90CF: 0A
    CMP $8B                 ; $90D0: C5 8B
    .byte $87            ; $90D2
    .byte $02            ; $90D3
    AND $0223               ; $90D4: 2D 23 02
    AND $0023               ; $90D7: 2D 23 00
    .byte $17            ; $90DA
    BRK                     ; $90DB: 00
    BPL $90F6               ; $90DC: 10 18
    PHP                     ; $90DE: 08
    .byte $87            ; $90DF
    .byte $97            ; $90E0
    BIT $82                 ; $90E1: 24 82
    ASL                     ; $90E3: 0A
    ORA ($81,X)             ; $90E4: 01 81
    BIT ptr0_hi             ; $90E6: 24 05
    .byte $14            ; $90E8
    .byte $03            ; $90E9
    BIT ptr0_hi             ; $90EA: 24 05
    ASL tmp3,X              ; $90EC: 16 03
    BIT $07                 ; $90EE: 24 07
    ASL tmp3,X              ; $90F0: 16 03
    BIT $07                 ; $90F2: 24 07
    .byte $14            ; $90F4
    .byte $03            ; $90F5
    BIT ptr0_hi             ; $90F6: 24 05
    .byte $14            ; $90F8
    .byte $03            ; $90F9
    BIT ptr0_hi             ; $90FA: 24 05
    ASL tmp3,X              ; $90FC: 16 03
    BIT $06                 ; $90FE: 24 06
    ASL tmp3,X              ; $9100: 16 03
    ASL $8A                 ; $9102: 06 8A
    .byte $89            ; $9104
    .byte $2F            ; $9105
    .byte $17            ; $9106
    BRK                     ; $9107: 00
    JSR $08FB               ; $9108: 20 FB 08
    .byte $8B            ; $910B
    STA $06,X               ; $910C: 95 06
    BIT $06                 ; $910E: 24 06
    ORA tmp3,X              ; $9110: 15 03
    ASL $2A                 ; $9112: 06 2A
    .byte $17            ; $9114
    BRK                     ; $9115: 00
    BRK                     ; $9116: 00
    BPL $9121               ; $9117: 10 08
    STX $97                 ; $9119: 86 97
    BRK                     ; $911B: 00
    .byte $17            ; $911C
    BRK                     ; $911D: 00
    JSR $08E7               ; $911E: 20 E7 08
    STY $0595               ; $9121: 8C 95 05
    BIT $09                 ; $9124: 24 09
    ORA tmp3,X              ; $9126: 15 03
    ROL                     ; $9128: 2A
    .byte $17            ; $9129
    BRK                     ; $912A: 00
    BRK                     ; $912B: 00
    .byte $22            ; $912C
    PHP                     ; $912D: 08
    STY $008F               ; $912E: 8C 8F 00
    .byte $17            ; $9131
    BRK                     ; $9132: 00
    BRK                     ; $9133: 00
    ORA ($08),Y             ; $9134: 11 08
    .byte $8B            ; $9136
    .byte $9B            ; $9137
    BRK                     ; $9138: 00
    .byte $17            ; $9139
    BRK                     ; $913A: 00
    BRK                     ; $913B: 00
    .byte $2B            ; $913C
    PHP                     ; $913D: 08
    STA $009B               ; $913E: 8D 9B 00
    BRK                     ; $9141: 00
    .byte $1F            ; $9142
    ORA $88                 ; $9143: 05 88
    ASL $0C,X               ; $9145: 16 0C
    STX $0196               ; $9147: 8E 96 01
    .byte $2B            ; $914A
    ORA ($2B,X)             ; $914B: 01 2B
    .byte $1F            ; $914D
    BRK                     ; $914E: 00
    BRK                     ; $914F: 00
    .byte $22            ; $9150
    ORA ($91),Y             ; $9151: 11 91
    .byte $92            ; $9153
    BRK                     ; $9154: 00
    BRK                     ; $9155: 00
    .byte $1F            ; $9156
    BRK                     ; $9157: 00
    BRK                     ; $9158: 00
    .byte $32            ; $9159
    ORA $99                 ; $915A: 05 99
    .byte $83            ; $915C
    BRK                     ; $915D: 00
    BRK                     ; $915E: 00
    .byte $1F            ; $915F
    ORA $83                 ; $9160: 05 83
    ROL $0D                 ; $9162: 26 0D
    .byte $93            ; $9164
    STY $2B01               ; $9165: 8C 01 2B
    .byte $12            ; $9168
    BIT $13                 ; $9169: 24 13
    .byte $0F            ; $916B
    .byte $03            ; $916C
    BIT $0D                 ; $916D: 24 0D
    .byte $0F            ; $916F
    .byte $03            ; $9170
    BIT $0D                 ; $9171: 24 0D
    ORA #$03                ; $9173: 09 03
    BIT $13                 ; $9175: 24 13
    ORA #$03                ; $9177: 09 03
    .byte $83            ; $9179
    BEQ $9198               ; $917A: F0 1C
    ORA $1B14               ; $917C: 0D 14 1B
    .byte $92            ; $917F
    .byte $87            ; $9180
    STX $07                 ; $9181: 86 07
    BPL $9188               ; $9183: 10 03
    STY $98                 ; $9185: 84 98
    STA (ptr0_hi),Y         ; $9187: 91 05
    .byte $23            ; $9189
    .byte $83            ; $918A
    ORA ($83,X)             ; $918B: 01 83
    .byte $FF            ; $918D
    .byte $1C            ; $918E
    ORA $1B14               ; $918F: 0D 14 1B
    STA ($85),Y             ; $9192: 91 85
    STX ptr_hi              ; $9194: 86 11
    .byte $14            ; $9196
    ORA $23                 ; $9197: 05 23
    .byte $83            ; $9199
    ORA ($83,X)             ; $919A: 01 83
    SBC $2305,X             ; $919C: FD 05 23
    STA (tmp1,X)            ; $919F: 81 01
    .byte $83            ; $91A1
    .byte $FF            ; $91A2
    .byte $1B            ; $91A3
    ORA $80                 ; $91A4: 05 80
    ASL $0B,X               ; $91A6: 16 0B
    STA ($96),Y             ; $91A8: 91 96
    .byte $14            ; $91AA
    CLC                     ; $91AB: 18
    ORA ($2B,X)             ; $91AC: 01 2B
    BRK                     ; $91AE: 00
    ORA $0022,Y             ; $91AF: 19 22 00
    AND (tmp2,X)            ; $91B2: 21 02
    .byte $89            ; $91B4
    .byte $17            ; $91B5
    ROL                     ; $91B6: 2A
    ASL $0001               ; $91B7: 0E 01 00
    BRK                     ; $91BA: 00
    CLC                     ; $91BB: 18
    ROL ptr_lo              ; $91BC: 26 10
    ORA ptr_lo              ; $91BE: 05 10
    STA (ptr0_lo,X)         ; $91C0: 81 04
    AND ($2A,X)             ; $91C2: 21 2A
    ORA (tmp1),Y            ; $91C4: 11 01
    ORA $23                 ; $91C6: 05 23
    STA (tmp1,X)            ; $91C8: 81 01
    .byte $83            ; $91CA
    SBC $1700,X             ; $91CB: FD 00 17
    .byte $04            ; $91CE
    JSR $131B               ; $91CF: 20 1B 13
    STA $82                 ; $91D2: 85 82
    .byte $1A            ; $91D4
    .byte $82            ; $91D5
    ASL tmp1                ; $91D6: 06 01
    STA ($23,X)             ; $91D8: 81 23
    STA ($82,X)             ; $91DA: 81 82
    .byte $02            ; $91DC
    ORA ($81,X)             ; $91DD: 01 81
    .byte $23            ; $91DF
    .byte $83            ; $91E0
    .byte $82            ; $91E1
    PHP                     ; $91E2: 08
    ORA ($81,X)             ; $91E3: 01 81
    .byte $23            ; $91E5
    STA ($82,X)             ; $91E6: 81 82
    .byte $04            ; $91E8
    ORA ($81,X)             ; $91E9: 01 81
    .byte $23            ; $91EB
    .byte $83            ; $91EC
    .byte $83            ; $91ED
    INX                     ; $91EE: E8
    .byte $17            ; $91EF
    .byte $04            ; $91F0
    BPL $920E               ; $91F1: 10 1B
    .byte $12            ; $91F3
    .byte $87            ; $91F4
    .byte $82            ; $91F5
    ORA $23                 ; $91F6: 05 23
    .byte $83            ; $91F8
    ORA ($83,X)             ; $91F9: 01 83
    SBC $0417,X             ; $91FB: FD 17 04
    BPL $921B               ; $91FE: 10 1B
    ORA ($85),Y             ; $9200: 11 85
    STY ptr0_hi             ; $9202: 84 05
    .byte $23            ; $9204
    .byte $83            ; $9205
    ORA ($83,X)             ; $9206: 01 83
    SBC $0817,X             ; $9208: FD 17 08
    BPL $9228               ; $920B: 10 1B
    .byte $4F            ; $920D
    STY $8A                 ; $920E: 84 8A
    .byte $12            ; $9210
    BIT ptr0_hi             ; $9211: 24 05
    ASL                     ; $9213: 0A
    .byte $03            ; $9214
    BIT ptr0_hi             ; $9215: 24 05
    ORA #$03                ; $9217: 09 03
    BIT tmp1                ; $9219: 24 01
    ORA #$03                ; $921B: 09 03
    BIT tmp1                ; $921D: 24 01
    ASL                     ; $921F: 0A
    .byte $03            ; $9220
    .byte $83            ; $9221
    BEQ $923B               ; $9222: F0 17
    PHP                     ; $9224: 08
    BPL $923A               ; $9225: 10 13
    LSR $8A83               ; $9227: 4E 83 8A
    .byte $03            ; $922A
    STY ptr_hi              ; $922B: 84 11
    .byte $92            ; $922D
    .byte $17            ; $922E
    .byte $04            ; $922F
    BRK                     ; $9230: 00
    ASL $0E,X               ; $9231: 16 0E
    STY $8C                 ; $9233: 84 8C
    BRK                     ; $9235: 00
    .byte $17            ; $9236
    .byte $04            ; $9237
    .byte $80            ; $9238
    BPL $924A               ; $9239: 10 0F
    STA $91                 ; $923B: 85 91
    ASL $24,X               ; $923D: 16 24
    ASL ptr_hi              ; $923F: 06 11
    .byte $03            ; $9241
    .byte $82            ; $9242
    ASL $23                 ; $9243: 06 23
    .byte $80            ; $9245
    ORA ($81,X)             ; $9246: 01 81
    BIT ptr0_hi             ; $9248: 24 05
    ORA (tmp3),Y            ; $924A: 11 03
    .byte $82            ; $924C
    ASL $23                 ; $924D: 06 23
    .byte $80            ; $924F
    ORA ($81,X)             ; $9250: 01 81
    .byte $83            ; $9252
    CPX $0017               ; $9253: EC 17 00
    BRK                     ; $9256: 00
    .byte $22            ; $9257
    .byte $03            ; $9258
    STA ($83),Y             ; $9259: 91 83
    BRK                     ; $925B: 00
    .byte $17            ; $925C
    BRK                     ; $925D: 00
    BRK                     ; $925E: 00
    .byte $22            ; $925F
    ORA ($8F,X)             ; $9260: 01 8F
    .byte $83            ; $9262
    BRK                     ; $9263: 00
    BRK                     ; $9264: 00
    .byte $1F            ; $9265
    ASL                     ; $9266: 0A
    .byte $44            ; $9267
    .byte $5A            ; $9268
    AND #$9C                ; $9269: 29 9C
    .byte $82            ; $926B
    ORA ($2B,X)             ; $926C: 01 2B
    ORA ($2B,X)             ; $926E: 01 2B
    .byte $1B            ; $9270
    ORA $80                 ; $9271: 05 80
    ROR $15                 ; $9273: 66 15
    .byte $83            ; $9275
    .byte $04            ; $9276
    ORA (ptr0_lo,X)         ; $9277: 01 04
    ORA ($2B,X)             ; $9279: 01 2B
    BRK                     ; $927B: 00
    .byte $0F            ; $927C
    PLP                     ; $927D: 28
    BRK                     ; $927E: 00
    AND ($2A,X)             ; $927F: 21 2A
    ORA ($1B,X)             ; $9281: 01 1B
    BRK                     ; $9283: 00
    .byte $0F            ; $9284
    BIT tmp0                ; $9285: 24 00
    ORA $0112,Y             ; $9287: 19 12 01
    ASL tmp0                ; $928A: 06 00
    .byte $0F            ; $928C
    .byte $04            ; $928D
    BRK                     ; $928E: 00
    .byte $12            ; $928F
    .byte $0F            ; $9290
    .byte $1B            ; $9291
    STY tmp0                ; $9292: 84 00
    .byte $0F            ; $9294
    PLP                     ; $9295: 28
    BRK                     ; $9296: 00
    ORA $1B2B,Y             ; $9297: 19 2B 1B
    ORA tmp0                ; $929A: 05 00
    .byte $0F            ; $929C
    PHP                     ; $929D: 08
    .byte $04            ; $929E
    ORA $041D,Y             ; $929F: 19 1D 04
    TXS                     ; $92A2: 9A
    ORA ($2B,X)             ; $92A3: 01 2B
    BRK                     ; $92A5: 00
    .byte $1F            ; $92A6
    BRK                     ; $92A7: 00
    BRK                     ; $92A8: 00
    .byte $32            ; $92A9
    AND $988B               ; $92AA: 2D 8B 98
    BRK                     ; $92AD: 00
    BRK                     ; $92AE: 00
    .byte $1F            ; $92AF
    BRK                     ; $92B0: 00
    BRK                     ; $92B1: 00
    .byte $22            ; $92B2
    ASL $88                 ; $92B3: 06 88
    TAY                     ; $92B5: A8
    BRK                     ; $92B6: 00
    BRK                     ; $92B7: 00
    .byte $1F            ; $92B8
    BRK                     ; $92B9: 00
    .byte $80            ; $92BA
    .byte $1F            ; $92BB
    INX                     ; $92BC: E8
    STY $9F,X               ; $92BD: 94 9F
    .byte $02            ; $92BF
    AND $0022               ; $92C0: 2D 22 00
    .byte $1C            ; $92C3
    BRK                     ; $92C4: 00
    ORA ($67,X)             ; $92C5: 01 67
    CPX $A595               ; $92C7: EC 95 A5
    .byte $17            ; $92CA
    ROL $0500               ; $92CB: 2E 00 05
    .byte $23            ; $92CE
    .byte $83            ; $92CF
    ORA ($83,X)             ; $92D0: 01 83
    SBC $001C,X             ; $92D2: FD 1C 00
    ORA (ptr0_hi,X)         ; $92D5: 01 05
    .byte $EB            ; $92D7
    .byte $93            ; $92D8
    LDA ptr_hi              ; $92D9: A5 11
    NOP                     ; $92DB: EA
    BRK                     ; $92DC: 00
    ORA $23                 ; $92DD: 05 23
    STA (tmp1,X)            ; $92DF: 81 01
    .byte $83            ; $92E1
    SBC $001B,X             ; $92E2: FD 1B 00
    PLA                     ; $92E5: 68
    ASL $8BE9               ; $92E6: 0E E9 8B
    STY $17                 ; $92E9: 84 17
    ORA $2B01,Y             ; $92EB: 19 01 2B
    .byte $02            ; $92EE
    AND $1822               ; $92EF: 2D 22 18
    JSR $2200               ; $92F2: 20 00 22
    .byte $02            ; $92F5
    STY $1A                 ; $92F6: 84 1A
    AND ($ED,X)             ; $92F8: 21 ED
    ORA ($23,X)             ; $92FA: 01 23
    BRK                     ; $92FC: 00
    BRK                     ; $92FD: 00
    CLC                     ; $92FE: 18
    .byte $22            ; $92FF
    BPL $931C               ; $9300: 10 1A
    .byte $E7            ; $9302
    STA $652C               ; $9303: 8D 2C 65
    .byte $2B            ; $9306
    .byte $17            ; $9307
    .byte $2B            ; $9308
    ORA ($2B,X)             ; $9309: 01 2B
    BRK                     ; $930B: 00
    CLC                     ; $930C: 18
    JSR $1210               ; $930D: 20 10 12
    NOP                     ; $9310: EA
    .byte $8B            ; $9311
    AND (ptr0_hi,X)         ; $9312: 21 05
    .byte $EB            ; $9314
    .byte $17            ; $9315
    AND #$05                ; $9316: 29 05
    .byte $23            ; $9318
    .byte $82            ; $9319
    ORA ($83,X)             ; $931A: 01 83
    SBC $1800,X             ; $931C: FD 00 18
    .byte $22            ; $931F
    BPL $9339               ; $9320: 10 17
    ROL $228C               ; $9322: 2E 8C 22
    ORA $142B,Y             ; $9325: 19 2B 14
    ORA $2305,X             ; $9328: 1D 05 23
    .byte $83            ; $932B
    ORA ($83,X)             ; $932C: 01 83
    SBC $0000,X             ; $932E: FD 00 00
    CLC                     ; $9331: 18
    AND $80                 ; $9332: 25 80
    .byte $1A            ; $9334
    ORA $0493,Y             ; $9335: 19 93 04
    ORA $1584,Y             ; $9338: 19 84 15
    ORA tmp1                ; $933B: 05 01
    .byte $2B            ; $933D
    BRK                     ; $933E: 00
    CLC                     ; $933F: 18
    .byte $22            ; $9340
    BRK                     ; $9341: 00
    .byte $13            ; $9342
    .byte $0F            ; $9343
    .byte $83            ; $9344
    .byte $03            ; $9345
    ORA ($2B),Y             ; $9346: 11 2B
    ORA $07,X               ; $9348: 15 07
    BRK                     ; $934A: 00
    BRK                     ; $934B: 00
    .byte $0F            ; $934C
    BRK                     ; $934D: 00
    ORA (ptr_hi,X)          ; $934E: 01 11
    BPL $9358               ; $9350: 10 06
    STY ptr0_hi             ; $9352: 84 05
    .byte $23            ; $9354
    STA (tmp1,X)            ; $9355: 81 01
    .byte $83            ; $9357
    SBC $000F,X             ; $9358: FD 0F 00
    BRK                     ; $935B: 00
    AND #$13                ; $935C: 29 13
    ORA ($83,X)             ; $935E: 01 83
    BRK                     ; $9360: 00
    BRK                     ; $9361: 00
    .byte $1F            ; $9362
    .byte $6F            ; $9363
    BRK                     ; $9364: 00
    AND ($B5),Y             ; $9365: 31 B5
    ORA $000F,Y             ; $9367: 19 0F 00
    BRK                     ; $936A: 00
    .byte $1F            ; $936B
    .byte $0F            ; $936C
    DEY                     ; $936D: 88
    ASL $B4,X               ; $936E: 16 B4
    STA $90,X               ; $9370: 95 90
    ORA ($2B,X)             ; $9372: 01 2B
    ORA ($2B,X)             ; $9374: 01 2B
    .byte $1F            ; $9376
    .byte $0F            ; $9377
    .byte $33            ; $9378
    .byte $67            ; $9379
    .byte $B3            ; $937A
    STA ($90),Y             ; $937B: 91 90
    ASL $24,X               ; $937D: 16 24
    .byte $0F            ; $937F
    BPL $9385               ; $9380: 10 03
    BIT $0F                 ; $9382: 24 0F
    .byte $0F            ; $9384
    .byte $03            ; $9385
    BIT $0F                 ; $9386: 24 0F
    .byte $0F            ; $9388
    .byte $03            ; $9389
    BIT ptr_hi              ; $938A: 24 11
    .byte $0F            ; $938C
    .byte $03            ; $938D
    BIT ptr_hi              ; $938E: 24 11
    BPL $9395               ; $9390: 10 03
    .byte $83            ; $9392
    CPX $8403               ; $9393: EC 03 84
    ROR $1F93,X             ; $9396: 7E 93 1F
    .byte $0F            ; $9399
    BRK                     ; $939A: 00
    BNE $935B               ; $939B: D0 BE
    DEY                     ; $939D: 88
    STA tmp0,X              ; $939E: 95 00
    BRK                     ; $93A0: 00
    .byte $1F            ; $93A1
    .byte $0F            ; $93A2
    BRK                     ; $93A3: 00
    ROL $BD,X               ; $93A4: 36 BD
    TXA                     ; $93A6: 8A
    .byte $97            ; $93A7
    BRK                     ; $93A8: 00
    BRK                     ; $93A9: 00
    .byte $1F            ; $93AA
    .byte $0F            ; $93AB
    .byte $33            ; $93AC
    .byte $D4            ; $93AD
    LDY $9386,X             ; $93AE: BC 86 93
    ORA $24,X               ; $93B1: 15 24
    .byte $0B            ; $93B3
    .byte $13            ; $93B4
    .byte $03            ; $93B5
    BIT $0B                 ; $93B6: 24 0B
    CLC                     ; $93B8: 18
    .byte $03            ; $93B9
    .byte $23            ; $93BA
    .byte $83            ; $93BB
    ORA ($24,X)             ; $93BC: 01 24
    .byte $0B            ; $93BE
    .byte $13            ; $93BF
    .byte $03            ; $93C0
    BIT $06                 ; $93C1: 24 06
    .byte $13            ; $93C3
    .byte $03            ; $93C4
    .byte $83            ; $93C5
    SBC $8403               ; $93C6: ED 03 84
    .byte $B2            ; $93C9
    .byte $93            ; $93CA
    BRK                     ; $93CB: 00
    .byte $1F            ; $93CC
    .byte $6F            ; $93CD
    BRK                     ; $93CE: 00
    LDA ($BF,X)             ; $93CF: A1 BF
    .byte $0C            ; $93D1
    ASL tmp0                ; $93D2: 06 00
    BRK                     ; $93D4: 00
    .byte $1F            ; $93D5
    .byte $0F            ; $93D6
    BRK                     ; $93D7: 00
    .byte $32            ; $93D8
    CPY #$8C                ; $93D9: C0 8C
    STX $0000               ; $93DB: 8E 00 00
    .byte $1F            ; $93DE
    .byte $0F            ; $93DF
    DEY                     ; $93E0: 88
    ROR $C1                 ; $93E1: 66 C1
    STY $0193               ; $93E3: 8C 93 01
    .byte $2B            ; $93E6
    ORA ($2B,X)             ; $93E7: 01 2B
    BRK                     ; $93E9: 00
    .byte $1F            ; $93EA
    ROR                     ; $93EB: 6A
    BRK                     ; $93EC: 00
    LDA ($28,X)             ; $93ED: A1 28
    ORA $0027               ; $93EF: 0D 27 00
    BRK                     ; $93F2: 00
    BRK                     ; $93F3: 00
    .byte $1F            ; $93F4
    .byte $0F            ; $93F5
    ORA ($A2),Y             ; $93F6: 11 A2
    .byte $C2            ; $93F8
    .byte $92            ; $93F9
    STY tmp2,X              ; $93FA: 94 02
    AND $0233               ; $93FC: 2D 33 02
    AND $0033               ; $93FF: 2D 33 00
    .byte $17            ; $9402
    BRK                     ; $9403: 00
    JSR $08E6               ; $9404: 20 E6 08
    STY $0886               ; $9407: 8C 86 08
    .byte $23            ; $940A
    .byte $83            ; $940B
    BIT $0A                 ; $940C: 24 0A
    ORA tmp3                ; $940E: 05 03
    PHP                     ; $9410: 08
    .byte $2F            ; $9411
    .byte $97            ; $9412
    BRK                     ; $9413: 00
    JSR $0802               ; $9414: 20 02 08
    STY $0486               ; $9417: 8C 86 04
    ORA ($84,X)             ; $941A: 01 84
    ASL                     ; $941C: 0A
    STY $17,X               ; $941D: 94 17
    BRK                     ; $941F: 00
    JSR $08FE               ; $9420: 20 FE 08
    STY $0486               ; $9423: 8C 86 04
    ORA ($84,X)             ; $9426: 01 84
    .byte $1A            ; $9428
    STY $17,X               ; $9429: 94 17
    BRK                     ; $942B: 00
    JSR $08F2               ; $942C: 20 F2 08
    STY $0486               ; $942F: 8C 86 04
    ORA ($84,X)             ; $9432: 01 84
    ROL $94                 ; $9434: 26 94
    .byte $97            ; $9436
    BRK                     ; $9437: 00
    BPL $94B2               ; $9438: 10 78
    PHP                     ; $943A: 08
    ASL                     ; $943B: 0A
    STY $08                 ; $943C: 84 08
    .byte $82            ; $943E
    .byte $12            ; $943F
    BRK                     ; $9440: 00
    STA ($24,X)             ; $9441: 81 24
    ASL                     ; $9443: 0A
    BRK                     ; $9444: 00
    .byte $03            ; $9445
    .byte $17            ; $9446
    BRK                     ; $9447: 00
    JSR $085F               ; $9448: 20 5F 08
    .byte $8B            ; $944B
    .byte $87            ; $944C
    .byte $04            ; $944D
    ORA ($84,X)             ; $944E: 01 84
    .byte $32            ; $9450
    STY $17,X               ; $9451: 94 17
    BRK                     ; $9453: 00
    JSR $088F               ; $9454: 20 8F 08
    STY $0387               ; $9457: 8C 87 03
    STY $4E                 ; $945A: 84 4E
    STY $97,X               ; $945C: 94 97
    BRK                     ; $945E: 00
    BPL $94DD               ; $945F: 10 7C
    PHP                     ; $9461: 08
    ASL                     ; $9462: 0A
    STA tmp3                ; $9463: 85 03
    STY $3E                 ; $9465: 84 3E
    STY tmp0,X              ; $9467: 94 00
    .byte $7F            ; $9469
    ORA tmp0                ; $946A: 05 00
    ROL $48                 ; $946C: 26 48
    .byte $92            ; $946E
    TYA                     ; $946F: 98
    AND $22                 ; $9470: 25 22
    .byte $03            ; $9472
    .byte $27            ; $9473
    .byte $80            ; $9474
    .byte $80            ; $9475
    .byte $62            ; $9476
    BIT $0E                 ; $9477: 24 0E
    CLC                     ; $9479: 18
    .byte $03            ; $947A
    BIT $0E                 ; $947B: 24 0E
    ASL tmp3,X              ; $947D: 16 03
    BIT $0B                 ; $947F: 24 0B
    ASL tmp3,X              ; $9481: 16 03
    BIT $0B                 ; $9483: 24 0B
    .byte $14            ; $9485
    .byte $03            ; $9486
    .byte $07            ; $9487
    AND $0B                 ; $9488: 25 0B
    .byte $13            ; $948A
    .byte $0B            ; $948B
    BIT $0B                 ; $948C: 24 0B
    ASL $2403               ; $948E: 0E 03 24
    .byte $0F            ; $9491
    ASL $0803               ; $9492: 0E 03 08
    ROL                     ; $9495: 2A
    .byte $03            ; $9496
    STY $71                 ; $9497: 84 71
    STY tmp0,X              ; $9499: 94 00
    .byte $17            ; $949B
    BRK                     ; $949C: 00
    BRK                     ; $949D: 00
    ORA #$08                ; $949E: 09 08
    STA $0099               ; $94A0: 8D 99 00
    .byte $17            ; $94A3
    BRK                     ; $94A4: 00
    BRK                     ; $94A5: 00
    .byte $0B            ; $94A6
    PHP                     ; $94A7: 08
    BCC $9443               ; $94A8: 90 99
    BRK                     ; $94AA: 00
    .byte $17            ; $94AB
    BRK                     ; $94AC: 00
    RTI                     ; $94AD: 40
    .byte $67            ; $94AE
    PHP                     ; $94AF: 08
    STA $048F               ; $94B0: 8D 8F 04
    BIT tmp3                ; $94B3: 24 03
    BPL $94BA               ; $94B5: 10 03
    .byte $17            ; $94B7
    BRK                     ; $94B8: 00
    BMI $949F               ; $94B9: 30 E4
    PHP                     ; $94BB: 08
    .byte $8F            ; $94BC
    .byte $9B            ; $94BD
    .byte $03            ; $94BE
    STY $D2                 ; $94BF: 84 D2
    STY $17,X               ; $94C1: 94 17
    BRK                     ; $94C3: 00
    BRK                     ; $94C4: 00
    .byte $1C            ; $94C5
    PHP                     ; $94C6: 08
    STA $9A,X               ; $94C7: 95 9A
    BRK                     ; $94C9: 00
    .byte $97            ; $94CA
    BRK                     ; $94CB: 00
    BMI $94CE               ; $94CC: 30 00
    PHP                     ; $94CE: 08
    .byte $8F            ; $94CF
    TYA                     ; $94D0: 98
    .byte $04            ; $94D1
    BIT $0F                 ; $94D2: 24 0F
    ASL $1703               ; $94D4: 0E 03 17
    BRK                     ; $94D7: 00
    BMI $94CE               ; $94D8: 30 F4
    PHP                     ; $94DA: 08
    .byte $8F            ; $94DB
    STA $8403,Y             ; $94DC: 99 03 84
    .byte $D2            ; $94DF
    STY $17,X               ; $94E0: 94 17
    BRK                     ; $94E2: 00
    BMI $94CD               ; $94E3: 30 E8
    PHP                     ; $94E5: 08
    .byte $8F            ; $94E6
    TXS                     ; $94E7: 9A
    .byte $03            ; $94E8
    STY $D2                 ; $94E9: 84 D2
    STY tmp0,X              ; $94EB: 94 00
    .byte $17            ; $94ED
    BRK                     ; $94EE: 00
    BRK                     ; $94EF: 00
    CPX $08                 ; $94F0: E4 08
    .byte $89            ; $94F2
    .byte $8B            ; $94F3
    BRK                     ; $94F4: 00
    .byte $17            ; $94F5
    BRK                     ; $94F6: 00
    BRK                     ; $94F7: 00
    .byte $F4            ; $94F8
    PHP                     ; $94F9: 08
    TXA                     ; $94FA: 8A
    .byte $89            ; $94FB
    BRK                     ; $94FC: 00
    .byte $97            ; $94FD
    BRK                     ; $94FE: 00
    BRK                     ; $94FF: 00
    BRK                     ; $9500: 00
    PHP                     ; $9501: 08
    .byte $89            ; $9502
    .byte $89            ; $9503
    BRK                     ; $9504: 00
    .byte $17            ; $9505
    BRK                     ; $9506: 00
    BRK                     ; $9507: 00
    .byte $07            ; $9508
    PHP                     ; $9509: 08
    STA $008A               ; $950A: 8D 8A 00
    .byte $17            ; $950D
    BRK                     ; $950E: 00
    BRK                     ; $950F: 00
    INX                     ; $9510: E8
    PHP                     ; $9511: 08
    DEY                     ; $9512: 88
    .byte $89            ; $9513
    BRK                     ; $9514: 00
    .byte $17            ; $9515
    BRK                     ; $9516: 00
    BRK                     ; $9517: 00
    .byte $02            ; $9518
    PHP                     ; $9519: 08
    .byte $89            ; $951A
    .byte $87            ; $951B
    BRK                     ; $951C: 00
    BRK                     ; $951D: 00
    .byte $17            ; $951E
    BRK                     ; $951F: 00
    BRK                     ; $9520: 00
    ORA $08,X               ; $9521: 15 08
    STA $0084               ; $9523: 8D 84 00
    .byte $97            ; $9526
    BRK                     ; $9527: 00
    BRK                     ; $9528: 00
    ORA ($08,X)             ; $9529: 01 08
    TXA                     ; $952B: 8A
    STY tmp0                ; $952C: 84 00
    .byte $17            ; $952E
    BRK                     ; $952F: 00
    RTI                     ; $9530: 40
    .byte $67            ; $9531
    PHP                     ; $9532: 08
    .byte $8F            ; $9533
    DEY                     ; $9534: 88
    .byte $04            ; $9535
    BIT tmp1                ; $9536: 24 01
    PHP                     ; $9538: 08
    .byte $03            ; $9539
    BRK                     ; $953A: 00
    .byte $17            ; $953B
    BRK                     ; $953C: 00
    BRK                     ; $953D: 00
    ROR $08                 ; $953E: 66 08
    .byte $89            ; $9540
    .byte $8B            ; $9541
    BRK                     ; $9542: 00
    .byte $17            ; $9543
    BRK                     ; $9544: 00
    BRK                     ; $9545: 00
    LSR $08,X               ; $9546: 56 08
    STA $89,X               ; $9548: 95 89
    BRK                     ; $954A: 00
    .byte $17            ; $954B
    BRK                     ; $954C: 00
    JSR $08EF               ; $954D: 20 EF 08
    STA $1685               ; $9550: 8D 85 16
    BIT $0C                 ; $9553: 24 0C
    .byte $04            ; $9555
    .byte $03            ; $9556
    BIT $0A                 ; $9557: 24 0A
    .byte $04            ; $9559
    .byte $03            ; $955A
    ORA $82                 ; $955B: 05 82
    .byte $04            ; $955D
    BRK                     ; $955E: 00
    STA (tmp1,X)            ; $955F: 81 01
    BIT $0B                 ; $9561: 24 0B
    .byte $04            ; $9563
    .byte $03            ; $9564
    BIT $0B                 ; $9565: 24 0B
    ORA (tmp3,X)            ; $9567: 01 03
    .byte $17            ; $9569
    BRK                     ; $956A: 00
    JSR $08F3               ; $956B: 20 F3 08
    STX $1685               ; $956E: 8E 85 16
    BIT $0C                 ; $9571: 24 0C
    .byte $04            ; $9573
    .byte $03            ; $9574
    BIT $0B                 ; $9575: 24 0B
    .byte $04            ; $9577
    .byte $03            ; $9578
    ORA $82                 ; $9579: 05 82
    .byte $04            ; $957B
    BRK                     ; $957C: 00
    STA (tmp1,X)            ; $957D: 81 01
    BIT $0C                 ; $957F: 24 0C
    .byte $04            ; $9581
    .byte $03            ; $9582
    BIT $0C                 ; $9583: 24 0C
    ORA (tmp3,X)            ; $9585: 01 03
    .byte $17            ; $9587
    BRK                     ; $9588: 00
    JSR $08E7               ; $9589: 20 E7 08
    .byte $8F            ; $958C
    STA $0E                 ; $958D: 85 0E
    BIT $0C                 ; $958F: 24 0C
    ORA tmp3                ; $9591: 05 03
    ORA $82                 ; $9593: 05 82
    ASL tmp0                ; $9595: 06 00
    STA (tmp1,X)            ; $9597: 81 01
    BIT $0C                 ; $9599: 24 0C
    .byte $02            ; $959B
    .byte $03            ; $959C
    BRK                     ; $959D: 00
    .byte $17            ; $959E
    BRK                     ; $959F: 00
    JSR $08EC               ; $95A0: 20 EC 08
    .byte $93            ; $95A3
    STX $08,Y               ; $95A4: 96 08
    BIT $13                 ; $95A6: 24 13
    .byte $12            ; $95A8
    .byte $03            ; $95A9
    ORA tmp1                ; $95AA: 05 01
    .byte $83            ; $95AC
    INC $0017,X             ; $95AD: FE 17 00
    JSR $08F0               ; $95B0: 20 F0 08
    .byte $93            ; $95B3
    .byte $97            ; $95B4
    PHP                     ; $95B5: 08
    BIT $13                 ; $95B6: 24 13
    .byte $13            ; $95B8
    .byte $03            ; $95B9
    ASL tmp1                ; $95BA: 06 01
    .byte $83            ; $95BC
    INC $0017,X             ; $95BD: FE 17 00
    JSR $08E4               ; $95C0: 20 E4 08
    .byte $93            ; $95C3
    TYA                     ; $95C4: 98
    ASL $1324               ; $95C5: 0E 24 13
    ORA tmp3,X              ; $95C8: 15 03
    ORA ($82),Y             ; $95CA: 11 82
    ASL tmp1                ; $95CC: 06 01
    BIT $14                 ; $95CE: 24 14
    ORA tmp3,X              ; $95D0: 15 03
    ASL $2A                 ; $95D2: 06 2A
    .byte $57            ; $95D4
    BRK                     ; $95D5: 00
    BPL $960A               ; $95D6: 10 32
    PHP                     ; $95D8: 08
    STX $1596               ; $95D9: 8E 96 15
    .byte $82            ; $95DC
    ASL tmp1                ; $95DD: 06 01
    STA ($24,X)             ; $95DF: 81 24
    BPL $95F9               ; $95E1: 10 16
    .byte $03            ; $95E3
    BIT ptr_lo              ; $95E4: 24 10
    CLC                     ; $95E6: 18
    .byte $03            ; $95E7
    BIT $13                 ; $95E8: 24 13
    CLC                     ; $95EA: 18
    .byte $03            ; $95EB
    BIT $13                 ; $95EC: 24 13
    .byte $14            ; $95EE
    .byte $03            ; $95EF
    ROL                     ; $95F0: 2A
    .byte $17            ; $95F1
    BRK                     ; $95F2: 00
    BRK                     ; $95F3: 00
    .byte $22            ; $95F4
    PHP                     ; $95F5: 08
    .byte $97            ; $95F6
    STX tmp0,Y              ; $95F7: 96 00
    .byte $57            ; $95F9
    BRK                     ; $95FA: 00
    BPL $9613               ; $95FB: 10 16
    PHP                     ; $95FD: 08
    .byte $93            ; $95FE
    STA $8209               ; $95FF: 8D 09 82
    PHP                     ; $9602: 08
    ORA ($81,X)             ; $9603: 01 81
    BIT $13                 ; $9605: 24 13
    ORA (tmp3),Y            ; $9607: 11 03
    ROL                     ; $9609: 2A
    .byte $57            ; $960A
    BRK                     ; $960B: 00
    BPL $962F               ; $960C: 10 21
    PHP                     ; $960E: 08
    TXA                     ; $960F: 8A
    .byte $92            ; $9610
    ORA #$82                ; $9611: 09 82
    PHP                     ; $9613: 08
    ORA ($81,X)             ; $9614: 01 81
    BIT $12                 ; $9616: 24 12
    .byte $12            ; $9618
    .byte $03            ; $9619
    ROL                     ; $961A: 2A
    .byte $57            ; $961B
    BRK                     ; $961C: 00
    BPL $9684               ; $961D: 10 65
    PHP                     ; $961F: 08
    .byte $89            ; $9620
    .byte $93            ; $9621
    ORA #$82                ; $9622: 09 82
    PHP                     ; $9624: 08
    ORA ($81,X)             ; $9625: 01 81
    BIT $12                 ; $9627: 24 12
    .byte $13            ; $9629
    .byte $03            ; $962A
    ROL                     ; $962B: 2A
    .byte $57            ; $962C
    BRK                     ; $962D: 00
    BPL $965B               ; $962E: 10 2B
    PHP                     ; $9630: 08
    .byte $9B            ; $9631
    .byte $93            ; $9632
    ORA #$82                ; $9633: 09 82
    PHP                     ; $9635: 08
    ORA ($81,X)             ; $9636: 01 81
    BIT $14                 ; $9638: 24 14
    .byte $13            ; $963A
    .byte $03            ; $963B
    ROL                     ; $963C: 2A
    .byte $57            ; $963D
    BRK                     ; $963E: 00
    BPL $95F0               ; $963F: 10 AF
    PHP                     ; $9641: 08
    .byte $9B            ; $9642
    .byte $92            ; $9643
    ORA #$82                ; $9644: 09 82
    PHP                     ; $9646: 08
    ORA ($81,X)             ; $9647: 01 81
    BIT $14                 ; $9649: 24 14
    .byte $12            ; $964B
    .byte $03            ; $964C
    ROL                     ; $964D: 2A
    BRK                     ; $964E: 00
    .byte $0F            ; $964F
    BRK                     ; $9650: 00
    ORA ($F2,X)             ; $9651: 01 F2
    PHP                     ; $9653: 08
    .byte $0C            ; $9654
    .byte $8B            ; $9655
    .byte $1F            ; $9656
    BIT $08                 ; $9657: 24 08
    .byte $0B            ; $9659
    .byte $03            ; $965A
    ASL $06                 ; $965B: 06 06
    BIT ptr_lo              ; $965D: 24 10
    .byte $0B            ; $965F
    .byte $03            ; $9660
    ORA ptr0_hi             ; $9661: 05 05
    BIT $0C                 ; $9663: 24 0C
    .byte $0B            ; $9665
    .byte $03            ; $9666
    ASL $24                 ; $9667: 06 24
    .byte $0C            ; $9669
    .byte $0C            ; $966A
    .byte $03            ; $966B
    BIT $0C                 ; $966C: 24 0C
    ASL                     ; $966E: 0A
    .byte $03            ; $966F
    ORA ptr0_hi             ; $9670: 05 05
    BIT $0C                 ; $9672: 24 0C
    .byte $0C            ; $9674
    .byte $03            ; $9675
    .byte $0F            ; $9676
    .byte $04            ; $9677
    BRK                     ; $9678: 00
    JSR $0E07               ; $9679: 20 07 0E
    STX $0F00               ; $967C: 8E 00 0F
    BRK                     ; $967F: 00
    BRK                     ; $9680: 00
    PLP                     ; $9681: 28
    SEI                     ; $9682: 78
    .byte $07            ; $9683
    STA $0F00               ; $9684: 8D 00 0F
    .byte $04            ; $9687
    BRK                     ; $9688: 00
    BIT $09                 ; $9689: 24 09
    ASL                     ; $968B: 0A
    .byte $8F            ; $968C
    BRK                     ; $968D: 00
    .byte $0F            ; $968E
    .byte $04            ; $968F
    BRK                     ; $9690: 00
    .byte $1C            ; $9691
    PHP                     ; $9692: 08
    .byte $0B            ; $9693
    STX $0F00               ; $9694: 8E 00 0F
    .byte $04            ; $9697
    BRK                     ; $9698: 00
    JSR $0BD6               ; $9699: 20 D6 0B
    .byte $92            ; $969C
    BRK                     ; $969D: 00
    .byte $0F            ; $969E
    BRK                     ; $969F: 00
    .byte $02            ; $96A0
    CPX $08                 ; $96A1: E4 08
    .byte $0C            ; $96A3
    .byte $8F            ; $96A4
    PHP                     ; $96A5: 08
    .byte $82            ; $96A6
    PHP                     ; $96A7: 08
    ORA ($81,X)             ; $96A8: 01 81
    BIT $0C                 ; $96AA: 24 0C
    ORA tmp3,X              ; $96AC: 15 03
    .byte $0F            ; $96AE
    BRK                     ; $96AF: 00
    BRK                     ; $96B0: 00
    .byte $EF            ; $96B1
    PHP                     ; $96B2: 08
    ORA ($8B),Y             ; $96B3: 11 8B
    BRK                     ; $96B5: 00
    .byte $0F            ; $96B6
    .byte $04            ; $96B7
    BRK                     ; $96B8: 00
    PLP                     ; $96B9: 28
    .byte $D2            ; $96BA
    ORA $0092               ; $96BB: 0D 92 00
    .byte $0F            ; $96BE
    BRK                     ; $96BF: 00
    BRK                     ; $96C0: 00
    .byte $14            ; $96C1
    .byte $77            ; $96C2
    ORA $008F               ; $96C3: 0D 8F 00
    BRK                     ; $96C6: 00
    STA tmp0                ; $96C7: 85 00
    LDA $64                 ; $96C9: A5 64
    PHA                     ; $96CB: 48
    LDA $63                 ; $96CC: A5 63
    CMP #$33                ; $96CE: C9 33
    BNE $96DC               ; $96D0: D0 0A
    LDA $64                 ; $96D2: A5 64
    CMP #$04                ; $96D4: C9 04
    BNE $96DC               ; $96D6: D0 04
    LDA #$03                ; $96D8: A9 03
    STA $64                 ; $96DA: 85 64
    LDA tmp0                ; $96DC: A5 00
    JSR $96FC               ; $96DE: 20 FC 96
    PLA                     ; $96E1: 68
    STA $64                 ; $96E2: 85 64
    LDA tmp3                ; $96E4: A5 03
    RTS                     ; $96E6: 60
    LDX $3A                 ; $96E7: A6 3A
    STX $DA                 ; $96E9: 86 DA
    LDX $3B                 ; $96EB: A6 3B
    STX $DB                 ; $96ED: 86 DB
    RTS                     ; $96EF: 60
    JSR $994E               ; $96F0: 20 4E 99
    AND #$80                ; $96F3: 29 80
    EOR #$80                ; $96F5: 49 80
    STA ptr0_hi             ; $96F7: 85 05
    LDY #$03                ; $96F9: A0 03
    RTS                     ; $96FB: 60
    JSR $96E7               ; $96FC: 20 E7 96
    TAX                     ; $96FF: AA
    BEQ $971A               ; $9700: F0 18
    LDY #$00                ; $9702: A0 00
    JSR $994E               ; $9704: 20 4E 99
    BEQ $96EF               ; $9707: F0 E6
    JSR $9B71               ; $9709: 20 71 9B
    JSR $9BB0               ; $970C: 20 B0 9B
    JSR $9BBA               ; $970F: 20 BA 9B
    JSR $9798               ; $9712: 20 98 97
    BCS $9702               ; $9715: B0 EB
    DEX                     ; $9717: CA
    BNE $9702               ; $9718: D0 E8
    JSR $9798               ; $971A: 20 98 97
    BCC $972B               ; $971D: 90 0C
    JSR $9B71               ; $971F: 20 71 9B
    JSR $9BB0               ; $9722: 20 B0 9B
    JSR $9BBA               ; $9725: 20 BA 9B
    JMP $971A               ; $9728: 4C 1A 97
    LDY #$00                ; $972B: A0 00
    JSR $994E               ; $972D: 20 4E 99
    STA tmp2                ; $9730: 85 02
    AND #$80                ; $9732: 29 80
    STA ptr0_lo             ; $9734: 85 04
    JSR $9BD9               ; $9736: 20 D9 9B
    BCS $975A               ; $9739: B0 1F
    LDY #$05                ; $973B: A0 05
    JSR $96F0               ; $973D: 20 F0 96
    JSR $994E               ; $9740: 20 4E 99
    LSR                     ; $9743: 4A
    ORA ptr0_lo             ; $9744: 05 04
    LSR                     ; $9746: 4A
    ORA ptr0_hi             ; $9747: 05 05
    STA tmp3                ; $9749: 85 03
    LDY #$01                ; $974B: A0 01
    JSR $994E               ; $974D: 20 4E 99
    AND #$1C                ; $9750: 29 1C
    LSR                     ; $9752: 4A
    LSR                     ; $9753: 4A
    STA tmp1                ; $9754: 85 01
    LDY #$04                ; $9756: A0 04
    BNE $9792               ; $9758: D0 38
    LDY #$06                ; $975A: A0 06
    JSR $96F0               ; $975C: 20 F0 96
    LDA tmp2                ; $975F: A5 02
    LSR                     ; $9761: 4A
    BCS $976F               ; $9762: B0 0B
    LDY #$01                ; $9764: A0 01
    JSR $994E               ; $9766: 20 4E 99
    AND #$80                ; $9769: 29 80
    STA ptr0_lo             ; $976B: 85 04
    LDY #$07                ; $976D: A0 07
    JSR $994E               ; $976F: 20 4E 99
    LSR                     ; $9772: 4A
    ORA ptr0_lo             ; $9773: 05 04
    LSR                     ; $9775: 4A
    ORA ptr0_hi             ; $9776: 05 05
    STA tmp3                ; $9778: 85 03
    LDA tmp2                ; $977A: A5 02
    AND #$02                ; $977C: 29 02
    BNE $974B               ; $977E: D0 CB
    LDY #$01                ; $9780: A0 01
    JSR $994E               ; $9782: 20 4E 99
    AND #$03                ; $9785: 29 03
    STA tmp1                ; $9787: 85 01
    LDY #$08                ; $9789: A0 08
    LDA tmp2                ; $978B: A5 02
    AND #$01                ; $978D: 29 01
    BEQ $9792               ; $978F: F0 01
    DEY                     ; $9791: 88
    JSR $994E               ; $9792: 20 4E 99
    STA tmp0                ; $9795: 85 00
    RTS                     ; $9797: 60
    LDY #$00                ; $9798: A0 00
    JSR $9BD9               ; $979A: 20 D9 9B
    BCS $97A8               ; $979D: B0 09
    JSR $994E               ; $979F: 20 4E 99
    AND #$10                ; $97A2: 29 10
    BEQ $97B1               ; $97A4: F0 0B
    BNE $97AF               ; $97A6: D0 07
    JSR $994E               ; $97A8: 20 4E 99
    AND #$08                ; $97AB: 29 08
    BEQ $97B1               ; $97AD: F0 02
    CLC                     ; $97AF: 18
    RTS                     ; $97B0: 60
    SEC                     ; $97B1: 38
    RTS                     ; $97B2: 60
    BRK                     ; $97B3: 00
    .byte $03            ; $97B4
    .byte $87            ; $97B5
    JSR $984A               ; $97B6: 20 4A 98
    JSR $96E7               ; $97B9: 20 E7 96
    LDX #$0F                ; $97BC: A2 0F
    LDA #$FF                ; $97BE: A9 FF
    STA $6E5E,X             ; $97C0: 9D 5E 6E
    DEX                     ; $97C3: CA
    BPL $97C0               ; $97C4: 10 FA
    RTS                     ; $97C6: 60
    LDA $41                 ; $97C7: A5 41
    BPL $9849               ; $97C9: 10 7E
    JSR $97B3               ; $97CB: 20 B3 97
    LDY #$00                ; $97CE: A0 00
    JSR $994E               ; $97D0: 20 4E 99
    BEQ $9849               ; $97D3: F0 74
    LDY #$00                ; $97D5: A0 00
    JSR $994E               ; $97D7: 20 4E 99
    STA tmp3                ; $97DA: 85 03
    JSR $9BD9               ; $97DC: 20 D9 9B
    BCS $97F5               ; $97DF: B0 14
    LDY #$01                ; $97E1: A0 01
    JSR $994E               ; $97E3: 20 4E 99
    AND #$40                ; $97E6: 29 40
    ASL                     ; $97E8: 0A
    STA $DC                 ; $97E9: 85 DC
    LDA tmp3                ; $97EB: A5 03
    AND #$10                ; $97ED: 29 10
    BEQ $9839               ; $97EF: F0 48
    LDY #$03                ; $97F1: A0 03
    BNE $9816               ; $97F3: D0 21
    LDA tmp3                ; $97F5: A5 03
    AND #$10                ; $97F7: 29 10
    BEQ $97E1               ; $97F9: F0 E6
    LDY #$01                ; $97FB: A0 01
    JSR $994E               ; $97FD: 20 4E 99
    AND #$20                ; $9800: 29 20
    ASL                     ; $9802: 0A
    ASL                     ; $9803: 0A
    STA $DC                 ; $9804: 85 DC
    LDA tmp3                ; $9806: A5 03
    AND #$08                ; $9808: 29 08
    BEQ $9839               ; $980A: F0 2D
    LDY #$03                ; $980C: A0 03
    LDA tmp3                ; $980E: A5 03
    AND #$01                ; $9810: 29 01
    BNE $9816               ; $9812: D0 02
    LDY #$07                ; $9814: A0 07
    STY tmp0                ; $9816: 84 00
    CPY #$03                ; $9818: C0 03
    BNE $9820               ; $981A: D0 04
    LDY #$00                ; $981C: A0 00
    BEQ $9822               ; $981E: F0 02
    LDY #$01                ; $9820: A0 01
    JSR $994E               ; $9822: 20 4E 99
    ASL                     ; $9825: 0A
    PHP                     ; $9826: 08
    LDY tmp0                ; $9827: A4 00
    JSR $994E               ; $9829: 20 4E 99
    PLP                     ; $982C: 28
    ROR                     ; $982D: 6A
    LSR                     ; $982E: 4A
    CLC                     ; $982F: 18
    ADC #$0F                ; $9830: 69 0F
    ORA $DC                 ; $9832: 05 DC
    LDX #$00                ; $9834: A2 00
    JSR $9A37               ; $9836: 20 37 9A
    JSR $9B71               ; $9839: 20 71 9B
    JSR $9BB0               ; $983C: 20 B0 9B
    JSR $9BBA               ; $983F: 20 BA 9B
    LDY #$00                ; $9842: A0 00
    JSR $994E               ; $9844: 20 4E 99
    BNE $97D5               ; $9847: D0 8C
    RTS                     ; $9849: 60
    BIT $07BA               ; $984A: 2C BA 07
    BPL $9859               ; $984D: 10 0A
    LDA #$09                ; $984F: A9 09
    BRK                     ; $9851: 00
    .byte $04            ; $9852
    .byte $87            ; $9853
    LDA #$0A                ; $9854: A9 0A
    BRK                     ; $9856: 00
    .byte $04            ; $9857
    .byte $87            ; $9858
    RTS                     ; $9859: 60
    LDA #$05                ; $985A: A9 05
    STA $67                 ; $985C: 85 67
    LDA $41                 ; $985E: A5 41
    BPL $98B3               ; $9860: 10 51
    BRK                     ; $9862: 00
    .byte $03            ; $9863
    .byte $87            ; $9864
    JSR $984A               ; $9865: 20 4A 98
    JSR $9B00               ; $9868: 20 00 9B
    JSR $97BC               ; $986B: 20 BC 97
    JSR $9C0F               ; $986E: 20 0F 9C
    LDX #$07                ; $9871: A2 07
    STA $DF,X               ; $9873: 95 DF
    DEX                     ; $9875: CA
    BPL $9873               ; $9876: 10 FB
    LDY #$00                ; $9878: A0 00
    JSR $994E               ; $987A: 20 4E 99
    BEQ $9890               ; $987D: F0 11
    JSR $9C28               ; $987F: 20 28 9C
    BCC $9890               ; $9882: 90 0C
    LDX #$06                ; $9884: A2 06
    JSR $98D8               ; $9886: 20 D8 98
    LDY #$00                ; $9889: A0 00
    JSR $994E               ; $988B: 20 4E 99
    BNE $9886               ; $988E: D0 F6
    LDX #$00                ; $9890: A2 00
    LDA $7020,X             ; $9892: BD 20 70
    CMP #$FF                ; $9895: C9 FF
    BEQ $98B2               ; $9897: F0 19
    TXA                     ; $9899: 8A
    PHA                     ; $989A: 48
    LDA $6F80,X             ; $989B: BD 80 6F
    TAY                     ; $989E: A8
    LDA $6F60,X             ; $989F: BD 60 6F
    TAX                     ; $98A2: AA
    JSR $D3E6               ; $98A3: 20 E6 D3
    TAY                     ; $98A6: A8
    PLA                     ; $98A7: 68
    TAX                     ; $98A8: AA
    TYA                     ; $98A9: 98
    STA $7140,X             ; $98AA: 9D 40 71
    INX                     ; $98AD: E8
    CPX #$1F                ; $98AE: E0 1F
    BCC $9892               ; $98B0: 90 E0
    RTS                     ; $98B2: 60
    LDA #$00                ; $98B3: A9 00
    STA $46                 ; $98B5: 85 46
    LDX #$1F                ; $98B7: A2 1F
    LDA #$FF                ; $98B9: A9 FF
    STA $6F60,X             ; $98BB: 9D 60 6F
    STA $6F80,X             ; $98BE: 9D 80 6F
    STA $6FA0,X             ; $98C1: 9D A0 6F
    STA $6FC0,X             ; $98C4: 9D C0 6F
    STA $7020,X             ; $98C7: 9D 20 70
    LDA #$80                ; $98CA: A9 80
    STA $70E0,X             ; $98CC: 9D E0 70
    LDA #$00                ; $98CF: A9 00
    STA $7140,X             ; $98D1: 9D 40 71
    DEX                     ; $98D4: CA
    BPL $98B9               ; $98D5: 10 E2
    RTS                     ; $98D7: 60
    LDY #$00                ; $98D8: A0 00
    JSR $994E               ; $98DA: 20 4E 99
    STA tmp1                ; $98DD: 85 01
    JSR $9BD9               ; $98DF: 20 D9 9B
    BCS $9901               ; $98E2: B0 1D
    LDA tmp1                ; $98E4: A5 01
    AND #$10                ; $98E6: 29 10
    BEQ $9945               ; $98E8: F0 5B
    JSR $9BDF               ; $98EA: 20 DF 9B
    LDY #$00                ; $98ED: A0 00
    LDA #$03                ; $98EF: A9 03
    STA $06                 ; $98F1: 85 06
    LDA #$04                ; $98F3: A9 04
    STA $07                 ; $98F5: 85 07
    LDA #$05                ; $98F7: A9 05
    STA $08                 ; $98F9: 85 08
    TYA                     ; $98FB: 98
    JSR $995C               ; $98FC: 20 5C 99
    INX                     ; $98FF: E8
    RTS                     ; $9900: 60
    LDA tmp1                ; $9901: A5 01
    AND #$08                ; $9903: 29 08
    BEQ $9945               ; $9905: F0 3E
    JSR $9BDF               ; $9907: 20 DF 9B
    LDY #$01                ; $990A: A0 01
    LDA tmp1                ; $990C: A5 01
    AND #$10                ; $990E: 29 10
    BEQ $98EF               ; $9910: F0 DD
    LDY #$07                ; $9912: A0 07
    LDA tmp1                ; $9914: A5 01
    AND #$01                ; $9916: 29 01
    BNE $991F               ; $9918: D0 05
    STY $06                 ; $991A: 84 06
    INY                     ; $991C: C8
    BNE $9923               ; $991D: D0 04
    LDA #$03                ; $991F: A9 03
    STA $06                 ; $9921: 85 06
    LDA tmp1                ; $9923: A5 01
    AND #$02                ; $9925: 29 02
    BNE $992E               ; $9927: D0 05
    STY $07                 ; $9929: 84 07
    INY                     ; $992B: C8
    BNE $9932               ; $992C: D0 04
    LDA #$04                ; $992E: A9 04
    STA $07                 ; $9930: 85 07
    LDA tmp1                ; $9932: A5 01
    AND #$04                ; $9934: 29 04
    BNE $993D               ; $9936: D0 05
    STY $08                 ; $9938: 84 08
    JMP $9941               ; $993A: 4C 41 99
    LDA #$05                ; $993D: A9 05
    STA $08                 ; $993F: 85 08
    LDA #$01                ; $9941: A9 01
    BNE $98FC               ; $9943: D0 B7
    JSR $9B71               ; $9945: 20 71 9B
    JSR $9BB0               ; $9948: 20 B0 9B
    JMP $9BBA               ; $994B: 4C BA 9B
    STX $0E                 ; $994E: 86 0E
    LDX #$DA                ; $9950: A2 DA
    LDA $67                 ; $9952: A5 67
    JSR $C3EA               ; $9954: 20 EA C3
    LDX $0E                 ; $9957: A6 0E
    ORA #$00                ; $9959: 09 00
    RTS                     ; $995B: 60
    PHA                     ; $995C: 48
    LDY #$00                ; $995D: A0 00
    STY $DC                 ; $995F: 84 DC
    STA $0F                 ; $9961: 85 0F
    CMP #$00                ; $9963: C9 00
    BNE $998F               ; $9965: D0 28
    LDY #$01                ; $9967: A0 01
    JSR $994E               ; $9969: 20 4E 99
    AND #$40                ; $996C: 29 40
    BEQ $9974               ; $996E: F0 04
    LDA #$80                ; $9970: A9 80
    STA $DC                 ; $9972: 85 DC
    LDY #$05                ; $9974: A0 05
    JSR $994E               ; $9976: 20 4E 99
    AND #$80                ; $9979: 29 80
    STA $70E0,X             ; $997B: 9D E0 70
    LDA tmp1                ; $997E: A5 01
    AND #$40                ; $9980: 29 40
    JSR $9A2B               ; $9982: 20 2B 9A
    LSR                     ; $9985: 4A
    LSR                     ; $9986: 4A
    LSR                     ; $9987: 4A
    LSR                     ; $9988: 4A
    JSR $9A74               ; $9989: 20 74 9A
    JMP $99B3               ; $998C: 4C B3 99
    LDY #$01                ; $998F: A0 01
    JSR $994E               ; $9991: 20 4E 99
    AND #$20                ; $9994: 29 20
    BEQ $999C               ; $9996: F0 04
    LDA #$80                ; $9998: A9 80
    STA $DC                 ; $999A: 85 DC
    LDY #$06                ; $999C: A0 06
    JSR $994E               ; $999E: 20 4E 99
    AND #$80                ; $99A1: 29 80
    STA $70E0,X             ; $99A3: 9D E0 70
    LDA tmp1                ; $99A6: A5 01
    AND #$20                ; $99A8: 29 20
    ASL                     ; $99AA: 0A
    JSR $9A2B               ; $99AB: 20 2B 9A
    AND #$0F                ; $99AE: 29 0F
    JSR $9A74               ; $99B0: 20 74 9A
    LDY $06                 ; $99B3: A4 06
    JSR $994E               ; $99B5: 20 4E 99
    AND #$03                ; $99B8: 29 03
    STA $7000,X             ; $99BA: 9D 00 70
    JSR $994E               ; $99BD: 20 4E 99
    AND #$FC                ; $99C0: 29 FC
    PHA                     ; $99C2: 48
    TYA                     ; $99C3: 98
    PHA                     ; $99C4: 48
    LDA $06                 ; $99C5: A5 06
    CMP #$03                ; $99C7: C9 03
    BNE $99CF               ; $99C9: D0 04
    LDY #$00                ; $99CB: A0 00
    BEQ $99D1               ; $99CD: F0 02
    LDY #$01                ; $99CF: A0 01
    JSR $994E               ; $99D1: 20 4E 99
    ASL                     ; $99D4: 0A
    PLA                     ; $99D5: 68
    TAY                     ; $99D6: A8
    PLA                     ; $99D7: 68
    ROR                     ; $99D8: 6A
    LSR                     ; $99D9: 4A
    CLC                     ; $99DA: 18
    ADC #$0F                ; $99DB: 69 0F
    ORA $DC                 ; $99DD: 05 DC
    JSR $9A37               ; $99DF: 20 37 9A
    LDY $08                 ; $99E2: A4 08
    JSR $994E               ; $99E4: 20 4E 99
    AND #$7F                ; $99E7: 29 7F
    STA $6F60,X             ; $99E9: 9D 60 6F
    STA $6FA0,X             ; $99EC: 9D A0 6F
    INY                     ; $99EF: C8
    JSR $994E               ; $99F0: 20 4E 99
    AND #$7F                ; $99F3: 29 7F
    STA $6F80,X             ; $99F5: 9D 80 6F
    STA $6FC0,X             ; $99F8: 9D C0 6F
    JSR $9B71               ; $99FB: 20 71 9B
    PLA                     ; $99FE: 68
    BEQ $9A16               ; $99FF: F0 15
    JSR $9BB0               ; $9A01: 20 B0 9B
    LDA $DA                 ; $9A04: A5 DA
    CLC                     ; $9A06: 18
    ADC #$01                ; $9A07: 69 01
    STA $7080,X             ; $9A09: 9D 80 70
    LDA $DB                 ; $9A0C: A5 DB
    ADC #$00                ; $9A0E: 69 00
    STA $7060,X             ; $9A10: 9D 60 70
    JMP $9BBA               ; $9A13: 4C BA 9B
    LDA $DA                 ; $9A16: A5 DA
    CLC                     ; $9A18: 18
    ADC #$01                ; $9A19: 69 01
    STA $7080,X             ; $9A1B: 9D 80 70
    LDA $DB                 ; $9A1E: A5 DB
    ADC #$00                ; $9A20: 69 00
    STA $7060,X             ; $9A22: 9D 60 70
    JSR $9BB0               ; $9A25: 20 B0 9B
    JMP $9BBA               ; $9A28: 4C BA 9B
    ORA $70E0,X             ; $9A2B: 1D E0 70
    STA $70E0,X             ; $9A2E: 9D E0 70
    LDY #$02                ; $9A31: A0 02
    JSR $994E               ; $9A33: 20 4E 99
    RTS                     ; $9A36: 60
    STA tmp0                ; $9A37: 85 00
    LDY #$00                ; $9A39: A0 00
    LDA $6E5E,Y             ; $9A3B: B9 5E 6E
    CMP #$FF                ; $9A3E: C9 FF
    BEQ $9A4F               ; $9A40: F0 0D
    CMP tmp0                ; $9A42: C5 00
    BEQ $9A61               ; $9A44: F0 1B
    INY                     ; $9A46: C8
    CPY #$10                ; $9A47: C0 10
    BCC $9A3B               ; $9A49: 90 F0
    DEY                     ; $9A4B: 88
    JMP $9A54               ; $9A4C: 4C 54 9A
    LDA tmp0                ; $9A4F: A5 00
    STA $6E5E,Y             ; $9A51: 99 5E 6E
    TYA                     ; $9A54: 98
    PHA                     ; $9A55: 48
    TXA                     ; $9A56: 8A
    PHA                     ; $9A57: 48
    LDA tmp0                ; $9A58: A5 00
    BRK                     ; $9A5A: 00
    .byte $04            ; $9A5B
    .byte $87            ; $9A5C
    PLA                     ; $9A5D: 68
    TAX                     ; $9A5E: AA
    PLA                     ; $9A5F: 68
    TAY                     ; $9A60: A8
    TYA                     ; $9A61: 98
    CLC                     ; $9A62: 18
    ADC #$04                ; $9A63: 69 04
    BIT $07BA               ; $9A65: 2C BA 07
    BPL $9A6C               ; $9A68: 10 02
    ADC #$02                ; $9A6A: 69 02
    CPX #$00                ; $9A6C: E0 00
    BEQ $9A73               ; $9A6E: F0 03
    STA $6FE0,X             ; $9A70: 9D E0 6F
    RTS                     ; $9A73: 60
    STA tmp0                ; $9A74: 85 00
    CMP #$08                ; $9A76: C9 08
    BCS $9A89               ; $9A78: B0 0F
    STA $7040,X             ; $9A7A: 9D 40 70
    LDA tmp0                ; $9A7D: A5 00
    JSR $9AFB               ; $9A7F: 20 FB 9A
    ORA $7040,X             ; $9A82: 1D 40 70
    STA $7040,X             ; $9A85: 9D 40 70
    RTS                     ; $9A88: 60
    SEC                     ; $9A89: 38
    SBC #$02                ; $9A8A: E9 02
    LSR                     ; $9A8C: 4A
    TAY                     ; $9A8D: A8
    BCC $9AB9               ; $9A8E: 90 29
    LDA $00DF,Y             ; $9A90: B9 DF 00
    AND #$0F                ; $9A93: 29 0F
    JSR $9AE7               ; $9A95: 20 E7 9A
    CMP tmp0                ; $9A98: C5 00
    BCS $9AB0               ; $9A9A: B0 14
    CLC                     ; $9A9C: 18
    ADC #$01                ; $9A9D: 69 01
    PHA                     ; $9A9F: 48
    LDA $00DF,Y             ; $9AA0: B9 DF 00
    AND #$F0                ; $9AA3: 29 F0
    STA $00DF,Y             ; $9AA5: 99 DF 00
    PLA                     ; $9AA8: 68
    ORA $00DF,Y             ; $9AA9: 19 DF 00
    STA $00DF,Y             ; $9AAC: 99 DF 00
    RTS                     ; $9AAF: 60
    LDA $00DF,Y             ; $9AB0: B9 DF 00
    AND #$F0                ; $9AB3: 29 F0
    STA $00DF,Y             ; $9AB5: 99 DF 00
    RTS                     ; $9AB8: 60
    LDA $00DF,Y             ; $9AB9: B9 DF 00
    LSR                     ; $9ABC: 4A
    LSR                     ; $9ABD: 4A
    LSR                     ; $9ABE: 4A
    LSR                     ; $9ABF: 4A
    JSR $9AE7               ; $9AC0: 20 E7 9A
    CMP tmp0                ; $9AC3: C5 00
    BCS $9ADE               ; $9AC5: B0 17
    CLC                     ; $9AC7: 18
    ADC #$01                ; $9AC8: 69 01
    PHA                     ; $9ACA: 48
    LDA $00DF,Y             ; $9ACB: B9 DF 00
    AND #$0F                ; $9ACE: 29 0F
    STA $00DF,Y             ; $9AD0: 99 DF 00
    PLA                     ; $9AD3: 68
    JSR $9AFB               ; $9AD4: 20 FB 9A
    ORA $00DF,Y             ; $9AD7: 19 DF 00
    STA $00DF,Y             ; $9ADA: 99 DF 00
    RTS                     ; $9ADD: 60
    LDA $00DF,Y             ; $9ADE: B9 DF 00
    AND #$0F                ; $9AE1: 29 0F
    STA $00DF,Y             ; $9AE3: 99 DF 00
    RTS                     ; $9AE6: 60
    PHA                     ; $9AE7: 48
    CLC                     ; $9AE8: 18
    ADC #$01                ; $9AE9: 69 01
    STA $7040,X             ; $9AEB: 9D 40 70
    LDA tmp0                ; $9AEE: A5 00
    JSR $9AFB               ; $9AF0: 20 FB 9A
    ORA $7040,X             ; $9AF3: 1D 40 70
    STA $7040,X             ; $9AF6: 9D 40 70
    PLA                     ; $9AF9: 68
    RTS                     ; $9AFA: 60
    ASL                     ; $9AFB: 0A
    ASL                     ; $9AFC: 0A
    ASL                     ; $9AFD: 0A
    ASL                     ; $9AFE: 0A
    RTS                     ; $9AFF: 60
    JSR $9CC1               ; $9B00: 20 C1 9C
    BCC $9B08               ; $9B03: 90 03
    JMP $9B68               ; $9B05: 4C 68 9B
    LDA #$80                ; $9B08: A9 80
    STA $E1                 ; $9B0A: 85 E1
    LDY #$00                ; $9B0C: A0 00
    STY $E0                 ; $9B0E: 84 E0
    STY tmp0                ; $9B10: 84 00
    LDA $63                 ; $9B12: A5 63
    ASL                     ; $9B14: 0A
    ROL tmp0                ; $9B15: 26 00
    CLC                     ; $9B17: 18
    ADC $E0                 ; $9B18: 65 E0
    STA tmp2                ; $9B1A: 85 02
    LDA $E1                 ; $9B1C: A5 E1
    ADC tmp0                ; $9B1E: 65 00
    STA tmp3                ; $9B20: 85 03
    LDA #$05                ; $9B22: A9 05
    LDX #$02                ; $9B24: A2 02
    JSR $C3EA               ; $9B26: 20 EA C3
    STA $DA                 ; $9B29: 85 DA
    INY                     ; $9B2B: C8
    LDA #$05                ; $9B2C: A9 05
    LDX #$02                ; $9B2E: A2 02
    JSR $C3EA               ; $9B30: 20 EA C3
    STA $DB                 ; $9B33: 85 DB
    LDA $63                 ; $9B35: A5 63
    CMP #$FF                ; $9B37: C9 FF
    BCC $9B3F               ; $9B39: 90 04
    LDA #$1C                ; $9B3B: A9 1C
    STA $67                 ; $9B3D: 85 67
    LDA $64                 ; $9B3F: A5 64
    STA tmp2                ; $9B41: 85 02
    BNE $9B47               ; $9B43: D0 02
    BEQ $9B68               ; $9B45: F0 21
    LDY #$00                ; $9B47: A0 00
    JSR $994E               ; $9B49: 20 4E 99
    BEQ $9B5E               ; $9B4C: F0 10
    JSR $9B71               ; $9B4E: 20 71 9B
    JSR $9BB0               ; $9B51: 20 B0 9B
    JSR $9BBA               ; $9B54: 20 BA 9B
    LDY #$00                ; $9B57: A0 00
    JSR $994E               ; $9B59: 20 4E 99
    BNE $9B47               ; $9B5C: D0 E9
    INC $DA                 ; $9B5E: E6 DA
    BNE $9B64               ; $9B60: D0 02
    INC $DB                 ; $9B62: E6 DB
    DEC tmp2                ; $9B64: C6 02
    BNE $9B47               ; $9B66: D0 DF
    LDA $DA                 ; $9B68: A5 DA
    STA $3A                 ; $9B6A: 85 3A
    LDA $DB                 ; $9B6C: A5 DB
    STA $3B                 ; $9B6E: 85 3B
    RTS                     ; $9B70: 60
    LDA #$07                ; $9B71: A9 07
    STA tmp0                ; $9B73: 85 00
    LDY #$00                ; $9B75: A0 00
    STY tmp1                ; $9B77: 84 01
    JSR $994E               ; $9B79: 20 4E 99
    STA tmp3                ; $9B7C: 85 03
    AND #$10                ; $9B7E: 29 10
    BEQ $9BA2               ; $9B80: F0 20
    LDA tmp3                ; $9B82: A5 03
    AND #$08                ; $9B84: 29 08
    BEQ $9BA2               ; $9B86: F0 1A
    LDA tmp3                ; $9B88: A5 03
    AND #$01                ; $9B8A: 29 01
    BNE $9B90               ; $9B8C: D0 02
    INC tmp0                ; $9B8E: E6 00
    LDA tmp3                ; $9B90: A5 03
    AND #$02                ; $9B92: 29 02
    BNE $9B98               ; $9B94: D0 02
    INC tmp0                ; $9B96: E6 00
    LDA tmp3                ; $9B98: A5 03
    AND #$04                ; $9B9A: 29 04
    BNE $9BA2               ; $9B9C: D0 04
    INC tmp0                ; $9B9E: E6 00
    INC tmp0                ; $9BA0: E6 00
    LDA $DA                 ; $9BA2: A5 DA
    CLC                     ; $9BA4: 18
    ADC tmp0                ; $9BA5: 65 00
    STA $DA                 ; $9BA7: 85 DA
    LDA $DB                 ; $9BA9: A5 DB
    ADC tmp1                ; $9BAB: 65 01
    STA $DB                 ; $9BAD: 85 DB
    RTS                     ; $9BAF: 60
    LDA tmp3                ; $9BB0: A5 03
    AND #$10                ; $9BB2: 29 10
    BEQ $9BB9               ; $9BB4: F0 03
    JSR $9BC4               ; $9BB6: 20 C4 9B
    RTS                     ; $9BB9: 60
    LDA tmp3                ; $9BBA: A5 03
    AND #$08                ; $9BBC: 29 08
    BEQ $9BC3               ; $9BBE: F0 03
    JSR $9BC4               ; $9BC0: 20 C4 9B
    RTS                     ; $9BC3: 60
    LDY #$00                ; $9BC4: A0 00
    JSR $994E               ; $9BC6: 20 4E 99
    CLC                     ; $9BC9: 18
    ADC $DA                 ; $9BCA: 65 DA
    STA $DA                 ; $9BCC: 85 DA
    BCC $9BD2               ; $9BCE: 90 02
    INC $DB                 ; $9BD0: E6 DB
    INC $DA                 ; $9BD2: E6 DA
    BNE $9BD8               ; $9BD4: D0 02
    INC $DB                 ; $9BD6: E6 DB
    RTS                     ; $9BD8: 60
    LDA $62ED               ; $9BD9: AD ED 62
    CMP #$78                ; $9BDC: C9 78
    RTS                     ; $9BDE: 60
    LDA #$00                ; $9BDF: A9 00
    STA $6FE0,X             ; $9BE1: 9D E0 6F
    STA $7000,X             ; $9BE4: 9D 00 70
    STA $7040,X             ; $9BE7: 9D 40 70
    STA $7060,X             ; $9BEA: 9D 60 70
    STA $7080,X             ; $9BED: 9D 80 70
    STA $70A0,X             ; $9BF0: 9D A0 70
    STA $70C0,X             ; $9BF3: 9D C0 70
    STA $70E0,X             ; $9BF6: 9D E0 70
    STA $7100,X             ; $9BF9: 9D 00 71
    STA $7120,X             ; $9BFC: 9D 20 71
    STA $7140,X             ; $9BFF: 9D 40 71
    STA $7160,X             ; $9C02: 9D 60 71
    STA $7180,X             ; $9C05: 9D 80 71
    STA $7020,X             ; $9C08: 9D 20 70
    STA $71E0,X             ; $9C0B: 9D E0 71
    RTS                     ; $9C0E: 60
    LDX #$1F                ; $9C0F: A2 1F
    LDA #$FF                ; $9C11: A9 FF
    STA $6F60,X             ; $9C13: 9D 60 6F
    STA $6F80,X             ; $9C16: 9D 80 6F
    STA $6FA0,X             ; $9C19: 9D A0 6F
    STA $6FC0,X             ; $9C1C: 9D C0 6F
    JSR $9BE1               ; $9C1F: 20 E1 9B
    DEX                     ; $9C22: CA
    CPX #$06                ; $9C23: E0 06
    BCS $9C13               ; $9C25: B0 EC
    RTS                     ; $9C27: 60
    LDA $62A5               ; $9C28: AD A5 62
    BMI $9C6D               ; $9C2B: 30 40
    LDX #$00                ; $9C2D: A2 00
    LDA $9E61,X             ; $9C2F: BD 61 9E
    CMP #$FF                ; $9C32: C9 FF
    BEQ $9C6D               ; $9C34: F0 37
    CMP $63                 ; $9C36: C5 63
    BNE $9C67               ; $9C38: D0 2D
    LDA $64                 ; $9C3A: A5 64
    CMP $9E62,X             ; $9C3C: DD 62 9E
    BNE $9C67               ; $9C3F: D0 26
    LDY $9E64,X             ; $9C41: BC 64 9E
    LDA $627B,Y             ; $9C44: B9 7B 62
    AND $9E63,X             ; $9C47: 3D 63 9E
    BEQ $9C67               ; $9C4A: F0 1B
    LDA $615A               ; $9C4C: AD 5A 61
    CMP #$04                ; $9C4F: C9 04
    BCC $9C65               ; $9C51: 90 12
    LDA $63                 ; $9C53: A5 63
    CMP #$01                ; $9C55: C9 01
    BNE $9C65               ; $9C57: D0 0C
    LDA $64                 ; $9C59: A5 64
    CMP #$00                ; $9C5B: C9 00
    BEQ $9C6D               ; $9C5D: F0 0E
    BRK                     ; $9C5F: 00
    ROL $EB                 ; $9C60: 26 EB
    JSR $08D0               ; $9C62: 20 D0 08
    CLC                     ; $9C65: 18
    RTS                     ; $9C66: 60
    INX                     ; $9C67: E8
    INX                     ; $9C68: E8
    INX                     ; $9C69: E8
    INX                     ; $9C6A: E8
    BNE $9C2F               ; $9C6B: D0 C2
    SEC                     ; $9C6D: 38
    RTS                     ; $9C6E: 60
    LDA $62A5               ; $9C6F: AD A5 62
    BMI $9CC0               ; $9C72: 30 4C
    BRK                     ; $9C74: 00
    .byte $07            ; $9C75
    .byte $EB            ; $9C76
    BPL $9C49               ; $9C77: 10 D0
    ASL tmp0                ; $9C79: 06 00
    .byte $0C            ; $9C7B
    .byte $EB            ; $9C7C
    .byte $80            ; $9C7D
    BEQ $9CC0               ; $9C7E: F0 40
    LDA $63                 ; $9C80: A5 63
    CMP #$04                ; $9C82: C9 04
    BNE $9C93               ; $9C84: D0 0D
    LDA $64                 ; $9C86: A5 64
    CMP #$01                ; $9C88: C9 01
    BNE $9CC0               ; $9C8A: D0 34
    BRK                     ; $9C8C: 00
    .byte $0B            ; $9C8D
    .byte $CB            ; $9C8E
    ORA ($4C,X)             ; $9C8F: 01 4C
    LDA $C99C,X             ; $9C91: BD 9C C9
    ORA $D0,X               ; $9C94: 15 D0
    ASL $1A00               ; $9C96: 0E 00 1A
    .byte $EB            ; $9C99
    .byte $02            ; $9C9A
    BEQ $9CC0               ; $9C9B: F0 23
    LDA $64                 ; $9C9D: A5 64
    CMP #$02                ; $9C9F: C9 02
    BNE $9CC0               ; $9CA1: D0 1D
    BEQ $9CBD               ; $9CA3: F0 18
    CMP #$12                ; $9CA5: C9 12
    BNE $9CB1               ; $9CA7: D0 08
    LDA $64                 ; $9CA9: A5 64
    CMP #$02                ; $9CAB: C9 02
    BEQ $9CBD               ; $9CAD: F0 0E
    BNE $9CC0               ; $9CAF: D0 0F
    CMP #$02                ; $9CB1: C9 02
    BNE $9CC0               ; $9CB3: D0 0B
    LDA $64                 ; $9CB5: A5 64
    CMP #$03                ; $9CB7: C9 03
    BEQ $9CC0               ; $9CB9: F0 05
    BNE $9CBD               ; $9CBB: D0 00
    PLA                     ; $9CBD: 68
    PLA                     ; $9CBE: 68
    CLC                     ; $9CBF: 18
    RTS                     ; $9CC0: 60
    LDA $9D0E               ; $9CC1: AD 0E 9D
    STA $DC                 ; $9CC4: 85 DC
    LDA $9D0F               ; $9CC6: AD 0F 9D
    STA $DD                 ; $9CC9: 85 DD
    LDY #$00                ; $9CCB: A0 00
    LDA ($DC),Y             ; $9CCD: B1 DC
    CMP #$FF                ; $9CCF: C9 FF
    BEQ $9CBF               ; $9CD1: F0 EC
    CMP $63                 ; $9CD3: C5 63
    BNE $9D00               ; $9CD5: D0 29
    LDA $64                 ; $9CD7: A5 64
    INY                     ; $9CD9: C8
    CMP ($DC),Y             ; $9CDA: D1 DC
    BNE $9D00               ; $9CDC: D0 22
    LDY #$03                ; $9CDE: A0 03
    LDA ($DC),Y             ; $9CE0: B1 DC
    TAX                     ; $9CE2: AA
    LDA $627B,X             ; $9CE3: BD 7B 62
    LDY #$02                ; $9CE6: A0 02
    AND ($DC),Y             ; $9CE8: 31 DC
    BEQ $9D00               ; $9CEA: F0 14
    LDY #$04                ; $9CEC: A0 04
    LDA ($DC),Y             ; $9CEE: B1 DC
    STA $DA                 ; $9CF0: 85 DA
    INY                     ; $9CF2: C8
    LDA ($DC),Y             ; $9CF3: B1 DC
    STA $DB                 ; $9CF5: 85 DB
    JSR $9C6F               ; $9CF7: 20 6F 9C
    LDA #$1C                ; $9CFA: A9 1C
    STA $67                 ; $9CFC: 85 67
    SEC                     ; $9CFE: 38
    RTS                     ; $9CFF: 60
    LDA $DC                 ; $9D00: A5 DC
    CLC                     ; $9D02: 18
    ADC #$06                ; $9D03: 69 06
    STA $DC                 ; $9D05: 85 DC
    BCC $9D0B               ; $9D07: 90 02
    INC $DD                 ; $9D09: E6 DD
    JMP $9CCB               ; $9D0B: 4C CB 9C
    BPL $9CAD               ; $9D0E: 10 9D
    ROL $2000,X             ; $9D10: 3E 00 20
    ROL tmp2                ; $9D13: 26 02
    STY tmp1,X              ; $9D15: 94 01
    BRK                     ; $9D17: 00
    JSR $9B26               ; $9D18: 20 26 9B
    STY tmp1,X              ; $9D1B: 94 01
    ORA ($20,X)             ; $9D1D: 01 20
    ROL $ED                 ; $9D1F: 26 ED
    STY tmp1,X              ; $9D21: 94 01
    .byte $02            ; $9D23
    JSR $1E26               ; $9D24: 20 26 1E
    STA tmp2,X              ; $9D27: 95 02
    ORA ($20,X)             ; $9D29: 01 20
    ROL $E8                 ; $9D2B: 26 E8
    STY ptr0_lo             ; $9D2D: 84 04
    BRK                     ; $9D2F: 00
    JSR $DA26               ; $9D30: 20 26 DA
    BCC $9D4C               ; $9D33: 90 17
    BRK                     ; $9D35: 00
    JSR $3B26               ; $9D36: 20 26 3B
    STA $15,X               ; $9D39: 95 15
    BRK                     ; $9D3B: 00
    JSR $9E26               ; $9D3C: 20 26 9E
    STA $15,X               ; $9D3F: 95 15
    .byte $03            ; $9D41
    JSR $4F26               ; $9D42: 20 26 4F
    STX $14,Y               ; $9D45: 96 14
    .byte $02            ; $9D47
    JSR $E726               ; $9D48: 20 26 E7
    .byte $80            ; $9D4B
    ASL $1000               ; $9D4C: 0E 00 10
    .byte $07            ; $9D4F
    LDX $92                 ; $9D50: A6 92
    ASL                     ; $9D52: 0A
    BRK                     ; $9D53: 00
    ORA ($1A,X)             ; $9D54: 01 1A
    CPY $2D93               ; $9D56: CC 93 2D
    BRK                     ; $9D59: 00
    ORA ($1A,X)             ; $9D5A: 01 1A
    NOP                     ; $9D5C: EA
    .byte $93            ; $9D5D
    AND $0101               ; $9D5E: 2D 01 01
    .byte $1A            ; $9D61
    .byte $F4            ; $9D62
    .byte $93            ; $9D63
    .byte $03            ; $9D64
    .byte $02            ; $9D65
    ORA ($1A,X)             ; $9D66: 01 1A
    .byte $62            ; $9D68
    .byte $93            ; $9D69
    .byte $02            ; $9D6A
    .byte $03            ; $9D6B
    BPL $9D75               ; $9D6C: 10 07
    AND ($93),Y             ; $9D6E: 31 93
    .byte $12            ; $9D70
    ORA (ptr_lo,X)          ; $9D71: 01 10
    .byte $07            ; $9D73
    ADC $92                 ; $9D74: 65 92
    .byte $12            ; $9D76
    BRK                     ; $9D77: 00
    BPL $9D81               ; $9D78: 10 07
    .byte $42            ; $9D7A
    STA ($15),Y             ; $9D7B: 91 15
    .byte $02            ; $9D7D
    BPL $9D87               ; $9D7E: 10 07
    .byte $14            ; $9D80
    .byte $8F            ; $9D81
    .byte $0F            ; $9D82
    ORA (ptr_lo,X)          ; $9D83: 01 10
    .byte $07            ; $9D85
    SED                     ; $9D86: F8
    STX $001F               ; $9D87: 8E 1F 00
    BPL $9D93               ; $9D8A: 10 07
    SBC $8E                 ; $9D8C: E5 8E
    ASL tmp0,X              ; $9D8E: 16 00
    BPL $9D99               ; $9D90: 10 07
    LSR $168E               ; $9D92: 4E 8E 16
    ORA (ptr_lo,X)          ; $9D95: 01 10
    .byte $07            ; $9D97
    BCS $9D28               ; $9D98: B0 8E
    ASL tmp2,X              ; $9D9A: 16 02
    BPL $9DA5               ; $9D9C: 10 07
    .byte $D7            ; $9D9E
    STX $0000               ; $9D9F: 8E 00 00
    BPL $9DAB               ; $9DA2: 10 07
    .byte $F7            ; $9DA4
    STA $0100               ; $9DA5: 8D 00 01
    BPL $9DB1               ; $9DA8: 10 07
    .byte $4B            ; $9DAA
    .byte $8F            ; $9DAB
    ORA (tmp0,X)            ; $9DAC: 01 00
    BPL $9DB7               ; $9DAE: 10 07
    .byte $34            ; $9DB0
    STA $0101               ; $9DB1: 8D 01 01
    BPL $9DBD               ; $9DB4: 10 07
    CLI                     ; $9DB6: 58
    STA $0704               ; $9DB7: 8D 04 07
    BPL $9DC3               ; $9DBA: 10 07
    .byte $C7            ; $9DBC
    STY $0C04               ; $9DBD: 8C 04 0C
    BPL $9DC9               ; $9DC0: 10 07
    TXA                     ; $9DC2: 8A
    STY $0004               ; $9DC3: 8C 04 00
    BPL $9DCF               ; $9DC6: 10 07
    DEC $048A               ; $9DC8: CE 8A 04
    .byte $02            ; $9DCB
    BPL $9DD5               ; $9DCC: 10 07
    .byte $54            ; $9DCE
    TXA                     ; $9DCF: 8A
    .byte $04            ; $9DD0
    ASL ptr_lo              ; $9DD1: 06 10
    .byte $07            ; $9DD3
    .byte $37            ; $9DD4
    STY $0504               ; $9DD5: 8C 04 05
    BPL $9DE1               ; $9DD8: 10 07
    LDX $8B,Y               ; $9DDA: B6 8B
    ASL $4000,X             ; $9DDC: 1E 00 40
    .byte $07            ; $9DDF
    .byte $23            ; $9DE0
    TXA                     ; $9DE1: 8A
    .byte $1F            ; $9DE2
    BRK                     ; $9DE3: 00
    RTI                     ; $9DE4: 40
    .byte $07            ; $9DE5
    EOR ($8A,X)             ; $9DE6: 41 8A
    .byte $04            ; $9DE8
    .byte $02            ; $9DE9
    RTI                     ; $9DEA: 40
    ORA #$7D                ; $9DEB: 09 7D
    .byte $87            ; $9DED
    .byte $04            ; $9DEE
    BRK                     ; $9DEF: 00
    RTI                     ; $9DF0: 40
    .byte $07            ; $9DF1
    TXS                     ; $9DF2: 9A
    STX ptr0_lo             ; $9DF3: 86 04
    .byte $02            ; $9DF5
    RTI                     ; $9DF6: 40
    .byte $07            ; $9DF7
    ADC $0487,X             ; $9DF8: 7D 87 04
    ASL $40                 ; $9DFB: 06 40
    .byte $07            ; $9DFD
    CPX $0487               ; $9DFE: EC 87 04
    ORA ($40,X)             ; $9E01: 01 40
    .byte $07            ; $9E03
    STX $0486               ; $9E04: 8E 86 04
    ORA $40                 ; $9E07: 05 40
    .byte $07            ; $9E09
    ORA $0486               ; $9E0A: 0D 86 04
    BRK                     ; $9E0D: 00
    RTI                     ; $9E0E: 40
    ORA #$72                ; $9E0F: 09 72
    DEY                     ; $9E11: 88
    .byte $0F            ; $9E12
    ORA ($40,X)             ; $9E13: 01 40
    BRK                     ; $9E15: 00
    .byte $89            ; $9E16
    STA $0F                 ; $9E17: 85 0F
    ORA ($20,X)             ; $9E19: 01 20
    BRK                     ; $9E1B: 00
    .byte $3C            ; $9E1C
    .byte $82            ; $9E1D
    .byte $0F            ; $9E1E
    BRK                     ; $9E1F: 00
    RTI                     ; $9E20: 40
    BRK                     ; $9E21: 00
    .byte $8B            ; $9E22
    .byte $83            ; $9E23
    ASL $8000               ; $9E24: 0E 00 80
    .byte $04            ; $9E27
    .byte $9E            ; $9E28
    STA tmp1                ; $9E29: 85 01
    ORA ($40,X)             ; $9E2B: 01 40
    ORA #$30                ; $9E2D: 09 30
    .byte $89            ; $9E2F
    ORA (tmp2,X)            ; $9E30: 01 02
    RTI                     ; $9E32: 40
    ORA #$5D                ; $9E33: 09 5D
    .byte $89            ; $9E35
    EOR (tmp1,X)            ; $9E36: 41 01
    .byte $80            ; $9E38
    PHP                     ; $9E39: 08
    ADC #$94                ; $9E3A: 69 94
    .byte $12            ; $9E3C
    BRK                     ; $9E3D: 00
    .byte $80            ; $9E3E
    PHP                     ; $9E3F: 08
    .byte $5A            ; $9E40
    .byte $82            ; $9E41
    .byte $12            ; $9E42
    ORA ($80,X)             ; $9E43: 01 80
    PHP                     ; $9E45: 08
    .byte $0B            ; $9E46
    STY tmp2                ; $9E47: 84 02
    BRK                     ; $9E49: 00
    .byte $80            ; $9E4A
    PHP                     ; $9E4B: 08
    ASL $0284,X             ; $9E4C: 1E 84 02
    ORA ($80,X)             ; $9E4F: 01 80
    PHP                     ; $9E51: 08
    STY $81                 ; $9E52: 84 81
    .byte $02            ; $9E54
    .byte $03            ; $9E55
    .byte $80            ; $9E56
    PHP                     ; $9E57: 08
    DEC $0084               ; $9E58: CE 84 00
    BRK                     ; $9E5B: 00
    .byte $02            ; $9E5C
    .byte $0F            ; $9E5D
    .byte $72            ; $9E5E
    .byte $89            ; $9E5F
    .byte $FF            ; $9E60
    EOR (tmp3,X)            ; $9E61: 41 03
    .byte $80            ; $9E63
    .byte $07            ; $9E64
    EOR (tmp1,X)            ; $9E65: 41 01
    .byte $80            ; $9E67
    .byte $07            ; $9E68
    EOR (tmp1,X)            ; $9E69: 41 01
    .byte $80            ; $9E6B
    ORA $12                 ; $9E6C: 05 12
    .byte $02            ; $9E6E
    .byte $80            ; $9E6F
    PHP                     ; $9E70: 08
    .byte $1C            ; $9E71
    BRK                     ; $9E72: 00
    .byte $80            ; $9E73
    PHP                     ; $9E74: 08
    .byte $33            ; $9E75
    BRK                     ; $9E76: 00
    .byte $80            ; $9E77
    PHP                     ; $9E78: 08
    .byte $33            ; $9E79
    .byte $03            ; $9E7A
    .byte $80            ; $9E7B
    .byte $07            ; $9E7C
    .byte $33            ; $9E7D
    .byte $04            ; $9E7E
    .byte $80            ; $9E7F
    .byte $07            ; $9E80
    ORA (tmp0,X)            ; $9E81: 01 00
    RTI                     ; $9E83: 40
    ORA #$01                ; $9E84: 09 01
    .byte $02            ; $9E86
    BPL $9E95               ; $9E87: 10 0C
    ASL $1000,X             ; $9E89: 1E 00 10
    .byte $07            ; $9E8C
    ORA (tmp2,X)            ; $9E8D: 01 02
    BPL $9E98               ; $9E8F: 10 07
    .byte $27            ; $9E91
    .byte $02            ; $9E92
    .byte $80            ; $9E93
    AND #$27                ; $9E94: 29 27
    ORA ($80,X)             ; $9E96: 01 80
    AND #$28                ; $9E98: 29 28
    .byte $02            ; $9E9A
    RTI                     ; $9E9B: 40
    AND #$29                ; $9E9C: 29 29
    ORA ($20,X)             ; $9E9E: 01 20
    AND #$44                ; $9EA0: 29 44
    .byte $03            ; $9EA2
    BPL $9ECE               ; $9EA3: 10 29
    .byte $FF            ; $9EA5
    LDA $62A5               ; $9EA6: AD A5 62
    BMI $9EB4               ; $9EA9: 30 09
    JSR $9EB5               ; $9EAB: 20 B5 9E
    JSR $A010               ; $9EAE: 20 10 A0
    JSR $AD32               ; $9EB1: 20 32 AD
    RTS                     ; $9EB4: 60
    LDX #$00                ; $9EB5: A2 00
    LDA $62ED               ; $9EB7: AD ED 62
    CMP #$78                ; $9EBA: C9 78
    BCC $9ECC               ; $9EBC: 90 0E
    LDA $9F8A,X             ; $9EBE: BD 8A 9F
    INX                     ; $9EC1: E8
    CMP #$FF                ; $9EC2: C9 FF
    BEQ $9ECC               ; $9EC4: F0 06
    INX                     ; $9EC6: E8
    INX                     ; $9EC7: E8
    INX                     ; $9EC8: E8
    JMP $9EBE               ; $9EC9: 4C BE 9E
    LDA $9F8A,X             ; $9ECC: BD 8A 9F
    CMP #$FF                ; $9ECF: C9 FF
    BEQ $9EE5               ; $9ED1: F0 12
    CMP $63                 ; $9ED3: C5 63
    BNE $9EDE               ; $9ED5: D0 07
    LDA $9F8B,X             ; $9ED7: BD 8B 9F
    CMP $64                 ; $9EDA: C5 64
    BEQ $9EE6               ; $9EDC: F0 08
    INX                     ; $9EDE: E8
    INX                     ; $9EDF: E8
    INX                     ; $9EE0: E8
    INX                     ; $9EE1: E8
    JMP $9ECC               ; $9EE2: 4C CC 9E
    RTS                     ; $9EE5: 60
    TXA                     ; $9EE6: 8A
    PHA                     ; $9EE7: 48
    LDY $9F8C,X             ; $9EE8: BC 8C 9F
    LDA $9F8D,X             ; $9EEB: BD 8D 9F
    AND #$07                ; $9EEE: 29 07
    CMP #$07                ; $9EF0: C9 07
    BEQ $9F5A               ; $9EF2: F0 66
    LDA $0515               ; $9EF4: AD 15 05
    BNE $9F66               ; $9EF7: D0 6D
    LDA $054E               ; $9EF9: AD 4E 05
    AND $054F               ; $9EFC: 2D 4F 05
    CMP #$FF                ; $9EFF: C9 FF
    BEQ $9F76               ; $9F01: F0 73
    LDA $64                 ; $9F03: A5 64
    CMP $0598               ; $9F05: CD 98 05
    BNE $9F1C               ; $9F08: D0 12
    LDA $054E               ; $9F0A: AD 4E 05
    STA $6F66,Y             ; $9F0D: 99 66 6F
    STA $6FA6,Y             ; $9F10: 99 A6 6F
    LDA $054F               ; $9F13: AD 4F 05
    STA $6F86,Y             ; $9F16: 99 86 6F
    STA $6FC6,Y             ; $9F19: 99 C6 6F
    LDA $70E6,Y             ; $9F1C: B9 E6 70
    ORA $9F8D,X             ; $9F1F: 1D 8D 9F
    STA $70E6,Y             ; $9F22: 99 E6 70
    STY $0534               ; $9F25: 8C 34 05
    AND #$07                ; $9F28: 29 07
    ASL                     ; $9F2A: 0A
    ASL                     ; $9F2B: 0A
    ASL                     ; $9F2C: 0A
    ASL                     ; $9F2D: 0A
    ASL                     ; $9F2E: 0A
    ORA $0534               ; $9F2F: 0D 34 05
    CLC                     ; $9F32: 18
    ADC #$06                ; $9F33: 69 06
    STA $0534               ; $9F35: 8D 34 05
    LDA $7006,Y             ; $9F38: B9 06 70
    AND #$FC                ; $9F3B: 29 FC
    ORA $3D                 ; $9F3D: 05 3D
    STA $7006,Y             ; $9F3F: 99 06 70
    TYA                     ; $9F42: 98
    PHA                     ; $9F43: 48
    LDX $6F66,Y             ; $9F44: BE 66 6F
    LDA $6F86,Y             ; $9F47: B9 86 6F
    TAY                     ; $9F4A: A8
    JSR $D3E6               ; $9F4B: 20 E6 D3
    TAX                     ; $9F4E: AA
    PLA                     ; $9F4F: 68
    TAY                     ; $9F50: A8
    TXA                     ; $9F51: 8A
    STA $7146,Y             ; $9F52: 99 46 71
    PLA                     ; $9F55: 68
    TAX                     ; $9F56: AA
    JMP $9EDE               ; $9F57: 4C DE 9E
    LDA $70E6,Y             ; $9F5A: B9 E6 70
    ORA $9F8D,X             ; $9F5D: 1D 8D 9F
    STA $70E6,Y             ; $9F60: 99 E6 70
    JMP $9F55               ; $9F63: 4C 55 9F
    LDA $44                 ; $9F66: A5 44
    STA $6F66,Y             ; $9F68: 99 66 6F
    STA $6FA6,Y             ; $9F6B: 99 A6 6F
    LDA $45                 ; $9F6E: A5 45
    STA $6F86,Y             ; $9F70: 99 86 6F
    STA $6FC6,Y             ; $9F73: 99 C6 6F
    LDA $6F66,Y             ; $9F76: B9 66 6F
    STA $054E               ; $9F79: 8D 4E 05
    LDA $6F86,Y             ; $9F7C: B9 86 6F
    STA $054F               ; $9F7F: 8D 4F 05
    LDA $64                 ; $9F82: A5 64
    STA $0598               ; $9F84: 8D 98 05
    JMP $9F1C               ; $9F87: 4C 1C 9F
    .byte $0B            ; $9F8A
    BRK                     ; $9F8B: 00
    ORA $07                 ; $9F8C: 05 07
    .byte $0B            ; $9F8E
    BRK                     ; $9F8F: 00
    .byte $02            ; $9F90
    ORA ($43,X)             ; $9F91: 01 43
    ASL tmp0                ; $9F93: 06 00
    ORA ($09,X)             ; $9F95: 01 09
    BRK                     ; $9F97: 00
    BRK                     ; $9F98: 00
    ORA ($09,X)             ; $9F99: 01 09
    BRK                     ; $9F9B: 00
    PHP                     ; $9F9C: 08
    .byte $07            ; $9F9D
    ORA #$00                ; $9F9E: 09 00
    .byte $02            ; $9FA0
    .byte $07            ; $9FA1
    ORA #$06                ; $9FA2: 09 06
    BRK                     ; $9FA4: 00
    ORA ($09,X)             ; $9FA5: 01 09
    ORA (tmp0,X)            ; $9FA7: 01 00
    ORA ($09,X)             ; $9FA9: 01 09
    .byte $02            ; $9FAB
    BRK                     ; $9FAC: 00
    ORA ($09,X)             ; $9FAD: 01 09
    ORA tmp0                ; $9FAF: 05 00
    ORA ($09,X)             ; $9FB1: 01 09
    .byte $03            ; $9FB3
    BRK                     ; $9FB4: 00
    ORA ($3E,X)             ; $9FB5: 01 3E
    BRK                     ; $9FB7: 00
    BRK                     ; $9FB8: 00
    .byte $07            ; $9FB9
    ROL $0100,X             ; $9FBA: 3E 00 01
    ORA ($3E,X)             ; $9FBD: 01 3E
    BRK                     ; $9FBF: 00
    .byte $02            ; $9FC0
    .byte $07            ; $9FC1
    SEC                     ; $9FC2: 38
    BRK                     ; $9FC3: 00
    BRK                     ; $9FC4: 00
    ORA ($38,X)             ; $9FC5: 01 38
    .byte $03            ; $9FC7
    BRK                     ; $9FC8: 00
    .byte $02            ; $9FC9
    SEC                     ; $9FCA: 38
    .byte $04            ; $9FCB
    ORA (tmp1,X)            ; $9FCC: 01 01
    ROL $0000               ; $9FCE: 2E 00 00
    ORA ($FF,X)             ; $9FD1: 01 FF
    .byte $0B            ; $9FD3
    BRK                     ; $9FD4: 00
    .byte $02            ; $9FD5
    ORA ($43,X)             ; $9FD6: 01 43
    ASL tmp0                ; $9FD8: 06 00
    ORA ($09,X)             ; $9FDA: 01 09
    BRK                     ; $9FDC: 00
    BRK                     ; $9FDD: 00
    ORA ($09,X)             ; $9FDE: 01 09
    ASL tmp0                ; $9FE0: 06 00
    ORA ($09,X)             ; $9FE2: 01 09
    ORA (tmp0,X)            ; $9FE4: 01 00
    ORA ($09,X)             ; $9FE6: 01 09
    .byte $02            ; $9FE8
    BRK                     ; $9FE9: 00
    ORA ($09,X)             ; $9FEA: 01 09
    ORA tmp0                ; $9FEC: 05 00
    ORA ($09,X)             ; $9FEE: 01 09
    .byte $03            ; $9FF0
    BRK                     ; $9FF1: 00
    ORA ($3E,X)             ; $9FF2: 01 3E
    BRK                     ; $9FF4: 00
    BRK                     ; $9FF5: 00
    .byte $07            ; $9FF6
    ROL $0100,X             ; $9FF7: 3E 00 01
    ORA ($3E,X)             ; $9FFA: 01 3E
    BRK                     ; $9FFC: 00
    .byte $02            ; $9FFD
    .byte $07            ; $9FFE
    SEC                     ; $9FFF: 38
    BRK                     ; $A000: 00
    BRK                     ; $A001: 00
    ORA ($38,X)             ; $A002: 01 38
    .byte $03            ; $A004
    BRK                     ; $A005: 00
    .byte $02            ; $A006
    SEC                     ; $A007: 38
    .byte $04            ; $A008
    ORA (tmp1,X)            ; $A009: 01 01
    ROL $0000               ; $A00B: 2E 00 00
    ORA ($FF,X)             ; $A00E: 01 FF
    LDX #$00                ; $A010: A2 00
    LDA $ABF5,X             ; $A012: BD F5 AB
    BMI $A027               ; $A015: 30 10
    CMP $63                 ; $A017: C5 63
    BNE $A022               ; $A019: D0 07
    LDA $ABF6,X             ; $A01B: BD F6 AB
    CMP $64                 ; $A01E: C5 64
    BEQ $A028               ; $A020: F0 06
    INX                     ; $A022: E8
    INX                     ; $A023: E8
    JMP $A012               ; $A024: 4C 12 A0
    RTS                     ; $A027: 60
    LDA $AC8A,X             ; $A028: BD 8A AC
    STA tmp0                ; $A02B: 85 00
    LDA $AC8B,X             ; $A02D: BD 8B AC
    STA tmp1                ; $A030: 85 01
    JMP ($0000)             ; $A032: 6C 00 00
    LDA #$80                ; $A035: A9 80
    STA $6F66,X             ; $A037: 9D 66 6F
    STA $6F86,X             ; $A03A: 9D 86 6F
    STA $6FA6,X             ; $A03D: 9D A6 6F
    STA $6FC6,X             ; $A040: 9D C6 6F
    RTS                     ; $A043: 60
    LDA $62ED               ; $A044: AD ED 62
    CMP #$78                ; $A047: C9 78
    RTS                     ; $A049: 60
    STA $6F66,X             ; $A04A: 9D 66 6F
    STA $6FA6,X             ; $A04D: 9D A6 6F
    TYA                     ; $A050: 98
    STA $6F86,X             ; $A051: 9D 86 6F
    STA $6FC6,X             ; $A054: 9D C6 6F
    RTS                     ; $A057: 60
    LDA $44                 ; $A058: A5 44
    CMP #$07                ; $A05A: C9 07
    BNE $A07E               ; $A05C: D0 20
    LDX #$00                ; $A05E: A2 00
    BRK                     ; $A060: 00
    BRK                     ; $A061: 00
    .byte $EB            ; $A062
    RTI                     ; $A063: 40
    BEQ $A068               ; $A064: F0 02
    LDX #$00                ; $A066: A2 00
    LDA #$07                ; $A068: A9 07
    LDY #$15                ; $A06A: A0 15
    JSR $A04A               ; $A06C: 20 4A A0
    LDA $7006,X             ; $A06F: BD 06 70
    AND #$FC                ; $A072: 29 FC
    ORA #$02                ; $A074: 09 02
    STA $7006,X             ; $A076: 9D 06 70
    LDA #$00                ; $A079: A9 00
    STA $7046,X             ; $A07B: 9D 46 70
    LDX #$01                ; $A07E: A2 01
    LDA $627B               ; $A080: AD 7B 62
    AND #$70                ; $A083: 29 70
    BEQ $A0A0               ; $A085: F0 19
    CMP #$10                ; $A087: C9 10
    BEQ $A0C3               ; $A089: F0 38
    CMP #$30                ; $A08B: C9 30
    BNE $A0C6               ; $A08D: D0 37
    JSR $A035               ; $A08F: 20 35 A0
    LDA #$76                ; $A092: A9 76
    BRK                     ; $A094: 00
    ROR $73                 ; $A095: 66 73
    BCS $A0AD               ; $A097: B0 14
    JSR $A044               ; $A099: 20 44 A0
    BCC $A0AD               ; $A09C: 90 0F
    BCS $A0AA               ; $A09E: B0 0A
    LDX #$06                ; $A0A0: A2 06
    JSR $A035               ; $A0A2: 20 35 A0
    LDX #$05                ; $A0A5: A2 05
    JSR $A035               ; $A0A7: 20 35 A0
    JSR $A0C6               ; $A0AA: 20 C6 A0
    LDX #$03                ; $A0AD: A2 03
    JSR $A035               ; $A0AF: 20 35 A0
    LDX #$04                ; $A0B2: A2 04
    JSR $A035               ; $A0B4: 20 35 A0
    LDX #$02                ; $A0B7: A2 02
    JSR $A035               ; $A0B9: 20 35 A0
    BRK                     ; $A0BC: 00
    ASL                     ; $A0BD: 0A
    .byte $EB            ; $A0BE
    ORA ($D0,X)             ; $A0BF: 01 D0
    .byte $04            ; $A0C1
    RTS                     ; $A0C2: 60
    JSR $A035               ; $A0C3: 20 35 A0
    LDX #$10                ; $A0C6: A2 10
    JSR $A035               ; $A0C8: 20 35 A0
    LDX #$0F                ; $A0CB: A2 0F
    JSR $A035               ; $A0CD: 20 35 A0
    LDX #$0E                ; $A0D0: A2 0E
    JSR $A035               ; $A0D2: 20 35 A0
    RTS                     ; $A0D5: 60
    BIT $6287               ; $A0D6: 2C 87 62
    BVS $A0E5               ; $A0D9: 70 0A
    LDX #$00                ; $A0DB: A2 00
    JSR $A035               ; $A0DD: 20 35 A0
    LDX #$01                ; $A0E0: A2 01
    JSR $A035               ; $A0E2: 20 35 A0
    RTS                     ; $A0E5: 60
    BRK                     ; $A0E6: 00
    .byte $03            ; $A0E7
    .byte $EB            ; $A0E8
    ORA ($F0,X)             ; $A0E9: 01 F0
    ASL                     ; $A0EB: 0A
    LDX #$00                ; $A0EC: A2 00
    JSR $A035               ; $A0EE: 20 35 A0
    LDX #$01                ; $A0F1: A2 01
    JSR $A035               ; $A0F3: 20 35 A0
    RTS                     ; $A0F6: 60
    JSR $A044               ; $A0F7: 20 44 A0
    BCS $A10A               ; $A0FA: B0 0E
    LDA $627E               ; $A0FC: AD 7E 62
    AND #$0E                ; $A0FF: 29 0E
    CMP #$0E                ; $A101: C9 0E
    BNE $A10A               ; $A103: D0 05
    LDX #$01                ; $A105: A2 01
    JSR $A035               ; $A107: 20 35 A0
    RTS                     ; $A10A: 60
    LDA $615A               ; $A10B: AD 5A 61
    CMP #$04                ; $A10E: C9 04
    BEQ $A129               ; $A110: F0 17
    BRK                     ; $A112: 00
    ORA #$EB                ; $A113: 09 EB
    RTI                     ; $A115: 40
    BNE $A128               ; $A116: D0 10
    JSR $A044               ; $A118: 20 44 A0
    BCS $A128               ; $A11B: B0 0B
    BRK                     ; $A11D: 00
    .byte $04            ; $A11E
    .byte $EB            ; $A11F
    ORA ($F0,X)             ; $A120: 01 F0
    ORA $A2                 ; $A122: 05 A2
    ASL                     ; $A124: 0A
    JSR $A035               ; $A125: 20 35 A0
    RTS                     ; $A128: 60
    BRK                     ; $A129: 00
    ORA $01EB,Y             ; $A12A: 19 EB 01
    BEQ $A13E               ; $A12D: F0 0F
    LDA $6295               ; $A12F: AD 95 62
    BMI $A139               ; $A132: 30 05
    AND #$40                ; $A134: 29 40
    BNE $A143               ; $A136: D0 0B
    RTS                     ; $A138: 60
    LDX #$02                ; $A139: A2 02
    JSR $A035               ; $A13B: 20 35 A0
    LDX #$01                ; $A13E: A2 01
    JSR $A035               ; $A140: 20 35 A0
    LDX #$00                ; $A143: A2 00
    JSR $A035               ; $A145: 20 35 A0
    RTS                     ; $A148: 60
    BRK                     ; $A149: 00
    ORA #$EB                ; $A14A: 09 EB
    RTI                     ; $A14C: 40
    BNE $A15B               ; $A14D: D0 0C
    BRK                     ; $A14F: 00
    .byte $04            ; $A150
    .byte $EB            ; $A151
    ORA ($F0,X)             ; $A152: 01 F0
    ORA $A2                 ; $A154: 05 A2
    BRK                     ; $A156: 00
    JSR $A035               ; $A157: 20 35 A0
    RTS                     ; $A15A: 60
    BRK                     ; $A15B: 00
    ORA $01EB,Y             ; $A15C: 19 EB 01
    BEQ $A167               ; $A15F: F0 06
    BRK                     ; $A161: 00
    .byte $1A            ; $A162
    .byte $EB            ; $A163
    .byte $80            ; $A164
    BEQ $A15A               ; $A165: F0 F3
    LDX #$06                ; $A167: A2 06
    JSR $A035               ; $A169: 20 35 A0
    LDX #$03                ; $A16C: A2 03
    JMP $A035               ; $A16E: 4C 35 A0
    BRK                     ; $A171: 00
    .byte $03            ; $A172
    .byte $EB            ; $A173
    BPL $A166               ; $A174: 10 F0
    .byte $0B            ; $A176
    LDY #$09                ; $A177: A0 09
    LDX #$0C                ; $A179: A2 0C
    JSR $A035               ; $A17B: 20 35 A0
    INX                     ; $A17E: E8
    DEY                     ; $A17F: 88
    BNE $A17B               ; $A180: D0 F9
    BRK                     ; $A182: 00
    .byte $07            ; $A183
    .byte $EB            ; $A184
    BPL $A177               ; $A185: 10 F0
    ORA $A2                 ; $A187: 05 A2
    BRK                     ; $A189: 00
    JMP $A035               ; $A18A: 4C 35 A0
    LDA $45                 ; $A18D: A5 45
    CMP #$15                ; $A18F: C9 15
    BNE $A1AD               ; $A191: D0 1A
    LDA #$11                ; $A193: A9 11
    LDX #$00                ; $A195: A2 00
    STA $7046,X             ; $A197: 9D 46 70
    LDA #$18                ; $A19A: A9 18
    STA $6F66,X             ; $A19C: 9D 66 6F
    STA $6FA6,X             ; $A19F: 9D A6 6F
    LDA #$16                ; $A1A2: A9 16
    STA $6F86,X             ; $A1A4: 9D 86 6F
    STA $6FC6,X             ; $A1A7: 9D C6 6F
    JSR $AD1E               ; $A1AA: 20 1E AD
    RTS                     ; $A1AD: 60
    BRK                     ; $A1AE: 00
    .byte $03            ; $A1AF
    .byte $EB            ; $A1B0
    JSR $08D0               ; $A1B1: 20 D0 08
    LDX #$01                ; $A1B4: A2 01
    JSR $A035               ; $A1B6: 20 35 A0
    JMP $A1C0               ; $A1B9: 4C C0 A1
    BRK                     ; $A1BC: 00
    .byte $03            ; $A1BD
    .byte $DB            ; $A1BE
    .byte $DF            ; $A1BF
    BRK                     ; $A1C0: 00
    .byte $03            ; $A1C1
    .byte $EB            ; $A1C2
    RTI                     ; $A1C3: 40
    BNE $A1CB               ; $A1C4: D0 05
    LDX #$02                ; $A1C6: A2 02
    JSR $A035               ; $A1C8: 20 35 A0
    RTS                     ; $A1CB: 60
    BRK                     ; $A1CC: 00
    .byte $07            ; $A1CD
    .byte $EB            ; $A1CE
    BPL $A1A1               ; $A1CF: 10 D0
    ORA (tmp0),Y            ; $A1D1: 11 00
    .byte $03            ; $A1D3
    .byte $EB            ; $A1D4
    RTS                     ; $A1D5: 60
    BEQ $A1E2               ; $A1D6: F0 0A
    JSR $A044               ; $A1D8: 20 44 A0
    BCS $A1E2               ; $A1DB: B0 05
    LDX #$0B                ; $A1DD: A2 0B
    JSR $A035               ; $A1DF: 20 35 A0
    RTS                     ; $A1E2: 60
    JSR $A044               ; $A1E3: 20 44 A0
    BCC $A1DD               ; $A1E6: 90 F5
    LDX #$07                ; $A1E8: A2 07
    JMP $A035               ; $A1EA: 4C 35 A0
    BRK                     ; $A1ED: 00
    .byte $07            ; $A1EE
    .byte $EB            ; $A1EF
    BPL $A1C2               ; $A1F0: 10 D0
    .byte $33            ; $A1F2
    BRK                     ; $A1F3: 00
    .byte $04            ; $A1F4
    .byte $EB            ; $A1F5
    PHP                     ; $A1F6: 08
    BEQ $A213               ; $A1F7: F0 1A
    JSR $A044               ; $A1F9: 20 44 A0
    BCS $A220               ; $A1FC: B0 22
    LDX #$04                ; $A1FE: A2 04
    JSR $A035               ; $A200: 20 35 A0
    LDX #$00                ; $A203: A2 00
    JSR $A035               ; $A205: 20 35 A0
    BRK                     ; $A208: 00
    .byte $0B            ; $A209
    .byte $EB            ; $A20A
    JSR $18F0               ; $A20B: 20 F0 18
    LDX #$01                ; $A20E: A2 01
    JMP $A035               ; $A210: 4C 35 A0
    LDA #$07                ; $A213: A9 07
    STA $6FE0               ; $A215: 8D E0 6F
    INC $7000               ; $A218: EE 00 70
    LDX #$01                ; $A21B: A2 01
    JMP $A035               ; $A21D: 4C 35 A0
    BRK                     ; $A220: 00
    .byte $0B            ; $A221
    .byte $EB            ; $A222
    JSR $DDD0               ; $A223: 20 D0 DD
    RTS                     ; $A226: 60
    BRK                     ; $A227: 00
    .byte $07            ; $A228
    .byte $EB            ; $A229
    BPL $A1FC               ; $A22A: 10 D0
    .byte $1A            ; $A22C
    BIT $6281               ; $A22D: 2C 81 62
    BVC $A237               ; $A230: 50 05
    LDX #$01                ; $A232: A2 01
    JSR $A035               ; $A234: 20 35 A0
    BIT $6283               ; $A237: 2C 83 62
    BPL $A246               ; $A23A: 10 0A
    LDX #$00                ; $A23C: A2 00
    JSR $A035               ; $A23E: 20 35 A0
    LDX #$02                ; $A241: A2 02
    JSR $A035               ; $A243: 20 35 A0
    RTS                     ; $A246: 60
    LDX #$01                ; $A247: A2 01
    JSR $A035               ; $A249: 20 35 A0
    JMP $A23C               ; $A24C: 4C 3C A2
    BRK                     ; $A24F: 00
    .byte $07            ; $A250
    .byte $EB            ; $A251
    BPL $A224               ; $A252: 10 D0
    BPL $A276               ; $A254: 10 20
    .byte $44            ; $A256
    LDY #$90                ; $A257: A0 90
    .byte $0B            ; $A259
    BRK                     ; $A25A: 00
    .byte $03            ; $A25B
    .byte $EB            ; $A25C
    RTS                     ; $A25D: 60
    BEQ $A265               ; $A25E: F0 05
    LDX #$02                ; $A260: A2 02
    JSR $A035               ; $A262: 20 35 A0
    RTS                     ; $A265: 60
    LDX #$06                ; $A266: A2 06
    JSR $A035               ; $A268: 20 35 A0
    LDX #$07                ; $A26B: A2 07
    JSR $A035               ; $A26D: 20 35 A0
    LDX #$08                ; $A270: A2 08
    JSR $A035               ; $A272: 20 35 A0
    BRK                     ; $A275: 00
    PHP                     ; $A276: 08
    .byte $EB            ; $A277
    .byte $80            ; $A278
    BPL $A299               ; $A279: 10 1E
    LDX #$02                ; $A27B: A2 02
    JSR $A035               ; $A27D: 20 35 A0
    LDX #$01                ; $A280: A2 01
    JSR $A035               ; $A282: 20 35 A0
    LDX #$03                ; $A285: A2 03
    JSR $A035               ; $A287: 20 35 A0
    LDX #$03                ; $A28A: A2 03
    JSR $A035               ; $A28C: 20 35 A0
    LDX #$00                ; $A28F: A2 00
    JSR $A035               ; $A291: 20 35 A0
    LDX #$04                ; $A294: A2 04
    JSR $A035               ; $A296: 20 35 A0
    RTS                     ; $A299: 60
    BRK                     ; $A29A: 00
    .byte $07            ; $A29B
    .byte $EB            ; $A29C
    BPL $A28F               ; $A29D: 10 F0
    ORA ($60,X)             ; $A29F: 01 60
    JSR $A044               ; $A2A1: 20 44 A0
    BCS $A2D5               ; $A2A4: B0 2F
    BRK                     ; $A2A6: 00
    ASL                     ; $A2A7: 0A
    .byte $EB            ; $A2A8
    ORA ($D0,X)             ; $A2A9: 01 D0
    PHP                     ; $A2AB: 08
    LDX #$0F                ; $A2AC: A2 0F
    JSR $A035               ; $A2AE: 20 35 A0
    JMP $A2BA               ; $A2B1: 4C BA A2
    BRK                     ; $A2B4: 00
    ORA #$EB                ; $A2B5: 09 EB
    .byte $04            ; $A2B7
    BNE $A2AC               ; $A2B8: D0 F2
    BRK                     ; $A2BA: 00
    ASL                     ; $A2BB: 0A
    .byte $EB            ; $A2BC
    ORA ($F0,X)             ; $A2BD: 01 F0
    PHP                     ; $A2BF: 08
    LDX #$0D                ; $A2C0: A2 0D
    JSR $A035               ; $A2C2: 20 35 A0
    JMP $A2D0               ; $A2C5: 4C D0 A2
    LDX #$0D                ; $A2C8: A2 0D
    BRK                     ; $A2CA: 00
    ORA #$EB                ; $A2CB: 09 EB
    .byte $02            ; $A2CD
    BEQ $A2D2               ; $A2CE: F0 02
    LDX #$0B                ; $A2D0: A2 0B
    JSR $A035               ; $A2D2: 20 35 A0
    BRK                     ; $A2D5: 00
    ORA $EB                 ; $A2D6: 05 EB
    .byte $04            ; $A2D8
    BNE $A2E8               ; $A2D9: D0 0D
    LDX #$02                ; $A2DB: A2 02
    JSR $A035               ; $A2DD: 20 35 A0
    LDX #$03                ; $A2E0: A2 03
    JSR $A035               ; $A2E2: 20 35 A0
    JMP $A2F3               ; $A2E5: 4C F3 A2
    LDX #$00                ; $A2E8: A2 00
    JSR $A035               ; $A2EA: 20 35 A0
    BRK                     ; $A2ED: 00
    .byte $0B            ; $A2EE
    .byte $EB            ; $A2EF
    .byte $04            ; $A2F0
    BNE $A2E0               ; $A2F1: D0 ED
    JSR $A044               ; $A2F3: 20 44 A0
    BCS $A321               ; $A2F6: B0 29
    BRK                     ; $A2F8: 00
    ORA $EB                 ; $A2F9: 05 EB
    BPL $A2ED               ; $A2FB: 10 F0
    .byte $17            ; $A2FD
    LDX #$01                ; $A2FE: A2 01
    LDA #$0E                ; $A300: A9 0E
    STA $6F66,X             ; $A302: 9D 66 6F
    STA $6FA6,X             ; $A305: 9D A6 6F
    LDA #$06                ; $A308: A9 06
    STA $6F86,X             ; $A30A: 9D 86 6F
    STA $6FC6,X             ; $A30D: 9D C6 6F
    LDA #$00                ; $A310: A9 00
    STA $7006,X             ; $A312: 9D 06 70
    BRK                     ; $A315: 00
    .byte $0B            ; $A316
    .byte $EB            ; $A317
    JSR $05F0               ; $A318: 20 F0 05
    LDX #$0C                ; $A31B: A2 0C
    JSR $A035               ; $A31D: 20 35 A0
    RTS                     ; $A320: 60
    BRK                     ; $A321: 00
    ORA $DB                 ; $A322: 05 DB
    .byte $CF            ; $A324
    RTS                     ; $A325: 60
    BRK                     ; $A326: 00
    .byte $07            ; $A327
    .byte $EB            ; $A328
    BPL $A2FB               ; $A329: 10 D0
    BPL $A34D               ; $A32B: 10 20
    .byte $44            ; $A32D
    LDY #$B0                ; $A32E: A0 B0
    .byte $0B            ; $A330
    BRK                     ; $A331: 00
    ASL                     ; $A332: 0A
    .byte $EB            ; $A333
    ORA ($D0,X)             ; $A334: 01 D0
    ORA $A2                 ; $A336: 05 A2
    BRK                     ; $A338: 00
    JSR $A035               ; $A339: 20 35 A0
    RTS                     ; $A33C: 60
    LDA $615A               ; $A33D: AD 5A 61
    CMP #$04                ; $A340: C9 04
    BEQ $A36D               ; $A342: F0 29
    LDA $6283               ; $A344: AD 83 62
    BPL $A36D               ; $A347: 10 24
    AND #$20                ; $A349: 29 20
    BEQ $A357               ; $A34B: F0 0A
    LDX #$13                ; $A34D: A2 13
    JSR $A035               ; $A34F: 20 35 A0
    LDX #$07                ; $A352: A2 07
    JMP $A035               ; $A354: 4C 35 A0
    LDX #$11                ; $A357: A2 11
    JSR $A035               ; $A359: 20 35 A0
    LDX #$09                ; $A35C: A2 09
    JSR $A035               ; $A35E: 20 35 A0
    LDA #$11                ; $A361: A9 11
    LDX #$07                ; $A363: A2 07
    STA $7046,X             ; $A365: 9D 46 70
    LDX #$10                ; $A368: A2 10
    STA $7046,X             ; $A36A: 9D 46 70
    RTS                     ; $A36D: 60
    BIT $627B               ; $A36E: 2C 7B 62
    BVC $A37F               ; $A371: 50 0C
    LDA $615A               ; $A373: AD 5A 61
    CMP #$01                ; $A376: C9 01
    BNE $A37F               ; $A378: D0 05
    LDX #$00                ; $A37A: A2 00
    JSR $A035               ; $A37C: 20 35 A0
    RTS                     ; $A37F: 60
    LDA $615A               ; $A380: AD 5A 61
    CMP #$04                ; $A383: C9 04
    BEQ $A3A7               ; $A385: F0 20
    LDA $44                 ; $A387: A5 44
    CMP #$16                ; $A389: C9 16
    BEQ $A398               ; $A38B: F0 0B
    LDX #$08                ; $A38D: A2 08
    JSR $A035               ; $A38F: 20 35 A0
    LDX #$09                ; $A392: A2 09
    JSR $A035               ; $A394: 20 35 A0
    RTS                     ; $A397: 60
    LDX #$0A                ; $A398: A2 0A
    JSR $A035               ; $A39A: 20 35 A0
    LDX #$0B                ; $A39D: A2 0B
    JSR $A035               ; $A39F: 20 35 A0
    LDX #$0C                ; $A3A2: A2 0C
    JSR $A035               ; $A3A4: 20 35 A0
    RTS                     ; $A3A7: 60
    BRK                     ; $A3A8: 00
    .byte $0B            ; $A3A9
    .byte $EB            ; $A3AA
    .byte $02            ; $A3AB
    BEQ $A3B8               ; $A3AC: F0 0A
    LDX #$00                ; $A3AE: A2 00
    JSR $A035               ; $A3B0: 20 35 A0
    LDX #$01                ; $A3B3: A2 01
    JSR $A035               ; $A3B5: 20 35 A0
    RTS                     ; $A3B8: 60
    LDA $615A               ; $A3B9: AD 5A 61
    CMP #$01                ; $A3BC: C9 01
    BNE $A3D1               ; $A3BE: D0 11
    BRK                     ; $A3C0: 00
    ORA #$EB                ; $A3C1: 09 EB
    RTI                     ; $A3C3: 40
    BEQ $A3D1               ; $A3C4: F0 0B
    BRK                     ; $A3C6: 00
    .byte $0C            ; $A3C7
    .byte $EB            ; $A3C8
    JSR $05F0               ; $A3C9: 20 F0 05
    LDX #$00                ; $A3CC: A2 00
    JSR $A035               ; $A3CE: 20 35 A0
    LDA $615A               ; $A3D1: AD 5A 61
    CMP #$04                ; $A3D4: C9 04
    BEQ $A3FE               ; $A3D6: F0 26
    CMP #$02                ; $A3D8: C9 02
    BNE $A3F8               ; $A3DA: D0 1C
    LDX $62ED               ; $A3DC: AE ED 62
    CPX #$78                ; $A3DF: E0 78
    BCS $A3FD               ; $A3E1: B0 1A
    CMP #$02                ; $A3E3: C9 02
    BNE $A3F2               ; $A3E5: D0 0B
    BRK                     ; $A3E7: 00
    .byte $13            ; $A3E8
    .byte $EB            ; $A3E9
    .byte $80            ; $A3EA
    BEQ $A3F2               ; $A3EB: F0 05
    LDX #$07                ; $A3ED: A2 07
    JSR $A035               ; $A3EF: 20 35 A0
    BRK                     ; $A3F2: 00
    .byte $0B            ; $A3F3
    .byte $EB            ; $A3F4
    JSR $05D0               ; $A3F5: 20 D0 05
    LDX #$0C                ; $A3F8: A2 0C
    JSR $A035               ; $A3FA: 20 35 A0
    RTS                     ; $A3FD: 60
    LDA $6292               ; $A3FE: AD 92 62
    BPL $A3FD               ; $A401: 10 FA
    LDX #$00                ; $A403: A2 00
    LDA #$77                ; $A405: A9 77
    STA $7046,X             ; $A407: 9D 46 70
    LDX #$01                ; $A40A: A2 01
    JMP $A035               ; $A40C: 4C 35 A0
    LDX #$0F                ; $A40F: A2 0F
    BRK                     ; $A411: 00
    .byte $07            ; $A412
    .byte $EB            ; $A413
    BPL $A3E6               ; $A414: 10 D0
    .byte $1B            ; $A416
    LDA $62ED               ; $A417: AD ED 62
    CMP #$FF                ; $A41A: C9 FF
    BNE $A42F               ; $A41C: D0 11
    LDX #$0B                ; $A41E: A2 0B
    JSR $A035               ; $A420: 20 35 A0
    LDX #$0C                ; $A423: A2 0C
    JSR $A035               ; $A425: 20 35 A0
    LDX #$0D                ; $A428: A2 0D
    JSR $A035               ; $A42A: 20 35 A0
    LDX #$0E                ; $A42D: A2 0E
    JMP $A035               ; $A42F: 4C 35 A0
    JSR $A035               ; $A432: 20 35 A0
    BRK                     ; $A435: 00
    .byte $1A            ; $A436
    .byte $EB            ; $A437
    .byte $02            ; $A438
    BEQ $A43C               ; $A439: F0 01
    RTS                     ; $A43B: 60
    LDX #$10                ; $A43C: A2 10
    LDA #$0C                ; $A43E: A9 0C
    STA $6F66,X             ; $A440: 9D 66 6F
    STA $6FA6,X             ; $A443: 9D A6 6F
    LDA #$0B                ; $A446: A9 0B
    STA $6F86,X             ; $A448: 9D 86 6F
    STA $6FC6,X             ; $A44B: 9D C6 6F
    JSR $AD1E               ; $A44E: 20 1E AD
    JMP $A41E               ; $A451: 4C 1E A4
    BRK                     ; $A454: 00
    .byte $07            ; $A455
    .byte $EB            ; $A456
    BPL $A449               ; $A457: 10 F0
    .byte $1B            ; $A459
    BRK                     ; $A45A: 00
    ORA $01EB,Y             ; $A45B: 19 EB 01
    BEQ $A488               ; $A45E: F0 28
    JSR $A044               ; $A460: 20 44 A0
    BCS $A46A               ; $A463: B0 05
    LDX #$03                ; $A465: A2 03
    JSR $A035               ; $A467: 20 35 A0
    BRK                     ; $A46A: 00
    .byte $1A            ; $A46B
    .byte $EB            ; $A46C
    JSR $18F0               ; $A46D: 20 F0 18
    LDX #$00                ; $A470: A2 00
    JMP $A035               ; $A472: 4C 35 A0
    BRK                     ; $A475: 00
    .byte $0F            ; $A476
    .byte $EB            ; $A477
    .byte $02            ; $A478
    BEQ $A488               ; $A479: F0 0D
    LDX #$00                ; $A47B: A2 00
    BRK                     ; $A47D: 00
    .byte $0F            ; $A47E
    .byte $EB            ; $A47F
    PHP                     ; $A480: 08
    BNE $A485               ; $A481: D0 02
    LDX #$04                ; $A483: A2 04
    JSR $A035               ; $A485: 20 35 A0
    RTS                     ; $A488: 60
    BRK                     ; $A489: 00
    .byte $07            ; $A48A
    .byte $EB            ; $A48B
    BPL $A47E               ; $A48C: 10 F0
    ORA $A2                 ; $A48E: 05 A2
    .byte $03            ; $A490
    JSR $A035               ; $A491: 20 35 A0
    BRK                     ; $A494: 00
    ORA $EB                 ; $A495: 05 EB
    .byte $04            ; $A497
    BEQ $A49F               ; $A498: F0 05
    LDX #$02                ; $A49A: A2 02
    JSR $A035               ; $A49C: 20 35 A0
    RTS                     ; $A49F: 60
    BRK                     ; $A4A0: 00
    ORA #$EB                ; $A4A1: 09 EB
    JSR $05F0               ; $A4A3: 20 F0 05
    LDX #$00                ; $A4A6: A2 00
    JSR $A035               ; $A4A8: 20 35 A0
    RTS                     ; $A4AB: 60
    JSR $A044               ; $A4AC: 20 44 A0
    BCC $A4C8               ; $A4AF: 90 17
    BRK                     ; $A4B1: 00
    .byte $07            ; $A4B2
    .byte $EB            ; $A4B3
    BPL $A486               ; $A4B4: 10 D0
    ASL tmp0                ; $A4B6: 06 00
    ORA $EB                 ; $A4B8: 05 EB
    PHP                     ; $A4BA: 08
    BNE $A4C7               ; $A4BB: D0 0A
    LDX #$01                ; $A4BD: A2 01
    JSR $A035               ; $A4BF: 20 35 A0
    LDX #$00                ; $A4C2: A2 00
    JMP $A035               ; $A4C4: 4C 35 A0
    RTS                     ; $A4C7: 60
    BRK                     ; $A4C8: 00
    .byte $07            ; $A4C9
    .byte $EB            ; $A4CA
    BPL $A4BD               ; $A4CB: 10 F0
    .byte $0F            ; $A4CD
    LDX #$00                ; $A4CE: A2 00
    JSR $A035               ; $A4D0: 20 35 A0
    LDX #$01                ; $A4D3: A2 01
    JSR $A035               ; $A4D5: 20 35 A0
    LDX #$08                ; $A4D8: A2 08
    JMP $A035               ; $A4DA: 4C 35 A0
    LDX #$0F                ; $A4DD: A2 0F
    JMP $A035               ; $A4DF: 4C 35 A0
    BRK                     ; $A4E2: 00
    .byte $07            ; $A4E3
    .byte $EB            ; $A4E4
    BPL $A4B7               ; $A4E5: 10 D0
    ROL tmp0                ; $A4E7: 26 00
    .byte $0B            ; $A4E9
    .byte $EB            ; $A4EA
    JSR $20D0               ; $A4EB: 20 D0 20
    LDX #$01                ; $A4EE: A2 01
    JSR $A035               ; $A4F0: 20 35 A0
    JSR $A044               ; $A4F3: 20 44 A0
    BCC $A508               ; $A4F6: 90 10
    LDX #$02                ; $A4F8: A2 02
    JSR $A035               ; $A4FA: 20 35 A0
    BRK                     ; $A4FD: 00
    .byte $07            ; $A4FE
    .byte $EB            ; $A4FF
    RTI                     ; $A500: 40
    BNE $A509               ; $A501: D0 06
    LDX #$03                ; $A503: A2 03
    JSR $A035               ; $A505: 20 35 A0
    RTS                     ; $A508: 60
    LDX #$00                ; $A509: A2 00
    JMP $A035               ; $A50B: 4C 35 A0
    LDX #$00                ; $A50E: A2 00
    JSR $A035               ; $A510: 20 35 A0
    JSR $A044               ; $A513: 20 44 A0
    BCC $A51D               ; $A516: 90 05
    LDX #$03                ; $A518: A2 03
    JSR $A035               ; $A51A: 20 35 A0
    RTS                     ; $A51D: 60
    LDA $615A               ; $A51E: AD 5A 61
    CMP #$02                ; $A521: C9 02
    BNE $A53A               ; $A523: D0 15
    BRK                     ; $A525: 00
    .byte $13            ; $A526
    .byte $EB            ; $A527
    RTI                     ; $A528: 40
    BEQ $A530               ; $A529: F0 05
    LDX #$00                ; $A52B: A2 00
    JSR $A035               ; $A52D: 20 35 A0
    JSR $A044               ; $A530: 20 44 A0
    BCC $A548               ; $A533: 90 13
    LDX #$04                ; $A535: A2 04
    JMP $A035               ; $A537: 4C 35 A0
    CMP #$01                ; $A53A: C9 01
    BNE $A535               ; $A53C: D0 F7
    JSR $A044               ; $A53E: 20 44 A0
    BCC $A548               ; $A541: 90 05
    LDX #$00                ; $A543: A2 00
    JSR $A035               ; $A545: 20 35 A0
    RTS                     ; $A548: 60
    BRK                     ; $A549: 00
    ORA $EB                 ; $A54A: 05 EB
    .byte $02            ; $A54C
    BNE $A555               ; $A54D: D0 06
    BRK                     ; $A54F: 00
    .byte $0B            ; $A550
    .byte $EB            ; $A551
    .byte $04            ; $A552
    BNE $A55A               ; $A553: D0 05
    LDX #$00                ; $A555: A2 00
    JSR $A035               ; $A557: 20 35 A0
    RTS                     ; $A55A: 60
    LDA $62AA               ; $A55B: AD AA 62
    AND #$20                ; $A55E: 29 20
    BEQ $A567               ; $A560: F0 05
    LDX #$00                ; $A562: A2 00
    JSR $A035               ; $A564: 20 35 A0
    RTS                     ; $A567: 60
    LDA $44                 ; $A568: A5 44
    CMP #$0E                ; $A56A: C9 0E
    BNE $A57E               ; $A56C: D0 10
    LDX #$01                ; $A56E: A2 01
    STA $6F66,X             ; $A570: 9D 66 6F
    STA $6FA6,X             ; $A573: 9D A6 6F
    LDA #$09                ; $A576: A9 09
    STA $6F86,X             ; $A578: 9D 86 6F
    STA $6FC6,X             ; $A57B: 9D C6 6F
    RTS                     ; $A57E: 60
    LDA $615A               ; $A57F: AD 5A 61
    CMP #$04                ; $A582: C9 04
    BEQ $A599               ; $A584: F0 13
    CMP #$01                ; $A586: C9 01
    BEQ $A594               ; $A588: F0 0A
    CMP #$02                ; $A58A: C9 02
    BNE $A59F               ; $A58C: D0 11
    BRK                     ; $A58E: 00
    .byte $0C            ; $A58F
    .byte $EB            ; $A590
    .byte $80            ; $A591
    BEQ $A59F               ; $A592: F0 0B
    LDX #$00                ; $A594: A2 00
    JMP $A035               ; $A596: 4C 35 A0
    BRK                     ; $A599: 00
    .byte $17            ; $A59A
    .byte $EB            ; $A59B
    RTI                     ; $A59C: 40
    BNE $A594               ; $A59D: D0 F5
    RTS                     ; $A59F: 60
    LDA $615A               ; $A5A0: AD 5A 61
    CMP #$04                ; $A5A3: C9 04
    BNE $A5B1               ; $A5A5: D0 0A
    LDX #$00                ; $A5A7: A2 00
    JSR $A035               ; $A5A9: 20 35 A0
    LDX #$01                ; $A5AC: A2 01
    JSR $A035               ; $A5AE: 20 35 A0
    RTS                     ; $A5B1: 60
    LDA $615A               ; $A5B2: AD 5A 61
    CMP #$04                ; $A5B5: C9 04
    BNE $A5CE               ; $A5B7: D0 15
    BRK                     ; $A5B9: 00
    .byte $17            ; $A5BA
    .byte $EB            ; $A5BB
    ORA ($F0,X)             ; $A5BC: 01 F0
    .byte $0F            ; $A5BE
    LDX #$02                ; $A5BF: A2 02
    JSR $A035               ; $A5C1: 20 35 A0
    LDX #$01                ; $A5C4: A2 01
    JSR $A035               ; $A5C6: 20 35 A0
    LDX #$00                ; $A5C9: A2 00
    JSR $A035               ; $A5CB: 20 35 A0
    RTS                     ; $A5CE: 60
    LDA $0530               ; $A5CF: AD 30 05
    BNE $A5F5               ; $A5D2: D0 21
    LDX #$06                ; $A5D4: A2 06
    LDA #$00                ; $A5D6: A9 00
    STA $7046,X             ; $A5D8: 9D 46 70
    LDA #$04                ; $A5DB: A9 04
    STA $6F66,X             ; $A5DD: 9D 66 6F
    STA $6FA6,X             ; $A5E0: 9D A6 6F
    LDA #$10                ; $A5E3: A9 10
    STA $6F86,X             ; $A5E5: 9D 86 6F
    STA $6FC6,X             ; $A5E8: 9D C6 6F
    LDA $7006,X             ; $A5EB: BD 06 70
    AND #$FC                ; $A5EE: 29 FC
    ORA #$02                ; $A5F0: 09 02
    STA $7006,X             ; $A5F2: 9D 06 70
    RTS                     ; $A5F5: 60
    LDA $45                 ; $A5F6: A5 45
    CMP #$06                ; $A5F8: C9 06
    BNE $A619               ; $A5FA: D0 1D
    JSR $A044               ; $A5FC: 20 44 A0
    BCC $A619               ; $A5FF: 90 18
    LDA #$04                ; $A601: A9 04
    LDX #$0B                ; $A603: A2 0B
    STA $6F86,X             ; $A605: 9D 86 6F
    STA $6FC6,X             ; $A608: 9D C6 6F
    LDA $7006,X             ; $A60B: BD 06 70
    AND #$FC                ; $A60E: 29 FC
    ORA #$02                ; $A610: 09 02
    STA $7006,X             ; $A612: 9D 06 70
    BRK                     ; $A615: 00
    ASL $80CB               ; $A616: 0E CB 80
    BRK                     ; $A619: 00
    .byte $17            ; $A61A
    .byte $EB            ; $A61B
    JSR $12F0               ; $A61C: 20 F0 12
    LDX #$00                ; $A61F: A2 00
    JSR $A035               ; $A621: 20 35 A0
    JSR $A044               ; $A624: 20 44 A0
    BCC $A63D               ; $A627: 90 14
    LDX #$08                ; $A629: A2 08
    JSR $A035               ; $A62B: 20 35 A0
    JMP $A63D               ; $A62E: 4C 3D A6
    BRK                     ; $A631: 00
    CLC                     ; $A632: 18
    .byte $EB            ; $A633
    BPL $A606               ; $A634: 10 D0
    AND (tmp0,X)            ; $A636: 21 00
    CLC                     ; $A638: 18
    .byte $EB            ; $A639
    JSR $05D0               ; $A63A: 20 D0 05
    LDX #$05                ; $A63D: A2 05
    JSR $A035               ; $A63F: 20 35 A0
    JSR $A044               ; $A642: 20 44 A0
    BCC $A657               ; $A645: 90 10
    BRK                     ; $A647: 00
    CLC                     ; $A648: 18
    .byte $EB            ; $A649
    RTI                     ; $A64A: 40
    BEQ $A652               ; $A64B: F0 05
    LDX #$09                ; $A64D: A2 09
    JMP $A654               ; $A64F: 4C 54 A6
    LDX #$0E                ; $A652: A2 0E
    JMP $A035               ; $A654: 4C 35 A0
    RTS                     ; $A657: 60
    JSR $A044               ; $A658: 20 44 A0
    BCC $A662               ; $A65B: 90 05
    LDX #$08                ; $A65D: A2 08
    JSR $A035               ; $A65F: 20 35 A0
    LDX #$05                ; $A662: A2 05
    LDA #$1A                ; $A664: A9 1A
    STA $6F66,X             ; $A666: 9D 66 6F
    STA $6FA6,X             ; $A669: 9D A6 6F
    LDA #$0C                ; $A66C: A9 0C
    STA $6F86,X             ; $A66E: 9D 86 6F
    STA $6FC6,X             ; $A671: 9D C6 6F
    LDA $7006,X             ; $A674: BD 06 70
    AND #$FC                ; $A677: 29 FC
    ORA #$02                ; $A679: 09 02
    STA $7006,X             ; $A67B: 9D 06 70
    LDX #$00                ; $A67E: A2 00
    JMP $A63F               ; $A680: 4C 3F A6
    LDA $62AA               ; $A683: AD AA 62
    LSR                     ; $A686: 4A
    BCC $A698               ; $A687: 90 0F
    LDX #$00                ; $A689: A2 00
    JSR $A035               ; $A68B: 20 35 A0
    LDX #$02                ; $A68E: A2 02
    JSR $A035               ; $A690: 20 35 A0
    LDX #$01                ; $A693: A2 01
    JMP $A035               ; $A695: 4C 35 A0
    LDX #$00                ; $A698: A2 00
    LDA $0530               ; $A69A: AD 30 05
    BMI $A6A6               ; $A69D: 30 07
    LDX #$02                ; $A69F: A2 02
    JSR $A035               ; $A6A1: 20 35 A0
    LDX #$01                ; $A6A4: A2 01
    JMP $A035               ; $A6A6: 4C 35 A0
    BRK                     ; $A6A9: 00
    CLC                     ; $A6AA: 18
    .byte $EB            ; $A6AB
    JSR $05F0               ; $A6AC: 20 F0 05
    LDX #$02                ; $A6AF: A2 02
    JMP $A035               ; $A6B1: 4C 35 A0
    RTS                     ; $A6B4: 60
    JSR $A044               ; $A6B5: 20 44 A0
    BCS $A6C9               ; $A6B8: B0 0F
    LDA $6292               ; $A6BA: AD 92 62
    BPL $A6C9               ; $A6BD: 10 0A
    LDX #$0D                ; $A6BF: A2 0D
    JSR $A035               ; $A6C1: 20 35 A0
    INX                     ; $A6C4: E8
    CPX #$11                ; $A6C5: E0 11
    BCC $A6C1               ; $A6C7: 90 F8
    RTS                     ; $A6C9: 60
    BRK                     ; $A6CA: 00
    ROL $EB                 ; $A6CB: 26 EB
    BPL $A69F               ; $A6CD: 10 D0
    PHP                     ; $A6CF: 08
    LDX #$02                ; $A6D0: A2 02
    JSR $A035               ; $A6D2: 20 35 A0
    JMP $A6DD               ; $A6D5: 4C DD A6
    LDX #$01                ; $A6D8: A2 01
    JSR $A035               ; $A6DA: 20 35 A0
    LDA $6294               ; $A6DD: AD 94 62
    BPL $A71E               ; $A6E0: 10 3C
    LDX #$00                ; $A6E2: A2 00
    JSR $A035               ; $A6E4: 20 35 A0
    BRK                     ; $A6E7: 00
    ASL $EB,X               ; $A6E8: 16 EB
    PHP                     ; $A6EA: 08
    BEQ $A70A               ; $A6EB: F0 1D
    LDX #$06                ; $A6ED: A2 06
    LDA $6FE6,X             ; $A6EF: BD E6 6F
    TAX                     ; $A6F2: AA
    LDA #$01                ; $A6F3: A9 01
    BRK                     ; $A6F5: 00
    ORA $A287               ; $A6F6: 0D 87 A2
    ASL $BD                 ; $A6F9: 06 BD
    ASL $70                 ; $A6FB: 06 70
    AND #$FC                ; $A6FD: 29 FC
    STA $7006,X             ; $A6FF: 9D 06 70
    LDA $70E6,X             ; $A702: BD E6 70
    ORA #$80                ; $A705: 09 80
    STA $70E6,X             ; $A707: 9D E6 70
    BRK                     ; $A70A: 00
    ORA $40EB,Y             ; $A70B: 19 EB 40
    BEQ $A728               ; $A70E: F0 18
    LDX #$06                ; $A710: A2 06
    JSR $A035               ; $A712: 20 35 A0
    JSR $A732               ; $A715: 20 32 A7
    BRK                     ; $A718: 00
    .byte $17            ; $A719
    .byte $EB            ; $A71A
    .byte $02            ; $A71B
    BEQ $A723               ; $A71C: F0 05
    LDX #$05                ; $A71E: A2 05
    JSR $A035               ; $A720: 20 35 A0
    LDX #$04                ; $A723: A2 04
    JSR $A035               ; $A725: 20 35 A0
    BRK                     ; $A728: 00
    .byte $17            ; $A729
    .byte $EB            ; $A72A
    BPL $A71D               ; $A72B: 10 F0
    .byte $03            ; $A72D
    JMP $A732               ; $A72E: 4C 32 A7
    RTS                     ; $A731: 60
    LDX #$03                ; $A732: A2 03
    JMP $A035               ; $A734: 4C 35 A0
    LDA $6BE8               ; $A737: AD E8 6B
    BPL $A742               ; $A73A: 10 06
    LDA $44                 ; $A73C: A5 44
    CMP #$10                ; $A73E: C9 10
    BCS $A751               ; $A740: B0 0F
    LDX #$05                ; $A742: A2 05
    JSR $A035               ; $A744: 20 35 A0
    LDX #$06                ; $A747: A2 06
    JSR $A035               ; $A749: 20 35 A0
    LDA $6BE8               ; $A74C: AD E8 6B
    BPL $A75D               ; $A74F: 10 0C
    BRK                     ; $A751: 00
    ROL $EB                 ; $A752: 26 EB
    .byte $04            ; $A754
    BNE $A75D               ; $A755: D0 06
    BRK                     ; $A757: 00
    ASL                     ; $A758: 0A
    .byte $EB            ; $A759
    ORA ($F0,X)             ; $A75A: 01 F0
    ASL $01A2,X             ; $A75C: 1E A2 01
    JSR $A035               ; $A75F: 20 35 A0
    LDX #$02                ; $A762: A2 02
    JSR $A035               ; $A764: 20 35 A0
    LDX #$03                ; $A767: A2 03
    JSR $A035               ; $A769: 20 35 A0
    LDX #$04                ; $A76C: A2 04
    JSR $A035               ; $A76E: 20 35 A0
    LDX #$07                ; $A771: A2 07
    JSR $A035               ; $A773: 20 35 A0
    LDX #$08                ; $A776: A2 08
    JSR $A035               ; $A778: 20 35 A0
    RTS                     ; $A77B: 60
    LDA $44                 ; $A77C: A5 44
    CMP #$12                ; $A77E: C9 12
    BCS $A78D               ; $A780: B0 0B
    LDA $6BE8               ; $A782: AD E8 6B
    BPL $A78D               ; $A785: 10 06
    BRK                     ; $A787: 00
    CLC                     ; $A788: 18
    .byte $EB            ; $A789
    .byte $80            ; $A78A
    BEQ $A797               ; $A78B: F0 0A
    LDX #$02                ; $A78D: A2 02
    JSR $A035               ; $A78F: 20 35 A0
    LDX #$01                ; $A792: A2 01
    JSR $A035               ; $A794: 20 35 A0
    RTS                     ; $A797: 60
    LDX #$00                ; $A798: A2 00
    BRK                     ; $A79A: 00
    CLC                     ; $A79B: 18
    .byte $EB            ; $A79C
    PHP                     ; $A79D: 08
    BEQ $A7BB               ; $A79E: F0 1B
    LDY #$01                ; $A7A0: A0 01
    LDA $6FE6,Y             ; $A7A2: B9 E6 6F
    STA $6FE6,X             ; $A7A5: 9D E6 6F
    LDA $7006,X             ; $A7A8: BD 06 70
    AND #$FC                ; $A7AB: 29 FC
    ORA #$01                ; $A7AD: 09 01
    STA $7006,X             ; $A7AF: 9D 06 70
    LDA $70E6,X             ; $A7B2: BD E6 70
    AND #$7F                ; $A7B5: 29 7F
    STA $70E6,X             ; $A7B7: 9D E6 70
    RTS                     ; $A7BA: 60
    BRK                     ; $A7BB: 00
    CLC                     ; $A7BC: 18
    .byte $EB            ; $A7BD
    BPL $A7B0               ; $A7BE: 10 F0
    .byte $03            ; $A7C0
    JSR $A035               ; $A7C1: 20 35 A0
    RTS                     ; $A7C4: 60
    BRK                     ; $A7C5: 00
    CLC                     ; $A7C6: 18
    .byte $EB            ; $A7C7
    ORA ($F0,X)             ; $A7C8: 01 F0
    ASL                     ; $A7CA: 0A
    LDX #$00                ; $A7CB: A2 00
    JSR $A035               ; $A7CD: 20 35 A0
    INX                     ; $A7D0: E8
    CPX #$04                ; $A7D1: E0 04
    BCC $A7CD               ; $A7D3: 90 F8
    RTS                     ; $A7D5: 60
    BRK                     ; $A7D6: 00
    .byte $07            ; $A7D7
    .byte $EB            ; $A7D8
    BPL $A7AB               ; $A7D9: 10 D0
    .byte $0B            ; $A7DB
    JSR $A044               ; $A7DC: 20 44 A0
    BCS $A7E6               ; $A7DF: B0 05
    LDX #$01                ; $A7E1: A2 01
    JMP $A035               ; $A7E3: 4C 35 A0
    RTS                     ; $A7E6: 60
    LDX #$00                ; $A7E7: A2 00
    JMP $A035               ; $A7E9: 4C 35 A0
    BRK                     ; $A7EC: 00
    .byte $07            ; $A7ED
    .byte $EB            ; $A7EE
    BPL $A7E1               ; $A7EF: 10 F0
    .byte $0F            ; $A7F1
    JSR $A044               ; $A7F2: 20 44 A0
    BCC $A801               ; $A7F5: 90 0A
    LDX #$09                ; $A7F7: A2 09
    JSR $A035               ; $A7F9: 20 35 A0
    LDX #$08                ; $A7FC: A2 08
    JMP $A035               ; $A7FE: 4C 35 A0
    RTS                     ; $A801: 60
    BRK                     ; $A802: 00
    .byte $07            ; $A803
    .byte $EB            ; $A804
    BPL $A7F7               ; $A805: 10 F0
    .byte $27            ; $A807
    BRK                     ; $A808: 00
    .byte $1A            ; $A809
    .byte $EB            ; $A80A
    ORA ($D0,X)             ; $A80B: 01 D0
    AND ($A2,X)             ; $A80D: 21 A2
    BRK                     ; $A80F: 00
    JSR $A035               ; $A810: 20 35 A0
    JSR $A044               ; $A813: 20 44 A0
    BCS $A82F               ; $A816: B0 17
    LDX #$09                ; $A818: A2 09
    LDA #$0C                ; $A81A: A9 0C
    STA $6F66,X             ; $A81C: 9D 66 6F
    STA $6FA6,X             ; $A81F: 9D A6 6F
    LDA #$10                ; $A822: A9 10
    STA $6F86,X             ; $A824: 9D 86 6F
    STA $6FC6,X             ; $A827: 9D C6 6F
    LDA #$00                ; $A82A: A9 00
    STA $7046,X             ; $A82C: 9D 46 70
    RTS                     ; $A82F: 60
    BRK                     ; $A830: 00
    .byte $07            ; $A831
    .byte $EB            ; $A832
    BPL $A825               ; $A833: 10 F0
    ORA $20,X               ; $A835: 15 20
    .byte $44            ; $A837
    LDY #$90                ; $A838: A0 90
    .byte $0F            ; $A83A
    LDX #$09                ; $A83B: A2 09
    JSR $A035               ; $A83D: 20 35 A0
    LDX #$06                ; $A840: A2 06
    LDA $70E6,X             ; $A842: BD E6 70
    AND #$7F                ; $A845: 29 7F
    STA $70E6,X             ; $A847: 9D E6 70
    RTS                     ; $A84A: 60
    LDX #$02                ; $A84B: A2 02
    JMP $A035               ; $A84D: 4C 35 A0
    BRK                     ; $A850: 00
    CLC                     ; $A851: 18
    .byte $EB            ; $A852
    .byte $04            ; $A853
    BEQ $A86A               ; $A854: F0 14
    LDX #$00                ; $A856: A2 00
    JSR $A035               ; $A858: 20 35 A0
    LDX #$01                ; $A85B: A2 01
    JSR $A035               ; $A85D: 20 35 A0
    LDX #$02                ; $A860: A2 02
    JSR $A035               ; $A862: 20 35 A0
    LDX #$03                ; $A865: A2 03
    JSR $A035               ; $A867: 20 35 A0
    RTS                     ; $A86A: 60
    BRK                     ; $A86B: 00
    .byte $07            ; $A86C
    .byte $EB            ; $A86D
    BPL $A840               ; $A86E: 10 D0
    ASL                     ; $A870: 0A
    JSR $A044               ; $A871: 20 44 A0
    BCS $A87B               ; $A874: B0 05
    LDX #$00                ; $A876: A2 00
    JSR $A035               ; $A878: 20 35 A0
    RTS                     ; $A87B: 60
    BRK                     ; $A87C: 00
    ROL $EB                 ; $A87D: 26 EB
    .byte $04            ; $A87F
    BNE $A888               ; $A880: D0 06
    BRK                     ; $A882: 00
    ASL                     ; $A883: 0A
    .byte $EB            ; $A884
    .byte $80            ; $A885
    BEQ $A88D               ; $A886: F0 05
    LDX #$00                ; $A888: A2 00
    JSR $A035               ; $A88A: 20 35 A0
    RTS                     ; $A88D: 60
    BRK                     ; $A88E: 00
    .byte $07            ; $A88F
    .byte $EB            ; $A890
    BPL $A883               ; $A891: 10 F0
    JSR $4420               ; $A893: 20 20 44
    LDY #$90                ; $A896: A0 90
    ORA $A2                 ; $A898: 05 A2
    .byte $04            ; $A89A
    JMP $A035               ; $A89B: 4C 35 A0
    BRK                     ; $A89E: 00
    ORA $01EB,Y             ; $A89F: 19 EB 01
    BEQ $A8B4               ; $A8A2: F0 10
    LDX #$03                ; $A8A4: A2 03
    LDA #$0D                ; $A8A6: A9 0D
    STA $6F66,X             ; $A8A8: 9D 66 6F
    STA $6FA6,X             ; $A8AB: 9D A6 6F
    STA $6F86,X             ; $A8AE: 9D 86 6F
    STA $6FC6,X             ; $A8B1: 9D C6 6F
    RTS                     ; $A8B4: 60
    BRK                     ; $A8B5: 00
    ORA $01EB,X             ; $A8B6: 1D EB 01
    BNE $A8C1               ; $A8B9: D0 06
    BRK                     ; $A8BB: 00
    ORA $02EB,Y             ; $A8BC: 19 EB 02
    BEQ $A8C6               ; $A8BF: F0 05
    LDX #$00                ; $A8C1: A2 00
    JSR $A035               ; $A8C3: 20 35 A0
    RTS                     ; $A8C6: 60
    BRK                     ; $A8C7: 00
    .byte $07            ; $A8C8
    .byte $EB            ; $A8C9
    BPL $A8BC               ; $A8CA: 10 F0
    .byte $27            ; $A8CC
    LDX #$01                ; $A8CD: A2 01
    JSR $A035               ; $A8CF: 20 35 A0
    LDX #$00                ; $A8D2: A2 00
    JSR $A035               ; $A8D4: 20 35 A0
    JSR $A044               ; $A8D7: 20 44 A0
    BCS $A8EF               ; $A8DA: B0 13
    LDX #$02                ; $A8DC: A2 02
    LDA #$21                ; $A8DE: A9 21
    STA $6F66,X             ; $A8E0: 9D 66 6F
    STA $6FA6,X             ; $A8E3: 9D A6 6F
    LDA #$1B                ; $A8E6: A9 1B
    STA $6F86,X             ; $A8E8: 9D 86 6F
    STA $6FC6,X             ; $A8EB: 9D C6 6F
    RTS                     ; $A8EE: 60
    LDX #$0C                ; $A8EF: A2 0C
    JMP $A8FB               ; $A8F1: 4C FB A8
    JSR $A044               ; $A8F4: 20 44 A0
    BCC $A8EE               ; $A8F7: 90 F5
    LDX #$02                ; $A8F9: A2 02
    JMP $A035               ; $A8FB: 4C 35 A0
    LDA $615A               ; $A8FE: AD 5A 61
    CMP #$04                ; $A901: C9 04
    BNE $A956               ; $A903: D0 51
    LDA $6292               ; $A905: AD 92 62
    AND #$1C                ; $A908: 29 1C
    CMP #$1C                ; $A90A: C9 1C
    BNE $A957               ; $A90C: D0 49
    BRK                     ; $A90E: 00
    ASL $EB,X               ; $A90F: 16 EB
    ORA ($F0,X)             ; $A911: 01 F0
    .byte $42            ; $A913
    JSR $A957               ; $A914: 20 57 A9
    LDX #$08                ; $A917: A2 08
    LDA #$14                ; $A919: A9 14
    STA $6F66,X             ; $A91B: 9D 66 6F
    STA $6FA6,X             ; $A91E: 9D A6 6F
    LDA #$0C                ; $A921: A9 0C
    STA $6F86,X             ; $A923: 9D 86 6F
    STA $6FC6,X             ; $A926: 9D C6 6F
    LDA #$11                ; $A929: A9 11
    STA $7046,X             ; $A92B: 9D 46 70
    JSR $AD1E               ; $A92E: 20 1E AD
    BRK                     ; $A931: 00
    ORA $01EB,Y             ; $A932: 19 EB 01
    BEQ $A94B               ; $A935: F0 14
    LDX #$08                ; $A937: A2 08
    JSR $A035               ; $A939: 20 35 A0
    LDX #$04                ; $A93C: A2 04
    JSR $A035               ; $A93E: 20 35 A0
    LDX #$05                ; $A941: A2 05
    JSR $A035               ; $A943: 20 35 A0
    LDX #$06                ; $A946: A2 06
    JSR $A035               ; $A948: 20 35 A0
    BRK                     ; $A94B: 00
    ASL $EB,X               ; $A94C: 16 EB
    .byte $04            ; $A94E
    BEQ $A956               ; $A94F: F0 05
    LDX #$09                ; $A951: A2 09
    JSR $A035               ; $A953: 20 35 A0
    RTS                     ; $A956: 60
    LDX #$03                ; $A957: A2 03
    JSR $A035               ; $A959: 20 35 A0
    LDX #$02                ; $A95C: A2 02
    JSR $A035               ; $A95E: 20 35 A0
    LDX #$01                ; $A961: A2 01
    JSR $A035               ; $A963: 20 35 A0
    RTS                     ; $A966: 60
    JSR $A044               ; $A967: 20 44 A0
    BCC $A979               ; $A96A: 90 0D
    LDX #$05                ; $A96C: A2 05
    BRK                     ; $A96E: 00
    .byte $07            ; $A96F
    .byte $EB            ; $A970
    BPL $A943               ; $A971: 10 D0
    .byte $02            ; $A973
    LDX #$06                ; $A974: A2 06
    JMP $A035               ; $A976: 4C 35 A0
    RTS                     ; $A979: 60
    BRK                     ; $A97A: 00
    .byte $07            ; $A97B
    .byte $EB            ; $A97C
    BPL $A96F               ; $A97D: 10 F0
    ASL                     ; $A97F: 0A
    JSR $A044               ; $A980: 20 44 A0
    BCS $A98A               ; $A983: B0 05
    LDX #$03                ; $A985: A2 03
    JSR $A035               ; $A987: 20 35 A0
    RTS                     ; $A98A: 60
    BRK                     ; $A98B: 00
    ORA $80EB,X             ; $A98C: 1D EB 80
    BEQ $A99B               ; $A98F: F0 0A
    LDX #$0B                ; $A991: A2 0B
    JSR $A035               ; $A993: 20 35 A0
    LDX #$0C                ; $A996: A2 0C
    JMP $A035               ; $A998: 4C 35 A0
    LDX #$01                ; $A99B: A2 01
    JMP $A035               ; $A99D: 4C 35 A0
    BRK                     ; $A9A0: 00
    ORA $40EB,X             ; $A9A1: 1D EB 40
    BNE $A9AB               ; $A9A4: D0 05
    LDX #$03                ; $A9A6: A2 03
    JSR $A035               ; $A9A8: 20 35 A0
    LDA $44                 ; $A9AB: A5 44
    CMP #$01                ; $A9AD: C9 01
    BNE $A9B6               ; $A9AF: D0 05
    LDA $0530               ; $A9B1: AD 30 05
    BMI $A9BB               ; $A9B4: 30 05
    LDX #$04                ; $A9B6: A2 04
    JSR $A035               ; $A9B8: 20 35 A0
    LDA $6299               ; $A9BB: AD 99 62
    BPL $A9D2               ; $A9BE: 10 12
    JSR $B78E               ; $A9C0: 20 8E B7
    TAY                     ; $A9C3: A8
    LDX #$05                ; $A9C4: A2 05
    LDA $6FE6,X             ; $A9C6: BD E6 6F
    TAX                     ; $A9C9: AA
    TYA                     ; $A9CA: 98
    BRK                     ; $A9CB: 00
    ORA $0087               ; $A9CC: 0D 87 00
    ASL                     ; $A9CF: 0A
    .byte $6F            ; $A9D0
    RTS                     ; $A9D1: 60
    LDX #$05                ; $A9D2: A2 05
    JSR $A035               ; $A9D4: 20 35 A0
    RTS                     ; $A9D7: 60
    BRK                     ; $A9D8: 00
    ASL $EB,X               ; $A9D9: 16 EB
    BPL $A9AD               ; $A9DB: 10 D0
    .byte $0F            ; $A9DD
    LDX #$02                ; $A9DE: A2 02
    JSR $A035               ; $A9E0: 20 35 A0
    JSR $A044               ; $A9E3: 20 44 A0
    BCS $A9ED               ; $A9E6: B0 05
    LDX #$00                ; $A9E8: A2 00
    JSR $A035               ; $A9EA: 20 35 A0
    BRK                     ; $A9ED: 00
    ORA $01EB,X             ; $A9EE: 1D EB 01
    BEQ $A9FD               ; $A9F1: F0 0A
    LDX #$01                ; $A9F3: A2 01
    JSR $A035               ; $A9F5: 20 35 A0
    LDX #$00                ; $A9F8: A2 00
    JSR $A035               ; $A9FA: 20 35 A0
    RTS                     ; $A9FD: 60
    BRK                     ; $A9FE: 00
    ORA $09EB,X             ; $A9FF: 1D EB 09
    BEQ $A9FD               ; $AA02: F0 F9
    LDX #$01                ; $AA04: A2 01
    JSR $A035               ; $AA06: 20 35 A0
    BRK                     ; $AA09: 00
    ORA $01EB,X             ; $AA0A: 1D EB 01
    BEQ $A9FD               ; $AA0D: F0 EE
    LDX #$00                ; $AA0F: A2 00
    JMP $A035               ; $AA11: 4C 35 A0
    BRK                     ; $AA14: 00
    ORA $01EB,X             ; $AA15: 1D EB 01
    BEQ $AA2B               ; $AA18: F0 11
    LDX #$00                ; $AA1A: A2 00
    LDA $7006,X             ; $AA1C: BD 06 70
    AND #$FC                ; $AA1F: 29 FC
    ORA #$01                ; $AA21: 09 01
    STA $7006,X             ; $AA23: 9D 06 70
    LDA #$00                ; $AA26: A9 00
    STA $7046,X             ; $AA28: 9D 46 70
    BRK                     ; $AA2B: 00
    ORA $04EB,X             ; $AA2C: 1D EB 04
    BEQ $AA40               ; $AA2F: F0 0F
    LDX #$01                ; $AA31: A2 01
    JSR $A035               ; $AA33: 20 35 A0
    LDX #$02                ; $AA36: A2 02
    JSR $A035               ; $AA38: 20 35 A0
    LDX #$03                ; $AA3B: A2 03
    JSR $A035               ; $AA3D: 20 35 A0
    RTS                     ; $AA40: 60
    BRK                     ; $AA41: 00
    ORA $01EB,X             ; $AA42: 1D EB 01
    BEQ $AA4C               ; $AA45: F0 05
    LDX #$00                ; $AA47: A2 00
    JSR $A035               ; $AA49: 20 35 A0
    RTS                     ; $AA4C: 60
    LDX #$00                ; $AA4D: A2 00
    LDA $6298               ; $AA4F: AD 98 62
    BPL $AA74               ; $AA52: 10 20
    AND #$40                ; $AA54: 29 40
    BEQ $AA77               ; $AA56: F0 1F
    BRK                     ; $AA58: 00
    ASL $08EB               ; $AA59: 0E EB 08
    BEQ $AA74               ; $AA5C: F0 16
    JSR $A035               ; $AA5E: 20 35 A0
    LDX #$02                ; $AA61: A2 02
    LDA #$05                ; $AA63: A9 05
    LDY #$07                ; $AA65: A0 07
    JSR $A04A               ; $AA67: 20 4A A0
    LDX #$01                ; $AA6A: A2 01
    LDA #$30                ; $AA6C: A9 30
    LDY #$30                ; $AA6E: A0 30
    JSR $A04A               ; $AA70: 20 4A A0
    RTS                     ; $AA73: 60
    JSR $A035               ; $AA74: 20 35 A0
    LDX #$02                ; $AA77: A2 02
    JSR $A035               ; $AA79: 20 35 A0
    LDX #$01                ; $AA7C: A2 01
    JSR $A035               ; $AA7E: 20 35 A0
    RTS                     ; $AA81: 60
    BRK                     ; $AA82: 00
    .byte $1A            ; $AA83
    .byte $EB            ; $AA84
    ORA ($F0,X)             ; $AA85: 01 F0
    ROL $A2                 ; $AA87: 26 A2
    ORA ($20,X)             ; $AA89: 01 20
    AND $A0,X               ; $AA8B: 35 A0
    LDX #$02                ; $AA8D: A2 02
    JSR $A035               ; $AA8F: 20 35 A0
    INX                     ; $AA92: E8
    CPX #$08                ; $AA93: E0 08
    BCC $AA8F               ; $AA95: 90 F8
    LDX #$00                ; $AA97: A2 00
    LDA #$00                ; $AA99: A9 00
    STA $7046,X             ; $AA9B: 9D 46 70
    LDA $7006,X             ; $AA9E: BD 06 70
    ORA #$03                ; $AAA1: 09 03
    STA $7006,X             ; $AAA3: 9D 06 70
    LDA #$0B                ; $AAA6: A9 0B
    LDY #$15                ; $AAA8: A0 15
    JSR $A04A               ; $AAAA: 20 4A A0
    RTS                     ; $AAAD: 60
    LDX #$08                ; $AAAE: A2 08
    JSR $A035               ; $AAB0: 20 35 A0
    LDX #$09                ; $AAB3: A2 09
    JSR $A035               ; $AAB5: 20 35 A0
    LDX #$0A                ; $AAB8: A2 0A
    JSR $A035               ; $AABA: 20 35 A0
    RTS                     ; $AABD: 60
    BRK                     ; $AABE: 00
    JSR $20EB               ; $AABF: 20 EB 20
    BEQ $AABD               ; $AAC2: F0 F9
    LDX #$00                ; $AAC4: A2 00
    JMP $A035               ; $AAC6: 4C 35 A0
    BRK                     ; $AAC9: 00
    ROL $EB                 ; $AACA: 26 EB
    JSR $17D0               ; $AACC: 20 D0 17
    BRK                     ; $AACF: 00
    JSR $02EB               ; $AAD0: 20 EB 02
    BNE $AADA               ; $AAD3: D0 05
    LDX #$02                ; $AAD5: A2 02
    JMP $A035               ; $AAD7: 4C 35 A0
    BRK                     ; $AADA: 00
    JSR $08EB               ; $AADB: 20 EB 08
    BEQ $AAE5               ; $AADE: F0 05
    LDX #$00                ; $AAE0: A2 00
    JSR $A035               ; $AAE2: 20 35 A0
    RTS                     ; $AAE5: 60
    LDX #$02                ; $AAE6: A2 02
    LDA #$07                ; $AAE8: A9 07
    LDY #$08                ; $AAEA: A0 08
    JSR $A04A               ; $AAEC: 20 4A A0
    LDX #$01                ; $AAEF: A2 01
    LDA #$04                ; $AAF1: A9 04
    LDY #$0C                ; $AAF3: A0 0C
    JSR $A04A               ; $AAF5: 20 4A A0
    LDA $7006,X             ; $AAF8: BD 06 70
    AND #$FC                ; $AAFB: 29 FC
    STA $7006,X             ; $AAFD: 9D 06 70
    RTS                     ; $AB00: 60
    JSR $A044               ; $AB01: 20 44 A0
    BCS $AB15               ; $AB04: B0 0F
    BRK                     ; $AB06: 00
    ASL                     ; $AB07: 0A
    .byte $EB            ; $AB08
    BPL $AAFB               ; $AB09: 10 F0
    ORA #$A2                ; $AB0B: 09 A2
    ORA $A9                 ; $AB0D: 05 A9
    ORA $A0,X               ; $AB0F: 15 A0
    ORA ($20),Y             ; $AB11: 11 20
    LSR                     ; $AB13: 4A
    LDY #$60                ; $AB14: A0 60
    LDA $45                 ; $AB16: A5 45
    CMP #$09                ; $AB18: C9 09
    BNE $AB36               ; $AB1A: D0 1A
    LDX #$00                ; $AB1C: A2 00
    LDA #$81                ; $AB1E: A9 81
    STA $70E6,X             ; $AB20: 9D E6 70
    LDA #$05                ; $AB23: A9 05
    STA $6F66,X             ; $AB25: 9D 66 6F
    STA $6FA6,X             ; $AB28: 9D A6 6F
    LDA #$0D                ; $AB2B: A9 0D
    STA $6F86,X             ; $AB2D: 9D 86 6F
    STA $6FC6,X             ; $AB30: 9D C6 6F
    JSR $AD1E               ; $AB33: 20 1E AD
    RTS                     ; $AB36: 60
    LDA $6289               ; $AB37: AD 89 62
    BPL $AB36               ; $AB3A: 10 FA
    LDX #$01                ; $AB3C: A2 01
    LDA #$10                ; $AB3E: A9 10
    LDY #$1A                ; $AB40: A0 1A
    JSR $A04A               ; $AB42: 20 4A A0
    LDA $7006,X             ; $AB45: BD 06 70
    ORA #$02                ; $AB48: 09 02
    STA $7006,X             ; $AB4A: 9D 06 70
    LDX #$00                ; $AB4D: A2 00
    JMP $A035               ; $AB4F: 4C 35 A0
    LDA $44                 ; $AB52: A5 44
    CMP #$03                ; $AB54: C9 03
    BNE $AB62               ; $AB56: D0 0A
    LDX #$00                ; $AB58: A2 00
    LDA #$02                ; $AB5A: A9 02
    STA $6F86,X             ; $AB5C: 9D 86 6F
    STA $6FC6,X             ; $AB5F: 9D C6 6F
    RTS                     ; $AB62: 60
    BRK                     ; $AB63: 00
    ASL                     ; $AB64: 0A
    .byte $EB            ; $AB65
    .byte $04            ; $AB66
    BNE $AB9A               ; $AB67: D0 31
    LDA $45                 ; $AB69: A5 45
    CMP #$0B                ; $AB6B: C9 0B
    BNE $AB99               ; $AB6D: D0 2A
    LDX #$01                ; $AB6F: A2 01
    LDA #$11                ; $AB71: A9 11
    STA $7046,X             ; $AB73: 9D 46 70
    LDA #$0A                ; $AB76: A9 0A
    STA $6F86,X             ; $AB78: 9D 86 6F
    STA $6FC6,X             ; $AB7B: 9D C6 6F
    LDX #$00                ; $AB7E: A2 00
    LDA #$11                ; $AB80: A9 11
    STA $7046,X             ; $AB82: 9D 46 70
    LDA #$0B                ; $AB85: A9 0B
    STA $6F86,X             ; $AB87: 9D 86 6F
    STA $6FC6,X             ; $AB8A: 9D C6 6F
    LDX #$02                ; $AB8D: A2 02
    LDA #$21                ; $AB8F: A9 21
    STA $7046,X             ; $AB91: 9D 46 70
    LDA #$00                ; $AB94: A9 00
    STA $6F40               ; $AB96: 8D 40 6F
    RTS                     ; $AB99: 60
    LDX #$01                ; $AB9A: A2 01
    LDA #$0B                ; $AB9C: A9 0B
    LDY #$19                ; $AB9E: A0 19
    JSR $A04A               ; $ABA0: 20 4A A0
    LDX #$00                ; $ABA3: A2 00
    LDA #$0B                ; $ABA5: A9 0B
    LDY #$1A                ; $ABA7: A0 1A
    JMP $A04A               ; $ABA9: 4C 4A A0
    BRK                     ; $ABAC: 00
    ROL $EB                 ; $ABAD: 26 EB
    JSR $0AD0               ; $ABAF: 20 D0 0A
    LDX #$04                ; $ABB2: A2 04
    JSR $A035               ; $ABB4: 20 35 A0
    LDX #$03                ; $ABB7: A2 03
    JMP $A035               ; $ABB9: 4C 35 A0
    LDX #$00                ; $ABBC: A2 00
    JSR $A035               ; $ABBE: 20 35 A0
    LDX #$01                ; $ABC1: A2 01
    JMP $A035               ; $ABC3: 4C 35 A0
    LDX #$00                ; $ABC6: A2 00
    LDA $70E6,X             ; $ABC8: BD E6 70
    ORA #$01                ; $ABCB: 09 01
    STA $70E6,X             ; $ABCD: 9D E6 70
    LDA $44                 ; $ABD0: A5 44
    CMP #$1D                ; $ABD2: C9 1D
    BNE $ABDD               ; $ABD4: D0 07
    LDA #$1B                ; $ABD6: A9 1B
    LDY #$0F                ; $ABD8: A0 0F
    JSR $A04A               ; $ABDA: 20 4A A0
    RTS                     ; $ABDD: 60
    BRK                     ; $ABDE: 00
    ORA $01EB               ; $ABDF: 0D EB 01
    BEQ $ABDD               ; $ABE2: F0 F9
    LDX #$01                ; $ABE4: A2 01
    LDA $7006,X             ; $ABE6: BD 06 70
    AND #$FC                ; $ABE9: 29 FC
    STA $7006,X             ; $ABEB: 9D 06 70
    LDA #$11                ; $ABEE: A9 11
    LDY #$14                ; $ABF0: A0 14
    JMP $A04A               ; $ABF2: 4C 4A A0
    .byte $0F            ; $ABF5
    BRK                     ; $ABF6: 00
    .byte $3A            ; $ABF7
    BRK                     ; $ABF8: 00
    EOR (tmp0,X)            ; $ABF9: 41 00
    ORA (tmp2,X)            ; $ABFB: 01 02
    ORA (tmp0,X)            ; $ABFD: 01 00
    ORA (tmp1,X)            ; $ABFF: 01 01
    .byte $02            ; $AC01
    ORA ($12,X)             ; $AC02: 01 12
    .byte $02            ; $AC04
    .byte $02            ; $AC05
    BRK                     ; $AC06: 00
    ASL tmp1,X              ; $AC07: 16 01
    .byte $33            ; $AC09
    .byte $03            ; $AC0A
    .byte $02            ; $AC0B
    .byte $03            ; $AC0C
    EOR (ptr0_lo,X)         ; $AC0D: 41 04
    ASL tmp0,X              ; $AC0F: 16 00
    ASL tmp2,X              ; $AC11: 16 02
    .byte $12            ; $AC13
    BRK                     ; $AC14: 00
    .byte $0F            ; $AC15
    ORA (ptr0_lo,X)         ; $AC16: 01 04
    .byte $07            ; $AC18
    .byte $3F            ; $AC19
    BRK                     ; $AC1A: 00
    .byte $04            ; $AC1B
    BRK                     ; $AC1C: 00
    ORA tmp3,X              ; $AC1D: 15 03
    BRK                     ; $AC1F: 00
    BRK                     ; $AC20: 00
    ORA tmp0                ; $AC21: 05 00
    AND (tmp3),Y            ; $AC23: 31 03
    ORA tmp1                ; $AC25: 05 01
    .byte $04            ; $AC27
    PHP                     ; $AC28: 08
    .byte $04            ; $AC29
    .byte $0B            ; $AC2A
    CLC                     ; $AC2B: 18
    ORA ($38,X)             ; $AC2C: 01 38
    BRK                     ; $AC2E: 00
    SEC                     ; $AC2F: 38
    .byte $04            ; $AC30
    .byte $04            ; $AC31
    ORA ($3A,X)             ; $AC32: 01 3A
    ORA ($21,X)             ; $AC34: 01 21
    BRK                     ; $AC36: 00
    .byte $14            ; $AC37
    BRK                     ; $AC38: 00
    .byte $43            ; $AC39
    ASL $14                 ; $AC3A: 06 14
    ORA ($42,X)             ; $AC3C: 01 42
    .byte $04            ; $AC3E
    ASL tmp0                ; $AC3F: 06 00
    ORA $3701               ; $AC41: 0D 01 37
    .byte $02            ; $AC44
    .byte $37            ; $AC45
    ORA ($42,X)             ; $AC46: 01 42
    .byte $02            ; $AC48
    .byte $2F            ; $AC49
    ORA (ptr_hi,X)          ; $AC4A: 01 11
    BRK                     ; $AC4C: 00
    ORA (tmp1),Y            ; $AC4D: 11 01
    ASL                     ; $AC4F: 0A
    BRK                     ; $AC50: 00
    .byte $17            ; $AC51
    BRK                     ; $AC52: 00
    .byte $42            ; $AC53
    BRK                     ; $AC54: 00
    .byte $17            ; $AC55
    ORA ($37,X)             ; $AC56: 01 37
    BRK                     ; $AC58: 00
    BRK                     ; $AC59: 00
    .byte $02            ; $AC5A
    ORA $1500,X             ; $AC5B: 1D 00 15
    BRK                     ; $AC5E: 00
    BRK                     ; $AC5F: 00
    ORA ($15,X)             ; $AC60: 01 15
    ORA (tmp2,X)            ; $AC62: 01 02
    .byte $02            ; $AC64
    PHP                     ; $AC65: 08
    ORA ($08,X)             ; $AC66: 01 08
    .byte $03            ; $AC68
    .byte $1B            ; $AC69
    BRK                     ; $AC6A: 00
    .byte $1B            ; $AC6B
    .byte $03            ; $AC6C
    AND $2D06               ; $AC6D: 2D 06 2D
    ORA $30                 ; $AC70: 05 30
    BRK                     ; $AC72: 00
    .byte $03            ; $AC73
    ORA ($40,X)             ; $AC74: 01 40
    BRK                     ; $AC76: 00
    LSR tmp1                ; $AC77: 46 01
    BPL $AC7B               ; $AC79: 10 00
    ORA #$06                ; $AC7B: 09 06
    .byte $0B            ; $AC7D
    BRK                     ; $AC7E: 00
    BPL $AC83               ; $AC7F: 10 02
    BIT $4600               ; $AC81: 2C 00 46
    BRK                     ; $AC84: 00
    AND tmp2,X              ; $AC85: 35 02
    ORA (tmp3),Y            ; $AC87: 11 03
    .byte $FF            ; $AC89
    CLI                     ; $AC8A: 58
    LDY #$D6                ; $AC8B: A0 D6
    LDY #$E6                ; $AC8D: A0 E6
    LDY #$F7                ; $AC8F: A0 F7
    LDY #$0B                ; $AC91: A0 0B
    LDA ($49,X)             ; $AC93: A1 49
    LDA ($71,X)             ; $AC95: A1 71
    LDA ($AE,X)             ; $AC97: A1 AE
    LDA ($CC,X)             ; $AC99: A1 CC
    LDA ($ED,X)             ; $AC9B: A1 ED
    LDA ($27,X)             ; $AC9D: A1 27
    LDX #$4F                ; $AC9F: A2 4F
    LDX #$66                ; $ACA1: A2 66
    LDX #$9A                ; $ACA3: A2 9A
    LDX #$26                ; $ACA5: A2 26
    .byte $A3            ; $ACA7
    AND $6EA3,X             ; $ACA8: 3D A3 6E
    .byte $A3            ; $ACAB
    .byte $80            ; $ACAC
    .byte $A3            ; $ACAD
    TAY                     ; $ACAE: A8
    .byte $A3            ; $ACAF
    LDA $0FA3,Y             ; $ACB0: B9 A3 0F
    LDY $54                 ; $ACB3: A4 54
    LDY $89                 ; $ACB5: A4 89
    LDY $A0                 ; $ACB7: A4 A0
    LDY $AC                 ; $ACB9: A4 AC
    LDY $E2                 ; $ACBB: A4 E2
    LDY $1E                 ; $ACBD: A4 1E
    LDA $49                 ; $ACBF: A5 49
    LDA $5B                 ; $ACC1: A5 5B
    LDA $68                 ; $ACC3: A5 68
    LDA $7F                 ; $ACC5: A5 7F
    LDA $A0                 ; $ACC7: A5 A0
    LDA $B2                 ; $ACC9: A5 B2
    LDA $CF                 ; $ACCB: A5 CF
    LDA $F6                 ; $ACCD: A5 F6
    LDA $83                 ; $ACCF: A5 83
    LDX $A9                 ; $ACD1: A6 A9
    LDX $B5                 ; $ACD3: A6 B5
    LDX $CA                 ; $ACD5: A6 CA
    LDX $37                 ; $ACD7: A6 37
    .byte $A7            ; $ACD9
    .byte $7C            ; $ACDA
    .byte $A7            ; $ACDB
    TYA                     ; $ACDC: 98
    .byte $A7            ; $ACDD
    CMP $A7                 ; $ACDE: C5 A7
    DEC $A7,X               ; $ACE0: D6 A7
    CPX $02A7               ; $ACE2: EC A7 02
    TAY                     ; $ACE5: A8
    BMI $AC90               ; $ACE6: 30 A8
    BVC $AC92               ; $ACE8: 50 A8
    .byte $6B            ; $ACEA
    TAY                     ; $ACEB: A8
    .byte $7C            ; $ACEC
    TAY                     ; $ACED: A8
    STX $B5A8               ; $ACEE: 8E A8 B5
    TAY                     ; $ACF1: A8
    .byte $C7            ; $ACF2
    TAY                     ; $ACF3: A8
    INC $67A8,X             ; $ACF4: FE A8 67
    LDA #$7A                ; $ACF7: A9 7A
    LDA #$8B                ; $ACF9: A9 8B
    LDA #$A0                ; $ACFB: A9 A0
    LDA #$D8                ; $ACFD: A9 D8
    LDA #$FE                ; $ACFF: A9 FE
    LDA #$14                ; $AD01: A9 14
    TAX                     ; $AD03: AA
    EOR ($AA,X)             ; $AD04: 41 AA
    EOR $82AA               ; $AD06: 4D AA 82
    TAX                     ; $AD09: AA
    LDX $C9AA,Y             ; $AD0A: BE AA C9
    TAX                     ; $AD0D: AA
    ORA ($AB,X)             ; $AD0E: 01 AB
    ASL $AB,X               ; $AD10: 16 AB
    .byte $37            ; $AD12
    .byte $AB            ; $AD13
    .byte $52            ; $AD14
    .byte $AB            ; $AD15
    .byte $63            ; $AD16
    .byte $AB            ; $AD17
    LDY $C6AB               ; $AD18: AC AB C6
    .byte $AB            ; $AD1B
    DEC $8AAB,X             ; $AD1C: DE AB 8A
    PHA                     ; $AD1F: 48
    LDY $6F86,X             ; $AD20: BC 86 6F
    LDA $6F66,X             ; $AD23: BD 66 6F
    TAX                     ; $AD26: AA
    JSR $D3E6               ; $AD27: 20 E6 D3
    TAY                     ; $AD2A: A8
    PLA                     ; $AD2B: 68
    TAX                     ; $AD2C: AA
    TYA                     ; $AD2D: 98
    STA $7146,X             ; $AD2E: 9D 46 71
    RTS                     ; $AD31: 60
    LDY #$00                ; $AD32: A0 00
    LDA $AD5A,Y             ; $AD34: B9 5A AD
    BMI $AD59               ; $AD37: 30 20
    CMP $63                 ; $AD39: C5 63
    BNE $AD52               ; $AD3B: D0 15
    LDA $AD5B,Y             ; $AD3D: B9 5B AD
    CMP $64                 ; $AD40: C5 64
    BNE $AD52               ; $AD42: D0 0E
    LDA $AD5C,Y             ; $AD44: B9 5C AD
    CMP $615A               ; $AD47: CD 5A 61
    BEQ $AD52               ; $AD4A: F0 06
    LDX $AD5D,Y             ; $AD4C: BE 5D AD
    JSR $A035               ; $AD4F: 20 35 A0
    INY                     ; $AD52: C8
    INY                     ; $AD53: C8
    INY                     ; $AD54: C8
    INY                     ; $AD55: C8
    JMP $AD34               ; $AD56: 4C 34 AD
    RTS                     ; $AD59: 60
    .byte $1F            ; $AD5A
    BRK                     ; $AD5B: 00
    ORA (tmp2,X)            ; $AD5C: 01 02
    .byte $FF            ; $AD5E
    ASL                     ; $AD5F: 0A
    TAX                     ; $AD60: AA
    LDA $BF4B,X             ; $AD61: BD 4B BF
    STA tmp0                ; $AD64: 85 00
    LDA $BF4C,X             ; $AD66: BD 4C BF
    STA tmp1                ; $AD69: 85 01
    JMP ($0000)             ; $AD6B: 6C 00 00
    LDA #$05                ; $AD6E: A9 05
    BRK                     ; $AD70: 00
    ORA ($8F,X)             ; $AD71: 01 8F
    LDX #$00                ; $AD73: A2 00
    LDA #$04                ; $AD75: A9 04
    BRK                     ; $AD77: 00
    .byte $12            ; $AD78
    .byte $2F            ; $AD79
    BRK                     ; $AD7A: 00
    PHP                     ; $AD7B: 08
    .byte $CB            ; $AD7C
    .byte $80            ; $AD7D
    LDX #$02                ; $AD7E: A2 02
    JSR $BF33               ; $AD80: 20 33 BF
    LDX #$01                ; $AD83: A2 01
    JSR $BF33               ; $AD85: 20 33 BF
    LDX #$06                ; $AD88: A2 06
    LDA #$17                ; $AD8A: A9 17
    LDY #$11                ; $AD8C: A0 11
    JSR $BF25               ; $AD8E: 20 25 BF
    LDX #$07                ; $AD91: A2 07
    LDY #$0C                ; $AD93: A0 0C
    BIT $6281               ; $AD95: 2C 81 62
    BVS $AD9D               ; $AD98: 70 03
    LDX #$08                ; $AD9A: A2 08
    INY                     ; $AD9C: C8
    LDA #$0F                ; $AD9D: A9 0F
    JSR $BF25               ; $AD9F: 20 25 BF
    BRK                     ; $ADA2: 00
    PHP                     ; $ADA3: 08
    .byte $DF            ; $ADA4
    BRK                     ; $ADA5: 00
    ORA $EF,X               ; $ADA6: 15 EF
    JSR $BF46               ; $ADA8: 20 46 BF
    BRK                     ; $ADAB: 00
    JSR $A23B               ; $ADAC: 20 3B A2
    BRK                     ; $ADAF: 00
    JSR $BF37               ; $ADB0: 20 37 BF
    LDX #$03                ; $ADB3: A2 03
    JSR $BF37               ; $ADB5: 20 37 BF
    JSR $DFF1               ; $ADB8: 20 F1 DF
    JSR $D218               ; $ADBB: 20 18 D2
    LDA #$8F                ; $ADBE: A9 8F
    LDX #$04                ; $ADC0: A2 04
    JSR $BF16               ; $ADC2: 20 16 BF
    BRK                     ; $ADC5: 00
    ORA $80CB               ; $ADC6: 0D CB 80
    RTS                     ; $ADC9: 60
    LDX #$02                ; $ADCA: A2 02
    LDA #$11                ; $ADCC: A9 11
    STA $7046,X             ; $ADCE: 9D 46 70
    LDX #$03                ; $ADD1: A2 03
    STA $7046,X             ; $ADD3: 9D 46 70
    LDX #$04                ; $ADD6: A2 04
    STA $7046,X             ; $ADD8: 9D 46 70
    LDA $70E6,X             ; $ADDB: BD E6 70
    ORA #$01                ; $ADDE: 09 01
    STA $70E6,X             ; $ADE0: 9D E6 70
    LDA $6280               ; $ADE3: AD 80 62
    ORA #$40                ; $ADE6: 09 40
    STA $6280               ; $ADE8: 8D 80 62
    LDA #$85                ; $ADEB: A9 85
    JMP $BF14               ; $ADED: 4C 14 BF
    LDA #$0C                ; $ADF0: A9 0C
    STA $29                 ; $ADF2: 85 29
    BRK                     ; $ADF4: 00
    .byte $04            ; $ADF5
    .byte $9F            ; $ADF6
    LDX #$B4                ; $ADF7: A2 B4
    JSR $C90C               ; $ADF9: 20 0C C9
    BRK                     ; $ADFC: 00
    .byte $02            ; $ADFD
    .byte $9F            ; $ADFE
    LDX #$03                ; $ADFF: A2 03
    LDA #$40                ; $AE01: A9 40
    JSR $BED3               ; $AE03: 20 D3 BE
    LDY #$03                ; $AE06: A0 03
    LDX $6FE6,Y             ; $AE08: BE E6 6F
    LDY #$02                ; $AE0B: A0 02
    TXA                     ; $AE0D: 8A
    STA $6FE6,Y             ; $AE0E: 99 E6 6F
    LDA #$24                ; $AE11: A9 24
    JSR $BED3               ; $AE13: 20 D3 BE
    LDX #$03                ; $AE16: A2 03
    LDY $44                 ; $AE18: A4 44
    DEY                     ; $AE1A: 88
    LDA #$01                ; $AE1B: A9 01
    JSR $AEDF               ; $AE1D: 20 DF AE
    LDX #$02                ; $AE20: A2 02
    LDY $44                 ; $AE22: A4 44
    INY                     ; $AE24: C8
    LDA #$03                ; $AE25: A9 03
    JSR $AEDF               ; $AE27: 20 DF AE
    LDY $45                 ; $AE2A: A4 45
    DEY                     ; $AE2C: 88
    STY $6F83               ; $AE2D: 8C 83 6F
    STY $6FC3               ; $AE30: 8C C3 6F
    LDA #$02                ; $AE33: A9 02
    STA $7003               ; $AE35: 8D 03 70
    LDA #$00                ; $AE38: A9 00
    STA $7023               ; $AE3A: 8D 23 70
    BRK                     ; $AE3D: 00
    ASL                     ; $AE3E: 0A
    .byte $6F            ; $AE3F
    JSR $BED6               ; $AE40: 20 D6 BE
    BRK                     ; $AE43: 00
    ORA $DB                 ; $AE44: 05 DB
    .byte $BF            ; $AE46
    BRK                     ; $AE47: 00
    ASL $DB                 ; $AE48: 06 DB
    .byte $F7            ; $AE4A
    LDA #$02                ; $AE4B: A9 02
    BRK                     ; $AE4D: 00
    ORA ($8F,X)             ; $AE4E: 01 8F
    LDA #$02                ; $AE50: A9 02
    STA $7000               ; $AE52: 8D 00 70
    STA $7001               ; $AE55: 8D 01 70
    STA $7002               ; $AE58: 8D 02 70
    LDA $45                 ; $AE5B: A5 45
    STA $6F81               ; $AE5D: 8D 81 6F
    STA $6F82               ; $AE60: 8D 82 6F
    LDX $44                 ; $AE63: A6 44
    DEX                     ; $AE65: CA
    STX $6F61               ; $AE66: 8E 61 6F
    INX                     ; $AE69: E8
    INX                     ; $AE6A: E8
    STX $6F62               ; $AE6B: 8E 62 6F
    LDX #$02                ; $AE6E: A2 02
    DEC $6F86,X             ; $AE70: DE 86 6F
    DEC $6FC6,X             ; $AE73: DE C6 6F
    LDA #$01                ; $AE76: A9 01
    STA $7006,X             ; $AE78: 9D 06 70
    LDX #$03                ; $AE7B: A2 03
    DEC $6F86,X             ; $AE7D: DE 86 6F
    DEC $6FC6,X             ; $AE80: DE C6 6F
    LDA #$03                ; $AE83: A9 03
    STA $7006,X             ; $AE85: 9D 06 70
    LDA #$02                ; $AE88: A9 02
    STA $7003               ; $AE8A: 8D 03 70
    BRK                     ; $AE8D: 00
    .byte $1F            ; $AE8E
    .byte $EF            ; $AE8F
    LDX #$03                ; $AE90: A2 03
    LDA #$C0                ; $AE92: A9 C0
    BRK                     ; $AE94: 00
    .byte $0B            ; $AE95
    .byte $87            ; $AE96
    LDY #$03                ; $AE97: A0 03
    LDX #$04                ; $AE99: A2 04
    TXA                     ; $AE9B: 8A
    STA $6FE6,Y             ; $AE9C: 99 E6 6F
    LDA #$A4                ; $AE9F: A9 A4
    BRK                     ; $AEA1: 00
    .byte $0B            ; $AEA2
    .byte $87            ; $AEA3
    LDX #$02                ; $AEA4: A2 02
    LDA #$04                ; $AEA6: A9 04
    STA $6FE6,X             ; $AEA8: 9D E6 6F
    LDA #$00                ; $AEAB: A9 00
    STA $7023               ; $AEAD: 8D 23 70
    BRK                     ; $AEB0: 00
    .byte $03            ; $AEB1
    .byte $EF            ; $AEB2
    JSR $C5BF               ; $AEB3: 20 BF C5
    LDA $627F               ; $AEB6: AD 7F 62
    ORA #$80                ; $AEB9: 09 80
    STA $627F               ; $AEBB: 8D 7F 62
    JSR $BF46               ; $AEBE: 20 46 BF
    LDX #$03                ; $AEC1: A2 03
    LDA #$4D                ; $AEC3: A9 4D
    BRK                     ; $AEC5: 00
    .byte $04            ; $AEC6
    .byte $6F            ; $AEC7
    JSR $D214               ; $AEC8: 20 14 D2
    LDA #$00                ; $AECB: A9 00
    STA $62ED               ; $AECD: 8D ED 62
    LDA #$47                ; $AED0: A9 47
    STA $42                 ; $AED2: 85 42
    LDA #$39                ; $AED4: A9 39
    STA $43                 ; $AED6: 85 43
    JSR $C5C5               ; $AED8: 20 C5 C5
    BRK                     ; $AEDB: 00
    .byte $32            ; $AEDC
    .byte $EF            ; $AEDD
    RTS                     ; $AEDE: 60
    STA $7006,X             ; $AEDF: 9D 06 70
    TYA                     ; $AEE2: 98
    STA $6F66,X             ; $AEE3: 9D 66 6F
    STA $6FA6,X             ; $AEE6: 9D A6 6F
    LDA $45                 ; $AEE9: A5 45
    STA $6F86,X             ; $AEEB: 9D 86 6F
    STA $6FC6,X             ; $AEEE: 9D C6 6F
    LDA #$00                ; $AEF1: A9 00
    STA $7026,X             ; $AEF3: 9D 26 70
    BRK                     ; $AEF6: 00
    ASL                     ; $AEF7: 0A
    .byte $6F            ; $AEF8
    JMP $BED6               ; $AEF9: 4C D6 BE
    LDA $6285               ; $AEFC: AD 85 62
    ORA #$20                ; $AEFF: 09 20
    STA $6285               ; $AF01: 8D 85 62
    LDA $6287               ; $AF04: AD 87 62
    AND #$07                ; $AF07: 29 07
    TAX                     ; $AF09: AA
    LDA $AFEF,X             ; $AF0A: BD EF AF
    BRK                     ; $AF0D: 00
    ORA ($8F,X)             ; $AF0E: 01 8F
    BRK                     ; $AF10: 00
    .byte $54            ; $AF11
    .byte $33            ; $AF12
    LDA $6287               ; $AF13: AD 87 62
    AND #$07                ; $AF16: 29 07
    CMP #$04                ; $AF18: C9 04
    BCC $AF23               ; $AF1A: 90 07
    LDX #$00                ; $AF1C: A2 00
    LDA #$04                ; $AF1E: A9 04
    BRK                     ; $AF20: 00
    .byte $12            ; $AF21
    .byte $2F            ; $AF22
    BRK                     ; $AF23: 00
    .byte $1F            ; $AF24
    .byte $EF            ; $AF25
    LDX #$00                ; $AF26: A2 00
    BRK                     ; $AF28: 00
    .byte $53            ; $AF29
    .byte $73            ; $AF2A
    LDX #$0A                ; $AF2B: A2 0A
    LDA $6287               ; $AF2D: AD 87 62
    AND #$07                ; $AF30: 29 07
    CMP #$04                ; $AF32: C9 04
    BCC $AF47               ; $AF34: 90 11
    LDA #$81                ; $AF36: A9 81
    STA $6F66,X             ; $AF38: 9D 66 6F
    STA $6FA6,X             ; $AF3B: 9D A6 6F
    STA $6F86,X             ; $AF3E: 9D 86 6F
    STA $6FC6,X             ; $AF41: 9D C6 6F
    JMP $AF5C               ; $AF44: 4C 5C AF
    LDA $7006,X             ; $AF47: BD 06 70
    AND #$FC                ; $AF4A: 29 FC
    ORA #$03                ; $AF4C: 09 03
    STA $7006,X             ; $AF4E: 9D 06 70
    LDX $059B               ; $AF51: AE 9B 05
    LDA $059A               ; $AF54: AD 9A 05
    ORA #$80                ; $AF57: 09 80
    BRK                     ; $AF59: 00
    .byte $0B            ; $AF5A
    .byte $87            ; $AF5B
    BRK                     ; $AF5C: 00
    .byte $03            ; $AF5D
    .byte $EF            ; $AF5E
    JSR $C5BF               ; $AF5F: 20 BF C5
    LDA $6287               ; $AF62: AD 87 62
    AND #$07                ; $AF65: 29 07
    CMP #$04                ; $AF67: C9 04
    BCS $AFBA               ; $AF69: B0 4F
    PHA                     ; $AF6B: 48
    JSR $BF46               ; $AF6C: 20 46 BF
    PLA                     ; $AF6F: 68
    PHA                     ; $AF70: 48
    JSR $AFDA               ; $AF71: 20 DA AF
    BRK                     ; $AF74: 00
    STA ($3B,X)             ; $AF75: 81 3B
    BRK                     ; $AF77: 00
    ADC $004B,X             ; $AF78: 7D 4B 00
    .byte $07            ; $AF7B
    .byte $6F            ; $AF7C
    BPL $AF7F               ; $AF7D: 10 00
    .byte $07            ; $AF7F
    .byte $6F            ; $AF80
    PHA                     ; $AF81: 48
    CMP #$01                ; $AF82: C9 01
    BCS $AFA5               ; $AF84: B0 1F
    LDX #$00                ; $AF86: A2 00
    LDA #$53                ; $AF88: A9 53
    BRK                     ; $AF8A: 00
    AND ($73),Y             ; $AF8B: 31 73
    BCS $AF95               ; $AF8D: B0 06
    BRK                     ; $AF8F: 00
    .byte $7F            ; $AF90
    .byte $4B            ; $AF91
    JMP $AFA5               ; $AF92: 4C A5 AF
    BRK                     ; $AF95: 00
    AND #$2F                ; $AF96: 29 2F
    BRK                     ; $AF98: 00
    .byte $27            ; $AF99
    .byte $0F            ; $AF9A
    BRK                     ; $AF9B: 00
    .byte $07            ; $AF9C
    .byte $6F            ; $AF9D
    BPL $AFA0               ; $AF9E: 10 00
    ROR $4C4B,X             ; $AFA0: 7E 4B 4C
    ROR $68AF,X             ; $AFA3: 7E AF 68
    JSR $AFD7               ; $AFA6: 20 D7 AF
    BRK                     ; $AFA9: 00
    .byte $82            ; $AFAA
    .byte $3B            ; $AFAB
    JSR $D218               ; $AFAC: 20 18 D2
    JSR $D1F3               ; $AFAF: 20 F3 D1
    LDA #$11                ; $AFB2: A9 11
    LDX #$07                ; $AFB4: A2 07
    STA $7046,X             ; $AFB6: 9D 46 70
    RTS                     ; $AFB9: 60
    JSR $BF46               ; $AFBA: 20 46 BF
    BRK                     ; $AFBD: 00
    .byte $83            ; $AFBE
    .byte $3B            ; $AFBF
    JSR $D20A               ; $AFC0: 20 0A D2
    LDA #$00                ; $AFC3: A9 00
    LDX #$0A                ; $AFC5: A2 0A
    STA $7046,X             ; $AFC7: 9D 46 70
    LDX #$07                ; $AFCA: A2 07
    STA $7046,X             ; $AFCC: 9D 46 70
    LDA #$11                ; $AFCF: A9 11
    LDX #$0F                ; $AFD1: A2 0F
    STA $7046,X             ; $AFD3: 9D 46 70
    RTS                     ; $AFD6: 60
    CLC                     ; $AFD7: 18
    ADC #$04                ; $AFD8: 69 04
    ADC #$1B                ; $AFDA: 69 1B
    LDX #$07                ; $AFDC: A2 07
    BRK                     ; $AFDE: 00
    .byte $04            ; $AFDF
    .byte $B7            ; $AFE0
    LDX #$00                ; $AFE1: A2 00
    LDA $03E3,X             ; $AFE3: BD E3 03
    STA $0554,X             ; $AFE6: 9D 54 05
    INX                     ; $AFE9: E8
    CMP #$40                ; $AFEA: C9 40
    BNE $AFE3               ; $AFEC: D0 F5
    RTS                     ; $AFEE: 60
    .byte $07            ; $AFEF
    PHP                     ; $AFF0: 08
    ORA #$0A                ; $AFF1: 09 0A
    .byte $0B            ; $AFF3
    JSR $D218               ; $AFF4: 20 18 D2
    JSR $BF12               ; $AFF7: 20 12 BF
    LDA #$04                ; $AFFA: A9 04
    BRK                     ; $AFFC: 00
    ORA ($8F,X)             ; $AFFD: 01 8F
    BRK                     ; $AFFF: 00
    .byte $1F            ; $B000
    .byte $EF            ; $B001
    LDA #$11                ; $B002: A9 11
    LDX #$02                ; $B004: A2 02
    LDA $6FE6,X             ; $B006: BD E6 6F
    PHA                     ; $B009: 48
    LDY #$01                ; $B00A: A0 01
    LDA $6FE6,Y             ; $B00C: B9 E6 6F
    STA $6FE6,X             ; $B00F: 9D E6 6F
    PLA                     ; $B012: 68
    STA $6FE6,Y             ; $B013: 99 E6 6F
    LDA $7006,X             ; $B016: BD 06 70
    AND #$FC                ; $B019: 29 FC
    ORA #$01                ; $B01B: 09 01
    STA $7006,X             ; $B01D: 9D 06 70
    BRK                     ; $B020: 00
    ASL                     ; $B021: 0A
    .byte $6F            ; $B022
    BRK                     ; $B023: 00
    .byte $03            ; $B024
    .byte $EF            ; $B025
    LDA #$11                ; $B026: A9 11
    LDX #$03                ; $B028: A2 03
    STA $7046,X             ; $B02A: 9D 46 70
    JMP $C5BF               ; $B02D: 4C BF C5
    BRK                     ; $B030: 00
    .byte $04            ; $B031
    .byte $9F            ; $B032
    BRK                     ; $B033: 00
    .byte $32            ; $B034
    .byte $FB            ; $B035
    JSR $D20A               ; $B036: 20 0A D2
    BRK                     ; $B039: 00
    .byte $07            ; $B03A
    .byte $9F            ; $B03B
    LDX #$03                ; $B03C: A2 03
    LDY #$01                ; $B03E: A0 01
    LDA $7066,X             ; $B040: BD 66 70
    STA $7066,Y             ; $B043: 99 66 70
    LDA $7086,X             ; $B046: BD 86 70
    STA $7086,Y             ; $B049: 99 86 70
    LDA #$11                ; $B04C: A9 11
    STA $7046,Y             ; $B04E: 99 46 70
    LDX #$02                ; $B051: A2 02
    LDA $7006,X             ; $B053: BD 06 70
    AND #$FC                ; $B056: 29 FC
    ORA #$02                ; $B058: 09 02
    STA $7006,X             ; $B05A: 9D 06 70
    RTS                     ; $B05D: 60
    BRK                     ; $B05E: 00
    .byte $92            ; $B05F
    .byte $FB            ; $B060
    LDA system_flags        ; $B061: A5 1F
    ORA #$08                ; $B063: 09 08
    STA system_flags        ; $B065: 85 1F
    LDX #$02                ; $B067: A2 02
    LDA #$81                ; $B069: A9 81
    STA $6F66,X             ; $B06B: 9D 66 6F
    STA $6FA6,X             ; $B06E: 9D A6 6F
    STA $6F86,X             ; $B071: 9D 86 6F
    STA $6FC6,X             ; $B074: 9D C6 6F
    LDA $7006,X             ; $B077: BD 06 70
    AND #$3C                ; $B07A: 29 3C
    JSR $C78C               ; $B07C: 20 8C C7
    LDA #$01                ; $B07F: A9 01
    STA $51                 ; $B081: 85 51
    LDA #$03                ; $B083: A9 03
    STA $52                 ; $B085: 85 52
    LDA $0200,Y             ; $B087: B9 00 02
    SEC                     ; $B08A: 38
    SBC $51                 ; $B08B: E5 51
    BCS $B091               ; $B08D: B0 02
    LDA #$EF                ; $B08F: A9 EF
    PHA                     ; $B091: 48
    STA $0200,Y             ; $B092: 99 00 02
    STA $0204,Y             ; $B095: 99 04 02
    CLC                     ; $B098: 18
    ADC #$08                ; $B099: 69 08
    STA $0208,Y             ; $B09B: 99 08 02
    STA $020C,Y             ; $B09E: 99 0C 02
    JSR $FF74               ; $B0A1: 20 74 FF
    PLA                     ; $B0A4: 68
    CMP #$EF                ; $B0A5: C9 EF
    BEQ $B0B2               ; $B0A7: F0 09
    DEC $52                 ; $B0A9: C6 52
    BNE $B087               ; $B0AB: D0 DA
    INC $51                 ; $B0AD: E6 51
    JMP $B083               ; $B0AF: 4C 83 B0
    LDA system_flags        ; $B0B2: A5 1F
    AND #$F7                ; $B0B4: 29 F7
    STA system_flags        ; $B0B6: 85 1F
    RTS                     ; $B0B8: 60
    LDX #$02                ; $B0B9: A2 02
    LDA #$11                ; $B0BB: A9 11
    STA $7046,X             ; $B0BD: 9D 46 70
    LDX #$03                ; $B0C0: A2 03
    STA $7046,X             ; $B0C2: 9D 46 70
    JMP $BF12               ; $B0C5: 4C 12 BF
    LDA #$11                ; $B0C8: A9 11
    LDX #$02                ; $B0CA: A2 02
    STA $7046,X             ; $B0CC: 9D 46 70
    LDX #$04                ; $B0CF: A2 04
    STA $7046,X             ; $B0D1: 9D 46 70
    LDY #$01                ; $B0D4: A0 01
    BRK                     ; $B0D6: 00
    .byte $13            ; $B0D7
    .byte $EB            ; $B0D8
    RTI                     ; $B0D9: 40
    BEQ $B0DD               ; $B0DA: F0 01
    INY                     ; $B0DC: C8
    LDA $6F60,Y             ; $B0DD: B9 60 6F
    STA $6F66,X             ; $B0E0: 9D 66 6F
    STA $6FA6,X             ; $B0E3: 9D A6 6F
    LDA $6F80,Y             ; $B0E6: B9 80 6F
    STA $6F86,X             ; $B0E9: 9D 86 6F
    STA $6FC6,X             ; $B0EC: 9D C6 6F
    LDA #$81                ; $B0EF: A9 81
    STA $7020,Y             ; $B0F1: 99 20 70
    JSR $BF12               ; $B0F4: 20 12 BF
    BRK                     ; $B0F7: 00
    .byte $0B            ; $B0F8
    .byte $DB            ; $B0F9
    .byte $FB            ; $B0FA
    RTS                     ; $B0FB: 60
    JSR $C5C5               ; $B0FC: 20 C5 C5
    LDA #$80                ; $B0FF: A9 80
    STA $6BDE               ; $B101: 8D DE 6B
    JSR $C54E               ; $B104: 20 4E C5
    JSR $BF46               ; $B107: 20 46 BF
    LDA #$30                ; $B10A: A9 30
    STA $05FD               ; $B10C: 8D FD 05
    JSR $C5BF               ; $B10F: 20 BF C5
    LDA #$00                ; $B112: A9 00
    STA $6BDE               ; $B114: 8D DE 6B
    BRK                     ; $B117: 00
    ORA ($FB,X)             ; $B118: 01 FB
    BRK                     ; $B11A: 00
    .byte $5B            ; $B11B
    .byte $3B            ; $B11C
    JSR $D218               ; $B11D: 20 18 D2
    JSR $C5C5               ; $B120: 20 C5 C5
    LDA #$00                ; $B123: A9 00
    STA $62ED               ; $B125: 8D ED 62
    LDA #$00                ; $B128: A9 00
    STA $64                 ; $B12A: 85 64
    LDA #$05                ; $B12C: A9 05
    STA $44                 ; $B12E: 85 44
    LDA #$1C                ; $B130: A9 1C
    STA $45                 ; $B132: 85 45
    LDA #$01                ; $B134: A9 01
    BRK                     ; $B136: 00
    AND ($EF),Y             ; $B137: 31 EF
    BRK                     ; $B139: 00
    ORA #$9F                ; $B13A: 09 9F
    LDX #$0C                ; $B13C: A2 0C
    LDA $7006,X             ; $B13E: BD 06 70
    ORA #$03                ; $B141: 09 03
    STA $7006,X             ; $B143: 9D 06 70
    JSR $C5BF               ; $B146: 20 BF C5
    JSR $BF46               ; $B149: 20 46 BF
    BRK                     ; $B14C: 00
    .byte $5C            ; $B14D
    .byte $3B            ; $B14E
    LDX #$0C                ; $B14F: A2 0C
    LDA $7006,X             ; $B151: BD 06 70
    AND #$FC                ; $B154: 29 FC
    STA $7006,X             ; $B156: 9D 06 70
    RTS                     ; $B159: 60
    LDX #$08                ; $B15A: A2 08
    LDA #$80                ; $B15C: A9 80
    TAY                     ; $B15E: A8
    JSR $BF25               ; $B15F: 20 25 BF
    LDX #$05                ; $B162: A2 05
    LDA #$11                ; $B164: A9 11
    STA $7046,X             ; $B166: 9D 46 70
    JSR $BF12               ; $B169: 20 12 BF
    LDA #$00                ; $B16C: A9 00
    STA $F9                 ; $B16E: 85 F9
    STA $FA                 ; $B170: 85 FA
    STA $FB                 ; $B172: 85 FB
    STA $FC                 ; $B174: 85 FC
    RTS                     ; $B176: 60
    BRK                     ; $B177: 00
    STX $00FB               ; $B178: 8E FB 00
    INC $3B,X               ; $B17B: F6 3B
    LDY #$10                ; $B17D: A0 10
    BRK                     ; $B17F: 00
    .byte $03            ; $B180
    .byte $4F            ; $B181
    JSR $D210               ; $B182: 20 10 D2
    JSR $D1F3               ; $B185: 20 F3 D1
    BRK                     ; $B188: 00
    .byte $92            ; $B189
    .byte $FB            ; $B18A
    LDA system_flags        ; $B18B: A5 1F
    ORA #$08                ; $B18D: 09 08
    STA system_flags        ; $B18F: 85 1F
    JSR $B1CB               ; $B191: 20 CB B1
    BRK                     ; $B194: 00
    LDA $FB                 ; $B195: A5 FB
    JSR $B22B               ; $B197: 20 2B B2
    JSR $B1C6               ; $B19A: 20 C6 B1
    LDA system_flags        ; $B19D: A5 1F
    AND #$F7                ; $B19F: 29 F7
    STA system_flags        ; $B1A1: 85 1F
    LDX #$01                ; $B1A3: A2 01
    LDA $6FE6,X             ; $B1A5: BD E6 6F
    LDX #$00                ; $B1A8: A2 00
    STA $6FE6,X             ; $B1AA: 9D E6 6F
    LDA $7006,X             ; $B1AD: BD 06 70
    AND #$FC                ; $B1B0: 29 FC
    ORA #$01                ; $B1B2: 09 01
    STA $7006,X             ; $B1B4: 9D 06 70
    LDA $70E6,X             ; $B1B7: BD E6 70
    AND #$7F                ; $B1BA: 29 7F
    STA $70E6,X             ; $B1BC: 9D E6 70
    JSR $BF46               ; $B1BF: 20 46 BF
    BRK                     ; $B1C2: 00
    .byte $3A            ; $B1C3
    .byte $3B            ; $B1C4
    RTS                     ; $B1C5: 60
    LDA #$FF                ; $B1C6: A9 FF
    JMP $B1CD               ; $B1C8: 4C CD B1
    LDA #$00                ; $B1CB: A9 00
    STA $52                 ; $B1CD: 85 52
    LDX #$00                ; $B1CF: A2 00
    LDA $7006,X             ; $B1D1: BD 06 70
    AND #$3C                ; $B1D4: 29 3C
    JSR $C78C               ; $B1D6: 20 8C C7
    LDA $3D                 ; $B1D9: A5 3D
    ASL                     ; $B1DB: 0A
    ASL                     ; $B1DC: 0A
    ASL                     ; $B1DD: 0A
    ASL                     ; $B1DE: 0A
    TAX                     ; $B1DF: AA
    LDA $0200,Y             ; $B1E0: B9 00 02
    BIT $52                 ; $B1E3: 24 52
    BMI $B1EE               ; $B1E5: 30 07
    SEC                     ; $B1E7: 38
    SBC $B20B,X             ; $B1E8: FD 0B B2
    JMP $B1F2               ; $B1EB: 4C F2 B1
    CLC                     ; $B1EE: 18
    ADC $B20B,X             ; $B1EF: 7D 0B B2
    STA $0200,Y             ; $B1F2: 99 00 02
    STA $0204,Y             ; $B1F5: 99 04 02
    CLC                     ; $B1F8: 18
    ADC #$08                ; $B1F9: 69 08
    STA $0208,Y             ; $B1FB: 99 08 02
    STA $020C,Y             ; $B1FE: 99 0C 02
    JSR $FF74               ; $B201: 20 74 FF
    INX                     ; $B204: E8
    TXA                     ; $B205: 8A
    AND #$0F                ; $B206: 29 0F
    BNE $B1E0               ; $B208: D0 D6
    RTS                     ; $B20A: 60
    ORA (tmp1,X)            ; $B20B: 01 01
    .byte $02            ; $B20D
    .byte $03            ; $B20E
    .byte $04            ; $B20F
    .byte $04            ; $B210
    ORA ptr0_hi             ; $B211: 05 05
    ASL $07                 ; $B213: 06 07
    .byte $07            ; $B215
    PHP                     ; $B216: 08
    PHP                     ; $B217: 08
    ORA #$0A                ; $B218: 09 0A
    .byte $0B            ; $B21A
    ORA (tmp2,X)            ; $B21B: 01 02
    .byte $02            ; $B21D
    .byte $04            ; $B21E
    .byte $04            ; $B21F
    ORA ptr0_hi             ; $B220: 05 05
    ASL $07                 ; $B222: 06 07
    PHP                     ; $B224: 08
    ORA #$09                ; $B225: 09 09
    ASL                     ; $B227: 0A
    .byte $0B            ; $B228
    .byte $0B            ; $B229
    .byte $0C            ; $B22A
    LDX #$1C                ; $B22B: A2 1C
    TXA                     ; $B22D: 8A
    LSR                     ; $B22E: 4A
    LSR                     ; $B22F: 4A
    STA $51                 ; $B230: 85 51
    LDA $0509               ; $B232: AD 09 05
    PHA                     ; $B235: 48
    CLC                     ; $B236: 18
    ADC $51                 ; $B237: 65 51
    STA $0509               ; $B239: 8D 09 05
    JSR $FF74               ; $B23C: 20 74 FF
    PLA                     ; $B23F: 68
    STA $0509               ; $B240: 8D 09 05
    JSR $FF74               ; $B243: 20 74 FF
    DEX                     ; $B246: CA
    BNE $B22D               ; $B247: D0 E4
    RTS                     ; $B249: 60
    LDY #$00                ; $B24A: A0 00
    LDX #$07                ; $B24C: A2 07
    JSR $B2B4               ; $B24E: 20 B4 B2
    LDX #$0A                ; $B251: A2 0A
    JSR $B2B4               ; $B253: 20 B4 B2
    LDX #$09                ; $B256: A2 09
    JSR $B2B4               ; $B258: 20 B4 B2
    LDX #$08                ; $B25B: A2 08
    JSR $B2B4               ; $B25D: 20 B4 B2
    LDX #$05                ; $B260: A2 05
    LDA #$11                ; $B262: A9 11
    STA $7046,X             ; $B264: 9D 46 70
    BRK                     ; $B267: 00
    ASL                     ; $B268: 0A
    .byte $6F            ; $B269
    LDA #$8F                ; $B26A: A9 8F
    LDX #$03                ; $B26C: A2 03
    JSR $BF16               ; $B26E: 20 16 BF
    LDX #$1F                ; $B271: A2 1F
    LDA #$00                ; $B273: A9 00
    STA $6F40,X             ; $B275: 9D 40 6F
    DEX                     ; $B278: CA
    BPL $B275               ; $B279: 10 FA
    LDA #$FF                ; $B27B: A9 FF
    STA $05A0               ; $B27D: 8D A0 05
    LDA #$A8                ; $B280: A9 A8
    STA $42                 ; $B282: 85 42
    STA $6191               ; $B284: 8D 91 61
    STA $6195               ; $B287: 8D 95 61
    LDA #$89                ; $B28A: A9 89
    STA $43                 ; $B28C: 85 43
    STA $6192               ; $B28E: 8D 92 61
    STA $6196               ; $B291: 8D 96 61
    BRK                     ; $B294: 00
    .byte $13            ; $B295
    .byte $CB            ; $B296
    ORA (tmp0,X)            ; $B297: 01 00
    .byte $17            ; $B299
    .byte $CB            ; $B29A
    JSR $05A9               ; $B29B: 20 A9 05
    PHA                     ; $B29E: 48
    BRK                     ; $B29F: 00
    .byte $6F            ; $B2A0
    .byte $33            ; $B2A1
    BRK                     ; $B2A2: 00
    LSR $33,X               ; $B2A3: 56 33
    PLA                     ; $B2A5: 68
    PHA                     ; $B2A6: 48
    BRK                     ; $B2A7: 00
    .byte $52            ; $B2A8
    .byte $73            ; $B2A9
    PLA                     ; $B2AA: 68
    BRK                     ; $B2AB: 00
    ROL $2F                 ; $B2AC: 26 2F
    BCC $B2B3               ; $B2AE: 90 03
    BRK                     ; $B2B0: 00
    .byte $5F            ; $B2B1
    .byte $73            ; $B2B2
    RTS                     ; $B2B3: 60
    LDA $6F60,Y             ; $B2B4: B9 60 6F
    STA $6F60,X             ; $B2B7: 9D 60 6F
    STA $6FA0,X             ; $B2BA: 9D A0 6F
    LDA $6F80,Y             ; $B2BD: B9 80 6F
    STA $6F80,X             ; $B2C0: 9D 80 6F
    STA $6FC0,X             ; $B2C3: 9D C0 6F
    LDA $6FE0,Y             ; $B2C6: B9 E0 6F
    STA $6FE0,X             ; $B2C9: 9D E0 6F
    LDA $7000,X             ; $B2CC: BD 00 70
    AND #$FC                ; $B2CF: 29 FC
    STA $7000,X             ; $B2D1: 9D 00 70
    LDA $7000,Y             ; $B2D4: B9 00 70
    AND #$03                ; $B2D7: 29 03
    ORA $7000,X             ; $B2D9: 1D 00 70
    STA $7000,X             ; $B2DC: 9D 00 70
    LDA #$11                ; $B2DF: A9 11
    STA $7040,X             ; $B2E1: 9D 40 70
    LDA $70E0,X             ; $B2E4: BD E0 70
    AND #$7F                ; $B2E7: 29 7F
    STA $70E0,X             ; $B2E9: 9D E0 70
    LDA $70E0,Y             ; $B2EC: B9 E0 70
    AND #$80                ; $B2EF: 29 80
    ORA $70E0,X             ; $B2F1: 1D E0 70
    STA $70E0,X             ; $B2F4: 9D E0 70
    LDA $7020,X             ; $B2F7: BD 20 70
    AND #$7F                ; $B2FA: 29 7F
    STA $7020,X             ; $B2FC: 9D 20 70
    LDA $7020,Y             ; $B2FF: B9 20 70
    AND #$80                ; $B302: 29 80
    ORA $7020,X             ; $B304: 1D 20 70
    STA $7020,X             ; $B307: 9D 20 70
    LDA $7020,Y             ; $B30A: B9 20 70
    ORA #$80                ; $B30D: 09 80
    STA $7020,Y             ; $B30F: 99 20 70
    INY                     ; $B312: C8
    RTS                     ; $B313: 60
    LDA #$0F                ; $B314: A9 0F
    BRK                     ; $B316: 00
    ORA ($8F,X)             ; $B317: 01 8F
    BRK                     ; $B319: 00
    .byte $1A            ; $B31A
    .byte $CB            ; $B31B
    RTI                     ; $B31C: 40
    BRK                     ; $B31D: 00
    .byte $1F            ; $B31E
    .byte $EF            ; $B31F
    BRK                     ; $B320: 00
    PHP                     ; $B321: 08
    .byte $CF            ; $B322
    BRK                     ; $B323: 00
    ASL                     ; $B324: 0A
    .byte $6F            ; $B325
    BRK                     ; $B326: 00
    .byte $03            ; $B327
    .byte $EF            ; $B328
    JMP $C5BF               ; $B329: 4C BF C5
    LDA #$10                ; $B32C: A9 10
    BRK                     ; $B32E: 00
    ORA ($8F,X)             ; $B32F: 01 8F
    BRK                     ; $B331: 00
    .byte $1A            ; $B332
    .byte $CB            ; $B333
    .byte $80            ; $B334
    BRK                     ; $B335: 00
    .byte $1F            ; $B336
    .byte $EF            ; $B337
    LDX #$03                ; $B338: A2 03
    JSR $BF37               ; $B33A: 20 37 BF
    LDX #$0C                ; $B33D: A2 0C
    LDA $7000,X             ; $B33F: BD 00 70
    ORA #$03                ; $B342: 09 03
    STA $7000,X             ; $B344: 9D 00 70
    LDA #$11                ; $B347: A9 11
    STA $7040,X             ; $B349: 9D 40 70
    LDY #$04                ; $B34C: A0 04
    STA $7046,Y             ; $B34E: 99 46 70
    LDY #$05                ; $B351: A0 05
    STA $7046,Y             ; $B353: 99 46 70
    LDY #$02                ; $B356: A0 02
    STA $7046,Y             ; $B358: 99 46 70
    LDA $6FE0,X             ; $B35B: BD E0 6F
    TAX                     ; $B35E: AA
    LDA #$C0                ; $B35F: A9 C0
    BRK                     ; $B361: 00
    .byte $0B            ; $B362
    .byte $87            ; $B363
    BRK                     ; $B364: 00
    ASL                     ; $B365: 0A
    .byte $6F            ; $B366
    BRK                     ; $B367: 00
    .byte $03            ; $B368
    .byte $EF            ; $B369
    LDA #$8F                ; $B36A: A9 8F
    JSR $BF14               ; $B36C: 20 14 BF
    JMP $C5BF               ; $B36F: 4C BF C5
    LDA $63                 ; $B372: A5 63
    CMP #$37                ; $B374: C9 37
    BNE $B397               ; $B376: D0 1F
    LDA $64                 ; $B378: A5 64
    CMP #$01                ; $B37A: C9 01
    BNE $B397               ; $B37C: D0 19
    LDX #$3C                ; $B37E: A2 3C
    JSR $C90C               ; $B380: 20 0C C9
    LDX $44                 ; $B383: A6 44
    LDY $45                 ; $B385: A4 45
    LDA #$11                ; $B387: A9 11
    BRK                     ; $B389: 00
    ORA #$EF                ; $B38A: 09 EF
    BRK                     ; $B38C: 00
    STA $FB,X               ; $B38D: 95 FB
    LDX #$0F                ; $B38F: A2 0F
    JSR $C90C               ; $B391: 20 0C C9
    BRK                     ; $B394: 00
    .byte $1B            ; $B395
    .byte $EF            ; $B396
    RTS                     ; $B397: 60
    LDA #$0C                ; $B398: A9 0C
    BRK                     ; $B39A: 00
    ORA ($8F,X)             ; $B39B: 01 8F
    BRK                     ; $B39D: 00
    ASL                     ; $B39E: 0A
    .byte $CB            ; $B39F
    ORA (tmp0,X)            ; $B3A0: 01 00
    ROL $CB                 ; $B3A2: 26 CB
    .byte $04            ; $B3A4
    BRK                     ; $B3A5: 00
    .byte $1F            ; $B3A6
    .byte $EF            ; $B3A7
    BRK                     ; $B3A8: 00
    PHP                     ; $B3A9: 08
    .byte $CF            ; $B3AA
    BRK                     ; $B3AB: 00
    ASL                     ; $B3AC: 0A
    .byte $6F            ; $B3AD
    BRK                     ; $B3AE: 00
    .byte $03            ; $B3AF
    .byte $EF            ; $B3B0
    LDA #$00                ; $B3B1: A9 00
    STA $0530               ; $B3B3: 8D 30 05
    JSR $C5BF               ; $B3B6: 20 BF C5
    RTS                     ; $B3B9: 60
    LDX #$00                ; $B3BA: A2 00
    STX $5B                 ; $B3BC: 86 5B
    BRK                     ; $B3BE: 00
    .byte $2B            ; $B3BF
    .byte $73            ; $B3C0
    BEQ $B3E5               ; $B3C1: F0 22
    LDY $5B                 ; $B3C3: A4 5B
    STA $005C,Y             ; $B3C5: 99 5C 00
    INC $5B                 ; $B3C8: E6 5B
    TXA                     ; $B3CA: 8A
    PHA                     ; $B3CB: 48
    LDA $7020,X             ; $B3CC: BD 20 70
    ORA #$80                ; $B3CF: 09 80
    STA $7020,X             ; $B3D1: 9D 20 70
    LDA $6FA0,X             ; $B3D4: BD A0 6F
    LDY $6FC0,X             ; $B3D7: BC C0 6F
    TAX                     ; $B3DA: AA
    LDA #$0D                ; $B3DB: A9 0D
    BRK                     ; $B3DD: 00
    ORA #$EF                ; $B3DE: 09 EF
    PLA                     ; $B3E0: 68
    TAX                     ; $B3E1: AA
    JMP $B3E7               ; $B3E2: 4C E7 B3
    STX $5E                 ; $B3E5: 86 5E
    INX                     ; $B3E7: E8
    CPX #$03                ; $B3E8: E0 03
    BCC $B3BE               ; $B3EA: 90 D2
    BRK                     ; $B3EC: 00
    ASL                     ; $B3ED: 0A
    .byte $6F            ; $B3EE
    JSR $FF74               ; $B3EF: 20 74 FF
    BRK                     ; $B3F2: 00
    .byte $93            ; $B3F3
    .byte $FB            ; $B3F4
    LDX $5E                 ; $B3F5: A6 5E
    BRK                     ; $B3F7: 00
    .byte $53            ; $B3F8
    .byte $73            ; $B3F9
    LDX #$00                ; $B3FA: A2 00
    BRK                     ; $B3FC: 00
    .byte $23            ; $B3FD
    .byte $EF            ; $B3FE
    BRK                     ; $B3FF: 00
    ORA $A987               ; $B400: 0D 87 A9
    BRK                     ; $B403: 00
    STA $6FE0               ; $B404: 8D E0 6F
    STA $6FE1               ; $B407: 8D E1 6F
    STA $6FE2               ; $B40A: 8D E2 6F
    BRK                     ; $B40D: 00
    ASL                     ; $B40E: 0A
    .byte $6F            ; $B40F
    LDX #$0A                ; $B410: A2 0A
    JSR $C90C               ; $B412: 20 0C C9
    LDX #$01                ; $B415: A2 01
    LDA $5C                 ; $B417: A5 5C
    BRK                     ; $B419: 00
    ORA $A287               ; $B41A: 0D 87 A2
    .byte $02            ; $B41D
    LDA $5D                 ; $B41E: A5 5D
    BRK                     ; $B420: 00
    ORA $0087               ; $B421: 0D 87 00
    STA $FB,X               ; $B424: 95 FB
    LDX #$00                ; $B426: A2 00
    CPX $5E                 ; $B428: E4 5E
    BEQ $B43C               ; $B42A: F0 10
    TXA                     ; $B42C: 8A
    PHA                     ; $B42D: 48
    LDA $6FA0,X             ; $B42E: BD A0 6F
    LDY $6FC0,X             ; $B431: BC C0 6F
    TAX                     ; $B434: AA
    LDA #$0A                ; $B435: A9 0A
    BRK                     ; $B437: 00
    ORA #$EF                ; $B438: 09 EF
    PLA                     ; $B43A: 68
    TAX                     ; $B43B: AA
    INX                     ; $B43C: E8
    CPX #$03                ; $B43D: E0 03
    BCC $B428               ; $B43F: 90 E7
    JSR $FF74               ; $B441: 20 74 FF
    LDA system_flags        ; $B444: A5 1F
    ORA #$08                ; $B446: 09 08
    STA system_flags        ; $B448: 85 1F
    LDX $5E                 ; $B44A: A6 5E
    BEQ $B469               ; $B44C: F0 1B
    LDA $7000,X             ; $B44E: BD 00 70
    AND #$3C                ; $B451: 29 3C
    JSR $C78C               ; $B453: 20 8C C7
    LDX #$00                ; $B456: A2 00
    LDA $0200,Y             ; $B458: B9 00 02
    STA $0200,X             ; $B45B: 9D 00 02
    LDA #$F7                ; $B45E: A9 F7
    STA $0200,Y             ; $B460: 99 00 02
    INX                     ; $B463: E8
    INY                     ; $B464: C8
    CPX #$10                ; $B465: E0 10
    BCC $B458               ; $B467: 90 EF
    JSR $FF74               ; $B469: 20 74 FF
    LDX #$00                ; $B46C: A2 00
    JSR $B498               ; $B46E: 20 98 B4
    LDY #$00                ; $B471: A0 00
    JSR $B4BC               ; $B473: 20 BC B4
    LDX #$02                ; $B476: A2 02
    JSR $B498               ; $B478: 20 98 B4
    LDY #$08                ; $B47B: A0 08
    JSR $B4BC               ; $B47D: 20 BC B4
    LDA #$00                ; $B480: A9 00
    STA $7020               ; $B482: 8D 20 70
    LDA #$80                ; $B485: A9 80
    STA $7021               ; $B487: 8D 21 70
    STA $7022               ; $B48A: 8D 22 70
    LDA system_flags        ; $B48D: A5 1F
    AND #$F7                ; $B48F: 29 F7
    STA system_flags        ; $B491: 85 1F
    BRK                     ; $B493: 00
    ASL                     ; $B494: 0A
    .byte $CB            ; $B495
    .byte $80            ; $B496
    RTS                     ; $B497: 60
    JSR $B49B               ; $B498: 20 9B B4
    TXA                     ; $B49B: 8A
    PHA                     ; $B49C: 48
    LDA $B4B0,X             ; $B49D: BD B0 B4
    PHA                     ; $B4A0: 48
    LDY $B4B4,X             ; $B4A1: BC B4 B4
    LDA $B4B8,X             ; $B4A4: BD B8 B4
    TAX                     ; $B4A7: AA
    PLA                     ; $B4A8: 68
    BRK                     ; $B4A9: 00
    ORA #$EF                ; $B4AA: 09 EF
    PLA                     ; $B4AC: 68
    TAX                     ; $B4AD: AA
    INX                     ; $B4AE: E8
    RTS                     ; $B4AF: 60
    ASL $17,X               ; $B4B0: 16 17
    .byte $1A            ; $B4B2
    .byte $1B            ; $B4B3
    .byte $0B            ; $B4B4
    .byte $0B            ; $B4B5
    .byte $0C            ; $B4B6
    .byte $0C            ; $B4B7
    ASL $17,X               ; $B4B8: 16 17
    ASL $17,X               ; $B4BA: 16 17
    LDA $0200               ; $B4BC: AD 00 02
    CLC                     ; $B4BF: 18
    ADC $B4FB,Y             ; $B4C0: 79 FB B4
    STA $0200               ; $B4C3: 8D 00 02
    STA $0204               ; $B4C6: 8D 04 02
    CLC                     ; $B4C9: 18
    ADC #$08                ; $B4CA: 69 08
    STA $0208               ; $B4CC: 8D 08 02
    STA $020C               ; $B4CF: 8D 0C 02
    LDA $0509               ; $B4D2: AD 09 05
    CLC                     ; $B4D5: 18
    ADC $B4FB,Y             ; $B4D6: 79 FB B4
    STA $0509               ; $B4D9: 8D 09 05
    LDA $0203               ; $B4DC: AD 03 02
    CLC                     ; $B4DF: 18
    ADC $5E                 ; $B4E0: 65 5E
    STA $0203               ; $B4E2: 8D 03 02
    STA $020B               ; $B4E5: 8D 0B 02
    CLC                     ; $B4E8: 18
    ADC #$08                ; $B4E9: 69 08
    STA $0207               ; $B4EB: 8D 07 02
    STA $020F               ; $B4EE: 8D 0F 02
    JSR $FF74               ; $B4F1: 20 74 FF
    INY                     ; $B4F4: C8
    TYA                     ; $B4F5: 98
    AND #$07                ; $B4F6: 29 07
    BNE $B4BC               ; $B4F8: D0 C2
    RTS                     ; $B4FA: 60
    INC $FD,X               ; $B4FB: F6 FD
    INC $01FF,X             ; $B4FD: FE FF 01
    .byte $02            ; $B500
    .byte $03            ; $B501
    ASL                     ; $B502: 0A
    .byte $FC            ; $B503
    INC $FFFF,X             ; $B504: FE FF FF
    ORA (tmp1,X)            ; $B507: 01 01
    .byte $02            ; $B509
    .byte $04            ; $B50A
    LDX #$05                ; $B50B: A2 05
    JSR $B56A               ; $B50D: 20 6A B5
    LDX #$06                ; $B510: A2 06
    JSR $B56A               ; $B512: 20 6A B5
    BRK                     ; $B515: 00
    .byte $07            ; $B516
    .byte $6F            ; $B517
    .byte $43            ; $B518
    LDA #$00                ; $B519: A9 00
    STA $F9                 ; $B51B: 85 F9
    STA $FA                 ; $B51D: 85 FA
    STA $FB                 ; $B51F: 85 FB
    BRK                     ; $B521: 00
    .byte $F7            ; $B522
    .byte $3B            ; $B523
    BRK                     ; $B524: 00
    SED                     ; $B525: F8
    .byte $3B            ; $B526
    BRK                     ; $B527: 00
    .byte $07            ; $B528
    .byte $6F            ; $B529
    PHA                     ; $B52A: 48
    CMP #$01                ; $B52B: C9 01
    BCS $B535               ; $B52D: B0 06
    BRK                     ; $B52F: 00
    SBC $4C3B,Y             ; $B530: F9 3B 4C
    BIT $B5                 ; $B533: 24 B5
    BRK                     ; $B535: 00
    .byte $FA            ; $B536
    .byte $3B            ; $B537
    LDX #$06                ; $B538: A2 06
    LDA $44                 ; $B53A: A5 44
    CMP #$17                ; $B53C: C9 17
    BCS $B542               ; $B53E: B0 02
    LDX #$05                ; $B540: A2 05
    LDY #$01                ; $B542: A0 01
    JSR $B577               ; $B544: 20 77 B5
    LDX #$05                ; $B547: A2 05
    LDA $44                 ; $B549: A5 44
    CMP #$17                ; $B54B: C9 17
    BCS $B551               ; $B54D: B0 02
    LDX #$06                ; $B54F: A2 06
    JSR $B577               ; $B551: 20 77 B5
    BRK                     ; $B554: 00
    .byte $54            ; $B555
    .byte $33            ; $B556
    LDX #$01                ; $B557: A2 01
    BRK                     ; $B559: 00
    .byte $2B            ; $B55A
    .byte $73            ; $B55B
    BRK                     ; $B55C: 00
    ORA $A287               ; $B55D: 0D 87 A2
    .byte $02            ; $B560
    BRK                     ; $B561: 00
    .byte $2B            ; $B562
    .byte $73            ; $B563
    BRK                     ; $B564: 00
    ORA $4C87               ; $B565: 0D 87 4C
    ASL                     ; $B568: 0A
    .byte $D2            ; $B569
    LDA $7006,X             ; $B56A: BD 06 70
    AND #$FC                ; $B56D: 29 FC
    ORA $3D                 ; $B56F: 05 3D
    EOR #$02                ; $B571: 49 02
    STA $7006,X             ; $B573: 9D 06 70
    RTS                     ; $B576: 60
    LDA $6F66,X             ; $B577: BD 66 6F
    STA $6F60,Y             ; $B57A: 99 60 6F
    STA $6FA0,Y             ; $B57D: 99 A0 6F
    LDA $6F86,X             ; $B580: BD 86 6F
    STA $6F80,Y             ; $B583: 99 80 6F
    STA $6FC0,Y             ; $B586: 99 C0 6F
    LDA $7020,Y             ; $B589: B9 20 70
    AND #$7F                ; $B58C: 29 7F
    STA $7020,Y             ; $B58E: 99 20 70
    LDA $7000,Y             ; $B591: B9 00 70
    AND #$FC                ; $B594: 29 FC
    ORA $3D                 ; $B596: 05 3D
    EOR #$02                ; $B598: 49 02
    CPY #$01                ; $B59A: C0 01
    BEQ $B5AC               ; $B59C: F0 0E
    AND #$FC                ; $B59E: 29 FC
    PHA                     ; $B5A0: 48
    LDA $44                 ; $B5A1: A5 44
    CMP #$17                ; $B5A3: C9 17
    PLA                     ; $B5A5: 68
    BCS $B5AA               ; $B5A6: B0 02
    ORA #$02                ; $B5A8: 09 02
    ORA #$01                ; $B5AA: 09 01
    STA $7000,Y             ; $B5AC: 99 00 70
    LDA #$80                ; $B5AF: A9 80
    STA $7026,X             ; $B5B1: 9D 26 70
    STA $6F66,X             ; $B5B4: 9D 66 6F
    STA $6FA6,X             ; $B5B7: 9D A6 6F
    STA $6F86,X             ; $B5BA: 9D 86 6F
    STA $6FC6,X             ; $B5BD: 9D C6 6F
    INY                     ; $B5C0: C8
    RTS                     ; $B5C1: 60
    LDA #$0E                ; $B5C2: A9 0E
    BRK                     ; $B5C4: 00
    ORA ($8F,X)             ; $B5C5: 01 8F
    BRK                     ; $B5C7: 00
    ORA $01CB,Y             ; $B5C8: 19 CB 01
    BRK                     ; $B5CB: 00
    .byte $1F            ; $B5CC
    .byte $EF            ; $B5CD
    BRK                     ; $B5CE: 00
    PHP                     ; $B5CF: 08
    .byte $CF            ; $B5D0
    LDX #$0F                ; $B5D1: A2 0F
    LDA #$11                ; $B5D3: A9 11
    STA $7040,X             ; $B5D5: 9D 40 70
    LDA $7000,X             ; $B5D8: BD 00 70
    ORA #$03                ; $B5DB: 09 03
    STA $7000,X             ; $B5DD: 9D 00 70
    LDY #$0A                ; $B5E0: A0 0A
    LDA $6FE6,Y             ; $B5E2: B9 E6 6F
    STA $6FE0,X             ; $B5E5: 9D E0 6F
    STX $059C               ; $B5E8: 8E 9C 05
    LDX #$00                ; $B5EB: A2 00
    LDA #$14                ; $B5ED: A9 14
    STA $6F66,X             ; $B5EF: 9D 66 6F
    STA $6FA6,X             ; $B5F2: 9D A6 6F
    LDA #$09                ; $B5F5: A9 09
    STA $6F86,X             ; $B5F7: 9D 86 6F
    STA $6FC6,X             ; $B5FA: 9D C6 6F
    LDA #$43                ; $B5FD: A9 43
    STA $7146,X             ; $B5FF: 9D 46 71
    BRK                     ; $B602: 00
    ASL                     ; $B603: 0A
    .byte $6F            ; $B604
    BRK                     ; $B605: 00
    .byte $03            ; $B606
    .byte $EF            ; $B607
    LDA #$82                ; $B608: A9 82
    JSR $BF14               ; $B60A: 20 14 BF
    BRK                     ; $B60D: 00
    ASL $CB,X               ; $B60E: 16 CB
    .byte $04            ; $B610
    JMP $C5BF               ; $B611: 4C BF C5
    LDA #$84                ; $B614: A9 84
    JSR $BF14               ; $B616: 20 14 BF
    LDA #$04                ; $B619: A9 04
    JSR $B29E               ; $B61B: 20 9E B2
    BRK                     ; $B61E: 00
    .byte $17            ; $B61F
    .byte $CB            ; $B620
    BPL $B683               ; $B621: 10 60
    LDA #$06                ; $B623: A9 06
    JSR $B29E               ; $B625: 20 9E B2
    LDX #$00                ; $B628: A2 00
    LDA #$11                ; $B62A: A9 11
    STA $7046,X             ; $B62C: 9D 46 70
    BRK                     ; $B62F: 00
    .byte $17            ; $B630
    .byte $CB            ; $B631
    .byte $02            ; $B632
    LDA #$82                ; $B633: A9 82
    JMP $BF14               ; $B635: 4C 14 BF
    LDA #$85                ; $B638: A9 85
    JSR $BF14               ; $B63A: 20 14 BF
    LDA #$0D                ; $B63D: A9 0D
    JSR $B29E               ; $B63F: 20 9E B2
    BRK                     ; $B642: 00
    .byte $1A            ; $B643
    .byte $CB            ; $B644
    .byte $02            ; $B645
    BRK                     ; $B646: 00
    JSR $80CB               ; $B647: 20 CB 80
    LDX #$01                ; $B64A: A2 01
    LDA #$11                ; $B64C: A9 11
    STA $7046,X             ; $B64E: 9D 46 70
    RTS                     ; $B651: 60
    LDX #$02                ; $B652: A2 02
    LDA #$11                ; $B654: A9 11
    STA $7046,X             ; $B656: 9D 46 70
    LDX #$00                ; $B659: A2 00
    LDA #$11                ; $B65B: A9 11
    STA $7046,X             ; $B65D: 9D 46 70
    LDX #$01                ; $B660: A2 01
    LDA #$11                ; $B662: A9 11
    STA $7046,X             ; $B664: 9D 46 70
    LDA #$0C                ; $B667: A9 0C
    BRK                     ; $B669: 00
    .byte $52            ; $B66A
    .byte $73            ; $B66B
    BRK                     ; $B66C: 00
    .byte $5C            ; $B66D
    .byte $33            ; $B66E
    BRK                     ; $B66F: 00
    LSR $33,X               ; $B670: 56 33
    LDX #$03                ; $B672: A2 03
    LDA #$4C                ; $B674: A9 4C
    BRK                     ; $B676: 00
    ORA $A287               ; $B677: 0D 87 A2
    BRK                     ; $B67A: 00
    LDA $44                 ; $B67B: A5 44
    CMP #$09                ; $B67D: C9 09
    BEQ $B691               ; $B67F: F0 10
    LDX #$04                ; $B681: A2 04
    CMP #$0C                ; $B683: C9 0C
    BEQ $B691               ; $B685: F0 0A
    LDX #$08                ; $B687: A2 08
    LDA $45                 ; $B689: A5 45
    CMP #$05                ; $B68B: C9 05
    BEQ $B691               ; $B68D: F0 02
    LDX #$0C                ; $B68F: A2 0C
    LDA $B6D6,X             ; $B691: BD D6 B6
    STA $055E               ; $B694: 8D 5E 05
    AND #$0F                ; $B697: 29 0F
    ORA #$80                ; $B699: 09 80
    STA $0530               ; $B69B: 8D 30 05
    LDA $B6D7,X             ; $B69E: BD D7 B6
    STA $055F               ; $B6A1: 8D 5F 05
    LDA $B6D8,X             ; $B6A4: BD D8 B6
    STA $0560               ; $B6A7: 8D 60 05
    LDA $B6D9,X             ; $B6AA: BD D9 B6
    STA $0561               ; $B6AD: 8D 61 05
    LDA #$22                ; $B6B0: A9 22
    STA $0562               ; $B6B2: 8D 62 05
    LDA #$47                ; $B6B5: A9 47
    STA $0563               ; $B6B7: 8D 63 05
    LDA #$07                ; $B6BA: A9 07
    STA $0564               ; $B6BC: 8D 64 05
    LDA #$26                ; $B6BF: A9 26
    STA $0565               ; $B6C1: 8D 65 05
    LDA #$08                ; $B6C4: A9 08
    STA $0531               ; $B6C6: 8D 31 05
    LDA $B6E6               ; $B6C9: AD E6 B6
    STA $0532               ; $B6CC: 8D 32 05
    LDA $B6E7               ; $B6CF: AD E7 B6
    STA $0533               ; $B6D2: 8D 33 05
    RTS                     ; $B6D5: 60
    .byte $02            ; $B6D6
    AND ($81,X)             ; $B6D7: 21 81
    .byte $22            ; $B6D9
    .byte $42            ; $B6DA
    AND ($41,X)             ; $B6DB: 21 41
    .byte $22            ; $B6DD
    .byte $23            ; $B6DE
    EOR ($21,X)             ; $B6DF: 41 21
    AND (tmp3,X)            ; $B6E1: 21 03
    EOR ($21,X)             ; $B6E3: 41 21
    AND ($5E,X)             ; $B6E5: 21 5E
    ORA $A2                 ; $B6E7: 05 A2
    .byte $0C            ; $B6E9
    LDA #$11                ; $B6EA: A9 11
    STA $7046,X             ; $B6EC: 9D 46 70
    JMP $BF12               ; $B6EF: 4C 12 BF
    LDA #$12                ; $B6F2: A9 12
    BRK                     ; $B6F4: 00
    ORA ($8F,X)             ; $B6F5: 01 8F
    BRK                     ; $B6F7: 00
    ORA $40CB,X             ; $B6F8: 1D CB 40
    BRK                     ; $B6FB: 00
    ASL $08CB               ; $B6FC: 0E CB 08
    LDA #$05                ; $B6FF: A9 05
    STA $44                 ; $B701: 85 44
    STA $6F60               ; $B703: 8D 60 6F
    LDA #$08                ; $B706: A9 08
    STA $45                 ; $B708: 85 45
    STA $6F80               ; $B70A: 8D 80 6F
    LDA #$00                ; $B70D: A9 00
    STA $3D                 ; $B70F: 85 3D
    BRK                     ; $B711: 00
    .byte $0F            ; $B712
    .byte $EF            ; $B713
    LDA #$88                ; $B714: A9 88
    JSR $BF14               ; $B716: 20 14 BF
    LDX #$01                ; $B719: A2 01
    LDA #$11                ; $B71B: A9 11
    STA $7046,X             ; $B71D: 9D 46 70
    JSR $B31D               ; $B720: 20 1D B3
    JSR $BF46               ; $B723: 20 46 BF
    BRK                     ; $B726: 00
    .byte $44            ; $B727
    .byte $4B            ; $B728
    JSR $D20A               ; $B729: 20 0A D2
    LDA #$00                ; $B72C: A9 00
    STA $F9                 ; $B72E: 85 F9
    STA $FA                 ; $B730: 85 FA
    RTS                     ; $B732: 60
    TYA                     ; $B733: 98
    TAX                     ; $B734: AA
    LDA $6299               ; $B735: AD 99 62
    AND #$3F                ; $B738: 29 3F
    PHA                     ; $B73A: 48
    BRK                     ; $B73B: 00
    .byte $2B            ; $B73C
    .byte $73            ; $B73D
    ORA #$80                ; $B73E: 09 80
    STA $6299               ; $B740: 8D 99 62
    BRK                     ; $B743: 00
    .byte $42            ; $B744
    .byte $73            ; $B745
    CMP #$01                ; $B746: C9 01
    BNE $B74E               ; $B748: D0 04
    BRK                     ; $B74A: 00
    ASL $40CB,X             ; $B74B: 1E CB 40
    STX $F9                 ; $B74E: 86 F9
    BRK                     ; $B750: 00
    EOR $A24B               ; $B751: 4D 4B A2
    .byte $03            ; $B754
    LDA $0554,X             ; $B755: BD 54 05
    STA $629C,X             ; $B758: 9D 9C 62
    DEX                     ; $B75B: CA
    BPL $B755               ; $B75C: 10 F7
    LDA $0558               ; $B75E: AD 58 05
    STA $62A6               ; $B761: 8D A6 62
    LDA $0559               ; $B764: AD 59 05
    STA $62A7               ; $B767: 8D A7 62
    LDX $F9                 ; $B76A: A6 F9
    LDA #$00                ; $B76C: A9 00
    BRK                     ; $B76E: 00
    EOR ($73),Y             ; $B76F: 51 73
    BRK                     ; $B771: 00
    .byte $3B            ; $B772
    .byte $EF            ; $B773
    LDY #$05                ; $B774: A0 05
    LDX $6FE6,Y             ; $B776: BE E6 6F
    JSR $B78E               ; $B779: 20 8E B7
    BRK                     ; $B77C: 00
    ORA $A287               ; $B77D: 0D 87 A2
    .byte $0B            ; $B780
    JSR $D804               ; $B781: 20 04 D8
    PLA                     ; $B784: 68
    PHA                     ; $B785: 48
    JSR $B29E               ; $B786: 20 9E B2
    BRK                     ; $B789: 00
    RTS                     ; $B78A: 60
    .byte $0B            ; $B78B
    PLA                     ; $B78C: 68
    RTS                     ; $B78D: 60
    LDA $6299               ; $B78E: AD 99 62
    AND #$7F                ; $B791: 29 7F
    CMP #$40                ; $B793: C9 40
    BCC $B79A               ; $B795: 90 03
    LDA #$0E                ; $B797: A9 0E
    RTS                     ; $B799: 60
    CMP #$08                ; $B79A: C9 08
    BCC $B7A2               ; $B79C: 90 04
    TAY                     ; $B79E: A8
    LDA $B797,Y             ; $B79F: B9 97 B7
    RTS                     ; $B7A2: 60
    JMP $2014               ; $B7A3: 4C 14 20
    LSR $20C5               ; $B7A6: 4E C5 20
    .byte $27            ; $B7A9
    CLV                     ; $B7AA: B8
    BRK                     ; $B7AB: 00
    .byte $07            ; $B7AC
    .byte $6F            ; $B7AD
    .byte $43            ; $B7AE
    LDX #$3C                ; $B7AF: A2 3C
    JSR $C90C               ; $B7B1: 20 0C C9
    JSR $C5BF               ; $B7B4: 20 BF C5
    LDA $053A               ; $B7B7: AD 3A 05
    STA $F9                 ; $B7BA: 85 F9
    BRK                     ; $B7BC: 00
    .byte $34            ; $B7BD
    .byte $4B            ; $B7BE
    BRK                     ; $B7BF: 00
    .byte $0C            ; $B7C0
    .byte $DF            ; $B7C1
    BRK                     ; $B7C2: 00
    ORA $01EB,X             ; $B7C3: 1D EB 01
    BNE $B83A               ; $B7C6: D0 72
    JSR $C5AF               ; $B7C8: 20 AF C5
    JSR $C58F               ; $B7CB: 20 8F C5
    BRK                     ; $B7CE: 00
    ASL $CB,X               ; $B7CF: 16 CB
    BPL $B7F3               ; $B7D1: 10 20
    CMP $00B8               ; $B7D3: CD B8 00
    .byte $43            ; $B7D6
    .byte $EF            ; $B7D7
    BRK                     ; $B7D8: 00
    ASL $DB,X               ; $B7D9: 16 DB
    .byte $EF            ; $B7DB
    JSR $B8DE               ; $B7DC: 20 DE B8
    BRK                     ; $B7DF: 00
    ASL                     ; $B7E0: 0A
    .byte $6F            ; $B7E1
    JSR $C5AF               ; $B7E2: 20 AF C5
    BRK                     ; $B7E5: 00
    ORA $20DF               ; $B7E6: 0D DF 20
    .byte $8F            ; $B7E9
    CMP tmp0                ; $B7EA: C5 00
    ASL $00DF               ; $B7EC: 0E DF 00
    BPL $B7D0               ; $B7EF: 10 DF
    BRK                     ; $B7F1: 00
    .byte $0F            ; $B7F2
    .byte $DF            ; $B7F3
    LDX #$00                ; $B7F4: A2 00
    BRK                     ; $B7F6: 00
    .byte $23            ; $B7F7
    .byte $EF            ; $B7F8
    LDX #$00                ; $B7F9: A2 00
    BRK                     ; $B7FB: 00
    ORA $2087               ; $B7FC: 0D 87 20
    LSR $00C5               ; $B7FF: 4E C5 00
    PLP                     ; $B802: 28
    .byte $0F            ; $B803
    LDA $0514               ; $B804: AD 14 05
    STA $05FD               ; $B807: 8D FD 05
    BRK                     ; $B80A: 00
    .byte $07            ; $B80B
    .byte $6F            ; $B80C
    .byte $43            ; $B80D
    LDX #$3C                ; $B80E: A2 3C
    JSR $C90C               ; $B810: 20 0C C9
    JSR $C5BF               ; $B813: 20 BF C5
    BRK                     ; $B816: 00
    SEC                     ; $B817: 38
    .byte $4B            ; $B818
    JSR $D218               ; $B819: 20 18 D2
    JSR $C5C5               ; $B81C: 20 C5 C5
    JSR $B8EC               ; $B81F: 20 EC B8
    BRK                     ; $B822: 00
    ASL $DB,X               ; $B823: 16 DB
    .byte $EF            ; $B825
    RTS                     ; $B826: 60
    LDA #$80                ; $B827: A9 80
    STA $0508               ; $B829: 8D 08 05
    LDX #$00                ; $B82C: A2 00
    LDA #$FF                ; $B82E: A9 FF
    STA $6F60,X             ; $B830: 9D 60 6F
    STA $7800,X             ; $B833: 9D 00 78
    INX                     ; $B836: E8
    BNE $B830               ; $B837: D0 F7
    RTS                     ; $B839: 60
    LDA #$1B                ; $B83A: A9 1B
    STA $63                 ; $B83C: 85 63
    LDA #$04                ; $B83E: A9 04
    STA $64                 ; $B840: 85 64
    LDA #$08                ; $B842: A9 08
    STA $44                 ; $B844: 85 44
    LDA #$07                ; $B846: A9 07
    STA $45                 ; $B848: 85 45
    BRK                     ; $B84A: 00
    .byte $43            ; $B84B
    .byte $EF            ; $B84C
    JSR $B8DE               ; $B84D: 20 DE B8
    BRK                     ; $B850: 00
    ASL                     ; $B851: 0A
    .byte $6F            ; $B852
    JSR $C5BF               ; $B853: 20 BF C5
    BRK                     ; $B856: 00
    .byte $07            ; $B857
    .byte $6F            ; $B858
    .byte $43            ; $B859
    BRK                     ; $B85A: 00
    DEC $004B               ; $B85B: CE 4B 00
    TXA                     ; $B85E: 8A
    .byte $FB            ; $B85F
    JSR $D218               ; $B860: 20 18 D2
    LDX #$04                ; $B863: A2 04
    LDA #$08                ; $B865: A9 08
    STA $6F66,X             ; $B867: 9D 66 6F
    STA $6FA6,X             ; $B86A: 9D A6 6F
    BRK                     ; $B86D: 00
    ASL                     ; $B86E: 0A
    .byte $6F            ; $B86F
    BRK                     ; $B870: 00
    .byte $CF            ; $B871
    .byte $4B            ; $B872
    JSR $D218               ; $B873: 20 18 D2
    LDX #$01                ; $B876: A2 01
    JSR $B8BF               ; $B878: 20 BF B8
    LDX #$02                ; $B87B: A2 02
    JSR $B8BF               ; $B87D: 20 BF B8
    LDX #$03                ; $B880: A2 03
    JSR $B8BF               ; $B882: 20 BF B8
    BRK                     ; $B885: 00
    BNE $B8D3               ; $B886: D0 4B
    LDX #$00                ; $B888: A2 00
    JSR $BF37               ; $B88A: 20 37 BF
    BRK                     ; $B88D: 00
    ASL                     ; $B88E: 0A
    .byte $6F            ; $B88F
    BRK                     ; $B890: 00
    ASL $20FB               ; $B891: 0E FB 20
    CLC                     ; $B894: 18
    .byte $D2            ; $B895
    BRK                     ; $B896: 00
    CMP ($4B),Y             ; $B897: D1 4B
    JSR $D214               ; $B899: 20 14 D2
    LDX #$17                ; $B89C: A2 17
    LDA #$15                ; $B89E: A9 15
    STA $05FD,X             ; $B8A0: 9D FD 05
    DEX                     ; $B8A3: CA
    BPL $B8A0               ; $B8A4: 10 FA
    JSR $C5B9               ; $B8A6: 20 B9 C5
    BRK                     ; $B8A9: 00
    .byte $9B            ; $B8AA
    .byte $FB            ; $B8AB
    JSR $D210               ; $B8AC: 20 10 D2
    JSR $C5C5               ; $B8AF: 20 C5 C5
    LDX #$00                ; $B8B2: A2 00
    BRK                     ; $B8B4: 00
    .byte $23            ; $B8B5
    .byte $EF            ; $B8B6
    LDX #$00                ; $B8B7: A2 00
    BRK                     ; $B8B9: 00
    ORA $4C87               ; $B8BA: 0D 87 4C
    CPX $20B8               ; $B8BD: EC B8 20
    .byte $37            ; $B8C0
    .byte $BF            ; $B8C1
    BRK                     ; $B8C2: 00
    .byte $87            ; $B8C3
    .byte $FB            ; $B8C4
    BRK                     ; $B8C5: 00
    ASL                     ; $B8C6: 0A
    .byte $6F            ; $B8C7
    LDX #$2D                ; $B8C8: A2 2D
    JMP $C90C               ; $B8CA: 4C 0C C9
    LDA #$1B                ; $B8CD: A9 1B
    STA $63                 ; $B8CF: 85 63
    LDA #$00                ; $B8D1: A9 00
    STA $64                 ; $B8D3: 85 64
    LDA #$0D                ; $B8D5: A9 0D
    STA $44                 ; $B8D7: 85 44
    LDA #$08                ; $B8D9: A9 08
    STA $45                 ; $B8DB: 85 45
    RTS                     ; $B8DD: 60
    LDX #$05                ; $B8DE: A2 05
    LDA $7020,X             ; $B8E0: BD 20 70
    ORA #$80                ; $B8E3: 09 80
    STA $7020,X             ; $B8E5: 9D 20 70
    DEX                     ; $B8E8: CA
    BPL $B8E0               ; $B8E9: 10 F5
    RTS                     ; $B8EB: 60
    LDA #$11                ; $B8EC: A9 11
    STA $44                 ; $B8EE: 85 44
    LDA #$14                ; $B8F0: A9 14
    STA $45                 ; $B8F2: 85 45
    RTS                     ; $B8F4: 60
    LDA #$11                ; $B8F5: A9 11
    BRK                     ; $B8F7: 00
    ORA ($8F,X)             ; $B8F8: 01 8F
    BRK                     ; $B8FA: 00
    ORA $08CB,X             ; $B8FB: 1D CB 08
    JMP $B31D               ; $B8FE: 4C 1D B3
    BRK                     ; $B901: 00
    .byte $13            ; $B902
    .byte $CB            ; $B903
    .byte $02            ; $B904
    LDA #$8F                ; $B905: A9 8F
    STA $6197               ; $B907: 8D 97 61
    LDA #$D0                ; $B90A: A9 D0
    STA $6198               ; $B90C: 8D 98 61
    RTS                     ; $B90F: 60
    LDA $6299               ; $B910: AD 99 62
    AND #$3F                ; $B913: 29 3F
    JSR $B29E               ; $B915: 20 9E B2
    LDA $6299               ; $B918: AD 99 62
    PHA                     ; $B91B: 48
    BRK                     ; $B91C: 00
    ASL $00DB,X             ; $B91D: 1E DB 00
    LDX #$05                ; $B920: A2 05
    JSR $BF37               ; $B922: 20 37 BF
    BRK                     ; $B925: 00
    .byte $0B            ; $B926
    .byte $DF            ; $B927
    BRK                     ; $B928: 00
    RTS                     ; $B929: 60
    .byte $0B            ; $B92A
    PLA                     ; $B92B: 68
    AND #$40                ; $B92C: 29 40
    BEQ $B936               ; $B92E: F0 06
    BRK                     ; $B930: 00
    .byte $27            ; $B931
    .byte $3B            ; $B932
    JMP $B939               ; $B933: 4C 39 B9
    BRK                     ; $B936: 00
    CLI                     ; $B937: 58
    .byte $4B            ; $B938
    BRK                     ; $B939: 00
    ASL                     ; $B93A: 0A
    .byte $6F            ; $B93B
    JMP $D218               ; $B93C: 4C 18 D2
    TYA                     ; $B93F: 98
    BRK                     ; $B940: 00
    ORA ($8F,X)             ; $B941: 01 8F
    LDX $059C               ; $B943: AE 9C 05
    TXA                     ; $B946: 8A
    SEC                     ; $B947: 38
    SBC #$06                ; $B948: E9 06
    TAX                     ; $B94A: AA
    JSR $BF37               ; $B94B: 20 37 BF
    BRK                     ; $B94E: 00
    .byte $1F            ; $B94F
    .byte $EF            ; $B950
    JMP $B323               ; $B951: 4C 23 B3
    JSR $D1F3               ; $B954: 20 F3 D1
    BRK                     ; $B957: 00
    .byte $92            ; $B958
    .byte $FB            ; $B959
    LDA system_flags        ; $B95A: A5 1F
    ORA #$08                ; $B95C: 09 08
    STA system_flags        ; $B95E: 85 1F
    JSR $B96A               ; $B960: 20 6A B9
    LDA system_flags        ; $B963: A5 1F
    AND #$F7                ; $B965: 29 F7
    STA system_flags        ; $B967: 85 1F
    RTS                     ; $B969: 60
    LDX #$01                ; $B96A: A2 01
    LDA $7006,X             ; $B96C: BD 06 70
    AND #$3C                ; $B96F: 29 3C
    JSR $C78C               ; $B971: 20 8C C7
    LDX #$00                ; $B974: A2 00
    LDA $0200,Y             ; $B976: B9 00 02
    SEC                     ; $B979: 38
    SBC $B20B,X             ; $B97A: FD 0B B2
    STA $0200,Y             ; $B97D: 99 00 02
    STA $0204,Y             ; $B980: 99 04 02
    CLC                     ; $B983: 18
    ADC #$08                ; $B984: 69 08
    STA $0208,Y             ; $B986: 99 08 02
    STA $020C,Y             ; $B989: 99 0C 02
    JSR $FF74               ; $B98C: 20 74 FF
    INX                     ; $B98F: E8
    CPX #$0C                ; $B990: E0 0C
    BCC $B976               ; $B992: 90 E2
    RTS                     ; $B994: 60
    LDA #$13                ; $B995: A9 13
    BRK                     ; $B997: 00
    ORA ($8F,X)             ; $B998: 01 8F
    BRK                     ; $B99A: 00
    ORA $04CB,X             ; $B99B: 1D CB 04
    JMP $B31D               ; $B99E: 4C 1D B3
    LDA #$14                ; $B9A1: A9 14
    BRK                     ; $B9A3: 00
    ORA ($8F,X)             ; $B9A4: 01 8F
    BRK                     ; $B9A6: 00
    ORA $01CB,X             ; $B9A7: 1D CB 01
    LDA #$11                ; $B9AA: A9 11
    LDX #$04                ; $B9AC: A2 04
    STA $7046,X             ; $B9AE: 9D 46 70
    LDX #$00                ; $B9B1: A2 00
    LDA $70E6,X             ; $B9B3: BD E6 70
    AND #$7F                ; $B9B6: 29 7F
    STA $70E6,X             ; $B9B8: 9D E6 70
    LDA #$00                ; $B9BB: A9 00
    STA $3D                 ; $B9BD: 85 3D
    STA $0530               ; $B9BF: 8D 30 05
    BRK                     ; $B9C2: 00
    .byte $0F            ; $B9C3
    .byte $EF            ; $B9C4
    JMP $B31D               ; $B9C5: 4C 1D B3
    LDA #$01                ; $B9C8: A9 01
    JSR $B29E               ; $B9CA: 20 9E B2
    LDA #$07                ; $B9CD: A9 07
    JSR $B29E               ; $B9CF: 20 9E B2
    BRK                     ; $B9D2: 00
    .byte $17            ; $B9D3
    .byte $EB            ; $B9D4
    BPL $B9A7               ; $B9D5: 10 D0
    ORA $A9                 ; $B9D7: 05 A9
    .byte $04            ; $B9D9
    JSR $B29E               ; $B9DA: 20 9E B2
    BRK                     ; $B9DD: 00
    .byte $17            ; $B9DE
    .byte $CB            ; $B9DF
    .byte $1C            ; $B9E0
    BRK                     ; $B9E1: 00
    ORA $40CB,Y             ; $B9E2: 19 CB 40
    LDX #$04                ; $B9E5: A2 04
    JSR $BF37               ; $B9E7: 20 37 BF
    LDX #$06                ; $B9EA: A2 06
    JSR $BF37               ; $B9EC: 20 37 BF
    LDX #$03                ; $B9EF: A2 03
    JSR $BF37               ; $B9F1: 20 37 BF
    BRK                     ; $B9F4: 00
    ASL                     ; $B9F5: 0A
    .byte $6F            ; $B9F6
    JMP $D20A               ; $B9F7: 4C 0A D2
    LDA #$15                ; $B9FA: A9 15
    BRK                     ; $B9FC: 00
    ORA ($8F,X)             ; $B9FD: 01 8F
    BRK                     ; $B9FF: 00
    AND #$CB                ; $BA00: 29 CB
    .byte $80            ; $BA02
    BRK                     ; $BA03: 00
    .byte $1F            ; $BA04
    .byte $EF            ; $BA05
    BRK                     ; $BA06: 00
    PHP                     ; $BA07: 08
    .byte $CF            ; $BA08
    LDY #$06                ; $BA09: A0 06
    LDA $7000,Y             ; $BA0B: B9 00 70
    ORA #$03                ; $BA0E: 09 03
    STA $7000,Y             ; $BA10: 99 00 70
    LDX $6FE0,Y             ; $BA13: BE E0 6F
    LDA #$CE                ; $BA16: A9 CE
    BRK                     ; $BA18: 00
    .byte $0B            ; $BA19
    .byte $87            ; $BA1A
    JSR $B323               ; $BA1B: 20 23 B3
    JSR $BF46               ; $BA1E: 20 46 BF
    LDA #$06                ; $BA21: A9 06
    STA $059C               ; $BA23: 8D 9C 05
    BRK                     ; $BA26: 00
    ADC $4B                 ; $BA27: 65 4B
    JSR $BACE               ; $BA29: 20 CE BA
    JMP $D20A               ; $BA2C: 4C 0A D2
    LDA #$16                ; $BA2F: A9 16
    BRK                     ; $BA31: 00
    ORA ($8F,X)             ; $BA32: 01 8F
    BRK                     ; $BA34: 00
    AND #$CB                ; $BA35: 29 CB
    RTI                     ; $BA37: 40
    BRK                     ; $BA38: 00
    .byte $1F            ; $BA39
    .byte $EF            ; $BA3A
    BRK                     ; $BA3B: 00
    PHP                     ; $BA3C: 08
    .byte $CF            ; $BA3D
    LDY #$06                ; $BA3E: A0 06
    LDA $7000,Y             ; $BA40: B9 00 70
    ORA #$03                ; $BA43: 09 03
    STA $7000,Y             ; $BA45: 99 00 70
    LDX $6FE0,Y             ; $BA48: BE E0 6F
    LDA #$C7                ; $BA4B: A9 C7
    BRK                     ; $BA4D: 00
    .byte $0B            ; $BA4E
    .byte $87            ; $BA4F
    JSR $B323               ; $BA50: 20 23 B3
    JSR $BF46               ; $BA53: 20 46 BF
    LDA #$06                ; $BA56: A9 06
    STA $059C               ; $BA58: 8D 9C 05
    BRK                     ; $BA5B: 00
    .byte $67            ; $BA5C
    .byte $4B            ; $BA5D
    JSR $BACE               ; $BA5E: 20 CE BA
    JMP $D20A               ; $BA61: 4C 0A D2
    LDA #$17                ; $BA64: A9 17
    BRK                     ; $BA66: 00
    ORA ($8F,X)             ; $BA67: 01 8F
    BRK                     ; $BA69: 00
    AND #$CB                ; $BA6A: 29 CB
    JSR $1F00               ; $BA6C: 20 00 1F
    .byte $EF            ; $BA6F
    BRK                     ; $BA70: 00
    PHP                     ; $BA71: 08
    .byte $CF            ; $BA72
    LDY #$06                ; $BA73: A0 06
    LDA $7000,Y             ; $BA75: B9 00 70
    ORA #$03                ; $BA78: 09 03
    STA $7000,Y             ; $BA7A: 99 00 70
    LDX $6FE0,Y             ; $BA7D: BE E0 6F
    LDA #$BF                ; $BA80: A9 BF
    BRK                     ; $BA82: 00
    .byte $0B            ; $BA83
    .byte $87            ; $BA84
    JSR $B323               ; $BA85: 20 23 B3
    JSR $BF46               ; $BA88: 20 46 BF
    LDA #$06                ; $BA8B: A9 06
    STA $059C               ; $BA8D: 8D 9C 05
    BRK                     ; $BA90: 00
    PLA                     ; $BA91: 68
    .byte $4B            ; $BA92
    JSR $BACE               ; $BA93: 20 CE BA
    JMP $D20A               ; $BA96: 4C 0A D2
    LDA #$18                ; $BA99: A9 18
    BRK                     ; $BA9B: 00
    ORA ($8F,X)             ; $BA9C: 01 8F
    BRK                     ; $BA9E: 00
    AND #$CB                ; $BA9F: 29 CB
    BPL $BAA3               ; $BAA1: 10 00
    .byte $1F            ; $BAA3
    .byte $EF            ; $BAA4
    BRK                     ; $BAA5: 00
    PHP                     ; $BAA6: 08
    .byte $CF            ; $BAA7
    LDY #$06                ; $BAA8: A0 06
    LDA $7000,Y             ; $BAAA: B9 00 70
    ORA #$03                ; $BAAD: 09 03
    STA $7000,Y             ; $BAAF: 99 00 70
    LDX $6FE0,Y             ; $BAB2: BE E0 6F
    LDA #$EB                ; $BAB5: A9 EB
    BRK                     ; $BAB7: 00
    .byte $0B            ; $BAB8
    .byte $87            ; $BAB9
    JSR $B323               ; $BABA: 20 23 B3
    JSR $BF46               ; $BABD: 20 46 BF
    LDA #$06                ; $BAC0: A9 06
    STA $059C               ; $BAC2: 8D 9C 05
    BRK                     ; $BAC5: 00
    ADC #$4B                ; $BAC6: 69 4B
    JSR $BACE               ; $BAC8: 20 CE BA
    JMP $D20A               ; $BACB: 4C 0A D2
    BRK                     ; $BACE: 00
    STY $FB                 ; $BACF: 84 FB
    LDX #$0A                ; $BAD1: A2 0A
    JSR $C90C               ; $BAD3: 20 0C C9
    BRK                     ; $BAD6: 00
    TXA                     ; $BAD7: 8A
    .byte $FB            ; $BAD8
    LDX #$0A                ; $BAD9: A2 0A
    JSR $C90C               ; $BADB: 20 0C C9
    BRK                     ; $BADE: 00
    STA ($FB,X)             ; $BADF: 81 FB
    BRK                     ; $BAE1: 00
    ROR $4B                 ; $BAE2: 66 4B
    RTS                     ; $BAE4: 60
    LDX #$02                ; $BAE5: A2 02
    LDA $7006,X             ; $BAE7: BD 06 70
    ORA #$03                ; $BAEA: 09 03
    STA $7006,X             ; $BAEC: 9D 06 70
    BRK                     ; $BAEF: 00
    ASL                     ; $BAF0: 0A
    .byte $6F            ; $BAF1
    BRK                     ; $BAF2: 00
    ADC $204B               ; $BAF3: 6D 4B 20
    CLC                     ; $BAF6: 18
    .byte $D2            ; $BAF7
    LDA #$11                ; $BAF8: A9 11
    LDX #$00                ; $BAFA: A2 00
    STA $7046,X             ; $BAFC: 9D 46 70
    JMP $BF12               ; $BAFF: 4C 12 BF
    BRK                     ; $BB02: 00
    JSR $08EB               ; $BB03: 20 EB 08
    BNE $BB3E               ; $BB06: D0 36
    LDX #$02                ; $BB08: A2 02
    LDA $7006,X             ; $BB0A: BD 06 70
    AND #$FC                ; $BB0D: 29 FC
    ORA $3D                 ; $BB0F: 05 3D
    EOR #$02                ; $BB11: 49 02
    STA $7006,X             ; $BB13: 9D 06 70
    JSR $BF46               ; $BB16: 20 46 BF
    BRK                     ; $BB19: 00
    ROR $004B               ; $BB1A: 6E 4B 00
    .byte $6F            ; $BB1D
    .byte $4B            ; $BB1E
    LDA #$0F                ; $BB1F: A9 0F
    JSR $B29E               ; $BB21: 20 9E B2
    LDX #$00                ; $BB24: A2 00
    JSR $BF37               ; $BB26: 20 37 BF
    BRK                     ; $BB29: 00
    ASL                     ; $BB2A: 0A
    .byte $6F            ; $BB2B
    BRK                     ; $BB2C: 00
    BVS $BB7A               ; $BB2D: 70 4B
    BRK                     ; $BB2F: 00
    ADC ($4B),Y             ; $BB30: 71 4B
    JSR $D20A               ; $BB32: 20 0A D2
    LDA #$00                ; $BB35: A9 00
    STA $0530               ; $BB37: 8D 30 05
    BRK                     ; $BB3A: 00
    JSR $08CB               ; $BB3B: 20 CB 08
    RTS                     ; $BB3E: 60
    JSR $BF46               ; $BB3F: 20 46 BF
    BRK                     ; $BB42: 00
    ROR                     ; $BB43: 6A
    .byte $4B            ; $BB44
    JSR $D218               ; $BB45: 20 18 D2
    LDA #$19                ; $BB48: A9 19
    BRK                     ; $BB4A: 00
    ORA ($8F,X)             ; $BB4B: 01 8F
    BRK                     ; $BB4D: 00
    ROL $CB                 ; $BB4E: 26 CB
    JSR $6F00               ; $BB50: 20 00 6F
    .byte $33            ; $BB53
    LDA #$00                ; $BB54: A9 00
    STA $62ED               ; $BB56: 8D ED 62
    STA $65                 ; $BB59: 85 65
    LDA #$15                ; $BB5B: A9 15
    STA $44                 ; $BB5D: 85 44
    LDA #$05                ; $BB5F: A9 05
    STA $45                 ; $BB61: 85 45
    LDA system_flags        ; $BB63: A5 1F
    ORA #$08                ; $BB65: 09 08
    STA system_flags        ; $BB67: 85 1F
    LDX #$00                ; $BB69: A2 00
    STX $0513               ; $BB6B: 8E 13 05
    JSR $FF74               ; $BB6E: 20 74 FF
    BRK                     ; $BB71: 00
    .byte $1F            ; $BB72
    .byte $EF            ; $BB73
    BRK                     ; $BB74: 00
    .byte $03            ; $BB75
    .byte $EF            ; $BB76
    LDX #$02                ; $BB77: A2 02
    LDA $44                 ; $BB79: A5 44
    STA $6F60,X             ; $BB7B: 9D 60 6F
    STA $6FA0,X             ; $BB7E: 9D A0 6F
    LDA #$00                ; $BB81: A9 00
    STA $7020,X             ; $BB83: 9D 20 70
    STA $7000,X             ; $BB86: 9D 00 70
    LDA #$80                ; $BB89: A9 80
    STA $7023,X             ; $BB8B: 9D 23 70
    DEX                     ; $BB8E: CA
    BPL $BB79               ; $BB8F: 10 E8
    LDY $45                 ; $BB91: A4 45
    STY $6F80               ; $BB93: 8C 80 6F
    STY $6FC0               ; $BB96: 8C C0 6F
    INY                     ; $BB99: C8
    STY $6F81               ; $BB9A: 8C 81 6F
    STY $6FC1               ; $BB9D: 8C C1 6F
    INY                     ; $BBA0: C8
    STY $6F82               ; $BBA1: 8C 82 6F
    STY $6FC2               ; $BBA4: 8C C2 6F
    LDX #$00                ; $BBA7: A2 00
    LDA $615C               ; $BBA9: AD 5C 61
    AND #$01                ; $BBAC: 29 01
    ASL                     ; $BBAE: 0A
    ASL                     ; $BBAF: 0A
    ASL                     ; $BBB0: 0A
    STX $6FE0               ; $BBB1: 8E E0 6F
    BRK                     ; $BBB4: 00
    ORA $A287               ; $BBB5: 0D 87 A2
    ORA ($A9,X)             ; $BBB8: 01 A9
    ROL $8E                 ; $BBBA: 26 8E
    SBC ($6F,X)             ; $BBBC: E1 6F
    BRK                     ; $BBBE: 00
    ORA $A287               ; $BBBF: 0D 87 A2
    .byte $02            ; $BBC2
    LDA #$32                ; $BBC3: A9 32
    STX $6FE2               ; $BBC5: 8E E2 6F
    BRK                     ; $BBC8: 00
    ORA $2087               ; $BBC9: 0D 87 20
    ORA ($E5,X)             ; $BBCC: 01 E5
    BRK                     ; $BBCE: 00
    ASL                     ; $BBCF: 0A
    .byte $6F            ; $BBD0
    JSR $C5BF               ; $BBD1: 20 BF C5
    JSR $BF46               ; $BBD4: 20 46 BF
    BRK                     ; $BBD7: 00
    .byte $6B            ; $BBD8
    .byte $4B            ; $BBD9
    LDA #$28                ; $BBDA: A9 28
    STA $0F                 ; $BBDC: 85 0F
    JSR $BCFF               ; $BBDE: 20 FF BC
    JSR $BD54               ; $BBE1: 20 54 BD
    JSR $BD75               ; $BBE4: 20 75 BD
    LDX $0F                 ; $BBE7: A6 0F
    BEQ $BC09               ; $BBE9: F0 1E
    LDX #$03                ; $BBEB: A2 03
    JSR $C90C               ; $BBED: 20 0C C9
    JSR $BD83               ; $BBF0: 20 83 BD
    JSR $BD67               ; $BBF3: 20 67 BD
    LDA $0F                 ; $BBF6: A5 0F
    SEC                     ; $BBF8: 38
    SBC #$14                ; $BBF9: E9 14
    BCS $BBFF               ; $BBFB: B0 02
    LDA #$00                ; $BBFD: A9 00
    TAX                     ; $BBFF: AA
    INX                     ; $BC00: E8
    JSR $C90C               ; $BC01: 20 0C C9
    DEC $0F                 ; $BC04: C6 0F
    JMP $BBE1               ; $BC06: 4C E1 BB
    JSR $BD83               ; $BC09: 20 83 BD
    JSR $FF74               ; $BC0C: 20 74 FF
    LDX #$02                ; $BC0F: A2 02
    JSR $BF37               ; $BC11: 20 37 BF
    LDX #$03                ; $BC14: A2 03
    JSR $BF37               ; $BC16: 20 37 BF
    LDX #$00                ; $BC19: A2 00
    JSR $BF37               ; $BC1B: 20 37 BF
    LDX #$01                ; $BC1E: A2 01
    JSR $BF37               ; $BC20: 20 37 BF
    BRK                     ; $BC23: 00
    .byte $83            ; $BC24
    .byte $4B            ; $BC25
    JSR $D20A               ; $BC26: 20 0A D2
    BRK                     ; $BC29: 00
    ASL $BF                 ; $BC2A: 06 BF
    LDA #$46                ; $BC2C: A9 46
    STA $63                 ; $BC2E: 85 63
    LDA #$03                ; $BC30: A9 03
    STA $64                 ; $BC32: 85 64
    LDA #$16                ; $BC34: A9 16
    STA $44                 ; $BC36: 85 44
    LDA #$0B                ; $BC38: A9 0B
    STA $45                 ; $BC3A: 85 45
    BRK                     ; $BC3C: 00
    ORA ($87,X)             ; $BC3D: 01 87
    LDA #$00                ; $BC3F: A9 00
    JSR $BCEF               ; $BC41: 20 EF BC
    TXA                     ; $BC44: 8A
    PHA                     ; $BC45: 48
    LDA #$07                ; $BC46: A9 07
    JSR $BCEF               ; $BC48: 20 EF BC
    TXA                     ; $BC4B: 8A
    PHA                     ; $BC4C: 48
    LDA #$06                ; $BC4D: A9 06
    JSR $BCEF               ; $BC4F: 20 EF BC
    TXA                     ; $BC52: 8A
    PHA                     ; $BC53: 48
    LDA #$03                ; $BC54: A9 03
    JSR $BCEF               ; $BC56: 20 EF BC
    STX $71                 ; $BC59: 86 71
    PLA                     ; $BC5B: 68
    STA $70                 ; $BC5C: 85 70
    PLA                     ; $BC5E: 68
    STA $6F                 ; $BC5F: 85 6F
    PLA                     ; $BC61: 68
    STA $6E                 ; $BC62: 85 6E
    BRK                     ; $BC64: 00
    LSR $A233,X             ; $BC65: 5E 33 A2
    BRK                     ; $BC68: 00
    BRK                     ; $BC69: 00
    LSR $93                 ; $BC6A: 46 93
    .byte $07            ; $BC6C
    BCS $BC74               ; $BC6D: B0 05
    LDA #$00                ; $BC6F: A9 00
    BRK                     ; $BC71: 00
    .byte $12            ; $BC72
    .byte $2F            ; $BC73
    BRK                     ; $BC74: 00
    .byte $62            ; $BC75
    .byte $33            ; $BC76
    CMP #$09                ; $BC77: C9 09
    BCC $BC8A               ; $BC79: 90 0F
    TAX                     ; $BC7B: AA
    DEX                     ; $BC7C: CA
    BRK                     ; $BC7D: 00
    .byte $2B            ; $BC7E
    .byte $73            ; $BC7F
    CMP #$08                ; $BC80: C9 08
    BCS $BC87               ; $BC82: B0 03
    DEX                     ; $BC84: CA
    BPL $BC7D               ; $BC85: 10 F6
    BRK                     ; $BC87: 00
    EOR ($73),Y             ; $BC88: 51 73
    BRK                     ; $BC8A: 00
    .byte $3B            ; $BC8B
    .byte $EF            ; $BC8C
    BRK                     ; $BC8D: 00
    LSR $33,X               ; $BC8E: 56 33
    LDA #$07                ; $BC90: A9 07
    BRK                     ; $BC92: 00
    .byte $12            ; $BC93
    .byte $2F            ; $BC94
    LDA #$00                ; $BC95: A9 00
    BRK                     ; $BC97: 00
    AND ($EF),Y             ; $BC98: 31 EF
    LDA #$01                ; $BC9A: A9 01
    STA $65                 ; $BC9C: 85 65
    JSR $C5BF               ; $BC9E: 20 BF C5
    LDA system_flags        ; $BCA1: A5 1F
    AND #$F7                ; $BCA3: 29 F7
    STA system_flags        ; $BCA5: 85 1F
    BRK                     ; $BCA7: 00
    ORA $80CB               ; $BCA8: 0D CB 80
    JSR $BF46               ; $BCAB: 20 46 BF
    BRK                     ; $BCAE: 00
    BCS $BCFC               ; $BCAF: B0 4B
    LDY #$10                ; $BCB1: A0 10
    BRK                     ; $BCB3: 00
    .byte $03            ; $BCB4
    .byte $4F            ; $BCB5
    LDX #$00                ; $BCB6: A2 00
    BRK                     ; $BCB8: 00
    LSR $93                 ; $BCB9: 46 93
    .byte $07            ; $BCBB
    TXA                     ; $BCBC: 8A
    PHA                     ; $BCBD: 48
    BCS $BCD3               ; $BCBE: B0 13
    STX $F9                 ; $BCC0: 86 F9
    BRK                     ; $BCC2: 00
    LDA ($4B),Y             ; $BCC3: B1 4B
    PLA                     ; $BCC5: 68
    PHA                     ; $BCC6: 48
    TAX                     ; $BCC7: AA
    LDA #$00                ; $BCC8: A9 00
    BRK                     ; $BCCA: 00
    .byte $12            ; $BCCB
    .byte $2F            ; $BCCC
    BRK                     ; $BCCD: 00
    .byte $3B            ; $BCCE
    .byte $EF            ; $BCCF
    BRK                     ; $BCD0: 00
    .byte $27            ; $BCD1
    .byte $0F            ; $BCD2
    PLA                     ; $BCD3: 68
    TAX                     ; $BCD4: AA
    INX                     ; $BCD5: E8
    CPX #$08                ; $BCD6: E0 08
    BCC $BCB8               ; $BCD8: 90 DE
    LDA #$00                ; $BCDA: A9 00
    STA $F9                 ; $BCDC: 85 F9
    STA $FA                 ; $BCDE: 85 FA
    BRK                     ; $BCE0: 00
    CPY #$4B                ; $BCE1: C0 4B
    BRK                     ; $BCE3: 00
    .byte $B2            ; $BCE4
    .byte $4B            ; $BCE5
    JSR $D20A               ; $BCE6: 20 0A D2
    LDA #$00                ; $BCE9: A9 00
    STA $0530               ; $BCEB: 8D 30 05
    RTS                     ; $BCEE: 60
    STA tmp0                ; $BCEF: 85 00
    LDX #$00                ; $BCF1: A2 00
    BRK                     ; $BCF3: 00
    .byte $2B            ; $BCF4
    .byte $73            ; $BCF5
    CMP tmp0                ; $BCF6: C5 00
    BEQ $BCFE               ; $BCF8: F0 04
    INX                     ; $BCFA: E8
    JMP $BCF3               ; $BCFB: 4C F3 BC
    RTS                     ; $BCFE: 60
    LDA #$0A                ; $BCFF: A9 0A
    JSR $D864               ; $BD01: 20 64 D8
    LDA #$02                ; $BD04: A9 02
    LDX #$00                ; $BD06: A2 00
    JSR $D876               ; $BD08: 20 76 D8
    LDA tmp0                ; $BD0B: A5 00
    STA $7F71               ; $BD0D: 8D 71 7F
    LDA tmp1                ; $BD10: A5 01
    STA $7F72               ; $BD12: 8D 72 7F
    LDA tmp2                ; $BD15: A5 02
    STA $7F75               ; $BD17: 8D 75 7F
    LDA tmp3                ; $BD1A: A5 03
    STA $7F76               ; $BD1C: 8D 76 7F
    LDA ptr0_lo             ; $BD1F: A5 04
    STA $7F79               ; $BD21: 8D 79 7F
    LDA ptr0_hi             ; $BD24: A5 05
    STA $7F7A               ; $BD26: 8D 7A 7F
    LDA $06                 ; $BD29: A5 06
    STA $7F7D               ; $BD2B: 8D 7D 7F
    LDA $07                 ; $BD2E: A5 07
    STA $7F7E               ; $BD30: 8D 7E 7F
    LDA #$43                ; $BD33: A9 43
    STA $7F70               ; $BD35: 8D 70 7F
    STA $7F74               ; $BD38: 8D 74 7F
    LDA #$4B                ; $BD3B: A9 4B
    STA $7F78               ; $BD3D: 8D 78 7F
    STA $7F7C               ; $BD40: 8D 7C 7F
    LDA #$78                ; $BD43: A9 78
    STA $7F73               ; $BD45: 8D 73 7F
    STA $7F7B               ; $BD48: 8D 7B 7F
    LDA #$80                ; $BD4B: A9 80
    STA $7F77               ; $BD4D: 8D 77 7F
    STA $7F7F               ; $BD50: 8D 7F 7F
    RTS                     ; $BD53: 60
    LDX #$30                ; $BD54: A2 30
    LDA $0200,X             ; $BD56: BD 00 02
    STA $7F00,X             ; $BD59: 9D 00 7F
    LDA #$F7                ; $BD5C: A9 F7
    STA $0200,X             ; $BD5E: 9D 00 02
    INX                     ; $BD61: E8
    CPX #$70                ; $BD62: E0 70
    BCC $BD56               ; $BD64: 90 F0
    RTS                     ; $BD66: 60
    LDX #$30                ; $BD67: A2 30
    LDA $7F00,X             ; $BD69: BD 00 7F
    STA $0200,X             ; $BD6C: 9D 00 02
    INX                     ; $BD6F: E8
    CPX #$70                ; $BD70: E0 70
    BCC $BD69               ; $BD72: 90 F5
    RTS                     ; $BD74: 60
    LDX #$70                ; $BD75: A2 70
    LDA $7F00,X             ; $BD77: BD 00 7F
    STA $0200,X             ; $BD7A: 9D 00 02
    INX                     ; $BD7D: E8
    CPX #$80                ; $BD7E: E0 80
    BCC $BD77               ; $BD80: 90 F5
    RTS                     ; $BD82: 60
    LDX #$70                ; $BD83: A2 70
    LDA $0200,X             ; $BD85: BD 00 02
    STA $7F00,X             ; $BD88: 9D 00 7F
    LDA #$F7                ; $BD8B: A9 F7
    STA $0200,X             ; $BD8D: 9D 00 02
    INX                     ; $BD90: E8
    CPX #$80                ; $BD91: E0 80
    BCC $BD85               ; $BD93: 90 F0
    RTS                     ; $BD95: 60
    LDA #$00                ; $BD96: A9 00
    STA $64                 ; $BD98: 85 64
    LDA #$10                ; $BD9A: A9 10
    STA $44                 ; $BD9C: 85 44
    LDA #$09                ; $BD9E: A9 09
    STA $45                 ; $BDA0: 85 45
    LDA #$02                ; $BDA2: A9 02
    BRK                     ; $BDA4: 00
    AND ($EF),Y             ; $BDA5: 31 EF
    LDA #$80                ; $BDA7: A9 80
    STA $7020               ; $BDA9: 8D 20 70
    STA $7021               ; $BDAC: 8D 21 70
    BRK                     ; $BDAF: 00
    ASL                     ; $BDB0: 0A
    .byte $6F            ; $BDB1
    JSR $C5BF               ; $BDB2: 20 BF C5
    LDA #$01                ; $BDB5: A9 01
    STA $0515               ; $BDB7: 8D 15 05
    LDA #$06                ; $BDBA: A9 06
    STA $0534               ; $BDBC: 8D 34 05
    JSR $BF12               ; $BDBF: 20 12 BF
    BRK                     ; $BDC2: 00
    .byte $0F            ; $BDC3
    .byte $CB            ; $BDC4
    BPL $BDC7               ; $BDC5: 10 00
    ORA $80CB               ; $BDC7: 0D CB 80
    BRK                     ; $BDCA: 00
    .byte $13            ; $BDCB
    .byte $CB            ; $BDCC
    ORA ($20,X)             ; $BDCD: 01 20
    NOP                     ; $BDCF: EA
    CPY $0060               ; $BDD0: CC 60 00
    .byte $62            ; $BDD3
    .byte $23            ; $BDD4
    RTI                     ; $BDD5: 40
    STA tmp0                ; $BDD6: 85 00
    LDX #$00                ; $BDD8: A2 00
    BRK                     ; $BDDA: 00
    .byte $2B            ; $BDDB
    .byte $73            ; $BDDC
    BEQ $BDE5               ; $BDDD: F0 06
    INX                     ; $BDDF: E8
    CPX tmp0                ; $BDE0: E4 00
    BCC $BDDA               ; $BDE2: 90 F6
    RTS                     ; $BDE4: 60
    TXA                     ; $BDE5: 8A
    PHA                     ; $BDE6: 48
    BRK                     ; $BDE7: 00
    ORA ($6F,X)             ; $BDE8: 01 6F
    .byte $0B            ; $BDEA
    PLA                     ; $BDEB: 68
    STA $6E                 ; $BDEC: 85 6E
    JSR $D210               ; $BDEE: 20 10 D2
    LDY #$0A                ; $BDF1: A0 0A
    TYA                     ; $BDF3: 98
    PHA                     ; $BDF4: 48
    LDX #$0A                ; $BDF5: A2 0A
    TXA                     ; $BDF7: 8A
    PHA                     ; $BDF8: 48
    LDA #$00                ; $BDF9: A9 00
    STA $70                 ; $BDFB: 85 70
    STA $71                 ; $BDFD: 85 71
    LDA #$64                ; $BDFF: A9 64
    STA $6F                 ; $BE01: 85 6F
    BRK                     ; $BE03: 00
    .byte $27            ; $BE04
    .byte $33            ; $BE05
    BRK                     ; $BE06: 00
    STA $FB                 ; $BE07: 85 FB
    JSR $BE1F               ; $BE09: 20 1F BE
    PLA                     ; $BE0C: 68
    TAX                     ; $BE0D: AA
    DEX                     ; $BE0E: CA
    BNE $BDF7               ; $BE0F: D0 E6
    PLA                     ; $BE11: 68
    TAY                     ; $BE12: A8
    DEY                     ; $BE13: 88
    BNE $BDF3               ; $BE14: D0 DD
    JSR $D20A               ; $BE16: 20 0A D2
    BRK                     ; $BE19: 00
    PHP                     ; $BE1A: 08
    .byte $2F            ; $BE1B
    JMP $D1F3               ; $BE1C: 4C F3 D1
    LDA #$13                ; $BE1F: A9 13
    STA tmp0                ; $BE21: 85 00
    LDA #$1A                ; $BE23: A9 1A
    STA tmp1                ; $BE25: 85 01
    JSR $C662               ; $BE27: 20 62 C6
    BRK                     ; $BE2A: 00
    AND $33                 ; $BE2B: 25 33
    BRK                     ; $BE2D: 00
    .byte $0C            ; $BE2E
    .byte $6F            ; $BE2F
    LDX $050A               ; $BE30: AE 0A 05
    LDA $1C                 ; $BE33: A5 1C
    ORA #$80                ; $BE35: 09 80
    STA $0300,X             ; $BE37: 9D 00 03
    LDA #$08                ; $BE3A: A9 08
    STA $0301,X             ; $BE3C: 9D 01 03
    LDA $1D                 ; $BE3F: A5 1D
    STA $0302,X             ; $BE41: 9D 02 03
    LDY #$00                ; $BE44: A0 00
    LDA $0000,Y             ; $BE46: B9 00 00
    STA $0303,X             ; $BE49: 9D 03 03
    INX                     ; $BE4C: E8
    INY                     ; $BE4D: C8
    CPX #$08                ; $BE4E: E0 08
    BCC $BE46               ; $BE50: 90 F4
    INC $050B               ; $BE52: EE 0B 05
    JMP $C62D               ; $BE55: 4C 2D C6
    LDA #$83                ; $BE58: A9 83
    JMP $BF14               ; $BE5A: 4C 14 BF
    JSR $BE90               ; $BE5D: 20 90 BE
    JSR $BE90               ; $BE60: 20 90 BE
    JSR $BE90               ; $BE63: 20 90 BE
    JSR $BE90               ; $BE66: 20 90 BE
    JSR $BE90               ; $BE69: 20 90 BE
    JSR $C5C5               ; $BE6C: 20 C5 C5
    LDA #$2C                ; $BE6F: A9 2C
    STA $63                 ; $BE71: 85 63
    LDA #$00                ; $BE73: A9 00
    STA $64                 ; $BE75: 85 64
    LDA #$0B                ; $BE77: A9 0B
    STA $44                 ; $BE79: 85 44
    STA $45                 ; $BE7B: 85 45
    BRK                     ; $BE7D: 00
    AND ($EF),Y             ; $BE7E: 31 EF
    LDX #$05                ; $BE80: A2 05
    LDA #$80                ; $BE82: A9 80
    STA $7020,X             ; $BE84: 9D 20 70
    DEX                     ; $BE87: CA
    BPL $BE82               ; $BE88: 10 F8
    BRK                     ; $BE8A: 00
    ASL                     ; $BE8B: 0A
    .byte $6F            ; $BE8C
    JMP $C5BF               ; $BE8D: 4C BF C5
    BRK                     ; $BE90: 00
    STA $FB,X               ; $BE91: 95 FB
    LDX #$10                ; $BE93: A2 10
    JMP $BEF2               ; $BE95: 4C F2 BE
    JSR $C5C5               ; $BE98: 20 C5 C5
    LDA #$48                ; $BE9B: A9 48
    STA $63                 ; $BE9D: 85 63
    LDA #$04                ; $BE9F: A9 04
    STA $64                 ; $BEA1: 85 64
    LDA #$07                ; $BEA3: A9 07
    STA $44                 ; $BEA5: 85 44
    LDA #$0B                ; $BEA7: A9 0B
    STA $45                 ; $BEA9: 85 45
    LDA #$02                ; $BEAB: A9 02
    BRK                     ; $BEAD: 00
    AND ($EF),Y             ; $BEAE: 31 EF
    JMP $C5BF               ; $BEB0: 4C BF C5
    LDA #$1A                ; $BEB3: A9 1A
    BRK                     ; $BEB5: 00
    ORA ($8F,X)             ; $BEB6: 01 8F
    BRK                     ; $BEB8: 00
    .byte $1F            ; $BEB9
    .byte $EF            ; $BEBA
    BRK                     ; $BEBB: 00
    PHP                     ; $BEBC: 08
    .byte $CF            ; $BEBD
    LDX #$02                ; $BEBE: A2 02
    JSR $BF37               ; $BEC0: 20 37 BF
    LDX #$01                ; $BEC3: A2 01
    JSR $BF37               ; $BEC5: 20 37 BF
    BRK                     ; $BEC8: 00
    .byte $03            ; $BEC9
    .byte $EF            ; $BECA
    JSR $C5BF               ; $BECB: 20 BF C5
    LDA #$10                ; $BECE: A9 10
    JMP $AD5F               ; $BED0: 4C 5F AD
    BRK                     ; $BED3: 00
    ORA $0087               ; $BED4: 0D 87 00
    STA $FB,X               ; $BED7: 95 FB
    LDX $29                 ; $BED9: A6 29
    JSR $BEF2               ; $BEDB: 20 F2 BE
    LDA #$1D                ; $BEDE: A9 1D
    SEC                     ; $BEE0: 38
    SBC $29                 ; $BEE1: E5 29
    ASL                     ; $BEE3: 0A
    TAX                     ; $BEE4: AA
    JSR $C90C               ; $BEE5: 20 0C C9
    LDA $29                 ; $BEE8: A5 29
    CLC                     ; $BEEA: 18
    ADC #$04                ; $BEEB: 69 04
    STA $29                 ; $BEED: 85 29
    RTS                     ; $BEEF: 60
    LDX #$1C                ; $BEF0: A2 1C
    TXA                     ; $BEF2: 8A
    LSR                     ; $BEF3: 4A
    LSR                     ; $BEF4: 4A
    STA $51                 ; $BEF5: 85 51
    JSR $BEFE               ; $BEF7: 20 FE BE
    DEX                     ; $BEFA: CA
    BNE $BEF2               ; $BEFB: D0 F5
    RTS                     ; $BEFD: 60
    LDA $0509               ; $BEFE: AD 09 05
    PHA                     ; $BF01: 48
    CLC                     ; $BF02: 18
    ADC $51                 ; $BF03: 65 51
    STA $0509               ; $BF05: 8D 09 05
    JSR $FF74               ; $BF08: 20 74 FF
    PLA                     ; $BF0B: 68
    STA $0509               ; $BF0C: 8D 09 05
    JMP $FF74               ; $BF0F: 4C 74 FF
    LDA #$8F                ; $BF12: A9 8F
    LDX #$01                ; $BF14: A2 01
    STA $0530               ; $BF16: 8D 30 05
    STX $0531               ; $BF19: 8E 31 05
    LDA #$00                ; $BF1C: A9 00
    STA $0533               ; $BF1E: 8D 33 05
    STA $0532               ; $BF21: 8D 32 05
    RTS                     ; $BF24: 60
    STA $6F66,X             ; $BF25: 9D 66 6F
    STA $6FA6,X             ; $BF28: 9D A6 6F
    TYA                     ; $BF2B: 98
    STA $6F86,X             ; $BF2C: 9D 86 6F
    STA $6FC6,X             ; $BF2F: 9D C6 6F
    RTS                     ; $BF32: 60
    LDA #$80                ; $BF33: A9 80
    BNE $BF39               ; $BF35: D0 02
    LDA #$81                ; $BF37: A9 81
    STA $6F66,X             ; $BF39: 9D 66 6F
    STA $6FA6,X             ; $BF3C: 9D A6 6F
    STA $6F86,X             ; $BF3F: 9D 86 6F
    STA $6FC6,X             ; $BF42: 9D C6 6F
    RTS                     ; $BF45: 60
    BRK                     ; $BF46: 00
    .byte $07            ; $BF47
    .byte $6F            ; $BF48
    .byte $43            ; $BF49
    RTS                     ; $BF4A: 60
    ROR $CAAD               ; $BF4B: 6E AD CA
    LDA $ADF0               ; $BF4E: AD F0 AD
    .byte $FC            ; $BF51
    LDX $AFF4               ; $BF52: AE F4 AF
    BMI $BF07               ; $BF55: 30 B0
    LSR $B9B0,X             ; $BF57: 5E B0 B9
    BCS $BF24               ; $BF5A: B0 C8
    BCS $BF5A               ; $BF5C: B0 FC
    BCS $BFB9               ; $BF5E: B0 59
    LDA ($5A),Y             ; $BF60: B1 5A
    LDA ($77),Y             ; $BF62: B1 77
    LDA ($4A),Y             ; $BF64: B1 4A
    .byte $B2            ; $BF66
    .byte $14            ; $BF67
    .byte $B3            ; $BF68
    BIT $72B3               ; $BF69: 2C B3 72
    .byte $B3            ; $BF6C
    TYA                     ; $BF6D: 98
    .byte $B3            ; $BF6E
    TSX                     ; $BF6F: BA
    .byte $B3            ; $BF70
    .byte $0B            ; $BF71
    LDA $C2,X               ; $BF72: B5 C2
    LDA $14,X               ; $BF74: B5 14
    LDX $23,Y               ; $BF76: B6 23
    LDX $38,Y               ; $BF78: B6 38
    LDX $52,Y               ; $BF7A: B6 52
    LDX $E8,Y               ; $BF7C: B6 E8
    LDX $F2,Y               ; $BF7E: B6 F2
    LDX $33,Y               ; $BF80: B6 33
    .byte $B7            ; $BF82
    LDA $B7                 ; $BF83: A5 B7
    SBC $B8,X               ; $BF85: F5 B8
    ORA ($B9,X)             ; $BF87: 01 B9
    BPL $BF44               ; $BF89: 10 B9
    .byte $3F            ; $BF8B
    LDA $B954,Y             ; $BF8C: B9 54 B9
    STA $B9,X               ; $BF8F: 95 B9
    LDA ($B9,X)             ; $BF91: A1 B9
    INY                     ; $BF93: C8
    LDA $B9FA,Y             ; $BF94: B9 FA B9
    .byte $2F            ; $BF97
    TSX                     ; $BF98: BA
    .byte $64            ; $BF99
    TSX                     ; $BF9A: BA
    STA $E5BA,Y             ; $BF9B: 99 BA E5
    TSX                     ; $BF9E: BA
    .byte $02            ; $BF9F
    .byte $BB            ; $BFA0
    .byte $3F            ; $BFA1
    .byte $BB            ; $BFA2
    STX $BD,Y               ; $BFA3: 96 BD
    .byte $D2            ; $BFA5
    LDA $BE58,X             ; $BFA6: BD 58 BE
    EOR $98BE,X             ; $BFA9: 5D BE 98
    LDX $BEB3,Y             ; $BFAC: BE B3 BE
    .byte $FF            ; $BFAF
    .byte $FF            ; $BFB0
    .byte $FF            ; $BFB1
    .byte $FF            ; $BFB2
    .byte $FF            ; $BFB3
    .byte $FF            ; $BFB4
    .byte $FF            ; $BFB5
    .byte $FF            ; $BFB6
    .byte $FF            ; $BFB7
    .byte $FF            ; $BFB8
    .byte $FF            ; $BFB9
    .byte $FF            ; $BFBA
    .byte $FF            ; $BFBB
    .byte $FF            ; $BFBC
    .byte $FF            ; $BFBD
    .byte $FF            ; $BFBE
    .byte $FF            ; $BFBF
    .byte $FF            ; $BFC0
    .byte $FF            ; $BFC1
    .byte $FF            ; $BFC2
    .byte $FF            ; $BFC3
    .byte $FF            ; $BFC4
    .byte $FF            ; $BFC5
    .byte $FF            ; $BFC6
    .byte $FF            ; $BFC7
    .byte $FF            ; $BFC8
    .byte $FF            ; $BFC9
    .byte $FF            ; $BFCA
    .byte $FF            ; $BFCB
    .byte $FF            ; $BFCC
    .byte $FF            ; $BFCD
    .byte $FF            ; $BFCE
    .byte $FF            ; $BFCF
    .byte $FF            ; $BFD0
    .byte $FF            ; $BFD1
    .byte $FF            ; $BFD2
    .byte $FF            ; $BFD3
    .byte $FF            ; $BFD4
    .byte $FF            ; $BFD5
    .byte $FF            ; $BFD6
    .byte $FF            ; $BFD7
    SEI                     ; $BFD8: 78
    INC $BFDF               ; $BFD9: EE DF BF
    JMP $FF8E               ; $BFDC: 4C 8E FF
    .byte $80            ; $BFDF
    JSR $5244               ; $BFE0: 20 44 52
    EOR ($47,X)             ; $BFE3: 41 47
    .byte $4F            ; $BFE5
    LSR $5120               ; $BFE6: 4E 20 51
    EOR $45,X               ; $BFE9: 55 45
    .byte $53            ; $BFEB
    .byte $54            ; $BFEC
    JSR $5649               ; $BFED: 20 49 56
    BRK                     ; $BFF0: 00
    BRK                     ; $BFF1: 00
    BRK                     ; $BFF2: 00
    BRK                     ; $BFF3: 00
    PHA                     ; $BFF4: 48
    .byte $04            ; $BFF5
    ORA ($0E,X)             ; $BFF6: 01 0E
    .byte $07            ; $BFF8
    .byte $9E            ; $BFF9
    CLD                     ; $BFFA: D8
    .byte $BF            ; $BFFB
    CLD                     ; $BFFC: D8
    .byte $BF            ; $BFFD
    CLD                     ; $BFFE: D8
    .byte $BF            ; $BFFF