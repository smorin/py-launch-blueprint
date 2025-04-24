<!--
Copyright (c) 2025, Steve Morin

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
-->
# Managing Dependencies with UV and Pip

## Using UV
[UV](https://github.com/astral-sh/uv) is a fast Python package manager for efficient dependency management.

### Installation
To install UV, run the following command:

```sh
pip install uv
```

### Installing Dependencies
To install project dependencies in editable mode, use:

```sh
uv pip install --editable ".[dev]"
```

### Development Tools
Use UV to run various development tools:

```sh
uvx ruff format py_launch_blueprint/       # Format code
uvx ruff check py_launch_blueprint/        # Run linter
uvx --with-editable . mypy py_launch_blueprint/  # Type check
uvx --with-editable . pytest               # Run tests
uvx --with pytest-cov --with-editable . pytest --cov=py_launch_blueprint.projects --cov-report=term-missing  # Test coverage
```

### Pre-Commit Hooks (Optional)
Set up and run pre-commit hooks with:

```sh
uvx --with-editable . pre-commit install
uvx pre-commit run --all-files
```

### Updating & Removing Packages
To update all dependencies, use:

```sh
uv pip install --upgrade                    # Update all dependencies
uv pip install --upgrade <package-name>     # Update a specific package
uv pip uninstall <package-name>             # Remove a package
```

### Freezing Dependencies
To freeze the dependencies into a `requirements.lock` file:

```sh
uv pip freeze > requirements.lock
```

---

## Using Pip

### Virtual Environment Setup
To create and activate a virtual environment:

```sh
python3 -m venv .venv
source .venv/bin/activate   # Unix/macOS
.venv\Scripts\activate      # Windows
```

### Installing Dependencies
Install project dependencies in editable mode:

```sh
pip install --editable ".[dev]"
```

### Running Tools
You can run development tools directly with pip:

```sh
ruff format py_launch_blueprint/
ruff check py_launch_blueprint/
mypy py_launch_blueprint/
pytest --cov=py_launch_blueprint.projects --cov-report=term-missing
```


For more details, refer to the official [UV documentation](https://github.com/astral-sh/uv).
