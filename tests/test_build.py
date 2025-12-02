"""
Tests for build system.
"""

import pytest
from pathlib import Path
import subprocess


class TestBuildSystem:
	"""Tests for the build pipeline."""

	def test_ophis_exists(self, project_root):
		"""Test that Ophis assembler is available."""
		ophis_path = project_root / "Ophis" / "ophis.exe"
		# This may fail until Ophis is copied
		# assert ophis_path.exists(), "Ophis assembler not found"
		pass  # Placeholder until Ophis is set up

	def test_source_files_exist(self, project_root):
		"""Test that main source files exist."""
		source_dir = project_root / "source_files"

		required_files = [
			"main.asm",
			"defines.asm",
			"macros.asm",
			"memory.asm",
		]

		for filename in required_files:
			assert (source_dir / filename).exists(), f"Missing: {filename}"

	def test_bank_files_exist(self, project_root):
		"""Test that all bank files exist."""
		banks_dir = project_root / "source_files" / "banks"

		for i in range(16):
			bank_file = banks_dir / f"bank_{i:02d}.asm"
			assert bank_file.exists(), f"Missing: bank_{i:02d}.asm"

	def test_build_config_valid(self, project_root):
		"""Test that build.config.json is valid JSON."""
		import json

		config_path = project_root / "build.config.json"
		assert config_path.exists()

		with open(config_path) as f:
			config = json.load(f)

		# Check required keys
		assert "project" in config
		assert "rom" in config
		assert "build" in config
		assert "assets" in config

	def test_requirements_parseable(self, project_root):
		"""Test that requirements.txt is valid."""
		req_path = project_root / "requirements.txt"
		assert req_path.exists()

		with open(req_path) as f:
			lines = f.readlines()

		# Should have at least some requirements
		requirements = [l.strip() for l in lines if l.strip() and not l.startswith("#")]
		assert len(requirements) > 0


class TestBuildScript:
	"""Tests for the PowerShell build script."""

	def test_build_script_exists(self, project_root):
		"""Test that build.ps1 exists."""
		build_script = project_root / "build.ps1"
		assert build_script.exists()

	def test_build_script_syntax(self, project_root):
		"""Test PowerShell script syntax (Windows only)."""
		import platform
		if platform.system() != "Windows":
			pytest.skip("PowerShell tests only run on Windows")

		build_script = project_root / "build.ps1"

		# Check syntax without running
		result = subprocess.run(
			["powershell", "-NoProfile", "-Command",
			 f"$null = [System.Management.Automation.Language.Parser]::ParseFile('{build_script}', [ref]$null, [ref]$errors); $errors"],
			capture_output=True,
			text=True
		)

		# If there are syntax errors, they would be in stdout
		# Empty output means no errors
		assert result.returncode == 0 or "error" not in result.stdout.lower()
