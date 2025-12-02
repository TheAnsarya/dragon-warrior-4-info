#!/usr/bin/env python3
"""
Examine the text handler code in detail.
"""

ROM_PATH = r"c:\Users\me\source\repos\dragon-warrior-4-info\roms\Dragon Warrior IV (1992-10)(Enix)(US).nes"

def main():
    with open(ROM_PATH, 'rb') as f:
        rom = f.read()

    # Bank 22 starts at 0x58010
    bank22 = 0x58010

    # Text control handler at CPU $8B11 = ROM 0x58B11
    # Let's look at the broader context

    print("Code around text handler ($8AF0-$8B80):")
    print("=" * 70)

    for i in range(0x58AF0, 0x58B80, 16):
        cpu = 0x8000 + (i - bank22)
        hexbytes = ' '.join(f'{b:02X}' for b in rom[i:i+16])
        print(f'{cpu:04X}: {hexbytes}')

    print("\n" + "=" * 70)
    print("Looking for text processing main loop")
    print("=" * 70)

    # Search for JSR to the control handler area
    target_lo = 0x21  # $8B21
    target_hi = 0x8B

    for i in range(bank22, bank22 + 0x4000 - 2):
        if rom[i] == 0x20:  # JSR
            if rom[i+1] == target_lo and rom[i+2] == target_hi:
                cpu = 0x8000 + (i - bank22)
                print(f"JSR $8B21 found at ${cpu:04X}")
                # Show context
                for j in range(max(bank22, i-16), min(i+32, bank22+0x4000), 16):
                    cpu2 = 0x8000 + (j - bank22)
                    hexbytes = ' '.join(f'{b:02X}' for b in rom[j:j+16])
                    marker = " <<<" if i >= j and i < j+16 else ""
                    print(f'  {cpu2:04X}: {hexbytes}{marker}')
                print()

    # Also look for where $F8 is loaded from (text source pointer)
    print("\n" + "=" * 70)
    print("Looking for where text byte is loaded")
    print("=" * 70)

    # Search for STA $F8 patterns
    for i in range(bank22, bank22 + 0x4000 - 2):
        if rom[i] == 0x85 and rom[i+1] == 0xF8:  # STA $F8
            cpu = 0x8000 + (i - bank22)
            # Check what's before (likely LDA)
            if i > bank22 + 3:
                prev_bytes = rom[i-4:i+2]
                print(f"STA $F8 at ${cpu:04X}: prev bytes = {' '.join(f'{b:02X}' for b in prev_bytes)}")

if __name__ == "__main__":
    main()
