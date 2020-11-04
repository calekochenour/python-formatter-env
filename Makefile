# Set phony targets
.PHONY: initialize test

# Initialize pre-commit
initialize:
	pre-commit install
	pre-commit run --all-files

# Test formatter on example.py
test:
	black 01-code-scripts/example.py
