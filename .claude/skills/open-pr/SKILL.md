---
name: open-pr
description: Fetch latest, open a PR into main referencing the Linear issue, and include the magic word to auto-close the issue on merge
allowed-tools: Bash(git fetch *), Bash(git status *), Bash(git branch *), Bash(git push *), Bash(gh pr create *), mcp__claude_ai_Linear__get_issue
---

1. Run `git branch --show-current` and extract the Linear identifier (e.g. `thirdsundev/thi-11-...` → `THI-11`, uppercased)
2. Call `mcp__claude_ai_Linear__get_issue` with the identifier to get the issue title
3. Run `git fetch origin` and `git status` to confirm there is nothing uncommitted
4. Run `git push -u origin HEAD` to push the branch (safe to run even if already up to date)
5. Run `gh pr create` with:
   - `--base main`
   - `--title "<issue title>"`
   - `--body "Fixes <IDENTIFIER>"` (e.g. `Fixes THI-11` — this auto-closes the Linear issue on merge)
6. Report the PR URL
