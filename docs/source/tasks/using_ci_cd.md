# Using CI/CD

Continuous Integration and Continuous Deployment (CI/CD) are essential practices for modern software development. They help ensure that your code is always in a deployable state and that changes are tested and deployed automatically. This guide will walk you through setting up and using CI/CD with GitHub Actions for the Py Launch Blueprint project.

## Setting Up CI/CD

### GitHub Actions

GitHub Actions is a powerful CI/CD platform that allows you to automate your workflows directly from your GitHub repository. The Py Launch Blueprint project includes a pre-configured GitHub Actions workflow to get you started quickly.

### Workflow Configuration

The CI/CD workflow is defined in the `.github/workflows/ci.yaml` file. This file contains the configuration for running tests, linting, type checking, and other tasks whenever code is pushed to the repository or a pull request is opened.

Here is an example of the CI/CD workflow configuration:

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

### Running the Workflow

The workflow is triggered automatically on every push to the `main` branch and on every pull request targeting the `main` branch. You can also manually trigger the workflow from the GitHub Actions tab in your repository.

### Customizing the Workflow

You can customize the CI/CD workflow to fit your project's needs. For example, you can add additional steps for running tests, building documentation, or deploying your application. Refer to the [GitHub Actions documentation](https://docs.github.com/en/actions) for more information on how to customize your workflows.

## Best Practices

- **Keep Workflows Simple**: Start with a simple workflow and gradually add complexity as needed.
- **Use Matrix Builds**: Use matrix builds to test your code against multiple versions of Python or other dependencies.
- **Cache Dependencies**: Use caching to speed up your workflows by reusing dependencies between runs.
- **Fail Fast**: Configure your workflows to fail fast if any step fails, so you can quickly identify and fix issues.
- **Monitor Workflows**: Regularly monitor your workflows to ensure they are running smoothly and efficiently.

## Conclusion

Setting up CI/CD for your project can greatly improve your development workflow by automating repetitive tasks and ensuring that your code is always in a deployable state. With GitHub Actions, you can easily set up and customize your CI/CD workflows to fit your project's needs.

For more information on using GitHub Actions, refer to the [official documentation](https://docs.github.com/en/actions).
