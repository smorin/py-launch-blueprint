---
title: Code Quality Tools
description: Overview of code quality tools and configurations
---

# Code Quality Tools

!!! example "Tool Configuration"

    ## Ruff
    ```toml
    # pyproject.toml
    [tool.ruff]
    line-length = 88
    target-version = "py310"

    [tool.ruff.lint]
    select = ["E", "F", "I", "N"]
    ```

    ## Pre-commit Hooks
    ```yaml
    # .pre-commit-config.yaml
    repos:
      - repo: https://github.com/pre-commit/pre-commit-hooks
        rev: v4.4.0
        hooks:
          - id: trailing-whitespace
          - id: end-of-file-fixer
    ```

!!! tip "Best Practices" - Run `just format` before committing - Use `just check` to verify all checks pass - Keep pre-commit hooks updated

## Testing

Comprehensive test suite using pytest.
