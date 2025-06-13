# Using Docker with `py-launch-blueprint`

This project includes Docker support for running and testing the CLI tool in a consistent, isolated environment. The containerized version includes all necessary dependencies and tools — including the CLI, `just`, `uv`, Docker CLI, and development tools.

## Purpose and Problem Solved
Docker support automates the setup of a consistent development and runtime environment for the py-launch CLI tool. It eliminates "works on my machine" issues and provides a reproducible environment with all dependencies pre-installed, helping maintain development consistency and simplifying deployment.

## Key Benefits and Value Proposition
- **Consistent environment** across all development machines and CI/CD
- **Pre-installed dependencies** including Python 3.11, uv, just, and Docker CLI
- **Isolated execution** preventing conflicts with local Python installations
- **Fast setup** with single command container builds
- **CI/CD ready** for automated testing and deployment

---

## Getting Started

### Prerequisites

- [Docker](https://www.docker.com/) installed and running

### Basic Setup Steps
1. Ensure Docker is installed and running on your system
2. Build the container using the provided justfile commands
3. The container includes all necessary tools and your CLI application pre-installed

### Quick Example
```bash
# Build the Docker container
just container-setup

# Test the CLI tool
just container-test
```

---

## Usage

### Common Use Cases
- **Development**: Test CLI changes in isolated environment
- **CI/CD**: Run automated tests and builds
- **Distribution**: Package and deploy the CLI tool
- **Troubleshooting**: Debug issues in clean environment

---

## Configuration

### Key Configuration Options
- **Base Image**: `python:3.11-slim` (lightweight and secure)
- **Working Directory**: `/app`
- **Build Backend**: Hatchling with hatch-vcs for version management
- **Package Manager**: uv for fast dependency installation

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
1. **Build Failures**: Clean rebuild with `docker build --no-cache`
2. **Permission Issues**: Run as current user with `--user $(id -u):$(id -g)`
3. **Token Authentication**: Verify `PY_TOKEN` environment variable is set

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
- [Python 3.11 Docker Images](https://hub.docker.com/_/python)
