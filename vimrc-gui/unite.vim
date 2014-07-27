" CAUTION: キーマップ "[unite]s"をctrlpに割り当てる
"  ref:
"    title:VimのUniteプラグインでファイル、バッファ、ブックマーク管理 | karakaram-blog
"    url: http://www.karakaram.com/unite

" NeoBundle 'Shougo/unite-outline'
" NeoBundle 'Shougo/unite-session'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'

" data_directory
if has('win32')
  let g:unite_data_directory = $HOME . '/vimfiles/.unite'
  let g:neomru#file_mru_path = $HOME . '/vimfiles/.cache/neomru/file'
  let g:neomru#directory_mru_path = $HOME . '/vimfiles/.cache/neomru/directory'
" elseif  has('macunix')
"   let g:unite_data_directory = '/Volumes/RamDisk/.unite'
" else
"   let g:unite_data_directory = '/mnt/ramdisk/.unite'
endif

"unite prefix key.
nnoremap [unite] <Nop>
nmap s [unite]
nnoremap [unite-ex] <Nop>
nmap sx [unite-ex]

"unite general settings {{{
"インサートモードで開始
let g:unite_enable_start_insert = 1
let g:unite_enable_short_source_names = 1
" 大文字小文字を区別しない
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1
"画面分割の設定(右側or下側)
let g:unite_split_rule = 'botright'
"
let g:unite_cursor_line_time = '0.20'
let g:unite_update_time = 740

"最近開いたファイル履歴の保存数
let g:neomru#file_mru_limit = 1000
let g:neomru#directory_mru_limit = 1000
"file_mruの表示フォーマットを指定。空にすると表示スピードが高速化される
let g:neomru#filename_format = ''
let g:neomru#time_format = ''
" 履歴アイテムのリンク切れを行う
let g:neomru#do_validate = 1
call unite#custom#source('neomru', 'max_candidates', 50)
"}}}

" call unite#filters#matcher_default#use(['matcher_fuzzy'])

" unite grep に ag(The Silver Searcher) を使う {{{
if executable('ag')
  " file_rec設定
  let g:unite_source_rec_async_command='ag --nocolor --nogroup --ignore ".hg" --ignore ".svn" --ignore ".git" --ignore "bower_components" --ignore "components" --ignore "backup" --ignore "preprocess" --ignore "dist" --ignore "dest" --ignore "build" --ignore "lib" --ignore ".bzr" --hidden -g ""'
  " call unite#custom_source('file_rec', 'ignore_pattern', (unite#sources#file_rec#define()[0]['ignore_pattern']) . '\|\<target\>')

  " grep設定
  " Use ag in unite grep source.
  let g:unite_source_grep_command = 'ag'
  " let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_default_opts =
    \ '--line-numbers --nocolor --nogroup --hidden ' .
    \ '--ignore ".hg" --ignore ".svn" --ignore ".git" ' .
    \ '--ignore "bower_components" --ignore "components" ' .
    \ '--ignore "backup" --ignore "preprocess" --ignore "dist" --ignore "dest" --ignore "build" --ignore "lib" --ignore ".bzr"'
  let g:unite_source_grep_recursive_opt = ''
  let g:unite_source_grep_max_candidates = 100
endif
"}}}

" " TODO: ショートカット用ソースを作成 {{{
" let g:my_shortcut = {
"       \ }
" map(g:my_shortcut, '{
"       \   "word": v:key,
"       \   "source": "shortcut",
"       \   "kind": "",
"       \ }')
" let s:unite_source = {
"       \ 'name': 'shortcut'
"       \ }
" function! s:unite_source.gather_candidates(args, context)
"   return
" endfunction
" call unite#define_source(s:unite_source)
" unlet s:unite_source
" "}}}

" キーマッピング {{{
" 以下,UniteWithBufferDirだとうまくいかないケースがあるので
" expand()関数を利用して,カレントバッファのディレクトリを自分で取得する
" Windowsではパスの区切り文字が'\'なので,これも置き換えが必要
" if has('win32') ... endif
function! s:getbufdir()
  return expand('%:p:h:gs?[ :\\]?\\\\\\\0?')
endfunction

" 履歴アイテムのリンク切れ確認の切り替え
" TODO: 旧コード(neobundle 5.1)からneomru用に書き換え
" function! s:toggleUniteMruValidate()
"   let g:unite_source_mru_do_validate = !g:unite_source_mru_do_validate
"   echo 'toggled. current state is ' . g:unite_source_mru_do_validate
" endfunction
" nnoremap [unite]t :<C-u>call <SID>toggleUniteMruValidate()<CR>

"現在開いているファイルのディレクトリ下のファイル一覧。
"開いていない場合はカレントディレクトリ
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> [unite]F :<C-u>UniteWithCurrentDir -buffer-name=files file<CR>
"バッファ一覧
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
"バッファ一覧(選択モードでスタート)
nnoremap <silent> [unite]B :<C-u>Unite -no-start-insert buffer<CR>
"最近使用したファイル一覧
nnoremap <silent> [unite]m :<C-u>Unite -buffer-name=files neomru/file<CR>
"最近使用したディレクトリ
nnoremap <silent> [unite]d :<C-u>Unite -buffer-name=files neomru/directory<CR>
nnoremap <silent> [unite]D :<C-u>Unite -buffer-name=files -default-action=lcd neomru/directory<CR>

"ブックマーク一覧
nnoremap <silent> [unite]c :<C-u>Unite bookmark<CR>
"ブックマーク一覧(選択モードでスタート)
nnoremap <silent> [unite]C :<C-u>Unite -no-start-insert bookmark<CR>
"ブックマークに追加
" nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>

" grep検索
nnoremap <silent> [unite]g :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
" grep検索(ファイル名のみ)
nnoremap <silent> [unite]G :<C-u>Unite grep:.:"-l" -buffer-name=search-buffer<CR>
" カーソル位置の単語をgrep検索
nnoremap <silent> [unite]* :<C-u>Unite grep:<C-r>=<SID>getbufdir()<CR> -buffer-name=search-buffer<CR><C-R><C-w>
nnoremap <silent> [unite]+ :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-w>
" grep検索結果の再呼出
nnoremap <silent> [unite]u :<C-u>UniteResume search-buffer<CR>
" 行検索
nnoremap <silent> [unite]l :<C-u>Unite line -buffer-name=search-buffer<CR>

"プロジェクト
nnoremap <silent> [unite]P :<C-u>Unite -buffer-name=project file_rec/async
  \ -no-quit -vertical -winwidth=26 -wrap -long-source-names<CR>
nnoremap <silent> [unite]p :<C-u>Unite -buffer-name=project file_rec/async
  \ -no-quit -vertical -winwidth=26 -wrap -long-source-names -resume<CR>
" nnoremap <silent> [unite]F :<C-u>Unite -buffer-name=files file<CR>
"サブディレクトリを含むプロジェクトディレクトリの全ファイル一覧
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=files file_rec/async:!<CR>
nnoremap <silent> [unite]R :<C-u>Unite -buffer-name=files file_rec:!<CR>

" 色々
nnoremap <silent> [unite]a :<C-u>UniteWithCurrentDir
        \ -buffer-name=files buffer bookmark file<CR>
" 色々ジャンプ 
nnoremap <silent> [unite]j :<C-u>Unite
        \ -buffer-name=files -no-split
        \ jump_point file_point buffer_tab
        \ file_rec:! file file/new<CR>

"ソース一覧
nnoremap <silent> [unite-ex]so :<C-u>Unite source<CR>
"ショートカット一覧
nnoremap <silent> [unite-ex]sh :<C-u>Unite shortcut<CR>
"レジスタ一覧
nnoremap <silent> [unite-ex]re :<C-u>Unite -buffer-name=register register<CR>
"マッピング一覧
nnoremap <silent> [unite-ex]ma :<C-u>Unite mapping<CR>
"メッセージ一覧
nnoremap <silent> [unite-ex]me :<C-u>Unite output:message<CR>
" "セッション一覧
" nnoremap <silent> [unite-ex]se :<C-u>Unite session<CR>

"見出し一覧
" nnoremap <silent> [unite]o :<C-u>Unite outline<CR>
"見出し一覧(分割表示)
" nnoremap <silent> [unite]vo :<C-u>Unite -vertical -winwidth=40 outline<CR>
"おまけ(カレントディレクトリ内のファイル一覧(分割表示))
" nnoremap <silent> [unite]vf :<C-u>vsplit<CR><C-w><C-w>:e %:h<CR>
" }}}

"uniteを開いている間のキーマッピング
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
  " Uniteキー設定の基準(例外有り)
  " 1. Unite操作を継続するものは入力モード+キー
  " 2. Unite操作を完了するもの(actionなど)はCtrl+キー

  "QまたはESCでuniteを終了
  nmap <buffer> Q      <Plug>(unite_all_exit)
  nmap <buffer> <ESC>  <Plug>(unite_exit)
  " "入力モードのとき↓でノーマルモードに移動
  imap <buffer> <Up>   <Plug>(unite_insert_leave)
  imap <buffer> <Down> <Plug>(unite_insert_leave)
  imap <buffer> jj     <Plug>(unite_insert_leave)
  "入力モードのときctrl+wでバックスラッシュも削除
  imap <buffer> <C-w>  <Plug>(unite_delete_backward_path)
  nmap <buffer> <Left> <Plug>(unite_delete_backward_path)
  nmap <buffer> h      <Plug>(unite_delete_backward_path)
  " 挿入モードのときPでオートプレビュー切替(pでプレビュー)
  nmap <buffer> P      <Plug>(unite_toggle_auto_preview)
  " 更新(キャッシュクリア)
  nmap <buffer> <F5>   <Plug>(unite_redraw)
  " マークして次の候補の移動
  nmap <buffer> m      <Plug>(unite_toggle_mark_current_candidate)
  nmap <buffer> M      <Plug>(unite_toggle_mark_current_candidate_up)

  "ctrl+tで新しいタブに開く
  nnoremap <silent> <buffer> <expr> <C-t> unite#do_action('tabnew_lcd')
  inoremap <silent> <buffer> <expr> <C-t> unite#do_action('tabnew_lcd')
  "ctrl+sで縦に分割して開く
  nnoremap <silent> <buffer> <expr> <C-s> unite#do_action('split')
  inoremap <silent> <buffer> <expr> <C-s> unite#do_action('split')
  "ctrl+vで横に分割して開く
  nnoremap <silent> <buffer> <expr> <C-v> unite#do_action('vsplit')
  inoremap <silent> <buffer> <expr> <C-v> unite#do_action('vsplit')
  "ctrl+oでその場所に開く
  nnoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
  inoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
  "ctrl+vでその場所に開く
  nnoremap <silent> <buffer> <expr> <C-v> unite#do_action('vimfiler')
  inoremap <silent> <buffer> <expr> <C-v> unite#do_action('vimfiler')
  "ctrl+cでcd
  nnoremap <silent> <buffer> <expr> <C-c> unite#do_action('cd')
  inoremap <silent> <buffer> <expr> <C-c> unite#do_action('cd')
  "ctrl+lでlcd
  nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('lcd')
  inoremap <silent> <buffer> <expr> <C-l> unite#do_action('lcd')
endfunction"}}}
