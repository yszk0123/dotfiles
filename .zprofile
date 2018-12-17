export LANG=ja_JP.UTF-8

# Path {{{
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/go/bin:/Library/TeX/texbin:$PATH"
export PATH="$HOME/dotfiles/bin:$PATH"
##export MANPATH="/usr/local/man:$MANPATH"
# }}}

# zsh {{{
export ZDOTDIR="$HOME/.zsh"
fpath=($fpath "$ZDOTDIR/zsh/Functions/Chpwd" "$ZDOTDIR/zsh/Functions/Zle")
# }}}

# Homebrew & Homebrew Cask
## ref: [HomebrewとAnsibleでMacの開発環境構築を自動化する | mawatari.jp](http://mawatari.jp/archives/mac-provisioning-by-homebrew-and-ansible)
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Go {{{
## ref: [Mac の開発環境構築を自動化する (2015 年初旬編) - t-wadaのブログ](http://t-wada.hatenablog.jp/entry/mac-provisioning-by-ansible)
export GOPATH="$HOME"
export PATH="$PATH:$GOPATH/bin"
# }}}

# Ruby {{{
# export PATH="$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH"
# }}}

# Python {{{
export PATH="$HOME/.pyenv/bin:$PATH"
# }}}

# nodebrew {{{
export PATH="$HOME/.nodebrew/current/bin:$PATH"
# }}}

# pkgconfig {{{
export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH"
# }}}

# npm / yarn {{{
export PATH="$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Let npm packages maintain as dotfiles and expose as well as global packages
export PATH="$HOME/dotfiles/node_modules/.bin:$PATH"
# }}}

# neovim {{{
export XDG_CONFIG_HOME="$HOME/.config"

# Install neovim with pip3 (python 3.5.x)
export PATH="$PATH:/usr/local/lib/python3.5/site-packages"
# }}}

# Rust {{{
export PATH="$HOME/.cargo/bin:$PATH"
# }}}

# vim:set ft=zsh:
