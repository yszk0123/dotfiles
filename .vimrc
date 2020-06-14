" Set encoding and current directory
if has('gui_running') && !has('unix')
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

filetype plugin indent on
syntax on
colorscheme PaperColor
set background=dark
