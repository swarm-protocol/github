# Contributing to GitHub Copilot Custom Agents Templates

Thank you for your interest in contributing to this project! This document provides guidelines for contributing new agent templates, improvements, and documentation.

## How to Contribute

### Types of Contributions

We welcome the following types of contributions:

1. **New Agent Templates**: Share agent templates you've created that could benefit others
2. **Template Improvements**: Enhance existing templates with better examples or documentation
3. **Documentation**: Improve guides, add troubleshooting tips, or clarify instructions
4. **Bug Fixes**: Fix errors or issues in existing templates
5. **Best Practices**: Share insights and patterns that make agents more effective

## Adding a New Agent Template

### Before You Start

1. Check if a similar agent template already exists
2. Ensure your agent follows GitHub's custom agent guidelines
3. Test your agent thoroughly in a real project
4. Make sure it provides value beyond existing templates

### Template Requirements

Your agent template should include:

- **Clear YAML front matter** with `name` and `description`
- **Well-defined role** and responsibilities
- **Specific commands** relevant to the agent's purpose
- **Code examples** demonstrating the agent's style
- **Boundaries** clearly stating what the agent should NOT do
- **Best practices** specific to the agent's domain
- **Real-world examples** showing the agent in action

### Submission Process

1. **Fork this repository**
2. **Create a new branch** for your agent:
   ```bash
   git checkout -b add-agent-name
   ```

3. **Create your agent file** in `.github/agents/`:
   ```bash
   # Example: .github/agents/security-auditor.agent.md
   ```

4. **Follow the template structure**:
   - Use the same sections as existing agents
   - Provide concrete examples, not just descriptions
   - Include both commented and uncommented versions if helpful

5. **Update documentation**:
   - Add your agent to `.github/agents/README.md`
   - Add your agent to the main `README.md`
   - Include a brief description and use case

6. **Test your agent**:
   - Use it in a real project
   - Verify it follows the instructions correctly
   - Ensure it respects boundaries

7. **Submit a pull request**:
   - Provide a clear description of your agent
   - Explain the use case and benefits
   - Include examples of the agent in action (optional but helpful)

## Template Guidelines

### Naming Conventions

- **File names**: Use kebab-case (e.g., `api-security-expert.agent.md`)
- **Agent names**: Use kebab-case in YAML (e.g., `api-security-expert`) - this matches the file name
- **Descriptions**: Be specific and action-oriented

### Code Style

- Use consistent formatting across the template
- Include syntax highlighting in code blocks
- Provide working, tested code examples
- Follow the language/framework conventions you're documenting

### Documentation Style

- Write in clear, concise language
- Use active voice
- Include examples for every major concept
- Structure content with clear headings
- Use bullet points for lists
- Use emoji sparingly and consistently

### Quality Standards

All agent templates should:

- ✅ Be properly formatted Markdown
- ✅ Include complete YAML front matter
- ✅ Have tested, working code examples
- ✅ Specify clear boundaries and restrictions
- ✅ Follow GitHub's agent guidelines
- ✅ Be useful for real-world scenarios
- ✅ Not duplicate existing templates

## Agent Template Checklist

Before submitting, verify your template includes:

- [ ] YAML front matter with `name` and `description`
- [ ] Clear agent role and expertise section
- [ ] Relevant commands for the agent's domain
- [ ] Code style guidelines with examples
- [ ] Testing requirements (if applicable)
- [ ] Project context section
- [ ] Boundaries and restrictions
- [ ] Git workflow guidelines
- [ ] Best practices
- [ ] Real-world examples
- [ ] Additional resources

## Improving Existing Templates

### Types of Improvements

- Add missing sections or examples
- Improve clarity of instructions
- Update outdated information
- Fix errors or typos
- Add troubleshooting tips
- Include additional use cases

### Process

1. Open an issue describing the improvement
2. Wait for feedback (or proceed if it's a clear fix)
3. Make your changes
4. Submit a pull request referencing the issue

## Documentation Contributions

### Areas for Documentation

- Troubleshooting guides
- Common pitfalls and solutions
- Advanced techniques
- Integration examples
- Video tutorials (link to external resources)

### Documentation Style

- Keep it practical and actionable
- Include code examples
- Link to official GitHub documentation
- Use screenshots when helpful
- Test all instructions before submitting

## Code of Conduct

### Our Standards

- Be respectful and inclusive
- Welcome newcomers
- Focus on constructive feedback
- Assume good intentions
- Help others learn

### Unacceptable Behavior

- Harassment or discrimination
- Trolling or insulting comments
- Publishing others' private information
- Other unprofessional conduct

## Questions?

If you have questions about contributing:

1. Check the [README](README.md) for project overview
2. Look at existing agents for examples
3. Open an issue with your question
4. Tag it with `question` label

## Review Process

### What We Look For

- **Usefulness**: Does this agent solve a real problem?
- **Quality**: Is it well-documented with clear examples?
- **Originality**: Does it add value beyond existing templates?
- **Completeness**: Does it include all recommended sections?
- **Testing**: Has it been tested in a real scenario?

### Timeline

- Initial review: Within 3-5 days
- Feedback: We'll provide constructive feedback
- Approval: Once all requirements are met
- Merge: After approval and any final adjustments

## Recognition

Contributors will be:
- Listed in commit history
- Credited in release notes
- Acknowledged in the community

## License

By contributing, you agree that your contributions will be released into the public domain under the Unlicense, the same license as this project.

## Getting Help

- **Issues**: For bugs or feature requests
- **Discussions**: For questions and community chat
- **Pull Requests**: For contributing code or documentation

## Thank You!

Your contributions help developers worldwide create better custom agents. We appreciate your time and effort in making this project better for everyone! 🙏
