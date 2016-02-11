" basic plugin {{{
" vim-javascript {{{
" NeoBundle 'taichouchou2/vim-javascript'
NeoBundle 'pangloss/vim-javascript'
let javascript_ignore_javaScriptdoc = 1
" let g:javascript_conceal = 1
" }}}
" vim-js-indent {{{
" NeoBundle 'jason0x43/vim-js-indent'
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

" vim-jsbeautify {{{
" NeoBundle 'maksimr/vim-jsbeautify'
" autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" autocmd FileType css,stylus noremap <buffer> <c-f> :call CSSBeautify()<cr>
" }}}
" }}}