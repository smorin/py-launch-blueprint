
# CLI Tool Development Example

This tutorial will guide you through the process of developing a Command Line Interface (CLI) tool using the Py Launch Blueprint template. We will create a simple CLI tool that performs basic arithmetic operations.

## Prerequisites

Before you begin, ensure you have the following installed on your system:

- Python 3.11 (updated from 3.10 based on context; adjust to your project's required version)
- `uv` package manager
- `just` task runner

## Steps

1. **Set Up the Project**  
   Start by customizing the Py Launch Blueprint for your new CLI tool. Replace `py_launch_blueprint` with your package name (e.g., `arithmecli`) in the version verification step of your workflow file:
   ```yaml
   PY_VERSION=$(uv run python -c "import arithmecli; print(arithmecli.__version__)")
   ```
   Update the Python version in your workflow to match your project's requirements:
   ```yaml
   with:
     python-version: "3.11"  # Ensure this matches your project's needs
   ```

2. **Install Dependencies**  
   Use `uv` to install necessary third-party libraries. For this CLI tool, we'll use `click` for argument parsing. To ensure type safety, also install type stubs:
   ```bash
   uv pip install click types-click
   ```

3. **Define the CLI Structure**  
   Create a file `src/arithmecli/main.py`. We'll use type hints for better code quality. Based on your context, decide whether to enforce `disallow_untyped_defs = true` (for strict typing) or `false` (for flexibility, e.g., when adapting legacy code). Here's an example with strict typing:
   ```python
   import click

   @click.group()
   def cli() -> None:
       """A simple CLI tool for arithmetic operations."""
       pass

   @cli.command()
   @click.argument("a", type=int)
   @click.argument("b", type=int)
   def add(a: int, b: int) -> None:
       """Add two numbers."""
       result: int = a + b
       click.echo(f"Result: {result}")

   @cli.command()
   @click.argument("a", type=int)
   @click.argument("b", type=int)
   def subtract(a: int, b: int) -> None:
       """Subtract two numbers."""
       result: int = a - b
       click.echo(f"Result: {result}")

   if __name__ == "__main__":
       cli()
   ```

4. **Type Checking**  
   Run type checks on specific files using `mypy` or `pyright`. For example:
   ```bash
   mypy src/arithmecli/main.py
   pyright src/arithmecli/main.py
   ```
   If you encounter type issues with third-party libraries, install additional type stubs as needed (e.g., `types-click` already included above). To ignore specific lines:
   ```python
   # mypy
   reveal_type(a)  # type: ignore

   # pyright
   a = something()  # pyright: ignore
   ```

5. **Test the CLI**  
   Use `uv` to run the tool locally:
   ```bash
   uv run python -m arithmecli add 5 3
   # Output: Result: 8

   uv run python -m arithmecli subtract 10 4
   # Output: Result: 6
   ```

---

### Notes on Typing Configuration
- **Strict Typing (`disallow_untyped_defs = true`)**: Recommended for new projects or teams familiar with type hints. The example above uses this approach, requiring full type annotations:
  ```python
  def add(a: int, b: int) -> None:
      result: int = a + b
      click.echo(f"Result: {result}")
  ```
- **Flexible Typing (`disallow_untyped_defs = false`)**: Useful for legacy code or gradual adoption. You could omit some annotations:
  ```python
  def add(a, b):
      result = a + b
      click.echo(f"Result: {result}")
  ```