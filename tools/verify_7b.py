#!/usr/bin/env python3
"""Verify $7B calculation for EXP thresholds."""

ROM_PATH = 'roms/Dragon Warrior IV (1992-10)(Enix)(US).nes'

def main():
    # Read character EXP data at $A123 in bank 18
    file_offset = 16 + 18 * 0x4000 + 0x2123
    
    with open(ROM_PATH, 'rb') as f:
        f.seek(file_offset)
        data = f.read(48)
    
    print('Raw character EXP data at $A123:')
    char_names = ['Hero', 'Ragnar', 'Alena', 'Cristo', 'Brey', 'Taloon', 'Nara', 'Mara']
    known_l2 = [16, 12, 8, 10, 12, 9, 8, 11]  # Known L2 EXP values
    
    for i, name in enumerate(char_names):
        d = data[i*5:(i+1)*5]
        print(f'{name:8s}: {" ".join(f"{b:02x}" for b in d)}')
        
        # Calculate 7B: collect high bits, ROR into 7B, then >> 3
        val_7b = 0
        for j, b in enumerate(d):
            carry = (b >> 7) & 1
            val_7b = ((val_7b >> 1) & 0x7f) | (carry << 7)
        val_7b >>= 3
        
        print(f'         $7B = {val_7b}, Known L2 = {known_l2[i]}, Match: {val_7b == known_l2[i]}')
        print()

if __name__ == '__main__':
    main()
