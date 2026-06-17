# Design Doc Collaboration

## When This Mode Is Active

The rules below apply whenever you are working on a design doc — whether starting fresh, resuming after a break, or iterating alongside code changes.

## Naming and Location

- **Local:** `design_docs/<branch-slug>.md` — branch name with `username/` prefix stripped (e.g. `design_docs/thi-11-define-and-validate-development-workflow.md`); gitignored, not tracked
- **Linear:** document titled `<IDENTIFIER>: <issue title>`, attached to the issue — the permanent record

The local file carries frontmatter with metadata and the Linear document ID once synced:

```markdown
---
linear_doc_id:
issue: THI-11
created_at: 2026-06-17T14:00:00
created_by: thirdsundev
---
```

## Sync Behaviour

- The **local file is the primary working copy** — all drafting and editing happens here
- Never auto-sync on every edit — syncs are intentional

**On "push to linear" / "sync to linear" / "push":**
- If `linear_doc_id` is empty: call `mcp__claude_ai_Linear__save_document` with `title: "<IDENTIFIER>: <issue title>"`, `issue: "<identifier>"`, and the full current file content (excluding frontmatter); store the returned document ID in `linear_doc_id` in the frontmatter
- If `linear_doc_id` is set: call `mcp__claude_ai_Linear__save_document` with `id: <linear_doc_id>` and the updated content

**On "pull from linear" / "check linear":**
- Call `mcp__claude_ai_Linear__get_document` using the stored `linear_doc_id`
- Show a brief summary of what changed vs the local file
- Update the local file to match

## Collaboration Style

- Claude drafts or updates the local file and confirms the change
- User reviews in their editor, makes edits, asks questions or suggests changes
- Claude re-reads, discusses, revises
- Repeat until design is agreed
- Push to Linear when design is finalised

Treat every exchange as part of an ongoing design conversation, not a one-shot generation task.

## Finalising

When design is agreed:

1. Push final content to Linear
2. Confirm the Linear document is attached to the issue
3. Remind the user: delete `design_docs/<branch-slug>.md` during branch cleanup after merge (the Linear doc persists as the permanent record)
