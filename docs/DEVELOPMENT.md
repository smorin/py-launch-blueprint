# Development Guide

This guide provides instructions for setting up the development environment and contributing to the project.

## Prerequisites

Ensure you have the following installed on your system:

- Python 3.10 or higher
- `uv` package manager
- `just` command runner

## Setup

Follow these steps to set up the development environment:

1. **Clone the repository**:
   ```bash
   git clone https://github.com/smorin/py-launch-blueprint.git
   cd py-launch-blueprint
   ```

2. **Install dependencies**:
   ```bash
   uv pip install --editable ".[dev]"
   ```

3. **Set up pre-commit hooks**:
   ```bash
   uvx pre-commit install
   ```

## Development Workflow

### Running Tests

To run the test suite, use the following command:
```bash
uvx pytest
```

### Linting and Formatting

To check the code for linting and formatting issues, run:
```bash
uvx ruff check py_launch_blueprint/
```

To automatically fix formatting issues, run:
```bash
uvx ruff format py_launch_blueprint/
```

### Type Checking

To perform type checking, use:
```bash
uvx mypy py_launch_blueprint/
```

### Building Documentation

To build the project documentation, navigate to the `docs` directory and run:
```bash
cd docs
make html
```

To start the documentation server with hot reloading, use:
```bash
make hotreloadhtml
```

## Contribution Guidelines

Please refer to the [CONTRIBUTING.md](CONTRIBUTING.md) file for detailed guidelines on how to contribute to the project.

## Additional Resources

- [Project Commands](CLAUDE.md)
- [Code Style Guidelines](CLAUDE.md)
