# Public API Documentation

This section provides detailed information about the public API of the Py Launch Blueprint project. The API allows you to interact with the project programmatically and perform various tasks.

## Overview

The Py Launch Blueprint project exposes a set of public APIs that can be used to interact with the project. These APIs are designed to be easy to use and provide a consistent interface for common tasks.

## API Endpoints

### `get_project_info`

The `get_project_info` endpoint retrieves information about the project, including its name, version, and description.

#### Usage

```python
from py_launch_blueprint import get_project_info

info = get_project_info()
print(info)
```

#### Response

The response is a dictionary containing the following keys:

- `name`: The name of the project.
- `version`: The version of the project.
- `description`: A brief description of the project.

### `create_project`

The `create_project` endpoint creates a new project with the specified name and configuration.

#### Usage

```python
from py_launch_blueprint import create_project

project = create_project(name="My Project", config={"language": "Python"})
print(project)
```

#### Parameters

- `name` (str): The name of the new project.
- `config` (dict): A dictionary containing the configuration for the new project.

#### Response

The response is a dictionary containing the following keys:

- `id`: The unique identifier of the new project.
- `name`: The name of the new project.
- `config`: The configuration of the new project.

### `delete_project`

The `delete_project` endpoint deletes an existing project with the specified ID.

#### Usage

```python
from py_launch_blueprint import delete_project

result = delete_project(project_id="12345")
print(result)
```

#### Parameters

- `project_id` (str): The unique identifier of the project to be deleted.

#### Response

The response is a dictionary containing the following keys:

- `status`: The status of the delete operation (e.g., "success" or "error").
- `message`: A message providing additional information about the delete operation.

## Conclusion

The public API of the Py Launch Blueprint project provides a convenient way to interact with the project programmatically. Refer to the documentation for each endpoint for more detailed information on the available parameters and usage.
