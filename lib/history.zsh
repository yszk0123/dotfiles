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

bindkey -v
#bindkey -r '^]'
#bindkey "" history-incremental-search-backward
# ^R で履歴検索をするときに * でワイルドカードを使用出来るようにする
bindkey '^R' history-incremental-pattern-search-backward

# vim:set ft=zsh:
