" Basic
nnoremap <silent> [fzf]R :<C-u>GFiles?<CR>
nnoremap <silent> [fzf]r :<C-u>GFiles<CR>
nnoremap <silent> [fzf]f :<C-u>Files<CR>
nnoremap <silent> [fzf]g :<C-u>Rg<Space>
nnoremap <silent> [fzf]b :<C-u>Buffers<CR>
nnoremap <silent> [fzf]l :<C-u>Lines<CR>
nnoremap <silent> [fzf]L :<C-u>BLines<CR>
nnoremap <silent> [fzf]w :<C-u>Windows<CR>
nnoremap <silent> [fzf]h :<C-u>History<CR>
nnoremap <silent> [fzf]c :<C-u>Commits<CR>
nnoremap <silent> [fzf]C :<C-u>BCommits<CR>
nnoremap <silent> [fzf]m :<C-u>History<CR>

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)
