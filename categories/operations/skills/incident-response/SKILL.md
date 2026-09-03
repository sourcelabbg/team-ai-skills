---
name: incident-response
description: Work through a production incident in a disciplined order. Use when the user reports something broken in production, says "we have an incident", "prod is down", "users are reporting errors", or is on-call and triaging.
version: 0.1.0
---

# Incident Response

Restore service first. Understand it second. Both, in that order.

## When to use

- Production is degraded or down
- An alert fired and someone is triaging it

## Order of operations

1. **Stabilize** — Can we roll back, disable a flag, or shed load right now?
   Mitigation beats diagnosis while users are affected.
2. **Establish the timeline** — When did it start? What shipped near then?
   `git log --since` against the deploy log is usually the fastest lead.
3. **Confirm the blast radius** — Which users, which endpoints, what percentage?
   Write this down before it changes.
4. **Form one hypothesis at a time** and state how you would falsify it.
   Changing several things at once destroys the evidence.
5. **Verify recovery** with a signal, not a vibe — the graph, not a reload.

## Communication

- Post the blast radius and current status before you start digging.
- Update on a fixed cadence even when the update is "still investigating".

## Afterwards

Write a blameless postmortem: timeline, contributing factors, and the specific
change that makes recurrence less likely. An action item without an owner and a
date is not an action item.

<!-- TODO: fill in real specifics for your team. -->
- TODO: dashboards / alerting links
- TODO: rollback command
- TODO: escalation path and on-call rota
