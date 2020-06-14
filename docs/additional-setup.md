# Vim

## Mac GUI for Japanese Environment

Install [MacVim-KaoriYa](https://github.com/splhack/macvim-kaoriya)

## Neovim

```sh
brew install neovim
mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
ln -s ~/.vim $XDG_CONFIG_HOME/nvim
ln -s ~/.vimrc $XDG_CONFIG_HOME/nvim/init.vim
```

To use deoplete.vim
`$ sudo pip3 install neovim`

# Ruby

## Gem

```sh
gem update --system
gem install bundler
```

# ctags

cf. [claytron/dotfiles](https://github.com/claytron/dotfiles/blob/master/.ctags)

# Python

```sh
brew install pyenv pyenv-virtualenv
pyenv install <version>
pyenv global <version>
pyenv rehash
```
