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
