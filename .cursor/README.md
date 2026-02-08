# Cursor Configuration

This directory contains [Cursor](https://cursor.com) editor configurations for AI-assisted development.

## Directory Structure

```
.cursor/
 README.md           # This file
 rules/              # Project-specific rules for Cursor agents
    general.md      # General project rules
    testing.md      # Testing-specific rules
    documentation.md # Documentation rules
    code-review.md  # Code review rules
 agents/             # Custom subagent configurations
     README.md       # Agent configuration guide
```

## Rules

Rules in `.cursor/rules/` provide persistent instructions that shape how Cursor agents work with your code. They are automatically applied based on file glob patterns.

### Available Rules

| Rule File | Purpose | Glob Pattern |
|-----------|---------|--------------|
| `general.md` | General project standards and commands | `**/*` |
| `testing.md` | Testing best practices | `**/*.test.*`, `**/*.spec.*`, `**/test/**`, `**/tests/**`, `**/__tests__/**` |
| `documentation.md` | Documentation standards | `**/*.md`, `docs/**/*` |
| `code-review.md` | Code review guidelines | `**/*` |

## Agents

Custom subagents in `.cursor/agents/` define specialized AI assistants for specific tasks.

## Usage

When using Cursor IDE:
1. Rules are automatically loaded based on file patterns
2. Use `/` commands to invoke custom skills
3. Use `Shift+Tab` to toggle Plan Mode for complex tasks

## Related Documentation

- [CURSOR.md](../CURSOR.md) - Complete Cursor agent framework documentation
- [.github/agents/](../.github/agents/) - GitHub Copilot agent definitions
- [AGENTS.md](../AGENTS.md) - Navigation hub for all agent documentation

## Resources

- [Cursor Documentation](https://cursor.com/docs)
- [Rules Documentation](https://cursor.com/docs/context/rules)
- [Subagents Documentation](https://cursor.com/docs/context/subagents)
