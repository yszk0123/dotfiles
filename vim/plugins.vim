Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'vim-scripts/gitignore'
Plug 'szw/vim-tags'

Plug 'mattn/emmet-vim', { 'for': ['html', 'javascript', 'typescript', 'css', 'jsx', 'tsx', 'stylus', 'less', 'sass'] }
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'jsx'] }
" Plug 'taichouchou2/html5.vim'
Plug 'othree/html5.vim', { 'for': 'html' }
" Plug 'digitaltoad/vim-jade', { 'for': 'jade' }
" Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
" Plug 'wavded/vim-stylus', { 'for': 'stylus' }
Plug 'hail2u/vim-css3-syntax', { 'for': ['css', 'html'] }

" vim-json {{{
Plug 'elzr/vim-json', { 'for': 'json' }
let g:vim_json_syntax_conceal = 0
" }}}

" deoplete-vim {{
if has('nvim')
  Plug 'Shougo/deoplete.nvim'
  let g:deoplete#enable_at_startup = 1

  Plug 'benekastah/neomake'
  nnoremap <Leader>s :<C-u>Neomake<CR>
endif
" }}}

if executable('ag')
  Plug 'rking/ag.vim', { 'on': ['Ag', 'AgFile', 'AgBuffer', 'AgAdd', 'AgHelp', 'AgFromSearch'] }
endif

" nerdtree {{{
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
nnoremap <Leader>h :<C-u>NERDTreeToggle<CR>
" }}}

" fzf {{{
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all', 'on': 'FZF' }
nnoremap <Leader>f :<C-u>FZF<CR>
" }}}

" clever-f {{{
Plug 'rhysd/clever-f.vim'
let g:clever_f_smart_case = 1
let g:clever_f_use_migemo = 1
let g:clever_f_fix_key_direction = 0
let g:clever_f_chars_match_any_signs = ''
"}}}

" indent_guides {{{
"--------------
" Note: vim-indent-guidesの前にcolorschemeを設定しないと
"   まれに次のようなエラーが発生する
"   E411: highlight group not found: Normal
" ref: [Just Another Camelog](http://www.camelstudio.jp/note/vim/186/)
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

" lightline {{{
Plug 'bling/vim-airline'
" }}}

" splitjoin: 一行コード <=> 複数行コードの相互変換 {{{
Plug 'AndrewRadev/splitjoin.vim'
nnoremap <Leader>j :<C-u>SplitjoinJoin<CR>
nnoremap <Leader>J :<C-u>SplitjoinSplit<CR>
" }}}

" switch: 似たような表現を切り替える(true <=> false, if <=> elseif など) {{{
Plug 'AndrewRadev/switch.vim'
nnoremap <bar> :<C-u>Switch<CR>
" }}}

" tcomment {{{
Plug 'tomtom/tcomment_vim'
" let g:tcommentMapLeader1 = '<C-a>'
"}}}

" VimFiler {{{
Plug 'Shougo/vimfiler', { 'on': ['VimFilerBufferDir', 'VimFilerCurrentDir'] }
let g:vimfiler_safe_mode_by_default = 0
nnoremap <Leader>vf :<C-u>VimFilerBufferDir<CR>
nnoremap <Leader>vF :<C-u>VimFilerCurrentDir<CR>
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

" vim-easy-align {{{
Plug 'junegunn/vim-easy-align'
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
" vmap <Enter> <Plug>(EasyAlign)
vmap _ <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" }}}

" selection {{{
Plug 'tpope/vim-surround'
xmap s <Plug>VSurround

Plug 'terryma/vim-expand-region'
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
" }}}

" vim-fugitive + gitv {{{
Plug 'tpope/vim-fugitive'
Plug 'gregsexton/gitv'
nnoremap <Leader>c :<C-u>Gcd<CR>
nnoremap <Leader>l :<C-u>Glcd<CR>
nnoremap <Leader>ga :<C-u>Gadd<Space>
nnoremap <Leader>gb :<C-u>Gblame<Space>
nnoremap <Leader>gC :<C-u>Gcommit<Space>
nnoremap <Leader>gA :<C-u>Gcommit --amend --reuse-message=HEAD<Space>
nnoremap <Leader>gd :<C-u>Gdiff<Space>
nnoremap <Leader>ge :<C-u>Gedit<Space>
nnoremap <Leader>gL :<C-u>Glog<Space>
nnoremap <Leader>gs :<C-u>Gstatus<CR>
nnoremap <Leader>gw :<C-u>Gwrite<Space>
" }}}

" Colorscheme {{{
" Plug 'wimstefan/Lightning'
" Plug 'reedes/vim-colors-pencil'
" Plug 'w0ng/vim-hybrid'
" Plug 'kristijanhusak/vim-hybrid-material'
Plug 'NLKNguyen/papercolor-theme'

set background=dark

" au VimEnter * :colorscheme hybrid
" au VimEnter * :colorscheme hybrid_reverse
au VimEnter * :colorscheme PaperColor
" }}}

" vim-operator-* {{{
Plug 'kana/vim-operator-user'

Plug 'emonkak/vim-operator-sort'
Plug 'kana/vim-operator-replace'

map R  <Plug>(operator-replace)
map M  <Plug>(operator-sort)
"}}}

" vim-qfreplace {{{
Plug 'thinca/vim-qfreplace'
nnoremap <Leader>q :<C-u>Qfreplace<CR>
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

" vim-wipeout {{{
Plug 'artnez/vim-wipeout'
" }}}

" 囲み系補完 {{{
" {{{
" Plug 'kana/vim-smartinput'
Plug 'tpope/vim-endwise'
Plug 'Raimondi/delimitMate'
let delimitMate_expand_space = 1
let delimitMate_expand_cr = 1
let delimitMate_matchpairs = '(:),{:}'
au FileType html let b:delimitMate_matchpairs = '(:),[:],{:},<:>'
au FileType coffee let delimitMate_nesting_quotes = ['"','`']
" }}}
" }}}

" For Markdown {{{
" ref: [VimでMarkdownの環境を整える その2](http://rcmdnk.github.io/blog/2014/10/30/computer-vim-markdown/)
" Plug 'plasticboy/vim-markdown'
" Plug 'jtratner/vim-flavored-markdown'
Plug 'joker1007/vim-markdown-quote-syntax', { 'for': ['markdown', 'mkd', 'md'] }
" Plug 'nelstrom/vim-markdown-folding'
" Plug 'kannokanno/previm', { 'on': 'PrevimOpen' }
" Plug 'tyru/open-browser.vim', { 'on': ['OpenBrowser', 'OpenBrowserSearch', 'OpenBrowserSmartSearch'] }
let g:markdown_fold_style = 'nested'
" TODO: これでいいのか
" autocmd FileType zsh runtime! ftplugin/markdown/folding.vim
" }}}
