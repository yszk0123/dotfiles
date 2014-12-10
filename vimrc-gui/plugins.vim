" 通常読み込み(頻繁に使うもの)
" NeoBundle 'moll/vim-node'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'elzr/vim-json'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'wavded/vim-stylus'

NeoBundle 'mattn/emmet-vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'taichouchou2/html5.vim'

" NeoBundle 'jelera/vim-javascript-syntax'

" typescript-vim {{{
NeoBundle 'leafgarland/typescript-vim'
" }}}

" typescript-tools (not bundled) {{{
au BufRead,BufNewFile *.ts setlocal filetype=typescript
au FileType typescript call s:MyTSSkeymap()
set rtp+=D:/web/github/typescript-tools/
function! s:MyTSSkeymap()
  inoremap <silent> <buffer> <C-i> <C-x><C-o>
  nnoremap <silent> <buffer> <C-]> :<C-u>TSSdef<CR>
  nnoremap <silent> <buffer> <C-w>]  :<C-u>TSSdefsplit<CR>
  nnoremap <silent> <buffer> <C-w>]] :<C-u>TSSdeftab<CR>
  nnoremap <silent> <buffer> <C-w>?  :<C-u>TSSdefpreview<CR>
  nnoremap <silent> <buffer> [tsc]?  :<C-u>TSStype<CR>
  " :<C-u>TSSsymbol
  nnoremap <silent> <buffer> [tsc]?? :<C-u>TSSbrowse<CR>
  " :<C-u>TSSreferences
  nnoremap <silent> <buffer> [tsc]s :<C-u>TSSstructure<CR>
  nnoremap <silent> <buffer> [tsc]u :<C-u>TSSupdate<CR>
  nnoremap <silent> <buffer> [tsc]e :<C-u>TSSshowErrors<CR>
  nnoremap <silent> <buffer> [tsc]p :<C-u>TSSfilesMenu<CR>
  nnoremap <silent> <buffer> [tsc]f :<C-u>TSSfile
  " :<C-u>TSSfiles
  nnoremap <silent> <buffer> [tsc]r :<C-u>TSSreload<CR>
  nnoremap <silent> <buffer> [tsc]S :<C-u>TSSstart
  nnoremap <silent> <buffer> [tsc]s :<C-u>TSSstarthere<CR>
  " :<C-u>TSSstatus
  nnoremap <silent> <buffer> [tsc]q :<C-u>TSSend<CR>

endfunction
" }}}

" javascript-libraries-syntax {{{
" javascriptの主要なライブラリの構文定義
NeoBundle 'othree/javascript-libraries-syntax.vim'

" jshint {{{
NeoBundle 'Shutnik/jshint2.vim'
let jshint2_read=0
let jshint2_save=1
let jshint2_close=1
" }}}

" comma separated list
"   Support libs id:
"   * jQuery: jquery
"   * underscore.js: underscore
"   * Lo-Dash: underscore
"   * Backbone.js: backbone
"   * prelude.ls: prelude
"   * AngularJS: angularjs
"   * AngularUI: angularui
"   * RequireJS: requirejs
"   * Sugar.js: sugar
"   * Jasmine: jasmine
let g:used_javascript_libs = 'underscore'
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

" 遅延読み込み {{{
" " NeoBundleLazy 'digitaltoad/vim-jade', { "autoload": { "filetypes": ["jade"] } }
" NeoBundleLazy 'digitaltoad/vim-jade'
" au FileType jade NeoBundleSource vim-jade
" NeoBundleLazy 'kchmck/vim-coffee-script', { "autoload": { "filetypes": ["coffee"] } }
" NeoBundleLazy 'wavded/vim-stylus', { "autoload": { "filetypes": ["stylus"] } }
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

" vim-jsbeautify {{{
NeoBundle 'maksimr/vim-jsbeautify'
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
autocmd FileType css,stylus noremap <buffer> <c-f> :call CSSBeautify()<cr>
" }}}

" vim-javascript {{{
" NeoBundle 'taichouchou2/vim-javascript'
NeoBundle 'pangloss/vim-javascript'
let javascript_ignore_javaScriptdoc = 1
" let g:javascript_conceal = 1
" }}}

" vim-jsx {{{
NeoBundle 'mxw/vim-jsx'
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
NeoBundle 'Shougo/vimfiler'
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
