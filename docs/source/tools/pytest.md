# Pytest Test Framework

Pytest is a powerful testing framework for Python that makes it easy to write simple and scalable test cases. This guide will walk you through the steps to set up and use Pytest for testing in the Py Launch Blueprint project.

## Setting Up Pytest

To set up Pytest for your project, follow these steps:

1. **Install Pytest**:
   ```bash
   uv pip install pytest
   ```

2. **Configure Pytest**:
   Create a `pytest.ini` file in the root of your project with the following content:
   ```ini
   [pytest]
   minversion = 6.0
   addopts = -ra -q
   testpaths =
       tests
   ```

3. **Run Pytest**:
   To run your tests with Pytest, use the following command:
   ```bash
   uvx --with-editable . pytest
   ```

## Writing Tests

Create test files in the `tests` directory. Test files should be named `test_<module>.py` and should contain functions that start with `test_`.

Example test file `tests/test_example.py`:

```python
def test_example():
    assert 1 + 1 == 2
```

## Test Fixtures

Pytest fixtures provide a way to set up and tear down resources needed for tests. Fixtures are defined using the `@pytest.fixture` decorator.

Example fixture:

```python
import pytest

@pytest.fixture
def example_fixture():
    return {"key": "value"}

def test_with_fixture(example_fixture):
    assert example_fixture["key"] == "value"
```

## Test Parametrization

Pytest allows you to parametrize your tests, enabling you to run the same test with different inputs.

Example parametrized test:

```python
import pytest

@pytest.mark.parametrize("input,expected", [(1, 2), (2, 3), (3, 4)])
def test_parametrized(input, expected):
    assert input + 1 == expected
```

## Test Coverage

To check test coverage, use the `pytest-cov` plugin:

1. **Install pytest-cov**:
   ```bash
   uv pip install pytest-cov
   ```

2. **Run Tests with Coverage**:
   ```bash
   uvx --with-editable . pytest --cov=py_launch_blueprint
   ```

3. **View Coverage Report**:
   Generate an HTML coverage report:
   ```bash
   uvx --with-editable . pytest --cov=py_launch_blueprint --cov-report=html
   ```

   Open the `htmlcov/index.html` file in your browser to view the detailed coverage report.

## Additional Resources

For more detailed information on using Pytest, refer to the [official documentation](https://docs.pytest.org/en/stable/).
