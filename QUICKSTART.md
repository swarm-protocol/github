# Quick Start Guide: Using GitHub Copilot Custom Agents

This guide will help you get started with GitHub Copilot custom agents in under 5 minutes.

## Prerequisites

- GitHub Copilot subscription (Pro, Business, or Enterprise)
- Access to a GitHub repository
- Basic understanding of your project's structure

## Step 1: Choose Your Agent (2 minutes)

Browse the available templates in `.github/agents/`:

- **Starting from scratch?** Use `TEMPLATE.agent.md`
- **Need testing help?** Use `test-specialist.agent.md`
- **Working on docs?** Use `documentation-expert.agent.md`
- **Reviewing code?** Use `code-reviewer.agent.md`
- **Refactoring code?** Use `refactoring-assistant.agent.md` (ready to use!)

## Step 2: Set Up Your Agent (2 minutes)

### Option A: Use a Ready-Made Agent

For the refactoring assistant (already uncommented and ready):

```bash
# Create the agents directory
mkdir -p .github/agents

# Copy the refactoring assistant
curl -o .github/agents/refactoring-assistant.agent.md \
  https://raw.githubusercontent.com/swarm-protocol/github/main/.github/agents/refactoring-assistant.agent.md

# Commit and push
git add .github/agents/
git commit -m "Add refactoring assistant agent"
git push
```

### Option B: Customize a Template

For other agents (they're commented out, so you need to uncomment):

```bash
# Create the agents directory
mkdir -p .github/agents

# Copy a template
cp TEMPLATE.agent.md .github/agents/my-agent.agent.md

# Edit the file
nano .github/agents/my-agent.agent.md
# or
code .github/agents/my-agent.agent.md
```

Key changes to make:
1. **Uncomment** the YAML front matter and content (remove `<!--` and `-->`)
2. **Edit the name**: Change `your-agent-name` to something like `python_test_expert`
3. **Edit the description**: Make it specific to your needs
4. **Customize commands**: Add your project's build/test commands
5. **Add examples**: Include code examples from your project
6. **Save and commit**

```bash
git add .github/agents/
git commit -m "Add custom agent"
git push
```

## Step 3: Use Your Agent (1 minute)

### In GitHub Copilot Chat

1. Open GitHub Copilot Chat in your IDE
2. Type `@your-agent-name` followed by your request
3. Example: `@refactoring-assistant help me refactor this function`

### Example Conversations

#### With Test Specialist
```
@test-specialist write unit tests for the UserService class
```

#### With Documentation Expert
```
@documentation-expert create API documentation for the /api/users endpoint
```

#### With Code Reviewer
```
@code-reviewer review this pull request for security issues
```

#### With Refactoring Assistant
```
@refactoring-assistant this function is too complex, help me break it down
```

## Common First-Time Issues

### Issue: Agent not responding

**Solution:**
1. Make sure the file is named `*.agent.md`
2. Verify it's in `.github/agents/` directory
3. Check that YAML front matter is uncommented
4. Ensure the file is committed and pushed
5. Wait a few minutes for GitHub to process it

### Issue: Agent doesn't follow instructions

**Solution:**
1. Be more specific in your agent instructions
2. Add concrete code examples
3. Explicitly state boundaries (what NOT to do)
4. Test with simple requests first

### Issue: Can't find my agent

**Solution:**
1. Type `@` in Copilot Chat to see available agents
2. Check the agent name matches the YAML `name` field
3. Verify you have access to custom agents (Pro+ subscription)

## Pro Tips

### 1. Start Simple
Don't try to create the perfect agent immediately. Start with basic instructions and refine based on results.

### 2. Test Incrementally
Use your agent for small tasks first, then gradually increase complexity.

### 3. Provide Context
Give your agent relevant code snippets or file names in your requests.

### 4. Use Examples
The more examples you include in your agent file, the better it performs.

### 5. Set Clear Boundaries
Explicitly tell your agent what NOT to do to avoid unwanted changes.

## Example: Creating a Simple Agent (Complete Walkthrough)

Let's create a simple Python linting agent:

1. **Create the file**: `.github/agents/python-linter.agent.md`

2. **Add this content**:
```markdown
---
name: python_linter
description: Python code quality and style checker
---

# Python Linting Agent

You are a Python code quality specialist. Your role is to:
- Check Python code against PEP 8 standards
- Identify code smells and anti-patterns
- Suggest improvements for readability
- Never modify code, only provide suggestions

## Commands

\`\`\`bash
# Check style
flake8 .

# Format code
black .

# Type check
mypy .
\`\`\`

## Code Style

Follow PEP 8. Example:

\`\`\`python
# Good
def calculate_total(items: list[Item]) -> float:
    """Calculate total price of items."""
    return sum(item.price for item in items)

# Bad
def calc(x):
    tot=0
    for i in x:
        tot=tot+i.price
    return tot
\`\`\`

## Boundaries

- ❌ Never modify code files
- ❌ Never remove working code
- ✅ Only provide suggestions and explanations
```

3. **Commit and push**:
```bash
git add .github/agents/python-linter.agent.md
git commit -m "Add Python linting agent"
git push
```

4. **Use it**:
```
@python_linter review this function for PEP 8 compliance
```

## Next Steps

1. ✅ **Read the full guide**: See [.github/agents/README.md](.github/agents/README.md)
2. 📚 **Explore templates**: Check out all available templates
3. 🎯 **Create specialized agents**: Build agents for your specific needs
4. 🤝 **Share with your team**: Add agents to your organization's `.github-private` repo
5. 📈 **Iterate**: Refine your agents based on real-world usage

## Resources

- [GitHub Copilot Docs](https://docs.github.com/copilot)
- [Creating Custom Agents](https://docs.github.com/copilot/how-tos/use-copilot-agents/coding-agent/create-custom-agents)
- [Agent Best Practices](https://github.blog/ai-and-ml/github-copilot/how-to-write-a-great-agents-md-lessons-from-over-2500-repositories/)
- [Template Repository](https://github.com/swarm-protocol/github)

## Need Help?

- 📖 Check the [README](.github/agents/README.md) for detailed instructions
- 🐛 Found a bug? [Open an issue](https://github.com/swarm-protocol/github/issues)
- 💡 Have a question? [Start a discussion](https://github.com/swarm-protocol/github/discussions)

---

**Congratulations!** 🎉 You're now ready to use GitHub Copilot custom agents. Start with a simple agent and build from there!
