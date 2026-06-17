---
name: start-issue
description: Checkout main, pull latest, and create a new branch for a Linear issue
allowed-tools: mcp__claude_ai_Linear__get_issue, mcp__claude_ai_Linear__save_issue, Bash(git checkout *), Bash(git pull *)
---

Given issue identifier $ARGUMENTS (e.g. THI-11):

1. Call `mcp__claude_ai_Linear__get_issue` with the issue identifier to get the issue title and `gitBranchName`
2. Run `git checkout main` and `git pull origin main` to ensure main is up to date
3. Run `git checkout -b <gitBranchName>` using the branch name returned by Linear
4. Call `mcp__claude_ai_Linear__save_issue` with `id: <identifier>` and `state: "In Progress"` to mark the issue as started
5. Report the branch name and issue title so it's clear what you're working on
