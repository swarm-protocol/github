# GitHub Copilot Custom Agents Templates - Claude AI Context

**Last Updated**: 2026-01-30

## Project Overview

A comprehensive collection of templates and examples for creating GitHub Copilot custom agents.

This repository provides a comprehensive collection of templates and examples for creating GitHub Copilot custom agents. It helps developers and teams create specialized AI assistants that follow project-specific conventions and best practices.

**Purpose**: To provide reusable, well-documented templates for GitHub Copilot custom agents that can be easily customized for any project or organization.

**Tech Stack**: Markdown, YAML, GitHub Copilot

## Architecture

This is a documentation-focused repository containing template files for GitHub Copilot custom agents. The architecture is simple:

1. **Agent Templates** (`.github/agents/`) - Markdown files with YAML front matter
2. **Documentation** - README, guides, and examples
3. **Examples** - Pre-built agents demonstrating different specializations

### Directory Structure

```
.
├── .github/
│   └── agents/
│       ├── README.md
│       ├── TEMPLATE.agent.md
│       ├── code-reviewer.agent.md
│       ├── docker-specialist.agent.md
│       ├── documentation-builder.agent.md
│       ├── documentation-expert.agent.md
│       ├── refactoring-assistant.agent.md
│       └── test-specialist.agent.md
├── CLAUDE.md (this file)
├── CLAUDE.template.md
├── CONTRIBUTING.md
├── DOCUMENTATION-BUILDER-USAGE.md
├── LICENSE
├── QUICKSTART.md
├── README.md
└── README.template.md
```

## Key Components

### Agent File Format

Each agent is defined in a `.agent.md` file with:

1. **YAML Front Matter**:
```yaml
---
name: agent-name
description: Brief description of what the agent does
---
```

2. **Markdown Content**: Instructions, commands, examples, boundaries

### Template Structure

Agents follow this structure:
- Role and expertise definition
- Commands to execute
- Code style guidelines with examples
- Testing requirements
- Project context
- Boundaries and restrictions
- Git workflow
- Best practices
- Real-world examples

## Agent Types Included

### 1. TEMPLATE.agent.md
Blank template with all sections - starting point for custom agents.

### 2. test-specialist.agent.md (ready to use)
Focuses on writing tests without modifying production code - uncommented and production-ready.

### 3. documentation-expert.agent.md (ready to use)
Specializes in creating documentation, READMEs, and guides - uncommented and production-ready.

### 4. code-reviewer.agent.md (ready to use)
Reviews code for quality, security, and best practices - uncommented and production-ready.

### 5. refactoring-assistant.agent.md (ready to use)
Helps with safe code refactoring - uncommented and production-ready.

### 6. documentation-builder.agent.md (ready to use)
Builds README.md and CLAUDE.md from templates - uncommented and production-ready.

### 7. docker-specialist.agent.md (ready to use)
Expert in Docker, Dockerfiles, docker-compose, and Kubernetes YAML - uncommented and production-ready.

## Development Workflow

### For Users

1. Browse available templates in `.github/agents/`
2. Copy a template or use a ready-made agent
3. Customize for specific needs (if using template)
4. Commit to repository
5. Invoke with `@agent-name` in GitHub Copilot

### For Contributors

1. Create new agent following TEMPLATE.agent.md structure
2. Test the agent in real scenarios
3. Document use cases and examples
4. Submit pull request
5. Update main README and agent README

## Coding Standards

### Markdown Formatting

- Use consistent heading levels
- Include code blocks with syntax highlighting
- Use emoji sparingly and meaningfully
- Keep line length reasonable (no hard limit)
- Use bullet points for lists
- Include examples for all concepts

### YAML Front Matter

- Use kebab-case for agent names (e.g., `test-specialist`)
- Keep descriptions concise (under 100 characters)
- Required fields: `name` and `description`

### Agent Instructions

- Be specific and actionable
- Provide concrete examples
- Define clear boundaries (what NOT to do)
- Include command examples
- Show code style preferences
- Explain the "why" behind practices

## File Naming Conventions

- Agent files: `agent-name.agent.md` (kebab-case)
- Documentation: `UPPERCASE.md` for main docs
- Templates: `name.template.md` suffix

## Important Context

### GitHub Copilot Custom Agents

Custom agents are specialized AI assistants that:
- Work within GitHub Copilot
- Follow specific instructions defined in `.agent.md` files
- Can be repository-specific or organization-wide
- Are invoked with `@agent-name` in Copilot Chat

### Agent Activation

- **Repository level**: Store in `.github/agents/` in the repo
- **Organization level**: Store in `.github-private` repo's `.github/agents/`
- Must be on default branch
- File must end with `.agent.md`
- YAML front matter must be valid

### Best Practices

1. **Specialization**: One agent should do one thing well
2. **Examples**: Provide concrete code examples
3. **Boundaries**: Explicitly state what agent should NOT do
4. **Commands**: List exact commands to run
5. **Testing**: Test agents in real scenarios before sharing

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
2. For commented agents: Remove `<!--` and `-->`
3. Customize if needed
4. Commit to default branch
5. Wait a few minutes for GitHub to process
6. Use with `@agent-name` in Copilot Chat

### Building Documentation from Templates

Use the `documentation-builder` agent:

1. Create `README.template.md` and `CLAUDE.template.md`
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
- Create agent template generator tool

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

## Additional Notes for Claude

When working with this repository:

1. **Respect agent boundaries**: Each agent has specific restrictions
2. **Follow naming conventions**: Use kebab-case for agent names
3. **Maintain structure**: Keep consistent sections across agents
4. **Test before committing**: Verify agents work as expected
5. **Document thoroughly**: Include examples and explanations
6. **Keep it simple**: Templates should be easy to understand and use

This repository is primarily documentation, so there's no build process, tests, or runtime code to worry about. Focus on clear writing, good examples, and helpful instructions.
