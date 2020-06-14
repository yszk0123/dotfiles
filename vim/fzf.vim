" Basic
nnoremap <silent> [util]R :<C-u>GFiles?<CR>
nnoremap <silent> [util]r :<C-u>GFiles<CR>
nnoremap <silent> [util]f :<C-u>Files<CR>
nnoremap <silent> [util]g :<C-u>Rg<Space>
nnoremap <silent> [util]b :<C-u>Buffers<CR>
nnoremap <silent> [util]l :<C-u>Lines<CR>
nnoremap <silent> [util]L :<C-u>BLines<CR>
nnoremap <silent> [util]w :<C-u>Windows<CR>
nnoremap <silent> [util]h :<C-u>History<CR>
nnoremap <silent> [util]c :<C-u>Commits<CR>
nnoremap <silent> [util]C :<C-u>BCommits<CR>
nnoremap <silent> [util]m :<C-u>History<CR>

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)
