---
name: open-pr
description: Fetch latest changes and open a pull request to merge current branch into main
allowed-tools: Bash(git fetch *), Bash(git status *), Bash(gh pr create *)
---

1. Run `git fetch origin` and `git status` to confirm the branch is clean
2. Run `gh pr create --base main --head <current branch> --title "<branch name> into main" --body "Promoting <branch name> to main."`
3. Report the PR number and title
