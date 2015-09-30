export LANG=ja_JP.UTF-8

# Path {{{
export PATH="~/.rbenv/shims:~/.rbenv/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/go/bin:/Library/TeX/texbin"
##export MANPATH="/usr/local/man:$MANPATH"
export PATH="$HOME/dotfiles/bin:$PATH"
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
export GOPATH=$HOME
export PATH=$PATH:$GOPATH/bin
# }}}

# Ruby {{{
export PATH="$HOME/.rbenv/bin:$PATH"
# }}}

# vim:set ft=zsh:
