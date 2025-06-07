# Troubleshooting: Code Coverage Integration with Codecov

## 🧩 Issue Summary

Previously, the project did not have automated code coverage tracking or visibility. CI workflows ran tests but did not upload coverage reports or display a coverage badge, making it hard for contributors and maintainers to assess test completeness or enforce coverage standards.

## 🔍 Root Cause / Investigation

- **What I originally thought was happening:**
  CI was running tests, but coverage data was not being collected or reported.

- **What I discovered after digging deeper:**
  - There was no `.codecov.yml` config in the repository.
  - Steps in `.github/workflows/ci.yaml` related to running coverage and uploading to Codecov were commented out or missing.
  - The README and documentation did not reference Codecov or display a badge.
  - Dependencies for `pytest-cov` and `codecov` were missing from the project.

- **Tools or commands used to debug:**
  - Inspected `.github/workflows/ci.yaml` and found coverage steps commented out.
  - Checked for the existence of `.codecov.yml` and README badge.
  - Ran `pytest --cov` locally to check coverage report generation.

## 🛠️ Solution

- **What changes fixed the issue:**
  - Added `.codecov.yml` to configure Codecov checks and thresholds.
  - Updated `.github/workflows/ci.yaml` to:
    - Run tests with coverage using `uv pytest --cov=py_launch_blueprint --cov-report=xml`
    - Upload the coverage report using `codecov/codecov-action@v3`
  - Updated `Justfile` with `coverage` and `coverage-report` recipes:

    ```make
    coverage:
        python -m pytest --cov=py_launch_blueprint --cov-report=term-missing --cov-report=xml
    coverage-report:
        codecov -f coverage.xml
    ```

  - Updated `pyproject.toml`:
    - Added dependencies: `pytest`, `pytest-cov`, etc.
    - Set `[tool.pytest.ini_options]` with coverage options:

      ```
      addopts = "--cov=py_launch_blueprint --cov-report=xml --cov-report=term-missing"
      ```

  - Added Codecov badge and coverage instructions to README and docs.

## ⚠️ Non-obvious Details / Gotchas

- For local runs or private repositories, you must set `CODECOV_TOKEN` in your environment or CI secrets.
- The `.codecov.yml` enforces a minimum coverage threshold of 70%; CI will fail if coverage drops below this.
- Coverage options are always included via `pyproject.toml` and do not need to be added to the CLI.
- The workflow uses `uv`; if not available, use `python -m pytest ...` instead.
- Use the dependency versions specified in `pyproject.toml` to avoid conflicts.

## 🧪 How to Test or Reproduce

1. Run tests with coverage locally:
   ```sh
   just coverage
     ```
   or
2. Upload coverage report to Codecov:
 ```sh
   just coverage-report
     ```
 (Requires CODECOV_TOKEN if not public.)

3. Open a PR or push to main and verify that GitHub Actions runs coverage and uploads to Codecov.
4. Check that the Codecov badge in the README updates accordingly.
