# Contributing to Py Launch Blueprint

Thank you for your interest in contributing to Py Launch Blueprint! We welcome contributions from the community and are excited to see what you can bring to the project.

## Contributor License Agreement (CLA)

Before we can accept your contributions, you will need to sign a Contributor License Agreement (CLA). This is a legal document in which you state that you are entitled to contribute the code you are submitting and that you grant us the rights to use that contribution.

### How to Sign the CLA

1. **Individual Contributors**: If you are contributing as an individual, please sign the [Individual CLA](./docs/cla/individual_cla.md).
2. **Corporate Contributors**: If you are contributing on behalf of a company, please sign the [Corporate CLA](./docs/cla/corporate_cla.md).

### CLA Assistant Bot

We have integrated the CLA Assistant bot to streamline the CLA signing process. When you open a pull request, the bot will check if you have signed the CLA. If you have not, it will provide a link to sign it.

## How to Contribute

### Reporting Bugs

If you find a bug in the project, please open an issue on GitHub with the following information:
- A clear and descriptive title
- A detailed description of the problem
- Steps to reproduce the issue
- Any relevant logs or screenshots

### Suggesting Enhancements

We welcome suggestions for new features or improvements to the project. To suggest an enhancement, please open an issue on GitHub with the following information:
- A clear and descriptive title
- A detailed description of the enhancement
- Any relevant examples or use cases

### Submitting Pull Requests

To submit a pull request, follow these steps:
1. Fork the repository
2. Create a new branch for your feature or bugfix
3. Make your changes
4. Commit your changes with a clear and descriptive commit message
5. Push your changes to your fork
6. Open a pull request on GitHub

Please ensure that your pull request adheres to the following guidelines:
- Follow the project's coding style and conventions
- Include tests for your changes
- Ensure that all tests pass
- Update the documentation as needed
- **Follow the conventional commit guidelines** (see below)

## Conventional Commits

This project follows the [Conventional Commits](https://www.conventionalcommits.org/) specification, which provides a standardized format for commit messages. This enables automatic changelog generation and version management.

### Commit Message Format

Each commit message should be structured as follows:

```
<type>(<optional scope>): <description>

<optional body>

<optional footer>
```

#### Types

The `type` must be one of the following:

- `feat`: A new feature for the user
- `fix`: A bug fix for the user
- `docs`: Documentation changes
- `style`: Changes that don't affect code behavior (formatting, whitespace)
- `refactor`: Code changes that neither fix bugs nor add features
- `perf`: Performance improvements
- `test`: Adding or fixing tests
- `chore`: Maintenance tasks, dependency updates, etc.

#### Examples

```
feat: add user authentication
```

```
fix(api): correct response status code for invalid tokens
```

```
docs: update installation instructions
```

### Commit Tools

To help you write conventional commits, you can use the following tools:

1. **Interactive Commit Tool**: Create a commit using a guided process
   ```bash
   just commit
   ```

2. **Verify Commit Messages**: Check if your recent commits follow the format
   ```bash
   just verify-commits
   ```

3. **Pre-commit Hook**: Install a hook to validate commits before they're created
   ```bash
   just setup-cog-hooks
   ```

### Changelog and Versioning

The project automatically generates a changelog from conventional commits. The commit type determines how the version number is incremented:

- `feat`: Increments the minor version (e.g., 1.1.0 → 1.2.0)
- `fix` and `perf`: Increments the patch version (e.g., 1.1.0 → 1.1.1)
- `feat` with `BREAKING CHANGE` in footer: Increments the major version (e.g., 1.1.0 → 2.0.0)

To manually generate or update the changelog:

```bash
just changelog
```

To bump the version:

```bash
just bump         # Auto-detects version bump type based on commits
just bump patch   # For a patch version bump
just bump minor   # For a minor version bump
just bump major   # For a major version bump

## Code of Conduct

We are committed to fostering a welcoming and inclusive community. Please read and adhere to our [Code of Conduct](CODE_OF_CONDUCT.md) when participating in the project.

## Getting Help

If you need help or have any questions, feel free to open an issue on GitHub or reach out to the maintainers.

Thank you for contributing to Py Launch Blueprint!
