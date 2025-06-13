# Using Docker with `py-launch-blueprint`

This project includes Docker support for running and testing the CLI tool in a consistent, isolated environment. The containerized version includes all necessary dependencies and tools — including the CLI, `just`, `uv`, Docker CLI, and development tools.

## Purpose and Problem Solved
Docker support automates the setup of a consistent development and runtime environment for the py-launch CLI tool. It eliminates "works on my machine" issues and provides a reproducible environment with all dependencies pre-installed, helping maintain development consistency and simplifying deployment.

## Key Benefits and Value Proposition
- **Consistent environment** across all development machines and CI/CD
- **Pre-installed dependencies** including Python 3.11, uv, just, and Docker CLI
- **Isolated execution** preventing conflicts with local Python installations
- **Fast setup** with single command container builds
- **VS Code Dev Containers** for seamless development experience
- **Docker-in-Docker** support for testing Docker-based CLI features

---

## Getting Started

### Prerequisites

- [Docker](https://www.docker.com/) installed and running
- [VS Code](https://code.visualstudio.com/) with [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) (for development)

### Development Setup (Recommended)

#### Option 1: VS Code Dev Containers
1. Open the project in VS Code
2. When prompted, click "Reopen in Container" or use `Cmd+Shift+P` → "Dev Containers: Reopen in Container"
3. VS Code will automatically build the container and set up the development environment
4. All tools (`uv`, `just`, `ruff`, `mypy`) are pre-installed and ready to use

#### Option 2: Manual Container Build
```bash
# Build the Docker container
just container-setup

# Test the CLI tool
just container-test
```

### Quick Example
```bash
# In VS Code Dev Container or manual setup
just format          # Format code with ruff
just test            # Run tests
just lint            # Run linter
```

---

## Usage

### Common Use Cases
- **Development**: Test CLI changes in isolated environment
- **Distribution**: Package and deploy the CLI tool
- **Troubleshooting**: Debug issues in clean environment

---

## Configuration

### Key Configuration Options
- **Base Image**: `python:3.11-slim` (lightweight and secure)
- **Working Directory**: `/app`
- **Build Backend**: Hatchling with hatch-vcs for version management
- **Package Manager**: uv for fast dependency installation

### Dev Container Configuration (`.devcontainer/devcontainer.json`)
```json
{
  "name": "py-launch-blueprint",
  "build": {
    "dockerfile": "Dockerfile",
    "context": ".."
  },
  "mounts": [
    "source=/var/run/docker.sock,target=/var/run/docker.sock,type=bind"
  ],
  "customizations": {
    "vscode": {
      "extensions": [
        "ms-python.python",
        "charliermarsh.ruff",
        "ms-python.mypy-type-checker"
      ]
    }
  }
}
```

---

## Testing

### Standalone Testing
```bash
# Build and test the container
just container-setup
just container-test
```

---

## Troubleshooting

### Common Issues

#### Dev Container Issues
1. **"Workspace does not exist"**: Rebuild container with `Dev Containers: Rebuild Container`
2. **Permission denied**: Ensure Docker Desktop is running
3. **Extensions not loading**: Clear VS Code cache and rebuild
4. **Tool not found** (`uv`, `just`): Force rebuild without cache

#### Build Failures
1. **Cache issues**: Use `docker build --no-cache`
2. **Network problems**: Check internet connection for tool downloads
3. **Permission issues**: Run as current user with `--user $(id -u):$(id -g)`

#### Runtime Issues
1. **Token authentication**: Verify `PY_TOKEN` environment variable is set
2. **Docker socket access**: Ensure `/var/run/docker.sock` is accessible
3. **Memory issues**: Increase Docker Desktop memory allocation

### Debug Commands
```bash
# Access container shell for debugging
docker run --rm -it --entrypoint /bin/bash py-launch-dev:latest

# Check build logs
docker build --no-cache -t py-launch-dev:latest -f .devcontainer/Dockerfile . --progress=plain
```

---

## References

- [Docker Documentation](https://docs.docker.com/)
- [VS Code Dev Containers](https://code.visualstudio.com/docs/devcontainers/containers)
- [Python 3.11 Docker Images](https://hub.docker.com/_/python)
