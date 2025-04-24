<!--
Copyright (c) 2025, Steve Morin

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
-->
## Precommit hooks

Hooks are designed to maintain clean, consistent, and error-free code and configuration files. They save time by catching issues before they make it into your repository.

Following pre-commit hooks are used in this repo

- `check-yaml` checks if all YAML files in your repository are valid,
- `end-of-file-fixer` ensures every file in your repository ends with a single newline character,
- `trailing-whitespace` removes trailing spaces at the end of lines in your files,
- `check-toml` checks if all TOML files in your repository are valid,
- `check-added-large-files` warns when you try to add large files to the repository,
- `mypy` checks your Python code for type errors based on type annotations,
- `ruff` acts as a fast linter and formatter for Python, ensuring clean code,
