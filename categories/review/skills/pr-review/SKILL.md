---
name: pr-review
description: Review a pull request or working-tree diff against Sourcelab's review bar. Use when the user asks to "review this PR", "check my diff before I push", or wants a second pair of eyes on changes.
version: 0.1.0
---

# PR Review

Review changes against the team's bar. Report findings most-severe first.

## When to use

- The user asks for a review of a PR, branch, or uncommitted diff
- Before pushing a non-trivial change

## Process

1. Get the diff: `git diff main...HEAD` (or the PR target branch).
2. Read the changed files with enough surrounding context to judge them —
   a diff hunk alone hides most bugs.
3. Pass over the change on each axis below, separately.

## Axes

**Correctness** — Does it do what it claims? Look for off-by-one, unhandled
nulls, wrong error paths, race conditions, and cases the tests do not cover.

**Scope** — Does the diff match the stated intent? Flag unrelated drive-by
changes; they belong in their own PR.

**Reuse** — Is there an existing helper this reimplements?

**Reversibility** — Migrations, deletes, and API shape changes: can we undo
this if it goes wrong in production?

## Reporting

For each finding give: file:line, the defect in one sentence, and a concrete
failure scenario (inputs → wrong output). Skip anything you cannot make
concrete — a vague concern is noise.

<!-- TODO: add team-specific blockers, e.g. required approvals, CI gates. -->
