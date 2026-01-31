# Cursor Subagents

This directory contains custom subagent configurations for Cursor IDE.

## What are Subagents?

Subagents are independent agents specialized to handle discrete parts of a task. They:
- Run in parallel for faster completion
- Use their own context and instructions
- Can be specialized for specific domains
- Are configurable with custom prompts and tool access

## Creating a Subagent

Create a markdown file in this directory with your agent configuration:

```markdown
---
name: my-agent
description: What this agent does
---

# Agent Name

Detailed instructions for the agent...

## Capabilities
- What it can do

## Restrictions
- What it should NOT do
```

## Available Subagents

Currently, this repository defines subagents through the parent `.cursor/rules/` directory. For task-specific agents, see the [GitHub Copilot agents](../../.github/agents/) which provide equivalent functionality.

## Mapping to GitHub Copilot Agents

| Cursor Location | GitHub Copilot Equivalent |
|-----------------|---------------------------|
| `.cursor/agents/` | `.github/agents/` |
| `.cursor/rules/` | Agent file sections |
| `SKILL.md` | Agent commands |

## Resources

- [Cursor Subagents Documentation](https://cursor.com/docs/context/subagents)
- [GitHub Copilot Custom Agents](../../.github/agents/README.md)
- [CURSOR.md](../../CURSOR.md) - Full framework documentation
