# Configuration Files

This document provides an overview of the various configuration files used in the Py Launch Blueprint project. Each configuration file serves a specific purpose and helps in managing different aspects of the project.

## pyproject.toml

The `pyproject.toml` file is the central configuration file for the project. It includes metadata about the project, dependencies, build system requirements, and tool-specific configurations.

### Example

```toml
[project]
name = "py_launch_blueprint"
version = "0.1.0"
description = "A Production-Ready Python Project Template with Integrated Best Practices"
readme = "README.md"
requires-python = ">=3.10"
license = { text = "MIT" }
authors = [
    { name = "Steve Morin", email = "steve.morin@gmail.com" }
]
dependencies = [
    "click>=8.1.0",
    "questionary>=2.0.0",
    "python-dotenv>=1.0.0",
    "thefuzz>=0.19.0",
    "python-Levenshtein>=0.21.0",
    "pyperclip>=1.8.0",
    "requests>=2.31.0",
    "rich>=13.0.0",
]

[build-system]
requires = ["hatchling"]
build-backend = "hatchling.build"
```

## .pre-commit-config.yaml

The `.pre-commit-config.yaml` file is used to configure pre-commit hooks. These hooks are executed before committing changes to the repository to ensure code quality and consistency.

### Example

```yaml
repos:
  - repo: https://github.com/pre-commit/pre-commit-hooks
    rev: v3.4.0
    hooks:
      - id: trailing-whitespace
      - id: end-of-file-fixer
      - id: check-yaml
  - repo: https://github.com/psf/black
    rev: 21.9b0
    hooks:
      - id: black
  - repo: https://github.com/PyCQA/flake8
    rev: 3.9.2
    hooks:
      - id: flake8
```

## .github/workflows

The `.github/workflows` directory contains GitHub Actions workflow files. These files define automated workflows for continuous integration and deployment.

### Example

```yaml
name: CI

on:
  push:
    branches: [ "main" ]
  pull_request:
    branches: [ "main" ]

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout repository
      uses: actions/checkout@v2

    - name: Set up Python
      uses: actions/setup-python@v2
      with:
        python-version: 3.10

    - name: Install dependencies
      run: |
        python -m pip install --upgrade pip
        pip install -r requirements.txt

    - name: Run tests
      run: |
        pytest
```

## .gitignore

The `.gitignore` file specifies which files and directories should be ignored by Git. This helps in keeping the repository clean and avoiding unnecessary files in version control.

### Example

```gitignore
# Python-generated files
__pycache__/
*.py[oc]
build/
dist/
*.egg-info

# Virtual environments
.venv

# Caches
.mypy_cache
.pytest_cache
.ruff_cache

# Secrets
.env
```

## .readthedocs.yaml

The `.readthedocs.yaml` file is used to configure the Read the Docs service for building and hosting the project's documentation.

### Example

```yaml
version: 2

build:
  os: ubuntu-20.04
  tools:
    python: "3.10"

sphinx:
  configuration: docs/source/conf.py

python:
  install:
    - method: pip
      path: .
      extra_requirements:
        - docs
```

## .vscode/extensions.json

The `.vscode/extensions.json` file specifies recommended extensions for Visual Studio Code. This helps in setting up a consistent development environment for all contributors.

### Example

```json
{
  "recommendations": [
    "ms-python.python",
    "ms-python.vscode-pylance",
    "ms-toolsai.jupyter",
    "esbenp.prettier-vscode",
    "ms-azuretools.vscode-docker"
  ]
}
```

## Conclusion

These configuration files play a crucial role in managing various aspects of the Py Launch Blueprint project. They help in maintaining code quality, automating workflows, and setting up a consistent development environment.
