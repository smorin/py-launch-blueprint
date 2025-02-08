# Code Standards

## Python Style Guide

- Follow PEP 8 guidelines
- Use type hints for all functions
- Write docstrings for public APIs
- Keep functions focused and small

## Code Formatting

All code is automatically formatted using Ruff:

```bash
just format
```

## Type Checking

All code must pass type checking:

```bash
just typecheck
```

## Testing

- Write tests for new features
- Maintain test coverage
- Run tests before committing:

```bash
just test
```
