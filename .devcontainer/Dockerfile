# Use official Python 3.11 bullseye-based dev container image
FROM mcr.microsoft.com/devcontainers/python:3.11-bullseye

# Install python3-venv package to enable virtual environment creation
RUN apt-get update && \
    apt-get install -y python3-venv && \
    rm -rf /var/lib/apt/lists/*
