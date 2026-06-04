---
name: start-issue
description: Checkout main, pull latest, and create a new branch for a GitHub issue
allowed-tools: Bash(git checkout *), Bash(git pull *), Bash(git branch *), Bash(gh issue view *)
---

Given issue number $ARGUMENTS:

1. Run `gh issue view $ARGUMENTS` to get the issue title and label
2. Run `git checkout main` and `git pull origin main` to ensure main is up to date
3. Derive a branch name from the issue using the format `<label>/<issue-number>-<short-slug>`
   - Use the issue label as the prefix (e.g. refactor, chore, feature, bug)
   - Use the issue number
   - Slugify the title to 2-4 words max, lowercase, hyphen-separated
4. Run `git checkout -b <branch-name>` to create and switch to the new branch
5. Report the branch name and issue title so it's clear what you're working on
