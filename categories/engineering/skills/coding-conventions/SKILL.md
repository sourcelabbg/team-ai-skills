---
name: coding-conventions
description: Apply Sourcelab's coding conventions when writing or refactoring code. Use when the user asks to "follow our conventions", "match house style", starts new files or modules, or when reviewing code for style consistency.
version: 0.1.0
---

# Coding Conventions

Sourcelab's house style. Apply these when writing new code or refactoring existing code.

## When to use

- Creating a new file, module, or service
- Refactoring existing code
- The user mentions "our conventions", "house style", or "the way we do it"

## Conventions

<!-- TODO: replace with your team's actual rules. Keep each one concrete and checkable. -->

### Naming
- TODO: e.g. files `kebab-case`, types `PascalCase`, functions `camelCase`

### Structure
- TODO: e.g. one exported symbol per file; colocate tests as `*.test.ts`

### Error handling
- TODO: e.g. never swallow errors; wrap with context at boundaries

### Dependencies
- TODO: e.g. no new runtime deps without an ADR

## Checklist

Before considering code done:

- [ ] Matches naming rules above
- [ ] No commented-out code left behind
- [ ] Public functions have types on their boundaries
- [ ] TODO: add team-specific gates (lint, typecheck commands)
