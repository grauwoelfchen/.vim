""" elm {{{
" }}}

""" plugin {{{
" /path/to/nodenv/shims/elm-language-server
" e.g. /path/to/nodenv/versions/<version>/bin/elm-language-server
if executable('elm-language-server')
  " setup elm-language-server
  augroup lsp_setup_elm
    autocmd!
    autocmd User lsp_setup call lsp#register_server({
    \ 'name': 'elm-language-server',
    \ 'cmd': {server_info->[
    \    &shell,
    \    &shellcmdflag,
    \    'elm-language-server --stdio'
    \ ]},
    \ 'whitelist': ['elm'],
    \ })
  augroup END
endif
" ale
let g:ale_linters = {
\ 'elm': ['elm_ls'],
\ }
let g:ale_elm_ls_use_global = 1
"let g:ale_elm_ls_elm_format_path
"let g:ale_elm_ls_elm_test_path
" }}}
