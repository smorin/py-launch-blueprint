# Customizing Py Launch Blueprint

This guide provides instructions on how to customize the Py Launch Blueprint template for your specific project needs.

## Prerequisites

Before customizing the template, ensure you have the following installed on your system:

- Python 3.10 or higher
- `uv` package manager
- `just` command runner

## Customizing the Project Name

1. **Update `pyproject.toml`**:
   - Change the `name` field under `[project]` to your desired project name.
   ```toml
   [project]
   name = "your_project_name"
   ```

2. **Rename the Main Package Directory**:
   - Rename the `py_launch_blueprint` directory to match your project name.
   ```bash
   mv py_launch_blueprint your_project_name
   ```

3. **Update Imports**:
   - Update all import statements in your code to reflect the new package name.
   ```python
   from your_project_name import some_module
   ```

## Customizing the CLI Command

1. **Update `pyproject.toml`**:
   - Change the `py-projects` entry under `[project.scripts]` to your desired command name.
   ```toml
   [project.scripts]
   your_command_name = "your_project_name.projects:main"
   ```

2. **Update the CLI Implementation**:
   - Update the `projects.py` file to reflect the new command name.
   ```python
   @click.command(name="your_command_name")
   ```

## Adding New Dependencies

1. **Update `pyproject.toml`**:
   - Add your new dependencies under the `[project.dependencies]` section.
   ```toml
   [project.dependencies]
   new_dependency = ">=1.0.0"
   ```

2. **Install Dependencies**:
   - Run the following command to install the new dependencies.
   ```bash
   uv pip install --editable ".[dev]"
   ```

## Customizing the Development Environment

1. **Update `Justfile`**:
   - Add or modify tasks in the `Justfile` to suit your development workflow.
   ```just
   @new-task:
       echo "This is a new task"
   ```

2. **Update Pre-commit Hooks**:
   - Modify the `.pre-commit-config.yaml` file to add or remove hooks as needed.
   ```yaml
   - repo: https://github.com/pre-commit/pre-commit-hooks
     rev: v2.3.0
     hooks:
       - id: check-yaml
       - id: end-of-file-fixer
       - id: trailing-whitespace
       - id: new-hook
   ```

## Customizing the Documentation

1. **Update `docs/source/conf.py`**:
   - Modify the Sphinx configuration to reflect your project's details.
   ```python
   project = 'your_project_name'
   author = 'Your Name'
   ```

2. **Add New Documentation Pages**:
   - Create new `.md` files in the `docs/source` directory and update the table of contents in `index.md`.
   ```markdown
   ```{toctree}
   :maxdepth: 2
   :caption: Contents

   new_page
   ```
   ```

## Customizing CI/CD Workflows

1. **Update GitHub Actions Workflows**:
   - Modify the workflow files in the `.github/workflows` directory to suit your CI/CD needs.
   ```yaml
   name: Custom CI/CD

   on:
     push:
       branches: [ main ]
     pull_request:
       branches: [ main ]

   jobs:
     test:
       runs-on: ubuntu-latest
       steps:
         - uses: actions/checkout@v4
         - name: Set up Python
           uses: actions/setup-python@v5
           with:
             python-version: "3.10"
         - name: Install dependencies
           run: uv pip install --editable ".[dev]"
         - name: Run tests
           run: uvx pytest
   ```

## Conclusion

By following these steps, you can customize the Py Launch Blueprint template to fit your specific project requirements. This guide covers the most common customization tasks, but feel free to modify the template further to suit your needs.
