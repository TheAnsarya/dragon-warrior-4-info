# Dragon Warrior 4 (NES) - Memory Map

## Party Data Range: $6000-$61FF

### Overview

- Total addresses accessed: 485
- Total access operations: 905
- Indexed (array) accesses: 154

### Key Addresses

| Address | Purpose | Reads | Writes | RMW | Indexed |
|---------|---------|-------|--------|-----|--------|
| $615A | Current Battle Actor Index | 93 | 2 | 3 |  |
| $618E | Battle State Flags | 51 | 13 | 1 |  |
| $616A | Battle Action Data (indexed) | 41 | 18 | 0 | ✓ |
| $6038 | Unknown Flag/Counter | 18 | 2 | 11 | ✓ |
| $6018 | Unknown Status/Counter | 21 | 0 | 9 | ✓ |
| $6196 | Battle Counter 2 | 5 | 13 | 1 | ✓ |
| $601C | Party Member - Experience High (indexed) | 1 | 0 | 17 | ✓ |
| $6195 | Battle Counter 1 | 5 | 11 | 1 | ✓ |
| $6192 | Output/Store Variable | 3 | 8 | 4 |  |
| $6005 | Party Member - Max HP High (indexed) | 6 | 6 | 2 | ✓ |
| $6191 | Output/Store Variable | 3 | 8 | 3 |  |
| $6197 | Battle Limit X | 5 | 7 | 0 |  |
| $6198 | Battle Limit Y | 5 | 7 | 0 |  |
| $60B6 | Indexed Data Table | 5 | 3 | 3 | ✓ |
| $61DB | Indexed Data Table | 5 | 5 | 0 | ✓ |
| $6062 | Input/Read Variable | 6 | 2 | 1 | ✓ |
| $6075 | Input/Read Variable | 8 | 0 | 1 | ✓ |
| $60BD | Input/Read Variable | 8 | 1 | 0 | ✓ |
| $60C6 | Input/Read Variable | 8 | 0 | 1 | ✓ |
| $6000 | Party Member - Current HP Low (indexed) | 5 | 1 | 2 | ✓ |
| $6002 | Party Member - Current MP Low (indexed) | 3 | 4 | 1 | ✓ |
| $602B | Input/Read Variable | 8 | 0 | 0 | ✓ |
| $6061 | Indexed Data Table | 4 | 4 | 0 | ✓ |
| $609D | Input/Read Variable | 4 | 0 | 4 | ✓ |
| $614A | Input/Read Variable | 8 | 0 | 0 |  |
| $6165 | Indexed Data Table | 5 | 3 | 0 | ✓ |
| $600F | Input/Read Variable | 4 | 0 | 3 | ✓ |
| $6028 | Input/Read Variable | 5 | 0 | 2 | ✓ |
| $6001 | Party Member - Current HP High (indexed) | 1 | 4 | 1 | ✓ |
| $6004 | Party Member - Max HP Low (indexed) | 3 | 2 | 1 | ✓ |
| $606B | Input/Read Variable | 4 | 0 | 2 | ✓ |
| $615D | Input/Read Variable | 6 | 0 | 0 | ✓ |
| $618D | Input/Read Variable | 1 | 0 | 5 | ✓ |
| $618F | Unknown | 2 | 4 | 0 |  |
| $61E8 | Input/Read Variable | 6 | 0 | 0 | ✓ |
| $6079 | Input/Read Variable | 5 | 0 | 0 | ✓ |
| $6098 | Input/Read Variable | 5 | 0 | 0 | ✓ |
| $6159 | Input/Read Variable | 3 | 1 | 1 |  |
| $6168 | Input/Read Variable | 4 | 1 | 0 | ✓ |
| $6003 | Party Member - Current MP High (indexed) | 2 | 2 | 0 | ✓ |
| $6022 | Input/Read Variable | 4 | 0 | 0 | ✓ |
| $6029 | Input/Read Variable | 3 | 0 | 1 | ✓ |
| $603B | Input/Read Variable | 2 | 0 | 2 | ✓ |
| $6081 | Input/Read Variable | 4 | 0 | 0 | ✓ |
| $6094 | Input/Read Variable | 3 | 0 | 1 | ✓ |
| $609C | Input/Read Variable | 3 | 0 | 1 | ✓ |
| $60FB | Unknown | 1 | 1 | 2 |  |
| $6100 | Indexed Data Table | 2 | 1 | 1 | ✓ |
| $615B | Tactics Setting | 1 | 2 | 1 | ✓ |
| $615C | Input/Read Variable | 4 | 0 | 0 |  |

### Battle System Addresses ($615A-$61FF)

These addresses are primarily used during battle:

- **$6150**: Counter/Flag (RMW only)
- **$6151**: Input/Read Variable
- **$6152**: Unknown
- **$6153**: Input/Read Variable
- **$6154**: Unknown
- **$6156**: Unknown
- **$6157**: Unknown
- **$6158**: Unknown
- **$6159**: Input/Read Variable
- **$615A**: Current Battle Actor Index
- **$615B**: Tactics Setting
- **$615C**: Input/Read Variable
- **$615D**: Input/Read Variable
- **$615E**: Unknown
- **$615F**: Unknown
- **$6160**: Unknown
- **$6161**: Unknown
- **$6162**: Counter/Flag (RMW only)
- **$6163**: Input/Read Variable
- **$6164**: Input/Read Variable

### Character Data Structure (Speculation)

Based on indexed access patterns, character data may use $40 (64) byte blocks:

| Offset | Purpose (Inferred) |
|--------|--------------------|
| +$00-$01 | Current HP |
| +$02-$03 | Current MP |
| +$04-$05 | Max HP |
| +$06-$07 | Max MP |
| +$08 | Level |
| +$09 | Strength |
| +$0A | Agility |
| +$0B | Vitality |
| +$0C | Intelligence |
| +$0D | Luck |
| +$18 | Status flags |
| +$1A-$1C | Experience (3 bytes) |
