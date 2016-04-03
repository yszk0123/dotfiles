" Plug 'matthewtodd/vim-twilight'
" Plug 'moll/vim-node'

" Perlスタイルの正規表現
" Plug 'othree/eregex.vim'

" acp (vim-autocomplpop, AutoComplPop) {{{
" Plug 'D:/common/lib/vim-autocomplpop'
" let g:acp_behaviorKeywordIgnores = ['D:', 'C:', '\\', '/', '.', ':']
" au WinEnter *[util]* AcpLock
" au WinLeave *[util]* AcpUnlock
" }}}

" supertab {{{
" Plug 'ervandew/supertab'
" }}}

" tagbar {{{
" Plug 'majutsushi/tagbar'
" nnoremap <Leader>t :<C-u>TagbarToggle<CR>
" }}}

" ultisnips {{{
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
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
" Plug 'airblade/vim-rooter'
" map <silent> <Leader>C <Plug>RooterChangeToRootDirectory
" let g:rooter_manual_only = 1
" let g:rooter_patterns = ['.git/', 'node_modules/', 'package.json']
"}}}

" vim-textobj-* {{{
" cf.
"   title: Vim の textobj プラグインをまとめた - C++でゲームプログラミング
"   url: http://d.hatena.ne.jp/osyo-manga/20130717/1374069987
" Plug 'kana/vim-textobj-user'

" between:  f
" comment:  c
" fold:     z
" indblock: o
" lastpat:  /
" sort:     s
" syntax:   y
" wiw:      ,

" Plug 'nelstrom/vim-textobj-rubyblock'
" Plug 'glts/vim-textobj-indblock'
" Plug 'kana/vim-textobj-datetime'
" Plug 'kana/vim-textobj-syntax'
" Plug 'mattn/vim-textobj-url'
" Plug 'thinca/vim-textobj-between'
" Plug 'h1mesuke/textobj-wiw'
" Plug 'kana/vim-textobj-fold'
" Plug 'kana/vim-textobj-indent'
" Plug 'kana/vim-textobj-lastpat'
" Plug 'thinca/vim-textobj-comment'
"}}}

" vim-smartword {{{
Plug 'kana/vim-smartword'
nmap w <Plug>(smartword-w)
nmap b <Plug>(smartword-b)
nmap e <Plug>(smartword-e)
" }}}

" vim-gitgutter {{{
" Plug 'airblade/vim-gitgutter'
" let g:gitgutter_enabled = 0
" let g:gitgutter_realtime = 0
" let g:gitgutter_eager = 0
" }}}

" YankRing {{{
" Plug 'vim-scripts/YankRing.vim'
" nnoremap <Leader>y :<C-u>YRShow<CR>
" let g:yankring_max_history = 10
" }}}
