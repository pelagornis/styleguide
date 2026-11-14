---
layout: page
title: Agent Skills
---

# Agent Skills

Pelagornis maintains reusable development workflows as portable [Agent Skills](https://agentskills.io/specification). The canonical source is [<code>.agents/skills/</code>](https://github.com/pelagornis/styleguide/tree/main/.agents/skills): each Skill is authored once and can be installed for Cursor, OpenAI Codex, and Claude Code.

Skills are task-specific workflows. Persistent repository guidance belongs in [<code>AGENTS.md</code>](https://github.com/pelagornis/styleguide/blob/main/AGENTS.md), [<code>CLAUDE.md</code>](https://github.com/pelagornis/styleguide/blob/main/CLAUDE.md), or Cursor Rules instead. This separation keeps routine context concise while detailed procedures load only when needed.

- [Skill library and maintenance](skills/)
- [Cursor integration](cursor/)
- [OpenAI Codex integration](codex/)
- [Claude Code integration](claude-code/)

See the [README](https://github.com/pelagornis/styleguide#agent-skills) for installation commands.
