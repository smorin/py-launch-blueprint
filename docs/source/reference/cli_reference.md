# Command-Line Interface (CLI) Reference

This section provides detailed information about the command-line interface (CLI) for the Py Launch Blueprint project. The CLI allows you to interact with the project and perform various tasks directly from the command line.

## Overview

The CLI is implemented using the `click` library, which provides a simple and intuitive way to create command-line interfaces in Python. The CLI includes commands for common tasks such as running the project, managing dependencies, and performing code quality checks.

## Commands

### `run`

The `run` command is used to run the main application. It accepts various options and arguments to customize the behavior of the application.

#### Usage

```bash
just run [OPTIONS]
```

#### Options

- `--config FILE`: Specify the configuration file to use.
- `--debug`: Enable debug mode.
- `--help`: Show the help message and exit.

### `check`

The `check` command is used to perform code quality checks, including linting, type checking, and testing.

#### Usage

```bash
just check [OPTIONS]
```

#### Options

- `--lint`: Run the linter.
- `--type-check`: Run the type checker.
- `--test`: Run the tests.
- `--help`: Show the help message and exit.

### `install`

The `install` command is used to install the project dependencies.

#### Usage

```bash
just install [OPTIONS]
```

#### Options

- `--dev`: Install development dependencies.
- `--help`: Show the help message and exit.

### `format`

The `format` command is used to format the code using the configured code formatter.

#### Usage

```bash
just format [OPTIONS]
```

#### Options

- `--check`: Check if the code is formatted correctly without making changes.
- `--help`: Show the help message and exit.

### `lint`

The `lint` command is used to run the linter and check for code style violations.

#### Usage

```bash
just lint [OPTIONS]
```

#### Options

- `--fix`: Automatically fix code style violations.
- `--help`: Show the help message and exit.

### `test`

The `test` command is used to run the tests and generate a test coverage report.

#### Usage

```bash
just test [OPTIONS]
```

#### Options

- `--coverage`: Generate a test coverage report.
- `--help`: Show the help message and exit.

## Conclusion

The CLI provides a convenient way to interact with the Py Launch Blueprint project and perform common tasks directly from the command line. Refer to the help messages for each command for more detailed information on the available options and usage.
