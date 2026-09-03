---
name: sql-conventions
description: Apply Sourcelab's SQL and schema-migration conventions. Use when writing queries, designing tables, or creating database migrations.
version: 0.1.0
---

# SQL & Migration Conventions

## When to use

- Writing or reviewing SQL
- Designing a table or changing a schema
- Creating a migration

## Query style

<!-- TODO: replace with your team's real rules. -->
- TODO: e.g. keywords uppercase, identifiers `snake_case`
- TODO: e.g. always alias tables; never `SELECT *` in application code
- Prefer explicit `JOIN ... ON` over implicit comma joins.

## Schema

- TODO: e.g. singular vs plural table names — pick one and hold it
- Every table gets a primary key and `created_at`.
- Name foreign keys `<referenced_table>_id`.

## Migrations

Migrations are the riskiest code the team writes. Treat them accordingly:

- **Every migration is reversible**, or explicitly documents why it is not.
- **Expand, then contract.** Add the new column, backfill, switch reads,
  and only drop the old column in a later deploy. Never in one step.
- **No blocking locks on large tables** during business hours.
- Backfills run in batches, not one statement.

## Review checklist

- [ ] Runs against a production-sized copy without a long lock
- [ ] Rollback tested, not just written
- [ ] Indexes considered for new query patterns
- [ ] TODO: team migration tool + command
