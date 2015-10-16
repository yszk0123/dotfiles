" vim-geeknote {{{
NeoBundle 'neilagabriel/vim-geeknote'
nnoremap [util]e :<C-u>Geeknote<CR>
let g:GeeknoteFormat = 'markdown'
let g:GeeknoteScratchDirectory = $HOME . '/vimfiles/.geeknote'
" autocmd FileType geeknote setlocal nonumber
" }}}
