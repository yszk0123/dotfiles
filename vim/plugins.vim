Plug 'artnez/vim-wipeout'
Plug 'bling/vim-airline'
Plug 'christoomey/vim-tmux-navigator'
Plug 'thinca/vim-qfreplace'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'vim-scripts/gitignore'

" Languages {{{
Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
Plug 'Vimjas/vim-python-pep8-indent', { 'for': 'python' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
" }}}

" fzf {{{
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

nnoremap <silent> [fzf]R :<C-u>GFiles?<CR>
nnoremap <silent> [fzf]r :<C-u>GFiles<CR>
nnoremap <silent> [fzf]f :<C-u>Files<CR>
nnoremap <silent> [fzf]g :<C-u>Rg<Space>
nnoremap <silent> [fzf]b :<C-u>Buffers<CR>
nnoremap <silent> [fzf]l :<C-u>Lines<CR>
nnoremap <silent> [fzf]L :<C-u>BLines<CR>
nnoremap <silent> [fzf]w :<C-u>Windows<CR>
nnoremap <silent> [fzf]h :<C-u>History<CR>
nnoremap <silent> [fzf]c :<C-u>Commits<CR>
nnoremap <silent> [fzf]C :<C-u>BCommits<CR>
nnoremap <silent> [fzf]m :<C-u>History<CR>

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)
" }}}

" neoformat {{{
Plug 'sbdchd/neoformat'
let g:neoformat_enabled_javascript = ['prettier']
let g:neoformat_javascript_prettier = {
  \ 'exe': 'prettier',
  \ 'args': ['--stdin', '--single-quote'],
  \ 'stdin': 1,
  \ }
" }}}

" ALE {{{
Plug 'w0rp/ale'

let g:ale_linters = {}
let g:ale_linters['python'] = ['flake8']
let g:ale_linters['javascript'] = []
" let g:ale_linters['typescript'] = ['tslint', 'tsserver']
let g:ale_linters['typescript'] = ['tsserver']

let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_fixers['typescript'] = ['prettier']
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_options = '--single-quote'
let g:ale_typescript_prettier_options = '--single-quote'
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_typescript_prettier_use_local_config = 1
" }}}

" clever-f {{{
Plug 'rhysd/clever-f.vim'
let g:clever_f_smart_case = 1
let g:clever_f_use_migemo = 1
let g:clever_f_fix_key_direction = 0
let g:clever_f_chars_match_any_signs = ''
" }}}

" incsearch.vim {{{
Plug 'haya14busa/incsearch.vim'

" Basic keymap
nmap /  <Plug>(incsearch-forward)
nmap ?  <Plug>(incsearch-backward)
nmap g/ <Plug>(incsearch-stay)

" Turn hlsearch off automatically
set hlsearch
let g:incsearch#auto_nohlsearch = 1
nmap n  <Plug>(incsearch-nohl-n)
nmap N  <Plug>(incsearch-nohl-N)
nmap *  <Plug>(incsearch-nohl-*)
nmap #  <Plug>(incsearch-nohl-#)
nmap g* <Plug>(incsearch-nohl-g*)
nmap g# <Plug>(incsearch-nohl-g#)
" }}}

" selection {{{
Plug 'tpope/vim-surround'
xmap s <Plug>VSurround

Plug 'terryma/vim-expand-region'
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
" }}}

" vim-operator-* {{{
Plug 'kana/vim-operator-user'

Plug 'emonkak/vim-operator-sort'
Plug 'kana/vim-operator-replace'

map R  <Plug>(operator-replace)
map M  <Plug>(operator-sort)
"}}}

" 囲み系補完 {{{
" Plug 'kana/vim-smartinput'
Plug 'tpope/vim-endwise'
Plug 'Raimondi/delimitMate'
let delimitMate_expand_space = 1
let delimitMate_expand_cr = 1
let delimitMate_matchpairs = '(:),{:}'
au FileType html let b:delimitMate_matchpairs = '(:),[:],{:},<:>'
" }}}

" Git {{{
" Plug 'tpope/vim-fugitive', { 'on': [
"   \ 'Gcd', 'Glcd', 'Gadd', 'Gblame', 'Gcommit',
"   \ 'Gdiff', 'Gedit', 'Glog', 'Gstatus', 'Gwrite' ] }
Plug 'tpope/vim-fugitive'
nnoremap <Leader>c :<C-u>Gcd<CR>
nnoremap <Leader>l :<C-u>Glcd<CR>
" }}}

" vim-smartword {{{
Plug 'kana/vim-smartword'
nmap w <Plug>(smartword-w)
nmap b <Plug>(smartword-b)
nmap e <Plug>(smartword-e)
" }}}

" switch.vim {{{
" 似たような表現を切り替える(true <=> false, if <=> elseif など)
Plug 'AndrewRadev/switch.vim'
nnoremap <bar> :<C-u>Switch<CR>
" }}}

" Colorscheme {{{
Plug 'NLKNguyen/papercolor-theme'
" }}}
