# Usage

```sh
sh ~/dotfiles/update.sh
```

# Shell

## zsh

```sh
chsh -s <path/to/zsh>
```

## Environment variable

Set following environment variables for convenience.

| Environment variable        | Purpose |
| --------------------------- | ---------- |
| `GITLAB_PRIVATE_TOKEN`      | To call GitLab API |
| `HOMEBREW_GITHUB_API_TOKEN` | To avoid "GitHub API rate limit exceeded" |

## Font

```sh
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font
```

- Open iTerm2
- Open iTerm2 > Preferences > Profiles > Text > Font
- Select `Hack Nerd Font`

https://github.com/ryanoasis/nerd-fonts#option-4-homebrew-fonts
