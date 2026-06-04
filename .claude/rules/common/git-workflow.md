# Git Workflow

## The Development Loop

```
1. Pick an issue
   gh issue list

2. Start the issue (pulls main, creates branch)
   /start-issue <number>

3. Draft a design doc (optional, for non-trivial changes)
   /design-doc-collab

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

- `/new-issue` — create and label a GitHub issue
- `/start-issue <number>` — pull main, derive branch name from issue label/title, and check it out
- `/design-doc-collab` — start a collaborative design doc session (Notion + local), iterate until design is agreed, then commit the finalised doc
- `/commit-staged` — commit staged changes with a conventional message, inferring type and issue number from the branch
- `/open-pr` — fetch latest and open a PR from current branch into main
