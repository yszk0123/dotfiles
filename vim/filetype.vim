if exists('did_load_myvimrc_common_filetype')
  finish
end
let did_load_myvimrc_common_filetype = 1

au FileType yaml setlocal foldmethod=indent sw=2 sts=2 ts=2 et
" au FileType yaml normal zR
" au FileType yaml setlocal foldignore=
" au FileType yaml setlocal nowrap
" au FileType vim setlocal foldmethod=marker foldlevel=0
au FileType python setlocal foldmethod=indent sw=4 sts=4 ts=4 et
" テキストファイル/gitコミットで自動整形を行わない
au FileType text,gitcommit setlocal textwidth=0

au BufNewFile,BufRead *.jsx setlocal filetype=javascript
au BufNewFile,BufRead *.md setlocal filetype=markdown
au BufNewFile,BufRead *.{ts,tsx} setlocal filetype=typescript
au BufNewFile,BufRead Dockerfile.* setlocal filetype=dockerfile
au BufNewFile,BufRead *.vue setlocal filetype=vue
