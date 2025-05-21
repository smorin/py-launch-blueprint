# License Header Check

## Overview

This feature ensures that all source code files in the repository include a standard MIT license header. It uses the [`addlicense`](https://github.com/google/addlicense) tool to validate and fix license headers automatically.

---

## Tool Configuration

The license check is configured in `.pre-commit-config.yaml` and supports both local pre-commit checks and CI enforcement.

### 📦 Install `addlicense`

Make sure Go is installed and then run:

```bash
go install github.com/google/addlicense@latest
