# Py Launch Blueprint: A Production-Ready Python Project Template with Integrated Best Practices

 Py Launch Blueprint is a comprehensive Python project template that eliminates setup friction by providing a pre-configured development environment with carefully selected tools for linting, formatting, and type checking. It includes an annotated CLI example and detailed documentation explaining each tool choice and configuration decision, making it an ideal starting point for professional Python projects.

Will use either
- https://copier.readthedocs.io/en/latest/
OR
- https://github.com/cruft/cruft
- https://github.com/cookiecutter/cookiecutter

## Features

- 🔍 Fuzzy search for project names
- 🏢 Filter by workspace
- 📋 Multiple output formats (text, JSON, CSV)
- 📎 Clipboard integration
- 🎨 Rich terminal UI with color support
- 🔐 Secure token handling
- ⚡ Fast and efficient pagination

## Installation

### From PyPI

```bash
pip install py-launch-blueprint
```

### From Source

```bash
git clone https://github.com/smorin/py-launch-blueprint.git
cd py-launch-blueprint
pip install -e ".[dev]"  # Install with development dependencies
```

### Direct Usage

You can also run the script directly:

```bash
python projects.py --help
```

## Configuration

The tool supports multiple ways to provide your Py Personal Access Token (PAT), in order of precedence:

1. Command-line argument: `--token`
2. Environment variable: `PY_TOKEN`
3. Configuration file: `~/.config/py-launch-blueprint/.env`

### Setting Up Configuration File

1. Create the config directory:
```bash
mkdir -p ~/.config/py-launch-blueprint
```

2. Create `.env` file:
```bash
echo "PY_TOKEN=your_token_here" > ~/.config/py-launch-blueprint/.env
```

3. Set proper permissions:
```bash
chmod 600 ~/.config/py-launch-blueprint/.env
```

## Usage

### Basic Usage

```bash
# Search for projects
py-projects

# Filter by workspace
py-projects --workspace "My Workspace"

# Limit results
py-projects --limit 50
```

### Output Formats

```bash
# JSON output
py-projects --format json

# CSV output
py-projects --format csv

# Copy to clipboard
py-projects --copy

# Save to file
py-projects --output projects.txt
```

### Additional Options

```bash
# Show verbose output
py-projects --verbose

# Disable colors
py-projects --no-color

# Show help
py-projects --help

# Show version
py-projects --version
```

## Development

### Setup Development Environment

```bash

# Create and activate a virtual environment if needed
uv venv
source .venv/bin/activate  # On Unix/macOS

# Install the package in editable mode with development dependencies
uv pip install --editable ".[dev]"

py-projects

# (Optional) Setup Pre-Commit Hook
uvx --with-editable .pre-commit install

# Run development tools directly (no need for 'uv pip run')
pytest
black py_launch_blueprint/
isort py_launch_blueprint/
mypy py_launch_blueprint/
ruff check py_launch_blueprint/

# Or run with our the virtual environment

# Run tests
uvx --with-editable . pytest

# Run tests with coverage
uvx --with pytest-cov --with-editable . pytest --cov=py_launch_blueprint.projects --cov-report=term-missing

# Format code
uvx black py_launch_blueprint/

# Sort imports
uvx isort py_launch_blueprint/

# Run type checker
uvx mypy py_launch_blueprint/

# Run linter
uvx ruff check py_launch_blueprint/

# Run command
uvx --with-editable .  --from py_launch_blueprint py-projects
```

### Project Structure

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

## Error Codes

- 0: Successful execution
- 1: Configuration error
- 2: Authentication error
- 3: API error
- 4: Input/Output error
- 5: User interrupt

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.


# Notes on tool choices

### Install Pre-commit

To use the pre-commit hooks in this repository, you need to install the `pre-commit` package. Follow these steps:

1. Install `pre-commit` via pip:

    ```bash
    pip install pre-commit
    ```

2. Install the Git hooks defined in the `.pre-commit-config.yaml`:

    ```bash
    pre-commit install
    ```

This command sets up the necessary hooks in your Git configuration so they run automatically before each commit.

### Available Hooks

This project is configured with the following pre-commit hooks:

1. **isort**: Automatically sorts your import statements to follow the `black` code style.
2. **pytest**: Runs the test suite with `pytest` to ensure that tests are passing before committing.
3. **mypy**: Type checking with `mypy` to catch type errors.
4. **ruff**: Runs `ruff` for linting and code formatting fixes.

### Running Pre-commit Hooks Manually

You can run the pre-commit hooks manually if you want to check everything before committing, or if you want to run them without making a commit:

```bash
pre-commit run --all-files
```

This will run all hooks on all the files in the repository.

### Updating Pre-commit Hooks

To update the pre-commit hooks to their latest versions, you can run:

```bash
pre-commit autoupdate
```

This will update the hook versions defined in the `.pre-commit-config.yaml` file.

---

By using these pre-commit hooks, you ensure your code stays clean, properly formatted, and well-tested, helping maintain a high code quality standard.
### How to Use

Once the hooks are installed, they will run automatically when you make a commit. Here’s what each hook does:

#### pytest

The `pytest` hook runs the entire test suite to ensure that your code is working as expected before committing. It will run on every commit to catch any test failures early.

- It runs all tests in your project.
- If any tests fail, the commit will be blocked.

To run tests manually, you can also use `pytest` directly:

```bash
pytest
```

#### Black
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

#### isort
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

#### mypy
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
