if has('vim_starting')
  if &compatible
    set nocompatible
  endif
  set runtimepath+=$HOME/dotfiles/
endif

" Check if we're running Neovim
if has('nvim')
  " Use modern Lua configuration for Neovim
  lua dofile(vim.fn.stdpath('config') .. '/lua/init.lua')
else
  " Fall back to legacy Vim configuration
  filetype off
  syntax off

  runtime vim/filetype.vim
  runtime vim/plugins.vim
  runtime vim/keymaps.vim
  runtime vim/settings.vim
  runtime vim/commands.vim

  filetype plugin indent on
  syntax on
endif
