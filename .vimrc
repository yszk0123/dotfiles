" ==============================================================================
" Vim 設定ファイル
" ==============================================================================

" set encoding and current directory
if has('gui_running') && !has('unix')
  " CAUTION: エンコーディングは最初に設定すること
  set encoding=utf-8
  scriptencoding cp932
endif

if has('vim_starting')
  if &compatible
    set nocompatible
  endif
  set runtimepath+=$HOME/dotfiles/
endif
filetype off
syntax off

runtime vim/filetype.vim
runtime vim/plugins.vim
runtime vim/keymaps.vim
runtime vim/settings.vim
runtime vim/commands.vim

" syntax and colorscheme {{{
filetype plugin indent on
syntax on

colorscheme PaperColor
set background=dark
" }}}
