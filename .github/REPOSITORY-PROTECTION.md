# Repository protection

`hedayatis.github.io` must stay public -- GitHub Pages serves the site from a
public repository -- but public means *readable*, not *writable*. This note
records the settings that keep write access to a single account, and how to
verify them.

## Who can change the site today

| Path to a change            | Status                                          |
| --------------------------- | ----------------------------------------------- |
| Direct push                 | Restricted to collaborators; @hedayatis is the only one, with `admin` |
| Pull request from a fork    | Anyone may open one; nothing lands without a merge by @hedayatis |
| GitHub Actions              | No workflow files in the repository; Pages uses the built-in branch deployment |
| Issues                      | Open to the public; issues cannot modify files  |

A public repository grants read and fork rights to everyone and write rights to
no one. Forking copies the code into someone else's account; it cannot alter
this one.

## Settings to keep enabled

Verify these under `Settings` on
[github.com/hedayatis/hedayatis.github.io](https://github.com/hedayatis/hedayatis.github.io).

1. **Collaborators** (`Settings -> Collaborators and teams`) --
   `hedayatis` only. Remove anything else.
2. **Ruleset on `main`** (`Settings -> Rules -> Rulesets -> New branch ruleset`),
   targeting the default branch, enforcement `Active`:
   - Restrict deletions
   - Block force pushes
   - Require a pull request before merging, 1 approval, require review from
     Code Owners -- optional; add `Repository admin` to the bypass list first,
     otherwise a solo maintainer cannot approve their own pull request.
   - Require signed commits -- optional; it proves each commit came from a key
     held by the author rather than from a stolen token.
3. **Actions permissions** (`Settings -> Actions -> General`) --
   workflow permissions set to `Read repository contents and packages`, and
   `Allow GitHub Actions to create and approve pull requests` left unchecked.
   A token that cannot write cannot rewrite the site.
4. **Deploy keys** (`Settings -> Deploy keys`) -- empty, or read-only. A
   write-enabled deploy key is a password-free push route.
5. **Installed apps** (`Settings -> Integrations -> GitHub Apps`) -- every app
   listed there holds whatever permission it was granted. Remove the ones no
   longer in use.
6. **Pages source** (`Settings -> Pages`) -- deploy from the `main` branch. The
   branch ruleset then governs what reaches the published site.

## Account-level settings

Repository rules are only as strong as the account that can bypass them.

- Two-factor authentication enabled on the GitHub account.
- Personal access tokens audited at
  `github.com/settings/tokens`; fine-grained tokens scoped to the repositories
  that need them, classic tokens with `repo` scope revoked when unused.
- Authorized OAuth applications reviewed at
  `github.com/settings/applications`.

## Verifying from a terminal

```sh
# Collaborators: expect exactly one, hedayatis, with admin
gh api repos/hedayatis/hedayatis.github.io/collaborators \
  --jq '.[] | "\(.login) \(.role_name)"'

# Rulesets: expect the main-branch ruleset, enforcement "active"
gh api repos/hedayatis/hedayatis.github.io/rulesets \
  --jq '.[] | "\(.name) \(.enforcement)"'

# Deploy keys: expect an empty list, or read_only true
gh api repos/hedayatis/hedayatis.github.io/keys \
  --jq '.[] | "\(.title) read_only=\(.read_only)"'
```
