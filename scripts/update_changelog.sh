#!/usr/bin/env bash
set -e

# Generate or update the changelog at the current HEAD using cog
cog changelog --at HEAD
