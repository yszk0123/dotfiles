" Tern for vim {{{
NeoBundle 'marijnh/tern_for_vim'
let s:bin_path = expand($HOME . '/.nvm/versions/node/v4.1.0/bin/')
let g:tern#command = [s:bin_path . 'node', s:bin_path . 'tern', '--no-port-file']
" }}}
