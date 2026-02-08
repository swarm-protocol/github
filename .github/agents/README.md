# GitHub Copilot Custom Agents - Quick Reference

Specialized AI assistants for specific development tasks. **For complete documentation, see [AGENTS.md](../../AGENTS.md).**

## Quick Start

### 1. Create agents directory
```bash
mkdir -p .github/agents
```

### 2. Copy and customize a template
```bash
cp TEMPLATE.agent.md your-agent-name.agent.md
# Edit the file: name, description, instructions
```

### 3. Use your agent
```
@your-agent-name help me with this task
```

## Available Templates

| Template | Status | Purpose |
|----------|--------|---------|
| **TEMPLATE.agent.md** | Blank | Create custom agents from scratch |
| **test-specialist.agent.md** | ✅ Ready | Write comprehensive tests |
| **documentation-expert.agent.md** | ✅ Ready | Create documentation and READMEs |
| **code-reviewer.agent.md** | ✅ Ready | Review code quality and security |
| **refactoring-assistant.agent.md** | ✅ Ready | Safe code refactoring |
| **documentation-builder.agent.md** | ✅ Ready | Build docs from templates |
| **docker-specialist.agent.md** | ✅ Ready | Docker & Kubernetes expert |
| **ansible-specialist.agent.md** | ✅ Ready | Ansible automation expert |

## YAML Front Matter (Required)

```yaml
---
name: your-agent-name
description: Brief description of what this agent does
---
```

**Optional properties**: `tools`, `target`, `infer`, `mcp-servers`

See [AGENTS.md - YAML Configuration Reference](../../AGENTS.md#yaml-configuration-reference) for details.

## Quick Tips

- ✅ **DO**: Be specific, provide examples, set boundaries
- ✅ **DO**: Test agents before sharing with team
- ❌ **DON'T**: Create "do everything" agents
- ❌ **DON'T**: Leave YAML commented out

## Organization-Wide Agents

Create a `.github-private` repository in your organization with `.github/agents/` directory. All organization repositories can use these agents.

## Complete Documentation

📖 **[AGENTS.md](../../AGENTS.md)** - Comprehensive guide covering:
- GitHub Copilot custom agents
- Cursor agent framework
- n8n agent framework  
- YAML configuration reference
- Agent ideas and use cases
- Troubleshooting guide
- Official resources and tutorials

📘 **[README.md](../../README.md)** - Main project documentation

## Official Resources

- [GitHub Copilot Docs](https://docs.github.com/copilot)
- [Creating Custom Agents](https://docs.github.com/copilot/how-tos/use-copilot-agents/coding-agent/create-custom-agents)
- [Best Practices](https://github.blog/ai-and-ml/github-copilot/how-to-write-a-great-agents-md-lessons-from-over-2500-repositories/)
