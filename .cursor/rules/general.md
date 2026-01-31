---
description: General project rules for the GitHub Copilot Custom Agents Templates repository
globs: ["**/*"]
---

# General Project Rules

## Project Overview

This repository provides templates and examples for creating GitHub Copilot custom agents. It's primarily a documentation repository with no runtime code.

## Commands

```bash
# No build process - documentation only repository

# Validate markdown files
markdownlint **/*.md

# Check for broken links (if mdl is available)
markdown-link-check README.md

# View directory structure
tree -L 3 -I '.git|node_modules'
```

## Code Style

### Markdown Files

- Use ATX-style headers (`#`, `##`, `###`)
- Include a blank line before and after code blocks
- Use fenced code blocks with language identifiers
- Keep line length reasonable for readability
- Use emoji sparingly and meaningfully

### YAML Front Matter

- Use kebab-case for field names
- Keep descriptions under 100 characters
- Required fields: `name` and `description` for agent files

### File Naming

- Agent files: `agent-name.agent.md` (kebab-case)
- Main documentation: `UPPERCASE.md`
- Templates: `name.template.md`

## Project Structure

```
.
├── .github/agents/      # GitHub Copilot agent definitions
├── .cursor/             # Cursor IDE configuration
├── apt/                 # APT package lists by environment
├── data/                # Data files, configs, schemas
├── docs/                # Documentation files
├── nix/                 # Nix development environments
├── src/                 # Source code and scripts
├── terraform/           # CloudFlare infrastructure modules
├── AGENTS.md            # Navigation hub
├── CLAUDE.md            # Claude AI context
├── CURSOR.md            # Cursor framework docs
└── README.md            # Main readme
```

## Best Practices

1. **Documentation first**: This is a documentation repository - clarity matters
2. **Examples are essential**: Always provide concrete code examples
3. **Test agents**: Verify agents work in real scenarios before committing
4. **Version control**: Check all configurations into git for team sharing
5. **Cross-reference**: Link related documentation files
