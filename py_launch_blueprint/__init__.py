"""Py utilities package."""

from importlib import metadata

__version__ = metadata.version("py_launch_blueprint")

from .projects import main as main  # Re-export main function
