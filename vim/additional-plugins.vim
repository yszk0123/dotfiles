Plug 'szw/vim-tags'
Plug 'slim-template/vim-slim', { 'for': ['slim'] }
Plug 'mattn/emmet-vim', { 'for': ['html', 'javascript', 'typescript', 'css', 'jsx', 'tsx', 'stylus', 'less', 'sass'] }
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'jsx'] }
" Plug 'taichouchou2/html5.vim'
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'hail2u/vim-css3-syntax', { 'for': ['css', 'html'] }

" lightline {{{
Plug 'bling/vim-airline'
" }}}

" vim-json {{{
Plug 'elzr/vim-json', { 'for': 'json' }
let g:vim_json_syntax_conceal = 0
" }}}

" indent_guides {{{
"--------------
" Note: vim-indent-guidesの前にcolorschemeを設定しないと
"   まれに次のようなエラーが発生する
"   E411: highlight group not found: Normal
" cf. [Just Another Camelog](http://www.camelstudio.jp/note/vim/186/)
colorscheme default
Plug 'nathanaelkane/vim-indent-guides'

" インデントの深さに色を付ける
let g:indent_guides_start_level=2
let g:indent_guides_auto_colors=0
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_color_change_percent=20
let g:indent_guides_guide_size=1
let g:indent_guides_space_guides=1

"hi IndentGuidesOdd  guibg=#262626 ctermbg=gray
"hi IndentGuidesEven guibg=#3c3c3c ctermbg=darkgray
"au FileType coffee,ruby,javascript,python IndentGuidesEnable
"nmap <silent><Leader>ig <Plug>IndentGuidesToggle

au VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#262626 ctermbg=gray
au VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#3c3c3c ctermbg=darkgray
"}}}

" For Markdown {{{
" cf. [VimでMarkdownの環境を整える その2](http://rcmdnk.github.io/blog/2014/10/30/computer-vim-markdown/)
" Plug 'plasticboy/vim-markdown'
" Plug 'jtratner/vim-flavored-markdown'
" Plug 'nelstrom/vim-markdown-folding'
" Plug 'kannokanno/previm', { 'on': 'PrevimOpen' }
" Plug 'tyru/open-browser.vim', { 'on': ['OpenBrowser', 'OpenBrowserSearch', 'OpenBrowserSmartSearch'] }

" syntax がほぼ全部再読込されるため重くなる
Plug 'joker1007/vim-markdown-quote-syntax', { 'for': ['markdown', 'mkd', 'md'] }

let g:markdown_fold_style = 'nested'
" TODO: これでいいのか
" autocmd FileType zsh runtime! ftplugin/markdown/folding.vim
" }}}