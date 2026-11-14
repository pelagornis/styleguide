---
layout: page
title: Agent Skills
permalink: /docs/agents/overview/
---

# Agent Skills

Pelagornis maintains reusable development workflows as portable [Agent Skills](https://agentskills.io/specification). The canonical source is [<code>.agents/skills/</code>](https://github.com/pelagornis/styleguide/tree/main/.agents/skills): each Skill is authored once and can be installed for Cursor, OpenAI Codex, and Claude Code.

Skills are task-specific workflows. Persistent repository guidance belongs in [<code>AGENTS.md</code>](https://github.com/pelagornis/styleguide/blob/main/AGENTS.md), [<code>CLAUDE.md</code>](https://github.com/pelagornis/styleguide/blob/main/CLAUDE.md), or Cursor Rules instead. This separation keeps routine context concise while detailed procedures load only when needed.

- [Skill library and maintenance]({{ '/docs/agents/skills/' | relative_url }})
- [Cursor integration]({{ '/docs/agents/cursor/' | relative_url }})
- [OpenAI Codex integration]({{ '/docs/agents/codex/' | relative_url }})
- [Claude Code integration]({{ '/docs/agents/claude-code/' | relative_url }})

See the [README](https://github.com/pelagornis/styleguide#agent-skills) for installation commands.
