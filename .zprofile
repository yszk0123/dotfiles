export LANG=ja_JP.UTF-8

# Path
export PATH="~/.rbenv/shims:~/.rbenv/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/go/bin:/Library/TeX/texbin"
##export MANPATH="/usr/local/man:$MANPATH"

# Homebrew & Homebrew Cask
## ref: [HomebrewとAnsibleでMacの開発環境構築を自動化する | mawatari.jp](http://mawatari.jp/archives/mac-provisioning-by-homebrew-and-ansible)
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Go {{{
## ref: [Mac の開発環境構築を自動化する (2015 年初旬編) - t-wadaのブログ](http://t-wada.hatenablog.jp/entry/mac-provisioning-by-ansible)
export GOPATH=$HOME
export PATH=$PATH:$GOPATH/bin
# }}}

# Docker {{{
# if is_exists "boot2docker"; then
#   export DOCKER_HOST=tcp://$(boot2docker ip 2>/dev/null):2375
#   export DOCKER_CERT_PATH=~/.boot2docker/certs/boot2docker-vm
#   export DOCKER_TLS_VERIFY=1
# fi
# }}}

# vim:set ft=zsh:
