#!/usr/bin/env python3
"""
Text Decoder/Encoder for Dragon Warrior IV

Decodes and encodes text using the DW4 character table (TBL format).
"""

import json
from pathlib import Path
from typing import Dict, List, Optional, Tuple
from dataclasses import dataclass

import click
from rich.console import Console
from rich.table import Table

# Dragon Warrior IV Character Table (verified from GameInfo TBL)
DW4_TBL: Dict[int, str] = {
    # Space
    0x00: " ",
    # Numbers (0-9)
    0x01: "0", 0x02: "1", 0x03: "2", 0x04: "3", 0x05: "4",
    0x06: "5", 0x07: "6", 0x08: "7", 0x09: "8", 0x0a: "9",
    # Lowercase letters (a-z)
    0x0b: "a", 0x0c: "b", 0x0d: "c", 0x0e: "d", 0x0f: "e",
    0x10: "f", 0x11: "g", 0x12: "h", 0x13: "i", 0x14: "j",
    0x15: "k", 0x16: "l", 0x17: "m", 0x18: "n", 0x19: "o",
    0x1a: "p", 0x1b: "q", 0x1c: "r", 0x1d: "s", 0x1e: "t",
    0x1f: "u", 0x20: "v", 0x21: "w", 0x22: "x", 0x23: "y",
    0x24: "z",
    # Uppercase letters (A-Z)
    0x25: "A", 0x26: "B", 0x27: "C", 0x28: "D", 0x29: "E",
    0x2a: "F", 0x2b: "G", 0x2c: "H", 0x2d: "I", 0x2e: "J",
    0x2f: "K", 0x30: "L", 0x31: "M", 0x32: "N", 0x33: "O",
    0x34: "P", 0x35: "Q", 0x36: "R", 0x37: "S", 0x38: "T",
    0x39: "U", 0x3a: "V", 0x3b: "W", 0x3c: "X", 0x3d: "Y",
    0x3e: "Z",
    # Em dash
    0x3f: "—",
    # Punctuation ($65-$79)
    0x65: "—", 0x66: """, 0x67: """, 0x68: "'", 0x69: "'",
    0x6a: "'", 0x6b: "'", 0x6c: ".'", 0x6d: "?", 0x6e: "!",
    0x6f: "-", 0x70: "✱", 0x71: ":", 0x72: "…",
    0x73: "🪦", 0x74: "💀",  # Tombstone, Skull
    0x75: "(", 0x76: ")", 0x77: ",", 0x78: ".",
    0x79: "「",
    # UI Symbols
    0x80: "▼", 0x81: "▶",
    # Control codes
    0xf0: "[WAIT]",
    0xf1: "[LINE]",
    0xf2: "[NAME]",
    0xf3: "[ITEM]",
    0xf4: "[NUM]",
    0xfe: "[PAUSE]",
    0xff: "[END]",
}

# Reverse lookup table
DW4_TBL_REVERSE: Dict[str, int] = {}
for code, char in DW4_TBL.items():
    if char not in DW4_TBL_REVERSE:  # Keep first occurrence for multi-mapping
        DW4_TBL_REVERSE[char] = code


@dataclass
class DecodedString:
    """Represents a decoded text string with metadata."""
    offset: int
    raw_bytes: bytes
    decoded: str
    length: int
    has_control_codes: bool
    unknown_bytes: List[int]


def decode_byte(byte: int) -> str:
    """Decode a single byte to its character representation."""
    if byte in DW4_TBL:
        return DW4_TBL[byte]
    return f"[${byte:02x}]"


def decode_text(data: bytes, max_length: int = 1000) -> str:
    """
    Decode DW4 encoded text to readable string.

    Args:
        data: Raw bytes to decode
        max_length: Maximum characters before stopping

    Returns:
        Decoded string
    """
    result = []
    for i, byte in enumerate(data):
        if i >= max_length:
            result.append("[...]")
            break
        if byte == 0xFF:
            result.append("[END]")
            break
        result.append(decode_byte(byte))
    return "".join(result)


def decode_text_detailed(data: bytes, offset: int = 0) -> DecodedString:
    """
    Decode text with detailed metadata.

    Args:
        data: Raw bytes to decode
        offset: File offset of the start of this string

    Returns:
        DecodedString with full details
    """
    decoded_chars = []
    raw_bytes = []
    unknown = []
    has_control = False

    for byte in data:
        raw_bytes.append(byte)

        if byte == 0xFF:
            decoded_chars.append("[END]")
            break

        if byte in DW4_TBL:
            char = DW4_TBL[byte]
            decoded_chars.append(char)
            if char.startswith("[") and char.endswith("]"):
                has_control = True
        else:
            decoded_chars.append(f"[${byte:02x}]")
            unknown.append(byte)

    return DecodedString(
        offset=offset,
        raw_bytes=bytes(raw_bytes),
        decoded="".join(decoded_chars),
        length=len(raw_bytes),
        has_control_codes=has_control,
        unknown_bytes=unknown
    )


def encode_text(text: str) -> bytes:
    """
    Encode readable string to DW4 format.

    Args:
        text: Human-readable text string

    Returns:
        Encoded bytes
    """
    result = []
    i = 0

    while i < len(text):
        # Check for control codes first (e.g., [LINE], [END])
        if text[i] == "[":
            # Find closing bracket
            end = text.find("]", i)
            if end != -1:
                code = text[i:end+1]
                # Look up control code
                for val, name in DW4_TBL.items():
                    if name == code:
                        result.append(val)
                        i = end + 1
                        break
                else:
                    # Unknown control code, try to parse as hex
                    if code.startswith("[$") and code.endswith("]"):
                        try:
                            hex_val = int(code[2:-1], 16)
                            result.append(hex_val)
                        except ValueError:
                            pass
                    i = end + 1
                continue

        # Check for multi-character sequences (like ".'")
        matched = False
        for length in [2, 1]:  # Check 2-char sequences first
            if i + length <= len(text):
                substr = text[i:i+length]
                if substr in DW4_TBL_REVERSE:
                    result.append(DW4_TBL_REVERSE[substr])
                    i += length
                    matched = True
                    break

        if not matched:
            # Single character lookup
            char = text[i]
            if char in DW4_TBL_REVERSE:
                result.append(DW4_TBL_REVERSE[char])
            else:
                # Skip unknown characters or encode as space
                result.append(0x00)
            i += 1

    # Ensure string ends with terminator
    if not result or result[-1] != 0xFF:
        result.append(0xFF)

    return bytes(result)


def find_strings_in_data(data: bytes, min_length: int = 3) -> List[DecodedString]:
    """
    Find potential text strings in binary data.

    Args:
        data: Binary data to search
        min_length: Minimum string length to report

    Returns:
        List of found strings
    """
    strings = []
    i = 0

    while i < len(data):
        # Look for potential string start (printable character)
        if data[i] in DW4_TBL and data[i] != 0xFF:
            start = i
            # Read until terminator or invalid byte
            end = start
            valid_chars = 0

            while end < len(data):
                byte = data[end]
                if byte == 0xFF:
                    end += 1
                    break
                if byte not in DW4_TBL:
                    break
                if DW4_TBL[byte] not in ("[WAIT]", "[LINE]", "[NAME]", "[ITEM]", "[NUM]", "[PAUSE]"):
                    valid_chars += 1
                end += 1

            # Check if this looks like a real string
            if end > start and valid_chars >= min_length:
                string_data = data[start:end]
                decoded = decode_text_detailed(string_data, start)
                strings.append(decoded)
                i = end
                continue

        i += 1

    return strings


def load_tbl_file(path: Path) -> Dict[int, str]:
    """
    Load a TBL file format character table.

    Args:
        path: Path to .tbl file

    Returns:
        Dictionary mapping byte values to characters
    """
    table = {}

    with open(path, 'r', encoding='utf-8') as f:
        for line in f:
            line = line.strip()
            # Skip comments and empty lines
            if not line or line.startswith('#') or line.startswith(';'):
                continue

            # Parse XX=CHAR format
            if '=' in line:
                parts = line.split('=', 1)
                try:
                    byte_val = int(parts[0], 16)
                    char = parts[1] if len(parts) > 1 else ''
                    table[byte_val] = char
                except ValueError:
                    continue

    return table


# CLI Commands
@click.group()
def cli():
    """Dragon Warrior IV Text Decoder/Encoder."""
    pass


@cli.command()
@click.argument("text")
def encode(text: str):
    """Encode a text string to DW4 format."""
    console = Console()

    encoded = encode_text(text)
    hex_str = " ".join(f"{b:02x}" for b in encoded)

    console.print(f"[cyan]Input:[/cyan] {text}")
    console.print(f"[green]Encoded:[/green] {hex_str}")
    console.print(f"[yellow]Length:[/yellow] {len(encoded)} bytes")


@cli.command()
@click.argument("hex_string")
def decode(hex_string: str):
    """Decode a hex string to text."""
    console = Console()

    # Parse hex string
    hex_string = hex_string.replace(" ", "").replace("0x", "").replace(",", "")
    try:
        data = bytes.fromhex(hex_string)
    except ValueError as e:
        console.print(f"[red]Error parsing hex string: {e}[/red]")
        return

    decoded = decode_text_detailed(data)

    console.print(f"[cyan]Input:[/cyan] {hex_string}")
    console.print(f"[green]Decoded:[/green] {decoded.decoded}")
    console.print(f"[yellow]Length:[/yellow] {decoded.length} bytes")
    if decoded.unknown_bytes:
        console.print(f"[red]Unknown bytes:[/red] {[f'${b:02x}' for b in decoded.unknown_bytes]}")


@cli.command()
@click.argument("rom_path", type=click.Path(exists=True))
@click.option("--offset", "-o", type=str, default="0", help="Start offset (hex or decimal)")
@click.option("--length", "-l", type=int, default=256, help="Bytes to read")
@click.option("--min-length", "-m", type=int, default=3, help="Minimum string length")
def scan(rom_path: str, offset: str, length: int, min_length: int):
    """Scan ROM for text strings."""
    console = Console()

    # Parse offset
    if offset.startswith("0x") or offset.startswith("$"):
        start_offset = int(offset.replace("$", "0x"), 16)
    else:
        start_offset = int(offset)

    # Read ROM data
    with open(rom_path, "rb") as f:
        f.seek(start_offset)
        data = f.read(length)

    strings = find_strings_in_data(data, min_length)

    if not strings:
        console.print("[yellow]No strings found in specified range.[/yellow]")
        return

    table = Table(title=f"Found Strings (offset ${start_offset:06X})")
    table.add_column("Offset", style="cyan")
    table.add_column("Length", style="yellow")
    table.add_column("Text", style="green")

    for s in strings:
        actual_offset = start_offset + s.offset
        table.add_row(
            f"${actual_offset:06X}",
            str(s.length),
            s.decoded[:60] + ("..." if len(s.decoded) > 60 else "")
        )

    console.print(table)
    console.print(f"\n[cyan]Total strings found:[/cyan] {len(strings)}")


@cli.command()
def table():
    """Display the character table."""
    console = Console()

    tbl = Table(title="DW4 Character Table")
    tbl.add_column("Hex", style="cyan", width=6)
    tbl.add_column("Char", style="green", width=8)
    tbl.add_column("Hex", style="cyan", width=6)
    tbl.add_column("Char", style="green", width=8)
    tbl.add_column("Hex", style="cyan", width=6)
    tbl.add_column("Char", style="green", width=8)
    tbl.add_column("Hex", style="cyan", width=6)
    tbl.add_column("Char", style="green", width=8)

    # Organize into columns
    items = sorted(DW4_TBL.items())
    rows = []
    row = []
    for code, char in items:
        display_char = char if char.strip() else "(space)"
        row.extend([f"${code:02x}", display_char])
        if len(row) >= 8:
            rows.append(row)
            row = []
    if row:
        while len(row) < 8:
            row.extend(["", ""])
        rows.append(row)

    for r in rows:
        tbl.add_row(*r)

    console.print(tbl)


if __name__ == "__main__":
    cli()
