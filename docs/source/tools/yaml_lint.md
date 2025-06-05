# YAML Formatting with yamlfmt

## Introduction
Our project uses YAML files extensively for configuration, GitHub Actions workflows, and issue templates. To ensure consistent formatting and catch syntax/style issues early, we use `yamlfmt` - a single, powerful tool that handles both linting and formatting.

---

**Key Benefits**:
* ✅ **Single Tool**: `yamlfmt` handles both linting AND formatting - no conflicts!
* 🎨 **Automatic Formatting**: Consistent YAML style across all files
* 🚀 **Fast Performance**: Go-based tool for speed and reliability
* 🔧 **Highly Configurable**: Customizable rules via `.yamlfmt` configuration
* 🤖 **Pre-commit Integration**: Runs automatically on every commit
* 💻 **No Node.js Required**: Pure Go binary, simpler dependency management
* 🛡️ **GitHub Actions Compatible**: Tested with workflow files

---

## ⚙️ Getting Started

### Prerequisites
Install Go and yamlfmt:
```bash
# Install Go (if not already installed)
just install-go

# Install yamlfmt
just install-yamlfmt

```

---

## Usage

### **Format all YAML files:**
```bash
just format-yaml
```
*Automatically fixes formatting in all `.yml` and `.yaml` files*

### **Check for formatting issues:**
```bash
just lint-yaml
```
*Shows detailed output of any formatting problems*

### **Verify formatting is clean:**
```bash
just check-yaml
```
*Quick pass/fail check with success message*

---

## 🛠 Configuration

### yamlfmt Configuration (`.yamlfmt`)

---

## 🔄 Pre-commit Integration

YAML formatting runs automatically on every commit via `pre-commit`:

- The `yamllint` hook validates `.yaml` and `.yml` files automatically.
- Prevents commits with YAML syntax/style errors.
- Ensures codebase consistency and reduces manual reviews.

Example `.pre-commit-config.yaml` snippet for YAML linting:

```yaml
repos:
  - repo: https://github.com/google/yamlfmt
    rev: v0.13.0  # Use latest version
    hooks:
      - id: yamlfmt
        name: "Format YAML files"
        files: \.ya?ml$
```

---

## 🛑 Disabling or Skipping YAML Linting

- To skip linting temporarily, use the `--no-verify` flag on `git commit`.
- To disable rules, edit `.yamlfmt`.
- To remove linting completely, remove related pre-commit hooks and `just` commands.

---

## 📚 References

* [📘 yamlfmt GitHub Repository](https://github.com/google/yamlfmt)
* [🛠 yamlfmt Configuration Options](https://github.com/google/yamlfmt#configuration)
* [🔧 Our yamlfmt Configuration](.yamlfmt)
* [🚀 Pre-commit Integration](https://pre-commit.com/)
