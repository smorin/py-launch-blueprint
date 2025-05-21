## Introduction

The **License Header Check** feature ensures that every source file in the repository includes a standard MIT license header. We leverage the [addlicense](https://github.com/google/addlicense) tool to automatically validate and insert license headers, keeping your codebase compliant and consistent.

---

## 📦 Tool Configuration

The license header check integrates with both **pre-commit** and **CI/CD** workflows to catch missing or outdated headers early.

### Installation

Ensure you have Go installed, then run:

\`\`\`bash
just install-addlicense
\`\`\`

This \`just\` recipe installs \`addlicense\` into your local Go bin directory.

### Justfile Variables

Defined at the top of \`Justfile\` for maintainability:

\`\`\`makefile
# Directories and file types to check/fix
license-targets := "py_launch_blueprint tests docs/source/_templates *.py *.sh *.go"

# License metadata
license-copyright := "Steve Morin"
license-year      := "2025"
license-type      := "mit"
\`\`\`

---

## 🚀 Quick Example

Create a sample script without a license header:

\`\`\`bash
echo '#!/usr/bin/env python3
print("Hello, world!")' > example.py
\`\`\`

Run the check:

\`\`\`bash
just check-license
\`\`\`

Since \`example.py\` lacks a header, \`addlicense\` will report missing license text.

To auto-insert the header:

\`\`\`bash
just fix-license
\`\`\`

Re-run the check to confirm:

\`\`\`bash
just check-license
\`\`\`

---

## 💻 Usage in CI/CD

- **Format (fix) headers**: \`just fix-license-direct\`
- **Validate headers**: \`just check-license-direct\`

In \`.github/workflows/ci.yaml\`, we install \`addlicense\` and then run:

\`\`\`yaml
- name: License header check
  run: just check-license-direct
\`\`\`

---

## 🛠 Recommended Configuration

**Pre-commit hook** in \`.pre-commit-config.yaml\`:

\`\`\`yaml
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
\`\`\`

**CI setup** in \`.github/workflows/ci.yaml\` already invokes \`just check-license-direct\` after installing the tool.

---

## 🛑 Disabling License Checks

- **Skip pre-commit**: use \`--no-verify\` in \`git commit\`.
- **Remove rules**: delete the \`addlicense\` hook from \`.pre-commit-config.yaml\` and remove the \`just\` targets from \`Justfile\`.

---

## 📚 References

- [addlicense GitHub](https://github.com/google/addlicense)
- [pre-commit-hooks](https://github.com/pre-commit/pre-commit-hooks)
- [Just – A Command Runner](https://github.com/casey/just)
`;

writeFileSync(target, content);
console.log(`Created ${target}`);
