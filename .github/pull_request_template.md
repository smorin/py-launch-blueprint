# Feature Pull Request

## Branch Naming Convention
<!-- Use branch names like: feature/description or feature/123-description (e.g., feature/user-authentication or feature/123-user-auth) -->
Current branch: `<Replace with your branch name>`

## Related Issue
<!-- IMPORTANT: Please verify this issue number is correct and exists to automatically close the issue when this PR is merged -->
<!-- Link to the issue using format: Closes #123 or Fixes #123 -->
Closes #issue-number

## Feature Description
<!-- Provide a clear and concise description of the feature being implemented -->
<!-- Example: Adds user authentication via OAuth2, including login flow and profile creation -->

## Implementation Details
<!-- Provide a technical overview of how the feature was implemented -->
<!-- Include architectural decisions and design patterns used -->
<!-- Example:
- Used Strategy pattern for multiple auth providers
- Middleware for authentication checks
-->

**Important Notes (please address or acknowledge):**
- Mention any CI/CD failing checks unrelated to this PR
- List any TODO items that are still pending

## Changes Made
<!-- List key changes made for this feature -->
<!-- Example:
- Added AuthService class to handle authentication
- Created user table migrations
-->
-
-

## Testing Performed
<!-- Describe the testing you've done both automated and manual to validate the feature -->
<!-- Example:
- Manually tested pre-commit passing on all files
- Verified newly added workflows pass in CI/CD
- Tested any new tool/command added
-->
-
-

## Testing Instructions
<!-- Follow these steps to run and test before submitting -->

**Common Testing Instructions**

To ensure code quality and consistency before submitting:

**Run pre-commit checks on all files**

```just pre-commit-run```

**Run all tests (Note: The `just test` command is a project-specific test runner.)**

```just test```

**Install the package in editable mode with development dependencies**

```just install-dev```

**Install new dependencies or tools (if added):**

If this PR adds new dependencies or tools, install them using the project’s recommended method (Justfile):

```bash
# Example installation command (replace with the actual one)
just install-[tool-name]
```
**Testing just commands for new dependencies or tools (if added):**
- ```just A``` # To test the A functionality
- ```just B``` # To test the B functionality

-->

## Documentation Updates
<!-- List any documentation changes made or needed -->
<!-- Example:
- Added new docs/auth.md
- Updated README.md
- Added docstrings to new classes/methods
-->
-

## Checklist
<!-- Please verify each item by checking the box -->
- [ ] Testing added to pre-commit hook (`pre-commit run --all-files` passes)
- [ ] All tests pass locally and in CI
- [ ] Documentation added/updated in Sphinx
- [ ] Appropriate unit test coverage added (run `pytest --cov` to verify)
- [ ] Self-review of code performed
- [ ] No debug print statements or commented-out code left in the codebase
