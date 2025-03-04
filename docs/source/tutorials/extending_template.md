# Extending the Template

This tutorial will guide you through the process of customizing and extending the Py Launch Blueprint template to fit your specific needs. By the end of this tutorial, you will have a deeper understanding of how to modify the template and add new features.

## Prerequisites

Before you begin, ensure you have the following installed on your system:

- Python 3.10 or higher
- `uv` package manager
- `just` command runner

## Steps

### 1. Clone the Repository

First, clone the Py Launch Blueprint repository to your local machine:

```bash
git clone https://github.com/smorin/py-launch-blueprint.git
cd py-launch-blueprint
```

### 2. Install Dependencies

Next, install the project dependencies using `uv`:

```bash
uv pip install --editable ".[dev]"
```

This command installs the project in editable mode along with all development dependencies.

### 3. Set Up Pre-commit Hooks

Set up pre-commit hooks to ensure code quality before committing changes:

```bash
uvx --with-editable . pre-commit install
```

### 4. Modify the Template

You can now start customizing the template to fit your needs. Here are some common modifications:

#### Adding a New Command

1. Create a new Python file in the `py_launch_blueprint` directory:

```bash
touch py_launch_blueprint/new_command.py
```

2. Define your new command in the file:

```python
import click

@click.command()
def new_command():
    click.echo("This is a new command!")

if __name__ == "__main__":
    new_command()
```

3. Register the new command in the `pyproject.toml` file:

```toml
[project.scripts]
new-command = "py_launch_blueprint.new_command:new_command"
```

#### Customizing the CLI

1. Open the `py_launch_blueprint/projects.py` file.
2. Modify the existing commands or add new ones as needed.
3. Update the `pyproject.toml` file to reflect the changes.

### 5. Test Your Changes

Run the tests to ensure your changes work as expected:

```bash
just test
```

### 6. Build Documentation

To build the project documentation, use the following command:

```bash
cd docs
make html
```

This command generates the HTML documentation in the `docs/build` directory.

## Additional Resources

For more detailed information on using the Py Launch Blueprint template, refer to the following sections:

- [Full Project Setup](full_project_setup.md)
- [Writing Clean Code](writing_clean_code.md)
- [Managing Dependencies](managing_dependencies.md)
- [Testing Code](testing_code.md)
- [Using CI/CD](using_ci_cd.md)
