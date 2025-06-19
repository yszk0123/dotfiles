# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository for macOS that manages development environment configuration and automation. The repository uses a modular approach with separate configuration directories and installation scripts.

## Common Commands

### Setup and Maintenance
- **Initial setup**: `sh ~/dotfiles/scripts/install.sh` (requires `ZDOTDIR` environment variable)
- **Interactive update**: `sh ~/dotfiles/update.sh` (recommended for regular maintenance)
- **Link dotfiles**: `sh ~/dotfiles/scripts/linkDotfiles.sh`
- **Update macOS settings**: `sh ~/dotfiles/scripts/updateMacSettings.sh`

### Package Management
- **Install/update Homebrew packages**: `brew bundle` (uses `Brewfile`)
- **Update mise-managed runtimes**: `mise install` or `mise upgrade`

### Shell Configuration
- **Change default shell to zsh**: `chsh -s <path/to/zsh>`
- **Reload zsh configuration**: `source ~/.zshrc` (configuration files are in `/zsh/`)

## Architecture and Structure

### Configuration Organization
- **`.config/`** - XDG-compliant configuration files for modern tools (git, mise, ghostty, karabiner, etc.)
- **`zsh/`** - Modular zsh configuration split by function (aliases, completion, history, keybindings, git integration)
- **`scripts/`** - Installation and maintenance automation with individual tool installers in `scripts/install/`
- **`vim/`** - Vim/Neovim configuration modules

### Package and Runtime Management
- **Homebrew** - Primary package manager (managed via `Brewfile`)
- **mise** - Runtime version manager for Node.js (v20), Python, and other tools
  - Configuration: `.config/mise/config.toml`
  - Python version management enabled via `idiomatic_version_file_enable_tools`
- **sheldon** - Zsh plugin manager (config: `.config/sheldon/plugins.toml`)
- **uv** - Python package manager (config: `.config/uv/uv.toml`)

### Development Environment
- **Multiple Python versions**: 3.9, 3.10, 3.11 (managed via Homebrew and mise)
- **Node.js**: Version 20 (managed via mise)
- **Git integration**: Extensive aliases and configuration in `zsh/git.zsh` and `.config/git/`
- **Terminal enhancement**: starship prompt, fzf, ripgrep, bat, eza
- **Editor support**: Vim/Neovim with CoC, VS Code extensions via Brewfile

### Key Environment Variables
- **`ZDOTDIR`** - Required for installation scripts
- **`GITLAB_PRIVATE_TOKEN`** - For GitLab API access
- **`HOMEBREW_GITHUB_API_TOKEN`** - To avoid GitHub API rate limits

## Modular Design Patterns

- Zsh configuration is split into logical modules (alias, complete, history, etc.) rather than monolithic files
- Installation scripts are organized by tool category in `scripts/install/`
- Configuration files follow XDG Base Directory specification where possible
- Dotfiles are symlinked rather than copied, allowing direct editing in the repository