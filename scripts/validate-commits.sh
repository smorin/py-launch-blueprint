#!/usr/bin/env bash
# Explicitly call cocogitto (cog) with the correct config, removing dynamic config switching.
set -euo pipefail

echo "🔍 Validating commits with cocogitto..."
cog --config .cog.cod.toml check
