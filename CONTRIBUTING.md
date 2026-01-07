# Contributing to VEXA Execution Language

Thank you for your interest in contributing to VEXA Execution Language (VEL)! We welcome contributions from the community and appreciate your efforts to improve this project.

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [Getting Started](#getting-started)
- [Code Standards](#code-standards)
- [Security Requirements](#security-requirements)
- [Pull Request Process](#pull-request-process)
- [Development Workflow](#development-workflow)
- [Testing](#testing)

## Code of Conduct

Please be respectful and constructive in all interactions. We aim to foster a welcoming and inclusive community.

## Getting Started

1. **Fork the repository** on GitHub
2. **Clone your fork** locally:
   ```bash
   git clone https://github.com/YOUR_USERNAME/VEXA-Execution-Language.git
   cd VEXA-Execution-Language
   ```
3. **Create a feature branch** from `main`:
   ```bash
   git checkout -b feature/your-feature-name
   ```
4. Make your changes following our code standards
5. Test your changes thoroughly
6. Submit a pull request

## Code Standards

All contributions must adhere to the following standards:

### Code Quality

- ✅ **No obfuscated code** - All code must be readable, clear, and well-commented
- ✅ **Follow existing code style** - Code formatting is enforced by StyLua
- ✅ **Use meaningful names** - Variables, functions, and files should have descriptive names
- ✅ **Comment complex logic** - If it's not immediately obvious, add a comment explaining why

### Security-Critical Requirements

- 🚫 **No new network calls / HTTP requests** without clear justification and maintainer approval
  - Any network functionality must be explicitly documented and reviewed
  - Must include justification for why it's necessary
  
- 🚫 **No dynamic `loadstring` or dynamic `require` patterns**
  - VEL is designed to be a safe execution environment
  - Dynamic code execution undermines this safety model
  - Alternatives should be discussed with maintainers first

- ✅ **Parser/execution changes require tests**
  - All changes to the compiler, parser, or executor must include test coverage
  - Tests should cover both expected behavior and edge cases

### Code Review Requirements

Changes to the following areas require extra scrutiny and approval from core maintainers (`@SamJustSam-create` and `@ChickenStrips0572`):

- `/ExcutionLang/` - Core language implementation
- `/runtime/` - Runtime execution environment (when implemented)
- `/parser/` - Parser logic (when implemented)
- `/sandbox/` - Sandboxing features (when implemented)

## Security Requirements

Security is a top priority for VEL. All contributions must:

### Must Not Introduce

- ❌ Arbitrary code execution vulnerabilities
- ❌ Sandbox escape mechanisms
- ❌ Memory exhaustion attacks
- ❌ Infinite loop possibilities (without safeguards)
- ❌ Input validation bypasses

### Must Maintain

- ✅ Execution sandboxing boundaries
- ✅ Resource limits and safety checks
- ✅ Input validation and sanitization
- ✅ Predictable, deterministic behavior

### Security-Sensitive Changes

If your change affects any of the following, it requires additional security review:

- Execution sandboxing
- Permission systems
- Resource limits (memory, CPU, execution time)
- Parser/interpreter core
- Input validation or sanitization

Please clearly document the security implications in your pull request.

## Pull Request Process

1. **Use the PR template** - Fill out all sections of the pull request template
2. **Write a clear description** - Explain what changes you made and why
3. **Include tests** - Add or update tests for your changes
4. **Ensure CI passes** - All automated checks must pass
   - Selene linting
   - StyLua formatting
5. **Address review feedback** - Respond to reviewer comments and make requested changes
6. **Keep PRs focused** - One feature or fix per PR when possible

## What to Include in Pull Requests

### Required Information

- **Clear description of changes** - What did you change and why?
- **Rationale** - Why is this change necessary or beneficial?
- **Test coverage** - How did you test this? What tests did you add?
- **Breaking changes** - Clearly document any breaking changes

### Security Impact Assessment

For any PR, you must assess whether it affects:

- Execution sandboxing
- Permission system
- Resource limits (memory, CPU, execution time)
- Parser/interpreter core
- Input validation

If yes, describe the security implications in detail.

## Development Workflow

### Setting Up Your Development Environment

VEL is written in Luau and currently requires a Roblox/Luau environment for development.

### Code Formatting

We use **StyLua** for code formatting:

```bash
# Check formatting (this is what CI runs)
stylua --check .

# Auto-format code
stylua .
```

### Linting

We use **Selene** for linting:

```bash
# Run Selene
selene .
```

Configuration is in `selene.toml`.

## Testing

### Test Requirements

- All new features must include tests
- Bug fixes should include a regression test
- Parser/execution changes require comprehensive test coverage

### Running Tests

Currently, testing is manual. When adding functionality:

1. Create example VEL scripts in `/examples/`
2. Manually verify the output is correct
3. Document expected behavior

### Test Guidelines

- Test both success and failure cases
- Test edge cases and boundary conditions
- Test with various input types (numbers, tables, etc.)
- Ensure tests are deterministic and reproducible

## Documentation

When making changes:

- Update README.md if you add new instructions or change behavior
- Add examples to `/examples/` for new features
- Update inline code comments for complex logic
- Document breaking changes prominently

## Questions or Issues?

If you have questions about contributing:

- Open an issue for discussion
- Tag `@SamJustSam-create` or `@ChickenStrips0572` for guidance
- Check existing issues and PRs for similar discussions

## Reporting Security Vulnerabilities

**Do not open public issues for security vulnerabilities.**

Please report security issues privately using [GitHub Security Advisories](https://github.com/SamJustSam-create/VEXA-Execution-Language/security/advisories/new).

See [SECURITY.md](SECURITY.md) for full details on our security policy.

## License

By contributing to VEXA Execution Language, you agree that your contributions will be licensed under the MIT License.

Thank you for contributing to VEL! 🚀
