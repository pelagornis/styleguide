---
name: pelagornis-skill-authoring
description: Create, review, or improve portable Agent Skills using the Pelagornis conventions and the open Agent Skills specification. Use when adding or maintaining a reusable agent workflow.
---

# Pelagornis skill authoring

## Purpose

Create focused, portable Skills that encode repeatable workflows without duplicating permanent repository instructions.

## Workflow

1. Confirm that the workflow is repeatable and belongs in a Skill rather than repository instructions.
2. Choose a concise `pelagornis-` name and trigger-specific description.
3. Write a focused `SKILL.md` with purpose, context, workflow, verification, output, and safety boundaries.
4. Put detailed material in `references/`, deterministic operations in `scripts/`, and reusable files in `assets/` only when needed.
5. Validate frontmatter, directory structure, links, uniqueness, and triggering prompts using [the evaluation set](references/trigger-evals.md).
6. Check the Skill with each supported agent before claiming cross-agent compatibility.

## Output

Report the Skill's trigger conditions, structure, validation, and agent-specific limitations.

## Boundaries

Do not add unsupported agent-specific frontmatter to a portable shared Skill. Do not create a Skill solely to restate permanent repository instructions.
