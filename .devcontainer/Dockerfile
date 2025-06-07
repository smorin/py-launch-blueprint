# Use official Python slim image
FROM python:3.11-slim

# Install system dependencies, docker CLI, and 'just' into /usr/local/bin usage
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl unzip ca-certificates gnupg docker.io \
 && curl --proto '=https' --tlsv1.2 -sSf https://just.systems/install.sh | bash -s -- --to /usr/local/bin \
 && apt-get clean && rm -rf /var/lib/apt/lists/*

# Set working directory inside container
WORKDIR /app

# Copy project files to container
COPY pyproject.toml ./
COPY README.md ./
COPY py_launch_blueprint/ ./py_launch_blueprint/
COPY tests/ ./tests/

# Set static version to avoid git dependency during install
ENV SETUPTOOLS_SCM_PRETEND_VERSION=0.0.0

# Install Python dependencies and your package
RUN pip install --no-cache-dir .

# Define default entrypoint
ENTRYPOINT ["py-launch"]
