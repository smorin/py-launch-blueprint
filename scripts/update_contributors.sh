#!/bin/bash
set -e

echo "✅ Generating CONTRIBUTORS.md from Git history..."

# Output a markdown list of contributors using Git log
{
  echo "# Contributors"
  echo
  git log --format='%aN' | sort -u | while read name; do
    echo "- $name"
  done
} > CONTRIBUTORS.md

echo "✅ CONTRIBUTORS.md updated."
