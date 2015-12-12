" NeoBundle 'matthewtodd/vim-twilight'
" NeoBundle 'moll/vim-node'
NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'vim-scripts/gitignore'
NeoBundle 'szw/vim-tags'

NeoBundleLazy 'mattn/emmet-vim', { 'autoload': { 'filetypes': ['html', 'javascript', 'css', 'jsx', 'stylus', 'less', 'sass'] } }
NeoBundleLazy 'mxw/vim-jsx', { 'autoload': { 'filetypes': ['javascript', 'jsx'] } }
" NeoBundle 'taichouchou2/html5.vim'
NeoBundleLazy 'othree/html5.vim', { 'autoload': { 'filetypes': ['html'] } }
NeoBundleLazy 'elzr/vim-json', { 'autoload': { 'filetypes': ['json'] } }
NeoBundleLazy 'digitaltoad/vim-jade', { 'autoload': { 'filetypes': ['jade'] } }
NeoBundleLazy 'kchmck/vim-coffee-script', { 'autoload': { 'filetypes': ['coffee'] } }
NeoBundleLazy 'wavded/vim-stylus', { 'autoload': { 'filetypes': ['stylus'] } }
NeoBundleLazy 'hail2u/vim-css3-syntax', { 'autoload': { 'filetypes': ['css', 'html'] } }

" deoplete-vim {{
if has('nvim')
  NeoBundle 'Shougo/deoplete.nvim'
  let g:deoplete#enable_at_startup = 1

  NeoBundleLazy 'benekastah/neomake'
  nnoremap <Leader>s :<C-u>Neomake<CR>
endif
" }}}

" Perlスタイルの正規表現
" NeoBundle 'othree/eregex.vim'

" acp (vim-autocomplpop, AutoComplPop) {{{
" NeoBundle 'D:/common/lib/vim-autocomplpop'
" let g:acp_behaviorKeywordIgnores = ['D:', 'C:', '\\', '/', '.', ':']
" au WinEnter *[util]* AcpLock
" au WinLeave *[util]* AcpUnlock
" }}}

if executable('ag')
  NeoBundleLazy 'rking/ag.vim', { 'autoload': { 'commands': ['Ag', 'AgFile', 'AgBuffer', 'AgAdd', 'AgHelp', 'AgFromSearch'] } }
endif

" clever-f {{{
NeoBundle 'rhysd/clever-f.vim'
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

" lightline {{{
NeoBundle 'bling/vim-airline'
" }}}

" splitjoin: 一行コード <=> 複数行コードの相互変換 {{{
NeoBundle 'AndrewRadev/splitjoin.vim'
nnoremap <Leader>j :<C-u>SplitjoinJoin<CR>
nnoremap <Leader>J :<C-u>SplitjoinSplit<CR>
" }}}

" supertab {{{
" NeoBundle 'ervandew/supertab'
" }}}

" switch: 似たような表現を切り替える(true <=> false, if <=> elseif など) {{{
NeoBundle 'AndrewRadev/switch.vim'
nnoremap <bar> :<C-u>Switch<CR>
" }}}

" syntastic {{{
" NeoBundle 'scrooloose/syntastic'
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_save = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_javascript_checkers = ['eslint']
"
" " $ gem install rubocop
" " let g:syntastic_ruby_checkers = ['rubocop']
" let g:syntastic_ruby_checkers = []
"
" " mode=activeでバッファ保存時などに自動的にチェック
" " mode=passiveで明示的に:SyntasticCheckを呼び出さない限りチェックしない
" let g:syntastic_mode_map = {
"   \ 'mode': 'active',
"   \ 'passive_filetypes': ['html', 'text'],
"   \ }
"
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" }}}

" tagbar {{{
" NeoBundle 'majutsushi/tagbar'
" nnoremap <Leader>t :<C-u>TagbarToggle<CR>
" }}}

" tcomment {{{
NeoBundle 'tomtom/tcomment_vim'
" let g:tcommentMapLeader1 = '<C-a>'
"}}}

" ultisnips {{{
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

" VimFiler {{{
NeoBundleLazy 'Shougo/vimfiler', { "autoload": { "commands": ["VimFilerBufferDir", "VimFilerCurrentDir"] } }
let g:vimfiler_safe_mode_by_default = 0
nnoremap <Leader>vf :<C-u>VimFilerBufferDir<CR>
nnoremap <Leader>vF :<C-u>VimFilerCurrentDir<CR>
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
NeoBundle 'junegunn/vim-easy-align'
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
" vmap <Enter> <Plug>(EasyAlign)
vmap _ <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" }}}

" selection {{{
NeoBundle 'tpope/vim-surround'
xmap s <Plug>VSurround

NeoBundle 'terryma/vim-expand-region'
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
" }}}

" vim-fugitive + gitv {{{
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'gregsexton/gitv'
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

" vim-gitgutter {{{
" NeoBundle 'airblade/vim-gitgutter'
" let g:gitgutter_enabled = 0
" let g:gitgutter_realtime = 0
" let g:gitgutter_eager = 0
" }}}

" Colorscheme {{{
" NeoBundle 'wimstefan/Lightning'
" NeoBundle 'reedes/vim-colors-pencil'
" NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'kristijanhusak/vim-hybrid-material'
set background=dark
" au VimEnter * :colorscheme hybrid
au VimEnter * :colorscheme hybrid_reverse
" }}}

" vim-operator-* {{{
NeoBundle 'kana/vim-operator-user'

NeoBundle 'emonkak/vim-operator-sort'
NeoBundle 'kana/vim-operator-replace'

map R  <Plug>(operator-replace)
map M  <Plug>(operator-sort)
"}}}

" vim-qfreplace {{{
NeoBundle 'thinca/vim-qfreplace'
nnoremap <Leader>q :<C-u>Qfreplace<CR>
" }}}

" vim-quickrun {{{
NeoBundleLazy 'thinca/vim-quickrun', { "autoload": { "commands": ["QuickRun"] } }
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
" nnoremap <Leader>qr :QuickRun<CR>
" nnoremap <Leader>qR :QuickRun -cmdopt<Space>
" vnoremap <Leader>qr :QuickRun<CR>
" vnoremap <Leader>qR :QuickRun -cmdopt<Space>
" }}}

" vim-rooter: change working directory to project root {{{
" NeoBundle 'airblade/vim-rooter'
" map <silent> <Leader>C <Plug>RooterChangeToRootDirectory
" let g:rooter_manual_only = 1
" let g:rooter_patterns = ['.git/', 'node_modules/', 'package.json']
"}}}

" vim-smartword {{{
NeoBundle 'kana/vim-smartword'
nmap w <Plug>(smartword-w)
nmap b <Plug>(smartword-b)
nmap e <Plug>(smartword-e)
" }}}

" vim-textobj-* {{{
" ref:
"   title: Vim の textobj プラグインをまとめた - C++でゲームプログラミング
"   url: http://d.hatena.ne.jp/osyo-manga/20130717/1374069987
" NeoBundle 'kana/vim-textobj-user'

" between:  f
" comment:  c
" fold:     z
" indblock: o
" lastpat:  /
" sort:     s
" syntax:   y
" wiw:      ,

" NeoBundle 'nelstrom/vim-textobj-rubyblock'
" NeoBundle 'glts/vim-textobj-indblock'
" NeoBundle 'kana/vim-textobj-datetime'
" NeoBundle 'kana/vim-textobj-syntax'
" NeoBundle 'mattn/vim-textobj-url'
" NeoBundle 'thinca/vim-textobj-between'
" NeoBundle 'h1mesuke/textobj-wiw'
" NeoBundle 'kana/vim-textobj-fold'
" NeoBundle 'kana/vim-textobj-indent'
" NeoBundle 'kana/vim-textobj-lastpat'
" NeoBundle 'thinca/vim-textobj-comment'
"}}}

" vim-wipeout {{{
NeoBundle 'artnez/vim-wipeout'
" }}}

" YankRing {{{
" NeoBundle 'vim-scripts/YankRing.vim'
" nnoremap <Leader>y :<C-u>YRShow<CR>
" let g:yankring_max_history = 10
" }}}

" 囲み系補完 {{{
" {{{
" NeoBundle 'kana/vim-smartinput'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'Raimondi/delimitMate'
let delimitMate_expand_space = 1
let delimitMate_expand_cr = 1
let delimitMate_matchpairs = '(:),{:}'
au FileType html let b:delimitMate_matchpairs = '(:),[:],{:},<:>'
au FileType coffee let delimitMate_nesting_quotes = ['"','`']
" }}}
" }}}

" For Markdown {{{
" ref: [VimでMarkdownの環境を整える その2](http://rcmdnk.github.io/blog/2014/10/30/computer-vim-markdown/)
" NeoBundle 'plasticboy/vim-markdown'
" NeoBundle 'jtratner/vim-flavored-markdown'
NeoBundleLazy 'joker1007/vim-markdown-quote-syntax', { 'autoload': { 'filetypes': ['markdown', 'mkd', 'md'] } }
" NeoBundle 'nelstrom/vim-markdown-folding'
NeoBundleLazy 'kannokanno/previm', { 'autoload': { 'commands': ['PrevimOpen'] } }
NeoBundleLazy 'tyru/open-browser.vim', { 'autoload': { 'commands': ['OpenBrowser', 'OpenBrowserSearch', 'OpenBrowserSmartSearch'] } }
let g:markdown_fold_style = 'nested'
" TODO: これでいいのか
" autocmd FileType zsh runtime! ftplugin/markdown/folding.vim
" }}}
