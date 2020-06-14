" Vim {{{
Plug 'artnez/vim-wipeout'
Plug 'bling/vim-airline'
Plug 'christoomey/vim-tmux-navigator'
Plug 'thinca/vim-qfreplace'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'vim-scripts/gitignore'
" }}}

" fzf {{{
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" }}}

" JavaScript {{{
Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
Plug 'posva/vim-vue', { 'for': 'vue' }
" }}}

" TypeScript {{{
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
" }}}

" Python {{{
Plug 'Vimjas/vim-python-pep8-indent', { 'for': 'python' }
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

" switch: 似たような表現を切り替える(true <=> false, if <=> elseif など) {{{
Plug 'AndrewRadev/switch.vim'
nnoremap <bar> :<C-u>Switch<CR>
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

" VimFiler {{{
Plug 'Shougo/vimfiler', { 'on': ['VimFilerBufferDir', 'VimFilerCurrentDir'] }
let g:vimfiler_safe_mode_by_default = 0
nnoremap <Leader>vf :<C-u>VimFilerBufferDir<CR>
nnoremap <Leader>vF :<C-u>VimFilerCurrentDir<CR>
" }}}

" Colorscheme {{{
Plug 'NLKNguyen/papercolor-theme'
" }}}

" vim-markdown {{{
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
" }}}

" vim-smartword {{{
Plug 'kana/vim-smartword'
nmap w <Plug>(smartword-w)
nmap b <Plug>(smartword-b)
nmap e <Plug>(smartword-e)
" }}}

if has('mac')
  Plug 'junegunn/vim-xmark', { 'do': 'make' }
end

if executable('ag')
  Plug 'rking/ag.vim', { 'on': ['Ag', 'AgFile', 'AgBuffer', 'AgAdd', 'AgHelp', 'AgFromSearch'] }
endif
