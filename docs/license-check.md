# License Check Feature

## Overview
The license check feature ensures that all files in the repository have the required copyright headers. This is achieved using the `addlicense` tool.

## Configuration
- repo: https://github.com/google/addlicense
    rev: latest
    hooks:
        - id: addlicense
        args: ["--check", "-l", "mit", "-y", "$(date +'%Y')", "--copyright", "Copyright (c) $(date +'%Y'), Steve Morin"]
        exclude: addlicense/testdata/**
