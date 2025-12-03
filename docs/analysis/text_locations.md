# Dragon Warrior IV (NES) - Text Location Reference

## Overview

This document catalogs all known text locations in the Dragon Warrior IV NES ROM.

**ROM:** Dragon Warrior IV (1992-10)(Enix)(US).nes  
**Text Encoding:** Custom (see [TBL file](../data/dragon-warrior-4.tbl))  
**Compression:** DTE (Dual Tile Encoding) at Bank 22 $B3A4

---

## Bank 22 - Menu System ($B03C+)

### Main Menu Commands (ROM 0x5B040)

| Address | Text |
|---------|------|
| $B03C | COMMAND |
| $B044 | TALK |
| $B049 | SPELL |
| $B04F | STATUS |
| $B056 | ITEM |
| $B05B | EQUIP |
| $B061 | SEARCH |
| $B068 | DOOR |
| $B06D | TACTICS |
| $B075 | INFO |
| $B07A | CONDITION |

### Status Screen Labels

| Address | Text |
|---------|------|
| $B07B | SEX: |
| $B080 | LEVEL: |
| $B090 | STRENGTH: |
| $B09A | AGILITY: |
| $B0A3 | VITALITY: |
| $B0AD | INTELLIGENCE: |
| $B0BB | LUCK: |
| $B0C1 | MAX HP: |
| $B0C9 | MAX MP: |
| $B0D3 | POWER: |
| $B0E3 | EXP: |

### Battle Menu

| Address | Text |
|---------|------|
| $B147 | END |
| $B14A | FIGHT |
| $B150 | RUN |
| $B154 | MEMBER |
| $B15B | ATTACK |
| $B162 | PARRY |
| $B167 | WHO |
| $B16B | WHERE |
| $B171 | CHANGE |
| $B178 | BUY |
| $B17C | SELL |
| $B181 | LEAVE |
| $B186 | PICK UP |

### Other Menu Items

| Address | Text |
|---------|------|
| $B103 | DOUSE |
| $B109 | APPRAISE |
| $B112 | TRANSFER |
| $B11A | DISCARD |
| $B128 | DEFENSE |
| $B130 | YES |
| $B134 | NO |
| $B18D | DETOXICATE |
| $B198 | UNCURSE |
| $B1A0 | REVIVE |
| $B1A7 | SAVE |
| $B1AC | GOLD |
| $B1B1 | INFORM |
| $B1B8 | EXIT |
| $B4A6 | SWITCH |
| $B4AD | REMOVE |
| $B4B4 | ADD |

### System Messages ($B3A3+)

| Address | Text |
|---------|------|
| $B3A3 | "speed you like. A QUEST" |
| $B3C8 | "CHANGE MESSAGE SPEED" |
| $B3DB | "BEGIN A NEW QUEST" |
| $B3ED | "COPY" |
| $B3F2 | "ERASE" |
| $B3F8 | "NAME" |
| $B3FD | "Do you want to erase this quest?" |
| $B420 | "Select the message" |
| $B45D | "ADVENTURE LOG" |
| $B46B | "SEE N" |
| $B4A0 | "SEE S" |

### Alphabet for Name Entry ($B699)

```
A B C D E F G H I J K L M N O P Q R S T U V W X Y Z - ' ! ? ( )
```

---

## Bank 23 - Casino ($82EC+)

### Poker Hands

| Address | Text |
|---------|------|
| $82EC | Royal Flush |
| $82F8 | 5 of a Kind |
| $8304 | Straight Flush |
| $8313 | 4 of a Kind |
| $831F | Full House |
| $832A | Flush |
| $8330 | Straight |
| $8339 | 3 of a Kind |
| $8345 | 2 Pairs |

### Casino Interface

| Address | Text |
|---------|------|
| $834D | Top Score of |
| $835A | Double Up |
| $8364 | Top Takes of |
| $837B | Total Bets |
| $8386 | Total Takes |
| $8392 | Top Score of Double Up |
| $92DA | DRAW (×5) |
| $930A | Yes / No |

---

## Bank 27 - Story Text ($A65B+)

### Chapter Titles

| Address | Text |
|---------|------|
| $A65B | "The End" |
| $A66C | "Chapter " |
| $A676 | "The Royal Soldiers" (Chapter 1) |
| $A68B | "Princess Alena's Adventure" (Chapter 2) |
| $A6A8 | "Taloon the Arms Merchant" (Chapter 3) |
| $A6C3 | "The Sisters of Monbaraba" (Chapter 4) |
| $A6DE | "The Chosen Ones" (Chapter 5) |

---

## Bank 17 - Location Names

### Known Locations (partial)

| Pattern | Text |
|---------|------|
| Found | "the Tower" |
| Found | "the Stars" |
| Found | "the Moon" |
| Found | "the Sun" |
| Found | "the Terminator" |
| Found | "Strength" |
| Found | "Evil" |

---

## DTE Table (Bank 22, $B3A4)

The DTE dictionary is stored at ROM offset 0x5B3B4.

Each code $80-$FE maps to a 2-byte pair.

### Common DTE Expansions

| Code | Expands To |
|------|------------|
| $82 | "th" |
| $8C | "er" |
| $90 | "an" |
| $A5 | "the" |
| $B3 | "ing" |
| $C8 | "you" |

Full table: see [dte_dictionary_table.md](dte_dictionary_table.md)

---

## Control Codes

| Code | Meaning |
|------|---------|
| $FF | End of string |
| $FD | Line break |
| $FE | Control code (followed by position byte) |

---

## Banks Summary

| Bank | Content Type | Notes |
|------|--------------|-------|
| 0-4 | Mixed code/data | Some graphics pointers |
| 5-7 | Tile/sprite data | Pattern tables |
| 8-11 | Map data | Level layouts |
| 12-13 | Dialogue banks | NPC text (compressed) |
| 14-16 | Mixed data | Items, stats |
| 17 | Location names | Town/dungeon names |
| 18-21 | Mixed | Various game data |
| 22 | Menu/UI text | Main menu, DTE table |
| 23 | Casino text | Poker, gambling |
| 24 | More dialogue | Story text |
| 25-26 | Mixed data | |
| 27 | Chapter titles | Story headings |
| 28-31 | Code/data | Engine code |

---

## Notes

1. Monster names have not been located - may use a different encoding or be stored as graphics tiles
2. Item/spell names appear to be embedded in dialogue or use different addressing
3. The game uses bank switching extensively during text display
4. Some text areas contain code mixed with data

---

## Related Files

- [`dragon-warrior-4.tbl`](../data/dragon-warrior-4.tbl) - Text table for ROM hacking tools
- [`dte_dictionary_table.md`](dte_dictionary_table.md) - Complete DTE expansion table
- [`text_system_overview.md`](text_system_overview.md) - Text engine architecture
