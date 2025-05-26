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
just setup-hatch-twine
```

---

## 4. Securing and Managing PyPI Credentials

To publish securely to PyPI or TestPyPI, never store your API tokens directly in your project files. Follow these best practices:

### 4.1. Generate a PyPI API Token

* Visit: [https://pypi.org/manage/account/#api-tokens](https://pypi.org/manage/account/#api-tokens)
* Click **"Add API token"**
* Choose appropriate scope
* Copy the generated token and **store it securely**

---

### 4.2. Store Token Securely (Recommended Methods)

#### ✅ A. Use `~/.pypirc` (Preferred for Local)

```ini
# ~/.pypirc
[distutils]
index-servers =
    pypi
    testpypi

[pypi]
  username = __token__
  password = pypi-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

[testpypi]
  username = __token__
  password = pypi-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
```

> 🔒 Make this file readable only by you:

```bash
chmod 600 ~/.pypirc
```

---

#### ✅ B. Use Environment Variables (Great for CI/CD)

```bash
export TWINE_USERNAME=__token__
export TWINE_PASSWORD=pypi-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
```

Use them in scripts:

```bash
twine upload --username $TWINE_USERNAME --password $TWINE_PASSWORD dist/*
```

---

### 4.3. Avoid Committing Secrets

* Add `.pypirc` and `.env` to `.gitignore`
* Never commit credentials to Git

### 4.3.1 Avoid Credential Exposure

* Never commit your API tokens or `.pypirc` files to your Git repository!

* Add `.pypirc`, `.env`, or any files containing secrets to .gitignore.

* Be cautious with logs: avoid printing tokens or secrets.

* Regularly rotate your API tokens on PyPI.

---

### 4.4. Using GitHub Actions?

Store token in `Settings > Secrets` and use it like this:

```yaml
env:
  TWINE_USERNAME: __token__
  TWINE_PASSWORD: ${{ secrets.PYPI_API_TOKEN }}
```

---

### 5.5. Validate Distributions Before Publishing

```bash
twine check dist/*
```

---

✅ You are now ready to securely publish your package to PyPI!

---

## 5. Add a `just` Recipe to Build and Publish

Update your `justfile` (Optional):

```just
# Build package
[group('build'), group('dev')]
@build: check
    echo "Checking for Hatch..."
    if ! command -v hatch >/dev/null 2>&1; then \
        echo ""; \
        echo "⚠️  Hatch is not installed. Please install it using:"; \
        echo "   uv pip install hatch"; \
        echo ""; \
        exit 1; \
    fi
    echo "Building package with Hatch..."
    hatch build

alias b := build
```

```just
# Publish package to PyPI
[group('build'), group('dev')]
@publish:
    echo "Building package..."
    just build
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

## 6. Publish Your Package

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
    just build
    just publish-test
```

Then run:

```bash
just publish-test
```

---

## 7. CI/CD Integration (Optional)

To automate publishing in CI/CD systems like GitHub Actions:

- Store your PyPI API token in your repository’s secrets manager (e.g., `PYPI_API_TOKEN`).
- Use environment variables in your workflow:

```yaml
env:
  TWINE_USERNAME: __token__
  TWINE_PASSWORD: ${{ secrets.PYPI_API_TOKEN }}

steps:
  - uses: actions/checkout@v3
  - name: Set up Python
    uses: actions/setup-python@v4
    with:
      python-version: '3.x'
  - name: Install dependencies
    run: pip install hatch twine
  - name: Build and publish package
    env:
      TWINE_USERNAME: __token__
      TWINE_PASSWORD: ${{ secrets.PYPI_API_TOKEN }}
    run: |
      just publish
```
---

## Useful Links

* [PyPI documentation](https://packaging.python.org/)
* [TestPyPI](https://test.pypi.org/)
* [Hatch documentation](https://hatch.pypa.io/)
* [Twine documentation](https://twine.readthedocs.io/)
