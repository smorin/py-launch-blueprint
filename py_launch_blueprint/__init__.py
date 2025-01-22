"""Py utilities package."""

from importlib import metadata

__version__ = metadata.version("py-utils")

from .projects import main  # Re-export main function
