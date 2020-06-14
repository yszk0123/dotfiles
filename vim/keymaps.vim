" Suppress unnecessary popup
map q: :q

inoremap <C-c> <Esc>
nnoremap <silent> <Leader><Leader> :noh<CR>

" Copy & paste {{{
nnoremap Y y$

" 貼り付けたテキストの末尾へ自動的に移動
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

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
