#!/usr/bin/env bash
set -euo pipefail

echo "📝 Generating changelog with cocogitto..."
cog --config .cog.cocohito.toml changelog
