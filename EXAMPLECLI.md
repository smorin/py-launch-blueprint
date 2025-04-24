<!--
Copyright (c) 2025, Steve Morin

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
-->
## Features

- 🔍 Fuzzy search for project names
- 🏢 Filter by workspace
- 📋 Multiple output formats (text, JSON, CSV)
- 📎 Clipboard integration
- 🎨 Rich terminal UI with color support
- 🔐 Secure token handling
- ⚡ Fast and efficient pagination

## Installation

### From PyPI

```bash
pip install py-launch-blueprint
```

### From Source

```bash
git clone https://github.com/smorin/py-launch-blueprint.git
cd py-launch-blueprint
pip install -e ".[dev]"  # Install with development dependencies
```

### Direct Usage

You can also run the script directly:

```bash
python projects.py --help
```

## Configuration

The tool supports multiple ways to provide your Py Personal Access Token (PAT), in order of precedence:

1. Command-line argument: `--token`
2. Environment variable: `PY_TOKEN`
3. Configuration file: `~/.config/py-launch-blueprint/.env`

### Setting Up Configuration File

1. Create the config directory:
```bash
mkdir -p ~/.config/py-launch-blueprint
```

2. Create `.env` file:
```bash
echo "PY_TOKEN=your_token_here" > ~/.config/py-launch-blueprint/.env
```

3. Set proper permissions:
```bash
chmod 600 ~/.config/py-launch-blueprint/.env
```

## Usage

### Basic Usage

```bash
# Search for projects
py-projects

# Filter by workspace
py-projects --workspace "My Workspace"

# Limit results
py-projects --limit 50
```

### Output Formats

```bash
# JSON output
py-projects --format json

# CSV output
py-projects --format csv

# Copy to clipboard
py-projects --copy

# Save to file
py-projects --output projects.txt
```

### Additional Options

```bash
# Show verbose output
py-projects --verbose

# Disable colors
py-projects --no-color

# Show help
py-projects --help

# Show version
py-projects --version
```

## Error Codes

- 0: Successful execution
- 1: Configuration error
- 2: Authentication error
- 3: API error
- 4: Input/Output error
- 5: User interrupt
