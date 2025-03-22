# Releasing Code

This guide provides a step-by-step process for versioning and releasing code in the Py Launch Blueprint project. Following these steps ensures that releases are consistent, well-documented, and easy to manage.

## Versioning Strategy

We follow [Semantic Versioning](https://semver.org/) for versioning our releases. Semantic Versioning uses a three-part version number: `MAJOR.MINOR.PATCH`, where:

- `MAJOR` version increments indicate incompatible API changes.
- `MINOR` version increments add functionality in a backward-compatible manner.
- `PATCH` version increments are for backward-compatible bug fixes.

### Example

- `1.0.0`: Initial stable release.
- `1.1.0`: Adds new features in a backward-compatible manner.
- `1.1.1`: Fixes bugs in a backward-compatible manner.

## Release Process

### 1. Update the Version Number

Update the version number in the `pyproject.toml` file. Ensure that the version number follows the Semantic Versioning guidelines.

### 2. Update the Changelog

Update the `CHANGELOG.md` file with the changes included in the release. The changelog should include:

- New features
- Bug fixes
- Breaking changes
- Any other relevant information

### 3. Commit Changes

Commit the changes to the version number and changelog with a descriptive commit message, such as:

```bash
git add pyproject.toml CHANGELOG.md
git commit -m "Release version X.Y.Z"
```

### 4. Tag the Release

Create a new Git tag for the release. The tag should follow the format `vX.Y.Z`, where `X.Y.Z` is the version number.

```bash
git tag vX.Y.Z
git push origin vX.Y.Z
```

### 5. Create a Release on GitHub

Create a new release on GitHub using the tag you just created. Include the changelog entries for the release in the release notes.

### 6. Publish the Release

Publish the release on GitHub. This will make the release available to users and trigger any automated workflows associated with the release.

## Automated Release Workflow

The Py Launch Blueprint project includes an automated release workflow using GitHub Actions. This workflow is defined in the `.github/workflows/release.yml` file. The workflow automates the following steps:

- Building the project
- Running tests
- Creating a release on GitHub
- Publishing the release

### Triggering the Workflow

The release workflow is triggered automatically when a new tag is pushed to the repository. Ensure that the tag follows the format `vX.Y.Z`.

### Customizing the Workflow

You can customize the release workflow to fit your project's needs. For example, you can add additional steps for building documentation, deploying to a package registry, or notifying users. Refer to the [GitHub Actions documentation](https://docs.github.com/en/actions) for more information on how to customize your workflows.

## Best Practices

- **Consistent Versioning**: Always follow Semantic Versioning guidelines.
- **Detailed Changelog**: Keep a detailed changelog to inform users of changes.
- **Automate Releases**: Use automated workflows to ensure consistency and reduce manual effort.
- **Test Thoroughly**: Ensure that all tests pass before releasing.
- **Communicate Changes**: Clearly communicate changes to users through release notes and documentation.

## Conclusion

Releasing code is a critical part of the software development process. By following a consistent versioning strategy and using automated workflows, you can ensure that your releases are reliable, well-documented, and easy to manage.

For more information on releasing code, refer to the [Versioning](../reference/versioning.md), [GitHub Actions documentation](https://docs.github.com/en/actions) and the [Semantic Versioning guidelines](https://semver.org/).
