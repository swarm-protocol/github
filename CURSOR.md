# Cursor Agent Framework Documentation

Comprehensive guide for building agent frameworks with **Cursor** - a powerful AI-powered code editor with advanced agent capabilities.

## Table of Contents

1. [Agent Architecture](#1-cursor-agent-architecture)
2. [Agent Tools](#2-agent-tools-the-arsenal)
3. [Rules System](#3-rules-system-static-context)
4. [Agent Skills](#4-agent-skills-dynamic-capabilities)
5. [Subagents](#5-subagents-parallel-specialists)
6. [Agent Modes](#6-agent-modes)
7. [MCP Integration](#7-mcp-integration-external-tools)
8. [Cloud Agents](#8-cloud-agents)
9. [CLI Agent](#9-cli-agent)
10. [Best Practices](#10-best-practices)
11. [Quick Reference](#quick-reference-links)

---

## 1. Cursor Agent Architecture

An agent in Cursor is built on **three core components**:

| Component | Description |
|-----------|-------------|
| **Instructions** | System prompt and rules that guide agent behavior |
| **Tools** | File editing, codebase search, terminal execution, and more |
| **User Messages** | Your prompts and follow-ups that direct the work |

Cursor orchestrates these components for each model, tuning instructions and tools specifically for every frontier model.

📚 **Documentation:** [Agent Overview](https://cursor.com/docs/agent/overview)

---

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

📚 **Documentation:** [Terminal Execution](https://cursor.com/docs/agent/terminal)

---

## 3. Rules System (Static Context)

Rules provide **persistent instructions** that shape how the agent works with your code.

### File Location

- **Project Rules**: `.cursor/rules/*.mdc` or `.cursor/rules/*.md`
- **Alternative**: `AGENTS.md` in project root for simpler use cases
- **User Rules**: Global to your Cursor environment (in settings)

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

📚 **Documentation:** [Rules](https://cursor.com/docs/context/rules)

---

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

📚 **Documentation:** [Agent Skills](https://cursor.com/docs/context/skills)

---

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

📚 **Documentation:** [Subagents](https://cursor.com/docs/context/subagents)

---

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

📚 **Documentation:** [Modes](https://cursor.com/docs/agent/modes)

---

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

📚 **Documentation:**
- [MCP](https://cursor.com/docs/context/mcp)
- [MCP Directory](https://cursor.com/docs/context/mcp/directory)
- [MCP in CLI](https://cursor.com/docs/cli/mcp)

---

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

📚 **Documentation:** [Cloud Agents](https://cursor.com/docs/cloud-agent)

---

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

📚 **Documentation:** [Using Agent in CLI](https://cursor.com/docs/cli/using)

---

## 10. Best Practices

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

📚 **Documentation:** [Best Practices for Coding with Agents](https://cursor.com/blog/agent-best-practices)

---

## Quick Reference Links

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

## Comparison: Cursor vs GitHub Copilot

While this repository focuses on GitHub Copilot custom agents, understanding Cursor's approach can inform your agent development:

| Feature | Cursor | GitHub Copilot |
|---------|--------|----------------|
| **Agent Location** | `.cursor/` directory | `.github/agents/` directory |
| **Configuration** | Rules (`.mdc`/`.md`), Skills, Hooks | Agent files (`.agent.md`) |
| **Tools** | Built-in tools + MCP | GitHub's tool ecosystem |
| **Modes** | Agent, Ask, Plan | Chat, Workspace |
| **Subagents** | Parallel execution | Single agent per conversation |
| **CLI** | Full CLI support | Via GitHub Copilot CLI |

**Key Takeaways:**
- Both use markdown-based configuration
- Both support version-controlled agent definitions
- Both enable team-wide agent sharing
- Different tool ecosystems and architectures

---

## Getting Started with Cursor

1. **Download Cursor**: Visit [cursor.com](https://cursor.com)
2. **Create project rules**: Set up `.cursor/rules/` directory
3. **Define skills**: Add `SKILL.md` files for custom workflows
4. **Configure MCP**: Add `mcp.json` for external integrations
5. **Try different modes**: Experiment with Agent, Ask, and Plan modes
6. **Create subagents**: Define specialized agents in `.cursor/agents/`

---

## Resources

- **Official Documentation**: [cursor.com/docs](https://cursor.com/docs)
- **Best Practices Blog**: [cursor.com/blog/agent-best-practices](https://cursor.com/blog/agent-best-practices)
- **Learn Course**: [cursor.com/learn](https://cursor.com/learn)
- **Changelog**: [cursor.com/changelog](https://cursor.com/changelog)
- **Community Examples**: 
  - [0xbageltoes/cursor-custom-agents-rules](https://github.com/0xbageltoes/cursor-custom-agents-rules)
  - [civai-technologies/cursor-agent](https://github.com/civai-technologies/cursor-agent)
  - [zalab-inc/cursor_agent](https://github.com/zalab-inc/cursor_agent)

---

## Contributing

Have improvements or examples for Cursor agent development? Contributions welcome!

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

---

## License

See [LICENSE](LICENSE) for details.
