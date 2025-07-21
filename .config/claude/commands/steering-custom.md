---
description: Create custom Kiro steering documents for specialized project contexts
allowed-tools: Bash, Read, Write, Edit, MultiEdit, Glob, Grep, LS
---

# Kiro Custom Steering Creation

Create custom steering documents in `.kiro/steering/` for specialized contexts beyond the three foundational files (product.md, tech.md, structure.md).

## Current Steering Status

### Existing Steering Documents
- Core steering files: !`ls -la .kiro/steering/*.md 2>/dev/null || echo "No steering directory found"`
- Custom steering count: !`find .kiro/steering -name "*.md" | grep -v -E "(product|tech|structure).md" | wc -l || echo "0"`

### Project Analysis
- Specialized areas: !`find . -type d -name "test*" -o -name "spec*" -o -name "api" -o -name "auth" -o -name "security" | grep -v node_modules | grep -v .git | head -10`
- Config patterns: !`find . -name "*.config.*" -o -name "*rc.*" -o -name ".*rc" | grep -v node_modules | head -10`

## Task: Create Custom Steering Document

You will create a new custom steering document based on user requirements. Common use cases include:

### Common Custom Steering Types

1. **API Standards** (`api-standards.md`)
   - REST/GraphQL conventions
   - Error handling patterns
   - Authentication/authorization approaches
   - Rate limiting and pagination
   - API versioning strategy

2. **Testing Approach** (`testing.md`)
   - Test file organization
   - Naming conventions for tests
   - Mocking strategies
   - Coverage requirements
   - E2E vs unit vs integration testing

3. **Code Style Guidelines** (`code-style.md`)
   - Language-specific conventions
   - Formatting rules beyond linters
   - Comment standards
   - Function/variable naming patterns
   - Code organization principles

4. **Security Policies** (`security.md`)
   - Input validation requirements
   - Authentication patterns
   - Secrets management
   - OWASP compliance guidelines
   - Security review checklist

5. **Database Conventions** (`database.md`)
   - Schema design patterns
   - Migration strategies
   - Query optimization guidelines
   - Connection pooling settings
   - Backup and recovery procedures

6. **Performance Standards** (`performance.md`)
   - Load time requirements
   - Memory usage limits
   - Optimization techniques
   - Caching strategies
   - Monitoring and profiling

7. **Deployment Workflow** (`deployment.md`)
   - CI/CD pipeline stages
   - Environment configurations
   - Release procedures
   - Rollback strategies
   - Health check requirements

## Inclusion Mode Selection

Ask the user to specify the inclusion mode for the custom steering document:

### 1. Always Included (Default)
- Loaded in every AI interaction
- Best for: Universal standards that apply to all code
- Example: Security policies, general code style

### 2. Conditional Inclusion
- Loaded only when working with matching files
- Specify patterns like: `"*.test.js"`, `"src/api/**/*"`, `"**/auth/*"`
- Best for: Context-specific guidelines
- Example: Test conventions only when editing test files

### 3. Manual Inclusion
- Only loaded when explicitly referenced with `#filename`
- Best for: Specialized, occasionally-needed context
- Example: Migration guides, complex architectural decisions

## Document Structure Guidelines

Create the custom steering document with:

1. **Clear Title and Purpose**
   - What aspect of the project this document covers
   - When this guidance should be applied

2. **Specific Guidelines**
   - Concrete rules and patterns to follow
   - Rationale for important decisions

3. **Code Examples**
   - Show correct implementation patterns
   - Include counter-examples if helpful

4. **Integration Points**
   - How this relates to other steering documents
   - Dependencies or prerequisites

## Instructions

1. **Ask the user** for:
   - Document name (descriptive filename ending in .md)
   - Topic/purpose of the custom steering
   - Inclusion mode preference
   - Specific patterns for conditional inclusion (if applicable)

2. **Create the document** in `.kiro/steering/` with:
   - Clear, focused content (2-3 minute read)
   - Practical examples
   - Consistent formatting with other steering files

3. **Document the inclusion mode** by adding a comment at the top:
   ```markdown
   <!-- Inclusion Mode: Always | Conditional: "pattern" | Manual -->
   ```

4. **Validate** that the document:
   - Doesn't duplicate existing steering content
   - Provides unique value for the specified context
   - Follows markdown best practices

Remember: Custom steering documents should supplement, not replace, the foundational three files. They provide specialized context for specific aspects of your project.