#!/usr/bin/env python3
"""
Casino Graphics Extractor for Dragon Warrior IV (NES)

Extracts casino-specific graphics from the ROM including:
- Playing card tiles
- Card suit symbols
- UI elements for poker and arena

NES Graphics Format:
- Each tile is 8x8 pixels
- 2bpp (2 bits per pixel = 4 colors per tile)
- Each tile is 16 bytes (2 planes x 8 bytes)

DW4 uses MMC5 mapper with CHR-RAM (not CHR-ROM)
Graphics are loaded from PRG-ROM to CHR-RAM dynamically.
"""

import struct
from pathlib import Path
from dataclasses import dataclass
from typing import List, Tuple

try:
	from PIL import Image
except ImportError:
	print("PIL not installed. Install with: pip install Pillow")
	Image = None


# ============================================================================
# NES Tile Format
# ============================================================================

@dataclass
class NESTile:
	"""An 8x8 NES tile (2bpp, 16 bytes)."""
	data: bytes

	def to_pixels(self) -> List[List[int]]:
		"""Convert to 8x8 pixel array with palette indices (0-3)."""
		pixels = [[0] * 8 for _ in range(8)]
		if len(self.data) != 16:
			return pixels

		for y in range(8):
			plane0 = self.data[y]
			plane1 = self.data[y + 8]

			for x in range(8):
				bit = 7 - x
				pixel = ((plane0 >> bit) & 1) | (((plane1 >> bit) & 1) << 1)
				pixels[y][x] = pixel

		return pixels

	def to_image(self, palette: List[Tuple[int, int, int]]) -> 'Image.Image':
		"""Convert to a PIL Image with the given palette."""
		if Image is None:
			raise ImportError("PIL/Pillow not installed")

		img = Image.new('RGB', (8, 8))
		pixels = self.to_pixels()

		for y in range(8):
			for x in range(8):
				img.putpixel((x, y), palette[pixels[y][x]])

		return img


# ============================================================================
# Palettes
# ============================================================================

# NES system palette (simplified - full palette has 64 colors)
NES_PALETTE = [
	(0x7c, 0x7c, 0x7c),  # 0x00 - Gray
	(0x00, 0x00, 0xfc),  # 0x01 - Blue
	(0x00, 0x00, 0xbc),  # 0x02 - Dark Blue
	# ... (full palette would be here)
]

# Default grayscale palette for extraction
GRAYSCALE_PALETTE = [
	(0, 0, 0),       # 0 - Black (transparent)
	(85, 85, 85),    # 1 - Dark gray
	(170, 170, 170), # 2 - Light gray
	(255, 255, 255), # 3 - White
]

# Card palette approximation (black/red on white)
CARD_PALETTE_BLACK = [
	(255, 255, 255),  # 0 - White (card background)
	(200, 200, 200),  # 1 - Light gray (shading)
	(100, 100, 100),  # 2 - Dark gray
	(0, 0, 0),        # 3 - Black (spades/clubs)
]

CARD_PALETTE_RED = [
	(255, 255, 255),  # 0 - White (card background)
	(255, 200, 200),  # 1 - Light pink
	(200, 0, 0),      # 2 - Dark red
	(255, 0, 0),      # 3 - Red (hearts/diamonds)
]


# ============================================================================
# DW4 Casino Graphics Locations
# ============================================================================

# These are estimated offsets - need to verify with ROM analysis
# DW4 loads graphics dynamically via MMC5 bank switching

# Bank 23 (0x17) contains casino code but graphics are separate
CASINO_GFX_CANDIDATES = [
	# Format: (rom_offset, tile_count, description)
	(0x5C000, 128, "Bank 23 start - casino bank"),
	(0x40000, 256, "Bank 16 - potential graphics"),
	(0x44000, 256, "Bank 17 - potential graphics"),
]


# ============================================================================
# Tile Extraction
# ============================================================================

def extract_tiles(rom_data: bytes, offset: int, count: int) -> List[NESTile]:
	"""Extract tiles from ROM data."""
	tiles = []
	for i in range(count):
		start = offset + (i * 16)
		if start + 16 <= len(rom_data):
			tile_data = rom_data[start:start + 16]
			tiles.append(NESTile(tile_data))
	return tiles


def tiles_to_sheet(
	tiles: List[NESTile],
	palette: List[Tuple[int, int, int]],
	tiles_per_row: int = 16
) -> 'Image.Image':
	"""Combine tiles into a sprite sheet."""
	if Image is None:
		raise ImportError("PIL/Pillow not installed")

	rows = (len(tiles) + tiles_per_row - 1) // tiles_per_row
	width = tiles_per_row * 8
	height = rows * 8

	sheet = Image.new('RGB', (width, height), (128, 128, 128))

	for i, tile in enumerate(tiles):
		x = (i % tiles_per_row) * 8
		y = (i // tiles_per_row) * 8
		tile_img = tile.to_image(palette)
		sheet.paste(tile_img, (x, y))

	return sheet


# ============================================================================
# Card Tile Definitions
# ============================================================================

# Standard playing card layout (estimated tile positions)
# Cards typically use multiple tiles per card face

CARD_SUITS = ["hearts", "diamonds", "clubs", "spades"]
CARD_RANKS = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]

@dataclass
class CardTileMap:
	"""Maps a card to its tile indices."""
	suit: str
	rank: str
	tile_indices: List[int]


# ============================================================================
# Main Extraction
# ============================================================================

def extract_casino_graphics(rom_path: Path, output_dir: Path):
	"""Extract all casino graphics from the ROM."""
	if Image is None:
		print("ERROR: PIL/Pillow not installed. Install with: pip install Pillow")
		return

	print(f"Loading ROM: {rom_path}")
	rom_data = rom_path.read_bytes()

	output_dir.mkdir(parents=True, exist_ok=True)

	# Extract candidate regions and save as sheets for analysis
	for offset, count, description in CASINO_GFX_CANDIDATES:
		print(f"\nExtracting: {description}")
		print(f"  Offset: 0x{offset:06X}, Tiles: {count}")

		tiles = extract_tiles(rom_data, offset, count)

		# Save as grayscale sheet
		sheet = tiles_to_sheet(tiles, GRAYSCALE_PALETTE)
		filename = f"tiles_{offset:06x}_{count}.png"
		sheet_path = output_dir / filename
		sheet.save(sheet_path)
		print(f"  Saved: {sheet_path}")


def analyze_casino_bank(rom_path: Path, output_dir: Path):
	"""Analyze Bank 23 for graphics loading routines."""
	rom_data = rom_path.read_bytes()

	# Bank 23 at file offset 0x5C010 (with 16-byte header)
	bank_offset = 0x5C010
	bank_data = rom_data[bank_offset:bank_offset + 0x4000]

	# Look for CHR bank switching patterns (MMC5)
	# MMC5 uses $5120-$5127 for CHR banking
	mmc5_writes = []
	for i in range(len(bank_data) - 2):
		# LDA #$xx / STA $51xx pattern
		if bank_data[i] == 0xA9 and i + 3 < len(bank_data):
			if bank_data[i+2] == 0x8D:  # STA absolute
				addr = bank_data[i+3] | (bank_data[i+4] << 8) if i + 4 < len(bank_data) else 0
				if 0x5100 <= addr <= 0x5130:
					value = bank_data[i+1]
					mmc5_writes.append({
						'offset': bank_offset + i,
						'cpu_addr': 0x8000 + i,
						'value': value,
						'target': addr
					})

	# Write analysis
	analysis_path = output_dir / "casino_chr_analysis.txt"
	with open(analysis_path, 'w') as f:
		f.write("Casino Bank CHR-RAM Loading Analysis\n")
		f.write("=" * 50 + "\n\n")
		f.write(f"Bank: 23 (0x17)\n")
		f.write(f"ROM Offset: 0x{bank_offset:06X}\n\n")
		f.write("MMC5 Register Writes Found:\n")
		f.write("-" * 50 + "\n")
		for w in mmc5_writes:
			f.write(f"ROM 0x{w['offset']:06X}, CPU ${w['cpu_addr']:04X}: ")
			f.write(f"Write ${w['value']:02X} to ${w['target']:04X}\n")

	print(f"\nAnalysis saved: {analysis_path}")
	return mmc5_writes


if __name__ == "__main__":
	import argparse

	parser = argparse.ArgumentParser(description="Extract DW4 Casino Graphics")
	parser.add_argument("--rom", type=Path, required=True, help="Path to DW4 ROM")
	parser.add_argument("--output", type=Path, default=Path("assets/graphics/casino"),
						help="Output directory")
	parser.add_argument("--analyze", action="store_true",
						help="Analyze casino bank for CHR loading")

	args = parser.parse_args()

	if args.analyze:
		analyze_casino_bank(args.rom, args.output)
	else:
		extract_casino_graphics(args.rom, args.output)
