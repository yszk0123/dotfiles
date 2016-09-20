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

call plug#begin('~/.vim/plugged')

Plug 'Shougo/vimproc.vim', { 'do': 'make' }

" キープレフィックス・色関係の設定が確実に反映されるように
" lib/define-prefix.vimとlib/color.vimは早めにロードしておく
if !empty($ADDITIONAL_VIM_PLUGINS)
  let s:libs = split(
    \ 'define-prefix color ' .
    \ 'javascript typescript ' .
    \ 'unite neomru syntastic ' .
    \ 'commands filetype additional-plugins plugins remap settings abbreviations lint', ' ')
  " \ 'you-complete-me ' .
  " \ 'neocomplete neosnippet neosnippet-snippets ' .
  " \ 'latex ruby ' .
else
  let s:libs = split(
    \ 'define-prefix color ' .
    \ 'javascript ' .
    \ 'unite neomru ' .
    \ 'commands filetype plugins remap settings abbreviations', ' ')
endif
for lib in s:libs
  execute 'runtime vim/' . lib . '.vim'
endfor

call plug#end()

" syntax and colorscheme {{{
filetype plugin indent on
syntax on

" colorscheme hybrid
" colorscheme hybrid_reverse
colorscheme PaperColor
set background=dark
" }}}
