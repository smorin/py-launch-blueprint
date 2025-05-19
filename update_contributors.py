#!/usr/bin/env python3
# Copyright 2025 Steve Morin
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# SPDX-License-Identifier: Apache-2.0

# ruff: noqa: S603
import re
import subprocess


def get_contributors() -> list[str]:
    """Get a list of contributors from git log"""
    # Using appropriate git command based on platform
    git_cmd = "git"  # Default command
    result = subprocess.run(
        [git_cmd, "log", "--format=%aN <%aE>"],
        capture_output=True,
        text=True,
        check=True,
    )

    # Get unique contributors
    contributors: set[str] = set()
    for line in result.stdout.strip().split("\n"):
        if line.strip():
            contributors.add(line.strip())

    # Sort contributors alphabetically
    return sorted(contributors)


def update_contributors_file(contributors: list[str]) -> None:
    """Update the CONTRIBUTORS.md file with the list of contributors"""
    with open("CONTRIBUTORS.md") as f:
        content = f.read()

    # Create the new contributors section
    contributors_section = "\n".join(contributors)

    # Update the content between the start and end markers
    pattern = (
        r"(<!-- COG-CONTRIBUTORS-LIST:START -->).*"
        r"(<!-- COG-CONTRIBUTORS-LIST:END -->)"
    )
    replacement = r"\1\n" + contributors_section + r"\n\2"
    updated_content = re.sub(pattern, replacement, content, flags=re.DOTALL)

    with open("CONTRIBUTORS.md", "w") as f:
        f.write(updated_content)


def main() -> None:
    contributors = get_contributors()
    update_contributors_file(contributors)
    print(f"Updated CONTRIBUTORS.md with {len(contributors)} contributors")


if __name__ == "__main__":
    main()
