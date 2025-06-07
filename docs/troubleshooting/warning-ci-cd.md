# Troubleshooting: CI Workflow Modernization and Lockfile Check

## 🧩 Issue Summary

The existing GitHub Actions CI workflow was outdated, lacked automated verification for dependency lockfile freshness, and had some redundant or unclear job steps. This could allow stale dependencies, inconsistent environments, and confusion among team members maintaining or extending the workflow.

## 🔍 Root Cause / Investigation

**Initial Assumption:**
The workflow was believed to be running all checks reliably, but there was no enforcement to ensure that `uv.lock` matched the latest dependencies in the project.

**Discovered:**
- The CI did not fail if `uv.lock` was out of date, meaning dependency changes could go unnoticed.
- Some job steps were not clearly named or logically grouped.
- Some install/setup steps and order could be improved for clarity.

**Tools/Commands Used:**
- Manual review of `.github/workflows/ci.yaml`
- Comparing current CI runs and their outputs
- Testing `uv lock` and related commands locally

## 🛠️ Solution

**Renamed job:**
Changed job name from `test` to `continuous-integration` for clarity.

**Lockfile check:**
Added a CI step to verify that `uv.lock` is up to date by running `uv lock`, comparing it to the committed file, and failing the workflow if there are differences.

```yaml
- name: Check if uv.lock is up to date
  run: |
    source .venv/bin/activate
    uv lock > uv.lock.new
    if ! cmp -s uv.lock uv.lock.new; then
      echo "❌ uv.lock is outdated. Please run 'uv lock' locally and commit the updated lockfile."
      diff -u uv.lock uv.lock.new || true
      exit 1
    else
      echo "✅ uv.lock is up to date."
    fi
    rm uv.lock.new
```

- Workflow improvements

Improved step names for clarity (e.g., “Create virtual environment and install dependencies”).
Adjusted the order of Python setup and dependency installation for better reliability.
Moved Taplo installation to after the linter steps.
Renamed some steps for improved readability.
Commented out or reorganized unused/publish jobs for clarity.

## ⚠️ Non-obvious Details / Gotchas
1. Lockfile Enforcement: If a teammate updates dependencies but forgets to run uv lock, the CI will now fail with a clear error message.
2. Python Version: Ensure matrix Python version is respected—setup-python now comes after lockfile verification.
3. Virtual Environment Path: The workflow relies on .venv/bin being on the path; if you change venv structure, update accordingly.
4. Taplo/TOML Checks: Taplo must still be installed via just install-taplo before TOML checks—order matters.

## ⚠️ 🧪 How to Test or Reproduce
1. Trigger the workflow: Push a commit that updates dependencies in pyproject.toml but does not update uv.lock.
2. Expected result: The CI should fail at the “Check if uv.lock is up to date” step with a message prompting you to run uv lock.
3. Fix: Run uv lock locally, commit the updated uv.lock, and push. The CI should then pass.
4. General validation: Make changes to code or configs and observe that all relevant checks (type, linter, TOML, pre-commit) execute as expected.

## 💬 Extra Notes
- uv documentation
- GitHub Actions docs
- The publish/release job remains commented out for now; see the workflow file for a reference if needed in the future.
