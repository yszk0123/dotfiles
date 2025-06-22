set ignorecase
set smartcase
set autoindent
set backspace=indent,eol,start
set colorcolumn=80,100
set expandtab
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
set title
set clipboard=unnamed

" Session
set sessionoptions-=buffers
set sessionoptions-=help
set sessionoptions-=options

" Better performance
set nocursorline
set lazyredraw

" Highlight cursorline in insert mode
autocmd InsertEnter,InsertLeave * set cursorline!

" Disable beeping
set visualbell
set t_vb=

if has('mac')
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
  set viminfo+=n~/vimfiles/viminfo.txt
endif

" Cursor settings. This makes terminal vim sooo much nicer!
" Tmux will only forward escape sequences to the terminal if surrounded by a DCS
" sequence
" cf. [dotfiles/.vimrc at master · terryma/dotfiles](https://github.com/terryma/dotfiles/blob/master/.vimrc)
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Get quiet messages (available in modern Vim)
set shortmess+=c

" Wildmenu
" cf.
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
