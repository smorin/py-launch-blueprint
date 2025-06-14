#!/usr/bin/env bash
set -euo pipefail

# Colors for output
GREEN='\033[32m'
YELLOW='\033[33m'
RED='\033[31m'
NC='\033[0m' # No Color

if command -v go >/dev/null 2>&1; then
    echo "✅ Go is already installed: $(go version)"
    exit 0
fi

echo "❗ Go is not installed."
echo "🔧 Installing Go..."

# Detect OS and architecture
OS=$(uname -s)
ARCH=$(uname -m)

# Map architecture names
case "$ARCH" in
    x86_64) ARCH="amd64" ;;
    aarch64|arm64) ARCH="arm64" ;;
    *) echo "❌ Unsupported architecture: $ARCH"; exit 1 ;;
esac

# Map OS names
case "$OS" in
    Darwin) OS="darwin" ;;
    Linux) OS="linux" ;;
    *) echo "❌ Unsupported OS: $OS"; exit 1 ;;
esac

# Get latest Go version
GO_VERSION="1.23.4"  # Update this periodically or fetch dynamically
GO_FILE="go${GO_VERSION}.${OS}-${ARCH}.tar.gz"
GO_URL="https://go.dev/dl/${GO_FILE}"

echo "📦 Downloading Go ${GO_VERSION} for ${OS}/${ARCH}..."

# Download Go
if ! curl -L --progress-bar "${GO_URL}" -o "/tmp/${GO_FILE}"; then
    echo "❌ Failed to download Go"
    exit 1
fi

# Extract and install
echo "📂 Installing Go to ~/.local/go..."
# Create ~/.local if it doesn't exist
mkdir -p "$HOME/.local"

# Remove existing installation if present
rm -rf "$HOME/.local/go"

# Extract Go to ~/.local
if ! tar -C "$HOME/.local" -xzf "/tmp/${GO_FILE}"; then
    echo "❌ Failed to extract Go"
    rm -f "/tmp/${GO_FILE}"
    exit 1
fi

# Clean up
rm -f "/tmp/${GO_FILE}"

# Add to PATH in ~/.zshenv
echo "🔧 Setting up Go environment..."
GO_BIN_PATH="$HOME/.local/go/bin"
GO_PATH_ENTRY="\$GOPATH/bin"
GOPATH_VALUE="\$HOME/go"

# Ensure .zshenv exists
touch "$HOME/.zshenv"

# Add Go binary path using awk for robust checking
if ! awk -v path="$GO_BIN_PATH" '
    BEGIN {found=0}
    /^export PATH=/ {
        if (index($0, path) > 0) {
            found=1;
            exit;
        }
    }
    END {exit !found}' "$HOME/.zshenv"; then
    echo "export PATH=\"\$PATH:$GO_BIN_PATH\"" >> "$HOME/.zshenv"
    echo -e "${GREEN}Added Go binary path to PATH${NC}"
else
    echo -e "${GREEN}✓${NC} PATH already contains $GO_BIN_PATH"
fi

# Set GOPATH if not already set to the correct value
if ! grep -q "^export GOPATH=\"$GOPATH_VALUE\"" "$HOME/.zshenv" 2>/dev/null; then
    # Remove any existing GOPATH line first to avoid conflicts
    sed -i.bak '/^export GOPATH=/d' "$HOME/.zshenv" 2>/dev/null || true
    echo "export GOPATH=\"$GOPATH_VALUE\"" >> "$HOME/.zshenv"
    echo -e "${GREEN}Set GOPATH${NC}"
else
    echo -e "${GREEN}✓${NC} GOPATH already set correctly"
fi

# Add GOPATH/bin to PATH using awk for robust checking
if ! awk -v path="$GO_PATH_ENTRY" '
    BEGIN {found=0}
    /^export PATH=/ {
        if (index($0, path) > 0) {
            found=1;
            exit;
        }
    }
    END {exit !found}' "$HOME/.zshenv"; then
    echo "export PATH=\"\$PATH:$GO_PATH_ENTRY\"" >> "$HOME/.zshenv"
    echo -e "${GREEN}Added GOPATH/bin to PATH${NC}"
else
    echo -e "${GREEN}✓${NC} PATH already contains $GO_PATH_ENTRY"
fi

# Source the file to test
export PATH="$PATH:$HOME/.local/go/bin"

# Verify installation
if command -v go >/dev/null 2>&1; then
    echo "✅ Go installation complete: $(go version)"
    echo "📝 Please run 'source ~/.zshenv' or open a new terminal to update your PATH"
else
    echo "❌ Go installation failed. Please install manually: https://go.dev/dl/"
    exit 1
fi