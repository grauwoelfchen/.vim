""" python {{{
setlocal expandtab
setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal textwidth=80
nnoremap <buffer> <LocalLeader>c I# <Esc>
iabbrev  <buffer> iff if:hli
" }}}
""" plugin {{{
"" pep8
let g:pep8_map = '<F8>'
"" jedi-vim
let g:jedi#usages_command = '<leader>U'
let g:jedi#rename_command = '<leader>R'
let g:jedi#use_tabs_not_buffers = 1
setlocal completeopt-=preview
"" ale
let g:ale_linters = {
\ 'python': ['pylint']
\}
" }}}
