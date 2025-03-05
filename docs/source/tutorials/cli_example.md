# CLI Tool Development Example

This tutorial will guide you through the process of developing a Command Line Interface (CLI) tool using the Py Launch Blueprint template. We will create a simple CLI tool that performs basic arithmetic operations.

## Prerequisites

Before you begin, ensure you have the following installed on your system:

- Python 3.10 or higher
- `uv` package manager
- `just` task runner

## Steps

### 1. Create a New CLI Module

First, create a new module for your CLI tool in the `py_launch_blueprint` directory:

```bash
touch py_launch_blueprint/cli.py
```

### 2. Define the CLI Commands

Open the `cli.py` file and define the CLI commands using the `click` library:

```python
import click

@click.group()
def cli():
    """A simple CLI tool for arithmetic operations."""
    pass

@click.command()
@click.argument('x', type=int)
@click.argument('y', type=int)
def add(x, y):
    """Add two numbers."""
    result = x + y
    click.echo(f"The result of {x} + {y} is {result}")

@click.command()
@click.argument('x', type=int)
@click.argument('y', type=int)
def subtract(x, y):
    """Subtract two numbers."""
    result = x - y
    click.echo(f"The result of {x} - {y} is {result}")

cli.add_command(add)
cli.add_command(subtract)

if __name__ == '__main__':
    cli()
```

### 3. Update the `__main__.py` File

Update the `__main__.py` file to include the CLI tool:

```python
from .cli import cli

if __name__ == '__main__':
    cli()
```

### 4. Install Dependencies

Install the `click` library using `uv`:

```bash
uv pip install click
```

### 5. Run the CLI Tool

You can now run the CLI tool using the `just` command:

```bash
just run add 3 5
just run subtract 10 4
```

### 6. Add Tests

Create a new test file for the CLI tool in the `tests` directory:

```bash
touch tests/test_cli.py
```

Add tests for the CLI commands:

```python
from click.testing import CliRunner
from py_launch_blueprint.cli import cli

def test_add():
    runner = CliRunner()
    result = runner.invoke(cli, ['add', '3', '5'])
    assert result.exit_code == 0
    assert "The result of 3 + 5 is 8" in result.output

def test_subtract():
    runner = CliRunner()
    result = runner.invoke(cli, ['subtract', '10', '4'])
    assert result.exit_code == 0
    assert "The result of 10 - 4 is 6" in result.output
```

### 7. Run the Tests

Run the tests using the `pytest` command:

```bash
uvx --with-editable . pytest
```

## Conclusion

You have successfully created a simple CLI tool using the Py Launch Blueprint template. This tutorial covered the basics of defining CLI commands, running the tool, and adding tests. You can extend this example by adding more commands and functionality to your CLI tool.

For more detailed information on developing CLI tools, refer to the [Click documentation](https://click.palletsprojects.com/).
