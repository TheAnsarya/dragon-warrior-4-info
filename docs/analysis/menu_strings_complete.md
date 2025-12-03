# Dragon Warrior IV (NES) - Complete Menu String Reference

## Overview

All menu text strings are stored in **Bank 22** ($58010-$5C00F in ROM).
Strings are stored using the game's custom text encoding without DTE compression.

## Text Encoding

| Byte Range | Characters |
|------------|------------|
| $00        | Space      |
| $01-$0A    | 0-9        |
| $0B-$24    | a-z        |
| $25-$3E    | A-Z        |
| $45        | ,          |
| $46        | .          |
| $47        | ?          |
| $48        | !          |
| $49        | '          |
| $4A        | :          |
| $4B        | -          |
| $4C        | &          |

---

## Field Menu Commands (Bank 22)

| Address | ROM Offset | String |
|---------|-----------|--------|
| $B03C   | 0x5B04C   | COMMAND |
| $B043   | 0x5B053   | TALK |
| $B047   | 0x5B057   | SPELL |
| $B04C   | 0x5B05C   | STATUS |
| $B052   | 0x5B062   | ITEM |
| $B056   | 0x5B066   | EQUIP |
| $B05B   | 0x5B06B   | SEARCH |
| $B061   | 0x5B071   | DOOR |
| $B065   | 0x5B075   | TACTICS |
| $B06C   | 0x5B07C   | INFO |
| $B070   | 0x5B080   | CONDITION |

---

## Character Stats (Bank 22)

| Address | ROM Offset | String |
|---------|-----------|--------|
| $B090   | 0x5B090   | LEVEL |
| $B0A0   | 0x5B0A0   | STRENGTH |
| $B0AA   | 0x5B0AA   | AGILITY |
| $B0B3   | 0x5B0B3   | VITALITY |
| $B0BD   | 0x5B0BD   | INTELLIGENCE |
| $B0CB   | 0x5B0CB   | LUCK |
| $B0D1   | 0x5B0D1   | MAX HP |
| $B0D9   | 0x5B0D9   | MAX MP |
| $B0F3   | 0x5B0F3   | EXP |

---

## Battle Commands (Bank 22)

| Address | ROM Offset | String |
|---------|-----------|--------|
| $B15A   | 0x5B15A   | FIGHT |
| $B162   | 0x5B162   | MEMBER |
| $B168   | 0x5B168   | ATTACK |
| $B16E   | 0x5B16E   | PARRY |

---

## Shop Commands (Bank 22)

| Address | ROM Offset | String |
|---------|-----------|--------|
| $B186   | 0x5B186   | BUY |
| $B189   | 0x5B189   | SELL |
| $B18D   | 0x5B18D   | LEAVE |
| $B192   | 0x5B192   | PICK UP |

---

## Church/Inn Commands (Bank 22)

| Address | ROM Offset | String |
|---------|-----------|--------|
| $B199   | 0x5B199   | DETOXICATE |
| $B1A3   | 0x5B1A3   | UNCURSE |
| $B1AA   | 0x5B1AA   | REVIVE |
| $B1AF   | 0x5B1AF   | SAVE |

---

## Confirmation Options (Bank 22)

| Address | ROM Offset | String |
|---------|-----------|--------|
| $B147   | 0x5B147   | YES |
| $B14A   | 0x5B14A   | NO |

---

## Other UI Strings

| Address | ROM Offset | String | Purpose |
|---------|-----------|--------|---------|
| $B055   | 0x5B055   | ITEM | Item menu |
| $B056   | 0x5B056   | EQUIP | Equipment menu |
| $B066   | 0x5B066   | TACTICS | AI tactics |
| $B070   | 0x5B070   | INFO | Information |

---

## Memory Layout

The menu strings are stored contiguously in Bank 22 from $B03C to approximately $B1C0.
Each string is stored without explicit length or terminator within the block.
The game likely uses hardcoded offsets or a pointer table to reference each string.

### String Address Calculation

```
ROM_Offset = Bank_22_Start + (CPU_Address - $8000)
           = 0x58010 + (CPU_Address - $8000)
           = 0x58010 + CPU_Address - 0x8000
```

For example, COMMAND at $B03C:
```
ROM_Offset = 0x58010 + 0xB03C - 0x8000
           = 0x58010 + 0x303C
           = 0x5B04C
```

---

## Notes

1. **No DTE Compression**: Unlike dialogue text, menu strings use plain encoding
2. **Fixed Locations**: Menu strings are at fixed ROM addresses
3. **Single Bank**: All menu UI text is consolidated in Bank 22
4. **Consistent Encoding**: Same character encoding as all other text

---

## See Also

- [text_locations.md](text_locations.md) - Complete text location reference
- [text_routine_documentation.md](text_routine_documentation.md) - Text rendering code
- [../../docs/dte_table_documentation.md](../../docs/dte_table_documentation.md) - DTE table details
