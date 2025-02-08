# Feature Overview

## Core Features

### Type Safety

- MyPy integration
- Pylance/Pyright support
- Comprehensive type hints

### Code Quality Tools

- Ruff for linting and formatting
- Pre-commit hooks
- Automated testing

### Development Environment

- VS Code integration
- Justfile automation
- UV package management

## Tool Configuration

### Ruff Settings

```toml
[tool.ruff]
line-length = 88
target-version = "py310"

[tool.ruff.lint]
select = ["E", "F", "I", "N"]
```

### MyPy Configuration

```toml
[tool.mypy]
python_version = "3.10"
strict = true
warn_return_any = true
```

### Pre-commit Hooks

```yaml
repos:
  - repo: https://github.com/pre-commit/pre-commit-hooks
    rev: v4.4.0
    hooks:
      - id: trailing-whitespace
      - id: end-of-file-fixer
```

## Best Practices

- Type annotations for all functions
- Consistent code formatting
- Comprehensive testing
- Documentation standards
