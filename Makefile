# Variables
ifdef VIRTUAL_ENV
    PYTHON = $(VIRTUAL_ENV)/Scripts/python
else
    PYTHON = python
endif
PIP = $(PYTHON) -m pip
PYTEST = $(PYTHON) -m pytest
BLACK = black
RUFF = ruff
ISORT = isort
MYPY = mypy

# Targets
.PHONY: all install install-dev test format lint type-check clean help

all: help

# Install dependencies
install:
	$(PIP) install .

# Install development dependencies
install-dev:
	$(PIP) install -e ".[dev]"

# Run tests with coverage
test:
	$(PYTEST) tests/test_api.py

# Format code
format:
	$(BLACK) .
	$(ISORT) .

# Lint code with Ruff
lint:
	$(RUFF) check .

# Type checking with mypy
type-check:
	$(MYPY) py_launch_blueprint tests

# Clean up unnecessary files
clean:
	find . -name "*.pyc" -exec rm -f {} +
	find . -name "__pycache__" -exec rm -rf {} +
	rm -rf .pytest_cache
	rm -rf .mypy_cache
	rm -rf .ruff_cache
	rm -rf .coverage
	rm -rf htmlcov
	rm -rf dist
	rm -rf build
	rm -rf *.egg-info

# Show help
help:
	@echo "Available commands:"
	@echo "  make install     Install package"
	@echo "  make install-dev Install development dependencies"
	@echo "  make test        Run tests with coverage"
	@echo "  make format      Format code using Black and isort"
	@echo "  make lint        Lint code with Ruff"
	@echo "  make type-check  Type check with mypy"
	@echo "  make clean       Remove unnecessary files and directories"
