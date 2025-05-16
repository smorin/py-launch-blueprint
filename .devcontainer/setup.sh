#!/bin/bash
set -e

# Install latest `just`
echo "Installing just..."
curl -s https://api.github.com/repos/casey/just/releases/latest \
  | grep browser_download_url \
  | grep x86_64-unknown-linux-musl.tar.gz \
  | cut -d '"' -f 4 \
  | wget -qi -
tar -xzf just-*-x86_64-unknown-linux-musl.tar.gz
mv just /usr/local/bin/
rm just-*-x86_64-unknown-linux-musl.tar.gz

# Install uv
echo "Installing uv..."
curl -Ls https://astral.sh/uv/install.sh | sh

# Print versions
just --version
uv --version

# Run project setup
just setup
