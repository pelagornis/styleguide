---
layout: page
title: Git Style Guide
icon: /assets/images/icons/git.svg
---

## Table of Contents

- [Branch Naming](#branch-naming)
- [Commit Messages](#commit-messages)
- [Git Workflow](#git-workflow)
- [Pull Requests](#pull-requests)
- [Tagging and Releases](#tagging-and-releases)
- [Best Practices](#best-practices)

### Branch Naming

Use descriptive, lowercase branch names with hyphens as word separators.

```
feature/user-authentication
fix/login-redirect-loop
chore/update-dependencies
docs/api-reference
refactor/auth-module
```

Prefix branches by purpose:

| Prefix      | Use case                              |
| ----------- | ------------------------------------- |
| `feature/`  | New features or enhancements          |
| `fix/`      | Bug fixes                             |
| `hotfix/`   | Urgent production fixes               |
| `chore/`    | Maintenance, tooling, dependencies    |
| `docs/`     | Documentation-only changes            |
| `refactor/` | Code restructuring without new behavior |
| `test/`     | Test additions or improvements        |

Avoid vague names like `update`, `fix-bug`, or `wip`.

### Commit Messages

Follow the [Conventional Commits](https://www.conventionalcommits.org/) format.

```
<type>(<scope>): <subject>

<body>

<footer>
```

#### Type

Use one of the following types:

- `feat`: A new feature
- `fix`: A bug fix
- `docs`: Documentation changes
- `style`: Formatting changes (no logic change)
- `refactor`: Code restructuring
- `test`: Adding or updating tests
- `chore`: Build process or auxiliary tool changes
- `perf`: Performance improvements
- `ci`: CI/CD configuration changes

#### Subject

- Use the imperative mood: "add" not "added" or "adds"
- Do not capitalize the first letter
- Do not end with a period
- Keep under 72 characters

```
# Wrong
Added new login feature.
fixed bug

# Right
feat(auth): add OAuth2 login support
fix(api): handle null response from user endpoint
```

#### Body and Footer

Use the body to explain **what** and **why**, not **how**. Reference issue numbers in the footer.

```
feat(auth): add OAuth2 login support

Implement Google and GitHub OAuth providers.
Session tokens are stored in httpOnly cookies.

Closes #142
```

### Git Workflow

#### Main Branches

- `main` (or `master`): Production-ready code. Always deployable.
- `develop` (optional): Integration branch for ongoing development.

#### Feature Development

```bash
# Start from the latest main branch
git checkout main
git pull origin main
git checkout -b feature/user-profile

# Work, commit, and push
git add .
git commit -m "feat(profile): add user profile page"
git push -u origin feature/user-profile
```

#### Keeping Branches Up to Date

Rebase feature branches onto `main` before opening a pull request to maintain a clean history.

```bash
git checkout feature/user-profile
git fetch origin
git rebase origin/main
```

Resolve conflicts during rebase, then continue:

```bash
git add <resolved-files>
git rebase --continue
```

#### Merge Strategy

- Prefer **squash merge** for feature branches to keep `main` history clean.
- Use **merge commit** only when preserving the full branch history is required.
- Avoid force-pushing to shared branches (`main`, `develop`).

### Pull Requests

#### Title

Use the same format as commit messages.

```
feat(auth): add OAuth2 login support
```

#### Description

Include the following sections:

```markdown
## Summary
- Brief description of the changes

## Changes
- List of specific changes

## Test plan
- [ ] Unit tests pass
- [ ] Manual testing steps

## Related issues
Closes #142
```

#### Review Guidelines

- Keep PRs small and focused on a single concern.
- Request review from at least one team member.
- Address all review comments before merging.
- Ensure CI checks pass before requesting merge.

### Tagging and Releases

Use [Semantic Versioning](https://semver.org/) (`MAJOR.MINOR.PATCH`).

```
v1.0.0   - Initial release
v1.1.0   - New features, backward compatible
v1.1.1   - Bug fixes only
v2.0.0   - Breaking changes
```

Create annotated tags for releases:

```bash
git tag -a v1.2.0 -m "Release v1.2.0: add user profile feature"
git push origin v1.2.0
```

### Best Practices

#### Atomic Commits

Each commit should represent a single logical change. Do not mix unrelated changes in one commit.

```
# Wrong - one commit with unrelated changes
git commit -m "fix login and update README and refactor utils"

# Right - separate commits
git commit -m "fix(auth): resolve session expiry on page refresh"
git commit -m "docs: update installation instructions"
git commit -m "refactor(utils): extract date formatting helper"
```

#### .gitignore

Never commit sensitive files. Always include these in `.gitignore`:

```
.env
.env.local
*.pem
*.key
node_modules/
dist/
build/
.DS_Store
```

#### Stash Usage

Use `git stash` for temporary work-in-progress changes when switching branches.

```bash
git stash push -m "WIP: profile form validation"
git checkout main
# ... do other work ...
git checkout feature/user-profile
git stash pop
```

#### Signing Commits

Sign commits with GPG or SSH for verified authorship when working on open-source projects.

```bash
git config --global commit.gpgsign true
git config --global user.signingkey <key-id>
```
