# Writing Clean Code

This guide will help you write clean, maintainable code by following best practices for linting and code standards.

## Linting

Linting is the process of analyzing code for potential errors, code style violations, and other issues. It helps maintain code quality and consistency across the project.

### Ruff

Ruff is a fast and efficient linter for Python code. It checks for code style violations, potential errors, and other issues.

#### Configuration

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

### Running Ruff

To run Ruff, use the following command:

```bash
uvx --with-editable . ruff check py_launch_blueprint/
```

This command will check the code in the `py_launch_blueprint` directory for any linting issues.

## Code Standards

Following code standards helps maintain consistency and readability in the codebase. Here are some best practices to follow:

### PEP 8

PEP 8 is the official style guide for Python code. It covers various aspects of code style, including indentation, line length, naming conventions, and more. Some key points include:

- Use 4 spaces per indentation level.
- Limit lines to 88 characters.
- Use meaningful names for variables, functions, and classes.
- Use blank lines to separate top-level functions and class definitions.
- Use spaces around operators and after commas, but not directly inside brackets.

### Type Annotations

Type annotations help improve code readability and enable static type checking. Use type hints for function arguments and return types:

```python
def greet(name: str) -> str:
    return f"Hello, {name}!"
```

### Docstrings

Use docstrings to document your code. Follow the Google style for docstrings:

```python
def add(a: int, b: int) -> int:
    """Add two integers.

    Args:
        a (int): The first integer.
        b (int): The second integer.

    Returns:
        int: The sum of the two integers.
    """
    return a + b
```

### Error Handling

Prefer explicit error handling over assertions. Use try-except blocks to handle exceptions gracefully:

```python
try:
    result = 10 / 0
except ZeroDivisionError:
    print("Cannot divide by zero")
```

### Security

Follow security best practices, such as avoiding hardcoded credentials and using secure coding techniques. Use tools like Bandit to check for security issues:

```bash
uvx --with-editable . bandit -r py_launch_blueprint/
```

By following these best practices, you can ensure that your code is clean, maintainable, and secure.
