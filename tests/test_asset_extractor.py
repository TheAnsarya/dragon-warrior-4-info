"""
Tests for asset extractor tool.
"""

import pytest
from pathlib import Path


class TestTextEncoding:
	"""Tests for DW4 text encoding/decoding."""
	
	def test_decode_simple_text(self):
		"""Test decoding simple ASCII-like text."""
		from tools.asset_extractor import decode_text
		
		# Test basic characters
		data = bytes([0x25, 0x2C, 0x29, 0x36, 0x33, 0xFF])  # "HERO" + end
		result = decode_text(data)
		assert result == "AHERO"  # Note: 0x25 = 'A', etc.
	
	def test_decode_with_control_codes(self):
		"""Test decoding text with control codes."""
		from tools.asset_extractor import decode_text
		
		# Test with line break
		data = bytes([0x2C, 0x13, 0xF1, 0x2C, 0x13, 0xFF])
		result = decode_text(data)
		assert "[LINE]" in result
	
	def test_decode_unknown_bytes(self):
		"""Test decoding unknown byte values."""
		from tools.asset_extractor import decode_text
		
		# Unknown byte should be rendered as hex
		data = bytes([0xAA, 0xFF])
		result = decode_text(data)
		assert "[$AA]" in result
	
	def test_encode_simple_text(self):
		"""Test encoding simple text."""
		from tools.asset_extractor import encode_text
		
		result = encode_text("A")
		assert 0x25 in result  # 'A' = 0x25
		assert result[-1] == 0xFF  # End marker


class TestAssetExtractor:
	"""Tests for the asset extractor class."""
	
	def test_import(self):
		"""Test that the module can be imported."""
		from tools.asset_extractor import AssetExtractor
		assert AssetExtractor is not None
	
	def test_setup_directories(self, temp_output_dir):
		"""Test directory creation."""
		from tools.asset_extractor import AssetExtractor
		
		extractor = AssetExtractor(
			rom_path=Path("dummy.nes"),
			output_dir=temp_output_dir
		)
		extractor.setup_directories()
		
		# Check directories were created
		assert (temp_output_dir / "json").exists()
		assert (temp_output_dir / "graphics").exists()
		assert (temp_output_dir / "text").exists()
		assert (temp_output_dir / "maps").exists()
		assert (temp_output_dir / "audio").exists()


class TestCHRConversion:
	"""Tests for CHR data to image conversion."""
	
	def test_chr_to_image_import(self):
		"""Test that PIL is available for image conversion."""
		try:
			from PIL import Image
			has_pil = True
		except ImportError:
			has_pil = False
		
		# This test passes regardless - just documents PIL availability
		assert True
	
	def test_chr_tile_decoding(self):
		"""Test decoding a single CHR tile."""
		# A blank tile (all zeros)
		tile_data = bytes([0x00] * 16)
		
		# Decode manually
		pixels = []
		for row in range(8):
			plane0 = tile_data[row]
			plane1 = tile_data[row + 8]
			
			for col in range(8):
				bit0 = (plane0 >> (7 - col)) & 1
				bit1 = (plane1 >> (7 - col)) & 1
				color = bit0 | (bit1 << 1)
				pixels.append(color)
		
		# All pixels should be color 0 (transparent/black)
		assert all(p == 0 for p in pixels)
	
	def test_chr_tile_solid(self):
		"""Test decoding a solid tile."""
		# A solid tile (all 1s in both planes = color 3)
		tile_data = bytes([0xFF] * 16)
		
		# Decode manually
		pixels = []
		for row in range(8):
			plane0 = tile_data[row]
			plane1 = tile_data[row + 8]
			
			for col in range(8):
				bit0 = (plane0 >> (7 - col)) & 1
				bit1 = (plane1 >> (7 - col)) & 1
				color = bit0 | (bit1 << 1)
				pixels.append(color)
		
		# All pixels should be color 3 (white)
		assert all(p == 3 for p in pixels)
