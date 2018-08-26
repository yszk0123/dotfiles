#!/bin/bash
: "${XDG_CONFIG_HOME:=$HOME/.config}"

# Basic
for target in .bundle .git-template .ansible.cfg .ctags .remarkrc .gitconfig .peco .tigrc .tmux.conf .vimrc .rspec .config/karabiner; do
  ln -sni ~/dotfiles/$target ~/$target
done

# Git
ln -sni ~/dotfiles/gitignore "$XDG_CONFIG_HOME/git/ignore"

# fish
for target in config.fish alias.fish env.fish fishfile; do
  ln -sni ~/dotfiles/.config/fish/$target ~/.config/fish/$target
done

# VS Code
for target in settings.json keybindings.json; do
  ln -sni "$HOME/dotfiles/vscode/$target" "$HOME/Library/Application Support/Code/User/$target"
done

# nvim
mkdir -p "$XDG_CONFIG_HOME/nvim"
ln -sni ~/dotfiles/.vimrc "$XDG_CONFIG_HOME/nvim/init.vim"

if [ -f "$HOME/dotfiles/my_local_mode" ]; then
  for target in .gemrc .gvimrc .irbrc; do
    ln -sni ~/dotfiles/$target ~/$target
  done
fi
