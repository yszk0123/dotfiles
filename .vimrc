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

" NeoBundle準備
"filetype off
if has('vim_starting')
  if &compatible
    set nocompatible
  endif
  set runtimepath+=$HOME/.vim/bundle/neobundle.vim/
  set runtimepath+=$HOME/dotfiles/
endif
call neobundle#begin(expand($HOME . '/.vim/bundle/'))
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

" 色関係の設定が確実に反映されるように
" 他のファイルより先に読み込んでおく
runtime lib/color.vim

runtime lib/javascript.vim
runtime lib/unite.vim
runtime lib/ruby.vim
" runtime lib/latex.vim
if g:my_local_mode && has('gui_running')
  runtime lib/neocomplete.vim
  runtime lib/typescript.vim
  " runtime lib/you-complete-me.vim
endif
runtime lib/commands.vim
runtime lib/filetype.vim
runtime lib/plugins.vim
runtime lib/remap.vim
runtime lib/settings.vim
runtime lib/abbreviations.vim

call neobundle#end()

filetype plugin indent on
syntax on
NeoBundleCheck

if !has('vim_starting')
  " Call on_source hook when reloading .vimrc.
  call neobundle#call_hook('on_source')
endif
