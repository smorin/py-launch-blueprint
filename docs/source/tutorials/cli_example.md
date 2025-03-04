# CLI Tool Development Example

This tutorial will guide you through the process of developing a command-line interface (CLI) tool using the Py Launch Blueprint template.

## Prerequisites

Before you begin, ensure you have the following installed:

- Python 3.10+
- `uv` package manager
- `just` task runner

## Step 1: Create a New Project

1. Open your terminal and navigate to the directory where you want to create your project.
2. Run the following command to create a new project using the Py Launch Blueprint template:

   ```bash
   uv create my-cli-tool --template py-launch-blueprint
   ```

3. Navigate to the newly created project directory:

   ```bash
   cd my-cli-tool
   ```

## Step 2: Define the CLI Command

1. Open the `py_launch_blueprint/projects.py` file in your preferred code editor.
2. Define a new CLI command using the `click` library. Add the following code to the file:

   ```python
   import click

   @click.command()
   @click.option('--name', prompt='Your name', help='The person to greet.')
   def greet(name):
       """Simple program that greets NAME."""
       click.echo(f"Hello, {name}!")

   if __name__ == '__main__':
       greet()
   ```

3. Save the file.

## Step 3: Update the `pyproject.toml` File

1. Open the `pyproject.toml` file in your code editor.
2. Add the new CLI command to the `[project.scripts]` section:

   ```toml
   [project.scripts]
   greet = "py_launch_blueprint.projects:greet"
   ```

3. Save the file.

## Step 4: Install the Project

1. In your terminal, run the following command to install the project in editable mode:

   ```bash
   uv pip install --editable .
   ```

## Step 5: Run the CLI Command

1. In your terminal, run the following command to execute the CLI command:

   ```bash
   greet
   ```

2. You should see a prompt asking for your name. Enter your name and press Enter.
3. The program should greet you with a message like "Hello, [Your Name]!".

## Conclusion

Congratulations! You have successfully developed a simple CLI tool using the Py Launch Blueprint template. This tutorial covered the basics of creating a new project, defining a CLI command, updating the project configuration, and running the CLI command. You can now extend this example to create more complex CLI tools for your projects.
