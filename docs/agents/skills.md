---
layout: page
title: Skill library
hide_page_header: true
permalink: /docs/agents/skills/
---

# Skill library

A canonical Skill lives in <code>.agents/skills/&lt;name&gt;/SKILL.md</code>. Its frontmatter contains only portable metadata: a lowercase, hyphenated <code>name</code> that matches the directory and a specific <code>description</code> that explains both purpose and trigger conditions.

Use <code>references/</code> for detailed material, <code>scripts/</code> for deterministic operations, and <code>assets/</code> for reusable resources. Keep the main Skill focused; do not repeat permanent repository instructions or add agent-specific permissions to it.

## Available Skills

| Skill | Use it for |
|---|---|
| <code>pelagornis-code-review</code> | Evidence-based review of a pull request, diff, or implementation. |
| <code>pelagornis-repository-audit</code> | Prioritized architecture, quality, security, and maintenance audit. |
| <code>pelagornis-git-workflow</code> | Safe commits, pull requests, conflict investigation, and cleanup. |
| <code>pelagornis-test-debug</code> | Reproducing failures and validating the smallest reliable fix. |
| <code>pelagornis-docs-maintenance</code> | Documentation, navigation, links, and example maintenance. |
| <code>pelagornis-skill-authoring</code> | Creating or improving a portable reusable workflow. |

## Validation and maintenance

Run the lightweight structural validation from the repository root:

~~~
ruby scripts/validate_skills.rb
~~~

It checks required manifests, YAML frontmatter, names, directory matches, unique names, and relative links. Review Skill changes like code: inspect their instructions and scripts, keep secrets out of the library, and require explicit authorization for destructive actions.

For reproducible downstream installs, publish a Git tag and install that tag, for example <code>pelagornis/styleguide@v1.0.0</code>. Use <code>npx skills check</code> and <code>npx skills update</code> in consumer projects to review updates.
