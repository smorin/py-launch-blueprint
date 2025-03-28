# Configuration Files

This section provides detailed information about the configuration files used in the Py Launch Blueprint project. Understanding these configuration files will help you customize and extend the project to fit your specific needs.

## pyproject.toml

The `pyproject.toml` file is the central configuration file for the project. It contains metadata about the project, dependencies, and tool-specific configurations. see [pyproject.toml](https://github.com/smorin/py-launch-blueprint/blob/main/pyproject.toml) file for more details.

## .pre-commit-config.yaml

The `.pre-commit-config.yaml` file is used to configure pre-commit hooks. These hooks run code quality checks before commits, ensuring that only clean and consistent code is committed. see [pre-commit-config.yaml](https://github.com/smorin/py-launch-blueprint/blob/main/.pre-commit-config.yaml) file for more details.

## pyrightconfig.json

The `pyrightconfig.json` file configures the Pyright static type checker. It specifies settings such as included and excluded directories, defined constants, the Python version to target, and various reporting options for type-related issues. This file allows you to customize how strictly Pyright checks your code for type errors. see [pyrightconfig.json](https://github.com/smorin/py-launch-blueprint/blob/main/pyrightconfig.json) file for more details.

## cog.toml

The `cog.toml` file configures the `cog` tool, which is used to automate changelog generation and contributor tracking. It defines settings such as:

- **Repository URL**: Links the changelog to the repository.
- **Changelog Style**: Specifies the format for changelog entries.
- **Commit Parsing**: Determines how commit messages are categorized (e.g., features, fixes).
- **Contributor Formatting**: Configures how contributors are listed and sorted in the `CONTRIBUTORS.md` file.

This file ensures consistency in changelog updates and contributor tracking.see [cog.toml](https://github.com/smorin/py-launch-blueprint/blob/main/cog.toml) for more details.
