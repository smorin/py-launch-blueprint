# Use official Python slim image
FROM python:3.11-slim

# Set working directory inside container
WORKDIR /app

# Copy only necessary files to build context
COPY pyproject.toml .
COPY README.md .
COPY py_launch_blueprint/ ./py_launch_blueprint/
COPY tests/ ./tests/

# Set environment variable to bypass setuptools-scm git version detection
ENV SETUPTOOLS_SCM_PRETEND_VERSION=0.0.0

# Install dependencies and your package
RUN pip install --no-cache-dir .

# Define default entrypoint command
ENTRYPOINT ["py-launch"]
