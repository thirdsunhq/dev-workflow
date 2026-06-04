---
name: design-doc-collab
description: Start or continue a collaborative design doc session — creates a local markdown file and a Notion page, and syncs edits between them on demand.
allowed-tools: Bash(git branch *), Read, Write, mcp__notion__notion-search, mcp__notion__notion-create-pages, mcp__notion__notion-fetch, mcp__notion__notion-update-page
---

1. Run `git branch --show-current` to get the branch name
2. Extract the issue number from the branch name and run `gh issue view <n>` to get the issue title and label
3. Derive the Notion page title: `<Label>: <issue title> (#<n>)` (capitalise the label)
4. Search Notion for a page with that title using `notion-search`
   - If found: read its ID and URL; confirm to the user an existing doc was found
   - If not found:
     - Search for the "Design Docs" parent page using `notion-search`
     - Create the branch doc as a child of "Design Docs" with the derived title
5. Check if `project_docs/designs/<branch-slug>.md` exists locally (branch name with `/` → `-`)
   - If not: create it with frontmatter (`notion_page_id`, `notion_url`) and an empty content skeleton
   - If yes: read the existing content — the session is resuming
6. Say: *"Starting design doc for `<notion-title>` — Notion page at `<url>`"*

The collaboration rules and sync behaviour are defined in `.claude/rules/common/design-doc-collab.md`.
