# Adding a skill

A skill is one Markdown file. You don't need to know how the three tools work.

```bash
cp -r templates/skill categories/<category>/skills/<skill-name>
```

Edit the `SKILL.md`, then:

```bash
./scripts/install.sh all && ./scripts/validate.sh
```

Open a PR. On merge, everyone gets it with `git pull`.

## The only field that really matters

`description:` is **all** the assistant sees when deciding whether to use your
skill. Everything else stays invisible until it fires.

Say what it does, then the words someone would actually type:

```yaml
description: Draft a test plan before writing tests. Use when the user asks for
  a "test plan", "what should I test", "test strategy", or is about to add tests
  to a non-trivial change.
```

Too vague and it never triggers — or triggers on everything.

## Two rules

- The folder name and `name:` must match. Use `kebab-case`.
- **No folders inside `skills/`.** Claude looks exactly one level deep;
  anything nested is silently ignored. `validate.sh` catches it.

A skill may have its own `references/`, `scripts/` or `assets/` subfolders —
that's fine, `SKILL.md` still sits at the top.

## Write for a machine, not a reader

Concrete and checkable beats principled:

- Good — "Never `SELECT *` in application code."
- Useless — "Write clean queries."

Keep it to one screen. Long skills get followed loosely; short ones get
followed exactly.

## Test before the PR

Ask your assistant something that *should* trigger it, and something that
shouldn't. `gemini skills list` confirms it was discovered.

## New category

1. `mkdir -p categories/<name>/{.claude-plugin,skills}`
2. Copy an existing `plugin.json`; name it `team-<name>`.
3. Add it to `.claude-plugin/marketplace.json` with `"source": "./categories/<name>"`.
4. Add a skill (git won't commit an empty folder), then run `validate.sh`.
