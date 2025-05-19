# Use official Python 3.11 bullseye-based dev container image
FROM mcr.microsoft.com/devcontainers/python:3.11-bullseye

# Install python3-venv package to enable virtual environment creation
RUN apt-get update && \
    apt-get install -y python3-venv git curl && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /workspaces/py-launch-blueprint-main

# Copy all files into the container
COPY . /workspaces/py-launch-blueprint-main

# Create virtual environment
RUN python3 -m venv .venv

# Install pre-commit inside virtualenv
RUN ./.venv/bin/pip install --upgrade pip pre-commit

# Make setup.sh executable
RUN chmod +x setup.sh

# Optionally, run setup.sh on container start (comment this if you prefer to run manually)
CMD ["./setup.sh"]
