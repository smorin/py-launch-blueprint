<!--
Copyright (c) 2025, Steve Morin

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
-->
## Ruff: A Fast Python Linter & Formatter

Ruff is a high-performance linter and code formatter for Python. It combines multiple tools into one, offering faster performance and comprehensive functionality compared to traditional Python tools.
**Pros**:

- 🚀 **Very Fast**: Written in Rust, Ruff is significantly faster than traditional linters, allowing it to process large codebases quickly.
-  🛠 **All-in-One Solution**: Ruff incorporates checks and fixes from a variety of popular linters like Flake8, Black, isort, pydocstyle, pyupgrade, autoflake. This means less maintenance of multiple separate tools.
- ⚙ **Customizable**: Allows users to select and ignore specific checks or enforce particular rules according to the project needs.
- 🔗 **Easy Integration**: Works well with CI/CD pipelines, IDEs, and modern developer workflows.
- 🔄 **Automated Fixes**: Ruff can automatically correct a wide range of issues in your code.

**Cons**:
- **Relatively New**: As a newer tool, it might not yet be as widely adopted or supported in some edge cases.

Python line length standards:
- 79/80: Traditional PEP 8 standard. Good for side-by-side editing but can feel restrictive.
- 88: Black's default. Modern sweet spot between readability and expressiveness. Becoming the community standard.
- 100: Google's choice. Popular in enterprise. Good for complex expressions.
- 120: Maximum reasonable length. Works on wide screens but can hurt readability.
- Recommendation: Use 88 characters (Black's default) unless your team/project has an existing standard. It offers the best balance of readability and practicality while following modern community practices.

```pyproject.toml

[tool.ruff]
line-length = 88

[tool.ruff.pycodestyle]
max-line-length = 88
```
