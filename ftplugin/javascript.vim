""" javascript {{{
nnoremap <buffer> <LocalLeader>c I// <Esc>
"""" }}}
""" plugin {{{
"" ale
let g:ale_linters = {
\ 'javascript': ['eslint']
\}
"""" }}}
