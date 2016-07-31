" コマンド集

" Remove C style comments {{{
function! s:remove_comments()
  " Remove block comments
  silent! g/^\s*\v(\/\/|\/\*\*?|\*\s|\*$|\*\/)/d
  " Remove line comments
  silent! %s/\s*\/\/.*$//g
endfunction

command! RemoveComments call <SID>remove_comments()
" }}}

" Rename {{{
command! -nargs=1 -complete=file Rename f <args>|write|call delete(expand('#'))
" }}}

" Make directory on save as needed {{{
function! s:mkdir()
  let dir = expand('%:p:h')

  if !isdirectory(dir)
    call mkdir(dir, 'p')
    echo 'Created non-existing directory: ' . dir
  endif
endfunction
command! Write call <SID>mkdir()|write
" }}}
