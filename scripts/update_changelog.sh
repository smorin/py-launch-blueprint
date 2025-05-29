#!/usr/bin/env bash
set -euo pipefail

echo "📝 Generating changelog with Cocogitto 6.3.0..."

if [ -f cog.toml ]; then
  cp cog.toml cog.toml.bak
fi

cat > cog.toml <<EOF
[changelog]
path = "CHANGELOG.md"
EOF

cog changelog

if [ -f cog.toml.bak ]; then
  mv cog.toml.bak cog.toml
else
  rm -f cog.toml
fi

echo "✅ Changelog updated successfully."