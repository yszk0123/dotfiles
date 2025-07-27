# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository for macOS that manages development environment configuration and automation. The repository uses a modular approach with separate configuration directories and installation scripts.

## Common Commands

### Setup and Maintenance
- **Initial/update**: `sh ~/dotfiles/update.sh` (comprehensive update with verification)
- **Link dotfiles**: `sh ~/dotfiles/scripts/linkDotfiles.sh`
- **Update macOS settings**: `sh ~/dotfiles/scripts/updateMacSettings.sh`
- **System verification**: `sh ~/dotfiles/scripts/verify.sh`

### Package Management
- **Install/update Homebrew packages**: `brew bundle` (uses `Brewfile`)
- **Update mise-managed runtimes**: `mise upgrade` (Node.js v24, Python 3.13)
- **Update zsh plugins**: `sheldon lock`
- **Update Python packages**: `uv sync` (managed via `pyproject.toml`)

### Development Commands
- **Shell script linting**: `shellcheck scripts/*.sh scripts/**/*.sh`
- **Pre-commit hooks**: `pre-commit install` (initial setup), `pre-commit run --all-files` (run all checks)
- **Documentation linting**: `pnpm textlint docs/**/*.md` (Japanese technical writing checks)
- **Shell startup performance**: `time zsh -i -c exit`

### Shell Configuration
- **Change default shell to zsh**: `chsh -s <path/to/zsh>`
- **Reload zsh configuration**: `source ~/.zshrc` (configuration files are in `zsh/`)
- **Prompt**: Starship (configured in `.config/starship.toml`)

## Architecture and Structure

### Configuration Organization
- **`.config/`** - XDG-compliant configuration files for modern tools (git, mise, ghostty, karabiner, etc.)
- **`zsh/`** - Modular zsh configuration split by function (aliases, completion, history, keybindings, git integration)
- **`scripts/`** - Installation and maintenance automation with individual tool installers in `scripts/install/`
- **`vim/`** - Vim/Neovim configuration modules
- **`claude/hooks/`** - Claude Code hooks for command safety and notifications
- **`docs/`** - Documentation and planning files

### Package and Runtime Management
- **Homebrew** - Primary package manager (managed via `Brewfile`)
- **mise** - Runtime version manager for Node.js (v24), Python (3.13), and other tools
  - Configuration: `.config/mise/config.toml`
  - Python version management enabled via `idiomatic_version_file_enable_tools`
- **sheldon** - Zsh plugin manager (config: `.config/sheldon/plugins.toml`)
- **uv** - Python package manager (config: `.config/uv/uv.toml`)
- **pnpm** - Node.js package manager for project dependencies

### Development Environment
- **Python**: Version 3.13 (managed via mise)
  - Dependencies: markitdown (pyproject.toml)
  - Testing: pytest (installed via pipx)
- **Node.js**: Version 24 LTS (managed via mise)  
  - DevDependencies: textlint with Japanese writing presets
- **Git integration**: Extensive aliases and configuration in `zsh/git.zsh` and `.config/git/`
- **Terminal enhancement**: starship prompt, fzf, ripgrep, bat, eza
- **Editor support**:
  - Neovim with lazy.nvim, built-in LSP, and modern plugins
  - VS Code with comprehensive extensions via Brewfile
  - Legacy Vim support for compatibility

### Claude Code Integration
- **Command hooks** in `claude/hooks/`:
  - `ai-principles-reminder.sh` - AI ethics reminders
  - `check-command-safety.sh` - Command safety validation
  - `notify-command-notification.sh` - macOS notifications
  - `notify-command-stop.sh` - Stop notifications

### Key Environment Variables
- **`ZDOTDIR`** - Required for installation scripts (set to `$HOME/.zsh`)
- **`GITLAB_PRIVATE_TOKEN`** - For GitLab API access
- **`HOMEBREW_GITHUB_API_TOKEN`** - To avoid GitHub API rate limits

## Modular Design Patterns

- Zsh configuration is split into logical modules (alias, complete, history, etc.) rather than monolithic files
- Installation scripts are organized by tool category in `scripts/install/`
- Configuration files follow XDG Base Directory specification where possible
- Dotfiles are symlinked rather than copied, allowing direct editing in the repository
- Shell performance optimizations in `zsh/performance.zsh` for fast startup times

## Testing and Quality Assurance

- **Shell scripts**: Use `shellcheck` (installed via Homebrew)
- **Pre-commit hooks**: Configured for code quality checks
- **Documentation**: Japanese technical writing checks via textlint
- **System verification**: Run `sh ~/dotfiles/scripts/verify.sh` to check all tools