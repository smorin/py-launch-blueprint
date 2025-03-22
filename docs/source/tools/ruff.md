# Ruff Linting Configuration

Ruff is a fast and efficient linter and formatter for Python code. It helps ensure that your code adheres to best practices and is free of common errors.

## Installation

To install Ruff, run the following command:

```bash
uv pip install ruff
```

## Configuration

Ruff is configured in the `pyproject.toml` file. Here is an example configuration:

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

To run Ruff, use the following command:

```bash
uvx --with-editable . ruff check py_launch_blueprint/
```

This command will check the code in the `py_launch_blueprint` directory for any linting issues.

## Fixing Issues

Ruff can automatically fix some issues. To apply autofixes, use the following command:

```bash
uvx --with-editable . ruff fix py_launch_blueprint/
```

This command will apply autofixes to the code in the `py_launch_blueprint` directory.

## Additional Resources

For more detailed information on using Ruff, refer to the [official documentation](https://github.com/charliermarsh/ruff).
