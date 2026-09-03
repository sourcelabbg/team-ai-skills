#!/usr/bin/env bash
# Structural checks. Pure bash — no build step, no dependencies.
set -uo pipefail
cd "$(dirname "$0")/.."
fail=0
err() { echo "FAIL: $*"; fail=1; }

for f in categories/*/skills/*/SKILL.md; do
  [ -e "$f" ] || { err "no skills found"; break; }

  head -1 "$f" | grep -q '^---$' || err "$f: missing frontmatter"
  grep -q '^description:' "$f"   || err "$f: missing 'description:'"

  name=$(awk -F': *' '/^name:/{print $2; exit}' "$f")
  dir=$(basename "$(dirname "$f")")
  [ -n "$name" ]      || err "$f: missing 'name:'"
  [ "$name" = "$dir" ] || err "$f: name '$name' does not match folder '$dir'"

  [ -L ".gemini/skills/$dir" ] || err "$dir: not linked for Gemini — run scripts/install.sh gemini"
done

# The one trap worth a guard: Claude globs skills/*/SKILL.md, exactly one level
# deep. A category folder nested inside skills/ loads nothing, silently.
for d in categories/*/skills/*/; do
  if [ ! -f "$d/SKILL.md" ] && find "$d" -name SKILL.md | grep -q .; then
    err "${d%/} groups skills in a subfolder — Claude only looks one level deep"
  fi
done

# Every category must be registered as a Claude plugin.
for c in categories/*/; do
  [ -f "$c/.claude-plugin/plugin.json" ] || err "${c%/}: missing .claude-plugin/plugin.json"
  grep -q "\"$(basename "$c")\"" .claude-plugin/marketplace.json \
    || err "${c%/}: not listed in .claude-plugin/marketplace.json"
done

[ "$fail" -eq 0 ] && echo "OK — $(ls categories/*/skills/*/SKILL.md | wc -l | tr -d ' ') skills, $(ls -d categories/*/ | wc -l | tr -d ' ') categories"
exit $fail
