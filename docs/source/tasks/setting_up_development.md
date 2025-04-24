<!--
Copyright (c) 2025, Steve Morin

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
-->
## Setup & Dependency Check

Run the following command to check if the base dependencies are installed.
```bash
make check
```

# Setup Development Environment

Project requires Python 3.10+ (which is also specified inside [.python-version](https://github.com/smorin/py-launch-blueprint/blob/main/.python-version) file)
There are two options for setting up the development environment:

- Using [uv](https://docs.astral.sh/uv/getting-started/installation/):
- Using [pip](https://pip.pypa.io/en/stable/installation/):

It depends on the tool you choose, but both offer a convenient way to install the package in editable mode with development dependencies. UV is recommended as it offers much greater speed and a lot of features and tools out of the box.

## Using uv:

```bash
# This command creates a live development installation that allows you to modify the code without reinstalling while also installing additional development tools (like pytest, mypy, etc.) specified in your project's dev dependencies.
uv pip install --editable ".[dev]"

# Format the code
uvx ruff format py_launch_blueprint/

# Run linter
uvx ruff check py_launch_blueprint/

# Run type checker
uvx  --with-editable . mypy py_launch_blueprint/

# Run tests
uvx --with-editable . pytest

# Run tests with coverage
uvx --with pytest-cov --with-editable . pytest --cov=py_launch_blueprint.projects --cov-report=term-missing

# Run command
uvx --with-editable .  --from py_launch_blueprint py-projects
```

### (Optional) Pre-Commit Hooks with uv

```bash
# Setup Pre-Commit Hook
uvx --with-editable . pre-commit install

#Run all pre-Commit Hooks
uvx pre-commit run --all-files
```

## Using pip:

```bash

# Create and activate a virtual environment if needed
python3 -m venv .venv
source .venv/bin/activate  # On Unix/macOS
.venv\Scripts\activate  # On Windows

# Install the package in editable mode with development dependencies
pip install --editable ".[dev]"

# Run development tools directly (no need for 'uv pip run')
ruff format py_launch_blueprint/
ruff check py_launch_blueprint/
mypy py_launch_blueprint/
pytest --cov=py_launch_blueprint.projects --cov-report=term-missing

# Check the installed package cli tool version
py-projects --version
```

### (Optional) Pre-Commit Hooks with pip

```bash
# Setup Pre-Commit Hook
pre-commit install

#Run all pre-Commit Hooks
pre-commit run --all-files
```

## Customization for New Projects

When using this workflow as a template for a new project, update the following:

1. **Project Name**:
   Replace `py_launch_blueprint` with your package name in the version verification step:

   ```yaml
   PY_VERSION=$(uv run python -c "import your_package_name; print(your_package_name.__version__)")
   ```

2. **Python Version**:
   Update the Python version to match your project's requirements:
   ```yaml
   with:
     python-version: "3.11" # Change to your required version
   ```
