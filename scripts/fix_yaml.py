#!/usr/bin/env python3
"""
YAML file fixer script that normalizes boolean values.
"""
from pathlib import Path
from typing import Any

from ruamel.yaml import YAML

yaml = YAML()
yaml.preserve_quotes = True
yaml.map_indent = 2  # Consistent indentation
yaml.sequence_indent = 4


def normalize_yaml_booleans(data: Any) -> Any:
    """Normalize YAML boolean values to proper boolean types."""
    if isinstance(data, dict):
        return {k: normalize_yaml_booleans(v) for k, v in data.items()}
    elif isinstance(data, list):
        return [normalize_yaml_booleans(item) for item in data]
    elif isinstance(data, str):
        if data.lower() == "yes":
            return True
        if data.lower() == "no":
            return False
    return data


def fix_yaml_file(path: Path) -> None:
    """Fix a single YAML file."""
    try:
        with path.open("r", encoding="utf-8", errors="replace") as f:
            data = yaml.load(f)

        if data is not None:
            normalized_data = normalize_yaml_booleans(data)
            with path.open("w", encoding="utf-8") as f:
                yaml.dump(normalized_data, f)
            print(f"Fixed: {path}")
        else:
            print(f"Skipped (empty): {path}")
    except Exception as e:
        print(f"Error fixing {path}: {e}")


def run() -> None:
    """Run the YAML fixer on all YAML files in the project."""
    root = Path(".")
    yaml_extensions = (".yml", ".yaml")

    yaml_files = []
    for filepath in root.rglob("*"):
        if filepath.suffix in yaml_extensions and not filepath.is_dir():
            yaml_files.append(filepath)

    if not yaml_files:
        print("No YAML files found.")
        return

    print(f"Found {len(yaml_files)} YAML files to process...")
    for filepath in yaml_files:
        fix_yaml_file(filepath)


if __name__ == "__main__":
    run()
