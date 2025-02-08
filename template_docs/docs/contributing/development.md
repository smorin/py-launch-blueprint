---
title: Development Guide
description: Development setup and workflow for contributors
---

# Development Guide

## Local Development Setup

!!! note "Development Requirements" - Python 3.10+ - UV Package Manager - VS Code (recommended) - Git

## Development Workflow

1. **Fork and Clone**

   ```bash
   git clone https://github.com/your-username/py-launch-blueprint
   cd py-launch-blueprint
   ```

2. **Setup Environment**

   ```bash
   uv pip install --editable ".[dev]"
   uvx pre-commit install
   ```

3. **Development Commands**
   ```bash
   just format     # Format code
   just lint       # Run linter
   just test      # Run tests
   just check     # Run all checks
   ```

!!! tip "VS Code Integration"
See our [VS Code guide](../features/vscode.md) for recommended extensions and settings.
