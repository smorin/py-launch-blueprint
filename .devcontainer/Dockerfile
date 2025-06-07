# Use official Python slim image.
FROM python:3.11-slim

# Install system dependencies, Docker CLI, and 'just' tool into /usr/local/bin
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl unzip ca-certificates gnupg docker.io \
 && curl --proto '=https' --tlsv1.2 -sSf https://just.systems/install.sh | bash -s -- --to /usr/local/bin \
 && apt-get clean && rm -rf /var/lib/apt/lists/*

# Set working directory inside container
WORKDIR /app

# Copy the entire project directory into the container
COPY . .

# Set static version to avoid setuptools_scm git dependency during install
ENV SETUPTOOLS_SCM_PRETEND_VERSION=0.0.0

# Install your Python package along with its dependencies
RUN pip install --no-cache-dir .

# Install uvenv CLI (replacement for uvx)
RUN pip install --no-cache-dir uvenv

# Define default entrypoint command
ENTRYPOINT ["py-launch"]
