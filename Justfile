# Set project-wide variables
py_package_name := "py_launch_blueprint"
repo_name := "py-launch-blueprint"
command_name := "py-projects"
args := " "

# Text colors
BLACK := '\033[30m'
RED := '\033[31m'
GREEN := '\033[32m'
YELLOW := '\033[33m'
BLUE := '\033[34m'
MAGENTA := '\033[35m'
CYAN := '\033[36m'
WHITE := '\033[37m'
GRAY := '\033[90m'

# Background colors
BG_BLACK := '\033[40m'
BG_RED := '\033[41m'
BG_GREEN := '\033[42m'
BG_YELLOW := '\033[43m'
BG_BLUE := '\033[44m'
BG_MAGENTA := '\033[45m'
BG_CYAN := '\033[46m'
BG_WHITE := '\033[47m'

# Text styles
BOLD := '\033[1m'
DIM := '\033[2m'
ITALIC := '\033[3m'
UNDERLINE := '\033[4m'

# Reset all styles
NC := '\033[0m'

# Display a symbol
# This should not use interpolation because it is a string literal
# The variables are not expanded when the string is created but when it is used
# VARIABLE_NAME + "TEXT" + VARIABLE_NAME should be written as CHECK := GREEN + "✓" + NC
CHECK := GREEN + "✓" + NC
CROSS := RED + "✗" + NC
DASH := GRAY + "-" + NC


CLIPBOARD_CMD := if os_family() == "windows" { "clip" } else if os() == "linux" { "xclip -selection clipboard" } else { "pbcopy" }
DATE_TIME := datetime("%Y-%m-%d-%H-%M")
BRANCH_NAME := "test-actions-" + DATE_TIME

# List all available recipes
[group('help')]
@default:
    just --list --unsorted

# ================================
# COMMANDS GROUPS
# ================================
# SETUP: Initial project setup and environment initialization
# INSTALL: Installing the project and its dependencies
# UPDATE: Updating dependencies, versions, and configurations
# DEV: Development workflow commands and utilities
# TEST: Test execution and test environment management
# BUILD: Building distributable packages and artifacts
# RUN: Executing the application in various modes
# DOCS: Documentation generation and management
# PRE-COMMIT: Linting, formatting, and code quality checks
# HELP: Usage instructions and command information
# UTILITIES: General utility and maintenance commands
# DEBUG: Debugging and troubleshooting tools
# RELEASES: Version management and publishing
# WORKFLOW: CI/CD pipelines and multi-step processes
# QUICK START: Essential commands for basic usage
# ================================

# Select a just recipe
[group('utilities'), group('help')]
@select-shell:
    @just --choose

# Check if required tools are installed
[group('setup'), group('debug')]
@check-deps:
    @#!/usr/bin/env sh
    if ! command -v uv >/dev/null 2>&1; then echo "uv is not installed"; exit 1; fi
    if ! command -v python3 >/dev/null 2>&1; then echo "python3 is not installed"; exit 1; fi
    if ! command -v just >/dev/null 2>&1; then echo "just is not installed"; exit 1; fi
    if ! command -v pre-commit >/dev/null 2>&1; then echo "{{YELLOW}}WARNING: pre-commit is not installed{{NC}}"; fi
    if ! command -v taplo >/dev/null 2>&1; then echo "Taplo is not installed"; exit 1; fi
    echo "All required tools are installed"

alias c := check-deps

# Install package in editable mode with dev dependencies
[group('install'), group('quick start')]
@install-dev: check-deps
    uv pip install --editable ".[dev]"

# Install Taplo in editable mode with dev dependencies
[group('install')]
@install-taplo:
	if ! command -v taplo >/dev/null 2>&1; then \
		cargo install taplo-cli  && echo "{{GREEN}} Taplo installed successfully{{NC}}"; \
	else \
		echo "{{YELLOW}}Taplo is already installed{{NC}}"; \
	fi

# Format code
[group('dev')]
@format:
    echo "Running formatters..."
    echo "  ruff format"
    uvx --with-editable . ruff format {{py_package_name}}/
    echo "  ruff isort"
    uvx --with-editable . ruff check --select I --fix {{py_package_name}}/

alias f := format

# Format TOML files (comments preserved via pyproject.toml config)
[group('dev')]
@format-toml:
    taplo format *.toml --config .taplo.toml

alias ft := format-toml

# Check TOML formatting without modifying files
[group('dev')]
@check-toml:
    taplo check *.toml --config .taplo.toml

alias ct := check-toml

# Run linter (code style and quality checks)
[group('dev')]
@lint:
    echo "Running linter..."
    echo "  ruff"
    uvx --with-editable . ruff check {{py_package_name}}/

alias l := lint

# Run type checker
[group('dev')]
@typecheck:
    echo "Running type checker..."
    echo "  mypy"
    uvx --with-editable . mypy {{py_package_name}}/

alias tc := typecheck

# Run tests
[group('test'), group('dev')]
@test *options:
    uvx --with-editable . pytest {{options}}

alias t := test

# Run all checks
[group('test'), group('dev'), group('quick start')]
@check: test lint typecheck
    echo "All checks passed!"

alias ca := check

# Run package command.
[group('run'), group('quick start')]
@run cmd=command_name *args=args:
    uvx --with-editable . {{cmd}} {{args}}

# Build package
[group('build'), group('dev')]
@build: check
    uvx --with-editable . build #TODO: fix this does not work

alias b := build

# Set up pre-commit hooks
[group('setup'), group('pre-commit')]
@pre-commit-setup:
    uvx --with-editable . pre-commit install

# Set up pre-commit hooks
[group('setup'), group('pre-commit')]
@pre-commit-uninstall:
    uvx --with-editable . pre-commit uninstall

# Run all pre-commit Hooks
[group('pre-commit')]
@pre-commit-run:
    uvx --with-editable . pre-commit run --all

alias pc := pre-commit-run

# Check installed package version
[group('releases'), group('utilities')]
@version cmd=command_name:
    {{cmd}} --version

# Collect system and environment information for debugging
[group('debug')]
debug-info:
    #!/usr/bin/env sh
    echo "## Debug Information"
    echo ""
    echo "### System Information"
    echo "- Date: $(date)"
    echo "- OS Family: {{os_family()}}"
    if [ "{{os_family()}}" = "macos" ]; then
        echo "- macOS Version: $(sw_vers -productVersion)"
        echo "- Kernel: $(uname -r)"
        echo "- Architecture: $(uname -m)"
    elif [ "{{os_family()}}" = "unix" ]; then
        if command -v lsb_release >/dev/null 2>&1; then
            echo "- Distribution: $(lsb_release -ds)"
        elif [ -f /etc/os-release ]; then
            . /etc/os-release
            echo "- Distribution: ${PRETTY_NAME}"
        fi
        echo "- Kernel: $(uname -r)"
        echo "- Architecture: $(uname -m)"
        echo "- Git Branch: $(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo 'Not a git repository or error')"
    elif [ "{{os_family()}}" = "windows" ]; then
        # Basic Windows info, might need refinement based on user env (Git Bash, Cygwin, WSL)
        echo "- Windows Version: $(systeminfo | findstr /B /C:"OS Name" | sed 's/.*: //')" # May need admin rights or fail
        echo "- Kernel: $(uname -r)"
        echo "- Architecture: $(uname -m)"
    else
        echo "- Kernel: $(uname -r)"
        echo "- Architecture: $(uname -m)"
    fi
    echo ""
    echo "### Development Tools"
    if command -v python3 >/dev/null 2>&1; then echo "python: $(python3 --version)"; else echo "python: Not Found"; fi
    if command -v uv >/dev/null 2>&1; then echo "uv: $(uv --version)"; else echo "uv: Not Found"; fi
    echo "ruff: $(uvx ruff --version)"
    if command -v git >/dev/null 2>&1; then echo "git: $(git --version)"; else echo "git: Not Found"; fi
    if command -v just >/dev/null 2>&1; then echo "just: $(just --version)"; else echo "just: Not Found"; fi
    echo "CLI Version:{{command_name}}: $(uvx --with-editable . {{command_name}} --version 2>/dev/null || echo 'Not Found or Error')"
    echo "Project Version: $(uvx --with-editable . python -c 'import {{py_package_name}}; print({{py_package_name}}.__version__)' 2>/dev/null || echo 'Version Not Found')"

    echo ""
    echo "### Installed Project Packages"
    if command -v uv >/dev/null 2>&1; then uv pip list; else echo "uv not found, cannot list packages"; fi

    echo ""
    echo "### Declared Dependencies (pyproject.toml)"
    grep -E '^\[project(\.optional-dependencies)?\.\[^]]*\]|^\s*\w+\s*=|^\s*"?[^"=\s]+"?\s*=' pyproject.toml 2>/dev/null || echo "Could not read dependencies from pyproject.toml"

# Clean up temporary files and caches
[group('clean')]
@clean:
    rm -rf .pytest_cache
    rm -rf .mypy_cache
    rm -rf .ruff_cache
    rm -rf .coverage
    rm -rf htmlcov
    rm -rf dist
    rm -rf build
    rm -rf *.egg-info
    rm -rf .venv
    rm -rf {{py_package_name}}/__pycache__/

# Install Sphinx and any necessary extensions
[group('docs'), group('install')]
@install-docs:
    @#!/usr/bin/env sh
    if ! command -v uv >/dev/null 2>&1; then echo "uv is not installed"; exit 1; fi
    echo "Installing Sphinx..."
    uv pip install sphinx
    echo "Installing required Sphinx extensions..."
    uv pip install sphinx-rtd-theme sphinx-autobuild myst-parser
    echo -e "{{GREEN}} Documentation dependencies installed{{NC}}"

# Not usually needed, Initialize docs only if you are starting a new project
[group('docs'), group('setup')]
@init-docs:
    uv run --extra docs  --directory=docs sphinx-quickstart
# recommend you separate "source" and "build" directories within the root path (docs/source and docs/build)

# Show help for documentation sphinx
[group('docs'), group('help')]
@docs-help:
    cd docs && make

# Build documentation (default html format) change the target if needed e.g. just docs latexpdf
[group('docs'), group('build')]
@docs target="html":
    cd docs && make {{target}}

# Run documentation server with hot reloading
[group('docs'), group('run'), group('dev')]
@docs-dev:
    cd docs && make hotreloadhtml

# Clean documentation build files
[group('docs'), group('clean')]
@docs-clean:
    cd docs && make clean

# Update CONTRIBUTORS.md file
[group('build')]
@contributors:
    echo "Updating CONTRIBUTORS.md..."
    if [ "$$OS" = "Windows_NT" ]; then \
        powershell -File scripts/update_contributors.ps1; \
    else \
        echo "{{YELLOW}}TODO: Add macOS/Linux command to update CONTRIBUTORS.md here{{NC}}"; \
        # Example placeholder: ./scripts/update_contributors.sh
    fi
    echo "{{CHECK}} Contributors list updated"

# # Generate changelog from conventional commits
# changelog:
#     echo "Generating changelog..."
#     command -v cog >/dev/null 2>&1 || { echo "{{RED}}Error: Cocogitto (cog) is not installed{{NC}}"; exit 1; }
#     cog changelog --at=HEAD
#     echo "{{GREEN}}✓{{NC}} Changelog generated"

# Verify commit messages follow conventional commit format
[group('pre-commit')]
verify-commits start="HEAD~10" end="HEAD":
    echo "Verifying commit messages..."
    command -v cog >/dev/null 2>&1 || { echo "{{RED}}Error: Cocogitto (cog) is not installed{{NC}}"; exit 1; }
    cog verify --from={{start}} --to={{end}} && echo "{{GREEN}}✓{{NC}} All commits follow conventional format" || { echo "{{RED}}✗{{NC}} Some commits do not follow conventional format"; exit 1; }

# Bump version based on conventional commits
[group('releases')]
bump type="auto":
    echo "Bumping version..."
    command -v cog >/dev/null 2>&1 || { echo "{{RED}}Error: Cocogitto (cog) is not installed{{NC}}"; exit 1; }
    cog bump {{type}}
    echo "{{GREEN}}✓{{NC}} Version bumped"

# Create a conventional commit (interactive)
[group('pre-commit')]
commit:
    echo "Creating conventional commit..."
    command -v cog >/dev/null 2>&1 || { echo "{{RED}}Error: Cocogitto (cog) is not installed{{NC}}"; exit 1; }
    cog commit

# Install COG (Cocogitto) for changelog and commit management
[group('install'), group('releases')]
install-cog:
    echo "Installing Cocogitto (cog)..."
    case "$(uname -s)" in \
    Linux*) \
        if command -v cargo >/dev/null 2>&1; then \
            cargo install --force cocogitto; \
        else \
            echo "{{YELLOW}}Please install Rust's cargo to install cog{{NC}}"; \
            echo "Visit https://www.rust-lang.org/tools/install"; \
        fi \
        ;; \
    Darwin*) \
        if command -v brew >/dev/null 2>&1; then \
            brew install cocogitto; \
        else \
            echo "{{YELLOW}}Please install Homebrew to install cog{{NC}}"; \
            echo "Visit https://brew.sh/"; \
        fi \
        ;; \
    CYGWIN*|MINGW*|MSYS*|Windows*) \
        echo "{{YELLOW}}On Windows, please install from https://github.com/cocogitto/cocogitto/releases{{NC}}"; \
        ;; \
    *) \
        echo "{{RED}}Unknown OS, please install manually from https://github.com/cocogitto/cocogitto{{NC}}"; \
        ;; \
    esac
    command -v cog >/dev/null 2>&1 && echo "{{GREEN}}✓{{NC}} Cocogitto installed successfully" || echo "{{RED}}✗{{NC}} Failed to install Cocogitto"

# Check if COG is installed and setup pre-commit hook for commit message verification
[group('setup'), group('pre-commit')]
setup-cog-hooks:
    command -v cog >/dev/null 2>&1 || { echo "{{RED}}Error: Cocogitto (cog) is not installed{{NC}}"; just install-cog; }
    cog install-hook commit-msg
    echo "{{GREEN}}✓{{NC}} Commit message hook installed"

# changelog:
#     # Command to generate the changelog locally
#     cog generate --config cog.toml

# Alternative commands when virtual environment is activated:
# These commands can be used after running 'source .venv/bin/activate'

# Setup virtual environment
[group('legacy')]
@setup-venv:
    python3 -m venv .venv
    echo "Note: After setup, activate the virtual environment with:"
    echo "  source .venv/bin/activate  # On Unix/macOS"
    echo "  .venv\Scripts\activate  # On Windows"

# Install in development mode
[group('legacy')]
@install-dev-pip:
    pip install --editable ".[dev]"

# Format code (includes ruff format and import sorting)
[group('legacy')]
@format-pip:
    echo "Running linter..."
    echo "  ruff"
    ruff format {{py_package_name}}/

# Run linter (code style and quality checks)
[group('legacy')]
@lint-pip:
    ruff check {{py_package_name}}/
    ruff check --select I --fix {{py_package_name}}/

# Run type checker
[group('legacy')]
@typecheck-pip:
    echo "Running type checker..."
    echo "  mypy"
    mypy {{py_package_name}}/

# Run tests
[group('legacy')]
@test-pip *options:
    pytest {{options}}

# Create a test repository from a PR
[group('workflow')]
[confirm("Are you sure you want to create a new repository from a PR?")]
pr-to-testrepo pr_number new_repo_name="test-actions-repo":
    #!/usr/bin/env bash
    set -euo pipefail

    # Check if gh CLI is installed
    if ! command -v gh >/dev/null 2>&1; then
        echo -e "{{RED}}Error: GitHub CLI (gh) is not installed. Please install it to use this command.{{NC}}"
        exit 1
    fi

    # Check if gh is authenticated
    if ! gh auth status >/dev/null 2>&1; then
        echo -e "{{RED}}Error: Not logged in to GitHub CLI. Please run 'gh auth login'.{{NC}}"
        exit 1
    fi

    # Get current repo URL
    repo_url=$(gh repo view --json url -q .url)

    # Move down one directory and clone
    cd ..
    echo -e "{{BLUE}}Cloning repository into {{new_repo_name}}...{{NC}}"
    if ! git clone "$repo_url" "{{new_repo_name}}"; then
        echo -e "{{RED}}Error: Failed to clone repository{{NC}}"
        exit 1
    fi

    cd "{{new_repo_name}}"
    echo -e "{{BLUE}}Downloading PR #{{pr_number}}...{{NC}}"
    if ! gh pr checkout {{pr_number}}; then
        echo -e "{{RED}}Error: Failed to checkout PR #{{pr_number}}. Does it exist?{{NC}}"
        exit 1
    fi

    echo -e "{{BLUE}}Removing existing git references...{{NC}}"
    rm -rf .git

    echo -e "{{BLUE}}Initializing new git repository...{{NC}}"
    git init -b main # Initialize with main branch

    # Create the marker file
    echo "This repository was created by the pr-to-testrepo just recipe." > pr2testrepo.txt
    echo -e "{{BLUE}}Created marker file pr2testrepo.txt{{NC}}"

    git add .
    git add pr2testrepo.txt # Explicitly add marker file

    # Check if there are any changes to commit (other than the marker file)
    if git diff --staged --quiet -- ':!pr2testrepo.txt'; then
        echo -e "{{YELLOW}}Warning: No changes detected after checkout. Initial commit will be empty.{{NC}}"
    fi

    git commit -m "Initial commit from PR #{{pr_number}}" --allow-empty

    echo -e "{{BLUE}}Creating and pushing to GitHub repository '{{new_repo_name}}'...{{NC}}"
    if ! gh repo create {{new_repo_name}} --private --source=. --push; then
        echo -e "{{RED}}Error: Failed to create or push to the repository '{{new_repo_name}}'.{{NC}}"
        echo -e "{{YELLOW}}Please check if a repository with this name already exists or if you have the necessary permissions.{{NC}}"
        # Attempt to clean up the local repo if creation failed
        echo -e "{{BLUE}}Attempting to clean up local git repository...{{NC}}"
        rm -rf .git
        exit 1
    fi
    echo ""
    # Print shell information
    echo -e "{{BLUE}}Shell in use: $SHELL{{NC}}"
    echo -e "{{YELLOW}}Please cd to the repository directory and ...{{NC}}"
    echo -e "{{RED}}MANUALLY EXECUTE THE NEXT COMMAND{{NC}}"
    echo -e "{{BLUE}}cd ../{{new_repo_name}}{{NC}}"
    echo "cd ../{{new_repo_name}}" | {{CLIPBOARD_CMD}}
    # Get the URL of the newly created repository
    #repo_url=$(gh repo view {{new_repo_name}} --json url -q .url); \
    #echo -e "{{GREEN}}{{CHECK}} Repository created and ready for testing at: ${repo_url}{{NC}}"




# Cleanup / Delete test repository from a PR from pr-to-testrepo
[group('workflow')]
[confirm("Are you sure you want to delete the remote repository '{{new_repo_name}}' and clean up the local directory?")]
clean-pr-to-testrepo new_repo_name="test-actions-repo":
    #!/usr/bin/env bash
    set -euo pipefail

    echo -e "{{BLUE}}Shell in use: $SHELL{{NC}}"

    # Safety check: Ensure the marker file exists in the parent directory
    # We expect this command to be run from the original repo,
    # and the test repo to be a sibling directory.
    marker_file="../{{new_repo_name}}/pr2testrepo.txt"

    if [[ ! -f "$marker_file" ]]; then
        echo -e "{{RED}}Error: Marker file '$marker_file' not found relative to current directory.{{NC}}"
        echo -e "{{YELLOW}}This might not be a repository created by 'pr-to-testrepo', the local directory might be missing, or you might be in the wrong directory.{{NC}}"
        echo -e "{{YELLOW}}Aborting delete. Please ensure you are in the original repository directory.{{NC}}"
        exit 1
    fi
    echo -e "{{GREEN}}{{CHECK}} Marker file found. Proceeding with deletion...{{NC}}"

    # Delete the remote GitHub repository
    echo -e "{{BLUE}}Attempting to delete remote repository '{{new_repo_name}}'...{{NC}}"
    if ! gh repo delete {{new_repo_name}} --yes; then
        echo -e "{{RED}}Error: Failed to delete remote repository '{{new_repo_name}}'. It might not exist or permissions are missing.{{NC}}"
        # Do not exit immediately, still offer local cleanup instructions
    else
         echo -e "{{GREEN}}{{CHECK}} Remote repository deleted successfully.{{NC}}"
    fi

    echo ""
    echo -e "{{YELLOW}}Remote deletion step complete (check status above).{{NC}}"
    echo -e "{{YELLOW}}Please clean up the local git repository directory:{{NC}}"
    echo -e "{{RED}}MANUALLY EXECUTE THE NEXT COMMAND(S){{NC}}"
    local_cleanup_cmd="cd .. && rm -rf {{new_repo_name}} && cd {{repo_name}}"
    echo -e "{{BLUE}}${local_cleanup_cmd}{{NC}}"
    # Attempt to copy the cleanup command to clipboard
    echo "${local_cleanup_cmd}" | {{CLIPBOARD_CMD}} || echo "(Failed to copy command to clipboard)"

# Create a test Pull Request for triggering GitHub Actions
[group('workflow')]
@create-test-pr message="Test PR for GitHub Actions verification":
    #!/usr/bin/env bash
    set -euo pipefail

    # Check if gh CLI is installed
    if ! command -v gh >/dev/null 2>&1; then
        echo -e "{{RED}}Error: GitHub CLI (gh) is not installed. Please install it to use this command.{{NC}}"
        exit 1
    fi

    # Check if gh is authenticated
    if ! gh auth status >/dev/null 2>&1; then
        echo -e "{{RED}}Error: Not logged in to GitHub CLI. Please run 'gh auth login'.{{NC}}"
        exit 1
    fi
    CURRENT_BRANCH_NAME=$(git rev-parse --abbrev-ref HEAD)

    echo "{{BLUE}}CURRENT_BRANCH: $CURRENT_BRANCH_NAME{{NC}}"
    # Ensure we are on the main/master branch before starting Add common main branch names here if needed
    if [[ "$CURRENT_BRANCH_NAME" != "main" && "$CURRENT_BRANCH_NAME" != "master" ]]; then
        echo "{{YELLOW}}Warning: Not on main/master branch. Checking out main...{{NC}}"
        if ! git checkout main; then
            echo "{{RED}}Error: Could not checkout main branch. Please switch manually and retry.{{NC}}"
            exit 1
        fi
    fi

    # Ensure local main is up-to-date
    echo -e "{{BLUE}}Pulling latest changes for main branch...{{NC}}"
    if ! git pull origin main; then
        echo -e "{{RED}}Error: Failed to pull latest changes for main. Please check your connection or repository status.{{NC}}"
        exit 1
    fi

    echo -e "{{BLUE}}Creating test branch: {{BRANCH_NAME}}{{NC}}"
    if ! git checkout -b {{BRANCH_NAME}}; then
        echo -e "{{RED}}Error: Failed to create branch {{BRANCH_NAME}}.{{NC}}"
        exit 1
    fi

    # Add timestamp to README
    echo -e "{{BLUE}}Modifying README.md...{{NC}}"
    echo "" >> README.md # Add a blank line for spacing
    echo "Test change at $(date) to trigger Actions." >> README.md
    MESSAGE="Test PR for GitHub Actions verification"

    # Commit and push
    echo -e "{{BLUE}}git add README.md...{{NC}}"
    git add README.md
    echo -e "{{BLUE}}Committing and pushing changes...{{NC}}"
    if ! git commit -m "$MESSAGE"; then
        echo -e "{{RED}}Error: Failed to commit changes.{{NC}}"
        # Attempt to switch back to main branch on failure
        git checkout main
        exit 1
    fi
    echo -e "{{BLUE}}git push -u origin {{BRANCH_NAME}}...{{NC}}"
    if ! git push -u origin "{{BRANCH_NAME}}"; then
        echo -e "{{RED}}Error: Failed to push branch {{BRANCH_NAME}} to origin.{{NC}}"
        # Attempt to switch back to main branch on failure
        git checkout main
        exit 1
    fi

    # Create PR
    echo -e "{{BLUE}}Creating Pull Request...{{NC}}"
    # Get the current repo info
    REPO_NAME=$(gh repo view --json nameWithOwner -q .nameWithOwner)
    echo "REPO_NAME: $REPO_NAME"
    PR_URL=$(gh pr create --title "$MESSAGE" --body "This is an automated PR to test GitHub Actions." --repo "$REPO_NAME")
    echo "PR_URL: $PR_URL"
    if [[ $? -ne 0 ]]; then
        echo "{{RED}}Error: Failed to create Pull Request via GitHub CLI.{{NC}}"
        # Attempt to switch back to main branch on failure
        git checkout main
        exit 1
    else
        echo "{{GREEN}}{{CHECK}} Test PR created successfully: $PR_URL{{NC}}"
        # Switch back to main branch after successful PR creation
        git checkout main
    fi

# Change working directory example
[working-directory: 'bar']
@_foo:
    echo "example"

[group('dev'), group('quick start')]
@dev:
    just format
    just lint
    just test
    # just build
    # just run

# Alias for dev (full developer cycle: format → lint → test → build)
alias cycle := dev
