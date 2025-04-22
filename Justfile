# Set project-wide variables
py_package_name := "py_launch_blueprint"
command_name := "py-projects"
args := " "

# ANSI styles
BLACK := '\033[30m'
RED := '\033[31m'
GREEN := '\033[32m'
YELLOW := '\033[33m'
BLUE := '\033[34m'
MAGENTA := '\033[35m'
CYAN := '\033[36m'
WHITE := '\033[37m'
GRAY := '\033[90m'
BG_RED := '\033[41m'
BOLD := '\033[1m'
NC := '\033[0m'
CHECK := "$(GREEN)✓$(NC)"
CROSS := "$(RED)✗$(NC)"
DASH := "$(GRAY)-$(NC)"

@default:
    just --list --unsorted

@check-deps:
    @#!/usr/bin/env sh
    if ! command -v uv >/dev/null 2>&1; then echo "uv is not installed"; exit 1; fi
    if ! command -v python3 >/dev/null 2>&1; then echo "python3 is not installed"; exit 1; fi
    if ! command -v just >/dev/null 2>&1; then echo "just is not installed"; exit 1; fi
    if ! command -v pre-commit >/dev/null 2>&1; then echo "$(YELLOW)WARNING: pre-commit is not installed$(NC)"; fi
    echo "All required tools are installed"

alias c := check-deps

@install-dev: check-deps
    uv pip install --editable ".[dev]"

@format:
    echo "Running formatters..."
    uvx --with-editable . ruff format {{py_package_name}}/
    uvx --with-editable . ruff check --select I --fix {{py_package_name}}/

alias f := format

@lint:
    echo "Running linter..."
    uvx --with-editable . ruff check {{py_package_name}}/

alias l := lint

@typecheck:
    echo "Running type checker..."
    uvx --with-editable . mypy {{py_package_name}}/

alias tc := typecheck

@test *options:
    uvx --with-editable . pytest {{options}}

alias t := test

@test-failed *args:
    uvx --with-editable . pytest --maxfail=3 -v {{args}}

@check: test lint typecheck
    echo "$(CHECK) All checks passed!"

alias ca := check

@run cmd=command_name *args=args:
    uvx --with-editable . {{cmd}} {{args}}

@build: check
    uvx --with-editable . build

alias b := build

@pre-commit-setup:
    uvx --with-editable . pre-commit install

@pre-commit-run:
    uvx --with-editable . pre-commit run --all

alias pc := pre-commit-run

changelog:
    echo "Generating changelog..."
    command -v cog >/dev/null 2>&1 || { echo "{{RED}}Error: Cocogitto (cog) is not installed{{NC}}"; exit 1; }
    cog changelog --at=HEAD
    echo "$(CHECK) Changelog generated"

verify-commits start="HEAD~10" end="HEAD":
    echo "Verifying commit messages..."
    command -v cog >/dev/null 2>&1 || { echo "{{RED}}Error: Cocogitto (cog) is not installed{{NC}}"; exit 1; }
    cog verify --from={{start}} --to={{end}} && echo "$(CHECK) All commits follow conventional format" || { echo "$(CROSS) Some commits do not follow conventional format"; exit 1; }

bump type="auto":
    echo "Bumping version..."
    command -v cog >/dev/null 2>&1 || { echo "$(RED)Error: cocogitto (cog) is not installed$(NC)"; exit 1; }
    cog bump {{type}}
    echo "$(CHECK) Version bumped"

tag-version:
    VERSION=$$(cog get-version) && \
    git tag -a "$$VERSION" -m "Release $$VERSION" && \
    git push origin "$$VERSION"

commit:
    echo "Creating conventional commit..."
    command -v cog >/dev/null 2>&1 || { echo "$(RED)Error: Cocogitto (cog) is not installed$(NC)"; exit 1; }
    cog commit

install-cog:
    echo "Installing Cocogitto (cog)..."
    case "$(uname -s)" in \
    Linux*) command -v cargo >/dev/null && cargo install --force cocogitto || echo "Install Rust's cargo first: https://rust-lang.org/tools/install" ;; \
    Darwin*) command -v brew >/dev/null && brew install cocogitto || echo "Install Homebrew first: https://brew.sh" ;; \
    CYGWIN*|MINGW*|MSYS*|Windows*) echo "Windows: download from https://github.com/cocogitto/cocogitto/releases" ;; \
    *) echo "Unknown OS. Install manually from https://github.com/cocogitto/cocogitto" ;; \
    esac

setup-cog-hooks:
    command -v cog >/dev/null 2>&1 || just install-cog
    cog install-hook commit-msg
    echo "$(CHECK) Commit message hook installed"

@version cmd=command_name:
    {{cmd}} --version

@clean:
    rm -rf .pytest_cache .mypy_cache .ruff_cache .coverage htmlcov dist build *.egg-info .venv {{py_package_name}}/__pycache__/

@publish:
    uv pip install build twine
    python -m build
    twine upload dist/*

@init-docs:
    uv run --extra docs --directory=docs sphinx-quickstart

@docs-help:
    cd docs && make

@docs target="html":
    cd docs && make {{target}}

@docs-dev:
    cd docs && make hotreloadhtml

@docs-clean:
    cd docs && make clean

@contributors:
    echo "Updating CONTRIBUTORS.md..."
    if [ "$$OS" = "Windows_NT" ]; then \
        powershell -File scripts/update_contributors.ps1; \
    else \
        bash scripts/update_contributors.sh; \
    fi
    echo "$(CHECK) Contributors list updated"

@setup-venv:
    python3 -m venv .venv
    echo "Activate it with:"
    echo "  source .venv/bin/activate  (Unix/macOS)"
    echo "  .venv\\Scripts\\activate   (Windows)"

@install-dev-pip:
    pip install --editable ".[dev]"

@format-pip:
    ruff format {{py_package_name}}/

@lint-pip:
    ruff check {{py_package_name}}/
    ruff check --select I --fix {{py_package_name}}/

@typecheck-pip:
    mypy {{py_package_name}}/

@test-pip *options:
    pytest {{options}}
