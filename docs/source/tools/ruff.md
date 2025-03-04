# Ruff Linting Configuration

Ruff is a fast and powerful linter for Python code. It helps to enforce code quality and style guidelines in the Py Launch Blueprint project.

## Installation

To install Ruff, use the following command:

```bash
pip install ruff
```

## Configuration

Ruff can be configured using a `pyproject.toml` file. Here is an example configuration:

```toml
[tool.ruff]
# Target Python Version
target-version = "py310"

# Line length
line-length = 88

lint.select = [
    "E",   # pycodestyle errors
    "F",   # pyflakes
    "I",   # isort
    "B",   # flake8-bugbear
    "C4",  # flake8-comprehensions
    "UP",  # pyupgrade
    "N",   # pep8-naming
    "RUF", # Ruff-specific rules
    "W",   # pycodestyle warnings
    "YTT", # flake8-2020
    "S",   # flake8-bandit
]

# Ignore specific rules
lint.ignore = [
    # "E501",  # line length violations
]

# Allow autofix behavior for specific rules
fix = true
lint.unfixable = []  # Rules that should not be fixed automatically

# Exclude files/folders
exclude = [
    ".git",
    ".venv",
    "__pycache__",
    "build",
    "dist",
    "docs/source/conf.py"
]

[tool.ruff.pycodestyle]
max-line-length = 88

# Per-file-ignores
[tool.ruff.lint.per-file-ignores]
"__init__.py" = ["F401"]  # Ignore unused imports in __init__.py files
"tests/*" = ["S101", "S105", "S106"]      # Ignore assert statements in tests
# S101: This check flags the use of assert statements. The reason is that assert statements are removed when Python code is optimized (run with the -O flag), which can lead to security vulnerabilities if assert is used for security checks.
# S105: This generally flags hardcoded password strings in code.
# S106: This generally flags hardcoded password variables in code.
```

## Running Ruff

To run Ruff and check your code for linting issues, use the following command:

```bash
ruff check .
```

To automatically fix linting issues, use the following command:

```bash
ruff fix .
```

## Integrating with Pre-commit

Ruff can be integrated with pre-commit to automatically check your code before each commit. Add the following configuration to your `.pre-commit-config.yaml` file:

```yaml
- repo: https://github.com/charliermarsh/ruff-pre-commit
  rev: v0.1.0
  hooks:
    - id: ruff
```

## Additional Resources

- [Ruff Documentation](https://github.com/charliermarsh/ruff)
- [Ruff GitHub Repository](https://github.com/charliermarsh/ruff)
