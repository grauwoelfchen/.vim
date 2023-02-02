""" typescript {{{
" }}}

""" plugin {{{
" vim-lsp
if executable('typescript-language-server')
  " npm install -g typescript typescript-language-server
  augroup lsp_setup_typescript
    autocmd!
    autocmd User lsp_setup call lsp#register_server({
    \ 'name': 'typescript-language-server',
    \ 'cmd': {server_info->[
    \    &shell,
    \    &shellcmdflag,
    \    'typescript-language-server --stdio'
    \ ]},
    \ 'root_uri':{ server_info->lsp#utils#path_to_uri(
    \    lsp#utils#find_nearest_parent_file_directory(
    \      lsp#utils#get_buffer_path(),
    \      'tsconfig.json'
    \    )
    \ )},
    \ 'whitelist': ['typescript', 'typescript.tsx'],
    \ })
  augroup END
endif
" ale
let g:ale_linters = {
\ 'typescript': ['tslint']
\}
"""" }}}
