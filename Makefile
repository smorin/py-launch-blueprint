# Variables
ifdef VIRTUAL_ENV
    PYTHON = $(VIRTUAL_ENV)/Scripts/python
else
    PYTHON = python
endif
UV = uv
UVX = uvx
PYTEST = $(UVX) pytest
BLACK = $(UVX) black
RUFF = $(UVX) ruff
ISORT = $(UVX) isort
MYPY = $(UVX) mypy

# Documentation variables
SPHINX_BUILD = $(UVX) --with sphinx-build sphinx-build
SPHINX_AUTOBUILD = $(UVX) --with sphinx-autobuild sphinx-autobuild

# Targets
.PHONY: all install install-dev test format lint type-check clean help docs docs-live template-docs template-docs-live

all: help

# Install dependencies
install:
	$(UV) pip install .

# Install development dependencies
install-dev:
	$(UV) pip install -e ".[dev]"

# Install documentation dependencies
install-docs:
	$(UV) pip install -e ".[docs]"

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
clean: clean-docs

clean-docs:
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
	rm -rf template_docs/build/
	rm -rf template_docs/_build/

# Show help
help:
	@echo "Available commands:"
	@echo "  make install         Install package"
	@echo "  make install-dev     Install development dependencies"
	@echo "  make install-docs    Install documentation dependencies"
	@echo "  make test            Run tests with coverage"
	@echo "  make format          Format code using Black and isort"
	@echo "  make lint            Lint code with Ruff"
	@echo "  make type-check      Type check with mypy"
	@echo "  make clean           Remove unnecessary files and directories"
	@echo "  make template-docs   Build template documentation"
	@echo "  make docs-help       Show documentation-specific help"

# Documentation targets

# Build template documentation (template_docs/)
template-docs: install-docs
	$(SPHINX_BUILD) -b html template_docs/source template_docs/build/html

# Live preview for template documentation
template-docs-live: install-docs
	$(SPHINX_AUTOBUILD) template_docs/source template_docs/build/html

# Note: docs/ is a template shell and shouldn't be built directly
docs-help:
	@echo "Note: The docs/ directory is a template shell for new projects."
	@echo "It should not be built directly."
	@echo ""
	@echo "Available documentation commands:"
	@echo "  make install-docs     Install documentation dependencies"
	@echo "  make template-docs    Build the template documentation"
	@echo "  make template-docs-live Start live preview server for template docs"
