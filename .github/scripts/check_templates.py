#!/usr/bin/env python3
"""Script to enforce GitHub issue and PR templates."""

import sys
from typing import NoReturn


def check_template(body: str) -> NoReturn:
    """Check if the provided body follows the template.

    Args:
        body: The content to check against the template
    """
    if not body or "<!-- Please follow the template" in body:
        print("❌ Issue or PR does not follow the required template!")
        sys.exit(1)
    sys.exit(0)


if __name__ == "__main__":
    # Sample check - in practice this would read from git commit/PR
    check_template("Sample Issue Body")
