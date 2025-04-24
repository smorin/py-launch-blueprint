<!--
Copyright (c) 2025, Steve Morin

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
-->
# **CI/CD with GitHub Actions**

This guide explains how to automate testing, linting, and deployment for the Py Launch Blueprint project using GitHub Actions. [Learn more](../tools/github_actions.md).

## **Workflow Overview**

The CI/CD workflow (`.github/workflows/ci.yaml`) runs on:
- Pushes to `main`
- Pull requests targeting `main`

### **Jobs**
- **Test**: Runs tests on Python 3.10 and 3.11
  - Sets up environment using `uv` and `actions/setup-python`
  - Installs dependencies: `uv sync --all-extras --dev`
  - Runs MyPy (`uvx mypy`), Ruff (`uvx ruff check`), and pytest (`uvx pytest`)

## **Workflow Configuration**

```yaml
name: CI/CD

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  test:
    runs-on: ubuntu-latest
    strategy:
      matrix:
        python-version: ["3.10", "3.11"]

    steps:
      - uses: actions/checkout@v4
      - uses: astral-sh/setup-uv@v5
      - uses: actions/setup-python@v5
        with:
          python-version: ${{ matrix.python-version }}
      - run: uv sync --all-extras --dev
      - run: uvx mypy py_launch_blueprint/
      - run: uvx ruff check py_launch_blueprint/
      - run: uvx pytest
```

## **Customization**

- **Add more Python versions**:
  ```yaml
  strategy:
    matrix:
      python-version: ["3.10", "3.11", "3.12"]
  ```
- **Add security scanning**:
  ```yaml
  - name: Run security scan
    run: uvx bandit -r py_launch_blueprint/
  ```
- **Cache dependencies**:
  ```yaml
  - uses: actions/cache@v3
    with:
      path: .venv
      key: venv-${{ runner.os }}-${{ hashFiles('**/pyproject.toml') }}
  ```
