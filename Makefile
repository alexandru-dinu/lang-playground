.PHONY: readme
readme:
	uv tool run mdup -i README.md

.PHONY: test
test:
	uv run pytest -v src/*.py
