#!/bin/bash
set -e

# Change to project root inside the container
cd "$(dirname "${BASH_SOURCE[0]}")/.."

echo "Installing latest just..."
JUST_URL=$(curl -s https://api.github.com/repos/casey/just/releases/latest \
  | grep browser_download_url \
  | grep x86_64-unknown-linux-musl.tar.gz \
  | cut -d '"' -f 4)
wget -q "$JUST_URL" -O just.tar.gz
tar -xzf just.tar.gz
mkdir -p "$HOME/.local/bin"
mv just "$HOME/.local/bin/"
rm just.tar.gz

# Add ~/.local/bin to PATH for current and future sessions
export PATH="$HOME/.local/bin:$PATH"
if ! grep -q 'export PATH="$HOME/.local/bin:$PATH"' ~/.bashrc 2>/dev/null; then
  echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
fi

echo "Installing uv..."
curl -Ls https://astral.sh/uv/install.sh | sh

echo "Installing pre-commit if missing..."
if ! command -v pre-commit >/dev/null 2>&1; then
  pip install --user pre-commit
fi

echo "Installing taplo if missing..."
if ! command -v taplo >/dev/null 2>&1; then
  curl -fsSL https://github.com/tamasfe/taplo/releases/latest/download/taplo-full-linux-x86_64.gz \
    | gzip -d - \
    | install -m 755 /dev/stdin "$HOME/.local/bin/taplo" || {
      echo "Warning: Taplo installation failed, skipping."
    }
else
  echo "taplo already installed."
fi

echo "Installed versions:"
just --version
uv --version
pre-commit --version || echo "pre-commit not installed"
if command -v taplo >/dev/null 2>&1; then
  taplo --version
else
  echo "taplo not installed"
fi

# Create Python virtual environment if missing (cross-platform)
if [ ! -d ".venv" ]; then
  echo "Creating Python virtual environment with uv..."
  uv venv --python python3 --python-preference installed
fi

# Detect venv Python interpreter (cross-platform)
if [ -f ".venv/bin/python3" ]; then
  VENV_PYTHON=".venv/bin/python3"
elif [ -f ".venv/Scripts/python.exe" ]; then
  VENV_PYTHON=".venv/Scripts/python.exe"
else
  echo "Error: Could not find Python interpreter in .venv!"
  exit 1
fi

echo "Using venv Python interpreter at: $VENV_PYTHON"

# Optionally upgrade pip in the venv
$VENV_PYTHON -m pip install --upgrade pip

# Run just setup (it should use the venv Python if your Justfile is set up as recommended)
just setup || echo "Warning: just setup failed. Please check your Justfile and environment."

echo "Setup script completed successfully."
