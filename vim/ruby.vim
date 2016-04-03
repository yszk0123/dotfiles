" {{{
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'tpope/vim-bundler', { 'for': 'ruby' }
" }}}

" {{{
" cf. [VimでRSenseを使って快適Rubyプログラミング - NigoroJr](http://nigorojr.com/articles/19)
" cf. [RSenseを使ってVimをIDEっぽくする（Ruby向け） - WEB SALAD](http://web-salad.hateblo.jp/entry/2014/10/07/102349)
" Macは別途brewでインストールした方が確実
" if !has('mac')
"   Plug 'marcus/rsense', { 'for': 'ruby' }
" endif
" NeoBundleLazy 'supermomonga/neocomplete-rsense.vim', {
"   \ 'depends': ['Shougo/neocomplete.vim', 'marcus/rsense'],
"   \ 'autoload': { 'filetypes': 'ruby' }
"   \ }
" NeoBundleLazy 'supermomonga/neocomplete-rsense.vim', {
"   \ 'depends': ['Shougo/neocomplete.vim'],
"   \ 'autoload': { 'filetypes': 'ruby' }
"   \ }

" オムニ補完有効化
" let g:rsenseUseOmniFunc = 1

" .や::を入力したときにオムニ補完が有効になるようにする
" if !exists('g:neocomplete#force_omni_input_patterns')
"   let g:neocomplete#force_omni_input_patterns = {}
" endif
" let g:neocomplete#force_omni_input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'

" 環境変数RSENSE_HOMEに'/usr/local/bin/rsense'を指定しても動く
" if has('mac')
"   let g:neocomplete#sources#rsense#home_directory = '/usr/local/bin/rsense'
" endif
" }}}
