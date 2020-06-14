" CAUTION: キーマップ "[util]s"をctrlpに割り当てる
"  cf.
"    title:VimのUniteプラグインでファイル、バッファ、ブックマーク管理 | karakaram-blog
"    url: http://www.karakaram.com/unite

Plug 'Shougo/unite.vim'
Plug 'Shougo/neoinclude.vim'

" data_directory
let g:unite_data_directory = $HOME . '/vimfiles/.unite'

"unite general settings {{{
"インサートモードで開始
let g:unite_enable_start_insert = 1
let g:unite_enable_short_source_names = 1
" 大文字小文字を区別しない
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1
let g:unite_cursor_line_time = '0.15'
let g:unite_update_time = 780
"}}}

let s:ignores = [''] + map([
  \ '.hg', '.svn', '.git', '.bzr',
  \ 'bower_components', 'node_modules',
  \ 'log', 'vendor', 'tmp', 'backup', 'dist', 'dest', 'build',
  \ 'coverage', 'images', 'assets'
  \ ], '"\"" . v:val . "\""')

let g:unite_source_grep_default_opts = '-inH ' .
  \ join(s:ignores, ' --exclude-dir=')

" unite grep に ag(The Silver Searcher) を使う {{{
if executable('ag')
  " grep設定
  " Use ag in unite grep source.
  let g:unite_source_grep_command = 'ag'
  " let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_default_opts =
    \ '-i --vimgrep --line-numbers --nocolor --nogroup --hidden ' .
    \ join(s:ignores, ' --ignore ')
  let g:unite_source_grep_recursive_opt = ''
  let g:unite_source_grep_max_candidates = 100

  let g:unite_source_rec_async_command =
    \ split(
    \   'ag --follow --nocolor --nogroup --hidden -g ' .
    \   join(s:ignores, ' --ignore '),
    \   ' '
    \ )
endif

" cf. [Vim - file_rec/asyncとfile_rec/gitを自動的に切り換える - Qiita](http://qiita.com/yuku_t/items/9263e6d9105ba972aea8)
function! s:uniteFileRecAsyncOrGit()
  if isdirectory(getcwd()."/.git")
    Unite -buffer-name=files file_rec/git:--cached:--others:--exclude-standard
  else
    Unite -buffer-name=files file_rec/async
  endif
endfunction

"サブディレクトリを含むプロジェクトディレクトリの全ファイル一覧
" nnoremap <silent> <C-p> :<C-u>call DispatchUniteFileRecAsyncOrGit()<CR>
nnoremap <silent> [util]r :<C-u>call <SID>uniteFileRecAsyncOrGit()<CR>
nnoremap <silent> [util]R :<C-u>UniteResume files<CR>
nnoremap <silent> [util]e :<C-u>Unite -buffer-name=files file_rec/async<CR>
"}}}

" キーマッピング {{{

autocmd BufEnter *
  \   if empty(&buftype)
  \|      nnoremap <buffer> <C-]> :<C-u>UniteWithCursorWord -immediately tag<CR>
  \|  endif

" 以下,UniteWithBufferDirだとうまくいかないケースがあるので
" expand()関数を利用して,カレントバッファのディレクトリを自分で取得する
" Windowsではパスの区切り文字が'\'なので,これも置き換えが必要
" if has('win32') ... endif
function! s:getbufdir()
  return expand('%:p:h:gs?[ :\\]?\\\\\\\0?')
endfunction

"現在開いているファイルのディレクトリ下のファイル一覧。
"開いていない場合はカレントディレクトリ
nnoremap <silent> [util]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> [util]F :<C-u>UniteWithCurrentDir -buffer-name=files file<CR>
"バッファ一覧
nnoremap <silent> [util]b :<C-u>Unite buffer<CR>
"バッファ一覧(選択モードでスタート)
nnoremap <silent> [util]B :<C-u>Unite -no-start-insert buffer<CR>
"タグ
nnoremap <silent> [util]t :<C-u>Unite tag<CR>
"タブページ一覧
nnoremap <silent> [util]T :<C-u>Unite tab<CR>

" grep検索
nnoremap <silent> [util]g :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
" grep検索(ファイル名のみ)
nnoremap <silent> [util]G :<C-u>Unite grep:.:"-l" -buffer-name=search-buffer<CR>
" カーソル位置の単語をgrep検索
nnoremap <silent> [util]* :<C-u>Unite grep:<C-r>=<SID>getbufdir()<CR> -buffer-name=search-buffer<CR><C-R><C-w>
nnoremap <silent> [util]+ :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-w>
" grep検索結果の再呼出
nnoremap <silent> [util]u :<C-u>UniteResume search-buffer<CR>
" 行検索
nnoremap <silent> [util]l :<C-u>Unite line -buffer-name=search-buffer<CR>

"uniteを開いている間のキーマッピング
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
  " Uniteキー設定の基準(例外有り)
  " 1. Unite操作を継続するものは入力モード+キー
  " 2. Unite操作を完了するもの(actionなど)はCtrl+キー

  " QまたはESCでuniteを終了
  nmap <buffer> Q      <Plug>(unite_all_exit)
  nmap <buffer> <ESC>  <Plug>(unite_exit)
  " 入力モードのとき↓でノーマルモードに移動
  imap <buffer> <Up>   <Plug>(unite_insert_leave)
  imap <buffer> <Down> <Plug>(unite_insert_leave)
  imap <buffer> jj     <Plug>(unite_insert_leave)
  imap <buffer> kk     <Plug>(unite_insert_leave)
  " TABで次の行を選択
  imap <buffer> <TAB>  <Plug>(unite_select_next_line)
  " 入力モードのときctrl+wでバックスラッシュも削除
  imap <buffer> <C-w>  <Plug>(unite_delete_backward_path)
  nmap <buffer> <Left> <Plug>(unite_delete_backward_path)
  nmap <buffer> h      <Plug>(unite_delete_backward_path)
  " 挿入モードのときPでオートプレビュー切替(pでプレビュー)
  nmap <buffer> P      <Plug>(unite_toggle_auto_preview)
  " 更新(キャッシュクリア)
  nmap <buffer> R   <Plug>(unite_redraw)
  " マークして次の候補の移動
  nmap <buffer> m      <Plug>(unite_toggle_mark_current_candidate)
  nmap <buffer> M      <Plug>(unite_toggle_mark_current_candidate_up)

  " replace/rename
  let unite = unite#get_current_unite()
  if unite.profile_name ==# 'search'
    nnoremap <silent><buffer><expr> r     unite#do_action('replace')
  else
    nnoremap <silent><buffer><expr> r     unite#do_action('rename')
  endif

  " open commands

  " ctrl+tで新しいタブに開く
  nnoremap <silent> <buffer> <expr> <C-t> unite#do_action('tabopen')
  inoremap <silent> <buffer> <expr> <C-t> unite#do_action('tabopen')
  " ctrl+sで縦に分割して開く
  nnoremap <silent> <buffer> <expr> <C-s> unite#do_action('split')
  inoremap <silent> <buffer> <expr> <C-s> unite#do_action('split')
  " ctrl+vで横に分割して開く
  nnoremap <silent> <buffer> <expr> <C-v> unite#do_action('vsplit')
  inoremap <silent> <buffer> <expr> <C-v> unite#do_action('vsplit')
  " ctrl+oでその場所に開く
  nnoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
  inoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
  " ctrl+cでcd
  nnoremap <silent> <buffer> <expr> <C-c> unite#do_action('cd')
  inoremap <silent> <buffer> <expr> <C-c> unite#do_action('cd')
  " ctrl+lでlcd
  nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('lcd')
  inoremap <silent> <buffer> <expr> <C-l> unite#do_action('lcd')
  " ctrl+vでその場所に開く
  " nnoremap <silent> <buffer> <expr> <C-v> unite#do_action('vimfiler')
  " inoremap <silent> <buffer> <expr> <C-v> unite#do_action('vimfiler')
endfunction"}}}
