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
"" vim-lsp
if executable('pyls')
  augroup lsp_setup_python
    autocmd!
    autocmd User lsp_setup call lsp#register_server({
    \ 'name': 'pyls',
    \ 'cmd': {server_info->['pyls']},
    \ 'whitelist': ['python'],
    \ })
  augroup END
endif
"" ale
let g:ale_linters = {
\ 'python': ['pylint']
\}
" }}}
