FROM mcr.microsoft.com/devcontainers/python:3.11-bullseye

RUN apt-get update && \
    apt-get install -y python3-venv git curl && \
    rm -rf /var/lib/apt/lists/*

# Copy the devcontainer folder first
COPY . /workspaces/py-launch-blueprint-main/.devcontainer

# Then copy the rest of the repo (excluding .devcontainer)
COPY .. /workspaces/py-launch-blueprint-main

WORKDIR /workspaces/py-launch-blueprint-main

# Make sure the setup script is executable
RUN chmod +x /workspaces/py-launch-blueprint-main/.devcontainer/setup.sh
