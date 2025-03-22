# Contributing Code

Welcome to the Contributing Code section of the Py Launch Blueprint documentation. This section provides guidelines and best practices for contributing code to the project.

## Table of Contents

- [Code Style Guidelines](#code-style-guidelines)
- [Development Workflow](#development-workflow)
- [Submitting Pull Requests](#submitting-pull-requests)
- [Code Review Process](#code-review-process)
- [Documentation Contributions](#documentation-contributions)

## Code Style Guidelines

To ensure consistency and maintainability, please follow these code style guidelines when contributing to the project:

- **Line Length**: Limit lines to 88 characters.
- **Types**: Use strict typing for all functions.
- **Imports**: Sort imports and prefer relative imports.
- **Naming**: Follow PEP 8 naming conventions.
- **Errors**: Prefer explicit error handling over assertions.
- **Tests**: Type annotations are optional for test files.
- **Security**: Avoid hardcoded credentials and follow bandit rules.

## Development Workflow

1. **Fork the Repository**: Create a fork of the repository on GitHub.
2. **Clone the Repository**: Clone your forked repository to your local machine.
   ```bash
   git clone https://github.com/your-username/py-launch-blueprint.git
   cd py-launch-blueprint
   ```
3. **Create a Branch**: Create a new branch for your feature or bugfix.
   ```bash
   git checkout -b my-feature-branch
   ```
4. **Install Dependencies**: Install the project dependencies.
   ```bash
   uv pip install --editable ".[dev]"
   ```
5. **Make Changes**: Make your changes to the codebase.
6. **Run Tests**: Run the tests to ensure your changes do not break anything.
   ```bash
   just test
   ```
7. **Commit Changes**: Commit your changes with a clear and descriptive commit message.
   ```bash
   git add .
   git commit -m "Add feature X"
   ```
8. **Push Changes**: Push your changes to your forked repository.
   ```bash
   git push origin my-feature-branch
   ```

## Submitting Pull Requests

To submit a pull request, follow these steps:

1. **Open a Pull Request**: Open a pull request on GitHub from your feature branch to the main branch of the original repository.
2. **Provide a Description**: Provide a clear and descriptive title and description for your pull request.
3. **Link to Issues**: If your pull request addresses an issue, link to the issue in the description.
4. **Request Reviews**: Request reviews from the project maintainers.

## Code Review Process

The code review process ensures that all contributions meet the project's quality standards. During the review process, maintainers will:

- Review the code for correctness, readability, and adherence to the code style guidelines.
- Provide feedback and request changes if necessary.
- Approve the pull request once all feedback has been addressed.

## Documentation Contributions

- All documentation resides in `docs/source/`.
- Follow the directory structure for consistency.
- Use Sphinx syntax for cross-referencing (e.g., `:doc:` or `:ref:`).
