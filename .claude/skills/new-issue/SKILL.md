---
name: new-issue
description: Create a new Linear issue from the description
allowed-tools: mcp__claude_ai_Linear__list_issue_labels, mcp__claude_ai_Linear__save_issue
---

# Issue body format
Structure the issue body using this markdown template:

## Summary
One or two sentences describing the problem or goal clearly.

## Tasks
- [ ] First concrete task
- [ ] Additional tasks as needed

# Steps
1. Call `mcp__claude_ai_Linear__list_issue_labels` (no team filter) to get the current workspace label list
2. Infer the appropriate label from the current label list
3. Write a concise title (max 60 characters) that describes the issue, not the predicted fix
4. Build the issue body using the **Issue body format** above
5. Call `mcp__claude_ai_Linear__save_issue` with:
   - `title`: the issue title
   - `team`: "thirdsun"
   - `description`: the issue body
   - `labels`: `["inferred-label-name"]`
   - `assignee`: "me"
   - `state`: "Backlog" (default, unless a project is specified)
   - `project`: project name if one was mentioned in the invocation, otherwise omit
6. Report the issue identifier and title
