" hybrid {{{
colorscheme hybrid
" }}}

" 80行を超える場合ハイライト {{{
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.*/
" }}}

" 日本語用 {{{
if has('multi_byte_ime')
  "highlight Cursor guifg=NONE guibg=Green
  highlight CursorIM guifg=NONE guibg=Purple
endif
"}}}

" easymotion {{{
hi EasyMotionTarget ctermfg=red guifg=red
hi EasyMotionTarget2First ctermfg=red guifg=red
hi EasyMotionTarget2Second ctermfg=blue guifg=orangered
hi EasyMotionShade  ctermfg=gray guifg=gray
hi EasyMotionShadeLine  ctermfg=gray guifg=gray
"hi Comment term=bold ctermfg=Cyan guifg=#80a0ff gui=bold
"}}}

" Font {{{
if has('win32')
  set guifont=MS_Gothic:h9:cSHIFTJIS
  set linespace=0
  if has('kaoriya')
    set ambiwidth=auto
  endif
endif
"}}}

" ウィンドウの初期サイズ {{{
" set lines=38 columns=96
" set lines=50 columns=96
"}}}

" その他 {{{
" メニュー,ツールバー非表示
set guioptions-=m
set guioptions-=T
" 水平スクロールバーのサイズをカーソル行の長さに制限する(計算量を軽減できる)
set guioptions+=h
" 左側垂直スクロールバーを常に表示(ウィンドウサイズの勝手な変更と再描画を防ぐ)
" Note:
"   開いているタブページによっては左側垂直スクロールバーがあったりなかったりする
"   垂直スクロールバーの表示切替が起こるとウィンドウサイズが勝手に変わる
"   ウィンドウサイズが変わると再描画が起こるので動作も重くなる
"   さらにWindowsでウィンドウのスナップを利用している場合は,スナップが解除されてしまう
"   タブページを使わないならこのオプションは外して構わない
set guioptions+=l
" タブページを常に表示
set showtabline=1
" }}}
