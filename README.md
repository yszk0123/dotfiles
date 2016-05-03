# 使い方

`$ cd ~ && ./dotfiles/update.sh`

# Shell 関連

## zsh

`$ chsh -s <path/to/zsh>`

# Vim 関係

## Mac 日本語環境 GUI

[MacVim-KaoriYa](https://github.com/splhack/macvim-kaoriya)をインストール

## Neovim

`$ brew install neovim`
`$ mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}`
`$ ln -s ~/.vim $XDG_CONFIG_HOME/nvim`
`$ ln -s ~/.vimrc $XDG_CONFIG_HOME/nvim/init.vim`

To use deoplete.vim
`$ sudo pip3 install neovim`

# Ruby 関係

## Gem

```sh
$ gem update --system
$ gem install bundler
```

# ctags 関係

cf. [dotfiles/.ctags at master · claytron/dotfiles](https://github.com/claytron/dotfiles/blob/master/.ctags)

# Python

`$ brew install pyenv pyenv-virtualenv`
`$ pyenv install <version>`
`$ pyenv global <version>`
`$ pyenv rehash`

# Tex 関係

## Macの場合

[MacTeX](https://www.tug.org/mactex/)をインストール
Vim用に[vim-latex](https://github.com/vim-latex/vim-latex)も導入
