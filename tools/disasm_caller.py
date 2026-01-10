#!/usr/bin/env python3
"""Disassemble the EXP caller at $9D46."""

ROM_PATH = 'roms/Dragon Warrior IV (1992-10)(Enix)(US).nes'

# 6502 opcodes (partial, enough for this routine)
OPCODES = {
    0xa9: ('LDA', 'imm', 2),
    0xa5: ('LDA', 'zp', 2),
    0xad: ('LDA', 'abs', 3),
    0xb1: ('LDA', 'ind_y', 2),
    0xb5: ('LDA', 'zp_x', 2),
    0xbd: ('LDA', 'abs_x', 3),
    0x85: ('STA', 'zp', 2),
    0x8d: ('STA', 'abs', 3),
    0x9d: ('STA', 'abs_x', 3),
    0xc9: ('CMP', 'imm', 2),
    0xf0: ('BEQ', 'rel', 2),
    0xd0: ('BNE', 'rel', 2),
    0xe6: ('INC', 'zp', 2),
    0x0a: ('ASL', 'acc', 1),
    0x06: ('ASL', 'zp', 2),
    0x26: ('ROL', 'zp', 2),
    0x65: ('ADC', 'zp', 2),
    0x18: ('CLC', 'impl', 1),
    0x48: ('PHA', 'impl', 1),
    0x68: ('PLA', 'impl', 1),
    0xaa: ('TAX', 'impl', 1),
    0x20: ('JSR', 'abs', 3),
    0x4c: ('JMP', 'abs', 3),
    0x60: ('RTS', 'impl', 1),
}

def disasm(data, start_addr, count=20):
    """Disassemble data starting at start_addr."""
    pc = start_addr
    i = 0
    lines = 0
    while i < len(data) and lines < count:
        op = data[i]
        if op in OPCODES:
            mnem, mode, size = OPCODES[op]
            if size == 1:
                print(f'${pc:04x}: {op:02x}        {mnem}')
            elif size == 2:
                arg = data[i+1]
                if mode == 'rel':
                    target = pc + 2 + (arg if arg < 128 else arg - 256)
                    print(f'${pc:04x}: {op:02x} {arg:02x}     {mnem} ${target:04x}')
                elif mode == 'imm':
                    print(f'${pc:04x}: {op:02x} {arg:02x}     {mnem} #${arg:02x}')
                elif mode == 'zp':
                    print(f'${pc:04x}: {op:02x} {arg:02x}     {mnem} ${arg:02x}')
                elif mode == 'zp_x':
                    print(f'${pc:04x}: {op:02x} {arg:02x}     {mnem} ${arg:02x},X')
                elif mode == 'ind_y':
                    print(f'${pc:04x}: {op:02x} {arg:02x}     {mnem} (${arg:02x}),Y')
            elif size == 3:
                lo, hi = data[i+1], data[i+2]
                addr = lo | (hi << 8)
                if mode == 'abs_x':
                    print(f'${pc:04x}: {op:02x} {lo:02x} {hi:02x}  {mnem} ${addr:04x},X')
                else:
                    print(f'${pc:04x}: {op:02x} {lo:02x} {hi:02x}  {mnem} ${addr:04x}')
            pc += size
            i += size
        else:
            print(f'${pc:04x}: {op:02x}        ???')
            pc += 1
            i += 1
        lines += 1

def main():
    # Read entry point at $9F7C
    file_offset = 16 + 18 * 0x4000 + 0x1f7c

    with open(ROM_PATH, 'rb') as f:
        f.seek(file_offset)
        data = f.read(80)

    print("EXP Entry at $9F7C:")
    print("=" * 50)
    disasm(data, 0x9f7c, 30)

if __name__ == '__main__':
    main()
