NeoBundle 'itchyny/lightline.vim'

" 通常読み込み(頻繁に使うもの)
" NeoBundle 'moll/vim-node'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'elzr/vim-json'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'wavded/vim-stylus'

" 遅延読み込み {{{
" " NeoBundleLazy 'digitaltoad/vim-jade', { "autoload": { "filetypes": ["jade"] } }
" NeoBundleLazy 'digitaltoad/vim-jade'
" au FileType jade NeoBundleSource vim-jade
" NeoBundleLazy 'kchmck/vim-coffee-script', { "autoload": { "filetypes": ["coffee"] } }
NeoBundleLazy 'thinca/vim-quickrun', { "autoload": { "commands": ["QuickRun"] } }
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

" ctrlp {{{
" -----
NeoBundleLazy 'kien/ctrlp.vim', { "autoload": { "commands": ["CtrlP", "CtrlPDir", "CtrlPRoot", "CtrlPMRUFiles"] } }

nnoremap [ctrlp] <Nop>
nmap ss [ctrlp]

nnoremap [ctrlp]a :<C-u>CtrlP<Space>
nnoremap [ctrlp]b :<C-u>CtrlPBuffer<CR>
nnoremap [ctrlp]d :<C-u>CtrlPDir<CR>
nnoremap [ctrlp]f :<C-u>CtrlP<CR>
nnoremap [ctrlp]r :<C-u>CtrlPRoot<CR>
nnoremap [ctrlp]c :<C-u>CtrlPCurWD<CR>
nnoremap [ctrlp]w :<C-u>CtrlPCurWD<CR>
" nnoremap [ctrlp]u :<C-u>CtrlPUndo<CR>
" nnoremap [ctrlp]R :<C-u>CtrlPRTS<CR>
" nnoremap [ctrlp]c :<C-u>CtrlPChange<CR>
" nnoremap [ctrlp]l :<C-u>CtrlPLine<CR>
" nnoremap [ctrlp]m :<C-u>CtrlPMRUFiles<CR>
" nnoremap [ctrlp]q :<C-u>CtrlPQuickfix<CR>
" nnoremap [ctrlp]s :<C-u>CtrlPMixed<CR>
" nnoremap [ctrlp]t :<C-u>CtrlPTag<CR>

" 更新(キャッシュクリア)はCtrlP表示中に"F5"でOK
" nnoremap [ctrlp]0 :<C-u>CtrlPClearCache<CR>

let g:ctrlp_cache_dir = $HOME . '/vimfiles/.cache/ctrlp'
let g:ctrlp_use_migemo = 0
let g:ctrlp_map = ''
let g:ctrlp_working_path_mode = 'a'
let g:ctrlp_root_markers = ['package.json', 'bower.json', 'gulpfile.js', 'myke.config.json', 'myke.config.yml']
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_extensions = ['dir']
" let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:18'
let g:ctrlp_max_files = 1500
let g:ctrlp_mruf_max = 0
let g:ctrlp_mruf_save_on_update = 0
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_lazy_update = 180
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|\.hg|\.svn|bower_components|components|node_modules|lib|dist|dest|build|backup|preprocess)$',
  \ 'file': '\v\.(exe|so|dll|png|jpg|jpeg|bmp|gif|ttc|lib)$',
  \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
  \ }
"}}}

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
" nnoremap [vimshell] <Nop>
" nmap sh [vimshell]
" 
" nnoremap [vimshell]h :<C-u>VimShell<CR>
" nnoremap [vimshell]p :<C-u>VimShellPop<CR>
" nnoremap [vimshell]n :<C-u>VimShellInteractive node<CR>
" nnoremap [vimshell]c :<C-u>VimShellInteractive coffee<CR>
" nnoremap [vimshell]j :<C-u>VimShellInteractive jade<CR>
" nnoremap [vimshell]e :<C-u>VimShellSendString<CR>
" }}}
