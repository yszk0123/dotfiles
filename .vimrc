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

if has('vim_starting')
  if &compatible
    set nocompatible
  endif
  set runtimepath+=$HOME/dotfiles/
endif
filetype off
syntax off

" color/keyprefixの設定が確実に反映されるように先に設定 {{{
" Color {{{
" Terminal
set t_Co=256
" }}}

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
