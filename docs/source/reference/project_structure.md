# Project Structure

This document provides an overview of the directory layout and conventions used in the Py Launch Blueprint project.

## Directory Layout

The project is organized into the following directories:

```
py-launch-blueprint/
├── .github/                # GitHub-specific files (workflows, issue templates, etc.)
│   ├── workflows/          # GitHub Actions workflows
│   └── ISSUE_TEMPLATE.md   # Issue template for GitHub
├── docs/                   # Documentation files
│   ├── source/             # Source files for Sphinx documentation
│   │   ├── _static/        # Static assets (CSS, images)
│   │   ├── _templates/     # Sphinx template overrides
│   │   ├── about/          # Project context and philosophy
│   │   ├── tasks/          # Step-by-step workflows
│   │   ├── tools/          # Technical tooling reference
│   │   ├── tutorials/      # Guided learning paths
│   │   ├── reference/      # Technical references
│   │   └── contributing/   # Contribution guidelines
│   └── build/              # Built documentation files
├── py_launch_blueprint/    # Main Python package
│   ├── __init__.py         # Package initialization
│   ├── projects.py         # Core functionality
│   └── _version.py         # Version information
├── tests/                  # Test files
│   ├── __init__.py         # Test package initialization
│   ├── test_api.py         # API tests
│   ├── test_cli.py         # CLI tests
│   └── test_config.py      # Configuration tests
├── .gitignore              # Git ignore file
├── .pre-commit-config.yaml # Pre-commit hooks configuration
├── .python-version         # Python version file
├── .readthedocs.yaml       # Read the Docs configuration
├── .vscode/                # VS Code configuration
│   └── extensions.json     # Recommended extensions for VS Code
├── CLAUDE.md               # Agent guidelines
├── CODE_OF_CONDUCT.md      # Code of conduct
├── CONTRIBUTING.md         # Contributing guidelines
├── docs/cla_faq.md         # CLA FAQ
├── docs/cla/               # CLA details
│   ├── corporate_cla.md    # Corporate CLA
│   └── individual_cla.md   # Individual CLA
├── docs/Makefile           # Makefile for building documentation
├── docs/source/            # Source files for Sphinx documentation
│   ├── _templates/         # Sphinx template overrides
│   ├── conf.py             # Sphinx configuration
│   ├── docs.md             # Documentation guide
│   ├── index.md            # Main landing page
│   ├── reference/          # Technical references
│   │   ├── index.md        # Reference overview
│   │   ├── project_structure.md # Directory layout conventions
│   │   ├── configuration_files.md # Configuration file formats
│   │   ├── cli_reference.md # Command-line interface
│   │   └── api_reference.md # Public API documentation
├── EXAMPLECLI.md           # Example CLI usage
├── Justfile                # Justfile for task automation
├── Makefile                # Makefile for task automation
├── PULL_REQUEST_TEMPLATE.md # Pull request template
├── py_launch_blueprint/    # Main Python package
│   ├── __init__.py         # Package initialization
│   ├── projects.py         # Core functionality
│   └── _version.py         # Version information
├── pyproject.toml          # Project configuration
├── pyrightconfig.json      # Pyright configuration
├── README.md               # Project overview
├── SECURITY.md             # Security policy
└── tests/                  # Test files
    ├── __init__.py         # Test package initialization
    ├── test_api.py         # API tests
    ├── test_cli.py         # CLI tests
    └── test_config.py      # Configuration tests
```

## Conventions

- **Source Code**: All source code for the project is located in the `py_launch_blueprint` directory.
- **Tests**: All test files are located in the `tests` directory.
- **Documentation**: All documentation files are located in the `docs` directory, with source files for Sphinx documentation in `docs/source`.
- **Configuration**: Configuration files for various tools and services are located in the root directory and relevant subdirectories.
