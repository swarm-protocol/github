# Agent Prompts for Documentation Directory

This file contains instructions and prompts for AI coding agents working in the `docs/` directory.

## Documentation Expert Agent

When building out documentation in this directory, use the **@documentation-expert** agent:

```
@documentation-expert create API documentation for the agent framework
```

### Tasks for Documentation Agent

1. **API Documentation** (`docs/api/`)
   - Document public APIs and interfaces
   - Include parameter descriptions, return values, and examples
   - Add code samples for common use cases
   - Keep API references up-to-date with code changes

2. **Guides** (`docs/guides/`)
   - Write step-by-step tutorials
   - Include screenshots and diagrams where helpful
   - Cover beginner to advanced topics
   - Ensure guides are actionable and practical

3. **Reference** (`docs/reference/`)
   - Create technical specifications
   - Document architecture and design decisions
   - Maintain glossaries and terminology
   - Include diagrams and visual aids

## Guidelines

### Writing Style
- Use clear, concise language
- Write in active voice
- Break complex topics into smaller sections
- Include examples and code snippets

### Structure
- Start with an overview
- Use consistent heading hierarchy
- Add a table of contents for long documents
- End with related resources or next steps

### Code Examples
- Test all code examples
- Use syntax highlighting
- Include expected output
- Add comments to explain complex parts

## Templates

### API Documentation Template
```markdown
# Function/Class Name

Brief description of what it does.

## Syntax

\`\`\`language
function_signature
\`\`\`

## Parameters

- `param1` (type): Description
- `param2` (type): Description

## Returns

(type): Description of return value

## Example

\`\`\`language
// Example code
\`\`\`

## See Also

- Related functions
- Related concepts
```

### Guide Template
```markdown
# Guide Title

Brief introduction explaining what the reader will learn.

## Prerequisites

- Required knowledge
- Required tools/setup

## Step 1: First Step

Detailed instructions...

## Step 2: Second Step

Detailed instructions...

## Conclusion

Summary and next steps.

## Troubleshooting

Common issues and solutions.
```

## Agent Commands

Useful commands when working with documentation:

```bash
# Generate API docs from code
@documentation-expert extract API documentation from src/

# Update existing guide
@documentation-expert update docs/guides/getting-started.md with latest changes

# Create new reference document
@documentation-expert create reference documentation for agent architecture

# Review documentation for clarity
@documentation-expert review docs/ for clarity and completeness
```

## Quality Checklist

Before committing documentation:

- [ ] Spell-checked and grammar-checked
- [ ] Links verified (no broken links)
- [ ] Code examples tested
- [ ] Screenshots current and relevant
- [ ] Proper markdown formatting
- [ ] Cross-references added
- [ ] Table of contents updated
- [ ] Consistent with style guide

## Resources

- [Markdown Guide](https://www.markdownguide.org/)
- [Documentation Best Practices](https://documentation.divio.com/)
- [Technical Writing Guidelines](https://developers.google.com/tech-writing)
