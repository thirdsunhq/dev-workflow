---
name: commit
description: Commit staged changes with a conventional commit message referencing the current issue
allowed-tools: Bash(git status *), Bash(git diff *), Bash(git commit *)
---

1. Run `git status` to confirm there are staged changes — if nothing is staged, stop and report that nothing is staged
2. Run `git diff --staged` to review what is staged
3. Infer the commit type from the staged changes:
   - `feat` — new functionality
   - `fix` — bug fix
   - `refactor` — code restructure, no behaviour change
   - `docs` — documentation only
   - `test` — tests only
   - `chore` — tooling, config, workflow
   - `perf` — performance improvement
   - `ci` — CI/CD changes
4. Infer the issue number from the current branch name (e.g. `refactor/4-web-extraction` → `#4`)
5. Write a concise description in lowercase. Title line must not exceed 72 characters.
6. If the staged changes warrant more detail, write a short body (one or two sentences summarising what changed and why).
7. Run `git commit -m "<title>" -m "<body>"` (omit `-m "<body>"` if no body is needed)

   Examples:
   ```
   refactor: extract map_single_url function #8

   chore: add git workflow skills and rewrite rules #7
   consolidates start-issue, commit-staged, and open-pr into the loop

   fix: handle missing firecrawl response #9
   ```

8. Report the commit message used
