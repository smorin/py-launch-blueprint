# Issue and Pull Request Template Guide

This guide explains how to effectively use our issue and pull request templates.

## Issue Templates

### Question Template
Use this template when:
- You have questions about using the project
- You need clarification about features
- You want to understand the project better

Example:
```markdown
### Your Question
How do I configure custom output formats?

### Context
I'm trying to generate CSV output but the default JSON format isn't suitable for my needs.

### What I've Tried
- Checked the documentation
- Tried the --format flag
```

### Documentation Template
Use this template when:
- You find unclear or outdated documentation
- You want to suggest documentation improvements
- You notice missing documentation

Example:
```markdown
### Documentation Area
Installation guide

### Issue Description
Missing information about Windows installation steps

### Suggested Changes
Add a new section covering:
- Windows prerequisites
- Installation commands
- Common issues
```

## Pull Request Templates

### Feature PR Template
Use this template when:
- Adding new features
- Enhancing existing functionality
- Making significant changes

Example:
```markdown
### Feature Description
Added CSV output format support

### Breaking Changes
None

### Documentation Updates
- Added CSV format to output formats guide
- Updated CLI documentation
```

### Bug Fix PR Template
Use this template when:
- Fixing reported bugs
- Addressing issues
- Making corrections

Example:
```markdown
### Related Issue
Fixes #123

### Fix Implementation
- Added null check for config
- Updated error handling
- Added test cases
```

### Documentation PR Template
Use this template when:
- Updating documentation
- Adding new guides
- Fixing documentation errors

Example:
```markdown
### Documentation Changes
- Updated installation guide
- Added Windows-specific instructions
- Fixed broken links
```

### Dependency Update PR Template
Use this template when:
- Updating dependencies
- Upgrading versions
- Managing package requirements

Example:
```markdown
### Updated Dependencies
- pytest 7.3.1 -> 7.4.0
- requests 2.28.1 -> 2.29.0

### Breaking Changes
None
```

## Template Enforcement

Our automated enforcement ensures consistent issue and PR quality:

### Pre-commit Hook
The pre-commit hook validates:
- Template structure
- Required sections
- Formatting

### GitHub Actions
Our GitHub Actions workflow:
1. Validates template usage
2. Checks required sections
3. Enforces formatting
4. Provides feedback

## Best Practices

1. **Choose the Right Template**
   - Select based on primary purpose
   - One issue/PR per concern
   - When in doubt, use the more specific template

2. **Provide Complete Information**
   - Fill all required sections
   - Be specific and clear
   - Include context and examples

3. **Follow Template Structure**
   - Keep the original headings
   - Don't remove sections
   - Add sections if needed

4. **Use Labels and References**
   - Add relevant labels
   - Reference related issues/PRs
   - Tag relevant team members
