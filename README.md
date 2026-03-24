# Personal Dotfiles for macOS

Homebrew, mise, chezmoi を使った macOS 開発環境の構成管理リポジトリ。

## Quick Start

### Prerequisites

1. Xcode Command Line Tools:

   ```bash
   xcode-select --install
   ```

2. 環境変数の設定:
   ```bash
   export ZDOTDIR="$HOME/.zsh"
   ```

### Installation

```bash
chsh -s /bin/zsh

curl https://mise.run | sh
mise use --global chezmoi@latest
sh ~/scripts/update.sh
```

### Manual Steps

```bash
# Homebrew (if not already installed)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# GitHub CLI
brew install gh
gh auth login

# Clone repositories
ghq get YOUR_REPO

# Update macOS settings
sh ~/scripts/updateMacSettings.sh

# Verify installation
sh ~/scripts/verify.sh
```

## Initial Manual Setup

### Font

ターミナルで Nerd Font アイコンを表示するため、手動でフォントを設定する:

1. ターミナルアプリの設定を開く
2. フォントに「Hack Nerd Font」を選択
3. ターミナルを再起動

### Machine-Specific Configuration (chezmoi)

`~/.config/chezmoi/chezmoi.toml` で `machine_type` を設定:

```toml
[data]
  machine_type = "private"   # or "work"
```

| `machine_type`    | Behavior                     |
| ----------------- | ---------------------------- |
| `"private"`       | Claude Code plugins enabled  |
| `"work"` / 未設定 | Claude Code plugins disabled |

### Local Overrides

マシン固有の設定は `~/.zshrc.local` に記述:

```zsh
# ~/.zshrc.local (not managed by dotfiles)
export MY_PRIVATE_TOKEN=...
_CCP_PLUGIN_BASE=(
  ~/path/to/plugins1
  ~/path/to/plugins2
  ...
)
```

## Maintenance

```bash
sh ~/scripts/update.sh        # Comprehensive update
brew bundle                    # Update Homebrew packages
mise upgrade                   # Update runtimes
sheldon lock                   # Update shell plugins
sh ~/scripts/verify.sh         # Verify configuration
```

## Repository Structure

```
.config/          # XDG Base Directory compliant configs (git, mise, ghostty, nvim, etc.)
config/zsh/       # Modular zsh configuration
scripts/          # Installation and maintenance scripts
bin/              # Custom utility scripts
Brewfile          # Homebrew packages and VS Code extensions
```

## Manual Install Apps

- [Karabiner Elements](https://karabiner-elements.pqrs.org/)
- [Slack](https://slack.com/intl/ja-jp/)
- [BetterTouchTool](https://folivora.ai/)
- [Google IME](https://www.google.co.jp/ime/)
