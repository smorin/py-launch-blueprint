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