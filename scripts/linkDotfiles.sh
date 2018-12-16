#!/bin/bash
: "${XDG_CONFIG_HOME:=$HOME/.config}"

# $ZDOTDIRが.zprofile中で指定される場合は、$HOME/.zprofileが読み込まれる（はず）
# 念のため両方に用意しておく
: "${ZDOTDIR:=~/.zsh}"
ln -sni ~/dotfiles/.zprofile ~/.zprofile
ln -sni ~/dotfiles/.zprofile "$ZDOTDIR/.zprofile"
ln -sni ~/dotfiles/.zshrc "$ZDOTDIR/.zshrc"

# Git
ln -sni ~/dotfiles/gitignore "$XDG_CONFIG_HOME/git/ignore"

# dotfiles
for target in .bundle .git-template .ansible.cfg .ctags .remarkrc .gitconfig .peco .tigrc .tmux.conf .vimrc .rspec .config/karabiner; do
  ln -sni ~/dotfiles/$target ~/$target
done

for target in settings.json keybindings.json; do
  ln -sni "$HOME/dotfiles/vscode/$target" "$HOME/Library/Application Support/Code/User/$target"
done

: "${XDG_CONFIG_HOME:=~/.config}"
mkdir -p "$XDG_CONFIG_HOME/nvim"
ln -sni ~/dotfiles/.vimrc "$XDG_CONFIG_HOME/nvim/init.vim"

if [ -f "$HOME/dotfiles/my_local_mode" ]; then
  for target in .gemrc .gvimrc .irbrc; do
    ln -sni ~/dotfiles/$target ~/$target
  done
fi
