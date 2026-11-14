---
name: pelagornis-test-debug
description: Reproduce a failure, identify its root cause, implement the smallest reliable fix, and verify the result. Use when debugging a failing test, build, or runtime defect.
---

# Pelagornis test and debug

## Purpose

Resolve a reproducible defect with evidence and durable verification.

## Workflow

1. Reproduce the issue and preserve relevant error output.
2. Narrow the investigation to the smallest relevant code area and form a testable hypothesis.
3. Add or update a regression test when appropriate.
4. Implement the smallest reliable fix.
5. Run targeted checks, then broader relevant checks.

## Output

State the root cause, the change made, regression coverage, and actual verification results.

## Boundaries

Do not hide failing tests, weaken assertions merely to pass CI, or claim verification that did not run.
