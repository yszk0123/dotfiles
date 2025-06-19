#!/bin/bash
# Development container setup script

set -e

echo "Setting up dotfiles development environment..."

# Install mise for runtime management
curl https://mise.run | sh
echo 'eval "$($HOME/.local/bin/mise activate bash)"' >> ~/.bashrc

# Install sheldon for zsh plugin management
curl --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/rossmacarthur/sheldon/main/install.sh | sh

# Install starship prompt
curl -sS https://starship.rs/install.sh | sh -s -- -y

# Install essential development tools
sudo apt-get update
sudo apt-get install -y \
    curl \
    git \
    jq \
    ripgrep \
    fd-find \
    bat \
    tree \
    shellcheck \
    pre-commit

# Create symbolic links for common tools
sudo ln -sf /usr/bin/batcat /usr/local/bin/bat
sudo ln -sf /usr/bin/fdfind /usr/local/bin/fd

# Setup mise tools
export PATH="$HOME/.local/bin:$PATH"
mise install node@22
mise install python@3.13
mise global node@22
mise global python@3.13

# Install Python tools via pipx
python -m pip install --user pipx
python -m pipx ensurepath
pipx install black
pipx install flake8
pipx install mypy
pipx install pre-commit

# Setup git configuration
git config --global init.defaultBranch main
git config --global core.editor "code --wait"

# Install pre-commit hooks if in a git repository
if [ -f .pre-commit-config.yaml ]; then
    pre-commit install
fi

echo "Development environment setup complete!"
echo "Restart your shell or run: exec zsh"