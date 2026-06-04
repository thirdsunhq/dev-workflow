# Design Doc Collaboration

## When This Mode Is Active

The rules below apply whenever you are working on a design doc — whether starting fresh, resuming after a break, or iterating alongside code changes.

## Naming and Locations

- **Notion:** Design Docs > `<Label>: <issue title> (#<n>)` — derive label and number from the branch name; fetch the title with `gh issue view <n>`
- **Local:** `project_docs/designs/<branch-slug>.md` — branch name with `/` replaced by `-`; gitignored, not tracked

The local file always carries frontmatter with the Notion page ID and URL:

```markdown
---
notion_page_id: <id>
notion_url: <url>
---
```

## Sync Behaviour

- When asked to **"check notion"**, **"pull from notion"**, or **"sync"**:
  1. Fetch the page using the stored `notion_page_id`
  2. Diff against the local file and summarise what changed
  3. Update the local file to match
- After drafting or revising content locally, push to Notion using `notion-update-page` (`replace_content`)
- Never ask the user to manually sync — handle it as part of the conversation
- Notion page cleanup (archiving/deleting) is manual — the MCP has no delete tool

## Collaboration Style

This is a live, iterative session. The expectation is:

- Claude drafts or updates content, pushes to Notion
- User reviews in Notion, makes edits, asks questions or suggests changes
- Claude pulls, discusses, revises, pushes again
- Repeat until both sides agree the design is final

Treat every exchange as part of an ongoing design conversation, not a one-shot generation task.

## Notion Formatting

### Mermaid diagrams
- Always use ` ```mermaid ` as the fence language
- Use `<br/>` for line breaks inside node labels
- Use plain text or parentheses instead of `<` and `>` inside node labels

### Code blocks
- Always specify a language on every code fence

## Finalising

When we explicitly agree the design is final:

1. Pull the latest Notion content and update the local file
2. Confirm the local file is up to date and let the user know the design is ready to commit via `/commit-staged`
