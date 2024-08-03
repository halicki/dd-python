qa: lint typecheck test arch

lint:
	uv run ruff check . --extend-select I --fix
	uv run ruff format .

typecheck:
	uv run mypy --strict .

test:
	uv run pytest tests/

arch:
	uv run tach check

# Course exercise: make ex name=risk  -> branch ex/risk from tag risk-task
ex:
	git switch -c ex/$(name) $(name)-task

# Compare own solution with the reference: make compare name=risk
compare:
	git diff $(name)-done

.PHONY: qa lint typecheck test arch ex compare
