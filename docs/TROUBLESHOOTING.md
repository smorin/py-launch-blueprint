# Troubleshooting

This document provides solutions to common issues related to versioning and workflows in the Py Launch Blueprint project.

## Common Issues and Solutions

### Issue: Version Mismatch

**Description**: The version number in the `pyproject.toml` file does not match the version number in the tag.

**Solution**:
1. Ensure that the version number in the `pyproject.toml` file is updated before creating a tag.
2. Verify that the tag matches the version number in the `pyproject.toml` file.

### Issue: Workflow Failures

**Description**: GitHub Actions workflows fail during execution.

**Solution**:
1. Check the workflow logs for error messages.
2. Ensure that all required dependencies are installed.
3. Verify that the workflow configuration files are correct.

### Issue: Dependency Conflicts

**Description**: Conflicts between different versions of dependencies.

**Solution**:
1. Use `uv` to manage dependencies and ensure compatibility.
2. Update the `pyproject.toml` file to specify compatible versions of dependencies.
3. Run `uv sync` to update dependencies.

### Issue: Missing Documentation

**Description**: Documentation is not generated or is incomplete.

**Solution**:
1. Ensure that the Sphinx configuration in `docs/source/conf.py` is correct.
2. Verify that all required dependencies for building documentation are installed.
3. Run `make html` in the `docs` directory to build the documentation.

### Issue: Broken Links in Documentation

**Description**: Links in the documentation are broken or lead to incorrect pages.

**Solution**:
1. Check the link paths in the documentation files.
2. Ensure that the linked files exist and are correctly named.
3. Run `make linkcheck` in the `docs` directory to check for broken links.

### Issue: CI/CD Pipeline Failures

**Description**: The CI/CD pipeline fails during execution.

**Solution**:
1. Check the pipeline logs for error messages.
2. Ensure that all required environment variables and secrets are configured.
3. Verify that the pipeline configuration files are correct.

### Issue: Linter or Type Checker Errors

**Description**: Errors reported by the linter or type checker.

**Solution**:
1. Review the error messages and fix the reported issues.
2. Ensure that the code follows the project's coding style and conventions.
3. Run `uvx ruff check` and `uvx mypy` to check for linting and type errors.

### Issue: Test Failures

**Description**: Tests fail during execution.

**Solution**:
1. Review the test output and error messages.
2. Ensure that the test environment is correctly set up.
3. Verify that the tests are up to date and reflect the current codebase.
4. Run `uvx pytest` to execute the test suite.

## Additional Resources

For more information and support, refer to the following resources:
- [Py Launch Blueprint Documentation](https://py-launch-blueprint.readthedocs.io/)
- [GitHub Issues](https://github.com/smorin/py-launch-blueprint/issues)
- [GitHub Discussions](https://github.com/smorin/py-launch-blueprint/discussions)
