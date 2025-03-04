# Command-Line Interface (CLI) Reference

This document provides detailed information on the command-line interface (CLI) of the Py Launch Blueprint project. The CLI allows users to interact with the project through various commands and options.

## Overview

The CLI is built using the `click` library, which provides a simple and intuitive way to create command-line interfaces. The main entry point for the CLI is the `py-projects` command.

## Commands

### `py-projects`

The `py-projects` command is the main entry point for the CLI. It provides several subcommands for different tasks.

#### Usage

```bash
py-projects [OPTIONS] COMMAND [ARGS]...
```

#### Options

- `--help`: Show the help message and exit.

#### Subcommands

- `search`: Search for projects.
- `init`: Initialize a new project.
- `config`: Manage configuration settings.

### `py-projects search`

The `search` command allows users to search for projects based on various criteria.

#### Usage

```bash
py-projects search [OPTIONS] QUERY
```

#### Options

- `--help`: Show the help message and exit.
- `--limit INTEGER`: Limit the number of results (default: 10).
- `--sort [name|date]`: Sort results by name or date (default: name).

#### Example

```bash
py-projects search --limit 5 --sort date "machine learning"
```

### `py-projects init`

The `init` command initializes a new project with the specified name and options.

#### Usage

```bash
py-projects init [OPTIONS] NAME
```

#### Options

- `--help`: Show the help message and exit.
- `--template [basic|advanced]`: Choose a project template (default: basic).
- `--license [MIT|GPL|Apache]`: Choose a license for the project (default: MIT).

#### Example

```bash
py-projects init --template advanced --license Apache my-new-project
```

### `py-projects config`

The `config` command allows users to manage configuration settings for the CLI.

#### Usage

```bash
py-projects config [OPTIONS] COMMAND [ARGS]...
```

#### Options

- `--help`: Show the help message and exit.

#### Subcommands

- `set`: Set a configuration value.
- `get`: Get a configuration value.
- `list`: List all configuration values.

### `py-projects config set`

The `set` command sets a configuration value.

#### Usage

```bash
py-projects config set [OPTIONS] KEY VALUE
```

#### Options

- `--help`: Show the help message and exit.

#### Example

```bash
py-projects config set default_template advanced
```

### `py-projects config get`

The `get` command retrieves a configuration value.

#### Usage

```bash
py-projects config get [OPTIONS] KEY
```

#### Options

- `--help`: Show the help message and exit.

#### Example

```bash
py-projects config get default_template
```

### `py-projects config list`

The `list` command lists all configuration values.

#### Usage

```bash
py-projects config list [OPTIONS]
```

#### Options

- `--help`: Show the help message and exit.

#### Example

```bash
py-projects config list
```

## Conclusion

The Py Launch Blueprint CLI provides a powerful and flexible way to interact with the project. By using the various commands and options, users can easily manage projects, search for information, and configure settings.
