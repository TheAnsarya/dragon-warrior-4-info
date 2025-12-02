# Dragon Warrior IV (NES US) - Text System Analysis

## Overview

Dragon Warrior IV uses a mixed text encoding system:
- **Menu/UI text**: Plain TBL encoding (no compression)
- **Chapter titles**: Plain TBL encoding
- **Casino text**: Plain TBL encoding
- **NPC Dialogue**: Unknown compression (likely dictionary-based)

## Text Locations

### Bank 22 (ROM 0x58010-0x5C010) - Menu/UI Text
Contains battle commands, menu options, and system messages.

#### Battle Commands (CPU $B03C+)
```
COMMAND
TALK
SPELL
STATUS
ITEM
EQUIP
SEARCH
DOOR
TACTICS
INFO
CONDITION
```

#### Character Stats (CPU $B07B+)
```
SEX:
LEVEL:
STRENGTH:
AGILITY:
VITALITY:
INTELLIGENCE:
LUCK:
MAX HP:
MAX MP:
POWER:
EXP:
```

#### Battle Options (CPU $B147+)
```
END
FIGHT
RUN
MEMBER
ATTACK
PARRY
```

#### Shop/NPC Options (CPU $B167+)
```
WHO
WHERE
CHANGE
BUY
SELL
LEAVE
PICK UP
DETOXICATE
UNCURSE
REVIVE
SAVE
GOLD
INFO
```

#### Save System (CPU $B3A3+)
```
speed you like
A QUEST
CONTINUE
CHANGE MESSAGE SPEED
BEGIN A NEW QUEST
COPY
ERASE
NAME
Do you want to erase this quest?
Select the message 1 2 3 4 5 6 7 8
Fast
Slow
Chapter
LEVEL
```

#### Party Menu (CPU $B45D+)
```
ADVENTURE LOG
FIGHT
TACTICS
MEMBER
RUN
SPELL
ITEM
ATTACK
PARRY
SEE [...]S
SWITCH
REMOVE
ADD
```

#### Name Entry (CPU $B699)
```
A B C D E F G H I J K L M N O P Q R S T U V W X Y Z - ' ! ? ( )
```

### Bank 23 (ROM 0x5C010-0x60010) - Casino Text
Contains poker/casino game text.

#### Poker Hands (CPU $82EC+)
```
Royal Flush
5 of a Kind
Straight Flush
4 of a Kind
Full House
Flush
Straight
3 of a Kind
2 Pairs
```

#### Casino UI (CPU $834D+)
```
Top Score of
Double Up
Top Takes of
Total Bets
Total Takes
Top Score of Double Up
DRAW
Yes
No
```

### Bank 27 (ROM 0x6C010-0x70010) - Chapter Titles
Contains chapter introduction screens.

#### Chapter Titles (CPU $A65B+)
```
The End
Chapter [X]
The Royal Soldiers
Princess Alena's Adventure
Taloon the Arms Merchant
The Sisters of Monbaraba
The Chosen Ones
```

### Bank 17 (ROM 0x44010-0x48010) - Battle/Item Text
Contains zodiac references and misc UI.

#### Zodiac Items (CPU $BE5F+)
```
the Tower
the Stars
the Moon
the Sun
the Terminator
```

## Control Codes

| Code | Name | Description |
|------|------|-------------|
| $FD  | LINE | New line / clear window |
| $FE  | CTRL | Control code prefix |
| $FF  | END  | End of string marker |
| $22 XX | POSITION | Set text position (XX = position) |

## NPC Dialogue (Location Unknown)

The main NPC dialogue text has **NOT** been located in plain TBL format.
Common words like "lord", "king", "gold", "weapon", "armor" are not found
in the ROM with plain TBL encoding.

This suggests dialogue uses additional compression:
- Dictionary compression (DTE-like)
- Huffman coding
- Custom compression scheme

### Evidence of Compression
1. No plain-text dialogue words found in ROM search
2. High-byte values ($80-$FC) appear frequently in text-heavy banks
3. A potential DTE table was found at ROM 0x5B3B4 (Bank 22 CPU $B3A4)
   with entries like "sp", "ee", "yo", "QU", "ES", "AN", etc.

## Next Steps
1. Analyze the potential DTE table at 0x5B3B4 more thoroughly
2. Trace the text rendering code to understand compression format
3. Find dialogue text pointers in the bank switching code
4. Document the complete text compression scheme

## Known Pointer Tables
- Text pointers likely stored in the same banks as text
- Need to identify pointer table format (16-bit addresses)
- May use bank-relative addressing
