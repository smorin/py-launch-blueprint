
## mypy
Most teams today actually run both mypy and pyright/Pylance:

- mypy in CI/pre-commit hooks for strict checking
- Pylance in VS Code for real-time development feedback

This combination provides comprehensive type checking coverage while maintaining a smooth development experience.

Let me explain the difference between `disallow_untyped_defs = false` vs `true`:

**disallow_untyped_defs = true**
```python
# This will raise an error
def process_data(data):  # Error: Function is missing type annotations
    return data + 1

# This is required instead
def process_data(data: int) -> int:
    return data + 1
```

**disallow_untyped_defs = false**
```python
# This is allowed
def process_data(data):
    return data + 1

# This is also allowed
def process_data(data: int) -> int:
    return data + 1
```

**When to use each:**

Use `true` when:
- Starting a new project
- Working on a codebase that's fully committed to type hints
- Want to ensure complete type coverage
- Have a team that's comfortable with Python type hints

Use `false` when:
- Gradually adding types to a legacy codebase
- Working with test files (common to disable for tests)
- Training team members who are new to type hints
- Need to temporarily bypass type checking for specific modules

**Best Practice Recommendation:**
Start new projects with `true` for maximum type safety. For existing projects, use `false` initially and gradually enable it as you add type hints to the codebase. Many teams set it to `false` for test files but `true` for production code.

VS Code Settings for pyright/Pylance
```json
{
    "python.analysis.typeCheckingMode": "strict",
    "python.analysis.diagnosticMode": "workspace",
    "python.analysis.autoImportCompletions": true,
    "python.analysis.importFormat": "relative",
    "python.analysis.inlayHints.functionReturnTypes": true,
    "python.analysis.inlayHints.variableTypes": true
}
```

Common Type Annotation Examples
```python
from typing import Dict, List, Optional, Tuple, Union, TypeVar, Generic

# Basic type annotations
def greet(name: str) -> str:
    return f"Hello {name}"

# Optional parameters
def fetch_user(user_id: Optional[int] = None) -> Dict[str, Union[str, int]]:
    ...

# Generic types
T = TypeVar('T')
class Stack(Generic[T]):
    def __init__(self) -> None:
        self.items: List[T] = []

    def push(self, item: T) -> None:
        self.items.append(item)

    def pop(self) -> T:
        return self.items.pop()

# Type aliases
UserId = int
UserDict = Dict[UserId, Dict[str, Union[str, int]]]

# Callable types
from typing import Callable
Handler = Callable[[str, int], bool]

def process(handler: Handler) -> None:
    ...
```