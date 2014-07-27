" cd, lcdのショートカット版

let s:aliases = {
  \ 'a':   'D:/work/AutoHotkey',
  \ 'c':   'D:/work/ChromeExtensions',
  \ 'f':   'D:/app/Filtered',
  \ 'fc':  'D:/app/Filtered/client',
  \ 'fs':  'D:/app/Filtered/server',
  \ 'j':   'D:/work/JavaScript',
  \ 'jm':  'D:/work/JavaScript/myke',
  \ 'jr':  'D:/work/JavaScript/relay',
  \ 's':   'D:/app/share',
  \ 'ss':  'D:/app/share/server',
  \ 'ssn': 'D:/app/share/server/node_modules',
  \ 'tn':  'C:/Users/yuji/tools/nodist',
  \ 'tnn': 'C:/Users/yuji/tools/nodist/bin/node_modules',
  \ 'tv':  'C:/Users/yuji/tools/vim',
  \ 'y':   'D:/app/ysk',
  \ 'yc':  'D:/app/ysk/common',
  \ 'yca': 'D:/app/ysk/common-angular',
}

function! s:concat(cmd, alias, path)
  execute a:cmd . ' ' . s:aliases[a:alias] . '/' . a:path
endfunction

command! CD -nargs=2 <SID>concat('cd', <f-args>)
command! LCD -nargs=2 <SID>concat('lcd', <f-args>)
command! E -nargs=2 <SID>concat('edit', <f-args>)
command! E -nargs=2 <SID>concat('edit', <f-args>)
nnoremap [util]cd :<C-u>CD<Space>
nnoremap [util]lcd :<C-u>CD<Space>
