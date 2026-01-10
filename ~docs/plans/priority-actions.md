# DW4 Priority Actions - 2026-01-09

## Immediate Blockers (This Week)

### 🔴 CRITICAL: Experience Table Location

**Issue:** #50  
**Status:** UNKNOWN - original Bank 0x27 was invalid  
**Blocking:** DW4Lib ExperienceTable.cs, level-up documentation

**Action Required:**
1. Run CDL capture during level-up (see `~manual-testing/levelup-testing.md`)
2. Use `tools/analyze_exp_cdl.py` to identify accessed addresses
3. Update `data/asset-map.json` with verified location
4. Update `DW4Lib/DataStructures/ExperienceTable.cs`

### 🔴 CRITICAL: Spell Table Verification  

**Issue:** #81  
**Status:** Unverified - DW4Lib says Bank 0x0D $9000  
**Blocking:** Spell editor accuracy

**Action Required:**
1. Run CDL capture during spell casting (see `~manual-testing/cdl-verification-quickstart.md`)
2. Verify 6-byte structure at Bank 0x0D
3. Update `data/asset-map.json` status from "unverified" to "verified"

---

## High Priority (This Month)

### 🟠 Mesen Labels File Sync

**Issue:** #56  
**Current State:** MLB exists but incomplete  
**Location:** `GameInfo/Games/NES/Dragon Warrior 4 (NES)/Debugging/`

**Tasks:**
- [ ] Export labels from `source_files/include/*.inc` to MLB format
- [ ] Merge with existing `Dragon Warrior IV.mlb`
- [ ] Test labels in Mesen debugger
- [ ] Document label export script

### 🟠 DW4Lib Integration

**Issue:** #78  
**Current State:** Core structures complete, converters working

**Tasks:**
- [ ] Complete `ExperienceTable.cs` (blocked by location)
- [ ] Add unit tests for all extractors
- [ ] Create CLI extraction tool
- [ ] Document API usage

### 🟠 Save System Research

**Issue:** #76, #77  
**Current State:** Basic structure documented

**Tasks:**
- [ ] Complete SRAM format verification
- [ ] Implement checksum calculation
- [ ] Test save editor with all chapters
- [ ] Document chapter-specific variations

---

## Medium Priority (This Quarter)

### 🟡 Documentation Completion

| Task | Issue | Priority |
|------|-------|----------|
| Complete ROM map | #58 | Medium |
| Document all event flags | #72 | Medium |
| Chapter system docs | #62 | Medium |
| Battle formula docs | - | Medium |

### 🟡 Disassembly Labels

| Bank | Status | Priority |
|------|--------|----------|
| 0x00-0x05 (Code) | ~30% labeled | Medium |
| 0x19 (Audio) | Documented | Low |
| 0x1E-0x1F (Fixed) | ~50% labeled | Medium |

### 🟡 Additional Research

| Area | Issue | Notes |
|------|-------|-------|
| Casino system | #79 | Low priority |
| Monster arena | #61 | Nice to have |
| Animation system | #75 | Low priority |

---

## Completed This Session

- [x] Created master project plan (`~docs/plans/master-project-plan.md`)
- [x] Updated manual testing README
- [x] Created save-testing.md
- [x] Created levelup-testing.md
- [x] Created chapter-testing.md
- [x] Created battle-testing.md
- [x] Analyzed all 80 GitHub issues

---

## Quick Reference: File Locations

| Item | Path |
|------|------|
| Asset Map | `data/asset-map.json` |
| Include Files | `source_files/include/` |
| CDL (merged) | `GameInfo/.../cdls/Dragon Warrior IV-merged.cdl` |
| MLB Labels | `GameInfo/.../Dragon Warrior IV.mlb` |
| DW4Lib | `logsmall/DW4Lib/` |
| Session Logs | `~docs/session-logs/` |

---

## Next Session Tasks

1. **CDL Verification**
   - [ ] Capture spell casting CDL
   - [ ] Capture level-up CDL
   - [ ] Run analysis scripts
   - [ ] Update asset-map.json

2. **Labels**
   - [ ] Create script to export .inc to .mlb format
   - [ ] Merge all labels into single MLB file
   - [ ] Test in Mesen

3. **Documentation**
   - [ ] Update QUICK_REFERENCE.md with verified data
   - [ ] Create Dark Repos wikitext exports
