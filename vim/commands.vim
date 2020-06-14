" コマンド集

" Rename {{{
command! -nargs=1 -complete=file Rename f <args>|write|call delete(expand('#'))
" }}}
