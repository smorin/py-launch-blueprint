
# Using the Justfile

This project includes a [`Justfile`](https://github.com/smorin/py-launch-blueprint/blob/main/Justfile) that defines useful commands for common development tasks. [Just](https://github.com/casey/just) is a simple command runner that helps standardize commands across your project.

To use these commands, first [install Just](https://github.com/casey/just#installation). You can view all available commands by running:

```bash
just --list
```
Here are some commonly used commands (this is just a subset of all available commands):

```bash
# Setup your development environment
just setup

# Format code (includes ruff format and import sorting)
just format

# Run linter (code style and quality checks)
just lint

# Run type checker
just typecheck

# Run tests
just test

# Run all checks (tests, linting, and type checking)
just check

# Check installed package version
just version

# Clean up temporary files and caches
just clean

# Set up pre-commit hooks
just pre-commit-setup

# Build the package
just build

# Install in development mode
just install-dev
```

When your virtual environment is activated, you can also use direct commands without uvx:

```bash
just format-pip   # Run formatter directly
just lint-pip     # Run linter directly
just typecheck-pip # Run type checker directly
just test-pip     # Run tests directly with pytest
```

The Justfile standardizes common development tasks and provides a consistent interface for both uvx and direct command execution.

For a full list of available commands, refer to [this guide](../reference/cli_reference.md).
