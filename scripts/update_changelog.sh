#!/usr/bin/env bash
set -euo pipefail

echo "📝 Generating changelog with Cocogitto..."

# Backup original config if it exists
if [ -f cog.toml ]; then
  cp cog.toml cog.toml.bak
else
  touch cog.toml.bak  # dummy backup so restore step works without error
fi

# Write minimal config for cog changelog
cat > cog.toml <<EOF
repository = "https://github.com/smorin/py-launch-blueprint"
template = "conventional"
remote = "origin"
path = "CHANGELOG.md"
EOF

# Run changelog generation
cog changelog

# Restore original config
if [ -f cog.toml.bak ]; then
  mv cog.toml.bak cog.toml
else
  rm -f cog.toml
fi

echo "✅ Changelog updated successfully."
