# Managing Dependencies

This guide will walk you through the steps to manage dependencies for the Py Launch Blueprint project using Poetry or Pipenv.

## Using Poetry

### 1. Install Poetry

First, install Poetry on your system:

```bash
curl -sSL https://install.python-poetry.org | python3 -
```

### 2. Add Dependencies

To add a new dependency to your project, use the following command:

```bash
poetry add <package-name>
```

For example, to add the `requests` library:

```bash
poetry add requests
```

### 3. Add Development Dependencies

To add a development dependency, use the `--dev` flag:

```bash
poetry add --dev <package-name>
```

For example, to add `pytest` as a development dependency:

```bash
poetry add --dev pytest
```

### 4. Install Dependencies

To install all dependencies listed in the `pyproject.toml` file, use:

```bash
poetry install
```

### 5. Update Dependencies

To update all dependencies to their latest versions, use:

```bash
poetry update
```

## Using Pipenv

### 1. Install Pipenv

First, install Pipenv on your system:

```bash
pip install pipenv
```

### 2. Add Dependencies

To add a new dependency to your project, use the following command:

```bash
pipenv install <package-name>
```

For example, to add the `requests` library:

```bash
pipenv install requests
```

### 3. Add Development Dependencies

To add a development dependency, use the `--dev` flag:

```bash
pipenv install --dev <package-name>
```

For example, to add `pytest` as a development dependency:

```bash
pipenv install --dev pytest
```

### 4. Install Dependencies

To install all dependencies listed in the `Pipfile`, use:

```bash
pipenv install
```

### 5. Update Dependencies

To update all dependencies to their latest versions, use:

```bash
pipenv update
```

## Additional Resources

For more detailed information on managing dependencies with Poetry or Pipenv, refer to their official documentation:

- [Poetry Documentation](https://python-poetry.org/docs/)
- [Pipenv Documentation](https://pipenv.pypa.io/en/latest/)
