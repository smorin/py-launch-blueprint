# Full Project Setup Tutorial

This tutorial will guide you through the process of setting up a full project using the Py Launch Blueprint template. By the end of this tutorial, you will have a fully functional Python project with all the necessary tools and configurations in place.

## Prerequisites

Before you begin, ensure you have the following installed on your system:

- Python 3.10 or higher
- `uv` package manager
- `just` command runner

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

This command installs the project in editable mode along with all development dependencies.

### 3. Set Up Pre-commit Hooks

Set up pre-commit hooks to ensure code quality before committing changes:

```bash
uvx --with-editable . pre-commit install
```

### 4. Run Initial Checks

Run the initial checks to ensure everything is set up correctly:

```bash
just check
```

This command runs the tests, linter, and type checker.

### 5. Start Developing

You are now ready to start developing your project. Use the following commands for common tasks:

- **Format code**: `just format`
- **Run linter**: `just lint`
- **Run type checker**: `just typecheck`
- **Run tests**: `just test`

### 6. Build Documentation

To build the project documentation, use the following command:

```bash
cd docs
make html
```

This command generates the HTML documentation in the `docs/build` directory.

## Additional Resources

For more detailed information on using the Py Launch Blueprint template, refer to the following sections:

- [Setting Up Development Environment](setting_up_development.md)
- [Writing Clean Code](writing_clean_code.md)
- [Managing Dependencies](managing_dependencies.md)
- [Testing Code](testing_code.md)
- [Using CI/CD](using_ci_cd.md)
