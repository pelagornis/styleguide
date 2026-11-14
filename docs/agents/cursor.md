---
layout: page
title: Cursor integration
---

# Cursor integration

Cursor discovers project Skills in <code>.agents/skills/</code> and user Skills in <code>~/.agents/skills/</code> or <code>~/.cursor/skills/</code>. This repository uses the project-level canonical directory and does not maintain a duplicate <code>.cursor/skills/</code> library.

The short, always-applied project guidance is in [<code>.cursor/rules/pelagornis.mdc</code>](https://github.com/pelagornis/styleguide/blob/main/.cursor/rules/pelagornis.mdc). It is a Cursor Rule, not a replacement for the Skill workflows.

## Invoke a Skill

In Cursor Agent chat, type <code>/</code> and select a Skill:

~~~
/pelagornis-code-review
~~~

Cursor can also select a relevant Skill from a natural-language task, for example:

~~~
Review the latest changes for correctness, security, maintainability, and missing test coverage.
~~~

## Verify

After installing or changing Skills, start a new Cursor session and confirm that the descriptions appear in Agent chat, explicit invocation works, the rule is recognized, and a matching natural-language prompt selects the intended Skill. Cloud or remote environments require separate verification.
