"バッファ変更時のみ保存
" nnoremap <C-s> :w<CR>
nnoremap <silent> <C-s> :<C-u>update<CR>
inoremap <silent> <C-s> <Esc>:<C-u>update<CR>

" Qでウインドウを閉じる
nnoremap Q :<C-u>q<CR>

nnoremap <CR> o
inoremap <C-c> <Esc>
nnoremap <silent> <Leader><Leader><Leader> :noh<CR>
nnoremap <silent> <Space><Space> :noh<CR>
inoremap <C-f> <C-x><C-f>

nnoremap vv <C-v>
inoremap <C-v> <Esc>p

nnoremap H ^
nnoremap L $
nnoremap Y y$

" カーソル移動 {{{
" 表示行単位のカーソル移動
nnoremap j gj
onoremap j gj
xnoremap j gj
nnoremap k gk
onoremap k gk
xnoremap k gk
nnoremap <Down> gj
nnoremap <Up>   gk
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

noremap gh gT
noremap gl gt

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

" 各種ショートカット {{{
nnoremap [util] <Nop>
nmap <Space> [util]

nnoremap [util]n :tabnew<CR>
" 編集中のファイルをカレントディレクトリに設定
nnoremap [util]c :cd %:h<CR>
" 編集中のファイルをカレントディレクトリに設定
nnoremap [util]l :lcd %:h<CR>
" 編集中のファイル名を表示
nnoremap [util]f :echo expand('%:p')<CR>

nnoremap [util]et :<C-u>edit D:/app/share/data/tmp.txt<CR>
nnoremap [util]eg :<C-u>edit $MYGVIMRC<CR>
nnoremap [util]ev :<C-u>edit $MYVIMRC<CR>
nnoremap [util]sg :<C-u>source $MYGVIMRC<CR>
nnoremap [util]sv :<C-u>source $MYVIMRC<CR>

nnoremap [util]ga :<C-u>cd D:/app<CR>
nnoremap [util]gd :<C-u>cd D:/Downloads<CR>
nnoremap [util]gd :<C-u>cd D:/data<CR>
nnoremap [util]gf :<C-u>cd D:/app/Filtered<CR>
nnoremap [util]gj :<C-u>cd D:/work/JavaScript<CR>
nnoremap [util]gr :<C-u>cd D:/tmp/relay-text<CR>
nnoremap [util]gs :<C-u>cd D:/app/share/server<CR>
nnoremap [util]gt :<C-u>cd D:/tmp<CR>
nnoremap [util]gv :<C-u>cd D:/data/vimfiles<CR>
nnoremap [util]gw :<C-u>cd D:/work<CR>
nnoremap [util]gcd :<C-u>cd C:/users/yuji/Desktop<CR>
nnoremap [util]gcn :<C-u>cd C:/users/yuji/tools/nodist<CR>
nnoremap [util]gct :<C-u>cd C:/users/yuji/tools<CR>
nnoremap [util]gcv :<C-u>cd C:/users/yuji/tools/vim<CR>
"}}}
