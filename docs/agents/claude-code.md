---
layout: page
title: Claude Code integration
permalink: /docs/agents/claude-code/
---

# Claude Code integration

Claude Code natively discovers project Skills in <code>.claude/skills/</code> and personal Skills in <code>~/.claude/skills/</code>. The canonical Pelagornis sources remain in <code>.agents/skills/</code>; install them with the Skills CLI so its recommended symlink mode creates the native Claude Code links without a second editable copy.

The repository's persistent Claude guidance is in [<code>CLAUDE.md</code>](https://github.com/pelagornis/styleguide/blob/main/CLAUDE.md).

## Invoke a Skill

Use a slash command:

~~~
/pelagornis-code-review
~~~

Claude Code can also choose a Skill automatically when a request matches its description. The shared Skill frontmatter deliberately avoids Claude-only invocation controls, dynamic context, and permissions; add those only in a documented adapter when a real need emerges.

## Verify

Run <code>claude doctor</code> where available, start a new Claude Code session, and confirm the linked Skills are visible, explicit invocation works, supporting files can be read, <code>CLAUDE.md</code> is loaded, and a matching prompt selects the intended Skill. Do not claim compatibility for an environment that has not been tested.
