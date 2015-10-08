"バッファ変更時のみ保存
" nnoremap <C-s> :w<CR>
nnoremap <silent> <C-s> :<C-u>update<CR>
inoremap <silent> <C-s> <Esc>:<C-u>update<CR>

" Close the window by Ctrl+q
nnoremap <silent> <Leader>q :<C-u>q<CR>

nnoremap <silent> <Leader>w :<C-u>w<CR>

" Suppress unnecessary popup
map q: :q

nnoremap <CR> o
inoremap <C-c> <Esc>
nnoremap <silent> <Leader><Leader> :noh<CR>
" inoremap <C-f> <C-x><C-f>

" Mode {{{
" Toggle readonly mode
command! -bang -range ToggleReadOnly call <SID>toggleReadOnly()
noremap <silent> <Leader>r :<C-u>ToggleReadOnly<CR>
function! s:toggleReadOnly()
  if &readonly || !&modifiable
    execute 'set noreadonly'
    execute 'set modifiable'
  else
    execute 'set readonly'
    execute 'set nomodifiable'
  endif
endfunction
" }}}

" Copy & paste {{{
" nnoremap vv <C-v>
nnoremap Y y$

" 貼り付けたテキストの末尾へ自動的に移動
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" システムのクリップボードにコピー＆ペーストする
vnoremap <Leader>y "+y
vnoremap <Leader>d "+d
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P
vnoremap <Leader>p "+p
vnoremap <Leader>P "+P

" 特定の条件下でWindows互換のテキスト操作
vnoremap <C-x> d
vnoremap <C-c> y
inoremap <C-v> <Esc>p
nnoremap <C-s> :<C-u>write<CR>
" }}}

" Folding {{{
" Switch folding methods
nnoremap <Leader>fi :<C-u>setlocal foldmethod=indent<CR>
nnoremap <Leader>fm :<C-u>setlocal foldmethod=marker<CR>
nnoremap <Leader>fs :<C-u>setlocal foldmethod=syntax<CR>
" }}}

" Date {{{
" Insert the current date
nnoremap <F6> <Esc>i<C-R>=strftime("%Y-%m-%dT%H:%M")<CR><Esc>
inoremap <F6> <C-R>=strftime("%Y-%m-%dT%H:%M")<CR>
" }}}

" Cursor manipulation {{{
" 表示行単位のカーソル移動
" Ctrl+*のタイプはnyaosやtcshのキーバインドになるべく合わせている
nnoremap H ^
nnoremap L $
nnoremap j gj
onoremap j gj
xnoremap j gj
nnoremap k gk
onoremap k gk
xnoremap k gk
nnoremap <Down> gj
nnoremap <Up>   gk

" Bash like keys for the terminal
cnoremap <C-a> <home>
nnoremap <C-a> <home>
cnoremap <C-e> <end>
nnoremap <C-e> <end>

" Go to older position in change list
nnoremap g: g;

" inoremap <C-B> <Left>
" inoremap <C-F> <Right>
" inoremap <C-J> <Down>
" inoremap <C-K> <Up>
" inoremap <C-A> <Home>
" inoremap <C-E> <End>
" inoremap <C-D> <Esc>

" nnoremap <C-Space> <PageDown>
" nnoremap <C-Enter> <PageUp>

" [[などをセクション移動の代わりにカッコの移動に使う
" nnoremap [[ ?{<CR>
" nnoremap ][ /}<CR>
" nnoremap ]] /{<CR>
" nnoremap [] ?}<CR>
"}}}

" バッファ, タブページ, ウィンドウの操作 {{{
nnoremap <Leader>bb :b#<CR>
nnoremap <Leader>bp :bprevious<CR>
nnoremap <Leader>bn :bnext<CR>
nnoremap <Leader>bd :bdelete<CR>
" 単純なバッファリストからの移動
nnoremap <Leader>bl :ls<CR>:buffer<Space>
nnoremap <Leader>bt :tabs<CR>:tabnext<Space>

nnoremap <Leader>m <C-w>_

" gfを置き換えて, 分割ウィンドウで編集するようにする
" (gf: カーソルの下か後ろの名前のファイルを編集する)
noremap gf :sp <cfile><CR>
" }}}

" 各種詰め合わせ {{{
" ref:
"   title: vimのカスタマイズとTips - fudist
"   url:   https://sites.google.com/site/fudist/Home/vim-nihongo-ban/tips#TOC--13
"強制前保存終了を無効化
nnoremap ZZ <Nop>
"最後の編集位置へ移動(zzは画面中央にスクロール移動)
" map gb `.zz
"ヤンクした文字をカーソル位置の前に挿入
" nnoremap gy "0P
" nnoremap <C-g> g;
" nnoremap g; g,
"カーソルキーで行末／行頭の移動可能に設定。
set whichwrap=b,s,[,],<,>
"l を <Right>に置き換えて、折りたたみを l で開くことができるようにする。
nnoremap h <Left>
nnoremap l <Right>
if has('folding')
  nnoremap <expr> l foldlevel(line('.')) ? "\<Right>zo" : "\<Right>"
  " nnoremap <expr> h foldlevel(line('.')) ? "\<Left>zc" : "\<Left>"
endif
"}}}

" Window manipulation {{{
" ref:
"   title: The ultimate Vim configuration - vimrc
"   url: http://amix.dk/vim/vimrc.html
" move between windows
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" Resize/move/split windows

nnoremap + <C-w>+
nnoremap - <C-w>-
nnoremap [util]H <C-w>H
nnoremap [util]J <C-w>J
nnoremap [util]K <C-w>K
nnoremap [util]L <C-w>L
nnoremap [util]= <C-w>=
nnoremap [util]s :<C-u>split
nnoremap [util]v :<C-u>vsplit

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
" CAUTION: a register 'z' is used
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z
" }}}

" 各種ショートカット {{{
" 新しいタブを開く
nnoremap <Leader>n :<C-u>tabnew<CR>
" 新しいタブを一番右に開く
nnoremap <Leader>N :<C-u>tabnew<bar>tabmove<CR>
" 編集中のファイルのあるディレクトリをカレントディレクトリに設定
nnoremap <Leader>C :<C-u>cd %:h<CR>
" 編集中のファイルのあるディレクトリをカレントディレクトリに設定
nnoremap <Leader>L :<C-u>lcd %:h<CR>
" 編集中のファイル名を表示 (:fileの方が便利)
" nnoremap <Leader>f :<C-u>echo expand('%:p')<CR>
" nnoremap <Leader>e :<C-u>edit<Space>
" nnoremap <Leader>p :<C-u>pedit<Space>
" preview windowでテンプレートファイルを開く
nnoremap <Leader>t :<C-u>pedit D:/common/templates/
"}}}

" 80桁を超えた部分をハイライト {{{
" ref: [【Vim】80桁教信者の憂鬱 その２（ホットキーでトグル、他） | blog.remora.cx](http://blog.remora.cx/2013/06/source-in-80-columns-2.html)
" その１ {{{
noremap <Plug>(ToggleColorColumn)
            \ :<c-u>let &colorcolumn = len(&colorcolumn) > 0 ? '' :
            \   join(range(81, 999), ',')<CR>
nmap <Leader>; <Plug>(ToggleColorColumn)
let &colorcolumn = join(range(81, 999), ',')
" }}}

" その２ {{{
" call matchadd("Error", '.\%>81v')
" }}}
" }}}

" Toggle slash (for Windows) {{{
" ref:
"   title: Change between backslash and forward slash - Vim Tips Wiki
"   url: http://vim.wikia.com/wiki/Change_between_backslash_and_forward_slash
function! ToggleSlash(independent) range
  let from = ''
  for lnum in range(a:firstline, a:lastline)
    let line = getline(lnum)
    let first = matchstr(line, '[/\\]')
    if !empty(first)
      if a:independent || empty(from)
        let from = first
      endif
      let opposite = (from == '/' ? '\' : '/')
      call setline(lnum, substitute(line, from, opposite, 'g'))
    endif
  endfor
endfunction
command! -bang -range ToggleSlash <line1>,<line2>call ToggleSlash(<bang>1)
noremap <silent> <F8> :ToggleSlash<CR>
" }}}

" Map tab to execute omini complete {{{
" cf. [tabでomni補完するための.vimrcの設定 « StudioT::DevLog](http://studiot.jp/blog/?p=184)
function s:smartTab()
  if pumvisible()
    return "\<c-n>"
  endif
  let col = col('.') - 1
  " if !col || getline('.')[col - 1] !~ '\k\|<\|/'
  if !col || getline('.')[col - 1] =~ '\s'
    return "\<tab>"
  elseif exists('&omnifunc') && &omnifunc == ''
    return "\<c-n>"
  else
    return "\<c-x>\<c-o>"
  endif
endfunction
inoremap <silent> <tab> <c-r>=<SID>smartTab()<cr>
" }}}
