#!/bin/sh
# ln -sf ~/dotfiles/.wgetrc ~/.wgetrc
# ln -sf ~/dotfiles/Brewfile ~/Brewfile
# ln -sf ~/dotfiles/colors ~/.vim
# ln -sf ~/dotfiles/ftdetect ~/.vim
# ln -sf ~/dotfiles/indent ~/.vim

ln -sf ~/dotfiles/.git_template ~/.git_template

ln -sf ~/dotfiles/.ansible.cfg ~/.ansible.cfg
ln -sf ~/dotfiles/.bash_profile ~/.bash_profile
ln -sf ~/dotfiles/.bashrc ~/.bashrc
ln -sf ~/dotfiles/.ctags ~/.ctags
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.zshrc ~/.zshrc

if [ -s ~/dotfiles/my_local_mode* ]; then
  ln -sf ~/dotfiles/.gemrc ~/.gemrc
  ln -sf ~/dotfiles/.gvimrc ~/.gvimrc
  ln -sf ~/dotfiles/.irbrc ~/.irbrc
fi
