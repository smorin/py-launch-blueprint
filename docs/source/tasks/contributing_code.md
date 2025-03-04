# Contributing Code

## Overview

This document provides guidelines and instructions for contributing code to the Py Launch Blueprint project. By following these guidelines, you can help ensure that your contributions are consistent, high-quality, and easy to review.

## Getting Started

Before you start contributing, please make sure you have read and understood the following documents:
- [Code of Conduct](../contributing/code_of_conduct.md)
- [Contributor License Agreement (CLA)](../contributing/cla.md)
- [Development Workflow](../contributing/development_workflow.md)

## Contribution Workflow

1. **Fork the Repository**: Create a fork of the Py Launch Blueprint repository on GitHub.

2. **Clone Your Fork**: Clone your forked repository to your local machine.
   ```bash
   git clone https://github.com/your-username/py-launch-blueprint.git
   cd py-launch-blueprint
   ```

3. **Create a Branch**: Create a new branch for your feature or bugfix.
   ```bash
   git checkout -b my-feature-branch
   ```

4. **Make Changes**: Make your changes to the codebase. Follow the project's coding style and conventions.

5. **Run Tests**: Ensure that all tests pass before submitting your changes.
   ```bash
   just test
   ```

6. **Commit Changes**: Commit your changes with a clear and descriptive commit message.
   ```bash
   git add .
   git commit -m "Add feature X"
   ```

7. **Push Changes**: Push your changes to your forked repository.
   ```bash
   git push origin my-feature-branch
   ```

8. **Open a Pull Request**: Open a pull request on GitHub. Provide a clear and descriptive title and description for your pull request.

## Code Style and Conventions

- **Line Length**: Limit lines to 88 characters.
- **Types**: Use strict typing for all functions.
- **Imports**: Sort imports and prefer relative imports.
- **Naming**: Follow PEP 8 naming conventions.
- **Error Handling**: Prefer explicit error handling over assertions.
- **Tests**: Type annotations are optional for test files.
- **Security**: Avoid hardcoded credentials and follow security best practices.

## Documentation Contributions

- All documentation resides in `docs/source/`.
- Follow the directory structure for consistency.
- Use Sphinx syntax for cross-referencing (e.g., `:doc:` or `:ref:`).

## Additional Resources

- [GitHub Flow](https://guides.github.com/introduction/flow/)
- [Sphinx Documentation](https://www.sphinx-doc.org/en/master/)
- [PEP 8 - Style Guide for Python Code](https://www.python.org/dev/peps/pep-0008/)

Thank you for contributing to Py Launch Blueprint!
