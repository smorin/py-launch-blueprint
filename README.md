# Py Launch Blueprint: A Production-Ready Python Project Template with Integrated Best Practices

 Py Launch Blueprint is a comprehensive Python project template that eliminates setup friction by providing a pre-configured development environment with carefully selected tools for linting, formatting, and type checking. It includes an annotated CLI example and detailed documentation explaining each tool choice and configuration decision, making it an ideal starting point for professional Python projects.

## Why Choose Py Launch Blueprint?

Py Launch Blueprint eliminates the setup friction in Python projects by providing a production-ready template with carefully curated tools and best practices. Here's what makes it special:

### 🚀 Key Features

- **Zero Configuration Setup**: Get started immediately with pre-configured development tools
- **Type Safety First**: Built-in MyPy configuration and VS Code integration for robust type checking
- **Modern Development Tools**:
  - ⚡ Ruff for lightning-fast linting and formatting
  - 🎨 Black for consistent code styling
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
- Teams wanting a standardized Python development environment
- Projects requiring maintainable, type-safe code
- Developers who value clean, consistent code style
- Anyone looking to adopt Python best practices from day one

Start your next Python project with confidence, knowing you're building on a foundation of best practices and modern development tools.

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

# Example CLI Tool Usage
[Example CLI: py-projects](EXAMPLECLI.md)

## Development

### Setup Development Environment

Project requires Python 3.10+ (which is also specified inside [.python-version](.python-version) file) and [uv](https://docs.astral.sh/uv/getting-started/installation/) installed.

```bash

# Create and activate a virtual environment if needed
uv venv
source .venv/bin/activate  # On Unix/macOS

# Install the package in editable mode with development dependencies
uv pip install --editable ".[dev]"

# Check the installed package
py-projects --version

# (Optional) Setup Pre-Commit Hook
uvx --with-editable . pre-commit install

# Run development tools directly (no need for 'uv pip run')
pytest
black py_launch_blueprint/
isort py_launch_blueprint/
mypy py_launch_blueprint/
ruff check py_launch_blueprint/

# Or run with our the virtual environment

# (Optional) Setup Pre-Commit Hook
uvx --with-editable . pre-commit install

# Run tests
uvx --with-editable . pytest

# Run tests with coverage
uvx --with pytest-cov --with-editable . pytest --cov=py_launch_blueprint.projects --cov-report=term-missing

# Format code
uvx black py_launch_blueprint/

# Sort imports
uvx isort py_launch_blueprint/

# Run type checker
uvx  --with-editable . mypy py_launch_blueprint/

#Run all pre-Commit Hooks
uvx pre-commit run --all-files

# Run linter
uvx ruff check py_launch_blueprint/

# Run command
uvx --with-editable .  --from py_launch_blueprint py-projects
```

# Notes on tool choices

## Black
- Known as "The uncompromising code formatter"

Pros:
- Zero configuration needed - enforces a consistent style with minimal choices
- Very fast performance
- Used by many major projects like Django and pytest
- Maintains compatibility with modern Python features
- Excellent integration with popular editors and CI tools

Cons:
- Limited customization options by design
- Some developers find its formatting choices too opinionated
- Line length fixed at 88 characters (though this can be changed)

## isort
- Specifically for sorting imports. Often used in combination with other formatters

Pros:
- Best-in-class for import organization
- Highly configurable
- Works well with Black and other formatters

Cons:
- Single-purpose tool (imports only)
- Can sometimes conflict with other formatters

```python

# pyproject.toml
[tool.black]
line-length = 88
target-version = ['py38']

[tool.isort]
profile = "black"  # Makes isort compatible with Black
multi_line_output = 3
```

Python line length standards:
- 79/80: Traditional PEP 8 standard. Good for side-by-side editing but can feel restrictive.
- 88: Black's default. Modern sweet spot between readability and expressiveness. Becoming the community standard.
- 100: Google's choice. Popular in enterprise. Good for complex expressions.
- 120: Maximum reasonable length. Works on wide screens but can hurt readability.
- Recommendation: Use 88 characters (Black's default) unless your team/project has an existing standard. It offers the best balance of readability and practicality while following modern community practices.

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

## Recommended Extensions

This project comes with recommended VS Code extensions to enhance your development experience. When you open this project in VS Code, you'll be prompted to install these extensions:

- **Python** (`ms-python.python`): Essential Python language support
- **Pylance** (`ms-python.vscode-pylance`): Fast, feature-rich language support for Python
- **Black Formatter** (`ms-python.black-formatter`): Official Black formatter integration
- **Ruff** (`charliermarsh.ruff`): Fast Python linter and formatter
- **MyPy** (`matangover.mypy`): Static type checking for Python
- **Even Better TOML** (`tamasfe.even-better-toml`): Improved TOML file support
- **YAML** (`redhat.vscode-yaml`): YAML language support
- **GitLens** (`eamodio.gitlens`): Enhanced Git integration
- **Code Spell Checker** (`streetsidesoftware.code-spell-checker`): Catch common spelling mistakes

These extensions are configured to work seamlessly with the project's setup and will help maintain code quality standards. VS Code will automatically suggest installing these extensions when you open the project.

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
- `black`formats Python code to enforce consistent and opinionated style rules across your codebase.

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
- **Pylance** (`ms-python.vscode-pylance`): Fast, feature-rich language support for Python
- **Black Formatter** (`ms-python.black-formatter`): Official Black formatter integration
- **Ruff** (`charliermarsh.ruff`): Fast Python linter and formatter
- **MyPy** (`matangover.mypy`): Static type checking for Python
- **Even Better TOML** (`tamasfe.even-better-toml`): Improved TOML file support
- **YAML** (`redhat.vscode-yaml`): YAML language support
- **GitLens** (`eamodio.gitlens`): Enhanced Git integration
- **Code Spell Checker** (`streetsidesoftware.code-spell-checker`): Catch common spelling mistakes

These extensions are configured to work seamlessly with the project's setup and will help maintain code quality standards. VS Code will automatically suggest installing these extensions when you open the project.