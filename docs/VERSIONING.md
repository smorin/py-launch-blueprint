# Versioning Strategy and Workflow

This document outlines the versioning strategy and workflow used in the Py Launch Blueprint project.

## Versioning Strategy

We follow [Semantic Versioning](https://semver.org/) for this project. Semantic Versioning is a versioning scheme that uses a three-part version number: `MAJOR.MINOR.PATCH`.

- **MAJOR** version: Incremented for incompatible API changes.
- **MINOR** version: Incremented for backward-compatible functionality.
- **PATCH** version: Incremented for backward-compatible bug fixes.

### Examples

- `1.0.0`: Initial release.
- `1.1.0`: Added new features in a backward-compatible manner.
- `1.1.1`: Fixed bugs in a backward-compatible manner.
- `2.0.0`: Introduced breaking changes.

## Release Workflow

The release workflow for this project is designed to ensure that new versions are released in a controlled and consistent manner.

### Steps

1. **Create a Release Branch**: Create a new branch for the release.
   ```bash
   git checkout -b release/vX.Y.Z
   ```

2. **Update Version**: Update the version number in the `pyproject.toml` file.
   ```toml
   [project]
   version = "X.Y.Z"
   ```

3. **Update Changelog**: Update the `CHANGELOG.md` file with the changes included in the release.

4. **Run Tests**: Ensure that all tests pass.
   ```bash
   uvx pytest
   ```

5. **Merge Release Branch**: Merge the release branch into the `main` branch.
   ```bash
   git checkout main
   git merge release/vX.Y.Z
   ```

6. **Tag Release**: Create a new tag for the release.
   ```bash
   git tag -a vX.Y.Z -m "Release vX.Y.Z"
   git push origin vX.Y.Z
   ```

7. **Publish Release**: Publish the release to the package repository (e.g., PyPI).
   ```bash
   uvx build
   uvx twine upload dist/*
   ```

## Automated Release Process

We use GitHub Actions to automate the release process. The workflow is defined in the `.github/workflows/release.yml` file.

### Workflow Steps

1. **Trigger**: The workflow is triggered when a new tag is pushed to the repository.
2. **Checkout**: The repository is checked out.
3. **Set Up Python**: The Python environment is set up.
4. **Install Dependencies**: The project dependencies are installed.
5. **Build Package**: The package is built.
6. **Verify Version**: The version number is verified to match the tag.
7. **Publish Package**: The package is published to the package repository.

## Conclusion

By following this versioning strategy and workflow, we ensure that new versions of the Py Launch Blueprint project are released in a consistent and controlled manner, providing a reliable and predictable experience for users and contributors.
