#!/bin/bash
set -e

if [ -x ".venv/bin/python3" ]; then
    echo ".venv/bin/python3"
    exit 0
fi

if [ -x ".venv/Scripts/python.exe" ]; then
    echo ".venv/Scripts/python.exe"
    exit 0
fi

echo "Error: Python interpreter not found in .venv!" >&2
exit 1
