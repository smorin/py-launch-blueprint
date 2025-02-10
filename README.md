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
- **CI/CD Integration**: GitHub Actions validate version-tag alignment
- **Semantic Versioning**: Enforces proper version format in tags
- **Customizable Local Scheme**: Control how development versions are formatted (e.g., include/exclude commit ID)

## Setup & Dependency Check
```bash
make check
```
# Example CLI Tool Usage
[Example CLI: py-projects](EXAMPLECLI.md)

# Development

## Dependencies

Project requires Python 3.10+ (which is also specified inside [.python-version](.python-version) file) and [uv](https://docs.astral.sh/uv/getting-started/installation/) installed.

### Setup Development Environment

There are two options for setting up the development environment:
- Using [uv](https://docs.astral.sh/uv/getting-started/installation/):
- Using [pip](https://pip.pypa.io/en/stable/installation/):

It depends on the tool you choose, but both offer a convenient way to install the package in editable mode with development dependencies. UV is recommended as it offers much greater speed and a lot of features and tools out of the box.

#### Using uv:

```bash
# This command creates a live development installation that allows you to modify the code without reinstalling while also installing additional development tools (like pytest, mypy, etc.) specified in your project's dev dependencies.
uv pip install --editable ".[dev]"

# Format the code
uvx ruff format py_launch_blueprint/

# Run linter
uvx ruff check py_launch_blueprint/

# Run type checker
uvx  --with-editable . mypy py_launch_blueprint/

# Run tests
uvx --with-editable . pytest

# Run tests with coverage
uvx --with pytest-cov --with-editable . pytest --cov=py_launch_blueprint.projects --cov-report=term-missing

# Run command
uvx --with-editable .  --from py_launch_blueprint py-projects
```


##### (Optional) Pre-Commit Hooks with uv

```bash
# Setup Pre-Commit Hook
uvx --with-editable . pre-commit install

#Run all pre-Commit Hooks
uvx pre-commit run --all-files
```


#### Using pip:

```bash

# Create and activate a virtual environment if needed
python3 -m venv .venv
source .venv/bin/activate  # On Unix/macOS
.venv\Scripts\activate  # On Windows

# Install the package in editable mode with development dependencies
pip install --editable ".[dev]"

# Run development tools directly (no need for 'uv pip run')
ruff format py_launch_blueprint/
ruff check py_launch_blueprint/
mypy py_launch_blueprint/
pytest --cov=py_launch_blueprint.projects --cov-report=term-missing

# Check the installed package cli tool version
py-projects --version
```

##### (Optional) Pre-Commit Hooks with pip

```bash
# Setup Pre-Commit Hook
pre-commit install

#Run all pre-Commit Hooks
pre-commit run --all-files
```


### Using the Justfile

This project includes a `Justfile` that provides convenient commands for common development tasks. [Just](https://github.com/casey/just) is a handy command runner that helps standardize commands across your project.

To use these commands, first [install Just](https://github.com/casey/just#installation). You can see all available commands by running:

```bash
just --list
```

Here are some commonly used commands (this is just a subset of all available commands):

```bash
# Setup your development environment
just setup

# Format code (includes ruff format and import sorting)
just format

# Run linter (code style and quality checks)
just lint

# Run type checker
just typecheck

# Run tests
just test

# Run all checks (tests, linting, and type checking)
just check

# Check installed package version
just version

# Clean up temporary files and caches
just clean

# Set up pre-commit hooks
just pre-commit-setup

# Build the package
just build

# Install in development mode
just install-dev
```

When your virtual environment is activated, you can also use direct commands without uvx:

```bash
just format-pip   # Run formatter directly
just lint-pip     # Run linter directly
just typecheck-pip # Run type checker directly
just test-pip     # Run tests directly with pytest
```

The Justfile standardizes common development tasks and provides a consistent interface for both uvx and direct command execution.

## Notes on tool choices

## Ruff
Ruff is a high-performance linter and code formatter for Python. It combines multiple tools into one, offering faster performance and comprehensive functionality compared to traditional Python tools.

Pros:

- Very Fast: Written in Rust, Ruff is significantly faster than traditional linters, allowing it to process large codebases quickly.
- All-in-One Solution: Ruff incorporates checks and fixes from a variety of popular linters like Flake8, Black, isort, pydocstyle, pyupgrade, autoflake. This means less maintenance of multiple separate tools.
- Customizable: Allows users to select and ignore specific checks or enforce particular rules according to the project needs.
- Easy Integration: Works well with CI/CD pipelines, IDEs, and modern developer workflows.
Automated Fixes: Ruff can automatically correct a wide range of issues in your code.

Cons:
- Relatively New: As a newer tool, it might not yet be as widely adopted or supported in some edge cases.

Python line length standards:
- 79/80: Traditional PEP 8 standard. Good for side-by-side editing but can feel restrictive.
- 88: Black's default. Modern sweet spot between readability and expressiveness. Becoming the community standard.
- 100: Google's choice. Popular in enterprise. Good for complex expressions.
- 120: Maximum reasonable length. Works on wide screens but can hurt readability.
- Recommendation: Use 88 characters (Black's default) unless your team/project has an existing standard. It offers the best balance of readability and practicality while following modern community practices.

```pyproject.toml

[tool.ruff]
line-length = 88

[tool.ruff.pycodestyle]
max-line-length = 88
```

## mypy
Most teams today actually run both mypy and pyright/Pylance:

- mypy in CI/pre-commit hooks for strict checking
- Pylance in VS Code for real-time development feedback

This combination provides comprehensive type checking coverage while maintaining a smooth development experience.

Let me explain the difference between `disallow_untyped_defs = false` vs `true`:

**disallow_untyped_defs = true**
```python
# This will raise an error
def process_data(data):  # Error: Function is missing type annotations
    return data + 1

# This is required instead
def process_data(data: int) -> int:
    return data + 1
```

**disallow_untyped_defs = false**
```python
# This is allowed
def process_data(data):
    return data + 1

# This is also allowed
def process_data(data: int) -> int:
    return data + 1
```

**When to use each:**

Use `true` when:
- Starting a new project
- Working on a codebase that's fully committed to type hints
- Want to ensure complete type coverage
- Have a team that's comfortable with Python type hints

Use `false` when:
- Gradually adding types to a legacy codebase
- Working with test files (common to disable for tests)
- Training team members who are new to type hints
- Need to temporarily bypass type checking for specific modules

**Best Practice Recommendation:**
Start new projects with `true` for maximum type safety. For existing projects, use `false` initially and gradually enable it as you add type hints to the codebase. Many teams set it to `false` for test files but `true` for production code.

VS Code Settings for pyright/Pylance
```json
{
    "python.analysis.typeCheckingMode": "strict",
    "python.analysis.diagnosticMode": "workspace",
    "python.analysis.autoImportCompletions": true,
    "python.analysis.importFormat": "relative",
    "python.analysis.inlayHints.functionReturnTypes": true,
    "python.analysis.inlayHints.variableTypes": true
}
```

Common Type Annotation Examples
```python
from typing import Dict, List, Optional, Tuple, Union, TypeVar, Generic

# Basic type annotations
def greet(name: str) -> str:
    return f"Hello {name}"

# Optional parameters
def fetch_user(user_id: Optional[int] = None) -> Dict[str, Union[str, int]]:
    ...

# Generic types
T = TypeVar('T')
class Stack(Generic[T]):
    def __init__(self) -> None:
        self.items: List[T] = []

    def push(self, item: T) -> None:
        self.items.append(item)

    def pop(self) -> T:
        return self.items.pop()

# Type aliases
UserId = int
UserDict = Dict[UserId, Dict[str, Union[str, int]]]

# Callable types
from typing import Callable
Handler = Callable[[str, int], bool]

def process(handler: Handler) -> None:
    ...
```

## Precommit hooks

Hooks are designed to maintain clean, consistent, and error-free code and configuration files. They save time by catching issues before they make it into your repository.

Following pre-commit hooks are used in this repo

- `check-yaml` checks if all YAML files in your repository are valid,
- `end-of-file-fixer` ensures every file in your repository ends with a single newline character,
- `trailing-whitespace` removes trailing spaces at the end of lines in your files,
- `check-toml` checks if all TOML files in your repository are valid,
- `check-added-large-files` warns when you try to add large files to the repository,
- `mypy` checks your Python code for type errors based on type annotations,
- `ruff` acts as a fast linter and formatter for Python, ensuring clean code,

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
## Version Management
The version is automatically derived from Git tags using `setuptools_scm`. Key behaviors:
- **Tagged Releases**: `v1.2.3` → `1.2.3`
- **Development Versions**: `1.2.4.dev1+gabcdef12` (after commits since last tag)
- **Fallback Version**: `0.0.0` (if no tags exist)

### Customizing Development Versions
The format of development versions can be customized using the `local_scheme` option in `pyproject.toml`. By default, the commit ID is included (e.g., `1.2.4.dev1+gabcdef12`). To change this behavior:

#### Example: Remove Commit ID
```toml
[tool.hatch.version.raw-options]
local_scheme = "no-local-version"  # Excludes commit ID
```
Output:
```
1.2.4.dev1
```

#### Example: Include Commit ID and Date
```toml
[tool.hatch.version.raw-options]
local_scheme = "node-and-date"  # Includes commit ID and date
```
Output:
```
1.2.4.dev1+gabcdef12.d20231025
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
   - Fails if there’s a mismatch.
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
