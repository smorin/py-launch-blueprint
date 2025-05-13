#!/usr/bin/env bash
set -e

# Temporary file for contributors list
TMP_FILE=$(mktemp)

# Extract unique contributor names excluding bots
git log --format='%aN' | \
  grep -v -i 'github-actions\[bot\]' | \
  sort -u > "$TMP_FILE"

# Normalize contributor names (example)
sed -i 's/Tatiana H./Tatiana Hernández/g' "$TMP_FILE"

# Write header and contributors to CONTRIBUTORS.md
{
  echo "# Contributors"
  echo
  cat "$TMP_FILE"
} > CONTRIBUTORS.md

# Clean up temporary file
rm "$TMP_FILE"

echo "CONTRIBUTORS.md updated successfully."
