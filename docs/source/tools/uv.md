# UV Code Formatter

UV is a code formatter for Python that ensures your code adheres to a consistent style. It is designed to be fast and easy to use.

## Installation

To install UV, use the following command:

```bash
pip install uv
```

## Configuration

UV can be configured using a `pyproject.toml` file. Here is an example configuration:

```toml
[tool.uv]
# Target Python Version
target-version = "py310"

# Line length
line-length = 88

# Exclude files/folders
exclude = [
    ".git",
    ".venv",
    "__pycache__",
    "build",
    "dist",
    "docs/source/conf.py"
]
```

## Running UV

To run UV and format your code, use the following command:

```bash
uv format .
```

## Integrating with Pre-commit

UV can be integrated with pre-commit to automatically format your code before each commit. Add the following configuration to your `.pre-commit-config.yaml` file:

```yaml
- repo: https://github.com/astral-sh/uv
  rev: v0.1.0
  hooks:
    - id: uv
```

## Additional Resources

- [UV Documentation](https://github.com/astral-sh/uv)
- [UV GitHub Repository](https://github.com/astral-sh/uv)
