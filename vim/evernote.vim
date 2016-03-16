" vim-geeknote {{{
Plug 'neilagabriel/vim-geeknote'
nnoremap [util]e :<C-u>Geeknote<CR>
let g:GeeknoteFormat = 'plain'
" let g:GeeknoteFormat = 'markdown'
let g:GeeknoteScratchDirectory = $HOME . '/vimfiles/.geeknote'
" let g:GeeknoteNotebooks = []
let g:GeeknoteExplorerNodeClosed = '+'
let g:GeeknoteExplorerNodeOpened = '-'
autocmd FileType geeknote setlocal nonumber
" }}}
