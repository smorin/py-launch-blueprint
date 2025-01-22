"""Tests for configuration management."""

import os
from pathlib import Path
import pytest
from unittest.mock import patch

from py_launch_blueprint.projects import Config, get_config, ConfigError


def test_config_from_env():
    """Test creating config from environment variables."""
    with patch.dict(os.environ, {"PY_TOKEN": "test_token"}):
        config = Config.from_env()
        assert config.token == "test_token"


def test_config_from_env_file(tmp_path):
    """Test creating config from env file."""
    env_file = tmp_path / ".env"
    env_file.write_text("PY_TOKEN=file_token")
    
    config = Config.from_env(str(env_file))
    assert config.token == "file_token"


def test_config_precedence(tmp_path):
    """Test configuration source precedence."""
    env_file = tmp_path / ".env"
    env_file.write_text("PY_TOKEN=file_token")
    
    # Environment variable should take precedence
    with patch.dict(os.environ, {"PY_TOKEN": "env_token"}):
        config = get_config(str(env_file))
        assert config.token == "env_token"


def test_invalid_config_file():
    """Test handling of invalid config file."""
    with pytest.raises(ConfigError):
        Config.from_env("/nonexistent/path")
