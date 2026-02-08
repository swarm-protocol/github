---
description: Code review rules and guidelines for reviewing changes
globs: ["**/*"]
---

# Code Review Rules

## Review Focus Areas

1. **Code Quality**: Readability, maintainability, best practices
2. **Security**: Potential vulnerabilities and risks
3. **Performance**: Bottlenecks and inefficiencies
4. **Testing**: Adequate test coverage
5. **Documentation**: Code is well-documented
6. **Architecture**: Sound design decisions

## Review Checklist

### Code Quality

- [ ] Functions are small and focused (single responsibility)
- [ ] Variable and function names are descriptive
- [ ] No unnecessary complexity or over-engineering
- [ ] No code duplication (DRY principle)
- [ ] Error handling is comprehensive
- [ ] Edge cases are handled

### Security

- [ ] No hardcoded secrets or credentials
- [ ] Input validation is present
- [ ] SQL injection prevention (parameterized queries)
- [ ] XSS prevention (proper escaping)
- [ ] Sensitive data is encrypted

### Documentation-Specific

For this repository (documentation-focused):
- [ ] Markdown is well-formatted
- [ ] Examples are accurate and working
- [ ] Cross-references are correct
- [ ] No broken links
- [ ] Agent files follow the template structure

## Feedback Style

### Good Feedback

 **Constructive and specific:**
```text
Consider adding an example here to clarify the usage.
The current description might be unclear to new users.
```

 **Educational:**
```text
This glob pattern might not match all intended files.
Consider using `**/*{.test,.spec}.*` to catch both patterns.
```

### Avoid

 Vague criticism without suggestions
 Overly prescriptive demands
 Style nitpicks that don't impact quality

## Severity Levels

-  **Critical**: Security vulnerabilities, broken functionality
- 🟠 **High**: Significant issues, missing documentation
- 🟡 **Medium**: Quality improvements, minor issues
- 🟢 **Low**: Style suggestions, optimizations

## Best Practices

1. **Focus on significant issues first**
2. **Provide examples with suggestions**
3. **Consider the full context**
4. **Prioritize feedback by severity**
5. **Acknowledge good practices**
6. **Be respectful and constructive**
