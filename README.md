# Pelagornis Style Guides

![Official](https://badge.pelagornis.com/official.svg)

Every open source project has its own style guide.
It is a set of rules and about how to write the code for the project.
It's easy to understand when all the codes in a very large codebase are in a consistent style.

This project([pelagornis/styleguide](https://github.com/pelagornis/styleguide)) is a guideline that applies to all projects in Pelagornis.

StyleGuide uses [Jekyll](https://jekyllrb.com), static site generator in Ruby.

## Guides

- [CSS Style Guide](https://pelagornis.github.io/styleguide/css)
- [Dart Style Guide](https://pelagornis.github.io/styleguide/dart)
- [Git Style Guide](https://pelagornis.github.io/styleguide/git)
- [HTML Style Guide](https://pelagornis.github.io/styleguide/html/)
- [JavaScript Style Guide](https://pelagornis.github.io/styleguide/javascript/)
- [JSON Style Guide](https://pelagornis.github.io/styleguide/json/)
- [Kotlin Style Guide](https://pelagornis.github.io/styleguide/kotlin/)
- [Markdown Style Guide](https://pelagornis.github.io/styleguide/markdown)
- [Python Style Guide](https://pelagornis.github.io/styleguide/python)
- [Shell Style Guide](https://pelagornis.github.io/styleguide/shell/)
- [Swift Style Guide](https://pelagornis.github.io/styleguide/swift/)
- [TypeScript Style Guide](https://pelagornis.github.io/styleguide/typescript/)

## Agent Skills

Pelagornis provides reusable [Agent Skills](https://agentskills.io/specification) for consistent engineering workflows. The canonical library lives in [`.agents/skills/`](.agents/skills/) and supports Cursor, OpenAI Codex, and Claude Code.

### Quick Start

For a one-off, web-capable agent task, provide the direct URL for only the relevant canonical Skill. No repository download is required:

~~~
Read and follow https://raw.githubusercontent.com/pelagornis/styleguide/main/.agents/skills/pelagornis-code-review/SKILL.md
before reviewing this change.
~~~

This is a session-only instruction. Install Skills when they should be natively discovered in future sessions.

The [Skills CLI](https://github.com/vercel-labs/skills) requires Node.js 22.20 or later. Install all Skills for the current project:

```bash
npx skills add pelagornis/styleguide --skill '*' \
  --agent cursor \
  --agent codex \
  --agent claude-code
```

For all projects on the current machine, add `--global`:

```bash
npx skills add pelagornis/styleguide --skill '*' \
  --agent cursor \
  --agent codex \
  --agent claude-code \
  --global
```

When prompted, choose the CLI's recommended symlink mode. It creates native agent links without independently maintained copies. Install just one workflow by replacing `'*'`, for example `--skill pelagornis-code-review`.

### Available Skills

| Skill | Description |
|---|---|
| `pelagornis-code-review` | Review code changes and identify actionable issues. |
| `pelagornis-repository-audit` | Audit repository architecture, quality, and security. |
| `pelagornis-git-workflow` | Perform safe and consistent Git workflows. |
| `pelagornis-test-debug` | Investigate failures and verify fixes. |
| `pelagornis-docs-maintenance` | Maintain implementation-aligned documentation. |
| `pelagornis-skill-authoring` | Create and validate Agent Skills. |

### Use Skills Immediately

Cursor users can open Agent chat, type `/`, and select `/pelagornis-code-review`. Codex users can inspect Skills with `/skills` and invoke `$pelagornis-code-review`. Claude Code users can run `/pelagornis-code-review`. Each agent can also select a relevant Skill from a matching natural-language request.

### Manage and troubleshoot

```bash
npx skills list
npx skills check
npx skills update
npx skills update pelagornis-code-review
```

If a Skill is missing, confirm that its directory contains `SKILL.md`, check the agent-native install location, use `npx skills list`, and restart the agent session. Project locations are `.agents/skills/` for Cursor and Codex and `.claude/skills/` for Claude Code; global locations are `~/.cursor/skills/`, `~/.agents/skills/`, and `~/.claude/skills/`, respectively.

Read the [Agent Skills guide](https://pelagornis.github.io/styleguide/docs/agents/) for integration and maintenance details.

## Contributors

- [View Contributors](https://github.com/pelagornis/styleguide/graphs/contributors)

## License

**styleguide** is under MIT license. See the [LICENSE](LICENSE) file for more info.
