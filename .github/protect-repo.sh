#!/usr/bin/env bash
#
# Apply and verify the write-access protections for hedayatis.github.io.
#
# The repository stays public so GitHub Pages can serve it; this script locks
# the write side. It is idempotent -- run it any time to re-assert the settings
# or just to audit them.
#
#   ./.github/protect-repo.sh          # apply, then report
#   ./.github/protect-repo.sh --audit  # report only, change nothing
#
# Authentication, in order of preference:
#   1. the GitHub CLI, if `gh auth status` is already signed in
#   2. $GITHUB_TOKEN, a fine-grained token for this repository with
#      Administration: read and write, and Contents: read
#
set -uo pipefail

OWNER=hedayatis
REPO=hedayatis.github.io
AUDIT_ONLY=false
[ "${1:-}" = "--audit" ] && AUDIT_ONLY=true

say()  { printf '\n== %s\n' "$1"; }
ok()   { printf '   ok     %s\n' "$1"; }
warn() { printf '   check  %s\n' "$1"; }

# --- transport ---------------------------------------------------------------
#
# api METHOD PATH [json-body] -- prints the response, returns non-zero on
# failure. Every caller handles its own failure, so one blocked endpoint never
# aborts the rest of the audit.

if command -v gh >/dev/null 2>&1 && gh auth status >/dev/null 2>&1; then
  api() {
    local path="repos/$OWNER/$REPO${2:+/$2}"
    if [ -n "${3:-}" ]; then
      printf '%s' "$3" | gh api --method "$1" "$path" --input - 2>/dev/null
    else
      gh api --method "$1" "$path" 2>/dev/null
    fi
  }
elif [ -n "${GITHUB_TOKEN:-}" ]; then
  api() {
    curl -sS --fail -X "$1" \
      -H "Authorization: Bearer $GITHUB_TOKEN" \
      -H "Accept: application/vnd.github+json" \
      -H "Content-Type: application/json" \
      ${3:+--data-binary "$3"} \
      "https://api.github.com/repos/$OWNER/$REPO${2:+/$2}" 2>/dev/null
  }
else
  echo "No credentials. Run 'gh auth login', or export GITHUB_TOKEN with" >&2
  echo "Administration: read and write on $OWNER/$REPO." >&2
  exit 1
fi

# Render JSON with a python expression; falls back to a check line.
show() { # show <python-expression>  (reads JSON on stdin)
  python3 -c "import sys,json;d=json.load(sys.stdin);print($1)" 2>/dev/null \
    || warn "unexpected response shape"
}

DENIED="no permission for this endpoint -- the token needs Administration:
          read and write, or your organization blocks it"

# --- 1. branch ruleset -------------------------------------------------------

RULESET_NAME="protect-main"
RULESET_BODY='{
  "name": "protect-main",
  "target": "branch",
  "enforcement": "active",
  "conditions": {"ref_name": {"include": ["~DEFAULT_BRANCH"], "exclude": []}},
  "rules": [{"type": "deletion"}, {"type": "non_fast_forward"}]
}'

say "Branch ruleset on the default branch"
if rulesets=$(api GET rulesets); then
  existing=$(printf '%s' "$rulesets" \
    | show "next((r['id'] for r in d if r['name']=='$RULESET_NAME'), '')")

  if [ "$AUDIT_ONLY" = true ]; then
    if [ -n "$existing" ]; then
      ok "$RULESET_NAME present (id $existing)"
    else
      warn "$RULESET_NAME missing -- deletions and force pushes are unrestricted"
    fi
  elif [ -n "$existing" ]; then
    if api PUT "rulesets/$existing" "$RULESET_BODY" >/dev/null; then
      ok "$RULESET_NAME updated -- deletions restricted, force pushes blocked"
    else
      warn "$DENIED"
    fi
  else
    if api POST rulesets "$RULESET_BODY" >/dev/null; then
      ok "$RULESET_NAME created -- deletions restricted, force pushes blocked"
    else
      warn "$DENIED"
    fi
  fi
else
  warn "could not list rulesets -- $DENIED"
fi

# --- 2. Actions cannot write -------------------------------------------------

say "GitHub Actions token permissions"
[ "$AUDIT_ONLY" = false ] && api PUT actions/permissions/workflow \
  '{"default_workflow_permissions":"read","can_approve_pull_request_reviews":false}' >/dev/null

if perms=$(api GET actions/permissions/workflow); then
  printf '%s' "$perms" | show "'   %s  workflow token: %s, may approve pull requests: %s' % ('ok    ' if d['default_workflow_permissions']=='read' and not d['can_approve_pull_request_reviews'] else 'check ', d['default_workflow_permissions'], d['can_approve_pull_request_reviews'])"
else
  warn "could not read Actions permissions -- $DENIED"
fi

# --- 3. audit the remaining write routes -------------------------------------

say "Collaborators (expect hedayatis, admin, and nobody else)"
if people=$(api GET collaborators); then
  printf '%s' "$people" | show "'\n'.join('   %s  %s (%s)' % ('ok    ' if c['login']=='$OWNER' else 'check ', c['login'], c['role_name']) for c in d)"
else
  warn "could not list collaborators"
fi

say "Deploy keys (expect none, or read-only)"
if keys=$(api GET keys); then
  printf '%s' "$keys" | show "'\n'.join('   %s  %s read_only=%s' % ('ok    ' if k['read_only'] else 'check ', k['title'], k['read_only']) for k in d) or '   ok     none'"
else
  warn "could not list deploy keys"
fi

say "Repository visibility and default branch"
if repo=$(api GET ""); then
  printf '%s' "$repo" | show "'   ok     %s, default branch %s' % (d['visibility'], d['default_branch'])"
else
  warn "could not read repository settings"
fi

cat <<'EOF'

== Left to you in the browser (no API route)
   Settings -> Integrations -> GitHub Apps   remove apps no longer in use
   github.com/settings/security              two-factor authentication on
   github.com/settings/tokens                revoke unused write-scoped tokens
EOF
