" basic plugin {{{
" vim-javascript {{{
" NeoBundle 'taichouchou2/vim-javascript'
NeoBundle 'pangloss/vim-javascript'
let javascript_ignore_javaScriptdoc = 1
" let g:javascript_conceal = 1
" }}}

" NeoBundle 'jelera/vim-javascript-syntax'
" }}}

" integration with command line tools {{{
" tern_for_vim {{{
" NeoBundle 'marijnh/tern_for_vim'
" }}}

" javascript-libraries-syntax {{{
" javascriptの主要なライブラリの構文定義
NeoBundle 'othree/javascript-libraries-syntax.vim'

" comma separated list
"   Support libs id:
"   * jQuery: jquery
"   * underscore.js: underscore
"   * Lo-Dash: underscore
"   * Backbone.js: backbone
"   * prelude.ls: prelude
"   * AngularJS: angularjs
"   * AngularUI: angularui
"   * RequireJS: requirejs
"   * Sugar.js: sugar
"   * Jasmine: jasmine
let g:used_javascript_libs = 'underscore'
" }}}

" jshint {{{
NeoBundle 'Shutnik/jshint2.vim'
" if has('win32')
"   let g:jshint2_command='D:\common\node_modules\.bin\jshint.cmd'
" endif
let g:jshint2_read=0
let g:jshint2_save=0
let g:jshint2_close=1
function! s:jshint_toggle(type)
  if a:type is 'read'
    let g:jshint2_read=!g:jshint2_read
    echo 'jshint read is ' . g:jshint2_read
  else
    let g:jshint2_save=!g:jshint2_save
    echo 'jshint save is ' . g:jshint2_save
  endif
endfunction

" jshint2.vim checks existence of a JSHint command by calling exists(':JSHint')
" so if we define a new command starts with JSHint, this plugin wouldn't be
" loaded.
command! MyJSHintToggleSave call <SID>jshint_toggle('save')
command! MyJSHintToggleRead call <SID>jshint_toggle('read')

nnoremap <silent> [jshint]h :JSHint<CR>
vnoremap <silent> [jshint]h :JSHint<CR>
nnoremap <silent> [jshint]s :<C-u>MyJSHintToggleSave<CR>
nnoremap <silent> [jshint]r :<C-u>MyJSHintToggleRead<CR>

nnoremap <silent> <F4> :JSHint<CR>
inoremap <silent> <F4> <C-O>:JSHint<CR>
vnoremap <silent> <F4> :JSHint<CR>

" show next jshint error
nnoremap <silent> <F2> :lnext<CR>
inoremap <silent> <F2> <C-O>:lnext<CR>
vnoremap <silent> <F2> :lnext<CR>

" show previous jshint error
nnoremap <silent> <F3> :lprevious<CR>
inoremap <silent> <F3> <C-O>:lprevious<CR>
vnoremap <silent> <F3> :lprevious<CR>
" }}}

" vim-jsbeautify {{{
" NeoBundle 'maksimr/vim-jsbeautify'
" autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" autocmd FileType css,stylus noremap <buffer> <c-f> :call CSSBeautify()<cr>
" }}}
" }}}

" framework specific plugins {{{
" vim-jsx {{{
NeoBundle 'mxw/vim-jsx'
" }}}
" }}}

