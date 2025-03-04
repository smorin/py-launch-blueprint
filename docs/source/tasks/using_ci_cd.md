# Using CI/CD

Continuous Integration and Continuous Deployment (CI/CD) are essential practices for modern software development. This guide will help you set up and use CI/CD workflows for your project.

## GitHub Actions

GitHub Actions is a powerful CI/CD tool that allows you to automate your workflows directly from your GitHub repository. Here's how to set up and use GitHub Actions for your project.

### Setting Up GitHub Actions

1. **Create a Workflow File**: In your repository, create a new directory called `.github/workflows` if it doesn't already exist. Inside this directory, create a new file called `ci.yml`.

2. **Define the Workflow**: Open the `ci.yml` file and define your workflow. Here's an example workflow that runs tests and checks code quality:

   ```yaml
   name: CI/CD

   on:
     push:
       branches: [ main ]
     pull_request:
       branches: [ main ]

   jobs:
     test:
       name: continuous-integration
       runs-on: ubuntu-latest
       strategy:
         matrix:
           python-version: ["3.10", "3.11"]

       steps:
       - uses: actions/checkout@v4

       - name: Install uv
         uses: astral-sh/setup-uv@v5

       - uses: actions/setup-python@v5
         with:
           python-version: ${{ matrix.python-version }}

       - name: Install the project
         run: uv sync --all-extras --dev

       - name: Run type checker
         run: uvx mypy py_launch_blueprint/

       - name: Check linters
         run: uvx ruff check py_launch_blueprint/
   ```

3. **Commit and Push**: Commit and push the `ci.yml` file to your repository. GitHub Actions will automatically run the workflow whenever you push changes to the `main` branch or open a pull request.

### Customizing the Workflow

You can customize the workflow to fit your project's needs. Here are some common customizations:

- **Running Tests**: Uncomment the `Run tests` step and add your test command. For example, if you're using `pytest`, you can add the following step:

  ```yaml
  - name: Run tests
    run: uv run pytest tests
  ```

- **Uploading Coverage Reports**: If you want to upload test coverage reports, you can use the `codecov` action. Uncomment the `Upload coverage` step and add the following step:

  ```yaml
  - name: Upload coverage
    uses: codecov/codecov-action@v4
  ```

- **Publishing to PyPI**: If you want to publish your package to PyPI, you can add a `publish` job. Uncomment the `publish` job and add the following steps:

  ```yaml
  publish:
    needs: [test, security]
    if: github.event_name == 'push' && github.ref == 'refs/heads/main'
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v4

    - name: Build and publish to PyPI
      env:
        TWINE_USERNAME: __token__
        TWINE_PASSWORD: ${{ secrets.PYPI_TOKEN }}
      run: |
        uv pip install build twine
        python -m build
        twine upload dist/*
  ```

### Security Scanning

In addition to running tests and checking code quality, you can also use GitHub Actions to perform security scanning. Here's an example of a security scanning job using the `pyupio/safety-action`:

```yaml
security:
  runs-on: ubuntu-latest
  steps:
  - uses: actions/checkout@v4

  - name: Run Safety CLI to check for vulnerabilities
    uses: pyupio/safety-action@v1
    with:
      api-key: ${{ secrets.SAFETY_API_KEY }}
      args: --detailed-output
```

### Dependency Review

You can also use GitHub Actions to review dependencies for known vulnerabilities. Here's an example of a dependency review job:

```yaml
name: 'Dependency review'
on:
  pull_request:
    branches: [ "main" ]

permissions:
  contents: read
  pull-requests: write

jobs:
  dependency-review:
    runs-on: ubuntu-latest
    steps:
      - name: 'Checkout repository'
        uses: actions/checkout@v4
      - name: 'Dependency Review'
        uses: actions/dependency-review-action@v4
        with:
          comment-summary-in-pr: always
```

## Conclusion

By setting up CI/CD workflows with GitHub Actions, you can automate your development processes, ensure code quality, and deploy your applications with confidence. Customize the workflows to fit your project's needs and take advantage of the powerful features offered by GitHub Actions.
