" typescript-vim {{{
NeoBundle 'leafgarland/typescript-vim'
" }}}

" typescript-tools (not bundled) {{{
au BufRead,BufNewFile *.ts setlocal filetype=typescript
au FileType typescript call s:MyTSSkeymap()
set rtp+=D:/web/github/typescript-tools/
function! s:MyTSSkeymap()
  inoremap <silent> <buffer> <C-i> <C-x><C-o>
  nnoremap <silent> <buffer> <C-]> :<C-u>TSSdef<CR>
  nnoremap <silent> <buffer> <C-w>]  :<C-u>TSSdefsplit<CR>
  nnoremap <silent> <buffer> <C-w>]] :<C-u>TSSdeftab<CR>
  nnoremap <silent> <buffer> <C-w>?  :<C-u>TSSdefpreview<CR>
  nnoremap <silent> <buffer> [tsc]?  :<C-u>TSStype<CR>
  " :<C-u>TSSsymbol
  nnoremap <silent> <buffer> [tsc]?? :<C-u>TSSbrowse<CR>
  " :<C-u>TSSreferences
  nnoremap <silent> <buffer> [tsc]s :<C-u>TSSstructure<CR>
  nnoremap <silent> <buffer> [tsc]u :<C-u>TSSupdate<CR>
  nnoremap <silent> <buffer> [tsc]e :<C-u>TSSshowErrors<CR>
  nnoremap <silent> <buffer> [tsc]p :<C-u>TSSfilesMenu<CR>
  nnoremap <silent> <buffer> [tsc]f :<C-u>TSSfile
  " :<C-u>TSSfiles
  nnoremap <silent> <buffer> [tsc]r :<C-u>TSSreload<CR>
  nnoremap <silent> <buffer> [tsc]S :<C-u>TSSstart
  nnoremap <silent> <buffer> [tsc]s :<C-u>TSSstarthere<CR>
  " :<C-u>TSSstatus
  nnoremap <silent> <buffer> [tsc]q :<C-u>TSSend<CR>

endfunction
" }}}
