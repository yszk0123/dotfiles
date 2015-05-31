" NeoBundle 'matthewtodd/vim-twilight'
NeoBundle 'tpope/vim-surround'
" NeoBundle 'altercation/vim-colors-solarized'
" Aligntaと似たようなプラグイン
" NeoBundle 'godlygeek/tabular'
" Perlスタイルの正規表現
" NeoBundle 'othree/eregex.vim'

" acp (vim-autocomplpop, AutoComplPop) {{{
" NeoBundle 'D:/common/lib/vim-autocomplpop'
" let g:acp_behaviorKeywordIgnores = ['D:', 'C:', '\\', '/', '.', ':']
" au WinEnter *[unite]* AcpLock
" au WinLeave *[unite]* AcpUnlock
" }}}

" Alignta {{{
" TODO: ソート+整列
" NeoBundleLazy 'h1mesuke/vim-alignta.git', { "autoload": { "commands": ["Align"] } }
" " let g:unite_source_alignta_preset_arguments = [
" "       \ ["Align at '='", '=>\='],
" "       \ ["Align at ':'", '01 :\zs/1'],
" "       \ ["Align at ','", '01 ,\zs'],
" "       \]
" " nnoremap [unite]a :<C-u>Unite alignta:options<CR>
" " xnoremap [unite]a :<C-u>Unite alignta:arguments<CR>
" " nnoremap gc `[v`]
" " nnoremap [align] <Nop>
" " nmap <Space>a [align]
" " nnoremap [align]a :Alignta 0:1 :\zs/1<CR>
" " xnoremap [align]a :Alignta 0:1 :\zs/1<CR>
" vnoremap <silent> = :Align 1 =<CR>
" vnoremap <silent> * :Align 01 :\zs/1<CR>
" vnoremap <silent> , :Align 01 ,\zs<CR>
"}}}

" clever-f {{{
NeoBundle 'rhysd/clever-f.vim'
let g:clever_f_smart_case = 1
let g:clever_f_use_migemo = 0
let g:clever_f_fix_key_direction = 0
let g:clever_f_chars_match_any_signs = ''
"}}}

" vim-easymotion {{{
" NeoBundle 'Lokaltog/vim-easymotion'
" " map <Leader> <Plug>(easymotion-prefix)
" map <Space><Space> <Plug>(easymotion-prefix)
" map <Space><Space>S <Plug>(easymotion-sn)
" map <Space><Space>; <Plug>(easymotion-jumptoanywhere)
" map <Space><Space>s <Plug>(easymotion-bd-n)
" map <Space> <Plug>(easymotion-prefix)s
" map <Space>. <Plug>(easymotion-prefix)s.
" " map <Space>/ <Plug>(easymotion-sn)
" " map <Space>n <Plug>(easymotion-bd-n)
" " map <Space>. <Plug>(easymotion-repeat)
" map ; <Plug>(easymotion-prefix)s;
" map ,, <Plug>(easymotion-prefix)s,
" map ( <Plug>(easymotion-prefix)s(
" map ) <Plug>(easymotion-prefix)s)
" " map { <Plug>(easymotion-prefix)s{
" " map } <Plug>(easymotion-prefix)s}
" " let g:EasyMotion_keys = 'nvmhgjfkdls;aurieowp'
" " let g:EasyMotion_keys = 'nmbhjkl;gfdsaiopew'
" let g:EasyMotion_keys = 'nhjio;lkmp@[]:gtrewasdfv'
" " let g:EasyMotion_re_anywhere = '\v<(class|function|var|require|import|export|return|if)>\s*\zs|\)\s*\{\zs'
" let g:EasyMotion_re_anywhere = '\v^$'
" }}}

" vim-hybrid {{{
NeoBundle 'w0ng/vim-hybrid'
au VimEnter * :colorscheme hybrid
" }}}

" splitjoin: 一行コード <=> 複数行コードの相互変換 {{{
NeoBundle 'AndrewRadev/splitjoin.vim'
nnoremap [util]j :<C-u>SplitjoinJoin<CR>
nnoremap [util]J :<C-u>SplitjoinSplit<CR>
" }}}

" switch: 似たような表現を切り替える(true <=> false, if <=> elseif など) {{{
NeoBundle 'AndrewRadev/switch.vim'
nnoremap <bar> :<C-u>Switch<CR>
" }}}

" tcomment {{{
NeoBundle 'tomtom/tcomment_vim'
" let g:tcommentMapLeader1 = '<C-a>'
"}}}

" vim-operator-* {{{
NeoBundle 'kana/vim-operator-user'

NeoBundle 'emonkak/vim-operator-sort'
NeoBundle 'kana/vim-operator-replace'

map R  <Plug>(operator-replace)
map S  <Plug>(operator-sort)
"}}}

" supertab {{{
NeoBundle 'ervandew/supertab'
" }}}

" vim-qfreplace {{{
NeoBundle 'thinca/vim-qfreplace'
nnoremap [util]q :<C-u>Qfreplace<CR>
" }}}

" YankRing {{{
" NeoBundle 'vim-scripts/YankRing.vim'
" nnoremap [util]y :<C-u>YRShow<CR>
" let g:yankring_max_history = 10
" }}}

" vim-rooter: change working directory to project root {{{
NeoBundle 'airblade/vim-rooter'
map <silent> [util]C <Plug>RooterChangeToRootDirectory
let g:rooter_manual_only = 1
let g:rooter_patterns = ['.git/', 'node_modules/', 'package.json']
"}}}

" vim-smartinput: 囲み系補完 {{{
" NeoBundle 'kana/vim-smartinput'
NeoBundle 'Raimondi/delimitMate'
"}}}

" vim-textobj-* {{{
" ref:
"   title: Vim の textobj プラグインをまとめた - C++でゲームプログラミング
"   url: http://d.hatena.ne.jp/osyo-manga/20130717/1374069987
" NeoBundle 'kana/vim-textobj-user'

" between:  f
" comment:  c
" fold:     z
" indblock: o
" lastpat:  /
" sort:     s
" syntax:   y
" wiw:      ,

" NeoBundle 'glts/vim-textobj-indblock'
" NeoBundle 'kana/vim-textobj-datetime'
" NeoBundle 'kana/vim-textobj-syntax'
" NeoBundle 'mattn/vim-textobj-url'
" NeoBundle 'thinca/vim-textobj-between'
" NeoBundle 'h1mesuke/textobj-wiw'
" NeoBundle 'kana/vim-textobj-fold'
" NeoBundle 'kana/vim-textobj-indent'
" NeoBundle 'kana/vim-textobj-lastpat'
" NeoBundle 'thinca/vim-textobj-comment'
"}}}

" vim-wipeout {{{
NeoBundle 'artnez/vim-wipeout'
" }}}
