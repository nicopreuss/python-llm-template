.PHONY: setup fmt lint test run precommit

setup:
	uv sync --group dev
	uv run pre-commit install

fmt:
	uv run ruff check --fix .
	uv run black .

lint:
	uv run ruff check .
	uv run black --check .
	uv run mypy .

test:
	uv run pytest

run:
	uv run uvicorn llm_template.api.main:app --reload
