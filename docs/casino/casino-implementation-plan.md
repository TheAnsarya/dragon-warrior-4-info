# DQ4r Casino Implementation Plan

## Overview

This document outlines the implementation plan for porting the Dragon Warrior IV (NES) casino system to DQ4rLib (SNES-targeted port).

## Goals

1. Extract all casino data from DW4 NES ROM
2. Create C# models for casino games
3. Implement Video Poker and Monster Arena
4. Create ASM patches for SNES integration
5. Add unit tests for all casino functionality

## Architecture

### New Files to Create

```
DQ4rLib/
├── Casino/
│   ├── CasinoManager.cs        # Main casino manager
│   ├── VideoPoker.cs           # Poker game logic
│   ├── MonsterArena.cs         # Arena game logic
│   ├── CardDeck.cs             # Card deck management
│   ├── PokerHand.cs            # Hand evaluation
│   └── CasinoPrizes.cs         # Prize exchange system
├── Models/
│   ├── CasinoState.cs          # Casino session state
│   ├── Card.cs                 # Playing card model
│   ├── PokerHandType.cs        # Hand type enum
│   ├── ArenaMatch.cs           # Arena match data
│   └── CasinoPrize.cs          # Prize item data
└── Data/
    ├── CasinoData.cs           # Static casino data
    ├── prize_table.json        # Prize definitions
    └── arena_matchups.json     # Arena monster matchups
```

### Integration Points

1. **SaveManager** - Store casino coins in save data
2. **EventEngine** - Handle casino NPC interactions
3. **BattleManager** - Run arena battles
4. **ChapterManager** - Chapter availability checks

## Phase 1: Data Extraction (DW4 NES)

### Casino Coin Memory
```csharp
// Save data structure addition
public class SaveData {
    // Existing...
    
    // Casino coins (24-bit, 3 bytes)
    public uint CasinoCoins { get; set; } // Max: 16,777,215
    
    // Offsets in save file
    // $62AD: Low byte
    // $62AE: Mid byte  
    // $62AF: High byte
}
```

### Poker Hand Payouts
```csharp
public enum PokerHandType {
    Nothing = 0,
    OnePair = 1,
    TwoPairs = 2,
    ThreeOfAKind = 3,
    Straight = 4,
    Flush = 5,
    FullHouse = 6,
    FourOfAKind = 7,
    StraightFlush = 8,
    FiveOfAKind = 9,   // With Joker
    RoyalFlush = 10
}

// Payout multipliers from NES ROM
public static readonly Dictionary<PokerHandType, int> Payouts = new() {
    [PokerHandType.OnePair] = 1,
    [PokerHandType.TwoPairs] = 2,
    [PokerHandType.ThreeOfAKind] = 3,
    [PokerHandType.Straight] = 5,
    [PokerHandType.Flush] = 10,
    [PokerHandType.FullHouse] = 20,
    [PokerHandType.FourOfAKind] = 50,
    [PokerHandType.StraightFlush] = 100,
    [PokerHandType.FiveOfAKind] = 250,
    [PokerHandType.RoyalFlush] = 500
};
```

### Prize Table
```json
{
    "prizes": [
        {"itemId": "0x45", "name": "Falcon Sword", "cost": 65000},
        {"itemId": "0x89", "name": "Metal Babble Armor", "cost": 35000},
        {"itemId": "0x50", "name": "Gringham Whip", "cost": 40000},
        {"itemId": "0xA1", "name": "Metal Babble Helm", "cost": 30000},
        {"itemId": "0xB5", "name": "Hat of Happiness", "cost": 10000},
        {"itemId": "0xC2", "name": "Meteorite Bracer", "cost": 50000},
        {"itemId": "0x20", "name": "Prayer Ring", "cost": 500}
    ]
}
```

## Phase 2: Core Implementation

### CasinoManager.cs
```csharp
namespace DQ4rLib.Casino;

public class CasinoManager {
    private readonly ChapterManager _chapterManager;
    private readonly SaveManager _saveManager;
    
    public VideoPoker Poker { get; }
    public MonsterArena Arena { get; }
    public CasinoPrizes Prizes { get; }
    
    public uint Coins => _saveManager.CurrentSave?.CasinoCoins ?? 0;
    
    public bool CanAccess => _chapterManager.CurrentChapter >= 2;
    
    public void AddCoins(uint amount);
    public bool SpendCoins(uint amount);
    public void ExchangeGoldForCoins(uint gold);  // 20 gold = 1 coin
}
```

### VideoPoker.cs
```csharp
namespace DQ4rLib.Casino;

public class VideoPoker {
    private readonly CardDeck _deck;
    private readonly Random _rng;
    private Card[] _hand = new Card[5];
    private bool[] _held = new bool[5];
    
    public event EventHandler<HandDealtEventArgs>? HandDealt;
    public event EventHandler<HandEvaluatedEventArgs>? HandEvaluated;
    public event EventHandler<DoubleUpEventArgs>? DoubleUpResult;
    
    public uint CurrentBet { get; private set; }
    public uint CurrentWinnings { get; private set; }
    public PokerHandType LastHandType { get; private set; }
    
    // Game flow
    public void PlaceBet(uint amount);
    public void Deal();
    public void HoldCard(int index);
    public void Draw();
    public PokerHandType EvaluateHand();
    
    // Double Up
    public void StartDoubleUp();
    public bool GuessHigher();
    public bool GuessLower();
    public void CollectWinnings();
}
```

### PokerHand.cs
```csharp
namespace DQ4rLib.Casino;

public static class PokerHand {
    /// <summary>
    /// Evaluate a 5-card hand.
    /// Port of NES evaluation logic at $81F2.
    /// </summary>
    public static PokerHandType Evaluate(Card[] cards) {
        if (IsRoyalFlush(cards)) return PokerHandType.RoyalFlush;
        if (IsFiveOfAKind(cards)) return PokerHandType.FiveOfAKind;
        if (IsStraightFlush(cards)) return PokerHandType.StraightFlush;
        if (IsFourOfAKind(cards)) return PokerHandType.FourOfAKind;
        if (IsFullHouse(cards)) return PokerHandType.FullHouse;
        if (IsFlush(cards)) return PokerHandType.Flush;
        if (IsStraight(cards)) return PokerHandType.Straight;
        if (IsThreeOfAKind(cards)) return PokerHandType.ThreeOfAKind;
        if (IsTwoPairs(cards)) return PokerHandType.TwoPairs;
        if (IsOnePair(cards)) return PokerHandType.OnePair;
        return PokerHandType.Nothing;
    }
    
    // Individual hand checks...
}
```

### MonsterArena.cs
```csharp
namespace DQ4rLib.Casino;

public class MonsterArena {
    private readonly BattleManager _battleManager;
    private readonly Random _rng;
    
    public event EventHandler<ArenaFightStartedEventArgs>? FightStarted;
    public event EventHandler<ArenaFightEndedEventArgs>? FightEnded;
    
    public ArenaMatch CurrentMatch { get; private set; }
    public uint CurrentBet { get; private set; }
    public int SelectedContender { get; private set; }
    
    public ArenaMatch[] GetTodaysMatches();
    public void SelectContender(int index);
    public void PlaceBet(uint amount);
    public void StartFight();
    public int CalculatePayout();
}
```

## Phase 3: SNES Integration (ASM Patches)

### Memory Map Additions

Add to SRAM map:
```
$700300-$700302: Casino coins (24-bit)
$700303: Last arena result
$700304-$700307: Poker statistics
```

### Bank Allocation

Casino code will be placed in:
- **Bank $40**: Casino main loop, menus
- **Bank $41**: Poker game logic
- **Bank $42**: Arena integration

### ASM Patch Files

```
patches/
├── casino_main.asm      # Entry points, menus
├── casino_poker.asm     # Poker game
├── casino_arena.asm     # Arena battles
├── casino_prizes.asm    # Prize exchange
├── casino_graphics.asm  # CHR/palette loading
└── casino_hooks.asm     # Integration hooks
```

### Entry Hook (in main game loop)
```asm
; Hook casino NPC interaction
org $029A50
    JSL CasinoEntryCheck
    NOP
    
; Casino entry check
CasinoEntryCheck:
    LDA $1F00           ; Current map
    CMP #$04            ; Endor
    BNE .not_casino
    LDA $1F02           ; Submap
    CMP #$01            ; Casino
    BNE .not_casino
    ; Enter casino mode
    LDA #$01
    STA $1E00           ; Casino active flag
    JSL CasinoMainLoop
.not_casino:
    RTL
```

## Phase 4: Graphics Conversion

### NES → SNES Graphics

1. **Card Tiles**: 2bpp → 4bpp conversion
2. **Palette**: Create SNES-compatible palette
3. **UI Elements**: Redesign for 256x224 display

### Required Assets

| Asset | NES Location | SNES Target |
|-------|--------------|-------------|
| Card faces | CHR $80-$FF | Bank $48 |
| Card backs | CHR $70-$7F | Bank $48 |
| Casino BG | Bank $15 | Bank $49 |
| Text/UI | Bank $23 | Bank $4A |

## Phase 5: Testing

### Unit Tests

```csharp
// PokerHandTests.cs
[Fact]
public void Evaluate_RoyalFlush_ReturnsRoyalFlush() {
    var cards = new Card[] {
        new(Rank.Ace, Suit.Spades),
        new(Rank.King, Suit.Spades),
        new(Rank.Queen, Suit.Spades),
        new(Rank.Jack, Suit.Spades),
        new(Rank.Ten, Suit.Spades)
    };
    
    var result = PokerHand.Evaluate(cards);
    
    Assert.Equal(PokerHandType.RoyalFlush, result);
}

[Fact]
public void Evaluate_FiveOfAKind_WithJoker_ReturnsFiveOfAKind() {
    var cards = new Card[] {
        new(Rank.Ace, Suit.Spades),
        new(Rank.Ace, Suit.Hearts),
        new(Rank.Ace, Suit.Diamonds),
        new(Rank.Ace, Suit.Clubs),
        Card.Joker
    };
    
    var result = PokerHand.Evaluate(cards);
    
    Assert.Equal(PokerHandType.FiveOfAKind, result);
}
```

### Integration Tests

```csharp
[Fact]
public void Casino_SpendCoins_DeductsFromSave() {
    var saveManager = new SaveManager();
    saveManager.CreateNewSave(0, "TEST");
    saveManager.CurrentSave.CasinoCoins = 1000;
    
    var casino = new CasinoManager(chapterManager, saveManager);
    casino.SpendCoins(100);
    
    Assert.Equal(900u, casino.Coins);
}
```

## Timeline

| Phase | Task | Duration |
|-------|------|----------|
| 1 | Data extraction | 1 day |
| 2 | Core C# implementation | 3 days |
| 3 | SNES ASM patches | 5 days |
| 4 | Graphics conversion | 2 days |
| 5 | Testing & polish | 2 days |

**Total: ~2 weeks**

## Dependencies

- DW4 NES ROM for data extraction
- DQ3r SNES ROM as target base
- ca65/ld65 assembler
- .NET 10 SDK

## Success Criteria

1. ✅ Video Poker plays correctly with all hand types
2. ✅ Monster Arena runs battles and pays out
3. ✅ Prize exchange works with all items
4. ✅ Coins persist in save data
5. ✅ Graphics display correctly on SNES
6. ✅ All unit tests pass
