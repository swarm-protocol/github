# Agent Prompts for Source Code Directory

This file contains instructions and prompts for AI coding agents working in the `src/` directory.

## Agent Selection by Task

### Code Development
- **@refactoring-assistant**: For refactoring existing code
- **@code-reviewer**: For code review and quality
- **@security-auditor**: For security audits and vulnerability remediation
- **@test-specialist**: For writing tests

### Language-Specific Tasks
- **JavaScript/TypeScript**: General purpose agents
- **Python**: General purpose agents  
- **Bash**: @docker-specialist for containerized scripts
- **Infrastructure**: @docker-specialist or terraform tools

## Tasks and Prompts

### 1. Agent Implementation (`src/agents/`)

**Create New Agent:**
```
@refactoring-assistant create a new agent in src/agents/ that extends base agent functionality
```

**Refactor Agent Code:**
```
@refactoring-assistant refactor src/agents/custom-agent.js to improve modularity
```

**Review Agent:**
```
@code-reviewer review src/agents/ for security and best practices
```

### 2. Utility Functions (`src/utils/`)

**Create Utility:**
```
@refactoring-assistant create utility functions in src/utils/ for file operations
```

**Add Tests:**
```
@test-specialist write unit tests for src/utils/file-utils.js
```

**Review Code:**
```
@code-reviewer check src/utils/ for potential bugs and security issues
```

### 3. Automation Scripts (`src/scripts/`)

**Create Script:**
```
@docker-specialist create a deployment script in src/scripts/
```

**Improve Script:**
```
@refactoring-assistant optimize src/scripts/deploy.sh for better error handling
```

**Test Script:**
```
@test-specialist create integration tests for src/scripts/
```

## Code Quality Guidelines

### JavaScript/TypeScript

**Style:**
```javascript
// Use ES6+ features
import { helper } from './utils/helpers.js';

/**
 * Function description
 * @param {string} param - Parameter description
 * @returns {Promise<object>} Return description
 */
export async function myFunction(param) {
  // Implementation
  return result;
}
```

**Testing:**
```javascript
import { describe, it, expect } from 'vitest';
import { myFunction } from './myFunction.js';

describe('myFunction', () => {
  it('should handle valid input', async () => {
    const result = await myFunction('test');
    expect(result).toBeDefined();
  });
});
```

### Python

**Style:**
```python
"""Module description."""

from typing import Optional, Dict, Any

def my_function(param: str) -> Dict[str, Any]:
    """
    Function description.
    
    Args:
        param: Parameter description
        
    Returns:
        Dictionary containing results
    """
    return {"result": param}
```

**Testing:**
```python
import pytest
from mymodule import my_function

def test_my_function():
    """Test my_function with valid input."""
    result = my_function("test")
    assert "result" in result
```

### Bash

**Style:**
```bash
#!/usr/bin/env bash
set -euo pipefail

# Function description
# Arguments:
#   $1 - Parameter description
# Returns:
#   Exit code 0 on success
my_function() {
  local param="$1"
  echo "Processing: ${param}"
}
```

## Agent Commands by Language

### JavaScript/TypeScript
```bash
# Create new module
@refactoring-assistant create a new JavaScript module in src/agents/

# Add type definitions
@refactoring-assistant add TypeScript types to src/utils/

# Refactor to async/await
@refactoring-assistant convert src/agents/legacy.js to use async/await

# Write tests
@test-specialist create Jest tests for src/agents/custom-agent.js
```

### Python
```bash
# Create module
@refactoring-assistant create a Python module in src/utils/

# Add type hints
@refactoring-assistant add type hints to src/agents/processor.py

# Refactor classes
@refactoring-assistant refactor src/agents/agent.py to use dataclasses

# Write tests
@test-specialist create pytest tests for src/utils/
```

### Bash Scripts
```bash
# Create deployment script
@docker-specialist create a deployment script in src/scripts/

# Improve error handling
@refactoring-assistant add error handling to src/scripts/deploy.sh

# Add logging
@refactoring-assistant add logging to src/scripts/setup.sh

# Test scripts
@test-specialist create bats tests for src/scripts/
```

## Code Review Checklist

Before committing code:

- [ ] Follows style guide for language
- [ ] Includes documentation (JSDoc, docstrings)
- [ ] Has unit tests with good coverage
- [ ] Passes linting and formatting checks
- [ ] No hardcoded secrets or credentials
- [ ] Error handling implemented
- [ ] Logging added for debugging
- [ ] Performance optimized
- [ ] Security reviewed

## Security Considerations

Use **@security-auditor** to check for:

```bash
# Check for security issues
@security-auditor scan src/ for security vulnerabilities

# Check for secrets
@security-auditor verify no credentials in src/

# Review dependencies
@security-auditor check dependencies for known vulnerabilities

# Validate input handling
@security-auditor review input validation in src/agents/
```

## Performance Optimization

Use **@refactoring-assistant** for:

```bash
# Optimize algorithms
@refactoring-assistant optimize performance of src/utils/processor.js

# Reduce complexity
@refactoring-assistant simplify complex functions in src/agents/

# Improve efficiency
@refactoring-assistant refactor src/scripts/ for better efficiency
```

## Testing Strategy

Use **@test-specialist** for:

```bash
# Unit tests
@test-specialist write unit tests for all functions in src/utils/

# Integration tests
@test-specialist create integration tests for src/agents/

# E2E tests
@test-specialist write end-to-end tests for src/scripts/

# Test edge cases
@test-specialist add edge case tests to src/
```

## Deployment Scripts

Common automation tasks:

```bash
# Environment setup
src/scripts/setup-environment.sh

# Deployment
src/scripts/deploy.sh production

# Database migration
src/scripts/migrate.py --version latest

# Health check
src/scripts/health-check.sh
```

## Development Workflow

1. **Plan**: Define requirements and design
2. **Implement**: Write code following guidelines
3. **Test**: Write and run tests
4. **Review**: Use @code-reviewer for security and quality
5. **Refactor**: Use @refactoring-assistant for improvements
6. **Document**: Update documentation and comments
7. **Commit**: Commit with clear message

## Resources

- [JavaScript Best Practices](https://github.com/goldbergyoni/nodebestpractices)
- [Python Style Guide (PEP 8)](https://pep8.org/)
- [Bash Best Practices](https://bertvv.github.io/cheat-sheets/Bash.html)
- [Clean Code Principles](https://github.com/ryanmcdermott/clean-code-javascript)
