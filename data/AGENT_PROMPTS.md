# Agent Prompts for Data Directory

This file contains instructions and prompts for AI coding agents working in the `data/` directory.

## Code Reviewer & Security Auditor Agents

When working with data files, schemas, and configurations, use **@code-reviewer** for integrity and **@security-auditor** for security:

```
@code-reviewer validate schemas in data/schemas/
@security-auditor check configuration files for security issues
```

## Tasks for Agents

### 1. Schema Management (`data/schemas/`)

**Create Schema:**
```
@documentation-expert create JSON schema for agent configuration
```

**Validate Data:**
```
@code-reviewer validate example data against schemas
```

**Update Schema:**
```
@refactoring-assistant update schema to include new fields
```

### 2. Configuration Management (`data/configs/`)

**Create Config Template:**
```
@documentation-expert create configuration template for new agent type
```

**Review Security:**
```
@security-auditor check for hardcoded secrets in config files
```

**Update Config:**
```
@refactoring-assistant update all config files to new format
```

### 3. Example Data (`data/examples/`)

**Generate Examples:**
```
@test-specialist create example test data for agent responses
```

**Validate Examples:**
```
@code-reviewer verify examples match schemas
```

## Schema Guidelines

### JSON Schema Format
```json
{
  "$schema": "http://json-schema.org/draft-07/schema#",
  "title": "Agent Configuration",
  "type": "object",
  "properties": {
    "name": {
      "type": "string",
      "description": "Agent name"
    },
    "version": {
      "type": "string",
      "pattern": "^\\d+\\.\\d+\\.\\d+$"
    }
  },
  "required": ["name", "version"]
}
```

### OpenAPI Schema Format
```yaml
openapi: 3.0.0
info:
  title: Agent API
  version: 1.0.0
paths:
  /agents:
    get:
      summary: List all agents
      responses:
        '200':
          description: Success
```

## Configuration Guidelines

### Environment Variables (.env.example)
```bash
# Never commit actual values
# Always provide example values
API_KEY=your_api_key_here
DATABASE_URL=postgresql://localhost/dbname
```

### Agent Configuration (agent-config.yaml)
```yaml
# Default configuration for agents
agent:
  name: "example-agent"
  version: "1.0.0"
  tools:
    - read
    - edit
    - search
```

## Data Validation Commands

```bash
# Validate JSON against schema
@code-reviewer validate data/examples/agent-config.json against data/schemas/agent-config.schema.json

# Check YAML syntax
@code-reviewer check YAML syntax in data/configs/

# Verify no secrets committed
@security-auditor scan data/ for potential secrets or credentials

# Ensure consistent formatting
@refactoring-assistant format all JSON files in data/
```

## Security Checklist

When adding data files:

- [ ] No API keys, tokens, or passwords
- [ ] No PII (personally identifiable information)
- [ ] No internal URLs or endpoints
- [ ] Sensitive files added to .gitignore
- [ ] Example values clearly marked as examples
- [ ] Configuration templates documented

## Common Data Patterns

### Agent Configuration
```json
{
  "name": "agent-name",
  "description": "Agent description",
  "tools": ["tool1", "tool2"],
  "model": "gpt-4",
  "temperature": 0.7
}
```

### API Response
```json
{
  "status": "success",
  "data": {},
  "metadata": {
    "timestamp": "2026-01-30T12:00:00Z",
    "version": "1.0.0"
  }
}
```

### Workflow Definition
```yaml
name: agent-workflow
steps:
  - name: step1
    action: read_file
    params:
      path: src/example.js
  - name: step2
    action: analyze
    depends_on: step1
```

## Quality Checklist

Before committing data files:

- [ ] Valid JSON/YAML syntax
- [ ] Matches schema (if applicable)
- [ ] No sensitive information
- [ ] Properly commented
- [ ] Consistent formatting
- [ ] Example values clearly marked
- [ ] Documentation updated

## Resources

- [JSON Schema Validator](https://www.jsonschemavalidator.net/)
- [YAML Validator](https://www.yamllint.com/)
- [OpenAPI Tools](https://openapi.tools/)
