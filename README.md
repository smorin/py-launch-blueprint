![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)

# Py Launch Blueprint: A Production-Ready Python Project Template with Integrated Best Practices
 Py Launch Blueprint is a comprehensive Python project template that eliminates setup friction by providing a pre-configured development environment with carefully selected tools for linting, formatting, and type checking. It includes an annotated CLI example and detailed documentation explaining each tool choice and configuration decision, making it an ideal starting point for professional Python projects.

![Py Launch Blueprint Logo](./template_images/py_launch_blueprint_logo_100x100.png)

## Why Choose Py Launch Blueprint?

Py Launch Blueprint eliminates the setup friction in Python projects by providing a production-ready template with carefully curated tools and best practices. Here's what makes it special:

## Full documentation on ReadTheDocs
- [py-launch-blueprint Docs](https://py-launch-blueprint.readthedocs.io/en/latest/)

### 🚀 Key Features

- **Zero Configuration Setup**: Get started immediately with pre-configured development tools
- **Type Safety First**: Built-in MyPy configuration and VS Code integration for robust type checking
- **Modern Development Tools**:
  - ⚡ Ruff for lightning-fast linting and formatting
  - 🔍 Pre-commit hooks for code quality enforcement
  - 📝 Type checking with MyPy and Pylance
  - 📋 Taplo for TOML file formatting and validation
- **AI Enabled**:
  - 🧠 Default .cursor/rules/projectenv.mdc
  - 🧠 Default .windsurfules
  - 🧠 Default Claude Code CLAUDE.md

### 💪 Production Ready
- **Python 3.10+ Support**: Leverages modern Python features
- **Dependency Management**: Uses `uv` for fast, reliable package management
- **CI/CD Ready**: Includes GitHub Actions workflows
- **Comprehensive Testing**: Pre-configured test setup with best practices

### 🛠️ Developer Experience
- **VS Code Integration**: Curated set of recommended extensions
- **Intelligent Defaults**: Optimized settings for common development tasks
- **Clear Documentation**: Detailed explanations for all tool choices and configurations
- **Git Hooks**: Automated code quality checks before commits
- **TOML Formatting**: Automated TOML formatting with Taplo
  - Format files: `just format-toml`
  - Check formatting: `just check-toml`
  - Pre-commit hook for automatic formatting
  - CI verification in GitHub Actions

### 🎯 Perfect For
- Professionals looking for a production-ready Python project
- Teams wanting a standardized Python development environment
- Projects requiring maintainable, type-safe code
- Developers who value clean, consistent code style
- Anyone looking to adopt Python best practices from day one

# TOML Formatting with Taplo

This project uses Taplo for consistent TOML file formatting and validation. Taplo ensures that all TOML files in the project follow the same formatting rules and are properly validated.

## Features

- **Consistent Formatting**: 4-space indentation, vertical alignment, and expanded arrays
- **Automatic Validation**: Built-in schema validation for pyproject.toml
- **IDE Integration**: VS Code extension for real-time formatting and validation
- **Pre-commit Hook**: Automatic formatting on commit
- **CI Pipeline**: Format verification in GitHub Actions

## Development Tools

### Just Commands

- `just format-toml` (alias: `ft`): Format all TOML files
- `just check-toml` (alias: `ct`): Check TOML formatting without modifying files

### VS Code Extension

Install the "Even Better TOML" extension for VS Code to get:
- Real-time syntax highlighting
- Format on save
- Schema validation
- Hover documentation

## Format Verification Process

Taplo verifies TOML formatting at multiple layers:

1. **Local Development**:
   - VS Code extension for real-time feedback
   - Manual formatting with `just format-toml`
   - Format checking with `just check-toml`

2. **Pre-commit Hook**:
   - Automatically formats TOML files on commit
   - Prevents commits with incorrect formatting

3. **CI Pipeline**:
   - Verifies formatting in pull requests
   - Ensures project-wide formatting standards

## Configuration

All Taplo settings are in `pyproject.toml`:

```toml
[tool.taplo]
include = ["*.toml"]           # Only format TOML files
include-ignored = false        # Respect .gitignore
schema = "pyproject"          # Use built-in schema

[tool.taplo.formatting]
align_entries = true          # Align values in tables
array_auto_expand = true      # Expand arrays that exceed width
column_width = 80            # Standard line width
indent_string = "    "       # 4-space indentation
align_comments = true        # Align inline comments
array_trailing_comma = true  # Always use trailing commas
compact_entries = false      # Keep entries on separate lines
compact_arrays = false       # Keep array elements on lines
crlf = false                # Use LF line endings
```

## Troubleshooting Guide

### Common Issues and Solutions

1. **Pre-commit Hook Fails**:
   - Run `just format-toml` to fix formatting
   - Check for syntax errors in TOML files
   - Verify Taplo installation: `taplo --version`

2. **VS Code Not Formatting**:
   - Install "Even Better TOML" extension
   - Enable "Format on Save" in VS Code settings
   - Set Taplo as default TOML formatter

3. **CI Pipeline Failures**:
   - Run `just check-toml` locally first
   - Compare local and CI Taplo versions
   - Check for line ending differences

### Prevention Tips

1. Use VS Code with recommended extensions
2. Run `just format-toml` before committing
3. Keep TOML files simple and well-organized

### Manual Fixes

If automatic formatting fails:
1. Run `taplo format --syntax-only` to check for syntax errors
2. Fix any syntax issues manually
3. Run `just format-toml` again

### Team Best Practices

1. Always use `just` commands for consistency
2. Review TOML changes carefully in PRs
3. Keep configuration documentation updated

Start your next Python project with confidence, knowing you're building on a foundation of best practices and modern development tools.
# Example CLI Tool Usage
[Example CLI: py-projects](EXAMPLECLI.md)
