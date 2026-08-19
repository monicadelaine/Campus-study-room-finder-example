# GitHub Student Setup Instructions

## One-time repository setup

Run the course setup script from the repository root. The script creates/reuses the standard course labels, links/creates the GitHub Project, and creates the standard Project fields.

The script **does not create saved Project views**. Each team creates the six required views manually so that team members understand how the Project fields, filters, grouping, and views work.

## Required saved views

Follow:

**`GitHub-Project-Views-Student-Instructions.md`**

Create these six views:

1. `01 - Product Backlog`
2. `02 - Current Iteration`
3. `03 - Team Contributions`
4. `04 - Engineering & Quality Work`
5. `05 - Decisions & Investigations`
6. `06 - Remaining Backlog`

The same **Current Iteration** view is used twice for each iteration:
- immediately after planning → LMS **planning snapshot**
- at the iteration deadline → LMS **results snapshot**

The Project remains a living record. The LMS snapshots preserve the point-in-time plan and result.

## Authentication

Check GitHub CLI authentication:

```bash
gh auth status
```

If Project commands report that the token lacks the `project` scope:

```bash
gh auth refresh -s project
```

Never put GitHub tokens, passwords, private keys, `.env` secrets, or API credentials into Issues, Pull Requests, commits, README files, course documentation, or AI/chat tools.

## Submission tags

At each iteration deadline, create the required annotated repository tag after the submission state has been committed:

```bash
git tag -a iteration-1-submission -m "Iteration 1 submission"
git push origin iteration-1-submission
```

Use:
- `iteration-1-submission`
- `iteration-2-submission`
- `iteration-3-submission`

A Git tag freezes committed repository content. It does **not** freeze GitHub Project/Issue metadata; the LMS Project-view snapshots preserve that evidence.
