# Configuration Files

This section provides detailed information about the configuration files used in the Py Launch Blueprint project. Understanding these configuration files will help you customize and extend the project to fit your specific needs.

## pyproject.toml

The `pyproject.toml` file is the central configuration file for the project. It contains metadata about the project, dependencies, and tool-specific configurations.

### Example

```toml
[tool.poetry]
name = "py-launch-blueprint"
version = "0.1.0"
description = "A Production-Ready Python Project Template with Integrated Best Practices"
authors = ["Steve Morin <steve@example.com>"]
license = "MIT"

[tool.poetry.dependencies]
python = "^3.10"
uv = "^0.1.0"

[tool.poetry.dev-dependencies]
pytest = "^6.2.4"
mypy = "^0.812"
ruff = "^0.0.1"

[build-system]
requires = ["poetry-core>=1.0.0"]
build-backend = "poetry.core.masonry.api"
```

## mypy.ini

The `mypy.ini` file is used to configure MyPy, the static type checker for Python. It specifies the type checking rules and options.

### Example

```ini
[mypy]
python_version = 3.10
strict = true
ignore_missing_imports = false
follow_imports = normal
follow_imports_for_stubs = true
disallow_any_generics = true
disallow_subclassing_any = true
disallow_untyped_calls = true
disallow_untyped_defs = true
disallow_incomplete_defs = true
disallow_untyped_decorators = true
no_implicit_optional = true
strict_optional = true
warn_redundant_casts = true
warn_unused_ignores = true
warn_no_return = true
warn_return_any = true
warn_unreachable = true
pretty = true
show_error_codes = true
show_column_numbers = true
```

## .pre-commit-config.yaml

The `.pre-commit-config.yaml` file is used to configure pre-commit hooks. These hooks run code quality checks before commits, ensuring that only clean and consistent code is committed.

### Example

```yaml
repos:
  - repo: https://github.com/pre-commit/pre-commit-hooks
    rev: v3.4.0
    hooks:
      - id: trailing-whitespace
      - id: end-of-file-fixer
      - id: check-yaml
      - id: check-json

  - repo: https://github.com/psf/black
    rev: 21.5b1
    hooks:
      - id: black

  - repo: https://github.com/pre-commit/mirrors-mypy
    rev: v0.812
    hooks:
      - id: mypy

  - repo: https://github.com/pre-commit/mirrors-ruff
    rev: v0.0.1
    hooks:
      - id: ruff
```

## .github/workflows/ci.yaml

The `.github/workflows/ci.yaml` file is used to configure GitHub Actions for continuous integration and deployment. It specifies the steps to run tests, linting, type checking, and other tasks whenever code is pushed to the repository or a pull request is opened.

### Example

```yaml
name: CI/CD

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
  test:
    name: continuous-integration
    runs-on: ubuntu-latest
    strategy:
      matrix:
        python-version: ["3.10", "3.11"]

    steps:
    - uses: actions/checkout@v4

    - name: Install uv
      uses: astral-sh/setup-uv@v5

    - uses: actions/setup-python@v5
      with:
        python-version: ${{ matrix.python-version }}

    - name: Install the project
      run: uv sync --all-extras --dev

    - name: Run type checker
      run: uvx mypy py_launch_blueprint/

    - name: Check linters
      run: uvx ruff check py_launch_blueprint/
```

## Conclusion

Understanding and configuring these files will help you customize the Py Launch Blueprint project to fit your specific needs. Refer to the official documentation for each tool for more detailed information on the available options and configurations.
