---
description: Testing rules for test files and testing workflows
globs: ["**/*.test.*", "**/*.spec.*", "**/test/**", "**/tests/**", "**/__tests__/**"]
---

# Testing Rules

## Testing Principles

1. **Test behavior, not implementation**: Focus on what the code does, not how
2. **Isolation**: Each test should be independent
3. **Clarity**: Test names should clearly describe what is being tested
4. **Arrange-Act-Assert**: Structure tests with clear phases

## Commands

```bash
# Run all tests (adjust for project)
npm test
pytest
go test ./...
cargo test

# Run with coverage
npm run test:coverage
pytest --cov=src

# Run specific test
npm test -- path/to/test.spec.js
pytest tests/test_specific.py
```

## Code Style

### Test Structure

```javascript
describe('ComponentName', () => {
  describe('methodName', () => {
    it('should do expected behavior when given input', async () => {
      // Arrange
      const input = { /* test data */ };
      
      // Act
      const result = await method(input);
      
      // Assert
      expect(result).toMatchExpectation();
    });
  });
});
```

### Test File Naming

- Place tests next to source files: `component.ts` → `component.test.ts`
- Or in `__tests__` directory: `__tests__/component.test.ts`
- Use `.test.` or `.spec.` suffix consistently

## Best Practices

1. **Mock external dependencies**: Never make real API calls in unit tests
2. **Test edge cases**: null, undefined, empty arrays, boundary conditions
3. **Keep tests fast**: Unit tests should run in milliseconds
4. **Use descriptive names**: Tests should read like documentation
5. **One assertion per test**: When practical, test one behavior per case
6. **Never commit `.only()` or `.skip()`**: These should be temporary

## Boundaries

- ❌ Never modify production code from test files
- ❌ Never use real databases or APIs in unit tests
- ✅ Only create or modify test files
- ✅ Create test utilities and fixtures as needed
