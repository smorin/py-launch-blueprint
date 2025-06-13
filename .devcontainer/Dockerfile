FROM python:3.11-slim

# Install system dependencies, docker CLI, git, 'just', and 'uv'
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl unzip ca-certificates gnupg docker.io git \
    && curl --proto '=https' --tlsv1.2 -sSf https://just.systems/install.sh | bash -s -- --to /usr/local/bin \
    && curl -LsSf https://astral.sh/uv/install.sh | sh \
    && mv /root/.local/bin/uv /usr/local/bin/ \
    && mv /root/.local/bin/uvx /usr/local/bin/ \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy project files
COPY pyproject.toml ./
COPY README.md ./
COPY py_launch_blueprint/ ./py_launch_blueprint/
COPY .git/ ./.git/
COPY tests/ ./tests/
COPY Justfile ./

# Initialize git repository for version detection
# RUN git init . && \
#     git config user.email "build@docker.com" && \
#     git config user.name "Docker Build" && \
#     git add . && \
#     git commit -m "Initial commit" && \
#     git tag v0.0.1

# Install build dependencies
RUN pip install --no-cache-dir --upgrade pip hatchling hatch-vcs

# Install the package using uv
RUN uv pip install --system --no-cache .

# Use correct entrypoint (CLI command name, not package name)
ENTRYPOINT ["py-launch"]
