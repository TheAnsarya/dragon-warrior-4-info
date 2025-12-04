#!/usr/bin/env python3
"""
Bank 19 Battle System Analysis Tool
Dragon Warrior IV (NES)

Analyzes the battle system code in Bank 19 including:
- Damage calculation formulas
- AI decision making (tactics system)
- Stat calculations
- Hit/miss determination
- Resistance/elemental checks
"""

import struct
import os

# ROM path
ROM_PATH = os.path.join(os.path.dirname(__file__), '..', 'roms',
                        'Dragon Warrior IV (1992-10)(Enix)(US).nes')

def read_rom():
    """Read ROM file and skip 16-byte iNES header"""
    with open(ROM_PATH, 'rb') as f:
        return f.read()[16:]  # Skip iNES header

def get_bank19_offset():
    """Bank 19 starts at ROM offset 0x4C000 (19 * 0x4000)"""
    return 0x4C000

def cpu_to_rom(cpu_addr, bank_offset):
    """Convert CPU address ($8000-$BFFF) to ROM offset for Bank 19"""
    return bank_offset + (cpu_addr - 0x8000)

def analyze_tactics_tables(rom, bank_offset):
    """Analyze the AI tactics system tables"""
    print("=" * 70)
    print("AI TACTICS SYSTEM ANALYSIS")
    print("=" * 70)

    # $615B contains tactics setting (0-6)
    # 0=Normal, 1=Save MP, 2=Offensive, 3=Defensive, 4=Try Out, 5=Use No MP, 6=Manual(?)
    tactics_names = ['Normal', 'Save MP', 'Offensive', 'Defensive', 'Try Out', 'Use No MP', 'Manual']

    # Attack multiplier table at $BB84 (7 entries)
    print("\n--- Attack Multiplier Table ($BB84) ---")
    print("Used in damage calculation: power *= table[tactics]")
    bb84_offset = cpu_to_rom(0xBB84, bank_offset)
    for i in range(7):
        val = rom[bb84_offset + i]
        print(f"  Tactics {i} ({tactics_names[i]:10}): {val:3d} (0x{val:02X})")

    # Stat divisor table at $BB8B (7 entries)
    print("\n--- Stat Divisor/Multiplier Table ($BB8B) ---")
    print("Used to scale stats based on tactics")
    bb8b_offset = cpu_to_rom(0xBB8B, bank_offset)
    for i in range(7):
        val = rom[bb8b_offset + i]
        print(f"  Tactics {i} ({tactics_names[i]:10}): {val:3d} (0x{val:02X})")

    # Hit threshold table at $BB92 (7 entries)
    print("\n--- Hit Threshold Table ($BB92) ---")
    print("Determines minimum hit chance per tactics mode")
    bb92_offset = cpu_to_rom(0xBB92, bank_offset)
    for i in range(7):
        val = rom[bb92_offset + i]
        print(f"  Tactics {i} ({tactics_names[i]:10}): {val:3d} (0x{val:02X})")

    # Tactics spell selection tables
    print("\n--- Tactics Spell Selection Tables ---")

    # $BA74: Tactics spell data table 1 (7*7=49 bytes)
    print("\n$BA74 - Primary Tactics/Spell Priority Table (7x7 matrix):")
    ba74_offset = cpu_to_rom(0xBA74, bank_offset)
    for tactics in range(7):
        row = []
        for spell_slot in range(7):
            val = rom[ba74_offset + tactics * 7 + spell_slot]
            row.append(f"{val:02X}")
        print(f"  Tactics {tactics} ({tactics_names[tactics]:10}): {' '.join(row)}")

    # $BAA5: Tactics spell data table 2 (48 bytes, 7*7=49, may overlap)
    print("\n$BAA5 - Secondary Tactics/Spell Data (48 bytes):")
    baa5_offset = cpu_to_rom(0xBAA5, bank_offset)
    for i in range(0, 48, 8):
        row = [f"{rom[baa5_offset + j]:02X}" for j in range(i, min(i+8, 48))]
        print(f"  ${0xBAA5 + i:04X}: {' '.join(row)}")

    # $BAD5: Tactics spell data table 3 (18 bytes)
    print("\n$BAD5 - Tertiary Tactics Data (18 bytes):")
    bad5_offset = cpu_to_rom(0xBAD5, bank_offset)
    row = [f"{rom[bad5_offset + j]:02X}" for j in range(18)]
    print(f"  {' '.join(row)}")

def analyze_spell_tables(rom, bank_offset):
    """Analyze spell power and attribute tables"""
    print("\n" + "=" * 70)
    print("SPELL/ACTION DATA TABLES")
    print("=" * 70)

    # $BB3F: Spell power table (9 entries)
    print("\n--- Spell Power Table ($BB3F) ---")
    bb3f_offset = cpu_to_rom(0xBB3F, bank_offset)
    for i in range(9):
        val = rom[bb3f_offset + i]
        print(f"  Spell Level {i}: Power = {val:3d} (0x{val:02X})")

    # $BB49: Spell attribute table (9 entries)
    print("\n--- Spell Attribute Table ($BB49) ---")
    bb49_offset = cpu_to_rom(0xBB49, bank_offset)
    for i in range(9):
        val = rom[bb49_offset + i]
        print(f"  Spell Level {i}: Attr = {val:3d} (0x{val:02X})")

    # $B80B: Spell/action effect type table (256 bytes)
    print("\n--- Action Effect Type Table ($B80B) - First 64 entries ---")
    b80b_offset = cpu_to_rom(0xB80B, bank_offset)
    for row in range(8):
        vals = []
        for col in range(8):
            idx = row * 8 + col
            val = rom[b80b_offset + idx]
            vals.append(f"{val:02X}")
        print(f"  ${0xB80B + row*8:04X}: {' '.join(vals)}")

    # $B915: Spell parameter table 1
    print("\n--- Spell Parameter Table 1 ($B915) ---")
    print("(Contains spell-specific modifiers)")
    b915_offset = cpu_to_rom(0xB915, bank_offset)
    for row in range(4):
        vals = []
        for col in range(8):
            idx = row * 8 + col
            val = rom[b915_offset + idx]
            vals.append(f"{val:02X}")
        print(f"  ${0xB915 + row*8:04X}: {' '.join(vals)}")

    # $B949: Spell parameter table 2
    print("\n--- Spell Parameter Table 2 ($B949) ---")
    b949_offset = cpu_to_rom(0xB949, bank_offset)
    for row in range(4):
        vals = []
        for col in range(8):
            idx = row * 8 + col
            val = rom[b949_offset + idx]
            vals.append(f"{val:02X}")
        print(f"  ${0xB949 + row*8:04X}: {' '.join(vals)}")

def analyze_enemy_data(rom, bank_offset):
    """Analyze enemy resistance/type data table"""
    print("\n" + "=" * 70)
    print("ENEMY DATA TABLE ($B967)")
    print("=" * 70)

    # $B967: Enemy resistance/type data table (256 bytes)
    # Each byte contains packed resistance/weakness flags
    print("\n--- Enemy Resistance Data (first 64 enemies) ---")
    print("Format: Each byte contains packed resistance bits")
    print("  Bit 7: Boss/special flag")
    print("  Bits 5-6: Resistance category")
    print("  Bits 0-4: Specific resistance flags")

    b967_offset = cpu_to_rom(0xB967, bank_offset)
    for row in range(8):
        print(f"\nEnemies {row*8:03d}-{row*8+7:03d}:", end="")
        for col in range(8):
            idx = row * 8 + col
            val = rom[b967_offset + idx]
            print(f" {val:02X}", end="")
        print()

        # Decode the flags for each enemy in this row
        for col in range(8):
            idx = row * 8 + col
            val = rom[b967_offset + idx]
            boss = (val & 0x80) >> 7
            resist_cat = (val & 0x60) >> 5
            resist_flags = val & 0x1F
            print(f"  Enemy {idx:03d}: Boss={boss} Cat={resist_cat} Flags={resist_flags:05b}")

def analyze_damage_formula(rom, bank_offset):
    """Document the damage calculation formula from code analysis"""
    print("\n" + "=" * 70)
    print("DAMAGE CALCULATION FORMULA")
    print("=" * 70)

    print("""
The damage calculation is performed at $AA67-$AB58:

1. INITIAL SETUP ($AA67-$AA79):
   - Clear damage accumulators ($0A-$0F)
   - Copy base power from $00-$01 to $0B-$0C
   - Get actor index from $8B into $0D

2. SCALE BY ACTOR INDEX ($AA7B-$AA9D):
   - Left shift $0D by 4 (multiply by 16) using $8176
   - Add party stat sum ($75ED-$75EE) to result
   - Overflow protection: if carry, set to $FF,$FF,$FF

3. DIVIDE BY DIVISOR ($AA9F-$AAB5):
   - Call 24-bit division at $8454
   - Divisor comes from $6E80 (tactics index) via table at $BB8B

4. MULTIPLY BY TACTICS MODIFIER ($AAA6-$AACD):
   - Look up multiplier from $BB84 using tactics index
   - Call 24-bit multiply at $8366
   - Shift result left by 4 bits (multiply by 16)

5. ADD BASE POWER COMPONENT ($AACF-$AAF3):
   - Copy original power to $0D-$0E
   - Look up modifier from $BB84
   - Call 16-bit multiply at $8330
   - Add to accumulated damage

6. APPLY DEFENSE REDUCTION ($AAFB-$AB4B):
   - Scale actor index by 8 (ASL x3)
   - Subtract defense modifier ($75EF)
   - If result positive, apply defense scaling
   - Division by 8 for defense reduction

FORMULA SUMMARY:
   Base = (Power * 16 + PartyStats) / TacticsDivisor
   Scaled = Base * TacticsMultiplier * 16
   Final = Scaled + (Power * Modifier) - (Defense * 8)

   Where:
   - Power = Base attack/spell power
   - PartyStats = Sum of party member relevant stats
   - TacticsDivisor = $BB8B[tactics]
   - TacticsMultiplier = $BB84[tactics]
   - Defense = Target defense value at $75EF
""")

def analyze_hit_check(rom, bank_offset):
    """Document the hit/miss determination"""
    print("\n" + "=" * 70)
    print("HIT/MISS DETERMINATION")
    print("=" * 70)

    print("""
Hit check is performed at $9135-$91A0:

1. LOAD ACTION ID ($9135):
   - Get action ID from $75DB
   - Check if $FF (guaranteed hit/miss based on context)

2. ACTION TYPE CHECK ($9144-$919A):
   - If action ID < $29: Standard attack handling
   - If action ID >= $29 and < $2D: Special spell handling
   - If action ID >= $2D: Use different hit formula

3. HIT CALCULATION:
   - Compare calculated hit value against threshold
   - Threshold varies by tactics: $BB92[tactics]
   - Random component from RNG

4. HIT RESULT CODES:
   - CMP #$06: Returns hit result category
   - Used to determine miss/hit/critical

The hit formula takes into account:
- Actor agility vs target agility
- Equipment modifiers
- Status effects (paralysis, etc.)
- Tactics mode threshold from $BB92
""")

def analyze_math_routines(rom, bank_offset):
    """Document the math subroutines"""
    print("\n" + "=" * 70)
    print("MATH SUBROUTINES (Bank 19)")
    print("=" * 70)

    print("""
16-BIT LEFT SHIFT x4 (Multiply by 16) - $8176:
   Takes: Value at X,X+1 (zero page)
   Returns: Result at X,X+1
   Method: ASL x4 with carry handling

16-BIT RIGHT SHIFT x4 (Divide by 16) - $8187:
   Takes: Value at X,X+1 (zero page)
   Returns: Result at X,X+1
   Method: LSR x4 with borrow handling

STAT SCALING - $8198:
   Takes: A = scale factor, value at X
   Returns: Scaled value
   Used for: Applying level/equipment bonuses

16-BIT MULTIPLY - $8330:
   Takes: A = multiplier, X = pointer to 16-bit multiplicand
   Returns: Result at X,X+1 (with overflow in $19)
   Method: Shift-and-add algorithm

24-BIT MULTIPLY - $8366:
   Takes: A = multiplier, X = pointer to 24-bit value
   Returns: Result at X,X+1,X+2 (with overflow in $1A)
   Method: Extended shift-and-add

16-BIT DIVISION - $83AA-$83F3:
   Takes: X = dividend pointer, Y = divisor pointer
   Returns: Quotient at X,X+1, Remainder at $6E11-$6E12
   Method: Shift-subtract algorithm, 16 iterations

24-BIT DIVISION - $83F4-$8453:
   Takes: X = dividend pointer, Y = divisor pointer
   Returns: Quotient at X,X+1,X+2, Remainder at $6E11-$6E13
   Method: Extended shift-subtract, 24 iterations
""")

def analyze_action_dispatch(rom, bank_offset):
    """Analyze the action dispatch system"""
    print("\n" + "=" * 70)
    print("ACTION DISPATCH SYSTEM")
    print("=" * 70)

    # Jump table at $8078 (8 entries, 16 bytes)
    print("\n--- Action Jump Table ($8078) ---")
    jt_offset = cpu_to_rom(0x8078, bank_offset)
    action_names = ['NOP/Return', 'Attack', 'Item Use', 'Unknown3',
                    'Skill/Spell', 'Defense', 'Unknown6', 'Unknown7']

    for i in range(8):
        lo = rom[jt_offset + i * 2]
        hi = rom[jt_offset + i * 2 + 1]
        addr = lo | (hi << 8)
        print(f"  Action {i} ({action_names[i]:12}): ${addr:04X}")

    print("""
Action Dispatch Flow ($805B-$8074):
1. Load current action mode from $6E80
2. If mode == 4, jump to special handler at $A8C6
3. Load action index from $75E8
4. Multiply by 2 for 16-bit pointer
5. Load address from jump table at $8078
6. Execute indirect jump to handler

Action Types:
- $75E8 contains the action index (0-7)
- $6E80 contains the battle mode (tactics)
- Each action type has a dedicated handler
""")

def analyze_resistance_check(rom, bank_offset):
    """Analyze elemental/resistance check"""
    print("\n" + "=" * 70)
    print("RESISTANCE CHECK SYSTEM ($AB59-$AB91)")
    print("=" * 70)

    print("""
Resistance Check at $AB59:

1. LOAD ACTION DATA ($AB59-$AB72):
   - Get action index from $75E8
   - Call $89B6 to get action data pointer into $79
   - Load power values from ($79)+1,2 into $08-$09
   - Load attack power from $75E1-$75E2 into $0E-$0F

2. CALCULATE EFFECTIVENESS ($AB74-$AB87):
   - Divide attack power by resistance value
   - Use 24-bit division at $83F4
   - Check for overflow conditions

3. COMPARE THRESHOLD ($AB89-$AB91):
   - Load tactics index from $6E80
   - Look up threshold from $BB92 table
   - Compare calculated value against threshold
   - Return carry flag set if hit succeeds

Resistance Data Format ($B967):
   Bit 7: Boss/special immunity flag
   Bits 5-6: Elemental category
      00 = No elemental
      01 = Fire type
      10 = Ice type
      11 = Electric/other
   Bits 0-4: Specific resistance value (0-31)
""")

def generate_mlb_labels():
    """Generate MLB labels for Bank 19"""
    print("\n" + "=" * 70)
    print("MLB LABELS FOR BANK 19 (Copy to debug/Dragon Warrior IV.mlb)")
    print("=" * 70)

    labels = """
# ==============================================================================
# Bank 19 - Battle System Deep Analysis Labels
# ==============================================================================

# Action Dispatch System
R:805B:b19_dispatch_main:Main action dispatcher - reads $6E80 mode
R:8062:b19_load_action_idx:Load action index from $75E8
R:8067:b19_lookup_jmptbl:Look up handler in jump table at $8078
R:8071:b19_indirect_jump:Execute handler via indirect jump
R:8078:b19_action_jmptbl:Action handler jump table (8 entries × 2 bytes)

# Math Routines
R:8176:b19_mul16_shift4:16-bit left shift ×4 (multiply by 16)
R:8187:b19_div16_shift4:16-bit right shift ×4 (divide by 16)
R:8198:b19_scale_stat:Scale stat by A register
R:81A5:b19_shift_extended:4-bit shift with extended precision
R:8330:b19_mul16_by_a:16-bit multiply by A (shift-add method)
R:8366:b19_mul24_by_a:24-bit multiply by A (shift-add method)
R:83AA:b19_div16_setup:16-bit division setup
R:83C5:b19_div16_loop:16-bit division loop (16 iterations)
R:83F4:b19_div24_setup:24-bit division setup
R:8414:b19_div24_loop:24-bit division loop (24 iterations)

# Damage Calculation
R:AA67:b19_damage_calc_main:Main damage calculation entry
R:AA6F:b19_damage_init:Initialize damage accumulators
R:AA7B:b19_damage_scale_actor:Scale by actor index ×16
R:AA9F:b19_damage_divide:Divide by tactics divisor
R:AAAF:b19_damage_shift_x16:Left shift result ×16
R:AACF:b19_damage_add_base:Add base power component
R:AAFB:b19_damage_defense:Apply defense reduction
R:AB38:b19_damage_final:Final damage calculation
R:AB4C:b19_damage_no_defense:Skip defense (result direct copy)

# Resistance Check
R:AB59:b19_resist_check_main:Resistance check entry
R:AB6A:b19_resist_load_power:Load attack power values
R:AB78:b19_resist_divide:Divide by resistance
R:AB89:b19_resist_compare:Compare against tactics threshold

# Hit/Miss Determination
R:9135:b19_hit_check_main:Hit/miss check main entry
R:9144:b19_hit_action_type:Check action type for hit formula
R:919A:b19_hit_standard:Standard hit check (action < $29)
R:91A0:b19_hit_clear_dmg:Clear damage output for miss

# Data Tables
R:BB84:b19_tbl_attack_mult:Attack multiplier by tactics (7 entries)
R:BB8B:b19_tbl_stat_divisor:Stat divisor by tactics (7 entries)
R:BB92:b19_tbl_hit_threshold:Hit threshold by tactics (7 entries)
R:BB99:b19_base_damage_val:Base damage value (64)
R:BB3F:b19_tbl_spell_power:Spell power table (9 entries)
R:BB49:b19_tbl_spell_attr:Spell attribute table (9 entries)
R:B80B:b19_tbl_action_effect:Action effect type table (256 bytes)
R:B915:b19_tbl_spell_param1:Spell parameter table 1
R:B949:b19_tbl_spell_param2:Spell parameter table 2
R:B967:b19_tbl_enemy_resist:Enemy resistance data (256 bytes)
R:BA74:b19_tbl_tactics_spell1:Tactics spell priority 1 (7×7)
R:BAA5:b19_tbl_tactics_spell2:Tactics spell priority 2 (48 bytes)
R:BAD5:b19_tbl_tactics_spell3:Tactics spell priority 3 (18 bytes)

# AI Decision Making
R:A8C6:b19_ai_main_entry:AI decision making main entry (mode 4)
R:A8D5:b19_ai_init_flags:Initialize AI decision flags
R:A8E1:b19_ai_scan_targets:Scan valid targets
R:A906:b19_ai_check_spells:Check available spells
R:A92E:b19_ai_select_action:Select best action based on tactics
R:A797:b19_ai_resist_filter:Filter actions by resistance

# Battle RAM (Additional)
G:75E1:battle_atk_power_lo:Attack power low byte
G:75E2:battle_atk_power_hi:Attack power high byte
G:75ED:battle_party_stat_lo:Party stat sum low byte
G:75EE:battle_party_stat_hi:Party stat sum high byte
G:75EF:battle_defense_val:Defense value for reduction
G:75F0:battle_ai_flags:AI decision flags
G:75F2:battle_spell_id:Selected spell ID
G:75F3:battle_target_mask_lo:Valid target mask low
G:75F4:battle_target_mask_hi:Valid target mask high
G:75F5:battle_spell_mask:Available spell mask
"""
    print(labels)

def main():
    rom = read_rom()
    bank_offset = get_bank19_offset()

    print("=" * 70)
    print("DRAGON WARRIOR IV - BANK 19 BATTLE SYSTEM ANALYSIS")
    print("=" * 70)
    print(f"\nBank 19 ROM offset: 0x{bank_offset:05X}")
    print(f"Bank 19 CPU range: $8000-$BFFF")

    analyze_tactics_tables(rom, bank_offset)
    analyze_spell_tables(rom, bank_offset)
    analyze_enemy_data(rom, bank_offset)
    analyze_damage_formula(rom, bank_offset)
    analyze_hit_check(rom, bank_offset)
    analyze_math_routines(rom, bank_offset)
    analyze_action_dispatch(rom, bank_offset)
    analyze_resistance_check(rom, bank_offset)
    generate_mlb_labels()

    print("\n" + "=" * 70)
    print("ANALYSIS COMPLETE")
    print("=" * 70)

if __name__ == "__main__":
    main()
