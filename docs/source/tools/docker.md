# Using Docker with `py-launch-blueprint`

This project includes full support for running and testing via Docker. This ensures a reproducible, isolated development environment with all tools preinstalled — including the CLI, `just`, `ruff`, and test dependencies.

---

## 🐳 Getting Started

### 1. **Build the Docker Image**

From the project root:

```bash
docker build -t py-launch-dev -f .devcontainer/Dockerfile .
```

### 2. **Run the Container**

```bash
docker run --rm -it py-launch-dev
```

This launches the container and drops you into an interactive shell where you can run CLI commands.

---

## 🛠️ CLI Usage

Once inside the container, the CLI is available directly via the `py-launch` entrypoint:

```bash
py-launch
```

Or using any aliases/scripts defined:

```bash
just
just test
just lint
```

---

## ⚙️ Available Commands

| Command         | Description                      |
|----------------|----------------------------------|
| `just`          | Show all available recipes       |
| `just test`     | Run unit tests inside container  |
| `just lint`     | Run Ruff linter checks           |
| `just format`   | Run formatter (`ruff format`)    |
| `py-launch`     | Run the CLI tool                 |

---

## 🧪 Running in CI

The Dockerfile is suitable for CI environments. You can use it in GitHub Actions or other CI runners like:

```yaml
- name: Build image
  run: docker build -t py-launch-dev -f .devcontainer/Dockerfile .

- name: Run tests
  run: docker run --rm py-launch-dev just test
```

---

## 🔄 Rebuilding the Container

If you change dependencies or update the Dockerfile, rebuild with:

```bash
docker build --no-cache -t py-launch-dev -f .devcontainer/Dockerfile .
```

---

## ✅ Requirements

- [Docker](https://docs.docker.com/get-docker/) installed
- Optional: [Just](https://github.com/casey/just) installed locally if using `just` outside container

---

## 🧰 Container Notes

- **Base Image**: Python 3.11 Slim
- **Includes**: `just`, `ruff`, `pytest`, `uv`, Docker CLI, and your project code
- **Mounts Docker socket** (optional, see `.devcontainer/devcontainer.json`)
