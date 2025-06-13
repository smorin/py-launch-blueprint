
# Codecov Integration

[Codecov](https://about.codecov.io/) is a code coverage reporting tool that integrates with GitHub to visualize and track test coverage across your project. It helps teams improve testing practices by identifying untested parts of the codebase and ensuring changes are well-tested.

---

### Purpose and Problem Solved

Codecov provides actionable insights into the test coverage of your codebase. It ensures that new code contributions are tested adequately, reducing bugs and increasing confidence in releases.

---

### Key Benefits and Value Proposition

- **Automated code coverage reports** on every pull request
- **Visual feedback** on coverage increases/decreases
- **Highlights untested lines** in diffs
- **GitHub integration** for seamless developer workflows
- **Supports multiple CI/CD tools and languages**

---

## Getting Started

### Step 1: Get your Codecov token

1. Go to [https://app.codecov.io](https://app.codecov.io)
2. Navigate to your repo: `smorin/py-launch-blueprint`
3. Click ⚙️ "Settings" → "General"
4. Copy the **Repository Upload Token**

### Step 2: Add it to GitHub Secrets

1. Go to your GitHub repo
2. Click **Settings → Secrets and variables → Actions**
3. Click **New repository secret**
4. **Name**: `CODECOV_TOKEN`
5. **Value**: *(paste your token)*

### Step 3: Update your GitHub Action workflow

Update your `ci.yml` or test workflow to pass the token:

```yaml
- name: Upload coverage reports to Codecov
  uses: codecov/codecov-action@v5
  with:
    token: ${{ secrets.CODECOV_TOKEN }}
```

---

## Usage

### Common Use Cases

- **Check coverage in PRs**: Every pull request displays coverage diff and whether coverage has improved or dropped.
- **Track test quality** over time via the Codecov dashboard.
- **Enforce minimum coverage** by configuring thresholds in the repo settings (optional).

---

### Command References and Syntax

#### Run tests with coverage and generate HTML + XML reports:
```bash
just coverage
```

#### Open the local HTML coverage report:
```bash
just open-coverage-report
```

---

## Configuration

### Key Configuration Files

- `justfile`: Defines commands to run coverage.
- `.github/workflows/test.yml`: CI configuration that includes Codecov upload.
- `coverage.xml`: Generated test coverage report used by Codecov.

### GitHub Secrets

- `CODECOV_TOKEN`: Token from Codecov project settings (required for uploads from private repositories).

---

## Testing

### Standalone Testing

- Run `just coverage` locally and verify:
  - Tests pass
  - Coverage summary appears
  - `coverage.xml` is created in the project root

### Project-Specific Testing

- Push a PR to GitHub.
- Confirm Codecov bot comments with coverage results.
- View detailed report at:
  [Codecov Project Dashboard](https://app.codecov.io/github/smorinlabs/py-launch-blueprint)

---

## Disabling the Feature

### Temporarily or Permanently Disabling

- **Temporarily**: Comment out or remove the Codecov step in GitHub Actions workflows.
- **Permanently**:
  - Remove `codecov/codecov-action` from workflows.
  - Remove `CODECOV_TOKEN` from GitHub Secrets.
  - Optionally delete the project in [Codecov dashboard](https://app.codecov.io).

---

## References

- [Codecov Website](https://about.codecov.io/)
- [Codecov GitHub Action](https://github.com/codecov/codecov-action)
- [GitHub Docs: Enabling Code Coverage](https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions#example-uploading-code-coverage-results)
