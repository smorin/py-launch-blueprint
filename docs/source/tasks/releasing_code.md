# Releasing Code

This document outlines the versioning and release process for the Py Launch Blueprint project.

## Versioning Strategy

We follow [Semantic Versioning](https://semver.org/) for this project. The version number is in the format `MAJOR.MINOR.PATCH`, and increments as follows:

- **MAJOR** version when you make incompatible API changes,
- **MINOR** version when you add functionality in a backwards-compatible manner, and
- **PATCH** version when you make backwards-compatible bug fixes.

## Release Process

1. **Update Version Number**: Update the version number in `pyproject.toml` and `docs/source/conf.py`.
2. **Update Changelog**: Ensure the `CHANGELOG.md` is up to date with all changes since the last release.
3. **Run Tests**: Ensure all tests pass by running `just test` or `uvx --with-editable . pytest`.
4. **Build Package**: Build the package using `just build` or `uvx --with-editable . build`.
5. **Create Release**: Create a new release on GitHub with the new version number and attach the built package.
6. **Publish to PyPI**: Publish the package to PyPI using `uvx --with-editable . twine upload dist/*`.

## Automation

We use GitHub Actions to automate parts of the release process. The workflow is defined in `.github/workflows/release.yml`.

## Additional Notes

- Ensure that all dependencies are up to date before releasing.
- Follow the [contributing guidelines](../contributing/index.md) for any code changes.
