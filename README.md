![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)

# Py Launch Blueprint: A Production-Ready Python Project Template with Integrated Best Practices
 Py Launch Blueprint is a comprehensive Python project template that eliminates setup friction by providing a pre-configured development environment with carefully selected tools for linting, formatting, and type checking. It includes an annotated CLI example and detailed documentation explaining each tool choice and configuration decision, making it an ideal starting point for professional Python projects.

![Py Launch Blueprint Logo](./template_images/py_launch_blueprint_logo_100x100.png)

## Why Choose Py Launch Blueprint?

Py Launch Blueprint eliminates the setup friction in Python projects by providing a production-ready template with carefully curated tools and best practices. Here's what makes it special:

### 🚀 Key Features

- **Zero Configuration Setup**: Get started immediately with pre-configured development tools
- **Type Safety First**: Built-in MyPy configuration and VS Code integration for robust type checking
- **Modern Development Tools**:
  - ⚡ Ruff for lightning-fast linting and formatting
  - 🔍 Pre-commit hooks for code quality enforcement
  - 📝 Type checking with MyPy and Pylance
  - 📋 Taplo for TOML file formatting and validation

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

## Contributor License Agreement (CLA)

Before we can accept your contributions, you will need to sign a Contributor License Agreement (CLA). This is a legal document in which you state that you are entitled to contribute the code you are submitting and that you grant us the rights to use that contribution.

### How to Sign the CLA

1. **Individual Contributors**: If you are contributing as an individual, please sign the [Individual CLA](docs/cla/individual_cla.md).
2. **Corporate Contributors**: If you are contributing on behalf of a company, please sign the [Corporate CLA](docs/cla/corporate_cla.md).

### CLA Assistant Bot

We have integrated the CLA Assistant bot to streamline the CLA signing process. When you open a pull request, the bot will check if you have signed the CLA. If you have not, it will provide a link to sign it.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

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
- **CI/CD Integration**: GitHub Actions validate version-tag

### Taplo

Taplo is a TOML file formatter and validator integrated into the project's development workflow. It ensures consistent formatting of all TOML files (like `pyproject.toml`) across the project.

Key Features:
- **Automatic Formatting**: Formats TOML files on commit using pre-commit hooks
- **Configurable**: Custom formatting rules defined in `pyproject.toml`
- **VS Code Integration**: Works seamlessly with the VS Code TOML extension
- **CI Integration**: Verifies TOML formatting in GitHub Actions pipeline
- **Consistent Style**:
  - 80 character line width
  - 4-space indentation
  - Aligned entries and comments
  - Expanded array formatting

Usage:
```bash
# Using Just commands
just format-toml  # Format TOML files
just check-toml   # Check TOML formatting

# Direct commands
taplo format      # Format TOML files
taplo format --check  # Check TOML formatting
```

Format verification happens at multiple layers:
- Local development (VS Code + Just commands)
- Pre-commit hooks (automatic formatting on commit)
- CI/CD pipeline (verification on PRs and pushes to main)
- IDE integration (real-time formatting in VS Code)

## Workflow with Version Management

### Creating Releases
```bash
# Create annotated tag
git tag -a v0.0.2 -m "Release version 0.0.2"
git push --tags

# Verify version
uv run python -c "import py_launch_blueprint; print(py_launch_blueprint.__version__)"
```

### Daily Development with Version Management
```bash
# Install with development dependencies
uv pip install --editable ".[dev]"

# Check current version
uv run python -c "import py_launch_blueprint; print(py_launch_blueprint.__version__)"

# Build package
hatch build
```

#### Common `local_scheme` Options
| Scheme                | Example Output                     | Description                                  |
|-----------------------|------------------------------------|----------------------------------------------|
| `"no-local-version"`  | `1.2.4.dev1`                       | No commit ID or dirty flag                   |
| `"node-and-date"`     | `1.2.4.dev1+gabcdef12.d20231025`   | Commit ID and date                           |
| `"node-and-timestamp"`| `1.2.4.dev1+gabcdef12.1698249600`  | Commit ID and timestamp                      |
| `"dirty-tag"`         | `1.2.4.dev1+gabcdef12.dirty`       | Commit ID and dirty flag                     |

---

## CI/CD Automation
The pre-configured GitHub Actions workflow (`release.yml`) ensures a robust release process. Here's how it works:

### Workflow Steps
1. **Trigger**: Pushing a tag (e.g., `v1.0.0`) triggers the workflow.
2. **Checkout**: The repository is checked out with full Git history (`fetch-depth: 0`) to enable `setuptools_scm` version detection.
3. **Setup**:
   - Installs `uv` for fast dependency management.
   - Sets up Python using the specified version.
4. **Build**:
   - Installs build tools (`hatch` and `build`).
   - Builds the package using `hatch build`.
5. **Version Validation**:
   - Extracts the version from the Git tag (e.g., `v1.0.0` → `1.0.0`).
   - Compares it with the package version generated by `setuptools_scm`.
   - Fails if there's a mismatch.
6. **Output**:
   - If successful, the built distributions are available in the `dist/` directory.

---

## Troubleshooting Versions

### Version Issues
- **Version shows 0.0.0**: Create initial Git tag (`v0.1.0`).
- **Version mismatch in CI**: Ensure GitHub Actions uses `fetch-depth: 0`.
- **Dirty version suffix**: Commit all changes before tagging.
- **Missing commit ID**: Check the `local_scheme` setting in `pyproject.toml`.

### Workflow Issues
- **Workflow not triggered**: Ensure the tag follows the `v*` format (e.g., `v1.0.0`).
- **Build failures**: Check the `pyproject.toml` configuration and dependencies.

---

## Customization for New Projects
When using this workflow as a template for a new project, update the following:

1. **Project Name**:
   Replace `py_launch_blueprint` with your package name in the version verification step:
   ```yaml
   PY_VERSION=$(uv run python -c "import your_package_name; print(your_package_name.__version__)")
   ```

2. **Python Version**:
   Update the Python version to match your project's requirements:
   ```yaml
   with:
     python-version: "3.11"  # Change to your required version
   ```

## Python Types Common Issues and Solutions
1. Third-party library types:
```bash
# Install type stubs for common libraries
pip install types-requests types-PyYAML types-python-dateutil
```

2. Ignoring specific lines:
```python
# mypy
reveal_type(x)  # type: ignore

# pyright
x = something()  # pyright: ignore
```

3. Type checking only specific files:
```bash
# mypy
mypy src/main.py src/utils.py

# pyright
pyright src/main.py src/utils.py
```

disallow_untyped_defs = true vs false
- Use `true` when starting new projects or working with teams experienced in type hints who want complete type coverage.
- Use `false` when adding types to legacy code, working with test files, or training developers new to type hints.

disallow_untyped_defs = true
```python
# This will raise an error
def process_data(data):  # Error: Function is missing type annotations
    return data + 1

# This is required instead
def process_data(data: int) -> int:
    return data + 1
```

disallow_untyped_defs = false
```python
# This is allowed
def process_data(data):
    return data + 1

# This is also allowed
def process_data(data: int) -> int:
    return data + 1
```

# Recommended Extensions

This project comes with recommended VS Code extensions to enhance your development experience. When you open this project in VS Code, you'll be prompted to install these extensions:

- **Python** (`ms-python.python`): Essential Python language support
- **Ruff** (`charliermarsh.ruff`): Fast Python linter and formatter
- **MyPy** (`matangover.mypy`): Static type checking for Python
- **Pylance** (`ms-python.vscode-pylance`): Intelligent Python language support
- **Even Better TOML** (`tamasfe.even-better-toml`): Improved TOML file support
- **YAML** (`redhat.vscode-yaml`): YAML language support
- **GitLens** (`eamodio.gitlens`): Enhanced Git integration
- **Code Spell Checker** (`streetsidesoftware.code-spell-checker`): Catch common spelling mistakes

These extensions are configured to work seamlessly with the project's setup and will help maintain code quality standards. VS Code will automatically suggest installing these extensions when you open the project.
