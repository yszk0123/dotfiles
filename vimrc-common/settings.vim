"set noswapfile
"ref
"  知らないと損するvim知識30選 - Vim is running out
"  http://d.hatena.ne.jp/vimtaku/20121117/1353138802
"let g:plugin_migemo_disable = 1

" node.jsのfs.watch()などで正しくイベントを受け取れるように
set nobackup
set nowritebackup
" set noignorecase
" set browsedir=buffer

set swapfile
set backup
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
set foldmethod=manual
" 折りたたみを開いた状態で編集開始
set foldlevelstart=99
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
