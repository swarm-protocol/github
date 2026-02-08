<!-- 
Template Variables:
- {{PROJECT_NAME}}: Name of the project
- {{DESCRIPTION}}: Short description
- {{VERSION}}: Current version
- {{DATE}}: Last updated date

This is an example template for README.md generation.
-->

# {{PROJECT_NAME}}

{{DESCRIPTION}}

**Version**: {{VERSION}}  
**Last Updated**: {{DATE}}

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

### TEMPLATE.agent.md
Comprehensive blank template with all recommended sections for creating custom agents from scratch.

### test-specialist.agent.md
Specialized agent for writing comprehensive tests without modifying production code.

### documentation-expert.agent.md
Expert agent for creating clear, comprehensive documentation, READMEs, and guides.

### code-reviewer.agent.md
Code review specialist focused on quality, security, and best practices.

### refactoring-assistant.agent.md
Ready-to-use agent for safe code refactoring and improving maintainability (uncommented and ready to use!).

### documentation-builder.agent.md
Ready-to-use agent for building README.md and AGENTS.md from template files with variable substitution (uncommented and ready to use!).

## Features

**Well-structured templates** following GitHub's best practices  
**Real-world examples** demonstrating different agent types  
**Comprehensive documentation** with step-by-step guides  
**Customizable** for any language, framework, or workflow  
**Production-ready** agents you can use immediately  

## Getting Started

**New to custom agents?** Start with the [Quick Start Guide](QUICKSTART.md) to get up and running in 5 minutes!

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

- [Quick Start Guide](QUICKSTART.md) - Get started in 5 minutes
- [ Detailed Setup Guide](.github/agents/README.md) - Complete instructions
- [Contributing Guide](CONTRIBUTING.md) - How to contribute
- [Template Reference](.github/agents/TEMPLATE.agent.md) - Blank template
- [Example Agents](.github/agents/) - Pre-built examples

## Use Cases

Custom agents are perfect for:

- **Specialized tasks**: Testing, documentation, refactoring
- **Team standards**: Enforcing coding conventions and style
- **Domain expertise**: Agents with deep knowledge of your stack
- **Workflow automation**: CI/CD, deployment, maintenance tasks

## Resources

- [GitHub Copilot Documentation](https://docs.github.com/copilot)
- [Creating Custom Agents](https://docs.github.com/copilot/how-tos/use-copilot-agents/coding-agent/create-custom-agents)
- [Best Practices Blog](https://github.blog/ai-and-ml/github-copilot/how-to-write-a-great-agents-md-lessons-from-over-2500-repositories/)

## Contributing

Contributions are welcome! Share your useful agent templates by submitting a pull request.

## License

Unlicense (Public Domain) - See [LICENSE](LICENSE) for details.
