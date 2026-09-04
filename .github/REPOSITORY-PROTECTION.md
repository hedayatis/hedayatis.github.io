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

## Applying the protections

`.github/protect-repo.sh` applies and verifies everything reachable through the
API, and is safe to re-run:

```sh
./.github/protect-repo.sh          # apply, then report
./.github/protect-repo.sh --audit  # report only, change nothing
```

It authenticates through the GitHub CLI when `gh auth status` is already signed
in, and otherwise through `$GITHUB_TOKEN` -- a fine-grained token for this
repository with **Administration: read and write** and **Contents: read**,
created at `github.com/settings/personal-access-tokens`. Each endpoint reports
independently, so a permission the token lacks produces one `check` line rather
than stopping the run.

The script sets:

1. **A ruleset named `protect-main`** on the default branch, enforcement
   `Active`, restricting deletions and blocking force pushes. History on the
   published branch can then only move forward.
2. **Read-only Actions token permissions**, with `can_approve_pull_request_reviews`
   off. A workflow token that cannot write cannot rewrite the site.

and reports on:

3. **Collaborators** -- expect `hedayatis` with `admin`, and nobody else.
4. **Deploy keys** -- expect none, or `read_only=true`. A write-enabled deploy
   key is a password-free push route.
5. **Visibility and default branch** -- expect `public` and `main`.

## Settings with no API route

These are browser-only:

- `Settings -> Integrations -> GitHub Apps` -- every app listed holds whatever
  permission it was granted. Remove the ones no longer in use.
- `Settings -> Pages` -- deploy from the `main` branch, so the branch ruleset
  governs what reaches the published site.

## Optional, stricter rules

Both are added under `Settings -> Rules -> Rulesets -> protect-main`:

- **Require a pull request before merging**, 1 approval, require review from
  Code Owners. Add `Repository admin` to the bypass list first, otherwise a
  solo maintainer cannot approve their own pull request and the branch becomes
  unwritable. `.github/CODEOWNERS` assigns every path to `@hedayatis`, and
  takes effect only from the default branch.
- **Require signed commits.** This proves each commit came from a key the
  author holds rather than from a stolen token.

## Account-level settings

Repository rules are only as strong as the account that can bypass them.

- Two-factor authentication enabled on the GitHub account.
- Personal access tokens audited at
  `github.com/settings/tokens`; fine-grained tokens scoped to the repositories
  that need them, classic tokens with `repo` scope revoked when unused.
- Authorized OAuth applications reviewed at
  `github.com/settings/applications`.

## Verifying later

```sh
./.github/protect-repo.sh --audit
```

Every line should read `ok`. A `check` line names the setting that drifted.
