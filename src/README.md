# Source Code Directory

This directory contains source code, scripts, and utilities for the agent framework.

## Structure

```
src/
 agents/      # Agent implementation code
 utils/       # Utility functions and helpers
 scripts/     # Automation scripts and tools
```

## Purpose

The `src/` directory contains executable code and scripts:

- **Agents**: Custom agent implementations and extensions
- **Utils**: Reusable utility functions and libraries
- **Scripts**: Automation scripts, deployment tools, and helpers

## Usage

### Agents (`src/agents/`)

Custom agent implementations that extend the base agent framework:

```bash
src/agents/
 custom-agent.js
 specialized-agent.py
 agent-extensions.ts
```

### Utils (`src/utils/`)

Reusable utility functions:

```bash
src/utils/
 file-utils.js
 string-helpers.py
 validation.ts
```

### Scripts (`src/scripts/`)

Automation and deployment scripts:

```bash
src/scripts/
 deploy.sh
 setup-environment.py
 generate-docs.js
```

## Development Guidelines

### Code Style

- Follow language-specific style guides
- Use meaningful variable and function names
- Add comments for complex logic
- Include JSDoc/docstrings for functions
- Keep functions small and focused

### Testing

- Write unit tests for all functions
- Include integration tests for workflows
- Test edge cases and error conditions
- Maintain high test coverage

### Documentation

- Document public APIs
- Include usage examples
- Explain complex algorithms
- Add inline comments for clarity

## Language Support

This repository supports multiple languages:

- **JavaScript/TypeScript**: Node.js scripts and tools
- **Python**: Data processing and utilities
- **Bash**: Shell scripts for automation
- **Go**: High-performance utilities

## Contributing

When adding source code:

1. Place files in appropriate subdirectory
2. Follow existing code style
3. Add tests for new functionality
4. Update documentation
5. Run linters and formatters
6. Test thoroughly before committing

## See Also

- [README.md](../README.md) - Project overview with quick start and contributing guidelines
- [docs/api/](../docs/api/) - API documentation
- [Testing Guide](../docs/guides/testing.md) - Testing guidelines
