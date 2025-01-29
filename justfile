# List all commands
default:
    @just --list

# Install all dependencies
setup: setup-dev setup-docs

# Install development dependencies
setup-dev:
    uv pip install --editable ".[dev]"
    pre-commit install

# Install documentation dependencies
setup-docs:
    uv pip install --editable ".[docs]"

# Format code
format:
    black py_launch_blueprint/
    isort py_launch_blueprint/

# Run linter
lint:
    ruff check py_launch_blueprint/

# Run type checker
typecheck:
    mypy py_launch_blueprint/

# Run tests
test:
    pytest --cov=py_launch_blueprint.projects --cov-report=term-missing

# Run all checks
check-all: format lint typecheck test

# Build documentation
docs-build:
    cd template_docs && make html

# Serve documentation
docs-serve:
    cd template_docs && make livehtml

# Clean documentation build
docs-clean:
    cd template_docs && make clean

# Clean all build artifacts
clean:
    rm -rf build/
    rm -rf dist/
    rm -rf *.egg-info
    rm -rf .pytest_cache
    rm -rf .coverage
    rm -rf .mypy_cache
    rm -rf .ruff_cache
    find . -type d -name "__pycache__" -exec rm -rf {} +

# Build package
build:
    uv pip install build
    python -m build

# Publish to PyPI
publish:
    uv pip install twine
    twine upload dist/*
