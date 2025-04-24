<!--
Copyright (c) 2025, Steve Morin

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
-->
# GitHub Actions

## Setup

GitHub Actions automates testing and deployment. The Py Launch Blueprint project includes a pre-configured workflows in [`.github/workflows/`](https://github.com/smorin/py-launch-blueprint/tree/main/.github/workflows).

## Workflow Configuration

The workflow runs on every push or pull request to `main`:

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
```

## Best Practices

- **Keep It Simple**: Start small and expand as needed.
- **Use Matrix Builds**: Test across multiple Python versions.
- **Cache Dependencies**: Speed up workflows by caching dependencies.
- **Fail Fast**: Identify and fix issues quickly.
- **Monitor Regularly**: Ensure workflows run efficiently.

[Actions documentation](https://docs.github.com/en/actions) for more details.
