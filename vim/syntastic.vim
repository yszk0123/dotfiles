Plug 'scrooloose/syntastic', { 'for': ['javascript', 'typescript'] }
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_save = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']

" Tell tsc to use tsconfig.json
" cf. [Typescript cannot use tsconfig.json files](https://github.com/scrooloose/syntastic/issues/1628)
let g:syntastic_typescript_tsc_fname = ''

" $ gem install rubocop
" let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_ruby_checkers = []

" mode=activeでバッファ保存時などに自動的にチェック
" mode=passiveで明示的に:SyntasticCheckを呼び出さない限りチェックしない
let g:syntastic_mode_map = {
  \ 'mode': 'active',
  \ 'passive_filetypes': ['html', 'text', 'markdown'],
  \ }

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
