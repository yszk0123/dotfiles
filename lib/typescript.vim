" typescript-vim {{{
NeoBundleLazy 'leafgarland/typescript-vim'
autocmd FileType typescript NeoBundleSource 'leafgarland/typescript-vim'
" }}}

" Tsuquyomi {{{
if has('gui_running')
  NeoBundleLazy 'Quramy/tsuquyomi'
  autocmd FileType typescript NeoBundleSource 'Quramy/tsuquyomi'
endif
" }}}
