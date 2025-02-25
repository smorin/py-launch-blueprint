# Usage Guide

This guide covers the various ways to use the `py-launch-blueprint` CLI tool effectively.

## Basic Usage

The basic command syntax is:

```bash
py-projects [options]
```

### Simple Search

To search for projects with default settings:

```bash
py-projects
```

### Workspace Filtering

Filter projects by specific workspace:

```bash
py-projects --workspace "My Workspace"
```

### Result Limiting

Control the number of results returned:

```bash
py-projects --limit 50
```

## Output Options

### Format Selection

The tool supports multiple output formats:

```bash
# JSON output
py-projects --format json

# CSV output
py-projects --format csv
```

### Output Handling

Direct the results to different destinations:

```bash
# Copy to system clipboard
py-projects --copy

# Save to a file
py-projects --output projects.txt
```

## Advanced Options

### Display Settings

Control the output appearance:

```bash
# Enable verbose logging
py-projects --verbose

# Disable colored output
py-projects --no-color
```

### Information Commands

Access tool information:

```bash
# Display help menu
py-projects --help

# Show version information
py-projects --version
```

## Troubleshooting

If you encounter issues, check the exit code. Here's what they mean:

| Exit Code | Meaning | Common Solution |
|-----------|---------|-----------------|
| 0 | Success | No action needed |
| 1 | Configuration Error | Check your config file and settings |
| 2 | Authentication Error | Verify your PAT token |
| 3 | API Error | Check API status and network connection |
| 4 | Input/Output Error | Verify file permissions and paths |
| 5 | User Interrupt | No action needed (user cancelled) |

## Environment Variables

The tool respects the following environment variables:

- `PY_TOKEN`: Your Personal Access Token
- `PY_CONFIG_PATH`: Custom configuration file path (optional)

## Tips and Best Practices

1. Always use `--verbose` when troubleshooting issues
2. Consider using `--format json` for programmatic processing
3. Use `--copy` for quick sharing of results
4. Combine filters for more precise results:
   ```bash
   py-projects --workspace "Dev" --limit 10 --format json
   ```
