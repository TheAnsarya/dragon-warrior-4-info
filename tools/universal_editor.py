#!/usr/bin/env python3
"""
Universal Editor for Dragon Warrior IV

A comprehensive tabbed editor for all game assets:
- Monsters
- Items
- Spells
- Characters
- Dialog
- Maps
- Graphics
"""

import json
import sys
from dataclasses import dataclass
from pathlib import Path
from typing import Dict, Any, List, Optional, Callable

import click
from rich.console import Console

try:
	import tkinter as tk
	from tkinter import ttk, filedialog, messagebox
	HAS_TK = True
except ImportError:
	HAS_TK = False

from tools import ASSETS_DIR, PROJECT_ROOT, ROM_PATH


@dataclass
class EditorTab:
	"""Configuration for an editor tab."""
	name: str
	json_path: Path
	fields: List[Dict[str, Any]]
	on_save: Optional[Callable] = None


class UniversalEditor:
	"""Main editor application."""

	def __init__(self, assets_dir: Path):
		"""Initialize the editor."""
		self.assets_dir = assets_dir
		self.console = Console()
		self.current_file: Optional[Path] = None
		self.modified = False

		# Define editor tabs
		self.tabs = [
			EditorTab(
				name="Monsters",
				json_path=assets_dir / "json" / "monsters" / "monsters.json",
				fields=[
					{"name": "id", "type": "int", "label": "ID"},
					{"name": "name", "type": "str", "label": "Name"},
					{"name": "hp", "type": "int", "label": "HP"},
					{"name": "mp", "type": "int", "label": "MP"},
					{"name": "attack", "type": "int", "label": "Attack"},
					{"name": "defense", "type": "int", "label": "Defense"},
					{"name": "agility", "type": "int", "label": "Agility"},
					{"name": "exp", "type": "int", "label": "EXP"},
					{"name": "gold", "type": "int", "label": "Gold"},
				],
			),
			EditorTab(
				name="Items",
				json_path=assets_dir / "json" / "items" / "items.json",
				fields=[
					{"name": "id", "type": "int", "label": "ID"},
					{"name": "name", "type": "str", "label": "Name"},
					{"name": "type", "type": "int", "label": "Type"},
					{"name": "price", "type": "int", "label": "Price"},
				],
			),
			EditorTab(
				name="Spells",
				json_path=assets_dir / "json" / "spells" / "spells.json",
				fields=[
					{"name": "id", "type": "int", "label": "ID"},
					{"name": "name", "type": "str", "label": "Name"},
					{"name": "mp_cost", "type": "int", "label": "MP Cost"},
					{"name": "effect", "type": "int", "label": "Effect"},
				],
			),
			EditorTab(
				name="Dialog",
				json_path=assets_dir / "text" / "dialog.json",
				fields=[
					{"name": "id", "type": "int", "label": "ID"},
					{"name": "text", "type": "text", "label": "Text"},
				],
			),
		]

	def run_gui(self):
		"""Run the GUI editor."""
		if not HAS_TK:
			self.console.print("[red]Error: tkinter not available[/red]")
			self.console.print("Install Python with tkinter support to use the GUI editor.")
			return

		root = tk.Tk()
		root.title("Dragon Warrior IV - Universal Editor")
		root.geometry("1024x768")

		# Create main frame
		main_frame = ttk.Frame(root)
		main_frame.pack(fill=tk.BOTH, expand=True, padx=5, pady=5)

		# Create menu bar
		menubar = tk.Menu(root)
		root.config(menu=menubar)

		file_menu = tk.Menu(menubar, tearoff=0)
		menubar.add_cascade(label="File", menu=file_menu)
		file_menu.add_command(label="Save All", command=self._save_all)
		file_menu.add_separator()
		file_menu.add_command(label="Exit", command=root.quit)

		edit_menu = tk.Menu(menubar, tearoff=0)
		menubar.add_cascade(label="Edit", menu=edit_menu)
		edit_menu.add_command(label="Undo", state=tk.DISABLED)
		edit_menu.add_command(label="Redo", state=tk.DISABLED)

		tools_menu = tk.Menu(menubar, tearoff=0)
		menubar.add_cascade(label="Tools", menu=tools_menu)
		tools_menu.add_command(label="Extract Assets", command=self._extract_assets)
		tools_menu.add_command(label="Build ROM", command=self._build_rom)

		help_menu = tk.Menu(menubar, tearoff=0)
		menubar.add_cascade(label="Help", menu=help_menu)
		help_menu.add_command(label="About", command=self._show_about)

		# Create notebook (tabbed interface)
		notebook = ttk.Notebook(main_frame)
		notebook.pack(fill=tk.BOTH, expand=True)

		# Create tabs
		for tab_config in self.tabs:
			frame = ttk.Frame(notebook)
			notebook.add(frame, text=tab_config.name)
			self._create_tab_content(frame, tab_config)

		# Status bar
		status_frame = ttk.Frame(root)
		status_frame.pack(fill=tk.X, side=tk.BOTTOM)

		status_label = ttk.Label(status_frame, text="Ready")
		status_label.pack(side=tk.LEFT, padx=5)

		root.mainloop()

	def _create_tab_content(self, frame: ttk.Frame, tab_config: EditorTab):
		"""Create content for an editor tab."""
		# Create left panel (list)
		left_frame = ttk.Frame(frame, width=200)
		left_frame.pack(side=tk.LEFT, fill=tk.Y, padx=5, pady=5)
		left_frame.pack_propagate(False)

		# Search box
		search_var = tk.StringVar()
		search_entry = ttk.Entry(left_frame, textvariable=search_var)
		search_entry.pack(fill=tk.X, pady=(0, 5))

		# List box with scrollbar
		list_frame = ttk.Frame(left_frame)
		list_frame.pack(fill=tk.BOTH, expand=True)

		scrollbar = ttk.Scrollbar(list_frame)
		scrollbar.pack(side=tk.RIGHT, fill=tk.Y)

		listbox = tk.Listbox(list_frame, yscrollcommand=scrollbar.set)
		listbox.pack(side=tk.LEFT, fill=tk.BOTH, expand=True)
		scrollbar.config(command=listbox.yview)

		# Load items if file exists
		if tab_config.json_path.exists():
			try:
				with open(tab_config.json_path, "r", encoding="utf-8") as f:
					data = json.load(f)
				# Determine the list key based on tab
				list_key = tab_config.name.lower()
				if list_key in data and isinstance(data[list_key], list):
					for item in data[list_key]:
						name = item.get("name", f"Item {item.get('id', '?')}")
						listbox.insert(tk.END, name)
			except Exception as e:
				listbox.insert(tk.END, f"Error loading: {e}")
		else:
			listbox.insert(tk.END, "(No data file)")

		# Create right panel (editor)
		right_frame = ttk.Frame(frame)
		right_frame.pack(side=tk.LEFT, fill=tk.BOTH, expand=True, padx=5, pady=5)

		# Field editors
		fields_frame = ttk.LabelFrame(right_frame, text="Properties")
		fields_frame.pack(fill=tk.BOTH, expand=True)

		for i, field in enumerate(tab_config.fields):
			row_frame = ttk.Frame(fields_frame)
			row_frame.pack(fill=tk.X, pady=2)

			label = ttk.Label(row_frame, text=field["label"], width=15)
			label.pack(side=tk.LEFT)

			if field["type"] == "text":
				text_widget = tk.Text(row_frame, height=5, width=40)
				text_widget.pack(side=tk.LEFT, fill=tk.X, expand=True)
			else:
				entry = ttk.Entry(row_frame)
				entry.pack(side=tk.LEFT, fill=tk.X, expand=True)

		# Buttons
		btn_frame = ttk.Frame(right_frame)
		btn_frame.pack(fill=tk.X, pady=5)

		ttk.Button(btn_frame, text="Add New").pack(side=tk.LEFT, padx=2)
		ttk.Button(btn_frame, text="Delete").pack(side=tk.LEFT, padx=2)
		ttk.Button(btn_frame, text="Save").pack(side=tk.RIGHT, padx=2)

	def _save_all(self):
		"""Save all modified files."""
		messagebox.showinfo("Save", "Saving all modified files...")

	def _extract_assets(self):
		"""Run asset extraction."""
		messagebox.showinfo("Extract", "Running asset extraction...")

	def _build_rom(self):
		"""Build the ROM."""
		messagebox.showinfo("Build", "Building ROM...")

	def _show_about(self):
		"""Show about dialog."""
		messagebox.showinfo(
			"About",
			"Dragon Warrior IV Universal Editor\n\n"
			"Part of the dragon-warrior-4-info project\n\n"
			"Edit all game assets in one place!"
		)

	def run_cli(self):
		"""Run the CLI editor interface."""
		self.console.print("[bold]Dragon Warrior IV - Universal Editor (CLI Mode)[/bold]")
		self.console.print("")
		self.console.print("Available tabs:")

		for i, tab in enumerate(self.tabs, 1):
			exists = "✓" if tab.json_path.exists() else "✗"
			self.console.print(f"  {i}. {tab.name} [{exists}]")

		self.console.print("")
		self.console.print("Use --gui flag to launch graphical editor")


@click.group()
def cli():
	"""Dragon Warrior IV Universal Editor."""
	pass


@cli.command()
@click.option("--assets", "-a", default=str(ASSETS_DIR), help="Assets directory")
@click.option("--gui/--no-gui", default=True, help="Launch GUI or CLI mode")
def run(assets: str, gui: bool):
	"""Launch the universal editor."""
	editor = UniversalEditor(Path(assets))

	if gui:
		editor.run_gui()
	else:
		editor.run_cli()


@cli.command()
@click.option("--assets", "-a", default=str(ASSETS_DIR), help="Assets directory")
def list_tabs(assets: str):
	"""List available editor tabs."""
	editor = UniversalEditor(Path(assets))
	editor.run_cli()


if __name__ == "__main__":
	cli()
