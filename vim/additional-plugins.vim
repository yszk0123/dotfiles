Plug 'szw/vim-tags'
Plug 'slim-template/vim-slim', { 'for': ['slim'] }
Plug 'mattn/emmet-vim', { 'for': ['html', 'javascript', 'typescript', 'css', 'jsx', 'tsx', 'stylus', 'less', 'sass', 'eruby'] }
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'jsx'] }
" Plug 'taichouchou2/html5.vim'
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'hail2u/vim-css3-syntax', { 'for': ['css', 'html'] }

" vim-fugitive plugin {{{
Plug 'gregsexton/gitv'
" }}}

" editorconfig-vim {{{
" Plug 'editorconfig/editorconfig-vim'
" let g:EditorConfig_exclude_patterns = ['fugitive://.*']
" }}}

" fzf {{{
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all', 'on': 'FZF' }
nnoremap <Leader>f :<C-u>FZF<CR>
" }}}

" vim-json {{{
Plug 'elzr/vim-json', { 'for': 'json' }
let g:vim_json_syntax_conceal = 0
" }}}

" vim-easy-align {{{
Plug 'junegunn/vim-easy-align'
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
" vmap <Enter> <Plug>(EasyAlign)
vmap _ <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" }}}

" vim-quickrun {{{
Plug 'thinca/vim-quickrun', { 'on': 'QuickRun' }
if !exists('g:quickrun_config')
  let g:quickrun_config = {}
endif
let g:quickrun_config.javascript = {
  \   'type': 'javascript',
  \   'exec': 'node %o %a %S'
  \ }
let g:quickrun_config.coffee = {
  \   'type': 'coffee',
  \   'exec': 'coffee %o %a %S'
  \ }
" nnoremap <Leader>qr :QuickRun<CR>
" nnoremap <Leader>qR :QuickRun -cmdopt<Space>
" vnoremap <Leader>qr :QuickRun<CR>
" vnoremap <Leader>qR :QuickRun -cmdopt<Space>
" }}}

" VimShell {{{
Plug 'Shougo/vimshell.vim', { 'on': ['VimShell', 'VimShellInteractive', 'VimShellPop'] }

" TODO: NeoBundleLazyで遅延読込しているために,デフォルトが設定される前に以下が実行されてしまう
let g:vimshell_temporary_directory = "expand('~/vimfiles/.vimshell')"
if !exists('g:vimshell_interactive_encodings')
  let g:vimshell_interactive_encodings = {}
endif
let g:vimshell_interactive_encodings['node'] = 'utf-8'
let g:vimshell_interactive_encodings['mongo'] = 'utf-8'
nnoremap <Leader>vs :<C-u>VimShell<CR>
nnoremap <Leader>vS :<C-u>VimShellInteractive<Space>

" nnoremap [vimshell]h :<C-u>VimShell<CR>
" nnoremap [vimshell]p :<C-u>VimShellPop<CR>
" nnoremap [vimshell]n :<C-u>VimShellInteractive node<CR>
" nnoremap [vimshell]c :<C-u>VimShellInteractive coffee<CR>
" nnoremap [vimshell]j :<C-u>VimShellInteractive jade<CR>
" nnoremap [vimshell]e :<C-u>VimShellSendString<CR>
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
" }}}

if has('nvim')
  Plug 'Shougo/deoplete.nvim'
  let g:deoplete#enable_at_startup = 1

  Plug 'benekastah/neomake'
endif
