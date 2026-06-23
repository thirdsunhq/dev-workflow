#!/usr/bin/env bash
set -euo pipefail

REPO="thirdsunhq/dev-workflow"

FILES=(
  ".claude/rules/common/design-doc-collab.md"
  ".claude/rules/common/dev-workflow.md"
  ".claude/skills/commit-staged/SKILL.md"
  ".claude/skills/design-doc-collab/SKILL.md"
  ".claude/skills/design-doc-collab/assets/template.md"
  ".claude/skills/new-issue/SKILL.md"
  ".claude/skills/open-pr/SKILL.md"
  ".claude/skills/start-issue/SKILL.md"
)

DEST="${1:-.}"

echo "Installing dev-workflow Claude Code files..."

for file in "${FILES[@]}"; do
  dest_path="$DEST/$file"
  mkdir -p "$(dirname "$dest_path")"
  gh api "repos/$REPO/contents/$file" --jq '.content' | base64 -d > "$dest_path"
  echo "  ✓ $file"
done

echo "Done."
