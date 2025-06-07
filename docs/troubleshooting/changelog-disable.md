# Troubleshooting: Commit Validation & Changelog Automation

## 🧩 Issue Summary
Problems may arise when setting up or running the new commit validation and changelog generation pipeline, such as:
- Commit validation fails unexpectedly
- Changelog is not generated or updated as expected
- CI workflow for changelog is not triggered or runs incorrectly
- Configuration files for `cocogitto` (`cog`) are missing or misreferenced
- Shell scripts for automation don’t execute or locate the correct config

## 🔍 Root Cause / Investigation

- **Initial Hypothesis:**
  Misconfigured or missing config files/scripts prevented successful commit validation or changelog automation.

- **What was discovered:**
  - Newly added `.cog.cocohito.toml` and `.cog.cod.toml` define commit types and changelog structure, and must be referenced correctly in scripts.
  - Shell scripts (`validate-commits.sh` and `update-changelog.sh`) explicitly reference these configs via `--config`.
  - The changelog workflow triggers in `.github/workflows/changelog.yml` are commented out, so the workflow will not run automatically unless you uncomment them.
  - Workflow permissions and steps may need to be in sync with the file structure.

- **Tools & Commands Used:**
  - `bash scripts/validate-commits.sh`
  - `bash scripts/update-changelog.sh`
  - Manual inspection of `.cog.*.toml` files
  - Checking `.github/workflows/changelog.yml` and CI logs

## 🛠️ Solution

- **What Fixed It:**
  - Added `.cog.cocohito.toml` and `.cog.cod.toml` for `cocogitto` configuration.
  - Created `scripts/validate-commits.sh` and `scripts/update-changelog.sh` to automate commit checking and changelog generation using `cog`.
  - Updated `.github/workflows/changelog.yml` (triggers currently commented out) to control changelog workflow runs.
  - Ensured scripts call `cog` with the correct config file using `--config`.
  - Set workflow permissions to allow changelog updates.

- **Config/Command Snippets:**
  ```sh
  # Validate commit messages against conventional commit rules
  bash scripts/validate-commits.sh

  # Generate or update the changelog
  bash scripts/update-changelog.sh

  # Direct use of cog with a config
  cog --config .cog.cod.toml check
  cog --config .cog.cocohito.toml changelog
