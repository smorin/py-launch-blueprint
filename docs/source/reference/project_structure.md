<!--
Copyright (c) 2025, Steve Morin

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
-->
# Project Structure

The Py Launch Blueprint project follows a modular and organized directory layout to ensure maintainability and scalability. This section provides an overview of the directory structure and the purpose of each directory and file.

## Directory Layout

The project is organized into the following directories:

```
py-launch-blueprint/
├── tests/                          # Test files
├── docs/                           # Documentation files
├── Justfile                        # Just task runner configuration
├── Makefile                        # Makefile for building the project
├── py_launch_blueprint/            # Source code for the project
└── tests/                          # Test files
```

Detailed version of the project structure:


```
py-launch-blueprint/
├── .github/                        # GitHub configuration files
│   ├── ISSUE_TEMPLATE/             # Issue templates
│   ├── PULL_REQUEST_TEMPLATE       # Pull request templates
│   └── workflows/                  # GitHub Actions workflows
├── docs/                           # Documentation files
│   ├── source/                     # Sphinx source files
│   │   ├── _static/                # Static assets (CSS, images)
│   │   ├── _templates/             # Sphinx template overrides
│   │   ├── about/                  # Project context and philosophy
│   │   ├── tasks/                  # Step-by-step workflows
│   │   ├── tools/                  # Technical tooling reference
│   │   ├── tutorials/              # Guided learning paths
│   │   ├── reference/              # Technical references
│   │   └── contributing/           # Contribution guidelines
│   └── build/                      # Built documentation files
├── py_launch_blueprint/            # Source code for the project
│   ├── __init__.py                 # Package initialization
│   ├── _version.py                 # Version information
│   └── projects.py                 # Main project module
├── tests/                          # Test files
│   ├── __init__.py                 # Test package initialization
│   ├── test_api.py                 # API tests
│   ├── test_cli.py                 # CLI tests
│   ├── test_config.py              # Configuration tests
│   └── test_projects.py            # Project module tests
├── .gitignore                      # Git ignore file
├── .pre-commit-config.yaml         # Pre-commit hooks configuration
├── .python-version                 # Python version file
├── .readthedocs.yaml               # Read the Docs configuration
├── .vscode/                        # VS Code configuration files
│   └── extensions.json             # Recommended extensions
├── CLAUDE.md                       # CLAUDE documentation
├── CODE_OF_CONDUCT.md              # Code of conduct
├── CONTRIBUTING.md                 # Contributing guidelines
├── docs/                           # Documentation files
│   ├── cla_faq.md                  # CLA FAQ
│   ├── cla/                        # CLA files
│   │   ├── corporate_cla.md        # Corporate CLA
│   │   └── individual_cla.md       # Individual CLA
│   ├── Makefile                    # Makefile for building documentation
│   ├── source/                     # Sphinx source files
│   │   ├── _templates/             # Sphinx template overrides
│   │   ├── about/                  # Project context and philosophy
│   │   ├── tasks/                  # Step-by-step workflows
│   │   ├── tools/                  # Technical tooling reference
│   │   ├── tutorials/              # Guided learning paths
│   │   ├── reference/              # Technical references
│   │   └── contributing/           # Contribution guidelines
│   └── build/                      # Built documentation files
├── EXAMPLECLI.md                   # Example CLI documentation
├── Justfile                        # Just task runner configuration
├── Makefile                        # Makefile for building the project
├── PULL_REQUEST_TEMPLATE.md        # Pull request template
├── py_launch_blueprint/            # Source code for the project
│   ├── __init__.py                 # Package initialization
│   ├── _version.py                 # Version information
│   └── projects.py                 # Main project module
├── pyproject.toml                  # Project configuration file
├── cog.toml                        # Cog configuration file
├── CONTRIBUTORS.md                 # Project contributors
├── pyrightconfig.json              # Pyright configuration
├── README.md                       # Project overview and navigation
├── SECURITY.md                     # Security policy
└── tests/                          # Test files
    ├── __init__.py                 # Test package initialization
    ├── test_api.py                 # API tests
    ├── test_cli.py                 # CLI tests
    ├── test_config.py              # Configuration tests
    └── test_projects.py            # Project module tests
```

## Directory Descriptions

### .github/

Contains GitHub-specific configuration files, including GitHub Actions workflows and issue templates.

### docs/

Contains all documentation files, including Sphinx source files, static assets, and built documentation.

### py_launch_blueprint/

Contains the source code for the project, including the main project module and version information.

### tests/

Contains test files for the project, including API tests, CLI tests, and configuration tests.

### .gitignore

Specifies files and directories to be ignored by Git.

### .pre-commit-config.yaml

Configuration file for pre-commit hooks to ensure code quality and consistency.

### .python-version

Specifies the Python version used for the project.

### .readthedocs.yaml

Configuration file for Read the Docs to build and host the documentation.

### .vscode/

Contains VS Code-specific configuration files, including recommended extensions.

### CLAUDE.md

Contains documentation for the CLAUDE tool.

### CODE_OF_CONDUCT.md

Specifies the code of conduct for contributors to the project.

### CONTRIBUTING.md

Provides guidelines for contributing to the project.

### EXAMPLECLI.md

Contains documentation for the example CLI tool.

### Justfile

Configuration file for the Just task runner to manage development tasks.

### Makefile

Contains build instructions for the project.

### PULL_REQUEST_TEMPLATE.md

Template for pull requests to ensure consistency and completeness.

### pyproject.toml

Configuration file for the project, including dependencies and build settings.

### cog.toml
Configuration file for COG (Cocogitto), a tool for generating and updating files based on templates. used for to update contributors list.

### CONTRIBUTORS.md
Auto-generated file using COG (Cocogitto) that lists the project contributors.

### pyrightconfig.json

Configuration file for Pyright, a static type checker for TypeScript and JavaScript.

### README.md

Provides an overview of the project and serves as a navigation hub for the documentation.

### SECURITY.md

Specifies the security policy for the project.
