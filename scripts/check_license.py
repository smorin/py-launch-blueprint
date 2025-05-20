#!/usr/bin/env python3
# Copyright 2025 Steve Morin
#
# MIT License
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

import subprocess
import sys
from pathlib import Path

extensions = [".py", ".sh", ".go"]
excluded_dirs = {".git", ".venv", "vendor"}

 def should_include(path: Path) -> bool:
-    return path.suffix in extensions and not any(part in excluded_dirs for part in path.parts)
+    return (path.suffix in extensions and 
+            not any(part in excluded_dirs for part in path.parts))

files = [str(p) for p in Path(".").rglob("*") if p.is_file() and should_include(p)]
if not files:
    sys.exit(0)

result = subprocess.run(
    ["addlicense", "-check", "-c", "Steve Morin", "-l", "mit", "-y", "2025", "-s", "-v", *files]
)
sys.exit(result.returncode)
