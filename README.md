Python LLM Template

A production‑ready Python template for AI/LLM services. Includes a FastAPI app, strict linting/typing, tests, and a GitHub Actions CI that uses uv for fast, reproducible installs.

Use this repo as a Template Repository in GitHub to spin up new projects in seconds.

✨ Features

Modern layout: src/ package structure (python_llm_template)

FastAPI service with a /health endpoint

uv workflow: uv venv, uv pip install, uv run …

CI (GitHub Actions): create venv, install prod+dev, run pre‑commit, ruff, black, mypy, pytest

Pre‑commit with auto‑format & checks (black, ruff, mypy, basic hygiene)

Typed tests using pytest + fastapi.testclient

Ready for .env config & containerization later

🧱 Project structure

python-llm-template/
├── .github/
│   └── workflows/
│       └── ci.yml
├── .pre-commit-config.yaml
├── .gitignore
├── README.md
├── pyproject.toml
├── src/
│   └── python_llm_template/
│       └── api/
│           └── main.py
└── tests/
    ├── test_health.py
    └── test_smoke.py

✅ Requirements

Python 3.11+

uv (fast Python package manager)

python -m pip install uv

🚀 Quickstart

# 1) Create a virtual environment
uv venv .venv

# 2) Install project + dev tools (editable)
uv pip install -e ".[dev]"

# 3) Install git hooks (runs black/ruff/mypy on commit)
uv run pre-commit install

# 4) Run tests
uv run pytest -q

# 5) Start the API (dev)
uv run uvicorn python_llm_template.api.main:app --reload
# Open docs: http://127.0.0.1:8000/docs
# Health check: http://127.0.0.1:8000/health

Example request

curl http://127.0.0.1:8000/health
# {"status":"ok"}

⚙️ Configuration

Create a .env for local dev (and commit a safe default to .env.example). Example:

# .env.example
APP_NAME="Template API"
LOG_LEVEL="info"
PORT=8000

Load env vars in your app as needed (e.g., with pydantic-settings down the line).

🧪 Testing

uv run pytest -q
# With coverage (optional):
# uv pip install pytest-cov
# uv run pytest --cov=python_llm_template --cov-report=term-missing

🧹 Lint, format, type‑check

# Lint
uv run ruff check .
# Auto‑fix lint where possible
uv run ruff check . --fix

# Format
uv run black .
# or check only
uv run black --check .

# Type‑check
uv run mypy .

# Run all pre‑commit hooks on the repo
uv run pre-commit run --all-files

Tool settings live in pyproject.toml (black/ruff/mypy). Adjust to your taste.

🧰 CI (GitHub Actions)

The workflow in .github/workflows/ci.yml:

Sets up Python 3.11

Installs uv

Creates a venv: uv venv .venv

Installs project: uv pip install -e ".[dev]"

Runs pre-commit, ruff, black, mypy, and pytest

To change Python version, update actions/setup-python → python-version.

🧭 Starting a new project from this template

On GitHub → Settings → enable Template repository.

Click Use this template → Create a new repository.

(Optional) Rename the Python package:

Move the folder:

git mv src/python_llm_template src/<your_package_name>

Update pyproject.toml:

[project].name = "<your-distribution-name>"

[tool.hatch.build.targets.wheel].packages = ["src/<your_package_name>"]

Fix imports in code/tests:

grep -R "python_llm_template" -n .
# replace with <your_package_name>

Search & replace README, API title, etc.

📝 Makefile (optional convenience)

If you like short commands, add a Makefile:

.PHONY: venv install dev lint fmt type test run
venv:
	uv venv .venv
install:
	uv pip install -e ".[dev]"
dev: run
lint:
	uv run ruff check .
fmt:
	uv run black .
type:
	uv run mypy .
test:
	uv run pytest -q
run:
	uv run uvicorn python_llm_template.api.main:app --reload

📄 License

MIT (or your choice). Add a LICENSE file at the repo root.

🤝 Contributing

Fork, create a feature branch, run pre-commit install, keep CI green.

Open a PR; include tests where possible.

🧯 Troubleshooting

No virtual environment found (CI) → ensure workflow runs uv venv .venv before uv pip install.

pre-commit: file not found → filename must be .pre-commit-config.yaml at repo root.

Editable install fails (Hatchling) → confirm pyproject.toml has:

[build-system] hatchling>=1.24.0

packages = ["src/python_llm_template"]

src/python_llm_template/__init__.py exists

FastAPI TestClient error: needs httpx → add httpx to dev deps.

Import errors after renaming → grep and replace old package name; update pyproject.toml.

📚 Notes

Interactive API docs available at /docs when the server runs.

Consider adding Docker & .env handling when you start wiring real endpoints.