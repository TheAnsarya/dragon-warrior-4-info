#!/usr/bin/env python3
"""
Split game_data.json into separate asset JSON files.
"""

import json
from pathlib import Path

PROJECT_ROOT = Path(__file__).parent.parent


def main():
	# Read the combined game data
	game_data_path = PROJECT_ROOT / "data" / "game_data.json"
	with open(game_data_path, "r", encoding="utf-8") as f:
		data = json.load(f)

	# Ensure output directory exists
	json_dir = PROJECT_ROOT / "assets" / "json"
	json_dir.mkdir(parents=True, exist_ok=True)

	# Create items.json
	items_data = {
		"$schema": "./schemas/items.schema.json",
		"version": "1.0.0",
		"note": data["items"]["note"],
		"equipment_range": data["items"]["equipment_range"],
		"consumable_range": data["items"]["consumable_range"],
		"blank_separator": data["items"]["blank_separator"],
		"no_item": data["items"]["no_item"],
		"equipped_flag": data["items"]["equipped_flag"],
		"items": data["items"]["list"]
	}

	items_path = json_dir / "items.json"
	with open(items_path, "w", encoding="utf-8") as f:
		json.dump(items_data, f, indent="\t", ensure_ascii=False)
	print(f"Created {items_path.name} with {len(items_data['items'])} items")

	# Create characters.json
	characters_data = {
		"$schema": "./schemas/characters.schema.json",
		"version": "1.0.0",
		"party_members": data["party_members"],
		"extra_companions": data["extra_companions"]
	}

	characters_path = json_dir / "characters.json"
	with open(characters_path, "w", encoding="utf-8") as f:
		json.dump(characters_data, f, indent="\t", ensure_ascii=False)
	print(f"Created {characters_path.name} with {len(characters_data['party_members'])} party members and {len(characters_data['extra_companions'])} extra companions")

	# Create chapters.json
	chapters_data = {
		"$schema": "./schemas/chapters.schema.json",
		"version": "1.0.0",
		"chapters": data["chapters"],
		"battle_tactics": data["battle_tactics"],
		"day_night_cycle": data["day_night_cycle"]
	}

	chapters_path = json_dir / "chapters.json"
	with open(chapters_path, "w", encoding="utf-8") as f:
		json.dump(chapters_data, f, indent="\t", ensure_ascii=False)
	print(f"Created {chapters_path.name} with {len(chapters_data['chapters'])} chapters")

	# Create game_info.json (metadata only)
	game_info_data = {
		"$schema": "./schemas/game_info.schema.json",
		"version": "1.0.0",
		"game": data["game"]
	}

	game_info_path = json_dir / "game_info.json"
	with open(game_info_path, "w", encoding="utf-8") as f:
		json.dump(game_info_data, f, indent="\t", ensure_ascii=False)
	print(f"Created {game_info_path.name}")

	print("\nDone! Split game_data.json into separate files:")
	print(f"  - {items_path}")
	print(f"  - {characters_path}")
	print(f"  - {chapters_path}")
	print(f"  - {game_info_path}")


if __name__ == "__main__":
	main()
