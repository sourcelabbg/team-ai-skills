---
name: write-test-plan
description: Draft a test plan for a feature or change before writing tests. Use when the user asks for a "test plan", "what should I test", "test strategy", or is about to add tests to a non-trivial change.
version: 0.1.0
---

# Write a Test Plan

Produce a short, concrete test plan before writing any test code.

## When to use

- A feature is designed but not yet tested
- The user asks "what should I test here?"
- A bug fix needs a regression test

## Process

1. **Identify the contract** — what does this code promise callers?
2. **List the cases** — happy path, boundaries, error paths, concurrency.
3. **Pick the level** for each case — unit, integration, or end-to-end.
   Default to the cheapest level that can actually catch the bug.
4. **Name what you will not test** and say why. An untested area named
   explicitly is a decision; an unnamed one is an accident.

## Output format

| Case | Level | Why it matters |
|------|-------|----------------|
| ...  | unit  | ...            |

Then: **Not covered:** ... (with reasoning)

## House rules

<!-- TODO: replace with your team's real testing rules. -->
- TODO: e.g. test runner + command
- TODO: e.g. coverage floor, or "no coverage gate, use judgment"
- TODO: e.g. no network in unit tests
