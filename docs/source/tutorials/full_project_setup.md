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

### 9. Deploy the Project

When you are ready to deploy your project, follow the deployment instructions specific to your deployment environment. The Py Launch Blueprint template is designed to be flexible and can be deployed to various environments, including cloud platforms, containerized environments, and traditional servers.

## Additional Resources

For more detailed information on the available commands and tools, refer to the following sections:

- [Writing Clean Code](../tasks/writing_clean_code.md)
- [Type Checking Code](../tasks/type_checking_code.md)
- [Managing Dependencies](../tasks/managing_dependencies.md)
- [Testing Code](../tasks/testing_code.md)
- [Using CI/CD](../tasks/using_ci_cd.md)
