# Git Workflow

## The Development Loop

```
1. Pick an issue
   Linear board

2. Draft a design doc (optional, for trivial changes)
   /design-doc-collab
   → decide here whether to split into sub-issues first

3. Start the issue (pulls main, creates branch)
   /start-issue <id>   e.g. /start-issue THI-11

4. Write code, stage changes in Zed, then commit
   /commit-staged

5. Open a PR
   /open-pr

6. Review and merge in GitHub UI

7. Clean up
   git checkout main
   git pull origin main
   git branch -d <branch-name>
   git push origin --delete <branch-name>
```

One issue → one branch → one PR. Always start from and return to a clean main.

## Skills

- `/new-issue` — create and label a Linear issue
- `/design-doc-collab` — start or resume a collaborative design doc session in Linear, attached to the current issue
- `/start-issue <id>` — pull main and check out the branch derived from the Linear issue
- `/commit-staged` — commit staged changes with a conventional message, inferring type and Linear issue ID from the branch
- `/open-pr` — fetch latest and open a PR from current branch into main, referencing the Linear issue
