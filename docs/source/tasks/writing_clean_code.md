# Writing Clean Code

This guide provides best practices for writing clean, maintainable code in the Py Launch Blueprint project.

## Linting

Linting helps to identify and fix potential issues in your code. The Py Launch Blueprint project uses Ruff for linting.

### Running the Linter

To run the linter, use the following command:

```bash
just lint
```

This command checks your code for style and quality issues.

### Fixing Linting Issues

To automatically fix linting issues, use the following command:

```bash
just format
```

This command formats your code according to the project's style guidelines.

## Code Standards

Following code standards helps to maintain consistency and readability in the codebase. The Py Launch Blueprint project follows these standards:

### Line Length

- Limit lines to 88 characters.

### Naming Conventions

- Use `snake_case` for variable and function names.
- Use `CamelCase` for class names.
- Use `UPPER_CASE` for constants.

### Imports

- Group imports into three categories: standard library, third-party, and local.
- Sort imports alphabetically within each group.

### Type Annotations

- Use type annotations for all function signatures.
- Use `Optional` for parameters that can be `None`.

### Docstrings

- Use Google-style docstrings for all functions and classes.
- Include a brief description, arguments, return type, and any exceptions raised.

### Error Handling

- Use explicit error handling with `try`/`except` blocks.
- Avoid using bare `except` clauses; specify the exception type.

## Example

Here is an example of clean code following the project's standards:

```python
from typing import Optional

class ExampleClass:
    """Example class demonstrating clean code practices."""

    def __init__(self, value: Optional[int] = None) -> None:
        """
        Initialize the ExampleClass.

        Args:
            value (Optional[int]): An optional integer value.
        """
        self.value = value

    def get_value(self) -> Optional[int]:
        """
        Get the value of the instance.

        Returns:
            Optional[int]: The value of the instance.
        """
        return self.value

    def set_value(self, value: int) -> None:
        """
        Set the value of the instance.

        Args:
            value (int): The new value to set.
        """
        self.value = value

    def increment_value(self) -> None:
        """
        Increment the value of the instance by 1.

        Raises:
            ValueError: If the value is not set.
        """
        if self.value is None:
            raise ValueError("Value is not set.")
        self.value += 1
```

By following these guidelines, you can ensure that your code is clean, maintainable, and consistent with the rest of the project.
