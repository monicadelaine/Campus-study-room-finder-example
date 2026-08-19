#!/usr/bin/env bash
set -euo pipefail

# Standard CS 495 GitHub setup.
# Safe to rerun: labels, Project, fields, and views are reused when found.

if [[ -z "${REPO:-}" ]]; then
  REPO="$(gh repo view --json nameWithOwner --jq '.nameWithOwner' 2>/dev/null || true)"
fi
if [[ -z "$REPO" ]]; then
  echo "ERROR: Run from a GitHub repository or set REPO=owner/repository."
  exit 1
fi

OWNER="${REPO%%/*}"
PROJECT_TITLE="${PROJECT_TITLE:-Senior Design Project}"

gh auth status >/dev/null

create_label() {
  local name="$1" color="$2" description="$3"
  gh label create "$name" -R "$REPO" --color "$color" --description "$description" --force >/dev/null
  echo "LABEL: $name"
}

echo "Creating/updating standard labels..."
create_label "type:feature" "1D76DB" "User- or sponsor-facing product functionality"
create_label "type:bug" "D73A4A" "Defect or unexpected behavior"
create_label "type:investigation" "8250DF" "Timeboxed technical investigation / spike"
create_label "type:test" "0E8A16" "Testing, test automation, or quality verification"
create_label "type:documentation" "0075CA" "Durable project documentation"
create_label "type:security" "B60205" "Security analysis, remediation, or controls"
create_label "type:deployment" "5319E7" "Hosting, deployment, infrastructure, CI/CD, or operations"
create_label "type:setup" "BFDADC" "Repository, tooling, README, CI, or project setup"
create_label "stand-up" "FBCA04" "Formal team stand-up meeting"

echo
echo "Creating/reusing GitHub Project..."
PROJECT_NUMBER="$(
  gh project list --owner "$OWNER" --format json \
    --jq ".projects[]? | select(.title == \"$PROJECT_TITLE\") | .number" | head -n 1
)"
if [[ -z "$PROJECT_NUMBER" ]]; then
  PROJECT_NUMBER="$(gh project create --owner "$OWNER" --title "$PROJECT_TITLE" \
    --format json --jq '.number')"
  echo "CREATED Project #$PROJECT_NUMBER: $PROJECT_TITLE"
else
  echo "EXISTS Project #$PROJECT_NUMBER: $PROJECT_TITLE"
fi

gh project link "$PROJECT_NUMBER" --owner "$OWNER" --repo "$REPO" >/dev/null 2>&1 || true

ensure_field() {
  local name="$1" type="$2" options="${3:-}"
  local found
  found="$(
    gh project field-list "$PROJECT_NUMBER" --owner "$OWNER" --limit 100 --format json \
      --jq ".fields[]? | select(.name == \"$name\") | .id" | head -n 1
  )"
  if [[ -n "$found" ]]; then
    echo "EXISTS field: $name"
    return
  fi
  if [[ "$type" == "SINGLE_SELECT" ]]; then
    gh project field-create "$PROJECT_NUMBER" --owner "$OWNER" --name "$name" \
      --data-type SINGLE_SELECT --single-select-options "$options" >/dev/null
  else
    gh project field-create "$PROJECT_NUMBER" --owner "$OWNER" --name "$name" \
      --data-type "$type" >/dev/null
  fi
  echo "CREATED field: $name"
}

echo
echo "Creating/reusing Project fields..."
ensure_field "Priority" "SINGLE_SELECT" "P1,P2,P3"
ensure_field "Iteration" "SINGLE_SELECT" "Iteration 1,Iteration 2,Iteration 3"
ensure_field "Work Type" "SINGLE_SELECT" "Feature,Bug,Investigation,Test,Documentation,Security,Deployment,Setup"
ensure_field "Estimate" "NUMBER"
ensure_field "Risk" "SINGLE_SELECT" "Low,Medium,High"
ensure_field "Planned" "SINGLE_SELECT" "Planned,Added During Iteration"
ensure_field "Evidence Ready" "SINGLE_SELECT" "Yes,No"

PROJECT_ID="$(gh project view "$PROJECT_NUMBER" --owner "$OWNER" --format json --jq '.id')"

view_exists() {
  local name="$1"
  gh api graphql \
    -f query='query($id:ID!){node(id:$id){... on ProjectV2{views(first:100){nodes{name}}}}}' \
    -f id="$PROJECT_ID" \
    --jq ".data.node.views.nodes[]? | select(.name == \"$name\") | .name" | head -n 1
}

OWNER_TYPE="$(gh api graphql -f query='query($login:String!){organization(login:$login){login} user(login:$login){login}}' \
  -f login="$OWNER" --jq 'if .data.organization then "org" else "user" end')"

create_view() {
  local name="$1" layout="$2" filter="$3"
  if [[ -n "$(view_exists "$name")" ]]; then
    echo "EXISTS view: $name"
    return
  fi

  local endpoint
  if [[ "$OWNER_TYPE" == "org" ]]; then
    endpoint="orgs/$OWNER/projectsV2/$PROJECT_NUMBER/views"
  else
    USER_ID="$(gh api "users/$OWNER" --jq '.id')"
    endpoint="users/$USER_ID/projectsV2/$PROJECT_NUMBER/views"
  fi

  if gh api --method POST "$endpoint" \
      -H "Accept: application/vnd.github+json" \
      -H "X-GitHub-Api-Version: 2026-03-10" \
      -f name="$name" -f layout="$layout" -f filter="$filter" >/dev/null 2>&1; then
    echo "CREATED view: $name"
  else
    echo "MANUAL view needed: $name"
    echo "  layout=$layout"
    echo "  filter=$filter"
  fi
}

echo
echo "Creating/reusing submission views..."
create_view "01 - Product Backlog" "table" 'is:issue -label:"stand-up"'
create_view "02 - Iteration 1 Plan" "table" 'iteration:"Iteration 1"'
create_view "03 - Iteration 2 Plan" "table" 'iteration:"Iteration 2"'
create_view "04 - Iteration 3 Plan" "table" 'iteration:"Iteration 3"'
create_view "05 - Iteration 1 Results" "table" 'iteration:"Iteration 1"'
create_view "06 - Iteration 2 Results" "table" 'iteration:"Iteration 2"'
create_view "07 - Iteration 3 Results" "table" 'iteration:"Iteration 3"'
create_view "08 - Team Contributions" "table" 'is:issue -label:"stand-up"'
create_view "09 - Engineering & Quality Work" "table" 'is:issue -label:"type:feature" -label:"stand-up"'
create_view "10 - Decisions & Investigations" "table" 'label:"type:investigation"'
create_view "11 - Remaining Backlog" "table" '-status:Done -label:"stand-up"'

echo
echo "Setup complete."
echo "Open the Project in GitHub and customize visible fields/grouping as needed."
