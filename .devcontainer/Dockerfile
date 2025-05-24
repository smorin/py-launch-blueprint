FROM mcr.microsoft.com/devcontainers/python:3.11-bullseye

RUN apt-get update && \
    apt-get install -y python3-venv git curl && \
    rm -rf /var/lib/apt/lists/*

ARG WORKSPACE_DIR=/workspaces/py-launch-blueprint
WORKDIR ${WORKSPACE_DIR}

COPY .devcontainer ${WORKSPACE_DIR}/.devcontainer
COPY .. ${WORKSPACE_DIR}

# Then copy the rest of the repo (excluding .devcontainer)
COPY .. /workspaces/py-launch-blueprint-main

WORKDIR /workspaces/py-launch-blueprint-main

# Make sure the setup script is executable
RUN chmod +x ${WORKSPACE_DIR}/.devcontainer/_container_setup.sh

# Install 'just' using the updated method from PR #256
RUN curl -sSL https://just.systems/install.sh | bash -s -- --to /usr/local/bin
