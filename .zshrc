# ref: [少し凝った zshrc](https://gist.github.com/mollifier/4979906)
# plugins=(brew bundler git npm rails zsh-syntax-highlighting)
## zsh-completions
##plugins+=(zsh-completions)
##autoload -U compinit && compinit

# Path
export PATH="~/.rbenv/shims:~/.rbenv/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/go/bin:/Library/TeX/texbin"
##export MANPATH="/usr/local/man:$MANPATH"

# LANG
export LANG=ja_JP.UTF-8

# 日本語ファイル名を表示可能にする
setopt print_eight_bit
# 単語の区切り文字を指定
autoload -Uz select-word-style
select-word-style default
## ここで指定した文字は単語区切りとみなされる
## / も区切りと扱うので、^W でディレクトリ１つ分を削除できる
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

# 色を使用可能にする
autoload -Uz colors
colors

# Prompt
PROMPT="%{${fg[green]}%}%~%{${reset_color}%}$ "

# Keybinding
bindkey -v
##bindkey -r '^]'
##bindkey "" history-incremental-search-backward
## ^R で履歴検索をするときに * でワイルドカードを使用出来るようにする
bindkey '^R' history-incremental-pattern-search-backward

## Ctrl-ZでVimとシェルをトグル
## ref: [Vimの生産性を高める12の方法 | 開発手法・プロジェクト管理 | POSTD](http://postd.cc/how-to-boost-your-vim-productivity/)
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

## 補完候補のメニュー選択で、矢印キーの代わりにhjklで移動出来るようにする。
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

# VCS
autoload -Uz vcs_info
autoload -Uz add-zsh-hook
 
zstyle ':vcs_info:*' formats '%F{green}[%s:%b]%f'
zstyle ':vcs_info:*' actionformats '%F{red}[%s:%b|%a]%f'
 
function _update_vcs_info_msg() {
    LANG=en_US.UTF-8 vcs_info
    RPROMPT="${vcs_info_msg_0_}"
}
add-zsh-hook precmd _update_vcs_info_msg

# History
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
## history (fc -l) コマンドをヒストリリストから取り除く。
setopt hist_no_store
## ヒストリファイルに追記する。
setopt append_history
## すぐにヒストリファイルに追記する。
###setopt inc_append_history
## zsh の開始, 終了時刻をヒストリファイルに書き込む
setopt extended_history
## ヒストリを呼び出してから実行する間に一旦編集
setopt hist_verify
## 同時に起動したzshの間でヒストリを共有する
setopt share_history
## スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space
## 直前と同じコマンドをヒストリに追加しない
setopt hist_ignore_dups
## 同じコマンドをヒストリに残さない
### setopt hist_ignore_all_dups
## ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# Completion
autoload -Uz compinit
compinit
## The following lines were added by compinstall
##zstyle :compinstall filename '/home/<user>/.zshrc'
## 補完候補を一覧表示
setopt auto_list
## TAB で順に補完候補を切り替える
setopt auto_menu
## 補完候補一覧でファイルの種別をマーク表示
setopt list_types
## カッコの対応などを自動的に補完
setopt auto_param_keys
## ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt auto_param_slash
## 補完候補のカーソル選択を有効に
zstyle ':completion:*:default' menu select=1
## 補完候補を詰めて表示
setopt list_packed
## スペルチェック
### setopt correct
## ファイル名の展開でディレクトリにマッチした場合末尾に / を付加する
setopt mark_dirs
## 最後のスラッシュを自動的に削除しない
setopt noautoremoveslash
## 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
## ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..
## ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

# Alias

alias la='ls -a'
alias ll='ls -l'

## 上書き確認
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

##alias mkdir='mkdir -p'

## グローバルエイリアス
alias -g L='| less'
alias -g G='| grep'

## C で標準出力をクリップボードにコピーする
### ref: mollifier delta blog : http://mollifier.hatenablog.com/entry/20100317/p1
if which pbcopy >/dev/null 2>&1 ; then
  # Mac
  alias -g C='| pbcopy'
elif which xsel >/dev/null 2>&1 ; then
  # Linux
  alias -g C='| xsel --input --clipboard'
elif which putclip >/dev/null 2>&1 ; then
  # Cygwin
  alias -g C='| putclip'
fi

# lvの設定
## ref: [おすすめzsh設定 - ククログ(2011-09-05)](http://www.clear-code.com/blog/2011/9/5.html)

if type lv > /dev/null 2>&1; then
    ## lvを優先する。
    export PAGER="lv"
else
    ## lvがなかったらlessを使う。
    export PAGER="less"
fi

if [ "$PAGER" = "lv" ]; then
    ## -c: ANSIエスケープシーケンスの色付けなどを有効にする。
    ## -l: 1行が長くと折り返されていても1行として扱う。
    ##     （コピーしたときに余計な改行を入れない。）
    export LV="-c -l"
else
    ## lvがなくてもlvでページャーを起動する。
    alias lv="$PAGER"
fi

# OS 別の設定
case ${OSTYPE} in
  darwin*)
    #Mac用の設定
    export CLICOLOR=1
    alias ls='ls -G -F'
    ;;
  linux*)
    #Linux用の設定
    alias ls='ls -F --color=auto'
    ;;
esac

# その他

if [ -s ~/.bash_profile ]; then
  source ~/.bash_profile
fi

# 未分類
## コアダンプサイズを制限
limit coredumpsize 102400
## 出力の文字列末尾に改行コードが無い場合でも表示
unsetopt promptcr
## ビープを鳴らさない
setopt nobeep
## 内部コマンド jobs の出力をデフォルトで jobs -l にする
setopt long_list_jobs
## サスペンド中のプロセスと同じコマンド名を実行した場合はリジューム
setopt auto_resume
## cd 時に自動で pushd
setopt auto_pushd
## 重複したディレクトリを pushd しない
setopt pushd_ignore_dups
## 高機能なワイルドカード展開を使用する
## ファイル名で #, ~, ^ の 3 文字を正規表現として扱う
setopt extended_glob
## =command を command のパス名に展開する
setopt equals
## --prefix=/usr などの = 以降も補完
setopt magic_equal_subst
## ファイル名の展開で辞書順ではなく数値的にソート
setopt numeric_glob_sort
## 出力時8ビットを通す
setopt print_eight_bit
## ディレクトリ名だけで cd
setopt auto_cd
## {a-c} を a b c に展開する機能を使えるようにする
setopt brace_ccl
## Ctrl+S/Ctrl+Q によるフロー制御を使わないようにする
###setopt NO_flow_control
## コマンドラインでも # 以降をコメントと見なす
setopt interactive_comments
## Ctrl+S/Ctrl+Q によるフローコントロールを無効にする
setopt no_flow_control
## Ctrl+Dでzshを終了しない
setopt ignore_eof

# vim:set ft=zsh:
