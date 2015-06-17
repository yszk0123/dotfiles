" ref: [Macのvim-latexの設定 - adragoonaの日記](http://adragoona.hatenablog.com/entry/2014/11/26/203044)
"   > uplatexでコンパイルする場合は、documentclassにオプションでuplatexをつけないと駄目な場合がある。
"   > 以下のようにdocumentclassを変更する。
"   > \documentclass[uplatex,12pt]{jsbook}

NeoBundleLazy 'vim-latex/vim-latex'
autocmd FileType tex NeoBundleSource vim-latex

let s:lib_path = has('mac') ? '/Library/TeX/texbin/' : ''
" set grepprg=grep\ -nH\ $*

let g:tex_flavor='latex'
let g:Tex_AutoFolding = 0
" let g:Tex_Folding = 0
let g:Imap_UsePlaceHolders = 1
let g:Imap_DeleteEmptyPlaceHolders = 1
let g:Imap_StickyPlaceHolders = 0
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats='dvi,pdf'
"let g:Tex_FormatDependency_pdf = 'pdf'
let g:Tex_FormatDependency_pdf = 'dvi,pdf'
"let g:Tex_FormatDependency_pdf = 'dvi,ps,pdf'
let g:Tex_FormatDependency_ps = 'dvi,ps'
let g:Tex_CompileRule_ps = s:lib_path . 'dvips -Ppdf -o $*.ps $*.dvi'
let g:Tex_BibtexFlavor = s:lib_path . 'upbibtex'
let g:Tex_MakeIndexFlavor = s:lib_path . 'upmendex $*.idx'
let g:Tex_UseEditorSettingInDVIViewer = 1

if has('mac')
  " For Mac

  let g:Tex_CompileRule_dvi = s:lib_path . 'uplatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'

  let g:Tex_CompileRule_pdf = s:lib_path . 'ptex2pdf -u -l -ot "-synctex=1 -interaction=nonstopmode -file-line-error-style" $*'
  "let g:Tex_CompileRule_pdf = s:lib_path . 'pdflatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
  "let g:Tex_CompileRule_pdf = s:lib_path . 'lualatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
  "let g:Tex_CompileRule_pdf = s:lib_path . 'luajitlatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
  "let g:Tex_CompileRule_pdf = s:lib_path . 'xelatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
  "let g:Tex_CompileRule_pdf = '/usr/local/bin/ps2pdf $*.ps'

  "let g:Tex_ViewRule_pdf = 'Skim'
  "let g:Tex_ViewRule_pdf = '/usr/bin/open -a Skim.app'
  let g:Tex_ViewRule_pdf = '/usr/bin/open -a Preview.app'
  "let g:Tex_ViewRule_pdf = '/usr/bin/open -a TeXShop.app'
  "let g:Tex_ViewRule_pdf = '/Applications/TeXworks.app/Contents/MacOS/TeXworks'
  "let g:Tex_ViewRule_pdf = '/Applications/texstudio.app/Contents/MacOS/texstudio --pdf-viewer-only'
  "let g:Tex_ViewRule_pdf = '/usr/bin/open -a Firefox.app'
  "let g:Tex_ViewRule_pdf = '/usr/bin/open -a "Adobe Reader.app"'
  "let g:Tex_ViewRule_pdf = '/usr/bin/open'
elseif has('win32') || has('win64')
  " For Windows

  let g:Tex_CompileRule_dvi = 'uplatex -kanji=utf8 -no-guess-input-enc -synctex=1 -interaction=nonstopmode -file-line-error-style $*'

  let g:Tex_CompileRule_pdf = 'ptex2pdf -u -l -ot "-kanji=utf8 -no-guess-input-enc -synctex=1 -interaction=nonstopmode -file-line-error-style" $*'
  "let g:Tex_CompileRule_pdf = s:lib_path . 'pdflatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
  "let g:Tex_CompileRule_pdf = s:lib_path . 'lualatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
  "let g:Tex_CompileRule_pdf = s:lib_path . 'luajitlatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
  "let g:Tex_CompileRule_pdf = s:lib_path . 'xelatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
  "let g:Tex_CompileRule_pdf = 'ps2pdf.exe $*.ps'

  let g:Tex_ViewRule_pdf = 'rundll32 shell32,ShellExec_RunDLL SumatraPDF -reuse-instance -inverse-search "\"' . $VIM . '\gvim.exe\" -n -c \":RemoteOpen +\%l \%f\""'
  "let g:Tex_ViewRule_pdf = 'texworks'
  "let g:Tex_ViewRule_pdf = 'rundll32 shell32,ShellExec_RunDLL firefox -new-window'
  "let g:Tex_ViewRule_pdf = 'powershell -Command "& {$p = [System.String]::Concat(''"""'',[System.IO.Path]::GetFullPath($args),''"""'');Start-Process chrome -ArgumentList (''--new-window'',$p)}"'
  "let g:Tex_ViewRule_pdf = 'pdfopen --r15 --file'
endif

" vim-latexがWarning発生時コンパイルを中断してしまうのを防ぐ
let g:Tex_IgnoreLevel = 9
let g:Tex_IgnoredWarnings =
    \"Underfull\n".
    \"Overfull\n".
    \"specifier changed to\n".
    \"You have requested\n".
    \"Missing number, treated as zero.\n".
    \"There were undefined references\n".
    \"Citation %.%# undefined\n".
    \"LaTeX Font Warning: Font shape `%s' undefined\n".
    \"LaTeX Font Warning: Some font shapes were not available, defaults substituted."
