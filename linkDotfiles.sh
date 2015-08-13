#!/bin/sh
# ln -si ~/dotfiles/.wgetrc ~/.wgetrc
# ln -si ~/dotfiles/Brewfile ~/Brewfile
# ln -si ~/dotfiles/colors ~/.vim
# ln -si ~/dotfiles/ftdetect ~/.vim
# ln -si ~/dotfiles/indent ~/.vim

ln -si ~/dotfiles/.bundle ~/.bundle
ln -si ~/dotfiles/.git_template ~/.git_template

ln -si ~/dotfiles/.ansible.cfg ~/.ansible.cfg
ln -si ~/dotfiles/.zprofile ~/.zprofile
ln -si ~/dotfiles/.ctags ~/.ctags
ln -si ~/dotfiles/.gitconfig ~/.gitconfig
ln -si ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -si ~/dotfiles/.vimrc ~/.vimrc
ln -si ~/dotfiles/.zshrc ~/.zshrc

if [ -s ~/dotfiles/my_local_mode* ]; then
  ln -si ~/dotfiles/.gemrc ~/.gemrc
  ln -si ~/dotfiles/.gvimrc ~/.gvimrc
  ln -si ~/dotfiles/.irbrc ~/.irbrc
fi
