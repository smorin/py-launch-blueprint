# Writing and Running Tests

Testing is a crucial part of software development. This section provides guidelines and best practices for writing and running tests in the Py Launch Blueprint project.

## Testing Framework

We use `pytest` as our testing framework. It is a powerful and flexible testing tool that makes it easy to write simple and scalable test cases.

## Writing Tests

### Test Structure

Organize your tests in the `tests` directory. Each test file should start with `test_` and each test function should also start with `test_`.

Example:
```python
# tests/test_example.py

def test_example_function():
    assert example_function() == expected_result
```

### Test Naming

Use descriptive names for your test functions to make it clear what is being tested.

Example:
```python
# tests/test_math_operations.py

def test_addition():
    assert add(2, 3) == 5

def test_subtraction():
    assert subtract(5, 3) == 2
```

### Test Coverage

Ensure that your tests cover all critical paths and edge cases. Aim for high test coverage to catch potential issues early.

## Running Tests

### Running All Tests

To run all tests, use the following command:
```bash
uvx --with-editable . pytest
```

### Running a Single Test

To run a specific test file or test function, use the following command:
```bash
uvx --with-editable . pytest tests/test_file.py::test_function
```

### Test Reports

Generate test reports to get detailed information about test results. Use the `--cov` option with `pytest` to generate coverage reports.

Example:
```bash
uvx --with-editable . pytest --cov=py_launch_blueprint
```

## Best Practices

- Write tests for all new features and bug fixes.
- Keep tests isolated and independent from each other.
- Use fixtures to set up and tear down test environments.
- Mock external dependencies to avoid side effects.
- Run tests frequently to catch issues early.

By following these guidelines, you can ensure that your code is well-tested and maintainable.
