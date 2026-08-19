# Student GitHub Setup

Run this once after creating your project repository. It is safe to rerun.

## Requirements
```bash
gh auth login
gh auth refresh -s project
```

## Run
From the repository root:

```bash
bash setup-student-github.sh
```

Or:

```bash
REPO=owner/repository bash setup-student-github.sh
```

The script creates/updates the standard **work-type labels**, creates or reuses a GitHub Project, creates course Project fields, links the repository, and attempts to create the standard reporting/submission views.

### Labels
- `type:feature`
- `type:bug`
- `type:investigation`
- `type:test`
- `type:documentation`
- `type:security`
- `type:deployment`
- `type:setup`
- `stand-up`

### Project fields
- Priority: P1 / P2 / P3
- Iteration: Iteration 1 / Iteration 2 / Iteration 3
- Work Type: Feature / Bug / Investigation / Test / Documentation / Security / Deployment / Setup
- Estimate
- Risk: Low / Medium / High
- Planned: Planned / Added During Iteration
- Evidence Ready: Yes / No

### Reporting views
- Product Backlog
- Iteration 1/2/3 Plan
- Iteration 1/2/3 Results
- Team Contributions
- Engineering & Quality Work
- Decisions & Investigations
- Remaining Backlog

The script prints any view it cannot create automatically so you can create it in the GitHub Project UI.
