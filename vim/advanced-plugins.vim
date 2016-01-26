" NeoBundle 'matthewtodd/vim-twilight'
" NeoBundle 'moll/vim-node'

" Perlスタイルの正規表現
" NeoBundle 'othree/eregex.vim'

" acp (vim-autocomplpop, AutoComplPop) {{{
" NeoBundle 'D:/common/lib/vim-autocomplpop'
" let g:acp_behaviorKeywordIgnores = ['D:', 'C:', '\\', '/', '.', ':']
" au WinEnter *[util]* AcpLock
" au WinLeave *[util]* AcpUnlock
" }}}

" supertab {{{
" NeoBundle 'ervandew/supertab'
" }}}

" tagbar {{{
" NeoBundle 'majutsushi/tagbar'
" nnoremap <Leader>t :<C-u>TagbarToggle<CR>
" }}}

" ultisnips {{{
" NeoBundle 'SirVer/ultisnips'
" NeoBundle 'honza/vim-snippets'
"
" " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger = "<c-i>"
" " let g:UltiSnipsExpandTrigger = "<tab>"
" let g:UltiSnipsListSnippets = "<c-tab>"
" let g:UltiSnipsJumpForwardTrigger = "<tab>"
" let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
" " let g:UltiSnipsEditSplit="vertical"
" }}}

" vim-rooter: change working directory to project root {{{
" NeoBundle 'airblade/vim-rooter'
" map <silent> <Leader>C <Plug>RooterChangeToRootDirectory
" let g:rooter_manual_only = 1
" let g:rooter_patterns = ['.git/', 'node_modules/', 'package.json']
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

" NeoBundle 'nelstrom/vim-textobj-rubyblock'
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

" vim-smartword {{{
NeoBundle 'kana/vim-smartword'
nmap w <Plug>(smartword-w)
nmap b <Plug>(smartword-b)
nmap e <Plug>(smartword-e)
" }}}

" vim-gitgutter {{{
" NeoBundle 'airblade/vim-gitgutter'
" let g:gitgutter_enabled = 0
" let g:gitgutter_realtime = 0
" let g:gitgutter_eager = 0
" }}}

" YankRing {{{
" NeoBundle 'vim-scripts/YankRing.vim'
" nnoremap <Leader>y :<C-u>YRShow<CR>
" let g:yankring_max_history = 10
" }}}
