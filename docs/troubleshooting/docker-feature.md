# Troubleshooting: Devcontainer & Containerized Python Environment

## 🧩 Issue Summary
Problems may arise when setting up the development environment with the new `.devcontainer` configuration, such as:
- Container build or startup failures
- Python version not matching project requirements
- Issues with dependency installation
- Container shell not launching as expected

## 🔍 Root Cause / Investigation
- **Initial Hypothesis:** Missing dependencies or misconfigured environment prevented successful container builds or proper Python usage.
- **What was discovered:**
  - Container lacked some system tools or Python version was incorrect.
  - Project files or Docker socket not mounted correctly.
  - Python interpreter not detected by VS Code or scripts.
- **Tools & Commands Used:**
  - `docker build -t py-launch-dev -f .devcontainer/Dockerfile .`
  - `docker run --rm -it py-launch-dev`
  - Checking VS Code Devcontainer logs (`Dev Containers: Show Container Log`)
  - Running `bash detect-python.sh` inside the container

## 🛠️ Solution
- **What Fixed It:**
  - Added `.devcontainer/Dockerfile` to specify Python 3.11 and install all dependencies (`just`, Docker CLI, etc).
  - Created `.devcontainer/devcontainer.json` for VS Code to enable proper container features and extensions.
  - Added `detect-python.sh` to robustly locate the Python interpreter inside the container.
  - Updated `Justfile` with recipes for container build/run and Python install.

- **Config/Command Snippets:**
  ```sh
  # Build and run the container manually
  docker build -t py-launch-dev -f .devcontainer/Dockerfile .
  docker run --rm -it py-launch-dev

  # Or use the Justfile helper
  just _container_setup

  # Install Python package inside the container
  just install

  # Check Python interpreter
  bash detect-python.sh

## ⚠️ Non-obvious Details / Gotchas

### Version Conflicts
- The container forces `SETUPTOOLS_SCM_PRETEND_VERSION=0.0.0` to avoid git-based versioning issues.
- Ensure all dependencies are compatible with the `python:3.11-slim` base image.

### Auto-loaded Config Issues
- If VS Code does not detect the container, double-check the `dockerfile` and `context` paths in `.devcontainer/devcontainer.json`.
- Docker socket mounting (`/var/run/docker.sock`) is necessary for Docker-based workflows inside the container.

### OS-Specific Quirks
- On Windows, use `MSYS_NO_PATHCONV=1` for Docker commands (as shown in the `Justfile`).
- File permissions and line endings may differ between your host and the container.

---

## 🧪 How to Test or Reproduce

**Prerequisites:**
- Docker installed
- VS Code with the Dev Containers extension

**Steps:**

1. From the project root, run:
    ```sh
    just _container_setup
    ```
    *Or, in VS Code, select “Reopen in Container” from the Command Palette.*

2. Verify the Python environment inside the container:
    ```sh
    python --version
    just install
    bash detect-python.sh
    ```

3. Confirm:
    - The container starts successfully
    - Dependencies install without errors
    - The shell is available

4. Check for errors in:
    - Container logs
    - VS Code Dev Containers log panel

---

## 💬 Extra Notes

- For advanced troubleshooting, inspect logs with:
    ```sh
    docker logs <container_id>
    ```
    or use the VS Code Dev Containers log panel.
- If you need additional VS Code extensions, add them to `.devcontainer/devcontainer.json` under the `extensions` array.
