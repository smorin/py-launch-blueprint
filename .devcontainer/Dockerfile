FROM python:3.11-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl unzip ca-certificates gnupg docker.io git \
    && curl --proto '=https' --tlsv1.2 -sSf https://just.systems/install.sh | bash -s -- --to /usr/local/bin \
    && curl -Ls https://astral.sh/uv/install.sh | bash \
    && ln -s /root/.cargo/bin/uv /usr/local/bin/uv \
    && ln -s /root/.cargo/bin/uvx /usr/local/bin/uvx \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY pyproject.toml ./
COPY README.md ./
COPY py_launch_blueprint/ ./py_launch_blueprint/
COPY tests/ ./tests/
COPY Justfile ./

ENV SETUPTOOLS_SCM_PRETEND_VERSION_FOR_PY_LAUNCH_BLUEPRINT=0.0.1

RUN pip install --no-cache-dir --upgrade pip setuptools wheel setuptools-scm \
    && pip install --no-cache-dir .

ENTRYPOINT ["py-launch"]
