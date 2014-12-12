" vim-javascript {{{
" NeoBundle 'taichouchou2/vim-javascript'
NeoBundle 'pangloss/vim-javascript'
let javascript_ignore_javaScriptdoc = 1
" let g:javascript_conceal = 1
" }}}

" vim-jsx {{{
NeoBundle 'mxw/vim-jsx'
" }}}

" NeoBundle 'jelera/vim-javascript-syntax'

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
let jshint2_read=0
let jshint2_save=1
let jshint2_close=1
function! s:jshint_toggle(type)
  if a:type is 'read'
    let g:jshint2_read=!g:jshint2_read
    echo 'jshint read is ' . jshint2_read
  else
    let g:jshint2_save=!g:jshint2_save
    echo 'jshint save is ' . g:jshint2_save
  endif
endfunction
command! JSHintToggleSave call <SID>jshint_toggle('save')
command! JSHintToggleRead call <SID>jshint_toggle('read')
nnoremap [util]hh :<C-u>JSHint<CR>
nnoremap [util]hs :<C-u>JSHintToggleSave<CR>
nnoremap [util]hr :<C-u>JSHintToggleRead<CR>
" }}}

" vim-jsbeautify {{{
NeoBundle 'maksimr/vim-jsbeautify'
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
autocmd FileType css,stylus noremap <buffer> <c-f> :call CSSBeautify()<cr>
" }}}

