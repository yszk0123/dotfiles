" コマンド集

" CやJava形式のコメントを削除
function! s:remove_comments()
  " ブロックコメント削除
  silent! g/^\s*\v(\/\/|\/\*\*?|\*\s|\*$|\*\/)/d
  " 行末コメント削除
  silent! %s/\s*\/\/.*$//g
endfunction

command! RemoveComments call <SID>remove_comments()

