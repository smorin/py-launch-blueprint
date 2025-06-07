# Troubleshooting: Cross-Platform Contributor List Generation

## 🧩 Issue Summary
Automated generation of the `CONTRIBUTORS.md` file was unreliable across operating systems. There was no unified command to update the list of contributors, causing inconsistencies and requiring manual updates. This was particularly problematic for teammates working on different platforms (e.g., Windows and Unix-like systems).

## 🔍 Root Cause / Investigation
- **Initial Assumption:** The project lacked a standard, automated way to update `CONTRIBUTORS.md`, causing the list to be outdated or missing contributors.
- **What Was Discovered:**
  - No clear "contributor update" step was present in the `Justfile`.
  - Existing scripts for updating the contributors list were either missing or not cross-platform.
  - Some teammates on Windows could not run Unix shell scripts, and vice versa.
- **Tools/Commands Used for Debugging:**
  - Checked the presence of `scripts/update_contributors.sh` and `scripts/update_contributors.ps1`.
  - Manually ran `git log --format='%aN' | sort -u` to verify contributor names.
  - Reviewed the `Justfile` and script directories for existing automation.

## 🛠️ Solution
- **What Fixed the Issue:**
  - Added a `contributor-update` recipe to the `Justfile` that automatically detects the OS and runs either a Bash or PowerShell script to update `CONTRIBUTORS.md`.
  - Introduced a new Bash script `scripts/update_contributors.sh` that generates the `CONTRIBUTORS.md` file using `git log`.
- **Key Code/Config Changes:**

### Justfile Addition:
```just
# Contributors update (cross-platform Bash/PowerShell)
contributor-update:
    if [ "$OS" = "Windows_NT" ]; then \
        if [ -f scripts/update_contributors.ps1 ]; then \
            powershell -ExecutionPolicy Bypass -File scripts/update_contributors.ps1; \
        else \
            echo "⚠️ PowerShell script not found. Falling back to Bash script..."; \
            if [ ! -f scripts/update_contributors.sh ]; then \
                echo "❌ Error: Bash script not found at scripts/update_contributors.sh"; \
                exit 1; \
            fi; \
            bash scripts/update_contributors.sh; \
        fi; \
    else \
        if [ ! -f scripts/update_contributors.sh ]; then \
            echo "❌ Error: Bash script not found at scripts/update_contributors.sh"; \
            exit 1; \
        fi; \
        ./scripts/update_contributors.sh; \
    fi
 scripts/update_contributors.sh:
#!/bin/bash
set -e

echo "✅ Generating CONTRIBUTORS.md from Git history..."

{
  echo "# Contributors"
  echo
  git log --format='%aN' | sort -u | while read name; do
    echo "- $name"
  done
} > CONTRIBUTORS.md

echo "✅ CONTRIBUTORS.md updated." ```

### Justfile Addition:
1. The automation is OS-aware: it chooses PowerShell on Windows and Bash elsewhere.
2. If one script is missing, it tries to fall back to another (if possible), and exits with an error if neither exists.
3. The script expects to be run from the project root and for the scripts to exist at scripts/update_contributors.sh (and optionally .ps1 for Windows).
4. Contributors are listed by Git commit author name—if users commit with different names/emails, they may appear multiple times.
5. The generated CONTRIBUTORS.md will always be overwritten, not appended to.

### 🧪 How to Test or Reproduce
Ensure you have a recent clone of the repo with multiple contributors in the Git history.
Run:
sh
just contributor-update
or, on Windows (if you have PowerShell):
PowerShell
just contributor-update
Verify that CONTRIBUTORS.md is created or updated, listing all unique commit author names in Markdown format.
Rename or remove the scripts to test error handling and see the error messages.

### 💬 Extra Notes
If you want to support Windows with PowerShell, consider adding a matching scripts/update_contributors.ps1 script (not included in this PR).
Reference: git log documentation
This automation helps ensure all contributors are acknowledged and keeps the list up to date with minimal effort.
