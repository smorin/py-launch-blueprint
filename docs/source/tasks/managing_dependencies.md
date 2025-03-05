# Managing Dependencies

This guide will walk you through the steps to manage dependencies for the Py Launch Blueprint project using Poetry or Pipenv.

## Using Poetry

Poetry is a dependency management and packaging tool for Python. It allows you to declare the libraries your project depends on and it will manage (install/update) them for you.

### Installing Poetry

To install Poetry, run the following command:

```bash
curl -sSL https://install.python-poetry.org | python3 -
```

### Adding Dependencies

To add a dependency to your project, use the `poetry add` command:

```bash
poetry add <package-name>
```

For example, to add the `requests` library:

```bash
poetry add requests
```

### Installing Dependencies

To install all the dependencies listed in the `pyproject.toml` file, run:

```bash
poetry install
```

### Updating Dependencies

To update all the dependencies to their latest versions, run:

```bash
poetry update
```

## Using Pipenv

Pipenv is another dependency management tool that aims to bring the best of all packaging worlds (bundled, unbundled, and pip) to the Python world.

### Installing Pipenv

To install Pipenv, run the following command:

```bash
pip install pipenv
```

### Adding Dependencies

To add a dependency to your project, use the `pipenv install` command:

```bash
pipenv install <package-name>
```

For example, to add the `requests` library:

```bash
pipenv install requests
```

### Installing Dependencies

To install all the dependencies listed in the `Pipfile`, run:

```bash
pipenv install
```

### Updating Dependencies

To update all the dependencies to their latest versions, run:

```bash
pipenv update
```

## Additional Resources

For more detailed information on managing dependencies with Poetry or Pipenv, refer to their official documentation:

- [Poetry Documentation](https://python-poetry.org/docs/)
- [Pipenv Documentation](https://pipenv.pypa.io/en/latest/)
