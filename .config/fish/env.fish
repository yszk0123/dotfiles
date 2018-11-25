# Go
set -x GOPATH $HOME
set fish_user_paths $GOROOT/bin $fish_user_paths
set fish_user_paths $GOPATH/bin $fish_user_paths

# dotfiles
set fish_user_paths $HOME/dotfiles/bin $fish_user_paths

# npm / Yarn
set fish_user_paths $HOME/.config/yarn/global/node_modules/.bin $fish_user_paths

# Rust
set fish_user_paths $HOME/.cargo/bin $fish_user_paths

# nodebrew
set fish_user_paths $HOME/.nodebrew/current/bin $fish_user_paths

# neovim
set XDG_CONFIG_HOME $HOME/.config
# Install neovim with pip3 (python 3.5.x)
# set fish_user_paths /usr/local/lib/python3.5/site-packages $fish_user_paths

# Python
# set fish_user_paths $HOME/.pyenv/bin $fish_user_paths
# set fish_user_paths $HOME/Library/Python/2.7/bin $fish_user_paths
set fish_user_paths /usr/local/opt/python/libexec/bin $fish_user_paths

# Ruby
# set fish_user_paths $HOME/.rbenv/bin $fish_user_paths
# set fish_user_paths $HOME/.rbenv/shims $fish_user_paths

# pkgconfig
set PKG_CONFIG_PATH /usr/local/lib/pkgconfig $PKG_CONFIG_PATH
