" {{{
NeoBundleLazy 'vim-ruby/vim-ruby', { 'autoload': { 'filetypes': ['ruby'] } }
NeoBundleLazy 'tpope/vim-bundler', { 'autoload': { 'filetypes': ['ruby'] } }
" }}}

" {{{
" ref: [VimでRSenseを使って快適Rubyプログラミング - NigoroJr](http://nigorojr.com/articles/19)
" ref: [RSenseを使ってVimをIDEっぽくする（Ruby向け） - WEB SALAD](http://web-salad.hateblo.jp/entry/2014/10/07/102349)
" Macは別途brewでインストールした方が確実
" if !has('mac')
"   NeoBundleLazy 'marcus/rsense', {
"     \ 'autoload': { 'filetypes': 'ruby' }
"     \ }
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