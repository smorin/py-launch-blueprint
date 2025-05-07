![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)

# Py Launch Blueprint: A Production-Ready 🐍 Python Project Template with Integrated Best Practices
 Py Launch Blueprint is a comprehensive Python project template that eliminates setup friction by providing a pre-configured development environment with carefully selected tools for linting, formatting, and type checking. It includes an annotated CLI example and detailed documentation explaining each tool choice and configuration decision, making it an ideal starting point for professional Python projects.

![Py Launch Blueprint Logo](./template_images/py_launch_blueprint_logo_100x100.png)

## Why Choose Py Launch Blueprint?

Py Launch Blueprint eliminates the setup friction in Python projects by providing a production-ready template with carefully curated tools and best practices.

## Full documentation on ReadTheDocs
- [py-launch-blueprint Docs](https://py-launch-blueprint.readthedocs.io/en/latest/)

### 🚀 Key Features

**Zero-config** development environment with **type safety** built in.

## ✨ Features TLDR
- 🛠️ **Dev Tools**: Ruff (linting/formatting), MyPy (type checking), Pre-commit hooks
- 🧠 **AI Ready**: Default configs for Cursor, Windsurf, Claude Code
- 💪 **Production**: Python 3.10+, uv package manager, testing setup
- 🚀 **DX - Developer Experience**: VS Code integration, sensible defaults, quality documentation
- 🔄 **CI/CD**: GitHub Actions workflows, automatic testing, version management

### 🎯 Perfect For
Teams and professionals needing maintainable, type-safe Python projects following best practices.

## Complete Feature List

### Development Tools

- **Bootstrap dependency check and install with `make`**: Execute common development tasks with simple commands, standardizing workflows across team members.

- **Command running with `just`**: Define and run project-specific commands with a modern Make alternative, simplifying complex operations with clear syntax.

- **Linting with `ruff`**: Catch errors and enforce code style at lightning speed (10-100x faster than traditional linters), reducing waiting time and improving developer productivity.

- **Type checking with `mypy`**: Prevent type-related bugs before they occur, making your codebase more robust and easier to maintain as it grows.

- **Formatting with `ruff`**: Ensure consistent code style across your project automatically, eliminating style debates and pull request revision cycles.

- **Pre-commit hooks with `pre-commit`**: Enforce quality standards before code enters your repository, preventing bad code from ever being committed and reducing technical debt.

- **TOML formatting and validation with `taplo`**: Verify Toml files for syntax correctness, maintain consistent configuration files, ensuring readability and avoiding syntax errors in critical project settings.

- **YAML validation with `[TODO:tool under evaluation](https://github.com/smorin/py-launch-blueprint/issues/161)`**: Verify YAML files for syntax correctness, preventing configuration errors and deployment failures.

### Project Structure & Management

- **Project configuration with `pyproject.toml`**: Organize all project settings in one standardized location, simplifying maintenance and configuration.

- **Dependency groups separation**: Organize dependencies into main, dev, and doc categories, preventing bloated installations and clarifying requirements as part of `pyproject.toml` configuration.

- **Dependency management with [`uv`](https://docs.astral.sh/uv/)**: Install and manage packages at blazing speed (100x faster than pip/poetry), dramatically reducing environment setup time.

- **Build system with `hatchling`**: Streamline package building with modern Python packaging standards, ensuring compatibility and distribution consistency.

- **Versioning with `setuptools-scm`**: Automatically derive version numbers from git tags, eliminating manual version tracking and ensuring consistency.

- **Copyright license automation**: Automatically add license headers to all files, ensuring legal compliance without manual effort.

### Documentation

- **Documentation with `sphinx + MyST`**: Generate comprehensive documentation that supports both reStructuredText and Markdown, improving contributor accessibility.

- **`Read the Docs` integration**: Deploy documentation automatically, providing instant hosting and versioning for your project's documentation.

- **Changelog management with `cog`**: Track and communicate changes effectively to users and team members, improving project transparency and adoption.

### Testing & Quality Assurance

- **Testing framework with `pytest`**: Write and run tests with a modern, powerful testing framework that supports fixtures and parameterization.

- **CI/CD with `GitHub Actions`**: Automatically test, build, and deploy your project on multiple Python versions, catching compatibility issues early.

- **Matrix testing with `GitHub Actions`**: Run tests across multiple Python versions and operating systems, ensuring broad compatibility.

- **Simplified debugging info with `just debug-info`**: Automatically collect and format essential system, tool, and dependency information for streamlined bug reporting via a simple command.

### GitHub Integration

- **Pull request template**: Guide contributors through the PR process with structured information requirements, improving submission quality.

- **Issue templates (Feature, Bug, Documentation)**: Standardize issue reporting with appropriate fields for each type, gathering all necessary information upfront.

- **Automated contributor recognition with `cog`**: Automatically update contributor lists with cog, acknowledging all project participants without manual tracking.

- **Conventional commits support with `cog`**: Enforce structured commit messages, enabling automated changelog generation and version management.

- **Security policy**: Establish clear vulnerability reporting procedures, promoting responsible disclosure and faster security fixes.

- **Code of conduct**: Set community behavior expectations, fostering an inclusive and respectful project environment.

- **Contributing guidelines**: Provide clear instructions for contributors, reducing friction for new participants.

- **Automated dependency security scanning with `codeql`**: Detect vulnerable dependencies automatically, protecting your users from known security issues.

- **CLA (Contributor License Agreement) check `[TODO:LOOKUP ISSUE](https://github.com/smorin/py-launch-blueprint/issues/162)`**: Ensure all contributors have signed appropriate licensing agreements, protecting the project legally.

### IDE Integration

- **VS Code integration**: Provide optimized settings and configurations for Visual Studio Code, enhancing developer productivity.

- **PyRight configuration**: Enable accurate, real-time type checking in the editor, catching errors before running tests.

- **Editor extensions recommendations**: Suggest optimal VS Code extensions automatically, standardizing the development environment.

### AI Integration

- **AI assistance with common agents `Cursor, Windsurf, Claude Code, Codex`**: Support popular AI coding assistants enabling AI-powered development.

- **Cursor Rules configuration**: Optimize Cursor AI assistant for your specific project structure, improving suggestion relevance.

- **Windsurf Rules configuration**: Configure Windsurf IDE to understand your project architecture, enhancing code generation quality.

### Communication & Notifications

- **Slack integration for PRs and issues**: Send automated notifications to Slack when PRs or issues are opened/closed, keeping the team informed.

- **PR reminder notifications**: Ping relevant team members on Slack for PR reviews, reducing review cycle times.


Start your next Python project with confidence, knowing you're building on a foundation of best practices and modern development tools.

## Full documentation on ReadTheDocs including how to run
- [py-launch-blueprint Docs](https://py-launch-blueprint.readthedocs.io/en/latest/)
