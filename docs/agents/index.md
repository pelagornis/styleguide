---
layout: page
title: Agent Skills
hide_page_header: true
---

# Agent Skills

Pelagornis maintains portable, reusable development workflows for Cursor, OpenAI Codex, and Claude Code.

## Use a Skill from the web

Every canonical <code>SKILL.md</code> is published as a static file. An agent with web access can read only the workflow it needs; cloning or installing this repository is not required:

~~~
Read and follow https://raw.githubusercontent.com/pelagornis/styleguide/main/.agents/skills/pelagornis-code-review/SKILL.md
before reviewing this change.
~~~

Use the [Skill library](skills/) to select a workflow and copy its direct URL. The file is the same canonical source used by local agent installations.

- [Overview](overview/)
- [Skill library and maintenance](skills/)
- [Cursor integration](cursor/)
- [OpenAI Codex integration](codex/)
- [Claude Code integration](claude-code/)

For installation commands, see the [README](https://github.com/pelagornis/styleguide#agent-skills).
