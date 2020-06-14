" ==============================================================================
" Vim 設定ファイル
" ==============================================================================

" set encoding and current directory
if has('gui_running') && !has('unix')
  " CAUTION: エンコーディングは最初に設定すること
  set encoding=utf-8
  scriptencoding cp932
endif

" my_local_mode~というファイルの存在有無により
" 自分用のPC限定の設定を行うかどうかを決める
" 無: 仕事用など, 有: 自分用のPC
let g:my_local_mode = !empty(glob($HOME . '/dotfiles/my_local_mode*'))

"filetype off
if has('vim_starting')
  if &compatible
    set nocompatible
  endif
  set runtimepath+=$HOME/dotfiles/
endif
filetype off
syntax off

" Automatic installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'Shougo/vimproc.vim', { 'do': 'make' }

" color/keyprefixの設定が確実に反映されるように先に設定 {{{
" Color {{{
" Terminal
set t_Co=256
" }}}

" Prefix for keymaps {{{
let mapleader = "\<Space>"

nnoremap <Leader> <Nop>
vnoremap <Leader> <Nop>

nnoremap [fzf] <Nop>
nmap s [fzf]
" }}}
" }}}

let s:libs = split(
  \ 'filetype plugins keymaps settings abbreviations', ' ')
for lib in s:libs
  execute 'runtime vim/' . lib . '.vim'
endfor

" fzf {{{
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

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)
" }}}

" Commands {{{
" Rename
command! -nargs=1 -complete=file Rename f <args>|write|call delete(expand('#'))
" }}}

call plug#end()

" syntax and colorscheme {{{
filetype plugin indent on
syntax on

colorscheme PaperColor
set background=dark
" }}}
