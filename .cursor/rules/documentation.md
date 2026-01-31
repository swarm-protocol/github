---
description: Documentation rules for markdown files and documentation workflows
globs: ["**/*.md", "docs/**/*"]
---

# Documentation Rules

## Documentation Principles

1. **Clarity over brevity**: Be clear, even if it means more words
2. **Structure matters**: Use consistent headers and organization
3. **Examples are essential**: Show, don't just tell
4. **Keep it current**: Update docs when code changes
5. **Link liberally**: Cross-reference related documentation

## Commands

```bash
# Lint markdown files
markdownlint **/*.md

# Check for broken links
markdown-link-check *.md

# Format markdown (if prettier is available)
prettier --write "**/*.md"

# Generate table of contents
doctoc README.md
```

## Code Style

### Markdown Structure

```markdown
# Main Title

Brief introduction paragraph.

## Table of Contents (optional for long docs)

## Section Header

Content with paragraphs.

### Subsection

More detailed content.

## Code Examples

\`\`\`javascript
// Always include language identifier
const example = 'code';
\`\`\`

## Related

- [Link to related doc](path/to/doc.md)
```

### Headers

- Use ATX-style headers (`#`, `##`, `###`)
- Don't skip levels (don't go from `#` to `###`)
- Include blank line before and after headers
- Use sentence case for headers

### Code Blocks

- Always specify language identifier
- Use appropriate language: `bash`, `javascript`, `python`, `yaml`, etc.
- Keep examples concise but complete
- Include comments for complex code

### Links

- Use relative paths for internal links
- Include descriptive link text
- Check that links aren't broken

## Best Practices

1. **Start with overview**: Begin each doc with purpose and scope
2. **Use tables**: For comparing options or listing items
3. **Include examples**: Practical, working code examples
4. **Add visual hierarchy**: Use formatting to guide readers
5. **Test your docs**: Follow your own instructions to verify they work

## Agent File Format

For `.agent.md` files:

```markdown
---
name: agent-name
description: Brief description (under 100 characters)
---

# Agent Title

Role and expertise description.

## Commands
## Code Style  
## Best Practices
## Boundaries
```

## Boundaries

- ❌ Never remove existing documentation without replacement
- ❌ Never leave broken links
- ✅ Keep formatting consistent with existing docs
- ✅ Update related docs when making changes
