# Contributing to Py Launch Blueprint

Thank you for your interest in contributing to Py Launch Blueprint! We welcome contributions from the community and are excited to see what you can bring to the project.
## Contributors

This project uses [COG (Cocogitto)](https://github.com/cocogitto/cocogitto) to automatically track and maintain our [CONTRIBUTORS.md](CONTRIBUTORS.md) file. The list of contributors is automatically updated when:

1. A push is made to the main branch
2. A pull request is merged
3. Manually using the `just contributors` command

### Manual Update

To manually update the contributors list:

```bash
just contributors
```

### How Contributors are Tracked

Contributors are tracked based on git commit history. The system:
- Counts commits per contributor
- Shows contribution statistics
- Excludes certain email domains (e.g., noreply.github.com)
- Sorts contributors by number of commits

For more details about COG's contributor tracking, see the [official documentation](https://docs.cocogitto.io/).

## Contributor License Agreement (CLA)

Before we can accept your contributions, you will need to sign a Contributor License Agreement (CLA). This is a legal document in which you state that you are entitled to contribute the code you are submitting and that you grant us the rights to use that contribution.

### How to Sign the CLA

1. **Individual Contributors**: If you are contributing as an individual, please sign the [Individual CLA](./cla/individual_cla.md).
2. **Corporate Contributors**: If you are contributing on behalf of a company, please sign the [Corporate CLA](./cla/corporate_cla.md).

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

## frequently asked questions
- [Contributor License Agreement (CLA) FAQ](cla_faq.md)
## Code of Conduct

We are committed to fostering a welcoming and inclusive community. Please read and adhere to our [Code of Conduct](CODE_OF_CONDUCT.md) when participating in the project.

## Getting Help

If you need help or have any questions, feel free to open an issue on GitHub or reach out to the maintainers.

## Documentation Contributions

- All documentation resides in `docs/source/`.
- Follow the directory structure for consistency.
- Use Sphinx syntax for cross-referencing (e.g., `:doc:` or `:ref:`).

```{toctree}
---
maxdepth: 2
---
cla_faq
CODE_OF_CONDUCT
cla/individual_cla
cla/corporate_cla
```
