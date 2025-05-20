#!/usr/bin/env bash
set -euo pipefail

# Go to the workspace directory
if [ -d "/workspaces/py-launch-blueprint-main" ]; then
  echo "In container: switching to workspace dir"
  cd /workspaces/py-launch-blueprint-main
else
  echo "Not in container: skipping cd to /workspaces"
fi

# Create virtual environment if not exists
if [ ! -d ".venv" ]; then
  echo "Creating virtual environment..."
  python3 -m venv .venv
fi

# Activate virtual environment
if [ -f ".venv/bin/activate" ]; then
  echo "Activating .venv (Linux/macOS)..."
  source .venv/bin/activate
elif [ -f ".venv/Scripts/activate" ]; then
  echo "Activating .venv (Windows)..."
  source .venv/Scripts/activate
else
  echo "No virtual environment found. Skipping activation."
fi

# Install dependencies
if [ -f "pyproject.toml" ]; then
  echo "Installing from pyproject.toml..."
  pip install --upgrade pip
  pip install .
elif [ -f "requirements.txt" ]; then
  echo "Installing from requirements.txt..."
  pip install --upgrade pip
  pip install -r requirements.txt
else
  echo "No requirements file found. Skipping dependency install."
fi

# Setup tasks
echo "Running setup tasks..."

if command -v pre-commit &>/dev/null; then
  echo "Installing pre-commit hooks..."
  pre-commit install
else
  echo "pre-commit not installed, skipping."
fi
 
echo "✅ Setup complete."
