# Set phony targets
.PHONY: initialize format

# Initialize pre-commit
initialize:
	pre-commit install
	pre-commit run --all-files

# Test formatter on example.py
format:
	black 01-code-scripts/example.py
