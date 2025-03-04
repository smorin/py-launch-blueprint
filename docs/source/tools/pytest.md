# pytest Framework Usage

pytest is a powerful testing framework for Python that makes it easy to write simple and scalable test cases.

## Setting Up pytest

To set up pytest in your project, follow these steps:

1. **Install pytest**:
   ```bash
   pip install pytest
   ```

2. **Create a Test File**:
   Create a new file in your project directory, e.g., `test_example.py`:
   ```python
   def test_example():
       assert 1 + 1 == 2
   ```

3. **Run pytest**:
   Run pytest to execute your test cases:
   ```bash
   pytest
   ```

## pytest Configuration

pytest can be configured using a `pytest.ini` file in the root of your project. Here is an example configuration:

```ini
[pytest]
minversion = 6.0
addopts = -ra -q
testpaths =
    tests
```

## Writing Test Cases

Here are some examples of how to write test cases using pytest:

### Simple Test Case

```python
def test_addition():
    assert 1 + 1 == 2
```

### Test with Setup and Teardown

```python
def setup_function(function):
    print("Setting up")

def teardown_function(function):
    print("Tearing down")

def test_example():
    assert 1 + 1 == 2
```

### Parametrized Test

```python
import pytest

@pytest.mark.parametrize("a, b, expected", [
    (1, 1, 2),
    (2, 2, 4),
    (3, 3, 6),
])
def test_addition(a, b, expected):
    assert a + b == expected
```

## pytest Fixtures

Fixtures are a powerful feature of pytest that allows you to set up and tear down resources for your tests. Here is an example of how to use fixtures:

```python
import pytest

@pytest.fixture
def example_fixture():
    return 42

def test_example(example_fixture):
    assert example_fixture == 42
```

## Running Tests with Coverage

To measure test coverage, you can use the `pytest-cov` plugin. Install it with:

```bash
pip install pytest-cov
```

Then run pytest with the `--cov` option:

```bash
pytest --cov=your_project_directory
```

## Integrating pytest with Pre-commit Hooks

To ensure that tests are run automatically before each commit, you can integrate pytest with pre-commit hooks. Follow these steps:

1. **Install Pre-commit**:
   ```bash
   pip install pre-commit
   ```

2. **Create a `.pre-commit-config.yaml` file**:
   ```yaml
   repos:
     - repo: https://github.com/pre-commit/mirrors-prettier
       rev: v2.3.2
       hooks:
         - id: prettier
     - repo: https://github.com/pre-commit/mirrors-pylint
       rev: v2.7.4
       hooks:
         - id: pylint
     - repo: https://github.com/pre-commit/mirrors-mypy
       rev: v0.812
       hooks:
         - id: mypy
     - repo: https://github.com/pre-commit/mirrors-pytest
       rev: v6.2.4
       hooks:
         - id: pytest
   ```

3. **Install the Pre-commit Hook**:
   ```bash
   pre-commit install
   ```

Now, pytest will run automatically before each commit, helping you catch test failures early in the development process.

## Best Practices for Testing

- **Write Small, Focused Tests**: Each test should focus on a single piece of functionality.
- **Use Fixtures for Setup and Teardown**: Use fixtures to manage setup and teardown of resources.
- **Parametrize Tests**: Use parametrization to run the same test with different inputs.
- **Run Tests Regularly**: Run tests frequently to catch issues early.
- **Measure Test Coverage**: Use coverage tools to ensure your tests cover all code paths.

By following these best practices and integrating pytest into your development workflow, you can improve the reliability and maintainability of your code.

For more information on pytest, refer to the [official pytest documentation](https://docs.pytest.org/en/stable/).
