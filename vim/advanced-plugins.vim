if has('nvim')
  Plug 'flowtype/vim-flow', { 'for': 'javascript' }
  let g:flow#autoclose = 1
  let g:flow#enable = 0

  " deoplete {{{
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins', 'for': 'javascript' }

  let g:deoplete#enable_at_startup = 1
  let g:deoplete#enable_smart_case = 1
  let g:deoplete#file#enable_buffer_path = 1

  let g:deoplete#omni#input_patterns = {}
  let g:deoplete#omni#input_patterns.javascript = '[^. *\t]\.\w*'

  let g:deoplete#omni#functions = {}
  let g:deoplete#omni#functions.javascript = 'flowcomplete#Complete'
  " }}}
endif

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
