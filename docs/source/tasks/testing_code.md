# Testing Code

This guide will walk you through the steps to write and run tests for the Py Launch Blueprint project.

## Prerequisites

Before you begin, ensure you have the following installed on your system:

- Python 3.10 or higher
- `uv` package manager
- `pytest` testing framework

## Steps

### 1. Write Tests

Create test files in the `tests` directory. Test files should be named `test_<module>.py` and should contain functions that start with `test_`.

Example test file `tests/test_example.py`:

```python
def test_example():
    assert 1 + 1 == 2
```

### 2. Run Tests

Run the tests using the `pytest` command:

```bash
uvx --with-editable . pytest
```

This command runs all the tests in the `tests` directory.

### 3. Check Test Coverage

Check the test coverage using the `pytest-cov` plugin:

```bash
uvx --with-editable . pytest --cov=py_launch_blueprint
```

This command generates a test coverage report.

### 4. View Test Coverage Report

View the test coverage report in the terminal or generate an HTML report:

```bash
uvx --with-editable . pytest --cov=py_launch_blueprint --cov-report=html
```

Open the `htmlcov/index.html` file in your browser to view the detailed coverage report.

## Additional Resources

For more detailed information on writing and running tests, refer to the following sections:

- [Writing Clean Code](writing_clean_code.md)
- [Type Checking Code](type_checking_code.md)
- [Managing Dependencies](managing_dependencies.md)
