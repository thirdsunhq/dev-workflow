---
name: new-issue
description: Create a new github issue from the description
allowed-tools: Bash(gh issue create *), Bash(git branch *)
---

# Labels reference
- **bug**: Something isn't working
- **chore**: Tooling, configuration, or workflow maintenance
- **documentation**: Improvements or additions to documentation
- **duplicate**: This issue or pull request already exists
- **feature**: New functionality or capability added
- **in-progress**: Currently being worked on
- **invalid**: This doesn't seem right
- **question**: Further information is requested
- **refactor**: Improvements to codebase structure
- **wontfix**: This will not be worked on

# Issue body format
Structure the issue body using this markdown template:

## Summary
One or two sentences describing the problem or goal clearly.

## Tasks
- [ ] First concrete task
- [ ] Additional tasks as needed

## Context
- **Branch:** <current git branch>
- **Date:** <today's date>
- **Notes:** <any extra detail from the description>

# Steps
1. Run `git branch --show-current` to get the current branch name
2. Infer the appropriate label from the **Labels reference**
3. Write a concise title prefixed with the label type, e.g. `Refactor: ...` or `Bug: ...`
4. Build the issue body using the **Issue body format** above
5. Run `gh issue create --title "<title>" --body "<body>" --label "<label>" --assignee "@me"`
6. Report the issue number and title returned by gh
