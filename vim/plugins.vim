Plug 'artnez/vim-wipeout'
Plug 'bling/vim-airline'
Plug 'christoomey/vim-tmux-navigator'
Plug 'thinca/vim-qfreplace'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'vim-scripts/gitignore'

" clever-f {{{
Plug 'rhysd/clever-f.vim'
let g:clever_f_smart_case = 1
let g:clever_f_use_migemo = 1
let g:clever_f_fix_key_direction = 0
let g:clever_f_chars_match_any_signs = ''
"}}}

" " splitjoin: 一行コード <=> 複数行コードの相互変換 {{{
" Plug 'AndrewRadev/splitjoin.vim'
" nnoremap <Leader>j :<C-u>SplitjoinJoin<CR>
" nnoremap <Leader>J :<C-u>SplitjoinSplit<CR>
" " }}}

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
au FileType coffee let delimitMate_nesting_quotes = ['"','`']
" }}}

" git {{{
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

" UltiSnips {{{
Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger = "<c-i>"
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsListSnippets = "<c-tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsSnippetDirectories = [$HOME . '/dotfiles/UltiSnips']
" }}}

" VimFiler {{{
Plug 'Shougo/vimfiler', { 'on': ['VimFilerBufferDir', 'VimFilerCurrentDir'] }
let g:vimfiler_safe_mode_by_default = 0
nnoremap <Leader>vf :<C-u>VimFilerBufferDir<CR>
nnoremap <Leader>vF :<C-u>VimFilerCurrentDir<CR>
" }}}

" Colorscheme {{{
" Plug 'wimstefan/Lightning'
" Plug 'reedes/vim-colors-pencil'
" Plug 'w0ng/vim-hybrid'
" Plug 'kristijanhusak/vim-hybrid-material'
Plug 'NLKNguyen/papercolor-theme'
" }}}

if has('mac')
  Plug 'junegunn/vim-xmark', { 'do': 'make' }
end

if executable('ag')
  Plug 'rking/ag.vim', { 'on': ['Ag', 'AgFile', 'AgBuffer', 'AgAdd', 'AgHelp', 'AgFromSearch'] }
endif
