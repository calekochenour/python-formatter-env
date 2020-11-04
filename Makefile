# Set phony targets
.PHONY: all

# Initialize pre-commit
all:
	pre-commit install
    pre-commit run --all-files
