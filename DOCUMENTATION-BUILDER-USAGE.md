# Using the Documentation Builder Agent

This guide shows how to use the `documentation-builder` agent to generate README.md and CLAUDE.md files from templates.

## Quick Example

### Step 1: Create Template Files

First, create template files with placeholders:

**README.template.md**:
```markdown
# {{PROJECT_NAME}}

{{DESCRIPTION}}

Version: {{VERSION}}
Last Updated: {{DATE}}
```

**CLAUDE.template.md**:
```markdown
# {{PROJECT_NAME}} - Claude AI Context

Last Updated: {{DATE}}

## Overview
{{DESCRIPTION}}
```

### Step 2: Invoke the Agent

In GitHub Copilot Chat:

```
@documentation-builder Generate README.md and CLAUDE.md from the template files. 
Use these values:
- PROJECT_NAME: "My Awesome Project"
- DESCRIPTION: "A tool that does amazing things"
- VERSION: "1.0.0"
- DATE: "2026-01-30"
```

### Step 3: Review Generated Files

The agent will:
1. Read the template files
2. Replace all `{{VARIABLE}}` placeholders
3. Generate README.md and CLAUDE.md
4. Validate the markdown

### Step 4: Commit Changes

```bash
git add README.md CLAUDE.md
git commit -m "docs: generate from templates"
git push
```

## Advanced Usage

### Using Package.json Values

```
@documentation-builder Generate docs from templates, extracting 
PROJECT_NAME and VERSION from package.json
```

### Preserving Custom Sections

Add special markers in your generated files to preserve manual edits:

```markdown
<!-- BEGIN CUSTOM SECTION -->
This content won't be replaced during regeneration.
<!-- END CUSTOM SECTION -->
```

### Multiple Template Sources

```
@documentation-builder Combine header.template.md, features.template.md, 
and footer.template.md into README.md
```

## Available Variables

Common template variables:

- `{{PROJECT_NAME}}` - Project name
- `{{DESCRIPTION}}` - Short description
- `{{VERSION}}` - Version number
- `{{DATE}}` - Current date
- `{{LICENSE}}` - License type
- `{{AUTHOR}}` - Author name
- `{{REPOSITORY_STRUCTURE}}` - Directory tree
- `{{TECH_STACK}}` - Technologies used

## Template Examples

See the repository root for example templates:
- `README.template.md` - Example README template
- `CLAUDE.template.md` - Example CLAUDE template

## Tips

1. **Backup First**: Always commit before regenerating
2. **Test Variables**: Check that all variables are replaced
3. **Validate Output**: Use markdown linter to check syntax
4. **Preserve Custom Content**: Use special markers for manual sections
5. **Version Control**: Keep templates in version control

## Troubleshooting

### Variables Not Replaced

If you see `{{VARIABLE}}` in output:
- Check variable name spelling
- Ensure value was provided to the agent
- Verify template file has correct syntax

### Markdown Invalid

If generated markdown has issues:
- Run `npx markdownlint README.md` to check
- Verify template syntax is valid
- Check for unescaped special characters

### Agent Not Found

If `@documentation-builder` doesn't work:
- Ensure file is in `.github/agents/`
- File must be named `documentation-builder.agent.md`
- Must be committed to default branch
- Wait a few minutes for GitHub to process

## Real-World Example

This repository uses the documentation-builder agent! Check:
- `README.template.md` - Template with variables
- `CLAUDE.template.md` - Template for AI context
- `README.md` - Generated from template
- `CLAUDE.md` - Generated from template

The agent maintains consistency between README and CLAUDE files while allowing easy updates through templates.
