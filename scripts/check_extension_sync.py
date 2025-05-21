#!/usr/bin/env python3

import json
import sys
import os
from pathlib import Path

EXTENSIONS_FILE = Path(".vscode/extensions.json")
DEVCONTAINER_FILE = Path(".devcontainer/devcontainer.json")

def load_json(file_path):
    try:
        with open(file_path) as f:
            return json.load(f)
    except FileNotFoundError:
        print(f"❌ Error: {file_path} not found.")
        sys.exit(2)
    except json.JSONDecodeError as e:
        print(f"❌ Error parsing {file_path}: {e}")
        sys.exit(2)

def extract_recommended_extensions(data):
    return set(data.get("recommendations", []))

def extract_devcontainer_extensions(data):
    try:
        return set(data["customizations"]["vscode"]["extensions"])
    except KeyError:
        return set()

def main():
    vscode_data = load_json(EXTENSIONS_FILE)
    devcontainer_data = load_json(DEVCONTAINER_FILE)

    vscode_exts = extract_recommended_extensions(vscode_data)
    dev_exts = extract_devcontainer_extensions(devcontainer_data)

    missing = vscode_exts - dev_exts

    if missing:
        print("❌ VSCode extensions not synced with devcontainer configuration!\n")
        print("Missing from .devcontainer/devcontainer.json:")
        for ext in sorted(missing):
            print(f"- {ext}")
        print("\nTo fix: Add these extensions to the `customizations.vscode.extensions` array in `.devcontainer/devcontainer.json`")
        sys.exit(1)

    print("✅ VSCode extensions are in sync.")
    sys.exit(0)

if __name__ == "__main__":
    main()
