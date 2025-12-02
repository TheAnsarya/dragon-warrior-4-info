#!/usr/bin/env python3
"""
Extract and document the DTE (Dual Tile Encoding) table from Dragon Warrior IV.

Based on analysis, the DTE table is at ROM 0x5B3B4 (Bank 22, CPU $B3A4).
This maps bytes $80-$FF to two-character combinations.
"""

ROM_PATH = r"c:\Users\me\source\repos\dragon-warrior-4-info\roms\Dragon Warrior IV (1992-10)(Enix)(US).nes"

# Base TBL encoding
TBL_DECODE = {0x00: ' ', 0xFF: '<END>', 0xFD: '<LINE>', 0xFE: '<FE>'}
for i in range(10):
    TBL_DECODE[0x01 + i] = str(i)
for i, c in enumerate('abcdefghijklmnopqrstuvwxyz'):
    TBL_DECODE[0x0B + i] = c
for i, c in enumerate('ABCDEFGHIJKLMNOPQRSTUVWXYZ'):
    TBL_DECODE[0x25 + i] = c

# Common punctuation and special characters (need to verify these)
TBL_DECODE[0x3F] = '.'
TBL_DECODE[0x40] = ','
TBL_DECODE[0x41] = '-'
TBL_DECODE[0x42] = '...'
TBL_DECODE[0x43] = '!'
TBL_DECODE[0x44] = '?'
TBL_DECODE[0x45] = "'"
TBL_DECODE[0x46] = '('
TBL_DECODE[0x47] = ')'
TBL_DECODE[0x48] = ':'
TBL_DECODE[0x49] = ';'
TBL_DECODE[0x4A] = '/'
TBL_DECODE[0x4B] = '*'
TBL_DECODE[0x4C] = '&'
TBL_DECODE[0x4D] = '%'
TBL_DECODE[0x4E] = '#'
TBL_DECODE[0x4F] = '@'
TBL_DECODE[0x50] = '~'
TBL_DECODE[0x51] = '+'
TBL_DECODE[0x52] = '='
TBL_DECODE[0x53] = '<'
TBL_DECODE[0x54] = '>'
TBL_DECODE[0x55] = '"'
TBL_DECODE[0x56] = '^'
TBL_DECODE[0x57] = '_'
TBL_DECODE[0x58] = '`'

def decode_byte(b):
    """Decode a single byte to character."""
    return TBL_DECODE.get(b, f'<{b:02X}>')

def main():
    with open(ROM_PATH, 'rb') as f:
        rom = f.read()
    
    # DTE table location
    # The actual start offset needs investigation - let's look more carefully
    # We found candidates around 0x5B3B4 but need to find exact start
    
    # First, let's look at the area more carefully
    print("=" * 70)
    print("DTE TABLE ANALYSIS")
    print("=" * 70)
    
    # Look for table start by finding where valid entries begin
    search_start = 0x5B300  # A bit before our candidate
    search_end = 0x5B500
    
    print(f"\nSearching ROM range 0x{search_start:05X} - 0x{search_end:05X}...")
    print()
    
    # Look at the raw bytes
    print("Raw bytes around DTE table area:")
    for offset in range(0x5B390, 0x5B410, 16):
        hex_str = ' '.join(f'{b:02X}' for b in rom[offset:offset+16])
        # Decode pairs
        pairs = []
        for i in range(0, 16, 2):
            b1, b2 = rom[offset+i], rom[offset+i+1]
            c1 = decode_byte(b1)
            c2 = decode_byte(b2)
            if len(c1) == 1 and len(c2) == 1:
                pairs.append(f'{c1}{c2}')
            else:
                pairs.append('..')
        print(f"0x{offset:05X}: {hex_str}  | {' '.join(pairs)}")
    
    # The DTE table appears to start at 0x5B3A4 based on the pattern
    # Let's verify by looking at what codes come before $80
    
    print("\n" + "=" * 70)
    print("EXTRACTING DTE TABLE")
    print("=" * 70)
    
    # Try different alignments
    for table_start in [0x5B3A4, 0x5B3A2, 0x5B3A0, 0x5B3B0, 0x5B3B4]:
        print(f"\n--- Testing table at ROM 0x{table_start:05X} ---")
        
        dte = {}
        for code in range(0x80, 0x100):
            if code in [0xFD, 0xFE, 0xFF]:  # Control codes
                continue
            idx = (code - 0x80) * 2
            b1 = rom[table_start + idx]
            b2 = rom[table_start + idx + 1]
            c1 = decode_byte(b1)
            c2 = decode_byte(b2)
            if len(c1) == 1 and len(c2) == 1:
                dte[code] = c1 + c2
            else:
                dte[code] = f'[{b1:02X}{b2:02X}]'
        
        # Show some entries
        print("Sample DTE entries:")
        for code in [0x80, 0x81, 0x82, 0x83, 0x84, 0x85, 0x86, 0x87, 0x88, 0x89, 0x8A, 0x8B, 0x8C, 0x8D, 0x8E, 0x8F]:
            if code in dte:
                print(f"  ${code:02X} = '{dte[code]}'")
        
        # Try to decode a known string to verify
        # Casino text "speed you like" should decode with correct DTE
        # Actually, let's try to decode something we know exists
        
    # Now let's try to find the exact table by looking for alignment with known text
    print("\n" + "=" * 70)
    print("VERIFYING DTE TABLE")
    print("=" * 70)
    
    # The casino text at Bank 23 uses the menu system
    # Let's find dialogue text that would use DTE
    
    # Look at Bank 27 chapter titles area which has readable text
    # "The Royal Soldiers" at $A676
    chapter_area = 0x6E666  # Bank 27, around the chapter text
    
    print(f"\nLooking at Bank 27 chapter area (ROM 0x{chapter_area:05X}):")
    for offset in range(chapter_area, chapter_area + 0x100, 32):
        segment = rom[offset:offset+32]
        # Try to decode
        decoded = ''
        for b in segment:
            if b <= 0x58:  # Basic TBL range
                decoded += decode_byte(b)
            elif 0x80 <= b <= 0xFC:
                decoded += f'[{b:02X}]'
            elif b == 0xFF:
                decoded += '<END>'
                break
            else:
                decoded += f'<{b:02X}>'
        print(f"0x{offset:05X}: {decoded[:60]}")

if __name__ == "__main__":
    main()
