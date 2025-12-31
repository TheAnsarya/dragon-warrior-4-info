# Dragon Warrior IV - Chapter System Documentation

## Overview

Dragon Warrior IV is unique among Dragon Quest games for its chapter-based narrative structure. The game is divided into 5 chapters, each with different playable characters and mechanics.

## Chapter Structure

### Chapter 1: The Royal Soldiers

**Protagonist:** Ragnar McRyan  
**Party:** Solo → Healie (NPC)  
**Location:** Burland Kingdom  
**Chapter ID:** 0x00

**Features:**
- Single character gameplay
- Tutorial-like difficulty
- Simple equipment options
- Healie joins as AI companion (cannot be controlled)

**Objective:** Investigate missing children from Izmit village

### Chapter 2: Princess Alena's Adventure

**Protagonist:** Alena  
**Party:** Alena, Cristo (Clift), Brey  
**Location:** Santeem Kingdom  
**Chapter ID:** 0x01

**Features:**
- First full party experience
- **AI-controlled party members** (critical for port)
- Cristo: Healer (infamous for casting Defeat on bosses)
- Brey: Mage (offensive magic)
- Alena: Fighter (critical hits)

**AI Behaviors:**
- Cristo prioritizes: Heal → Defense → Defeat
- Brey prioritizes: Offensive spells → Buff spells
- No player control over allies

**Objective:** Win the Endor tournament

### Chapter 3: Taloon the Arms Merchant

**Protagonist:** Taloon (Torneko)  
**Party:** Solo → Various NPCs  
**Location:** Lakanaba, Endor  
**Chapter ID:** 0x02

**Features:**
- Unique merchant mechanics
- Work at weapon shop to earn money
- Item appraisal system
- Hire NPCs temporarily
- Special battle actions (trip, call for help, lucky finds)

**Special Abilities:**
| Action | Effect | Trigger |
|--------|--------|---------|
| Trip | Lose turn | Random |
| Merchant Smile | Enemy hesitates | Random |
| Call Help | Random effect | Random |
| Find Item | Get item mid-battle | Random |

**Objective:** Open a shop in Endor

### Chapter 4: The Sisters of Monbaraba

**Protagonists:** Nara (fortune teller), Mara (dancer)  
**Party:** Nara, Mara  
**Location:** Monbaraba, Keeleon  
**Chapter ID:** 0x03

**Features:**
- Magic-focused party
- Nara: Healing and support
- Mara: Offensive magic and dance
- Story about revenge for father

**AI Behaviors:**
- Nara: Heal → Support → Attack
- Mara: Damage spells → Dance (group attack)

**Objective:** Avenge their father, defeat Balzack

### Chapter 5: The Chosen Ones

**Protagonist:** Hero (player-named)  
**Party:** Hero + All previous characters  
**Location:** World  
**Chapter ID:** 0x04

**Features:**
- Full 8-character roster
- **Wagon system** (critical for port)
- Tactics menu for AI control
- Can switch party members
- All previous characters reunite

**Wagon Mechanics:**
- 4 active party members
- 4 in wagon (reserve)
- Switch during battle (when wagon accessible)
- Wagon not allowed in some dungeons

## Battle Tactics (Chapter 5 Only)

| ID | Name | Japanese | AI Behavior |
|----|------|----------|-------------|
| 0x00 | Normal | ふつうに | Balanced approach |
| 0x01 | Save MP | いのちだいじ | Minimize magic use |
| 0x02 | Offensive | ガンガン | Maximum aggression |
| 0x03 | Defensive | じゅもんをつかうな | Protect party |
| 0x04 | Try Out | めいれいさせろ | Experimental |
| 0x05 | Use No MP | じゅもんせつやく | Physical attacks only |

## Save Data Structure

Each chapter maintains separate save data:

### Per-Chapter Data

```
Offset  Size  Field
------  ----  -----
0x00    1     Chapter ID
0x01    2     Gold
0x03    1     Party count
0x04    32    Character 1 data
0x24    32    Character 2 data
0x44    32    Character 3 data
0x64    32    Character 4 data
0x84    64    Inventory
0xC4    32    Event flags
0xE4    16    Map position
0xF4    8     Time/Day-night
```

### Chapter 5 Extended Data

```
Additional for wagon:
0x100   128   Wagon characters (4 × 32 bytes)
0x180   64    Wagon inventory
0x1C0   32    Tactics settings
0x1E0   32    Party order
```

## Day/Night Cycle

Time advances through gameplay actions:

| Range | Period | Duration (ticks) |
|-------|--------|------------------|
| 0x00-0x27 | Day | 40 |
| 0x28-0x77 | Day (post-Inn) | 80 |
| 0x78-0x7B | Afternoon | 4 |
| 0x7C-0x7F | Dusk | 4 |
| 0x80-0x83 | Evening | 4 |
| 0x84-0xBF | Night | 60 |
| 0xC0+ | Dawn → Day | Reset |

**Effects:**
- Different NPCs appear
- Some shops close at night
- Monster encounter rates change
- Some events only trigger at night

## Chapter Transition Events

### Chapter End Triggers

| Chapter | Trigger Event | Next Chapter |
|---------|---------------|--------------|
| 1 | Defeat boss, return children | 2 |
| 2 | Win Endor tournament | 3 |
| 3 | Open shop in Endor | 4 |
| 4 | Defeat Balzack | 5 |
| 5 | (End game) | - |

### Inventory Handling

- Chapters 1-4: Items stay with chapter
- Chapter 5: Hero starts fresh, meets others
- When characters join: Their items transfer

## RAM Locations

### Chapter State Variables

| Address | Purpose |
|---------|---------|
| $6000 | Current chapter ID |
| $6001 | Chapter flags (8 bits) |
| $6010 | Party composition |
| $6020 | Active party count |
| $6100 | Wagon enabled flag |
| $6104 | Wagon party data |

### AI State Variables

| Address | Purpose |
|---------|---------|
| $72F4 | Character action state |
| $75E8 | Battle phase |
| $75DC | AI decision flags |

## Implementation Notes for DQ3r Port

### Major Challenges

1. **Chapter State Machine**
   - DQ3r has no chapter concept
   - Need custom chapter tracking
   - Separate save slots per chapter?

2. **AI System**
   - DQ3r has manual control
   - Must implement AI decision trees
   - Port AI priorities per character

3. **Wagon System**
   - DQ3r has 4-member party max
   - Need to extend party system
   - Add wagon accessibility flags

4. **Taloon Mechanics**
   - Completely unique to DW4
   - Random battle actions
   - Shop management mini-game

### Suggested Approach

1. **Phase 1:** Implement chapter tracking variable
2. **Phase 2:** Create AI decision engine
3. **Phase 3:** Extend party system for wagon
4. **Phase 4:** Port chapter-specific content
5. **Phase 5:** Handle Taloon special mechanics

---

*See [chapters.json](../assets/json/chapters.json) for raw chapter data.*
