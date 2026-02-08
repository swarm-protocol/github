<!-- 
Template Variables:
- {{PROJECT_NAME}}: Name of the project
- {{DESCRIPTION}}: Short description
- {{DATE}}: Last updated date
- {{REPOSITORY_STRUCTURE}}: Directory tree
- {{TECH_STACK}}: Technologies used

This is a template for AGENTS.md - a comprehensive AI agent framework and context file
-->

# {{PROJECT_NAME}} - AI Agent Framework & Repository Navigation

**Last Updated**: {{DATE}}

> 🤖 **For GitHub Copilot, Cursor, n8n & AI Assistants**: This file provides comprehensive documentation for AI agent frameworks and serves as a complete repository sitemap.

---

## 📋 Purpose

This unified documentation helps AI assistants and developers:
1. **Understand AI Agent Frameworks** - GitHub Copilot, Cursor, n8n, and other platforms
2. **Navigate** the entire repository structure efficiently
3. **Build and Deploy** custom agents for various platforms
4. **Execute** common development commands and workflows
5. **Reference** all available documentation quickly

---

## Project Overview

{{DESCRIPTION}}

This repository provides a comprehensive collection of templates and examples for creating AI agents across multiple platforms including GitHub Copilot, Cursor, and n8n. It helps developers and teams create specialized AI assistants that follow project-specific conventions and best practices.

**Purpose**: To provide reusable, well-documented templates and frameworks for AI agents that can be easily customized for any project or organization.

**Tech Stack**: {{TECH_STACK}}

## Architecture

This is a documentation-focused repository containing template files and frameworks for AI agents. The architecture is simple:

1. **Agent Templates** (`.github/agents/`) - Markdown files with YAML front matter for GitHub Copilot
2. **Cursor Configuration** (`.cursor/`) - Rules, skills, and subagents for Cursor IDE
3. **Documentation** - Comprehensive guides and examples for multiple AI frameworks
4. **Examples** - Pre-built agents demonstrating different specializations

### Directory Structure

```
{{REPOSITORY_STRUCTURE}}
```

## Key Components

### GitHub Copilot Agent Format

Each agent is defined in a `.agent.md` file with:

1. **YAML Front Matter**:
```yaml
---
name: agent-name
description: Brief description of what the agent does
---
```

2. **Markdown Content**: Instructions, commands, examples, boundaries

### Cursor Configuration

Cursor agents are configured through:
- **Rules** (`.cursor/rules/`) - Static context and guidelines
- **Skills** (`SKILL.md`) - Dynamic capabilities and workflows
- **Subagents** (`.cursor/agents/`) - Specialized parallel agents

### n8n Workflows

n8n agents are built using:
- **AI Agent Node** - Core autonomous decision-making
- **Tool Sub-nodes** - Capabilities the agent can use
- **Memory Nodes** - Context persistence
- **Vector Stores** - RAG capabilities

## Agent Types Included

### 1. TEMPLATE.agent.md
Blank template with all sections - starting point for custom agents.

### 2. test-specialist.agent.md (ready to use)
Focuses on writing tests without modifying production code.

### 3. documentation-expert.agent.md (ready to use)
Specializes in creating documentation, READMEs, and guides.

### 4. code-reviewer.agent.md (ready to use)
Reviews code for quality, security, and best practices.

### 5. refactoring-assistant.agent.md (ready to use)
Helps with safe code refactoring.

### 6. documentation-builder.agent.md (ready to use)
Builds README.md and AGENTS.md from templates.

### 7. docker-specialist.agent.md (ready to use)
Expert in Docker, Dockerfiles, docker-compose, and Kubernetes YAML.

### 8. ansible-specialist.agent.md (ready to use)
Expert in Ansible automation, playbooks, roles, and infrastructure configuration management.

## Development Workflow

### For Users

1. Browse available templates in `.github/agents/` and `.cursor/`
2. Copy a template or use a ready-made agent
3. Customize for specific needs (if using template)
4. Commit to repository
5. Invoke with `@agent-name` in GitHub Copilot or use in Cursor

### For Contributors

1. Create new agent following TEMPLATE.agent.md structure
2. Test the agent in real scenarios
3. Document use cases and examples
4. Submit pull request
5. Update main README and documentation

## File Naming Conventions

- Agent files: `agent-name.agent.md` (kebab-case)
- Documentation: `UPPERCASE.md` for main docs
- Templates: `name.template.md` suffix
- Symlinks: `CLAUDE.md`, `CURSOR.md`, `N8N.md`, `GEMINI.md`, `QWEN.md` → `AGENTS.md`

## Important Context

### GitHub Copilot Custom Agents

Custom agents are specialized AI assistants that:
- Work within GitHub Copilot
- Follow specific instructions defined in `.agent.md` files
- Can be repository-specific or organization-wide
- Are invoked with `@agent-name` in Copilot Chat

### Cursor Agents

Cursor agents provide:
- Static context through Rules
- Dynamic capabilities through Skills
- Parallel execution through Subagents
- External tool integration through MCP

### n8n Agents

n8n agents enable:
- Visual workflow automation
- Multi-agent collaboration
- RAG (Retrieval-Augmented Generation)
- Integration with 400+ services

### Agent Activation

**GitHub Copilot:**
- **Repository level**: Store in `.github/agents/` in the repo
- **Organization level**: Store in `.github-private` repo's `.github/agents/`
- Must be on default branch
- File must end with `.agent.md`
- YAML front matter must be valid

**Cursor:**
- Rules in `.cursor/rules/`
- Skills as `SKILL.md` files
- Subagents in `.cursor/agents/`
- MCP configuration in `mcp.json`

**n8n:**
- Self-hosted or cloud deployment
- Visual workflow editor
- Agent node + tool sub-nodes

## Best Practices

1. **Specialization**: One agent should do one thing well
2. **Examples**: Provide concrete code examples
3. **Boundaries**: Explicitly state what agent should NOT do
4. **Commands**: List exact commands to run
5. **Testing**: Test agents in real scenarios before sharing
6. **Documentation**: Keep comprehensive notes on agent capabilities

## Common Tasks

### Creating a New Agent Template

1. Copy `TEMPLATE.agent.md`
2. Rename to `your-agent-name.agent.md`
3. Update YAML front matter (name, description)
4. Customize all sections:
   - Role and expertise
   - Commands
   - Code style with examples
   - Boundaries
   - Best practices
5. Test the agent
6. Add to README files
7. Commit and push

### Using an Existing Agent

1. Copy agent file to your repo's `.github/agents/`
2. Customize if needed
3. Commit to default branch
4. Wait a few minutes for GitHub to process
5. Use with `@agent-name` in Copilot Chat

### Building Documentation from Templates

Use the `documentation-builder` agent:

1. Create `README.template.md` and `AGENTS.template.md`
2. Add template variables like `{{PROJECT_NAME}}`
3. Invoke: `@documentation-builder generate README.md from template`
4. Review and commit generated files

## Known Issues

None currently. This is a documentation-only repository with no code to execute.

## Future Plans

- Add more specialized agent templates
- Create video tutorials
- Build a template validator
- Add interactive examples
- Expand framework coverage (add more AI platforms)

## Template Variables Reference

When using the `documentation-builder` agent, these variables are commonly used:

- `{{PROJECT_NAME}}` - Name of the project
- `{{DESCRIPTION}}` - Short description
- `{{VERSION}}` - Current version
- `{{DATE}}` - Current date (ISO format)
- `{{REPOSITORY_STRUCTURE}}` - Directory tree
- `{{TECH_STACK}}` - Technologies used
- `{{LICENSE}}` - License type
- `{{AUTHOR}}` - Author name

## Additional Notes for AI Assistants

When working with this repository:

1. **Respect agent boundaries**: Each agent has specific restrictions
2. **Follow naming conventions**: Use kebab-case for agent names
3. **Maintain structure**: Keep consistent sections across agents
4. **Test before committing**: Verify agents work as expected
5. **Document thoroughly**: Include examples and explanations
6. **Keep it simple**: Templates should be easy to understand and use
7. **Framework awareness**: Understand differences between GitHub Copilot, Cursor, n8n, and other platforms

This repository is primarily documentation, so there's no build process, tests, or runtime code to worry about. Focus on clear writing, good examples, and helpful instructions.
