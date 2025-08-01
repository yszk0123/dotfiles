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
mkdir -p $ZDOTDIR
ln -sni ~/dotfiles/.zprofile ~/.zprofile
ln -sni ~/dotfiles/.zprofile "$ZDOTDIR/.zprofile"
ln -sni ~/dotfiles/.zshrc "$ZDOTDIR/.zshrc"
ln -sni ~/dotfiles/.zprofile "$HOME/.zprofile"
ln -sni ~/dotfiles/.zshrc "$HOME/.zshrc"

# dotfiles
link_dotfiles_to_home .bundle
link_dotfiles_to_home .git-template
link_dotfiles_to_home .ctags
link_dotfiles_to_home .gitconfig
link_dotfiles_to_home .tigrc
link_dotfiles_to_home .tmux.conf

# XDG Base Directory compliant configurations
ln -sni "$HOME/dotfiles/.config" "$XDG_CONFIG_HOME"
