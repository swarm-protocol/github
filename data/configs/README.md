# Configuration Files

This directory contains configuration templates and examples.

## Repository Configuration Files

The repository includes several root-level configuration files:

| File | Purpose |
|------|---------|
| `/.gitignore` | Git ignore patterns for the entire repository |
| `/.editorconfig` | Editor settings for consistent formatting |
| `/terraform/.gitignore` | Terraform-specific ignore patterns |
| `/terraform/terraform.tfvars.example` | Example Terraform variables file |

## Contents

Configuration templates and example files will be added here.

### Planned Configurations

- Environment variable templates (.env.example)
- Agent configuration defaults
- Deployment configurations
- CI/CD configurations

## Security

**IMPORTANT**: Never commit actual secrets or credentials to this directory.

- Use `.example` suffix for templates
- Document all required variables
- Provide safe default values
- Add sensitive configs to .gitignore

Use `@code-reviewer` to check for security issues in configurations.
