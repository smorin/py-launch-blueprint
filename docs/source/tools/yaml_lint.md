
# YAML Linting & Formatting with yamllint + Prettier

## Introduction
Our project uses YAML files extensively for configuration. To ensure consistent formatting and catch syntax/style issues early, we use `yamllint` for linting and `Prettier` for formatting. Additionally, a custom fixer script normalizes boolean values for compatibility.

---

**Key Benefits**:

* ✅ **Consistent YAML Style**: Enforced by `yamllint` with project-specific rules.
* 🎨 **Automatic Formatting**: `Prettier` formats YAML files for readability and uniformity.
* 🔧 **Boolean Normalization**: Custom script converts `yes/no` to `true/false` to avoid common YAML pitfalls.
* 🤖 **Pre-commit Integration**: Runs linting automatically on every commit to catch errors before push.
* 🚀 **Easy to Use**: Commands available via `just` for install, lint, format, and fix.

---

## ⚙️ Getting Started

### Installation
Install Prettier and dependencies:

```bash
just install-prettier-yaml
```

---

## Usage

**Format all YAML files:**

```bash
just format-yaml
```

**Lint all YAML files:**

```bash
just lint-yaml
```

**Fix boolean values and format YAML:**

```bash
just fix-yaml
```

---

## 🛠 Recommended Configuration

Add a `.yamllint.yml` file with the following content:

```yaml
extends: default

ignore: |
  .venv/**
  node_modules/**
  dist/**
  build/**

rules:
  truthy:
    level: error

  line-length:
    max: 120
    allow-non-breakable-words: true
    allow-non-breakable-inline-mappings: true

  document-start: disable

  indentation:
    spaces: 2
    indent-sequences: consistent

  trailing-spaces: enable

  comments:
    level: warning

  comments-indentation:
    level: warning

  empty-lines:
    max: 1
```

**Prettier formatting is configured in `.prettierrc.yaml` as:**

```json
{
  "printWidth": 120,
  "tabWidth": 2,
  "useTabs": false,
  "proseWrap": "always",
  "singleQuote": false
}
```

---

## 🔄 Pre-commit Integration

YAML linting runs on every commit via `pre-commit`:

- The `yamllint` hook validates `.yaml` and `.yml` files automatically.
- Prevents commits with YAML syntax/style errors.
- Ensures codebase consistency and reduces manual reviews.

Example `.pre-commit-config.yaml` snippet for YAML linting:

```yaml
repos:
  - repo: https://github.com/adrienverge/yamllint
    rev: v1.37.1
    hooks:
      - id: yamllint
        files: \.ya?ml$
```

---

## 🛑 Disabling or Skipping YAML Linting

- To skip linting temporarily, use the `--no-verify` flag on `git commit`.
- To disable rules, edit `.yamllint.yml`.
- To remove linting completely, remove related pre-commit hooks and `just` commands.

---

## 📚 References

* [📘 yamllint Documentation](https://yamllint.readthedocs.io/en/stable/)
* [🛠 Prettier YAML Plugin](https://prettier.io/docs/en/plugins.html#yaml)
* [🐍 Custom YAML fixer script](scripts/fix_yaml.py)
