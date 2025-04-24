<!--
Copyright (c) 2025, Steve Morin

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
-->
# UV Package Manager

UV is a fast Python package manager that provides efficient dependency management. This guide covers how to set up and use UV in the *Py Launch Blueprint* project.

## Installation

To install UV, run:

```bash
pip install uv
```

## Using UV for Dependency Management

### Installing Dependencies

To install dependencies from `pyproject.toml`, use:

```bash
uv pip install -r requirements.txt
```

Or, if using `pyproject.toml`:

```bash
uv pip install
```

### Adding a Package

To install a package and add it to your dependencies:

```bash
uv pip install <package-name>
```

### Removing a Package

To uninstall a package:

```bash
uv pip uninstall <package-name>
```

### Creating a Lockfile

To generate a lockfile (`requirements.lock`), run:

```bash
uv pip freeze > requirements.lock
```

## Additional Resources

For more details, check the [official UV documentation](https://github.com/astral-sh/uv).
