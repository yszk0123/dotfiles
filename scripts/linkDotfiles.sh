#!/bin/bash
: "${XDG_CONFIG_HOME:=$HOME/.config}"
DOTFILES_DIR="$HOME/dotfiles"

function link_dotfiles_to_home() {
  local target="$1"
  ln -sni "$HOME/dotfiles/$target" "$HOME/$target"
}

# $ZDOTDIRが.zprofile中で指定される場合は、$HOME/.zprofileが読み込まれる（はず）
# 念のため両方に用意しておく
: "${ZDOTDIR:=~/.zsh}"
ln -sni ~/dotfiles/.zprofile ~/.zprofile
ln -sni ~/dotfiles/.zprofile "$ZDOTDIR/.zprofile"
ln -sni ~/dotfiles/.zshrc "$ZDOTDIR/.zshrc"

# dotfiles
link_dotfiles_to_home .bundle
link_dotfiles_to_home .git-template
link_dotfiles_to_home .ctags
link_dotfiles_to_home .gitconfig
link_dotfiles_to_home .tigrc
link_dotfiles_to_home .tmux.conf
link_dotfiles_to_home .vimrc
link_dotfiles_to_home .config

# neovim config
mkdir -p "$XDG_CONFIG_HOME/nvim"
ln -sf "$DOTFILES_DIR/init.vim" "$XDG_CONFIG_HOME/nvim/init.vim"
ln -sf "$DOTFILES_DIR/vim" "$XDG_CONFIG_HOME/nvim/vim"

ln -sni "$DOTFILES_DIR/brewfile" "$XDG_CONFIG_HOME/brewfile"
