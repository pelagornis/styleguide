# Trigger evaluation prompts

Use these prompts when checking automatic Skill selection. A matching prompt should activate the listed Skill; a non-matching prompt should not force that Skill. Ambiguous prompts need human review rather than a forced outcome.

| Skill | Should trigger | Should not trigger | Ambiguous |
|---|---|---|---|
| pelagornis-code-review | “Review this pull request for bugs and missing tests.” | “Implement the login form.” | “What changed in this branch?” |
| pelagornis-repository-audit | “Audit this repository and prioritize its security and maintenance risks. Do not modify files.” | “Fix the failing test.” | “How healthy is this project?” |
| pelagornis-git-workflow | “Prepare a Conventional Commit for the current changes.” | “Explain what Git rebase does.” | “Help me get this branch ready.” |
| pelagornis-test-debug | “Investigate this failing test and verify the smallest fix.” | “Review this diff for regressions.” | “The build is red; what should I inspect?” |
| pelagornis-docs-maintenance | “Update the documentation for the changed API and check links.” | “Create an API endpoint.” | “This feature needs a README update.” |
| pelagornis-skill-authoring | “Create a reusable Skill for our release checklist.” | “Add a permanent rule to AGENTS.md.” | “Should this process be a Skill?” |

Record the agent, version, prompt, whether the expected Skill was offered or selected, and any false positive or false negative. Revise descriptions when results are consistently too broad or too narrow.
