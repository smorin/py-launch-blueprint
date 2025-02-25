---
title: Installation Guide
description: Step-by-step installation instructions for Py-Launch-Blueprint
---

# Installation Guide

!!! note "Prerequisites"
Before starting, ensure you have: - Python 3.10+ - Git - VS Code (recommended)

## Step-by-Step Installation

### 1. Install UV Package Manager

```bash
# On Unix-like systems
curl -LsSf https://astral.sh/uv/install.sh | sh

# On Windows (PowerShell)
powershell -c "irm https://astral.sh/uv/install.ps1 | iex"
```

### 2. Clone the Repository

```bash
git clone https://github.com/smorin/py-launch-blueprint
cd py-launch-blueprint
```

### 3. Install Dependencies

```bash
# Using uv (recommended)
uv pip install --editable ".[dev]"
```

### 4. Setup Pre-commit Hooks

```bash
uvx pre-commit install
```

### 5. VS Code Configuration

1. Install recommended extensions
2. Configure Python interpreter
3. Enable type checking features

!!! tip "Verification"
Run these commands to verify your setup:
```bash # Run all checks
just check

    # Or individual checks
    just format
    just lint
    just typecheck
    just test
    ```

!!! tip "Troubleshooting"
If you encounter issues: 1. Verify Python version with `python --version` 2. Ensure UV is in your PATH 3. Check the [GitHub issues](https://github.com/smorin/py-launch-blueprint) for known problems
