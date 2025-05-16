#!/usr/bin/env bash

set -euo pipefail

# Only run this part if inside a dev container
if [ -d "/workspaces/py-launch-blueprint-main" ]; then
  echo "In container: switching to workspace dir"
  cd /workspaces/py-launch-blueprint-main
else
  echo "Not in container: skipping cd to /workspaces"
fi

# Activate virtualenv (if needed, adjust this path)
if [ -f ".venv/bin/activate" ]; then
  echo "Activating .venv (Linux/macOS)..."
  source .venv/bin/activate
elif [ -f ".venv/Scripts/activate" ]; then
  echo "Activating .venv (Windows)..."
  source .venv/Scripts/activate
else
  echo "No virtual environment found. Skipping activation."
fi

# Your setup tasks go here 
echo "Running setup tasks..."

# Example: install pre-commit hooks
if command -v pre-commit &>/dev/null; then
  echo "Installing pre-commit hooks..."
  pre-commit install
else
  echo "pre-commit not installed, skipping."
fi

echo "✅ Setup complete."
