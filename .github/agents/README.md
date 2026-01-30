# GitHub Copilot Custom Agents Templates

This repository provides templates and examples for creating GitHub Copilot custom agents. Custom agents are specialized AI assistants that help with specific tasks in your development workflow.

## What are Custom Agents?

GitHub Copilot custom agents are AI assistants that you can customize for your specific needs. They can:

- Specialize in particular tasks (testing, documentation, code review)
- Follow your team's coding standards and conventions
- Work within defined boundaries and restrictions
- Understand your project's specific context and requirements

## Quick Start

### For Repository-Level Agents

1. **Create the agents directory** in your repository:
   ```bash
   mkdir -p .github/agents
   ```

2. **Copy a template** from this repository:
   - Use `TEMPLATE.agent.md` for a blank template
   - Or copy one of the example agents as a starting point

3. **Customize the agent** by editing:
   - The `name` and `description` in the YAML front matter
   - The agent's instructions and responsibilities
   - Commands, code style, and conventions
   - Boundaries and restrictions

4. **Save the file** with the pattern `your-agent-name.agent.md`

5. **Commit and push** to your repository

### For Organization-Wide Agents

1. **Create a private repository** named `.github-private` in your organization
2. **Create the agents directory**: `.github/agents`
3. **Add your agent files** following the same pattern as above
4. All repositories in your organization can now use these agents

## Available Templates

### 1. TEMPLATE.agent.md

A comprehensive blank template with all recommended sections:
- Agent role and expertise
- Commands
- Code style and conventions
- Testing requirements
- Project context
- Boundaries and restrictions
- Git workflow
- Best practices
- Examples

**Use this when:** You want to create a completely custom agent from scratch.

### 2. test-specialist.agent.md

A testing specialist agent focused on:
- Writing unit, integration, and E2E tests
- Following testing best practices
- Ensuring test coverage
- Never modifying production code

**Use this when:** You want help writing comprehensive tests without touching production code.

### 3. documentation-expert.agent.md

A documentation specialist agent focused on:
- Creating clear, comprehensive documentation
- Writing API documentation
- Maintaining README files
- Creating tutorials and guides

**Use this when:** You need help with documentation, README files, or technical writing.

### 4. code-reviewer.agent.md

A code review specialist agent focused on:
- Reviewing code quality
- Identifying security issues
- Suggesting performance improvements
- Providing constructive feedback

**Use this when:** You want automated code review feedback following best practices.

## File Structure

```
.github/
└── agents/
    ├── TEMPLATE.agent.md              # Blank template
    ├── test-specialist.agent.md       # Example: Testing agent
    ├── documentation-expert.agent.md  # Example: Documentation agent
    └── code-reviewer.agent.md         # Example: Code review agent
```

## Creating Your Own Agent

### Step 1: Choose a Starting Point

- Start with `TEMPLATE.agent.md` for a blank slate
- Or copy an example agent that's closest to your needs

### Step 2: Define the YAML Front Matter

```markdown
---
name: your-agent-name
description: A brief description of what this agent does
---
```

**Important naming rules:**
- Use only letters, numbers, hyphens, and underscores
- Keep it descriptive but concise
- Example: `python-test-expert`, `api-documentation-writer`

### Step 3: Customize the Instructions

Key sections to customize:

1. **Role and Expertise**: What is this agent's specialty?
2. **Commands**: What build/test/lint commands should it run?
3. **Code Style**: Show examples of your preferred code style
4. **Boundaries**: What should this agent NOT do?
5. **Project Context**: Describe your tech stack and file structure

### Step 4: Test Your Agent

1. Commit your agent file
2. Open GitHub Copilot
3. Use `@your-agent-name` to invoke your agent
4. Give it a task and see how it performs
5. Iterate on the instructions based on results

## Best Practices

### Do's ✅

- **Be specific**: Provide concrete examples and clear instructions
- **Set boundaries**: Explicitly state what the agent should NOT do
- **Include commands**: List all relevant build, test, and lint commands
- **Show examples**: Demonstrate your preferred code style with real examples
- **Keep it focused**: One agent should specialize in one area
- **Update regularly**: Keep agent instructions in sync with project changes

### Don'ts ❌

- **Don't be vague**: Avoid general instructions like "write good code"
- **Don't create "do everything" agents**: Specialized agents work better
- **Don't forget boundaries**: Always specify restrictions and limitations
- **Don't skip examples**: Generic instructions without examples are less effective
- **Don't leave it commented**: Uncomment the YAML and instructions when ready to use

## Agent Naming Conventions

Good agent names are:
- **Descriptive**: `test-specialist` not `helper`
- **Specific**: `react-component-creator` not `frontend-dev`
- **Focused**: `api-doc-writer` not `documentation-and-testing-expert`

## Common Agent Types

Here are some ideas for agents you might create:

### Development Agents
- `backend-api-developer`: Backend API development
- `frontend-component-builder`: React/Vue/Angular components
- `database-migration-specialist`: Database schema changes
- `performance-optimizer`: Performance improvements

### Quality Agents
- `security-auditor`: Security vulnerability detection
- `accessibility-checker`: A11y compliance
- `test-coverage-improver`: Test coverage
- `code-quality-enforcer`: Code quality and linting

### Documentation Agents
- `api-documenter`: API documentation
- `tutorial-writer`: Tutorial and guide creation
- `changelog-maintainer`: Changelog maintenance
- `readme-improver`: README improvements

### DevOps Agents
- `ci-cd-specialist`: CI/CD pipeline work
- `docker-expert`: Docker and containerization
- `deployment-helper`: Deployment tasks
- `monitoring-setup`: Monitoring and alerting

## Troubleshooting

### Agent Not Working?

1. **Check the file name**: Must end with `.agent.md`
2. **Check the location**: Must be in `.github/agents/` directory
3. **Check the YAML**: Must be valid YAML with `name` and `description`
4. **Check it's uncommented**: Remove the `<!--` and `-->` wrapper
5. **Check it's committed**: Must be committed to the repository
6. **Check permissions**: Ensure you have access to use custom agents

### Agent Not Following Instructions?

1. **Be more specific**: Add concrete examples
2. **Add boundaries**: Explicitly state what NOT to do
3. **Simplify**: Remove conflicting or unclear instructions
4. **Test iteratively**: Make small changes and test again

## Resources

- [GitHub Copilot Documentation](https://docs.github.com/copilot)
- [Creating Custom Agents](https://docs.github.com/copilot/how-tos/use-copilot-agents/coding-agent/create-custom-agents)
- [Custom Agents Template Repository](https://github.com/docs/custom-agents-template)
- [Best Practices Guide](https://github.blog/ai-and-ml/github-copilot/how-to-write-a-great-agents-md-lessons-from-over-2500-repositories/)

## Contributing

Contributions are welcome! If you create a useful agent template, consider sharing it by:

1. Creating a new `.agent.md` file
2. Adding clear documentation
3. Submitting a pull request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

If you have questions or issues:

1. Check the [GitHub Copilot documentation](https://docs.github.com/copilot)
2. Review the troubleshooting section above
3. Open an issue in this repository
