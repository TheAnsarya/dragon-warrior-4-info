#!/usr/bin/env python3
"""
Format Files Utility for Dragon Warrior IV

Ensures all project files follow formatting conventions:
- Tabs instead of spaces
- UTF-8 encoding
- CRLF line endings
- Proper ASM comment formatting
"""

import re
from pathlib import Path
from typing import List, Optional, Tuple

import click
from rich.console import Console
from rich.table import Table

from tools import PROJECT_ROOT


class FileFormatter:
	"""Formats project files according to conventions."""
	
	# File extensions that should be formatted
	TEXT_EXTENSIONS = {
		".py": {"indent": "tab", "encoding": "utf-8"},
		".asm": {"indent": "tab", "encoding": "utf-8"},
		".inc": {"indent": "tab", "encoding": "utf-8"},
		".json": {"indent": "tab", "encoding": "utf-8"},
		".md": {"indent": "tab", "encoding": "utf-8"},
		".txt": {"indent": "tab", "encoding": "utf-8"},
		".tbl": {"indent": "tab", "encoding": "utf-8"},
		".ps1": {"indent": "tab", "encoding": "utf-8"},
		".yml": {"indent": "2space", "encoding": "utf-8"},  # YAML needs spaces
		".yaml": {"indent": "2space", "encoding": "utf-8"},
	}
	
	def __init__(self, project_root: Path):
		"""Initialize formatter."""
		self.project_root = project_root
		self.console = Console()
		self.stats = {
			"checked": 0,
			"modified": 0,
			"errors": 0,
		}
	
	def format_all(self, dry_run: bool = False) -> None:
		"""Format all files in the project."""
		self.stats = {"checked": 0, "modified": 0, "errors": 0}
		
		for ext, config in self.TEXT_EXTENSIONS.items():
			pattern = f"**/*{ext}"
			for file_path in self.project_root.glob(pattern):
				# Skip certain directories
				if self._should_skip(file_path):
					continue
				
				self.format_file(file_path, config, dry_run)
		
		self._print_summary(dry_run)
	
	def _should_skip(self, file_path: Path) -> bool:
		"""Check if file should be skipped."""
		skip_dirs = {
			".git",
			"__pycache__",
			".venv",
			"venv",
			"node_modules",
			"build",
			"Ophis",  # Don't modify assembler files
		}
		
		parts = file_path.parts
		return any(skip_dir in parts for skip_dir in skip_dirs)
	
	def format_file(self, file_path: Path, config: dict, dry_run: bool = False) -> bool:
		"""Format a single file."""
		self.stats["checked"] += 1
		
		try:
			# Read file
			with open(file_path, "r", encoding="utf-8", errors="replace") as f:
				content = f.read()
			
			original_content = content
			
			# Apply formatting
			content = self._normalize_line_endings(content)
			
			if config["indent"] == "tab":
				content = self._spaces_to_tabs(content)
			
			content = self._remove_trailing_whitespace(content)
			content = self._ensure_final_newline(content)
			
			# Check if modified
			if content != original_content:
				self.stats["modified"] += 1
				
				if not dry_run:
					with open(file_path, "w", encoding="utf-8", newline="\r\n") as f:
						f.write(content)
					self.console.print(f"  [yellow]Modified:[/yellow] {file_path.relative_to(self.project_root)}")
				else:
					self.console.print(f"  [cyan]Would modify:[/cyan] {file_path.relative_to(self.project_root)}")
				
				return True
			
			return False
			
		except Exception as e:
			self.stats["errors"] += 1
			self.console.print(f"  [red]Error:[/red] {file_path.relative_to(self.project_root)}: {e}")
			return False
	
	def _normalize_line_endings(self, content: str) -> str:
		"""Convert all line endings to CRLF."""
		# First convert CRLF to LF, then LF to CRLF
		content = content.replace("\r\n", "\n")
		content = content.replace("\r", "\n")
		content = content.replace("\n", "\r\n")
		return content
	
	def _spaces_to_tabs(self, content: str) -> str:
		"""Convert leading spaces to tabs."""
		lines = content.split("\r\n")
		result = []
		
		for line in lines:
			# Count leading spaces
			stripped = line.lstrip(" ")
			space_count = len(line) - len(stripped)
			
			if space_count > 0:
				# Convert every 4 spaces to a tab (or 2 for continuation)
				# This is a simple heuristic
				tab_count = space_count // 4
				remainder = space_count % 4
				
				# Handle 2-space indents
				if remainder == 2:
					tab_count += 1
					remainder = 0
				
				new_line = "\t" * tab_count + " " * remainder + stripped
				result.append(new_line)
			else:
				result.append(line)
		
		return "\r\n".join(result)
	
	def _remove_trailing_whitespace(self, content: str) -> str:
		"""Remove trailing whitespace from each line."""
		lines = content.split("\r\n")
		return "\r\n".join(line.rstrip() for line in lines)
	
	def _ensure_final_newline(self, content: str) -> str:
		"""Ensure file ends with a single newline."""
		content = content.rstrip()
		return content + "\r\n"
	
	def _print_summary(self, dry_run: bool) -> None:
		"""Print formatting summary."""
		self.console.print("")
		
		table = Table(title="Formatting Summary" + (" (Dry Run)" if dry_run else ""))
		table.add_column("Metric", style="cyan")
		table.add_column("Count", style="green", justify="right")
		
		table.add_row("Files Checked", str(self.stats["checked"]))
		table.add_row("Files Modified", str(self.stats["modified"]))
		table.add_row("Errors", str(self.stats["errors"]))
		
		self.console.print(table)


class ASMFormatter:
	"""Additional formatting for ASM files."""
	
	def __init__(self):
		"""Initialize ASM formatter."""
		self.console = Console()
	
	def format_asm(self, content: str) -> str:
		"""Apply ASM-specific formatting."""
		lines = content.split("\r\n")
		result = []
		
		for line in lines:
			line = self._align_comments(line)
			line = self._format_hex_values(line)
			result.append(line)
		
		return "\r\n".join(result)
	
	def _align_comments(self, line: str) -> str:
		"""Align inline comments to column 40."""
		# Don't process lines that are only comments
		if line.lstrip().startswith(";"):
			return line
		
		# Find inline comment
		if ";" in line:
			code_part, comment_part = line.split(";", 1)
			code_part = code_part.rstrip()
			
			# Pad to column 40 (or further if code is longer)
			if len(code_part) < 40:
				code_part = code_part.ljust(40)
			else:
				code_part += " "
			
			return code_part + ";" + comment_part
		
		return line
	
	def _format_hex_values(self, line: str) -> str:
		"""Ensure hex values use consistent format ($XX)."""
		# Convert 0xXX to $XX
		line = re.sub(r"0x([0-9A-Fa-f]+)", r"$\1", line)
		# Uppercase hex digits
		def upper_hex(match):
			return "$" + match.group(1).upper()
		line = re.sub(r"\$([0-9A-Fa-f]+)", upper_hex, line)
		return line


@click.group()
def cli():
	"""File formatting utilities."""
	pass


@cli.command()
@click.option("--project", "-p", default=str(PROJECT_ROOT), help="Project root directory")
@click.option("--dry-run", "-n", is_flag=True, help="Show what would be changed without modifying files")
def format_all(project: str, dry_run: bool):
	"""Format all project files."""
	formatter = FileFormatter(Path(project))
	formatter.format_all(dry_run)


@cli.command()
@click.argument("file_path", type=click.Path(exists=True))
@click.option("--dry-run", "-n", is_flag=True, help="Show what would be changed")
def format_file(file_path: str, dry_run: bool):
	"""Format a single file."""
	path = Path(file_path)
	formatter = FileFormatter(path.parent)
	
	ext = path.suffix.lower()
	if ext in formatter.TEXT_EXTENSIONS:
		config = formatter.TEXT_EXTENSIONS[ext]
		formatter.format_file(path, config, dry_run)
	else:
		formatter.console.print(f"[yellow]Unknown file type: {ext}[/yellow]")


@cli.command()
@click.option("--project", "-p", default=str(PROJECT_ROOT), help="Project root directory")
def check(project: str):
	"""Check formatting without making changes."""
	formatter = FileFormatter(Path(project))
	formatter.format_all(dry_run=True)


if __name__ == "__main__":
	cli()
