"""Py utilities package."""

from importlib import metadata

__version__ = metadata.version("python-utils")

from .projects import main  # Re-export main function
