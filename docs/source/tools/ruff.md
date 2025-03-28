## Ruff: A Fast Python Linter & Formatter  

Ruff is a high-performance Python linter and formatter, written in Rust for speed. It consolidates multiple tools like Flake8, Black, isort, and pydocstyle into one, reducing maintenance.  

### Features 
- 🚀 **Fast** – Much quicker than traditional linters.  
- 🛠 **All-in-One** – Combines multiple tools in one package.  
- ⚙ **Customizable** – Configure rules to fit your project.  
- 🔄 **Automated Fixes** – Applies quick fixes automatically.  
- 🔗 **Easy Integration** – Works with CI/CD and IDEs.  

### Recommended Line Length:  
- **88 characters** (Black’s default) – balances readability & modern conventions.  

**Config Example (`pyproject.toml`):**  
```toml
[tool.ruff]
line-length = 88
```