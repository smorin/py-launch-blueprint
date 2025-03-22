# Justfile Usage

This project includes a **Justfile** to simplify common development tasks. [Just](https://github.com/casey/just) is a command runner that automates workflows and ensures consistency.

## Installation

Ensure **Just** is installed before running any commands. Follow the [installation guide](https://github.com/casey/just#installation).

To list available commands:

```bash
just --list
```

## Common Commands

### **Setup and Installation**

```bash
just setup-venv       # Set up a virtual environment
just install-dev      # Install package in editable mode with dev dependencies
just pre-commit-setup # Set up pre-commit hooks
```

### **Code Quality & Testing**

```bash
just format        # Format code (includes Ruff and import sorting)
just lint          # Run linter for code quality checks
just typecheck     # Run type checker
just test          # Run tests with pytest
just check         # Run all checks (tests, linting, and type checking)
```

### **Package Management**

```bash
just version       # Show installed package version
just build         # Build the package
just clean         # Remove temporary files and caches
```

### **Running Commands**

```bash
just run           # Run the package command
just check-deps    # Verify required dependencies are installed
```

### **Documentation**

```bash
just docs-help     # Show help for Sphinx documentation
just docs          # Build documentation (default: HTML format)
just docs-dev      # Run documentation server with hot reloading
just docs-clean    # Clean documentation build files
```

### **Contributor Management**

```bash
just contributors  # Update CONTRIBUTORS.md with the latest commit history
```

## Alternative Commands (for Activated Virtual Environments)

If the virtual environment is active, you can use the following:

```bash
just install-dev-pip    # Install package in dev mode using pip
just format-pip         # Run formatter directly
just lint-pip           # Run linter directly
just typecheck-pip      # Run type checker directly
just test-pip           # Run tests directly with pytest
```

## Summary

This **Justfile** simplifies development workflows by providing shortcuts for essential tasks like setup, code formatting, testing, and documentation management. Use `just --list` to explore more commands. 🚀

## Using the Justfile  

This project includes a **Justfile** to simplify common development tasks. [Just](https://github.com/casey/just) is a command runner that helps standardize and automate workflows across the project.  

### Installation  

To use **Just**, first [install it](https://github.com/casey/just#installation).  

You can list all available commands by running:  

```bash
just --list
```  

### Commonly Used Commands  

Below are some frequently used **Just** commands:  

#### **Environment Setup**  

```bash
just setup              # Initialize development environment  
just pre-commit-setup   # Set up pre-commit hooks  
just install-dev        # Install the package in development mode  
```  

#### **Code Quality & Testing**  

```bash
just format       # Format code (includes Ruff formatting and import sorting)  
just lint         # Run linter for code quality checks  
just typecheck    # Run type checker  
just test         # Run tests with pytest  
just check        # Run all checks (tests, linting, and type checking)  
```  

#### **Utilities**  

```bash
just version      # Check installed package version  
just clean        # Remove temporary files and caches  
just build        # Build the package  
```  

### Running Direct Commands  

When your virtual environment is activated, you can run direct commands without `uvx`:  

```bash
just format-pip      # Run formatter directly  
just lint-pip        # Run linter directly  
just typecheck-pip   # Run type checker directly  
just test-pip        # Run tests directly with pytest  
```  

### Summary  

The **Justfile** streamlines development tasks, ensuring a consistent and efficient workflow. Whether you're formatting code, running tests, or setting up your environment, **Just** makes it easy to execute commands reliably.  
