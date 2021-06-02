#!/bin/bash -e
source "./scripts/common/utils.sh"

# ------------------------------------------------------------------------------
# Variable
# ------------------------------------------------------------------------------

: "${XDG_CONFIG_HOME:=$HOME/.config}"
DOTFILES_DIR="$HOME/dotfiles"
TMUX_DIR="$HOME/.tmux"

# $ZDOTDIRが.zprofile中で指定される場合は、$HOME/.zprofileが読み込まれる（はず）
# 念のため両方に用意しておく
: "${ZDOTDIR:=~/.zsh}"

# ------------------------------------------------------------------------------
# Command
# ------------------------------------------------------------------------------

function install_brew() {
  if ! is_exists "brew"; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi
}

function install_tpm() {
  if [ ! -s "$TMUX_DIR/plugins/tpm/tpm" ]; then
    mkdir -p "$TMUX_DIR/plugins"
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  fi
}

function install_zaw() {
  if [ ! -s "$ZDOTDIR/zaw/zaw.zsh" ]; then
    pushd "$ZDOTDIR" || exit
    git clone https://github.com/zsh-users/zaw.git
    popd || exit
  fi
}

function install_zgen() {
  if ! is_exists "zgen"; then
    git clone https://github.com/tarjoilija/zgen.git "$ZDOTDIR/.zgen"
  fi
}

function update_mac_settings() {
  # Boost key repeat
  defaults write NSGlobalDomain InitialKeyRepeat -int 10
  defaults write NSGlobalDomain KeyRepeat -int 1
}

function link_config() {
  ln -sni "$DOTFILES_DIR/.zprofile" "$HOME/.zprofile"
  ln -sni "$DOTFILES_DIR/.zprofile" "$ZDOTDIR/.zprofile"
  ln -sni "$DOTFILES_DIR/.zshrc" "$ZDOTDIR/.zshrc"

  # Git
  mkdir -p "$XDG_CONFIG_HOME/git"
  ln -sni "$DOTFILES_DIR/gitignore" "$XDG_CONFIG_HOME/git/ignore"

  # espanso
  ln -sni "$HOME/Dropbox/espanso" "$HOME/Library/Preferences/espanso"

  # dotfiles
  mkdir -p "$XDG_CONFIG_HOME"
  link_config_to_home .bundle
  link_config_to_home .git-template
  link_config_to_home .ctags
  link_config_to_home .gitconfig
  link_config_to_home .tigrc
  link_config_to_home .tmux.conf
  link_config_to_home .vimrc
  link_config_to_home .config/karabiner
  link_config_to_home .config/brewfile
}

function link_config_to_home() {
  local target="$1"
  ln -sni "$DOTFILES_DIR/$target" "$HOME/$target"
}

function install_vim() {
  mkdir -p "$HOME/vimfiles/tmp"
}

# ------------------------------------------------------------------------------
# Run
# ------------------------------------------------------------------------------

install_brew
brew bundle
update_mac_settings
link_config
install_tpm
install_zaw
install_zgen
install_vim
