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

" キーマップ用のプレフィックス定義
runtime define-prefix.vim

" GUI,非GUIで共用のプラグイン
runtime vimrc-common/commands.vim
runtime vimrc-common/abbreviations.vim
runtime vimrc-common/filetype.vim
runtime vimrc-common/plugins.vim
runtime vimrc-common/remap.vim
runtime vimrc-common/settings.vim

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
  runtime vimrc-gui/neocomplete.vim
  if exists('g:use_ycm')
    runtime vimrc-gui/you-complete-me.vim
  endif
endif

filetype plugin indent on
syntax on
NeoBundleCheck

" cd $HOME
