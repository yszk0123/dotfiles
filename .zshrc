# ref: [少し凝った zshrc](https://gist.github.com/mollifier/4979906)
# plugins=(brew bundler git npm rails zsh-syntax-highlighting)
## zsh-completions
##plugins+=(zsh-completions)
##autoload -U compinit && compinit

source ~/dotfiles/helpers/utils.zsh

# Language
## 日本語ファイル名を表示可能にする
setopt print_eight_bit

# 単語の区切り文字を指定
autoload -Uz select-word-style
select-word-style default
## ここで指定した文字は単語区切りとみなされる
## / も区切りと扱うので、^W でディレクトリ１つ分を削除できる
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

# lib
for name in clipboard complete docker history lv node os prompt ruby settings utils vcs zaw; do
  source "$HOME/dotfiles/lib/$name.zsh"
done

# Alias {{{
alias la='ls -a'
alias ll='ls -l'
alias pu='pushd'
alias po='popd'

## ghq & peco
alias ghqp='cd $(ghq list -p | peco)'
alias ghqp-open='gh-open $(ghq list -p | peco)'

## 上書き確認
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

##alias mkdir='mkdir -p'

# グローバルエイリアス {{{
alias -g L='| less'
alias -g G='| grep'
# }}}
# }}}

# vim:set ft=zsh:
