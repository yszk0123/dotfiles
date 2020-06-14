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

# Git
ln -sni ~/dotfiles/gitignore "$XDG_CONFIG_HOME/git/ignore"

# dotfiles
link_dotfiles_to_home .bundle
link_dotfiles_to_home .git-template
link_dotfiles_to_home .ctags
link_dotfiles_to_home .gitconfig
link_dotfiles_to_home .tigrc
link_dotfiles_to_home .tmux.conf
link_dotfiles_to_home .vimrc
link_dotfiles_to_home .config/karabiner
link_dotfiles_to_home .config/brewfile

ln -sni "$HOME/dotfiles/vscode/settings.json" "$HOME/Library/Application Support/Code/User/settings.json"
ln -sni "$HOME/dotfiles/vscode/keybindings.json" "$HOME/Library/Application Support/Code/User/keybindings.json"

ln -sni "$DOTFILES_DIR/brewfile" "$XDG_CONFIG_HOME/brewfile"
