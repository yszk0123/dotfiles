#!/bin/bash

# Python packages should be managed with uv or pipx for better isolation
# Global pip installs are discouraged in favor of virtual environments

if ! command -v uv &>/dev/null; then
    echo "Installing uv for Python package management..."
    if confirm_with_message "Install uv via pipx?"; then
        pipx install uv
    fi
fi

if ! command -v pipx &>/dev/null; then
    echo "pipx not found. Install it via Homebrew: brew install pipx"
    exit 1
fi

# Essential Python tools installed via pipx for global access
if confirm_with_message "Install essential Python tools via pipx?"; then
    pipx install black
    pipx install flake8
    pipx install mypy
    pipx install pytest
fi
