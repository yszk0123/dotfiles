"set noswapfile
"ref
"  知らないと損するvim知識30選 - Vim is running out
"  http://d.hatena.ne.jp/vimtaku/20121117/1353138802
"let g:plugin_migemo_disable = 1

" set noignorecase
" set browsedir=buffer

" バックアップの設定
" node.jsのfs.watch()などで正しくイベントを受け取れるようにするには
" backupcopyオプションを適切に設定する必要がある
" backupcopyをauto/yesにした場合, バックアップの際にファイルはリネームされる
" fs.watch()ではこれを"ファイルが削除された"ものとみなしてしまう
" backupcopyをnoにした場合,この問題は起こらないが, バックアップの度にファイル
" コピーが発生する
set nobackup
set nowritebackup
set swapfile
set backupdir=$HOME/vimfiles/tmp
set directory=$HOME/vimfiles/tmp
set viminfo+=n$HOME/vimfiles/viminfo.txt

" Cのプリプロセッサ行("#"で始まる行)にもインデントを適用する
" (coffeescriptなどでは"#"をコメント開始に使うため)
" set cinkeys=0{,0},0),:,0#,!^F,o,O,e
" set cinkeys-=0#
" set indentkeys-=0#
" set smartindent

set autoindent
set backspace=indent,eol,start
set clipboard=unnamed,autoselect
set expandtab
" 折りたたみを手動操作, 開いた状態で編集開始
" set foldmethod=manual
" set foldlevelstart=99
" 日本語の行の連結時には空白を入力しない。
set formatoptions+=mM
" 自動整形を避ける
set formatoptions-=tca
set list
set listchars=tab:>~,trail:~,nbsp:~,extends:>,precedes:<,
" set listchars=tab:^\ ,trail:~,eol:$
" 描画高速化
set nocursorline
set noincsearch
set number
set scrolloff=3
set shellslash
set shiftwidth=2
set softtabstop=2
" ウィンドウ分割時に右または下に開く(デフォルトでは左または上)
set splitbelow
set splitright
set tabstop=2
" 自動改行を行わない
" set textwidth=0
set winheight=6

" Wildmenu
" ref:
"   title: Vim filename completion - Arabesque
"   url: http://blog.sanctum.geek.nz/vim-filename-completion/
if has("wildmenu")
    set wildignore+=*.a,*.o
    set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
    set wildignore+=.DS_Store,.git,.hg,.svn
    set wildignore+=*~,*.swp,*.tmp
    set wildmenu
    set wildmode=longest,list
endif

" grep設定
if executable('ag')
  " file_rec設定
  set grepprg=ag\ --nocolor\ --nogroup\ --hidden\ --ignore\ .hg\ --ignore\ .svn\ --ignore\ .git\ --ignore\ bower_components\ --ignore\ backup\ --ignore\ dist\ --ignore\ dest\ --ignore\ build
endif
