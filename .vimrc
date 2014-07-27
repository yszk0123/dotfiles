" ==============================================================================
" Vim 設定ファイル
" ==============================================================================

" set encoding and current directory
if has('gui_running') && !has('unix')
  " CAUTION: エンコーディングは最初に設定すること
  set encoding=utf-8
  scriptencoding cp932
endif

" NeoBundle準備
"filetype off
if has('vim_starting')
  set nocompatible
  set runtimepath+=$VIM/bundle/neobundle.vim/
  set runtimepath+=$HOME/dotfiles/
endif
call neobundle#rc(expand($VIM . '/bundle/'))
" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" GUI,非GUIで共用のプラグイン
runtime define-prefix.vim
runtime! vimrc-common/*.vim

" GUI限定のプラグイン
if has('gui')
  NeoBundle 'Shougo/vimproc.vim', {
    \ 'build' : {
    \     'windows' : 'make -f make_mingw32.mak',
    \     'cygwin' : 'make -f make_cygwin.mak',
    \     'mac' : 'make -f make_mac.mak',
    \     'unix' : 'make -f make_unix.mak',
    \    },
    \ }
  runtime vimrc-gui/plugins.vim
  runtime vimrc-gui/unite.vim
  " source vimrc-gui/neocomplete.vim
  if exists('g:use_ycm')
    runtime vimrc-gui/you-complete-me.vim
  endif
endif

filetype plugin indent on
syntax on
NeoBundleCheck

" cd $HOME
