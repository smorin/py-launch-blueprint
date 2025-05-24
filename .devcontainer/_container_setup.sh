# This script runs inside the Docker container after it's created.
# It installs and configures development tools and dependencies.
#!/usr/bin/env bash
#!/usr/bin/env bash
python -m pip install --upgrade pip
set -euo pipefail

# Detect if running inside a container
in_container=false

if [ -f "/.dockerenv" ]; then
  echo "Running inside a container (.dockerenv found)"
  in_container=true
fi

if grep -qE '(docker|containerd|kubepods)' /proc/1/cgroup 2>/dev/null; then
  echo "Running inside a container (cgroup file contains container runtime)"
  in_container=true
fi

if [ "${container:-}" = "docker" ] || [ "${container:-}" = "podman" ]; then
  echo "Running inside a container (container env var detected)"
  in_container=true
fi

# Go to the workspace directory if inside container
if $in_container; then
  echo "In container: switching to workspace dir"
  cd py-launch-blueprint || echo "Workspace directory not found"
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
if command -v just &>/dev/null; then
  echo "Installing with just..."
  just install
else
  echo "just not found, using pip directly."
  pip install --upgrade pip
  pip install .
fi

# Setup tasks
echo "Running setup tasks..."

if command -v pre-commit &>/dev/null; then
  echo "Installing pre-commit hooks..."
  pre-commit install
else
  echo "pre-commit not installed, skipping."
fi

# Ensure uvx is installed
if ! command -v uvx &>/dev/null; then
  echo "Installing uv (includes uvx)..."
  curl -Ls https://astral.sh/uv/install.sh | bash
  export PATH="$HOME/.local/bin:$PATH"
fi

echo "✅ Setup complete."
