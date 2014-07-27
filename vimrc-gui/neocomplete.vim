NeoBundle 'Shougo/neocomplete.vim'

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
let g:neocomplete#data_directory = $HOME . '/vimfiles/.cache/neocomplete'
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 4
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" let g:neocomplete#sources#buffer#disabled_pattern = '\.story'
let g:neocomplete#max_list = 30
let g:neocomplete#manual_completion_start_length = 0
" let g:neocomplete#manual_completion_start_length = 3
let g:neocomplete#auto_completion_start_length = 4
let g:neocomplete#max_keyword_width = 60
" let g:neocomplete#enable_prefetch = 1
" let g:neocomplete#disable_auto_complete = 1
let g:neocomplete#skip_auto_completion_time = '0.2'
let g:neocomplete#sources = {
  \ '_': ['omni', 'buffer', 'file']
  \ }

call neocomplete#custom#source('file', 'rank', 10)

" Define dictionary.
" let g:neocomplete#sources#dictionary#dictionaries = {
"     \ 'default' : '',
"     \ 'vimshell' : $HOME.'/.vimshell_hist',
"     \ 'scheme' : $HOME.'/.gosh_completions'
"     \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
let g:neocomplete#keyword_patterns['coffee'] = '\h\w*\|[\$@]\w*'
if !exists('g:neocomplete#sources')
  let g:neocomplete#sources = {}
endif

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
" inoremap <expr><C-l>     neocomplete#complete_common_string()
" Unite�Ƒg�ݍ��킹
" imap <C-k>  <Plug>(neocomplete_start_unite_complete)
" imap <C-q>  <Plug>(neocomplete_start_unite_quick_match)

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  " return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr> <C-d> neocomplete#start_manual_complete(['neosnippet', 'buffer'])
inoremap <expr> <C-f> neocomplete#start_manual_complete(['file'])
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : neocomplete#start_manual_complete()
" <C-h>, <BS>: close popup and delete backword char.
" inoremap <expr><C-h>  neocomplete#smart_close_popup()."\<C-h>"
" inoremap <expr><BS>   neocomplete#smart_close_popup()."\<C-h>"
" inoremap <expr><C-y>  neocomplete#close_popup()
" inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" AutoComplPop like behavior.
" let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
" set completeopt+=longest
" let g:neocomplete#enable_auto_select = 1
" let g:neocomplete#disable_auto_complete = 1
" inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
au FileType css setlocal omnifunc=csscomplete#CompleteCSS
au FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
au FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
au FileType python setlocal omnifunc=pythoncomplete#Complete
au FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
" if !exists('g:neocomplete#sources#omni#input_patterns')
"   let g:neocomplete#sources#omni#input_patterns = {}
" endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
" let g:neocomplete#sources#omni#input_patterns.coffee = '[^.[:digit:] *\t]\.'

" Four perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
" let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" let g:neocomplete#sources#vim#complete_functions = {
"       \ 'Ref' : 'ref#complete',
"       \ 'Unite' : 'unite#complete_source',
"       \ 'VimShellExecute' :
"       \      'vimshell#vimshell_execute_complete',
"       \ 'VimShellInteractive' :
"       \      'vimshell#vimshell_execute_complete',
"       \ 'VimShellTerminal' :
"       \      'vimshell#vimshell_execute_complete',
"       \ 'VimShell' : 'vimshell#complete',
"       \ 'VimFiler' : 'vimfiler#complete',
"       \ 'Vinarise' : 'vinarise#complete',
" \}
