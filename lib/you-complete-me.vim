NeoBundleLazy 'Valloric/YouCompleteMe', { 'autoload': { 'filetypes': ['typescript'] } }
let g:ycm_server_log_level = 'warning'
" let g:ycm_allow_changing_updatetime = 0
let g:ycm_min_num_identifier_candidate_chars = 3
" let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_filetype_blacklist = {
  \ 'tagbar' : 1,
  \ 'qf' : 1,
  \ 'notes' : 1,
  \ 'markdown' : 1,
  \ 'unite' : 1,
  \ 'text' : 1,
  \ 'vimwiki' : 1,
  \ 'pandoc' : 1,
  \ 'story': 1,
  \}
