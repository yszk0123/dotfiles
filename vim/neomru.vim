Plug 'Shougo/neomru.vim'
let g:neomru#file_mru_path = $HOME . '/vimfiles/.cache/neomru/file'
let g:neomru#directory_mru_path = $HOME . '/vimfiles/.cache/neomru/directory'

"最近開いたファイル履歴の保存数
let g:neomru#file_mru_limit = 1000
let g:neomru#directory_mru_limit = 1000
"file_mruの表示フォーマットを指定。空にすると表示スピードが高速化される
let g:neomru#filename_format = ''
let g:neomru#time_format = ''
" 履歴アイテムのリンク切れを行う
let g:neomru#do_validate = 1
" call unite#custom#source('neomru', 'max_candidates', 50)

"最近使用したファイル一覧
nnoremap <silent> [util]m :<C-u>Unite -buffer-name=files neomru/file<CR>
"最近使用したディレクトリ
nnoremap <silent> [util]d :<C-u>Unite -buffer-name=files neomru/directory<CR>
nnoremap <silent> [util]D :<C-u>Unite -buffer-name=files -default-action=lcd neomru/directory<CR>
