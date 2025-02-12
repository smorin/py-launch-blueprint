# Set project-wide variables
py_package_name := "py_launch_blueprint"
command_name := "py-projects"
args := " "


# Text colors
BLACK := '\033[30m'
RED := '\033[31m'
GREEN := '\033[32m'
YELLOW := '\033[33m'
BLUE := '\033[34m'
MAGENTA := '\033[35m'
CYAN := '\033[36m'
WHITE := '\033[37m'
GRAY := '\033[90m'

# Background colors
BG_BLACK := '\033[40m'
BG_RED := '\033[41m'
BG_GREEN := '\033[42m'
BG_YELLOW := '\033[43m'
BG_BLUE := '\033[44m'
BG_MAGENTA := '\033[45m'
BG_CYAN := '\033[46m'
BG_WHITE := '\033[47m'

# Text styles
BOLD := '\033[1m'
DIM := '\033[2m'
ITALIC := '\033[3m'
UNDERLINE := '\033[4m'

# Reset all styles
NC := '\033[0m'

# Display a symbol
CHECK := "$(GREEN)✓$(NC)"
CROSS := "$(RED)✗$(NC)"
DASH := "$(GRAY)-$(NC)"


# List all available recipes
@default:
    just --list --unsorted

# Check if required tools are installed
@check-deps:
    @#!/usr/bin/env sh
    if ! command -v uv >/dev/null 2>&1; then echo "uv is not installed"; exit 1; fi
    if ! command -v python3 >/dev/null 2>&1; then echo "python3 is not installed"; exit 1; fi
    if ! command -v just >/dev/null 2>&1; then echo "just is not installed"; exit 1; fi
    if ! command -v pre-commit >/dev/null 2>&1; then echo "{{YELLOW}}WARNING: pre-commit is not installed{{NC}}"; fi
    echo "All required tools are installed"

alias c := check-deps

# Install package in editable mode with dev dependencies
@install-dev: check-deps
    uv pip install --editable ".[dev]"

# Format code
@format:
    echo "Running formatters..."
    echo "  ruff format"
    uvx --with-editable . ruff format {{py_package_name}}/
    echo "  ruff isort"
    uvx --with-editable . ruff check --select I --fix {{py_package_name}}/

alias f := format

# Run linter (code style and quality checks)
@lint:
    echo "Running linter..."
    echo "  ruff"
    uvx --with-editable . ruff check {{py_package_name}}/

alias l := lint

# Run type checker
@typecheck:
    echo "Running type checker..."
    echo "  mypy"
    uvx --with-editable . mypy {{py_package_name}}/

alias tc := typecheck

# Run tests
@test *options:
    uvx --with-editable . pytest {{options}}

alias t := test

# Run all checks
@check: test lint typecheck
    echo "All checks passed!"

alias ca := check

# Run package command.
@run cmd=command_name *args=args:
    uvx --with-editable . {{cmd}} {{args}}

# Build package
@build: check
    uvx --with-editable . build

alias b := build

# Set up pre-commit hooks
@pre-commit-setup:
    uvx --with-editable . pre-commit install

# Run all pre-commit Hooks
@pre-commit-run:
    uvx --with-editable . pre-commit run --all

alias pc := pre-commit-run

# Check installed package version
@version cmd=command_name:
    {{cmd}} --version

# Clean up temporary files and caches
@clean:
    rm -rf .pytest_cache
    rm -rf .mypy_cache
    rm -rf .ruff_cache
    rm -rf .coverage
    rm -rf htmlcov
    rm -rf dist
    rm -rf build
    rm -rf *.egg-info
    rm -rf .venv
    rm -rf {{py_package_name}}/__pycache__/

# Alternative commands when virtual environment is activated:
# These commands can be used after running 'source .venv/bin/activate'

# Setup virtual environment
@setup-venv:
    python3 -m venv .venv
    echo "Note: After setup, activate the virtual environment with:"
    echo "  source .venv/bin/activate  # On Unix/macOS"
    echo "  .venv\Scripts\activate  # On Windows"

# Install in development mode
@install-dev-pip:
    pip install --editable ".[dev]"

# Format code (includes ruff format and import sorting)
@format-pip:
    echo "Running linter..."
    echo "  ruff"
    ruff format {{py_package_name}}/

# Run linter (code style and quality checks)
@lint-pip:
    ruff check {{py_package_name}}/
    ruff check --select I --fix {{py_package_name}}/

# Run type checker
@typecheck-pip:
    echo "Running type checker..."
    echo "  mypy"
    mypy {{py_package_name}}/

# Run tests
@test-pip *options:
    pytest {{options}}