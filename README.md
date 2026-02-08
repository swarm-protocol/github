# GitHub Copilot Custom Agents Templates

A comprehensive collection of templates and examples for creating GitHub Copilot custom agents.

## What's Included

This repository provides ready-to-use templates for creating specialized GitHub Copilot agents:

- **Comprehensive Template**: A blank template with all recommended sections
- **Example Agents**: Pre-built agents for common use cases
- **Documentation**: Detailed guides on creating and customizing agents
- **Best Practices**: Tips and patterns for effective agent design

## Quick Start

### Automated Setup

Run the bootstrap script to set up your development environment:

```bash
./bootstrap.sh
```

The script will:
- Detect your system (Nix or APT)
- Install required dependencies
- Set up your chosen environment (test, docker, documentation, etc.)
- Verify the setup

### Manual Setup

1. **Explore the templates** in the `.github/agents/` directory
2. **Copy a template** that fits your needs
3. **Customize** the agent for your specific requirements
4. **Use in your repository** or organization

See [.github/agents/README.md](.github/agents/README.md) for detailed instructions.

## Available Templates

### TEMPLATE.agent.md
Comprehensive blank template with all recommended sections for creating custom agents from scratch.

### test-specialist.agent.md 
Specialized agent for writing comprehensive tests without modifying production code.
**Status:** Ready to use immediately!

### documentation-expert.agent.md 
Expert agent for creating clear, comprehensive documentation, READMEs, and guides.
**Status:** Ready to use immediately!

### code-reviewer.agent.md 
Code review specialist focused on quality, security, and best practices.
**Status:** Ready to use immediately!

### refactoring-assistant.agent.md 
Ready-to-use agent for safe code refactoring and improving maintainability.
**Status:** Ready to use immediately!

### documentation-builder.agent.md 
Ready-to-use agent for building README.md and AGENTS.md from template files with variable substitution.
**Status:** Ready to use immediately!

See [AGENTS.md - Using the Documentation-Builder Agent](AGENTS.md#using-the-documentation-builder-agent) for usage examples.

### docker-specialist.agent.md 
Expert agent for Docker, Dockerfiles, docker-compose, and Kubernetes YAML configurations.
**Status:** Ready to use immediately!

**Specializes in:**
- Optimized Dockerfiles with multi-stage builds
- docker-compose configurations
- Kubernetes manifests (Deployments, Services, ConfigMaps, Secrets)
- CI/CD pipeline YAML
- Container security and best practices

### ansible-specialist.agent.md 
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

**Well-structured templates** following GitHub's best practices  
**Real-world examples** demonstrating different agent types  
**Comprehensive documentation** with step-by-step guides  
**Customizable** for any language, framework, or workflow  
**Production-ready** agents you can use immediately  

## Getting Started

**New to custom agents?** See the sections below to get up and running quickly!

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

## Usage Examples

### With Test Specialist

```
@test-specialist write unit tests for the UserService class
```

The agent will create comprehensive tests without modifying production code.

### With Documentation Expert

```
@documentation-expert create API documentation for the /api/users endpoint
```

The agent will generate clear, comprehensive API documentation.

### With Code Reviewer

```
@code-reviewer review this pull request for security issues
```

The agent will analyze code for quality, security vulnerabilities, and best practices.

### With Refactoring Assistant

```
@refactoring-assistant this function is too complex, help me break it down
```

The agent will safely refactor code while maintaining functionality.

### With Docker Specialist

```
@docker-specialist create an optimized Dockerfile for this Node.js application
```

The agent will create multi-stage Dockerfiles following best practices.

## Best Practices

### Starting Out

- **Start Simple**: Begin with basic instructions and refine based on results
- **Test Incrementally**: Use your agent for small tasks first, then gradually increase complexity
- **Provide Context**: Give your agent relevant code snippets or file names in your requests
- **Use Examples**: The more examples you include in your agent file, the better it performs
- **Set Clear Boundaries**: Explicitly tell your agent what NOT to do to avoid unwanted changes

### Agent Design

- **Specialization**: One agent should do one thing well - avoid "do everything" agents
- **Concrete Examples**: Provide specific code examples, not just general descriptions
- **Clear Commands**: List exact commands to run (build, test, lint)
- **Explicit Boundaries**: State what the agent should NOT do
- **Real-World Testing**: Test agents in actual scenarios before sharing with your team

### Maintenance

- **Keep Updated**: Update agent instructions as your project evolves
- **Version Control**: Always commit agents to version control
- **Team Collaboration**: Share successful agents with your team
- **Iterate**: Refine agents based on feedback and usage patterns

## Troubleshooting

### Agent Not Responding

**Symptoms**: Agent doesn't respond when invoked with `@agent-name`

**Solutions**:
1. Verify the file is named `*.agent.md`
2. Check it's in `.github/agents/` directory
3. Ensure YAML front matter is uncommented and valid
4. Confirm the file is committed and pushed to the default branch
5. Wait a few minutes for GitHub to process the new agent
6. Check that you have a GitHub Copilot Pro+ subscription

### Agent Doesn't Follow Instructions

**Symptoms**: Agent ignores your instructions or behaves unexpectedly

**Solutions**:
1. Be more specific in your agent instructions
2. Add concrete code examples to the agent file
3. Explicitly state boundaries (what NOT to do)
4. Test with simple requests first
5. Remove conflicting or unclear instructions
6. Provide more context in your prompts

### Can't Find My Agent

**Symptoms**: Agent doesn't appear in autocomplete

**Solutions**:
1. Type `@` in Copilot Chat to see all available agents
2. Check the agent name matches the YAML `name` field exactly
3. Verify you have access to custom agents (requires GitHub Copilot Pro, Business, or Enterprise)
4. Ensure the agent file is on the repository's default branch

### Variables Not Replaced (Documentation Builder)

**Symptoms**: Generated files contain `{{VARIABLE}}` instead of values

**Solutions**:
1. Check variable name spelling in templates
2. Ensure values were provided to the agent
3. Verify template file syntax is correct
4. Make sure you're using the correct variable format: `{{VARIABLE_NAME}}`

For more troubleshooting help, see [AGENTS.md](AGENTS.md) comprehensive troubleshooting section.

## Documentation

- [**AGENTS.md - Navigation Hub**](AGENTS.md) - **Complete sitemap and bash command reference**
- [ Detailed Setup Guide](.github/agents/README.md) - Complete instructions
- [Contributing Guide](CONTRIBUTING.md) - How to contribute
- [Template Reference](.github/agents/TEMPLATE.agent.md) - Blank template
- [Example Agents](.github/agents/) - Pre-built examples
- [Nix Development Environments](nix/README.md) - Reproducible dev environments
- [ APT Package Lists](apt/README.md) - Debian/Ubuntu package lists
- [Cursor IDE Configuration](.cursor/README.md) - Cursor rules and agents
- [Cursor Agent Framework](CURSOR.md) - Cursor agent architecture and tools
- [ n8n Agent Framework](N8N.md) - Visual workflow automation with AI agents

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

We welcome contributions! Here's how you can help:

### Ways to Contribute

- **New Agent Templates**: Create agents for new use cases and share them
- **Template Improvements**: Enhance existing agents with better examples
- **Documentation**: Improve guides, add tutorials, fix typos
- **Bug Fixes**: Fix errors in templates or documentation
- **Best Practices**: Share insights that make agents more effective

### Contribution Process

1. Fork this repository
2. Create a new branch: `git checkout -b add-agent-name`
3. Make your changes following our guidelines
4. Test your agent in real scenarios
5. Update documentation (README.md, AGENTS.md)
6. Submit a pull request with clear description

### Agent Template Requirements

Your agent template should include:
- Valid YAML front matter with `name` and `description`
- Well-defined role and responsibilities
- Specific commands relevant to the agent's purpose
- Code examples demonstrating style
- Clear boundaries (what NOT to do)
- Real-world usage examples

For detailed guidelines, see [CONTRIBUTING.md](CONTRIBUTING.md).

## License

Unlicense (Public Domain) - See [LICENSE](LICENSE) for details.