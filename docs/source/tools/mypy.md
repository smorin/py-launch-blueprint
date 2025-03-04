# MyPy Type Checking

MyPy is a static type checker for Python. It helps you ensure that your code adheres to specified type annotations, making it more robust and error-free.

## Setting Up MyPy

To set up MyPy in your project, follow these steps:

1. **Install MyPy**:
   ```bash
   pip install mypy
   ```

2. **Configure MyPy**:
   Create a `mypy.ini` file in the root of your project with the following content:
   ```ini
   [mypy]
   python_version = 3.10
   strict = True
   ```

3. **Add Type Annotations**:
   Add type annotations to your Python code. For example:
   ```python
   def greet(name: str) -> str:
       return f"Hello, {name}!"
   ```

4. **Run MyPy**:
   Run MyPy to check your code for type errors:
   ```bash
   mypy your_project_directory
   ```

## MyPy Configuration Options

MyPy offers various configuration options to customize its behavior. Here are some commonly used options:

- `python_version`: Specifies the Python version to use for type checking.
- `strict`: Enables all optional error checking.
- `ignore_missing_imports`: Ignores errors for missing imports.
- `disallow_untyped_calls`: Disallows calling functions without type annotations.
- `warn_unused_ignores`: Warns about unused `# type: ignore` comments.

For a complete list of configuration options, refer to the [MyPy documentation](https://mypy.readthedocs.io/en/stable/config_file.html).

## Integrating MyPy with Pre-commit Hooks

To ensure that MyPy checks are run automatically before each commit, you can integrate MyPy with pre-commit hooks. Follow these steps:

1. **Install Pre-commit**:
   ```bash
   pip install pre-commit
   ```

2. **Create a `.pre-commit-config.yaml` file**:
   ```yaml
   repos:
     - repo: https://github.com/pre-commit/mirrors-mypy
       rev: v0.910
       hooks:
         - id: mypy
   ```

3. **Install the Pre-commit Hook**:
   ```bash
   pre-commit install
   ```

Now, MyPy will run automatically before each commit, helping you catch type errors early in the development process.

## Best Practices for Type Checking

- **Annotate All Functions**: Ensure that all functions have type annotations for their arguments and return values.
- **Use Type Hints for Variables**: Use type hints for variables, especially when their types are not immediately obvious.
- **Leverage Type Aliases**: Use type aliases to simplify complex type annotations.
- **Regularly Run MyPy**: Run MyPy regularly to catch type errors early and maintain a clean codebase.

By following these best practices and integrating MyPy into your development workflow, you can improve the reliability and maintainability of your code.

For more information on MyPy and type checking in Python, refer to the [official MyPy documentation](https://mypy.readthedocs.io/en/stable/).
