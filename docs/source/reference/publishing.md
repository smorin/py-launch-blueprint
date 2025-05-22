# PyPI Publishing: Step-by-Step Setup Guide

This guide walks you through setting up your Python project for publishing to [PyPI](https://pypi.org) using `hatch`, `twine`.

## 1. Create a PyPI Account and API Token

1. Register at [https://pypi.org/account/register/](https://pypi.org/account/register/)
2. Navigate to **Account Settings → API Tokens**
3. Create a token with the desired scope
4. Save the token securely

---

## 2. Store Your PyPI Token Securely

Edit or create `~/.pypirc`:

```ini
[distutils]
index-servers =
    pypi

[pypi]
username = __token__
password = pypi-<your-token>
```

For **TestPyPI**:

```ini
[testpypi]
repository = https://test.pypi.org/legacy/
username = __token__
password = pypi-<your-test-token>
```

---

## 3. Install Required Tools

Install with `uv` (or use `pip`):

```bash
uv pip install hatch twine
```

---

## 4. Add a `just` Recipe to Build and Publish

Update your `justfile` (Optional):

```just
# Publish package to PyPI
[group('build'), group('dev')]
@publish:
    echo "Building package..."
    uvx --from build pyproject-build --wheel --sdist --outdir dist
    echo "Checking for Twine..."
    if ! command -v twine >/dev/null 2>&1; then \
        echo "Twine is not installed. Installing..."; \
        uv pip install twine; \
    fi
    echo "Uploading to PyPI..."
    twine upload dist/*

alias p := publish
```

---

## 5. Publish Your Package

Run:

```bash
just publish
```

Successful output will look like:

```
Uploading distributions to https://upload.pypi.org/legacy/
Uploading your_package-0.1.0.tar.gz
Uploading your_package-0.1.0-py3-none-any.whl
```

---

## Optional: Use TestPyPI

Add to your `justfile`:

```just
@publish-test:
    echo "Building package for TestPyPI..."
    uvx --from build pyproject-build --wheel --sdist --outdir dist
    twine upload --repository testpypi dist/*
```

Then run:

```bash
just publish-test
```

---

## Useful Links

* [PyPI documentation](https://packaging.python.org/)
* [TestPyPI](https://test.pypi.org/)
* [Hatch documentation](https://hatch.pypa.io/)
* [Twine documentation](https://twine.readthedocs.io/)
