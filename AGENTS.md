# AGENTS.md - AI Agent Framework & Repository Navigation

> **For GitHub Copilot & AI Assistants**: This file provides comprehensive documentation for AI agent frameworks (GitHub Copilot, Cursor, n8n) and serves as a complete repository sitemap. Read this file to understand the AI agent architecture, framework capabilities, and repository structure.

**Last Updated**: 2026-02-08

---

## Purpose

This unified documentation helps AI assistants and developers:
1. **Understand AI Agent Frameworks** - GitHub Copilot, Cursor, and n8n capabilities
2. **Navigate** the entire repository structure efficiently
3. **Build and Deploy** custom agents for various platforms
4. **Execute** common development commands and workflows
5. **Reference** all available documentation quickly

---

## Table of Contents

1. [GitHub Copilot Custom Agents](#github-copilot-custom-agents)
2. [Cursor Agent Framework](#cursor-agent-framework)
3. [n8n AI Agent Framework](#n8n-ai-agent-framework)
4. [Repository Documentation Sitemap](#documentation-sitemap)
5. [Common Bash Commands](#common-bash-commands)
6. [Getting Started](#getting-started-quick-commands)

---

# GitHub Copilot Custom Agents

## Project Overview

A comprehensive collection of templates and examples for creating GitHub Copilot custom agents.

This repository provides templates and examples for creating GitHub Copilot custom agents. It helps developers and teams create specialized AI assistants that follow project-specific conventions and best practices.

**Purpose**: To provide reusable, well-documented templates for GitHub Copilot custom agents that can be easily customized for any project or organization.

**Tech Stack**: Markdown, YAML, GitHub Copilot

## Architecture

This is a documentation-focused repository containing template files for GitHub Copilot custom agents. The architecture is simple:

1. **Agent Templates** (`.github/agents/`) - Markdown files with YAML front matter
2. **Documentation** - README, guides, and examples
3. **Examples** - Pre-built agents demonstrating different specializations

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
Builds README.md and AGENTS.md from templates - uncommented and production-ready.

### 7. docker-specialist.agent.md (ready to use)
Expert in Docker, Dockerfiles, docker-compose, and Kubernetes YAML - uncommented and production-ready.

### 8. ansible-specialist.agent.md (ready to use)
Expert in Ansible automation, playbooks, roles, and infrastructure configuration management.

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

## GitHub Copilot Custom Agent Activation

- **Repository level**: Store in `.github/agents/` in the repo
- **Organization level**: Store in `.github-private` repo's `.github/agents/`
- Must be on default branch
- File must end with `.agent.md`
- YAML front matter must be valid

## YAML Configuration Reference

**⚠️ CRITICAL:** The YAML front matter MUST NOT be commented out! Custom agents require valid YAML to work.

### Required Properties

```yaml
---
name: your-agent-name
description: A brief description of what this agent does (REQUIRED)
---
```

### All Available Properties

| Property | Required | Description | Example |
|----------|----------|-------------|---------|
| `name` | Yes | Display name for the agent | `test-specialist` |
| `description` | **Yes** | Agent's purpose and specialization | `"Expert in writing tests"` |
| `tools` | No | List of available tools (omit for all tools) | `["read", "edit", "search"]` |
| `target` | No | Where agent runs: `vscode`, `github-copilot`, or both | `vscode` |
| `infer` | No | Auto-select agent based on context | `true` |
| `mcp-servers` | No | MCP server configurations (org/enterprise only) | See below |

### Available Tool Aliases

- `execute` - Run shell commands
- `read` - Read files
- `edit` - Modify files
- `search` - Search codebase
- `agent` - Call other agents
- `web` - Web requests
- `todo` - Task management

### Example Configurations

**Example with Optional Properties:**
```yaml
---
name: python-test-expert
description: Expert in Python testing with pytest and unittest
tools: ["read", "edit", "execute"]
target: vscode
infer: true
---
```

**Example with MCP Servers (Enterprise/Org only):**
```yaml
---
name: github-integration-agent
description: Agent with GitHub API access
mcp-servers:
  github:
    read: true
    write: false
---
```

**Important naming rules:**
- Use only letters, numbers, hyphens, and underscores
- Keep it descriptive but concise
- Example: `python-test-expert`, `api-documentation-writer`

## Best Practices

1. **Specialization**: One agent should do one thing well
2. **Examples**: Provide concrete code examples
3. **Boundaries**: Explicitly state what agent should NOT do
4. **Commands**: List exact commands to run
5. **Testing**: Test agents in real scenarios before sharing

## Using the Documentation-Builder Agent

The `documentation-builder` agent generates README.md and AGENTS.md files from templates with variable substitution.

### Quick Example

#### Step 1: Create Template Files

Create template files with placeholders (e.g., `my-readme.template.md`):

```markdown
# {{PROJECT_NAME}}

{{DESCRIPTION}}

Version: {{VERSION}}
Last Updated: {{DATE}}
```

#### Step 2: Invoke the Agent

In GitHub Copilot Chat:

```
@documentation-builder Generate README.md and AGENTS.md from the template files. 
Use these values:
- PROJECT_NAME: "My Awesome Project"
- DESCRIPTION: "A tool that does amazing things"
- VERSION: "1.0.0"
- DATE: "2026-02-08"
```

#### Step 3: Review Generated Files

The agent will:
1. Read the template files
2. Replace all `{{VARIABLE}}` placeholders
3. Generate README.md and AGENTS.md
4. Validate the markdown

### Advanced Usage

**Using Package.json Values**:
```
@documentation-builder Generate docs from templates, extracting 
PROJECT_NAME and VERSION from package.json
```

**Preserving Custom Sections**:
Add special markers in your generated files to preserve manual edits:

```markdown
<!-- BEGIN CUSTOM SECTION -->
This content won't be replaced during regeneration.
<!-- END CUSTOM SECTION -->
```

**Multiple Template Sources**:
```
@documentation-builder Combine header.template.md, features.template.md, 
and footer.template.md into README.md
```

### Available Variables

Common template variables:

- `{{PROJECT_NAME}}` - Project name
- `{{DESCRIPTION}}` - Short description
- `{{VERSION}}` - Version number
- `{{DATE}}` - Current date
- `{{LICENSE}}` - License type
- `{{AUTHOR}}` - Author name
- `{{REPOSITORY_STRUCTURE}}` - Directory tree
- `{{TECH_STACK}}` - Technologies used

### Tips

1. **Backup First**: Always commit before regenerating
2. **Test Variables**: Check that all variables are replaced
3. **Validate Output**: Use markdown linter to check syntax
4. **Preserve Custom Content**: Use special markers for manual sections
5. **Version Control**: Keep templates in version control

### Troubleshooting

**Variables Not Replaced**

If you see `{{VARIABLE}}` in output:
- Check variable name spelling
- Ensure value was provided to the agent
- Verify template file has correct syntax

**Markdown Invalid**

If generated markdown has issues:
- Run `npx markdownlint README.md` to check
- Verify template syntax is valid
- Check for unescaped special characters

**Agent Not Found**

If `@documentation-builder` doesn't work:
- Ensure file is in `.github/agents/`
- File must be named `documentation-builder.agent.md`
- Must be committed to default branch
- Wait a few minutes for GitHub to process

### Real-World Example

This repository uses the documentation-builder agent to maintain consistency between README.md and AGENTS.md, allowing easy updates through template processing.

## Protocol: Generating QUICKSTART.md for Any Codebase

This protocol provides step-by-step instructions for generating a QUICKSTART.md file for any codebase by analyzing its README.md and AGENTS.md files. Use the `@documentation-builder` or `@documentation-expert` agents to execute this protocol.

### Purpose

A QUICKSTART.md file helps new users get started with a codebase in under 5 minutes by providing:
- Minimal setup instructions
- Simple working examples
- Common troubleshooting tips
- Links to comprehensive documentation

### Protocol Steps

#### Step 1: Analyze README.md

Read the codebase's README.md and extract:

1. **Project name and description** (first heading and paragraph)
2. **Prerequisites** (system requirements, dependencies)
3. **Installation steps** (package managers, build commands)
4. **Quick start examples** (minimal working code)
5. **Key features** (main capabilities users need to know)
6. **Documentation links** (where to find more detailed info)

**Example extraction:**
```markdown
From README.md:
- Project: "MyApp - A fast API framework"
- Prerequisites: Node.js 18+, npm 9+
- Install: npm install myapp
- Basic usage: import { App } from 'myapp'; new App().start();
```

#### Step 2: Analyze AGENTS.md (if present)

If the codebase has an AGENTS.md file, extract:

1. **Development environment setup** (Nix, Docker, APT packages)
2. **Common bash commands** (build, test, lint, run)
3. **Agent-specific workflows** (which agents to use for what tasks)
4. **Repository structure** (key directories and their purposes)

**Example extraction:**
```markdown
From AGENTS.md:
- Environment: nix develop or npm install
- Build: npm run build
- Test: npm test
- Agents: @test-specialist for tests, @code-reviewer for reviews
```

#### Step 3: Structure the QUICKSTART.md

Organize content into these sections:

```markdown
# Quick Start Guide: [Project Name]

> Get up and running with [Project Name] in under 5 minutes.

## Prerequisites

- [List system requirements]
- [List required tools/dependencies]

## Installation

### Option 1: [Recommended method]
\`\`\`bash
[Installation commands]
\`\`\`

### Option 2: [Alternative method]
\`\`\`bash
[Alternative commands]
\`\`\`

## Your First [Project Type]

### Step 1: [Initial setup]
\`\`\`bash
[Setup commands]
\`\`\`

### Step 2: [Create basic example]
\`\`\`[language]
[Minimal working code example]
\`\`\`

### Step 3: [Run/test]
\`\`\`bash
[Run commands]
\`\`\`

**Expected output:**
\`\`\`
[What users should see]
\`\`\`

## Common First-Time Issues

### Issue: [Common problem]
**Solution:** [How to fix it]

### Issue: [Another common problem]
**Solution:** [How to fix it]

## Next Steps

- [Link to full documentation]
- [Link to tutorials]
- [Link to API reference]
- [Link to examples]

## Need Help?

- [Link to issues/discussions]
- [Link to community chat]
- [Link to contributing guide]
```

#### Step 4: Write Section Content

For each section, follow these guidelines:

**Prerequisites:**
- List only essential requirements, not nice-to-haves
- Include version numbers
- Mention OS-specific requirements

**Installation:**
- Provide copy-paste commands
- Show the fastest/easiest method first
- Include verification steps (e.g., `--version` checks)

**First [Project Type]:**
- Use the simplest possible example that works
- Show complete, runnable code
- Include expected output
- Keep it under 20 lines of code

**Common Issues:**
- Only include issues that 50%+ of new users encounter
- Provide specific, actionable solutions
- Link to detailed troubleshooting if needed

**Next Steps:**
- Prioritize links by user journey
- Link to progressive learning resources
- Keep to 4-5 most important links

#### Step 5: Validate the QUICKSTART.md

Check that the generated file:

1. **Can be completed in 5 minutes** - Time yourself
2. **Requires no prior knowledge** - Assume user is brand new
3. **Uses copy-paste commands** - Every command should work as-is
4. **Has working examples** - Test every code example
5. **Links work** - Verify all referenced documentation exists
6. **Matches README.md** - Ensure consistency with main docs

### Protocol Examples

#### Example 1: Web Framework QUICKSTART.md

```markdown
# Quick Start Guide: FastAPI

> Get up and running with FastAPI in under 5 minutes.

## Prerequisites

- Python 3.7 or higher
- pip package manager

## Installation

\`\`\`bash
pip install fastapi[all]
\`\`\`

## Your First API

### Step 1: Create a file
\`\`\`bash
touch main.py
\`\`\`

### Step 2: Add this code
\`\`\`python
from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def read_root():
    return {"Hello": "World"}
\`\`\`

### Step 3: Run the server
\`\`\`bash
uvicorn main:app --reload
\`\`\`

**Expected output:**
\`\`\`
INFO:     Uvicorn running on http://127.0.0.1:8000
\`\`\`

Visit http://127.0.0.1:8000 in your browser to see `{"Hello": "World"}`

## Common First-Time Issues

### Issue: ModuleNotFoundError: No module named 'fastapi'
**Solution:** Run `pip install fastapi[all]` to install all dependencies

### Issue: Port 8000 already in use
**Solution:** Use a different port: `uvicorn main:app --port 8001`

## Next Steps

- [Full Tutorial](https://fastapi.tiangolo.com/tutorial/)
- [API Documentation](https://fastapi.tiangolo.com/reference/)
- [Deployment Guide](https://fastapi.tiangolo.com/deployment/)

## Need Help?

- [GitHub Discussions](https://github.com/tiangolo/fastapi/discussions)
- [Discord Community](https://discord.gg/fastapi)
```

#### Example 2: CLI Tool QUICKSTART.md

```markdown
# Quick Start Guide: MyTool

> Get up and running with MyTool in under 5 minutes.

## Prerequisites

- Node.js 18+
- npm 9+

## Installation

\`\`\`bash
npm install -g mytool
\`\`\`

## Your First Command

### Step 1: Initialize a project
\`\`\`bash
mytool init my-project
cd my-project
\`\`\`

### Step 2: Run the default task
\`\`\`bash
mytool run
\`\`\`

**Expected output:**
\`\`\`
✓ Task completed successfully
Output: results/output.json
\`\`\`

## Common First-Time Issues

### Issue: Command not found: mytool
**Solution:** Ensure npm global bin is in your PATH:
\`\`\`bash
npm config get prefix  # Check npm prefix
export PATH="$PATH:$(npm config get prefix)/bin"
\`\`\`

### Issue: Permission denied
**Solution:** Run with sudo or fix npm permissions:
\`\`\`bash
sudo npm install -g mytool
\`\`\`

## Next Steps

- [Commands Reference](https://mytool.dev/commands)
- [Configuration Guide](https://mytool.dev/config)
- [Plugin System](https://mytool.dev/plugins)

## Need Help?

- [GitHub Issues](https://github.com/author/mytool/issues)
- [Stack Overflow](https://stackoverflow.com/questions/tagged/mytool)
```

### Agent Invocation Examples

**Using documentation-builder:**
```
@documentation-builder Generate a QUICKSTART.md for this codebase. 
Follow the protocol in AGENTS.md. Extract information from README.md 
and AGENTS.md. Make it completable in under 5 minutes.
```

**Using documentation-expert:**
```
@documentation-expert Create a QUICKSTART.md that helps new users 
get started in 5 minutes. Analyze README.md and AGENTS.md to extract 
setup steps, examples, and common issues. Use the QUICKSTART.md 
protocol from AGENTS.md.
```

### Best Practices

1. **Be Ruthlessly Minimal**: Remove anything that isn't essential for first-time success
2. **Test With Fresh Eyes**: Have someone unfamiliar with the project follow it
3. **Time It**: Actually time how long it takes - should be under 5 minutes
4. **One Path to Success**: Don't show multiple ways, show the fastest way
5. **Copy-Paste Ready**: Every command should work without modification
6. **Show Output**: Include expected output so users know they succeeded
7. **Link, Don't Duplicate**: Link to comprehensive docs instead of repeating them
8. **Update Regularly**: Keep in sync with README.md when installation changes

### Integration with Documentation Workflow

When working with both README.md and QUICKSTART.md:

1. **README.md** = Comprehensive documentation with all features, options, and use cases
2. **QUICKSTART.md** = Minimal path to first success (subset of README.md)
3. **AGENTS.md** = Repository navigation and AI agent framework context

**Relationship:**
```
README.md (comprehensive) 
    ↓ extract minimal path
QUICKSTART.md (5-minute success)
    ↓ reference for details
README.md sections
```

**Maintenance:**
- When README.md installation changes → Update QUICKSTART.md
- When new common issues arise → Add to QUICKSTART.md
- When prerequisites change → Update both files

### Protocol Checklist

Use this checklist when generating QUICKSTART.md:

- [ ] Analyzed README.md for key information
- [ ] Analyzed AGENTS.md for environment setup (if present)
- [ ] Included only essential prerequisites
- [ ] Provided copy-paste installation commands
- [ ] Created minimal working example (under 20 lines)
- [ ] Showed expected output for success verification
- [ ] Documented 2-3 most common first-time issues
- [ ] Linked to comprehensive documentation
- [ ] Tested all commands in fresh environment
- [ ] Timed completion (should be under 5 minutes)
- [ ] Verified all links work
- [ ] Ensured consistency with README.md

## Agent Ideas and Use Cases

Here are ideas for agents you might create to enhance your development workflow:

### Development Agents

- **backend-api-developer**: Backend API development with RESTful best practices
- **frontend-component-builder**: React/Vue/Angular component creation
- **database-migration-specialist**: Database schema changes and migrations
- **performance-optimizer**: Performance analysis and optimization

### Quality Agents

- **security-auditor**: Security vulnerability detection and remediation
- **accessibility-checker**: A11y compliance validation and fixes
- **test-coverage-improver**: Increase test coverage strategically
- **code-quality-enforcer**: Code quality standards and linting

### Documentation Agents

- **api-documenter**: API documentation (OpenAPI, Swagger, etc.)
- **tutorial-writer**: Tutorial and guide creation
- **changelog-maintainer**: Automated changelog maintenance
- **readme-improver**: README quality and completeness improvements

### DevOps Agents

- **ci-cd-specialist**: CI/CD pipeline creation and maintenance
- **docker-expert**: Docker and containerization specialist
- **deployment-helper**: Deployment automation and verification
- **monitoring-setup**: Monitoring, logging, and alerting setup

## Troubleshooting GitHub Copilot Agents

### Agent Not Working?

1. **Check the file name**: Must end with `.agent.md`
2. **Check the location**: Must be in `.github/agents/` directory
3. **Check the YAML**: Must be valid YAML with `name` and `description`
4. **Check it's uncommented**: Remove the `<!--` and `-->` wrapper
5. **Check it's committed**: Must be committed to the repository
6. **Check permissions**: Ensure you have access to use custom agents
7. **Wait for processing**: GitHub may take a few minutes to process new agents

### Agent Not Following Instructions?

1. **Be more specific**: Add concrete examples and clear instructions
2. **Add boundaries**: Explicitly state what NOT to do
3. **Simplify**: Remove conflicting or unclear instructions
4. **Test iteratively**: Make small changes and test again
5. **Provide context**: Include code examples in the agent file

### Can't Find My Agent?

1. Type `@` in Copilot Chat to see available agents
2. Check the agent name matches the YAML `name` field exactly
3. Verify you have access to custom agents (Pro+ subscription required)
4. Ensure the agent file is on the default branch

## Official GitHub Copilot Resources

### Documentation

- [GitHub Copilot Documentation](https://docs.github.com/copilot)
- [Creating Custom Agents](https://docs.github.com/copilot/how-tos/use-copilot-agents/coding-agent/create-custom-agents)
- [Custom Agents Configuration Reference](https://docs.github.com/en/copilot/reference/custom-agents-configuration)
- [About Custom Agents](https://docs.github.com/en/copilot/concepts/agents/coding-agent/about-custom-agents)
- [Custom Agents Template Repository](https://github.com/docs/custom-agents-template)
- [Best Practices Guide](https://github.blog/ai-and-ml/github-copilot/how-to-write-a-great-agents-md-lessons-from-over-2500-repositories/)

### SDKs and Extensions

- [GitHub Copilot SDK](https://github.com/github/copilot-sdk) - Build programmable agents with Node.js, Python, Go, or .NET
- [Copilot Extensions Preview SDK](https://github.com/copilot-extensions/preview-sdk.js/) - Build agent-based extensions
- [Blackbeard Extension Example](https://github.com/copilot-extensions/blackbeard-extension) - Sample pirate-themed agent

### Training and Tutorials

- [Building Applications with GitHub Copilot Agent Mode](https://learn.microsoft.com/en-us/training/modules/github-copilot-agent-mode/) - Microsoft Learn module
- [Quickstart for Extensions Using Agents](https://docs.github.com/en/copilot/tutorials/try-extensions)
- [Building Your First Extension](https://resources.github.com/learn/pathways/copilot/extensions/building-your-first-extension/)
- [VS Code Getting Started with Copilot](https://code.visualstudio.com/docs/copilot/getting-started)
- [GitHub Copilot Tutorials](https://docs.github.com/en/copilot/tutorials)

### Advanced Topics

- [Enhancing Agent Mode with MCP](https://docs.github.com/en/copilot/tutorials/try-extensions) - Model Context Protocol integration
- [Microsoft Agent Framework with Copilot](https://learn.microsoft.com/en-us/agent-framework/user-guide/agents/agent-types/github-copilot-agent)
- [Building Agents with GitHub Copilot SDK](https://techcommunity.microsoft.com/blog/azuredevcommunityblog/building-agents-with-github-copilot-sdk-a-practical-guide-to-automated-tech-upda/4488948)

---

# Cursor Agent Framework

Comprehensive guide for building agent frameworks with **Cursor** - a powerful AI-powered code editor with advanced agent capabilities.

> **This Repository's Configuration**: See [Cursor IDE Configuration](#cursor-ide-configuration-cursor) section below for the actual Cursor configuration used in this repository.

## 1. Cursor Agent Architecture

An agent in Cursor is built on **three core components**:

| Component | Description |
|-----------|-------------|
| **Instructions** | System prompt and rules that guide agent behavior |
| **Tools** | File editing, codebase search, terminal execution, and more |
| **User Messages** | Your prompts and follow-ups that direct the work |

Cursor orchestrates these components for each model, tuning instructions and tools specifically for every frontier model.

**Documentation:** [Agent Overview](https://cursor.com/docs/agent/overview)

## 2. Agent Tools (The Arsenal!)

Here's the complete toolkit available to Cursor agents:

| Tool | Purpose |
|------|---------|
| `list_dir` | List directory contents for understanding project structure |
| `codebase_search` | Semantic search to find features/functions/patterns |
| `read_file` | Read content of a specific file |
| `run_terminal_command` | Execute terminal commands directly |
| `grep_search` | Regex-based text search for patterns |
| `file_search` | Search for files by name |
| `edit_file` | Modify file content |
| `delete_file` | Remove files from project |

**Key Features:**
- Tools are intelligently selected based on the task
- Terminal commands can be executed with full access
- File operations are context-aware and safe

**Documentation:** [Terminal Execution](https://cursor.com/docs/agent/terminal)

## 3. Rules System (Static Context)

Rules provide **persistent instructions** that shape how the agent works with your code.

### File Location

- **Project Rules**: `.cursor/rules/*.mdc` or `.cursor/rules/*.md`
- **Alternative**: `AGENTS.md` in project root for simpler use cases
- **User Rules**: Global to your Cursor environment (in settings)

> ** This Repository's Rules**: See [`.cursor/rules/`](.cursor/rules/) for the actual rules configured in this repository:
> - [`general.md`](.cursor/rules/general.md) - General project standards
> - [`testing.md`](.cursor/rules/testing.md) - Testing best practices
> - [`documentation.md`](.cursor/rules/documentation.md) - Documentation standards
> - [`code-review.md`](.cursor/rules/code-review.md) - Code review guidelines

### Rule File Structure

```markdown
---
description: When to apply this rule
globs: ["**/*.ts", "**/*.tsx"]
---

# Commands
- `npm run build`: Build the project
- `npm run test`: Run tests

# Code Style
- Use ES modules (import/export), not CommonJS
- Destructure imports when possible
- Use TypeScript strict mode
```

### Rule Types

**Project Rules** (`.cursor/rules/`)
- Specific to the current project
- Checked into version control
- Shared with team members

**User Rules** (Cursor settings)
- Global across all projects
- Personal preferences
- Not shared via git

### Best Practices

- Keep rules focused on essentials
- Reference files instead of copying contents
- Check rules into git for team sharing
- Use glob patterns to scope rules to specific file types

**Documentation:** [Rules](https://cursor.com/docs/context/rules)

## 4. Agent Skills (Dynamic Capabilities)

Skills extend what agents can do with **domain-specific knowledge and workflows**.

### What are Skills?

Unlike Rules (always included), Skills are **loaded dynamically** when relevant. They provide:

- **Custom commands**: Reusable workflows triggered with `/` in agent input
- **Hooks**: Scripts that run before/after agent actions
- **Domain knowledge**: Task-specific instructions loaded on demand

### File Location

Create `SKILL.md` files in your project to define skills.

### Hooks Configuration

Configure hooks in `.cursor/hooks.json`:

```json
{
  "version": 1,
  "hooks": {
    "stop": [{ "command": "bun run .cursor/hooks/grind.ts" }]
  }
}
```

**Hooks Enable:**
- Pre-action validation
- Post-action cleanup
- Long-running agent loops that iterate until goals are met
- Custom workflow integration

### Example Use Cases

- **Testing workflow**: Run tests after each change until all pass
- **Linting**: Auto-format code before committing
- **Deployment**: Build and deploy with verification steps
- **Documentation**: Auto-generate docs from code changes

**Documentation:** [Agent Skills](https://cursor.com/docs/context/skills)

## 5. Subagents (Parallel Specialists)

Subagents are **independent agents** specialized to handle discrete parts of a parent agent's task.

### Characteristics

- Run in **parallel** for faster completion
- Use their own context and instructions
- Configurable with custom prompts, tool access, and models
- Can be specialized for specific domains

### Default Subagents

Cursor includes built-in subagents for:
- Researching your codebase
- Running terminal commands
- Executing parallel work streams

### Custom Subagents

**Location:** `.cursor/agents/`

**Configuration:**
- Define custom prompts
- Restrict tool access
- Choose specific models
- Set boundaries and rules

### Best Practices

- Add subagents to version control
- Let Agent help draft initial configuration
- Customize for your specific needs
- Use hooks for file output processing

**Documentation:** [Subagents](https://cursor.com/docs/context/subagents)

## 6. Agent Modes

Agent offers **different modes** optimized for specific tasks:

| Mode | Description | When to Use |
|------|-------------|-------------|
| **Agent Mode** | Full autonomous coding with all tools | Complex implementations, refactoring |
| **Ask Mode** | Searches codebase, provides answers without editing files | Questions, code understanding, research |
| **Plan Mode** | Research → clarify → plan → wait for approval | Large features, architectural changes |

### Mode Details

**Agent Mode**
- Full access to all tools
- Can edit files, run commands
- Autonomous execution
- Best for implementation tasks

**Ask Mode**
- Read-only access
- No file modifications
- Fast research and answers
- Use for questions and exploration

**Plan Mode**
- Creates detailed plans before execution
- Saves plans to `.cursor/plans/`
- Allows review before implementation
- Toggle with `Shift+Tab` in agent input

### Switching Modes

- Use `Shift+Tab` to toggle Plan Mode
- Type `/ask` to switch to Ask mode
- Agent Mode is the default

**Documentation:** [Modes](https://cursor.com/docs/agent/modes)

## 7. MCP Integration (External Tools)

Connect Cursor to **external tools and data sources** using Model Context Protocol.

### What is MCP?

MCP (Model Context Protocol) enables Cursor to:
- Connect to databases
- Integrate with APIs
- Access third-party services
- Authenticate with one-click OAuth

### Configuration

Create an `mcp.json` file in your project:

```json
{
  "mcpServers": {
    "database": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-postgres"],
      "env": {
        "DATABASE_URL": "postgresql://user:pass@localhost/db"
      }
    }
  }
}
```

### Capabilities

- **Database connections**: PostgreSQL, MySQL, MongoDB
- **API integrations**: REST, GraphQL
- **Third-party services**: Webflow, Stripe, etc.
- **Custom tools**: Build your own MCP servers

### Authentication

MCP supports:
- Environment variables
- OAuth flows with automatic callback handling
- API key management
- Secure credential storage

**Documentation:**
- [MCP](https://cursor.com/docs/context/mcp)
- [MCP Directory](https://cursor.com/docs/context/mcp/directory)
- [MCP in CLI](https://cursor.com/docs/cli/mcp)

## 8. Cloud Agents

Spawn **asynchronous agents** that edit and run code in a **remote environment**.

### Features

- **Default repository configuration**: Set up standard repo settings
- **Base branch selection**: Choose which branch to work from
- **Remote code execution**: Run tests and builds in the cloud
- **Async operation**: Work continues while you do other things

### Use Cases

- Long-running tasks (extensive refactoring, migrations)
- Resource-intensive operations (large builds, data processing)
- Parallel development (work on multiple features simultaneously)
- CI/CD integration (automated testing and deployment)

### Benefits

- Don't block your local machine
- Access to more powerful compute resources
- Persistent execution
- Easy collaboration and sharing

**Documentation:** [Cloud Agents](https://cursor.com/docs/cloud-agent)

## 9. CLI Agent

Use agents from the command line for automation and scripting.

### Basic Usage

```bash
# Start Cursor CLI
cursor

# Start with specific mode
cursor --mode=ask

# Switch to Ask mode during usage
/ask

# Run a specific command
cursor "Create a new React component called Button"
```

### Configuration

The CLI respects:
- Your `mcp.json` configuration
- `.cursor/rules/` directory
- User preferences from Cursor settings
- Project-specific agent configurations

### Use Cases

- Scripting and automation
- CI/CD integration
- Batch operations
- Remote development workflows
- Terminal-only environments

### Benefits

- Full agent capabilities from command line
- Scriptable and automatable
- Integration with existing tools
- Remote server access

**Documentation:** [Using Agent in CLI](https://cursor.com/docs/cli/using)

## 10. Cursor Best Practices

### Plan Before Coding

**Use Plan Mode** (`Shift+Tab`) for complex tasks:
- Research phase: Agent explores codebase
- Clarification phase: Ask questions before starting
- Planning phase: Create detailed implementation plan
- Approval phase: Review and approve before execution

**Benefits:**
- Better results for large changes
- Plans save to `.cursor/plans/` for documentation
- Review and adjust before implementation
- Learn about your codebase structure

### Context Management

**Let agent find context:**
- Use search tools instead of pasting code
- Agent can discover relevant files automatically
- Semantic search finds similar patterns

**Start fresh when switching tasks:**
- New conversations for new features
- Prevents context pollution
- Clearer focus on current task

**Reference previous work:**
- Use `@Past Chats` to reference earlier conversations
- Use `@Branch` for current branch context
- Link related work together

### Rules Best Practices

**Keep focused:**
- Essential guidelines only
- Avoid redundant information
- Update as project evolves

**Reference, don't duplicate:**
- Link to documentation
- Reference configuration files
- Avoid copying entire files

**Version control:**
- Check rules into git
- Share with team
- Review and update regularly

### Performance Tips

**Efficient prompts:**
- Be specific about what you want
- Provide relevant context upfront
- Break large tasks into smaller steps

**Tool usage:**
- Let agent choose appropriate tools
- Trust semantic search for exploration
- Use grep for specific pattern matching

**Iteration:**
- Review agent's work incrementally
- Provide feedback early and often
- Adjust instructions based on results

### Security Considerations

**API Keys and Secrets:**
- Never include in rules or skills
- Use environment variables
- Configure through MCP securely

**Code Review:**
- Always review agent-generated code
- Test thoroughly before deployment
- Understand what the agent changed

**Access Control:**
- Limit terminal command permissions
- Review subagent capabilities
- Monitor external tool integrations

**Documentation:** [Best Practices for Coding with Agents](https://cursor.com/blog/agent-best-practices)

## Cursor Quick Reference Links

| Resource | URL |
|----------|-----|
| **Main Docs** | [cursor.com/docs](https://cursor.com/docs) |
| **Agent Overview** | [cursor.com/docs/agent/overview](https://cursor.com/docs/agent/overview) |
| **Terminal** | [cursor.com/docs/agent/terminal](https://cursor.com/docs/agent/terminal) |
| **Modes** | [cursor.com/docs/agent/modes](https://cursor.com/docs/agent/modes) |
| **Rules** | [cursor.com/docs/context/rules](https://cursor.com/docs/context/rules) |
| **Skills** | [cursor.com/docs/context/skills](https://cursor.com/docs/context/skills) |
| **Subagents** | [cursor.com/docs/context/subagents](https://cursor.com/docs/context/subagents) |
| **MCP** | [cursor.com/docs/context/mcp](https://cursor.com/docs/context/mcp) |
| **MCP Directory** | [cursor.com/docs/context/mcp/directory](https://cursor.com/docs/context/mcp/directory) |
| **Cloud Agents** | [cursor.com/docs/cloud-agent](https://cursor.com/docs/cloud-agent) |
| **CLI Usage** | [cursor.com/docs/cli/using](https://cursor.com/docs/cli/using) |
| **CLI MCP** | [cursor.com/docs/cli/mcp](https://cursor.com/docs/cli/mcp) |
| **Changelog** | [cursor.com/changelog](https://cursor.com/changelog) |
| **Learn Course** | [cursor.com/learn](https://cursor.com/learn) |

---

# n8n AI Agent Framework

## Overview

n8n is a workflow automation platform with comprehensive AI agent capabilities. It enables building autonomous systems that receive data, make decisions, and act to achieve goals through a visual workflow editor or code.

**Key Features**:
- Visual workflow builder with AI Agent nodes
- LangChain integration via cluster nodes architecture
- Multi-agent collaboration patterns
- MCP (Model Context Protocol) support
- RAG (Retrieval-Augmented Generation) capabilities
- 5000+ workflow templates

## 1. AI Agent Node (The Core!)

The **AI Agent node** is the heart of building agents in n8n. It's an autonomous system that receives data, makes decisions, and acts to achieve goals.

**Key Points**:
- All AI Agent nodes now work as **Tools Agent** (since v1.82.0)
- Must connect at least **one tool sub-node** to function
- Can understand tool capabilities and determine which to use

| Feature | LLM | AI Agent |
|---------|-----|----------|
| Core Capability | Text generation | Goal-oriented task completion |
| Decision-Making | None | Yes |
| Uses Tools/APIs | No | Yes |
| Workflow Complexity | Single-step | Multi-step |

**Documentation**: [AI Agent Node](https://docs.n8n.io/integrations/builtin/cluster-nodes/root-nodes/n8n-nodes-langchain.agent/)

## 2. LangChain Integration (Cluster Nodes Architecture)

n8n uses **Cluster Nodes** - node groups that work together. A **root node** + one or more **sub-nodes** extend functionality.

### Root Nodes (Chains & Agents)

| Node Type | Purpose |
|-----------|---------|
| **AI Agent** | Autonomous decision-making with tools |
| **Basic LLM Chain** | Series of LLMs linked together |
| **Retrieval Q&A Chain** | Question answering with retrieval |
| **Summarization Chain** | Text summarization |
| **Sentiment Analysis** | Analyze sentiment |
| **Text Classifier** | Classify text |
| **LangChain Code** | Custom LangChain functionality |

**Documentation**: [LangChain Concepts in n8n](https://docs.n8n.io/advanced-ai/langchain/langchain-n8n/)

## 3. Sub-Nodes (The Arsenal!)

### Language Models (LLMs)

- Anthropic Chat Model
- AWS Bedrock Chat Model
- Cohere Model
- Hugging Face Inference Model
- Mistral Cloud Chat Model
- Ollama Chat Model / Ollama Model
- OpenAI Chat Model

### Memory Nodes

| Node | Description |
|------|-------------|
| **Simple Memory** | In-memory buffer (configurable window) |
| **Redis Chat Memory** | Persistent Redis storage |
| **Postgres Chat Memory** | PostgreSQL storage |
| **Motorhead** | Motorhead memory server |
| **Xata** | Xata database memory |
| **Zep** | Zep memory server |

### Tool Nodes

| Tool | Purpose |
|------|---------|
| **Calculator** | Math operations |
| **Code Tool** | Custom code execution |
| **SerpAPI** | Search engine results |
| **Think Tool** | Agent reasoning |
| **Vector Store Tool** | Query vector stores |
| **Wikipedia** | Wikipedia lookups |
| **Wolfram\|Alpha** | Computational queries |
| **Workflow Tool** | Call other n8n workflows |
| **HTTP Request Tool** | Connect to any API |

### Vector Stores

- Simple Vector Store (in-memory)
- PGVector Vector Store
- Pinecone Vector Store
- Qdrant Vector Store
- Supabase Vector Store
- Zep Vector Store

### Embeddings

- Embeddings AWS Bedrock
- Embeddings Cohere
- Embeddings Google PaLM
- Embeddings Hugging Face Inference
- Embeddings Mistral Cloud
- Embeddings Ollama
- Embeddings OpenAI

### Output Parsers

- Auto-fixing Output Parser
- Item List Output Parser
- Structured Output Parser

### Text Splitters

- Character Text Splitter
- Recursive Character Text Splitter
- Token Splitter

## 4. Agentic Workflow Patterns

n8n supports **four key design patterns** for AI agentic workflows:

### Pattern 1: Chained Requests

Series of predefined commands to various models in sequence.

- Rigid logic, flexible components
- Each step refined independently
- Ideal for multi-modal content creation

**Use Case**: Content pipeline with text generation, image creation, and formatting in sequence

### Pattern 2: Single Agent

One AI agent maintains state and makes all decisions.

- Can query various tools as needed
- Simpler to implement and debug
- Maintains context across interactions

**Use Case**: Customer support bot that can access knowledge base, CRM, and ticketing system

### Pattern 3: Multi-Agent with Gatekeeper

Primary agent delegates to specialized subordinate agents.

- Centralized control with distributed expertise
- Can use smaller fine-tuned LLMs for specialized tasks
- Scalable architecture

**Use Case**: Enterprise assistant where main agent routes requests to specialized agents (HR, IT, Finance)

### Pattern 4: Multi-Agent Teams

Several AI agents collaborate on sophisticated tasks.

- Mesh network, hierarchical tree, or hybrid structures
- Distributed decision-making
- Most complex and flexible

**Use Case**: Software development team with agents for requirements analysis, coding, testing, and documentation

**Documentation**: [AI Agentic Workflows Guide](https://blog.n8n.io/ai-agentic-workflows/)

## 5. n8n MCP Integration (Model Context Protocol)

Connect n8n to external tools via MCP using the **community node**.

**Installation**:
```bash
# Install via n8n community nodes
# Set environment variable:
N8N_COMMUNITY_PACKAGES_ALLOW_TOOL_USAGE=true
```

**Connection Types**:

| Type | Status |
|------|--------|
| **HTTP Streamable** | Recommended |
| **STDIO (Command-line)** | Supported |
| **SSE** |  Deprecated (legacy) |

**Operations**:
- Execute Tool
- List Tools
- List Resources
- Get Prompt
- List Prompts
- Read Resource

**Example Docker Setup**:
```yaml
services:
  n8n:
    image: n8nio/n8n
    environment:
      - MCP_BRAVE_API_KEY=your-api-key
      - MCP_OPENAI_API_KEY=your-openai-key
      - N8N_COMMUNITY_PACKAGES_ALLOW_TOOL_USAGE=true
```

**Documentation**: 
- [n8n-nodes-mcp GitHub](https://github.com/nerding-io/n8n-nodes-mcp)
- [MCP Integrations Page](https://n8n.io/integrations/categories/ai/model-context-protocol/)

## 6. RAG (Retrieval-Augmented Generation)

Build RAG systems by combining vector stores with AI agents:

1. **Ingest documents** → Document loaders
2. **Split text** → Text splitters
3. **Create embeddings** → Embedding nodes
4. **Store vectors** → Vector store nodes
5. **Query with agent** → AI Agent + Vector Store Tool

**Example Workflow**:
```
Document Loader → Text Splitter → Embeddings → Vector Store
                                                      ↓
User Query → AI Agent → Vector Store Tool → Generate Response
```

**Documentation**: [RAG in n8n](https://docs.n8n.io/advanced-ai/rag-in-n8n/)

## 7. n8n Tutorials & Templates

| Resource | Link |
|----------|------|
| **Intro Tutorial** | [Build an AI workflow](https://docs.n8n.io/advanced-ai/intro-tutorial/) |
| **First AI Agent Template** | [Build your first AI agent](https://n8n.io/workflows/6270-build-your-first-ai-agent/) |
| **AI Workflow Templates** | [5000+ AI templates](https://n8n.io/workflows/categories/ai/) |
| **Video Courses** | [n8n Video Courses](https://docs.n8n.io/video-courses/) |
| **Learning Path** | [n8n Learning Path](https://docs.n8n.io/learning-path/) |

## 8. n8n Best Practices

### Workflow Design

- **Start Simple**: Begin with Single Agent pattern, add complexity as needed
- **Modular Tools**: Create reusable tool sub-nodes
- **Error Handling**: Add error handlers for robust workflows
- **Testing**: Use n8n's built-in testing features

### Agent Configuration

- **Clear Instructions**: Provide specific, actionable prompts
- **Tool Selection**: Only connect relevant tools to reduce confusion
- **Memory Management**: Choose appropriate memory type for use case
- **Model Selection**: Balance cost, speed, and capability

### Performance

- **Parallel Execution**: Use n8n's parallel branches for independent tasks
- **Caching**: Implement caching for frequently accessed data
- **Monitoring**: Track agent performance and costs
- **Version Control**: Use n8n's version control features

### Security

- **Credential Management**: Use n8n's credential system
- **API Rate Limiting**: Implement rate limiting for external APIs
- **Data Privacy**: Be mindful of sensitive data in prompts
- **Access Control**: Use n8n's role-based access control

## 9. Framework Comparison

| Aspect | n8n | GitHub Copilot | Cursor |
|--------|-----|----------------|--------|
| **Interface** | Visual workflow + Code | IDE extension | IDE application |
| **Agent Type** | Autonomous workflows | Code assistants | Code assistants |
| **Deployment** | Self-hosted or Cloud | GitHub-hosted | Desktop app |
| **LLM Support** | Multiple providers | GitHub's models | Multiple providers |
| **Tools** | 400+ integrations | File/Git/Web | File/Terminal/Web |
| **Multi-Agent** | Native support | Single agent | Subagents |
| **Memory** | Multiple options | Session-based | Session-based |
| **Use Case** | Workflow automation | Code generation | Code generation |

## n8n Quick Reference Links

| Resource | URL |
|----------|-----|
| Main Docs | [docs.n8n.io](https://docs.n8n.io/) |
| AI Agent Node | [AI Agent Docs](https://docs.n8n.io/integrations/builtin/cluster-nodes/root-nodes/n8n-nodes-langchain.agent/) |
| LangChain in n8n | [LangChain Docs](https://docs.n8n.io/advanced-ai/langchain/langchain-n8n/) |
| Advanced AI | [Advanced AI Docs](https://docs.n8n.io/advanced-ai/) |
| Agentic Workflows Blog | [AI Agentic Workflows](https://blog.n8n.io/ai-agentic-workflows/) |
| AI Agents Explained | [AI Agents Blog](https://blog.n8n.io/ai-agents/) |
| GitHub Repo | [n8n-io/n8n](https://github.com/n8n-io/n8n) |
| MCP Node | [n8n-nodes-mcp](https://github.com/nerding-io/n8n-nodes-mcp) |

## Getting Started with n8n

### Installation

**Self-Hosted (Docker)**:
```bash
docker run -it --rm \
  --name n8n \
  -p 5678:5678 \
  -v ~/.n8n:/home/node/.n8n \
  n8nio/n8n
```

**Cloud**: Sign up at [n8n.cloud](https://n8n.cloud)

**npm**:
```bash
npm install n8n -g
n8n start
```

### Your First AI Agent

1. Create a new workflow
2. Add an **AI Agent** node
3. Connect an **LLM** sub-node (e.g., OpenAI Chat Model)
4. Add at least one **Tool** sub-node (e.g., Calculator)
5. Configure the agent with instructions
6. Test and iterate

**Follow the Tutorial**: [Build an AI workflow](https://docs.n8n.io/advanced-ai/intro-tutorial/)

---

## Documentation Sitemap

### Root Level Documentation

| File | Purpose | Key Topics |
|------|---------|------------|
| [README.md](README.md) | Main repository overview | Project intro, quick start, features, usage examples, contributing guidelines |
| **[AGENTS.md](AGENTS.md)** | **This file** | **AI frameworks, navigation hub, bash commands** |

### Configuration Files

| File | Purpose | Key Topics |
|------|---------|------------|
| [.gitignore](.gitignore) | Git ignore patterns | OS files, editors, build artifacts, secrets |
| [.editorconfig](.editorconfig) | Editor settings | Consistent formatting across editors |
| [terraform/.gitignore](terraform/.gitignore) | Terraform ignore patterns | State files, credentials, locks |
| [terraform/terraform.tfvars.example](terraform/terraform.tfvars.example) | Terraform variables example | Cloudflare configuration template |

### Cursor IDE Configuration (`.cursor/`)

**Main Index**: [Cursor IDE Configuration](#cursor-ide-configuration-cursor)

Cursor IDE configuration for AI-assisted development:

| Directory/File | Purpose |
|----------------|---------|
| `.cursor/rules/` | Project-specific rules for Cursor agents |
| `.cursor/agents/` | Custom subagent configurations |
| [.cursor/rules/general.md](.cursor/rules/general.md) | General project standards |
| [.cursor/rules/testing.md](.cursor/rules/testing.md) | Testing best practices |
| [.cursor/rules/documentation.md](.cursor/rules/documentation.md) | Documentation standards |
| [.cursor/rules/code-review.md](.cursor/rules/code-review.md) | Code review guidelines |

See [Cursor Agent Framework](#cursor-agent-framework) section for complete documentation.

### GitHub Copilot Agents (`.github/agents/`)

**Main Index**: [.github/agents/README.md](.github/agents/README.md)

All agent files are in `.github/agents/` directory:

| Agent | File | Specialization |
|-------|------|----------------|
| Template | `TEMPLATE.agent.md` | Base template for creating new agents |
| Test Specialist | `test-specialist.agent.md` | Test coverage, TDD, quality assurance |
| Documentation Expert | `documentation-expert.agent.md` | READMEs, guides, API docs |
| Documentation Builder | `documentation-builder.agent.md` | Generate docs from templates |
| Code Reviewer | `code-reviewer.agent.md` | Security, performance, best practices |
| Refactoring Assistant | `refactoring-assistant.agent.md` | Safe code refactoring patterns |
| Docker Specialist | `docker-specialist.agent.md` | Dockerfiles, compose, Kubernetes |
| Ansible Specialist | `ansible-specialist.agent.md` | Ansible playbooks, roles, automation |

**Invoke agents**: `@agent-name` in GitHub Copilot Chat

### Development Environments

#### Nix Flakes (`nix/`)

**Main Guide**: [Nix Development Environments](#nix-development-environments-nix) - Comprehensive Nix setup documentation

| Environment | Location | Purpose |
|-------------|----------|---------|
| Common | `nix/common/` | Shared development tools |
| Test | `nix/test/` | Testing frameworks and tools |
| Docker | `nix/docker/` | Container development tools |
| Documentation | `nix/documentation/` | Doc generation tools |
| Code Review | `nix/code-review/` | Linters, formatters, analyzers |
| Refactoring | `nix/refactoring/` | Code transformation tools |
| Wrangler | `nix/wrangler/` | CloudFlare Workers development |
| Terraform | `nix/terraform/` | Infrastructure as Code tools |
| Ansible | `nix/ansible/` | Ansible automation tools |

#### APT Packages (`apt/`)

**Main Guide**: [APT Package Lists](#apt-package-lists-apt) - Ubuntu/Debian package lists

| Environment | Location | Purpose |
|-------------|----------|---------|
| Common | `apt/common/packages.txt` | Core development packages |
| Test | `apt/test/packages.txt` | Testing packages |
| Docker | `apt/docker/packages.txt` | Docker and container packages |
| Documentation | `apt/documentation/packages.txt` | Documentation tools |
| Code Review | `apt/code-review/packages.txt` | Code quality packages |
| Refactoring | `apt/refactoring/packages.txt` | Refactoring tool packages |
| Wrangler | `apt/wrangler/packages.txt` | CloudFlare tools |
| Terraform | `apt/terraform/packages.txt` | IaC packages |
| Ansible | `apt/ansible/packages.txt` | Ansible automation packages |

### Infrastructure (`terraform/`)

**Main Guide**: [Terraform Infrastructure](#terraform-infrastructure-terraform) - CloudFlare infrastructure setup

| Module | Location | Purpose |
|--------|----------|---------|
| Workers | `terraform/modules/workers/` | CloudFlare Workers |
| Pages | `terraform/modules/pages/` | CloudFlare Pages |
| DNS | `terraform/modules/dns/` | DNS records and zones |
| Examples | `terraform/examples/` | Example configurations |

### Documentation (`docs/`)

**Main Index**: [Documentation Directory](#documentation-directory-docs)

| Section | Location | Purpose |
|---------|----------|---------|
| API | `docs/api/` | API documentation |
| Guides | `docs/guides/` | How-to guides and tutorials |
| Reference | `docs/reference/` | Technical reference materials |
| Agent Prompts | `docs/AGENT_PROMPTS.md` | Instructions for documentation agents |

### Data (`data/`)

**Main Index**: [Data Directory](#data-directory-data)

| Section | Location | Purpose |
|---------|----------|---------|
| Schemas | `data/schemas/` | JSON schemas, data models |
| Configs | `data/configs/` | Configuration files and templates |
| Examples | `data/examples/` | Example data files |
| Agent Prompts | `data/AGENT_PROMPTS.md` | Instructions for data agents |

### Source Code (`src/`)

**Main Index**: [Source Code Directory](#source-code-directory-src)

| Section | Location | Purpose |
|---------|----------|---------|
| Agents | `src/agents/` | Agent implementation code |
| Utils | `src/utils/` | Utility functions and helpers |
| Scripts | `src/scripts/` | Automation scripts |
| Agent Prompts | `src/AGENT_PROMPTS.md` | Instructions for code agents |

---

## Detailed Directory Documentation

> **Note**: This section contains detailed documentation previously found in subdirectory README.md files. All subdirectory README.md files now symlink to this AGENTS.md file.

### Cursor IDE Configuration (`.cursor/`)

#### Overview

This directory contains [Cursor](https://cursor.com) editor configurations for AI-assisted development.

#### Directory Structure

```
.cursor/
├── README.md → /home/runner/work/github/github/AGENTS.md (symlink)
├── rules/              # Project-specific rules for Cursor agents
│   ├── general.md      # General project rules
│   ├── testing.md      # Testing-specific rules
│   ├── documentation.md # Documentation rules
│   └── code-review.md  # Code review rules
└── agents/             # Custom subagent configurations
    └── README.md → /home/runner/work/github/github/AGENTS.md (symlink)
```

#### Rules

Rules in `.cursor/rules/` provide persistent instructions that shape how Cursor agents work with your code. They are automatically applied based on file glob patterns.

**Available Rules:**

| Rule File | Purpose | Glob Pattern |
|-----------|---------|--------------|
| `general.md` | General project standards and commands | `**/*` |
| `testing.md` | Testing best practices | `**/*.test.*`, `**/*.spec.*`, `**/test/**`, `**/tests/**`, `**/__tests__/**` |
| `documentation.md` | Documentation standards | `**/*.md`, `docs/**/*` |
| `code-review.md` | Code review guidelines | `**/*` |

#### Agents

Custom subagents in `.cursor/agents/` define specialized AI assistants for specific tasks.

#### Cursor Subagents

Subagents are independent agents specialized to handle discrete parts of a task. They:
- Run in parallel for faster completion
- Use their own context and instructions
- Can be specialized for specific domains
- Are configurable with custom prompts and tool access

**Creating a Subagent:**

Create a markdown file in `.cursor/agents/` with your agent configuration:

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

**Available Subagents:**

Currently, this repository does not define any subagents in this directory. Shared Cursor rules are configured in the parent `.cursor/rules/` directory. For task-specific agents, see the [GitHub Copilot agents](.github/agents/) which provide equivalent functionality.

**Mapping to GitHub Copilot Agents:**

| Cursor Location | GitHub Copilot Equivalent |
|-----------------|---------------------------|
| `.cursor/agents/` | `.github/agents/` |
| `.cursor/rules/` | Agent file sections |
| `SKILL.md` | Agent commands |

#### Usage

When using Cursor IDE:
1. Rules are automatically loaded based on file patterns
2. Use `/` commands to invoke custom skills
3. Use `Shift+Tab` to toggle Plan Mode for complex tasks

#### Resources

- [Cursor Documentation](https://cursor.com/docs)
- [Rules Documentation](https://cursor.com/docs/context/rules)
- [Subagents Documentation](https://cursor.com/docs/context/subagents)

### APT Package Lists (`apt/`)

#### Overview

This directory contains APT package lists for setting up development environments on Debian/Ubuntu systems that correspond to each GitHub Copilot agent type. These package lists mirror the Nix environments in the `nix/` directory but use APT packages instead.

#### Available Environments

| Environment | Description | Packages File |
|------------|-------------|---------------|
| **common** | Common development tools (git, vim, pandoc, etc.) | [`common/packages.txt`](apt/common/packages.txt) |
| **test** | Multi-language testing frameworks | [`test/packages.txt`](apt/test/packages.txt) |
| **docker** | Docker, Kubernetes, and container tools | [`docker/packages.txt`](apt/docker/packages.txt) |
| **documentation** | Documentation generators and markdown tools | [`documentation/packages.txt`](apt/documentation/packages.txt) |
| **refactoring** | Code refactoring and transformation tools | [`refactoring/packages.txt`](apt/refactoring/packages.txt) |
| **code-review** | Linters and code review tools | [`code-review/packages.txt`](apt/code-review/packages.txt) |
| **wrangler** | Cloudflare Workers development tools | [`wrangler/packages.txt`](apt/wrangler/packages.txt) |
| **terraform** | Infrastructure as Code tools | [`terraform/packages.txt`](apt/terraform/packages.txt) |
| **ansible** | Ansible automation and configuration management | [`ansible/packages.txt`](apt/ansible/packages.txt) |

#### Quick Start

**Install All Packages from an Environment:**

```bash
# Navigate to the repository root
cd /path/to/repository

# Install common development tools
sudo apt update
sudo apt install -y $(cat apt/common/packages.txt | grep -v '^#' | tr '\n' ' ')

# Install test environment packages
sudo apt install -y $(cat apt/test/packages.txt | grep -v '^#' | tr '\n' ' ')

# Install docker environment packages
sudo apt install -y $(cat apt/docker/packages.txt | grep -v '^#' | tr '\n' ' ')
```

**Install Packages from Multiple Environments:**

```bash
# Install common + test + docker packages
cat apt/common/packages.txt apt/test/packages.txt apt/docker/packages.txt \
  | grep -v '^#' | sort -u \
  | xargs sudo apt install -y
```

#### Package Format

Each `packages.txt` file:
- Lists one package per line
- Uses `#` for comments
- Includes installation notes for packages not available in standard repositories
- Groups related packages together

#### Important Notes

**Not All Tools Available via APT:**

Many specialized development tools are not available in standard APT repositories. For these tools, the `packages.txt` files include notes about alternative installation methods:

- **Language-specific tools**: Use npm, pip, cargo, go install, etc.
- **HashiCorp tools**: Require HashiCorp's official repositories (Terraform, Vault, Packer)
- **Cloud CLIs**: AWS, Azure, and GCP CLIs have their own installation methods
- **Modern CLI tools**: Many Rust/Go tools need manual download or alternative package managers

**Additional Setup Required:**

Some environments require additional setup beyond APT packages:

1. **Docker**: Requires Docker's official repository for latest versions
2. **Rust**: Best installed via [rustup](https://rustup.rs/) rather than APT
3. **Node.js**: Consider using [nvm](https://github.com/nvm-sh/nvm) for version management
4. **Python packages**: Use `pip3 install` for Python tools
5. **Go tools**: Use `go install` for Go packages

**Debian vs Ubuntu:**

Package names and availability may differ slightly between Debian and Ubuntu. These lists are optimized for Ubuntu LTS versions but should work on Debian with minor adjustments.

#### APT vs Nix

**When to Use APT:**
- Running on Debian/Ubuntu systems
- Prefer system package manager
- Need stable, tested package versions
- Working in traditional server environments
- Using Docker containers based on Debian/Ubuntu

**When to Use Nix:**
- Need reproducible, declarative environments
- Want isolated, conflict-free package installations
- Working across different Linux distributions
- Need specific package versions not in APT
- Prefer functional package management

**Comparison:**

| Feature | APT | Nix |
|---------|-----|-----|
| **Reproducibility** | Limited | Excellent |
| **Isolation** | System-wide | Per-environment |
| **Rollback** | Limited | Full support |
| **Setup complexity** | Low | Medium |
| **Package availability** | Moderate | Excellent |
| **Cross-platform** | Debian/Ubuntu only | Most Linux + macOS |

### Nix Development Environments (`nix/`)

#### Overview

This directory contains Nix flakes and shell configurations for development environments tailored to each GitHub Copilot agent type. Each subdirectory provides a reproducible development environment with all necessary tools and dependencies.

#### Prerequisites

To use these Nix environments, you need:

1. **Nix package manager** installed:
   ```bash
   curl -L https://nixos.org/nix/install | sh
   ```

2. **Enable flakes** (for flake.nix usage):
   ```bash
   mkdir -p ~/.config/nix
   echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf
   ```

#### Usage

**Using with Flakes (Recommended):**

Enter a development environment using `nix develop`:

```bash
# Test Specialist environment
cd nix/test
nix develop

# Docker Specialist environment
cd nix/docker
nix develop

# Documentation environment
cd nix/documentation
nix develop
```

**Quick Access from Repository Root:**

You can also enter any environment from the repository root:

```bash
# Using flakes
nix develop ./nix/test
nix develop ./nix/docker
nix develop ./nix/documentation
```

#### Environment Details

**Common (`nix/common/`):**

Purpose: Basic tools shared across all agent types

Includes: Version control (git, gh), text editors (vim, nano), documentation (pandoc, mdl), YAML tools (yq, yamllint), shell utilities

**Test (`nix/test/`):**

Purpose: Comprehensive testing environment

Includes: JavaScript/TypeScript (Node.js 20, Jest, Mocha), Python (pytest), Go, Rust, Java (JDK 21, Maven, Gradle), coverage tools (lcov)

**Docker (`nix/docker/`):**

Purpose: Container and orchestration environment

Includes: docker, docker-compose, podman, kubectl, helm, k9s, trivy, hadolint, skopeo

**Documentation (`nix/documentation/`):**

Purpose: Documentation writing and generation

Includes: Markdown tools (pandoc, mdl, markdownlint), generators (hugo, jekyll, sphinx, mkdocs), diagrams (graphviz, plantuml, mermaid)

**Code Review (`nix/code-review/`):**

Purpose: Multi-language code analysis

Includes: eslint, prettier, pylint, black, golangci-lint, clippy, checkstyle, clang-tools, trivy, semgrep, shellcheck

**Refactoring (`nix/refactoring/`):**

Purpose: Safe code refactoring

Includes: prettier, black, isort, gofmt, rustfmt, comby, tree-sitter, ripgrep, fd, fzf

**Wrangler (`nix/wrangler/`):**

Purpose: Cloudflare Workers development

Includes: Node.js 20, wrangler CLI, TypeScript, vitest, jest, sqlite, redis, curl, httpie

**Terraform (`nix/terraform/`):**

Purpose: Infrastructure as Code

Includes: terraform, terragrunt, tfsec, terrascan, checkov, infracost, awscli2, gcloud, azure-cli, kubectl, vault

**Ansible (`nix/ansible/`):**

Purpose: Infrastructure automation

Includes: ansible, ansible-lint, molecule, pytest, awscli2, gcloud, azure-cli, docker, yamllint, openssh

### Data Directory (`data/`)

#### Overview

This directory contains data files, configurations, schemas, and examples used by the agent framework.

#### Structure

```
data/
├── README.md → /home/runner/work/github/github/AGENTS.md (symlink)
├── schemas/     # JSON Schema, OpenAPI specs, data models
│   └── README.md → /home/runner/work/github/github/AGENTS.md (symlink)
├── configs/     # Configuration files and templates
│   └── README.md → /home/runner/work/github/github/AGENTS.md (symlink)
└── examples/    # Example data and sample files
    └── README.md → /home/runner/work/github/github/AGENTS.md (symlink)
```

#### Purpose

The `data/` directory serves as the central location for all data-related files:

- **Schemas**: JSON schemas, API specifications, and data models
- **Configs**: Configuration templates, environment examples, and settings
- **Examples**: Sample data files for testing and demonstration

#### Usage

**Schemas:**

Store data validation schemas, API specifications (OpenAPI/Swagger), and database schemas:

```bash
data/schemas/
├── agent-config.schema.json
├── api-spec.openapi.yaml
└── database-models.json
```

**Configs:**

Configuration templates and example files:

```bash
data/configs/
├── .env.example
├── agent-defaults.yaml
└── deployment-config.json
```

**Examples:**

Sample data for testing and documentation:

```bash
data/examples/
├── sample-agent-response.json
├── example-workflow.yaml
└── test-data.csv
```

#### Guidelines

1. **Schemas**: Use JSON Schema format when possible
2. **Configs**: Never commit secrets or credentials
3. **Examples**: Keep examples minimal but representative
4. **Validation**: Validate data files against schemas
5. **Documentation**: Add comments to explain non-obvious data

#### Repository Configuration Files

The repository includes several root-level configuration files:

| File | Purpose |
|------|---------|
| `/.gitignore` | Git ignore patterns for the entire repository |
| `/.editorconfig` | Editor settings for consistent formatting |
| `/terraform/.gitignore` | Terraform-specific ignore patterns |
| `/terraform/terraform.tfvars.example` | Example Terraform variables file |

#### Security

**IMPORTANT**: Never commit actual secrets or credentials to this directory.

- Use `.example` suffix for templates
- Document all required variables
- Provide safe default values
- Add sensitive configs to .gitignore

### Documentation Directory (`docs/`)

#### Overview

This directory contains comprehensive documentation for the agent framework repository.

#### Structure

```
docs/
├── README.md → /home/runner/work/github/github/AGENTS.md (symlink)
├── api/           # API documentation and reference materials
│   └── README.md → /home/runner/work/github/github/AGENTS.md (symlink)
├── guides/        # Step-by-step guides and tutorials
│   └── README.md → /home/runner/work/github/github/AGENTS.md (symlink)
└── reference/     # Technical reference documentation
    └── README.md → /home/runner/work/github/github/AGENTS.md (symlink)
```

#### Purpose

The `docs/` directory serves as the central hub for all project documentation:

- **API Documentation**: Detailed API references for programmatic interfaces
- **Guides**: Practical tutorials and how-to guides for common tasks
- **Reference**: Technical specifications, architecture diagrams, and design documents

#### API Documentation (`docs/api/`)

This subdirectory contains API reference documentation.

**Planned Documentation:**
- Agent API Reference
- Configuration API
- Tool API Reference
- Extension Points

**When adding API documentation:**
1. Use consistent formatting
2. Include code examples
3. Document all parameters and return values
4. Add usage examples
5. Keep documentation in sync with code

#### Guides (`docs/guides/`)

This subdirectory contains step-by-step guides and tutorials.

**Planned Guides:**
- Getting Started with Agents
- Creating Custom Agents
- Setting Up Development Environment
- Deploying Agents to Production
- Troubleshooting Common Issues

**When adding guides:**
1. Start with prerequisites
2. Use numbered steps
3. Include screenshots where helpful
4. Add troubleshooting section
5. Link to related resources

#### Reference Documentation (`docs/reference/`)

This subdirectory contains technical reference materials.

**Planned Documentation:**
- Architecture Overview
- Design Decisions
- Configuration Reference
- Glossary
- Diagrams and Visualizations

**When adding reference documentation:**
1. Be technically precise
2. Include diagrams for complex concepts
3. Define technical terms
4. Cross-reference related documents
5. Keep architecture docs current

### Source Code Directory (`src/`)

#### Overview

This directory contains source code, scripts, and utilities for the agent framework.

#### Structure

```
src/
├── README.md → /home/runner/work/github/github/AGENTS.md (symlink)
├── agents/      # Agent implementation code
│   └── README.md → /home/runner/work/github/github/AGENTS.md (symlink)
├── utils/       # Utility functions and helpers
│   └── README.md → /home/runner/work/github/github/AGENTS.md (symlink)
└── scripts/     # Automation scripts and tools
    └── README.md → /home/runner/work/github/github/AGENTS.md (symlink)
```

#### Purpose

The `src/` directory contains executable code and scripts:

- **Agents**: Custom agent implementations and extensions
- **Utils**: Reusable utility functions and libraries
- **Scripts**: Automation scripts, deployment tools, and helpers

#### Agents (`src/agents/`)

Custom agent implementations that extend the base agent framework:

```bash
src/agents/
├── custom-agent.js
├── specialized-agent.py
└── agent-extensions.ts
```

**Planned Agents:**
- Custom agent implementations
- Agent extensions and plugins
- Specialized agent workflows
- Agent utilities

**When creating agents:**
1. Follow the agent template pattern
2. Implement required interfaces
3. Add comprehensive tests
4. Document configuration options
5. Include usage examples

#### Utils (`src/utils/`)

Reusable utility functions:

```bash
src/utils/
├── file-utils.js
├── string-helpers.py
└── validation.ts
```

**Planned Utilities:**
- File operation utilities
- String manipulation helpers
- Data validation functions
- API client utilities
- Logging and debugging tools

**When creating utilities:**
1. Keep functions small and focused
2. Make them reusable across projects
3. Add comprehensive documentation
4. Include unit tests
5. Follow single responsibility principle

#### Scripts (`src/scripts/`)

Automation and deployment scripts:

```bash
src/scripts/
├── deploy.sh
├── setup-environment.py
└── generate-docs.js
```

**Planned Scripts:**
- Deployment automation
- Environment setup scripts
- Database migration scripts
- CI/CD helper scripts
- Monitoring and health checks

**Common script patterns:**

```bash
# Setup environment
./scripts/setup.sh

# Deploy to environment
./scripts/deploy.sh production

# Run migrations
./scripts/migrate.sh
```

**When creating scripts:**
1. Make scripts idempotent (safe to run multiple times)
2. Add error handling and validation
3. Include usage documentation
4. Test thoroughly before use
5. Use shellcheck for bash scripts

#### Development Guidelines

**Code Style:**
- Follow language-specific style guides
- Use meaningful variable and function names
- Add comments for complex logic
- Include JSDoc/docstrings for functions
- Keep functions small and focused

**Testing:**
- Write unit tests for all functions
- Include integration tests for workflows
- Test edge cases and error conditions
- Maintain high test coverage

**Documentation:**
- Document public APIs
- Include usage examples
- Explain complex algorithms
- Add inline comments for clarity

**Language Support:**

This repository supports multiple languages:
- **JavaScript/TypeScript**: Node.js scripts and tools
- **Python**: Data processing and utilities
- **Bash**: Shell scripts for automation
- **Go**: High-performance utilities

### Terraform Infrastructure (`terraform/`)

#### Overview

This directory contains Terraform templates for deploying infrastructure to CloudFlare, including Workers, Pages, and DNS configurations.

#### Prerequisites

1. **Terraform**: Install Terraform >= 1.0
   ```bash
   # Using nix (recommended)
   nix develop ../nix/terraform

   # Or download from https://www.terraform.io/downloads
   ```

2. **CloudFlare Account**: You need a CloudFlare account with:
   - An active zone (domain)
   - API token with appropriate permissions

3. **CloudFlare API Token**: Create an API token at:
   - https://dash.cloudflare.com/profile/api-tokens
   - Required permissions:
     - Account - Workers Scripts - Edit
     - Account - Workers KV Storage - Edit
     - Zone - DNS - Edit
     - Account - Cloudflare Pages - Edit

#### Quick Start

**1. Initialize Terraform:**

```bash
cd terraform
terraform init
```

**2. Configure Variables:**

Copy the example variables file and customize it:

```bash
cp terraform.tfvars.example terraform.tfvars
```

Edit `terraform.tfvars` with your CloudFlare settings:

```hcl
cloudflare_api_token    = "your-api-token"
cloudflare_account_name = "Your Account Name"
zone_name               = "yourdomain.com"

# Enable the services you want to deploy
deploy_workers = true
deploy_pages   = false
deploy_dns     = false
```

**3. Plan and Apply:**

```bash
# Review the changes Terraform will make
terraform plan

# Apply the configuration
terraform apply
```

#### Module Structure

```
terraform/
├── README.md → /home/runner/work/github/github/AGENTS.md (symlink)
├── main.tf                      # Main configuration
├── variables.tf                 # Input variables
├── outputs.tf                   # Output values
├── versions.tf                  # Provider versions
├── terraform.tfvars.example     # Example configuration
├── .gitignore                   # Git ignore rules
├── modules/
│   ├── workers/                 # CloudFlare Workers module
│   ├── pages/                   # CloudFlare Pages module
│   └── dns/                     # CloudFlare DNS module
└── examples/
    └── README.md → /home/runner/work/github/github/AGENTS.md (symlink)
```

#### Modules

**Workers Module:**

Deploy CloudFlare Workers with KV namespaces, environment variables, and routes.

**Pages Module:**

Deploy CloudFlare Pages projects with build configuration.

**DNS Module:**

Manage CloudFlare DNS records with proxying support.

#### Common Commands

```bash
# Initialize
terraform init

# Format Code
terraform fmt -recursive

# Validate Configuration
terraform validate

# Plan Changes
terraform plan

# Apply Changes
terraform apply

# Destroy Infrastructure
terraform destroy

# Show Current State
terraform show

# List Resources
terraform state list
```

#### Security Best Practices

1. **Never commit `terraform.tfvars`** - It's in `.gitignore`
2. **Use environment variables** for sensitive data
3. **Enable remote state encryption**
4. **Use least-privilege API tokens**
5. **Store secrets in a secrets manager** (AWS Secrets Manager, HashiCorp Vault, etc.)
6. **Review plans carefully** before applying
7. **Use workspaces** for different environments (dev, staging, prod)

#### Terraform Examples (`terraform/examples/`)

This subdirectory contains example configurations and scripts for CloudFlare deployments.

**Files:**
- `worker.js` - Example CloudFlare Worker script with routing and KV usage

**Using the Examples:**

1. Copy the worker script to your project:
   ```bash
   cp examples/worker.js ./my-worker.js
   ```

2. Customize the worker script for your needs

3. Reference it in your `terraform.tfvars`:
   ```hcl
   worker_script_path = "./my-worker.js"
   ```

---

## Common Bash Commands

### Environment Setup

#### Nix (Recommended for Reproducibility)

```bash
# Install Nix (if not already installed)
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install

# Enter a specific environment
cd nix/docker && nix develop
cd nix/test && nix develop
cd nix/terraform && nix develop

# Exit environment
exit

# Update flake inputs
nix flake update

# Check flake status
nix flake check
```

#### APT (Ubuntu/Debian)

```bash
# Install packages from a specific environment
xargs -a apt/common/packages.txt sudo apt install -y
xargs -a apt/docker/packages.txt sudo apt install -y
xargs -a apt/terraform/packages.txt sudo apt install -y

# Update package lists
sudo apt update

# Upgrade all packages
sudo apt upgrade -y
```

### Git Workflows

```bash
# Check repository status
git status

# View recent commits
git log --oneline -10

# Create a new branch
git checkout -b feature/my-feature

# Stage all changes
git add .

# Commit with message
git commit -m "feat: add new feature"

# Push to remote
git push origin feature/my-feature

# Pull latest changes
git pull origin main

# View diff of uncommitted changes
git diff

# View diff of staged changes
git diff --cached
```

### Docker Operations

```bash
# Build a Docker image
docker build -t myapp:latest .

# Run a container
docker run -d -p 8080:80 myapp:latest

# View running containers
docker ps

# View all containers
docker ps -a

# Stop a container
docker stop <container-id>

# Remove a container
docker rm <container-id>

# View logs
docker logs <container-id>

# Execute command in running container
docker exec -it <container-id> /bin/bash

# Docker Compose operations
docker-compose up -d
docker-compose down
docker-compose logs -f
```

### Terraform Operations

```bash
# Navigate to terraform directory
cd terraform

# Initialize Terraform
terraform init

# Validate configuration
terraform validate

# Plan changes
terraform plan

# Apply changes
terraform apply

# Destroy resources
terraform destroy

# Format files
terraform fmt -recursive

# Show state
terraform show

# List resources
terraform state list

# Workspace operations
terraform workspace list
terraform workspace new development
terraform workspace select production
```

### Testing Commands

```bash
# Run all tests (adjust based on your test framework)
npm test                    # Node.js
pytest                      # Python
go test ./...              # Go
cargo test                 # Rust
mvn test                   # Java/Maven
dotnet test                # .NET

# Run specific test file
npm test path/to/test.js
pytest tests/test_file.py
go test ./pkg/specific/

# Run with coverage
npm test -- --coverage
pytest --cov=src
go test -cover ./...

# Watch mode
npm test -- --watch
pytest-watch
```

### Documentation Generation

```bash
# Generate documentation from templates
# Using documentation-builder agent
@documentation-builder generate README.md from template

# Manual markdown linting
markdownlint **/*.md

# Generate API docs (adjust for your language)
jsdoc src/**/*.js -d docs/api/         # JavaScript
sphinx-build -b html docs/ docs/_build # Python
godoc -http=:6060                      # Go
cargo doc --open                       # Rust
```

### Code Quality

```bash
# Linting
eslint src/                 # JavaScript
pylint src/                # Python
golangci-lint run          # Go
cargo clippy               # Rust

# Formatting
prettier --write "**/*.{js,jsx,ts,tsx,json,css,md}"  # JavaScript/TypeScript
black src/                                           # Python
gofmt -w .                                          # Go
cargo fmt                                           # Rust

# Type checking
tsc --noEmit               # TypeScript
mypy src/                  # Python
```

### CloudFlare Operations

```bash
# Wrangler (CloudFlare Workers)
cd my-worker
wrangler dev               # Local development
wrangler publish           # Deploy to production
wrangler tail              # Stream logs
wrangler kv:namespace:list # List KV namespaces
wrangler secret put API_KEY # Set secret

# CloudFlare CLI
cloudflare dns list
cloudflare pages list
cloudflare workers list
```

### Search & Navigation

```bash
# Find files by name
find . -name "*.md"
find . -type f -name "README.md"

# Search file contents
grep -r "pattern" .
grep -r "TODO" --include="*.js"

# Count lines of code
find . -name "*.js" | xargs wc -l
cloc .                     # If cloc is installed

# List directory tree
tree -L 3                  # Show 3 levels deep
tree -I 'node_modules|.git' # Ignore directories
```

### File Operations

```bash
# Copy with structure
cp -r source/ destination/

# Move/rename
mv old-name new-name

# Create directory with parents
mkdir -p path/to/nested/dir

# Remove directory recursively
rm -rf directory/

# Create empty file
touch newfile.txt

# View file content
cat file.txt
less file.txt
head -n 20 file.txt
tail -f logfile.txt        # Follow file updates
```

### Process Management

```bash
# View running processes
ps aux | grep node
ps aux | grep python

# Kill process by PID
kill <pid>
kill -9 <pid>              # Force kill

# Kill process by name
pkill node
killall python

# View port usage
lsof -i :8080
netstat -tulpn | grep :8080
```

### System Information

```bash
# Disk usage
df -h
du -sh *
du -h --max-depth=1

# Memory usage
free -h
top
htop                       # If installed

# System info
uname -a
lsb_release -a            # Ubuntu/Debian
cat /etc/os-release

# Check environment variables
env
echo $PATH
```

---

## Getting Started Quick Commands

```bash
# 1. Clone repository (if not already cloned)
git clone https://github.com/swarm-protocol/github.git
cd github

# 2. Run automated setup (RECOMMENDED)
./bootstrap.sh

# The bootstrap script will:
# - Detect your system (Nix or APT)
# - Guide you through environment selection
# - Install required dependencies
# - Verify your setup
# - Show next steps

# 3. Manual environment setup (if preferred)
# Option A: Nix (reproducible)
cd nix/common && nix develop

# Option B: APT (Ubuntu/Debian)
xargs -a apt/common/packages.txt sudo apt install -y

# 4. Explore the repository
cat AGENTS.md
cat README.md
ls -la

# 5. Start working with an agent
# In GitHub Copilot:
@test-specialist help me write tests
@docker-specialist create a Dockerfile
@documentation-builder generate README.md
```

---

## Quick Navigation Shortcuts

### For GitHub Copilot

When you need to understand a specific area, reference these files:

```
"Read .github/agents/README.md for agent documentation"
"See Nix Development Environments section in AGENTS.md for development environment setup"
"See Terraform Infrastructure section in AGENTS.md for infrastructure configuration"
"See Documentation Directory section in AGENTS.md for documentation structure"
"See Source Code Directory section in AGENTS.md for source code organization"
```

### Command Templates

Common command patterns to use:

```bash
# Setup new environment
"Enter nix/[environment] and run nix develop"

# Install packages
"Install packages from apt/[environment]/packages.txt"

# Deploy infrastructure
"Navigate to terraform/ and run terraform apply"

# Run tests
"Execute tests in src/ directory"

# Generate documentation
"Use @documentation-builder to generate docs"
```

---

## How to Use This File

### For GitHub Copilot

1. **Understanding Structure**: Read this entire file first to understand the repository layout
2. **Specific Questions**: Reference specific README files listed in the sitemap
3. **Command Help**: Use the bash command reference for common operations
4. **Agent Invocation**: Use `@agent-name` to invoke specialized agents

### For Developers

1. **Quick Reference**: Bookmark this file for fast navigation
2. **Command Lookup**: Search this file for bash commands you need
3. **Documentation Map**: Use sitemap to find specific documentation
4. **Onboarding**: Share this file with new team members

### For AI Assistants

1. **Context Loading**: Read this file at the start of each session
2. **Navigation**: Use the sitemap to locate relevant documentation
3. **Command Execution**: Reference bash commands for development tasks
4. **Documentation**: Check README files before asking questions

---

## Related Files

- **[README.md](README.md)**: Main project documentation with quick start, usage examples, and contributing guidelines

---

## Getting Started Quick Commands

```bash
# 1. Clone repository (if not already cloned)
git clone https://github.com/swarm-protocol/github.git
cd github

# 2. Choose your environment setup method
# Option A: Nix (reproducible)
cd nix/common && nix develop

# Option B: APT (Ubuntu/Debian)
xargs -a apt/common/packages.txt sudo apt install -y

# 3. Explore the repository
cat AGENTS.md
cat README.md
ls -la

# 4. Start working with an agent
# In GitHub Copilot:
@test-specialist help me write tests
@docker-specialist create a Dockerfile
@documentation-builder generate README.md
```

---

## Tips

- **Keep this file updated**: As new directories/READMEs are added, update the sitemap
- **Use as reference**: This file is designed to be comprehensive, not exhaustive
- **Command customization**: Adapt bash commands to your specific project needs
- **Agent context**: GitHub Copilot reads this file to understand repository structure

---

**Last Updated**: 2026-02-08

**Repository**: swarm-protocol/github
