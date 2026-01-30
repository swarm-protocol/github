# GitHub Copilot Custom Agents Templates

A comprehensive collection of templates and examples for creating GitHub Copilot custom agents.

## What's Included

This repository provides ready-to-use templates for creating specialized GitHub Copilot agents:

- **Comprehensive Template**: A blank template with all recommended sections
- **Example Agents**: Pre-built agents for common use cases
- **Documentation**: Detailed guides on creating and customizing agents
- **Best Practices**: Tips and patterns for effective agent design

## Quick Start

1. **Explore the templates** in the `.github/agents/` directory
2. **Copy a template** that fits your needs
3. **Customize** the agent for your specific requirements
4. **Use in your repository** or organization

See [.github/agents/README.md](.github/agents/README.md) for detailed instructions.

## Available Templates

### 📋 TEMPLATE.agent.md
Comprehensive blank template with all recommended sections for creating custom agents from scratch.

### 🧪 test-specialist.agent.md ✅
Specialized agent for writing comprehensive tests without modifying production code.
**Status:** Ready to use immediately!

### 📝 documentation-expert.agent.md ✅
Expert agent for creating clear, comprehensive documentation, READMEs, and guides.
**Status:** Ready to use immediately!

### 👀 code-reviewer.agent.md ✅
Code review specialist focused on quality, security, and best practices.
**Status:** Ready to use immediately!

### 🔧 refactoring-assistant.agent.md ✅
Ready-to-use agent for safe code refactoring and improving maintainability.
**Status:** Ready to use immediately!

### 📄 documentation-builder.agent.md ✅
Ready-to-use agent for building README.md and CLAUDE.md from template files with variable substitution.
**Status:** Ready to use immediately!

See [DOCUMENTATION-BUILDER-USAGE.md](DOCUMENTATION-BUILDER-USAGE.md) for usage examples.

### 🐳 docker-specialist.agent.md ✅
Expert agent for Docker, Dockerfiles, docker-compose, and Kubernetes YAML configurations.
**Status:** Ready to use immediately!

**Specializes in:**
- Optimized Dockerfiles with multi-stage builds
- docker-compose configurations
- Kubernetes manifests (Deployments, Services, ConfigMaps, Secrets)
- CI/CD pipeline YAML
- Container security and best practices

## Features

✅ **Well-structured templates** following GitHub's best practices  
✅ **Real-world examples** demonstrating different agent types  
✅ **Comprehensive documentation** with step-by-step guides  
✅ **Customizable** for any language, framework, or workflow  
✅ **Production-ready** agents you can use immediately  

## Getting Started

**⚡ New to custom agents?** Start with the [Quick Start Guide](QUICKSTART.md) to get up and running in 5 minutes!

### For Your Repository

```bash
# Create the agents directory
mkdir -p .github/agents

# Copy a template
cp TEMPLATE.agent.md your-agent-name.agent.md

# Edit and customize
# Then commit to your repository
```

### For Your Organization

Create a `.github-private` repository in your organization and add agent files to the `.github/agents/` directory. All organization repositories can then use these agents.

## Documentation

- [⚡ Quick Start Guide](QUICKSTART.md) - Get started in 5 minutes
- [📖 Detailed Setup Guide](.github/agents/README.md) - Complete instructions
- [🤝 Contributing Guide](CONTRIBUTING.md) - How to contribute
- [📋 Template Reference](.github/agents/TEMPLATE.agent.md) - Blank template
- [💡 Example Agents](.github/agents/) - Pre-built examples
- [🔧 Nix Development Environments](nix/README.md) - Reproducible dev environments
- [🎯 Cursor Agent Framework](CURSOR.md) - Cursor agent architecture and tools

## Nix Development Environments

Each agent has a corresponding Nix environment with all necessary tools pre-configured:

```bash
# Test Specialist environment
nix develop ./nix/test

# Docker Specialist environment  
nix develop ./nix/docker

# Documentation environment
nix develop ./nix/documentation

# Code Review environment
nix develop ./nix/code-review

# Refactoring environment
nix develop ./nix/refactoring

# Wrangler environment (Cloudflare Workers)
nix develop ./nix/wrangler

# Terraform environment (Infrastructure as Code)
nix develop ./nix/terraform
```

See [nix/README.md](nix/README.md) for complete setup instructions and environment details.

## Use Cases

Custom agents are perfect for:

- **Specialized tasks**: Testing, documentation, refactoring
- **Team standards**: Enforcing coding conventions and style
- **Domain expertise**: Agents with deep knowledge of your stack
- **Workflow automation**: CI/CD, deployment, maintenance tasks

## Agent Frameworks

This repository includes comprehensive documentation for multiple agent frameworks:

### GitHub Copilot Custom Agents

GitHub Copilot agents are defined in `.github/agents/` directory using markdown files with YAML front matter. See the templates and examples in this repository for GitHub Copilot agent development.

### Cursor Agent Framework

Cursor provides a different approach with powerful features like:
- **Rules System**: Static context in `.cursor/rules/`
- **Skills**: Dynamic capabilities with `SKILL.md` files
- **Subagents**: Parallel execution with specialized agents
- **Agent Modes**: Agent, Ask, and Plan modes
- **MCP Integration**: Connect to external tools and data sources

See [CURSOR.md](CURSOR.md) for complete Cursor agent documentation.

## Resources

### GitHub Copilot

- [GitHub Copilot Documentation](https://docs.github.com/copilot)
- [Creating Custom Agents](https://docs.github.com/copilot/how-tos/use-copilot-agents/coding-agent/create-custom-agents)
- [Best Practices Blog](https://github.blog/ai-and-ml/github-copilot/how-to-write-a-great-agents-md-lessons-from-over-2500-repositories/)

### Cursor

- [Cursor Documentation](https://cursor.com/docs)
- [Agent Overview](https://cursor.com/docs/agent/overview)
- [Best Practices for Coding with Agents](https://cursor.com/blog/agent-best-practices)
- [Cursor Learn Course](https://cursor.com/learn)

## Contributing

Contributions are welcome! Share your useful agent templates by submitting a pull request.

## License

Unlicense (Public Domain) - See [LICENSE](LICENSE) for details.