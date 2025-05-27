# 📄 License Header Check

## 🧾 Introduction

The **License Header Check** feature ensures that every source file in the repository includes a standard MIT license header.
We leverage the [`addlicense`](https://github.com/google/addlicense) tool to automatically validate and insert license headers, keeping the codebase compliant and consistent.

---

## 📦 Tool Configuration

The license header check integrates with both **pre-commit hooks** and **CI/CD workflows** to catch missing or outdated headers early in development.

---

## 🧰 Installation

Ensure you have Go installed, then run:

```bash
just install-addlicense
```

This just recipe installs addlicense into your local Go bin directory.

## ⚙️ Justfile Variables
Defined at the top of the Justfile for maintainability:

```
# Directories and file types to check/fix
license-targets := "py_launch_blueprint tests docs/source/_templates *.py *.sh"

# License metadata
license-copyright := "Steve Morin"
license-year      := "2025"
license-type      := "mit"
```

## 🚀 Quick Example
Create a sample script without a license header:
```
echo '#!/usr/bin/env python3
print("Hello, world!")' > example.py
```

Run the check:
```
just check-license
```

Since example.py lacks a header, addlicense will report missing license text.

To auto-insert the header:
```
just fix-license
```

Re-run the check to confirm:
```
just check-license
```
## 💻 Usage in CI/CD
Format (fix) headers: ```just fix-license```

- **Format (fix) headers**: \`just fix-license\`
- **Validate headers**: \`just check-license\`

In ```.github/workflows/ci.yaml```, we install addlicense and then run:

```
- name: Install addlicense
  run: just install-addlicense

- name: License header check
  run: just check-license
\`\`\`

---

## 🛠 Recommended Configuration
Pre-commit hook in .pre-commit-config.yaml:
```
repos:
  - repo: local
    hooks:
      - id: addlicense
        name: Add license headers
        entry: addlicense
        language: system
        types: [python, text, yaml, json, toml]
        args:
          - --check
          - -l
          - mit
          - -y
          - "2025"
          - --copyright
          - "Copyright (c) 2025, Steve Morin"
        exclude: ^addlicense/testdata/.*
```

**CI setup** in \`.github/workflows/ci.yaml\` already invokes \`just check-license\` after installing the tool.

---

## 🛑 Disabling License Checks

Skip pre-commit: use ``` --no-verify``` in git commit.

Remove license rules:
1. Delete the ```addlicense``` hook from ```.pre-commit-config.yaml```
2. Remove the ```just``` targets from ```Justfile```.

## 📚 References
addlicense GitHub
pre-commit-hooks
Just – A Command Runner
