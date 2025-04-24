<!--
Copyright (c) 2025, Steve Morin

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
-->
# Full Project Setup

This tutorial will guide you through the end-to-end setup of a new project using the Py Launch Blueprint template. By the end of this tutorial, you will have a fully functional Python project with a pre-configured development environment, ready for production.

## Prerequisites

Before you begin, ensure you have the following installed on your system:

- Python 3.10 or higher
- `uv` package manager
- `just` task runner

## Steps

### 1. Clone the Repository

First, clone the Py Launch Blueprint repository to your local machine:

```bash
git clone https://github.com/smorin/py-launch-blueprint.git
cd py-launch-blueprint
```

### 2. Install Dependencies

Next, install the project dependencies using `uv`:

```bash
uv pip install --editable ".[dev]"
```

This command installs the project in editable mode along with the development dependencies.

### 3. Set Up Pre-commit Hooks

Set up pre-commit hooks to ensure code quality and consistency:

```bash
uvx --with-editable . pre-commit install
```

### 4. Verify Installation

Verify that the installation was successful by running the following commands:

```bash
just check
```

This command runs all the checks, including linting, type checking, and tests.

### 5. Configure the Project

Update the project configuration files to match your project's requirements. This includes updating the `pyproject.toml` file with your project's metadata, dependencies, and settings.

### 6. Initialize Version Control

Initialize a new Git repository for your project and make the initial commit:

```bash
git init
git add .
git commit -m "Initial commit"
```

### 7. Set Up CI/CD

Configure the CI/CD pipeline for your project using GitHub Actions. The Py Launch Blueprint template includes a pre-configured GitHub Actions workflow in the `.github/workflows/ci.yaml` file. Customize this workflow to fit your project's needs.

### 8. Start Developing

You are now ready to start developing your project. Use the provided `just` commands to manage your development workflow.

For example, to run the tests:

```bash
just test
```

To format the code:

```bash
just format
```

To lint the code:

```bash
just lint
```

## Project Commands

- **Setup**: `just setup` or `uv pip install --editable ".[dev]"`
- **Format**: `just format` or `uvx ruff format py_launch_blueprint/`
- **Lint**: `just lint` or `uvx ruff check py_launch_blueprint/`
- **Type check**: `just typecheck` or `uvx --with-editable . mypy py_launch_blueprint/`
- **Test all**: `just test` or `uvx --with-editable . pytest`
- **Test single**: `uvx --with-editable . pytest tests/test_file.py::test_name`
- **All checks**: `just check`
- **Pre-commit**: `just pre-commit-run`

## Code Style Guidelines

- **Line length**: 88 characters (Black standard)
- **Types**: Strict typing required for all functions
- **Imports**: Sorted with relative imports preferred
- **Naming**: PEP 8 conventions enforced via Ruff
- **Errors**: Prefer explicit error handling over assertions
- **Tests**: Type annotations optional for test files
- **Security**: No hardcoded credentials, follow bandit rules

## Developer Environment

- **Python**: 3.10+ required
- **Package manager**: `uv` recommended, pip supported
- **IDE**: VS Code with Ruff, MyPy, and Pylance extensions

## Additional Resources

For more detailed information on the available commands and tools, refer to the following sections:

- [Type Checking Code](../tasks/type_checking_code.md)
- [Managing Dependencies](../tasks/managing_dependencies.md)
- [Using CI/CD](../tasks/using_ci_cd.md)
