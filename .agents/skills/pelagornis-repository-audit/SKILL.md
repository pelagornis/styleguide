---
name: pelagornis-repository-audit
description: Audit a repository's architecture, configuration, quality, security, tests, and maintenance risks. Use when a user requests a prioritized repository assessment without implementation changes.
---

# Pelagornis repository audit

## Purpose

Assess the current condition of a repository and identify the highest-value improvements.

## Workflow

1. Inspect the repository structure, instructions, README, language, framework, dependencies, build scripts, tests, and CI.
2. Identify architecture, configuration, quality, security, and maintenance risks using repository evidence.
3. Compare findings with applicable Pelagornis standards.
4. Prioritize recommendations by impact, confidence, and effort.

## Output

Report the scope inspected, a prioritized improvement list, evidence for each finding, and checks performed. Separate confirmed issues from opportunities or unknowns.

## Boundaries

Do not make destructive or implementation changes during an audit unless the user explicitly asks.
