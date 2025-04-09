.. figure:: _static/py_launch_blueprint_logo_100x100.png
   :alt: py-launch-blueprint
   :width: 100px
   :align: left

.. image:: https://img.shields.io/badge/License-MIT-yellow.svg
   :target: https://opensource.org/licenses/MIT

Py Launch Blueprint
===================

**A Production-Ready Python Project Template with Integrated Best Practices**

.. image:: https://img.shields.io/badge/github-repo-green
.. image:: https://img.shields.io/github/v/release/smorin/py-launch-blueprint?include_prereleases&label=changelog
.. image:: https://github.com/simonw/llm/workflows/Test/badge.svg
.. image:: https://img.shields.io/badge/License-MIT-yellow.svg
.. image:: https://img.shields.io/github/stars/smorin/py-launch-blueprint?style=social

---

Py Launch Blueprint is a comprehensive Python project template that eliminates setup friction by providing a pre-configured development environment with carefully selected tools for linting, formatting, and type checking. It includes an annotated CLI example and detailed documentation explaining each tool choice and configuration decision, making it an ideal starting point for professional Python projects.

Why Choose Py Launch Blueprint?
--------------------------------

Py Launch Blueprint eliminates the setup friction in Python projects by providing a production-ready template with carefully curated tools and best practices. Here's what makes it special:

Full Documentation on ReadTheDocs
---------------------------------

- `py-launch-blueprint Docs <https://py-launch-blueprint.readthedocs.io/en/latest/>`_

Features
--------

- 🔍 Fuzzy search for project names  
- 🏢 Filter by workspace  
- 📋 Multiple output formats (text, JSON, CSV)  
- 📎 Clipboard integration  
- 🎨 Rich terminal UI with color support  
- 🔐 Secure token handling  
- ⚡ Fast and efficient pagination  

Quick Start
-----------

### Installation

#### From PyPI

.. code-block:: bash

   pip install py-launch-blueprint

#### From Source

.. code-block:: bash

   git clone https://github.com/smorin/py-launch-blueprint.git
   cd py-launch-blueprint
   pip install -e ".[dev]"  # Install with development dependencies

#### Direct Usage

.. code-block:: bash

   python projects.py --help

Configuration
-------------

The tool supports multiple ways to provide your Py Personal Access Token (PAT), in order of precedence:

1. Command-line argument: `--token`
2. Environment variable: `PY_TOKEN`
3. Configuration file: `~/.config/py-launch-blueprint/.env`

#### Setting Up Configuration File

.. code-block:: bash

   mkdir -p ~/.config/py-launch-blueprint

.. code-block:: bash

   echo "PY_TOKEN=your_token_here" > ~/.config/py-launch-blueprint/.env

.. code-block:: bash

   chmod 600 ~/.config/py-launch-blueprint/.env

Usage
-----

#### Basic Usage

.. code-block:: bash

   py-projects
   py-projects --workspace "My Workspace"
   py-projects --limit 50

#### Output Formats

.. code-block:: bash

   py-projects --format json
   py-projects --format csv
   py-projects --copy
   py-projects --output projects.txt

#### Additional Options

.. code-block:: bash

   py-projects --verbose
   py-projects --no-color
   py-projects --help
   py-projects --version

Error Codes
-----------

- 0: Successful execution  
- 1: Configuration error  
- 2: Authentication error  
- 3: API error  
- 4: Input/Output error  
- 5: User interrupt  

Table of Contents
-----------------

```{toctree}
:maxdepth: 3

about/index
tasks/index
tools/index
tutorials/index
reference/index
contributing/index
github-templates