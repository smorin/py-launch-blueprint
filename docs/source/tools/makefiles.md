# Makefile-Driven Workflows

This guide provides an overview of the Makefile-driven workflows used in the Py Launch Blueprint project.

## Introduction

Makefiles are used to automate common tasks in the project, such as building, testing, and running the code. This guide will walk you through the various targets and commands defined in the Makefile.

## Makefile Targets

### `all`

The default target that displays the help message.

```makefile
all: help
```

### `check`

Checks the system requirements and ensures that all necessary tools are installed.

```makefile
check: ## Check system requirements
	@echo "Checking dependencies..."
	@echo "=== System Requirements Status ==="
	@ERROR_COUNT=0; \
	CHECK_CMD_NAME="just"; \
	CHECK_CMD_INSTALL="install-just"; \
	if [ $(shell command -v just >/dev/null 2>&1 && echo "0" || echo "1" ) -eq 0 ] ; then \
		printf "[$(CHECK)] $${CHECK_CMD_NAME}\n"; \
	else \
		printf "[$(CROSS)] $${CHECK_CMD_NAME} ($(GREEN)make $${CHECK_CMD_INSTALL}$(NC))\n"; \
		ERROR_COUNT=$$((ERROR_COUNT + 1)); \
		MISSING_DEPS="$${CHECK_CMD_NAME}$${MISSING_DEPS:+,} $${MISSING_DEPS}"; \
	fi; \
	CHECK_CMD_NAME="uv"; \
	CHECK_CMD_INSTALL="install-uv"; \
	if [ $(shell command -v uv >/dev/null 2>&1 && echo "0" || echo "1" ) -eq 0 ] ; then \
		printf "[$(CHECK)] $${CHECK_CMD_NAME}\n"; \
	else \
		printf "[$(CROSS)] $${CHECK_CMD_NAME} ($(GREEN)make $${CHECK_CMD_INSTALL}$(NC))\n"; \
		ERROR_COUNT=$$((ERROR_COUNT + 1)); \
		MISSING_DEPS="$${CHECK_CMD_NAME}$${MISSING_DEPS:+,} $${MISSING_DEPS}"; \
	fi; \
	if [ "$${ERROR_COUNT}" = "0" ]; then \
		echo -e "$(GREEN)All dependencies are installed!$(NC)"; \
	else \
		echo ""; \
		echo -e "$(RED)Found $$ERROR_COUNT missing deps: $${MISSING_DEPS}$(NC)"; \
		exit 1; \
	fi
```

### `install-just`

Prints the command to install `just` and provides a link to the installation options.

```makefile
install-just: ## Print install just command and where to find install options
	@echo "just installation command:"
	@echo -e "${CYAN}curl --proto '=https' --tlsv1.2 -sSf https://just.systems/install.sh | bash -s -- --to ~/bin${NC}"
	@echo "NOTE:change ~/bin to the desired installation directory"
	@echo "Find other install options here: https://github.com/casey/just"
	@echo -e "To setup just PATH, run: ${YELLOW}SET_PATH=$(HOME)/bin make set-path${NC}"
```

### `install-uv`

Prints the command to install `uv` and provides a link to the installation options.

```makefile
install-uv: ## Print install uv command and where to find install options
	@echo "uv installation command:"
	@echo -e "${CYAN}curl -LsSf https://astral.sh/uv/install.sh | sh${NC}"
	@echo "Find other install options here: https://docs.astral.sh/uv/getting-started/installation/"
	@echo -e "To setup uv PATH, run: ${YELLOW}SET_PATH=$(HOME)/.local/bin make set-path${NC}"
```

### `set-path`

Adds the specified path to the `PATH` environment variable in `.zshenv`.

```makefile
set-path: ## Add SET_PATH to PATH in .zshenv if not already present
	@if [ -z "$(SET_PATH)" ]; then \
		echo -e "$(RED)Error: SET_PATH must be set$(NC)"; \
		echo -e "Usage: $(BLUE)make test2 SET_PATH=/your/path$(NC)"; \
		exit 1; \
	fi; \
	if ! awk -v path="$(SET_PATH)" ' \
		BEGIN {found=0} \
		/^export PATH=/ { \
			if (index($$0, path) > 0) { \
				found=1; \
				exit; \
			} \
		} \
		END {exit !found}' "$(HOME)/.zshenv"; then \
		echo "export PATH=\"\$$PATH:$(SET_PATH)\"" >> "$(HOME)/.zshenv"; \
		echo -e "$(GREEN)Added PATH entry:$(NC) \$$PATH:$(SET_PATH)"; \
		echo -e "Run $(BLUE)source $(HOME)/.zshenv$(NC) to apply changes"; \
	else \
		echo -e "$(CHECK) PATH already contains $(SET_PATH)"; \
	fi
```

### `help`

Displays the help message with a list of available targets.

```makefile
help: ## The help command - this command
	@echo ""
	@echo "Purpose of this Makefile:"
	@echo -e "  To make it easy to check for and install"
	@echo -e "  the main dependencies because almost everyone has $(GREEN)make$(NC)"
	@echo ""
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@grep -h -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "$(CYAN)%-30s$(NC) %s\n", $$1, $$2}' 
	@echo ""
```

## Additional Resources

For more detailed information on using Makefiles, refer to the following resources:

- [GNU Make Manual](https://www.gnu.org/software/make/manual/make.html)
- [Makefile Tutorial](https://makefiletutorial.com/)
