# Makefile-Driven Workflows

Makefiles are a powerful way to automate tasks in your project. They provide a simple and consistent way to define and run commands, making it easier to manage your development workflow.

## Makefile Basics

A Makefile is a file that contains a set of rules for building and managing your project. Each rule consists of a target, a set of dependencies, and a set of commands to run.

### Example Makefile

Here is an example Makefile for the Py Launch Blueprint project:

```makefile
# Minimal makefile for Sphinx documentation
#

# You can set these variables from the command line, and also
# from the environment for the first two.
SPHINXOPTS    ?=
SPHINXBUILD   ?= uv run --extra docs sphinx-build
SPHINXAUTOBUILD ?= uv run --extra docs sphinx-autobuild
SOURCEDIR     = source
BUILDDIR      = build

# Put it first so that "make" without argument is like "make help".
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
	@echo ""
	@echo "  hotreloadhtml: Hot reload HTML using sphinx-autobuild"

.PHONY: help Makefile

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
%: Makefile
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

# Special target to run sphinx-autobuild in hot-reload mode
hotreloadhtml:
	@$(SPHINXAUTOBUILD) -b html "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
```

## Common Makefile Targets

### `help`

The `help` target provides a list of available targets and their descriptions. It is useful for quickly understanding the available commands in your Makefile.

### `hotreloadhtml`

The `hotreloadhtml` target runs `sphinx-autobuild` in hot-reload mode, which automatically rebuilds and reloads the documentation when changes are made.

## Running Makefile Targets

To run a target defined in your Makefile, use the `make` command followed by the target name. For example, to run the `hotreloadhtml` target:

```bash
make hotreloadhtml
```

## Additional Resources

For more detailed information on using Makefiles, refer to the following resources:

- [GNU Make Manual](https://www.gnu.org/software/make/manual/make.html)
- [Makefile Tutorial](https://makefiletutorial.com/)
