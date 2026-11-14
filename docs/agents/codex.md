---
layout: page
title: OpenAI Codex integration
---

# OpenAI Codex integration

Codex discovers repository Skills from <code>.agents/skills/</code>; global Skills belong in <code>~/.agents/skills/</code>. The repository's concise standing instructions are in [<code>AGENTS.md</code>](https://github.com/pelagornis/styleguide/blob/main/AGENTS.md).

## Invoke a Skill

Use <code>/skills</code> to inspect Skills exposed by the active Codex interface, then invoke one explicitly:

~~~
$pelagornis-code-review
~~~

A matching request can also select a Skill automatically. For example:

~~~
$pelagornis-repository-audit

Audit this repository and produce a prioritized report.
Do not modify files.
~~~

## Verify

Start a new Codex session after changing the library. Confirm that <code>.agents/skills/</code> is discovered, the relevant Skill can be selected explicitly where the interface supports it, <code>AGENTS.md</code> is loaded, and a matching prompt selects the appropriate workflow. Interface controls vary between Codex surfaces, so record the surface and version tested.
