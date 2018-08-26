Plug 'mattn/emmet-vim', { 'for': ['html', 'javascript', 'typescript', 'css', 'jsx', 'tsx', 'stylus', 'less', 'sass', 'eruby'] }
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'jsx'] }
" Plug 'taichouchou2/html5.vim'
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'hail2u/vim-css3-syntax', { 'for': ['css', 'html'] }

" editorconfig-vim {{{
" Plug 'editorconfig/editorconfig-vim'
" let g:EditorConfig_exclude_patterns = ['fugitive://.*']
" }}}

" fzf {{{
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all', 'on': 'FZF' }
nnoremap <Leader>f :<C-u>FZF<CR>
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

if has('nvim')
  Plug 'Shougo/deoplete.nvim'
  let g:deoplete#enable_at_startup = 1

  Plug 'benekastah/neomake'
endif
