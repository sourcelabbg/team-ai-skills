---
name: commit
description: Stage changed files, create git commits in Conventional Commits format, then output a ready-to-paste PR description. Use when the user wants to commit changes ("commit this", "stage and commit", "create a commit").
---

# Commit

Follow these steps in order. Always finish with the PR description step.

## 1. Commit rules
Stage all relevant changed files and create the commit(s):
- Use Conventional Commits format: `type: summary`
  - Examples: `feat: add user endpoint`, `fix: handle expired token`
  - Common types: `feat`, `fix`, `docs`, `refactor`, `test`, `chore`, `ci`, `perf`, `style`
- Message must be concise — no extra commentary, paragraphs, or bullets
- Do not include co-author lines in the commit message
- Split into small logical commits when work is clearly separable

## 2. Before committing
- Verify no debug logs, temporary hacks, or commented-out code remain
- Ensure lint passes (the pre-commit hook will run it)

## 3. PR description (always output at the end)
After committing, always produce a PR description in markdown and print it in the chat for the user to copy. **Do not open a PR** — just hand over the text.

Prefer the repo's `docs/pull_request_template.md` if it exists; otherwise use the bundled template at `pr-template.md` in this skill folder. Fill it in based on the committed changes:
- **Define the problem** — what was broken or missing
- **Solution** — the approach chosen and why (the code shows how)
- **Result** — before/after table, with screenshots if relevant
- **Additional changes** — any side-effect fixes or refactors
