" NeoBundle 'matthewtodd/vim-twilight'
NeoBundle 'tpope/vim-surround'
NeoBundle 'w0ng/vim-hybrid'
" NeoBundle 'altercation/vim-colors-solarized'
" Aligntaと似たようなプラグイン
" NeoBundle 'godlygeek/tabular'
" Perlスタイルの正規表現
" NeoBundle 'othree/eregex.vim'

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
NeoBundle 'Lokaltog/vim-easymotion'
" map <Leader> <Plug>(easymotion-prefix)
map <Space> <Plug>(easymotion-prefix)
map <Space>S <Plug>(easymotion-sn)
map <Space>/ <Plug>(easymotion-sn)
map <Space>n <Plug>(easymotion-bd-n)
map <Space>. <Plug>(easymotion-repeat)
" map <Space>; <Plug>(easymotion-jumptoanywhere)
map <Space><Space> <Plug>(easymotion-prefix)s
map <Space>{ <Plug>(easymotion-prefix)s{
map <Space>} <Plug>(easymotion-prefix)s}
map <Space>( <Plug>(easymotion-prefix)s(
map <Space>) <Plug>(easymotion-prefix)s)
map <Space>, <Plug>(easymotion-prefix)s,
map <Space>; <Plug>(easymotion-prefix)s;
map <Space>c <Plug>(easymotion-prefix)s'
" let g:EasyMotion_keys = 'nvmhgjfkdls;aurieowp'
let g:EasyMotion_keys = 'nmvhjkl;gfdsaiopew'
let g:EasyMotion_re_anywhere = '[<>()\[\]{}]\v|<(class|function|var|require)>'
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

" vim-qfreplace {{{
NeoBundle 'thinca/vim-qfreplace'
nnoremap [util]q :<C-u>Qfreplace<CR>
" }}}

" vim-rooter: change working directory to project root {{{
NeoBundle 'airblade/vim-rooter'
map <silent> <Space>C <Plug>RooterChangeToRootDirectory
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
NeoBundle 'kana/vim-textobj-user'

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
NeoBundle 'kana/vim-textobj-fold'
NeoBundle 'kana/vim-textobj-indent'
NeoBundle 'kana/vim-textobj-lastpat'
NeoBundle 'thinca/vim-textobj-comment'
"}}}
