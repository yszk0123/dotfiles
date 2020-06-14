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

" filetype {{{
au FileType yaml setlocal foldmethod=indent sw=2 sts=2 ts=2 et
" au FileType yaml normal zR
" au FileType yaml setlocal foldignore=
" au FileType yaml setlocal nowrap
" au FileType vim setlocal foldmethod=marker foldlevel=0
au FileType python setlocal foldmethod=indent sw=4 sts=4 ts=4 et
" テキストファイル/gitコミットで自動整形を行わない
au FileType text,gitcommit setlocal textwidth=0

au BufNewFile,BufRead *.jsx setlocal filetype=javascript
au BufNewFile,BufRead *.md setlocal filetype=markdown
au BufNewFile,BufRead *.{ts,tsx} setlocal filetype=typescript
au BufNewFile,BufRead Dockerfile.* setlocal filetype=dockerfile
au BufNewFile,BufRead *.vue setlocal filetype=vue
" }}}

let s:libs = split(
  \ 'plugins keymaps settings', ' ')
for lib in s:libs
  execute 'runtime vim/' . lib . '.vim'
endfor

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
