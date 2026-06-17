---
name: start-issue
description: Checkout main, pull latest, and create a new branch for a Linear issue
allowed-tools: mcp__claude_ai_Linear__get_issue, mcp__claude_ai_Linear__save_issue, mcp__claude_ai_Linear__save_document, Bash(git checkout *), Bash(git pull *), Bash(git status *), Bash(test *), Read, Write
---

Given issue identifier $ARGUMENTS (e.g. THI-11):

1. Call `mcp__claude_ai_Linear__get_issue` with the issue identifier to get the issue title and `gitBranchName`
2. Check for a local design doc:
   - Derive the path: strip the `username/` prefix from `gitBranchName` → `design_docs/<branch-slug>.md`
   - If the file exists: read it, call `mcp__claude_ai_Linear__save_document` with `id: <linear_doc_id>` and the current file content (excluding frontmatter); report *"Design doc synced to Linear"*
   - If not found: proceed silently
3. Run `git status --porcelain` — if there is any output, stop and tell the user to commit or stash their changes before starting a new branch
4. Run `git checkout main` and `git pull origin main` to ensure main is up to date
5. Run `git checkout -b <gitBranchName>` using the branch name returned by Linear
6. Call `mcp__claude_ai_Linear__save_issue` with `id: <identifier>` and `state: "In Progress"` to mark the issue as started
7. Report the branch name and issue title so it's clear what you're working on
