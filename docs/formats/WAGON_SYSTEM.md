# Dragon Warrior IV - Wagon System Documentation

## Overview

The wagon system is unique to Dragon Warrior IV among NES Dragon Quest games. It allows managing up to 8 party members, with 4 active and 4 in reserve. This system appears only in Chapter 5.

## Core Mechanics

### Party Composition

| Slot | Status | Notes |
|------|--------|-------|
| 1-4 | Active | In battle, on-screen |
| 5-8 | Wagon | Reserve, not in battle |

### Wagon Availability

The wagon is NOT available in:
- Most dungeons
- Caves
- Towers
- Some story events

**Availability Check:**
```asm
; RAM address $6100 holds wagon availability
LDA $6100
BEQ wagon_unavailable
; Wagon operations allowed
```

## Party Members

### Available Characters (Chapter 5)

| ID | Name | Role | Join Order |
|----|------|------|------------|
| 0 | Hero | Chosen One | Start |
| 1 | Ragnar | Soldier | First |
| 2 | Alena | Princess/Fighter | Varies |
| 3 | Cristo | Priest | With Alena |
| 4 | Brey | Mage | With Alena |
| 5 | Taloon | Merchant | Varies |
| 6 | Nara | Fortune Teller | Varies |
| 7 | Mara | Dancer | With Nara |

### Character Join Events

Characters join in different orders based on which towns the Hero visits. All 8 eventually unite for the final confrontation.

## Memory Layout

### Active Party Array

**Location:** $6010-$601F

```
$6010: Character 1 ID (active slot 1)
$6011: Character 2 ID (active slot 2)
$6012: Character 3 ID (active slot 3)
$6013: Character 4 ID (active slot 4)
```

### Wagon Party Array

**Location:** $6014-$601B

```
$6014: Character 5 ID (wagon slot 1)
$6015: Character 6 ID (wagon slot 2)
$6016: Character 7 ID (wagon slot 3)
$6017: Character 8 ID (wagon slot 4)
```

### Character Data Blocks

Each character has a 32-byte data block:

**Location:** $6100 + (character_id × 32)

```
Offset  Size  Field
------  ----  -----
0x00    8     Name
0x08    1     Level
0x09    1     Class ID
0x0A    2     Current HP
0x0C    2     Max HP
0x0E    2     Current MP
0x10    2     Max MP
0x12    1     Strength
0x13    1     Agility
0x14    1     Vitality
0x15    1     Intelligence
0x16    1     Luck
0x17    1     Attack Power
0x18    1     Defense Power
0x19    2     Experience
0x1B    1     Weapon equipped
0x1C    1     Armor equipped
0x1D    1     Shield equipped
0x1E    1     Helmet equipped
0x1F    1     Status flags
```

## Wagon Operations

### Switch Party Member (Out of Battle)

Menu flow:
1. Open menu → "Party"
2. Select character to move out
3. Select character to move in
4. Positions swap

**Code Logic:**
```asm
; $30 = character leaving active party
; $31 = character entering from wagon
LDA $6010,X  ; Get active party member at slot X
STA temp
LDA $6014,Y  ; Get wagon member at slot Y
STA $6010,X  ; Move to active
LDA temp
STA $6014,Y  ; Move to wagon
```

### Switch During Battle

Requirements:
- Wagon must be accessible
- Character switching must not be dead
- Uses character's turn

**Battle Switch Flow:**
1. Character selects "Change" command
2. Select wagon member
3. Active member goes to wagon
4. Wagon member takes their place
5. Wagon member acts next turn (or waits)

### Wagon Healing

Characters in wagon:
- Recover HP while walking (1 HP per N steps)
- Do NOT recover MP
- Status effects persist

## Dungeon Restrictions

### Wagon Accessibility by Location Type

| Location Type | Wagon | Notes |
|---------------|-------|-------|
| Overworld | ✅ Yes | Always |
| Towns | ✅ Yes | Usually |
| Caves | ❌ No | Too narrow |
| Towers | ❌ No | Stairs |
| Final Dungeon | ⚠️ Partial | Some areas |
| Boss Rooms | ❌ No | Usually |

### Accessibility Flag

Each map has a wagon flag:

```
Map Property Byte:
Bit 7: Wagon allowed (1 = yes, 0 = no)
Bits 6-0: Other map properties
```

## Dead Character Handling

If a character dies:
- Remains in current position (active/wagon)
- Cannot be switched into battle
- Must be revived to participate

**Revival Options:**
1. Church revival (costs gold)
2. Revive spell (Vivify, etc.)
3. Leaf of World Tree item

## Experience and Leveling

### Active Party Only

Only characters in the ACTIVE party gain experience from battles.

**Exception:** Some bonus EXP events give to all.

### Level-Up in Wagon

If experience is somehow gained while in wagon (edge cases), level-up is processed but:
- No battle stat increase animation
- Stats update silently

## Equipment Handling

### Shared Inventory

All characters share one inventory pool. Items can be equipped to anyone who can use them.

### Equipment Transfer

When switching characters, equipment stays with the character. No automatic equipment optimization.

## Special Cases

### Hero Death

If the Hero dies:
- Game continues (unlike some DQ games)
- Party fights on
- Must revive Hero to access menu
- Can switch Hero out if wagon available

### Full Party Wipe

If all 4 active members die:
- Game checks wagon
- If wagon has alive members → continue
- If all 8 dead → Game Over

### Solo Hero

Early Chapter 5 before finding others:
- Wagon exists but empty
- Switch option disabled

## Implementation Notes for DQ3r Port

### Major Changes Needed

1. **Extend Party System**
   - DQ3r has 4-member max
   - Need 8-member support
   - Add wagon data structure

2. **Menu Modifications**
   - Add "Switch" option
   - Show wagon characters
   - Equipment management for 8

3. **Battle System**
   - Add "Change" command
   - Handle mid-battle switching
   - Update turn order

4. **Map System**
   - Add wagon accessibility flag
   - Per-map configuration
   - Check on area transition

### Data Structures

```csharp
class WagonSystem {
    Character[] activeParty = new Character[4];
    Character[] wagonParty = new Character[4];
    bool wagonAccessible;
    
    void SwitchCharacters(int activeSlot, int wagonSlot);
    void HandleBattleSwitch(int activeSlot, int wagonSlot);
    void CheckWagonAccess(Map currentMap);
}
```

### Memory Requirements

Additional RAM for DQ3r port:
- 4 extra character blocks: 128 bytes
- Wagon state variables: 8 bytes
- Per-map wagon flags: ~256 bytes (for all maps)

**Total additional:** ~400 bytes

---

*Part of DW4→DQ3r port documentation. See [CHAPTER_SYSTEM.md](CHAPTER_SYSTEM.md) for related chapter mechanics.*
