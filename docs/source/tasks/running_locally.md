# Running Code Locally

This guide will walk you through the steps to run the Py Launch Blueprint project locally on your machine.

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

### 5. Run the Project

You can now run the project locally using the provided `just` commands. For example, to run the main CLI tool:

```bash
just run
```

This command runs the main CLI tool with the default command.

### 6. Troubleshooting

If you encounter any issues while running the project locally, refer to the following troubleshooting tips:

- **Dependency Issues**: Ensure all dependencies are installed correctly. Run `uv pip install --editable ".[dev]"` again if needed.
- **Pre-commit Hook Issues**: If pre-commit hooks fail, run `uvx --with-editable . pre-commit run --all` to see detailed error messages.
- **Command Not Found**: Ensure that the `just` and `uv` commands are available in your PATH. You may need to add them to your shell configuration file (e.g., `.zshrc` or `.bashrc`).

## Additional Resources

For more detailed information on the available commands and tools, refer to the following sections:

- [Writing Clean Code](writing_clean_code.md)
- [Type Checking Code](type_checking_code.md)
- [Managing Dependencies](managing_dependencies.md)
- [Testing Code](testing_code.md)
