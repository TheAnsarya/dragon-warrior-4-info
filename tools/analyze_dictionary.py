#!/usr/bin/env python3
"""
Analyze the DW4 text dictionary/DTE system.

Based on code analysis:
- Text bytes < $80 go through a dictionary lookup
- Text bytes >= $80 are used directly (or are control codes)
- $F0-$FF are control codes: $FD=LINE, $FE=CTRL, $FF=END
"""

ROM_PATH = r"c:\Users\me\source\repos\dragon-warrior-4-info\roms\Dragon Warrior IV (1992-10)(Enix)(US).nes"

def main():
    with open(ROM_PATH, 'rb') as f:
        rom = f.read()
    
    bank22 = 0x58010
    
    print("=" * 70)
    print("DW4 TEXT DICTIONARY ANALYSIS")
    print("=" * 70)
    
    # The lookup tables at $B964 and $B96C
    table1_offset = bank22 + 0x3964  # $B964
    table2_offset = bank22 + 0x396C  # $B96C
    
    # Table 1 appears to be offsets based on some state ($03DC)
    print("\nTable 1 at $B964 (offset table):")
    table1 = rom[table1_offset:table1_offset + 16]
    print("  " + " ".join(f'{b:02X}' for b in table1))
    
    # Table 2 is the actual character mapping
    print("\nTable 2 at $B96C (character map, 128+ bytes):")
    table2 = rom[table2_offset:table2_offset + 128]
    for i in range(0, len(table2), 16):
        addr = 0xB96C + i
        row = table2[i:i+16]
        print(f"  ${addr:04X}: " + " ".join(f'{b:02X}' for b in row))
    
    # Now let's look at the code at $B975 which references $B232 and $B234
    print("\n" + "=" * 70)
    print("Second lookup routine at $B975:")
    print("=" * 70)
    
    # Code at $B975:
    # A5 F8      LDA $F8
    # 30 0F      BMI (if >=80, skip)
    # A6 F8      LDX $F8
    # BD 32 B2   LDA $B232,X    ; First table
    # 18         CLC
    # 6D DC 03   ADC $03DC
    # AA         TAX
    # BD 34 B2   LDA $B234,X    ; Second table (different!)
    # 85 F8      STA $F8
    # 60         RTS
    
    table3_offset = bank22 + 0x3232  # $B232
    table4_offset = bank22 + 0x3234  # $B234
    
    print("\nTable at $B232 (referenced by alternate lookup):")
    table3 = rom[table3_offset:table3_offset + 128]
    for i in range(0, min(64, len(table3)), 16):
        addr = 0xB232 + i
        row = table3[i:i+16]
        print(f"  ${addr:04X}: " + " ".join(f'{b:02X}' for b in row))
    
    print("\nTable at $B234:")
    table4 = rom[table4_offset:table4_offset + 128]
    for i in range(0, min(64, len(table4)), 16):
        addr = 0xB234 + i
        row = table4[i:i+16]
        print(f"  ${addr:04X}: " + " ".join(f'{b:02X}' for b in row))
    
    # Let's also look at the known DTE table area at $B3A4
    print("\n" + "=" * 70)
    print("Potential DTE entries at $B3A4:")
    print("=" * 70)
    
    dte_offset = bank22 + 0x33A4  # $B3A4
    dte_data = rom[dte_offset:dte_offset + 256]
    
    # These should be pairs of characters
    # TBL: space=00, 0-9=01-0A, a-z=0B-24, A-Z=25-3E
    TBL = {0x00: ' '}
    for i in range(10):
        TBL[0x01 + i] = str(i)
    for i, c in enumerate('abcdefghijklmnopqrstuvwxyz'):
        TBL[0x0B + i] = c
    for i, c in enumerate('ABCDEFGHIJKLMNOPQRSTUVWXYZ'):
        TBL[0x25 + i] = c
    TBL[0x6D] = '?'
    TBL[0x6E] = '!'
    TBL[0x77] = ','
    TBL[0x78] = '.'
    
    def decode_char(b):
        return TBL.get(b, f'<{b:02X}>')
    
    print("DTE pairs (byte pairs decoded as character pairs):")
    for i in range(0, 128, 2):
        code = 0x80 + (i // 2)
        b1, b2 = dte_data[i], dte_data[i+1]
        c1, c2 = decode_char(b1), decode_char(b2)
        if len(c1) == 1 and len(c2) == 1:
            print(f"  ${code:02X} = '{c1}{c2}'  (${b1:02X} ${b2:02X})")
        elif i < 40:  # Only show first 20 if they're garbage
            print(f"  ${code:02X} = {c1}{c2}  (${b1:02X} ${b2:02X})")

if __name__ == "__main__":
    main()
