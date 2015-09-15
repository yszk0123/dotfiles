#!/bin/sh
# ln -si ~/dotfiles/.wgetrc ~/.wgetrc
# ln -si ~/dotfiles/Brewfile ~/Brewfile
# ln -si ~/dotfiles/colors ~/.vim
# ln -si ~/dotfiles/ftdetect ~/.vim
# ln -si ~/dotfiles/indent ~/.vim

# $ZDOTDIRが.zprofile中で指定される場合は、$HOME/.zprofileが読み込まれる（はず）
# 念のため両方に用意しておく
: ${ZDOTDIR:=~/.zsh}
ln -si ~/dotfiles/.zprofile ~/.zprofile
ln -si ~/dotfiles/.zprofile "$ZDOTDIR/.zprofile"
ln -si ~/dotfiles/.zshrc "$ZDOTDIR/.zshrc"

for target in .atom .bundle .git_template .ansible.cfg .ctags .gitconfig .tmux.conf .vimrc; do
  ln -si ~/dotfiles/$target ~/$target
done

if [ -s ~/dotfiles/my_local_mode* ]; then
  for target in .gemrc .gvimrc .irbrc; do
    ln -si ~/dotfiles/$target ~/$target
  done
fi
