# dd-python

Python port of the [Domain Drivers](https://edu.devstyle.pl/products/domain-drivers) course code.
This fork is used for working through the course. See `CLAUDE.md` and `docs/` for the workflow.

## Setup

- Install [uv](https://docs.astral.sh/uv/) and have Docker running (tests use [TestContainers](https://testcontainers.com/))
- `uv sync` installs Python 3.12 and all dependencies into `.venv`

## Running linters and tests

```bash
make qa          # ruff + mypy --strict + pytest + tach
make test        # pytest only
```

## Working on a course exercise

```bash
make ex name=risk            # branch ex/risk from tag risk-task
.venv/bin/pytest tests/      # the venv built from main works on every tag
make compare name=risk       # diff against the reference solution
```
