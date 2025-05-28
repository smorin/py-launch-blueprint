#!/usr/bin/env bash
set -euo pipefail

echo "🔄 Updating CONTRIBUTORS.md..."

# Create a temporary file to hold contributor names
TMP_FILE=$(mktemp)
trap 'rm -f "$TMP_FILE"' EXIT

# Extract unique contributor names (excluding bots)
git log --format='%aN' | \
  grep -v -i 'github-actions\[bot\]' | \
  sort -u > "$TMP_FILE"

# Normalize names if needed (example fix)
sed -i 's/Tatiana H./Tatiana Hernández/g' "$TMP_FILE"

# Write header and contributors list
{
  echo "# Contributors"
  echo
  cat "$TMP_FILE"
} > CONTRIBUTORS.md

# Clean up
rm "$TMP_FILE"

echo "✅ CONTRIBUTORS.md updated successfully."
