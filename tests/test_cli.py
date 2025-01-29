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


def test_cli_help(runner):
    """Test CLI help output."""
    result = runner.invoke(main, ["--help"])
    assert result.exit_code == 0
    assert "Search and select Py projects." in result.output


def test_cli_version(runner):
    """Test CLI version output."""
    result = runner.invoke(main, ["--version"])
    assert result.exit_code == 0
    assert "version" in result.output.lower()


def test_cli_no_token(runner):
    """Test CLI behavior with no token."""
    with patch("py_launch_blueprint.projects.get_config", return_value=Config()):
        result = runner.invoke(main)
        assert result.exit_code == 1
        assert "No Py token provided" in result.output


def test_cli_with_token(runner, mock_client):
    """Test CLI with token provided."""
    # Mock project data
    mock_client.get_projects.return_value = [
        {"id": "1", "name": "Test Project", "workspace": {"name": "Test Workspace"}}
    ]

    # Run with token
    with patch(
        "py_launch_blueprint.projects.get_config", return_value=Config(token="test")
    ):
        with patch("questionary.checkbox") as mock_checkbox:
            mock_checkbox.ask.return_value = []  # No selection
            result = runner.invoke(main, ["--token", "test"])
            assert result.exit_code == 0


def test_cli_workspace_filter(runner, mock_client):
    """Test CLI with workspace filter."""
    with patch(
        "py_launch_blueprint.projects.get_config", return_value=Config(token="test")
    ):
        with patch("questionary.checkbox") as mock_checkbox:
            mock_checkbox.ask.return_value = []
            result = runner.invoke(main, ["--workspace", "Test"])
            assert result.exit_code == 0
            mock_client.get_projects.assert_called_with(
                workspace_name="Test", limit=200
            )


def test_cli_output_formats(runner, mock_client):
    """Test different output formats."""
    project_data = {
        "id": "1",
        "name": "Test Project",
        "workspace": {"name": "Test Workspace"},
    }
    mock_client.get_projects.return_value = [project_data]

    with patch(
        "py_launch_blueprint.projects.get_config", return_value=Config(token="test")
    ):
        with patch("questionary.checkbox") as mock_checkbox:
            mock_checkbox.ask.return_value = [project_data]

            # Test JSON format
            result = runner.invoke(main, ["--format", "json"])
            assert result.exit_code == 0
            json.loads(result.output)  # Should be valid JSON

            # Test CSV format
            result = runner.invoke(main, ["--format", "csv"])
            assert result.exit_code == 0
            assert "id,name" in result.output

            # Test text format
            result = runner.invoke(main, ["--format", "text"])
            assert result.exit_code == 0
            assert "1" in result.output


def test_cli_output_file(runner, mock_client, tmp_path):
    """Test writing output to file."""
    project_data = {
        "id": "1",
        "name": "Test Project",
        "workspace": {"name": "Test Workspace"},
    }
    mock_client.get_projects.return_value = [project_data]

    output_file = tmp_path / "output.txt"

    with patch(
        "py_launch_blueprint.projects.get_config", return_value=Config(token="test")
    ):
        with patch("questionary.checkbox") as mock_checkbox:
            mock_checkbox.ask.return_value = [project_data]
            result = runner.invoke(main, ["--output", str(output_file)])
            assert result.exit_code == 0
            assert output_file.exists()
            assert output_file.read_text().strip() == "1"


@patch("pyperclip.copy")
def test_cli_copy_to_clipboard(mock_copy, runner, mock_client):
    """Test copying output to clipboard."""
    project_data = {
        "id": "1",
        "name": "Test Project",
        "workspace": {"name": "Test Workspace"},
    }
    mock_client.get_projects.return_value = [project_data]

    with patch(
        "py_launch_blueprint.projects.get_config", return_value=Config(token="test")
    ):
        with patch("questionary.checkbox") as mock_checkbox:
            mock_checkbox.ask.return_value = [project_data]
            result = runner.invoke(main, ["--copy"])
            assert result.exit_code == 0
            mock_copy.assert_called_with("1")
