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

## Best Practices

1. **Specialization**: One agent should do one thing well
2. **Examples**: Provide concrete code examples
3. **Boundaries**: Explicitly state what agent should NOT do
4. **Commands**: List exact commands to run
5. **Testing**: Test agents in real scenarios before sharing

---

# Cursor Agent Framework

Comprehensive guide for building agent frameworks with **Cursor** - a powerful AI-powered code editor with advanced agent capabilities.

> ** This Repository's Configuration**: See [`.cursor/README.md`](.cursor/README.md) for the actual Cursor configuration used in this repository.

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
| [README.md](README.md) | Main repository overview | Project intro, quick start, features |
| [QUICKSTART.md](QUICKSTART.md) | Fast onboarding guide | Installation, first steps, examples |
| [CONTRIBUTING.md](CONTRIBUTING.md) | Contribution guidelines | How to contribute, PR process, standards |
| **[AGENTS.md](AGENTS.md)** | **This file** | **AI frameworks, navigation hub, bash commands** |
| [CLAUDE.md](CLAUDE.md) → AGENTS.md | Symlink to AGENTS.md | GitHub Copilot agent context |
| [CURSOR.md](CURSOR.md) → AGENTS.md | Symlink to AGENTS.md | Cursor agent framework |
| [N8N.md](N8N.md) → AGENTS.md | Symlink to AGENTS.md | n8n workflow automation |
| [GEMINI.md](GEMINI.md) → AGENTS.md | Symlink to AGENTS.md | Gemini AI agent integration |
| [QWEN.md](QWEN.md) → AGENTS.md | Symlink to AGENTS.md | Qwen AI agent integration |
| [DOCUMENTATION-BUILDER-USAGE.md](DOCUMENTATION-BUILDER-USAGE.md) | Template system guide | Variable substitution, examples |

### Configuration Files

| File | Purpose | Key Topics |
|------|---------|------------|
| [.gitignore](.gitignore) | Git ignore patterns | OS files, editors, build artifacts, secrets |
| [.editorconfig](.editorconfig) | Editor settings | Consistent formatting across editors |
| [terraform/.gitignore](terraform/.gitignore) | Terraform ignore patterns | State files, credentials, locks |
| [terraform/terraform.tfvars.example](terraform/terraform.tfvars.example) | Terraform variables example | Cloudflare configuration template |

### Cursor IDE Configuration (`.cursor/`)

**Main Index**: [.cursor/README.md](.cursor/README.md)

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

**Main Guide**: [nix/README.md](nix/README.md) - Comprehensive Nix setup documentation

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

**Main Guide**: [apt/README.md](apt/README.md) - Ubuntu/Debian package lists

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

**Main Guide**: [terraform/README.md](terraform/README.md) - CloudFlare infrastructure setup

| Module | Location | Purpose |
|--------|----------|---------|
| Workers | `terraform/modules/workers/` | CloudFlare Workers |
| Pages | `terraform/modules/pages/` | CloudFlare Pages |
| DNS | `terraform/modules/dns/` | DNS records and zones |
| Examples | `terraform/examples/` | Example configurations |

### Documentation (`docs/`)

**Main Index**: [docs/README.md](docs/README.md)

| Section | Location | Purpose |
|---------|----------|---------|
| API | `docs/api/` | API documentation |
| Guides | `docs/guides/` | How-to guides and tutorials |
| Reference | `docs/reference/` | Technical reference materials |
| Agent Prompts | `docs/AGENT_PROMPTS.md` | Instructions for documentation agents |

### Data (`data/`)

**Main Index**: [data/README.md](data/README.md)

| Section | Location | Purpose |
|---------|----------|---------|
| Schemas | `data/schemas/` | JSON schemas, data models |
| Configs | `data/configs/` | Configuration files and templates |
| Examples | `data/examples/` | Example data files |
| Agent Prompts | `data/AGENT_PROMPTS.md` | Instructions for data agents |

### Source Code (`src/`)

**Main Index**: [src/README.md](src/README.md)

| Section | Location | Purpose |
|---------|----------|---------|
| Agents | `src/agents/` | Agent implementation code |
| Utils | `src/utils/` | Utility functions and helpers |
| Scripts | `src/scripts/` | Automation scripts |
| Agent Prompts | `src/AGENT_PROMPTS.md` | Instructions for code agents |

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
"Read nix/README.md for development environment setup"
"Read terraform/README.md for infrastructure configuration"
"Read docs/README.md for documentation structure"
"Read src/README.md for source code organization"
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

- **[README.md](README.md)**: Main project documentation
- **[QUICKSTART.md](QUICKSTART.md)**: Get started quickly
- **[CONTRIBUTING.md](CONTRIBUTING.md)**: How to contribute
- **[CLAUDE.md](CLAUDE.md)**, **[CURSOR.md](CURSOR.md)**, **[N8N.md](N8N.md)**, **[GEMINI.md](GEMINI.md)**, **[QWEN.md](QWEN.md)**: Symlinks to this file for AI framework compatibility

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
