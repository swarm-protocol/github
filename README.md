# GitHub Copilot Custom Agents Templates

A comprehensive collection of templates and examples for creating GitHub Copilot custom agents.

## What's Included

This repository provides ready-to-use templates for creating specialized GitHub Copilot agents:

- **Comprehensive Template**: A blank template with all recommended sections
- **Example Agents**: Pre-built agents for common use cases
- **Documentation**: Detailed guides on creating and customizing agents
- **Best Practices**: Tips and patterns for effective agent design

## Quick Start

### 🚀 Automated Setup

Run the bootstrap script to set up your development environment:

```bash
./bootstrap.sh
```

The script will:
- Detect your system (Nix or APT)
- Install required dependencies
- Set up your chosen environment (test, docker, documentation, etc.)
- Verify the setup

### ✋ Manual Setup

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

### 🔧 ansible-specialist.agent.md ✅
Expert agent for Ansible automation, playbooks, roles, and infrastructure configuration management.
**Status:** Ready to use immediately!

**Specializes in:**
- Ansible playbooks and role development
- Inventory management (static and dynamic)
- Jinja2 templates for configuration
- Ansible Vault for secrets management
- Molecule testing for roles
- CI/CD integration with Ansible

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

- [🗺️ **AGENTS.md - Navigation Hub**](AGENTS.md) - **Complete sitemap and bash command reference**
- [⚡ Quick Start Guide](QUICKSTART.md) - Get started in 5 minutes
- [📖 Detailed Setup Guide](.github/agents/README.md) - Complete instructions
- [🤝 Contributing Guide](CONTRIBUTING.md) - How to contribute
- [📋 Template Reference](.github/agents/TEMPLATE.agent.md) - Blank template
- [💡 Example Agents](.github/agents/) - Pre-built examples
- [🔧 Nix Development Environments](nix/README.md) - Reproducible dev environments
- [📦 APT Package Lists](apt/README.md) - Debian/Ubuntu package lists
- [🎯 Cursor IDE Configuration](.cursor/README.md) - Cursor rules and agents
- [📚 Cursor Agent Framework](CURSOR.md) - Cursor agent architecture and tools
- [🔄 n8n Agent Framework](N8N.md) - Visual workflow automation with AI agents

## Development Environments

### Nix Environments (Recommended)

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

# Ansible environment (Configuration Management)
nix develop ./nix/ansible
```

See [nix/README.md](nix/README.md) for complete setup instructions and environment details.

### APT Package Lists (Debian/Ubuntu)

For Debian/Ubuntu systems, corresponding APT package lists are available:

```bash
# Install common development tools
sudo apt install -y $(cat apt/common/packages.txt | grep -v '^#' | tr '\n' ' ')

# Install test environment packages
sudo apt install -y $(cat apt/test/packages.txt | grep -v '^#' | tr '\n' ' ')

# Install docker environment packages
sudo apt install -y $(cat apt/docker/packages.txt | grep -v '^#' | tr '\n' ' ')
```

See [apt/README.md](apt/README.md) for all available environments and detailed usage instructions.

## Repository Structure

### Documentation (`docs/`)

Comprehensive documentation for the agent framework:

- **`docs/api/`** - API reference documentation
- **`docs/guides/`** - Step-by-step guides and tutorials
- **`docs/reference/`** - Technical specifications and architecture

See [docs/README.md](docs/README.md) and [docs/AGENT_PROMPTS.md](docs/AGENT_PROMPTS.md) for working with documentation.

### Data (`data/`)

Data files, configurations, and schemas:

- **`data/schemas/`** - JSON schemas and API specifications
- **`data/configs/`** - Configuration templates and examples
- **`data/examples/`** - Sample data for testing and demos

See [data/README.md](data/README.md) and [data/AGENT_PROMPTS.md](data/AGENT_PROMPTS.md) for working with data files.

### Source Code (`src/`)

Source code and automation scripts:

- **`src/agents/`** - Custom agent implementations
- **`src/utils/`** - Utility functions and libraries
- **`src/scripts/`** - Automation and deployment scripts

See [src/README.md](src/README.md) and [src/AGENT_PROMPTS.md](src/AGENT_PROMPTS.md) for development guidelines.

### Infrastructure

- **`terraform/`** - CloudFlare deployment modules and templates
- **`nix/`** - Reproducible development environments
- **`apt/`** - Debian/Ubuntu package lists

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

### n8n Agent Framework

n8n is a visual workflow automation platform with comprehensive AI agent capabilities:
- **AI Agent Node**: Autonomous decision-making with tools
- **LangChain Integration**: Cluster nodes architecture with chains and agents
- **Multi-Agent Patterns**: Four workflow patterns (Chained, Single Agent, Multi-Agent Gatekeeper, Multi-Agent Teams)
- **MCP Integration**: Connect to external tools via Model Context Protocol
- **RAG Support**: Build retrieval-augmented generation systems
- **5000+ Templates**: Pre-built workflow templates for various use cases

See [N8N.md](N8N.md) for complete n8n agent documentation.

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

### n8n

- [n8n Documentation](https://docs.n8n.io/)
- [AI Agent Node](https://docs.n8n.io/integrations/builtin/cluster-nodes/root-nodes/n8n-nodes-langchain.agent/)
- [AI Agentic Workflows Guide](https://blog.n8n.io/ai-agentic-workflows/)
- [5000+ AI Workflow Templates](https://n8n.io/workflows/categories/ai/)

## Contributing

Contributions are welcome! Share your useful agent templates by submitting a pull request.

## License

Unlicense (Public Domain) - See [LICENSE](LICENSE) for details.