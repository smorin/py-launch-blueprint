# Quick Start Guide

## Basic Usage

```bash
# Clone the repository
git clone https://github.com/yourusername/py-launch-blueprint
cd py-launch-blueprint

# Install dependencies
uv pip install --editable ".[dev]"

# Setup pre-commit hooks
uvx pre-commit install
```

## Verification

```bash
# Run all checks
just check

# Or individual checks
just format
just lint
just typecheck
just test
```

For more detailed information, see the [Installation Guide](installation.md).
