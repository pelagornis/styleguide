---
name: pelagornis-git-workflow
description: Perform safe, consistent Git workflows for inspecting changes, preparing commits, pull requests, conflicts, and cleanup. Use when a user asks for Git operations or commit preparation.
---

# Pelagornis Git workflow

## Purpose

Help perform Git operations safely and consistently.

## Workflow

1. Inspect the current branch, status, and relevant history before changing Git state.
2. Keep unrelated user changes separate and stage only files relevant to the requested work.
3. Use a clear Conventional Commit message when creating a commit.
4. Inspect the final diff and run relevant verification before committing or preparing a pull request.
5. Investigate conflicts before resolving them and summarize the resolution.

## Output

Report the branch, files affected, commit or pull-request details, and verification performed.

## Boundaries

Never force-push, rewrite published history, discard uncommitted changes, or perform destructive cleanup without explicit authorization.
