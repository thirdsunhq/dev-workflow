---
name: design-doc-collab
description: Start or resume a collaborative design doc session — creates a local markdown file in design_docs/ and syncs to a Linear document attached to the issue on demand.
allowed-tools: Bash(git branch *), Bash(gh api *), Bash(date *), Bash(test *), Read, Write, mcp__claude_ai_Linear__get_issue, mcp__claude_ai_Linear__save_document, mcp__claude_ai_Linear__get_document
---

## Setup

1. Determine the issue identifier:
   - If `$ARGUMENTS` is provided, use it as the identifier (uppercase, e.g. `THI-11`)
   - Otherwise run `git branch --show-current`:
     - If on a feature branch, extract the identifier (pattern `[a-z]+-[0-9]+`, uppercased)
     - If on `main`, stop and ask the user to provide the identifier

2. Call `mcp__claude_ai_Linear__get_issue` with the identifier to get the issue `title` and `gitBranchName`

3. Derive the local filename:
   - Take `gitBranchName` (e.g. `sean/thi-11-define-and-validate-development-workflow`)
   - Strip the `username/` prefix → `thi-11-define-and-validate-development-workflow`
   - Local path: `design_docs/thi-11-define-and-validate-development-workflow.md`

4. Run `gh api user --jq '.login'` to get the GitHub account name

5. Check if the local file exists:
   - **Found**: read it, note the `linear_doc_id` from frontmatter, say *"Resuming design doc for `<identifier>: <title>`"*
   - **Not found**:
     1. Create the local file with frontmatter + content skeleton (see below)
     2. Immediately call `mcp__claude_ai_Linear__save_document` with `title: "<IDENTIFIER>: <issue title>"`, `issue: "<identifier>"`, and the skeleton content (excluding frontmatter)
     3. Write the returned document ID into `linear_doc_id` in the frontmatter
     4. Say *"Created design doc for `<identifier>: <title>` — Linear document attached to issue"*

## Local file format

Frontmatter followed by the document content:

```markdown
---
linear_doc_id:
issue: THI-11
created_at: 2026-06-17T14:00:00
created_by: thirdsundev
---

# THI-11: Issue Title

## Summary

## Goals

-

## Non-goals

-

## Design

## Open questions

-
```

The collaboration rules are defined in `.claude/rules/common/design-doc-collab.md`.
