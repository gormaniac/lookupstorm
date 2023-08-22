NAME = lookup-storm

.PHONY: help
help: # Display help for all Makefile commands
	@grep -E '^[a-zA-Z0-9 -]+:.*#'  Makefile | sort | while read -r l; do printf "\033[1;32m$$(echo $$l | cut -f 1 -d':')\033[00m:$$(echo $$l | cut -f 2- -d'#')\n"; done

.PHONY: build
build: # Build the Rapid Power-Up using "synapse.tools.genpkg"
	pipenv run python3 -m synapse.tools.genpkg --no-docs --save $(NAME).json $(NAME).yaml

.PHONY: push
push: # Push the completed Rapid Power-Up's JSON file to a Cortex (requires CORTEX=<Telepath URL>)
	pipenv run python3 -m synapse.tools.genpkg --push $(CORTEX) $(NAME).json

.PHONY: setup
setup: # Setup this project's pipenv environment
	pipenv install -d

.PHONY: docs
docs: # Build the documentation for this project - deletes docs/ on each execution
	rm -rf docs/
	pipenv run sphinx-build doc/ docs/

.PHONY: read-docs
read-docs: # Open the project's docs locally
	open docs/index.html

.PHONY: release
release: setup build docs # Build a new versioned release and push it (requires VERSION=#.#.#)
	git commit -m "build: release v$(VERSION)"
	git push
	git tag -a v$(VERSION) -m "Release v$(VERSION)"
	git push origin v$(VERSION)

.PHONY: tests
tests: # Run the pytest suite for this project.
	pipenv run pytest tests/
