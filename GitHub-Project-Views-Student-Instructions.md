# GitHub Project Views --- Student Setup Instructions

## Purpose

Your GitHub Project is the **living project-management record** for your
senior design project. It should make the current backlog, iteration
work, responsibilities, engineering work, and remaining work easy to
understand.

The LMS is used to preserve **point-in-time submission snapshots**.
GitHub Project itself continues to change as the project progresses.

You should create the six saved views described below.

------------------------------------------------------------------------

## Before You Begin

Your GitHub Project should already contain the course Project fields,
including:

-   **Status**
-   **Priority**
-   **Iteration**
-   **Work Type**
-   **Estimate**
-   **Risk**
-   **Planned**
-   **Evidence Ready**
-   **Assignees**

Open the GitHub Project linked to your team's repository.

To create a view:

1.  Click **+ New view** at the top of the Project.
2.  Select **Table**.
3.  Rename the view using the name specified below.
4.  Configure the filter, grouping, sorting, and visible fields as
    described.
5.  GitHub saves Project view changes automatically.

> Filters shown below are examples based on the standard course fields
> and labels. If GitHub's interface formats the filter slightly
> differently, use the filter controls to select the equivalent
> field/value.

------------------------------------------------------------------------

# 1. Product Backlog

**View name:**

`01 - Product Backlog`

### Purpose

This is the team's primary view of the Product Backlog. It should show
the significant work that is known for the project, whether or not that
work has been assigned to an iteration.

Formal stand-up Issues should not appear in this view.

### Recommended fields

Display:

-   Title
-   Assignees
-   Status
-   Priority
-   Iteration
-   Work Type
-   Estimate
-   Risk
-   Planned
-   Evidence Ready

### Recommended configuration

Exclude Issues with the `stand-up` label.

Sort primarily by **Priority** so the most important work is easy to
identify.

### What this view should answer

> What work does the team currently know needs to be done, and what is
> most important?

------------------------------------------------------------------------

# 2. Current Iteration

**View name:**

`02 - Current Iteration`

### Purpose

This view shows the work selected for the current iteration.

Change the **Iteration** filter as the semester progresses:

-   Iteration 1
-   Iteration 2
-   Iteration 3

For example, during Iteration 1, filter for:

`Iteration:"Iteration 1"`

### Recommended fields

Display:

-   Title
-   Assignees
-   Status
-   Priority
-   Work Type
-   Estimate
-   Risk
-   Planned
-   Evidence Ready

### During iteration planning

After sponsor/team planning, this view represents:

> **What we intend to accomplish during this iteration.**

Take the required **LMS planning snapshot** after planning is complete.

### At the iteration deadline

The same view now represents:

> **What actually happened during the iteration.**

Take the required **LMS results snapshot** at the iteration deadline.

Do **not** remove unfinished work to make the iteration appear complete.

Items that are:

-   Done
-   In Progress
-   Blocked
-   incomplete
-   added during the iteration

should remain visible with their actual status.

### Plan versus Results

You do not need separate permanent Plan and Results views.

The distinction is the **time at which the LMS snapshot is taken**:

  -----------------------------------------------------------------------
  Snapshot                            Meaning
  ----------------------------------- -----------------------------------
  Planning snapshot                   What the team planned/committed to
                                      after iteration planning

  Results snapshot                    What the actual state of that work
                                      was at the iteration deadline
  -----------------------------------------------------------------------

------------------------------------------------------------------------

# 3. Team Contributions

**View name:**

`03 - Team Contributions`

### Purpose

This view helps the team and instructor see substantive project work by
team member.

It is evidence of contribution, but it is **not a commit-count
competition**.

### Recommended fields

Display:

-   Title
-   Assignees
-   Status
-   Iteration
-   Work Type
-   Estimate
-   Evidence Ready

### Recommended configuration

Exclude formal `stand-up` Issues.

Group the view by:

**Assignees**

### Appropriate contribution evidence may include

-   features;
-   bugs/fixes;
-   automated or manual testing;
-   technical investigations;
-   design/architecture work;
-   documentation;
-   security work;
-   deployment/infrastructure;
-   sponsor recommendations;
-   integration;
-   review;
-   other substantive project work.

### What this view should answer

> Is each team member making a sustained and significant contribution to
> the project?

Formal stand-up comments provide additional individual evidence and are
maintained separately in the stand-up Issues.

------------------------------------------------------------------------

# 4. Engineering & Quality Work

**View name:**

`04 - Engineering & Quality Work`

### Purpose

Feature development is only one part of software engineering. This view
makes important engineering and quality work visible.

### Recommended fields

Display:

-   Title
-   Assignees
-   Status
-   Iteration
-   Work Type
-   Priority
-   Evidence Ready

### Recommended configuration

Group by:

**Work Type**

This should make categories such as the following easy to see:

-   Bug
-   Investigation
-   Test
-   Documentation
-   Security
-   Deployment
-   Setup

Feature work may also remain visible, but the purpose of this view is to
prevent non-feature engineering work from disappearing from project
reporting.

### What this view should answer

> What engineering work is the team doing beyond implementing visible
> features?

------------------------------------------------------------------------

# 5. Decisions & Investigations

**View name:**

`05 - Decisions & Investigations`

### Purpose

Use this view to identify technical uncertainty and engineering
decisions that require investigation.

### Recommended filter

Filter for:

`Work Type:"Investigation"`

### Recommended fields

Display:

-   Title
-   Assignees
-   Status
-   Iteration
-   Priority
-   Risk
-   Evidence Ready

### Examples

Items might include:

-   PostgreSQL vs. MongoDB;
-   Django vs. Spring;
-   AWS vs. Google Cloud;
-   authentication approach;
-   external API suitability;
-   hosting options and costs;
-   storage architecture.

An investigation Issue should lead to appropriate evidence.

Depending on the significance of the result, that evidence may include:

-   `docs/investigations/` --- investigation results;
-   `docs/decisions/` --- Architecture Decision Record (ADR);
-   `docs/recommendations/` --- sponsor/client recommendation.

### What this view should answer

> What important technical questions has the team identified,
> investigated, or resolved?

------------------------------------------------------------------------

# 6. Remaining Backlog

**View name:**

`06 - Remaining Backlog`

### Purpose

This view identifies known work that is **not complete**.

It is particularly important for the final project handoff.

### Recommended configuration

Exclude items whose Status is **Done**.

Also exclude formal `stand-up` Issues.

### Recommended fields

Display:

-   Title
-   Assignees
-   Status
-   Priority
-   Work Type
-   Risk
-   Iteration

### This view should expose

-   unfinished features;
-   known defects;
-   technical debt;
-   unresolved investigations;
-   security work;
-   deployment work;
-   incomplete documentation;
-   desired future enhancements.

Do not delete or hide known unfinished work merely because the semester
is ending.

### What this view should answer

> If another development team took over tomorrow, what known work would
> remain?

------------------------------------------------------------------------

# Using Views for Iteration Submissions

GitHub Project is a **living record**. The Project will continue to
change after each submission.

For this reason, the LMS submission preserves point-in-time evidence.

For each iteration, you may be asked to submit snapshots or links
showing the current state of views such as:

-   Product Backlog;
-   Current Iteration after planning;
-   Current Iteration at the deadline;
-   Team Contributions;
-   Engineering & Quality Work;
-   Remaining Backlog.

Follow the specific LMS assignment for the required submission items.

------------------------------------------------------------------------

# Git Tags and Project Views Serve Different Purposes

At each iteration deadline, the team also creates an annotated Git tag:

-   `iteration-1-submission`
-   `iteration-2-submission`
-   `iteration-3-submission`

The tag preserves the exact repository state at the submission point,
including:

-   source code;
-   tests;
-   `README.md`;
-   `docs/`;
-   `course/`;
-   configuration and other committed files.

However, a Git tag does **not** freeze GitHub Project fields, Project
views, Issue status, or other GitHub metadata.

Therefore:

**Git tag = repository snapshot**

**LMS Project-view snapshot = project-management snapshot**

Both provide useful evidence of the project state at an iteration
deadline.

------------------------------------------------------------------------

# Final Check

Before an iteration submission, verify that:

-   [ ] Product Backlog reflects the known project work.
-   [ ] Current Iteration contains the work selected for the iteration.
-   [ ] Actual statuses are accurate.
-   [ ] Incomplete and blocked work remains visible.
-   [ ] Work added during the iteration is identified appropriately.
-   [ ] Assignees reflect actual responsibility.
-   [ ] Engineering and quality work is represented, not just features.
-   [ ] Important investigations and decisions are visible.
-   [ ] Done items contain appropriate completion evidence.
-   [ ] Remaining Backlog accurately represents known unfinished work.
-   [ ] Required LMS snapshots/links have been captured.
-   [ ] The appropriate iteration submission tag has been created and
    pushed.
