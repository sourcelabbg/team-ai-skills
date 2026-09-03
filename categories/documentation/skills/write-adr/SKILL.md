---
name: write-adr
description: Record an architecture decision as an ADR. Use when the user makes a design decision worth remembering, says "write this up", "record this decision", "we should ADR this", or picks between architectural options.
version: 0.1.0
---

# Write an ADR

Capture a decision and, more importantly, the reasoning that produced it.

## When to use

- A choice was made between real alternatives
- The reasoning will not be obvious from the code in six months
- Someone will predictably ask "why is it like this?"

Do **not** write an ADR for reversible, low-stakes choices.

## Location

`docs/adr/NNNN-short-title.md` — zero-padded, sequential.

## Template

```markdown
# NNNN. <Short title in the imperative>

Date: YYYY-MM-DD
Status: Proposed | Accepted | Superseded by [NNNN](NNNN-....md)

## Context

The forces at play. What made this a decision rather than an obvious call?
Include constraints that were real at the time, even if they later lift.

## Decision

What we are doing, stated actively: "We will ..."

## Consequences

What becomes easier. What becomes harder. What we are now committed to,
and what we would have to unwind to change our minds.

## Alternatives considered

Each option, and the specific reason it lost. An alternative with no
stated reason for losing was not really considered.
```

## Rules

- Never edit an accepted ADR to change the decision — supersede it instead.
- Write the losing options honestly; the value is in the tradeoff, not the verdict.
