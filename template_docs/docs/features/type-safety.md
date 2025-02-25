# Type Safety

## MyPy Configuration

Static type checking:

```toml
[tool.mypy]
python_version = "3.10"
strict = true
warn_return_any = true
```

## Pylance/Pyright

VS Code integration for real-time type checking.

## Type Hints

Example of type annotations:

```python
from typing import Dict, List, Optional

def process_data(data: List[str]) -> Dict[str, Optional[int]]:
    ...
```
