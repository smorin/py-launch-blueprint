# Running Code Locally

This guide provides instructions for running the Py Launch Blueprint project locally on your machine.

## Prerequisites

Before running the project locally, ensure you have the following installed:

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

### 5. Start the Project

To start the project locally, use the following command:

```bash
just run
```

This command runs the main entry point of the project.

## Troubleshooting

If you encounter any issues while running the project locally, refer to the following troubleshooting tips:

### Common Issues

1. **Dependency Installation Errors**:
   - Ensure you have the correct versions of Python and `uv` installed.
   - Check for any missing dependencies and install them manually.

2. **Pre-commit Hook Failures**:
   - Run `just format` to format the code according to the project's style guidelines.
   - Run `just lint` to check for any linting errors and fix them.

3. **Test Failures**:
   - Ensure all dependencies are installed correctly.
   - Check the test output for any specific error messages and address them.

4. **Runtime Errors**:
   - Verify that the project is set up correctly and all dependencies are installed.
   - Check the error messages for any clues about the issue and debug accordingly.

## Additional Resources

For more detailed information on using the Py Launch Blueprint template, refer to the following sections:

- [Setting Up a New Project](setting_up_project.md)
- [Setting Up Local Development Environment](setting_up_development.md)
- [Writing Clean Code](writing_clean_code.md)
- [Managing Dependencies](managing_dependencies.md)
- [Testing Code](testing_code.md)
