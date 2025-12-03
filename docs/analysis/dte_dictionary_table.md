# Dragon Warrior IV - DTE/Dictionary Compression Table

## Overview

Dragon Warrior IV uses DTE (Dual Tile Encoding) compression to reduce text storage size. 
Bytes >= $80 in the text stream are expanded into character pairs using a dictionary table.

## Table Location

| Property | Value |
|----------|-------|
| Bank | 22 ($16) |
| CPU Address | $B3A4 |
| ROM Offset | 0x5B3B4 |
| Size | 128 entries × 2 bytes = 256 bytes |
| Range | $80-$FF |

## How It Works

1. Text engine reads a byte from the text stream
2. If byte >= $80, it's a DTE code
3. The DTE code is used as an index into the dictionary table
4. Entry = `TABLE_BASE + (byte - $80) * 2`
5. Two bytes are read from the table and output as characters

## Code Reference

The DTE check occurs at Bank 22 $8272:

```asm
check_dte:
    $8272: CMP #$80     ; Check if byte >= $80
    $8274: BCS $829A    ; Branch to DTE handler if true
```

The DTE handler at $829A extracts the character pair:
- Uses low 3 bits as sub-index
- Upper 5 bits contribute to final table lookup

## Complete Dictionary Table

### Menu/UI Text Entries ($80-$8F)
| Code | Pair | Decoded | Usage |
|------|------|---------|-------|
| $80 | $0705 | "64" | Number formatting |
| $81 | $0300 | "2 " | Number spacing |
| $82 | $1D1A | "sp" | "speed" |
| $83 | $0F0F | "ee" | Common pair |
| $84 | $0E00 | "d " | Word endings |
| $85 | $2319 | "yo" | "you" |
| $86 | $1F00 | "u " | Word endings |
| $87 | $1613 | "li" | "like" |
| $88 | $150F | "ke" | "like" |
| $89 | $7800 | ". " | Punctuation |
| $8A | $2500 | "A " | Article |
| $8B | $3539 | "QU" | "QUEST" |
| $8C | $2937 | "ES" | Common pair |
| $8D | $3827 | "TC" | Menu text |
| $8E | $3332 | "ON" | Common pair |
| $8F | $382D | "TI" | Common pair |

### Dialogue Pairs ($90-$AF)
| Code | Pair | Decoded | Usage |
|------|------|---------|-------|
| $90 | $3239 | "NU" | "CONTINUE" |
| $91 | $298B | recursive | Nested DTE |
| $92 | $272C | "CH" | "CHANGE" |
| $93 | $2532 | "AN" | Common pair |
| $94 | $2B29 | "GE" | Common pair |
| $95 | $0031 | " M" | "MESSAGE" |
| $96 | $2937 | "ES" | Common pair |
| $97 | $3725 | "SA" | "SAGE" |
| $98 | $2B29 | "GE" | Common pair |
| $99 | $0037 | " S" | "SPEED" |
| $9A | $3429 | "PE" | Common pair |
| $9B | $2928 | "ED" | Common pair |
| $9C | $2629 | "BE" | "BEGIN" |
| $9D | $2B2D | "GI" | Common pair |
| $9E | $3200 | "N " | Word endings |
| $9F | $2500 | "A " | Article |
| $A0 | $3229 | "NE" | "NEW" |
| $A1 | $3B00 | "W " | Word endings |
| $A2 | $3539 | "QU" | "QUEST" |
| $A3 | $2937 | "ES" | Common pair |
| $A4 | $3827 | "TC" | Menu text |
| $A5 | $3334 | "OP" | "COPY" |
| $A6 | $3D8B | recursive | Nested DTE |
| $A7 | $2936 | "ER" | Common pair |
| $A8 | $2537 | "AS" | "ERASE" |
| $A9 | $298B | recursive | Nested DTE |
| $AA | $3225 | "NA" | "NAME" |
| $AB | $3129 | "ME" | Common pair |
| $AC | $2819 | "Do" | "Do you" |
| $AD | $0023 | " y" | Lowercase |
| $AE | $191F | "ou" | "you" |
| $AF | $0021 | " w" | "want" |

### Common Dialogue ($B0-$CF)
| Code | Pair | Decoded | Usage |
|------|------|---------|-------|
| $B0 | $0B18 | "an" | Common |
| $B1 | $1E00 | "t " | Word endings |
| $B2 | $1E19 | "to" | Common |
| $B3 | $0F1C | "er" | Common |
| $B4 | $0B1D | "as" | Common |
| $B5 | $0F00 | "e " | Word endings |
| $B6 | $1E12 | "th" | "the/this" |
| $B7 | $131D | "is" | Common |
| $B8 | $1B1F | "qu" | "quest" |
| $B9 | $0F1D | "es" | Common |
| $BA | $1E6D | "t?" | Question |
| $BB | $370F | "Se" | "Select" |
| $BC | $160F | "le" | Common |
| $BD | $0D1E | "ct" | Common |
| $BE | $001E | " t" | Word start |
| $BF | $120F | "he" | "the" |
| $C0 | $0017 | " m" | Word start |
| $C1 | $0F1D | "es" | Common |
| $C2 | $1D0B | "sa" | "sage" |
| $C3 | $110F | "ge" | Common |
| $C4 | $0002 | " 1" | Numbers |
| $C5 | $0003 | " 2" | Numbers |
| $C6 | $0004 | " 3" | Numbers |
| $C7 | $0005 | " 4" | Numbers |
| $C8 | $0006 | " 5" | Numbers |
| $C9 | $0007 | " 6" | Numbers |
| $CA | $0008 | " 7" | Numbers |
| $CB | $0009 | " 8" | Numbers |
| $CC | $2A0B | "Fa" | "Fast" |
| $CD | $1D1E | "st" | Common |
| $CE | $0000 | -- | Unused |
| $CF | $0000 | -- | Unused |

### Special/Chapter Text ($D0-$EF)
| Code | Pair | Decoded | Usage |
|------|------|---------|-------|
| $D0 | $0000 | -- | Unused |
| $D1 | $0000 | -- | Unused |
| $D2 | $3716 | "Sl" | "Slow" |
| $D3 | $1921 | "ow" | Common |
| $D4 | $0027 | " C" | Chapter |
| $D5 | $120B | "ha" | Common |
| $D6 | $1A1E | "pt" | Common |
| $D7 | $0F1C | "er" | Common |
| $D8 | $0030 | " L" | "LEVEL" |
| $D9 | $293A | "EV" | Common |
| $DA | $2930 | "EL" | Common |
| $DB | $0000 | -- | Unused |
| $DC | $8925 | ". A" | Sentence start |
| $DD | $283A | "DV" | "ADVENTURE" |
| $DE | $2932 | "EN" | Common |
| $DF | $3839 | "TU" | Common |
| $E0 | $3629 | "RE" | Common |
| $E1 | $0030 | " L" | "LOG" |
| $E2 | $332B | "OG" | Common |
| $E3 | $2A2D | "FI" | "FIGHT" |
| $E4 | $2B2C | "GH" | Common |
| $E5 | $3838 | "TT" | "TACTICS" |
| $E6 | $2527 | "AC" | Common |
| $E7 | $382D | "TI" | Common |
| $E8 | $2737 | "CS" | Common |
| $E9 | $3129 | "ME" | "MEMBER" |
| $EA | $3126 | "MB" | Common |
| $EB | $2936 | "ER" | Common |
| $EC | $3639 | "RU" | "RUNS" |
| $ED | $3237 | "NS" | Common |
| $EE | $3429 | "PE" | "SPELL" |
| $EF | $3030 | "LL" | Common |

### Battle/Item Text ($F0-$FF)
| Code | Pair | Decoded | Usage |
|------|------|---------|-------|
| $F0 | $2D38 | "IT" | "ITEM" |
| $F1 | $2931 | "EM" | Common |
| $F2 | $2538 | "AT" | "ATTACK" |
| $F3 | $3825 | "TA" | Common |
| $F4 | $272F | "CK" | Common |
| $F5 | $3425 | "PA" | "PARRY" |
| $F6 | $3636 | "RR" | Common |
| $F7 | $3D27 | "YC" | Unusual |
| $F8 | $0001 | " 0" | Numbers |
| $F9 | $0101 | "00" | Zero padding |
| $FA | $0101 | "00" | Zero padding |
| $FB | $0137 | "0S" | Number+letter |
| $FC | $2929 | "EE" | Common |
| $FD | $00A0 | special | LINE code |
| $FE | $3737 | "SS" | Common |
| $FF | -- | -- | END marker |

## TBL Format (for ROM Hacking Tools)

```
; Dragon Warrior IV DTE Table
; Bytes $80-$FE expand to two-character pairs
80=64
81=2 
82=sp
83=ee
84=d 
85=yo
86=u 
87=li
88=ke
89=. 
8A=A 
8B=QU
8C=ES
8D=TC
8E=ON
8F=TI
90=NU
92=CH
93=AN
94=GE
95= M
96=ES
97=SA
98=GE
99= S
9A=PE
9B=ED
9C=BE
9D=GI
9E=N 
9F=A 
A0=NE
A1=W 
A2=QU
A3=ES
A4=TC
A5=OP
A7=ER
A8=AS
AA=NA
AB=ME
AC=Do
AD= y
AE=ou
AF= w
B0=an
B1=t 
B2=to
B3=er
B4=as
B5=e 
B6=th
B7=is
B8=qu
B9=es
BA=t?
BB=Se
BC=le
BD=ct
BE= t
BF=he
C0= m
C1=es
C2=sa
C3=ge
C4= 1
C5= 2
C6= 3
C7= 4
C8= 5
C9= 6
CA= 7
CB= 8
CC=Fa
CD=st
D2=Sl
D3=ow
D4= C
D5=ha
D6=pt
D7=er
D8= L
D9=EV
DA=EL
DC=. A
DD=DV
DE=EN
DF=TU
E0=RE
E1= L
E2=OG
E3=FI
E4=GH
E5=TT
E6=AC
E7=TI
E8=CS
E9=ME
EA=MB
EB=ER
EC=RU
ED=NS
EE=PE
EF=LL
F0=IT
F1=EM
F2=AT
F3=TA
F4=CK
F5=PA
F6=RR
F7=YC
F8= 0
F9=00
FA=00
FB=0S
FC=EE
FE=SS
```

## Character Encoding Reference

| Range | Meaning |
|-------|---------|
| $00 | Space |
| $01-$0A | Digits 0-9 |
| $0B-$24 | Lowercase a-z |
| $25-$3E | Uppercase A-Z |
| $3F | ' (apostrophe) |
| $40 | . (period) |
| $41 | , (comma) |
| $42 | - (hyphen) |
| $43 | ? (question) |
| $44 | ! (exclamation) |
| $65-$78 | Alternate punctuation |
| $80-$FE | DTE pairs |
| $FD | LINE (newline) |
| $FE | CTRL (PPU control) |
| $FF | END (terminator) |

## Notes

- Some entries (like $91, $A6, $A9) contain recursive DTE codes that expand to other DTE pairs
- Entries $CE-$D1, $DB are unused (contain $0000)
- $FD is the LINE control code, not a DTE entry
- $FF is the END marker and terminates text strings
