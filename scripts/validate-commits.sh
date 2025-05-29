#!/usr/bin/env bash
set -euo pipefail

echo "🔍 Validating commits with cocogitto..."
cog --config .cog.cod.toml check
