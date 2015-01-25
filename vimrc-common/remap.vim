"バッファ変更時のみ保存
" nnoremap <C-s> :w<CR>
nnoremap <silent> <C-s> :<C-u>update<CR>
inoremap <silent> <C-s> <Esc>:<C-u>update<CR>

" Ctrl+qでウインドウを閉じる
nnoremap <C-q> :<C-u>q<CR>

nnoremap <CR> o
inoremap <C-c> <Esc>
nnoremap <silent> <Leader><Leader><Leader> :noh<CR>
nnoremap <silent> <Space><Space>l :noh<CR>
" inoremap <C-f> <C-x><C-f>

nnoremap vv <C-v>
nnoremap Y y$

" 特定の条件下でWindows互換のテキスト操作
vnoremap <C-x> d
vnoremap <C-c> y
inoremap <C-v> <Esc>p

" 折り畳みモードをインデントに設定
nnoremap [util]fi :<C-u>setlocal foldmethod=indent<CR>
nnoremap [util]fm :<C-u>setlocal foldmethod=marker<CR>
nnoremap [util]fs :<C-u>setlocal foldmethod=syntax<CR>

" カーソル移動 {{{
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

" バッファ,タブページ,ウィンドウの操作 {{{
nnoremap [util]bb :b#<CR>
nnoremap [util]bp :bprevious<CR>
nnoremap [util]bn :bnext<CR>
nnoremap [util]bd :bdelete<CR>
" 単純なバッファリストからの移動
nnoremap [util]bl :ls<CR>:buffer<Space>
nnoremap [util]bt :tabs<CR>:tabnext<Space>

nnoremap [util]m <C-w>_

" noremap gh gT
" noremap gl gt

" gfを置き換えて, 分割ウィンドウで編集するようにする
" (gf: カーソルの下か後ろの名前のファイルを編集する)
noremap gf :sp <cfile><CR>

" ref: Revert,Double,ScreenModeなどの解説
"   title: scrnmode.vim : スクリーンのサイズを簡単切替え — 名無しのvim使い
"   url: http://nanasi.jp/articles/vim/scrnmode_vim.html
nnoremap <C-w>[ :<C-u>Revert<CR>
nnoremap <C-w>] :<C-u>Double<CR>
"}}}

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

" {{{
" ref:
"   title: The ultimate Vim configuration - vimrc
"   url: http://amix.dk/vim/vimrc.html
" move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
" CAUTION: a register 'z' is used
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z
" }}}

" 各種ショートカット {{{
" 新しいタブを開く
nnoremap [util]n :<C-u>tabnew<CR>
" 新しいタブを一番右に開く
nnoremap [util]N :<C-u>tabnew<bar>tabmove<CR>
" 編集中のファイルのあるディレクトリをカレントディレクトリに設定
nnoremap [util]c :<C-u>cd %:h<CR>
" 編集中のファイルのあるディレクトリをカレントディレクトリに設定
nnoremap [util]l :<C-u>lcd %:h<CR>
" 編集中のファイル名を表示 (:fileの方が便利)
" nnoremap [util]f :<C-u>echo expand('%:p')<CR>
"}}}

" toggle slash (for Windows) {{{
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
