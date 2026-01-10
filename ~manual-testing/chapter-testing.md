# Chapter System Testing Guide

**Last Updated:** 2026-01-09  
**Related Issues:** #62, #59, #55

---

## Overview

Dragon Warrior IV has a unique 5-chapter structure:

| Chapter | Protagonist | Party Control | Special |
|---------|-------------|---------------|---------|
| 1 | Ragnar | Solo + NPC Healie | Healie AI |
| 2 | Alena | Alena manual, others AI | First AI party |
| 3 | Taloon | Solo + hired fighters | Merchant abilities |
| 4 | Nara | Nara manual, Mara AI | Sisters |
| 5 | Hero | Manual + AI + Wagon | Full party |

---

## Part 1: Chapter Transition Testing

### Goal
Verify chapter transition triggers and data handling.

### Test: Chapter 1 → Chapter 2

1. **Before transition**
   - Save state at end of Chapter 1
   - Export SRAM for analysis
   - Note Ragnar's stats/items

2. **Trigger transition**
   - Complete chapter objective
   - Watch transition sequence
   - Note any cutscene events

3. **After transition**
   - Save state in Chapter 2
   - Export SRAM
   - Compare save data structure

4. **Verify**
   - Ragnar data preserved correctly
   - Chapter flag updated
   - New chapter NPCs/maps available

### CDL Capture

Reset CDL before chapter transition to identify:
- Chapter flag location
- Map data loading
- Character data handling

---

## Part 2: Chapter 5 Wagon System

### Goal
Test wagon party management mechanics.

### Test Cases

| Test | Description | Expected |
|------|-------------|----------|
| Party swap | Change active party | Menu works correctly |
| Wagon full | 8+ party members | Extra in wagon |
| Battle join | Wagon member joins battle | Correct stats/spells |
| Wagon death | Active member dies | Wagon swap option |
| Wagon items | Access wagon member inventory | Items accessible |

### CDL Capture

1. Reset CDL before opening wagon menu
2. Perform party swaps
3. Save CDL
4. Analyze for wagon data addresses

### Wagon Memory Layout

Expected structure:
```
$7XXX - Active party (0-3)
$7YYY - Wagon party (4-7)
$7ZZZ - Wagon flags
```

---

## Part 3: AI Tactics System

### Goal
Verify AI behavior patterns for each tactics setting.

### Tactics Options

| ID | Name | Description |
|----|------|-------------|
| 0 | Normal | Balanced offense/defense |
| 1 | Offensive | Attack-focused |
| 2 | Defensive | Defense/healing priority |
| 3 | Use No MP | Physical attacks only |
| 4 | Follow Orders | Manual control (Ch5 only) |

### Test Procedure

1. **Set tactics to "Offensive"**
   - Enter battle
   - Observe AI actions
   - Record spell/attack choices

2. **Set tactics to "Use No MP"**
   - Enter same battle type
   - Verify no spells cast
   - Record actions

3. **CDL for AI**
   - Reset CDL
   - Let AI take several actions
   - Save CDL
   - Analyze for AI routine addresses

### Known AI Addresses

- Bank 0x05: AI/Monster Behavior code
- Jump tables at $8XXX

---

## Part 4: Chapter-Specific Event Flags

### Goal
Map story progression flags per chapter.

### Chapter 1 Flags (Ragnar)

| Event | Flag Offset | Notes |
|-------|-------------|-------|
| Met King | $60XX bit Y | Enables quest |
| Found children | $60XX bit Y | Village event |
| Tower key | $60XX bit Y | Item flag |
| Healie joined | $60XX bit Y | NPC flag |
| Boss defeated | $60XX bit Y | Chapter end |

### Chapter 2 Flags (Alena)

| Event | Flag Offset | Notes |
|-------|-------------|-------|
| Tournament start | $60XX | Quest trigger |
| Each round win | $60XX | Progress |
| Champion | $60XX | Chapter end |

### Test Procedure

1. Save state before event
2. Trigger event
3. Save state after
4. Compare SRAM dumps
5. Identify changed bytes

---

## Part 5: Character Recruitment

### Goal
Verify character data initialization when joining party.

### Recruitment Points

| Character | Chapter | Location | Condition |
|-----------|---------|----------|-----------|
| Healie | 1 | Tower | Automatic |
| Cristo | 2 | Castle | Story |
| Brey | 2 | Castle | Story |
| Nene | 3 | Various | Hired |
| Mara | 4 | Start | Automatic |
| All Ch1-4 | 5 | Various | Story |

### Test Procedure

1. Save state before recruitment
2. Export SRAM
3. Recruit character
4. Export SRAM again
5. Diff to find character data location

---

## Analysis Scripts

### extract_chapters.py

```powershell
python tools/extract_chapters.py "roms/Dragon Warrior IV (1992-10)(Enix)(US).nes"
```

### verify_chapters_cdl.py

```powershell
python tools/verify_chapters_cdl.py debug/chapter-test.cdl "roms/Dragon Warrior IV (1992-10)(Enix)(US).nes"
```

---

## CDL Verification Status

| Chapter | Maps Verified | Events | Flags |
|---------|---------------|--------|-------|
| 1 | ✅ 8/8 | Partial | Unknown |
| 2 | ✅ 11/11 | Partial | Unknown |
| 3 | ✅ 12/12 | Partial | Unknown |
| 4 | ✅ 12/12 | Partial | Unknown |
| 5 | ✅ 16/16 | Partial | Unknown |

See `data/asset-map.json` → `cdl_verification` for details.

---

## After Testing

Update the following:

- [ ] `data/asset-map.json` - Chapter flag locations
- [ ] `source_files/include/chapters.inc` - Chapter constants
- [ ] `docs/formats/CHAPTER_SYSTEM.md` - Documentation
- [ ] `logsmall/DW4Lib/DataStructures/Chapter.cs` - C# model
- [ ] Close GitHub Issues #62, #59, #55
