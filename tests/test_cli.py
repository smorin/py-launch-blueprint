"""Tests for CLI functionality."""

import json
from unittest.mock import Mock, patch

import pytest
from click.testing import CliRunner

from py_launch_blueprint.projects import Config, PyClient, main


@pytest.fixture
def runner():
    """Create a CLI test runner."""
    return CliRunner()


@pytest.fixture
def mock_client():
    """Create a mock Py client."""
    with patch("py_launch_blueprint.projects.PyClient") as mock:
        client = Mock(spec=PyClient)
        mock.return_value = client
        yield client


def test_cli_version(runner):
    """Test CLI version output."""
    result = runner.invoke(main, ["--version"])
    assert result.exit_code == 0
    assert "version" in result.output.lower()


def test_cli_output_file(runner, mock_client, tmp_path):
    """Test writing output to file."""
    project_data = {
        "id": "1",
        "name": "Test Project",
        "workspace": {"name": "Test Workspace"},
    }
    mock_client.get_projects.return_value = [project_data]

    output_file = tmp_path / "output.json"

    with patch(
        "py_launch_blueprint.projects.get_config", return_value=Config(token="test")
    ):
        with patch("questionary.checkbox") as mock_checkbox:
            mock_checkbox.ask.return_value = [project_data]
            result = runner.invoke(main, ["--output", str(output_file)])
            assert result.exit_code == 0
            assert output_file.exists()
            assert json.loads(output_file.read_text()) == [project_data]
