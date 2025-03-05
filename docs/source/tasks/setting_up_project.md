# Setting Up a New Project

This guide will walk you through the steps to set up a new project using the Py Launch Blueprint template.

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

### 5. Start Developing

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

## Additional Resources

For more detailed information on the available commands and tools, refer to the following sections:

- [Writing Clean Code](writing_clean_code.md)
- [Type Checking Code](type_checking_code.md)
- [Managing Dependencies](managing_dependencies.md)
- [Testing Code](testing_code.md)
- [Using CI/CD](using_ci_cd.md)
