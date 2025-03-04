# API Reference

This document provides detailed information about the public API of the Py Launch Blueprint project. The API allows users to interact with the project programmatically.

## Overview

The Py Launch Blueprint project provides a set of functions and classes that can be used to perform various tasks related to project management, configuration, and execution.

## Modules

### `py_launch_blueprint.projects`

The `projects` module contains functions and classes for managing projects.

#### Functions

- `create_project(name: str, template: str) -> None`: Creates a new project with the specified name and template.
- `delete_project(name: str) -> None`: Deletes the project with the specified name.
- `list_projects() -> List[str]`: Returns a list of all projects.

#### Classes

- `Project`: Represents a project.
  - `name: str`: The name of the project.
  - `template: str`: The template used for the project.
  - `created_at: datetime`: The creation date of the project.
  - `last_modified: datetime`: The last modification date of the project.
  - `status: str`: The current status of the project.

### `py_launch_blueprint.config`

The `config` module contains functions and classes for managing configuration settings.

#### Functions

- `get_config(key: str) -> Any`: Retrieves the value of the specified configuration key.
- `set_config(key: str, value: Any) -> None`: Sets the value of the specified configuration key.
- `list_configs() -> Dict[str, Any]`: Returns a dictionary of all configuration settings.

#### Classes

- `Config`: Represents a configuration setting.
  - `key: str`: The key of the configuration setting.
  - `value: Any`: The value of the configuration setting.
  - `description: str`: A description of the configuration setting.

### `py_launch_blueprint.cli`

The `cli` module contains functions and classes for interacting with the command-line interface.

#### Functions

- `run_command(command: str, args: List[str]) -> None`: Runs the specified command with the given arguments.
- `list_commands() -> List[str]`: Returns a list of all available commands.

#### Classes

- `Command`: Represents a command.
  - `name: str`: The name of the command.
  - `description: str`: A description of the command.
  - `execute(args: List[str]) -> None`: Executes the command with the given arguments.

## Examples

### Creating a Project

```python
from py_launch_blueprint.projects import create_project

create_project(name="my_project", template="basic")
```

### Setting a Configuration

```python
from py_launch_blueprint.config import set_config

set_config(key="default_template", value="advanced")
```

### Running a Command

```python
from py_launch_blueprint.cli import run_command

run_command(command="init", args=["my_project"])
```

## Conclusion

The Py Launch Blueprint API provides a powerful and flexible way to interact with the project programmatically. By using the various functions and classes, users can easily manage projects, configure settings, and execute commands.
