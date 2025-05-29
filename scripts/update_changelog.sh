#!/usr/bin/env bash
set -euo pipefail

echo "📝 Generating changelog with Cocogitto..."

# Generate changelog from latest tag (do not use --at HEAD unless you have a tag there)
cog changelog

echo "✅ Changelog updated successfully."
