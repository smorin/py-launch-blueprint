# UV Code Formatter

UV is a code formatter that ensures your code adheres to a consistent style. This guide will walk you through the steps to set up and use UV for formatting code in the Py Launch Blueprint project.

## Installation

To install UV, run the following command:

```bash
uv pip install uv
```

## Configuration

UV is configured in the `pyproject.toml` file. Here is an example configuration:

```toml
[tool.uv]
line-length = 88
target-version = "py310"
```

## Running UV

To format your code with UV, use the following command:

```bash
uvx --with-editable . uv format py_launch_blueprint/
```

This command will format the code in the `py_launch_blueprint` directory according to the configuration specified in the `pyproject.toml` file.

## Additional Resources

For more detailed information on using UV, refer to the [official documentation](https://github.com/astral-sh/uv).
