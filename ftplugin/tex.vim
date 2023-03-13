""" tex {{{
" }}}

""" plugin {{{
"" ALE
let g:ale_linters_ignore = {
\ 'tex': ['lacheck'],
\ }
"" vim-latex
let g:Tex_CompileRule_dvi = 'latex $*'
let g:Tex_ViewRule_dvi = 'xdvi'
let g:Tex_DefaultTargetFormat = 'pdf'
" }}}
