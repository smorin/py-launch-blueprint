#!/usr/bin/env python3
import re
import subprocess
import shutil
import sys

def get_contributors() -> list[str]:
    """Get a list of contributors from git log"""
    # Safely resolve git executable path
    git_cmd = shutil.which("git")
    if not git_cmd:
        raise FileNotFoundError("Git executable not found in PATH.")

    try:
        result = subprocess.run(
            [git_cmd, "log", "--format=%aN <%aE>"],
            capture_output=True,
            text=True,
            check=True
        )
    except subprocess.CalledProcessError as e:
        print(f"Error running git log: {e}", file=sys.stderr)
        sys.exit(1)

    contributors: set[str] = {
        line.strip() for line in result.stdout.strip().split('\n') if line.strip()
    }

    return sorted(contributors)

def update_contributors_file(contributors: list[str]) -> None:
    """Update the CONTRIBUTORS.md file with the list of contributors"""
    with open('CONTRIBUTORS.md', encoding='utf-8') as f:
        content = f.read()

    # Create the new contributors section
    contributors_section = '\n'.join(contributors)

    # Update the content between the start and end markers
    pattern = (
        r'(<!-- COG-CONTRIBUTORS-LIST:START -->).*?'
        r'(<!-- COG-CONTRIBUTORS-LIST:END -->)'
    )
    replacement = r'\1\n' + contributors_section + r'\n\2'
    updated_content = re.sub(pattern, replacement, content, flags=re.DOTALL)

    with open('CONTRIBUTORS.md', 'w', encoding='utf-8') as f:
        f.write(updated_content)

def main() -> None:
    contributors = get_contributors()
    update_contributors_file(contributors)
    print(f"Updated CONTRIBUTORS.md with {len(contributors)} contributors")

if __name__ == "__main__":
    main()
