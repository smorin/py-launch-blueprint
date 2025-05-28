import os
from pathlib import Path

ROOT = Path(".")
YAML_EXTENSIONS = (".yml", ".yaml")

def normalize_boolean_lines(text):
    lines = text.splitlines()
    new_lines = []
    for line in lines:
        if ": yes" in line:
            line = line.replace(": yes", ": true")
        if ": no" in line:
            line = line.replace(": no", ": false")
        new_lines.append(line)
    return "\n".join(new_lines)

def fix_yaml_file(path: Path):
    try:
        with path.open("r", encoding="utf-8", errors="replace") as f:
            content = f.read()
        content = normalize_boolean_lines(content)
        with path.open("w", encoding="utf-8") as f:
            f.write(content)
    except Exception as e:
        print(f"Error fixing {path}: {e}")

for filepath in ROOT.rglob("*"):
    if filepath.suffix in YAML_EXTENSIONS:
        fix_yaml_file(filepath)
