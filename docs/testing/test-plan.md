# Testing Plan — Baseline

## Scope & Objectives
Verify the current room-filtering logic before adding new functionality.

## Test Environment Setup
```bash
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
```

## Run Instructions
```bash
pytest -q
```

## Test Case Inventory
| ID | Behavior | Type | Automated Test |
|---|---|---|---|
| T-01 | Building + capacity filtering | Automated | `test_filter_by_building_and_capacity` |
| T-02 | Feature filtering | Automated | `test_filter_by_feature` |
| T-03 | Minimum capacity boundary | Automated | `test_capacity_boundary_one_is_valid` |
| T-04 | Invalid capacity | Automated | `test_invalid_capacity_rejected` |

## Manual Test Cases
None required for the baseline command-line example.

## Pass/Fail Criteria
All automated tests pass before a new change is merged.

## Limitations
No browser UI, persistence, authentication, deployment, or accessibility testing exists yet.
