---
title: Contributing Guidelines
description: How to contribute to Py-Launch-Blueprint
---

# Contributing Guidelines

!!! info "Quick Links" - [Code Standards](standards.md) - [Development Setup](development.md) - [Feature Overview](../features/overview.md)

## Getting Started

1. Fork the repository
2. Create a feature branch
3. Set up development environment
4. Make your changes
5. Submit a pull request

## Development Setup

```bash
# Clone your fork
git clone https://github.com/your-username/py-launch-blueprint
cd py-launch-blueprint

# Install dependencies
uv pip install --editable ".[dev]"

# Setup pre-commit hooks
uvx pre-commit install
```

## Code Standards

### Python Style

- Follow PEP 8 guidelines
- Use type hints
- Write docstrings for public APIs
- Keep functions focused and small

### Commit Messages

```
feat: add new feature X
^--^  ^---------------^
|     |
|     +-> Summary in present tense
|
+-------> Type: feat, fix, docs, style, refactor, test, chore
```

### Pull Request Process

1. Update documentation
2. Add tests for new features
3. Ensure all checks pass
4. Request review from maintainers

## Testing

```bash
# Run all tests
just test

# Run with coverage
just test-cov
```
