# Data Directory

This directory contains data files, configurations, schemas, and examples used by the agent framework.

## Structure

```
data/
 schemas/     # JSON Schema, OpenAPI specs, data models
 configs/     # Configuration files and templates
 examples/    # Example data and sample files
```

## Purpose

The `data/` directory serves as the central location for all data-related files:

- **Schemas**: JSON schemas, API specifications, and data models
- **Configs**: Configuration templates, environment examples, and settings
- **Examples**: Sample data files for testing and demonstration

## Usage

### Schemas

Store data validation schemas, API specifications (OpenAPI/Swagger), and database schemas:

```bash
data/schemas/
 agent-config.schema.json
 api-spec.openapi.yaml
 database-models.json
```

### Configs

Configuration templates and example files:

```bash
data/configs/
 .env.example
 agent-defaults.yaml
 deployment-config.json
```

### Examples

Sample data for testing and documentation:

```bash
data/examples/
 sample-agent-response.json
 example-workflow.yaml
 test-data.csv
```

## Guidelines

1. **Schemas**: Use JSON Schema format when possible
2. **Configs**: Never commit secrets or credentials
3. **Examples**: Keep examples minimal but representative
4. **Validation**: Validate data files against schemas
5. **Documentation**: Add comments to explain non-obvious data

## Contributing

When adding data files:

- Use appropriate subdirectory
- Include a comment or README explaining the data
- Validate against schemas when applicable
- Use consistent formatting (JSON, YAML, etc.)
- Add to .gitignore if it contains sensitive data

## See Also

- [JSON Schema](https://json-schema.org/)
- [OpenAPI Specification](https://www.openapis.org/)
- [YAML Reference](https://yaml.org/)
