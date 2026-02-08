<!--
This is a template file for creating GitHub Copilot custom agents.

IMPORTANT: Custom agents MUST have uncommented YAML front matter to work!
- The file must be in .github/agents/ directory
- The file must end with .agent.md
- The YAML front matter must NOT be commented out
- The description field is REQUIRED

To use this template:
1. Copy this file and rename it to your-agent-name.agent.md
2. Uncomment the YAML front matter and agent instructions (remove <!-- and -->)
3. Customize the name, description, and other YAML properties
4. Customize the agent instructions below the YAML
5. Commit the file to your repository's default branch

For more information, see: https://docs.github.com/copilot/how-tos/use-copilot-agents/coding-agent/create-custom-agents
-->

<!--

---
name: your-agent-name
description: A concise description of what this agent specializes in (REQUIRED - e.g., "Expert in React testing" or "Python code reviewer")
# Optional YAML properties:
# tools: ["read", "edit", "search", "execute", "agent", "web", "todo"]  # Omit to enable all tools
# target: vscode  # or github-copilot (default: both)
# infer: true  # Auto-select agent based on context
# mcp-servers:  # MCP server configurations (org/enterprise only)
#   github:
#     read: true
#     write: false
---

# Agent Role and Expertise

You are a [ROLE] specialized in [SPECIFIC DOMAIN]. Your expertise includes:

- [Key responsibility 1]
- [Key responsibility 2]
- [Key responsibility 3]
- [Key responsibility 4]

## Commands

List the exact commands this agent should run or be aware of:

```bash
# Build command
npm run build

# Test command
npm test

# Lint command
npm run lint

# Other relevant commands
[Add your commands here]
```

## Code Style and Conventions

Provide specific code examples that demonstrate your preferred style:

```[language]
// Example of well-formatted code following project conventions
// Include comments explaining important patterns
[Your code example here]
```

### Key Style Rules

- [Style rule 1]
- [Style rule 2]
- [Style rule 3]

## Testing Requirements

Specify how tests should be written and executed:

- Test framework: [e.g., Jest, pytest, JUnit]
- Test location: [e.g., `__tests__` folder, `tests/` directory]
- Naming convention: [e.g., `*.test.js`, `test_*.py`]
- Coverage requirements: [e.g., minimum 80% coverage]

Example test structure:
```[language]
[Your test example here]
```

## Project Context

### Stack and Tools

- Language: [e.g., TypeScript, Python]
- Framework: [e.g., React, Django]
- Build tool: [e.g., Webpack, Vite]
- Package manager: [e.g., npm, pip]
- Version control: Git

### File Structure

```
project-root/
├── src/           # [Description]
├── tests/         # [Description]
├── docs/          # [Description]
└── config/        # [Description]
```

## Boundaries and Restrictions

Clearly define what this agent should NOT do:

- ❌ Never modify files in [restricted directories]
- ❌ Never commit secrets or sensitive information
- ❌ Never modify [specific files that should remain unchanged]
- ❌ Never [other restrictions]
- Only work on files in [allowed directories]
- Only make changes related to [specific scope]

## Git Workflow

Define commit and PR conventions:

### Commit Messages

Follow this format:
```
type(scope): brief description

Longer description if needed
```

Types: feat, fix, docs, style, refactor, test, chore

### Pull Request Process

1. [Step 1]
2. [Step 2]
3. [Step 3]

## Best Practices

- [Best practice 1]
- [Best practice 2]
- [Best practice 3]

## Examples

### Example 1: [Use case]

Input:
```
[Example input]
```

Expected output:
```
[Example output]
```

### Example 2: [Another use case]

Input:
```
[Example input]
```

Expected output:
```
[Example output]
```

## Additional Resources

- [Link to documentation]
- [Link to coding standards]
- [Link to other relevant resources]

-->
