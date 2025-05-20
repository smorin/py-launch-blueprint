#!/usr/bin/env python3
# Copyright 2025 Your Org
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
