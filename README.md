# Campus Study Room Finder — Clean Senior Design Example

This is the **clean starting state** for the senior-design GitHub example. It intentionally does **not** contain the later `floor` enhancement.

The repository demonstrates the complete engineering workflow:

**Issue → Project planning → branch → tests → implementation/documentation → Pull Request → review/checks → merge → Done**

## Project Goal
Help students identify study rooms based on location, group size, and desired features.

## Project Status
Baseline example. The building, capacity, and feature filters work and are covered by automated tests. The `floor` enhancement is intentionally absent so it can be demonstrated live.

## Major Features
- Filter rooms by building
- Filter by minimum capacity
- Filter by desired feature

## Project Management
Use the linked GitHub Project as the living Product Backlog and iteration-management record. Run `setup-student-github.sh` to create the standard labels, fields, and submission views.

## Documentation — Handoff
Durable documentation intended for users, sponsors, future developers, deployers, and maintainers lives under [`docs/`](docs/):
- [Development Guide](docs/development-guide/)
- [User Guide](docs/user-guide/)
- [Deployment Guide](docs/deployment-guide/)
- [Testing Plan](docs/testing/test-plan.md)
- [Project Handoff FAQ](docs/faq/)
- [Security](docs/security/)
- `docs/decisions/`, `docs/investigations/`, and `docs/recommendations/` as needed

## Course / Process Records
Semester-specific records live under [`course/`](course/):
- presentation PDFs under `course/presentations/`
- iteration planning, review, and retrospective documents under `course/iterations/iteration-N/`

These records remain in version control for grading/history but are separate from the handoff documentation set. Formal stand-ups are GitHub Issues/comments, not Markdown files.

## Testing
```bash
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
pytest -q
```

## Iteration Submission Tags
At each deadline create and push an annotated tag:
- `iteration-1-submission`
- `iteration-2-submission`
- `iteration-3-submission`

Do not move/delete a submitted tag. The tag freezes repository content; LMS snapshots preserve the GitHub Project/Issue state at the deadline.

## Example Setup
1. Run `pytest -q` to establish a green baseline.
2. Run `bash setup-student-github.sh` to create/reuse course labels, Project fields, and views.
3. Run `bash import-example-records.sh` to create/reuse the fictional example Issues.
4. Create the **floor enhancement** Issue yourself and demonstrate Issue → branch/tests → PR → merge → Done.
