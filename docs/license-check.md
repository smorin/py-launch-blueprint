# License Check Feature

## Overview
The license check feature ensures that all files in the repository have the required copyright headers. This is achieved using the `addlicense` tool.

## Configuration
1. Add the following to `.pre-commit-config.yaml`:
   ```yaml
   - repo: https://github.com/google/addlicense
    rev: latest
    hooks:
        - id: addlicense
        args: ["--check", "-l", "mit", "-y", "CURRENT_YEAR", "--copyright", "Copyright (c) CURRENT_YEAR, Steve Morin"]
        exclude: addlicense/testdata/**
