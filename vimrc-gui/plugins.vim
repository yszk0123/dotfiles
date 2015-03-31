" 通常読み込み(頻繁に使うもの)
" NeoBundle 'moll/vim-node'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'elzr/vim-json'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'wavded/vim-stylus'

NeoBundle 'mattn/emmet-vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'othree/html5.vim'
" NeoBundle 'taichouchou2/html5.vim'

" 遅延読み込み {{{
" " NeoBundleLazy 'digitaltoad/vim-jade', { "autoload": { "filetypes": ["jade"] } }
" NeoBundleLazy 'digitaltoad/vim-jade'
" au FileType jade NeoBundleSource vim-jade
" NeoBundleLazy 'kchmck/vim-coffee-script', { "autoload": { "filetypes": ["coffee"] } }
" NeoBundleLazy 'wavded/vim-stylus', { "autoload": { "filetypes": ["stylus"] } }
" }}}

" lightline {{{
NeoBundle 'itchyny/lightline.vim'

if !exists('g:lightline')
  let g:lightline = { 'active': {}, 'inactive': {} }
endif
let g:lightline.active.left = [
  \ [ 'mode', 'paste' ],
  \ [ 'readonly', 'relativepath', 'modified' ] ]
let g:lightline.inactive.left = [ [ 'relativepath' ] ]
" }}}

" indent_guides {{{
"--------------
NeoBundle 'nathanaelkane/vim-indent-guides'

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

" SirVer/ultisnips {{{
" NeoBundle 'SirVer/ultisnips'
" NeoBundle 'honza/vim-snippets'
"
" " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger = "<c-i>"
" " let g:UltiSnipsExpandTrigger = "<tab>"
" let g:UltiSnipsListSnippets = "<c-tab>"
" let g:UltiSnipsJumpForwardTrigger = "<tab>"
" let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
" " let g:UltiSnipsEditSplit="vertical"
" }}}

" vim-quickrun {{{
NeoBundle 'thinca/vim-quickrun', { "autoload": { "commands": ["QuickRun"] } }
if !exists('g:quickrun_config')
  let g:quickrun_config = {}
endif
let g:quickrun_config.javascript = {
  \   'type': 'javascript',
  \   'exec': 'node %o %a %S',
  \   'cmdopt': '--harmony'
  \ }
let g:quickrun_config.coffee = {
  \   'type': 'coffee',
  \   'exec': 'coffee %o %a %S'
  \ }
nnoremap [util]qr :QuickRun<CR>
nnoremap [util]qR :QuickRun -cmdopt<Space>
vnoremap [util]qr :QuickRun<CR>
vnoremap [util]qR :QuickRun -cmdopt<Space>
" }}}

" VimFiler {{{
NeoBundleLazy 'Shougo/vimfiler', { "autoload": { "commands": ["VimFilerBufferDir", "VimFilerCurrentDir"] } }
let g:vimfiler_safe_mode_by_default = 0
nnoremap [util]vf :<C-u>VimFilerBufferDir<CR>
nnoremap [util]vF :<C-u>VimFilerCurrentDir<CR>
" }}}

" VimShell {{{
NeoBundleLazy 'Shougo/vimshell.vim', { "autoload": { "commands": ["VimShell", "VimShellInteractive", "VimShellPop"] } }

" TODO: NeoBundleLazyで遅延読込しているために,デフォルトが設定される前に以下が実行されてしまう
let g:vimshell_temporary_directory = "expand('~/vimfiles/.vimshell')"
if !exists('g:vimshell_interactive_encodings')
  let g:vimshell_interactive_encodings = {}
endif
let g:vimshell_interactive_encodings['node'] = 'utf-8'
let g:vimshell_interactive_encodings['mongo'] = 'utf-8'
nnoremap [util]vs :<C-u>VimShell<CR>
nnoremap [util]vS :<C-u>VimShellInteractive<Space>

" nnoremap [vimshell]h :<C-u>VimShell<CR>
" nnoremap [vimshell]p :<C-u>VimShellPop<CR>
" nnoremap [vimshell]n :<C-u>VimShellInteractive node<CR>
" nnoremap [vimshell]c :<C-u>VimShellInteractive coffee<CR>
" nnoremap [vimshell]j :<C-u>VimShellInteractive jade<CR>
" nnoremap [vimshell]e :<C-u>VimShellSendString<CR>
" }}}

" vim-fugitive {{{
NeoBundle 'tpope/vim-fugitive'
nnoremap [util]gC :<C-u>Gcd<Space>
nnoremap [util]gL :<C-u>Glcd<Space>
nnoremap [util]ga :<C-u>Gadd<Space>
nnoremap [util]gb :<C-u>Gblame<Space>
nnoremap [util]gc :<C-u>Gcommit<Space>
nnoremap [util]gd :<C-u>Gdiff<Space>
nnoremap [util]ge :<C-u>Gedit<Space>
nnoremap [util]gl :<C-u>Glog<Space>
nnoremap [util]gs :<C-u>Gstatus<CR>
nnoremap [util]gw :<C-u>Gwrite<Space>
" }}}

" vim-gitgutter {{{
" NeoBundle 'airblade/vim-gitgutter'
" let g:gitgutter_enabled = 0
" let g:gitgutter_realtime = 0
" let g:gitgutter_eager = 0
" }}}

" vim-multiple-cursors {{{
" NeoBundle 'terryma/vim-multiple-cursors'
" }}}
