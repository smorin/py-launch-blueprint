![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)

# Py Launch Blueprint: A Production-Ready Python Project Template with Integrated Best Practices
 Py Launch Blueprint is a comprehensive Python project template that eliminates setup friction by providing a pre-configured development environment with carefully selected tools for linting, formatting, and type checking. It includes an annotated CLI example and detailed documentation explaining each tool choice and configuration decision, making it an ideal starting point for professional Python projects.

![Py Launch Blueprint Logo](./template_images/py_launch_blueprint_logo_100x100.png)

## Why Choose Py Launch Blueprint?

Py Launch Blueprint eliminates the setup friction in Python projects by providing a production-ready template with carefully curated tools and best practices. Here's what makes it special:

## Full documentation on ReadTheDocs
- [py-launch-blueprint Docs](https://py-launch-blueprint.readthedocs.io/en/latest/)

### 🚀 Key Features

- **Zero Configuration Setup**: Get started immediately with pre-configured development tools
- **Type Safety First**: Built-in MyPy configuration and VS Code integration for robust type checking
- **Modern Development Tools**:
  - ⚡ Ruff for lightning-fast linting and formatting
  - 🔍 Pre-commit hooks for code quality enforcement
  - 📝 Type checking with MyPy and Pylance
- **AI Enabled**:
  - 🧠 Default .cursor/rules/projectenv.mdc
  - 🧠 Default .windsurfules
  - 🧠 Default Claude Code CLAUDE.md

### 💪 Production Ready
- **Python 3.10+ Support**: Leverages modern Python features
- **Dependency Management**: Uses `uv` for fast, reliable package management
- **CI/CD Ready**: Includes GitHub Actions workflows
- **Comprehensive Testing**: Pre-configured test setup with best practices

### 🛠️ Developer Experience
- **VS Code Integration**: Curated set of recommended extensions
- **Intelligent Defaults**: Optimized settings for common development tasks
- **Clear Documentation**: Detailed explanations for all tool choices and configurations
- **Git Hooks**: Automated code quality checks before commits

### 🎯 Perfect For
- Professionals looking for a production-ready Python project
- Teams wanting a standardized Python development environment
- Projects requiring maintainable, type-safe code
- Developers who value clean, consistent code style
- Anyone looking to adopt Python best practices from day one

Start your next Python project with confidence, knowing you're building on a foundation of best practices and modern development tools.

## Philosophy
- **Heavily Documented**: Every detail is explained, making it easy to understand, even for folks new to the project, tools, or new to Python.
- **Pragmatic**: Focuses on practical best practices instead of strict rules
- **Modular**: Designed to be easy to remove features, replace with alternatives or add new ones

## Why Open Source?

- **Transparent**: Every detail is documented, making it easy to understand and contribute
- **Collaborative**: A community of developers is formed, fostering a shared learning environment

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## Contributors

This project uses [COG (Cocogitto)](https://github.com/cocogitto/cocogitto) to automatically track and maintain our [CONTRIBUTORS.md](CONTRIBUTORS.md) file. The list of contributors is automatically updated when:

1. A push is made to the main branch
2. A pull request is merged
3. Manually using the `just contributors` command

### Manual Update

To manually update the contributors list:

```bash
just contributors
```

### How Contributors are Tracked

Contributors are tracked based on git commit history. The system:
- Counts commits per contributor
- Shows contribution statistics
- Excludes certain email domains (e.g., noreply.github.com)
- Sorts contributors by number of commits

For more details about COG's contributor tracking, see the [official documentation](https://docs.cocogitto.io/).

## Contributor License Agreement (CLA)

Before we can accept your contributions, you will need to sign a Contributor License Agreement (CLA). This is a legal document in which you state that you are entitled to contribute the code you are submitting and that you grant us the rights to use that contribution.

### How to Sign the CLA

1. **Individual Contributors**: If you are contributing as an individual, please sign the [Individual CLA](docs/cla/individual_cla.md).
2. **Corporate Contributors**: If you are contributing on behalf of a company, please sign the [Corporate CLA](docs/cla/corporate_cla.md).

### CLA Assistant Bot

We have integrated the CLA Assistant bot to streamline the CLA signing process. When you open a pull request, the bot will check if you have signed the CLA. If you have not, it will provide a link to sign it.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

# Conventional Commits and Changelog

This project follows the [Conventional Commits](https://www.conventionalcommits.org/) specification for commit messages, which enables automatic changelog generation and version management using [Cocogitto (cog)](https://github.com/cocogitto/cocogitto).

## Commit Message Format

Commit messages must follow this format:
```
<type>(<optional scope>): <description>

[optional body]

[optional footer(s)]
```

Common types include:
- `feat`: New features
- `fix`: Bug fixes
- `docs`: Documentation changes
- `style`: Formatting changes (white-space, etc.)
- `refactor`: Code restructuring without feature changes
- `perf`: Performance improvements
- `test`: Test additions or corrections
- `chore`: Maintenance tasks

## Using the Changelog

The project automatically generates a changelog from conventional commits. To generate or update the changelog manually:

```bash
just changelog
```

## Versioning

The project uses semantic versioning based on conventional commits. To bump the version:

```bash
just bump         # Auto-detects version bump type based on commits
just bump patch   # For a patch version bump
just bump minor   # For a minor version bump
just bump major   # For a major version bump
```

## Commit Validation

To ensure your commits follow the conventional format, you can:

1. Use the interactive commit tool: `just commit`
2. Validate recent commits: `just verify-commits`
3. Install the pre-commit hook: `just setup-cog-hooks`

For more details, see the [CONTRIBUTING.md](CONTRIBUTING.md) file.

# Project Structure

The project uses a simple, maintainable structure:

```
py-utils/
├── projects.py      # Main script with all functionality
├── tests/          # Test files
│   ├── __init__.py
│   ├── test_api.py
│   ├── test_config.py
│   └── test_cli.py
├── pyproject.toml  # Project and tool configuration
└── README.md      # Documentation
```
# Versioning and Release Management

This project uses automatic version management powered by Git tags and `setuptools_scm`. The version is dynamically generated during installation and build processes.

## Key Features
- **Automatic Versioning**: Version derived from Git tags (e.g., `v1.2.3` → `1.2.3`)
- **Development Versions**: Unreleased commits show as `1.2.4.dev1+gabcdef12` (includes commit ID by default)
- **CI/CD Integration**: GitHub Actions validate version-tag alignment
- **Semantic Versioning**: Enforces proper version format in tags
- **Customizable Local Scheme**: Control how development versions are formatted (e.g., include/exclude commit ID)

## Setup & Dependency Check
```bash
make check
```
