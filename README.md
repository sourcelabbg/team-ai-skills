# team-ai-skills

Shared playbooks that tell our AI assistants how *Sourcelab* does a job — so
everyone gets the same answer instead of whatever each assistant improvises.

Works in **Claude Code**, **Codex (GPT)** and **Gemini** from one file.

## Use it

```bash
./scripts/install.sh all
```

Then work normally. Ask "review my changes" and your assistant finds the
matching playbook and follows it. Nothing to memorise.

## Add one

```bash
cp -r templates/skill categories/review/skills/my-skill
```

Edit `SKILL.md`, run `./scripts/validate.sh`, open a PR. It's writing, not
coding — see [CONTRIBUTING.md](CONTRIBUTING.md).

## What's here

```
categories/<category>/skills/<name>/SKILL.md   ← the only file you write
```

| Category | For |
|---|---|
| `engineering` | Conventions, scaffolding, implementation |
| `testing` | Test strategy and coverage decisions |
| `review` | Code review and pre-merge checks |
| `documentation` | ADRs, READMEs, changelogs |
| `operations` | Deploys, incidents, on-call |
| `data` | SQL, migrations, data modeling |

## Why this shape

**One file, three tools.** Claude, Codex and Gemini all adopted the same
[Agent Skills](https://agentskills.io) standard — a folder with a `SKILL.md`
inside. So we write once; each tool reads the same file. `install.sh` just
points each tool at this folder using symlinks, which is why `git pull` updates
everyone with no reinstall.

**Categories sit outside `skills/`, not inside.** Claude finds skills with
`skills/*/SKILL.md` — exactly one level deep. Nesting categories under
`skills/` loads nothing, with no error. Putting them one level up fixes that and
makes each category a separately installable Claude plugin. `validate.sh`
guards this so nobody has to remember it.

**No build step.** No Python, no Node, no dependencies — bash and text files.
Every tool reads `SKILL.md` natively, so there is nothing to compile or keep in
sync.
