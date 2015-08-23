#!/bin/sh
# ln -si ~/dotfiles/.wgetrc ~/.wgetrc
# ln -si ~/dotfiles/Brewfile ~/Brewfile
# ln -si ~/dotfiles/colors ~/.vim
# ln -si ~/dotfiles/ftdetect ~/.vim
# ln -si ~/dotfiles/indent ~/.vim

ln -si ~/dotfiles/.atom ~/.atom
ln -si ~/dotfiles/.bundle ~/.bundle
ln -si ~/dotfiles/.git_template ~/.git_template

# $ZDOTDIRが.zprofile中で指定される場合は、$HOME/.zprofileが読み込まれる（はず）
# 念のため両方に用意しておく
: ${ZDOTDIR:=~/.zsh}
ln -si ~/dotfiles/.zprofile ~/.zprofile
ln -si ~/dotfiles/.zprofile "$ZDOTDIR/.zprofile"
ln -si ~/dotfiles/.zshrc "$ZDOTDIR/.zshrc"

ln -si ~/dotfiles/.ansible.cfg ~/.ansible.cfg
ln -si ~/dotfiles/.ctags ~/.ctags
ln -si ~/dotfiles/.gitconfig ~/.gitconfig
ln -si ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -si ~/dotfiles/.vimrc ~/.vimrc

if [ -s ~/dotfiles/my_local_mode* ]; then
  ln -si ~/dotfiles/.gemrc ~/.gemrc
  ln -si ~/dotfiles/.gvimrc ~/.gvimrc
  ln -si ~/dotfiles/.irbrc ~/.irbrc
fi
