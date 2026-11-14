---
name: pelagornis-code-review
description: Review a code change for correctness, security, architecture, performance, maintainability, and test coverage. Use when reviewing a pull request, diff, or implementation.
---

# Pelagornis code review

## Purpose

Produce an evidence-based review of a defined code change.

## Workflow

1. Read applicable repository instructions and identify the requested change scope.
2. Inspect the diff and relevant surrounding code before drawing conclusions.
3. Check correctness, regression risk, architecture, security, performance, maintainability, and test coverage.
4. Run relevant read-only checks or tests when practical.
5. Report actionable findings with file locations, impact, and supporting evidence.

## Output

Provide a review summary, then critical findings, important findings, minor suggestions, and verification results. State clearly when no actionable findings were found.

## Boundaries

Do not present speculation as a confirmed defect. Do not change files unless the user asks for a fix.
