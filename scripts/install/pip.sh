#!/bin/bash

# Python tools managed via uv tool install for better isolation
# Global pip installs are discouraged in favor of virtual environments

if ! command -v uv &>/dev/null; then
    echo "uv not found. Install it first: curl -LsSf https://astral.sh/uv/install.sh | sh"
    exit 1
fi

# Essential Python tools installed via uv for global access
if confirm_with_message "Install essential Python tools via uv?"; then
    uv tool install ruff
    uv tool install mypy
    uv tool install pytest
fi
