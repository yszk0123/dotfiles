# Usage

`$ cd ~ && ./dotfiles/update.sh`

# Shell

## zsh

`$ chsh -s <path/to/zsh>`

## Environment variable

Set following environment variables for convenience.

| Environment variable        | Purpose |
| --------------------------- | ---------- |
| `GITLAB_PRIVATE_TOKEN`      | To call GitLab API |
| `HOMEBREW_GITHUB_API_TOKEN` | To avoid "GitHub API rate limit exceeded" |

`direnv` is a handy tool to set environment variables.

# Vim

## Mac GUI for Japanese Environment

Install [MacVim-KaoriYa](https://github.com/splhack/macvim-kaoriya)

## Neovim

`$ brew install neovim`
`$ mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}`
`$ ln -s ~/.vim $XDG_CONFIG_HOME/nvim`
`$ ln -s ~/.vimrc $XDG_CONFIG_HOME/nvim/init.vim`

To use deoplete.vim
`$ sudo pip3 install neovim`

# Ruby

## Gem

```sh
$ gem update --system
$ gem install bundler
```

# ctags

cf. [claytron/dotfiles](https://github.com/claytron/dotfiles/blob/master/.ctags)

# Python

`$ brew install pyenv pyenv-virtualenv`
`$ pyenv install <version>`
`$ pyenv global <version>`
`$ pyenv rehash`

# Tex

## For Mac
Install [MacTeX](https://www.tug.org/mactex/)

## For Vim
Install [vim-latex](https://github.com/vim-latex/vim-latex) for Vim
