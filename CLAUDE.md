<!--
Copyright (c) 2025, Steve Morin

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
-->
# CLAUDE.md - Agent Guidelines for Py Launch Blueprint

## Project Commands
- Setup: `just setup` or `uv pip install --editable ".[dev]"`
- Format: `just format` or `uvx ruff format py_launch_blueprint/`
- Lint: `just lint` or `uvx ruff check py_launch_blueprint/`
- Type check: `just typecheck` or `uvx --with-editable . mypy py_launch_blueprint/`
- Test all: `just test` or `uvx --with-editable . pytest`
- Test single: `uvx --with-editable . pytest tests/test_file.py::test_name`
- All checks: `just check`
- Pre-commit: `just pre-commit-run`

## Code Style Guidelines
- Line length: 88 characters (Black standard)
- Types: Strict typing required for all functions
- Imports: Sorted with relative imports preferred
- Naming: PEP 8 conventions enforced via Ruff
- Errors: Prefer explicit error handling over assertions
- Tests: Type annotations optional for test files
- Security: No hardcoded credentials, follow bandit rules

## Developer Environment
- Python: 3.10+ required
- Package manager: `uv` recommended, pip supported
- IDE: VS Code with Ruff, MyPy and Pylance extensions
