﻿" ==============================================================================
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

" NeoBundle準備
"filetype off
if has('vim_starting')
  if &compatible
    set nocompatible
  endif
  if !g:my_local_mode && (has('win32') || has('win64'))
    set runtimepath+=$VIM/bundle/neobundle.vim/
  else
    set runtimepath+=$HOME/.vim/bundle/neobundle.vim/
  endif
  set runtimepath+=$HOME/dotfiles/
endif
if !g:my_local_mode && (has('win32') || has('win64'))
  call neobundle#begin(expand($VIM . '/bundle/'))
else
  call neobundle#begin(expand($HOME . '/.vim/bundle/'))
endif
" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" キーマップ用のプレフィックス定義
runtime define-prefix.vim

NeoBundle 'Shougo/vimproc.vim', {
  \ 'build' : {
  \     'windows' : 'make -f make_mingw32.mak',
  \     'cygwin' : 'make -f make_cygwin.mak',
  \     'mac' : 'make -f make_mac.mak',
  \     'unix' : 'make -f make_unix.mak',
  \    },
  \ }
runtime vimrc-common/commands.vim
runtime vimrc-common/abbreviations.vim
runtime vimrc-common/filetype.vim
runtime vimrc-common/plugins.vim
runtime vimrc-common/remap.vim
runtime vimrc-common/settings.vim
runtime vimrc-common/javascript.vim
runtime vimrc-gui/unite.vim
runtime vimrc-gui/ruby.vim
if g:my_local_mode && has('gui_running')
  runtime vimrc-gui/neocomplete.vim
  runtime vimrc-gui/typescript.vim
  " runtime vimrc-gui/you-complete-me.vim
endif

call neobundle#end()

filetype plugin indent on
syntax on
NeoBundleCheck

if !has('vim_starting')
  " Call on_source hook when reloading .vimrc.
  call neobundle#call_hook('on_source')
endif
