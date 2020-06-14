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
" cf.
"   title: vimのカスタマイズとTips - fudist
"   url:   https://sites.google.com/site/fudist/Home/vim-nihongo-ban/tips#TOC--13
"強制前保存終了を無効化
nnoremap ZZ <Nop>
"最後の編集位置へ移動(zzは画面中央にスクロール移動)
" map gb `.zz
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
" cf.
"   title: The ultimate Vim configuration - vimrc
"   url: http://amix.dk/vim/vimrc.html
" Resize/move/split windows
nnoremap + <C-w>+
nnoremap - <C-w>-

" 各種ショートカット {{{
" 新しいタブを開く
nnoremap <Leader>n :<C-u>tabnew<CR>
" 新しいタブを一番右に開く
nnoremap <Leader>N :<C-u>tabnew<bar>tabmove<CR>
" 編集中のファイルのあるディレクトリをカレントディレクトリに設定
nnoremap <Leader>C :<C-u>cd %:h<CR>
" 編集中のファイルのあるディレクトリをカレントディレクトリに設定
nnoremap <Leader>L :<C-u>lcd %:h<CR>
"}}}

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
