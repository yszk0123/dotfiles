"set noswapfile
"ref
"  知らないと損するvim知識30選 - Vim is running out
"  http://d.hatena.ne.jp/vimtaku/20121117/1353138802
"let g:plugin_migemo_disable = 1

" set noignorecase
" set browsedir=buffer

if g:my_local_mode
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
  set noundofile
  set backupdir=~/vimfiles/tmp
  set directory=~/vimfiles/tmp
  if has('nvim')
    set viminfo+=n~/vimfiles/nviminfo.txt
  else
    set viminfo+=n~/vimfiles/viminfo.txt
  end
endif

" Cのプリプロセッサ行("#"で始まる行)にもインデントを適用する
" (coffeescriptなどでは"#"をコメント開始に使うため)
" set cinkeys=0{,0},0),:,0#,!^F,o,O,e
" set cinkeys-=0#
" set indentkeys-=0#
" set smartindent

set autoindent
set backspace=indent,eol,start
set expandtab
" 折りたたみを手動操作, 開いた状態で編集開始
" set foldmethod=manual
" set foldlevelstart=99
" 日本語の行の連結時には空白を入力しない。
set formatoptions+=mM
" 自動整形を避ける
set formatoptions-=tca
" ステータスラインを常に表示
set laststatus=2
set list
set listchars=tab:>~,trail:~,nbsp:~,extends:>,precedes:<,
" set listchars=tab:^\ ,trail:~,eol:$
set incsearch
set number
set scrolloff=3
" set shellslash
set shiftwidth=2
set noshowmatch
set softtabstop=2
" ウィンドウ分割時に右または下に開く(デフォルトでは左または上)
set splitbelow
set splitright
set tabstop=2
" タイトル設定
set title
" 自動改行を行わない
" set textwidth=0
" set winheight=6

" Clipboard
set clipboard=unnamed

" Better performance
autocmd InsertEnter,InsertLeave * set cursorline!
set lazyredraw

" Highlight cursorline in insert mode
set nocursorline

" Disable beeping
set visualbell
set t_vb=

" Cursor settings. This makes terminal vim sooo much nicer!
" Tmux will only forward escape sequences to the terminal if surrounded by a DCS
" sequence
" ref: [dotfiles/.vimrc at master · terryma/dotfiles](https://github.com/terryma/dotfiles/blob/master/.vimrc)
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Get quiet messages (require 7.4 patch 314)
if has("patch-7.4.314")
  set shortmess+=c
endif

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
  set grepprg=ag\ --nocolor\ --nogroup\ --hidden\ --ignore\ .hg\ --ignore\ .svn\ --ignore\ .git\ --ignore\ bower_components\ --ignore\ node_modules
endif
