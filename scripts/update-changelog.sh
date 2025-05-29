#!/usr/bin/env bash
# Explicitly call cocogitto (cog) with the correct config, removing dynamic config switching.
set -euo pipefail

echo "📝 Generating changelog with cocogitto..."
cog --config .cog.cocohito.toml changelog
