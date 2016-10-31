set nospell
" " Enable spellchecking
" if has('patch-7.4.089')
"   set spelllang=en,cjk
"   set spell
"   " set nospell
"   " autocmd FileType markdown setlocal spell
"   " autocmd FileType gitcommit setlocal spell
" else
"   set nospell
"   autocmd FileType markdown setlocal spell
"   autocmd FileType gitcommit setlocal spell
" endif

" neomake {{{
Plug 'neomake/neomake', { 'for': 'javascript' }
Plug 'benjie/neomake-local-eslint.vim', { 'for': 'javascript' }

let g:neomake_javascript_enabled_makers = ['flow']
" let g:neomake_javascript_enabled_makers = ['eslint_d']
" let g:neomake_jsx_enabled_makers = ['flow']

let g:neomake_error_sign = {'text': '>>', 'texthl': 'NeomakeErrorSign'}
let g:neomake_warning_sign = {'text': '>>',  'texthl': 'NeomakeWarningSign'}

augroup neomake_run
  " 保存時にlint
  autocmd! BufWritePost * Neomake

  " インサートモードを抜けた時もlint
  autocmd! InsertLeave *.js Neomake

  " vim終了時にeslint_dを終了
  autocmd! VimLeave *.js  !eslint_d stop
augroup END

" let g:neomake_javascript_enabled_makers = ['eslint']
" let s:eslint_path = system('PATH=$(yarn bin):$PATH && which eslint')
" let b:neomake_javascript_eslint_exe = substitute(s:eslint_path, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')

" For debug {{{
" let g:neomake_verbose=3
" let g:neomake_logfile='/tmp/error.log'
" }}}
" }}}
